Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2812CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwtIggRcr5wxJSAP7GIf8f8SWw36+MX8jvX4Nt7H+dM=; b=W8LgXZHKIVaFa3t6NJtiCcF9Cg
	dMWQ6aBGUitew9v9WQmLz7uCdUU4Pqlf5r2ep0IwHT9YcsKoapo8oYxJERiTYQY1MQElcCPZE8AIJ
	Y9RF9aUoiJPATNUy6X+eRmnf/wKl6f0sY1t+RZG8SguieAAo4h8opENRTekd762D+O6FNj59f889k
	xJznBcf5Rcw9JCXgaB1/uVu2wktf83M+NOCTuwzCPdNn8j7hga9RkfWldrE4mrhbIhkVp+nCrSiry
	Wm2qaD7zgYWW0D9ypBXZ2snWVV3JGdDLSXGRVl7sOFf27JPmzRCuimp8U/FSDgbP4n94i1Yzitrgx
	BVbHr0gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugVg-00000005Rnr-0EYA;
	Sat, 06 Sep 2025 00:10:28 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuaSr-00000003Y8O-3flf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 17:43:11 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45ddca76f22so4395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 10:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757094188; x=1757698988; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OwtIggRcr5wxJSAP7GIf8f8SWw36+MX8jvX4Nt7H+dM=;
        b=qbBBC5GQ9YctLEzNVdrFqVtrq4Y+7Fm5pW/K/gWLcYAHkK9OB2glzeNpeHAUcMacQd
         SXdsx8Q1C9tPrzY364EdeP410xbbD8YLsvMkAksW7M/kSDAe91HuFwqxvEUg+Wwdjvkp
         rsA/KQuQk6Fvim4/bF1NBuEXOMGvT3PobkAuzuB/+/4GAx9Zsng/sT59OuK5cgNFDCbr
         elBVJlz9d5vHrGfpJDdShHMXRxMdgEwGd3y8SAoKYl1FeHDZ9U8J40419p1iPgdpQuxJ
         QrhLotgTazzO/C7zFIbAVgYLumZ98iw1RBUw2YAsSuXqKuUA60wSEN9vjzSeSY6Pl3Nx
         aESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757094188; x=1757698988;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OwtIggRcr5wxJSAP7GIf8f8SWw36+MX8jvX4Nt7H+dM=;
        b=FmRDvP0qs0BuiFeqh6UNfXInlnbrDiHieN0EkbNzH4YXLnDeQq8gmCkhZ9H51E8ndx
         DNrimhOLkkrGuyETYhqgMATjTIEbVI+G9dHVtLopfMBBuJAjXqqGa5NNU1xd5hTc+rns
         853kciHIQxEOUdNE/Wd7XNFbAPk5cQjhtn+6Ts6u4g/5gOXABt6HvlMXqbIrUnPinhMJ
         Jx/3urZvULbxx30jF+PsOMxh8e3aSBjScwx/3ZF6pTVBw1wumJc4J36+35e5BoAUNo68
         aHQt5uQ0rM+89jqOkV8CM8pKz21kWnz2lv46c2GivnKcCtI9JIaph5qFuxgejvgdFh3v
         3P7A==
X-Gm-Message-State: AOJu0YyNasc7AtRIcMDILV5jUgX8RFIH2MzxOYrRriuQ9I507MparfM4
	jZNlYLYei5DdW5+wKIXJR+7mlHAllT7Hq0WjusZzmryy5O3B3W46ePcrwijExK1swQ==
X-Gm-Gg: ASbGncu0xvNrcjnH1g61QAQmYkTXMR4HzHSwWGp6DsdOmYM8DOVv0c53xS/oV4ZONF0
	FXACip/Kttz8UTwSLVRBGtaC0IUnVoG4SQ/ky+xHpAG6o8IhUJcRARu6b+Uh+ZEn1hOD16BbrS0
	K8dorhNZ2EPSdIvmJpBpXcJ+TTMcjAAE9kksMa3U5g5TnU2NC1ZLBLmr8WRvAjB8xGZYy2VyXVb
	7YitvtA7+9Q53bzyyDBUFcePx4D6wLlfhhg4Knb2VJKGRvJIcZMOyc55wTEhu9DBuVBFIi0HCCd
	U35/u3j8VgkXQYWbBBlF30DA6NZrJW9grPFzN+scT2FWXptIv0FDplBBGG7PqSZLOyJAO1EiTPh
	dTMa3BMW0pCvL0U8vH9W8XfzHFUVnWDRaeqv8JNXuFenAg+hFg2e5qZhInJWwrnggkrE=
X-Google-Smtp-Source: AGHT+IGIUe8jcq4QkryXOklmIX18T8CVETybZwMU9Yokjp/gJoqXng9Eo2lvOISZKvvxWpy8bYMluQ==
X-Received: by 2002:a05:600c:15cc:b0:45c:b4fb:f0b3 with SMTP id 5b1f17b1804b1-45dd7b0f058mr1073055e9.3.1757094187488;
        Fri, 05 Sep 2025 10:43:07 -0700 (PDT)
Received: from google.com (26.38.155.104.bc.googleusercontent.com. [104.155.38.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fb9dbfsm32299414f8f.43.2025.09.05.10.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 10:43:06 -0700 (PDT)
Date: Fri, 5 Sep 2025 17:43:03 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Subject: Re: [PATCH] soc: samsung: exynos-pmu: Fix for CONFIG_DEBUG_PREEMPT
Message-ID: <aLshJ11k3c2T-MRs@google.com>
References: <20250905162446.88987-1-smostafa@google.com>
 <19a6f296-eb40-49cf-9571-2d7964cd3313@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19a6f296-eb40-49cf-9571-2d7964cd3313@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_104309_919678_A1B6A073 
X-CRM114-Status: GOOD (  28.30  )
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

On Fri, Sep 05, 2025 at 07:09:09PM +0200, Krzysztof Kozlowski wrote:
> On 05/09/2025 18:24, Mostafa Saleh wrote:
> > Booting the kernel on Pixel-6 with `CONFIG_DEBUG_PREEMPT` prints the
> > following WARN:
> > 
> > [    0.784187][    T1] BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
> > [    0.784328][    T1] caller is debug_smp_processor_id+0x20/0x30
> > [    0.784433][    T1] CPU: 6 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-rc4-gd69eb204c255 #1 PREEMPT
> > [    0.784439][    T1] Hardware name: Oriole (DT)
> > [    0.784441][    T1] Call trace:
> > [    0.784443][    T1]  show_stack+0x34/0xa0 (C)
> > [    0.784453][    T1]  dump_stack_lvl+0x7c/0xb0
> > [    0.784460][    T1]  dump_stack+0x18/0x24
> > [    0.784464][    T1]  check_preemption_disabled+0xf8/0x100
> > [    0.784470][    T1]  debug_smp_processor_id+0x20/0x30
> > [    0.784476][    T1]  gs101_cpuhp_pmu_online+0x40/0x108
> > [    0.784483][    T1]  cpuhp_invoke_callback+0x188/0x2d8
> > [    0.784490][    T1]  cpuhp_issue_call+0xec/0x240
> > [    0.784494][    T1]  __cpuhp_setup_state_cpuslocked+0x140/0x2c0
> > [    0.784499][    T1]  __cpuhp_setup_state+0x58/0x88
> > [    0.784504][    T1]  exynos_pmu_probe+0x2a4/0x380
> > [    0.784508][    T1]  platform_probe+0x64/0xd0
> > [    0.784516][    T1]  really_probe+0xd0/0x3b0
> > [    0.784520][    T1]  __driver_probe_device+0x8c/0x170
> > [    0.784524][    T1]  driver_probe_device+0x44/0x140
> > [    0.784528][    T1]  __device_attach_driver+0xd8/0x180
> > [    0.784532][    T1]  bus_for_each_drv+0x90/0xf8
> > [    0.784536][    T1]  __device_attach+0xa8/0x1d0
> > [    0.784540][    T1]  device_initial_probe+0x1c/0x30
> > [    0.784544][    T1]  bus_probe_device+0xb4/0xc0
> > [    0.784547][    T1]  device_add+0x4d0/0x700
> > [    0.784550][    T1]  of_device_add+0x4c/0x78
> > [    0.784556][    T1]  of_platform_device_create_pdata+0x9c/0x148
> > [    0.784560][    T1]  of_platform_bus_create+0x1d0/0x370
> > [    0.784563][    T1]  of_platform_bus_create+0x234/0x370
> > [    0.784567][    T1]  of_platform_populate+0x84/0x178
> > [    0.784571][    T1]  of_platform_default_populate_init+0xf0/0x120
> > [    0.784579][    T1]  do_one_initcall+0x68/0x2d0
> > [    0.784585][    T1]  kernel_init_freeable+0x2d8/0x358
> > [    0.784589][    T1]  kernel_init+0x28/0x168
> > [    0.784595][    T1]  ret_from_fork+0x10/0x20
> 
> Please trim from unnecessary parts - [time].

Will do.

> 
> > 
> > As this value is only read once, it doesn't require to be stable, so
> 
> Why it does not need to be stable? Onlining wrong CPU number is not
> desired...
> 
> > just use "raw_smp_processor_id" instead.
> 
> You might be just hiding some other real issue, because above stacktrace
> is from gs101_cpuhp_pmu_online() which IRQs disabled and preemption
> disabled. Provide analysis of the warning, instead of just making it
> disappear.

Not sure I understand, how is preemption disabled? that wouldn't fire
in that case.

I am not familiar with this driver, but as I see the value is used
only once, it would be stable, for example using get/put_cpu won't
really matter, because next access doesn't depend on the current CPU.
Otherwise, if you imply that this might not be enough, that means
the driver is already broken even without CONFIG_DEBUG_PREEMP
(which is beyond my knowledge at this point)

> 
> > 
> > Cc: Peter Griffin <peter.griffin@linaro.org>
> > Cc: André Draszik <andre.draszik@linaro.org>
> > 
> 
> No blank lines between tags.
> 
> Missing Fixes tag... and then Cc is not necessary. Please follow
> standard kernel process.

I will add the Fixes.

I am working with Peter and André, so I thought Cc is fine
(according to the process) in:
https://docs.kernel.org/process/5.Posting.html

Thanks,
Mostafa

> 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  drivers/soc/samsung/exynos-pmu.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> > index a77288f49d24..338f4758a089 100644
> > --- a/drivers/soc/samsung/exynos-pmu.c
> > +++ b/drivers/soc/samsung/exynos-pmu.c
> > @@ -338,7 +338,7 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
> >  
> 
> 
> Best regards,
> Krzysztof

