Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0571098787
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 14:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txsLO2jkdNhN6oBkuArfXNgiBSygoSMNA3GUMB3p1q0=; b=M23ilo9MXSl63+WzhVxwDrdd7k
	+KXmF9MDVrHTx2dVvWmFqeyPAPzs4zrz1DM7cpJZ99V98YDNBx8dmzXakfBKAsQbE/wjNnw+EVLZW
	Vbs75sH0nJcdUx/wgnUIFgYMPxOo9pmj099cEORjzzpA6D/W8Kmx1X4AoN02bbqj1rwqevTLsoCgA
	UwEbmaZG8vKXRoVFD8nqIRM/U4d6OaTqs9PuL5UWX20Jg4vvt9GddH6TgwKR33VgRZnIG5RbSNcfN
	2RizNmxEgoz8dXdeQG0xeKyYtAW5vnCYcbFbpU1+H83KY2aygwcI595wMIeW1xVznKIiYBm15VMUw
	XoS/kgBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3aPX-0000000Cu32-36rt;
	Fri, 20 Mar 2026 14:01:11 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3aPU-0000000Cu2c-37rC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 14:01:11 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-41c0aae84e5so699387fac.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 07:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774015266; x=1774620066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=txsLO2jkdNhN6oBkuArfXNgiBSygoSMNA3GUMB3p1q0=;
        b=cF0TtwTjr7ZM1jmHD7XFXv4nqJUmJszGFqm1lnb/N8DjMZuwgcjMCiY/0vjUmFlcUN
         Un1b+w0+3r+CXMEzNs5Ecou/hByMLwS8wdLzZMktgxKsOv1sxNoOOQeDFqSgJRKSA3m3
         8xjX3pB7JB/Mzy3FYupHx7MnNRBZZyUhLwFmzHsYrxylW6B3fT/EJRiLrKGE+UWCuTAI
         z+hRqnXaznOipTs1nif2ugBhb+0XG58dbHkqySNls27Qn9gTo0QRaXOp5HvEnsXPqEG7
         WAShQX2X6y8X1LHs11OKhLaE0MvJO4ITOvuAz8pVlSm8ADXqOWP264xVeYhOh4mXwTCU
         7+wg==
X-Forwarded-Encrypted: i=1; AJvYcCX7U2ciAGe88fQP5PdPjX5goILomdZIHA+FIY5CqAUs7G/xcfU3r495Aod7XWXyjFVFECMBfIUEQ3j9Utt6WPqY@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhzawpj0vX8RmjE+LDfME/sLwKiajDtrKQRgSJg6X/1M/UXjyZ
	akd0X48y6RKvgWvfs4A7qgneoyNU2I+QW05u7CpOMNr5nh4KPEuWR8TanDr5x+mN
X-Gm-Gg: ATEYQzyEltTHe0RLJzuEL7gcZ4z34hsify66WHzCRhvYm1sWNoUq2+RBFZphyN5Crzj
	o1M/lbdyTnmDrFmASN4uetSJPkTZakvHfB4aEfYmHQyUcIDipghI7zugXEwQv2JJRANMDbwNXgQ
	gIhEeawlCGfRNZXRSVYbZ/Z7vDFvCJPwYn1evjGzVvS+lm8NcnezmacKF3/y15K4rsDaO+q0G7t
	N9C7ULWIl+K2BRHFEM0X5kALMd8tnZzuQzBQ0XcmEPBaiExhubT4X3NN8HKkuKyALTBteyqpL0U
	oCLDRzTuT3kOLX73hlZXS5gNXMBJefqZqb8E8b0lgOySXU+DRdd6OYuwtBy89Mvvsfn+tfsFk8W
	xknlSvBC/Mg1qSxD5lEb67+fcdsdlCKlgCyBFfV2PUjfXF2zCju8knoFgP4RJIHCnoMirTirJP4
	dgto2rVxccaHOb9ZM72pNvrt+SsKAPSIdWYjONl9+8faFjHL76+2KIpgGTdGLAqqT8fNlHUjRg/
	xHHxGHgpR1dUcYqWhlDXWWo+s6gV7AckOlwhCA8kR1oJTAhcPTl/fhyTGFsO1gj9iP4uPnsp7Bd
	rM6w9AP7
X-Received: by 2002:a05:6870:250:b0:417:5c29:acdb with SMTP id 586e51a60fabf-41c10f8dd32mr2080018fac.4.1774015265456;
        Fri, 20 Mar 2026 07:01:05 -0700 (PDT)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com. [209.85.210.50])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41c14e45213sm1944497fac.18.2026.03.20.07.01.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 07:01:04 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d4c383f2fcso1616602a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 07:01:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2/HzHIy14VllOQgb5yuiA7gOVNxmOolyOLtOjpS2v0LeTJi1JVKRDqaVZBYzyXqyub4W/ylVS4Hi+7yXfof57@lists.infradead.org
X-Received: by 2002:a05:6830:67c5:b0:7d7:d15a:ce8e with SMTP id
 46e09a7af769-7d7eb04feffmr2015751a34.32.1774015263260; Fri, 20 Mar 2026
 07:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
In-Reply-To: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 20 Mar 2026 10:00:26 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9b1VujkHCVdXowQs+BXA0+DL=6sdoP0wuSYpau4T31XQ@mail.gmail.com>
X-Gm-Features: AaiRm53Q86Nf9dVOSTKn0cYEE4xmDvp3jUYoCfYFj-SX9hFNk_weUYFVfwHr6Ok
Message-ID: <CAEg-Je9b1VujkHCVdXowQs+BXA0+DL=6sdoP0wuSYpau4T31XQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] Initial Apple silicon M3 device trees and dt-bindings
To: Janne Grunau <j@jannau.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Sven Peter <sven@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Sasha Finkelstein <fnkl.kernel@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-pwm@vger.kernel.org, Michael Reeves <michael.reeves077@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_070108_811236_16672DF2 
X-CRM114-Status: GOOD (  16.93  )
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

On Fri, Mar 20, 2026 at 8:23=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:
>
> Hej,
>
> This series adds initial device trees for M3 Apple silicon devices. The
> device trees contain only a minimal set of hardware not going much
> beyond the minimum required for booting kernel and initramfs and
> verify via serial console that the hardware and drivers work.
> The hardware with the exception of the interrupt controller is
> compatible with the M1 and M2 SoCs and the existing drivers.
> Changes for the interrupt controller were sent separately in [1] and are
> picked up and in linux-next. The device trees pass make dtbs_check with
> the apple,aic2 dt-bindings change from that series.
>
> Link: https://lore.kernel.org/asahi/20260223-irq-apple-aic3-v3-0-2b732807=
6b8d@jannau.net/ [1]
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Janne Grunau (9):
>       dt-bindings: arm: cpus: Add Apple M3 CPU core compatibles
>       dt-bindings: arm: apple: apple,pmgr: Add t8122 compatible
>       dt-bindings: power: apple,pmgr-pwrstate: Add t8122 compatible
>       dt-bindings: watchdog: apple,wdt: Add t8122 compatible
>       dt-bindings: pinctrl: apple,pinctrl: Add t8122 compatible
>       dt-bindings: i2c: apple,i2c: Add t8122 compatible
>       dt-bindings: pwm: apple,s5l-fpwm: Add t8122 compatible
>       dt-bindings: arm: apple: Add M3 based devices
>       arm64: dts: apple: Initial t8122 (M3) device trees
>
>  Documentation/devicetree/bindings/arm/apple.yaml   |   18 +
>  .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |    4 +-
>  Documentation/devicetree/bindings/arm/cpus.yaml    |    2 +
>  .../devicetree/bindings/i2c/apple,i2c.yaml         |    4 +-
>  .../devicetree/bindings/pinctrl/apple,pinctrl.yaml |    4 +-
>  .../bindings/power/apple,pmgr-pwrstate.yaml        |    4 +-
>  .../devicetree/bindings/pwm/apple,s5l-fpwm.yaml    |    1 +
>  .../devicetree/bindings/watchdog/apple,wdt.yaml    |    4 +-
>  arch/arm64/boot/dts/apple/Makefile                 |    5 +
>  arch/arm64/boot/dts/apple/t8122-j433.dts           |   19 +
>  arch/arm64/boot/dts/apple/t8122-j434.dts           |   19 +
>  arch/arm64/boot/dts/apple/t8122-j504.dts           |   37 +
>  arch/arm64/boot/dts/apple/t8122-j613.dts           |   35 +
>  arch/arm64/boot/dts/apple/t8122-j615.dts           |   35 +
>  arch/arm64/boot/dts/apple/t8122-jxxx.dtsi          |   48 +
>  arch/arm64/boot/dts/apple/t8122-pmgr.dtsi          | 1149 ++++++++++++++=
++++++
>  arch/arm64/boot/dts/apple/t8122-usbpd-i2c.dtsi     |   32 +
>  arch/arm64/boot/dts/apple/t8122.dtsi               |  444 ++++++++
>  18 files changed, 1859 insertions(+), 5 deletions(-)
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260319-apple-m3-initial-devicetrees-5c546ad977a2
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>

--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

