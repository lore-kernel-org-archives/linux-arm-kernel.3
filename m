Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A5DE66886
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 10:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0nMAmEFq3PJbwrOlxPINIFoMpe96BdgiyonJFw6RFVA=; b=ggwf56nAa0wmzKZH7SgMA+1gm8
	04K4ftvH1WFFoPvY0mU6Gfn3O87uAlDJTHiBha7wQQ3P+CJMqpM/MDl2HV5Lijxhsa4QwsJ51prrI
	SFVUfJ0eUgUObK2q6Eme39DEMoA6dP5HqWAZaKbpNF++8ksZIF/wP8GP6lp2PSzWBy0uAH+B3c/mV
	7626ZB6zWPM2GzkNP3vH45ZSY3pEwPKeKvjA/3lQCtauxiR82X8Je0oZvOUaQW+h4FT2k/sKkRaJn
	mA3XDzYCBjHSRPEt0mACkSOrJh/8p2vGCsMUkZat1rmxsKrN2bkrbtB+7KTJ+AnIfIGE41dkGe4i3
	B/+skC0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXGo1-0000000CKDQ-3esI;
	Sun, 21 Dec 2025 10:36:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXGny-0000000CKC5-2mlX;
	Sun, 21 Dec 2025 10:36:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766313407;
	bh=vcptfxca5+TBz8Sygmhs5giULEcEQOzbFELMheyNl/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z1IiserHbDl3xk4O/fEwL0nSsY7kI7eAt1l3TDXi7bu2emKvDXQE+PfUjzDEi7s3q
	 6xDgKaf27vh7p8fO2DHWhmNauHLU83p33Q300Tvq6C0xvGkVpzUSgDGUgu0yyJC7jS
	 Fe76XUGcE/4YISAs5oAWwqpa+hHDNlF3VlX7rEM7iYkoP0JC8cpMRoUsKC7Ix+EHBA
	 YK6atE57NGDQSX3cqBCU5ehQg+ZR0fZuHE+sy3dt/PJLrxHJmJ0UYCbUqQZRFbrnkH
	 3SafHnZ5jph9BOxRCQe88d9NWGBDHbD6O+O4KJA/TZ2Fo0xLYmq7l5B7VIMLcQ2z6m
	 p8nHz4/byih0g==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 030D817E1330;
	Sun, 21 Dec 2025 11:36:46 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sun, 21 Dec 2025 12:36:24 +0200
Subject: [PATCH v2 2/2] phy: rockchip: samsung-hdptx: Cleanup TMDS PLL
 config table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-phy-hdptx-pll-fix-v2-2-ae4abf7f75a1@collabora.com>
References: <20251221-phy-hdptx-pll-fix-v2-0-ae4abf7f75a1@collabora.com>
In-Reply-To: <20251221-phy-hdptx-pll-fix-v2-0-ae4abf7f75a1@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_023650_895516_597DC67B 
X-CRM114-Status: UNSURE (   9.31  )
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

Drop a bunch of unused members from struct ropll_config and make the
static ropll_tmds_cfg table more readable:

* add a table header
* sort rows by rate
* convert hex values to decimal (for consistency)

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 82 +++++++----------------
 1 file changed, 24 insertions(+), 58 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index cafa618d70fd..e3d817e81d6d 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -336,27 +336,13 @@ struct ropll_config {
 	u8 pms_pdiv;
 	u8 pms_refdiv;
 	u8 pms_sdiv;
-	u8 pms_iqdiv_rstn;
-	u8 ref_clk_sel;
 	u8 sdm_en;
-	u8 sdm_rstn;
-	u8 sdc_frac_en;
-	u8 sdc_rstn;
-	u8 sdm_clk_div;
 	u8 sdm_deno;
 	u8 sdm_num_sign;
 	u8 sdm_num;
 	u8 sdc_n;
 	u8 sdc_num;
 	u8 sdc_deno;
-	u8 sdc_ndiv_rstn;
-	u8 ssc_en;
-	u8 ssc_fm_dev;
-	u8 ssc_fm_freq;
-	u8 ssc_clk_div_sel;
-	u8 ana_cpp_ctrl;
-	u8 ana_lpf_c_sel;
-	u8 cd_tx_ser_rate_sel;
 };
 
 struct tx_drv_ctrl {
@@ -412,50 +398,30 @@ struct rk_hdptx_phy {
 };
 
 static const struct ropll_config ropll_tmds_cfg[] = {
-	{ 594000000ULL, 124, 124, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
-	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 461101250ULL, 97, 97, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 71, 1, 53, 2, 6,
-	  35, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 371250000ULL, 155, 155, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
-	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 297000000ULL, 124, 124, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
-	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 162000000ULL, 135, 135, 1, 1, 3, 1, 1, 0, 1, 1, 1, 1, 4, 0, 3, 5, 5, 0x10,
-	  1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 185625000ULL, 155, 155, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
-	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 154000000ULL, 193, 193, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 193, 1, 32, 2, 1,
-	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 148500000ULL, 0x7b, 0x7b, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 4, 0, 3, 5, 5,
-	  0x10, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 146250000ULL, 122, 122, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 244, 1, 16, 2, 1, 1,
-	  1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 119000000ULL, 149, 149, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 149, 1, 16, 2, 1, 1,
-	  1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 106500000ULL, 89, 89, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 89, 1, 16, 1, 0, 1,
-	  1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 108000000ULL, 135, 135, 1, 1, 5, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
-	  0x14, 0x18, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 85500000ULL, 214, 214, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 214, 1, 16, 2, 1,
-	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 83500000ULL, 105, 105, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 42, 1, 16, 1, 0,
-	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 92812500ULL, 155, 155, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
-	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 74250000ULL, 124, 124, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
-	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 65000000ULL, 162, 162, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 54, 0, 16, 4, 1,
-	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 50250000ULL, 84, 84, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 11, 1, 4, 5,
-	  4, 11, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 33750000ULL, 0x70, 0x70, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 0x2, 0, 0x01, 5,
-	  1, 1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 40000000ULL, 100, 100, 1, 1, 11, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
-	  0x14, 0x18, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 27000000ULL, 0x5a, 0x5a, 1, 1, 0xf, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
-	  0x14, 0x18, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 25175000ULL, 84, 84, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 168, 1, 16, 4, 1, 1,
-	  1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
+	/*             |              pms             |        sdm         |     sdc     | */
+	/*        rate, mdiv, mdafc, pdiv, rdiv, sdiv, en, deno, nsig, num,  n, num, deno, */
+	{ 594000000ULL,  124,   124,    1,    1,    0,  1,   62,    1,  16,  5,   0,    1, },
+	{ 461101250ULL,   97,    97,    1,    1,    0,  1,   71,    1,  53,  2,   6,   35, },
+	{ 371250000ULL,  155,   155,    1,    1,    1,  1,   62,    1,  16,  5,   0,    1, },
+	{ 297000000ULL,  124,   124,    1,    1,    1,  1,   62,    1,  16,  5,   0,    1, },
+	{ 185625000ULL,  155,   155,    1,    1,    3,  1,   62,    1,  16,  5,   0,    1, },
+	{ 162000000ULL,  135,   135,    1,    1,    3,  0,    4,    0,   3,  5,   5,   16, },
+	{ 154000000ULL,  193,   193,    1,    1,    5,  1,  193,    1,  32,  2,   1,    1, },
+	{ 148500000ULL,  123,   123,    1,    1,    3,  1,    4,    0,   3,  5,   5,   16, },
+	{ 146250000ULL,  122,   122,    1,    1,    3,  1,  244,    1,  16,  2,   1,    1, },
+	{ 119000000ULL,  149,   149,    1,    1,    5,  1,  149,    1,  16,  2,   1,    1, },
+	{ 108000000ULL,  135,   135,    1,    1,    5,  0,    9,    0,   5,  0,  20,   24, },
+	{ 106500000ULL,   89,    89,    1,    1,    3,  1,   89,    1,  16,  1,   0,    1, },
+	{  92812500ULL,  155,   155,    1,    1,    7,  1,   62,    1,  16,  5,   0,    1, },
+	{  85500000ULL,  214,   214,    1,    1,   11,  1,  214,    1,  16,  2,   1,    1, },
+	{  83500000ULL,  105,   105,    1,    1,    5,  1,   42,    1,  16,  1,   0,    1, },
+	{  74250000ULL,  124,   124,    1,    1,    7,  1,   62,    1,  16,  5,   0,    1, },
+	{  65000000ULL,  162,   162,    1,    1,   11,  1,   54,    0,  16,  4,   1,    1, },
+	{  50250000ULL,   84,    84,    1,    1,    7,  1,   11,    1,   4,  5,   4,   11, },
+	{  40000000ULL,  100,   100,    1,    1,   11,  0,    9,    0,   5,  0,  20,   24, },
+	{  33750000ULL,  112,   112,    1,    1,   15,  1,    2,    0,   1,  5,   1,    1, },
+	{  27000000ULL,   90,    90,    1,    1,   15,  0,    9,    0,   5,  0,  20,   24, },
+	{  25175000ULL,   84,    84,    1,    1,   15,  1,  168,    1,  16,  4,   1,    1, },
 };
 
 static const struct reg_sequence rk_hdtpx_common_cmn_init_seq[] = {

-- 
2.51.2


