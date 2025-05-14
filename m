Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA870C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 23:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tK7PATuM2XObswlBZPi3Fy1sqLR6TUymd28Xe7Esnew=; b=ESRSunMToaCX0VNW/QSRQTE4sZ
	eRlt3eJTMhkDoQHWqekroyO82NTjuKgCRZi5fLmK4ntOX5OJsCZdw3pLGoog3x0PIJIMnnGq9TC2E
	gEWFi1vn3xhFm6/3sdkFAwJtsTEwEpg+yNqar/Fm0As1dLYmEwI4Bzy1FeNK85MIdxWsvctbS+ukC
	7+hDMROnSD7hQcCBw8ccWNFACKTM8kF21VQme4cxKnS4yeMyQ8tcJ/DT7ClasUFCJu9piLmT5wldX
	FAucWJhrYvTUIjyYJdLRKpH0rE4ygVJXldMiD8mDO+ZoVsWDzCpA0dO0KxHn2iMkA+KqCqAh5AbZC
	cCNI3dnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFLMm-0000000GYuU-2CRC;
	Wed, 14 May 2025 23:18:24 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFLKg-0000000GYnu-2Z13
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 23:16:15 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b26d4a28872so211512a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 16:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747264573; x=1747869373; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tK7PATuM2XObswlBZPi3Fy1sqLR6TUymd28Xe7Esnew=;
        b=3E/5wnOJaQiPiXnJAuXgAX4ACnvaV/iCGLEplbnLorVq7QRVtlP2b9T1E/yM2p21li
         ZDYdYCqFwAWoqgze8v8mMiTeCMOeXiYMZZBMOtbkX5p5Dr1uqcQ2vc16bkKZeQV8d7qP
         IoEEqwlrC9uHF6DK05ZcJxqTJrCmvwv1Y00Q7bPjR5F3dSj/Vut7Dj/lGCU2Dh3siU4h
         O5VcfFbeR0wODokgb1CxCbJfe9gBJv951XBymYcI+m4cCDA+SxFfuRy6YVh6LmEUpdrO
         QsjYHN6yWP+xqTejGRvW/80Yynbo/zEXevHHXbXRRx8d2UpROoVdHlWhIncrM+16t30m
         zkHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747264573; x=1747869373;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tK7PATuM2XObswlBZPi3Fy1sqLR6TUymd28Xe7Esnew=;
        b=Sr3yGXPz/STh049x7gwsKfYi+6+m38F8Rovq3gAeK1toTd1MMdUVrLlvPSZLIorYf/
         MXI0mNleYyj3BKvtd7uwxiMtEdjLkeJZ33cn+RlGhWE0/5oNBN2jul9GAdNMnP9JuNxb
         +/nbow75JHUQyj40FNf5bAAes2liIpq+h+t+RoK7muW4RvBfNLvcr+lTjYVOrDb9PTgc
         Nc2DgXkYyxIkjUVK07z+HPA6NH0JrDZUU7ByOEB+VoaT1Yr2762P6fOACLbLhoZEfPj0
         dc97JBA+03rZhQTQuOAZ59nZOyHNmePrFNxiw0VaHIxba+teieqDq8x0rh2TRiwLIfZ8
         Eq3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtZrCSSDka/s6Lw14JM4kQmqRT+PKIDL9sZgMHvsGDAzGnzAgt3gbXagKyoePFI2FXelD+409s/PsZd0JtH5RC@lists.infradead.org
X-Gm-Message-State: AOJu0YwN3WTtDfErh/1ItAWh31kHHvmpJuL+Ube0ecaPlOt25PwRck8C
	iZu6yWYepUT6XL021txhsDDwR3kte2Zu3JUKdz1YzJdQqZ0Ko5OLRDWR/rJ/b24QYwPQXZJ74az
	hlw==
X-Gm-Gg: ASbGnct6P0rw6EfZM/4oLbCCKnQC1trYXVc0Xp33CJku6d9k4Ji1ybBWiGGnQh5LG5y
	TpmbvTfewoxHloSLnLuoMSzHFHf/I+a4iennD3LXp2RNkVxkjorrBGJbxx/XAcIh0R4x+ST0cZH
	EMbv7ptYqdzohKCLJiUUZr7SwhkmH6M6qIe2ZqXMH7LY6fBK4syF38eJm41fMpsQET62scuXXCf
	D9NvQ35uBHnzT4W6fnn7ax2y647l6U+SdGpC3V9UWVcHEcXNBjARCEkb3K24SYP6lnj+i/TLs4n
	2thJkuwlQ5n/pUjAfantX4nWYnoeugHQFlbm6ZKyu1EtV+WS1/UMDf/+TrPFoqyBy5oFR3DODPS
	tLWe6OflPwko=
X-Google-Smtp-Source: AGHT+IEsrSGIrRf/QU64B6v5yFPwGzw3MqjHwN5SfWQd/PEk8gnJbbur5kF7m6fDr23b53A05xfT6w==
X-Received: by 2002:a17:903:228a:b0:223:60ce:2451 with SMTP id d9443c01a7336-231b5e26004mr5188935ad.15.1747264572659;
        Wed, 14 May 2025 16:16:12 -0700 (PDT)
Received: from google.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271a67sm104886415ad.114.2025.05.14.16.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 16:16:12 -0700 (PDT)
Date: Wed, 14 May 2025 16:16:07 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: John Stultz <jstultz@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Youngmin Nam <youngmin.nam@samsung.com>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/7] clocksource/drivers/exynos_mct: Add module support
Message-ID: <aCUkN301jWUkXJ3_@google.com>
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com>
 <Z_6OZHYfC0bC5289@mai.linaro.org>
 <CANDhNCodHATboF2=U2tTwdEkEJ+PsfB2F=fbBrs=J1UzZTEX8g@mail.gmail.com>
 <aCNctHq6K7uqFF05@mai.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCNctHq6K7uqFF05@mai.linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_161614_654029_70B6373C 
X-CRM114-Status: GOOD (  31.35  )
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

On 05/13/2025, Daniel Lezcano wrote:
> On Tue, Apr 15, 2025 at 05:48:41PM -0700, John Stultz wrote:
> > On Tue, Apr 15, 2025 at 9:50 AM Daniel Lezcano
> > <daniel.lezcano@linaro.org> wrote:
> > > On Wed, Apr 02, 2025 at 04:33:57PM -0700, Will McVicker wrote:
> > > > From: Donghoon Yu <hoony.yu@samsung.com>
> > > >
> > > > On Arm64 platforms the Exynos MCT driver can be built as a module. On
> > > > boot (and even after boot) the arch_timer is used as the clocksource and
> > > > tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> > > > source for the arch_timer.
> > >
> > > From a previous thread where there is no answer:
> > >
> > > https://lore.kernel.org/all/c1e8abec-680c-451d-b5df-f687291aa413@linaro.org/
> > >
> > > I don't feel comfortable with changing the clocksource / clockevent drivers to
> > > a module for the reasons explained in the aforementionned thread.
> > 
> > I wasn't CC'ed on that, but to address a few of your points:
> > 
> > > I have some concerns about this kind of changes:
> > >
> > >   * the core code may not be prepared for that, so loading / unloading
> > > the modules with active timers may result into some issues
> > 
> > That's a fair concern, but permanent modules (which are loaded but not
> > unloaded) shouldn't suffer this issue. I recognize having modules be
> > fully unloadable is generally cleaner and preferred, but I also see
> > the benefit of allowing permanent modules to be one-way loaded so a
> > generic/distro kernel shared between lots of different platforms
> > doesn't need to be bloated with drivers that aren't used everywhere.
> > Obviously any single driver doesn't make a huge difference, but all
> > the small drivers together does add up.
> 
> Perhaps using module_platform_driver_probe() should do the trick with
> some scripts updated for my git hooks to check
> module_platform_driver() is not used.

Using `module_platform_driver_probe()` won't work as that still defines
a `module_exit()` hook. If you want to automatically handle this in code, then
the best approach is to follow what Saravana did in [1] for irqchip drivers.
Basically by using `builtin_platform_driver(drv_name##_driver)`, you will only
define the `module_init()` hook when the driver is compiled as a module which
ensures you always get a permanent module.

[1] https://lore.kernel.org/linux-arm-kernel/20200718000637.3632841-1-saravanak@google.com/

Regards,
Will

[...]

