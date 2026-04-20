Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0000EA71B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 01:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yc1FugZaY46IwK/HWSYIPiIreX+Il0WMxb+5qIBk+hA=; b=dcfjBTbK8uZ0QtgRcDNY7sw0Bl
	rSlpTg1JPErI0ibCXhnA8mrbWeFHPWhZcKADzpOxlKUVt0Lsn9q0XzYyxUhm1EWtQNrYiPgGhaLxu
	QM+cA/gF2V9XgRMm1a6xO+0FsMHZBws43UdQDF/jbyR6Yphvk70C3e6oW9V8VMHgyov28nhgFFo1p
	AgmGYviBKitKV0l84/+Fwk7iXO0OPo2GDOPYLA0txzwG/J9/nEntI0e5SEzLA5z/sonVNym48xP8i
	YMpm2lU+vBW6KsgGbym4BpjZl+saOvgUEo9fusbnM50+6wcyQ60CLKG7ZEqkPxfD2mZuXgRa6TqQu
	XgAeeF1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEdCU-00000006Fja-1RNV;
	Mon, 20 Apr 2026 01:13:22 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEdCQ-00000006FiH-3l0m;
	Mon, 20 Apr 2026 01:13:20 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wEdC9-000000002Vw-0ur0;
	Mon, 20 Apr 2026 01:13:01 +0000
Date: Mon, 20 Apr 2026 02:12:56 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>, Cyril Chao <Cyril.Chao@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/9] ASoC: mediatek: mt2701: HDMI audio support
Message-ID: <cover.1776646435.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_181318_936986_8A5A9E85 
X-CRM114-Status: GOOD (  14.43  )
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

This series wires up on-chip HDMI audio on MT2701 and MT7623N, from the
DRM bridge down through the AFE into a small machine driver that binds
the AFE HDMI BE to the HDMI TX codec already exposed by the
mediatek-drm-hdmi driver. Bindings, DT and a BananaPi R2 board node
are included.

In order to survive vblank or late hotplug of the monitor, the fix
submitted separately [1] is required as well.

Everything here was developed for and tested on a BananaPi R2
(MT7623N), which turns ten years old this year -- a nice occasion to
finally land HDMI audio for a SoC which was truly ahead of its time.

[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/a3e22cbae528c9a38d854a586d1736b860998d41.1776265222.git.daniel@makrotopia.org/

Changes since v1:
 * Restrict the four HDMI clocks to mediatek,mt2701-audio only
   using an allOf/if/then conditional; MT7622 is capped at 34
   clocks (Krzysztof Kozlowski)
 * Fix subject prefix to use schema filename (Krzysztof Kozlowski)
 * Rewrite title and description to describe hardware, not driver
   (Krzysztof Kozlowski)
 * Clarify in commit message why this is a separate binding from
   mediatek,mt2701-audio (Krzysztof Kozlowski)
 * use named masks and explicitly set BIT_WIDTH_16 when
   programming AFE_HDMI_OUT_CON0 channel count (Mark Brown)
 * add AUDIO_TOP_CON3, AFE_HDMI_OUT_CON0, AFE_HDMI_CONN0,
   AFE_8CH_I2S_OUT_CON to suspend/resume backup list
   (Mark Brown)

Daniel Golle (9):
  ASoC: dt-bindings: mt2701-afe-pcm: add HDMI audio path clocks
  ASoC: dt-bindings: mediatek,mt2701-hdmi-audio: add HDMI audio output
    binding
  ASoC: mediatek: mt2701: add AFE HDMI register definitions
  ASoC: mediatek: mt2701: add optional HDMI audio path clocks
  ASoC: mediatek: mt2701: add HDMI audio memif, FE and BE DAIs
  ASoC: mediatek: mt2701: add machine driver for on-chip HDMI codec
  ARM: dts: mediatek: mt2701: wire HDMI audio path clocks into AFE
  ARM: dts: mediatek: mt7623: wire HDMI audio path clocks into AFE
  ARM: dts: mediatek: mt7623n-bananapi-bpi-r2: add HDMI audio machine
    node

 .../bindings/sound/mediatek,mt2701-audio.yaml |  23 ++
 .../sound/mediatek,mt2701-hdmi-audio.yaml     |  48 +++
 arch/arm/boot/dts/mediatek/mt2701.dtsi        |  21 +-
 arch/arm/boot/dts/mediatek/mt7623.dtsi        |  21 +-
 .../dts/mediatek/mt7623n-bananapi-bpi-r2.dts  |   7 +
 sound/soc/mediatek/Kconfig                    |  10 +
 sound/soc/mediatek/mt2701/Makefile            |   1 +
 .../mediatek/mt2701/mt2701-afe-clock-ctrl.c   |  22 ++
 sound/soc/mediatek/mt2701/mt2701-afe-common.h |   6 +
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c    | 293 +++++++++++++++++-
 sound/soc/mediatek/mt2701/mt2701-hdmi.c       | 114 +++++++
 sound/soc/mediatek/mt2701/mt2701-reg.h        |  35 +++
 12 files changed, 590 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt2701-hdmi-audio.yaml
 create mode 100644 sound/soc/mediatek/mt2701/mt2701-hdmi.c

-- 
2.53.0

