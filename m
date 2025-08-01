Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E274C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 23:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qnr0gleEzCaWRPAfwAkPAasxmEHLjKhxCSZjhfl6r00=; b=yJWNZizy4h5Uu+uP2/LtDcJdcH
	MxzTx6nOZNlE/bZxpPWcWdt1uTYe6tKAcpZD5xjCxgEjECueOcfzS0uvXaaVVaI6XA917g2hLD8vc
	sMHIjlBPHEiQHgZEqpNsJypPjt5YOieZICxUE3mObC5Qr6wDHNhAhmSmyct0qYxuOcWOcdYrFocpX
	/oRH0T2yeuL47XcLztyGMokY5ioD9j1QZQApDekvBey0i9HI3ZJnMqr7KtGQ05Z5LH8AICshio9EE
	UDKo8Qu6mVix9Iix6Mu1XHMj9N8cTQwCAZjcNpCWwd8LVCWgOedDw5hNgnGUUjqDWNIUr3GLcTKFa
	+YcrkLEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhyyS-00000006vGC-3gJa;
	Fri, 01 Aug 2025 23:15:40 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhyvr-00000006v5o-2HqC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 23:13:00 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e8e0aa2e3f9so2212626276.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 16:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754089978; x=1754694778; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qnr0gleEzCaWRPAfwAkPAasxmEHLjKhxCSZjhfl6r00=;
        b=gTVDv4futs78a7+aoLhJMbdwUdBqLo5KjOGyw2x29vQwx90YmjMXRQp7UZ0GrtFXpR
         B4jCjoAahWESCSH7y/xJ3z/IO8KhvXxLPKmif1YQSbjaCv5IW2b9FQMsQmJJVkUaLqQP
         NQPiD6+QfTd5Wi5BzGjCZWWrVjLH78eWOkNv3ux9aouX9TnT1p31cPsXtODZrotFOn1a
         VtRGUsBx9vgqcOnAI7BXfwtMXlEzPW5PyM4O5+wRNyKmlMKPe3l+ADBZ97aMILRC0KNC
         Q1B4WHuyMUzH5E9MVOvhrcbnBWj/aTUMi5yLmM8ho5ppXZy45kaQZZAOF8gwa8cSRHM1
         pYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754089978; x=1754694778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qnr0gleEzCaWRPAfwAkPAasxmEHLjKhxCSZjhfl6r00=;
        b=iYV75ZRgkvxVxOMkmvIwJ2DcCFSojUxenPtjjIy29Xaa4Shijpp1w7cb/w3Lnp3q+v
         Hw2IwIp247V2YSMCswASK87CC1s3SD0J/GT0w9vbmbBSNd3RCTZXfyPhaI0fDe/n+yyr
         01Se3mQIrXktj38N/WAcG6Yj4+J5b9to743gY72z2nel44BcWY09EME3VtJZvrweP+Kc
         SAerTBwLzekLjL21rZ3eDl0DcfjD6kB8YU2KPRa9GoawSqFEBq+6Idi3CBCzxZIFcaTz
         DMGUUqTogcJDc8DBcYWanG8NGHUt5G+YEAWypHaAtxjNepOxhloiXfuCmE01+DbZubvU
         jn1A==
X-Forwarded-Encrypted: i=1; AJvYcCXVKPwWVYW7Bk+8+PBOPNBwM3nlMp9x6cD/LYPDyx1yQDY35/je8qDe/DhPd6+WZloHXqYCx5/1meBz8VM2xg0j@lists.infradead.org
X-Gm-Message-State: AOJu0YzXdh9RUJILzVhfPym755sXat1GN8xcD0AHnAbPxviTIGm5obH4
	y9sB7Qoi/FmZKH9AAHMJ9yY0eCiVUpj4vd+lSk+sKbu+AG8weQXtmOeBSc78vLbD+tnmBGNlQiH
	x2CNcA2MTh9HzAlpOmWdLCOsHQqVbA423rECUOkOtfg==
X-Gm-Gg: ASbGncuFbyHFEytlW0iCXNXUrv1VRgoSbZaf3o/JSc0+A36uWN2vUgsnNRwyhQPhMpc
	qapY32cQcMT3K4DHHZLLewiUDwRa+zD9aOcWkLdkGJRVLNOoI9WND/UDxa4XRywa+KjffVUWAMA
	15eiOUx/McB6azim7URhBD5pu+SYRGkNFmJvbwGff58Cv5QkUuqpYY1+8kdit3A0ezjRw8vpPj2
	yRhIw==
X-Google-Smtp-Source: AGHT+IFgbhp0zycvCOOvLLcXqyA8OgsubbXQ2AW066KqqN7IDoR7AWFw0XrDwVG6iqqj5YKOJnybVqjIOE+529ZV8Tc=
X-Received: by 2002:a05:690c:d96:b0:71a:1e72:84c6 with SMTP id
 00721157ae682-71b7f5e133emr20973427b3.1.1754089978267; Fri, 01 Aug 2025
 16:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com> <20250730074253.1884111-5-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250730074253.1884111-5-ivo.ivanov.ivanov1@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Aug 2025 18:12:47 -0500
X-Gm-Features: Ac12FXzKSBmhmwqRZhR5hadTWEjBctW2rRjuv0sswLAzvNtoYbb40IWjhC7MaD8
Message-ID: <CAPLW+4kOiBOZYQVA-ZiMEn+-_ZF1HD8QTm9AH0y34bcY+Mu92A@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: exynos2200: add serial_0/1 nodes
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_161259_604561_5AC54972 
X-CRM114-Status: GOOD (  18.67  )
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

On Wed, Jul 30, 2025 at 2:43=E2=80=AFAM Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
> Add nodes for serial_0 (UART_DBG) and serial_1 (UART_BT), which
> allows using them.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos2200.dtsi | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot=
/dts/exynos/exynos2200.dtsi
> index bab77b442..22c6da907 100644
> --- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> @@ -336,6 +336,19 @@ pinctrl_peric1: pinctrl@10730000 {
>                         reg =3D <0x10730000 0x1000>;
>                 };
>
> +               serial_1: serial@10840000 {
> +                       compatible =3D "samsung,exynos2200-uart", "google=
,gs101-uart";
> +                       reg =3D <0x10840000 0x100>;
> +                       clocks =3D <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>=
,
> +                                <&cmu_peric1 CLK_DOUT_PERIC1_UART_BT>;
> +                       clock-names =3D "uart", "clk_uart_baud0";
> +                       interrupts =3D <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH 0=
>;
> +                       pinctrl-0 =3D <&uart1_bus>;
> +                       pinctrl-names =3D "default";
> +                       samsung,uart-fifosize =3D <256>;
> +                       status =3D "disabled";
> +               };
> +
>                 cmu_hsi0: clock-controller@10a00000 {
>                         compatible =3D "samsung,exynos2200-cmu-hsi0";
>                         reg =3D <0x10a00000 0x8000>;
> @@ -458,6 +471,19 @@ pinctrl_peric2: pinctrl@11c30000 {
>                         reg =3D <0x11c30000 0x1000>;
>                 };
>
> +               serial_0: serial@11c40000 {
> +                       compatible =3D "samsung,exynos2200-uart", "google=
,gs101-uart";
> +                       reg =3D <0x11c40000 0x100>;
> +                       clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>=
,
> +                                <&cmu_peric2 CLK_DOUT_PERIC2_UART_DBG>;
> +                       clock-names =3D "uart", "clk_uart_baud0";
> +                       interrupts =3D <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH 0=
>;
> +                       pinctrl-0 =3D <&uart0_bus_single>;
> +                       pinctrl-names =3D "default";
> +                       samsung,uart-fifosize =3D <256>;
> +                       status =3D "disabled";
> +               };
> +

Shouldn't these two serial nodes be children of some corresponding USI
nodes? IIUC, the downstream counterpart of this device tree is [1]? I
can see the corresponding USI node is missing there. And if you don't
have the TRM, it might get confusing. But, apart from my intuition
telling me that those UART blocks *should* be implemented as a part of
USI IP blocks in Exynos2200, there is also a fact that the downstream
driver is actually accessing USI registers in exynos_usi_init()
function, in the exynos-uart driver here: [2]. If that's correct, it
means there should exist a USI block, which should be modeled like so:

8<-------------------------------------------------------------------------=
>8
    usi_...: usi@11c400c0 {
        compatible =3D ...;
        reg =3D <0x138200c0 0x20>;
        samsung,sysreg =3D <...>;
        samsung,mode =3D <USI_MODE_UART>;
        #address-cells =3D <1>;
        #size-cells =3D <1>;
        ranges;
        clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
                 <&cmu_peric2 CLK_DOUT_PERIC2_UART_DBG>;
        clock-names =3D "pclk", "ipclk";
        status =3D "disabled";

        serial_0: serial@11c40000 {
            compatible =3D "samsung,exynos2200-uart", "google,gs101-uart";
            reg =3D <0x11c40000 0x100>;
            clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
                     <&cmu_peric2 CLK_DOUT_PERIC2_UART_DBG>;
            clock-names =3D "uart", "clk_uart_baud0";
            interrupts =3D <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH 0>;
            pinctrl-0 =3D <&uart0_bus_single>;
            pinctrl-names =3D "default";
            samsung,uart-fifosize =3D <256>;
            status =3D "disabled";
        };
    };
8<-------------------------------------------------------------------------=
>8

This way you can achieve the same behavior as in downstream kernel, by
making the (upstream) USI driver to initialize corresponding USI
registers for you.

Does that make any sense?

Thanks!

[1] https://github.com/jgudec/android_kernel_samsung_exynos2200/blob/CWAI/a=
rch/arm64/boot/dts/exynos/s5e9925.dts#L4648
[2] https://github.com/jgudec/android_kernel_samsung_exynos2200/blob/CWAI/d=
rivers/tty/serial/exynos_tty.c#L2181


>                 cmu_cmgp: clock-controller@14e00000 {
>                         compatible =3D "samsung,exynos2200-cmu-cmgp";
>                         reg =3D <0x14e00000 0x8000>;
> --
> 2.43.0
>
>

