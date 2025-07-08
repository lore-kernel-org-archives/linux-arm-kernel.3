Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D2DC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 21:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Y2riSSDq7VlOlhn5VXb0brVi7DerYF9UeM2xVNWTqA=; b=wKhMX0YAalalziZTH+t+1V2bL5
	KJ7UfNOyGdcV1QNzv9DNoEttlv9pJADNzmegcagmOV1sfmLiyTiXbCJ+l0jDPd+wUKU2bkQfHeZAK
	RlTrcIrIbmnGeUsmQgx25Zs8Evv1qxeXyJO1LG7IIRFwonGVRSxliJ3UVWEzx+W9mjnWF3oJHLKuL
	MutMcfviXWeTQ0eyJzz2FKzZx1L7v7cpy0lwaeCbyUnDGp/2DF+mjOwKTA+d3WkcNYQa6ymm6NLRN
	bN9GCVAEgtu8hYcWKStUHBgRvtvjXFs73thYU6FLg2pGyCJbpxMuf3H9Usl/A7d9G4igqK3j0JVA/
	jxGq68uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZFaV-00000006c2t-2gCz;
	Tue, 08 Jul 2025 21:10:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZE8M-00000006MHS-19dA;
	Tue, 08 Jul 2025 19:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752003461;
	bh=85cNEu/vegIXt56X/JafGM7fT9pq4nywtSuoCIiShYc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R5wYKHHpVryN5MGBkA15iDZ38H1j4ZlGmDf/hiyyb7bvbF+wn9jDJ+jdfcaGaivCf
	 zdhN8dnc/DvDRSDAbcp70evjnQGuM4hplTU9cz2ulhi+ooGvvzSwhwRyzPwDdUtAwn
	 Efi3OsQmIDyXSgrgJSbvLDArlyQS6OZA5sgd1SBYzRABJIII/1qsxYk5D6m1OeyhSz
	 yKr3qqLvZZh76MBG+4CTn1pFLN4MRZ+E7T6vb309mNE77rQiY5XwFjAsASaAm40H6b
	 8/Qhz3Tlzg3OA2bY1lk87+os5Zu4E2iEq/QfIQECsAMqcCQY8y9/K4dGNRYm4zUZCO
	 OS/geCExtwOww==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id C7D0C17E04AA;
	Tue,  8 Jul 2025 21:37:40 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 08 Jul 2025 22:35:53 +0300
Subject: [PATCH 12/12] phy: rockchip: samsung-hdptx: Add HDMI 2.1 FRL
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-phy-hdptx-frl-v1-12-cfe096e224f4@collabora.com>
References: <20250708-phy-hdptx-frl-v1-0-cfe096e224f4@collabora.com>
In-Reply-To: <20250708-phy-hdptx-frl-v1-0-cfe096e224f4@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_123742_615538_D9D0564D 
X-CRM114-Status: GOOD (  17.49  )
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

The PHY is capable of handling four HDMI 2.1 Fixed Rate Link (FRL)
lanes, and each one can operate at any of the rates of 3Gbps, 6Gbps,
8Gbps, 10Gbps or 12Gbps.

Co-developed-by: Algea Cao <algea.cao@rock-chips.com>
Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 410 +++++++++++++++++++++-
 1 file changed, 393 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index daccaf134c0ee36972f8f7c0eebf3dac86faeff1..0e75bac7358960dd8bb5203df445b5ea5284079f 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -22,6 +22,7 @@
 #include <linux/reset.h>
 
 #define GRF_HDPTX_CON0			0x00
+#define LC_REF_CLK_SEL			BIT(11)
 #define HDPTX_I_PLL_EN			BIT(7)
 #define HDPTX_I_BIAS_EN			BIT(6)
 #define HDPTX_I_BGR_EN			BIT(5)
@@ -322,6 +323,9 @@
 
 #define HDMI14_MAX_RATE			340000000
 #define HDMI20_MAX_RATE			600000000
+#define FRL_8G4L_RATE			3200000000
+#define FRL_6G3L_RATE			1800000000
+#define FRL_3G3L_RATE			900000000
 
 enum dp_link_rate {
 	DP_BW_RBR,
@@ -329,6 +333,37 @@ enum dp_link_rate {
 	DP_BW_HBR2,
 };
 
+struct lcpll_config {
+	unsigned long long rate;
+	u8 lcvco_mode_en;
+	u8 pi_en;
+	u8 clk_en_100m;
+	u8 pms_mdiv;
+	u8 pms_mdiv_afc;
+	u8 pms_pdiv;
+	u8 pms_refdiv;
+	u8 pms_sdiv;
+	u8 pi_cdiv_rstn;
+	u8 pi_cdiv_sel;
+	u8 sdm_en;
+	u8 sdm_rstn;
+	u8 sdc_frac_en;
+	u8 sdc_rstn;
+	u8 sdm_deno;
+	u8 sdm_num_sign;
+	u8 sdm_num;
+	u8 sdc_n;
+	u8 sdc_n2;
+	u8 sdc_num;
+	u8 sdc_deno;
+	u8 sdc_ndiv_rstn;
+	u8 ssc_en;
+	u8 ssc_fm_dev;
+	u8 ssc_fm_freq;
+	u8 ssc_clk_div_sel;
+	u8 cd_tx_ser_rate_sel;
+};
+
 struct ropll_config {
 	unsigned long long rate;
 	u8 pms_mdiv;
@@ -416,6 +451,19 @@ struct rk_hdptx_phy {
 	unsigned int lanes;
 };
 
+static const struct lcpll_config rk_hdptx_frl_lcpll_cfg[] = {
+	{ 4800000000ULL, 1, 0, 0, 0x7d, 0x7d, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 2,
+	  0, 0x13, 0x18, 1, 0, 0x20, 0x0c, 1, 0, },
+	{ 4000000000ULL, 1, 1, 0, 0x68, 0x68, 1, 1, 0, 0, 0, 1, 1, 1, 1, 9, 0, 1, 1,
+	  0, 2, 3, 1, 0, 0x20, 0x0c, 1, 0, },
+	{ 2400000000ULL, 1, 0, 0, 0x7d, 0x7d, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 2,
+	  0, 0x13, 0x18, 1, 0, 0x20, 0x0c, 1, 0, },
+	{ 1800000000ULL, 1, 0, 0, 0x7d, 0x7d, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 2,
+	  0, 0x13, 0x18, 1, 0, 0x20, 0x0c, 1, 0, },
+	{ 900000000ULL, 1, 0, 0, 0x7d, 0x7d, 1, 1, 3, 0, 0, 0, 0, 1, 1, 1, 0, 0, 2,
+	  0, 0x13, 0x18, 1, 0, 0x20, 0x0c, 1, 0, },
+};
+
 static const struct ropll_config rk_hdptx_tmds_ropll_cfg[] = {
 	{ 594000000ULL, 124, 124, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
 	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
@@ -533,6 +581,110 @@ static const struct reg_sequence rk_hdptx_common_cmn_init_seq[] = {
 	REG_SEQ0(CMN_REG(009a), 0x11),
 };
 
+static const struct reg_sequence rk_hdptx_frl_lcpll_cmn_init_seq[] = {
+	REG_SEQ0(CMN_REG(0011), 0x00),
+	REG_SEQ0(CMN_REG(0017), 0x00),
+	REG_SEQ0(CMN_REG(0025), 0x10),
+	REG_SEQ0(CMN_REG(0026), 0x53),
+	REG_SEQ0(CMN_REG(0027), 0x01),
+	REG_SEQ0(CMN_REG(0028), 0x0d),
+	REG_SEQ0(CMN_REG(002e), 0x02),
+	REG_SEQ0(CMN_REG(002f), 0x0d),
+	REG_SEQ0(CMN_REG(0030), 0x00),
+	REG_SEQ0(CMN_REG(0031), 0x20),
+	REG_SEQ0(CMN_REG(0032), 0x30),
+	REG_SEQ0(CMN_REG(0033), 0x0b),
+	REG_SEQ0(CMN_REG(0034), 0x23),
+	REG_SEQ0(CMN_REG(003d), 0x00),
+	REG_SEQ0(CMN_REG(0042), 0xb8),
+	REG_SEQ0(CMN_REG(0046), 0xff),
+	REG_SEQ0(CMN_REG(0048), 0x44),
+	REG_SEQ0(CMN_REG(004e), 0x14),
+	REG_SEQ0(CMN_REG(0051), 0x00),
+	REG_SEQ0(CMN_REG(0055), 0x00),
+	REG_SEQ0(CMN_REG(0059), 0x11),
+	REG_SEQ0(CMN_REG(005a), 0x03),
+	REG_SEQ0(CMN_REG(005c), 0x05),
+	REG_SEQ0(CMN_REG(005d), 0x0c),
+	REG_SEQ0(CMN_REG(005e), 0x07),
+	REG_SEQ0(CMN_REG(0060), 0x01),
+	REG_SEQ0(CMN_REG(0064), 0x07),
+	REG_SEQ0(CMN_REG(0065), 0x00),
+	REG_SEQ0(CMN_REG(0069), 0x00),
+	REG_SEQ0(CMN_REG(006b), 0x04),
+	REG_SEQ0(CMN_REG(006c), 0x00),
+	REG_SEQ0(CMN_REG(0070), 0x01),
+	REG_SEQ0(CMN_REG(0073), 0x30),
+	REG_SEQ0(CMN_REG(0074), 0x00),
+	REG_SEQ0(CMN_REG(0081), 0x09),
+	REG_SEQ0(CMN_REG(0086), 0x01),
+	REG_SEQ0(CMN_REG(0087), 0x0c),
+	REG_SEQ0(CMN_REG(0089), 0x02),
+	REG_SEQ0(CMN_REG(0095), 0x00),
+	REG_SEQ0(CMN_REG(0097), 0x00),
+	REG_SEQ0(CMN_REG(0099), 0x00),
+	REG_SEQ0(CMN_REG(009b), 0x10),
+};
+
+static const struct reg_sequence rk_hdptx_frl_lcpll_ropll_cmn_init_seq[] = {
+	REG_SEQ0(CMN_REG(0008), 0xd0),
+	REG_SEQ0(CMN_REG(0011), 0x00),
+	REG_SEQ0(CMN_REG(0017), 0x00),
+	REG_SEQ0(CMN_REG(001e), 0x35),
+	REG_SEQ0(CMN_REG(0020), 0x6b),
+	REG_SEQ0(CMN_REG(0021), 0x6b),
+	REG_SEQ0(CMN_REG(0022), 0x11),
+	REG_SEQ0(CMN_REG(0024), 0x00),
+	REG_SEQ0(CMN_REG(0025), 0x10),
+	REG_SEQ0(CMN_REG(0026), 0x53),
+	REG_SEQ0(CMN_REG(0027), 0x15),
+	REG_SEQ0(CMN_REG(0028), 0x0d),
+	REG_SEQ0(CMN_REG(002a), 0x09),
+	REG_SEQ0(CMN_REG(002b), 0x01),
+	REG_SEQ0(CMN_REG(002c), 0x02),
+	REG_SEQ0(CMN_REG(002d), 0x02),
+	REG_SEQ0(CMN_REG(002e), 0x0d),
+	REG_SEQ0(CMN_REG(002f), 0x61),
+	REG_SEQ0(CMN_REG(0030), 0x00),
+	REG_SEQ0(CMN_REG(0031), 0x20),
+	REG_SEQ0(CMN_REG(0032), 0x30),
+	REG_SEQ0(CMN_REG(0033), 0x0b),
+	REG_SEQ0(CMN_REG(0034), 0x23),
+	REG_SEQ0(CMN_REG(0037), 0x00),
+	REG_SEQ0(CMN_REG(003d), 0xc0),
+	REG_SEQ0(CMN_REG(0042), 0xb8),
+	REG_SEQ0(CMN_REG(0046), 0xff),
+	REG_SEQ0(CMN_REG(0048), 0x44),
+	REG_SEQ0(CMN_REG(004e), 0x14),
+	REG_SEQ0(CMN_REG(0054), 0x19),
+	REG_SEQ0(CMN_REG(0058), 0x19),
+	REG_SEQ0(CMN_REG(0059), 0x11),
+	REG_SEQ0(CMN_REG(005b), 0x30),
+	REG_SEQ0(CMN_REG(005c), 0x25),
+	REG_SEQ0(CMN_REG(005d), 0x14),
+	REG_SEQ0(CMN_REG(005e), 0x0e),
+	REG_SEQ0(CMN_REG(0063), 0x01),
+	REG_SEQ0(CMN_REG(0064), 0x0e),
+	REG_SEQ0(CMN_REG(0068), 0x00),
+	REG_SEQ0(CMN_REG(0069), 0x02),
+	REG_SEQ0(CMN_REG(006b), 0x00),
+	REG_SEQ0(CMN_REG(006f), 0x00),
+	REG_SEQ0(CMN_REG(0073), 0x02),
+	REG_SEQ0(CMN_REG(0074), 0x00),
+	REG_SEQ0(CMN_REG(007a), 0x00),
+	REG_SEQ0(CMN_REG(0081), 0x09),
+	REG_SEQ0(CMN_REG(0086), 0x11),
+	REG_SEQ0(CMN_REG(0087), 0x0c),
+	REG_SEQ0(CMN_REG(0089), 0x00),
+	REG_SEQ0(CMN_REG(0095), 0x03),
+	REG_SEQ0(CMN_REG(0097), 0x00),
+	REG_SEQ0(CMN_REG(0099), 0x00),
+	REG_SEQ0(CMN_REG(009b), 0x10),
+	REG_SEQ0(CMN_REG(009e), 0x03),
+	REG_SEQ0(CMN_REG(009f), 0xff),
+	REG_SEQ0(CMN_REG(00a0), 0x60),
+};
+
 static const struct reg_sequence rk_hdptx_tmds_cmn_init_seq[] = {
 	REG_SEQ0(CMN_REG(0008), 0x00),
 	REG_SEQ0(CMN_REG(0011), 0x01),
@@ -586,6 +738,16 @@ static const struct reg_sequence rk_hdptx_common_sb_init_seq[] = {
 	REG_SEQ0(SB_REG(0117), 0x00),
 };
 
+static const struct reg_sequence rk_hdptx_frl_lntop_init_seq[] = {
+	REG_SEQ0(LNTOP_REG(0200), 0x04),
+	REG_SEQ0(LNTOP_REG(0201), 0x00),
+	REG_SEQ0(LNTOP_REG(0202), 0x00),
+	REG_SEQ0(LNTOP_REG(0203), 0xf0),
+	REG_SEQ0(LNTOP_REG(0204), 0xff),
+	REG_SEQ0(LNTOP_REG(0205), 0xff),
+	REG_SEQ0(LNTOP_REG(0206), 0x05),
+};
+
 static const struct reg_sequence rk_hdptx_tmds_lntop_highbr_seq[] = {
 	REG_SEQ0(LNTOP_REG(0201), 0x00),
 	REG_SEQ0(LNTOP_REG(0202), 0x00),
@@ -657,6 +819,38 @@ static const struct reg_sequence rk_hdptx_common_lane_init_seq[] = {
 	REG_SEQ0(LANE_REG(0620), 0xa0),
 };
 
+static const struct reg_sequence rk_hdptx_frl_lane_init_seq[] = {
+	REG_SEQ0(LANE_REG(0312), 0x3c),
+	REG_SEQ0(LANE_REG(0412), 0x3c),
+	REG_SEQ0(LANE_REG(0512), 0x3c),
+	REG_SEQ0(LANE_REG(0612), 0x3c),
+	REG_SEQ0(LANE_REG(0303), 0x2f),
+	REG_SEQ0(LANE_REG(0403), 0x2f),
+	REG_SEQ0(LANE_REG(0503), 0x2f),
+	REG_SEQ0(LANE_REG(0603), 0x2f),
+	REG_SEQ0(LANE_REG(0305), 0x03),
+	REG_SEQ0(LANE_REG(0405), 0x03),
+	REG_SEQ0(LANE_REG(0505), 0x03),
+	REG_SEQ0(LANE_REG(0605), 0x03),
+	REG_SEQ0(LANE_REG(0306), 0xfc),
+	REG_SEQ0(LANE_REG(0406), 0xfc),
+	REG_SEQ0(LANE_REG(0506), 0xfc),
+	REG_SEQ0(LANE_REG(0606), 0xfc),
+	REG_SEQ0(LANE_REG(0305), 0x4f),
+	REG_SEQ0(LANE_REG(0405), 0x4f),
+	REG_SEQ0(LANE_REG(0505), 0x4f),
+	REG_SEQ0(LANE_REG(0605), 0x4f),
+	REG_SEQ0(LANE_REG(0304), 0x14),
+	REG_SEQ0(LANE_REG(0404), 0x14),
+	REG_SEQ0(LANE_REG(0504), 0x14),
+	REG_SEQ0(LANE_REG(0604), 0x14),
+	/* Keep Inter-Pair Skew in the limits */
+	REG_SEQ0(LANE_REG(031e), 0x02),
+	REG_SEQ0(LANE_REG(041e), 0x02),
+	REG_SEQ0(LANE_REG(051e), 0x02),
+	REG_SEQ0(LANE_REG(061e), 0x02),
+};
+
 static const struct reg_sequence rk_hdptx_tmds_lane_init_seq[] = {
 	REG_SEQ0(LANE_REG(0312), 0x00),
 	REG_SEQ0(LANE_REG(0412), 0x00),
@@ -821,7 +1015,12 @@ static int rk_hdptx_post_enable_lane(struct rk_hdptx_phy *hdptx)
 	       HDPTX_I_BIAS_EN | HDPTX_I_BGR_EN;
 	regmap_write(hdptx->grf, GRF_HDPTX_CON0, val);
 
-	regmap_write(hdptx->regmap, LNTOP_REG(0207), 0x0f);
+	/* 3 lanes FRL mode */
+	if (hdptx->hdmi_cfg.rate == FRL_6G3L_RATE ||
+	    hdptx->hdmi_cfg.rate == FRL_3G3L_RATE)
+		regmap_write(hdptx->regmap, LNTOP_REG(0207), 0x07);
+	else
+		regmap_write(hdptx->regmap, LNTOP_REG(0207), 0x0f);
 
 	ret = regmap_read_poll_timeout(hdptx->grf, GRF_HDPTX_STATUS, val,
 				       (val & HDPTX_O_PHY_RDY) &&
@@ -965,6 +1164,80 @@ static bool rk_hdptx_phy_clk_pll_calc(unsigned long long rate,
 	return true;
 }
 
+static int rk_hdptx_frl_lcpll_cmn_config(struct rk_hdptx_phy *hdptx)
+{
+	const struct lcpll_config *cfg = NULL;
+	int i;
+
+	dev_dbg(hdptx->dev, "%s rate=%llu\n", __func__, hdptx->hdmi_cfg.rate);
+
+	for (i = 0; i < ARRAY_SIZE(rk_hdptx_frl_lcpll_cfg); i++) {
+		if (hdptx->hdmi_cfg.rate == rk_hdptx_frl_lcpll_cfg[i].rate) {
+			cfg = &rk_hdptx_frl_lcpll_cfg[i];
+			break;
+		}
+	}
+
+	if (!cfg) {
+		dev_err(hdptx->dev, "%s cannot find pll cfg for rate=%llu\n",
+			__func__, hdptx->hdmi_cfg.rate);
+		return -EINVAL;
+	}
+
+	rk_hdptx_pre_power_up(hdptx);
+
+	regmap_write(hdptx->grf, GRF_HDPTX_CON0, LC_REF_CLK_SEL << 16);
+
+	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_common_cmn_init_seq);
+	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_frl_lcpll_cmn_init_seq);
+
+	regmap_update_bits(hdptx->regmap, CMN_REG(0008),
+			   LCPLL_EN_MASK | LCPLL_LCVCO_MODE_EN_MASK,
+			   FIELD_PREP(LCPLL_EN_MASK, 1) |
+			   FIELD_PREP(LCPLL_LCVCO_MODE_EN_MASK, cfg->lcvco_mode_en));
+
+	regmap_update_bits(hdptx->regmap, CMN_REG(001e),
+			   LCPLL_PI_EN_MASK | LCPLL_100M_CLK_EN_MASK,
+			   FIELD_PREP(LCPLL_PI_EN_MASK, cfg->pi_en) |
+			   FIELD_PREP(LCPLL_100M_CLK_EN_MASK, cfg->clk_en_100m));
+
+	regmap_write(hdptx->regmap, CMN_REG(0020), cfg->pms_mdiv);
+	regmap_write(hdptx->regmap, CMN_REG(0021), cfg->pms_mdiv_afc);
+	regmap_write(hdptx->regmap, CMN_REG(0022),
+		     (cfg->pms_pdiv << 4) | cfg->pms_refdiv);
+	regmap_write(hdptx->regmap, CMN_REG(0023),
+		     (cfg->pms_sdiv << 4) | cfg->pms_sdiv);
+	regmap_write(hdptx->regmap, CMN_REG(002a), cfg->sdm_deno);
+	regmap_write(hdptx->regmap, CMN_REG(002b), cfg->sdm_num_sign);
+	regmap_write(hdptx->regmap, CMN_REG(002c), cfg->sdm_num);
+
+	regmap_update_bits(hdptx->regmap, CMN_REG(002d), LCPLL_SDC_N_MASK,
+			   FIELD_PREP(LCPLL_SDC_N_MASK, cfg->sdc_n));
+
+	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_POSTDIV_SEL_MASK,
+			   FIELD_PREP(PLL_PCG_POSTDIV_SEL_MASK, cfg->pms_sdiv));
+	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_CLK_SEL_MASK,
+			   FIELD_PREP(PLL_PCG_CLK_SEL_MASK, (hdptx->hdmi_cfg.bpc - 8) >> 1));
+
+	return rk_hdptx_post_enable_pll(hdptx);
+}
+
+static int rk_hdptx_frl_lcpll_ropll_cmn_config(struct rk_hdptx_phy *hdptx)
+{
+	dev_dbg(hdptx->dev, "%s rate=%llu\n", __func__, hdptx->hdmi_cfg.rate);
+
+	rk_hdptx_pre_power_up(hdptx);
+
+	/* ROPLL input reference clock from LCPLL (cascade mode) */
+	regmap_write(hdptx->grf, GRF_HDPTX_CON0,
+		     (LC_REF_CLK_SEL << 16) | LC_REF_CLK_SEL);
+
+	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_common_cmn_init_seq);
+	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_frl_lcpll_ropll_cmn_init_seq);
+
+	return rk_hdptx_post_enable_pll(hdptx);
+}
+
 static int rk_hdptx_tmds_ropll_cmn_config(struct rk_hdptx_phy *hdptx)
 {
 	const struct ropll_config *cfg = NULL;
@@ -996,6 +1269,8 @@ static int rk_hdptx_tmds_ropll_cmn_config(struct rk_hdptx_phy *hdptx)
 
 	rk_hdptx_pre_power_up(hdptx);
 
+	regmap_write(hdptx->grf, GRF_HDPTX_CON0, LC_REF_CLK_SEL << 16);
+
 	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_common_cmn_init_seq);
 	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_tmds_cmn_init_seq);
 
@@ -1038,6 +1313,28 @@ static int rk_hdptx_tmds_ropll_cmn_config(struct rk_hdptx_phy *hdptx)
 	return ret;
 }
 
+static int rk_hdptx_pll_cmn_config(struct rk_hdptx_phy *hdptx)
+{
+	if (hdptx->hdmi_cfg.rate <= HDMI20_MAX_RATE)
+		return rk_hdptx_tmds_ropll_cmn_config(hdptx);
+
+	if (hdptx->hdmi_cfg.rate == FRL_8G4L_RATE)
+		return rk_hdptx_frl_lcpll_ropll_cmn_config(hdptx);
+
+	return rk_hdptx_frl_lcpll_cmn_config(hdptx);
+}
+
+static int rk_hdptx_frl_lcpll_mode_config(struct rk_hdptx_phy *hdptx)
+{
+	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_common_sb_init_seq);
+	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_frl_lntop_init_seq);
+
+	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_common_lane_init_seq);
+	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_frl_lane_init_seq);
+
+	return rk_hdptx_post_enable_lane(hdptx);
+}
+
 static int rk_hdptx_tmds_ropll_mode_config(struct rk_hdptx_phy *hdptx)
 {
 	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_common_sb_init_seq);
@@ -1114,7 +1411,7 @@ static int rk_hdptx_phy_consumer_get(struct rk_hdptx_phy *hdptx)
 	if (mode == PHY_MODE_DP) {
 		rk_hdptx_dp_reset(hdptx);
 	} else {
-		ret = rk_hdptx_tmds_ropll_cmn_config(hdptx);
+		ret = rk_hdptx_pll_cmn_config(hdptx);
 		if (ret)
 			goto dec_usage;
 	}
@@ -1414,7 +1711,7 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 	enum phy_mode mode = phy_get_mode(phy);
 	int ret, lane;
 
-	if (mode != PHY_MODE_DP) {
+	if (mode != PHY_MODE_DP && mode != PHY_MODE_HDMI_FRL) {
 		if (!hdptx->hdmi_cfg.rate) {
 			/*
 			 * FIXME: Temporary workaround to setup TMDS char rate
@@ -1461,7 +1758,11 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 		regmap_write(hdptx->grf, GRF_HDPTX_CON0,
 			     HDPTX_MODE_SEL << 16 | FIELD_PREP(HDPTX_MODE_SEL, 0x0));
 
-		ret = rk_hdptx_tmds_ropll_mode_config(hdptx);
+		if (mode == PHY_MODE_HDMI_FRL)
+			ret = rk_hdptx_frl_lcpll_mode_config(hdptx);
+		else
+			ret = rk_hdptx_tmds_ropll_mode_config(hdptx);
+
 		if (ret)
 			rk_hdptx_phy_consumer_put(hdptx, true);
 	}
@@ -1482,16 +1783,49 @@ static int rk_hdptx_phy_verify_hdmi_config(struct rk_hdptx_phy *hdptx,
 {
 	int i;
 
-	if (!hdmi_in->tmds_char_rate || hdmi_in->tmds_char_rate > HDMI20_MAX_RATE)
-		return -EINVAL;
+	if (phy_get_mode(hdptx->phy) == PHY_MODE_HDMI_FRL) {
+		unsigned long long frl_rate = 100000000ULL * hdmi_in->frl.lanes *
+					      hdmi_in->frl.rate_per_lane;
 
-	for (i = 0; i < ARRAY_SIZE(rk_hdptx_tmds_ropll_cfg); i++)
-		if (hdmi_in->tmds_char_rate == rk_hdptx_tmds_ropll_cfg[i].rate)
+		switch (hdmi_in->frl.rate_per_lane) {
+		case 3:
+		case 6:
+		case 8:
+		case 10:
+		case 12:
 			break;
+		default:
+			return -EINVAL;
+		}
 
-	if (i == ARRAY_SIZE(rk_hdptx_tmds_ropll_cfg) &&
-	    !rk_hdptx_phy_clk_pll_calc(hdmi_in->tmds_char_rate, NULL))
-		return -EINVAL;
+		if (!hdmi_in->frl.lanes || hdmi_in->frl.lanes > 4)
+			return -EINVAL;
+
+		if (frl_rate != FRL_8G4L_RATE) {
+			for (i = 0; i < ARRAY_SIZE(rk_hdptx_frl_lcpll_cfg); i++)
+				if (frl_rate == rk_hdptx_frl_lcpll_cfg[i].rate)
+					break;
+			if (i == ARRAY_SIZE(rk_hdptx_frl_lcpll_cfg))
+				return -EINVAL;
+		}
+
+		if (hdmi_out)
+			hdmi_out->rate = frl_rate;
+	} else {
+		if (!hdmi_in->tmds_char_rate || hdmi_in->tmds_char_rate > HDMI20_MAX_RATE)
+			return -EINVAL;
+
+		for (i = 0; i < ARRAY_SIZE(rk_hdptx_tmds_ropll_cfg); i++)
+			if (hdmi_in->tmds_char_rate == rk_hdptx_tmds_ropll_cfg[i].rate)
+				break;
+
+		if (i == ARRAY_SIZE(rk_hdptx_tmds_ropll_cfg) &&
+		    !rk_hdptx_phy_clk_pll_calc(hdmi_in->tmds_char_rate, NULL))
+			return -EINVAL;
+
+		if (hdmi_out)
+			hdmi_out->rate = hdmi_in->tmds_char_rate;
+	}
 
 	switch (hdmi_in->bpc) {
 	case 0:
@@ -1504,10 +1838,8 @@ static int rk_hdptx_phy_verify_hdmi_config(struct rk_hdptx_phy *hdptx,
 		return -EINVAL;
 	}
 
-	if (hdmi_out) {
-		hdmi_out->rate = hdmi_in->tmds_char_rate;
+	if (hdmi_out)
 		hdmi_out->bpc = hdmi_in->bpc ?: 8;
-	}
 
 	return 0;
 }
@@ -1862,17 +2194,61 @@ static void rk_hdptx_phy_clk_unprepare(struct clk_hw *hw)
 
 static unsigned long rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
 {
+	struct lcpll_config lcpll_hw;
 	struct ropll_config ropll_hw;
 	u64 fout, sdm;
 	u32 mode, val;
-	int ret;
+	int ret, i;
 
 	ret = regmap_read(hdptx->regmap, CMN_REG(0008), &mode);
 	if (ret)
 		return 0;
 
-	if (mode & LCPLL_LCVCO_MODE_EN_MASK)
+	if (mode & LCPLL_LCVCO_MODE_EN_MASK) {
+		ret = regmap_read(hdptx->regmap, CMN_REG(0020), &val);
+		if (ret)
+			return 0;
+		lcpll_hw.pms_mdiv = val;
+
+		ret = regmap_read(hdptx->regmap, CMN_REG(0023), &val);
+			return 0;
+		lcpll_hw.pms_sdiv = val & 0xf;
+
+		ret = regmap_read(hdptx->regmap, CMN_REG(002B), &val);
+		if (ret)
+			return 0;
+		lcpll_hw.sdm_num_sign = val;
+
+		ret = regmap_read(hdptx->regmap, CMN_REG(002C), &val);
+		if (ret)
+			return 0;
+		lcpll_hw.sdm_num = val;
+
+		ret = regmap_read(hdptx->regmap, CMN_REG(002A), &val);
+		if (ret)
+			return 0;
+		lcpll_hw.sdm_deno = val;
+
+		ret = regmap_read(hdptx->regmap, CMN_REG(002D), &val);
+		if (ret)
+			return 0;
+		lcpll_hw.sdc_n = (val & LCPLL_SDC_N_MASK) >> 1;
+
+		for (i = 0; i < ARRAY_SIZE(rk_hdptx_frl_lcpll_cfg); i++) {
+			const struct lcpll_config *cfg = &rk_hdptx_frl_lcpll_cfg[i];
+
+			if (cfg->pms_mdiv == lcpll_hw.pms_mdiv &&
+			    cfg->pms_sdiv == lcpll_hw.pms_sdiv &&
+			    cfg->sdm_num_sign == lcpll_hw.sdm_num_sign &&
+			    cfg->sdm_num == lcpll_hw.sdm_num &&
+			    cfg->sdm_deno == lcpll_hw.sdm_deno &&
+			    cfg->sdc_n == lcpll_hw.sdc_n)
+				return cfg->rate;
+		}
+
+		dev_dbg(hdptx->dev, "%s no FRL match found\n", __func__);
 		return 0;
+	}
 
 	ret = regmap_read(hdptx->regmap, CMN_REG(0051), &val);
 	if (ret)
@@ -2002,7 +2378,7 @@ static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	 * while the latter being executed only once, i.e. when clock remains
 	 * in the prepared state during rate changes.
 	 */
-	return rk_hdptx_tmds_ropll_cmn_config(hdptx);
+	return rk_hdptx_pll_cmn_config(hdptx);
 }
 
 static const struct clk_ops hdptx_phy_clk_ops = {

-- 
2.50.0


