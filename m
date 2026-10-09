Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADF4CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 07:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ev/NmiRklbf7MpR6x3GqJ6NVg6ju9b3tRe0belW+GrQ=; b=hipxByTyW7/3jKpuxceHcBzCsH
	raAfeLT52hXjW6slBjJTzKq9+tzuYxEYVs0tTvAkxWwqZxfv9mgw5Ha1lJy/ZDQabuGZRn17sxEak
	sdUIrGy1s7h8aw4XpN+RPKcWEJfp6TSay+6byhLQ7qg/UifzSZ1hJ+PqnqE+a0cSosvRf1f5W1cyN
	+0HPjGbLLy+ZtmAI1uSc2LHrY/uOKq6ykwasgKk9BQuJ+hZsJWmlMZtfoG983QTDOAGsljcQ8oDis
	dc+4r+Lu+wsyDIwhEWQaC56E7QJJlg6xE2gFIH9IWLEzMeY5NuY2Kmq/UV1QQTVKitex4c2gTxRZ/
	TVHEjSQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4lk-00000005h7p-1pkm;
	Fri, 09 Oct 2026 07:11:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4li-00000005h6o-0q2r;
	Fri, 09 Oct 2026 07:11:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 79E4E602C3;
	Fri,  9 Oct 2026 07:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D48A1F00893;
	Fri,  9 Oct 2026 07:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791529909;
	bh=ev/NmiRklbf7MpR6x3GqJ6NVg6ju9b3tRe0belW+GrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JBLCCVARNQZjCVwaKE7AvOVM94/5/weCbcxR8bc5UFMLbCNAcLT/fTp5h4pbn08qW
	 8NJd5dgSEgtr/9G4nUmxjnOXqgjKeMErK1T6cw8RuntpPSkJfW7bCflwQHvlLCrNj+
	 HLkBOizDCX2+nPGTiS4yf+j+J3HmG7eqDZBTkY6F+/Cd4Ki/+4/qQW14Aaihkln3J5
	 oK5ea3QtI+UtDG9k3NIF9Ktot8Bw0NTAM+gIubWxSzyNCDEY/BYS6//6abYBBWftwj
	 hwf28Ds5v+9ZRTA+vi7WXeJTX9u28mGwkRFX8zcWjjNowUVW82JDXNc1i+3xX4NZzN
	 BzGF1rBnZSEEQ==
Date: Fri, 9 Oct 2026 09:11:46 +0200
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
Subject: Re: [PATCH v2 04/21] ASoC: dt-bindings: cs42l42: Document
 sound-name-prefix property
Message-ID: <20261009-festive-able-nautilus-b92ffd@quoll>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-4-7b47ed6335a8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004-macaudio-v2-4-7b47ed6335a8@gmail.com>
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

On Sun, Oct 04, 2026 at 04:03:31PM +1000, James Calligeros wrote:
> Some consumers may wish to prepend the codec's name with a known value
> to identify a specific codec among many. Enable this with the common
> sound-name-prefix property.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/cirrus,cs42l42.yaml   | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> index bc759eaadeca..035463be1456 100644
> --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> @@ -29,6 +29,9 @@ properties:
>    '#sound-dai-cells':
>      const: 0
>  
> +  sound-name-prefix:

No. You reference respective schemas.

> +    $ref: component-common.yaml#/properties/sound-name-prefix

git grep 'properties/sound-name-prefix'

You cannot find such code. This should give you a hint, that you are
doing something odd.

Best regards,
Krzysztof


