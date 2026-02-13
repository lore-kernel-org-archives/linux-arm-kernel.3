Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA96DEEA870
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 09:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUmr4hbNcDYbTKWADGc4qpcDjjSQWQ0xdF/kJFW0B5Y=; b=w0QK8q1OUd3oBCX/qpKDDizI7j
	btITMsxsy9r6RhVUkuyT/ZwA+dr8J+TE7EU91c/qgJ2R6W0GSWDfPiduWgH4lfDhPCWnMryRxd895
	n5sWeA1hhMKTwzwlASSnAeLnq9q8XFyEGRl2AgFVgePv+hoxvWo+/HaFry5HJR/oSovAIrwsMl8hu
	l0ukhJeZdPEnJV9UWtZOMhJXgj0K1SOucxU5Tl+JGqA1yij3zg80GjEmeAjqmXZ/fZTVRvHfwKGVF
	+xOClRRJ3OJJuZkQnhcnxjVipVYKS1+iHgW+Kbvm4rrf+WkMYgmmq4MFvsqQMX1A2r9Ol5BQserwd
	dhjPcvcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqpva-00000003HBp-0RL8;
	Fri, 13 Feb 2026 09:57:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqpvY-00000003HBX-2zpy
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Feb 2026 09:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zUmr4hbNcDYbTKWADGc4qpcDjjSQWQ0xdF/kJFW0B5Y=; b=lfHPjKZUM87QmK+d4IJ5HsTDSE
	q7IlfjWb9Lr0r1w/qR86MEDrKkNAQ9/piH2lRRCY0OvRL8eQQlnznMRQpo64PLrFE5uLIpjQdFejD
	Ftre5ZEERMEne6/Mw7Lj72ciBPVzKOF1WIZ6x7lD8yvpKVWNYybxPlfayvkwjD6BiZGhn5RMCBjCA
	PJdwKJc9s6VKYVSNSaGuKrANEURbMNn6RBSS0GG/nSFn9iAlVtv72JeHORoFXowIq4E7VDFbL9m3u
	NtCLm4pn0Jsg+/QgSUrbnFMQ5BaaoOEu/6//f+Rfsb7JsX+FiYVUxtoBQ9Vo2SUQVL9hJTLQpBiAi
	lwhXBWmA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqpvU-0000000C2le-2JhT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 09:57:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 89D0940901;
	Fri, 13 Feb 2026 09:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E49C116C6;
	Fri, 13 Feb 2026 09:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770976646;
	bh=2AQE3QvHfFwbeib4XB2oHCuNMDAdcVSPDzImHY2Ftfk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hBTUOxltPIsaDiVD7gHWR7i0fy2c23VIRLAdoyBQ/Fqi/GPE0FaqQnpZoeLyssC+T
	 huKhljhCUHYTJCGzAs4gvCSGJkSkPyDZpdByeaScn6+aNJ8ADm72Gj/Ctvv5nSqzOd
	 ZWT6aqeSYxruwPCMCpRfmK4eXNxhpnFQLIr/Hju9dqSYIHxGnJAXaPgN9jsjyB5irA
	 xt74TUW3yf2Dw/Xt16L1uk1DiZcOfBVw1m3fZmbnF/WwLhc89vKA/h/aHqIu7csTP9
	 4GKNPVz/xTQwiDb05fD4Y3IhMjkBqC2n9pyndaKGiLoi93SJLSMuuVi9D0XM308qKq
	 glolakPnznDpw==
Message-ID: <5d371a1d-0265-4c59-95dd-19d23bf596d7@kernel.org>
Date: Fri, 13 Feb 2026 10:57:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] dt-bindings: pinctrl: Add pinctrl-packed
To: Billy Tsai <billy_tsai@aspeedtech.com>, Linus Walleij
 <linusw@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: patrickw3@meta.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 BMC-SW@aspeedtech.com
References: <20260213-pinctrl-single-bit-v1-0-c60f2fb80efb@aspeedtech.com>
 <20260213-pinctrl-single-bit-v1-1-c60f2fb80efb@aspeedtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <20260213-pinctrl-single-bit-v1-1-c60f2fb80efb@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_095729_079987_49DAE384 
X-CRM114-Status: GOOD (  20.80  )
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

On 13/02/2026 09:17, Billy Tsai wrote:
> Add a Devicetree binding for a generic pin controller where pinmux and/or
> pin configuration are represented as fixed-width fields packed
> sequentially within shared registers.
> 
> The binding targets controllers that are typically exposed as subnodes of
> a syscon node and accessed via regmap-mmio through the parent.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/pinctrl/pinctrl-packed.yaml           | 166 +++++++++++++++++++++
>  1 file changed, 166 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-packed.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-packed.yaml
> new file mode 100644
> index 000000000000..dd01ba2fed71
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-packed.yaml
> @@ -0,0 +1,166 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/pinctrl-packed.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic Pin Controller with Packed-Field Registers
> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +description:
> +  This binding describes pin controller hardware where pinmux and/or
> +  pin configuration fields are represented as fixed-width fields packed
> +  sequentially within shared registers.
> +
> +  Such controllers are commonly embedded within a larger system control
> +  unit (SCU) register block and may be exposed as subnodes of a syscon
> +  device.
> +
> +  Conceptually, this model is related to the pinctrl-single binding,
> +  but instead of describing individual register offsets via
> +  <offset, value, mask> tuples, the hardware provides fixed-width,
> +  per-pin fields packed linearly within shared registers.

Why this cannot be part of pinctrl-single then? Why all these properties
are needed? I imagine that you need them to customize the generic
binding to your device and that would be counter argument - generic
bindings are too generic so people need to grow them with hundreds
properties (see the very simple binding of simple audio card).


> +
> +properties:
> +  compatible:
> +    oneOf:

Drop oneOf

> +      - enum:
> +          - pinctrl-packed
> +          - pinconf-packed
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#pinctrl-cells':
> +    description:
> +      The pinctrl provider uses standard state nodes referenced by pinctrl-N
> +      properties; consumers do not pass per-pin arguments via phandle.
> +    const: 1
> +
> +  pinctrl-packed,function-mask:
> +    description: Mask of the allowed register bits for a single pin.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  pinctrl-packed,gpio-range:
> +    description: Optional list of pin base, nr pins & gpio function.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: phandle of a gpio-range node
> +        - description: pin base
> +        - description: number of pins
> +        - description: gpio function
> +
> +patternProperties:
> +  '-pins(-[0-9]+)?$|-pin$':
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      pinctrl-packed,pins:

No, use standard pinctrl properties.

> +        description: Array of pin index and function selector pairs.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +      pinctrl-packed,bias-pullup:
> +        description: Optional bias pull-up configuration.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        maxItems: 4
> +        items:
> +          - description: Input value.
> +          - description: Enabled pull-up bits.
> +          - description: Disabled pull-up bits.
> +          - description: Pull-up mask.
> +        additionalItems: false
> +
> +      pinctrl-packed,bias-pulldown:
> +        description: Optional bias pull-down configuration.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        maxItems: 4
> +        items:
> +          - description: Input value.
> +          - description: Enabled pull-down bits.
> +          - description: Disabled pull-down bits.
> +          - description: Pull-down mask.
> +        additionalItems: false
> +
> +      pinctrl-packed,drive-strength:
> +        description: Optional drive strength configuration.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        maxItems: 2
> +        items:
> +          - description: Drive strength value.
> +          - description: Drive strength mask.
> +        additionalItems: false
> +
> +      pinctrl-packed,input-schmitt:
> +        description: Optional input Schmitt trigger configuration.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        maxItems: 2
> +        items:
> +          - description: Schmitt trigger value.
> +          - description: Schmitt trigger mask.
> +        additionalItems: false
> +
> +      pinctrl-packed,input-schmitt-enable:
> +        description: Optional input Schmitt enable configuration.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        maxItems: 4
> +        items:
> +          - description: Input value.
> +          - description: Enable bits.
> +          - description: Disable bits.
> +          - description: Schmitt mask.
> +        additionalItems: false
> +
> +      pinctrl-packed,low-power-mode:
> +        description: Optional low power mode configuration.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        maxItems: 2
> +        items:
> +          - description: Low power value.
> +          - description: Low power mask.
> +        additionalItems: false
> +
> +      pinctrl-packed,slew-rate:
> +        description: Optional slew rate configuration.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        maxItems: 2
> +        items:
> +          - description: Slew rate value.
> +          - description: Slew rate mask.
> +        additionalItems: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#pinctrl-cells"
> +  - pinctrl-packed,function-mask
> +
> +additionalProperties: false
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +examples:
> +  - |
> +    syscon@0 {
> +        compatible = "syscon", "simple-mfd";

This is not allowed and you will have warnings here, which means you did
not test the binding correctly (completely). Not even needed here, drop
entire node.

Best regards,
Krzysztof

