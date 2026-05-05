Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D0BCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9UhueCsToG9z9J1FILdkdXdvfW7VXqChds4WrjXcqc=; b=HVccsHOnpfYoyrBiZ/gyhlqkvi
	fp9KcPKR/v1m8EvXUXcJrAjFrLt2AeYuoYusmQBuXObn7+aTMep5bA10oKJBUHIuh31X2Rsn65ABi
	KrRctmuZeCW3j/ZFqElquCctGmjqOQDwJtBWn1SWn48W1tLv1+2elw9li++nEnAfHlDOkNeQlEK6k
	0Ytv4fUYyuiBr6/jmmiq5ZKTYGRDWl4xdgUbNylzWJvTmgo8nkXHf4C7HJlurC8rjHTtFDzv1maVq
	E/IluvynBfLbHLmjyDhR/YhcvAVZ+i5AJaAcAZa/sIUeQ6FzcOIH7cGdONfkTlk84ivuDs6U4nCSt
	tF1PvXgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGOu-0000000GR08-0kuy;
	Tue, 05 May 2026 14:05:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGOq-0000000GQz6-2pfi;
	Tue, 05 May 2026 14:05:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D42CC40139;
	Tue,  5 May 2026 14:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FCECC2BCF5;
	Tue,  5 May 2026 14:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777989923;
	bh=LtbcojIUM+o0f4bAbDoLjPUTjXd3D3xyp8t7jWxs0rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gAPTNzsaNflEqXufrYulPtvNPFBTTlt9QvloeM6BzK2VfliIpd6vjz9XttRK2pclW
	 2XF7R6hOXPQ5VKmvGUPUF9FrB+Z2tPCJ/JlxUyDlIwlGMOH26CYWwLALfkuY5uSdxR
	 wMFFsP925o/uGZEWQ2fum87MCcvVJBDgKClfW2JyoUZzkNljWudgJ1pzVgcYNkT9qW
	 9kzkwyuwmz3XvO4doiNMQCCQxee4qLj60JNKP0usrNmn3/KGBvMGw+Ja7gFLcTy3eg
	 KyTAe93pxrdjIVd0cMm5ticTnv3fFME7PO/GyFH7DGctUC5cIwzdiqk8Ft2Qelh+4e
	 KCfnrEF0LI+QQ==
Date: Tue, 5 May 2026 09:05:21 -0500
From: Rob Herring <robh@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH 03/13] dt-bindings: thermal: add mt6323 PMIC thermal
Message-ID: <20260505140521.GA2515943-robh@kernel.org>
References: <20260504-mt6323-v1-0-799b58b355ff@protonmail.com>
 <20260504-mt6323-v1-3-799b58b355ff@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-mt6323-v1-3-799b58b355ff@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_070525_940121_18C8BA46 
X-CRM114-Status: GOOD (  18.82  )
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

On Mon, May 04, 2026 at 09:24:55PM +0300, Roman Vivchar wrote:
> The MediaTek mt6323 PMIC temperature can be read using AUXADC channel.
> 
> Add the devicetree binding documentation for the MediaTek mt6323 thermal.
> Due similarities with newer PMICs like mt6358, which include more than
> one thermal sensor, the #thermal-sensor-cells should be set to 1, to
> avoid breaking devicetree ABI in future.
> 
> Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  .../bindings/thermal/mediatek,mt6323-thermal.yaml  | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,mt6323-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,mt6323-thermal.yaml
> new file mode 100644
> index 000000000000..1882816ba274
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/mediatek,mt6323-thermal.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/mediatek,mt6323-thermal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek PMIC thermal
> +
> +maintainers:
> +  - Roman Vivchar <rva333@protonmail.com>
> +
> +description:
> +  The MediaTek PMIC thermal sensor uses an AUXADC channel to read raw
> +  temperature data and applies calibration data from NVMEM.
> +
> +allOf:
> +  - $ref: thermal-sensor.yaml#
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6323-thermal
> +
> +  io-channels:
> +    description: >

Don't need '>'.

> +      IIO channel for the AUXADC to read raw data from.
> +    maxItems: 1
> +
> +  io-channel-names:
> +    const: vts

-names properties are pointless for a single entry.

> +
> +  nvmem-cells:
> +    description: >
> +      NVMEM cell with phandle to the calibration data provided by the
> +      NVMEM device. If unspecified default values will be used.

Drop. Don't need generic descriptions.

> +    maxItems: 1
> +
> +  nvmem-cell-names:
> +    const: calibration-data
> +
> +  "#thermal-sensor-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - io-channels
> +  - io-channel-names
> +  - "#thermal-sensor-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/iio/adc/mediatek,mt6323-auxadc.h>
> +
> +    mt6323_thermal: thermal {

Drop unused labels.

> +      compatible = "mediatek,mt6323-thermal";
> +      nvmem-cells = <&mt6323_thermal_calibration_data>;
> +      nvmem-cell-names = "calibration-data";
> +
> +      io-channels = <&mt6323_adc MT6323_AUXADC_CHIP_TEMP>;
> +      io-channel-names = "vts";
> +      #thermal-sensor-cells = <1>;
> +    };
> 
> -- 
> 2.53.0
> 

