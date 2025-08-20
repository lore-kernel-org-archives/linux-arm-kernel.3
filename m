Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E22BCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 14:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jcAhPAgzkLaVyfYJ6HVDIU6MyZqCUM3ppV4rWifv/Jk=; b=JOhVdNEayBqNTgn6DyqKzJ8W6a
	wQv/EkTNeGCgSRROYJ9judzajZLSey3kPmyrTew6aATUIj2fGT7suk1biMmR7LIS9Sf4e/hJ7qjsX
	ZvTLDItBJsocmYzH1WPlP/NrGPP4RtH0XvxBSrbfGWhSXqCgaObMk5ytkM6fPQ+37Z0/EVlz9Nldo
	+SHRUsIs+s9hMYlbcrgUjm0FowkD0YxGyrPv1um27aN+9kvEUvOibgmWm6V2gAuZi8jCmmFQf9u7O
	6FhlWoc06OPh+vn3Mh+BHmo0FDiDVjKCjDBzFnowhka7GWV5YKxxV0b5iDC7mtuhvTesSemWbLUR3
	nzwieSOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojgW-0000000E0x9-1Jmc;
	Wed, 20 Aug 2025 14:21:04 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoisN-0000000Dmxw-0K4k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 13:29:16 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-61a94bd82a5so2214834a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 06:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755696553; x=1756301353; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jcAhPAgzkLaVyfYJ6HVDIU6MyZqCUM3ppV4rWifv/Jk=;
        b=Mtl6k97UuSglgF4+5grbEDb5eAisZTxbor+CFDStjuaPZ322S324OLLVKpV7PPHQwK
         r2ex0ccWYudZdzOzPaM9pKngE5I0NyOtG2533a0NRnGi8DYNXB5kjcimqJJrPSUW9PB2
         qPrmqECXH3XvB/WGgM0hoRRCtdT1d68PXAV48AyCu+VI0+7Pg5IjI/QSwDaM2NbU1AvL
         AyiLovmpJIAHrBnZ+ACRv/k7JbKU3PJIR0RWds2fFyyZmB9RaJunJSw+8/tPosViVt1a
         OYLZi4vj7+eFKYBES6WvHwiBpHGXlDzW1AEC3SUdKcTsSenjYnh8BqaVAqans2yqCbBJ
         JdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755696553; x=1756301353;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jcAhPAgzkLaVyfYJ6HVDIU6MyZqCUM3ppV4rWifv/Jk=;
        b=LFK0fZJ2RkFHR1DM8+T1Kh85wHNnoPGqPeMWfSyu7JloNjPXhzXz5Ohivkf7/aDb4p
         A9FX9LpXD6v9xeZ3UErLjcMLpl64BmoasAGgEPRmD2RpC1ZR4uO5cHxXwsYYBRtNKtHm
         x5Oc2pSr2CS8kGfH9nnk0SAxNhe521IAMN/BfNb8nrPo+pxAh0GlTrHmr30Fop5SLLIj
         eOM7LYCIYTcxPXTKQMYh2YZO3qYlsCGFRurMAyf4XrTAVnn7dzaN2HsHp88k0tIpRIMs
         KNyk3OtsjTy84EjmPvCM4wRxDlOjhtZMTxuOqoKjisR+w6FrzPdpwfquNoFLtmlKtJu1
         gyXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPd+xoshBkwmCbxzgK8uLwLkylzR9qpSIJ0Vw7FmAU0LplDfCKyi7bjJJfzBARrSUNdL7hksj+XCM+lfe2x6aF@lists.infradead.org
X-Gm-Message-State: AOJu0YxkfKM7XhniX8DIrzVZ/5k/DKkE0otXwR/P5Cjcp+rrEEa65i1L
	8jMoqzR/LaJwhgoUhVAM0zNzALoLMm4foVWzxvjqfqbWQ7idJD5NS+5i6XiCCi/BJp/hP/wLnXb
	b2NS6iAzcFJ6sqqa99d5wtFd1VUPgDxQ=
X-Gm-Gg: ASbGncum48V3wWAR4xjzxjQgWjNRhkLYrwqMJuu4gg3aOsGHrjkMIyoYEoiCDmEyI/R
	xL+hjtXksiNLA4M76dTnMEnOTfLkq2dPNLsvsA+stCsZU0gjgAiENzKUtME6ZYTOCCg5uXky30F
	hIkODrt0mAoo1WJHqQp+ju7IuxN9XAoJJIgn7PtSs9HBzIQxVlEVIS8Xi7IFT8oCEuMws7Gmz0p
	ahxbDVTL3yZiVe+
X-Google-Smtp-Source: AGHT+IHFi3UnZfTw+Hv/V/cy2pIQVkpT2x65dTknRglGXAcVRAIsoET4c6TvnkcXRx3Ti2/3OD7ZQ+iy7/fDDxqGtI8=
X-Received: by 2002:a05:6402:510e:b0:617:e4ba:30aa with SMTP id
 4fb4d7f45d1cf-61a9786a600mr2311059a12.32.1755696553444; Wed, 20 Aug 2025
 06:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250819131814eucas1p2c57ccc084cf6736fed01a8a5c0b35fab@eucas1p2.samsung.com>
 <20250813131007.343402-8-linux.amoon@gmail.com> <20250819131803.23296-1-m.majewski2@samsung.com>
In-Reply-To: <20250819131803.23296-1-m.majewski2@samsung.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 20 Aug 2025 18:58:56 +0530
X-Gm-Features: Ac12FXxN9zWO5PU4nqi_PrX_I2ZcRMkaURhXBeEwISjFg2LiE8-GfoSiC8m4kiU
Message-ID: <CANAwSgTW7qZiSKRJuW-AqW9BKBrjsUMm8qqa1VKrxjUJFDG6zw@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] thermal/drivers/exynos: Refactor IRQ clear logic
 using SoC-specific config
To: Mateusz Majewski <m.majewski2@samsung.com>
Cc: alim.akhtar@samsung.com, bzolnier@gmail.com, daniel.lezcano@linaro.org, 
	justinstitt@google.com, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, llvm@lists.linux.dev, lukasz.luba@arm.com, 
	morbo@google.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	rafael@kernel.org, rui.zhang@intel.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_062915_112366_77D71F6A 
X-CRM114-Status: GOOD (  11.89  )
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

Hi Mateusz

Thanks for your review comments..
On Tue, 19 Aug 2025 at 18:48, Mateusz Majewski <m.majewski2@samsung.com> wrote:
>
> > A unified
> > exynos4210_tmu_clear_irqs() implementation now replaces the previous
> > reliance on SoC-specific functions and hardcoded register mappings.
>
> Well, right now we actually add exynos{4412,5420,5433}_tmu_clear_irqs :)
> But those are quite similar except irq_map values, so maybe they can be
> unified into one?
>
No, the BIT fields for RISE and FALL are a bit different for SoC
So that's the reason for splitting, the IRQ handle should be clean and compact.
So make them simple.

> Kind regards,
> Mateusz Majewski
Thanks
-Anand

