Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974F0CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 11:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45Gyirnivv46PMdh1Lnt9ECnMjdDdutOYsw1cHCwkIY=; b=jNXqtUif6EMzfFq0hffY2nyaHU
	611ub8czis/VvS8lgKyVyvH8IStQMnsYpJXI7V62aQv2Pz+u656jAp4c0+mmg8BYERUfhD5RkJig7
	cGx+NYWJHXY9EJVh/gNhT22Qc8HN5GnZpb+pXLnzXLWiC/cIIO5eurNcTtF4TOlbO8u2yWsRrUUkC
	bkDkR/MJVOfjE4Wzj7S4YzzSbFIdbgIIZTE7ibi7B5YKlX7VXKvQ5KprXM8ZxRWO0RS5INuEgcb6W
	cHFYB7CwIy3a5LLZN1QRek7mFIJAGj8TKRQG/wo5AH3I9SpwyOOKFsFqo2blx4ooq8RLOiQx6uLy/
	ghgMHuqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKQ2-0000000AGDb-1LX3;
	Tue, 19 Aug 2025 11:22:22 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoInB-00000009zRH-1aeT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 09:38:10 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-55ce509f80dso5007495e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 02:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596287; x=1756201087; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45Gyirnivv46PMdh1Lnt9ECnMjdDdutOYsw1cHCwkIY=;
        b=qKwXSdb8gE+NpsbdFFodZnGM+VM+D6cMmUE8w4iy6LyVmhmmEdOt+JhCMCch36zwbA
         vcvt1UcwfvoX/e0L4oD5uKKT6ZkR2l+K9al7Y3xOAqqY0+khCbppD9YpQOEVoSujJgH8
         x0k09UVu18gYYC99DdfJ1vHVFnRdmf5qRp3nOjo7vt6ImB97CX8dit8g8l5oLBV/W1n+
         aUaKPzZJkXCsIb2aToS0j29CZ6GN2XCULRz4bDPTfuerwDUDHw+psFFe4g5+9Lob0CGA
         0EmB4SwS3X6Lp3L7bTx8VTGtHI2FmnTk+S2a3v7TPVz7FkSxHdulUyfBTQhkuIJhOuca
         375w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596287; x=1756201087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45Gyirnivv46PMdh1Lnt9ECnMjdDdutOYsw1cHCwkIY=;
        b=b/xFgm1p3L+u8u0Rz3IKGyKhXIFmEVeM5Ofx9v89UPNhNEuzmueSItLAB3R+YDZNMp
         Onp0jzKdHHja+N/LEZekHZKxzkrpImTPLwH5R162emAhpZi0h2kQ0UJMPxoxXxI4ltu4
         8D7qfJspSKZmpQpIcBnlMAIos0ZQ1188PTNr9PgfzuMn2CG4goJU6GzwwwZtJiaPCAAO
         K/mD3ithqqBQlvXcWK1gDI1MtqqS1wG1aFJKyqwcMM6aY5HsguzGt8iQ2AGxLo1ltZ0k
         9NFmsFbLU8CE0//L5+7IRddVm3EKHK3e8wr2WAuYFpoynrdjab32C+i4APWX6uy3EYUd
         NS7w==
X-Forwarded-Encrypted: i=1; AJvYcCWkFhdTRx2EqcPgaLAe/e+zRC+5ovU8sWhDcLvWExhSDGAvR/tkYPYnrsl3FLREbGRfj70u9hlx89RCg4kUX4Nc@lists.infradead.org
X-Gm-Message-State: AOJu0YxkK4TOZXlNvkKkc9ofKxB9oQACa4gXLTqYtwhGnBheBiWA2ixT
	RFnk86lr99AmEtTaEEhkPxMxfh5ci58ZboRvOkgTzKFXtclVtZerIa1Q3WbGgMck1G2nq1duWYs
	JMM8cz8Lm+X0LilfMRH7svM5xOE5t7anzVK22nA3Lwg==
X-Gm-Gg: ASbGncuqUg4xlqX0cCj4gMvZGqqOz9usdtOLB23bPnHrLCxae9uuCI9MiE5BeFCK/5J
	jRY6MvIFuXkVzdimgOqljnhMO1zgNZXrBtru9bn1b2bkZkG1K21hJQzIU4m74zT75jGhP2Gel3/
	mpgHOaBXSKhRaL9JrXNVP0Rn/uReF7g5Fw9a+LEiIoZ6TWztt7+Z1FJ5UK2e2KPgJt4ucZET18h
	JBtjgodiLgY
X-Google-Smtp-Source: AGHT+IGXVlOojxEDcgD+SsNiM3vrgcb4bOifDf292PuQ3chLA4qwroPbPD5ZSWbbg/JQdXsFHTqAE1Hi5Seml5pOfAI=
X-Received: by 2002:a05:6512:2c89:b0:55b:8f46:80f4 with SMTP id
 2adb3069b0e04-55e00863d0bmr581512e87.48.1755596286911; Tue, 19 Aug 2025
 02:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754922935.git.andrea.porta@suse.com> <bb746d2fd50ecbb9963438fae8601c2e4901a126.1754922935.git.andrea.porta@suse.com>
In-Reply-To: <bb746d2fd50ecbb9963438fae8601c2e4901a126.1754922935.git.andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 11:37:55 +0200
X-Gm-Features: Ac12FXzbOSTWApe1RnzVXH6U4DB1jaUnJzvcIC1jxBa1XB9XRDcN_qZMPH3lBoA
Message-ID: <CACRpkdaH8sxQQFmx9-Gzc6ybJ_AFvLUCk=MiS=0KiB4VhZhXaw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] pinctrl: bcm: Add STB family pin controller driver
To: Andrea della Porta <andrea.porta@suse.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	florian.fainelli@broadcom.com, wahrenst@gmx.net, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, iivanov@suse.de, 
	svarbanov@suse.de, mbrugger@suse.com, 
	Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_023809_445391_1BFD8919 
X-CRM114-Status: GOOD (  22.04  )
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

Hi Andrea/Ivan,

thanks for your patch!

I'll make a bit of detailed review below, the big question I have
is if it is possible to split the files a bit, like:

pinctrl-brcmstb.c  <- STB core
pinctrl-brcmstb.h  <- STB API
pinctrl-brcmstb-bcm2717.c <- All BCM2712 specifics

This would make it easier to reuse the base file with other STB
chips, right?

On Mon, Aug 11, 2025 at 4:45=E2=80=AFPM Andrea della Porta
<andrea.porta@suse.com> wrote:

> +#define FUNC(f) \
> +       [func_##f] =3D #f
> +
> +#define PIN(i, f1, f2, f3, f4, f5, f6, f7, f8) \
> +       [i] =3D { \
> +               .funcs =3D { \
> +                       func_##f1, \
> +                       func_##f2, \
> +                       func_##f3, \
> +                       func_##f4, \
> +                       func_##f5, \
> +                       func_##f6, \
> +                       func_##f7, \
> +                       func_##f8, \
> +               }, \
> +       }

These macros have a bit too generic names. Prefix with BRCMSTB_* or
something please.

> +#define MUX_BIT_VALID          0x8000
> +#define PAD_BIT_INVALID                0xffff
> +
> +#define BIT_TO_REG(b)          (((b) >> 5) << 2)
> +#define BIT_TO_SHIFT(b)                ((b) & 0x1f)
> +
> +#define MUX_BIT(muxreg, muxshift) \
> +       (MUX_BIT_VALID + ((muxreg) << 5) + ((muxshift) << 2))
> +#define PAD_BIT(padreg, padshift) \
> +       (((padreg) << 5) + ((padshift) << 1))
> +
> +#define GPIO_REGS(n, muxreg, muxshift, padreg, padshift) \
> +       [n] =3D { MUX_BIT(muxreg, muxshift), PAD_BIT(padreg, padshift) }
> +
> +#define EMMC_REGS(n, padreg, padshift) \
> +       [n] =3D { 0, PAD_BIT(padreg, padshift) }
> +
> +#define AGPIO_REGS(n, muxreg, muxshift, padreg, padshift) \
> +       GPIO_REGS(n, muxreg, muxshift, padreg, padshift)
> +
> +#define SGPIO_REGS(n, muxreg, muxshift) \
> +       [(n) + 32] =3D { MUX_BIT(muxreg, muxshift), PAD_BIT_INVALID }
> +
> +#define GPIO_PIN(n)            PINCTRL_PIN(n, "gpio" #n)
> +#define AGPIO_PIN(n)           PINCTRL_PIN(n, "aon_gpio" #n)
> +#define SGPIO_PIN(n)           PINCTRL_PIN((n) + 32, "aon_sgpio" #n)

These are also pretty generically named, but this is OK because they
don't intrude on the pinctrl namespace as much.

> +static inline u32 brcmstb_reg_rd(struct brcmstb_pinctrl *pc, unsigned in=
t reg)
> +{
> +       return readl(pc->base + reg);
> +}
> +
> +static inline void brcmstb_reg_wr(struct brcmstb_pinctrl *pc, unsigned i=
nt reg,
> +                                 u32 val)
> +{
> +       writel(val, pc->base + reg);
> +}

This looks like unnecessary indirection. Can't you just use readl/writel?

> +static int brcmstb_pinctrl_fsel_set(struct brcmstb_pinctrl *pc,
> +                                   unsigned int pin, enum brcmstb_funcs =
func)
> +{
> +       u32 bit =3D pc->pin_regs[pin].mux_bit, val;
> +       const u8 *pin_funcs;
> +       unsigned long flags;
> +       int fsel;
> +       int cur;
> +       int i;
> +
> +       if (!bit || func >=3D func_count)
> +               return -EINVAL;
> +
> +       bit &=3D ~MUX_BIT_VALID;
> +
> +       fsel =3D BRCMSTB_FSEL_COUNT;
> +
> +       if (func >=3D BRCMSTB_FSEL_COUNT) {
> +               /* Convert to an fsel number */
> +               pin_funcs =3D pc->pin_funcs[pin].funcs;
> +               for (i =3D 1; i < BRCMSTB_FSEL_COUNT; i++) {
> +                       if (pin_funcs[i - 1] =3D=3D func) {
> +                               fsel =3D i;
> +                               break;
> +                       }
> +               }
> +       } else {
> +               fsel =3D (enum brcmstb_funcs)func;
> +       }
> +
> +       if (fsel >=3D BRCMSTB_FSEL_COUNT)
> +               return -EINVAL;
> +
> +       spin_lock_irqsave(&pc->fsel_lock, flags);

Please use lock guards instead, we do that in all new code:

#include <linux/cleanup.h>

guard(spinlock_irqsave)(&pc->fsel_lock);

The framework handles the flags variable and the freeing,
look at other drivers using guard() for guidance.

> +static int brcmstb_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
> +                                          struct pinctrl_gpio_range *ran=
ge,
> +                                          unsigned int pin)
> +{
> +       struct brcmstb_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
> +
> +       return brcmstb_pinctrl_fsel_set(pc, pin, func_gpio);
> +}
> +
> +static void brcmstb_pmx_gpio_disable_free(struct pinctrl_dev *pctldev,
> +                                         struct pinctrl_gpio_range *rang=
e,
> +                                         unsigned int offset)
> +{
> +       struct brcmstb_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
> +
> +       /* disable by setting to GPIO */
> +       (void)brcmstb_pinctrl_fsel_set(pc, offset, func_gpio);
> +}
> +
> +static const struct pinmux_ops brcmstb_pmx_ops =3D {
> +       .free =3D brcmstb_pmx_free,
> +       .get_functions_count =3D brcmstb_pmx_get_functions_count,
> +       .get_function_name =3D brcmstb_pmx_get_function_name,
> +       .get_function_groups =3D brcmstb_pmx_get_function_groups,
> +       .set_mux =3D brcmstb_pmx_set,
> +       .gpio_request_enable =3D brcmstb_pmx_gpio_request_enable,
> +       .gpio_disable_free =3D brcmstb_pmx_gpio_disable_free,
> +};

With regards to the GPIO "shotcut" functions:
please familiarize yourself with Bartosz recent patch set:
https://lore.kernel.org/linux-gpio/20250815-pinctrl-gpio-pinfuncs-v5-0-955d=
e9fd91db@linaro.org/T/#t

This makes it possible for the pinctrl core to know about
functions that are used for GPIO, so you can mark your
pin controller as "strict". using the new .function_is_gpio()
callback.

I plan to merge Bartosz series soon and if your pin controller
is aware about which functions are GPIO functions, this makes
things better.

> +static int brcmstb_pull_config_set(struct brcmstb_pinctrl *pc,
> +                                  unsigned int pin, unsigned int arg)
> +{
> +       u32 bit =3D pc->pin_regs[pin].pad_bit, val;
> +       unsigned long flags;
> +
> +       if (bit =3D=3D PAD_BIT_INVALID) {
> +               dev_warn(pc->dev, "Can't set pulls for %s\n",
> +                        pc->gpio_groups[pin]);
> +               return -EINVAL;
> +       }
> +
> +       spin_lock_irqsave(&pc->fsel_lock, flags);

Use a guard()

Yours,
Linus Walleij

