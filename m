Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BCDD2E021
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 08:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4SwrnOxpLJyRmiekqgcMSf7zZRoIoNhko/QGoWLF9E=; b=Rob8Tsl4cBR41JP6Na2JMB1Vvs
	b9hIkXqVFxRPRnWRUZhu5PwGJTSZFit/Ms572vAuMEFg0cg0TTfXLh5hI8E6L26CWKpKdl4QQNlZG
	vHQt/ePbe7MyzKojzUh755QauMVUEPmYfL5tL0gshgmyAX+gLboFfLeLOoldgZypSJgusavJLtSRb
	RFg7YCjNSqpCT5OhFvL3E3UJ2ctaFK7ikbXGnaRzz3uPQIXnKmpAoB5JwpPd7dkaJr+5WB9PoNClF
	+JcSB+Cwpjj4VTKfi4bDv0pZHcqN0DTCsC1uWr1CPhP9xXFTzPdwHvgXUS9MnnkSwtOjp4M1JjiFe
	4OtlmL/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WKL-0000000DUKG-2p2Q;
	Wed, 23 Oct 2024 08:02:45 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WHI-0000000DTge-2HVZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 07:59:37 +0000
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CF5841140190;
	Wed, 23 Oct 2024 03:59:35 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Wed, 23 Oct 2024 03:59:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1729670375; x=
	1729756775; bh=v4SwrnOxpLJyRmiekqgcMSf7zZRoIoNhko/QGoWLF9E=; b=O
	t0ETmZ1hYdft0kILEflTwZoZR/sHAfn5mgb41MNdr/BPppRzsx7eh1IEwcDwp3qP
	ihsixg3MAprk9u5qB4Q+F3hS16EiCqI78Pd6Pl3s0osH+GEJksGWJuLO4qocmoU6
	+GrPKfcMP9x1wIT6QDYt6WRBsUKvtK3XA3ieHtdTUwUI+V270zDAw03Znrgq9Emn
	w6HL+R37Bhf3yYqx8h/hK32EPPABKPjTRBA51RvHwWJIkZP+Yngkt9QPUZjsSeWV
	pdnHOZ6JW7FIdcXva/vezYA9czdAKo7O7MH5E9e/0+Di6r32bMRtdnamsfqkiHHq
	hmgaBXZGhR0ydEmA3qs4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729670375; x=
	1729756775; bh=v4SwrnOxpLJyRmiekqgcMSf7zZRoIoNhko/QGoWLF9E=; b=G
	3tU+5u1B/uLYTdqNIEWkKBZqbey17ws2cCBIbJ7T8IEVPMo7VlDLVkcWdmxtKvl2
	0HhodN/FSDvaAIgQCGmZybTRP8xbfdp4RNKB8Wl4TtvatrcRbKEJf2eE8yYHodBd
	/6Eks5b/8LP4R5jcqKZrJgCyRb94a9SG3o68hthjHQKbscxB2bDpN1tSsCEzSVyh
	lXiNwOs9DGULT+xPO9NWQYGgZ/z4J3VoMERgV0TOXGXfgcMRdM7HKVmZQ3XKiZrw
	gxcPKCKIcWjKhfqwknO2r05bE8xGnvkvRg+Upgq9kZZODrok1seu6v6zAZwKWsPx
	sYu6BVOCbXTE5/jEQ5a1g==
X-ME-Sender: <xms:56wYZ7uO8Wl3u2zpeNCts-rmfINvJSg03fQgFaJXsFvi2PwWV4h0FA>
    <xme:56wYZ8fjbygVEqFW_Q3o6KphPT0SU-i0_4ZFC7iCEYvycGtArF6lCv1GUEcOEJS9k
    ERjRADybiLMYy9YSA>
X-ME-Received: <xmr:56wYZ-wdHUOn6pEwuXl9tHZEqw91k-d7KwkwMcPmopOyc1lrC_3F2Cc8hVkAYPYFVvSHeWhgxpy7-v3GhSFiteA5lwywm8DML46fvJG_mGdhMVCR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeiiedguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifoh
    hougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtih
    ifrghisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehmrggtrhho
    rghlphhhrgekvdesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnshdrphhhih
    hlihhpphgvsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:56wYZ6Mxuz6XV5vHO_aQYrKnnPaROisFQ0-Wpnw4shGMfu-2vuACoA>
    <xmx:56wYZ79Y1Dx7R64tv7IDRm633khRsMHUxLpg0G47mbHuXYpbHcFJug>
    <xmx:56wYZ6X_H6GEh2xRDsGNuGoKLKkB_M-YNtf3HI_DHC5n2_9mqfA4eQ>
    <xmx:56wYZ8eoB49AH8daeY6Fb8fxSEzI1nbnEIMo-qbdwoviCKPqyWhhew>
    <xmx:56wYZyfPPPYAWcrIJDo__KZez34b8jMokYqcJQwQA0d95TU-wh4kPGTZ>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Oct 2024 03:59:31 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macroalpha82@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v3 1/7] clk: sunxi-ng: h616: Add sigma-delta modulation settings for audio PLL
Date: Wed, 23 Oct 2024 20:56:57 +1300
Message-ID: <20241023075917.186835-2-ryan@testtoast.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023075917.186835-1-ryan@testtoast.com>
References: <20241023075917.186835-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_005936_778849_60C68B09 
X-CRM114-Status: GOOD (  19.45  )
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

Allwinner has previously released a H616 audio driver which also
provides sigma-delta modulation for the audio PLL clocks. This approach
is used in other Allwinner SoCs, including the H3 and A64.

The manual-provided clock values are:
PLL_AUDIO(hs) = 24 MHz*N/M1
PLL_AUDIO(4X) = 24 MHz*N/M0/M1/P
PLL_AUDIO(2X) = 24 MHz*N/M0/M1/P/2
PLL_AUDIO(1X) = 24 MHz*N/M0/M1/P/4

A fixed post-divider of 2 is used to account for a M0 divider of
2, which cannot be modelled by the existing macros and ccu_nm struct.

Add SDM to the H616 clock control unit driver.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>

---
Changelog v1..v2:
- Add fixed_post_div to high-speed audio clock to correct M0 value to 1 (ie divide by 2) based on manual
- Correct PLL_AUDIO_(4/2/1)X clocks to manual-provided values
- Add/correct inline comments for the above.
- add CCU_FEATURE_FIXED_POSTDIV to pll_audio_hs_clk.common.features

Changelog v2..v3:
- Update comments and commit message to more accurately reflect SDM changes and rationale
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 46 +++++++++++++++++---------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 6c7623d4c59ea..05727fa1ee46e 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -215,20 +215,30 @@ static struct ccu_nkmp pll_de_clk = {
 	},
 };
 
-/*
- * TODO: Determine SDM settings for the audio PLL. The manual suggests
- * PLL_FACTOR_N=16, PLL_POST_DIV_P=2, OUTPUT_DIV=2, pattern=0xe000c49b
- * for 24.576 MHz, and PLL_FACTOR_N=22, PLL_POST_DIV_P=3, OUTPUT_DIV=2,
- * pattern=0xe001288c for 22.5792 MHz.
- * This clashes with our fixed PLL_POST_DIV_P.
+/* 
+ * Sigma-delta modulation settings table obtained from the vendor SDK driver.
+ * There are additional M0 and M1 divider bits not modelled here, so forced to
+ * fixed values in the probe routine. Sigma-delta modulation allows providing a
+ * fractional-N divider in the PLL, to help reaching those specific
+ * frequencies with less error.
  */
+static struct ccu_sdm_setting pll_audio_sdm_table[] = {
+	{ .rate = 90316800, .pattern = 0xc001288d, .m = 3, .n = 22 },
+	{ .rate = 98304000, .pattern = 0xc001eb85, .m = 5, .n = 40 },
+};
+
 #define SUN50I_H616_PLL_AUDIO_REG	0x078
 static struct ccu_nm pll_audio_hs_clk = {
 	.enable		= BIT(31),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
-	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
+	.m		= _SUNXI_CCU_DIV(16, 6),
+	.sdm		= _SUNXI_CCU_SDM(pll_audio_sdm_table,
+					 BIT(24), 0x178, BIT(31)),
+	.fixed_post_div = 2,
 	.common		= {
+		.features	= CCU_FEATURE_FIXED_POSTDIV | 
+				  CCU_FEATURE_SIGMA_DELTA_MOD,
 		.reg		= 0x078,
 		.hw.init	= CLK_HW_INIT("pll-audio-hs", "osc24M",
 					      &ccu_nm_ops,
@@ -701,18 +711,20 @@ static const struct clk_hw *clk_parent_pll_audio[] = {
 };
 
 /*
- * The divider of pll-audio is fixed to 24 for now, so 24576000 and 22579200
- * rates can be set exactly in conjunction with sigma-delta modulation.
+ * The PLL_AUDIO_4X clock defaults to 24.5714 MHz according to the manual, with 
+ * a final divider of 1. The 2X and 1X clocks use 2 and 4 respectively. The 1x 
+ * clock is set to either 24576000 or 22579200 for 48Khz and 44.1Khz (and 
+ * multiples).
  */
 static CLK_FIXED_FACTOR_HWS(pll_audio_1x_clk, "pll-audio-1x",
 			    clk_parent_pll_audio,
-			    96, 1, CLK_SET_RATE_PARENT);
+			    4, 1, CLK_SET_RATE_PARENT);
 static CLK_FIXED_FACTOR_HWS(pll_audio_2x_clk, "pll-audio-2x",
 			    clk_parent_pll_audio,
-			    48, 1, CLK_SET_RATE_PARENT);
+			    2, 1, CLK_SET_RATE_PARENT);
 static CLK_FIXED_FACTOR_HWS(pll_audio_4x_clk, "pll-audio-4x",
 			    clk_parent_pll_audio,
-			    24, 1, CLK_SET_RATE_PARENT);
+			    1, 1, CLK_SET_RATE_PARENT);
 
 static const struct clk_hw *pll_periph0_parents[] = {
 	&pll_periph0_clk.common.hw
@@ -1162,12 +1174,14 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 	}
 
 	/*
-	 * Force the post-divider of pll-audio to 12 and the output divider
-	 * of it to 2, so 24576000 and 22579200 rates can be set exactly.
+	 * Set the output-divider for the pll-audio clocks (M0) to 2 and the
+	 * input divider (M1) to 1 as recommended by the manual when using 
+	 * SDM. 
 	 */
 	val = readl(reg + SUN50I_H616_PLL_AUDIO_REG);
-	val &= ~(GENMASK(21, 16) | BIT(0));
-	writel(val | (11 << 16) | BIT(0), reg + SUN50I_H616_PLL_AUDIO_REG);
+	val &= ~BIT(1);
+	val |= BIT(0);
+	writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
 
 	/*
 	 * First clock parent (osc32K) is unusable for CEC. But since there
-- 
2.47.0


