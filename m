Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07C8F3D5FE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 11:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uU0NTK7NMSNT2kDGknARBu8N7YysrPeJ5XlwaOTRHqc=; b=EP+CElceikBxN1eMxJJKdzZtPU
	SzJi20ZGi2/p4gj2up53eaNiaDTt94dPtHkZWlCp7O5sxXEH/N46LtpJvri9y80wz+OXneimEAnhy
	rTAwT4IsNR3q78tcXP8A0V3FNMmp/N0JP2WkhGJDc52IYvux8GF4kd6yYd6lrWwcPZ11TFBAKWf/5
	U5R5h63YwgrUMpiieWMH2E25y/zI3MqgJF6y4C6jUDSq/YoTFT0ygMaaXZiS8PSjEngKjg8Nkk7Y7
	pD/oii+lFYZZ3ewdYLCpvYXXDLFWrS2h1k0rXbkLCfIAcFm/+EKPRa9fa0l38tj0pu33ZUD3Wdozk
	kLSxu06g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6oiH-00000009tA6-0lUp;
	Sun, 29 Mar 2026 11:53:53 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6oiF-00000009t9h-0aJI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 11:53:52 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48538c5956bso34854785e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 04:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774785229; x=1775390029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uU0NTK7NMSNT2kDGknARBu8N7YysrPeJ5XlwaOTRHqc=;
        b=KFSLBjqbMKt8k38/gFm37/Farxdu83+rB63HlZ7MIDyebSe9GBqSF2eW7iOmjcaHtl
         TFAxDAkUPtuzB6/7Ik5mo+CWpDAuxw/tM219t9YRo3Jx0nO0ZVEgDk1uL9x4VgmK8w3h
         gA65Dsat8qSssFLpT0zm4XaPj3aEIcNXdHSpM/KfIwmYp32NidO5tu9/9LFfzz612yx5
         Nn7mDuavvszu1bnTatwKRrLj+A5aIY1+7wLUjDk/ULfEYUC03CTHMBgduQM+zb2uW6s1
         ClALkvqn6hycwvpS3ZnVo8uJl2DjLTd3J1li0K9jnz9PDro2qTjXrGfXkZ22Mc9+tB+b
         zQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774785229; x=1775390029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uU0NTK7NMSNT2kDGknARBu8N7YysrPeJ5XlwaOTRHqc=;
        b=jhqWhHHhrVDSq1WsFBOs0wewlUr6Gyzd3gTk6NDfkekhpoUv2mAofLNxdWm3nSFQ1l
         llkyovFa57x7+2G8qYMXRjHnmorbZD2dgCIbTVPWAc3w5V9HMJ79rkZgqrUjAV79bnW7
         kTrxSVvPVqALi/ju7rpynhWboLedejIUbAznWX8KZpDFwoj55zdfTDNhEA5Ne2PtfnUn
         9aA1ZKqZwAGS/7WPXcKRf/AsoGI7gfXVknB2BwBGcZWK6xiTHiIrg5JrynPI7ero/BGq
         PRXbokq0mQdzJRw05/T8vY89faFmQKgQUswkzfshxoqQAqAbIeZYn6wjD08BXi/QKrL4
         24gQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2G+hLQ94Gtgd04PZwQXpJctlevrnQaUA6oHAbSPcaQDyc5f1myQM7XbNRNrt/f/bmmjhXAJH3wgK1G4DL/sSw@lists.infradead.org
X-Gm-Message-State: AOJu0YwkU/FBCIq1HiZQCwrFqhcgxYl+2th8Qg97cmTRGBbOETey2ZH2
	yZFVNB1iizqRWINObrYQh1l2JLojFhCODhsedtTf+bEFSsrcKrMXOc+e
X-Gm-Gg: ATEYQzztgq+w22a0SD1ZCn8j8+vQV7JJR1RMM5ASFwc8TJNQiOpQanwnFDvuWYdbBvV
	atGJgTjecHxBLD3DlYojDLeqZd8oZONIQEFsGARWM03dW/HtouOtNHwkaU3ulrlrsJRXiH4Dd0t
	rU2ivyXuQ9Q0Uekvjgnqsy+jNc3WlOAV2C0k5UZsNCWDLbabnBWRD/KgKsyyid5kKY+IofHKp/b
	ENjCi6QVj+VXvpmjJDMNjGS1M/HUf8En92CinPNaVCVjwdxDNWtscnJL6v5UD9AnszbU9yj+rBa
	gpm9fuONwYq8+dijZIzl/2R79y5nl+/3MVYe1urRAzAEkxy/inQn7fpOCgH8Cvi/yFin2wRMJpH
	WqIG2CNqh/NGjTAl4bpXmYcpDESAr17h36VDm1QjPf9PzZbEsTwwH1gsf0tX4WrB+b5tcI8wry5
	mduAc30y7LhXKFPxyZn2kLmZy5bFC62mW7yDblO5QGC80IrHW2xJ0OUupzEBi7+vBqHAB/Ibjkt
	oW4o6YtyvwlGQyTdQ==
X-Received: by 2002:a05:600c:46ce:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-487290a929fmr129053725e9.3.1774785228954;
        Sun, 29 Mar 2026 04:53:48 -0700 (PDT)
Received: from jernej-laptop.localnet (118.red-213-98-130.staticip.rima-tde.net. [213.98.130.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872714ef38sm54949225e9.21.2026.03.29.04.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 04:53:48 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Subject: Re: [PATCH] arm64: dts: allwinner: enable h616 timer support
Date: Sun, 29 Mar 2026 13:53:45 +0200
Message-ID: <5977334.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260329-h616-timer-v1-1-5966d0420a66@mmpsystems.pl>
References: <20260329-h616-timer-v1-1-5966d0420a66@mmpsystems.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_045351_195028_6C2AFF77 
X-CRM114-Status: GOOD (  17.57  )
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

Dne nedelja, 29. marec 2026 ob 13:43:04 Srednjeevropski poletni =C4=8Das je=
 Michal Piekos napisal(a):
> Add support for timer by reusing existing sun4i timer driver.
>=20
> H616 timer is compatible with earlier sunxi timer variants and provides
> both clocksource and clockevent functionality. It runs from 24 MHz
> oscillator. It can serve as broadcast clockevent for wake up from idle
> states.
>=20
> Tested on Orange Pi Zero 3:
> - timer is registered as clocksource:
> - switching clocksource at runtime works
> - timer operates as a broadcast clockevent device
> - no regression observed compared to arch_sys_counter
>=20
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
> Test results:
>=20
> Clocksource switching:
>   cat /sys/devices/system/clocksource/clocksource0/available_clocksource
>     arch_sys_counter timer
>   echo timer > /sys/devices/system/clocksource/clocksource0/current_clock=
source
>     [ 5031.105997] clocksource: Switched to clocksource timer
>=20
> Clockevent configuration:
>   cat /proc/timer_list
>     ...
>     Tick Device: mode:     1
>     Broadcast device
>     Clock Event Device: sun4i_tick
>      max_delta_ns:   178956969070
>      min_delta_ns:   1000
>      mult:           51539608
>      shift:          31
>      mode:           1
>      next_event:     9223372036854775807 nsecs
>      set_next_event: sun4i_clkevt_next_event
>      shutdown:       sun4i_clkevt_shutdown
>      periodic:       sun4i_clkevt_set_periodic
>      oneshot:        sun4i_clkevt_set_oneshot
>      resume:         sun4i_clkevt_shutdown
>      event_handler:  tick_handle_oneshot_broadcast
>     ...
>=20
> Cyclictest measurements:
>   Dominated by system scheduler latency and do not reflect clocksource
>   precision.
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h616.dtsi
> index 8d1110c14bad..bf054869e78b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -228,6 +228,15 @@ cpu_speed_grade: cpu-speed-grade@0 {
>  			};
>  		};
> =20
> +		timer0: timer@3009000 {
> +			compatible =3D "allwinner,sun50i-h616-timer",
> +				     "allwinner,sun8i-a23-timer";

You have to add above combo to DT bindings.

Best regards,
Jernej

> +			reg =3D <0x03009000 0xa0>;
> +			interrupts =3D <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&osc24M>;
> +		};
> +
>  		watchdog: watchdog@30090a0 {
>  			compatible =3D "allwinner,sun50i-h616-wdt",
>  				     "allwinner,sun6i-a31-wdt";
>=20
> ---
> base-commit: be762d8b6dd7efacb61937d20f8475db8f207655
> change-id: 20260328-h616-timer-046e6ac3549e
>=20
> Best regards,
>=20





