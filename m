Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D084CA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KDdjvcTpRsLD90jC1uVj/aDQQjGujDFuQojU2aIvCEc=; b=iTGvf8Yn/70S9f/0r/+Oco121M
	7iWEtcWpeiwkcVs0GQnsaBnOBJ4GJEpJ7WwDGh4Pdjbx6AElIQGmSpC+kDMcW+SPMrc0sYRq/X/Xa
	cFGa8XT7lXlVniZ+ywScLJEJP9AhyPGLGkzU4tVV/1Wjlns7wmir4YT2gcWD2IF6ltxLDf+ZXVFzn
	biLnQ6gTfNaRo2XlwS68QwM6wUjw5I7ufaHMAtxStgJN60Q5kskHMweYPm43N40Kw2k/HlenH+WLG
	asbEDCro/o/phqZVFdZwQqVfOwp5P11ze9DdAVEcIeIfTHYkfq5F54I2ttLTV8beVlQLCq5O9Gixk
	FlstelwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBseM-00000005tm4-1vT2;
	Wed, 30 Sep 2026 11:39:02 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBseJ-00000005tkw-0foP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 11:39:00 +0000
X-UUID: 839f7742bcc311f19a56ed5b684f684d-20260930
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:280b0e8d-6cfc-47f6-afc8-4b5b180206af,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:c46ceab0234235c5706ee733755f32d0,BulkI
	D:nil,BulkQuantity:0,SF:102|123|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 839f7742bcc311f19a56ed5b684f684d-20260930
X-User: fengchenguang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fengchenguang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 126679322; Wed, 30 Sep 2026 19:38:53 +0800
From: fengchenguang@kylinos.cn
To: s.nawrocki@samsung.com,
	mchehab@kernel.org
Cc: krzk@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chenguang Feng <fengchenguang@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH] media: exynos4-is: Fix runtime PM usage counter leak in fimc-isp
Date: Wed, 30 Sep 2026 19:38:49 +0800
Message-Id: <20260930113849.278562-1-fengchenguang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_043859_512634_DE22389B 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

From: Chenguang Feng <fengchenguang@kylinos.cn>

fimc_isp_subdev_s_power() increments the usage counter with
pm_runtime_resume_and_get() and releases it if fimc_is_start_firmware()
fails, but not when fimc_is_hw_initialize() fails further down: the
function then returns with the counter still held, and the device can
never runtime-suspend afterwards.

Call pm_runtime_put() on the fimc_is_hw_initialize() error path as
well, like the fimc_is_start_firmware() path already does.

Fixes: 9a761e436843f ("[media] exynos4-is: Add Exynos4x12 FIMC-IS driver")
Cc: stable@vger.kernel.org
Signed-off-by: Chenguang Feng <fengchenguang@kylinos.cn>
---
 drivers/media/platform/samsung/exynos4-is/fimc-isp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-isp.c b/drivers/media/platform/samsung/exynos4-is/fimc-isp.c
index 896a1b0952ad..8d4efb552424 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-isp.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-isp.c
@@ -322,6 +322,11 @@ static int fimc_isp_subdev_s_power(struct v4l2_subdev *sd, int on)
 		set_bit(IS_ST_PWR_SUBIP_ON, &is->state);
 
 		ret = fimc_is_hw_initialize(is);
+		if (ret < 0) {
+			v4l2_err(sd, "hardware initialization failed\n");
+			pm_runtime_put(&is->pdev->dev);
+			return ret;
+		}
 	} else {
 		/* Close sensor */
 		if (!test_bit(IS_ST_PWR_ON, &is->state)) {
-- 
2.25.1


