Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA813CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHCWS+VC8+WEk/JMgYPWwAOlmhPKHDkBf3YM/7KG1cc=; b=vXZtpXHs+GRluv7zqutMXJpZxg
	2z4yfdeSdEd1JlAhqPwP/D2kXBJq76nQIOqfsRayK+s0io8TvoEjeVPHqPfM9kwNfxxM4DcCD3WoS
	E3gP38QWxtZgEo5qhpePAN52tIuoSkaI+Lu2E3Fjwnkh3RtCFGAcT3/LBGRei4Mg59LJKjnLwOLT1
	KuSTruiUXeFquRLwjcVrEG5qbzdMB9SZuU1c+y3JbeNKrjcQeV/Ppe00YBN3hTloJs3DB86ZgFC6w
	nebTbXbmd35PqJM8xJllXUVzldwT2HKQrmuBDV2O6f/zqmh/M59amDbAyXLpyg6Kt1d0pST012hLY
	qvAiF8Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDux-00000000n3f-3Kmy;
	Thu, 21 Aug 2025 22:37:59 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7So-0000000HRaa-0wOd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 15:44:31 +0000
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-61aa702c9ebso2624984a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 08:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755791069; x=1756395869; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zHCWS+VC8+WEk/JMgYPWwAOlmhPKHDkBf3YM/7KG1cc=;
        b=Y5PIJLevXvRaBq3yk982T34HEDJB3B1vstHnQt7Rn8bU560zZ1uGywC/aKf/Z0xhl0
         kR/4TuZa/s1tosOVjFTYhogGf3wzAgPs3I13e4/krOBSKpIT+N8dShSaag3junAdM6bP
         QzVXle87/YVZdutVx9WC58XCEIBlrCjZ+DM3MFOOMqGUztmbHyofCtUZysIH5La5jYvA
         0swOukYde5Qo8Bkp3spao20Fi68sqsUuw3WfGiYypQH09NMhLXxVfAvXmGyREhWFPYNa
         brpCjipDJiDZoEeUkXtwA5Mir1mYYIxAm+7QYo9WZhDICSM5+nVqmmXadEfeowAFmOjR
         pVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755791069; x=1756395869;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zHCWS+VC8+WEk/JMgYPWwAOlmhPKHDkBf3YM/7KG1cc=;
        b=jm1OaA+WzgtXtzcEut6zR1pL/6rgviWLLTt+X7+pm/FGr43qspB1V6uIU8Tso5TkB7
         ADOZ02pAxPhz7EFMVaSEsC5Rezc7pL132GqgTwn4t2jx7K5QFF85tX98siYzjdk64dE3
         hWEb9/DZMDTBSJidcJXylCtw9HQNG25T155k9rgUCRZvjb2bWGW9b0+tOrWR9oABeENT
         Jk46o8cTdcJv2MBAFPAiV8WUaVpDMYtRXH0fY8fNJxGNZoNFpewMeJ2PPioas9jecprs
         sd/f0QKvP8V/bxoEEGMKAEJ8loqXCRyf/+vtHagWgCm3yTaWdHqLTAtoEIrcjUVVZaR8
         bz4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV72FZ9EyPSc/RjVdopeEzhbJk6LnDb+1btEXfDIn2R8azDl8ZTjVymtjAKM6pEQ2chBwvyLYoosHDj2moFwREA@lists.infradead.org
X-Gm-Message-State: AOJu0Yywvpk+ra2Vc+3Aw60WxWMnP6EzAJRvZsal810Pp/1l0kAmdIja
	iZJKDc8Obs/hNS7JzofCDE4yl8xq1zgPd4OXyN8l51Kv5Lkb5pK6O4RdLFB5Yer+edI=
X-Gm-Gg: ASbGnctLPxXBzBsqJ/nWG15QgxzU722Zqkg8ko7iKEF8+W0RZdnW6jUocTGl2cS6mZV
	nItN0HzzhViPDFopmKvZg4Lrebpl99GAoK1Qxqa9NbImngbVtlvzgwqRjG7brxKuLZ0LucdQlcD
	HxPA1h+Nd0JDIs1Z5HCtrGnZ2Cdbrp8Kn2ahrZ6Xl4qGVT7zx4vHfRNUmB5nYGUqznTSpQ9Inv/
	I9ZeLKRQex/KFdcdyH8D+yq92ZPe0VcoI6/cHid8cQ0SJf2klowxD/IqT2iY6PXpj+Le4xaOrHP
	fjey8Co+kxb/uxZtwMRfmB89Ga0vjgW4wcptstl1tAYNy24d0eUtKZjucoxf8cJf1GCQ0vuFDxF
	ESorbPRd8k6+QMfpzCjZE6Qks118AOi0dv7MxpTnw1Y/gY+xbcFfvATVieKwY
X-Google-Smtp-Source: AGHT+IF2M6+RABGzsFZDYjodg6A087UWlGM875oBqCovBVShv1w/Fk6PCjDOVKZn+xDtdWRUVI3AEw==
X-Received: by 2002:a05:6402:d0d:b0:61a:9385:c78b with SMTP id 4fb4d7f45d1cf-61bf8950eacmr2157884a12.38.1755791068524;
        Thu, 21 Aug 2025 08:44:28 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a755d9ccasm5617045a12.4.2025.08.21.08.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:44:28 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 21 Aug 2025 17:46:21 +0200
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrea della Porta <andrea.porta@suse.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, wahrenst@gmx.net,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v3 2/3] pinctrl: bcm: Add STB family pin controller driver
Message-ID: <aKc_TdJarQBiFMI_@apocalypse>
References: <cover.1754922935.git.andrea.porta@suse.com>
 <bb746d2fd50ecbb9963438fae8601c2e4901a126.1754922935.git.andrea.porta@suse.com>
 <CACRpkdaH8sxQQFmx9-Gzc6ybJ_AFvLUCk=MiS=0KiB4VhZhXaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaH8sxQQFmx9-Gzc6ybJ_AFvLUCk=MiS=0KiB4VhZhXaw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_084430_266340_3D1D6294 
X-CRM114-Status: GOOD (  36.63  )
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

Hi Linus,

On 11:37 Tue 19 Aug     , Linus Walleij wrote:
> Hi Andrea/Ivan,
> 
> thanks for your patch!
> 
> I'll make a bit of detailed review below, the big question I have
> is if it is possible to split the files a bit, like:
> 
> pinctrl-brcmstb.c  <- STB core
> pinctrl-brcmstb.h  <- STB API
> pinctrl-brcmstb-bcm2717.c <- All BCM2712 specifics

I'm trying to find a suitable way to do that. The difficulty is
that AFAIK this is the only chipset using this driver so I'm
not sure what parts are generic and what are specific to BCM2712.
I'll do my best.

> 
> This would make it easier to reuse the base file with other STB
> chips, right?

Sure, provided we have a clear separation of common vs specific,
like stated above.

> 
> On Mon, Aug 11, 2025 at 4:45 PM Andrea della Porta
> <andrea.porta@suse.com> wrote:
> 
> > +#define FUNC(f) \
> > +       [func_##f] = #f
> > +
> > +#define PIN(i, f1, f2, f3, f4, f5, f6, f7, f8) \
> > +       [i] = { \
> > +               .funcs = { \
> > +                       func_##f1, \
> > +                       func_##f2, \
> > +                       func_##f3, \
> > +                       func_##f4, \
> > +                       func_##f5, \
> > +                       func_##f6, \
> > +                       func_##f7, \
> > +                       func_##f8, \
> > +               }, \
> > +       }
> 
> These macros have a bit too generic names. Prefix with BRCMSTB_* or
> something please.

Ack.

> 
> > +#define MUX_BIT_VALID          0x8000
> > +#define PAD_BIT_INVALID                0xffff
> > +
> > +#define BIT_TO_REG(b)          (((b) >> 5) << 2)
> > +#define BIT_TO_SHIFT(b)                ((b) & 0x1f)
> > +
> > +#define MUX_BIT(muxreg, muxshift) \
> > +       (MUX_BIT_VALID + ((muxreg) << 5) + ((muxshift) << 2))
> > +#define PAD_BIT(padreg, padshift) \
> > +       (((padreg) << 5) + ((padshift) << 1))
> > +
> > +#define GPIO_REGS(n, muxreg, muxshift, padreg, padshift) \
> > +       [n] = { MUX_BIT(muxreg, muxshift), PAD_BIT(padreg, padshift) }
> > +
> > +#define EMMC_REGS(n, padreg, padshift) \
> > +       [n] = { 0, PAD_BIT(padreg, padshift) }
> > +
> > +#define AGPIO_REGS(n, muxreg, muxshift, padreg, padshift) \
> > +       GPIO_REGS(n, muxreg, muxshift, padreg, padshift)
> > +
> > +#define SGPIO_REGS(n, muxreg, muxshift) \
> > +       [(n) + 32] = { MUX_BIT(muxreg, muxshift), PAD_BIT_INVALID }
> > +
> > +#define GPIO_PIN(n)            PINCTRL_PIN(n, "gpio" #n)
> > +#define AGPIO_PIN(n)           PINCTRL_PIN(n, "aon_gpio" #n)
> > +#define SGPIO_PIN(n)           PINCTRL_PIN((n) + 32, "aon_sgpio" #n)
> 
> These are also pretty generically named, but this is OK because they
> don't intrude on the pinctrl namespace as much.

If no one else has something against that, I'll leaving those as they are,
then. 

> 
> > +static inline u32 brcmstb_reg_rd(struct brcmstb_pinctrl *pc, unsigned int reg)
> > +{
> > +       return readl(pc->base + reg);
> > +}
> > +
> > +static inline void brcmstb_reg_wr(struct brcmstb_pinctrl *pc, unsigned int reg,
> > +                                 u32 val)
> > +{
> > +       writel(val, pc->base + reg);
> > +}
> 
> This looks like unnecessary indirection. Can't you just use readl/writel?

Sure, moreover there's just a small bunch of invokation for those functions...

> 
> > +static int brcmstb_pinctrl_fsel_set(struct brcmstb_pinctrl *pc,
> > +                                   unsigned int pin, enum brcmstb_funcs func)
> > +{
> > +       u32 bit = pc->pin_regs[pin].mux_bit, val;
> > +       const u8 *pin_funcs;
> > +       unsigned long flags;
> > +       int fsel;
> > +       int cur;
> > +       int i;
> > +
> > +       if (!bit || func >= func_count)
> > +               return -EINVAL;
> > +
> > +       bit &= ~MUX_BIT_VALID;
> > +
> > +       fsel = BRCMSTB_FSEL_COUNT;
> > +
> > +       if (func >= BRCMSTB_FSEL_COUNT) {
> > +               /* Convert to an fsel number */
> > +               pin_funcs = pc->pin_funcs[pin].funcs;
> > +               for (i = 1; i < BRCMSTB_FSEL_COUNT; i++) {
> > +                       if (pin_funcs[i - 1] == func) {
> > +                               fsel = i;
> > +                               break;
> > +                       }
> > +               }
> > +       } else {
> > +               fsel = (enum brcmstb_funcs)func;
> > +       }
> > +
> > +       if (fsel >= BRCMSTB_FSEL_COUNT)
> > +               return -EINVAL;
> > +
> > +       spin_lock_irqsave(&pc->fsel_lock, flags);
> 
> Please use lock guards instead, we do that in all new code:
> 
> #include <linux/cleanup.h>
> 
> guard(spinlock_irqsave)(&pc->fsel_lock);
> 
> The framework handles the flags variable and the freeing,
> look at other drivers using guard() for guidance.

Ack.

> 
> > +static int brcmstb_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
> > +                                          struct pinctrl_gpio_range *range,
> > +                                          unsigned int pin)
> > +{
> > +       struct brcmstb_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
> > +
> > +       return brcmstb_pinctrl_fsel_set(pc, pin, func_gpio);
> > +}
> > +
> > +static void brcmstb_pmx_gpio_disable_free(struct pinctrl_dev *pctldev,
> > +                                         struct pinctrl_gpio_range *range,
> > +                                         unsigned int offset)
> > +{
> > +       struct brcmstb_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
> > +
> > +       /* disable by setting to GPIO */
> > +       (void)brcmstb_pinctrl_fsel_set(pc, offset, func_gpio);
> > +}
> > +
> > +static const struct pinmux_ops brcmstb_pmx_ops = {
> > +       .free = brcmstb_pmx_free,
> > +       .get_functions_count = brcmstb_pmx_get_functions_count,
> > +       .get_function_name = brcmstb_pmx_get_function_name,
> > +       .get_function_groups = brcmstb_pmx_get_function_groups,
> > +       .set_mux = brcmstb_pmx_set,
> > +       .gpio_request_enable = brcmstb_pmx_gpio_request_enable,
> > +       .gpio_disable_free = brcmstb_pmx_gpio_disable_free,
> > +};
> 
> With regards to the GPIO "shotcut" functions:
> please familiarize yourself with Bartosz recent patch set:
> https://lore.kernel.org/linux-gpio/20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org/T/#t
> 
> This makes it possible for the pinctrl core to know about
> functions that are used for GPIO, so you can mark your
> pin controller as "strict". using the new .function_is_gpio()
> callback.
> 
> I plan to merge Bartosz series soon and if your pin controller
> is aware about which functions are GPIO functions, this makes
> things better.

Sure, very nice!

> 
> > +static int brcmstb_pull_config_set(struct brcmstb_pinctrl *pc,
> > +                                  unsigned int pin, unsigned int arg)
> > +{
> > +       u32 bit = pc->pin_regs[pin].pad_bit, val;
> > +       unsigned long flags;
> > +
> > +       if (bit == PAD_BIT_INVALID) {
> > +               dev_warn(pc->dev, "Can't set pulls for %s\n",
> > +                        pc->gpio_groups[pin]);
> > +               return -EINVAL;
> > +       }
> > +
> > +       spin_lock_irqsave(&pc->fsel_lock, flags);
> 
> Use a guard()

Ack.

Many thanks,
Andrea

> 
> Yours,
> Linus Walleij

