Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A8EC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 13:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecAphYkfEdsn3BUh426paPfp1MReJf3vodIqrsyJcGQ=; b=qMDdyPdfdVphwYc046YYMSb86u
	/caUXuErp5X1oWNBA5EsVtlNZd47mblRktv03ydrNLJj4dinzHWkOi4gLTGXQdyfkHBAcSUPhe2M2
	ohcPm+W9HHA/4iK5Qq7OZNv81f0fGibXFgPoUhdbbqJ6tUOh03yz1qt3Nbf0SvWbMM5pJdx9VOVTL
	pxB8ZeVx5Ff6QiKxQzb2KClT/nXwy7ZCaNf4VUmhGNWkbHCQMCnmX98/2vjn6Qa5VaT6YqDUksKcZ
	QuEeorrX58LJJMbVulB+NntwuQf4po+bXB3/IwiTk2kgxH+ihJpLrxQ23GhUXZ30k/LS09WQXx6le
	lFxlqS0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAMh-0000000FYxo-06rS;
	Thu, 05 Jun 2025 13:10:39 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNACq-0000000FXYA-2Ufy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 13:00:29 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-72c09f8369cso242333a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 06:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128427; x=1749733227; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ecAphYkfEdsn3BUh426paPfp1MReJf3vodIqrsyJcGQ=;
        b=hi18g+n24Ev/syLCoU4IEDKk1AtRcdEWW2oHSX7OrqjFwcKBPwqemrKHlVZWGreU6Y
         elf2iFa1KjlVFQzlLKsgsULQIYBSN3cBDJQkj2fZokxgqCXImvvWSWyQbcTViEO4AwJS
         rPBLewWsgG0Bn41v8JICXiiCQnAHNxodA1iXRJ5dbEK/sdtGxHJzqFVmNcEd43CnWMxE
         KfZbhDI+BJU5afapOwG7BQO1Ki+vpyj674r9Ju4GhaJvbF49/HYaobSC81+p22SxnACq
         To5QKmpjThoOXHwJynvuv3udTne2VNMpdG+sfj3spGfh0o7JVqgAfwW9I2mHqUjJ6iZA
         P0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128427; x=1749733227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecAphYkfEdsn3BUh426paPfp1MReJf3vodIqrsyJcGQ=;
        b=dirnAjwjfIxoo/fxFHC+R+u/ysh84A5e6oN2ai47yTdkOa656WUVQTBr5USbHTLeUw
         zynlpblCTpNIy8db+ZhMFsg4NzLh7VzHKgz2KOG6y4s9Bx8ofwDllUlJge1EnudYsP5r
         B56nK1hSzb6us5wmbxk62IALsB8Y4AHDe1mM8wHk5NDbgR9TQ0Dp27qj9QzhDLCWLjQb
         8SYjRnwkN1FV8A3Cjl7t2orV+uVopo4ogeCrCo+TJu8Pb9CPnFyCx/gQs5U21mOXN1TN
         mz6GANgr0+hUdfVhshVyWizrAfdZ6YpzQVq7gedY9AKZeGRWgQqjl0cVzaZ3Yn6/4dl+
         J7Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWBWdsnJ2i8BHIPAP6/1l7U2cuQ+0v4WU2LvcILq9h7oj+o7H4wJaY4Ooa1tdhCyNZkAe7jIN5I/KmOgiuPjx7Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4EB1q3sYJ+tYKgIcb8RJS3iwFgXLxz752uFabuL45EN5ibK93
	icTi4x0YLhL1vDqLjuIzrMC+/bf8Fm6Ohn7gAltb8Gwdiwb7DWz4lCXRzryAqcnFJ5vwr+D8rWs
	9dvwy5ASpCJXeAqJm8+JSdul7hpsgPGEz5GY+NL74JA==
X-Gm-Gg: ASbGncs3WxSwTd2dDVzq/Ii4BW9Mo4zHexBi0+tqwvgebNHG4pfrIkwcs4aZYHnGyE/
	+R0NN3Qye6cB4dPoCR+l7jw0p5TB3mQSQAta8H6jesbv6m0SwsNc6JnlfX4xJKXXVqSXXegmrq9
	cRMKGNrN4W6YBFoeymxPgd7+3DWpRrrHaA2YM=
X-Google-Smtp-Source: AGHT+IG+FTUmGJ+/COgbGtwp15niG+cd9riFL26aortlN2WN5OKeL0bGxpdnRDnCKPZKQj5eRuIFsDW+Z69953+bUJA=
X-Received: by 2002:a05:6820:2686:b0:60f:9d6:bd08 with SMTP id
 006d021491bc7-60f0c7333b0mr4096808eaf.3.1749128425365; Thu, 05 Jun 2025
 06:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250523-b4-gs101_max77759_fg-v4-0-b49904e35a34@uclouvain.be> <20250523-b4-gs101_max77759_fg-v4-5-b49904e35a34@uclouvain.be>
In-Reply-To: <20250523-b4-gs101_max77759_fg-v4-5-b49904e35a34@uclouvain.be>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 5 Jun 2025 14:00:14 +0100
X-Gm-Features: AX0GCFsta0Lv7B_0omf8fUD6lFICgS_5x_1K74aulND6HJZCGnhF0KZN-f9c7f0
Message-ID: <CADrjBPr4QNQPBddcFBe8V4u7G9YW0vs=8jyxEuQ1gVDt1zcfiA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: exynos: gs101-oriole: enable Maxim
 max77759 fuel gauge
To: t.antoine@uclouvain.be
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_060028_631199_623ED884 
X-CRM114-Status: GOOD (  20.96  )
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

Hi Thomas,

Thanks for your patch and work to enable fuel gauge on Pixel 6!

On Fri, 23 May 2025 at 13:52, Thomas Antoine via B4 Relay
<devnull+t.antoine.uclouvain.be@kernel.org> wrote:
>
> From: Thomas Antoine <t.antoine@uclouvain.be>
>
> Add the node for the Maxim MAX77759 fuel gauge as a slave of the i2c.
>
> The TODO is still applicable given there are other slaves on the
> bus (e.g. PCA9468, other MAX77759 functions and the MAX20339 OVP).
>
> Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
> ---
>  arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> index b25230495c64dce60916b7cd5dcb9a7cce5d0e4e..84fc10c3562958ab1621f24644709e85a9433b9b 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> @@ -10,6 +10,7 @@
>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/usb/pd.h>
>  #include "gs101-pinctrl.h"
>  #include "gs101.dtsi"
> @@ -188,6 +189,15 @@ usbc0_role_sw: endpoint {
>                         };
>                 };
>         };
> +
> +       fuel-gauge@36 {
> +               compatible = "maxim,max77759-fg";
> +               reg = <0x36>;
> +               reg-names = "m5";
> +               interrupt-parent = <&gpa9>;
> +               interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +               shunt-resistor-micro-ohms = <5000>;
> +       };
>  };
>

If gpa-9-3 is being used for the interrupt I think we should also add
the pinctrl configuration for it. Taking a look at downstream the pin
is defined as

&pinctrl_0 {
/* [MAX77759: FG_INTB] > FG_INT_L > [XEINT_23 : SC59845XWE] */
        if_pmic_fg_irq: if-pmic-fg-irq {
                samsung,pins = "gpa9-3"; /* XEINT_23 */
                samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
                samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
                samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
        };
};

and then the fuel-gauge node declares

/* FG_INT_L -> XEINT_23 */
pinctrl-names = "default";
pinctrl-0 = <&if_pmic_fg_irq>;

regards,

Peter

