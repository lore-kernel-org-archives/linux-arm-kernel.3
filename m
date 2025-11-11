Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A21BCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 17:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3Hk9DW5kL5J6uSFQvWJOZ9wCy+RP65Vlpdw339EGuY=; b=jOLDc9K8Y8nHYs3nCzjjodk3OA
	i+RhpZfo2rACDdxUj66g87qI8GxAhNgMDNfak+x6OqtY8hhHm2haiBC7vMj+xNYEneXAE/S3/dXRO
	gP5Off6VoEIUCHJzVUFaeQEUPxTJ2IPyPBGGdk8FZ4RFY2VuA+qJnW+d3EEDdsoPEAj2A8zslEwiB
	lM042X+pzyvKZ1DmtCWbvdq72m1NLD+3e8yEPnjdcbi009I2pJnagOymSmX+5iu7I/sBSrgMc2wt7
	jLT0GpDifcsc9oBXbda30Tnpyc3plq8x/Nx0EN1TgRLv1m89MN0jzJA9neBIyAI+41jGdEX237GeL
	i1qh31Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsIQ-00000007Xey-1xCj;
	Tue, 11 Nov 2025 17:36:46 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsIO-00000007XeY-1ckp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 17:36:45 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-787da30c53dso28879617b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 09:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762882603; x=1763487403; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E3Hk9DW5kL5J6uSFQvWJOZ9wCy+RP65Vlpdw339EGuY=;
        b=zq8lUIds6RnyGN0WgpWTg5lfGa3P8MfkPPvG9QQjYi65ZJJZGxyuny/KglwcbhCbW0
         e/hA+bEadpU1WW7sfdGDLHJn/zaV9DCNupqwSkTpgO7HltMI+dEBLx7vC9N1a9Q76/HC
         FYZ4+KiWbdP4B05o79WQ5aq6M5Ctg4S8IHDzqj1cOiBfxlb0Xbhf34+j4WwbJBghEEEG
         PPrDo9LOoS2dlEkeoc1XlHOVbl6Tq4odfXtawMGrbPEa4dRqVIELykny2qXcbiq/vm8D
         bPa3RVGpdiY1OE18gCSjivJ+PYRtAcseicmlsvfX+gdWFbsIHj16CmO+je6YWeo3oMri
         fsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762882603; x=1763487403;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3Hk9DW5kL5J6uSFQvWJOZ9wCy+RP65Vlpdw339EGuY=;
        b=Xa6kt5p6jtIDF3AIvSdh2+2tPDu5tEEzYyP5tdGmnIIngVF6AISQcfHYbFkKzMC0ZP
         xk7OnBd7GFz7Xs2mlCSBOZXwuJb751gQQuKGT1ep6zZGkHKSllRJlUUBv0Cqpy60eIeW
         65YBewZtmggzQiG4OA6eYDiO8EA35vpitzMCcMu8V0ia2IuNQmLm2sMAFQRdTsEvHIYR
         3JaZssKWOYfrb4oMaCwLD6/X0bNO6/DqYXfTG3aoj4OiX5pP7CjGAUTWT2DvXtgRMhdG
         CjyhYU6scyozzc2fNOqp3BgH9pXD1++RGDd6YrBBMSm5ysyCkTgoZrjqvlgjmebLunco
         HjSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4xC5R5yCAA3cN2Ms8z1J/94cRuSXEnFh7Q+QCPfQV0ISK5FjkZJSPHYqFZEQNk5bNfxzpeqZx7mU/AAp9xbbg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx714jYAO23LLoC1JuplFXuvSNCgUQE4kYercHmUL/zXaWKuvVt
	gsF4YySj0C4cvSnJMYN6oa0aAbkmrcc/YU3EA1gTakJWjLnTKUiSdRNF1G6/Kh3i9NCZPGPRwkr
	pnFYXfCk26Gs4PInMUbfoBBuZj0YaO80hiCDZ/dXy6Q==
X-Gm-Gg: ASbGncv5+jmXB9vk/GFsHRC8Cy+x+8DIiacX5fhxC92t9NOSvl+2mwes+TswaZLZg+B
	e6iUx7d7R3Fmvzo9teHhd7OTETEho1ytcHuDd2CRMDQpPdALV9Dj183GoxWEXET8Ay3JOBvqMD+
	AO5Dcmz0zsY1fMzg1al6W4rXK0Cwva5SZCg4AzwHTwaBOEWSNUdLVS012cghDPBu2Lbyd/rXQ25
	L2a+GFKeHeMZq6JfzUeT/bFgYBiTA9m9fyoNWDWErJ1JHnXVvCDAmvchRG2ERMWcCQb+1YX61UB
	JNayt88=
X-Google-Smtp-Source: AGHT+IGbbBsvM979BCP7ZWmX0I8ipBBs21XHkx/ZeiB+cUiRLX1ImPDfEKdBhe4xqH2QU7hiVfRmvH9dCgXFqY4eMx4=
X-Received: by 2002:a05:690c:c349:b0:784:ad94:ac70 with SMTP id
 00721157ae682-787d5361c39mr85380607b3.9.1762882602935; Tue, 11 Nov 2025
 09:36:42 -0800 (PST)
MIME-Version: 1.0
References: <20251027-milbeaut-v2-1-9e1954ff7708@gmail.com>
In-Reply-To: <20251027-milbeaut-v2-1-9e1954ff7708@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 11 Nov 2025 18:36:07 +0100
X-Gm-Features: AWmQ_bmuX6vBN8aGtBR_ITBEbCmoqP3ikMVZofcmAm_bdFoSLSIpSUJ-RArnX18
Message-ID: <CAPDyKFpdeBgZKnK3KgNTQPWNw5R2rnSgB=uRjDUs8sBvbEDwJQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: mmc: socionext,milbeaut-m10v-sdhci-3.0:
 convert to DT schema
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Taichi Sugaya <sugaya.taichi@socionext.com>, 
	Takao Orito <orito.takao@socionext.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_093644_455720_8FC9D3BD 
X-CRM114-Status: GOOD (  25.06  )
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

On Mon, 27 Oct 2025 at 17:49, Charan Pedumuru <charan.pedumuru@gmail.com> wrote:
>
> Convert SOCIONEXT Milbeaut SDHCI controller binding to YAML format.
> Add a new property "voltage-ranges" to resolve dt_check errors.
>
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Changes in v2:
> - Change the description for the property "voltage-ranges".
> - Link to v1: https://lore.kernel.org/r/20251023-milbeaut-v1-1-3e4ff67110ad@gmail.com
> ---
>  .../devicetree/bindings/mmc/sdhci-milbeaut.txt     | 30 --------
>  .../mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml     | 79 ++++++++++++++++++++++
>  2 files changed, 79 insertions(+), 30 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-milbeaut.txt b/Documentation/devicetree/bindings/mmc/sdhci-milbeaut.txt
> deleted file mode 100644
> index 627ee89c125b..000000000000
> --- a/Documentation/devicetree/bindings/mmc/sdhci-milbeaut.txt
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -* SOCIONEXT Milbeaut SDHCI controller
> -
> -This file documents differences between the core properties in mmc.txt
> -and the properties used by the sdhci_milbeaut driver.
> -
> -Required properties:
> -- compatible: "socionext,milbeaut-m10v-sdhci-3.0"
> -- clocks: Must contain an entry for each entry in clock-names. It is a
> -  list of phandles and clock-specifier pairs.
> -  See ../clocks/clock-bindings.txt for details.
> -- clock-names: Should contain the following two entries:
> -       "iface" - clock used for sdhci interface
> -       "core"  - core clock for sdhci controller
> -
> -Optional properties:
> -- fujitsu,cmd-dat-delay-select: boolean property indicating that this host
> -  requires the CMD_DAT_DELAY control to be enabled.
> -
> -Example:
> -       sdhci3: mmc@1b010000 {
> -               compatible = "socionext,milbeaut-m10v-sdhci-3.0";
> -               reg = <0x1b010000 0x10000>;
> -               interrupts = <0 265 0x4>;
> -               voltage-ranges = <3300 3300>;
> -               bus-width = <4>;
> -               clocks = <&clk 7>, <&ahb_clk>;
> -               clock-names = "core", "iface";
> -               cap-sdio-irq;
> -               fujitsu,cmd-dat-delay-select;
> -       };
> diff --git a/Documentation/devicetree/bindings/mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml b/Documentation/devicetree/bindings/mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml
> new file mode 100644
> index 000000000000..2ba53626a959
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SOCIONEXT Milbeaut SDHCI controller
> +
> +maintainers:
> +  - Taichi Sugaya <sugaya.taichi@socionext.com>
> +  - Takao Orito <orito.takao@socionext.com>
> +
> +description:
> +  The SOCIONEXT Milbeaut SDHCI controller is a specialized SD Host
> +  Controller found in some of Socionext's Milbeaut image processing SoCs.
> +  It features a dedicated "bridge controller." This bridge controller
> +  implements special functions like reset control, clock management for
> +  various SDR modes (SDR12, SDR25, SDR50) and physical pin property settings.
> +
> +allOf:
> +  - $ref: sdhci-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: socionext,milbeaut-m10v-sdhci-3.0
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: iface
> +
> +  fujitsu,cmd-dat-delay-select:
> +    description:
> +      Its presence indicates that the controller requires a specific command
> +      and data line delay selection mechanism for proper operation, particularly
> +      when dealing with high-speed SD/eMMC modes.
> +    type: boolean
> +
> +  voltage-ranges:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    items:
> +      items:
> +        - description: minimum slot voltage (mV).
> +        - description: maximum slot voltage (mV).
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    mmc@1b010000 {
> +        compatible = "socionext,milbeaut-m10v-sdhci-3.0";
> +        reg = <0x1b010000 0x10000>;
> +        interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> +        voltage-ranges = <3300 3300>;
> +        bus-width = <4>;
> +        clocks = <&clk 7>, <&ahb_clk>;
> +        clock-names = "core", "iface";
> +        cap-sdio-irq;
> +        fujitsu,cmd-dat-delay-select;
> +    };
> +...
>
> ---
> base-commit: 7bac2c97af4078d7a627500c9bcdd5b033f97718
> change-id: 20250524-milbeaut-5c0267202e2c
>
> Best regards,
> --
> Charan Pedumuru <charan.pedumuru@gmail.com>
>

