Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA33CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 07:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bxYgc+BIWyTHTpIoYsKHTtIpwISik8NaCfsLHWZJJE=; b=GZUotewfFG8h6dpINoioxWq6UR
	7enbmwDhAOgdBar+qSlXHS+9k/TPB5HuIRu2RwANfjM7Z0IBtqbS1hkkgepdbpcpgtA0hk764hI/t
	OhKuARVfqK9+idI4BLaf6FWjUfyskFj5QIPl4LWzHVBA6Dhik91uDe2eqOF9DJ3FXqU7Tw47UrzH7
	/IjdbsJCA2+7QSIHRtBQQDXmIyrHX5z92cZ+onQ6sG6qkIAXFebZnB9j6LLLBddUHM1WP3O0KESl7
	DTQbTKb62Rjq7Dx2LokBDfrYu/2xHbZ02Xjec0m9ergPyVvPpYW43YLPYuZzFJfjaRcud+67eEIO0
	lP9PNdew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4jE-00000005gk1-2QIP;
	Fri, 09 Oct 2026 07:09:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4jD-00000005gjf-3NF0;
	Fri, 09 Oct 2026 07:09:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 49FC143670;
	Fri,  9 Oct 2026 07:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2451F000FF;
	Fri,  9 Oct 2026 07:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791529755;
	bh=/bxYgc+BIWyTHTpIoYsKHTtIpwISik8NaCfsLHWZJJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=avLoLWDSeATNSyKLU6aWZlJTBy1To5PXYpH2ocPDV3UNfsGGrvHtgYIl0GJHlIALv
	 rJrpi1OFqokCT06+NXJFsC9HBjo43n084vwduZvy8//hW8e9DdXmYpZgJZDJ0s3vhZ
	 E4qHkdvH11SHh2eyDUXEr3eOXbiR5fKPvr+8FrTF9UG4aCG5GEO1i7J7IcwVgEMwWl
	 F8g0ihEihi0kXLrCRECgANDv0Y6JmUi0qujNG2jf3xJJiKMYEkmzxltxhi8t5xNHPj
	 +16x0WapHBldX0OAOdoZ683THeQnkE/ZXEvLVbaD8o7QA2mVbRC7Yf2WMdvHRCmhbZ
	 nE8XtVOT3yW2g==
Date: Fri, 9 Oct 2026 09:09:11 +0200
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
Subject: Re: [PATCH v2 01/21] ASoC: dt-bindings: cs42l84: Document
 sound-name-prefix property
Message-ID: <20261009-kind-crouching-sparrow-1bcd94@quoll>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-1-7b47ed6335a8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004-macaudio-v2-1-7b47ed6335a8@gmail.com>
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

On Sun, Oct 04, 2026 at 04:03:28PM +1000, James Calligeros wrote:
> Some consumers may wish to prepend the codec's name with a known value
> to identify a specific codec among many. Enable this with the common
> sound-name-prefix property.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/cirrus,cs42l84.yaml   | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> index 94062c1d9d45..2637aa5f4326 100644
> --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> @@ -32,6 +32,9 @@ properties:
>    '#sound-dai-cells':
>      const: 0
>  
> +  sound-name-prefix:
> +    $ref: component-common.yaml#/properties/sound-name-prefix

That's a codec device, so why aren't you just using dai-common.yaml
($ref) like others?

Best regards,
Krzysztof


