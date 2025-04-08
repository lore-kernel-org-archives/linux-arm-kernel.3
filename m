Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D631C369A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 21:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lduEcIzJil9047xkgT6hDyNCUaJld8YJ1rfKXfQjuxU=; b=ZnQb43ei36URKlF3A3VqJcNyV8
	d8Q4QvDneB/ZsGS6jbaYS748KTIFxFKtfYeewK1BqUtn7YT4d5NzLbf/hudTvFAiLvrj5tK9PWCyC
	JffIvHBJnRopnoR25pyE4ZoVTO4lNwuxCMtbyCLkPz3rhcaDHwV5rEE9SpqmdfAitkYzGD2FxGN8h
	aghgdG410QSbbFYlUtVMikuQpgSoWLMkIg2HK6T57C/0Rq1jellhWZtl22GZeduiXWmrLE86FbkFE
	/GrGnBJkCoD/gsfJO1HkbEAt/XSWHQ9ikL0cJhF+swqr4Vm2KgxjjX3q2283Ffc1WCzaJRtS/GFuq
	vAaXY9Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2GFX-00000005QCl-036y;
	Tue, 08 Apr 2025 21:12:51 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2F58-00000005HnF-1zZo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 19:58:03 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-af50f56b862so4129564a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 12:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744142281; x=1744747081; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lduEcIzJil9047xkgT6hDyNCUaJld8YJ1rfKXfQjuxU=;
        b=rSEfkdJeLB/xWR8LzmMUyQl57lR0BF6MJF5JjMGnCW7lRVyajJe94pwUYWq1XrQEt4
         5WBOPvr6hrpMvyfPxKd1ud8VfuXDmTJ/qH7p2uYrHVYozshGZXlp3PEBA50Kqbb6Yc9p
         ZZsH8O1+7TuQI52NlQsUijM90OOzdx02LqJLXfCKkJHuVhesXHcfGNZQGTYh23O7pmF5
         52crhVXDoHpIBoJOe4Wj01odFqWr1HGpN9nT/1BJ0f36AK38cqEiuZvI1ruVJ9UqikHw
         WmrwyKXo/EkZydjwhgkC0PxGsYX57mQzflr2Q+LBjWoVYKVrfeA1vDBSmnO7y7mv2tFn
         9qAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142281; x=1744747081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lduEcIzJil9047xkgT6hDyNCUaJld8YJ1rfKXfQjuxU=;
        b=GP3p8RKQXkiJ9SC3kGlS9kfWd68MutLXnvHSUgNa3uuiLiPEmWaSu+k0Ju0AygTYaL
         r3+mUF9J313Q18pHmXdL4ole8Y8J3rGfvGgvZU2HL2X3SxW00rd7B3u1m2iBP65NhxYr
         E+CUtzTg/3Urs2gUtwT8hk4MUmN3BOaSdBz5NAbFRHpOFg8GDCQtCnakiw4w4sKqiea7
         nSNJvIJvjZQvL9/C7pfN6urp6xMglM/nsKQLxcvNKA+MS6mcr/h+mVHAQpXm4Inf9hGB
         aLZhQDdhaX/pj8I4WPR/iMqfymzKith01vSivIPjYOf9xJrzSnQcOYSuthUTt1TgYVT7
         lZZg==
X-Forwarded-Encrypted: i=1; AJvYcCU8EVJdtwOoWWwo8kW9NU9nAeYji1I1ErpD9pmkw+1CRyZcKrt7eZnt4vGTAyUssR5rc/xl5NSTiI38c5Cq3u0q@lists.infradead.org
X-Gm-Message-State: AOJu0YxBLtdtvuB2O31UzJdRhb1OmY4BbbNbRfLOIK1BEoHpxcPa7CzZ
	7njjXM6+h5IO07JZMhzsUokRY0lel9xxvybHMwqMODSc3JhW3EBHc7aTK3KfOiTOfMf78nTb1Xd
	Vfw==
X-Gm-Gg: ASbGncvfytSNLnHG9pfo46usprYk4N/yAk8FzuqV6yvMY0aGLh4iw+0pRZID156LKu7
	3lmrItxGmUGxWjoXjJWgvBnzbhObzvpCOAlds6irpzEBj7EUkrpnXUz2zSZTNVk0AYXFLwP0fi8
	PqBaTcCQfuMMLV7AMKyLlGW3tSJoo1nNeUY5N/KvqG8xef/p+Z6r9sWYFELPibReSkY8GN5KOz0
	UROE0r02xkSPCaqxFV/A4fvf09MBregOUTqkSd0tIOI9k3XYlTq3rNybWYFJl7AVGyCJ+Tyw10a
	QVcDRCRnwB6dp6L3MO5xbny1Wml6Q7nfd3ucdSOHpeqq9tdHo9tLNDaKVBmgjJuiT4atL1Hl8MD
	3EtWza2Y2IgyywlpQ8lNWX2hI2A==
X-Google-Smtp-Source: AGHT+IFor0iASzFnnbbMCvlZdq1DNYl/sjVsXAFwMdH3cFVbjXLUMfVqsU/jqqIox3/wYp0bWz4FAw==
X-Received: by 2002:a17:90b:514e:b0:2ee:a583:e616 with SMTP id 98e67ed59e1d1-306dbbb5c92mr734616a91.9.1744142281307;
        Tue, 08 Apr 2025 12:58:01 -0700 (PDT)
Received: from google.com (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983da812sm11467438a91.46.2025.04.08.12.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 12:58:00 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:57:57 -0700
From: William McVicker <willmcvicker@google.com>
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Donghoon Yu <hoony.yu@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	semen.protsenko@linaro.org
Subject: Re: [PATCH v2 0/7] Add module support for Arm64 Exynos MCT driver
Message-ID: <Z_V_xXsAedUSZURp@google.com>
References: <CGME20250402233425epcas2p479285add99d27dc18aabd2295bfcbdc8@epcas2p4.samsung.com>
 <20250402233407.2452429-1-willmcvicker@google.com>
 <Z+8xrLbya9/oFg7y@perf>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z+8xrLbya9/oFg7y@perf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_125802_515860_1F9BAE50 
X-CRM114-Status: GOOD (  38.93  )
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

On 04/04/2025, Youngmin Nam wrote:
> On Wed, Apr 02, 2025 at 04:33:51PM -0700, Will McVicker wrote:
> > This series adds support to build the Arm64 Exynos MCT driver as a module. This
> > is only possible on Arm64 SoCs since they can use the Arm architected timer as
> > the clocksource. Once the Exynos MCT module is loaded and the device probes,
> > the MCT is used as the wakeup source for the arch_timer to ensure the device
> > can wakeup from the "c2" idle state.
> > 
> > These patches are originally from the downstream Pixel 6 (gs101) kernel found
> > at [1] and have been adapted for upstream. Not only has the Exynos MCT driver
> > been shipping as a module in the field with Android, but I've also tested this
> > seris with the upstream kernel on my Pixel 6 Pro.
> > 
> > Thanks,
> > Will
> > 
> > Note1, instructions to build and flash a Pixel 6 device with the upstream kernel
> > can be found at [2].
> > 
> > Note2, this series is based off of linux-next/master commit 405e2241def8 ("Add
> > linux-next specific files for 20250331").
> > 
> > [1] https://android.googlesource.com/kernel/gs/+log/refs/heads/android-gs-raviole-5.10-android12-d1
> > [2] https://protect2.fireeye.com/v1/url?k=d287bb1b-b30cae21-d2863054-74fe4860008a-f0cb7ae29f3b1b85&q=1&e=4e8467a4-13da-4dd4-a8fd-4ddfc38e89b4&u=https%3A%2F%2Fgit.codelinaro.org%2Flinaro%2Fgooglelt%2Fpixelscripts%2F-%2Fblob%2Fclo%2Fmain%2FREADME.md%3Fref_type%3Dheads
> > 
> > Cc: Alim Akhtar <alim.akhtar@samsung.com>
> > Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> > Cc: Donghoon Yu <hoony.yu@samsung.com>
> > Cc: Hosung Kim <hosung0.kim@samsung.com>
> > Cc: kernel-team@android.com
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Saravana Kannan <saravanak@google.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Youngmin Nam <youngmin.nam@samsung.com>
> > Cc: Peter Griffin <peter.griffin@linaro.org>
> > Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> > Cc: André Draszik <andre.draszik@linaro.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > Cc: linux-samsung-soc@vger.kernel.org
> > 
> > ---
> > Changes in v2:
> > - Re-worked patch v1 5 based on Rob Herring's review to use the compatible data
> >   for retrieving the mct_init function pointer.
> > - Updated the Kconfig logic to disallow building the Exynos MCT driver as
> >   a module for ARM32 configurations based on Krzysztof Kozlowski's findings.
> > - Added comments and clarified commit messages in patches 1 and 2 based on
> >   reviews from John Stultz and Youngmin Nam.
> > - Fixed an issue found during testing that resulted in the device getting
> >   stuck on boot. This is included in v2 as patch 5.
> > - Collected *-by tags
> > - Rebased to the latest linux-next/master.
> > 
> > ---
> > Donghoon Yu (1):
> >   clocksource/drivers/exynos_mct: Add module support
> > 
> > Hosung Kim (1):
> >   clocksource/drivers/exynos_mct: Set local timer interrupts as percpu
> > 
> > Will Deacon (1):
> >   arm64: dts: exynos: gs101: Add 'local-timer-stop' to cpuidle nodes
> > 
> > Will McVicker (4):
> >   of/irq: Export of_irq_count for modules
> >   clocksource/drivers/exynos_mct: Don't register as a sched_clock on
> >     arm64
> >   clocksource/drivers/exynos_mct: Fix uninitialized irq name warning
> >   arm64: exynos: Drop select CLKSRC_EXYNOS_MCT
> > 
> >  arch/arm64/Kconfig.platforms                 |  1 -
> >  arch/arm64/boot/dts/exynos/google/gs101.dtsi |  3 +
> >  drivers/clocksource/Kconfig                  |  3 +-
> >  drivers/clocksource/exynos_mct.c             | 73 ++++++++++++++++----
> >  drivers/of/irq.c                             |  1 +
> >  5 files changed, 67 insertions(+), 14 deletions(-)
> > 
> > -- 
> > 2.49.0.472.ge94155a9ec-goog
> > 
> > 
> 
> Hi Will.
> 
> I tested this series on a E850-96(Exynos3830 based) board and it's working as a moudle.
> 
> # dmesg | grep mct
> [7.376224] clocksource: mct-frc: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 73510017198 ns
> 
> # lsmod | grep exynos_mct
> exynos_mct             12288  0
> 
> # cat /sys/devices/system/clocksource/clocksource0/current_clocksource
> arch_sys_counter
> # cat /sys/devices/system/clockevents/clockevent0/current_device
> arch_sys_timer
> 
> # cat /proc/interrupts 
>         CPU0    CPU1    CPU2    CPU3    CPU4    CPU5    CPU6    CPU7
>  12:    2566    2752    2467    4026    3372    2822    2115    3227 GIC-0  27 Level     arch_timer
> ...
>  77:       0       0       0       0       0       0       0       0 GIC-0 235 Level     mct_comp_irq
>  78:       0       0       0       0       0       0       0       0 GIC-0 239 Level     mct_tick0
>  79:       0       0       0       0       0       0       0       0 GIC-0 240 Level     mct_tick1
>  80:       0       0       0       0       0       0       0       0 GIC-0 241 Level     mct_tick2
>  81:       0       0       0       0       0       0       0       0 GIC-0 242 Level     mct_tick3
>  82:       0       0       0       0       0       0       0       0 GIC-0 243 Level     mct_tick4
>  83:       0       0       0       0       0       0       0       0 GIC-0 244 Level     mct_tick5
>  84:       0       0       0       0       0       0       0       0 GIC-0 245 Level     mct_tick6
>  85:       0       0       0       0       0       0       0       0 GIC-0 246 Level     mct_tick7
> 
> Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
> Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
> 
> Thanks,
> Youngmin

Thanks Youngmin for the reviews and testing!

Regards,
Will



