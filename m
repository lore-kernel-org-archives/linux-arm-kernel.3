Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB303C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 08:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nk+EQqCDIxxjmOF3zd1UNxDjJumJjZiZwdMUJY6YIxc=; b=OD37iVfLKz1F0aKssH+ppvAdkg
	LlpW0yLjOVDH11YLhWy3KnqIdJNshq1ZySt/7XxSyUiMlgf3wg1S9S8+WSUbWzT1BKITIger6EPoU
	Etfj7Diiv+xJoBRDsyF6GOdgidr0TmALqlJpVwrUrGTrjP5e9sZYbJNhdX2a/xYzgHJ3n5n97CSpk
	Vzg1gT3F04fUXZGpoH8sJSiO3wwQ6Bg2rAKfke2kCKWjPuoBaDGB1UmJqk/99R9OuZDeu6/HTtBF1
	bM6TJp9K/Iq3/392t98YZrkH78hZqu4770rc7gvlw9PJia3WqAVnS4GEGRDBbETNs5xNskSehNh6C
	x8+6eYIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8iJ-0000000E41M-0dgK;
	Fri, 11 Jul 2025 08:02:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8MU-0000000E0KO-0ODa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 07:40:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B02061360;
	Fri, 11 Jul 2025 07:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C18BC4CEED;
	Fri, 11 Jul 2025 07:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752219601;
	bh=v1UKmxLgqeJQ99ZtIwzdfNnTf17LbvFnV7H8H/rBmII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B59pt+FBc4SVitZEEflQkbZNoMBo9iDvTidx1AFsec47Vzgp/aG3u+fnOvxg2nMVQ
	 a/PJNdf/I7OrxIBSRjQ4/02rOG77wMSmtRTCr8LenaXpIMsAe4sEAQ79fV4RLzJs8/
	 wALzB/zSRV+Y4lgU7iAq+C0EezzPbt/ItCuVkkGc5HgrpB5JpRmyL4qigo2+YZbx6W
	 CoVbCOuO4GvdPIQjwP9WqoIJcJc5EAjgJLaVdNsSebl0HebeQRUZZ62jYPncNa4eSq
	 o1FvJ1v9YIxSAzCV5GwHGwC6RFpuCzbLtPHpjYDEa9nsTcDVdQV748GiZSHQych1uR
	 hKrdP0Mn0Q2JQ==
Date: Fri, 11 Jul 2025 09:39:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, chester62515@gmail.com, mbrugger@suse.com, 
	Ghennadi.Procopciuc@nxp.com, larisa.grigore@nxp.com, lee@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com, ping.bai@nxp.com, 
	gregkh@linuxfoundation.org, rafael@kernel.org, srini@kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, s32@nxp.com, clizzi@redhat.com, aruizrui@redhat.com, 
	eballetb@redhat.com, echanude@redhat.com, kernel@pengutronix.de, imx@lists.linux.dev, 
	vincent.guittot@linaro.org
Subject: Re: [PATCH v7 01/12] dt-bindings: mfd: add support for the NXP SIUL2
 module
Message-ID: <20250711-enchanted-blond-manul-f8bd3d@krzk-bin>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
 <20250710142038.1986052-2-andrei.stefanescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250710142038.1986052-2-andrei.stefanescu@oss.nxp.com>
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

On Thu, Jul 10, 2025 at 05:20:24PM +0300, Andrei Stefanescu wrote:
> Add the dt-bindings for the NXP SIUL2 module which is a multi
> function device. It can export information about the SoC, configure
> the pinmux&pinconf for pins and it is also a GPIO controller with
> interrupt capability.
> 
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  .../bindings/mfd/nxp,s32g2-siul2.yaml         | 163 ++++++++++++++++++
>  1 file changed, 163 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml b/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
> new file mode 100644
> index 000000000000..8ae185b4bc78
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
> @@ -0,0 +1,163 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2024 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/nxp,s32g2-siul2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP S32 System Integration Unit Lite2 (SIUL2)
> +
> +maintainers:
> +  - Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> +
> +description: |
> +  SIUL2 is a hardware block which implements pinmuxing,
> +  pinconf, GPIOs (some with interrupt capability) and
> +  registers which contain information about the SoC.
> +  There are generally two SIUL2 modules whose functionality
> +  is grouped together. For example interrupt configuration
> +  registers are part of SIUL2_1 even though interrupts are
> +  also available for SIUL2_0 pins.
> +
> +  The following register types are exported by SIUL2:
> +    - MIDR (MCU ID Register) - information related to the SoC
> +    - interrupt configuration registers
> +    - MSCR (Multiplexed Signal Configuration Register) - pinmuxing and pinconf
> +    - IMCR (Input Multiplexed Signal Configuration Register)- pinmuxing
> +    - PGPDO (Parallel GPIO Pad Data Out Register) - GPIO output value
> +    - PGPDI (Parallel GPIO Pad Data In Register) - GPIO input value
> +
> +  Most registers are 32bit wide with the exception of PGPDO/PGPDI which are
> +  16bit wide.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: nxp,s32g2-siul2
> +      - items:
> +          - enum:
> +              - nxp,s32g3-siul2
> +          - const: nxp,s32g2-siul2
> +
> +  reg:
> +    minItems: 2

Eh, and after reading your deprecated patch I went back here and see
this changed... Why? Why are you making random changes?

I retract my review, I was too hasty.

Best regards,
Krzysztof


