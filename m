Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79BDC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 11:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5nC8fNTQCWkXFeoR6loC4G/2e3m3vvYNRdrbuNmWRVk=; b=ClsgA3x+4y1+ew6Np6fH4xMNaK
	+XwvxEEPj8NN1rr320O3cToPc8EX/GNXvGPYuVYLgUqfTfuueYkeV5pGBwYTtJaxHJpWsFmfcuF3k
	LVemUo5RHY0qI7yB/TykHGc1/VWkKc13SHKqsvu0EhjcDZvgLlDjEkYsn1L2eh066CPXS/h/9VWSQ
	sYnQswC9PSkJ50NMKasOE/57CZPehLCOxkf6u1TeqXevm4Jt64eiHp9LlF7uyst0a+IJ5+tkRDBIw
	ASIjJwoecPCMT/baasuredWLcrYL9kLxNvJJchq7S5eW4CJVJNVo/S9IXAy8GkDLq+JjCpNQnD1n0
	pMgz2o7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm9rx-0000000AwC0-3ew4;
	Sun, 23 Feb 2025 11:09:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tm9kk-0000000Aupx-1nMH;
	Sun, 23 Feb 2025 11:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740308549;
	bh=XP3rwzkTa1mXnGdnUHFUWqLPHJxazgMc4cL1Dqwrxk8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dSfwBE8gRMyKyiTvnE+U9pT26OuqKF6ct5ERrWfIZIXSEHtZXLFWB8C+J4NYrApdI
	 5vEcMIrxGyVkIE6Pf1aGJ5svcLAqHwkndamru3xOQooolXdADaMmZIKc+jw6pd47n9
	 eXOh4qU4Uy5HfrNp5hwJJpy4YFLz2yhkUzLRaBvZBXgeQIpTEXK+YqKGGpn8JXY3t2
	 Vu3YUwScqES/tnD6MOggcFCmPtDw0ziV0+gjEmOTHkSBrK3JSqHTswmAsDCL5Jgz2W
	 JuVq7yVA4/5ik7Djn5+ZYkeJ5UcwjpdnzT+Jy2UVWiD2ktkhv5AHijHIEAXhFE2Xix
	 aiq3GLNCEJMlg==
Received: from localhost (unknown [188.27.58.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id F3DDF17E0DD5;
	Sun, 23 Feb 2025 12:02:28 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sun, 23 Feb 2025 13:02:11 +0200
Subject: [PATCH v3 4/8] phy: rockchip: samsung-hdptx: Drop unused
 lcpll_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-phy-sam-hdptx-bpc-v3-4-66a5c8e68327@collabora.com>
References: <20250223-phy-sam-hdptx-bpc-v3-0-66a5c8e68327@collabora.com>
In-Reply-To: <20250223-phy-sam-hdptx-bpc-v3-0-66a5c8e68327@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_030230_614324_8519748D 
X-CRM114-Status: UNSURE (   6.05  )
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

This is just a leftover from downstream support for HDMI 2.1.
Remove the unused struct for now.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 31 -----------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index cf2c3a46604cb9d8c26fe5ec8346904e0b62848f..f9b5c96d6c789e435657e224032d35b5a6950945 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -329,37 +329,6 @@ enum dp_link_rate {
 	DP_BW_HBR2,
 };
 
-struct lcpll_config {
-	u32 bit_rate;
-	u8 lcvco_mode_en;
-	u8 pi_en;
-	u8 clk_en_100m;
-	u8 pms_mdiv;
-	u8 pms_mdiv_afc;
-	u8 pms_pdiv;
-	u8 pms_refdiv;
-	u8 pms_sdiv;
-	u8 pi_cdiv_rstn;
-	u8 pi_cdiv_sel;
-	u8 sdm_en;
-	u8 sdm_rstn;
-	u8 sdc_frac_en;
-	u8 sdc_rstn;
-	u8 sdm_deno;
-	u8 sdm_num_sign;
-	u8 sdm_num;
-	u8 sdc_n;
-	u8 sdc_n2;
-	u8 sdc_num;
-	u8 sdc_deno;
-	u8 sdc_ndiv_rstn;
-	u8 ssc_en;
-	u8 ssc_fm_dev;
-	u8 ssc_fm_freq;
-	u8 ssc_clk_div_sel;
-	u8 cd_tx_ser_rate_sel;
-};
-
 struct ropll_config {
 	u32 bit_rate;
 	u8 pms_mdiv;

-- 
2.48.1


