Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0D1C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u17cMuYGc5vtBTFcb6UewtH/WxUd/WeV4HHc12mdl6E=; b=xmyGyZwjuqHbT6jOrjNzoB9TFu
	SRxuUYR0THZdu64jnFCAEryyIVlfxCHUzHCiUIj5axwoq/zhK58VRe8MrYaCjpxXTywzqdsFKM9KC
	aR8G76Fuqb6Ula0dtNk8/Iz8C+zH3SZou/vkHefQG+Vx21AzXgzrw97WeXik3tK8xV9Zh/ckZIi4S
	R07vLKUck0StlJIaodU1sy+QQwkUUTSAwVYDsgZ6ulEZxihGoPVubuMK9yJmb7zFGIarQY7PiVl0S
	NCrH4k5rCaGp18YuGZjZsL11YFvkhbeh3nh4obTantavL7Wxa7Oc35yD1CAPdCrGGkmPPZIW8Ry1t
	fDAQfj4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VZf-00000007KcH-1S33;
	Tue, 15 Sep 2026 15:59:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VZd-00000007Kbh-2I8G
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 15:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=u17cMuYGc5vtBTFcb6UewtH/WxUd/WeV4HHc12mdl6E=; b=G0pnDfbH/B2ekfiwQ2Q7DliezK
	bRx8inbVVK/p16VoAokALxgRrpuznKaIt6HiYbBtcmbGtYf33D23fsLFyDrwf9ySu5ye5cSlswhvd
	38B4OwAKeB7hv5RU8MA80Cb/x3kOp+7wIzfhfEzmRjA9iIvVYUEhaZxA+r6NGNHYO+HKGlwQWdnXA
	yJq5S0saeJKJmsxk8EKTsPAp5FhnGs9t9YWe/wroLRxLJqth+paWewQh2SABosF1G5SxpBFSeBP5y
	LazFHly86c6/DQvOOWocTsNGOI1VrmR8G5IXao89zTFdWGwomltWuQ5aKhfviW2IWNIXHJPPTJWIM
	oLGWh+cA==;
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6VZY-00000006zUj-060Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:59:56 +0000
Received: by mail-oi2-x11.google.com with SMTP id 5614622812f47-4bb359e6878so1328249b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 08:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1789487989; x=1790092789; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u17cMuYGc5vtBTFcb6UewtH/WxUd/WeV4HHc12mdl6E=;
        b=XpKsh/MWbghaW5GUTgO7fWjR76SFlVsTTGh/u3voaaupjLJMTwx5zXfmuCiGm2yTXE
         ln5JvlyjT9dtrgrgDz6F36jCAKtju81X8l5Dourd5EePvAwATJE2B8TDGGldqsfpEIzZ
         Aoi71zJMs0ICfEKMoOW7njRnhsyys39GCEs68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789487989; x=1790092789;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u17cMuYGc5vtBTFcb6UewtH/WxUd/WeV4HHc12mdl6E=;
        b=T1UM8NkB3f15UXzG0dw0yYMQynUVpoQgiuMPSolNy5qDgyLy7if6+bt/ElyRmj3CZ5
         6CSWDG619dUeCzim99xMUnvqr1ckydYYlgYZPg7uUmsZiWr0qj13SwqdZ0my7K5+6jND
         EOBzid/Bp0v/tGSt9WyVAuaLF2aNO40/uhmgI1NMARoMvMyeUg9VSsxibfkHyBST8Boq
         5VpGrzQ+KLxIuYBYtVMQ3tArLa3P57bXoN9zq69i/n3/rK1vTApOrnu5K0C1BynpI0LW
         d8N5bmGuCS2h493tTy3WmBgnEoN+MFGlc60l4xp7yVi1KpYWkRhp2TxiJB9vppedEmbq
         0yPQ==
X-Forwarded-Encrypted: i=1; AKwUvBykccOXF+3g5qBRz6kzpbdlDigrHs30LJCIkin72VqIHAyWMsQHHXsHG+YzmXIN6H3C72PmJVTydqfU4lK/QDUa@lists.infradead.org
X-Gm-Message-State: AFuF++moFUkg6r6KSBU3T6yC8FIRl9KuRZJFG/Jgrt0Gdcpbt6pBausc
	SXPkIXIuLAobjMbeYX8RtSlGFbAliC3aBL1hiMRBKh12Hze6SYM9b+BU2HvzsUcKwA==
X-Gm-Gg: AYBFou0QGScJAQ77upDzcPeVJnDSl0D9gp6jIwVZ0LOL769spsjYrwubcTp9psITqEl
	lAta2+w+3TJGWVjXmfPssnsW9aCrJ6LxX53o74/Vn/k1C6643iRDncDLL81H4DPD1ZplKd/3fFt
	Rrycb4COy1JV+oZP7KJZFSqla5RFpfrkUQ1wBmOYhbhrJy5px9+omFOapEPHWzWGoCUQIgWF16F
	WXREHXbpi+odQFb0jc1mxshq8qF4dFm7nJ9WnnL13Y2NO0gbnqI8W4HVdgRhbo0yt042tHxXXZO
	aabCQi5Arwoq4HF40gxCpkix1n7QKlDzx3afIPE4O3KZZZXRsZm1l0xlEop1IGBdS802yRHqZIA
	OYimSgV2xNM3fDoBjEcwdfLp9+FGVMmN7cZIDCzizGK4EBwJbA0cGBREwEFmTGoCFkZ+rzeF1Zp
	DnLi6c+whe7KqyJ0ufo6cHVpG373nQ4ZpM2OhwI2ee+NcABp3iefwDt3S8ebvneXq35A==
X-Received: by 2002:a05:6808:1512:b0:4b9:a88b:888f with SMTP id 5614622812f47-4c7b5d89f12mr5055793b6e.37.1789487989169;
        Tue, 15 Sep 2026 08:59:49 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-4842a33f8b2sm18328fac.14.2026.09.15.08.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 08:59:47 -0700 (PDT)
Message-ID: <28bbceed-ec75-4916-b579-f33f63bff5d4@ieee.org>
Date: Tue, 15 Sep 2026 10:59:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next] dt-bindings: net: Use consistent indentation
 in the example
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Justin Chen <justin.chen@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linusw@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <clement.leger@bootlin.com>, Vladimir Oltean <olteanv@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jeff Johnson <jjohnson@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alex Elder <elder@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Roger Quadros <rogerq@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 ath10k@lists.infradead.org
References: <20260914155645.112508-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20260914155645.112508-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_165952_559763_9ED0C404 
X-CRM114-Status: GOOD (  20.62  )
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

On 9/14/26 10:56 AM, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
> 
> In cortina,gemini-ethernet.yaml also drop the wrongly indented mdio bus,
> because it is not necessary for the example.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Overall looks good to me (but the IPA binding in particular is good).

Acked-by: Alex Elder <elder@riscstar.com>
> 
> ---
> 
> Changes in v2:
> 1. Mention mdio bus removal.
> ---
>   .../bindings/net/brcm,asp-v2.0.yaml           |  2 +-
>   .../bindings/net/cortina,gemini-ethernet.yaml | 52 ++++++--------
>   .../bindings/net/dsa/renesas,rzn1-a5psw.yaml  |  4 +-
>   .../bindings/net/intel,dwmac-plat.yaml        |  6 +-
>   .../devicetree/bindings/net/mdio-gpio.yaml    | 16 ++---
>   .../bindings/net/mscc,vsc7514-switch.yaml     |  8 +--
>   .../devicetree/bindings/net/qcom,ipa.yaml     | 10 +--
>   .../bindings/net/realtek,rtl82xx.yaml         |  6 +-
>   .../bindings/net/socionext,uniphier-ave4.yaml | 32 ++++-----
>   .../bindings/net/ti,cpsw-switch.yaml          | 70 +++++++++----------
>   .../bindings/net/wireless/mediatek,mt76.yaml  | 32 ++++-----
>   .../bindings/net/wireless/qcom,ath10k.yaml    |  2 +-
>   12 files changed, 114 insertions(+), 126 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
> index a3db6d594c8c..7fcc564e820c 100644
> --- a/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
> +++ b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
> @@ -123,7 +123,7 @@ examples:
>               phy0: ethernet-phy@1 {
>                   reg = <1>;
>               };
> -       };
> +        };
>   
>           mdio@ce14 {
>               compatible = "brcm,asp-v2.1-mdio";
> diff --git a/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml b/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml
> index f0b5bea2458d..da9bc170cd54 100644
> --- a/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml
> +++ b/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml
> @@ -87,18 +87,6 @@ examples:
>       #include <dt-bindings/interrupt-controller/irq.h>
>       #include <dt-bindings/clock/cortina,gemini-clock.h>
>       #include <dt-bindings/reset/cortina,gemini-reset.h>
> -    mdio0: mdio {
> -      #address-cells = <1>;
> -      #size-cells = <0>;
> -      phy0: ethernet-phy@1 {
> -        reg = <1>;
> -        device_type = "ethernet-phy";
> -      };
> -      phy1: ethernet-phy@3 {
> -        reg = <3>;
> -        device_type = "ethernet-phy";
> -      };
> -    };
>   
>       ethernet@60000000 {
>           compatible = "cortina,gemini-ethernet";
> @@ -110,28 +98,28 @@ examples:
>           ranges;
>   
>           gmac0: ethernet-port@0 {
> -                compatible = "cortina,gemini-ethernet-port";
> -                reg = <0x60008000 0x2000>, /* Port 0 DMA/TOE */
> -                      <0x6000a000 0x2000>; /* Port 0 GMAC */
> -                interrupt-parent = <&intcon>;
> -                interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
> -                resets = <&syscon GEMINI_RESET_GMAC0>;
> -                clocks = <&syscon GEMINI_CLK_GATE_GMAC0>;
> -                clock-names = "PCLK";
> -                phy-mode = "rgmii";
> -                phy-handle = <&phy0>;
> +            compatible = "cortina,gemini-ethernet-port";
> +            reg = <0x60008000 0x2000>, /* Port 0 DMA/TOE */
> +                  <0x6000a000 0x2000>; /* Port 0 GMAC */
> +            interrupt-parent = <&intcon>;
> +            interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
> +            resets = <&syscon GEMINI_RESET_GMAC0>;
> +            clocks = <&syscon GEMINI_CLK_GATE_GMAC0>;
> +            clock-names = "PCLK";
> +            phy-mode = "rgmii";
> +            phy-handle = <&phy0>;
>           };
>   
>           gmac1: ethernet-port@1 {
> -                compatible = "cortina,gemini-ethernet-port";
> -                reg = <0x6000c000 0x2000>, /* Port 1 DMA/TOE */
> -                      <0x6000e000 0x2000>; /* Port 1 GMAC */
> -                interrupt-parent = <&intcon>;
> -                interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
> -                resets = <&syscon GEMINI_RESET_GMAC1>;
> -                clocks = <&syscon GEMINI_CLK_GATE_GMAC1>;
> -                clock-names = "PCLK";
> -                phy-mode = "rgmii";
> -                phy-handle = <&phy1>;
> +            compatible = "cortina,gemini-ethernet-port";
> +            reg = <0x6000c000 0x2000>, /* Port 1 DMA/TOE */
> +                  <0x6000e000 0x2000>; /* Port 1 GMAC */
> +            interrupt-parent = <&intcon>;
> +            interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
> +            resets = <&syscon GEMINI_RESET_GMAC1>;
> +            clocks = <&syscon GEMINI_CLK_GATE_GMAC1>;
> +            clock-names = "PCLK";
> +            phy-mode = "rgmii";
> +            phy-handle = <&phy1>;
>           };
>       };
> diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> index ea285ef3e64f..fab6aa6237e9 100644
> --- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> @@ -127,8 +127,8 @@ examples:
>                   phy-mode = "internal";
>   
>                   fixed-link {
> -                  speed = <1000>;
> -                  full-duplex;
> +                    speed = <1000>;
> +                    full-duplex;
>                   };
>               };
>           };
> diff --git a/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml b/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
> index 62c1da36a2b5..d1522216d32b 100644
> --- a/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
> +++ b/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
> @@ -91,9 +91,9 @@ examples:
>           snps,tx-queues-to-use = <2>;
>           snps,tx-sched-wrr;
>           queue0 {
> -           snps,weight = <0x10>;
> -           snps,dcb-algorithm;
> -           snps,priority = <0x0>;
> +            snps,weight = <0x10>;
> +            snps,dcb-algorithm;
> +            snps,priority = <0x0>;
>           };
>   
>           queue1 {
> diff --git a/Documentation/devicetree/bindings/net/mdio-gpio.yaml b/Documentation/devicetree/bindings/net/mdio-gpio.yaml
> index eb4171a1940e..36e51aaae9c0 100644
> --- a/Documentation/devicetree/bindings/net/mdio-gpio.yaml
> +++ b/Documentation/devicetree/bindings/net/mdio-gpio.yaml
> @@ -45,13 +45,13 @@ examples:
>       };
>   
>       mdio0: mdio {
> -      compatible = "virtual,mdio-gpio";
> -      #address-cells = <1>;
> -      #size-cells = <0>;
> -      gpios = <&qe_pio_a 11>,
> -              <&qe_pio_c 6>;
> -      ethphy0: ethernet-phy@0 {
> -        reg = <0>;
> -      };
> +        compatible = "virtual,mdio-gpio";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        gpios = <&qe_pio_a 11>,
> +                <&qe_pio_c 6>;
> +        ethphy0: ethernet-phy@0 {
> +            reg = <0>;
> +        };
>       };
>   ...
> diff --git a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
> index 86a9c3fc76c8..d825130b54b4 100644
> --- a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
> +++ b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
> @@ -197,10 +197,10 @@ examples:
>               <0x71040000 0x10000>,
>               <0x71050000 0x10000>,
>               <0x71060000 0x10000>;
> -            reg-names = "sys", "rew", "qs", "ptp", "port0", "port1",
> -            "port2", "port3", "port4", "port5", "port6",
> -            "port7", "port8", "port9", "port10", "qsys",
> -            "ana", "s0", "s1", "s2";
> +      reg-names = "sys", "rew", "qs", "ptp", "port0", "port1",
> +                  "port2", "port3", "port4", "port5", "port6",
> +                  "port7", "port8", "port9", "port10", "qsys",
> +                  "ana", "s0", "s1", "s2";
>   
>         ethernet-ports {
>           #address-cells = <1>;
> diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> index 68ec76fe4473..38e3830512fe 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> @@ -246,14 +246,14 @@ examples:
>           qcom,remote-pid = <5>;
>   
>           ipa_smp2p_out: ipa-ap-to-modem {
> -                qcom,entry-name = "ipa";
> -                #qcom,smem-state-cells = <1>;
> +            qcom,entry-name = "ipa";
> +            #qcom,smem-state-cells = <1>;
>           };
>   
>           ipa_smp2p_in: ipa-modem-to-ap {
> -                qcom,entry-name = "ipa";
> -                interrupt-controller;
> -                #interrupt-cells = <2>;
> +            qcom,entry-name = "ipa";
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
>           };
>       };
>   
> diff --git a/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml b/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml
> index 45033c31a2d5..07b39ef1fc62 100644
> --- a/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml
> +++ b/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml
> @@ -91,8 +91,8 @@ examples:
>           #size-cells = <0>;
>   
>           ethphy1: ethernet-phy@1 {
> -                reg = <1>;
> -                realtek,clkout-disable;
> -                realtek,aldps-enable;
> +            reg = <1>;
> +            realtek,clkout-disable;
> +            realtek,aldps-enable;
>           };
>       };
> diff --git a/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.yaml b/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.yaml
> index 4eb63b303cff..8c8622160abb 100644
> --- a/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.yaml
> +++ b/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.yaml
> @@ -121,22 +121,22 @@ examples:
>     - |
>       ether: ethernet@65000000 {
>           compatible = "socionext,uniphier-ld20-ave4";
> -                reg = <0x65000000 0x8500>;
> -                interrupts = <0 66 4>;
> -                phy-mode = "rgmii";
> -                phy-handle = <&ethphy>;
> -                clock-names = "ether";
> -                clocks = <&sys_clk 6>;
> -                reset-names = "ether";
> -                resets = <&sys_rst 6>;
> -                socionext,syscon-phy-mode = <&soc_glue 0>;
> +        reg = <0x65000000 0x8500>;
> +        interrupts = <0 66 4>;
> +        phy-mode = "rgmii";
> +        phy-handle = <&ethphy>;
> +        clock-names = "ether";
> +        clocks = <&sys_clk 6>;
> +        reset-names = "ether";
> +        resets = <&sys_rst 6>;
> +        socionext,syscon-phy-mode = <&soc_glue 0>;
>   
> -                mdio {
> -                        #address-cells = <1>;
> -                        #size-cells = <0>;
> +        mdio {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
>   
> -                        ethphy: ethernet-phy@1 {
> -                                reg = <1>;
> -                        };
> -                };
> +            ethphy: ethernet-phy@1 {
> +                reg = <1>;
> +            };
>           };
> +    };
> diff --git a/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml b/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml
> index 8b5da602a2e8..4d24dadfaa5d 100644
> --- a/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml
> @@ -192,50 +192,50 @@ examples:
>           interrupt-names = "rx_thresh", "rx", "tx", "misc";
>   
>           ethernet-ports {
> -                #address-cells = <1>;
> -                #size-cells = <0>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
>   
> -                cpsw_port1: port@1 {
> -                        reg = <1>;
> -                        label = "port1";
> -                        mac-address = [ 00 00 00 00 00 00 ];
> -                        phys = <&phy_gmii_sel 1>;
> -                        phy-handle = <&ethphy0_sw>;
> -                        phy-mode = "rgmii";
> -                        ti,dual-emac-pvid = <1>;
> -                };
> +            cpsw_port1: port@1 {
> +                reg = <1>;
> +                label = "port1";
> +                mac-address = [ 00 00 00 00 00 00 ];
> +                phys = <&phy_gmii_sel 1>;
> +                phy-handle = <&ethphy0_sw>;
> +                phy-mode = "rgmii";
> +                ti,dual-emac-pvid = <1>;
> +            };
>   
> -                cpsw_port2: port@2 {
> -                        reg = <2>;
> -                        label = "wan";
> -                        mac-address = [ 00 00 00 00 00 00 ];
> -                        phys = <&phy_gmii_sel 2>;
> -                        phy-handle = <&ethphy1_sw>;
> -                        phy-mode = "rgmii";
> -                        ti,dual-emac-pvid = <2>;
> -                };
> +            cpsw_port2: port@2 {
> +                reg = <2>;
> +                label = "wan";
> +                mac-address = [ 00 00 00 00 00 00 ];
> +                phys = <&phy_gmii_sel 2>;
> +                phy-handle = <&ethphy1_sw>;
> +                phy-mode = "rgmii";
> +                ti,dual-emac-pvid = <2>;
> +            };
>           };
>   
>           davinci_mdio_sw: mdio@1000 {
> -                compatible = "ti,cpsw-mdio","ti,davinci_mdio";
> -                reg = <0x1000 0x100>;
> -                clocks = <&gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 0>;
> -                clock-names = "fck";
> -                #address-cells = <1>;
> -                #size-cells = <0>;
> -                bus_freq = <1000000>;
> +            compatible = "ti,cpsw-mdio","ti,davinci_mdio";
> +            reg = <0x1000 0x100>;
> +            clocks = <&gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 0>;
> +            clock-names = "fck";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            bus_freq = <1000000>;
>   
> -                ethphy0_sw: ethernet-phy@0 {
> -                        reg = <0>;
> -                };
> +            ethphy0_sw: ethernet-phy@0 {
> +                reg = <0>;
> +            };
>   
> -                ethphy1_sw: ethernet-phy@1 {
> -                        reg = <1>;
> -                };
> +            ethphy1_sw: ethernet-phy@1 {
> +                reg = <1>;
> +            };
>           };
>   
>           cpts {
> -                clocks = <&gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 25>;
> -                clock-names = "cpts";
> +            clocks = <&gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 25>;
> +            clock-names = "cpts";
>           };
>       };
> diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> index ae6b97cdc44b..bf4116b057d2 100644
> --- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> @@ -325,22 +325,22 @@ examples:
>             r0 {
>               regdomain = "FCC";
>               txpower-5g {
> -               b0 {
> -                   channels = <36 48>;
> -                   rates-ofdm = /bits/ 8 <23 23 23 23 23 23 23 23>;
> -                   rates-mcs = /bits/ 8 <1 23 23 23 23 23 23 23 23 23 23>,
> -                               /bits/ 8 <3 22 22 22 22 22 22 22 22 22 22>;
> -                   rates-ru = /bits/ 8 <3 22 22 22 22 22 22 22 22 22 22 22 22>,
> -                              /bits/ 8 <4 20 20 20 20 20 20 20 20 20 20 20 20>;
> -               };
> -               b1 {
> -                   channels = <100 181>;
> -                   rates-ofdm = /bits/ 8 <14 14 14 14 14 14 14 14>;
> -                   rates-mcs = /bits/ 8  <4 14 14 14 14 14 14 14 14 14 14>;
> -                   txs-delta = <12 9 6>;
> -                   rates-ru = /bits/ 8  <7 14 14 14 14 14 14 14 14 14 14 14 14>;
> -               };
> -             };
> +              b0 {
> +                channels = <36 48>;
> +                rates-ofdm = /bits/ 8 <23 23 23 23 23 23 23 23>;
> +                rates-mcs = /bits/ 8 <1 23 23 23 23 23 23 23 23 23 23>,
> +                            /bits/ 8 <3 22 22 22 22 22 22 22 22 22 22>;
> +                rates-ru = /bits/ 8 <3 22 22 22 22 22 22 22 22 22 22 22 22>,
> +                           /bits/ 8 <4 20 20 20 20 20 20 20 20 20 20 20 20>;
> +              };
> +              b1 {
> +                channels = <100 181>;
> +                rates-ofdm = /bits/ 8 <14 14 14 14 14 14 14 14>;
> +                rates-mcs = /bits/ 8  <4 14 14 14 14 14 14 14 14 14 14>;
> +                txs-delta = <12 9 6>;
> +                rates-ru = /bits/ 8  <7 14 14 14 14 14 14 14 14 14 14 14 14>;
> +              };
> +            };
>             };
>           };
>         };
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> index e667d78b3ab3..a52cb8a0d409 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> @@ -408,4 +408,4 @@ examples:
>                             "msi15",
>                             "legacy";
>           ieee80211-freq-limit = <5470000 5875000>;
> -      };
> +    };


