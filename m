Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185ECCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 09:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vy47wkPi9vz9nd/Ubb0WzYYj5086de9de6TtEsO3Zns=; b=A8DDD0lBB3zvLQs3cpSyPTpLvY
	rrgmCYgYrMicKpOJKerQ8a/MSVvAa+sdktOkqU4Nu695M6y0zsFGlF181UYs4gWpmH/0ksw2C3X1/
	ltX9OVk7hKkDg5WQCf/4BlIeUlkZt/IRaq2VJ3W1nAmP4kUgXm1GzONfy1BZYezbdv9i+QMAu5zs0
	9SjR5PzqvKLJehQjfSE2AbTcAMB/Sgc1uXyoGKMH3bjRKEDtrHlQTb29sHw6mMqLqZapKNDCshHm3
	HdL2Zqbf9H5sscN5EGbFz+myz0J4ZAWneuTV/YULdBkSjxLmRkmn/wYwBNwbRiz4VnMerxDegqQcw
	XhCl2gFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmfq-0000000Ch0R-47pg;
	Mon, 20 Oct 2025 09:59:30 +0000
Received: from mx-relay90-hz2.antispameurope.com ([94.100.136.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmfm-0000000CgxE-1Kp3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 09:59:29 +0000
ARC-Authentication-Results: i=1; mx-gate90-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Vy47wkPi9vz9nd/Ubb0WzYYj5086de9de6TtEsO3Zns=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1760954343;
 b=jt2nOzNX+Nj8pwsjptNOWubj30WoRe39PdNCsMV2w5W2Hdhlvkn054SK9VuphQPZ19lL1lBP
 8QokD92tvdi8L8r8dhF+JHh4B+M0xaeop//QRWfvO8A8mVQjUXMjVMmvPItgf+sOiL49dJJvko0
 MQbV6to0JM4b8GKyaBPC/EQ+JOR1M9jltS33p4nR2bAtqD+0vpQ3YlyQDHYhwykfAhnvu4yBiyg
 RU20awGnKoZFGjHwWek26YFMyjLEZ8oPS+7xMm6V1ZGj/0UfoAub02LuGeIJma4Nh2b9gNpHC77
 hakkBfr2aaOX3pJ1joR2RpG88EKBxkxT0YkcHFBLJXwPA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1760954343;
 b=CzZ1EQzHn4IKaJ8e3gq0RpXcg9RsdPntW1RmZDOhuCmIdprppQftJkSTMtg9fpeBGs6D4iKM
 pNd33LBsldkNbKngBG6Y4OiVfoc9HaQ/GomOp8PHIbSxQxplEVPa7fCt1vW9iYN0NO1EzUUazB5
 oSplWzcfYWIZmfR7VqhoGoh1Dx3/uNh7FTor4MXm5YndJuiW/iEVIWsL+hm8gypzqX1uAkGibup
 pqjQTZvCf1CpMrLlkHC7k8qFkTZ9GTLv9s5KlsH29FubZQ73nYbuGWwLR92+r6/ptXsV0PF4Lfc
 BjLGCO2GbkjGGCR4MlsJx6/uLzR/8kp66f7hGLNOBJZ4w==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay90-hz2.antispameurope.com;
 Mon, 20 Oct 2025 11:59:03 +0200
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 88256CC0DD7;
	Mon, 20 Oct 2025 11:58:49 +0200 (CEST)
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
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Liu Ying <victor.liu@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v2 1/1] drm: lcdif: Use dev_err_probe()
Date: Mon, 20 Oct 2025 11:58:45 +0200
Message-ID: <20251020095846.116202-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay90-hz2.antispameurope.com with 4cqrVL377fzX01q
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 303711fa30182f3b5e5363e87477579b
X-cloud-security: scantime:1.797
DKIM-Signature: a=rsa-sha256;
 bh=Vy47wkPi9vz9nd/Ubb0WzYYj5086de9de6TtEsO3Zns=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1760954342; v=1;
 b=btt+zyO4bRcB7jvSnq/oSUpme/85wg7EghIHQldrkf3wK1leh2hkB68Owe8vBknmo589Q9Zz
 NXNJlhx+u6nvNJkDjwYi8kVVZwPEZvY8b853RwO/Q/eNCFRvTaOV2Y8XRZHNJ2QpXRt+v3ptN+m
 qpBHxQr3eddcqnqckMA7knKj6OxTwJ5Qcgt5ip2IjyjxqfAq+Ub+dbDsne7/KDruWwrGOhNwF39
 mdiXBb0zgLCGvsWsqlR+t4hKcbp4pdVrRBC1DgY+PujmArv0RTjQf0bPPEvQ8lpSRjjPJm3f0jr
 rT9ush7wiyjA7HNwnvj2zb1UHukwoCJaTxQPzA/LgeoSg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_025926_720535_5F77642A 
X-CRM114-Status: GOOD (  11.15  )
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
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Collected Liu's and Marcos' R-b

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


