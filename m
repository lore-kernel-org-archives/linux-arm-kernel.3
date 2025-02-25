Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66116C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OCqaPLwCBbPGacddWjtRWhsNvlVpHVJUUCrvPxyqut8=; b=jO/jib7220wht0
	FB02lIiTSX+44QTik0O+HFunC0o2WUXKBL1mmT5RUIuRTJAKqcLe3ruBS/6q5ZuaNsnI05HvSClZQ
	i6OAYuAzBYoFiazItODePZF43FNOM8sKs8YZmN5SjL+0mFUMoDgWqkM+OCNa6iocAhBCyul1QmVdy
	/mEKBly2PyW1dKuejSo1GUhPAgksMd7e3IzmY6JGatJRtGkML6sqNwqhEGkrkJZ8oKqpBW+Tt1EeG
	5Q0PSt8awcq4/Tr+xTkVHrz6GqW/7O1lKCqqvkg0RKzCr7OohpKqAL1HUwSKzsFj2D3tUrHaUslc7
	7MwX2BhhWPsRf7Jo/npg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxzG-00000000J4b-4483;
	Tue, 25 Feb 2025 16:40:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmw1X-0000000HXi7-1hRm;
	Tue, 25 Feb 2025 14:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740494101;
	bh=rqlDudHnuYgq9wewNcojaTJbeYRPypypRFN8oxFuEys=;
	h=From:Subject:Date:To:Cc:From;
	b=mieflFWpfr41xUm3kcgFxounly6rCgJ9vy95rvSTvxSxGuyZImksH2Ck3cNtX7Itg
	 I8MMTy/+7qkiMtnDKbUh92Jx5nZiGIvkJaG4O47Kz/+xYP9b60Hv6Epl32gbxmh069
	 ykIri/kV9y5eBIf/gTPgUXi0kl6LNz2x0ewG9Hrt1xPA14ODF9JmvbRlNoKOSKzGNA
	 8m8pr7l76ZkD41bpb+be72pfdIPs6QQcARVymDGVTG5Qaqgm29TitexDj9WuCw84h6
	 OeS+gMihRBIY9UIUtHZWN4oPXgR1N5oolrAk+O6zEv30kqX6XOgDOlLlcL0vMDzYZT
	 RKXODWXBcc6+Q==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1004])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F277B17E0DB7;
	Tue, 25 Feb 2025 15:34:56 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH v2 0/8] Enable DMIC for Genio 700/510 EVK
Date: Tue, 25 Feb 2025 11:33:46 -0300
Message-Id: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMrUvWcC/3XMQQqDMBCF4avIrJsyRoy2q96juIiTUQfUSFJCi
 3j3pu67/B+8b4fIQTjCvdghcJIofs2hLwXQZNeRlbjcoFHXqMtWjbyKbxCVW4SUI8N8c4SmaiF
 /tsCDvE/v2eWeJL58+Jx8Kn/rPymVCpXpydSVswaH5kF+nm3vg72SX6A7juMLnKzYQK4AAAA=
X-Change-ID: 20250218-genio700-dmic-dc6ee9dc0638
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 parkeryang <Parker.Yang@mediatek.com>, Zoran Zhan <zoran.zhan@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_063503_602843_DA46950A 
X-CRM114-Status: GOOD (  13.19  )
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

This series enables the dual digital microphones present on the Genio
700 and 510 EVK boards.

Patches 1 and 2 add some required clocks, patch 3 changes volatility
handling of some registers to prevent issues, patch 3 adds the DMIC DAI
driver for MT8188 and updates the AFE with its routes, patch 4 adds the
DMIC backend and widget to the mt8188-6359 machine sound driver, patch 5
adds the audio routes for the DMIC to the Devicetree, patch 6 adds
DMIC_BE in the dt-binding and patch 6 assigns a wakeup-delay-ms to the
DMIC DAI.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Changes in v2:
- Reordered clocks in patches 1 & 2
- Split DMIC_GAINx_CUR volatile configuration into its own patch (3)
- Squashed patch "ASoC: mediatek: mt8188: Support DMIC in AFE" into
  "ASoC: mediatek: mt8188-mt6359: Add DMIC"
- Patch 4 ("ASoC: mediatek: mt8188: Add support for DMIC"):
  - Performed the many cleanups suggested on v1 for code style and
    removing redundancy
- Added patches 5 and 6 to add wakeup-delay-ms to the dmic
- Link to v1: https://lore.kernel.org/r/20250218-genio700-dmic-v1-0-6bc653da60f7@collabora.com

---
Nícolas F. R. A. Prado (7):
      ASoC: mediatek: mt8188: Add audsys hires clocks
      ASoC: mediatek: mt8188: Add reference for dmic clocks
      ASoC: mediatek: mt8188: Treat DMIC_GAINx_CUR as non-volatile
      ASoC: mediatek: mt8188-mt6359: Add DMIC support
      arm64: dts: mediatek: mt8390-genio-common: Add routes for DMIC
      ASoC: dt-bindings: mediatek,mt8188-mt6359: Add DMIC backend to dai-link
      arm64: dts: mediatek: mt8390-genio-common: Add delay codec for DMIC

parkeryang (1):
      ASoC: mediatek: mt8188: Add support for DMIC

 .../bindings/sound/mediatek,mt8188-mt6359.yaml     |   1 +
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     |  21 +-
 sound/soc/mediatek/mt8188/Makefile                 |   1 +
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c         |   8 +
 sound/soc/mediatek/mt8188/mt8188-afe-clk.h         |   8 +
 sound/soc/mediatek/mt8188/mt8188-afe-common.h      |   1 +
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c         |  28 +-
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c      |   4 +
 sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h    |   4 +
 sound/soc/mediatek/mt8188/mt8188-dai-dmic.c        | 682 +++++++++++++++++++++
 sound/soc/mediatek/mt8188/mt8188-mt6359.c          |  14 +
 sound/soc/mediatek/mt8188/mt8188-reg.h             |  17 +-
 12 files changed, 782 insertions(+), 7 deletions(-)
---
base-commit: 253c82b3a2cec22bf9db65645f934fbe095899a3
change-id: 20250218-genio700-dmic-dc6ee9dc0638

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


