Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7928C369C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 08:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pgz/ITbfkZSN0vK7zINoFs1WSTDtBwDQ4q5LKkyjsCc=; b=jzblD6DG+sivqx
	debTEAu7Pa/3uerF+JePlWrIzn0yjNOQJl4WxJP7KZxK/hVoDiGeUYS2Cgn2IM+YHH3FUYqplSLfI
	poESglapnwbU8c6zyZasNq9RB5d+WNk+jfMzuwwGo3o49c1QlzQKLPMl8KClsuJhHTqKAewYv/asO
	P0Z+JKwttyJ2ptSIkvZuJGthAmKugfAUAKBXjCpNKeLgojChZiCFpV8NUf/r6V7Ebg0BbfYDnj1lX
	47C7pRC88HYp340tp5Ad0Feh4TLiYJJ5wRPwwOKGHYEXi9btTs+UzjmgQVPv+tAe1h05BYow3KOba
	RYC8WMJ8sY9bs6v2ezAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5L1b-0000000CLgD-0ukp;
	Thu, 17 Apr 2025 08:55:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KrN-0000000CJdS-3f8d;
	Thu, 17 Apr 2025 08:44:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744879475;
	bh=oaWT++y0OSwcpZmlTIyBCOuZGKUE0+SBgo9PMt1ddV8=;
	h=From:Subject:Date:To:Cc:From;
	b=b9+tPYR8aGgbxYUPn0moeEHifiE7zSORuK2Yf9fXzymoNjorIS2ecYwnPGyQ93b4f
	 +PwYbftaWJIX+e+UTbRXdp+e377R8x94BbilGEvdgxtsCIvvb/jOtX8cn5eO/Oekwt
	 FnBDcvRNq5k5gQV95VKiDh/aohIOz16yewFotG7do+JxXmO0xtX9Fq4tXdI9yWKq1/
	 xMEDRmlThS5IGYRbobFC49XGx1/n9afyA6ftJLxObZLwEisMGHts69IZMJFR+cHkO/
	 E/Vbkamu0AwKyPxfklhMyHQPpF8acheWSxP9eh3vj3L0m5XBsfZ/YCje9+fn53UurL
	 73R2cCXueTAkA==
Received: from apertis-1.home (2a01cb0892F2d600c8f85Cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ACE6317E0FA7;
	Thu, 17 Apr 2025 10:44:34 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 0/6] ASoC: mt8195: Add support for MT8395 Radxa NIO 12L
 with MT6359 codec
Date: Thu, 17 Apr 2025 10:44:31 +0200
Message-Id: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG+/AGgC/x3MTQqAIBBA4avErBsw7f8q0cJyrFmUoRWBdPek5
 bd4L0IgzxSgzyJ4ujmw2xOKPIN51ftCyCYZpJCVKIsGt7NVXYX6MuwwOIuT1nKuZSuUsZCyw5P
 l518O4/t+lwsrSGIAAAA=
X-Change-ID: 20250417-mt8395-audio-sof-baa2c62803df
To: kernel@collabora.com, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_014438_065647_F533AB70 
X-CRM114-Status: GOOD (  10.64  )
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

This patch series adds support for audio playback on the MT8395-based Radxa NIO 12L platform, which uses the integrated MT6359 codec via internal DAI links.

Key additions:
- Support for a new `mediatek,mt8195_mt6359` card configuration that does not rely on external codecs like rt5682.
- Proper memory region declarations and pinctrl setup for the audio front-end (AFE) and audio DSP (ADSP).
- A device tree sound node for headphone audio routing using `DL_SRC_BE` and `AIF1`.
- Enhancements to the DT bindings to document the new compatible string, missing link-name, and additional audio routes (Headphone L/R).

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Julien Massot (6):
      ASoC: mediatek: mt8195: Move rt5682 specific dapm routes
      ASoC: mediatek: mt8195: Set ETDM1/2 IN/OUT to COMP_DUMMY()
      ASoC: mediatek: mt8195: Add mt8195-mt6359 card
      ASoC: dt-bindings: mt8195: add compatible mt8195_mt6359
      ASoC: dt-bindings: mt8195: add missing audio routing and link-name
      mt8395-radxa-nio-12l: Add sound node for headphone

 .../devicetree/bindings/sound/mt8195-mt6359.yaml   |  4 ++
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 58 +++++++++++++++++++++-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c          | 39 ++++++++++++---
 3 files changed, 92 insertions(+), 9 deletions(-)
---
base-commit: f660850bc246fef15ba78c81f686860324396628
change-id: 20250417-mt8395-audio-sof-baa2c62803df

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


