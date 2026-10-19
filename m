Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5D5CCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deOppFeydKzw0+yILTrtXYZ1PYcVSBm6AiEBoif93gI=; b=UqaNOBeGTuSk6SAELDM1bzbfHu
	vTXZOugDaxwhIfW2WwP6oAzj94wFGu8NOhL4Iz0gxfd+5oDEL5dv+rAMsWUG2xQq9VQKTNFSR7RAu
	Py0Mb3BQwQ7xDMxRnbglUiTvjG+oVwd6YbIHX92PWBYiX3I/qjh8UgNARABZiGqeb8lwBXOgJ4qRh
	21MYOa/65QyMBbrkppb/y2d0ERtyVUgyNHu87vbrfPDUIC2Iy/DJtJiv/ReiRSKXH8PsLoEcuvAol
	BxfYYztTY1RIj4hRBxoYwKagBnPdyGvJhRz7paS3ZfZKDDbe6IqcmacKI1H2p6Nckl+9QDVzYLaH2
	4ZTcHjuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIj89-00000006usv-3YeZ;
	Mon, 19 Oct 2026 08:54:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIj89-00000006usd-0o5C;
	Mon, 19 Oct 2026 08:54:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D42D601DB;
	Mon, 19 Oct 2026 08:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ABD81F000C4;
	Mon, 19 Oct 2026 08:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792400044;
	bh=deOppFeydKzw0+yILTrtXYZ1PYcVSBm6AiEBoif93gI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bUTpvRewgEZ03yMjzvH2QCsI5DzsapK6kjzNUurje84l1cm+lOD6KgigKLw7YnyEK
	 sBtDeRmMeyvMUWt11tgVnAsFxPsZs8yrG2ftACdfiLe1M2xPX1h/rrW3i0Z16r0oDn
	 fFdCPxPUom0VseerOYR90OtWOmk2SrgkT1zfqBE18xBqr6t+XRAEalqJCt1FMsWDCr
	 ZhbRf1Mmt2K0dzHs4tIdlBa4Rmw/TKuKWfM3urkY/8XRLBuyStn4WGAUh8YNrLrX5K
	 mo4jMpprjgN+jGmY3EYqVxHmSBkDePyGLOuLd9L7wi16aQo4Dw4KktGNIdSKB5x6kV
	 YKjhowKZci9bQ==
Date: Mon, 19 Oct 2026 10:54:01 +0200
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
Subject: Re: [PATCH v3 02/21] ASoC: dt-bindings: cs42l42: Document additional
 dai-common properties
Message-ID: <20261019-overjoyed-outgoing-wren-4fdcc7@quoll>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
 <20261018-macaudio-v3-2-abdff7741dea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261018-macaudio-v3-2-abdff7741dea@gmail.com>
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

On Sun, Oct 18, 2026 at 03:53:56PM +1000, James Calligeros wrote:
> We may need to define both #sound-dai-cells and sound-name-prefix on some
> machines where this codec is part of a simple DAI. Document them with
> reference to dai-common to keep the style checker happy.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/cirrus,cs42l42.yaml   | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> index ab4c7d22dc0e..aba2121ac64a 100644
> --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> @@ -9,6 +9,9 @@ title: Cirrus Logic CS42L42 audio CODEC
>  maintainers:
>    - patches@opensource.cirrus.com
>  
> +allOf:
> +  - $ref: dai-common.yaml#
> +
>  description:
>    The CS42L42 is a low-power audio codec designed for portable applications.
>    It provides a high-dynamic range, stereo DAC for audio playback and a mono
> @@ -26,6 +29,10 @@ properties:
>        The I2C address of the CS42L42.
>      maxItems: 1
>  
> +  '#sound-dai-cells': true

Instead const.

> +
> +  sound-name-prefix: true

And drop this one.

Best regards,
Krzysztof


