Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD28107639C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 18:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIKn/qxpa2kBRaMIzQfgGC6Q173z7ubyVqoyhdyfdnE=; b=1KwYg0Bxw3qy/mf/osOigXNP/f
	PBn5azvHLRd4kUwlmzjuygBdxUaYHJkE6wL4vIBIeKHi1w0hk6exQBGuCucOegRwpJwoyzw54TdnQ
	d141IxOE9fdtRI8Q96rXtxCrzr8Ntowteu7bSMmKCLNGp1O3AQkcRf/vTIY4p9h2Aa5fN5jQh33sj
	cfDDcC+CGjOvGxktjk73dcILDpDBmLgmb0FzBQTJQgdZhRBFogAIauA1f0+RzxeqXv55cZUvbJszB
	0U8ZLnFM6pt8g/tTBtoL62iHx2ee7UwessRPf+vxadT5Igwtspa0K4tFfSe5JCZZ9Z+LL4fhi9Koh
	aTfqdOnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zx0-0000000FuWO-2TmG;
	Wed, 01 Apr 2026 18:05:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zwu-0000000FuUE-2rg4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 18:05:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QIKn/qxpa2kBRaMIzQfgGC6Q173z7ubyVqoyhdyfdnE=; b=XRMwC591Il0fORY75qMoLjkNhU
	W0dK89igtDxzbu0JoHLr8SYcTdNcvl1xTz8Vw/a5Pu1LxXQ/vN1efktlkYHJGARYowK2XHxNvYzdP
	Mxkuda+HPW9GMwb8ywRXPTF0zsoLhFVPtmE8+u8tK86qPoVHyxAS6QrUBQfZg7u27Ey1q6uernIks
	/C+T8jQmF77D/YdcBMoB/Z+Dn03AealdYGx4Wm2TgR7+xmLfCVN5WnXik2fA1+GHopDG+wujfJn8M
	oueKAp9TQtYsrVHON46HoY0CmQrhxhuOvT6VwH7LMzeMqnZiTguZ40TQjGNoTkBo37WdbEbC6tWS3
	BB7UrpFg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zwr-000000014Uf-1Pdf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 18:05:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 576922E99;
	Wed,  1 Apr 2026 11:05:41 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3272A3F7D8;
	Wed,  1 Apr 2026 11:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775066747; bh=PHXl7su6X052DFybleevzG2ayTPFHyleM6g+bYReCvQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ww+nLi3/mEODdNPevLwaWe10tw8n/G/Xh8n9+8H1nb3OCWuqNJiqHny7vuv11jG5H
	 nhqvEo6YaMI6XKbIirmwdh5VvHu/dWwjycPs4iBCWno/xkpljMT3rCgssNquyuBMGV
	 lWDaGUVooXGZ44DRnRna3Wnw6MkaoxHUldsVj8us=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 01 Apr 2026 19:05:30 +0100
Subject: [PATCH v9 01/20] coresight: Extract device init into
 coresight_init_device()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-arm_coresight_path_power_management_improvement-v9-1-091d73e44072@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775066742; l=1923;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=PHXl7su6X052DFybleevzG2ayTPFHyleM6g+bYReCvQ=;
 b=84lybZsj0ER0y847PC2sWg8pRn7cPO4gspQw03bBMg91Me1ipY0MmIaxv3dH/BUE5dVcofoE+
 nIqwLD8Lm3jDSOHRID9GHByk0EiI3KkiTq8fRHGbJhsEoAJyxuK68jQ
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_190549_921590_866B57F9 
X-CRM114-Status: GOOD (  12.59  )
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

This commit extracts the allocation and initialization of the coresight
device structure into a separate function to make future extensions
easier.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 46f247f73cf64a97b9353b84ba5b76b991676f5f..5452de9367d450de399a2107016c3fddb894fc82 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1322,20 +1322,16 @@ void coresight_release_platform_data(struct device *dev,
 	devm_kfree(dev, pdata);
 }
 
-struct coresight_device *coresight_register(struct coresight_desc *desc)
+static struct coresight_device *
+coresight_init_device(struct coresight_desc *desc)
 {
-	int ret;
 	struct coresight_device *csdev;
-	bool registered = false;
 
 	csdev = kzalloc_obj(*csdev);
-	if (!csdev) {
-		ret = -ENOMEM;
-		goto err_out;
-	}
+	if (!csdev)
+		return ERR_PTR(-ENOMEM);
 
 	csdev->pdata = desc->pdata;
-
 	csdev->type = desc->type;
 	csdev->subtype = desc->subtype;
 	csdev->ops = desc->ops;
@@ -1348,6 +1344,21 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	csdev->dev.release = coresight_device_release;
 	csdev->dev.bus = &coresight_bustype;
 
+	return csdev;
+}
+
+struct coresight_device *coresight_register(struct coresight_desc *desc)
+{
+	int ret;
+	struct coresight_device *csdev;
+	bool registered = false;
+
+	csdev = coresight_init_device(desc);
+	if (IS_ERR(csdev)) {
+		ret = PTR_ERR(csdev);
+		goto err_out;
+	}
+
 	if (csdev->type == CORESIGHT_DEV_TYPE_SINK ||
 	    csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
 		raw_spin_lock_init(&csdev->perf_sink_id_map.lock);

-- 
2.34.1


