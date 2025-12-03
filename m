Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6402DD1CDAF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 23:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ts8o4Y64V5Ewy9XkCAfuRKI/YImnz6YWOK6I4KOouPc=; b=zAvXKQdAfyc5lJNdoyqOwQVUqs
	z+whe6kVnwgWcLaW0nBNPUTdI7r1ECEKvQQyzdu7CedNWLJdG7ebQhZh4VwED12rD/RzFEJPh/t+5
	iQTlIJe/F3ANxok/88RT+jDQ0BGN842/DZafJzZcSWMAuNgyGhAuXy0yhoAQf39nNaTpepSzgZ9B2
	FenLkamOCozox9UhpcwNLlPg0v5uw9tIBxb1Ni52H9PJdv+9HOTbzHo49YMrOhQ2yYxcIyWg1dZRj
	YQ5eHsKeoG97cU0taausmfYBCJcp6bcaa386XZ2DMp2Od+oLK6zzV+oDjcJuCL/e2uhl8ARzeJCue
	c2QzZziw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQwgz-00000007Gpa-0KDj;
	Wed, 03 Dec 2025 23:55:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQwgw-00000007GnX-0HCC;
	Wed, 03 Dec 2025 23:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764806121;
	bh=5lPAz5VlLI08P1uVjaFt1MkxmOS3Vp3ERDWnkGTatgs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KQ7GrldzSf5rOzTLlOp98QzKm6RHTMBjV9EtryNoie7syC0rCVUpp1UdoKm3XfyNW
	 PYa5lb/uvfLWtJ5+nmTNMDuEiQBf5LqnewLHdFFkjUoaXDv18cJHLU6RnZDQzw02ZJ
	 SqyZeNj1lsAIsWeBew+VU7EbLed61KIZcVQVG0Vyqwfxe1037aPpav/ike2JU3kC1j
	 0q+mFXKgexB6ub5xpGGWl7BS089AmksYr+jFvEWkI1sMygrJy+NiV7i90fHo2IMOJI
	 QK6L5FWKMmDodSmBwWZHRWi30jdJyIXrpHgSax/KtpjIt0VgxQoeCSHWphMEqyE7Gi
	 VaEauBjgpAVXw==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3FFBF17E1104;
	Thu,  4 Dec 2025 00:55:21 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 04 Dec 2025 01:54:10 +0200
Subject: [PATCH 2/2] phy: rockchip: samsung-hdptx: Cleanup TMDS PLL config
 table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-phy-hdptx-pll-fix-v1-2-d94fd6cfd59b@collabora.com>
References: <20251204-phy-hdptx-pll-fix-v1-0-d94fd6cfd59b@collabora.com>
In-Reply-To: <20251204-phy-hdptx-pll-fix-v1-0-d94fd6cfd59b@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_155526_272198_832BBEF0 
X-CRM114-Status: UNSURE (   8.78  )
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
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 81 +++++++----------------
 1 file changed, 24 insertions(+), 57 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index cafa618d70fd..4b9b36c50623 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -336,12 +336,7 @@ struct ropll_config {
 	u8 pms_pdiv;
 	u8 pms_refdiv;
 	u8 pms_sdiv;
-	u8 pms_iqdiv_rstn;
-	u8 ref_clk_sel;
 	u8 sdm_en;
-	u8 sdm_rstn;
-	u8 sdc_frac_en;
-	u8 sdc_rstn;
 	u8 sdm_clk_div;
 	u8 sdm_deno;
 	u8 sdm_num_sign;
@@ -349,14 +344,6 @@ struct ropll_config {
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
@@ -412,50 +399,30 @@ struct rk_hdptx_phy {
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
+/*             |              pms             |            sdm           |      sdc     | */
+/*        rate, mdiv, mdafc, pdiv, rdiv, sdiv, en, cdiv, deno, nsig, num,   n, num, deno, */
+{ 594000000ULL,  124,   124,    1,    1,    0,  1,    1,   62,    1,  16,   5,   0,    1, },
+{ 461101250ULL,   97,    97,    1,    1,    0,  1,    1,   71,    1,  53,   2,   6,   35, },
+{ 371250000ULL,  155,   155,    1,    1,    1,  1,    1,   62,    1,  16,   5,   0,    1, },
+{ 297000000ULL,  124,   124,    1,    1,    1,  1,    1,   62,    1,  16,   5,   0,    1, },
+{ 185625000ULL,  155,   155,    1,    1,    3,  1,    1,   62,    1,  16,   5,   0,    1, },
+{ 162000000ULL,  135,   135,    1,    1,    3,  0,    1,    4,    0,   3,   5,   5,   16, },
+{ 154000000ULL,  193,   193,    1,    1,    5,  1,    1,  193,    1,  32,   2,   1,    1, },
+{ 148500000ULL,  123,   123,    1,    1,    3,  1,    1,    4,    0,   3,   5,   5,   16, },
+{ 146250000ULL,  122,   122,    1,    1,    3,  1,    1,  244,    1,  16,   2,   1,    1, },
+{ 119000000ULL,  149,   149,    1,    1,    5,  1,    1,  149,    1,  16,   2,   1,    1, },
+{ 106500000ULL,   89,    89,    1,    1,    3,  1,    1,   89,    1,  16,   1,   0,    1, },
+{ 108000000ULL,  135,   135,    1,    1,    5,  0,    1,    9,    0,   5,   0,  20,   24, },
+{  92812500ULL,  155,   155,    1,    1,    7,  1,    1,   62,    1,  16,   5,   0,    1, },
+{  85500000ULL,  214,   214,    1,    1,   11,  1,    1,  214,    1,  16,   2,   1,    1, },
+{  83500000ULL,  105,   105,    1,    1,    5,  1,    1,   42,    1,  16,   1,   0,    1, },
+{  74250000ULL,  124,   124,    1,    1,    7,  1,    1,   62,    1,  16,   5,   0,    1, },
+{  65000000ULL,  162,   162,    1,    1,   11,  1,    1,   54,    0,  16,   4,   1,    1, },
+{  50250000ULL,   84,    84,    1,    1,    7,  1,    1,   11,    1,   4,   5,   4,   11, },
+{  40000000ULL,  100,   100,    1,    1,   11,  0,    1,    9,    0,   5,   0,  20,   24, },
+{  33750000ULL,  112,   112,    1,    1,   15,  1,    1,    2,    0,   1,   5,   1,    1, },
+{  27000000ULL,   90,    90,    1,    1,   15,  0,    1,    9,    0,   5,   0,  20,   24, },
+{  25175000ULL,   84,    84,    1,    1,   15,  1,    1,  168,    1,  16,   4,   1,    1, },
 };
 
 static const struct reg_sequence rk_hdtpx_common_cmn_init_seq[] = {

-- 
2.51.2


