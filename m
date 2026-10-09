Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3095CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 07:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cbqcw/ZcJpAS2N0wcQ+lROnRhzGRuCryFX/mxseCRCo=; b=dKEDcPl6zLdHI/wO6mRlHc+3nh
	1vh9cf+L4I8pKmMJpv/7Mie/gz1xBKEDw7SE1mJLG1p+w16zA3BcBn6fP9+DLxxEXwZ3r4PKbsM2l
	IzKd3A8pAiBZeDBxPyiUE4wHUGrbL1Kq5OFQ+9dCt7aUQMmgBpsaQ1RQ7SIPZVZJm8bc2n4G3TpeS
	pJstWby4C9OjZr+bebG1aNKK1jcHbd1z48uGpU4UZ3KHu8f7FHdXX2RoDUOxE14yxr9Bvta6qsapD
	N5a3K0UsxHkCA+Ek+S7Km2IOoEhZ6JnmYWPAxvFpNdcbe3hCthmpcyJ2DuvomxHDwo2uf0R/Dv+mw
	TdZaFIoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4kk-00000005gyE-47sx;
	Fri, 09 Oct 2026 07:10:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4kj-00000005gxL-1Hzv;
	Fri, 09 Oct 2026 07:10:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 73F57602C3;
	Fri,  9 Oct 2026 07:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 665D61F000FF;
	Fri,  9 Oct 2026 07:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791529848;
	bh=Cbqcw/ZcJpAS2N0wcQ+lROnRhzGRuCryFX/mxseCRCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KpmbKJJ3kS+Y4PM3xApljYc4t4pcQ2/wqbIzf0sWre1HvkdbkCqmep6MNmZYSxNph
	 aB9hRUL7q01A0DMzkD+Bo8lZi6ImwTQhKJLlLkdmrnQ6kdyWO683Ya9Rl0+YSv7YgI
	 BFBO/Jhh188Ty66vLgC4SS87vdG7IzMCLYubwyvGJ4TLC1nPwytaPh2liXYESYypFJ
	 lh7QK6dao5n9RDwk9/Z6EyzBDsA9BSSSxWsW9rCBqUqeGtU5oXt3Ztxw73kcl2hX8S
	 msGxSCdsYFZjOjxCifUC/IXQIQCRLRdWsdpAQhPLb+3g4BKE9UYgGMIYtKmennE+II
	 VYTV59atDvz3A==
Date: Fri, 9 Oct 2026 09:10:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 03/21] ASoC: dt-bindings: cs42l42: Document
 #sound-dai-cells property
Message-ID: <20261009-daft-raspberry-woodpecker-a88efd@quoll>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-3-7b47ed6335a8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004-macaudio-v2-3-7b47ed6335a8@gmail.com>
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

On Sun, Oct 04, 2026 at 04:03:30PM +1000, James Calligeros wrote:
> We may need to define #sound-dai-cells on some machines where this
> codec is part of a simple DAI. Document this property to keep the style
> checker happy.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/cirrus,cs42l42.yaml   | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> index 6c100cb36699..bc759eaadeca 100644
> --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> @@ -26,6 +26,9 @@ properties:
>        The I2C address of the CS42L42.
>      maxItems: 1
>  
> +  '#sound-dai-cells':
> +    const: 0

So a DAI? Then just like for every codec you need dai-common.yaml.

Best regards,
Krzysztof


