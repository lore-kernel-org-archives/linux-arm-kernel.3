Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07C9C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 00:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I213KXUMpuiomo8p42vSbKR7n+zdbTOyd6wSf+M9nz8=; b=JBoPh8yc4dr3F2FnxfO/180l+a
	29mE0K1/I/LNy24EAivWpDuysifnlgTvibe1GbhD4ndJEAwajwODXK2mw6iY7GC9kdY/W2fij6ZAw
	HfmCLoz0dA5U4YT14JnXR23USLnFFSz8q8WP8HALXFT3OvOizvqiX0ldqcC8/dmpJQS54mMxquQTJ
	aVgQIwD+yMAJb04puESWy1o5G8+CFScTyi3CxlKRXItlgF5rdqTrwzwGWwSxZIHNcImWDXeSejt3/
	n2JAG8GK5RntrfYmwIQwaifrq8Sf9mg+hbxxoDUZXCIXLt19bdd+hzPJ2bbtZycTNGBrgrATTvQgM
	z6SplW0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUEBW-00000007CKD-0Be6;
	Wed, 25 Jun 2025 00:40:18 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUE9A-00000007C8f-0FWp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 00:37:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1750811870; bh=uAdDQOZBr2xxgHWEJYA1qKLjMi1UEW7xBPT8xSxiCLo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FNQwi2Mw3fcOJsFaMm6tl2xSstff+1H9QgLAn5FoEqRG96wCy4iELWkbXjzJwGn3E
	 LRVCdmVOI3BebMrxRMTaofBOf6Jff5IkPdyKsVH5T8WBoHZkBWUvo0atJ+w5mQMwbC
	 0Slg4d0rfDOEcnOKJdJhc/9hmUrCjZSrXLQjJ3j86LK/LkM6SUpTw9WY8L/nkpPpZS
	 Fu4gudcYi8gUnoXvdIrc+FPge1zMXOrnxasWrPP6CawAo0/Hi5LbVZDLcxUsHsmPZq
	 QGhhvfyFo3J09H253PB+06UlC2ZBHvtBRYTK3+ejCRKnsLOXdqF8a+hT1ZGI3CEz1X
	 UIABdMs8K8IDw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id C429E3C43A8;
	Wed, 25 Jun 2025 00:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1750811870; bh=uAdDQOZBr2xxgHWEJYA1qKLjMi1UEW7xBPT8xSxiCLo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FNQwi2Mw3fcOJsFaMm6tl2xSstff+1H9QgLAn5FoEqRG96wCy4iELWkbXjzJwGn3E
	 LRVCdmVOI3BebMrxRMTaofBOf6Jff5IkPdyKsVH5T8WBoHZkBWUvo0atJ+w5mQMwbC
	 0Slg4d0rfDOEcnOKJdJhc/9hmUrCjZSrXLQjJ3j86LK/LkM6SUpTw9WY8L/nkpPpZS
	 Fu4gudcYi8gUnoXvdIrc+FPge1zMXOrnxasWrPP6CawAo0/Hi5LbVZDLcxUsHsmPZq
	 QGhhvfyFo3J09H253PB+06UlC2ZBHvtBRYTK3+ejCRKnsLOXdqF8a+hT1ZGI3CEz1X
	 UIABdMs8K8IDw==
Message-ID: <94e42d9b-fae3-4e3a-a72f-dc284d0b4abc@mleia.com>
Date: Wed, 25 Jun 2025 03:37:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: pwm: convert lpc32xx-pwm.txt to yaml
 format
To: Frank Li <Frank.Li@nxp.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 "open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20250624200955.2514896-1-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250624200955.2514896-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250625_003750_821844_CBF1CDBA 
X-CRM114-Status: GOOD (  16.68  )
/bin/ln: failed to access 'reaver_cache/texts/20250625_003750_821844_CBF1CDBA': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_003750_821844_CBF1CDBA 
X-CRM114-Status: GOOD (  16.56  )
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

On 6/24/25 23:09, Frank Li wrote:
> Convert pc32xx-pwm.txt to yaml format.
> 
> Additional changes:
> - add ref to pwm.yaml
> - restrict #pwm-cells to 3
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   .../devicetree/bindings/pwm/lpc32xx-pwm.txt   | 17 --------
>   .../bindings/pwm/nxp,lpc3220-pwm.yaml         | 41 +++++++++++++++++++
>   2 files changed, 41 insertions(+), 17 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/pwm/lpc32xx-pwm.txt
>   create mode 100644 Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pwm/lpc32xx-pwm.txt b/Documentation/devicetree/bindings/pwm/lpc32xx-pwm.txt
> deleted file mode 100644
> index 74b5bc5dd19ac..0000000000000
> --- a/Documentation/devicetree/bindings/pwm/lpc32xx-pwm.txt
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -LPC32XX PWM controller
> -
> -Required properties:
> -- compatible: should be "nxp,lpc3220-pwm"
> -- reg: physical base address and length of the controller's registers
> -
> -Examples:
> -
> -pwm@4005c000 {
> -	compatible = "nxp,lpc3220-pwm";
> -	reg = <0x4005c000 0x4>;
> -};
> -
> -pwm@4005c004 {
> -	compatible = "nxp,lpc3220-pwm";
> -	reg = <0x4005c004 0x4>;
> -};
> diff --git a/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml b/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
> new file mode 100644
> index 0000000000000..b82d52f583df8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/nxp,lpc3220-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP LPC32XX PWM controller
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,lpc3220-pwm
> +      - nxp,lpc3220-motor-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#pwm-cells':
> +    const: 3
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#pwm-cells'
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    pwm@4005c000 {
> +        compatible = "nxp,lpc3220-pwm";
> +        reg = <0x4005c000 0x4>;
> +        #pwm-cells = <3>;
> +    };
> +

"clocks" and "assigned-clock-parents" properties are required.

Please fix the old .txt scheme, or the new one.

I will have to NAK any converted yaml file, if there is a clear
difference between the actual and proper description of controllers
from lpc32xx.dtsi and new proposed schemes.

-- 
Best wishes,
Vladimir

