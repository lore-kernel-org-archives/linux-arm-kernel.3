Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A947C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 15:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fsdElgabcdF0Pp40nDnNJyVNHdAhE//DEgoQh3gXOAM=; b=jug0QTdVGtJLnG
	3ZczZTYFesj9qY4ILnAN3C5XY0vExr0Dt2+P08SmqtI5BXuGGst27xZIHjUUKDvaXZTau0zXuNXoG
	q+UpzN3pRyoZaYESjcQOakChV4U9jvbBRQigh+T6USdzK+mBpkPy3o94PbyPwMfHLnSaOpf0Kd6XO
	eEjFYLty5jnJZ0adxLYPv6PdDYVrJiDIjKoCDnqqY13WiRc/uCtXMq4hKEOT2qh/qWGs2LqNFWpdV
	LZMkZloLwG/RTuMlF6Yfe6Q5ViwAdT1q6bCdslCrMGYwTgGrcMZhgw9DcJzHQPGtj1yGEsXPdrB4X
	khmoCiPJTdrqEsLkG5Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixZX-0000000FJ3f-1F1d;
	Fri, 14 Feb 2025 15:25:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixPE-0000000FGh1-0BRq;
	Fri, 14 Feb 2025 15:15:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739546101;
	bh=1cUFcziT3zrnD+e35Cx7WF4WHOMgoKt3qtHlcGUUGnQ=;
	h=From:Subject:Date:To:Cc:From;
	b=JJHA0bKog9zGlUr7gL/WMoMeolufzIwP8ZGvn3AUoqgFT8um3Kdoa9j8QFsDRjMv+
	 OZOdXFEVUXsb1m9dadA+4DPzH9VsDVweFx3105N9PZLNL2VXChq+5UW0KrF2hpGQYD
	 Beql8elsN8f72k8rCxqPg9EMfJd/tc0o6MakV94fFXXw+3GS+bpwb/stOvUOoxE/Ky
	 VuMJIj+Amfbog5LIixjVRWOBV8FVn8so4LHO9pavtbDpACjFqxX4KHuqjxXOFdniGD
	 Dxne1f81sthen5pOSWhKOoBpahrI7K5u+xOd63jc7A9DTwCs5c1ZnMIlpVjE5ZNgKg
	 T7guYNRz4tWFw==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1003])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B46C317E0ECF;
	Fri, 14 Feb 2025 16:14:57 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH 0/3] Allow retrieving accessory detection reference on
 MT8188
Date: Fri, 14 Feb 2025 12:14:28 -0300
Message-Id: <20250214-mt8188-accdet-v1-0-6bbd5483855b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANRdr2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0MT3dwSC0MLC93E5OSU1BJdk5TUxKQkC1NTY5MUJaCegqLUtMwKsHn
 RsbW1ANH1iY9fAAAA
X-Change-ID: 20250214-mt8188-accdet-4deabb85534d
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Zoran Zhan <zoran.zhan@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_071504_238584_463B68F8 
X-CRM114-Status: UNSURE (   9.18  )
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

This series enables the MT8188-MT6359 sound driver to retrieve the
MT6359 ACCDET sound component from a mediatek,accdet DT property, which
allows detecting jack insertion/removal.

Patch 1 describes the new property in the binding. Patch 2 implements
the sound component retrieval in the common MTK soundcard driver. Patch
3 updates the MT8188-MT6359 sound driver to register the audio jack and
initialize the ACCDET driver for detection, if the property is present.

Tested on the Genio 700 EVK board.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Nícolas F. R. A. Prado (3):
      ASoC: dt-bindings: mediatek,mt8188-mt6359: Add mediatek,accdet
      ASoC: mediatek: common: Handle mediatek,accdet property
      ASoC: mediatek: mt8188-mt6359: Add headset jack detect support

 .../bindings/sound/mediatek,mt8188-mt6359.yaml     |  6 +++
 sound/soc/mediatek/common/mtk-soc-card.h           |  1 +
 sound/soc/mediatek/common/mtk-soundcard-driver.c   | 15 +++++++-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c          | 43 ++++++++++++++++++++++
 4 files changed, 64 insertions(+), 1 deletion(-)
---
base-commit: 7a6b5c348058d075ce0b20710f027a055d33a71d
change-id: 20250214-mt8188-accdet-4deabb85534d

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


