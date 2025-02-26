Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87400C18E7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtf8HpRZ7aqwTPbnp70ahJ0IR8gUXiT/T+XQRFQlkGA=; b=Y7luohL1ordcq2mb6lZiTFkvyC
	uTyfsWlJRkJXPqu/boV5n7wxqkDU7YSvhP8dkPqZv4XeM6V9SX4kxoeoaJ2mZ18BaXQCj5xhh8OfO
	zapdtx15X+xLi0gaMHTCW0X8Ta3XmvHAziywPNSJRAUmixxO80KtBiYNRNFODyl23JtR/WCktAIdY
	fCHBpVBJ3yoMWTVa1lSsdWFlK0fsaFXEpI1HxsTc858tOHM+jpqsdHTmtx/mvtEbXGvYecQiH3aR8
	7mvK9PLAPC9680EGEyeH92yJP4vsByla2eEYVsWroSXo0g86a/IejIS5YqyTruWqNRRm92AEisNUE
	yAf1xZkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJWF-00000004MJJ-3eC6;
	Wed, 26 Feb 2025 15:40:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJSz-00000004L8R-3XZr;
	Wed, 26 Feb 2025 15:37:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D5E55C656E;
	Wed, 26 Feb 2025 15:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D209CC4CED6;
	Wed, 26 Feb 2025 15:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740584215;
	bh=jk2YnpRwdl0zqWfzI0pQtgICnWog+RgigvgaUWzoto8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rWb0Qpvhvefui+YIaT1AKdUiuLVmVx72K/GJWZcwQ0tgkfV2HW25qAaUzgb0QK68g
	 lZep904ebvCGINPTPj7MQvFzwdT79Wx97bZQAwteV4jUM+BiOF+dWAYGbgWfUGHGrg
	 SkdhHiMronBVvlQcs4obbw+XadqhVLoCsn3+uXLnuazBAvlU2nHogr62Phmq6aE0nA
	 zPuFj8YqepR5YC6AunhJiFtL0wYeq7U8ISwW34cy7H4P/lRZXI+WK84UfzLwfAPJQ0
	 oH8tj8JKLE12P8U73kIpwKXgny5/kO3zNGBQKNSayX2GABqzy67AEfmUqKMnQV/JwL
	 kz034moZPbM6Q==
Date: Wed, 26 Feb 2025 09:36:53 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, 
 Heiner Kallweit <hkallweit1@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20250226-irqchip-gpio-a4-a5-v2-0-c55b1050cb55@amlogic.com>
References: <20250226-irqchip-gpio-a4-a5-v2-0-c55b1050cb55@amlogic.com>
Message-Id: <174058387423.2466938.7799013716611230822.robh@kernel.org>
Subject: Re: [PATCH v2 0/4] Add GPIO interrupt support for Amlogic A4 and
 A5 SoCs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_073657_969513_431ED70D 
X-CRM114-Status: GOOD (  16.18  )
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


On Wed, 26 Feb 2025 13:47:51 +0800, Xianwei Zhao wrote:
> This patch adds GPIO interrupt support for Amlogic A4 and A5 SoCs
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Changes in v2:
> - Use if/then instead of direct modification minimum value for property 'amlogic,channel-interrupts'.
> - Add register offsets to the parameter structure to reduce definition of a function.
> - Link to v1: https://lore.kernel.org/r/20250219-irqchip-gpio-a4-a5-v1-0-3c8e44ae42df@amlogic.com
> 
> ---
> Xianwei Zhao (4):
>       dt-bindings: interrupt-controller: Add support for Amlogic A4 and A5 SoCs
>       irqchip: Add support for Amlogic A4 and A5 SoCs
>       arm64: dts: Add gpio_intc node for Amlogic A4 SoCs
>       arm64: dts: Add gpio_intc node for Amlogic A5 SoCs
> 
>  .../amlogic,meson-gpio-intc.yaml                   | 13 +++++++
>  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 21 +++++++++++
>  arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 12 +++++++
>  drivers/irqchip/irq-meson-gpio.c                   | 42 +++++++++++++++++++---
>  4 files changed, 83 insertions(+), 5 deletions(-)
> ---
> base-commit: 953913df9c3ab6f496c6facd5aa7fc9f2f847ac2
> change-id: 20241213-irqchip-gpio-a4-a5-80c50a1456c4
> 
> Best regards,
> --
> Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20250226-irqchip-gpio-a4-a5-v2-0-c55b1050cb55@amlogic.com:

arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: interrupt-controller@8e72c: amlogic,channel-interrupts: [140, 141] is too short
	from schema $id: http://devicetree.org/schemas/interrupt-controller/amlogic,meson-gpio-intc.yaml#






