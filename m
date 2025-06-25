Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1A4C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 00:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWPSF2R/eLAwYrRCCS20XY5QBNow8BIJ7lzj4/wn2kc=; b=fW/CzACqtz7DVylSiOifmUcSBx
	vP58ymAnqY5FRyW4EGd+wzTBDE7XRgLBeQ357dkXnAhA4GNqVW7Yb+uMAEd5hZmfQHz8SGgmW3Ce3
	/x83wRI3ATpzXLBvgXhucFA2VzwPtyCgiZHhQI41xOnS/Lu6M+/0OjGeqIFdc2iFjrFxCoUd8DA5o
	WYgT//EAFPcFCOnyYsbREDTHLhuNpsLPttA8RllrKnr+k3wsgu4WItYz1eHEq7icNrOQwSLIQOLGZ
	iTNz9R7qNVfMyT3R+OCq1jyM10ziXSLHof5MWmRuElTt7KTeIfpM80aACt8o3pQnlFkx5ULPvTiHK
	JuVdqnZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUE6y-00000007BtK-2M6T;
	Wed, 25 Jun 2025 00:35:36 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUE4d-00000007Bih-3cP6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 00:33:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1750811590; bh=ms3WGlOprzDLUzYMZcYywfUti3aVLPF3z/nEEQvXhrk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sSQQz0OQm9lCEeKuVh4ox28UFocW3eGPqwamBIA0Xp8OaN2Ezo/uoeC6jVnZNwxVO
	 JjK6qL8NllT2RjvMOEgZ8QJJkL+g0wtaqGeXn4CFZdYGInb6ovbWgE2WfyiBdMF9Jn
	 nrlhWT7VbwdYE75scHJVVPPpCW3VVkWp+9hSOaJuqlXNI6Nunt+royyZ+ZGMa+piV+
	 /zhcIAUsRdA+2WY9MA9Vx6jkLs1v5QdVPTyVxn1vZQ6Ed1q/g4KkOnotWOTm7+gKr9
	 14bQsXa+hNuZlHu8qn1Hgz/iY7oRboMDK5aXecgWfI73dmu2199GKB9q02iEp6wIW+
	 rM7AkOZSZTTKQ==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 6E0BA3C43A8;
	Wed, 25 Jun 2025 00:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1750811590; bh=ms3WGlOprzDLUzYMZcYywfUti3aVLPF3z/nEEQvXhrk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sSQQz0OQm9lCEeKuVh4ox28UFocW3eGPqwamBIA0Xp8OaN2Ezo/uoeC6jVnZNwxVO
	 JjK6qL8NllT2RjvMOEgZ8QJJkL+g0wtaqGeXn4CFZdYGInb6ovbWgE2WfyiBdMF9Jn
	 nrlhWT7VbwdYE75scHJVVPPpCW3VVkWp+9hSOaJuqlXNI6Nunt+royyZ+ZGMa+piV+
	 /zhcIAUsRdA+2WY9MA9Vx6jkLs1v5QdVPTyVxn1vZQ6Ed1q/g4KkOnotWOTm7+gKr9
	 14bQsXa+hNuZlHu8qn1Hgz/iY7oRboMDK5aXecgWfI73dmu2199GKB9q02iEp6wIW+
	 rM7AkOZSZTTKQ==
Message-ID: <07f1d17d-5a14-4a87-90a2-5bd181ccce3a@mleia.com>
Date: Wed, 25 Jun 2025 03:33:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: input: touchscreen: convert
 lpc32xx-tsc.txt to yaml format
To: Frank Li <Frank.Li@nxp.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Guo Ren <guoren@kernel.org>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20250624201151.2515150-1-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250624201151.2515150-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250625_003310_471608_DAB3BC9B 
X-CRM114-Status: GOOD (  15.79  )
/bin/ln: failed to access 'reaver_cache/texts/20250625_003310_471608_DAB3BC9B': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_003310_471608_DAB3BC9B 
X-CRM114-Status: GOOD (  18.69  )
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

On 6/24/25 23:11, Frank Li wrote:
> Convert lpc32xx-tsc.txt to yaml format.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   .../input/touchscreen/lpc32xx-tsc.txt         | 16 --------
>   .../input/touchscreen/nxp,lpc3220-tsc.yaml    | 39 +++++++++++++++++++
>   2 files changed, 39 insertions(+), 16 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/lpc32xx-tsc.txt
>   create mode 100644 Documentation/devicetree/bindings/input/touchscreen/nxp,lpc3220-tsc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/lpc32xx-tsc.txt b/Documentation/devicetree/bindings/input/touchscreen/lpc32xx-tsc.txt
> deleted file mode 100644
> index 41cbf4b7a670d..0000000000000
> --- a/Documentation/devicetree/bindings/input/touchscreen/lpc32xx-tsc.txt
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -* NXP LPC32xx SoC Touchscreen Controller (TSC)
> -
> -Required properties:
> -- compatible: must be "nxp,lpc3220-tsc"
> -- reg: physical base address of the controller and length of memory mapped
> -  region.
> -- interrupts: The TSC/ADC interrupt
> -
> -Example:
> -
> -	tsc@40048000 {
> -		compatible = "nxp,lpc3220-tsc";
> -		reg = <0x40048000 0x1000>;
> -		interrupt-parent = <&mic>;
> -		interrupts = <39 0>;
> -	};
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/nxp,lpc3220-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/nxp,lpc3220-tsc.yaml
> new file mode 100644
> index 0000000000000..34cb8b68216aa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/nxp,lpc3220-tsc.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/nxp,lpc3220-tsc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP LPC32xx SoC Touchscreen Controller (TSC)
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: nxp,lpc3220-tsc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

"clocks" property is mandatory, the old scheme is broken in this sense.

Please either fix the old scheme before conversion, or at least mention
the difference between the old scheme and the new one in the commit
message, and please add "clocks" to the list of required properties.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    touchscreen@40048000 {
> +        compatible = "nxp,lpc3220-tsc";
> +        reg = <0x40048000 0x1000>;
> +        interrupt-parent = <&mic>;
> +        interrupts = <39 0>;
> +    };

--
Best wishes,
Vladimir

