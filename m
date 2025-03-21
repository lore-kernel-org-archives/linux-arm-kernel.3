Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C37C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 10:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpI2ZDWuq3G6Uk5QSQZYNIovPpchlt6ElQHUEbJygfM=; b=TpIcYMoEY9QY/2pX4WWNtOgPE6
	ziObjj1Q4/q2ThiHLNSpOHaaCsVBYm+VUP3zVmR9BIAhK40UUV/lL/zmKvyNc6PhuPYWRhi8xkRdw
	GOorKljOGomgWyEennVKdCKFDMWWhLTvD+gI2OTY4rSk7ExwvQFpqyYA9ND6ZN1YJlKjMEoZku45j
	/I3HkSA9ZT/S2MM/jRcaKThgh0dCHgHAn5opqyFArBVqQchgpJprenSiLI0Qn8mTGKXCeCHhjXny4
	La7ijR/lJypn9clWco6STX8z5/IYBW0MNiBMhH1BiUhiyw/6tM8BTnboazfIsQA25joVDP/c5WCF/
	HvbjSEHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZRJ-0000000EUvN-0p1r;
	Fri, 21 Mar 2025 10:17:21 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYo5-0000000EO7y-315t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 09:36:51 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5240764f7c1so758216e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 02:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742549807; x=1743154607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpI2ZDWuq3G6Uk5QSQZYNIovPpchlt6ElQHUEbJygfM=;
        b=W6Vlc8kzfCUnw4bzRtZlycdoaaI46zqjeAeqkcF40JNBv0CKShdxv//d75PbP8IGyV
         xu/sM58qEpcm1TNVHyylxZRGzFvYeNLZHOOrXCvM2XWJGSDzy2s6unHN3CftR0x66+u5
         yrB2s3h3o9EFHe55JvWGItjk1+SmJAMfWjnrf4e9C+eOshPH1FidhtczL5vIrXSEJ8Zb
         71Fnwev2nR8NHoLZvP/3fnd+j/IOHzY7qwaM0OiYeHXkb/xG0Tel9fe99T6IERB0pqeE
         0Z+PoqJIM0r1jpjIyYGPw/NH01K8cQiJ/npwh5bZZnJBdvsiI5qv4E9cWmptGxCccgZE
         CaiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBNTQskfRLoTnZOsDWCCPY0IMEz1gXRxa2bYs24CkyMSyvaMZ4s5M/5g9JS9/bJL2cbyoS9WyR9Htu8dndVXVy@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3Cf5U9FI6yF0Gm2MI/3RNPHVhrD0hO23/bL0eesohZJEbQRYp
	KiXU/kwqJchpFHM1QjEFP8X2lv8/tPMoSFhE8tSl5vg+WbwxunEmM0auIg9J
X-Gm-Gg: ASbGncs8AnQVorhP8OPtIesl2E32x8uIhICuBTpRWLazCD5Z0jzw09TeZOyHwnVUBqA
	tdjkBRGFAWb5wxzpR6JLF0YPZd9LuNx7wSr85mYtMaR7cLOb3VbWwEmJcXh5pW7dECPDt19pMFC
	zCbSgC8OnzluGIbI6J/o9BIvezjfmsMNT7A+B45fXiNfq89w40vWTd5D9C0waHb+HLD6yGeAQld
	5RI9W9AYtyhYz8w1oEpg/wjd48CHTrGFJCJvDiZTaodOA/naSQJDJFaSC3DI4QB71g3j4MKt30U
	+0thaowwBIkPizbEhtoOSm9Q7Z8Lpmxuq4f3XHwIKa/yq/WnWNrj/RRBshyPBNwLpxLkT53pFZv
	FqqZ2f6g=
X-Google-Smtp-Source: AGHT+IFBjfVeBnC0RDyiEbcz9/wR4Coi6I5NXV69ArJCWLJ7P0cMyNCGMt4sML6M4MFSrJqfVbtxsg==
X-Received: by 2002:a05:6102:b11:b0:4bd:3519:44be with SMTP id ada2fe7eead31-4c50d4fd8f2mr1582183137.15.1742549806979;
        Fri, 21 Mar 2025 02:36:46 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86f9f4553d7sm324860241.21.2025.03.21.02.36.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 02:36:46 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86718c2c3b9so773809241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 02:36:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW42vz4mnH0ssHEIkF0eKyPfSolkwa1qwQ/ZmvWtK/oFSH32sqsrqEcE3pmeyHeftx6HZ8YndIiEYYjCMspnfk3@lists.infradead.org
X-Received: by 2002:a05:6102:54a4:b0:4c1:8b8e:e9f7 with SMTP id
 ada2fe7eead31-4c50d4b370emr1929888137.8.1742549805933; Fri, 21 Mar 2025
 02:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <202503211029.DnQpqsJs-lkp@intel.com> <927105f8-4aa8-4579-ac2e-bce4bce12b1e@app.fastmail.com>
In-Reply-To: <927105f8-4aa8-4579-ac2e-bce4bce12b1e@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Mar 2025 10:36:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUeynpmUUmZPViEBttANFmEhpjFn0wqNc1wQB6wRbd0rQ@mail.gmail.com>
X-Gm-Features: AQ5f1JqEvbttQ-lKLZf8npFjdUhrt-aqV_OwYka3KjE3DchYx8eW7jqUyLFbARM
Message-ID: <CAMuHMdUeynpmUUmZPViEBttANFmEhpjFn0wqNc1wQB6wRbd0rQ@mail.gmail.com>
Subject: Re: [soc:soc/drivers 20/24] ERROR: modpost: "__ffsdi2"
 [drivers/platform/cznic/turris-omnia-mcu.ko] undefined!
To: Arnd Bergmann <arnd@arndb.de>
Cc: kernel test robot <lkp@intel.com>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	arm <arm@kernel.org>, linux-sh@vger.kernel.org, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_023649_756137_A6CEAE58 
X-CRM114-Status: GOOD (  29.80  )
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

Hi Arnd,

On Fri, 21 Mar 2025 at 09:41, Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Mar 21, 2025, at 03:41, kernel test robot wrote:
> > First bad commit (maybe != root cause):
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
> > soc/drivers
> > head:   ba8755ab541fc629948233125db870d4dbf00a75
> > commit: ee7f8ed72990f28657b5bf598e695fcf4633f4ed [20/24] platform:
> > cznic: turris-omnia-mcu: Refactor requesting MCU interrupt
> > config: sh-allmodconfig
> > (https://download.01.org/0day-ci/archive/20250321/202503211029.DnQpqsJs-lkp@intel.com/config)
> > compiler: sh4-linux-gcc (GCC) 14.2.0
> > reproduce (this is a W=1 build):
> > (https://download.01.org/0day-ci/archive/20250321/202503211029.DnQpqsJs-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new
> > version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes:
> > https://lore.kernel.org/oe-kbuild-all/202503211029.DnQpqsJs-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >
> > ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!

Bug in driver (must not use __delay() directly).

> > ERROR: modpost: "devm_of_clk_add_hw_provider"
> > [drivers/media/i2c/tc358746.ko] undefined!
> > ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko]
> > undefined!
> > ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko]
> > undefined!

Missing dependencies for driver.

> >>> ERROR: modpost: "__ffsdi2" [drivers/platform/cznic/turris-omnia-mcu.ko] undefined!
>
> This comes from __bf_shf(spec) in omnia_mcu_request_irq().
>
> As far as I can tell, this is not your problem but in the
> SH architecture missing one of the libgcc functions that are
> called by gcc.
>
> Since this is only for compile-testing sh allmodconfig, and
> that is already broken because of other bugs, I'm not going
> to care either.
>
> Adding the linux-sh list to Cc, it would be nice to get a clean
> build again. All four problems should be trivial to address,
> and some of these have been broken for many years.

So one SH-specific issue to fix...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

