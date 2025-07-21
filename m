Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBE7C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 20:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jgpqx2m845uLW+JeBVNSuYCmRgFn5O1Bzp6CJmeS42g=; b=DkGCLcrfRLyK3mfLDVqqvG6Fq0
	ExtXqErZT+XMeAcIBbsK8r0fE2AEI7mbJbOGdBcqQKLq+pp4FOJvY2YwwxNjJduQwL27p4FiFyVrD
	vcZcRCm7gPPxgpy6KDBTsPlB9Z1DF/xKsrsDRoDbu579eA0816hoU5HiEPRMf/Ydl81xVgbQ3k+zV
	oMpC4VtZvTWWlQHDGIQd2pmnJdshjX3xMon5OnIsDdtyeSMPwAkG7CGEmTRX/8HOkSJNdFCdlRAlj
	vQdotLmm+LFRZJ4BRvTiLuw8oinn7UU2yYF7DKdn1+GhDaA9lsI07W/4IcTHO+a0YfxgBZEeBGT6t
	KAo7oRBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udxC9-00000000dUh-1VND;
	Mon, 21 Jul 2025 20:33:09 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwwI-00000000bEb-2Euz;
	Mon, 21 Jul 2025 20:16:47 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-235d6de331fso54768285ad.3;
        Mon, 21 Jul 2025 13:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1753129005; x=1753733805; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgpqx2m845uLW+JeBVNSuYCmRgFn5O1Bzp6CJmeS42g=;
        b=R3tjO+m4MZVvId35CSEeqh8lYGrFlQJHrp4A3bvn4UEqPkWRgnjP4uoimY/T1X5pGt
         jgKp73ilnt9ps1PCo6ABI1BLTMniYExKuA5J1bhlaBKJcHoKtLoR3PYe8hSRxwHAjRbV
         QzNnIq0/S17I7dqohgQ7gjzXxXrfVVr0W8xC9QSdo+tAESibOcSgGVRhn+Ybtyxu3wlz
         j59WmKRW5wpFp0wHXjp3vL5g2KGjabM3RTPFkYYlyS1pXwnunEwR5H4fLtETBolIQ7he
         RtTpGTPqOiYJHffPtZ6P/J529U5UElSYYU+OPMFLWGWVge/IHSwoZ9AaI67BIoKruAh/
         lUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753129005; x=1753733805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jgpqx2m845uLW+JeBVNSuYCmRgFn5O1Bzp6CJmeS42g=;
        b=JzGV73OoC86rFpub3GWQipoW1l5vfhmzQ09vxdD+LvbFUty33xZ0kxomkplnE6qD1C
         U+KIRNrU/8b+nbtlKkHqSErOpu+FeYVVFGDjR1bmyN3+vVjm+k2lBhHVoRuXmoVrXREQ
         Ni65MtuzWsSqObUCWF5FyC81gMoZPF+KqnaeXvy2MSOnmFVg5CMda3+VZShqg6BDQXd+
         ZqNDc8w2NFj5l545g1Zxb+jJF+p6aI9hdKbc24m2T7w/HX3jzXOPTvx0+/4TZkZlIrg2
         6d6TWZoPFcE4CHsvgIe7ogGrof7tnk2Q3J6LF/2iMjtW/l8aekL8XkbWrf7jheHLupwi
         Q9hA==
X-Forwarded-Encrypted: i=1; AJvYcCUuHqrnezSc7mqn6WkfRDw49iKktrGe8zTphmt8RIsN10Ls7ew+zDWmPkLzEcDV2atYfVcxl8+fHo0eAF9k@lists.infradead.org, AJvYcCXkSQhJ9muprVz9JEC+I/oAbFR7FUBd0AdXmY0zkYr7cB8zS8DRSv0AcqIH81N3lJqeRPjP1243QTBgnD2PqVKDug==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6sKsdHbLcPXDU7lTI2TPeNiogyFddgzpkTSwnBedCxJwR2UG1
	VWdE691E1fqKqwOIPrZFez9VQmfLQzHlSvfZtuMuANXtNBee3LEJ5a0tSoLrD7Iz4a+NvgZaYCQ
	cwqxeeu8TwBpi2v1x7AbuyhBhf7O366E=
X-Gm-Gg: ASbGncsLjerXlYK06Ax1K49EJ2Mv22oriMQmMCYqJdtxLLBMtEn0GRHONl89EZnDRKH
	uQlTTs2rudf2NgkpmjKfcBBE0jwd0z8UYuyMBt/ekHbQB7jD7nziM8a0saD4SR5L6haVIlRc9AZ
	F7T+CLZaaYwNWH3IFZnVZvdVXrq5xXqQKj8ZwmCTctt60upBjaWIIkgGpk84pe5G6JivsPKhCYI
	frVPL6I6vlihX81DMMOcw==
X-Google-Smtp-Source: AGHT+IEhqRr7CdR9k19OYUc7jR748HGVgZNXD2c2iGAiOAD8tt2Y5vTG48a6wynS3HB30PHpt1YoNuo+jd0SaVpgE2s=
X-Received: by 2002:a17:902:e0d4:b0:23f:8bcc:e4f3 with SMTP id
 d9443c01a7336-23f8bcce86emr2555465ad.32.1753129005382; Mon, 21 Jul 2025
 13:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250717-optimize_clk-measure_accuracy-v1-1-3b82d7ccd743@amlogic.com>
 <CAFBinCDyjf7MOE6f_AGEEwqV8z68qRv6JAUxn7zt5ZZqwFLkPg@mail.gmail.com> <7fbd3743-cfda-4877-888d-bdeb28d4972f@amlogic.com>
In-Reply-To: <7fbd3743-cfda-4877-888d-bdeb28d4972f@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 21 Jul 2025 22:16:34 +0200
X-Gm-Features: Ac12FXwjzjGUO3kzYO-EgF4dY1ZYcLeDPum6VbXKfiPgtZh-GpYns-HcHy-gvj8
Message-ID: <CAFBinCBdCiNKWoXrL0tw1+_0BL_9XyYfuqQrRNePyzmUh=PX3Q@mail.gmail.com>
Subject: Re: [PATCH] soc: amlogic: clk-measure: Optimize measurement accuracy
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_131646_591616_F7A5C836 
X-CRM114-Status: GOOD (  27.40  )
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

On Fri, Jul 18, 2025 at 8:14=E2=80=AFAM Chuan Liu <chuan.liu@amlogic.com> w=
rote:
>
> hi Marti:
>
>
> On 7/17/2025 11:43 PM, Martin Blumenstingl wrote:
> > [ EXTERNAL EMAIL ]
> >
> > Hello,
> >
> > thank you for this patch!
> >
> > On Thu, Jul 17, 2025 at 5:08=E2=80=AFAM Chuan Liu via B4 Relay
> > <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
> >> From: Chuan Liu <chuan.liu@amlogic.com>
> >>
> >> The cycle count register has a 20-bit effective width, but the driver
> >> only utilizes 16 bits. This reduces the sampling window when measuring
> >> high-frequency clocks, resulting in (slightly) degraded measurement
> >> accuracy.
> > I checked the Meson8 downstream code [0] and it uses 0x000FFFFF to
> > mask the register value -> this means that old SoCs also have a 20-bit
> > wide width.
> >
> > [...]
> >> Here are the test comparisons based on C3:
> > [...]
> >> Here are the test comparisons based on C3:
> > I have tested this patch with Meson8b based Odroid-C1:
> > pre-optimization:
> > # time cat /sys/kernel/debug/meson-clk-msr/measure_summary | grep -v " =
 0  "
> >    clock                     rate    precision
> > ---------------------------------------------
> >   clk81                 159372396    +/-5208Hz
> >   a9_clk_div16           24000000    +/-3125Hz
> >   rtc_osc_clk_out           31250    +/-3125Hz
> >   hdmi_ch0_tmds         146399038    +/-4807Hz
> >   sar_adc                 1140625    +/-3125Hz
> >   sdhc_rx                94443750    +/-3125Hz
> >   sdhc_sd                94443750    +/-3125Hz
> >   pwm_d                 849921875    +/-31250Hz
> >   pwm_c                 849921875    +/-31250Hz
> >
> > real    0m0.102s
> > user    0m0.005s
> > sys     0m0.069s
> >
> >
> > post-optimization:
> > # time cat /sys/kernel/debug/meson-clk-msr/measure_summary | grep -v " =
 0  "
> >    clock                     rate    precision
> > ---------------------------------------------
> >   clk81                 159373438    +/-1562Hz
> >   a9_clk_div16           12000000    +/-1562Hz
> >   rtc_osc_clk_out           32813    +/-1562Hz
> >   hdmi_ch0_tmds         146398438    +/-1562Hz
> >   sar_adc                 1143750    +/-1562Hz
> >   sdhc_rx                94443750    +/-1562Hz
> >   sdhc_sd                94443750    +/-1562Hz
> >   pwm_d                 849992188    +/-1562Hz
> >   pwm_c                 849992188    +/-1562Hz
> >
> > real    0m0.173s
> > user    0m0.008s
> > sys     0m0.109s
> >
> > So there's also an improvement in accuracy. The only downside I'm
> > seeing is that it takes 75% extra time for the measurement. For me
> > this is irrelevant since we use this for debugging.
> >
> > [...]
> >> +       /*
> >> +        * HACK: The input clock signal path from gate (Controlled by =
MSR_RUN)
> >> +        * to internal sampling circuit in clk-measure has a propagati=
on delay
> >> +        * requirement: 24 clock cycles must elapse after mux selectio=
n before
> >> +        * sampling.
> >> +        *
> >> +        * For a 30kHz measurement clock, this translates to an 800=CE=
=BCs delay:
> >> +        * 800us =3D 24 / 30000Hz.
> >> +        */
> >> +       fsleep(800);
> > What is needed to make this not a HACK anymore? Is there a register
> > that we can poll for the number of clock cycles that have passed?
>
>
> The required delay duration is frequency-dependent on the measurement
> clock source. The current 800=CE=BCs delay is calculated based on a
> minimum input clock frequency of 30kHz. At higher input frequencies,
> this delay could be proportionally reduced. Applying a uniform 800=CE=BCs
> delay therefore appears overly conservative for general use cases.
>
>
> The IP currently lacks a status register to detect whether the input
> clock signal has successfully propagated to the internal measurement
> circuitry.
>
>
> The design of this IP has been maintained for many years. From a
> hardware design perspective, there is room for optimization in this
> signal propagation delay. Future IP updates may not require such a
> long delay.
Thanks for the detailed description. To me this doesn't seem like a
"hack" then, it's just something that's needed to interface with the
hardware correctly.
My suggestion is to replace the word "HACK" with "NOTE".

What do you think?


Best regards,
Martin

