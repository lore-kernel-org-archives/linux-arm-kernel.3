Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A54107639C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 18:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LpqYUO5uweST3HxSJjqY7GBbvfxXifbRa9JfDhfkjKs=; b=oCgJXSNHuIAtMdPwjUCyz4mgsv
	aBJ/jj2DFYOkxT8cW7UxRWGd3YJ7YdoDlM8D1Kv7fRuviK45Z6K1AFYz5D5jWSq+9kKruMC6kNhnQ
	gCQduPE5C4JO1OcF4liFSkrhFm3VV2XNX3V68a172hifhChZ4hC+r0v8NJ4SzgecbIFmNOxpjw3yW
	REPmfr/TTIEfHwzdDSfnESFcPTheg50Q8B2eIEjGbUTE6ZQ9O2PoHQEx+NCsUHnUzxIOGE76dRPmS
	/MGWRhOq7jzfBTcCGLg2bSGzSnThc8Mn1HOZY2+xQYfmVRY9YSsGCaiCtkVsoRj6yKKBzfLEVPD5+
	zfxjWpqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zxM-0000000FusC-1lGS;
	Wed, 01 Apr 2026 18:06:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zxH-0000000FumW-275s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 18:06:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 257C016F2;
	Wed,  1 Apr 2026 11:06:09 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00DBE3F7D8;
	Wed,  1 Apr 2026 11:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775066775; bh=aUYRgXh1hpphKIvpqjVrk51mpP3niG7gJMulpj/jSFM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dYkxWk+aWnIrwOtNM6emcLrooHrahBzaSwgYZ29JtMuaNThk9Duv/ue2BzlykmWqH
	 EBwUhNjKkTVUtL+6v1RKpcT1FP7jt3qk/c6TTteciHfHp1aQ57p71KlD0iw1v7kCcq
	 CrKL67DdeD7KatVnbANczCQIbMsJUk9UvzmEzDAY=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 01 Apr 2026 19:05:42 +0100
Subject: [PATCH v9 13/20] coresight: Use helpers to fetch first and last
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-arm_coresight_path_power_management_improvement-v9-13-091d73e44072@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775066742; l=1735;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=aUYRgXh1hpphKIvpqjVrk51mpP3niG7gJMulpj/jSFM=;
 b=d0T6UfJ628ereE3vQn0UawQSh1ostoBap2FhVMFK/erLncObozEzx5hORvJs48NK/6XpHbsWd
 cFlsAQOH3M0AbDbJp9tcZHJuusZFd4N+zAZDI/QlWR4h1Ur6DH5TUd4
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_110615_621721_DA7E3BF3 
X-CRM114-Status: GOOD (  11.36  )
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

Replace open code with coresight_path_first_node() and
coresight_path_last_node() for fetching the nodes.

Check that the node is not NULL before accessing csdev field.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 739b863d40ced2f939b2063cc4e2aa1c52564c1d..ae0ab074293a8ec473de2e6e3282f62268de38aa 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -106,11 +106,16 @@ EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
 static struct coresight_device *coresight_get_source(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
+	struct coresight_node *nd;
 
 	if (!path)
 		return NULL;
 
-	csdev = list_first_entry(&path->path_list, struct coresight_node, link)->csdev;
+	nd = coresight_path_first_node(path);
+	if (!nd)
+		return NULL;
+
+	csdev = nd->csdev;
 	if (!coresight_is_device_source(csdev))
 		return NULL;
 
@@ -644,11 +649,16 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 struct coresight_device *coresight_get_sink(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
+	struct coresight_node *nd;
 
 	if (!path)
 		return NULL;
 
-	csdev = list_last_entry(&path->path_list, struct coresight_node, link)->csdev;
+	nd = coresight_path_last_node(path);
+	if (!nd)
+		return NULL;
+
+	csdev = nd->csdev;
 	if (csdev->type != CORESIGHT_DEV_TYPE_SINK &&
 	    csdev->type != CORESIGHT_DEV_TYPE_LINKSINK)
 		return NULL;

-- 
2.34.1


