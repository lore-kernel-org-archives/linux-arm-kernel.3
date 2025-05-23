Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC63FC54F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 17:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2WQ2P5qzSFyn4X0KDVk0we+dt/QLk97LlbxUNEkevY=; b=RWY6cS0hiEwCEhB7B5Hzb/3S03
	sUH3hP6jhqbNRuPDMu5jknsymgEAup49blZodMaYu1mB0vMaWC/28hDCWbRig01wHCcJb04ryzn0/
	zR2OEWNJwOrFJc1guWCVd/J5edsQDc3saUiAOuswoZYCwDdTBqgBj6DCvaXSHC4JZDKwz2JhyjwYj
	ZSunA6nP2itDTYj6PDeV0HrYqELbTKTkrJJwkGTVCAgO6FEldmA1yrGnIZKI0X3urpAbFaWFondo/
	YyWL5QsXBIlbcJNjnlmGkvaUXKu6HG1W4XzwsT/BXV3GkORmXkCgVJAq7lp7eIgQNka53KyAiZexx
	RpYxwoxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIW7O-00000004Wm0-3TIt;
	Fri, 23 May 2025 17:23:38 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVqy-00000004UJP-011f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 17:06:41 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22e331215dbso8753335ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 10:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748019998; x=1748624798; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J2WQ2P5qzSFyn4X0KDVk0we+dt/QLk97LlbxUNEkevY=;
        b=gVPNrObUcV6CE8sBPrHnwIlr0sITj3Wm2zNbBgLe/U7fRJ4rq7phlX5blmNJJAss1H
         p3Mt5ms8Ke0/K7CZ/z4Pq+Rxz4zykPUBr/IGBotF8T1sX6rNbGOkBX22krMWRJZ2TAfl
         Yp5KjH13VqysliTKLE4y5Pc2PVoAffsc7Azr7oK6GDXGKCkI1Z3fQzVOw/eBcpwPplVc
         x3KQiJYcWxWY97C0N9AgzQymg/stun61LVtBC1wPO0eACszKiibLUEFu+AMFpGsCF1b6
         juSWP2J5+GqqUl5HNq/h0BXbq0SUfe9nvlMIth0+hJLcVQOQtlifoIBkjyZEL+B2yLeU
         Urog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748019998; x=1748624798;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J2WQ2P5qzSFyn4X0KDVk0we+dt/QLk97LlbxUNEkevY=;
        b=UbJPvh0z+KUQZb21bmeF7zF1L1c1ANCqI+dG9tuEV1C2nl+9hcFcV1kDXgcpQY8YP9
         Imh6ieQk40j3uPgh63/sI8UqZrymVNTDKQkAfG0LzVVK4+QPyorB/AntoEwg16fyXiYc
         nU4seTa//IffWDnbBBxj/m+sUizgUjufbds6Gftl71x9zV9y/VRpcv8n1y4wIBJm0/RC
         gj009oV05rBBKI7AgGz8sA6snnLvlC68TDH7gtdv56Y+bRcp3mp1GVe9ahVL7cww1TP/
         yTXavl3KcQs8iA24l2/aX7GRr8KVL7L+9EvbWd1yb8N5PZems8o+KwZ/U368G7pc7fHc
         +/Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWizy85rVi+oiGX2PUF706H9uhXQc/w6LgTGB5A6mq6RJuT2zHOTeLAxkIjCio84J2Mag21kog8i8rkDRVD1lMY@lists.infradead.org
X-Gm-Message-State: AOJu0YzT6xB7auNoJpGSdwBjEMFaxkYGcijr0f7mydKKLPaUtSUJ+zQv
	c685IMajeI6dQPYWtKsJmR7UOZxfI+9VotwHqmLdLtcvClMiiKhiExC5HdDJl4MOQQ==
X-Gm-Gg: ASbGncukjAKTjVFi9sNpjBMZM4c2Mk4LxMy7tqVkI07x7fDYPeUIvKgzj14yIBoO1tj
	XdWl/Oe/Ov1HK6MQEeKnfIw5uUCep1chWJrRfB9Fa8nGD1tY4atmCRn03DbTDlBDJhzj9vk4sDv
	fglAvtfzSHZKwsHD9wZ8jIVIFdw/3Fc0YffImhgWgUpweIKqG7vR5lPuszUXQ1Dwrp1vQOrdKnt
	PhQQfOcT+jGscYYtNn+5HdZ2thBL/PNF9mWIEbprWQEIT+FQh5FN3CXuu4fGwZHvYFMw5BlTk7r
	y+fnhVoixRaXOKsIfyrfENw8IjYWRLqjq2hsBWq6x2fI1CjUJwr9UNwprZ+5kcrX+4Ir9RqnWqG
	qOez/aEfDE6fumPZymGD1UQ==
X-Google-Smtp-Source: AGHT+IGVnaBi3jrRIwejKFDsONlHqePRuzoHWbgSbVetz1AYxiDu9Tm/UL+XQC5bZ+1BERzM5r1Wfw==
X-Received: by 2002:a17:903:32c8:b0:231:ad5a:fe9c with SMTP id d9443c01a7336-23414dc9914mr3358605ad.15.1748019997911;
        Fri, 23 May 2025 10:06:37 -0700 (PDT)
Received: from google.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-233f9e17e3csm10816895ad.177.2025.05.23.10.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:06:37 -0700 (PDT)
Date: Fri, 23 May 2025 10:06:33 -0700
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
Message-ID: <aDCrGT67ubNNUoUz@google.com>
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com>
 <Z_6OZHYfC0bC5289@mai.linaro.org>
 <CANDhNCodHATboF2=U2tTwdEkEJ+PsfB2F=fbBrs=J1UzZTEX8g@mail.gmail.com>
 <aCNctHq6K7uqFF05@mai.linaro.org>
 <aCUkN301jWUkXJ3_@google.com>
 <6e6b0f5f-ac60-48bb-af6c-fa58658d2639@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e6b0f5f-ac60-48bb-af6c-fa58658d2639@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_100640_047073_04BF2BD7 
X-CRM114-Status: GOOD (  45.85  )
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

On 05/23/2025, Daniel Lezcano wrote:
> 
> Hi William,
> 
> On 15/05/2025 01:16, William McVicker wrote:
> > On 05/13/2025, Daniel Lezcano wrote:
> > > On Tue, Apr 15, 2025 at 05:48:41PM -0700, John Stultz wrote:
> > > > On Tue, Apr 15, 2025 at 9:50 AM Daniel Lezcano
> > > > <daniel.lezcano@linaro.org> wrote:
> > > > > On Wed, Apr 02, 2025 at 04:33:57PM -0700, Will McVicker wrote:
> > > > > > From: Donghoon Yu <hoony.yu@samsung.com>
> > > > > > 
> > > > > > On Arm64 platforms the Exynos MCT driver can be built as a module. On
> > > > > > boot (and even after boot) the arch_timer is used as the clocksource and
> > > > > > tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> > > > > > source for the arch_timer.
> > > > > 
> > > > >  From a previous thread where there is no answer:
> > > > > 
> > > > > https://lore.kernel.org/all/c1e8abec-680c-451d-b5df-f687291aa413@linaro.org/
> > > > > 
> > > > > I don't feel comfortable with changing the clocksource / clockevent drivers to
> > > > > a module for the reasons explained in the aforementionned thread.
> > > > 
> > > > I wasn't CC'ed on that, but to address a few of your points:
> > > > 
> > > > > I have some concerns about this kind of changes:
> > > > > 
> > > > >    * the core code may not be prepared for that, so loading / unloading
> > > > > the modules with active timers may result into some issues
> > > > 
> > > > That's a fair concern, but permanent modules (which are loaded but not
> > > > unloaded) shouldn't suffer this issue. I recognize having modules be
> > > > fully unloadable is generally cleaner and preferred, but I also see
> > > > the benefit of allowing permanent modules to be one-way loaded so a
> > > > generic/distro kernel shared between lots of different platforms
> > > > doesn't need to be bloated with drivers that aren't used everywhere.
> > > > Obviously any single driver doesn't make a huge difference, but all
> > > > the small drivers together does add up.
> > > 
> > > Perhaps using module_platform_driver_probe() should do the trick with
> > > some scripts updated for my git hooks to check
> > > module_platform_driver() is not used.
> > 
> > Using `module_platform_driver_probe()` won't work as that still defines
> > a `module_exit()` hook. If you want to automatically handle this in code, then
> > the best approach is to follow what Saravana did in [1] for irqchip drivers.
> > Basically by using `builtin_platform_driver(drv_name##_driver)`, you will only
> > define the `module_init()` hook when the driver is compiled as a module which
> > ensures you always get a permanent module.
> > 
> > [1] https://lore.kernel.org/linux-arm-kernel/20200718000637.3632841-1-saravanak@google.com/
> 
> Thanks for the pointer and the heads up regarding the module_exit() problem
> with module_platform_driver_probe().
> 
> After digging into the timekeeping framework it appears if the owner of the
> clockevent device is set to THIS_MODULE, then the framework automatically
> grabs a reference preventing unloading the module when this one is
> registered.
> 
> IMO it was not heavily tested but for me it is enough to go forward with the
> module direction regarding the drivers.

Great! Thanks for looking into that. I'll add that in the next revision and
verify we can't unload the module.

> 
> One point though, the condition:
> 
> +#ifdef MODULE
> [ ... ]
> +static const struct of_device_id exynos4_mct_match_table[] = {
> +	{ .compatible = "samsung,exynos4210-mct", .data = &mct_init_spi, },
> +	{ .compatible = "samsung,exynos4412-mct", .data = &mct_init_ppi, },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, exynos4_mct_match_table);
> +
> +static struct platform_driver exynos4_mct_driver = {
> +	.probe		= exynos4_mct_probe,
> +	.driver		= {
> +		.name	= "exynos-mct",
> +		.of_match_table = exynos4_mct_match_table,
> +	},
> +module_platform_driver(exynos4_mct_driver);
> +#else
>  TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
>  TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
> +#endif
> 
>  is not acceptable as is. We don't want to do the same in all the drivers.

Are you suggesting we create a new timer macro to handle if we want to use
TIMER_OF_DECLARE() or builtin_platform_driver()?

> Furthermore, we should not assume if the modules are enabled in the kernel
> that implies the driver is compiled as a module.

Ah yes, that's right. The ifdef should be checking
CONFIG_CLKSRC_EXYNOS_MCT_MODULE.

Thanks,
Will

