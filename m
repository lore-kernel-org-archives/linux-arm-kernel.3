Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA16C5DF8B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 14:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjaxkW/OOljfbKs/Hgq4W4DJoOyPrHgU6kH9d26E7Bc=; b=ByMNf+3ij4qm0Iwjo8Pj/dz3Rf
	GxSdwZytxldWIQXo//CzoOfg4tPxkZFW9hPKY1fsIl5ckA+GH/FKc8gRXk+49nOCy9oIj815oQZLE
	9W0LR1aEa6ypX7pUkoWHw6mIRD784D0vCbDEmdIDlkB5FHxzpxnLFzWY69sB1J8xmDDGVeMTDJYQB
	m3Etbc3kKXn7Hw8Re3hg6uJP+NXjv7t2Q40tHHZuJoVgXK+42G9gXWg+8XBxZKBzmtK4I+eMf/IPk
	OcdlqQsqm0fzDafyKqV6GRoLR391MfugxvxTX2nZbbbdofq4zf7Fky2/tvekIhA3nD5FpdDPjym/N
	0sz3QjbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3Kz-0000000BeeO-0wqu;
	Thu, 20 Aug 2026 14:01:45 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3Ki-0000000BeQR-1yS9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 14:01:29 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-495437bb891so7961945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 07:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787234487; x=1787839287; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jjaxkW/OOljfbKs/Hgq4W4DJoOyPrHgU6kH9d26E7Bc=;
        b=bWfBgdJ+kX+GuCWRk8Jm+6A7/z3IX+XUuRE5/agRK68yFfpkoq0dY5TQXg3mN5ZCAQ
         WTFBGALjl7wxCU8w5LEYJ5Beys2l0WyTWNIg+wzOY13MTklf2bB0UjnDR2qGxnVo6PyT
         pc0MiwohElJ5uof2VsnoojZxurYa0QyjT1S8FGFLE0auGPgFpMGLWQqWfYu7BfVsGwEk
         oHuz1B5fkMhhWBcXifYQnVqYWNjrQq18t5bl5BZdnzfYLGgEdDaKynTv97x6UkmGPqrT
         fbUAqHTdRB44UK+UHx4h4tgo136o6IkWgw7SxZO0zQVpohVoP1nwQPlkyEBPoyCLcnS6
         jAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787234487; x=1787839287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jjaxkW/OOljfbKs/Hgq4W4DJoOyPrHgU6kH9d26E7Bc=;
        b=BPcYkYjT442KNTdUZGBN09q7EIz+os0FUcP/RXIBcwWjlZ5SseEOBW44MNZ0w2n+kK
         B2F7/zsAauxBFhF7ak1GnDKk+R7b0v4nz6w6W61FzUALsnz0j5xPNXug6Z0POOImNCjd
         WGW7HiBgd6PXaulHAHV3FGvyx6oSeZHgpzDRuceHfTqPCvow3+7htcUq6zN5DlrYNlEb
         z+Vw6k5RpbCTeN0pvRVAkGsoE5x/UekQS6u9Jc7fBq8FcPXiXrY/abT7CYWxfCs4BEaa
         JV3lx/mC3MDpkUt1miXo7+oPr4pi7pM6Eqh8JEOdxX7Va2Wcp6VhyZ0B8QEjeWrFtFuJ
         E7Yg==
X-Forwarded-Encrypted: i=1; AHgh+RoSkTUtQQ7stWz7emPXZG6Py4gj1ZIIUdbAY/fzKbABeoGpjho+OWpudamZFROayv6yDuR70RObHa2Jp170GusL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz35+cMb0LJNe2Fat035ub/atzaoZIIec7DlXgSn1ULvg9QlKov
	7u6LCsbg8QlvxABGSjw787iygHCcfQEf0/XgMFx5yXc4bYSrmPRYINDf
X-Gm-Gg: AR+sD13PN4x8OKo3wjITd06Gq2qk1Ep4706sUebd2A1OZLHs93iuJoHhu2uKksMZ8Z1
	RF962Yeh0a+isXJK1z8p9PV+7uiZoh+vJosYxbjAaIK2nSsHJEY6n8fO1tmrBQ2ahL2ofzBssQs
	yScQjP71cOW/eTZILf8+tokBIxdZ0MRJ2O8UMquONOrWkqLhBbxc73Pv4vTlynY3T+lsiCjZHac
	Up8irJQHiphqOEv/HqseDc2v1MNoCS2IEe69FxzzNviY2hTUNMiol6D4/w9/v4YmnaHrqXXKPau
	ZwoXi5M0hX9NxBUtuRftyzVsSOu1GAC3mKuXDaP5hYN24V6swyxL45nPzXXXxcmBFp6ZADLfs+7
	nzqC32QgNIluCZfVzU6D8LuktT9SBRnGohUl15Ooc35JkWUn+QPYO/4vBq5EMK9TCrp38MmdhM5
	uyF/9z77feouLcIGE9RKduMvVRF8gmYBiLh5cDqJilwD30zeXp4i+izq2DzI9AhHHyeggbH3cUb
	YDH2BC0X/6+0cqoTnJ1A1mjEMCQrfNYhO5B5OpX1yKxrsVeW87P4BvpnA==
X-Received: by 2002:a05:600c:810a:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-499b06a5900mr69779915e9.1.1787234484906;
        Thu, 20 Aug 2026 07:01:24 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0e473dsm137978275e9.15.2026.08.20.07.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:01:24 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Thu, 20 Aug 2026 16:01:10 +0200
Subject: [PATCH 3/4] phy: rockchip: phy-rockchip-inno-csidphy: add support
 for rk3576 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-rk3576-dphy-v1-3-70e25e8d5e78@gmail.com>
References: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
In-Reply-To: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787234481; l=2615;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=+wQnLUS1bzjWsYlZ2cICJ1ntSL4y9AaqokE1Tn/QJfw=;
 b=XRv4bYGUPy5NgXnknSaQfkAZF50U/hL3221UfrFWTjnlCf2d2GcHd/mP7Ahg+k/FZpJiTdbn1
 BCk8pOhvhK4CWsuTIuMT1WMnZ+fZOwGi0nmY4Yq5JBX+pTCoh8PJt+o
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_070128_572699_FB088406 
X-CRM114-Status: GOOD (  12.98  )
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

The two RK3576 MIPI CSI-2 DPHYs can be supported using the existing
phy-rockchip-inno-csidphy driver, the notable difference with the
RK3588 variant being that each PHY instance only has an APB reset
line.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
index c79fb53d8ee5..24aefdcd6361 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
@@ -30,6 +30,7 @@
 #define RK3568_GRF_VI_CON0		0x0340
 #define RK3568_GRF_VI_CON1		0x0344
 
+#define RK3576_CSIDPHY_GRF_CON0		0x0000
 #define RK3588_CSIDPHY_GRF_CON0		0x0000
 
 /* PHY */
@@ -119,6 +120,12 @@ static const struct dphy_reg rk3568_grf_dphy_regs[] = {
 	[GRF_DPHY_CSIPHY_CLKLANE_EN] = PHY_REG(RK3568_GRF_VI_CON0, 1, 8),
 };
 
+static const struct dphy_reg rk3576_grf_dphy_regs[] = {
+	[GRF_DPHY_CSIPHY_FORCERXMODE] = PHY_REG(RK3576_CSIDPHY_GRF_CON0, 4, 0),
+	[GRF_DPHY_CSIPHY_DATALANE_EN] = PHY_REG(RK3576_CSIDPHY_GRF_CON0, 4, 4),
+	[GRF_DPHY_CSIPHY_CLKLANE_EN] = PHY_REG(RK3576_CSIDPHY_GRF_CON0, 1, 8),
+};
+
 static const struct dphy_reg rk3588_grf_dphy_regs[] = {
 	[GRF_DPHY_CSIPHY_FORCERXMODE] = PHY_REG(RK3588_CSIDPHY_GRF_CON0, 4, 0),
 	[GRF_DPHY_CSIPHY_DATALANE_EN] = PHY_REG(RK3588_CSIDPHY_GRF_CON0, 4, 4),
@@ -403,6 +410,17 @@ static const struct dphy_drv_data rk3568_mipidphy_drv_data = {
 	.resets_num = ARRAY_SIZE(rk3368_reset_names),
 };
 
+static const struct dphy_drv_data rk3576_mipidphy_drv_data = {
+	.pwrctl_offset = -1,
+	.ths_settle_offset = RK3568_CSIDPHY_CLK_WR_THS_SETTLE,
+	.calib_offset = RK3568_CSIDPHY_CLK_CALIB_EN,
+	.hsfreq_ranges = rk1808_mipidphy_hsfreq_ranges,
+	.num_hsfreq_ranges = ARRAY_SIZE(rk1808_mipidphy_hsfreq_ranges),
+	.grf_regs = rk3576_grf_dphy_regs,
+	.resets = rk3368_reset_names,
+	.resets_num = ARRAY_SIZE(rk3368_reset_names),
+};
+
 static const struct dphy_drv_data rk3588_mipidphy_drv_data = {
 	.pwrctl_offset = -1,
 	.ths_settle_offset = RK3568_CSIDPHY_CLK_WR_THS_SETTLE,
@@ -435,6 +453,10 @@ static const struct of_device_id rockchip_inno_csidphy_match_id[] = {
 		.compatible = "rockchip,rk3568-csi-dphy",
 		.data = &rk3568_mipidphy_drv_data,
 	},
+	{
+		.compatible = "rockchip,rk3576-csi-dphy",
+		.data = &rk3576_mipidphy_drv_data,
+	},
 	{
 		.compatible = "rockchip,rk3588-csi-dphy",
 		.data = &rk3588_mipidphy_drv_data,

-- 
2.43.0


