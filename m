Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2EFC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 19:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeE0vhY6dXgqC2p1tU3zEikTeCmuLCeYWn65Q90YH/U=; b=fpHGOEIiuwTVauXE8mAHPk9Q1y
	x2c/fhDWp+7vA7Pko7GALNb76fzq5RE1hbL+ThsWd21aQO5VlLzbhdXZ1TYvMOIGqGvpDFNWBQXze
	W5AiOIBTc0P0u9TV7+LOcLncsi0cQMtUnHg3hhVrLXaeXKF+RazbqqabK5HUg2JiKM3Q9iNDOauED
	ciXAHaZEbQZsIzBiSqPCha/84b44eh2jVH78zQ2kTl9XphBrormLgOu9Pb+c9/4beF0Qfc4xmgUNI
	5enpGvajoBdtu4uyytlZHiU5dkA3T/2rZk1+YIfcP1poteP9XQkltilhbAiW7KvK4qnOxaxTKDSld
	DbyOq/pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpu8p-0000000926J-1sz5;
	Wed, 05 Mar 2025 19:10:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptyA-000000090DY-3QOw;
	Wed, 05 Mar 2025 18:59:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741201189;
	bh=oENbZq9wxTXMu0zGgWXBpMvdBFjW1P8NsiaK44heerA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AdLBpMEWWs1CWBuswRd67tsyOyvWg5NHhTBhApz8Hkdp3knGYg/ATT+lvO7r2TXwK
	 r/efCet+eFfeG0k2slA6aAjm+ZLWv+qywI65WTVwVuhB+Z73rFZf4XyMEGxTHeOuGh
	 iLB88PWR8zCyneg9c3HjbIpI2nfQ/u+dPaVMp8RJVrOkrcKP4nnMYjzDAl0OWdE0+W
	 iVpm6qTLvieVuHmJJwF5nOJjWb7pH/kc+1eNKkV5z2vknpUZJL2oB9lwIqUaTC5N99
	 yVQREWBj4gN9qi9tnLYouYTYqPUdH8ozbsWz9WRm+DSaToCO7+8I9pTLzgR7Gt2j0W
	 hsRCsNNXi5ldg==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1004])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E3A217E017D;
	Wed,  5 Mar 2025 19:59:43 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 05 Mar 2025 15:58:20 -0300
Subject: [PATCH v4 05/19] ASoC: mediatek: mt6359-accdet: Implement HP_EINT
 polarity configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250305-mt6359-accdet-dts-v4-5-e5ffa5ee9991@collabora.com>
References: <20250305-mt6359-accdet-dts-v4-0-e5ffa5ee9991@collabora.com>
In-Reply-To: <20250305-mt6359-accdet-dts-v4-0-e5ffa5ee9991@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Andrew Perepech <andrew.perepech@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_105950_994583_C517EBC8 
X-CRM114-Status: GOOD (  10.91  )
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

From: Andrew Perepech <andrew.perepech@mediatek.com>

The driver currently reads the HP_EINT polarity from the Devicetree but
never actually configures the hardware accordingly.

Implement the polarity configuration in hardware.

Signed-off-by: Andrew Perepech <andrew.perepech@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index ca3be59d2d0ecaadccd9ba399649ba93f20490c4..1d4481109f6e4f473610e0797c9d3c636bdf12cf 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -730,6 +730,17 @@ static void config_digital_init_by_mode(struct mt6359_accdet *priv)
 					   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT));
 		}
 	}
+
+	if (priv->data->hp_eint_high) {
+		/* EINT polarity inverse */
+		regmap_update_bits(priv->regmap, ACCDET_EINT_IN_INVERSE_ADDR,
+				   ACCDET_EINT_IN_INVERSE_MASK_SFT,
+				   BIT(ACCDET_EINT_IN_INVERSE_SFT));
+	} else {
+		/* EINT polarity normal */
+		regmap_update_bits(priv->regmap, ACCDET_EINT_IN_INVERSE_ADDR,
+				   ACCDET_EINT_IN_INVERSE_MASK_SFT, 0);
+	}
 }
 
 static void config_eint_init_by_mode(struct mt6359_accdet *priv)

-- 
2.48.1


