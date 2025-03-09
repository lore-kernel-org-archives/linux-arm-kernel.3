Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67068C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 18:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgZ5TA0paPDH75/eNcrHtc6x37F89OMtaKXUAsxSe4o=; b=dWxHfaZG43VBUact4YNXzSg+wn
	hqCQOuO99A/9pXykOwSFI8Cq167KAWjMdvdzXGJQi65tkfrngns1CqjQc3vacEYbzxPCH9quKMJKq
	pyxDF7SzwWwzjdX5RR70rjf0jQg0Of2eqayQbDQstXnMUdy6TxXFJzn7vS5KUs8Kl2fZriZDsRyBQ
	M2iO0gthJeqR+dmZH7Gz7g3E7UVDPPW7/PGDjzKkzYTgHLUzFUTHG81WkXPOaNF1kG8vr/7DP26KA
	kKtu0OJIxdKpLi7icOcRQOj8Ix6vbC/VAI/11fjv4ekrSa/iOhwLrtvrOV6tXAGZLXxfeFLldy3v6
	ANWbj+gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trLWK-00000000z3n-29EC;
	Sun, 09 Mar 2025 18:37:04 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trLC4-00000000wes-3L5v;
	Sun, 09 Mar 2025 18:16:11 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 6C7C9120006;
	Sun,  9 Mar 2025 21:16:07 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 6C7C9120006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1741544167;
	bh=sgZ5TA0paPDH75/eNcrHtc6x37F89OMtaKXUAsxSe4o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=SJ7UHoVAqJojzSa1EPwkkVJy4LYKnHEBWgcTvr4MaO3d1TdfLJC/U7kUXAlAVLNtD
	 lijI1pJScsd1mqWNLcda99/PYaUkHZJckRG9OImLNvSpaqL/TaqBUx0ZJUguNvCRal
	 aeZz5Z9ZAZF+kMJPtO+NV3cWzqI0MxjIg2k/pKcuiCa9HMJvkxEijqkar/G0MosGxE
	 0e0GbRIsmaI+6nyCOOetCCtUDnssH30RCsSIBC39Esv6ye1/xn5jyWtxfY4ru9f4hn
	 UYrtuJTWul63uaknesGoC44mjEDIMdMlNPMuDT3FDx80850n70p8GZJoq8uypkykcG
	 tCxPwW4Qdceag==
Received: from smtp.sberdevices.ru (p-exch-cas-a-m1.sberdevices.ru [172.24.201.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun,  9 Mar 2025 21:16:07 +0300 (MSK)
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman
	<khilman@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Takashi Iwai
	<tiwai@suse.com>
Subject: [PATCH v2 2/4] ASoC: meson: g12a-toacodec: drop the definition of bits
Date: Sun, 9 Mar 2025 21:15:58 +0300
Message-ID: <20250309181600.1322701-3-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250309181600.1322701-1-jan.dakinevich@salutedevices.com>
References: <20250309181600.1322701-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.28.64.252]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-exch-cas-a-m1.sberdevices.ru (172.24.201.216)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 191599 [Mar 09 2025]
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51 68896fb0083a027476849bf400a331a2d5d94398, {Tracking_smtp_not_equal_from}, {Tracking_uf_ne_domains}, salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;lore.kernel.org:7.1.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2025/03/09 17:18:00
X-KSMG-LinksScanning: Clean, bases: 2025/03/09 17:18:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/03/09 17:28:00 #27692143
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_111609_195757_AAD4D9A9 
X-CRM114-Status: GOOD (  15.77  )
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

There are many of defines, but several of them are unused, other are
used once. It would easier to read if these values would occure in the
place of their usage.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
Also, there was an another attempt to rework bits' definition:

    https://lore.kernel.org/all/20240325235311.411920-1-jan.dakinevich@salutedevices.com/
---
 sound/soc/meson/g12a-toacodec.c | 45 ++++++++-------------------------
 1 file changed, 10 insertions(+), 35 deletions(-)

diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index 531bb8707a3e..03bde8d8d192 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -20,26 +20,6 @@
 #define G12A_TOACODEC_DRV_NAME "g12a-toacodec"
 
 #define TOACODEC_CTRL0			0x0
-#define  CTRL0_ENABLE_SHIFT		31
-#define  CTRL0_DAT_SEL_SM1_MSB		19
-#define  CTRL0_DAT_SEL_SM1_LSB		18
-#define  CTRL0_DAT_SEL_MSB		15
-#define  CTRL0_DAT_SEL_LSB		14
-#define  CTRL0_LANE_SEL_SM1		16
-#define  CTRL0_LANE_SEL			12
-#define  CTRL0_LRCLK_SEL_SM1_MSB	14
-#define  CTRL0_LRCLK_SEL_SM1_LSB	12
-#define  CTRL0_LRCLK_SEL_MSB		9
-#define  CTRL0_LRCLK_SEL_LSB		8
-#define  CTRL0_LRCLK_INV_SM1		BIT(10)
-#define  CTRL0_BLK_CAP_INV_SM1		BIT(9)
-#define  CTRL0_BLK_CAP_INV		BIT(7)
-#define  CTRL0_BCLK_O_INV_SM1		BIT(8)
-#define  CTRL0_BCLK_O_INV		BIT(6)
-#define  CTRL0_BCLK_SEL_SM1_MSB		6
-#define  CTRL0_BCLK_SEL_MSB		5
-#define  CTRL0_BCLK_SEL_LSB		4
-#define  CTRL0_MCLK_SEL			GENMASK(2, 0)
 
 #define TOACODEC_OUT_CHMAX		2
 
@@ -69,6 +49,7 @@ static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dapm_context *dapm =
 		snd_soc_dapm_kcontrol_dapm(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int mclk_sel = GENMASK(2, 0);
 	unsigned int mux, reg;
 
 	if (ucontrol->value.enumerated.item[0] >= e->items)
@@ -98,21 +79,18 @@ static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
 	 * source. For that, we will need regmap backed clock mux which
 	 * is a work in progress
 	 */
-	snd_soc_component_update_bits(component, e->reg,
-				      CTRL0_MCLK_SEL,
-				      FIELD_PREP(CTRL0_MCLK_SEL, mux));
+	snd_soc_component_update_bits(component, e->reg, mclk_sel,
+				      FIELD_PREP(mclk_sel, mux));
 
 	snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
 
 	return 1;
 }
 
-static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,
-			    CTRL0_DAT_SEL_LSB,
+static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0, 14,
 			    g12a_toacodec_mux_texts);
 
-static SOC_ENUM_SINGLE_DECL(sm1_toacodec_mux_enum, TOACODEC_CTRL0,
-			    CTRL0_DAT_SEL_SM1_LSB,
+static SOC_ENUM_SINGLE_DECL(sm1_toacodec_mux_enum, TOACODEC_CTRL0, 18,
 			    g12a_toacodec_mux_texts);
 
 static const struct snd_kcontrol_new g12a_toacodec_mux =
@@ -126,8 +104,7 @@ static const struct snd_kcontrol_new sm1_toacodec_mux =
 			  g12a_toacodec_mux_put_enum);
 
 static const struct snd_kcontrol_new g12a_toacodec_out_enable =
-	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0,
-				    CTRL0_ENABLE_SHIFT, 1, 0);
+	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0, 31, 1, 0);
 
 static const struct snd_soc_dapm_widget g12a_toacodec_widgets[] = {
 	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
@@ -209,15 +186,13 @@ static struct snd_soc_dai_driver g12a_toacodec_dai_drv[] = {
 static int g12a_toacodec_component_probe(struct snd_soc_component *c)
 {
 	/* Initialize the static clock parameters */
-	return snd_soc_component_write(c, TOACODEC_CTRL0,
-				       CTRL0_BLK_CAP_INV);
+	return snd_soc_component_write(c, TOACODEC_CTRL0, BIT(7));
 }
 
 static int sm1_toacodec_component_probe(struct snd_soc_component *c)
 {
 	/* Initialize the static clock parameters */
-	return snd_soc_component_write(c, TOACODEC_CTRL0,
-				       CTRL0_BLK_CAP_INV_SM1);
+	return snd_soc_component_write(c, TOACODEC_CTRL0, BIT(9));
 }
 
 static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
@@ -229,11 +204,11 @@ static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
 };
 
 static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
-	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 3, 0),
+	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, 12, 3, 0),
 };
 
 static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
-	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
+	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, 16, 3, 0),
 };
 
 static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
-- 
2.34.1


