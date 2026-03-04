Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E14EF8FEA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 14:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2qgonF5w2c8p56bKXYWtL97G1fsfaN/h16mnAE/Q9wM=; b=pfcNdfq8YJ3EaON+jYxEATsUOA
	Zp2PnkCNpm9UPxQDl2jWlxksVECfOvN49Q3lawN29D78MeGxl8kcu0f1aHo8FovboKvoCM7yY7mBu
	TBDR3B+j6jc3RYyvGNpzPL7Tzxgq96IOplcxIhyWpGjfF8rkKh6QeC727lr3xXxrU96bXId4gE5M8
	JrtRl7gBAhruE7Zc/Am5Skl4Bl+uofIJjxL9AKXAxfUOBhTrqRv+cBoZzJG1MQG0s/BqujWZuCaj2
	lezWtlo24/kj2gT2XpTc5dKisK1b7yQlvDnvCCv/OkYKZuslZPsecR8Z2LLIWFpM1AjHwGZkHVRyW
	AaNmGGtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmqU-0000000HIot-0mDz;
	Wed, 04 Mar 2026 14:05:02 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmqP-0000000HImL-3OFT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 14:05:00 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=2qgonF5w2c8p56bKXYWtL97G1fsfaN/h16mnAE/Q9wM=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772633079;
 b=Eu+ESW6pr9R8SrvOr+L93Zh/Jx4p1pJJPKZKy6885zaqv+70+Iyk15CaZlMCuC5erHOXMYUE
 8B8R864S9wdF9hTat4hd2buETDfRBZ3getsAIOcRpI5XRexVvhN53fDBK3WKREiorgdlyM1rsg7
 VG86b/aBZcqGCF3hFEOSMAYtXWWffqn9e5pwfyJDbFVuKB0jVXcaBpc3UMNyy+jR83xENfmcwXJ
 1MQviXTNwae0RxTACOEj4xpntFFMTzSdMSdKFOdqP4Ojd+EIlFM/S1pQa0zhowJmCTTVmNSz/MN
 67JQQzrOmccK61Dm/+MihttsfMjsXz8AWRGII/HBd3I4A==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772633079;
 b=RBSjkmAhOZ+c4X9tsn2A62UWnPP6L+SjS+DeLQKtZdfe1hp/TwRRPxpAN360qU+naXleSGnn
 oTPwDL95Le1+H1JxxUQu7OGPQJ9DaaccR4r7DK+ekglKM7SiulS/G1TACTZ11JipRk3uB+FGtHg
 cU/UQHULmFLErS0Ielu+zCeSFv05IfroB+H004zYv3p+VvK9RCV8f3W5YFHr8xn37lz9Jz3sgCO
 g0jhIzZ3wG7I2EWHZRo57gO6oMfen1xde0/6/PUJ7IleGTR2AvivpRpoCQXUwb4i7TfiY2r15Um
 JlAy+YbRYokTVCgmLfoE/rvienbjF9S7K94UpBJqoNYAw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Wed, 04 Mar 2026 15:04:39 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6AF095A0A7A;
	Wed,  4 Mar 2026 15:04:28 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Liu Ying <victor.liu@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v3 1/1] drm: lcdif: Use dev_err_probe()
Date: Wed,  4 Mar 2026 15:04:25 +0100
Message-ID: <20260304140426.1499446-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4fQvYT2nvYz3ynSL
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: fbf676b47f4878b0afe26766cd0a8878
X-cloud-security: scantime:1.444
DKIM-Signature: a=rsa-sha256;
 bh=2qgonF5w2c8p56bKXYWtL97G1fsfaN/h16mnAE/Q9wM=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772633079; v=1;
 b=hk6yQ6eE2l4FUZlxK/LWWU4nlYaaGcSQzGGlufMqi+vPPrNJ5nC+Jft9kSt4dsOSqgO37JnF
 bsg8WJ6tQF09wSFyV0U4boV9+HwBd0EhYw5jRn2xVnsl8sH5kcYTV7BRhWWDSN6zEK+i4DE9561
 ZiAr/YF2hSYnLC6yPxlBkprYW7YPDLxybJAN6bbmA9Nx6txhkV0dtiJ07Bz+eNBvTCd37xCkuSD
 ap2wbyu+aV6n4zb7qYzwzCrxGCMjfT/t0ByKPmDiLpAS77CWwy80zmZVhx4XJSpfMyhsRb91YhF
 2qRhnYNo4kupaVLumSA37HfqkgwARO2R8xkvGrfhNcnEA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_060457_990322_95A9C7DF 
X-CRM114-Status: GOOD (  11.53  )
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

Use dev_err_probe() to add a reason for deferred probe. This can
especially happen on lcdif3 which uses hdmi_tx_phy for 'pix' clock

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* Collected Frank's R-b

 drivers/gpu/drm/mxsfb/lcdif_drv.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index fcb2a7517377e..47da1d9336b90 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -149,15 +149,17 @@ static int lcdif_load(struct drm_device *drm)
 
 	lcdif->clk = devm_clk_get(drm->dev, "pix");
 	if (IS_ERR(lcdif->clk))
-		return PTR_ERR(lcdif->clk);
+		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk), "Failed to get pix clock\n");
 
 	lcdif->clk_axi = devm_clk_get(drm->dev, "axi");
 	if (IS_ERR(lcdif->clk_axi))
-		return PTR_ERR(lcdif->clk_axi);
+		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_axi),
+				     "Failed to get axi clock\n");
 
 	lcdif->clk_disp_axi = devm_clk_get(drm->dev, "disp_axi");
 	if (IS_ERR(lcdif->clk_disp_axi))
-		return PTR_ERR(lcdif->clk_disp_axi);
+		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_disp_axi),
+				     "Failed to get disp_axi clock\n");
 
 	platform_set_drvdata(pdev, drm);
 
-- 
2.43.0


