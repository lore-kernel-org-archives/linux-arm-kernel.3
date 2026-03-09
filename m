Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32087EF371A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 08:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2ApLkjRL2QedGmp1n+UDf2va/yjoghU9uSXBLC6UBk=; b=QFrdAitHhv681TgkKxzgttY8ZA
	4K1PySuOr1bJgs1TMWzbYE7EkRrxSUV7b4o+ZkwDTfwVCtmBECr0wJMGvxVLb6jyfc5O9GtjAwoMH
	CdQubkl8X8ZF0aMis9tSkiMJXUZ148pQw2QuySOlO/9xP3NrhrXlRsXwJKarFyqoW+q/Nmx0oTjfr
	4ciaA1s0dQefvpJ+lGkpAxKSw7ur4B1gcJbEw6Zj9OZrh7D4/vYJuZGxYVfOpsDd8wFam1zZhCpP3
	EuSJIMrXj3vMezDFvsppT/YNj1WfoFnaS6m+quuF4Uw7swMG3aA5Sn9waCRxNL9E1DsLJOJiLAQO2
	DyQ1g2Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzW9G-00000006tQ5-11Jd;
	Mon, 09 Mar 2026 08:39:34 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzW9D-00000006tOG-3oEs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 08:39:33 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6611f41eebcso6080751a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 01:39:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773045569; cv=none;
        d=google.com; s=arc-20240605;
        b=QzYLoVGiAsH+p8NKxeOkflDb958ZFuN5R7ncIfvNqlHqn4nW3TT3vY7CAZbU8S/k+Y
         Mv1FY0C/lTm1dBp6ofodM12RrC7zGOVPXcI6Dw0c/Hv4rtlhmZIOOMreEppWi4JqHmc6
         XxtmW4wuoa+pGD3UWGUiS9/B/qBx15zKEDCSzEyfdJ6A1dcoZNfRikPQ1xPoHcXx0d1d
         K5dTi8FOyNZqmnZYm74rZmVeOQHaeR+4+DhdyO1BKJM689l3YwUIGWwqDI5fNwgZijMN
         OkJQ2rzJM6atzg1SPdhBPSwp+dt0+bEUaSzXhOaKL78XmCBBgbGuN9+iTfNcQn7bO9On
         hRYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=i2ApLkjRL2QedGmp1n+UDf2va/yjoghU9uSXBLC6UBk=;
        fh=24tMorMCyVfln7dN7VYJDzWrevAz5rizfrHd6hUPEQc=;
        b=eCUasP+khzGfkcR6VmV/1A2nr64saiEzPJ8SXq9FnklC4cGRY1JjsryMWDqcijsZhM
         B0+zxNTChOYNe4jkT+n7Y4IsJaRj8wFpLcQ+8xttxAEdA2TwwZByNq4be9Cp2eAXD6LH
         Bij7VeE/A8REHZlumvSjt3tfXHcYsVm4dnVGaXCzbetS6mZmnh2/nLBA8MtHTKE06fTo
         4r5EKWGk+SSsZP0CO8CJOByvGM9C/PwtZdcfwDG6T/ed69I9YAI0RNQW4+gzD0KwD5Ak
         jy0Dzn5P92It7SQ1BQcpCd7+Jm6O4O2/8m3MzCXDgHp+K+KbtA6pzEPjioNiGdt/plDx
         Aa7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773045569; x=1773650369; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i2ApLkjRL2QedGmp1n+UDf2va/yjoghU9uSXBLC6UBk=;
        b=TUaKgAtTkcSFfb+ulZg90PSLv8ZdBeDwC2nWxcChjZnxp3X8AP/3A2Qk/18CnUyZSu
         iHdn2Ftw+8QDDn77wPnkhc/q4IPxA5I8DbaEA0/zdY71eqtwOA67/PV5xVDaEZ1Czckg
         MrEzjR1LXVVE6DEtZf1EYvN6Cj/NyYn6DqSFiXOEvzz/5NGnwXEok8tHzPZfwvwdNmR2
         gwFZYMTrJPTe9ZFLJHkcesc+PpNRqNGOJ8qHI0kNJhQox+3S5TorqMWwzvrCnTEZGp+D
         Y+o3mSEpX0aSRq7IQkbm8EdT2bJexwAnhBqDS6JG6do0i8vfX9j9+DkOnD7cyTkGC8K/
         Nd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773045569; x=1773650369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2ApLkjRL2QedGmp1n+UDf2va/yjoghU9uSXBLC6UBk=;
        b=mTx2iEI31eXUYdB0k4GBS4DMvCbW4Jd3LTiCX98/qDliMfrMNjEEkvsE0C9pJcTi99
         rVD3rs+iRfaUrRqvdZD9vN08Q94A7HYZE0hpHcUNLQKt4QNaQ+qZvY+ZMKXDD5BaJm02
         UN+VNCdGaIMnJghzrruKRl2a7a0wfcoysrCW8ZUJMVtq9rqyoVuuQa2LP+EKELqjk2K4
         In0lkpvEOkhKeG+pOwCAvxuyt0ptnXAr7FBdrEjYRsc2y7piZC0S0vXBSPImn+N0xsrd
         9AhhAxdtpGXE5VjSgacjYYt5DLJ/OLC5jtXLkoT5Hc7FuQGK1RpFSVeULlP59LsU6FiY
         vaEA==
X-Forwarded-Encrypted: i=1; AJvYcCVV3Tx82C2EfrHL/LMSjATs3/zOhhiajin0qybBBAXQx/MDuYYvfh+UsqZbwNaDDeCSds6HpH1d6CBiiFTpmWeA@lists.infradead.org
X-Gm-Message-State: AOJu0YzqiqWtDVP8wSbdZswS5xSzfoWcyIveDcpWqc5npHNUm8FGw0Yh
	Ahf7V4S6nMz40dTS7ID7Atr1XFVkNpLI2Lyxqbx6FYO9Tlf3c56QZ+c66Rsb2JcfTzrrjZAADrR
	h74KmXVLuFSVColuag/2bE/kz31mwKyg=
X-Gm-Gg: ATEYQzzrkQYM7Ab5tofLwkiOXfweLgTzfB/xBQJohWY18X4iuZ7y0zbFbuvrlQ6uXF8
	WLbdkHQu5hzn+Wa2ycANtdDahLlkyuNDI2hsKnhiJG9JRczdZxNOF2IKsipOWFglYsdUoo9w9Qi
	9G74l/zhXkYgnFc9azY+oWYX3hM/XHjSeHcnjoWHbwoRERgqQFn83F3guhzSWGkuE9+bFa/ftv1
	djp0dNzHoh/93Mj6WUU7V28ytLyzvmPqCTvHhIEHCpGNhQBvA4xni89dM8lo/H784WqSUYIWFJT
	B6QCl62Z28kMEjcVVIuHjsAXNXkdvke5YBUPt4ap3ubp+Jy/EAwDpS1Rqo7f0OZFCnFDZcKGlK9
	j4wSYkA5BoNZy3/paGCynl801/iRCupxwHhOKvd51WdPyDqNM
X-Received: by 2002:a05:6402:1452:b0:660:b590:f4c7 with SMTP id
 4fb4d7f45d1cf-6619d45653dmr5529486a12.4.1773045569245; Mon, 09 Mar 2026
 01:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260306203103.3119790-1-robh@kernel.org>
In-Reply-To: <20260306203103.3119790-1-robh@kernel.org>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Mon, 9 Mar 2026 08:39:17 +0000
X-Gm-Features: AaiRm50fyrrjHlS8KQdRyNVWL8F5ziJnajJaVmMSS-XtEGWkK0fYH3J1bfJuGuM
Message-ID: <CALeDE9PuXTiyxkgB3OTUS1d6bJ_LSCjOSztUBFmNPuTQg-oR_Q@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: freescale: imx93: Add Ethos-U65 NPU and
 SRAM nodes
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Forrest Shi <xuelin.shi@nxp.com>, Peng Fan <peng.fan@oss.nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_013931_968238_1B48CE41 
X-CRM114-Status: GOOD (  16.69  )
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

On Fri, 6 Mar 2026 at 20:31, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> i.MX93 contains an Arm Ethos-U65 NPU. The NPU uses the internal SRAM for
> temporary buffers. The SRAM is larger than 96KB, but that is all that is
> available to non-secure world.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Peter Robinson <pbrobinson@gmail.com>
Tested-by: Peter Robinson <pbrobinson@gmail.com> # Tested on a NXP
i.MX93 11X11 FRDM board

> ---
> v2:
>  - Increase the APB freq to 133MHz
> ---
>  arch/arm64/boot/dts/freescale/imx93.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
> index 7b27012dfcb5..95cc60158349 100644
> --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> @@ -43,6 +43,29 @@ map0 {
>                         };
>                 };
>         };
> +
> +       sram: sram@20480000 {
> +               compatible = "mmio-sram";
> +               reg = <0x0 0x20480000 0x0 0x18000>;
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges = <0x0 0x0 0x20480000 0x18000>;
> +       };
> +
> +       soc@0 {
> +               npu@4a900000 {
> +                       compatible = "fsl,imx93-npu", "arm,ethos-u65";
> +                       reg = <0x4a900000 0x1000>;
> +                       interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
> +                       power-domains = <&mlmix>;
> +                       clocks = <&clk IMX93_CLK_ML>, <&clk IMX93_CLK_ML_APB>;
> +                       clock-names = "core", "apb";
> +                       sram = <&sram>;
> +                       assigned-clocks = <&clk IMX93_CLK_ML>, <&clk IMX93_CLK_ML_APB>;
> +                       assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1>, <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
> +                       assigned-clock-rates = <800000000>, <133000000>;
> +               };
> +       };
>  };
>
>  &aips1 {
> --
> 2.51.0
>

