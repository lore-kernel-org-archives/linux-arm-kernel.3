Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067B1C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 17:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZVgReaUfn2E3fhb5vOZDFlJ7sepGg+S1zqiaGsC9lQ4=; b=e+B8Ur6Og7vVchzplWeam2U93Y
	E9Haf1sEYwxJc7UWNIiypfYel1HUppP3cLAY32dxVI92nHTPirrIF0qqW7CpwN/FqYBcj6759BWI5
	jqPBENaocfPK6RcUzbe60l+QOT6g+7Kpjqf9g5bhCySgQC/1NteZxDb6x66oMJR5WwG2kqknW3D+c
	LAnw+k+3xctsIO/a2uNwPTdLXMZmnWf9v+b2rbRpwS2DpT3SvgkUyDhYz7dHQNAEmpSXdW9KAza3x
	ar1C7E97p5b4viw0WPiRCq7sN407KD+iXcGEFKR1RJxG1b5PrjxxPnaDDUzNH4fmXzgfnc770SfJf
	i/SO9hbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhtrL-00000006a54-353c;
	Fri, 01 Aug 2025 17:47:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhtZQ-00000006Y1b-2ROF;
	Fri, 01 Aug 2025 17:29:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 40EEE4520F;
	Fri,  1 Aug 2025 17:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02601C4CEE7;
	Fri,  1 Aug 2025 17:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754069368;
	bh=TBkkPKc1Q2DCv6oh7uffu650yB18FKQPULUE/jWL2k8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OEj/akWUrDhhwwplQQrtiQSjgUCOd4YXvx/D2nKg5VGPrA60zvMZwECqgKQkGBxyQ
	 EfK84ciMm8GUlcaYqknaR7zEJ5OehHJa+qG3dAwcGLC84gLxkccZ2o8MTqXUKBIRwt
	 MJqpjlVNi/yrMtqXHkoU7rTBVvDLi+b8IcuqAL/AiblLRal+XjWGgbs6LJs3T8G+E4
	 cKNyng8LM7uXzjbgweO/ECWDKRR7On0BxvB0NsggwlyXvTMl1FcyPLYmfajUaBxDW5
	 gJGXjnkorqJoF6vHx4oTUqNsj0Hz3iJYFKzQyLfrWNamHY3wCgFPYdmNLfwInOF26A
	 VEnHcDQSjgs+Q==
Date: Fri, 1 Aug 2025 12:29:27 -0500
From: Rob Herring <robh@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ikjoon Jang <ikjn@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <jmassot@collabora.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 6/9] ASoC: dt-binding: Convert MediaTek mt8183-mt6358
 bindings to YAML
Message-ID: <20250801172927.GA3114452-robh@kernel.org>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
 <20250801-mtk-dtb-warnings-v1-6-6ba4e432427b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-mtk-dtb-warnings-v1-6-6ba4e432427b@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_102928_662692_BA03014D 
X-CRM114-Status: GOOD (  21.47  )
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

On Fri, Aug 01, 2025 at 01:18:08PM +0200, Julien Massot wrote:
> Convert the existing text-based DT binding for MT8183 sound cards using
> MT6358 and various other codecs to a YAML schema.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../sound/mt8183-mt6358-ts3a227-max98357.txt       | 25 ---------
>  .../devicetree/bindings/sound/mt8183-mt6358.yaml   | 59 ++++++++++++++++++++++

mediatek,mt8183_mt6358_ts3a227.yaml

>  2 files changed, 59 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
> deleted file mode 100644
> index ecd46ed8eb98b99d0f2cc9eeca5f6d0aef6a5ada..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -MT8183 with MT6358, TS3A227, MAX98357, and RT1015 CODECS
> -
> -Required properties:
> -- compatible : "mediatek,mt8183_mt6358_ts3a227_max98357" for MAX98357A codec
> -               "mediatek,mt8183_mt6358_ts3a227_max98357b" for MAX98357B codec
> -               "mediatek,mt8183_mt6358_ts3a227_rt1015" for RT1015 codec
> -               "mediatek,mt8183_mt6358_ts3a227_rt1015p" for RT1015P codec
> -- mediatek,platform: the phandle of MT8183 ASoC platform
> -
> -Optional properties:
> -- mediatek,headset-codec: the phandles of ts3a227 codecs
> -- mediatek,ec-codec: the phandle of EC codecs.
> -                     See google,cros-ec-codec.txt for more details.
> -- mediatek,hdmi-codec: the phandles of HDMI codec
> -
> -Example:
> -
> -	sound {
> -		compatible = "mediatek,mt8183_mt6358_ts3a227_max98357";
> -		mediatek,headset-codec = <&ts3a227>;
> -		mediatek,ec-codec = <&ec_codec>;
> -		mediatek,hdmi-codec = <&it6505dptx>;
> -		mediatek,platform = <&afe>;
> -	};
> -
> diff --git a/Documentation/devicetree/bindings/sound/mt8183-mt6358.yaml b/Documentation/devicetree/bindings/sound/mt8183-mt6358.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..a50dc109e8f307cfb08504a9143a178e880266c9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8183-mt6358.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt8183-mt6358.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8183 sound card with MT6358, TS3A227, and MAX98357/RT1015 codecs
> +
> +maintainers:
> +  - Julien Massot <julien.massot@collabora.com>
> +
> +description:
> +  Binding for MediaTek MT8183 SoC-based sound cards using the MT6358 codec,
> +  with optional TS3A227 headset codec, EC codec (via Chrome EC), and HDMI audio.
> +  Speaker amplifier can be one of MAX98357A/B, RT1015, or RT1015P.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8183_mt6358_ts3a227_max98357
> +      - mediatek,mt8183_mt6358_ts3a227_max98357b
> +      - mediatek,mt8183_mt6358_ts3a227_rt1015
> +      - mediatek,mt8183_mt6358_ts3a227_rt1015p
> +
> +  mediatek,platform:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the MT8183 ASoC platform node (e.g., AFE).
> +
> +  mediatek,headset-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the TS3A227 headset codec.
> +
> +  mediatek,ec-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      Optional phandle to a ChromeOS EC codec node.
> +      See bindings in google,cros-ec-codec.yaml.
> +
> +  mediatek,hdmi-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Optional phandle to an HDMI audio codec node.
> +
> +required:
> +  - compatible
> +  - mediatek,platform
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sound {
> +        compatible = "mediatek,mt8183_mt6358_ts3a227_max98357";
> +        mediatek,headset-codec = <&ts3a227>;
> +        mediatek,ec-codec = <&ec_codec>;
> +        mediatek,hdmi-codec = <&it6505dptx>;
> +        mediatek,platform = <&afe>;
> +    };
> +
> +...
> 
> -- 
> 2.50.1
> 

