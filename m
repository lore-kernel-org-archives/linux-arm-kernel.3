Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30E1F3D603
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 13:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=viDNw9XnGj7IgNiXG+l3zPbwcxnl/gxtXwY665wWLdc=; b=KW/gvmF46K0SQNMZEhKE6vPwKb
	8f3gUPnwRQHH0s2SpJgTPbl/1e3JM3hL4kkmEvSnHYtpEfV6hh8dDxlvuZ1T4bxnYXbLDQDKCt1+H
	fc33FET1jIG734ByOhgSzgKwuOX/YYJgln1KFIBibE7srjn+gsGRXIcWr2Q31rHTVBfDMf8HXXm9l
	avz0XXojh/uk8Y6a5aAb3gd27icsXOpdWjDi1XPWbcaK2apfRU4whTkgtkEpFAujSjxsoRddhpwbH
	ReLZb+YDMUJ76Q7EpyGuHbW1VYAapxQhRhEuVjAEUtNFD1jOU9llu/4PDuqi9gGkcv9I50wAU1Ohk
	YcuWEfWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6pna-00000009wXt-0zsB;
	Sun, 29 Mar 2026 13:03:26 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6pnY-00000009wXY-0rm5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 13:03:25 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48374014a77so42424355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 06:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774789402; x=1775394202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viDNw9XnGj7IgNiXG+l3zPbwcxnl/gxtXwY665wWLdc=;
        b=MhQ9CEl2SRbhUA84PLlJOhlU5xTUJG7snhBXkUS1Cfd6pM4rk8KokWdel6ffxRJlF6
         nz8XTabE48k8nT907TVBSrFDgoRiU6u0qW8z4PYG5E6mrgDmxHR8ARH5P8bbJh3GHrV7
         49HMdWPkmwtLRi05Td4ZU1GKtWze8Wh4RVNhkzSz63qs/uSZuksT2a8hOV2D/dxNlQAN
         x6hiZHx+1vUspb2CmrlCLPStYBy6Iiz2cJ/ERDAwpy36erzHUk3/nfGcfBIDTiG5fvVY
         nRINetP6u2E9gViMFKXanGNgbOd67paNcAzifXr+N0nvfCNvIJvnlsMOKoBw3QnTlP2R
         95VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774789402; x=1775394202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=viDNw9XnGj7IgNiXG+l3zPbwcxnl/gxtXwY665wWLdc=;
        b=QKmLCYLcJgNcmqbbAnpOMCxZ7RDMh61D43Ea4O7LDYnoiiDCovU3Q6ZT6cyqNB2uKP
         WC1iK7493mXUVP+gMHklDcJ7ueHDbL/+2bZ0IrhPv5+vabhbbmxGyUExzusy33KD6MvY
         69be0c2nFVEtL0aUNUZbl3FAs2Y5Xyyi8lPffzpSLF+Ud3qWJdtKMl2jC8KCa/2SP9dW
         N+q02EL0Ear2SXklKIpxjm2qLMRmeIfE1AzPne1LjzRz28RuQ+9xW6vInWLJkSyPt9rY
         aoqmZMFeedL1NegJc22KwDEskDK5U0Ui/x/wbq+NdbSy+JpzJmIcZhL/Kl0ZnVzbzlgp
         JT2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU20YWCgETULKTmJfcjiZYtRRUSAW+fnAPsxp+rjXPVpqzE0E81mwwZjJfaVutg6sd8RM7FgUOnKLVYxpAfMhGs@lists.infradead.org
X-Gm-Message-State: AOJu0YziszeHY8vFwfm0FDGnpF4MNLsLETX8dxcvdzRo38/x0XRa45HZ
	03AzRQGh4yLAKX3PZvLgi7XWFnI/SbDEPK0/bSbQhjjFYNK28dNv4SOO
X-Gm-Gg: ATEYQzzxN8eusp17Vx4kWawQiYrt+eTEvpwxC+izvHu7b1XvPPfBedVwrK9J/CFAe4y
	oSFyM1lK17XKA7sc2qkznMifTzOqkxoOn/VBNSyE7ROeJ7eXIBfu8mnxYbSMEykGdvKLEUM3u/L
	BOkKUYqjf2JyG+anQVlDSifhiweIeEAnaePVCbLEDT0TDu4nEubykfWYzlRgz3h+kDmVkjk4wW4
	UC0dpsU6rXKrRUyXSHtCWSVuluEMod2qmQmU20TWkLm/6Yz89+aFekcZTKubA3/K8qIQXImi4Sc
	SsxJ0ta+QLuZe2M8OTeTq4BpHOnNFQB3RRuxmaLKhdyzcdEQ1Z65fsgy2hFyibZNoaqXurgN00K
	AJgu2pAVWpEKW/eA6caCs/L009Uf/1Ke8n8gR1uK1R39wWbIIknMTqhVHs7ePe/wQe26V0GWeYQ
	qo48a5pdX5aio+2rZGWLeNeqeIXQfuUfy6ZU6321vIZZ0Bdvg4T8TrxhRfVr2p2cC1AigMh6zh6
	hz4scUw4DdkiowyzA==
X-Received: by 2002:a05:600c:4e15:b0:485:2ce2:4c87 with SMTP id 5b1f17b1804b1-48727d45881mr151705535e9.4.1774789401886;
        Sun, 29 Mar 2026 06:03:21 -0700 (PDT)
Received: from jernej-laptop.localnet (118.red-213-98-130.staticip.rima-tde.net. [213.98.130.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d23679sm397412475e9.9.2026.03.29.06.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 06:03:21 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: enable h616 timer support
Date: Sun, 29 Mar 2026 15:03:17 +0200
Message-ID: <4721811.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <n2bupd37br2mp7ls6c5z5ueoancr53tn4mywg2vvrlpyhmkex4@lxe6tfdhwz5e>
References: <20260329-h616-timer-v1-1-5966d0420a66@mmpsystems.pl>
 <5977334.DvuYhMxLoT@jernej-laptop>
 <n2bupd37br2mp7ls6c5z5ueoancr53tn4mywg2vvrlpyhmkex4@lxe6tfdhwz5e>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_060324_273170_544C215E 
X-CRM114-Status: GOOD (  24.55  )
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

Dne nedelja, 29. marec 2026 ob 14:07:19 Srednjeevropski poletni =C4=8Das je=
 Michal Piekos napisal(a):
> On Sun, Mar 29, 2026 at 01:53:45PM +0200, Jernej =C5=A0krabec wrote:
> > Dne nedelja, 29. marec 2026 ob 13:43:04 Srednjeevropski poletni =C4=8Da=
s je Michal Piekos napisal(a):
> > > Add support for timer by reusing existing sun4i timer driver.
> > >=20
> > > H616 timer is compatible with earlier sunxi timer variants and provid=
es
> > > both clocksource and clockevent functionality. It runs from 24 MHz
> > > oscillator. It can serve as broadcast clockevent for wake up from idle
> > > states.
> > >=20
> > > Tested on Orange Pi Zero 3:
> > > - timer is registered as clocksource:
> > > - switching clocksource at runtime works
> > > - timer operates as a broadcast clockevent device
> > > - no regression observed compared to arch_sys_counter
> > >=20
> > > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > > ---
> > > Test results:
> > >=20
> > > Clocksource switching:
> > >   cat /sys/devices/system/clocksource/clocksource0/available_clocksou=
rce
> > >     arch_sys_counter timer
> > >   echo timer > /sys/devices/system/clocksource/clocksource0/current_c=
locksource
> > >     [ 5031.105997] clocksource: Switched to clocksource timer
> > >=20
> > > Clockevent configuration:
> > >   cat /proc/timer_list
> > >     ...
> > >     Tick Device: mode:     1
> > >     Broadcast device
> > >     Clock Event Device: sun4i_tick
> > >      max_delta_ns:   178956969070
> > >      min_delta_ns:   1000
> > >      mult:           51539608
> > >      shift:          31
> > >      mode:           1
> > >      next_event:     9223372036854775807 nsecs
> > >      set_next_event: sun4i_clkevt_next_event
> > >      shutdown:       sun4i_clkevt_shutdown
> > >      periodic:       sun4i_clkevt_set_periodic
> > >      oneshot:        sun4i_clkevt_set_oneshot
> > >      resume:         sun4i_clkevt_shutdown
> > >      event_handler:  tick_handle_oneshot_broadcast
> > >     ...
> > >=20
> > > Cyclictest measurements:
> > >   Dominated by system scheduler latency and do not reflect clocksource
> > >   precision.
> > > ---
> > >  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/ar=
m64/boot/dts/allwinner/sun50i-h616.dtsi
> > > index 8d1110c14bad..bf054869e78b 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > > @@ -228,6 +228,15 @@ cpu_speed_grade: cpu-speed-grade@0 {
> > >  			};
> > >  		};
> > > =20
> > > +		timer0: timer@3009000 {
> > > +			compatible =3D "allwinner,sun50i-h616-timer",
> > > +				     "allwinner,sun8i-a23-timer";
> >=20
> > You have to add above combo to DT bindings.
> >=20
> > Best regards,
> > Jernej
>=20
> Not sure I understand your comment correctly but binding for h616 is alre=
ady
> there:
>=20
> Documentation/devicetree/bindings/timer/allwinner,sun4i-a10-timer.yaml:21=
=2D27
>   - items:
>     - enum:
>         - allwinner,sun20i-d1-timer
>         - allwinner,sun50i-a64-timer
>         - allwinner,sun50i-h6-timer
>         - allwinner,sun50i-h616-timer
>     - const: allwinner,sun8i-a23-timer
>=20
> BR
> Michal

Sorry, sometimes tooling fails me. All good.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
> >=20
> > > +			reg =3D <0x03009000 0xa0>;
> > > +			interrupts =3D <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> > > +			clocks =3D <&osc24M>;
> > > +		};
> > > +
> > >  		watchdog: watchdog@30090a0 {
> > >  			compatible =3D "allwinner,sun50i-h616-wdt",
> > >  				     "allwinner,sun6i-a31-wdt";
> > >=20
> > > ---
> > > base-commit: be762d8b6dd7efacb61937d20f8475db8f207655
> > > change-id: 20260328-h616-timer-046e6ac3549e
> > >=20
> > > Best regards,
> > >=20
> >=20
> >=20
> >=20
> >=20
>=20





