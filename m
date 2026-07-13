Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFDAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GOk+q11iQ5FGQBuFxsE6IN4gWGVpyDYBHJev4U8yed0=; b=K3VK5Z5lPDO1V5fLUy9LAvR//C
	v52whG6PzpMo/cJ0xd1/hltLp/ZeWHAO7iIN8Z7pRLqOnzBj55ioS4jMSYs+Vxc/avHQY7XkIDtca
	MhD93RcMV1zZKcbCFTCkNCRB+l8h2HoP1uMnZc/zyjbgflnCvvZk2Uu1Q4S/c0Owtutft7np4Y8QL
	7ioe19A0xwSrLhwk64nrEPgz4s/2aYwiG5V7QKUYxIcHxCZtbhvI31mUTvoIsX/uTuGIJ5iL51RAs
	XwWua4qwLUcGF9C+wgJim43WW41B4+YPx4FdS+hzcQYzWQamVBQHvr6UpmP9lfheNnRQBzRs/Tal4
	chOgIVuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBFA-00000008Sp5-3348;
	Mon, 13 Jul 2026 07:38:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBF7-00000008Snd-00x3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:38:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7207B60018;
	Mon, 13 Jul 2026 07:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F012D1F000E9;
	Mon, 13 Jul 2026 07:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783928300;
	bh=GOk+q11iQ5FGQBuFxsE6IN4gWGVpyDYBHJev4U8yed0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nHWAWU/T/RjmHrkeBuNNuw4Fm2S1sV9R8mVbQaQHKt5VV9K0aBrVtw6RRNTp1pL5U
	 Zt93F+0hre/OlRuaUiufTQMn2oF8+Vz6u7Q/+vULhZ8g9XuL3EG7eeCJaqNfF8iZ4B
	 aHD61SlT8ANBLuhopVlpXfMxSr5iJ77+tMF6AKKvR7MPOzbWxm/fAi65xuE7v6aEXb
	 ZvU2mgtRzEt1HqR45Os8kHacCV0hSYVOCle4J124zCcgsqK1SVGA86/cmyjphf2dVC
	 RH6Wson/gX8TOm9uMqGT+fo9/3dtti7weq6QO6SLPKX3rZcJ4h8OADMDvD7BUFoXmb
	 QwS8CDtLjZHlw==
Date: Mon, 13 Jul 2026 09:38:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Grond <grond66@riseup.net>, Stefan Leichter <sle85276@gmx.de>, 
	Grazvydas Ignotas <notasas@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andreas Kemnade <andreas@kemnade.info>, 
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Sen Wang <sen@ti.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Niranjan H Y <niranjan.hy@ti.com>, letux-kernel@openphoenux.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, kernel@pyra-handheld.com, 
	mfd@lists.linux.dev
Subject: Re: [PATCH 07/16] ASoC: dt-bindings: add TI PCM1773
Message-ID: <20260713-abiding-jumping-ape-7ce8ff@quoll>
References: <cover.1783749722.git.hns@goldelico.com>
 <a02383ea5907a677f4c61066d423efde2b9de48b.1783749722.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a02383ea5907a677f4c61066d423efde2b9de48b.1783749722.git.hns@goldelico.com>
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

On Sat, Jul 11, 2026 at 08:01:54AM +0200, H. Nikolaus Schaller wrote:
> PCM1771/3 is a simple audio codec that can be enabled through an
> enable-gpio.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  .../devicetree/bindings/sound/pcm1773.yaml    | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/pcm1773.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/pcm1773.yaml b/Documentation/devicetree/bindings/sound/pcm1773.yaml
> new file mode 100644
> index 0000000000000..f3e640705bf70
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/pcm1773.yaml
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/sound/pcm1773.yaml#

You need to use latest existing bindings as starting point and test your
code.

Best regards,
Krzysztof


