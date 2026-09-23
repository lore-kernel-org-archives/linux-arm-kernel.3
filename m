Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4912C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 16:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uK06dRcc183p1gV2Bdi0P3JOfOANYfMBgsbGabniYGA=; b=aIAXaFG4DRZAK+SgytCQxp5KIh
	tjvQ4i/drtH6neMBlmWHe0fo8sV5hVWgG+09RXGDQy+ljTgfXfhz5oH35hmkxd/G473+UXpdoqk1m
	eUdRhv8TtunQe4Rl8KIZmEDlbNaMhhN7jk3bGUDVn+hYm6cDxlIJ/KklR9K6Z6GQaAYsoRd3p0UPX
	Xmo0wbfqmEzlc/zxHFPqcSGUhVSnu+HMZDBO7A4ExqYTJejaYI6+Qdkh7gLqppyL6HVR0dQvRjZkV
	xUVHPGdc1hPzJAiaMSqYavoxLo1avoTIfcWEw8j8l+eF8KlV8TKAYA2YKLzpAxzenPF42+2nwHkrP
	042S2QBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PmW-00000008rgK-1Ik8;
	Wed, 23 Sep 2026 16:25:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PmS-00000008rfa-1Rho
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 16:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:Date:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uK06dRcc183p1gV2Bdi0P3JOfOANYfMBgsbGabniYGA=; b=EQNYfSas/aZdhQP/Fa/AGSc1ho
	rrDir8zZ9pm3ByDBA7OeWWt4mS91Zpm0hyb6tub+SefTg1arFbzsFKeGvOoUJKqaEnyjfE7W3iUXx
	RZp0MmoYYTFiSss+TvR0r1iPe9cJMVT281dmPN7tuZ5tSAbT6hy/GgZxF6F7vIU40JbVbW0wwLyyN
	ZypeBkQiHCsOyLphI0Sw8QSgF0WkGyKRmepUCjFHMuEQp7pqqpXGtkIuho1B8B/aAUyhNiUMqi8SC
	4XJ02c4ZdCYkWddRKIulCtZZ3p/O8L0KYwHDuDYZf4GnbUwpQLt1jNRdnz7tsu9u6127y1Cw8Iy17
	4/O+QdHw==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9PmO-0000000F0m5-3BhH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 16:25:10 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-486e1a044c5so954642f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 09:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790180707; x=1790785507; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uK06dRcc183p1gV2Bdi0P3JOfOANYfMBgsbGabniYGA=;
        b=G67XDlRbvV6OhpwxsQ4Ovv7Ma0vHSXNvRxMeg7U7VfCwjE00ujO8VIG7ZwsrnMgbpD
         2Vu5F4pgkYhXErb/4VcXO+q9oMVtpIpCJ8pawGmxpIoSqFjTZWpBkqFgxgyFWg7OHryh
         5MGyRHTh4Al1i2XR1AlxgvrMRhTfKDBtM/ANwV0MXPWiohNASlK7SmJOyf1gbAg1frlN
         Z8tPbu4z12RikCUhP6F6EtPtOR3QXq+7/TY25f39ssytqXEZg54PPAsAjOjg5DlM8/FT
         k5vJdd6142Iq+LTPZ8ZImFeu8uGJuUValZQU+hs9nypE+GMmkod/Ip99Bc8d2b0miBMY
         /6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790180707; x=1790785507;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uK06dRcc183p1gV2Bdi0P3JOfOANYfMBgsbGabniYGA=;
        b=GjVK1DrXE5JDwfracGwjY+oa1sgSidmXqEMyInh2Cx9IdLRXv2I+ko5VqHcDBe4Sfw
         ZQm2FL6W6I22e5uDzRKpGuiBY3P8EirGVNOcr5ciJVRvwor4ARwHqU/0CefmVsvmuXPx
         RSCoQsYAKoSAvooZWAJFiFuOEnFhN2zGWNeGJpaEIfdjAys6pVqc0DUbbHPfTi38yKaT
         c91eO+3sNixry6jqm5dJAN8GGngrOENqIlMobbJiskET10ygreDl3S3tnDD+y1kUv4TR
         9BEmLsYnkbAvekgyVV0WzQXRlvdyrOUX7nu8Zgri4VckAR5yuwjMn+brB+g3l+Sw+eyD
         m5/w==
X-Forwarded-Encrypted: i=1; AKwUvBxWd+o2vPfkc4u6f9h0S9ZU9Q0PaK1lRqeau51wlzSNqfw7/z2XTsljBfOTaOczXUKdE+9YyrbsLDLxd8/6KKN8@lists.infradead.org
X-Gm-Message-State: AFuF++noP384lRJfxSoHB73dZg5CEb6a+xusc7/s4oUG5C4GQitRgyjw
	w9I/e7d+xv0aV82Dcreo7qaAAn1N8J/bTAq+OXrR+LG69KGPfAsWKyKRxFDEKrfJMP4=
X-Gm-Gg: AYBFou1eT4CYhqsoSUHKuSny5jIMcqm/Oxs6rFO8Dxf9BmX/nyi9pajeRpK739R1mYP
	oAY58ZNoHhLmZUxVNAcDYILMxanuuKfdadPsSKIpIdHiF8607jPkVuHo8yAbQjeZsR7MUYKeUY2
	L3xzEMKHUlaZhebnQcwcjknJaWSR360sYpoFxhXI3HpQ/jWnaREQcXosb02jhVXtQq5xDzF/ofi
	k8Bp5SJQCl6GkBtLSarDWolvfLuQRTqfoTNCtw16FDx19CUQ4svnVdzztjtmjBJH6F0qrtD0yH/
	/Cb/BuCRLRjFcPAxSVbp05oyNbxcfDX/8YDwWLJFFYqEBz98J/ktTcC9NFg0sz/ss2jdxjCaBFa
	l4ATK/blgSMXqzShC/C3dS/Z9ofDc8fXCpeRZSpIbQE5zBzIJfQBRgQFPlOOWHj/18kEAU5qEs0
	738WKFHjlH2wXaj855vjq/1v+l4jQbpOCcSSuXk83emckqxDQ25764naWqXnZ9CpdkZiAX7F46I
	VufN9MXTsZnzcl9eOk=
X-Received: by 2002:a05:6000:491e:b0:487:7fd:734 with SMTP id ffacd0b85a97d-48867081acdmr4844345f8f.18.1790180706879;
        Wed, 23 Sep 2026 09:25:06 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c1fdsm9260151f8f.14.2026.09.23.09.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:25:06 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 23 Sep 2026 18:28:47 +0200
To: Gary Guo <gary@garyguo.net>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com,
	Sean Young <sean@mess.org>, Julian Braha <julianbraha@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v9 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <arP-P_a7OyhtMQyr@apocalypse>
References: <cover.1789724999.git.andrea.porta@suse.com>
 <22f454003902173a7230d0aee5fbd7261fcc163e.1789724999.git.andrea.porta@suse.com>
 <DLM3VDAEVVEO.1STV7HI3M3YXK@garyguo.net>
 <arPLa_g4mAg1t2rq@apocalypse>
 <DLMQPQRYTSNW.2Z6C0408NMCYK@garyguo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLMQPQRYTSNW.2Z6C0408NMCYK@garyguo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_172509_020257_C1C9D766 
X-CRM114-Status: GOOD (  70.05  )
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

On 14:46 Wed 23 Sep     , Gary Guo wrote:
> On Wed Sep 23, 2026 at 1:51 PM BST, Andrea della Porta wrote:
> > Hi Gary,
> > thanks for your feedback!
> >
> > On 20:51 Tue 22 Sep     , Gary Guo wrote:
> >> On Fri Sep 18, 2026 at 10:59 AM BST, Andrea della Porta wrote:

<...snip...>

> >> > +++ b/drivers/pwm/pwm-rp1.c
> >> > +
> >> > +int rp1_pwm_read_tachometer(struct device *dev)
> >> > +{
> >> > +	struct pwm_chip *chip;
> >> > +	struct rp1_pwm *rp1;
> >> > +	u32 tach_val;
> >> > +	int ret;
> >> > +
> >> > +	if (!dev)
> >> > +		return -EINVAL;
> >> > +
> >> > +	device_lock(dev);
> >> 
> >> You should use the device link mechanism for synchronizing unbind / runtime PM.
> >> That can be done in your RP1 fan driver, and it doesn't need locking on this
> >> driver.
> >
> > This does not enforce the locking though.
> 
> What locking do you think is needed?
> 
> Driver core takes care of ordering so you will never see a depended device
> going away while a dependant device is still bound. Your RP1 fan driver just
> need to make sure that it never calls this API after it's itself unbound --
> which it needs to guarantee anyway.

I think you're referring to the struct device (data) and module binary unloading
from memory, which is guaranteed not to happen when there is a dependent device
using it, but what happens when you try to unbind or suspend the device?
More on that below...

> 
> > Is it enough to just rely on
> > caller to create the device link in advance? IOW, just add a documentation
> > comment to the exported function prologue stating that the consumer is
> > responsible to sync via a device link is acceptable?
> 
> If you use pwm_get API then a device link is automatically created for you
> already (however, this automatic link does not pass runtime PM flags, so if you
> need that you still need to add link explicitly).

This driver implements only static PM ops so I think both pwm_get API or
device_link_add should deal automatically with races.
OTOH, what if the consumer obtains a reference to the PWM device via of_* API (or
other means)? Thhose calls does not create device link and we would still have unsync
critical paths.
I'm just trying to figure out whether I should design the exported function as
foolproof and caller agnostic wrt sync issues.
If relying on the caller to use pwm_get/device_link_add is enough, I'd be happy to
find out I'm just being overly paranoid, dropping all the locking to make teh code
simpler.

> 
> How this is supposed to be synchronized or documented is very hard to get right
> without seeing the user side driver -- if you already have a working version of
> the RP1 fan driver it might benefit to have it attached as a RFC patch in the

Agreed, that's why I was trying to be as consumer agnostic as possible. After all,
coupling two modules wrt their locking requirements is usually better to be avoided.
As for the sample fan driver, I have only a simple module that grab a reference
to the pwm device and call the exported tachometer function, so nothing really useful
for this discussion, yet.

> series; or an option to to drop the tachometer API and add it as part of the fan
> driver series.

That is a great advice. I think it's beneficial to discuss everything in one place,
and as a plus we won't block the pwm driver.

> 
> > Otherwise the only way I see to protect it in any scenario is via the mutex
> > I've already implemented and a second flag for the removing path (device_lock
> > will be dropped, of course).
> >
> >> 
> >> So Sashiko is kinda reporting a false positive here.
> >> 
> >> > +
> >> > +	chip = dev_get_drvdata(dev);
> >> > +	if (!chip) {
> >> > +		ret = -ENODEV;
> >> > +		goto err_dev_unlock;
> >> > +	}
> >> > +
> >> > +	rp1 = pwmchip_get_drvdata(chip);
> >> > +	if (!rp1) {
> >> > +		ret = -ENODEV;
> >> > +		goto err_dev_unlock;
> >> > +	}
> >> > +
> >> > +	mutex_lock(&rp1->lock);
> >> > +	if (!rp1->clk_enabled) {
> >> > +		ret = -EBUSY;
> >> > +		goto err_clk_unlock;
> >> > +	}
> >> > +
> >> > +	ret = regmap_read(rp1->regmap, RP1_PWM_PHASE(2), &tach_val);
> >> > +	if (ret)
> >> > +		goto err_clk_unlock;
> >> > +
> >> > +	ret = (int)tach_val;
> >> > +
> >> > +err_clk_unlock:
> >> > +	mutex_unlock(&rp1->lock);
> >> > +err_dev_unlock:
> >> > +	device_unlock(dev);
> >> > +
> >> > +	return ret;
> >> > +}
> >> > +EXPORT_SYMBOL_NS_GPL(rp1_pwm_read_tachometer, "RP1_PWM_FAN");
> >> > +
> >> > +static int rp1_pwm_probe(struct platform_device *pdev)
> >> > +{
> >> > +	struct device *dev = &pdev->dev;
> >> > +	unsigned long clk_rate;
> >> > +	struct pwm_chip *chip;
> >> > +	void __iomem	*base;
> >> > +	struct rp1_pwm *rp1;
> >> > +	int ret;
> >> > +
> >> > +	chip = devm_pwmchip_alloc(dev, RP1_PWM_NUM_PWMS, sizeof(*rp1));
> >> > +	if (IS_ERR(chip))
> >> > +		return PTR_ERR(chip);
> >> > +
> >> > +	rp1 = pwmchip_get_drvdata(chip);
> >> > +	ret = devm_mutex_init(dev, &rp1->lock);
> >> > +	if (ret)
> >> > +		return ret;
> >> > +
> >> > +	base = devm_platform_ioremap_resource(pdev, 0);
> >> > +	if (IS_ERR(base))
> >> > +		return PTR_ERR(base);
> >> > +
> >> > +	rp1->regmap = devm_regmap_init_mmio(dev, base, &rp1_pwm_regmap_config);
> >> > +	if (IS_ERR(rp1->regmap))
> >> > +		return dev_err_probe(dev, PTR_ERR(rp1->regmap), "Cannot initialize regmap\n");
> >> 
> >> You mentioned "rework regmap error paths" in cover letter.
> >> 
> >> But the issue is that regmap doesn't need be used here at all. RP1 is on PCIe
> >> so there is no need for bus abstraction, direct use of MMIO is sufficient.
> >> MMIO accessors have no error paths, so you're saying yourself from having to
> >> handle that, and also reduce the overhead by not having to go through an
> >> abstraction w/ indirect funicton calls.
> >>
> >> I suppose regmap was used when syscon was there; but it's not needed anymore.
> >
> > True, and I don't have any issue in converting back to MMIO call and drop the conditional for
> > error checking, but please consider the following, since the driver may be extended in the
> > future to support more features:
> >
> > - regmap gives you free debugfs view on the registers, which may be useful to test
> >   the new features.
> 
> Do you have any register that we want to access that is not part of the PWM
> facility, other than tachometer?

Not at the moment, no. But I don't see how this impact the debugfs usefulness.

> 
> > - regmap_write/read may still return an error in case the passed register is not in range.
> >   This will be trapped at runtime only, but could still be useful during development
> 
> I think this is rather a anti-feature. Having additional error paths for some
> thing that never happens is not a good idea, especially that you basically get 0
> coverage for these paths.

Sure. Well this is true once the code is crystallized and tested, so it's somewhat
still useful (only) during future development. But I got the point, and I agree.

> 
> You already know the shape of the register region, so the bounds checking
> provided by regmap would be better served by an ahead-of-time check:
> 
>     #define RP1_PWM_REG_MAX (RP1_PWM_DUTY(RP1_PWM_NUM_PWMS) + 4)
> 
>     struct resource *res;
>     base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>     if (IS_ERR(base))
>         return PTR_ERR(base);
> 
>     if (resource_size(res) < RP1_PWM_REG_MAX) ...

Fine for the probe method, but regmap_read/write also check for the range, for free.

> 
> Shameless plug: Rust abstractions for I/O access is actually pretty good in this
> regard in the sense that we try to prove statically that access canot fail. It
> also has PWM and platform abstractions. If you're interested in learning Rust
> this driver might be a good candidate :) If you're going to LPC we can chat
> about this there.

Now I'm tempted! :)
Although it will took far more time to upstream the driver so I think I have
to posticipate Rust for another driver.
Thanks for being so available for the LPC, really appreciated! Not sure if I
can make it this year but we'll see...

Regards,
Andrea

> 
> Best,
> Gary
> 
> > - I expect the PWM driver to be a access with very low frequency, so I guess the overhead 
> >   imposed by regmap is negligible.
> >
> > Since we already have it, I'd prefer to leave regmap if possible for the aforementioned reasons,
> > but I'm obviously open to drop it in favor of direct MMIO calls in case you or anyone else are
> > not seeing those as real benefits.
> 
> 

