Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E026C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 21:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlGVNkstxTyUd+LrGn9GXeqq5L7VUZZ5FCKjh3sbqqY=; b=ubpH00WCIyNA30xXJ2jzc32JpU
	9oVePpEG2WrdDGzwlb92S0nxkShbaF0E7rw5IdpOsAgPjItCkkEtLXM4Tdhv4H+TrF9S6sO22Ly1H
	DtBNZvfctCwzEZ1N1ARE0IW0IM9amo6mqZa9hGRb8Z/5t8sfrlMhINUnBJ2GULXI+5T6Y11FqDdIq
	lFDdMzEKjwx6QtWTX3pwhsOpWCYJ+4+R9BvoYeJFVNR73TkiUxbjECrcj9CliHbXiy0Y3TWZz6CHC
	1ITddhobLElHhlBNiQFPvluDXFhMhO8PnYGI2fCwQjd1IOT+WNQt2QTriK7Lf4wGGKtYuQUKcb8wr
	AwCSj31A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkV0L-00000009xjc-2MvX;
	Tue, 18 Feb 2025 21:19:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUcG-00000009sUF-34N2;
	Tue, 18 Feb 2025 20:54:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739912091;
	bh=Yk5XIblYjpzjabFJKo9Uv7D5fdBdo4hChmW38vMB4iw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g2w2EmJ3WrGM8xkTw19TeP7qw2jgoJxVuJIKF/TM0Wxhv7+um7O3A4lz/bwUXcfTM
	 BtCVjKXsK7GZBBaFVAxulvP+VXVHPyXFkfj1d4OsebtzhR1Tij007/4inVA9RNeXxG
	 qg43FeRQCrC1rMmtWaqQ7gte+AdojU5FajtHId6B3V4RMyI9QqieXx0fIOy0TzL+jK
	 sDDamSoxcCVuSjUK34rpkUm7cZMtflJ5fyo8iP/wLhubNK8WxwRIvd8E0JpOyjCL2Z
	 SohPC28puZ5x08cdb5jz4RGRxO7DEL2PurYCXA4KD5evMEsdB4+pIwPWJ5kvxgEEK+
	 iOEsZACeovb6Q==
Received: from [192.168.0.47] (unknown [177.33.139.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 07C1617E0657;
	Tue, 18 Feb 2025 21:54:46 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 18 Feb 2025 17:52:14 -0300
Subject: [PATCH 1/6] ASoC: mediatek: mt8188: Add audsys hires clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250218-genio700-dmic-v1-1-6bc653da60f7@collabora.com>
References: <20250218-genio700-dmic-v1-0-6bc653da60f7@collabora.com>
In-Reply-To: <20250218-genio700-dmic-v1-0-6bc653da60f7@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_125452_938135_F2307DD5 
X-CRM114-Status: UNSURE (   7.78  )
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
index c796ad8b62eeaa929f24c09755f428116b105404..e7b2c9da61f6b5dbe9002a294ebbb7f4415fe54c 100644
--- a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
@@ -81,6 +81,10 @@ static const struct afe_gate aud_clks[CLK_AUD_NR_CLK] = {
 	GATE_AUD1(CLK_AUD_AFE_DMIC2, "aud_afe_dmic2", "top_a1sys_hp", 11),
 	GATE_AUD1(CLK_AUD_AFE_DMIC3, "aud_afe_dmic3", "top_a1sys_hp", 12),
 	GATE_AUD1(CLK_AUD_AFE_DMIC4, "aud_afe_dmic4", "top_a1sys_hp", 13),
+	GATE_AUD1(CLK_AUD_DMIC_HIRES1, "aud_dmic_hires1", "top_audio_h", 20),
+	GATE_AUD1(CLK_AUD_DMIC_HIRES2, "aud_dmic_hires2", "top_audio_h", 21),
+	GATE_AUD1(CLK_AUD_DMIC_HIRES3, "aud_dmic_hires3", "top_audio_h", 22),
+	GATE_AUD1(CLK_AUD_DMIC_HIRES4, "aud_dmic_hires4", "top_audio_h", 23),
 	GATE_AUD1(CLK_AUD_AFE_26M_DMIC_TM, "aud_afe_26m_dmic_tm", "top_a1sys_hp", 14),
 	GATE_AUD1(CLK_AUD_UL_TML_HIRES, "aud_ul_tml_hires", "top_audio_h", 16),
 	GATE_AUD1(CLK_AUD_ADC_HIRES, "aud_adc_hires", "top_audio_h", 17),
diff --git a/sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h b/sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h
index 6f34ffc760e03beddc3001046e554edd7ea2c478..820f2aef17ea40be1a80aece604b4a319934312f 100644
--- a/sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h
+++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h
@@ -30,6 +30,10 @@ enum{
 	CLK_AUD_AFE_DMIC2,
 	CLK_AUD_AFE_DMIC3,
 	CLK_AUD_AFE_DMIC4,
+	CLK_AUD_DMIC_HIRES1,
+	CLK_AUD_DMIC_HIRES2,
+	CLK_AUD_DMIC_HIRES3,
+	CLK_AUD_DMIC_HIRES4,
 	CLK_AUD_AFE_26M_DMIC_TM,
 	CLK_AUD_UL_TML_HIRES,
 	CLK_AUD_ADC_HIRES,

-- 
2.48.1


