Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC43D2E021
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 08:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2bi4VV4tB+2C35KiLjZn51cDIttz6219Ig2nhnskLc=; b=bBkPkDsI8C2/3e8U6/IFtlXuhq
	dj3I1pUbODb0qHjF9eF8rcvFV+8Ji+3xuc0hQgElYyB48ah2nNxqI5KXbNy0U2l7hDjgTczdwspro
	yNxlwQhB55gs2FijxMDI0rHLVguwjVAHva/1a/TRadTa8TJlNCeQ06Q9AP85+Jvl4rTxYMqCK+S9G
	hw6TqD4gjMmiH0blYgJGZfOwIiWE0SFNr1nFFJT/vNbxZwp5uHj8VOkS425xtGT40dQ5wbx6OQ5mF
	gnIfPTOR0SYJHfoHmZ4oBpGozfL30uznD/c04czyajT/75z6NTiNomYmWmU2Yo8uXk+So+wR+mY/+
	l4/vn6TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WNL-0000000DUwA-0cAY;
	Wed, 23 Oct 2024 08:05:51 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WHS-0000000DTiH-1Rw4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 07:59:47 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id BB0FA1380499;
	Wed, 23 Oct 2024 03:59:45 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Wed, 23 Oct 2024 03:59:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1729670385; x=
	1729756785; bh=Z2bi4VV4tB+2C35KiLjZn51cDIttz6219Ig2nhnskLc=; b=N
	Dkk/Q0ZxorhJqsWjmRSr+5cg6Z+Uh38lq4p9dltE992ZHP7c48F321/o+kfGwQTn
	TxZBhyUzHIaWJdHycQEti6J9Uc58p6g3MyO80ruu5/MJ4pYis2vOuXV/Tgt+3LX4
	9grSttL/6Y0e/utXN1UStv+8mYx1LiAzvWIxgpzsyAcHNZqRK7WMgetPZO9FGGoB
	vpgF7rMcti53X+FZDBF2Feu6LzL9Fjh9X283SlNuWBwFsDpJ2UH5xsaDs7v+dw/w
	ztmUaK0y/E+Mq/m/C/merg5VTUClrcOP+x07uZzNUQhbWETvAUv9iLEZf0texXvn
	UxrM6/cPAkC6b6yMaSx6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729670385; x=
	1729756785; bh=Z2bi4VV4tB+2C35KiLjZn51cDIttz6219Ig2nhnskLc=; b=f
	73BOLA6eyVMSC3ZaNV9cF/Hw0sHNADBqAPdGCn/qQzGJa2XN1buFYydrT9gpOYzz
	zsMgH8X5j0OoCMgLeLokxKBIeljBJCC3qplDrP8+lf+5s4+uFDE5P27Krq+DLs1Z
	MHhbxaAQ7RI6LDvXV8Qe2myq2C52cC077taVmcEvlItq5xDZczA8woLVfuaMBHjf
	jBQORo6b/bWqOiiU/clM+g2WWNxYAsGVBoHgrVYPqdEH85j6r0YLKzSbVH1J680d
	OvV51HZpomnqwaFo+wt6pIX9uvfCVu3r23x6zxUuFxNbKbKde0YTZ5jgzCsssVIC
	pmy+nXwBjtg04TUTBiRlQ==
X-ME-Sender: <xms:8awYZwLH0RTOG0PLNk57mSdRvYpQM3mBzU3SvqWTv5NX_FVOIYedoQ>
    <xme:8awYZwKk68-CCEqZh15CT920QinmE0dqKk0Zr1ga_kp_YPr_W29Ixr4ER2qkMlFff
    vj3B-dmW-km3XniLg>
X-ME-Received: <xmr:8awYZwv55iEswiqx27jlE7XFrCUDprbW6Jyyk5U4g6-NN4uMaGaVsCd7CJ7LxEEDKE7ZgOaHPfjUFg9uOTpMIN4WNSXPdAncrwM5ykX3-gO_bn8p>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeiiedguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedujedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifoh
    hougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtih
    ifrghisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehmrggtrhho
    rghlphhhrgekvdesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnshdrphhhih
    hlihhpphgvsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:8awYZ9ZXH1iBC21aiC-uxvMSKSsF_ytAOE6uEsoKAITCpVQFgu5SOQ>
    <xmx:8awYZ3ZuzncNgOq9ujmhSrK4RhlMRP251aShsMIiETypNgdFN-9UrQ>
    <xmx:8awYZ5Co0SOErtS_17Kg4eNIFP4PTRfsssJdZGcy1ZJNE09LrusGsA>
    <xmx:8awYZ9a2E1UeaOc8oNeGo5gO0MKLFEmOQZUR_p5EkQ9lpaGUKPXD7A>
    <xmx:8awYZ9s_2uVgWN-_mHZRnqIvRLLrs2jd1Gr_je_hdgmsq1bUEgv1616e>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Oct 2024 03:59:40 -0400 (EDT)
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
	Marcus Cooper <codekipper@gmail.com>,
	Ryan Walklin <ryan@testtoast.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v3 3/7] ASoC: sun4i-codec: Add support for different DAC FIFOC addresses to quirks
Date: Wed, 23 Oct 2024 20:56:59 +1300
Message-ID: <20241023075917.186835-4-ryan@testtoast.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023075917.186835-1-ryan@testtoast.com>
References: <20241023075917.186835-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_005946_472925_9F6A600B 
X-CRM114-Status: GOOD (  19.96  )
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

From: Marcus Cooper <codekipper@gmail.com>

The Allwinner H616 SoC  uses a different register address to control the
output FIFO.

Allow this to be specified separately from the ADC FIFO control
register.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 sound/soc/sunxi/sun4i-codec.c | 83 +++++++++++++++++++++--------------
 1 file changed, 51 insertions(+), 32 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 330bc0c09f56b..37f5678b55291 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -238,6 +238,8 @@ struct sun4i_codec {
 
 	/* ADC_FIFOC register is at different offset on different SoCs */
 	struct regmap_field *reg_adc_fifoc;
+	/* DAC_FIFOC register is at different offset on different SoCs */
+	struct regmap_field *reg_dac_fifoc;
 
 	struct snd_dmaengine_dai_dma_data	capture_dma_data;
 	struct snd_dmaengine_dai_dma_data	playback_dma_data;
@@ -246,19 +248,19 @@ struct sun4i_codec {
 static void sun4i_codec_start_playback(struct sun4i_codec *scodec)
 {
 	/* Flush TX FIFO */
-	regmap_set_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-			BIT(SUN4I_CODEC_DAC_FIFOC_FIFO_FLUSH));
+	regmap_field_set_bits(scodec->reg_dac_fifoc,
+			      BIT(SUN4I_CODEC_DAC_FIFOC_FIFO_FLUSH));
 
 	/* Enable DAC DRQ */
-	regmap_set_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-			BIT(SUN4I_CODEC_DAC_FIFOC_DAC_DRQ_EN));
+	regmap_field_set_bits(scodec->reg_dac_fifoc,
+			      BIT(SUN4I_CODEC_DAC_FIFOC_DAC_DRQ_EN));
 }
 
 static void sun4i_codec_stop_playback(struct sun4i_codec *scodec)
 {
 	/* Disable DAC DRQ */
-	regmap_clear_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-			  BIT(SUN4I_CODEC_DAC_FIFOC_DAC_DRQ_EN));
+	regmap_field_clear_bits(scodec->reg_dac_fifoc,
+				BIT(SUN4I_CODEC_DAC_FIFOC_DAC_DRQ_EN));
 }
 
 static void sun4i_codec_start_capture(struct sun4i_codec *scodec)
@@ -356,13 +358,13 @@ static int sun4i_codec_prepare_playback(struct snd_pcm_substream *substream,
 	u32 val;
 
 	/* Flush the TX FIFO */
-	regmap_set_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-			   BIT(SUN4I_CODEC_DAC_FIFOC_FIFO_FLUSH));
+	regmap_field_set_bits(scodec->reg_dac_fifoc,
+			      BIT(SUN4I_CODEC_DAC_FIFOC_FIFO_FLUSH));
 
 	/* Set TX FIFO Empty Trigger Level */
-	regmap_update_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-			   0x3f << SUN4I_CODEC_DAC_FIFOC_TX_TRIG_LEVEL,
-			   0xf << SUN4I_CODEC_DAC_FIFOC_TX_TRIG_LEVEL);
+	regmap_field_update_bits(scodec->reg_dac_fifoc,
+				 0x3f << SUN4I_CODEC_DAC_FIFOC_TX_TRIG_LEVEL,
+				 0xf << SUN4I_CODEC_DAC_FIFOC_TX_TRIG_LEVEL);
 
 	if (substream->runtime->rate > 32000)
 		/* Use 64 bits FIR filter */
@@ -371,13 +373,13 @@ static int sun4i_codec_prepare_playback(struct snd_pcm_substream *substream,
 		/* Use 32 bits FIR filter */
 		val = BIT(SUN4I_CODEC_DAC_FIFOC_FIR_VERSION);
 
-	regmap_update_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-			   BIT(SUN4I_CODEC_DAC_FIFOC_FIR_VERSION),
-			   val);
+	regmap_field_update_bits(scodec->reg_dac_fifoc,
+				 BIT(SUN4I_CODEC_DAC_FIFOC_FIR_VERSION),
+				 val);
 
 	/* Send zeros when we have an underrun */
-	regmap_clear_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-			   BIT(SUN4I_CODEC_DAC_FIFOC_SEND_LASAT));
+	regmap_field_clear_bits(scodec->reg_dac_fifoc,
+				BIT(SUN4I_CODEC_DAC_FIFOC_SEND_LASAT));
 
 	return 0;
 };
@@ -510,9 +512,9 @@ static int sun4i_codec_hw_params_playback(struct sun4i_codec *scodec,
 	u32 val;
 
 	/* Set DAC sample rate */
-	regmap_update_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-			   7 << SUN4I_CODEC_DAC_FIFOC_DAC_FS,
-			   hwrate << SUN4I_CODEC_DAC_FIFOC_DAC_FS);
+	regmap_field_update_bits(scodec->reg_dac_fifoc,
+				 7 << SUN4I_CODEC_DAC_FIFOC_DAC_FS,
+				 hwrate << SUN4I_CODEC_DAC_FIFOC_DAC_FS);
 
 	/* Set the number of channels we want to use */
 	if (params_channels(params) == 1)
@@ -520,27 +522,27 @@ static int sun4i_codec_hw_params_playback(struct sun4i_codec *scodec,
 	else
 		val = 0;
 
-	regmap_update_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-			   BIT(SUN4I_CODEC_DAC_FIFOC_MONO_EN),
-			   val);
+	regmap_field_update_bits(scodec->reg_dac_fifoc,
+				 BIT(SUN4I_CODEC_DAC_FIFOC_MONO_EN),
+				 val);
 
 	/* Set the number of sample bits to either 16 or 24 bits */
 	if (hw_param_interval(params, SNDRV_PCM_HW_PARAM_SAMPLE_BITS)->min == 32) {
-		regmap_set_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-				   BIT(SUN4I_CODEC_DAC_FIFOC_TX_SAMPLE_BITS));
+		regmap_field_set_bits(scodec->reg_dac_fifoc,
+				      BIT(SUN4I_CODEC_DAC_FIFOC_TX_SAMPLE_BITS));
 
 		/* Set TX FIFO mode to padding the LSBs with 0 */
-		regmap_clear_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-				   BIT(SUN4I_CODEC_DAC_FIFOC_TX_FIFO_MODE));
+		regmap_field_clear_bits(scodec->reg_dac_fifoc,
+					BIT(SUN4I_CODEC_DAC_FIFOC_TX_FIFO_MODE));
 
 		scodec->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	} else {
-		regmap_clear_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-				   BIT(SUN4I_CODEC_DAC_FIFOC_TX_SAMPLE_BITS));
+		regmap_field_clear_bits(scodec->reg_dac_fifoc,
+					BIT(SUN4I_CODEC_DAC_FIFOC_TX_SAMPLE_BITS));
 
 		/* Set TX FIFO mode to repeat the MSB */
-		regmap_set_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-				   BIT(SUN4I_CODEC_DAC_FIFOC_TX_FIFO_MODE));
+		regmap_field_set_bits(scodec->reg_dac_fifoc,
+				      BIT(SUN4I_CODEC_DAC_FIFOC_TX_FIFO_MODE));
 
 		scodec->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
 	}
@@ -587,8 +589,8 @@ static int sun4i_codec_startup(struct snd_pcm_substream *substream,
 	 * Stop issuing DRQ when we have room for less than 16 samples
 	 * in our TX FIFO
 	 */
-	regmap_set_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
-			   3 << SUN4I_CODEC_DAC_FIFOC_DRQ_CLR_CNT);
+	regmap_field_set_bits(scodec->reg_dac_fifoc,
+			      3 << SUN4I_CODEC_DAC_FIFOC_DRQ_CLR_CNT);
 
 	return clk_prepare_enable(scodec->clk_module);
 }
@@ -1565,6 +1567,7 @@ struct sun4i_codec_quirks {
 	const struct snd_soc_component_driver *codec;
 	struct snd_soc_card * (*create_card)(struct device *dev);
 	struct reg_field reg_adc_fifoc;	/* used for regmap_field */
+	struct reg_field reg_dac_fifoc;	/* used for regmap_field */
 	unsigned int reg_dac_txdata;	/* TX FIFO offset for DMA config */
 	unsigned int reg_adc_rxdata;	/* RX FIFO offset for DMA config */
 	bool has_reset;
@@ -1575,6 +1578,7 @@ static const struct sun4i_codec_quirks sun4i_codec_quirks = {
 	.codec		= &sun4i_codec_codec,
 	.create_card	= sun4i_codec_create_card,
 	.reg_adc_fifoc	= REG_FIELD(SUN4I_CODEC_ADC_FIFOC, 0, 31),
+	.reg_dac_fifoc	= REG_FIELD(SUN4I_CODEC_DAC_FIFOC, 0, 31),
 	.reg_dac_txdata	= SUN4I_CODEC_DAC_TXDATA,
 	.reg_adc_rxdata	= SUN4I_CODEC_ADC_RXDATA,
 };
@@ -1584,6 +1588,7 @@ static const struct sun4i_codec_quirks sun6i_a31_codec_quirks = {
 	.codec		= &sun6i_codec_codec,
 	.create_card	= sun6i_codec_create_card,
 	.reg_adc_fifoc	= REG_FIELD(SUN6I_CODEC_ADC_FIFOC, 0, 31),
+	.reg_dac_fifoc	= REG_FIELD(SUN4I_CODEC_DAC_FIFOC, 0, 31),
 	.reg_dac_txdata	= SUN4I_CODEC_DAC_TXDATA,
 	.reg_adc_rxdata	= SUN6I_CODEC_ADC_RXDATA,
 	.has_reset	= true,
@@ -1594,6 +1599,7 @@ static const struct sun4i_codec_quirks sun7i_codec_quirks = {
 	.codec		= &sun7i_codec_codec,
 	.create_card	= sun4i_codec_create_card,
 	.reg_adc_fifoc	= REG_FIELD(SUN4I_CODEC_ADC_FIFOC, 0, 31),
+	.reg_dac_fifoc	= REG_FIELD(SUN4I_CODEC_DAC_FIFOC, 0, 31),
 	.reg_dac_txdata	= SUN4I_CODEC_DAC_TXDATA,
 	.reg_adc_rxdata	= SUN4I_CODEC_ADC_RXDATA,
 };
@@ -1603,6 +1609,7 @@ static const struct sun4i_codec_quirks sun8i_a23_codec_quirks = {
 	.codec		= &sun8i_a23_codec_codec,
 	.create_card	= sun8i_a23_codec_create_card,
 	.reg_adc_fifoc	= REG_FIELD(SUN6I_CODEC_ADC_FIFOC, 0, 31),
+	.reg_dac_fifoc	= REG_FIELD(SUN4I_CODEC_DAC_FIFOC, 0, 31),
 	.reg_dac_txdata	= SUN4I_CODEC_DAC_TXDATA,
 	.reg_adc_rxdata	= SUN6I_CODEC_ADC_RXDATA,
 	.has_reset	= true,
@@ -1618,6 +1625,7 @@ static const struct sun4i_codec_quirks sun8i_h3_codec_quirks = {
 	.codec		= &sun8i_a23_codec_codec,
 	.create_card	= sun8i_h3_codec_create_card,
 	.reg_adc_fifoc	= REG_FIELD(SUN6I_CODEC_ADC_FIFOC, 0, 31),
+	.reg_dac_fifoc	= REG_FIELD(SUN4I_CODEC_DAC_FIFOC, 0, 31),
 	.reg_dac_txdata	= SUN8I_H3_CODEC_DAC_TXDATA,
 	.reg_adc_rxdata	= SUN6I_CODEC_ADC_RXDATA,
 	.has_reset	= true,
@@ -1632,6 +1640,7 @@ static const struct sun4i_codec_quirks sun8i_v3s_codec_quirks = {
 	.codec		= &sun8i_a23_codec_codec,
 	.create_card	= sun8i_v3s_codec_create_card,
 	.reg_adc_fifoc	= REG_FIELD(SUN6I_CODEC_ADC_FIFOC, 0, 31),
+	.reg_dac_fifoc	= REG_FIELD(SUN4I_CODEC_DAC_FIFOC, 0, 31),
 	.reg_dac_txdata	= SUN8I_H3_CODEC_DAC_TXDATA,
 	.reg_adc_rxdata	= SUN6I_CODEC_ADC_RXDATA,
 	.has_reset	= true,
@@ -1739,6 +1748,16 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	scodec->reg_dac_fifoc = devm_regmap_field_alloc(&pdev->dev,
+							scodec->regmap,
+							quirks->reg_dac_fifoc);
+	if (IS_ERR(scodec->reg_dac_fifoc)) {
+		ret = PTR_ERR(scodec->reg_dac_fifoc);
+		dev_err(&pdev->dev, "Failed to create regmap fields: %d\n",
+			ret);
+		return ret;
+	}
+
 	/* Enable the bus clock */
 	if (clk_prepare_enable(scodec->clk_apb)) {
 		dev_err(&pdev->dev, "Failed to enable the APB clock\n");
-- 
2.47.0


