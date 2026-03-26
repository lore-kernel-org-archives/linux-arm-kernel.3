Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA8F10A3D81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8arL5aX7YsSdvIL2KLEa2SjWw/0ygcrFGAOAqfvGZA=; b=kH1ksyTQLBCXQNaanbsfhLPBAn
	BYTJq/jNgPpCf2fJrFuXxqrv7UKjVMH2DqcEJJyRMdV9Cjs0+BEwjnx667xrc7AUFZRIsSvmaN2KR
	nWDSmh7pE50RGKS7YPTCXn6OAXfRprvXhE1/g7uYavGZpwJ1sQlWsWgE7PzOG3AG4MpNGtGYEXOV2
	gJVbOQxMwrcWekjWAp5//LjHHrre2+eSLBzinCE7qF2fVgrhkwxCTOnvwodtM0tACLyX2hI2iWFJu
	RSZxVqUHaTcQ6vcrbHZfgEU+W/cE3jfRIDNENa96ssNLkd0O6moR0xCNRysB1iTLs3UaawZdoqM53
	asU+H2kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jvF-00000005SBy-3UoZ;
	Thu, 26 Mar 2026 12:34:49 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jvD-00000005SBQ-1ypV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 12:34:48 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5a27b5ad832so1048136e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 05:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774528485; cv=none;
        d=google.com; s=arc-20240605;
        b=bcQhaByq8BGcDMFawS5vDUfmcHHhfTLXIXphFxDegQKdUH3FIj1NcrYr59LWNtKSxI
         tLT6oqYrr3u6UVFp6BpmueTCLcSUcg12b25+Nvode/nOEobLnb9190kPXCthQ6hS2Do4
         RUDRub9Bgr1u4dMVVQ9nsq3MdYl5st+NxUklMftkbNwV801VNbZ8YCH1q0RZcpIEosRF
         rJGu+/SRXYwoRrE4Z8yLXdXETGiSdAa4R9bZDzXQ3JQU6olHr613/OdHd9RPTV7DoJ8U
         lywdD38bZ54KCQXlCXHkUYPFsi64ppLqXWc2LF8yhElTxsum+0APihkJseUSnW3a8btq
         3F6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=w8arL5aX7YsSdvIL2KLEa2SjWw/0ygcrFGAOAqfvGZA=;
        fh=dPPKBapgQvNHGGwb22nIOdMjiiG+mtSoSpsOUg3E/Hg=;
        b=iN36D6VdMXTQEvpeleEoRtLHmE5WJfbiO21ee8XE0a12e8plDWESPgMD2MIzxIxI7B
         NAYE+rlWFZjBxYjvuiNSbrgiK6bWw+5mpqKDnW+nWapKvSDAUoMf60f8TlFwHuWpeq7M
         re5t+6Sjkhf9LqER8puJVE59qtVr0IKb8SfhTnxp/JSZGdQUjZXF+xtQObV7OPS8TxP8
         yu9stHiVLV2RsaaRvNFsVBZTN/zDPui6OghU8UbBWvKkJk0ce3I4Q3xGCILv4kOp860r
         qANAP7Fh/pcIkrj4r6wt4bOLM41X5621oSyp6fDrES+Mb2wRofT6daZ/DfrSNfc2Oriq
         qGVg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774528485; x=1775133285; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w8arL5aX7YsSdvIL2KLEa2SjWw/0ygcrFGAOAqfvGZA=;
        b=hFzXeHg0iTAk7DHmmpRM3OHLWksaBPObE1OUBtYjdEgr15TGmBOSeC3WX7Ar17JWpP
         zcVgF9jAPnFR8H62osVfMDs9manAlW8NCjEgC3eSEVxAD12djffOkmA+Ym8mNuTuYrmE
         otO9z5TKiXDIVdV7NiusZC+A8KgAu3slt5A7uo2SRu/GdtLDD6m+j7T40sQAR4Wq0MhZ
         mmuoKeRIriZF4HERkcKEYa0D+4iJfWzg2BssMvSLNO77bjUd9vNw4uPIHbHK1bL8iFlW
         5x19s8XqwOm13tMRoEckG7zmqu8X0QCeUA8puHGYCvn8KLMmv7753BQA1/GjfKXYDqg7
         5OMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774528485; x=1775133285;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8arL5aX7YsSdvIL2KLEa2SjWw/0ygcrFGAOAqfvGZA=;
        b=czTtzjuPKVgMlR5tR++KsGycwq2gX1BxEQTal7nD9Vox2jvvfHP412h8+ycre0XPn5
         3Vcvytww5r76Qh4lKa66YS9iVNdbRHWyi4GSRbtAldg/4OgffDec2/E6FA25zZdPn01z
         PPsiLmSbGa26NuZz4F1tIytUr84G29IBk2EtWcKwRrDc+XWuKElNH5XdKK4g75YwRZ8+
         fGdkHieK5srHq6NxlZGaUdLsoFvLgzFC9Q6OgCWYDTnV7+LzUhne5W8kuixEWd1huBRg
         1iZNy0TdQ+j4GSBYajWRLffIjmkUnDHgFYSUFAwrsQBI1HwI5NdDJYYat3LSUZbghP69
         7B6A==
X-Forwarded-Encrypted: i=1; AJvYcCVdtBFzz76kBfALVKx1kbu4cZJX63Z3nBauTmS0fHQV87R0enxdgF8eomFQzHBkWbBReza2j/xH5UAQNLGVnNrs@lists.infradead.org
X-Gm-Message-State: AOJu0YzfZIWKNM1PJt3Gl5nugdvlPWhFBRQgjc9pgM9EcwU5diQ/9zLW
	8iXYXMxRoS6b1WI7c/1boE3PfT/eO684wLlpuniEwlZJfOiYjrFa4yE/We5oS8iyAYAfkDW9ud6
	2c5w/ErU2ClDz2unTrTq/RWLmlwfAAGgP+NSHrjCNEskXuZKPMdoXgMM=
X-Gm-Gg: ATEYQzyMKLvvj5yS6CJ8HIJwN77rlaj8bsZoWTjWPyD8+ZD4INxRK/qVLBjCsjvjrUI
	6NbSNuMhgLk/fcfNU+9J8ijYW0//hb0MO5oSJJkMMI1yDiXlkINyFteRLBYGnUZPLofqrkbP+PG
	WqbIZnPj0MnXrp6XKkSDUA5fjKi1LfB82pXq3gxLe/9jje118QVNQi0RsrTwA+gyoSLaLRM14N/
	iR2pRAMZW5uDx0DzAg2kl5qV6Z4faqUPRZpwJ0XpPfMFpsUbBSRYmX8Ag3x4/F0oZbmjMwN+D2w
	5d6Pe1Q=
X-Received: by 2002:a05:6512:3503:b0:5a2:787a:fa54 with SMTP id
 2adb3069b0e04-5a29b984575mr3819487e87.18.1774528485146; Thu, 26 Mar 2026
 05:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260325225439.68161-1-rougueprince47@gmail.com> <20260325225439.68161-2-rougueprince47@gmail.com>
In-Reply-To: <20260325225439.68161-2-rougueprince47@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 26 Mar 2026 13:34:08 +0100
X-Gm-Features: AQROBzA9ouu9GctOeENUqpjJUJQ5Hy-gzMk2QIkjrS5DYDZYZfDgFBRbTuNSliw
Message-ID: <CAPDyKFo29rgaf7OtvbkP85w96Y3nRJZORO_Sog70hdoxzYVzSw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: hisilicon,hi3660-dw-mshc:
 Convert to DT schema
To: Bhargav Joshi <rougueprince47@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	xuwei5@hisilicon.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, zhangfei.gao@linaro.org, linux-mmc@vger.kernel.org, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_053447_568032_AC6F7702 
X-CRM114-Status: GOOD (  27.99  )
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

On Wed, 25 Mar 2026 at 23:55, Bhargav Joshi <rougueprince47@gmail.com> wrote:
>
> Convert the Hisilicon DesignWare Mobile Storage Host Controller
> (dw-mshc) bindings from text format to DT schema.
>
> As part of this conversion, the binding file is renamed from
> k3-dw-mshc.txt to hisilicon,hi3660-dw-mshc.yaml to align with compatible
> string naming conventions. Examples have been updated to pass schema
> validation.
>
> Note: synopsys-dw-mshc binding specifies clock names as "biu" followed
> by "ciu". However, this Hisilicon binding reverses the order to 'ciu'
> then 'biu' to match both the legacy text binding and in-kernel Hisilicon
> DTS board files.
>
> Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>
> Acked-by: Zhangfei Gao <zhangfei.gao@linaro.org>

Applied for next, thanks!

Kind regards
Uffe



> ---
> Changes in v2:
>     - Grouped compatible strings into an enum.
>     - Replaced raw numbers with proper flags.
>     - Fixed property order and removed invalid hex values.
>     - Added explanation for clock order change in commit message.
>     - Collected Acked-by tag.
>
>  .../mmc/hisilicon,hi3660-dw-mshc.yaml         | 117 ++++++++++++++++++
>  .../devicetree/bindings/mmc/k3-dw-mshc.txt    |  73 -----------
>  2 files changed, 117 insertions(+), 73 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt
>
> diff --git a/Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
> new file mode 100644
> index 000000000000..296bd776488e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/hisilicon,hi3660-dw-mshc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Hisilicon specific extensions to the Synopsys Designware Mobile Storage Host Controller
> +
> +maintainers:
> +  - Zhangfei Gao <zhangfei.gao@linaro.org>
> +
> +description:
> +  The Synopsys designware mobile storage host controller is used to interface
> +  a SoC with storage medium such as eMMC or SD/MMC cards. This file documents
> +  differences between the core Synopsys dw mshc controller properties described
> +  by synopsys-dw-mshc.txt and the properties used by the Hisilicon specific
> +  extensions to the Synopsys Designware Mobile Storage Host Controller.
> +
> +allOf:
> +  - $ref: /schemas/mmc/synopsys-dw-mshc-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - hisilicon,hi3660-dw-mshc
> +          - hisilicon,hi4511-dw-mshc
> +          - hisilicon,hi6220-dw-mshc
> +      - items:
> +          - const: hisilicon,hi3670-dw-mshc
> +          - const: hisilicon,hi3660-dw-mshc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: card interface unit clock
> +      - description: bus interface unit clock
> +
> +  clock-names:
> +    items:
> +      - const: ciu
> +      - const: biu
> +
> +  hisilicon,peripheral-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle of syscon used to control peripheral.
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
> +    #include <dt-bindings/clock/hi3620-clock.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    mmc@fcd03000 {
> +        compatible = "hisilicon,hi4511-dw-mshc";
> +        reg = <0xfcd03000 0x1000>;
> +        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        clocks = <&mmc_clock HI3620_SD_CIUCLK>, <&clock HI3620_DDRC_PER_CLK>;
> +        clock-names = "ciu", "biu";
> +        vmmc-supply = <&ldo12>;
> +        fifo-depth = <0x100>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&sd_pmx_pins &sd_cfg_func1 &sd_cfg_func2>;
> +        bus-width = <4>;
> +        disable-wp;
> +        cd-gpios = <&gpio10 3 GPIO_ACTIVE_HIGH>;
> +        cap-mmc-highspeed;
> +        cap-sd-highspeed;
> +    };
> +
> +  - |
> +    #include <dt-bindings/clock/hi6220-clock.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      mmc@f723e000 {
> +          compatible = "hisilicon,hi6220-dw-mshc";
> +          reg = <0x0 0xf723e000 0x0 0x1000>;
> +          interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +          clocks = <&clock_sys HI6220_MMC1_CIUCLK>,
> +                   <&clock_sys HI6220_MMC1_CLK>;
> +          clock-names = "ciu", "biu";
> +          bus-width = <4>;
> +          disable-wp;
> +          cap-sd-highspeed;
> +          sd-uhs-sdr12;
> +          sd-uhs-sdr25;
> +          card-detect-delay = <200>;
> +          hisilicon,peripheral-syscon = <&ao_ctrl>;
> +          cd-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
> +          pinctrl-names = "default", "idle";
> +          pinctrl-0 = <&sd_pmx_func &sd_clk_cfg_func &sd_cfg_func>;
> +          pinctrl-1 = <&sd_pmx_idle &sd_clk_cfg_idle &sd_cfg_idle>;
> +          vqmmc-supply = <&ldo7>;
> +          vmmc-supply = <&ldo10>;
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt b/Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt
> deleted file mode 100644
> index 36c4bea675d5..000000000000
> --- a/Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -* Hisilicon specific extensions to the Synopsys Designware Mobile
> -  Storage Host Controller
> -
> -Read synopsys-dw-mshc.txt for more details
> -
> -The Synopsys designware mobile storage host controller is used to interface
> -a SoC with storage medium such as eMMC or SD/MMC cards. This file documents
> -differences between the core Synopsys dw mshc controller properties described
> -by synopsys-dw-mshc.txt and the properties used by the Hisilicon specific
> -extensions to the Synopsys Designware Mobile Storage Host Controller.
> -
> -Required Properties:
> -
> -* compatible: should be one of the following.
> -  - "hisilicon,hi3660-dw-mshc": for controllers with hi3660 specific extensions.
> -  - "hisilicon,hi3670-dw-mshc", "hisilicon,hi3660-dw-mshc": for controllers
> -     with hi3670 specific extensions.
> -  - "hisilicon,hi4511-dw-mshc": for controllers with hi4511 specific extensions.
> -  - "hisilicon,hi6220-dw-mshc": for controllers with hi6220 specific extensions.
> -
> -Optional Properties:
> -- hisilicon,peripheral-syscon: phandle of syscon used to control peripheral.
> -
> -Example:
> -
> -       /* for Hi3620 */
> -
> -       /* SoC portion */
> -       dwmmc_0: dwmmc0@fcd03000 {
> -               compatible = "hisilicon,hi4511-dw-mshc";
> -               reg = <0xfcd03000 0x1000>;
> -               interrupts = <0 16 4>;
> -               #address-cells = <1>;
> -               #size-cells = <0>;
> -               clocks = <&mmc_clock HI3620_SD_CIUCLK>, <&clock HI3620_DDRC_PER_CLK>;
> -               clock-names = "ciu", "biu";
> -       };
> -
> -       /* Board portion */
> -       dwmmc0@fcd03000 {
> -               vmmc-supply = <&ldo12>;
> -               fifo-depth = <0x100>;
> -               pinctrl-names = "default";
> -               pinctrl-0 = <&sd_pmx_pins &sd_cfg_func1 &sd_cfg_func2>;
> -               bus-width = <4>;
> -               disable-wp;
> -               cd-gpios = <&gpio10 3 0>;
> -               cap-mmc-highspeed;
> -               cap-sd-highspeed;
> -       };
> -
> -       /* for Hi6220 */
> -
> -       dwmmc_1: dwmmc1@f723e000 {
> -               compatible = "hisilicon,hi6220-dw-mshc";
> -               bus-width = <0x4>;
> -               disable-wp;
> -               cap-sd-highspeed;
> -               sd-uhs-sdr12;
> -               sd-uhs-sdr25;
> -               card-detect-delay = <200>;
> -               hisilicon,peripheral-syscon = <&ao_ctrl>;
> -               reg = <0x0 0xf723e000 0x0 0x1000>;
> -               interrupts = <0x0 0x49 0x4>;
> -               clocks = <&clock_sys HI6220_MMC1_CIUCLK>, <&clock_sys HI6220_MMC1_CLK>;
> -               clock-names = "ciu", "biu";
> -               cd-gpios = <&gpio1 0 1>;
> -               pinctrl-names = "default", "idle";
> -               pinctrl-0 = <&sd_pmx_func &sd_clk_cfg_func &sd_cfg_func>;
> -               pinctrl-1 = <&sd_pmx_idle &sd_clk_cfg_idle &sd_cfg_idle>;
> -               vqmmc-supply = <&ldo7>;
> -               vmmc-supply = <&ldo10>;
> -       };
> --
> 2.53.0
>

