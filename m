Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0FAC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 13:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M59/iU/94UEEWnEAOxMnAplI0bpHeu60K9JCIDTKOvo=; b=qnXx2Vrictu3EtNoq3bFCyYobq
	zcF+1Tpw0laRRWnFmGbazCJSf5LjPPrb8BLZI8GHDmjGEq9aKOr7FfwoPzLBzPgY7Cotxz3ZY1nRJ
	fzmQsvH2JqZS9NtbxQQhXCTmJJyUTGt89vKvsHdnQmA6rn7mW/AFZTv72HtToMuBpEIw3cIAzRFNZ
	QdN6+9sAPotwzonHcBah/eIHggdIkSBtRkHgrt0NagBpPQSCBXkTHoe7Fg/nnjG5wHnD7hXSdGUl/
	TRJpL5KzYh8Bp5M0RFXaPuR7TMREwivuipznv5y+IISJrZYzKqS3TAWgiGT8ymK1UQ4PKXT4dDLdD
	TTlaTAFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7v9w-0000000GJwO-3gn6;
	Sat, 19 Sep 2026 13:31:16 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7v9t-0000000GJvT-3tyu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 13:31:15 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so9638635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 06:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789824672; x=1790429472; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M59/iU/94UEEWnEAOxMnAplI0bpHeu60K9JCIDTKOvo=;
        b=M6/fh9bUIvsh5GZbQvnVn5YhkQ/OhydIL9TKPrkrh+PYzBDMhOfVa9I2d4QsfN3s3k
         mM9hpDN9xqYoxxJKf/Bl2n+grWUH/nFQQTJ4Rtwo4S/2dyUAD+oyedBIcJSCyf4EfVXA
         +pmotljfLWL2fcsw+h4ow/s7NGdb9Hxceqdjcd2A2SyglmPGT5Bq5mRhkgqYilCTuSP3
         mgZfqs3nNknpjCBCqxTgfLngdNpxGUE2ZoLjMYZ1GuJKZFv0IHs3w56ngOY77cleYVjq
         dmZtk8Fv2/ryaCkCzyo9wlk6fW9BPwMUo59YSDPzJaiAXa53xotyShR8l74ZNeGRfGIq
         aHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789824672; x=1790429472;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M59/iU/94UEEWnEAOxMnAplI0bpHeu60K9JCIDTKOvo=;
        b=MKWyIL5yI+jZgbrymHAAhdpeu5loPj1nhu9Ci4ZgjmWMk8O9EPQSHw4HBIe5f/qgHS
         ml/ktlIyy7pOKlP9yk+3ZvrQqOJFGqKtcdyoI2w5WsAwjipKH3BdQgztWBWptVbwlyPG
         Vy44O/2UdqI/sMyvgPRr5S79U9yPkuQc4MC87YYOtt7+2l4HnfWNx3ZdpzAPHqQkQcaB
         Hn4AyJjevXLPYK8z7veYuMs6uzgBv0dzA4VU123JbpUxtELcmC83g8W4iIVeKXVpEpFF
         NIO3nk/FLPS7TOwUhmSSfpIHWhbocoTUM6MzmznrASKH7OGji2fyT3J3v8p8CmHmSx8r
         hIAg==
X-Forwarded-Encrypted: i=1; AKwUvBw/K7C0b3o4/+BHLyKquTriPwJZXEWaBAwEAoo43FY8WNgSCYEdEXWY0+Hl8Ct3QQ/XN2ab+dzXhAR12jAiluvH@lists.infradead.org
X-Gm-Message-State: AFuF++lK1Q8N8riOz9LTyClV5Lh0i4H4SaP9A18QP9KaFCyuBFBUQa5O
	5YdJDgdHVc2Te9Ny98u6quWdHvtqTC695FhjinDkIgzplppNDjGy8NxbEdLJS/mbbLo=
X-Gm-Gg: AYBFou3n7FyUm9NSr7nY+W1JeuM9e4OnnJMiKMY8PbjlBN2s5LifuKfThbYI168XT6o
	XV6qUNNsG5Gzeb82k3d4ld4HfhrOi3LCpy6BDs2as5iw2G0iyR54vNRdn90WOrHjRgvaFaHWfX+
	emiB/0okLVsrhED3zxYoSXW/7Aad3SpKlQWnE42f7dxvrwP2JkuRumcR0TvUqTiso4056UW4Lis
	jVU5zv/0QWlZFecWRAynFqAolPcoJe/PD0n915cw6jm3S4v4RVk286019vR/sqB5sOMAW/ioy8H
	dwErBNrGlwPQ6lPUBGUsW7Pz/5VRPR+VXtqkuIdhCJtWX2Bv1UdjBsnl9kUIRn2PqpU2WCS6E37
	yLN/bd4K/tbMJ652JyiKJMw/rmkiSuhUpB7DoVYB6JTE+kWU8dfz02pmOLGQLuA+I+HpYqbL7Sb
	7UTf7HoHgFo2zs4O0I9DoEM1zVLutAEKlwpYCRufQSYPqQol3ga2JJiNc4Rt3Vi7rEylHo6+PXX
	mhJ+DZ0iGdXd2reekB/vkkQ/0n0DlAp/iHRGu88sZFAt3S5QYGPe1I=
X-Received: by 2002:a05:600c:6211:b0:49f:bc28:e8b1 with SMTP id 5b1f17b1804b1-49fc5735be8mr67988985e9.14.1789824672039;
        Sat, 19 Sep 2026 06:31:12 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd086ce9sm105569825e9.12.2026.09.19.06.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 06:31:10 -0700 (PDT)
Message-ID: <b63a2054-c695-4bdc-809c-924742526122@tuxon.dev>
Date: Sat, 19 Sep 2026 16:31:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/17] ARM: dts: microchip: sama7d65: add otpc node
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, srini@kernel.org, marcelo.schmitt@analog.com,
 radu.sabau@analog.com, joshua.crofts1@gmail.com, jorge.marques@analog.com,
 Jonathan.Santos@analog.com, jishnu.prakash@oss.qualcomm.com,
 antoniu.miclaus@analog.com, duje@dujemihanovic.xyz,
 mazziesaccount@gmail.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
 <20260806074024.531259-15-varshini.rajendran@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260806074024.531259-15-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_063113_989701_F077BEC1 
X-CRM114-Status: GOOD (  13.88  )
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



On 8/6/26 10:40, Varshini Rajendran wrote:
> Add OTPC node along with temperature calibration cell.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>   arch/arm/boot/dts/microchip/sama7d65.dtsi | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index c35f27615bc4..aac2e22d96cb 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -15,6 +15,7 @@
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/mfd/at91-usart.h>
> +#include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>

This header is not needed for now. I can drop it while applying, if any.

Other than that:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

>   
>   / {
>   	model = "Microchip SAMA7D65 family SoC";
> @@ -1111,6 +1112,21 @@ ddr3phy: ddr3phy@e3804000 {
>   			reg = <0xe3804000 0x1000>;
>   		};
>   
> +		otpc: efuse@e8c00000 {
> +			compatible = "microchip,sama7d65-otpc", "microchip,sama7g5-otpc", "syscon";
> +			reg = <0xe8c00000 0x100>;
> +
> +			nvmem-layout {
> +				compatible = "fixed-layout";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +
> +				temperature_calib: calib@41435354 {
> +					reg = <0x41435354 0x2c>;	/* Temp calib data packet TAG */
> +				};
> +			};
> +		};
> +
>   		gic: interrupt-controller@e8c11000 {
>   			compatible = "arm,cortex-a7-gic";
>   			reg = <0xe8c11000 0x1000>,


