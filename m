Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD58109B497
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 18:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ic0VQVlvqzP9swiyCE/ktySpg8l+fHo2UEcEXx1Lee0=; b=txHaqKmlZxdV3uCzCsFcQPpd2O
	was4rQY9lQSf5jB9YiuHOXtSbDKtnBhvOYXzwyEGMqQ4ofTypF2SKhIYiIpWqMkYPE9eH0GLZjxOs
	xEKcq/OHKkqhOjKJ7glqM5E78x71CLj4/X1ApWcjDMLLvTR98cipPAqxiFvaR6SJLvT2PJ4eH0v2d
	hgPJMpXT8yvZ+q124ezogA4S+FWLGZ9kZOdROTHOsE4RRJh33zgdkYB0u2B7qTcJf6zu+y7AFLJtW
	8VQ9m8NHp4L4FlZQ2ziYErAYmt5QZFEHU+lVxDblHVMB/AGGk1qv57o6EVEU6M88rMJhK4a9VZzLQ
	PppeeneA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zxP-0000000Fuxp-33NZ;
	Wed, 01 Apr 2026 18:06:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zxM-0000000Fusv-46Q8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 18:06:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1BF216F2;
	Wed,  1 Apr 2026 11:06:13 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 991533F7D8;
	Wed,  1 Apr 2026 11:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775066779; bh=vXcQLnQkNZP4PC6Csc+eanODUb4h5iGqZFtFktzvnZc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CUCRyvxLVc55klpx3Lpp14KxfcbD3PdlUGngP/6+g5oinIdBdQsKmFnPwAoqh3T8c
	 iDrlfYZKdNewvyV8+ehz9BdrvwqbCdGQswakqxBX4PIwFmj/jQ4vhxVVQZAG2cpT4/
	 ST6DwtEFo0+djPw0ZM7FckB4m73yPd9/JF8jKw10=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 01 Apr 2026 19:05:44 +0100
Subject: [PATCH v9 15/20] coresight: Control path during CPU idle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-arm_coresight_path_power_management_improvement-v9-15-091d73e44072@arm.com>
References: <20260401-arm_coresight_path_power_management_improvement-v9-0-091d73e44072@arm.com>
In-Reply-To: <20260401-arm_coresight_path_power_management_improvement-v9-0-091d73e44072@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775066742; l=1985;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=vXcQLnQkNZP4PC6Csc+eanODUb4h5iGqZFtFktzvnZc=;
 b=RvaamOgZMihFWyGsKKFO3K5hnnu0rd0bjUAiAFE/D+ITfeM2Fgghi7xDvtugxp4BcuPS93qiF
 oseOVZ5Ki9KAAK2PZwfj0N3FHPPzZne8/HgreDQ5V/8FtipDw+Syh3o
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_110621_156850_FB8FD532 
X-CRM114-Status: GOOD (  13.08  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Control links and helpers on an active path during CPU idle.

Retrieves the per-CPU path pointer.  Since the path pointer is only set
via an SMP call on the local CPU, which is serialized with CPU PM
notifiers.  If the CPU PM notifier retrieves a non-NULL path pointer, it
is safe to iterate over the path and control it up to the node before
the sink to avoid latency.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index c0f76ea7857e2bf368f9e5abbb023d7a34b4caf5..7fafec04de3e8262b7ca66671c6de635b671ceba 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1768,13 +1768,32 @@ static void coresight_pm_device_restore(struct coresight_device *csdev)
 static int coresight_pm_save(struct coresight_path *path)
 {
 	struct coresight_device *source = coresight_get_source(path);
+	struct coresight_node *from, *to;
+	int ret;
+
+	ret = coresight_pm_device_save(source);
+	if (ret)
+		return ret;
 
-	return coresight_pm_device_save(source);
+	from = coresight_path_first_node(path);
+	/* Up to the node before sink to avoid latency */
+	to = list_prev_entry(coresight_path_last_node(path), link);
+	coresight_disable_path_from_to(path, from, to);
+
+	return 0;
 }
 
 static void coresight_pm_restore(struct coresight_path *path)
 {
 	struct coresight_device *source = coresight_get_source(path);
+	struct coresight_node *from, *to;
+
+	from = coresight_path_first_node(path);
+	/* Up to the node before sink to avoid latency */
+	to = list_prev_entry(coresight_path_last_node(path), link);
+	if (coresight_enable_path_from_to(path, coresight_get_mode(source),
+					  from, to))
+		return;
 
 	coresight_pm_device_restore(source);
 }

-- 
2.34.1


