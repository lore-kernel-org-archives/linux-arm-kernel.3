Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E5BC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWLlnni9ZV/38ejF8LSw3DF7K5lyDl0Bbk3JQASeHmQ=; b=2UJXtsRdpWqCPDEPr/UqBbp1XX
	4XsYkrvZ89M14n1+RfdkJOgClJnFiNaf1IwWOrsPovB3tkEBmOv0fvx/z8n/4VPJBQyOmCdM1fpV0
	bx9MVXFxF5AU21ztvbUMd8qmsUpYEU6bc6e1FRr/2WeNI9V1R7Kj4QhlrmMv/Jjl35ZqyRTVIaMYE
	Zjxf8I4lxrhhGmI8nCF/WViGjL1llhTtRsoDniWUYIcb26Ata1DRiWLmYn5+u6KFmATRWihwqKVQh
	GttTOb50JkuLIzvml9ilJcTyqyvoOVYImsnxu2T4SJuEs6gbLlg9wPSoHGMHDuzxZRbyArMP/2IYe
	ZOCZfsfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxzI-00000000J6s-3KJm;
	Tue, 25 Feb 2025 16:40:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmw1b-0000000HXit-18ro;
	Tue, 25 Feb 2025 14:35:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740494105;
	bh=VOTlkRaTJUxVymB+VRML2zW6NSmIQJd6XGkId1VraY4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J8iN9rn7M9ODiSRDL1LE/Bf8VoJqyJSSl8XDO7lkOrw2THUkCmMpfLkLfqFtEjvSz
	 HekKyWTk0Z1lN/gKHVh9L+NGuv5aMpMeeUkiVYorIqjpaBreR1inM0HqhdhekbcDwy
	 SegcVs3yAE0OaPzqApBUTdkxJqtzM/5VDTvAjLTrp5lgdYM902VUAgcgE7B3gqJBIm
	 wvBxsKJK8EsPRxDdoapjfqlDrGJD4hDl1Uw1hpfa0kpO77cMWFX52tkhyEwZhyKoh6
	 KqpEyE0UEaTrq0C0vr2/iqTfAOCeAs3pypscEvmdQQbQcXFgYl7o5sA+u7ONu3impj
	 QsewR5a44WNfg==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1004])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D16AA17E0DD7;
	Tue, 25 Feb 2025 15:35:01 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 25 Feb 2025 11:33:47 -0300
Subject: [PATCH v2 1/8] ASoC: mediatek: mt8188: Add audsys hires clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250225-genio700-dmic-v2-1-3076f5b50ef7@collabora.com>
References: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
In-Reply-To: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_063507_454636_0B78EB3F 
X-CRM114-Status: UNSURE (   8.04  )
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

Describe and register the aud_dmic_hires audsys clocks, which are needed
when recording the DMIC at a sample rate of 96k.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c   | 4 ++++
 sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
index c796ad8b62eeaa929f24c09755f428116b105404..40d2ab0a7677b64985f9fc9eb38f67bca7ecd4f9 100644
--- a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
@@ -84,6 +84,10 @@ static const struct afe_gate aud_clks[CLK_AUD_NR_CLK] = {
 	GATE_AUD1(CLK_AUD_AFE_26M_DMIC_TM, "aud_afe_26m_dmic_tm", "top_a1sys_hp", 14),
 	GATE_AUD1(CLK_AUD_UL_TML_HIRES, "aud_ul_tml_hires", "top_audio_h", 16),
 	GATE_AUD1(CLK_AUD_ADC_HIRES, "aud_adc_hires", "top_audio_h", 17),
+	GATE_AUD1(CLK_AUD_DMIC_HIRES1, "aud_dmic_hires1", "top_audio_h", 20),
+	GATE_AUD1(CLK_AUD_DMIC_HIRES2, "aud_dmic_hires2", "top_audio_h", 21),
+	GATE_AUD1(CLK_AUD_DMIC_HIRES3, "aud_dmic_hires3", "top_audio_h", 22),
+	GATE_AUD1(CLK_AUD_DMIC_HIRES4, "aud_dmic_hires4", "top_audio_h", 23),
 
 	/* AUD3 */
 	GATE_AUD3(CLK_AUD_LINEIN_TUNER, "aud_linein_tuner", "top_apll5", 5),
diff --git a/sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h b/sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h
index 6f34ffc760e03beddc3001046e554edd7ea2c478..9cb732863c104383b9859b4bb5b3f5c289ad1864 100644
--- a/sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h
+++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h
@@ -33,6 +33,10 @@ enum{
 	CLK_AUD_AFE_26M_DMIC_TM,
 	CLK_AUD_UL_TML_HIRES,
 	CLK_AUD_ADC_HIRES,
+	CLK_AUD_DMIC_HIRES1,
+	CLK_AUD_DMIC_HIRES2,
+	CLK_AUD_DMIC_HIRES3,
+	CLK_AUD_DMIC_HIRES4,
 	CLK_AUD_LINEIN_TUNER,
 	CLK_AUD_EARC_TUNER,
 	CLK_AUD_I2SIN,

-- 
2.48.1


