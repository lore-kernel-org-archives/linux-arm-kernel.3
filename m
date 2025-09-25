Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF43CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 07:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fvGyyGJ8hFx3nYrMkZDfGE5Winq5taN5wWeFI0QZNc=; b=gAz5TmHiaKG3vJZ/otxVi5Hqsh
	ak+8bQCdibZyrpLDeMBEdmi36rXATA0JP8gZCr1XxbEbolzHwS8p2HsPlI1hQ3NBDxVySuO+V68+M
	tu2ZZ2pVO+XSBiFxYFRlYe4t/EOjJr2UPvwSaeWHsUteg/oDvdd3CI9fyuM7B/ir3BLZxokC6Jr2v
	kaA2tDnXnYPo+HussGPlsPUmmJ65aODzwNr5+QyIycReP9eJsVo97D4wOp3HEUBl5a9fOJ2iFckdA
	jMGDzU/eAzghesNd4YaP2jBd1opuydncS2/PZEbbid7QSKmvXaei76IvVqAnRuuafn2D44QqP6E2t
	du0h1UdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1gq7-00000006uV5-1pLL;
	Thu, 25 Sep 2025 07:56:31 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1gq4-00000006uTV-1mwD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 07:56:29 +0000
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-8b0055cbd0fso64309939f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 00:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758786987; x=1759391787;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fvGyyGJ8hFx3nYrMkZDfGE5Winq5taN5wWeFI0QZNc=;
        b=B4Pou/imhUaVrp5E2H6aE+LNjZbSlz9XddLe6x+ck9QHwX1U0vy+qDVUuhhrChRNn6
         V+j1yy8ZWJ91TVfHc2H8RYKF0/eAprlF5M3FJ7xBdMjrQJu0+2/QZN3oVMQCPGISQxoC
         5mYzZMEol3Zzrw4ivtkxiiYLWMHObpgT2aKxliiClrkj3pCeZQCXCbChbGrk4Xbsg4Yb
         Tg0hyerpEAfyo8rmS6xdpVMva5hu9d7tPgx4mxTjzwu9XcnwX0CTffl1ilq0IvgcNCeW
         ZYpeQkpipEU5rdb2R3/7Tb6jZuZVVFqGW7ZuFNCP6cqOj1+E/dv91ZC/BUyJwTrgppeM
         W98g==
X-Forwarded-Encrypted: i=1; AJvYcCXKJ7CzdUJEpSZ1AfHCtay2VnYUKHIk5B9CwS4EHC9SKHrzReubHl/jTsEMrqGzrb7nKptByo1hFa3iVsPhluxy@lists.infradead.org
X-Gm-Message-State: AOJu0YwiLGX0QJVzcnxkyzPcYqaCQjihw/p82/jrfVLeWSYiUdPUQo1x
	ZeZ9ndOBfL3121fBXW9rb4tMS9b29qikaX9zgPyHinBJ2F/vl4IuB1CmT91saRMT
X-Gm-Gg: ASbGnctnWdEwWRM7iV0M5QgE+ij0cyZ/8qX6KCxhEX8Uz2ExVX/lMiKtFC7UhclPPmq
	A5ZcfGtyOUaR9XXWxl4nFNAgg9lhmNxewmZNn8Nh4HtdwnAHBsUvkzmTsdqPKoshpuSoVSgHae4
	G1sdmHfTTnCsfj23N09nYqS+EJAChKEwYbuXFZGsAKzC1FBEcuNdSSV6nL/Dvq7WUuGOnW1KrDq
	nUGFyoLmoN7Cb9x2W45RjpRZyWAZclDu15y9wqExpjKGzdOCnRETdDy6ykWhyaNj2QyYcNjFJj/
	+2HUoaaAfd6kE4VrdFkD3HKYcUn1AoK7oqg0vZ6eoN4LoGnuFKjukWqk56NnmcqTKOwcVnQtShP
	Wes5AX5UxHAw3P6CeVIiRWIdrQsw34LrhLA9n0xUF0uuSp9ZNtJEez9tl/63HB4WT
X-Google-Smtp-Source: AGHT+IF0GdbMuTnc47vxDeVbzkuwDyKxLkVtDV8BuK8+bAXM2k1TEp1ChN0AgG6L3dZlafKW8k/96Q==
X-Received: by 2002:a05:6602:3f8a:b0:8e0:cc1b:f680 with SMTP id ca18e2360f4ac-9016c487c05mr361958539f.13.1758786987068;
        Thu, 25 Sep 2025 00:56:27 -0700 (PDT)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com. [209.85.166.171])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-903fb455dbbsm50807039f.10.2025.09.25.00.56.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 00:56:26 -0700 (PDT)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-425635acc4dso7004875ab.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 00:56:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX38yimFl41uXL/khRYwX7nHD8yvZk6MY7Kt07KSzUNXFr9PlMANyFYoqZ6loU6yHR08fD7mvC1LVoQSTFVCljn@lists.infradead.org
X-Received: by 2002:a05:6102:510d:b0:529:fc9e:84a0 with SMTP id
 ada2fe7eead31-5acd36bc5d5mr955558137.32.1758786509499; Thu, 25 Sep 2025
 00:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Sep 2025 09:48:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
X-Gm-Features: AS18NWAlEwAE5FC0AW6Wq0ip31mrrj6gmcRezsp6GMYcQa-YSc4N16xdaxhcVw8
Message-ID: <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	James Cowgill <james.cowgill@blaize.com>, Matt Redfearn <matt.redfearn@blaize.com>, 
	Neil Jones <neil.jones@blaize.com>, 
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Yang Shen <shenyang39@huawei.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_005628_462451_9C6FEF31 
X-CRM114-Status: GOOD (  18.56  )
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

Hi Bartosz,

On Thu, 11 Sept 2025 at 12:02, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The (typeof(foo)) construct is unusual in the kernel, use a more typical
> syntax by explicitly spelling out the type.

Thanks for your patch, which is now commit da3a88e9656c17a3 ("pinctrl:
use more common syntax for compound literals") in pinctrl/for-next

> Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org/

Looks like you (slightly) missed your target. The correct link is:

    Link: https://lore.kernel.org/aMAP9hAWars0T83r@smile.fi.intel.com

> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

