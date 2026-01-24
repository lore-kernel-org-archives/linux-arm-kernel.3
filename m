Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE35D715FC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 21:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dI6NZO2k1ZnhezkbcoBTkU4j6ZvU4LHb2Uh/eKb+MEQ=; b=WEUmG4oq0yVv9CQ5jfX0BsziFm
	3IehV7Vbcfs4q4+1gZG8Yy/qxde9HU3pcPL9GxWIlPwBTv8mYPsF3x6fBO0yyc9RGbgvTkdV+OkHQ
	PDJLs2CmR2ACXzE7+i5+O6rMh5+RnG576wd56UvZCaC3GUyee9QasGzyiY0LXXJhNBzwOw5wIaDWk
	HtXnc2BzfHd4D18zk++EKR7FSIUeE6EzjXWB1Gthh+NDy1w5aoVkR4zhAxCv5zmflr8bY55RamEng
	UjEtW3ViaTORbyhFlkxjoI2g2e5hSlJMdAPbQljnm2nsedbzLvF0ZH0F9EQRl4V4PBm5uouxrpGkH
	kB8iQ4Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjkqo-0000000AaXE-1JzW;
	Sat, 24 Jan 2026 21:07:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjkqi-0000000AaW9-2Zfr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 21:07:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9646F6011E
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 21:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D944C19425
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 21:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769288835;
	bh=UclknFpN2ZWd4uyp6MAwU80cqRd1X1vfkRRK1+y/n94=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=iPjkGIl/MsKSCH3BAycQX0vWp+HMLch/o5/rIimI7jUSnVBt7vOdjyITWccbSwha2
	 /Gwu74jqRVijsbLwDF71/L27hjEvJD7l5DXvZ4SHisYzwDvFYPR6KzlGT/H+xQxY+H
	 pR0WW6qGsk+19+3UaE+SyGpoQ7gXAcNCsbLn4jFfdeuYk7X+IXP4cmyehpNeXpv4kQ
	 OcxiVzJYl4iKllN7nYfAKjLxVbXaoQ8uTOYbosVdJXNjzfVKzjOsV6e5grfbeVXL5C
	 1b3vOgC3owq6APXHo63GFQ/5XvRwFWONSN8pDeHov0EtirL5i9y/pf62EHPQ0Gfx46
	 nal33MTE+NkdQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38316d0c26eso29715351fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 13:07:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUyxUeHMTWZIodqkkaZqx1kBVggN/iORztPo2I0ejO0637F0DcuozxgTiLa+qyKSaidTjdVfmFmNJ8hqQmyhpy7@lists.infradead.org
X-Gm-Message-State: AOJu0YzEAHq7geSdmcn0vsdwqOBW7COHu1pJRQ8Xj1dlVJ5pY7d4U7DY
	SlFspmgtBkp8u/mDz+Gnjmolz7QP8eQy4TfZ3iPDKQ3uhA0ageSA4KkXIns1v2BOsVyNlQk67XY
	cqnYCW7z3lbcBQ5XB4SXV4IJbjgzdwWCqdTRCmLDOqw==
X-Received: by 2002:a05:651c:4187:b0:37b:a30e:fe1e with SMTP id
 38308e7fff4ca-385f9dcdbe9mr139721fa.18.1769288833896; Sat, 24 Jan 2026
 13:07:13 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Jan 2026 16:07:12 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Jan 2026 16:07:12 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <cb13c3df-be09-4cf3-b679-4431862d7264@arm.com>
MIME-Version: 1.0
References: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
 <CAMRc=Md0h5b=N9CqV-9L9sOtCNbiL1-y6RE0x4+w9HYXE8=pEQ@mail.gmail.com>
 <e9fd0005-bfbb-4052-8c2a-9200eb0b60ac@arm.com> <16771005.dW097sEU6C@diego> <cb13c3df-be09-4cf3-b679-4431862d7264@arm.com>
Date: Sat, 24 Jan 2026 16:07:12 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfUawHpDgxj=fP2OF_-qg1O+P3oM_cSvGsbvAdLRB=+hw@mail.gmail.com>
X-Gm-Features: AZwV_Qj_fkFL-PYes-rtNy10zLCqgVdVHFhLik2wLfULvoDu_c3HvmP55gf-KMU
Message-ID: <CAMRc=MfUawHpDgxj=fP2OF_-qg1O+P3oM_cSvGsbvAdLRB=+hw@mail.gmail.com>
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
To: Robin Murphy <robin.murphy@arm.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, 24 Jan 2026 00:45:25 +0100, Robin Murphy <robin.murphy@arm.com> sai=
d:
> On 2026-01-23 9:52 pm, Heiko St=C3=BCbner wrote:
>> Am Freitag, 23. Januar 2026, 21:57:50 Mitteleurop=C3=A4ische Normalzeit =
schrieb Robin Murphy:
>>> On 2026-01-23 7:27 pm, Bartosz Golaszewski wrote:
>>>> On Fri, Jan 23, 2026 at 2:27=E2=80=AFPM Robin Murphy <robin.murphy@arm=
.com> wrote:
>>>>>
>>>>>>>
>>>>>>> It's not a big issue for the hdmirx driver specifically, but I wond=
er
>>>>>>> how many more (less often tested) rockchip drivers use GPIOs from t=
heir
>>>>>>> IRQ handler.
>>>>>
>>>>> Yeah, seems this finally reached my distro kernel and now the kernel =
log
>>>>> on one of my boards is totally flooded from gpio_ir_recv_irq()
>>>>> (legitimately) calling gpio_get_value()... that's not really OK :/
>>>>>
>>>>
>>>> This has always been a sleeping driver. The driver does not know the
>>>> firmware configuration it'll be passed and - as I explained above -
>>>> depending on the lookup flags, we may call .direction_output() and
>>>> descend into pinctrl which uses mutexes. Ideally, we'd make
>>>> GPIO-facing pinctrl operations not sleeping but this is a long-time
>>>> project and quite complex. Telling the GPIO core that it cannot sleep
>>>> is simply incorrect - even if it worked for this particular use-case -
>>>> and has an impact on paths we're choosing.
>>>>
>>>> Can the GPIO reading in the gpio-ir-recv driver be done from a
>>>> high-priority workqueue by any chance? Or can we make it a threaded
>>>> interrupt?
>>>

Let me circle back to my earlier question. Would the following change work?

diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-rec=
v.c
index a6418ef782bc..1f95e54bd146 100644
--- a/drivers/media/rc/gpio-ir-recv.c
+++ b/drivers/media/rc/gpio-ir-recv.c
@@ -26,6 +26,11 @@ struct gpio_rc_dev {
 };

 static irqreturn_t gpio_ir_recv_irq(int irq, void *dev_id)
+{
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t gpio_ir_recv_irq_thread(int irq, void *dev_id)
 {
 	int val;
 	struct gpio_rc_dev *gpio_dev =3D dev_id;
@@ -120,9 +125,10 @@ static int gpio_ir_recv_probe(struct platform_device *=
pdev)

 	platform_set_drvdata(pdev, gpio_dev);

-	return devm_request_irq(dev, gpio_dev->irq, gpio_ir_recv_irq,
-				IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
-				"gpio-ir-recv-irq", gpio_dev);
+	return devm_request_threaded_irq(dev, gpio_dev->irq, gpio_ir_recv_irq,
+					 gpio_ir_recv_irq_thread,
+					 IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
+					 "gpio-ir-recv-irq", gpio_dev);
 }

 static void gpio_ir_recv_remove(struct platform_device *pdev)

>>> rockchip_gpio_get() is essentially nothing but a readl(), please explai=
n
>>> how that could sleep? Saying that countless in-tree and out-of-tree
>>> arbitrary GPIO consumer drivers should pointlessly refactor just to
>>> avoid the GPIO core spewing spurious WARN()s is not reasonable.
>>>

Right, so gpiod_get_value() is a bit different from gpiod_set_value() becau=
se
it indeed can't descend into pinctrl.

>>> I appreciate there are cases where the warning most definitely *is*
>>> relevant, which is why I picked up this discussion rather than proposin=
g
>>> a revert, even though the documentation says:
>>>
>>>    * @can_sleep: flag must be set iff get()/set() methods sleep, as the=
y
>>>
>>> where since neither rockchip_gpio_get() nor rockchip_gpio_set()
>>> themselves sleep, apparently this flag must *not* be set. It's
>>> irrelevant that a higher-level gpiod_set_value() invocation might end u=
p
>>> calling .set_direction before it gets as far as calling .set - that's
>>> not the gpio_chip's fault, and gpiolib knows exactly what it's doing.
>>>

Well, the wording may be unfortunate and it's probably been this way for a
long time. I don't know the history here, this probably needs to be revised=
.

Please keep in mind: I don't deal with a single rockchip driver but with
a generic subsystem supporting hundreds of GPIO drivers and thousands of
users across the kernel tree. Not to mention all the API abuse like people
calling direction_output() from atomic context etc. We have all kinds of
combinations of sleeping and non-sleeping consumers and suppliers. It's
sometimes hard to find the middle ground.

Maybe the core GPIO code should not try to simulate open-source/open-drain
on non-sleeping chips for gpiod_set_value(). Or maybe we need a .uses_pinct=
rl
flag parallel to .cansleep which tells GPIO core that while set/get don't
sleep, direction_output/input may.

>
>> rockchip_pmx_gpio_set_direction()'s only function is to set the GPIO
>> pinmux - it does not handle the actual the actual direction.
>>
>> Can't we move the pinctrl_gpio_direction_input/_output() call just over
>> to the request callback of the gpiochip?
>

What if the user calls gpiod_direction_output() on a pin set to input?

> In fact, after an hour or so chasing through the code, is that not just
> pretty much this? (Not even compile tested as I'd rather go to bed now...=
)
>
> Cheers,
> Robin.
>
> ----->8-----
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 47174eb3ba76..118edd57c252 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -164,12 +164,6 @@ static int rockchip_gpio_set_direction(struct gpio_c=
hip *chip,
>   	unsigned long flags;
>   	u32 data =3D input ? 0 : 1;
>
> -
> -	if (input)
> -		pinctrl_gpio_direction_input(chip, offset);
> -	else
> -		pinctrl_gpio_direction_output(chip, offset);
> -
>   	raw_spin_lock_irqsave(&bank->slock, flags);
>   	rockchip_gpio_writel_bit(bank, offset, data, bank->gpio_regs->port_ddr=
);
>   	raw_spin_unlock_irqrestore(&bank->slock, flags);
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl=
-rockchip.c
> index e44ef262beec..2fc67aeafdb3 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3545,10 +3545,9 @@ static int rockchip_pmx_set(struct pinctrl_dev *pc=
tldev, unsigned selector,
>   	return 0;
>   }
>
> -static int rockchip_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
> -					   struct pinctrl_gpio_range *range,
> -					   unsigned offset,
> -					   bool input)
> +static int rockchip_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
> +					    struct pinctrl_gpio_range *range,
> +					    unsigned int offset)
>   {
>   	struct rockchip_pinctrl *info =3D pinctrl_dev_get_drvdata(pctldev);
>   	struct rockchip_pin_bank *bank;
> @@ -3562,7 +3561,7 @@ static const struct pinmux_ops rockchip_pmx_ops =3D=
 {
>   	.get_function_name	=3D rockchip_pmx_get_func_name,
>   	.get_function_groups	=3D rockchip_pmx_get_groups,
>   	.set_mux		=3D rockchip_pmx_set,
> -	.gpio_set_direction	=3D rockchip_pmx_gpio_set_direction,
> +	.gpio_request_enable	=3D rockchip_pmx_gpio_request_enable,
>   };
>
>   /*
>

I'm not sure what's going on here. You don't really need to call
pinctrl_gpio_direction_input/output()?

I'm putting it on my TODO list to figure out a proper way of interacting
with pinctrl. At the same time, I want to fix your problem so the .uses_pin=
ctrl
flag sounds like a solution. This would make gpio-shared-proxy still use
a mutex but we wouldn't warn in gpiod_get_value(). Unless you can simply sw=
itch
to a threaded interrupt in the IR driver. Maybe the latency would be
negligible?

Bartosz

