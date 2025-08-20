Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBFBCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 14:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0nVpFwznHMpNpqwkISsWqIDhkZo9GN/5f7ypKNFeZFY=; b=lbbS9M+syfEKQ3wWCq0mAnG/it
	Yyexbysj8liVT2CN7LahiPI9nnHXAwazfhLjf/PfHQLlBnv7cCSB5H8tr0FXlIyjgi67mbICJJpiR
	g0fmVWISrFCpM+hNgHk7UED76EIX8K8Ks6K8LjHyIZVkkneHb7e8ox4Th9hrj0y+kriyRRJf6x9+f
	Aw4pMNsMf5afjKGoMf12EYaDRx0MGWHlKYTxM7k14bpWtMjoIa/zH9P30l2C2dX0F+wCI5U5PhYd/
	e8ELVTeXZANcDcePyKMXZXxfp5CjQHr+lGTfJ6yvO9Ounw9Z57tzmVTiJK1bJGoG0xTdtdCvslNXj
	XJJd2fkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojdw-0000000E07g-2HSN;
	Wed, 20 Aug 2025 14:18:24 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoisA-0000000DmtW-48xJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 13:29:04 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6188b5b11b2so7987378a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 06:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755696541; x=1756301341; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nVpFwznHMpNpqwkISsWqIDhkZo9GN/5f7ypKNFeZFY=;
        b=iGJPC/kQPfPyT2fcq3R/XBO9Q3SCYooEIBXr+PZN4wJZp49DeD3WZu52Nv/j1gM0NL
         c/BDCRmFhdDyRMLjH+jkgFsn+FTeqzoFvV+YYRm6OWBBCw/oPsK+03CbtLT1lTnknb4w
         0aUH9uBGKzKNg49ERPrnCymPNA2pHKXYGNDZ8+H30wQ8mpcGj9pa2PXPL95kqMQqGto+
         50bW/+wwVspc9xSgBsrPQsXk1MfAbQTmI3LIrB7ysBpBVUaxAz+Gh8wIZw5/G/Y4EmNQ
         HCScReDspzPFvys/rbwjhDD+jUgnbhvfxEwhAviNoW6DhLm8HKN0mf+BYh2LZXNcX/H0
         TCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755696541; x=1756301341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nVpFwznHMpNpqwkISsWqIDhkZo9GN/5f7ypKNFeZFY=;
        b=lbDdnYLZhmeDW1M7ROpzVESMIw3B0Tkn5OGy1EcqhKt8WL/VsuxCmhrKcw9uJJeJmr
         H9W8pb5sPLJ/zioQeNmKRLhtJsHG2/3w6Hmk7rOlZgl+qRXloAMOJb8zAqR9IM1ujgCl
         1KGbkIbV2IXPEGOEneVQ6DKFsFTn+LiyWt/QX0LK5aB87tyFxGDB/aPoe4DsJKDtY4Sp
         XSiOws3e9shJd/7AvfxLNx7QxWVgTdfI2vfB1traucYOYRS8zQcwrqO1Eam1FmlvR4ng
         o2zk+s9Zh8BUxDHn18cz36bw7pP1tfyM+aDnWFuWQMTdKmyTB/P6qVUgHDILomPCrdpI
         jhDg==
X-Forwarded-Encrypted: i=1; AJvYcCWTfRgmI/wiv7e6TEjKCZh6A1s9hL0xO7hFjl1kgrSalwxi8mGc4+JWIcOi9AeG+W3qHICJN8tNb6pqVFp2rToz@lists.infradead.org
X-Gm-Message-State: AOJu0YxOmydDaQBIoZ9/TdErLJZ7iD3hZDg3eshxkHe0DHBAh+6xach1
	TLr2jNKkDkeTMHM0Wg9eITY0lLvNYSLktL3dCrdmIGdXufrIKbQaR1pQnCSZjEvhG6GYUCeo5/A
	130Tlyv8oG5TovD+v51/ftDbis2f0pd8=
X-Gm-Gg: ASbGncvkmWnYTNrXRmixuz5noiHpWq0EmexSuyGhFe7V2p8T5AfYHGYHkDPsdyB3dkH
	0W4RI3mW5Y/djmBL0YF/qO8gMEb39w/XKDKNZLukwsLOqDoplDV0ukp2V9wNUp+rBqZiSJpJdRG
	6KMM2yNBIOU9Bs9zZiEOwS13U0nSguYubAmxlK6I62p4Wh0Nrpr5hgkMeBZG0Dy92CRAK5Zq1dN
	4QlfA==
X-Google-Smtp-Source: AGHT+IE1YhFYDwX8RTFqCBvI/O0nzvU66srlAToMGQhCnvv7ApS2NTfh2GSqAw7utXfVWbtfNzrw3Bn9dL0oJJc7q1g=
X-Received: by 2002:a05:6402:460a:b0:612:b742:5bba with SMTP id
 4fb4d7f45d1cf-61a975521a9mr2385263a12.13.1755696540707; Wed, 20 Aug 2025
 06:29:00 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250819131732eucas1p26bd491e9b6b747a4857905bfd50420a9@eucas1p2.samsung.com>
 <20250813131007.343402-7-linux.amoon@gmail.com> <20250819131704.19780-1-m.majewski2@samsung.com>
In-Reply-To: <20250819131704.19780-1-m.majewski2@samsung.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 20 Aug 2025 18:58:43 +0530
X-Gm-Features: Ac12FXxJk9FiRDbaSI1KGn0qHUotnyfsd3cxseyNycA4dBDFvpr7OUkV8SN9KUE
Message-ID: <CANAwSgSjkP_wZ2Wvk1bZ2j6GHwAqEw1f5ZXLfQyEWgzcBzb6Mw@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] thermal/drivers/exynos: Handle temperature
 threshold IRQs with SoC-specific mapping
To: Mateusz Majewski <m.majewski2@samsung.com>
Cc: alim.akhtar@samsung.com, bzolnier@gmail.com, daniel.lezcano@linaro.org, 
	justinstitt@google.com, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, llvm@lists.linux.dev, lukasz.luba@arm.com, 
	morbo@google.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	rafael@kernel.org, rui.zhang@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_062903_029018_C7821D4C 
X-CRM114-Status: GOOD (  30.12  )
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

Hi Mateusz,

Thanks for your review comments..

On Tue, 19 Aug 2025 at 18:47, Mateusz Majewski <m.majewski2@samsung.com> wr=
ote:
>
> Hello :)
>
> > +/* Map Rise and Falling edges for IRQ Clean */
> > +struct tmu_irq_map {
> > +     u32 fall[3];
> > +     u32 rise[3];
> > +};
>
Ops, this is an overkill approach that could be simplified further.

static void exynos4412_tmu_clear_irqs(struct exynos_tmu_data *data)
{
        unsigned int val_irq, clear_irq =3D 0;
        u32 tmu_intstat =3D data->tmu_intstat;
        u32 tmu_intclear =3D data->tmu_intclear;
        static const u32 irq_bits[] =3D {
                BIT(0), BIT(4), BIT(8),   /* Rising edge */
                BIT(12), BIT(16), BIT(20) /* Falling edge */
        };

        val_irq =3D readl(data->base + tmu_intstat);

        /* Set SoC-specific interrupt bit mappings */
        for (int i =3D 0; i < ARRAY_SIZE(irq_bits); i++) {
                if (val_irq & irq_bits[i])
                        clear_irq |=3D irq_bits[i];
        }

        if (clear_irq)
                writel(clear_irq, data->base + tmu_intclear);
}

> Hmm, we can probably get away with less interrupts. We actually only
> enable one fall interrupt in tmu_set_low_temp and one rise interrupt in
> tmu_set_high_temp.

Got it =E2=80=94 we need to enable INTEN for both rising and falling edges,
specific to each SoC.
So each SoC has a one-to-one mapping of INTEN with INTSTAT and INTCLEAR bit=
s
for rising and falling edge detection:.

Exynos4412
   Falling edge: bits 20, 16, 12
   Rising edge: bits 8, 4, 0
Exynos5422
  Falling edge: bits 24, 20, 16
  Rising edge: bits 8, 4, 0
Exynos5433
  Falling edge: bits 23, 17, 16
  Rising edge: bits 7, 1, 0

So we need to enable INTEN like below.

 static void exynos4412_tmu_set_low_temp(struct exynos_tmu_data *data, u8 t=
emp)
 {
        exynos_tmu_update_temp(data, EXYNOS_THD_TEMP_FALL, 0, temp);
-       exynos_tmu_update_bit(data, EXYNOS_TMU_REG_INTEN,
-                             EXYNOS_TMU_INTEN_FALL0_SHIFT, true);
+       for (int i =3D 0; i < 3; i++)
+               exynos_tmu_update_bit(data, EXYNOS_TMU_REG_INTEN,
+                                     EXYNOS_TMU_INTEN_FALL0_SHIFT + i
* 4, true);
 }

 static void exynos4412_tmu_set_high_temp(struct exynos_tmu_data *data, u8 =
temp)
 {
        exynos_tmu_update_temp(data, EXYNOS_THD_TEMP_RISE, 8, temp);
-       exynos_tmu_update_bit(data, EXYNOS_TMU_REG_INTEN,
-                             EXYNOS_TMU_INTEN_RISE0_SHIFT + 4, true);
+       for (int i =3D 0; i < 3; i++)
+               exynos_tmu_update_bit(data, EXYNOS_TMU_REG_INTEN,
+                             EXYNOS_TMU_INTEN_RISE0_SHIFT + 1 * 4, true);
 }

>
> Regarding tmu_set_crit_temp, on SoCs that have hardware thermal tripping
> there is nothing to clear. On others we will reboot immediately anyway,
> though maybe there is nothing wrong with clearing the interrupt
> beforehand? Regardless of this, there is only a rise critical
> temperature interrupt, we never set a matching fall interrupt.
>
As per my understanding, it depends on the calibration consists of reading =
the
measured data from e-fuse and wrote the calibrated threshold temperature to
generate interrupts into trigger level 0-3

THRES_TEMP_RISE and THRES_TEMP_FALL.

When the current temperature exceeds a threshold rise temperature,
 then it generates the corresponding interrupt (INTREQ_RISE[2:0]).
When the current temperature goes below a threshold fall temperature, t
hen it generates a corresponding interrupt (INTREQ_FALL[2:0].

It also depends on the sample interval

> Maybe it would also be good to add a bool to this struct containing
> information about whether a fall interrupt is in use, and reuse
> the same logic for 4210?
>
> (Nitpick: I am not a native speaker of English, but I think "clean" and
> "clear" have slightly different meanings, and the rest of the code
> consistently uses "clear", so it would be worthwhile to also use "clear"
> here.)
>
> > +             break;
>
> Maybe put irq_map inside exynos_tmu_data? exynos_map_dt_data has a
> switch block that is quite similar, in that it also matches on the SoC
> type. This way also there is no need to have a fallback.
>
I want to avoid this If you have any design feedback, plz let me know.

I had attempted to refactor exynos_tmu_data by splitting it per-SoC,
assigning dedicated callback functions for each variant. The goal was
to eliminate
the need for data->soc checks and make the code more modular.
However, the approach didn=E2=80=99t work as expected=E2=80=94devm_thermal_=
of_zone_register()
wouldn=E2=80=99t bind the sensor-specific callbacks correctly.

static const struct thermal_zone_device_ops exynos_sensor_ops =3D {
.get_temp =3D exynos_get_temp,
.set_emul_temp =3D exynos_tmu_set_emulation,
.set_trips =3D exynos_set_trips,
};

> Kind regards,
> Mateusz Majewski

Thanks
-Anand

