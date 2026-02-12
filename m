Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19DEEDF04C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 08:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bjVwokrZxKsldJsperXEzSS9XKywY388N/cfuXNnbI=; b=PviKKOXfBXQlTAy2D/wPbw2cNf
	0JNlee4IL4QIKwUc/05Ct8umCjBhvh6DizJUgnNCu+/LWdTijAgfX3uQR3N5JtAHsUuNTcx9nt9Xq
	SbNMdgmkP2A7/ZqwtF2cKJpxwu/+rzvwYs4WT1kcbUXuLeOgTo4Tgd3JY45sS2kWy+s7wLI8u0etq
	kGTgIt92troJaRo8c77hbIF0EanRHIJlubtiPTpZG9rbg64ePDBQO2tb+xP0fccmTApkS1PcF/PB5
	pT5QYc9JDrl2xnZ6mWGAhXK6TzOZ5TD1SOBAY9ALFwei4phBcHEREQ4HWhe9uBgWpQF+6jnS91XDj
	lZU4JhHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqRdq-00000001jlf-12im;
	Thu, 12 Feb 2026 08:01:38 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqRdg-00000001jjZ-2xfy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 08:01:35 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b8f7a30515aso183491866b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 00:01:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770883286; cv=none;
        d=google.com; s=arc-20240605;
        b=K/GDsgw70v6eoMivAR8JTFN+YAZiPmmSQP3VttsJsglJQeP8CU5AkWCJeKwYhpnIwX
         ZI5zDmVEJvx10+Xtj8NnR19QAJyhhvFIoSFmNUf2odNASM0DwyP+Z4IkH3mcjdM46ejY
         Uq3QMz3p2deqyeJMx4Ch1CGhocgJramdHxp9a7/eDN0uxWkiCMWtFR5p6S4AP1/XNtWJ
         mV9W7fw1BuwnLYmeu4M9Xv2/noqQ3pYXdu87/+13BgDUzVv5All1cfAG2ZO4QIRKNOjB
         CV53aktb97J/AzZC82+hMaCbBq8FLYhL1vTHJOr0cGMXcsJRKk6JTtMBhXIybQEbJNWC
         DbuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/bjVwokrZxKsldJsperXEzSS9XKywY388N/cfuXNnbI=;
        fh=BKqws510j3Y+ztFClkYa1JrtQfEL6PS53n0PvTlpryM=;
        b=JIzPzvA16VQaf3LQcXV446BirOkq8gM/D5xNgnfVuiLzsrOEF3kys3PRiIDOd3s8qp
         A/dwppJHXTP2nCk778DuU6kTnyujl5g3ROaEqMR7yahLXAGsyfJ5lWNYXH+YyypInL6I
         hyBNW9D3qcQ1d3HbFgUVplOsk5VS9MDcoOxIFULUDoLGEdomPP2sYLYFoLoRWMKF/tHO
         FgmoOucu6QQqrKMn0fpNGppGmVCWL2kMJ0wapMQT5OJnOfwCzYOVj4Q62MvRljlC0jdb
         RM8rxOF4Ld4khla7BoFISb7kOfKU7Ak554uefz1hfsNskQlFwN3QJh4+1OQ5q+uYwuzj
         HTMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770883286; x=1771488086; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/bjVwokrZxKsldJsperXEzSS9XKywY388N/cfuXNnbI=;
        b=nqUjCAfwQ2u72aZw/w/FZ8+MRXHJKgAzrtBS2RZzctaEMzCZ1wCh6dSP/P3ZESbzgm
         Q+xGLyB5THsEcNcl4KekRhXJfM3EouiN/w7dB1okO5/v7X9WvlXEsfaXyJdKQC2To1HJ
         4kREBPdD+Vm1AHMibeJtB0BbY3RDfny3U0TTGH1C2YK+kRX6KmzoeYzftcDVU9P5wqBd
         sJVdea9YwjvvOjzJchFHPeytwJXiJvDrL1jl08R4zgNteGeFxvU4tKn52ycgCE/Fsnm3
         6JxMAAiVzRofu0aSFyPkZl8bnGxFkCtABoEvMgfjJoM0oiwVOxr+0PuIUCQOGeE3lBU8
         VTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770883286; x=1771488086;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bjVwokrZxKsldJsperXEzSS9XKywY388N/cfuXNnbI=;
        b=L/7Nzw0M1axCcfjh/Mxp/bJZaO19SIY731Zq5izsE/iOz4/5RTq3W2QqTT38mShr+s
         5f+FB0968vFYwhg5uiTwFzAcd+EGFG/p3wIE4t+loABF3PINyrE3QN3SgHsxehIlar+q
         zKbDSYxY5w0H6soE4gLJItNUgUDPbCg9ERJjtTncGbmfTvXqyGd0Hxuv6lCbQ8CiVzwK
         rUevSQjVGJdIc8VFw4Go40YnGZSe7FhtRct4x6dE2KZ9ZCEj1CZF6K2zGJninOQMgYuW
         EjLWmTLYSvqI9ej9hYx5Qyn6g1oJdvjNz4QIpGcKeXtz0xP9gZYbJblSGCp1qhP74KL6
         +M6A==
X-Forwarded-Encrypted: i=1; AJvYcCUZ6GCxHYRZy1VkNVTDC3Wj8+GVuxt0/WPLQDs7iFYse3q8THmgQOOh6pF0Ml+oXl8B1p+KRSOyP8sqHqehze4f@lists.infradead.org
X-Gm-Message-State: AOJu0YwMc75NHiat4hQmFv0FVLY+gatHeo3mqi6gdHaNFoqHOQfIaC91
	lcCXIK0zF+xGhY6cGfVuY/+ntE053CJhTN7JD/ImbmqE0lfd1nIEKxW+Qz1LST3ER74FXHz4dHE
	WnqIuATTEX9qH3Oed0uO4x6MFdfpwkaM=
X-Gm-Gg: AZuq6aJUNYLy3Zlhl7ayQT5Doq/ntoYwhKXoMCCKoUMDzgrIs0+aVzApbMjWuSbRnIK
	0xTHmWZ9zzJUziRAQVt2dAVFYyfuvax99ycBOsWzItXDMcOdzeqzmmgXHaUOlO9p9kb1vb/dFYs
	Xukr/mAK50Lds1ehXYAFShtUE1PwrSzremh9ErwabRHsls7n6H25ENtmT2ZFuKEM5PZ2l46MBlt
	Adwj+1HGwm7txwSIKwHb8Qzbv1hM7zf4956lQvJAwjZJZ29NYhuPc2Ln/NTIKctC4JQhwRkOHB2
	x9wMPNNnhPgVC/PR
X-Received: by 2002:a17:907:5c6:b0:b87:728a:81ac with SMTP id
 a640c23a62f3a-b8f8f229912mr118971966b.12.1770883286087; Thu, 12 Feb 2026
 00:01:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770836189.git.l.scorcia@gmail.com> <72dcec7fe8bfd8ee7e8ef58708690268f3c07d42.1770836190.git.l.scorcia@gmail.com>
In-Reply-To: <72dcec7fe8bfd8ee7e8ef58708690268f3c07d42.1770836190.git.l.scorcia@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 12 Feb 2026 09:01:14 +0100
X-Gm-Features: AZwV_Qh-kArDFbixo6RuZvbk22282A_FJyXPAiI4Zij2df0ii1VxnMVAlbiH_j4
Message-ID: <CAORyz2LRkVcOss3vFS3Y3FtZfn_s-Um8G9JLgedXEeySorr0=w@mail.gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: mt8167: Add the mmsys reset bit to reset dsi
To: linux-mediatek@lists.infradead.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_000132_398936_47EA9F93 
X-CRM114-Status: GOOD (  16.78  )
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

I apologize for the mistake, I did not notice that the dsi node is not
present upstream yet, so this specific patch won't apply. Any comments
are appreciated though!
I will send a separate patch to add the display nodes to the dts and
the required compatibles to the bindings.

Il giorno mer 11 feb 2026 alle ore 20:06 Luca Leonardo Scorcia
<l.scorcia@gmail.com> ha scritto:
>
> DSI hardware reset is needed to prevent different settings between
> the bootloader and the kernel.
>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8167.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> index caf51f203dd3..ee2792d53b2c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/clock/mt8167-clk.h>
>  #include <dt-bindings/memory/mt8167-larb-port.h>
>  #include <dt-bindings/power/mt8167-power.h>
> +#include <dt-bindings/reset/mt8167-resets.h>
>
>  #include "mt8167-pinfunc.h"
>
> @@ -189,6 +190,7 @@ dsi: dsi@14012000 {
>                                  <&mmsys CLK_MM_DSI_DIGITAL>,
>                                  <&mipi_tx>;
>                         clock-names = "engine", "digital", "hs";
> +                       resets = <&mmsys MT8167_MMSYS_SW0_RST_B_DISP_DSI0>;
>                         phys = <&mipi_tx>;
>                         phy-names = "dphy";
>                         status = "disabled";
> @@ -295,6 +297,7 @@ mmsys: syscon@14000000 {
>                         compatible = "mediatek,mt8167-mmsys", "syscon";
>                         reg = <0 0x14000000 0 0x1000>;
>                         #clock-cells = <1>;
> +                       #reset-cells = <1>;
>                 };
>
>                 smi_common: smi@14017000 {
> --
> 2.43.0
>


-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

