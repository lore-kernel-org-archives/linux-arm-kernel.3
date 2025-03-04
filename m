Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4F5C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 21:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4CWGFjVhOpMP2q2YFrzNEc70aY3Ks6YYocmWlhuEMNs=; b=vSSZqgj9Pi81l3
	2w+2IlKt22yPaMkw8zTD/QtP/AWFPXaXstnTAiblTx994PFEeA6sEq1umpxCke989200fDQMlRmnw
	Kvoff4pSnr+MOgDM5fb+GZDHaD/gDMGZnocv2E1yiN+shplH3H5a+Dv0e8zFkeLmadwmEW2EsQYw9
	jpiEr/Chd+nwe97/Z7w8+eU4gDGs3FpONwYOvoPhbkGJyKXt1wcdVv+xfUdo0AMHNSEnTXc8tlGky
	bWD/A8w8L3sl04jtE1kY34oV+XYUvkCyo+kZPr40/hTLhZwPDrvBijsRSmNpYNO0ul9Z74JADHCuC
	7EDwUy0ZrsagwLvTlv+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZxI-00000006JUd-3cYr;
	Tue, 04 Mar 2025 21:37:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZvi-00000006JFr-215M;
	Tue, 04 Mar 2025 21:36:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741124156;
	bh=6Bc7g4mKArhcl6kXe95ybV+LNzHSc7Zsr7451OcuWLY=;
	h=From:Subject:Date:To:Cc:From;
	b=iWVWc1gj0oidP3d8c6SPfKkJ2A5uSWUUU9U095jDfR+GjEzusAcOqGNJhjLGXbeg3
	 /NKOt7hJ9awU/+/Rt3budT5uf8iNdUF8sob0ppjb/4/WwcR4iYsB0MUlAYGsNLp1W0
	 P7/vG+suixChc5YWbKaYMI4cp44iFUiZ3q0iiU3e22O7iJNnfr7e9DV6wKSkNUQibq
	 daXaAZPYLOJGlUIluYVXRq8f5l5N2vV4/OSv65j0a8W8QIqr1rdjgmuVMCKG0tE7Uc
	 y31yE9tI1KDYOd69NBp/j0CAWVBFEWgzRX9fZgzwepaJA2z/KbLNhWj1Xh5lM3VnFh
	 iCacrWb4vDlsA==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 46EFE17E088C;
	Tue,  4 Mar 2025 22:35:52 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH v2 0/3] Allow retrieving accessory detection reference on
 MT8188
Date: Tue, 04 Mar 2025 18:35:35 -0300
Message-Id: <20250304-mt8188-accdet-v2-0-27f496c4aede@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACdyx2cC/3XMSw7CIBSF4a00dywGKBjiyH2YDnhc7U3aYoAQT
 cPexc4d/ic53w4ZE2GG67BDwkqZ4tZDngbws92eyCj0Bsml5lIothYjjGHW+4CFqYDWOaP1qAL
 0zyvhg96Hd596z5RLTJ+Dr+K3/pOqYJxdnAtambGD7ubjslgXkz37uMLUWvsCB8HLMa4AAAA=
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
X-CRM114-CacheID: sfid-20250304_133558_685283_8BA96F4C 
X-CRM114-Status: GOOD (  11.65  )
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
Changes in v2:
- Added CONFIG_SND_SOC_MT6359_ACCDET select in
  CONFIG_SND_SOC_MT8188_MT6359 to avoid build failure
- Clarified in mediatek,accdet dt-binding and commit description that
  the property should only be present if the accdet is actually used
- Link to v1: https://lore.kernel.org/r/20250214-mt8188-accdet-v1-0-6bbd5483855b@collabora.com

---
Nícolas F. R. A. Prado (3):
      ASoC: dt-bindings: mediatek,mt8188-mt6359: Add mediatek,accdet
      ASoC: mediatek: common: Handle mediatek,accdet property
      ASoC: mediatek: mt8188-mt6359: Add accdet headset jack detect support

 .../bindings/sound/mediatek,mt8188-mt6359.yaml     |  8 ++++
 sound/soc/mediatek/Kconfig                         |  1 +
 sound/soc/mediatek/common/mtk-soc-card.h           |  1 +
 sound/soc/mediatek/common/mtk-soundcard-driver.c   | 15 +++++++-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c          | 43 ++++++++++++++++++++++
 5 files changed, 67 insertions(+), 1 deletion(-)
---
base-commit: 20d5c66e1810e6e8805ec0d01373afb2dba9f51a
change-id: 20250214-mt8188-accdet-4deabb85534d

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


