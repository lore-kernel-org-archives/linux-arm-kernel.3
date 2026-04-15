Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD442F43834
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 15:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uy98rZ0nWolXchTD8m5yvaBDG4+4G1NIqCUVcsrwcWE=; b=W9dGiOGad99hU4siIUkE5qiEqO
	DKkAssIzk48hsCw2DKcCPi/8e7xtvD32Y4HY8OuSSUk0qjSOnmGl0rLbUdc0FsDicKDHBjTq8aHSz
	nVa7+GMBACjA1bCFUGioNa3Sm3OTodnJZogC1zEarud+hZnWPRzZnPCyqEmYEHRq+bV1baclWhkiR
	xOkwUeVXEFrtl3IiNmtjXi0Q03dSJo/ejaKT/P955S/zBY+8NyFLCuTca0fZYBpvQ9rDD6e+C6fAH
	jlXtklG3Ile5FMAVp+48XyYX74TJon7Eq9CH82aC0lY9hRto5wXITL8BqcDBkeeap8OdAGMVvsWm0
	E0IEaVAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD25X-00000001JIf-22MI;
	Wed, 15 Apr 2026 15:23:35 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD25V-00000001JIG-1oJW;
	Wed, 15 Apr 2026 15:23:34 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wD25J-000000002dB-1dYA;
	Wed, 15 Apr 2026 15:23:21 +0000
Date: Wed, 15 Apr 2026 16:23:17 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/9] ASoC: mediatek: mt2701: HDMI audio support
Message-ID: <cover.1776265610.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_082333_493119_E12F506D 
X-CRM114-Status: GOOD (  12.54  )
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

This series wires up on-chip HDMI audio on MT2701 and MT7623, from the
DRM bridge down through the AFE into a small machine driver that binds
the AFE HDMI BE to the HDMI TX codec already exposed by the
mediatek-drm-hdmi driver. Bindings, DT and a BananaPi R2 board node
are included.

In order to survive vblank or late hotplug of the monitor, the fix
submitted separately [1] is required as well.

Everything here was developed for and tested on a BananaPi R2
(MT7623N), which turns ten years old this year -- a nice occasion to
finally land native HDMI audio for a SoC which was truly ahead of its
time.

[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/a3e22cbae528c9a38d854a586d1736b860998d41.1776265222.git.daniel@makrotopia.org/

Daniel Golle (9):
  dt-bindings: sound: mt2701-afe-pcm: add HDMI audio path clocks
  dt-bindings: sound: add mediatek,mt2701-hdmi-audio machine binding
  ASoC: mediatek: mt2701: add AFE HDMI register definitions
  ASoC: mediatek: mt2701: add optional HDMI audio path clocks
  ASoC: mediatek: mt2701: add HDMI audio memif, FE and BE DAIs
  ASoC: mediatek: mt2701: add machine driver for on-chip HDMI codec
  ARM: dts: mediatek: mt2701: wire HDMI audio path clocks into AFE
  ARM: dts: mediatek: mt7623: wire HDMI audio path clocks into AFE
  ARM: dts: mediatek: mt7623n-bananapi-bpi-r2: add HDMI audio machine
    node

 .../bindings/sound/mediatek,mt2701-audio.yaml |  10 +
 .../sound/mediatek,mt2701-hdmi-audio.yaml     |  47 +++
 arch/arm/boot/dts/mediatek/mt2701.dtsi        |  21 +-
 arch/arm/boot/dts/mediatek/mt7623.dtsi        |  21 +-
 .../dts/mediatek/mt7623n-bananapi-bpi-r2.dts  |   7 +
 sound/soc/mediatek/Kconfig                    |  10 +
 sound/soc/mediatek/mt2701/Makefile            |   1 +
 .../mediatek/mt2701/mt2701-afe-clock-ctrl.c   |  22 ++
 sound/soc/mediatek/mt2701/mt2701-afe-common.h |   6 +
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c    | 281 +++++++++++++++++-
 sound/soc/mediatek/mt2701/mt2701-hdmi.c       | 114 +++++++
 sound/soc/mediatek/mt2701/mt2701-reg.h        |  35 +++
 12 files changed, 564 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt2701-hdmi-audio.yaml
 create mode 100644 sound/soc/mediatek/mt2701/mt2701-hdmi.c

-- 
2.53.0

