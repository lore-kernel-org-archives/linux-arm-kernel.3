Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E436C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODeygWUoyfZFfVTkmoKD2nbDJdrzVQ9HvoPK8jlMnfI=; b=TivJAwr+UuwfjvaUpcKwjSCRCT
	BKJ36XbHgWX3iu43XxiM65kp0/uUcQ6zkAedfpsdW0qLdHYhVAbpg/zeSVnJfDQmH3El2DC+GAiU2
	C3AhgOG269wnDY/Yt0mKpDuQNG6etyUtWbKQ8cRoEw1URGbM0MzFzSV3aItDviJxIaNK6i2VXOpsJ
	21vv7cERzYgXApb9q0A+L4QLD6qBkjn0YKhA6ZGkz1Xq8y9ZkRcv8SWzJuIiW0c4wLuFZSofmRkWr
	fos9QOqPQJJVP7VjGlL8TTbPl+ZOmdv44tYPer3eYPOAYdC9YmphENHuqSyKfBIAhxqvJ9t+j0M2+
	FgU1oNGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MOY-00000008IP1-3JYE;
	Wed, 23 Sep 2026 12:48:18 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MOW-00000008INq-3Ex3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:48:18 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so504316f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 05:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790167695; x=1790772495; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ODeygWUoyfZFfVTkmoKD2nbDJdrzVQ9HvoPK8jlMnfI=;
        b=Ic6eIo14qFZ+dwPP3EZDysJ5Wn+FwHe/NhRkk2tenSsQl0TjBFkwjCEfO3UaQB0iTW
         pkkDWK78kohdoB2SU7IsXuPdtqMUeF29IMjeEY4FFbFGdca4jey8Lp2YMyslx0V7/LzX
         aoyUvg/MmFz+kfv259iai54OAy4NmR3CC98V1Zz612X7dsvKe1YsT89IJEvNWSCzCg61
         5t2mLv33tENO5s8QamSWAd9mok7CUaYs/CjTuMikIjHk6HFKUX6K84lJU9RboDtPJ9qI
         jO7gG6esVExLrF/hQIgfM9zoicqei666SrNg9gtLTnGEZPpRK1KbKZkS+6965+Kgg/Sm
         V4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167695; x=1790772495;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODeygWUoyfZFfVTkmoKD2nbDJdrzVQ9HvoPK8jlMnfI=;
        b=JQouVNn5/Ag7x4VxY7aVlECtWkLUXcp0YtOdME1Zun0WvEgCqqNi60lH5wRD7AnBAq
         p5LmEteEHRhTjGg9qBQVOFFF3vdp4xtBZU/sdNfPlENpAs7ki1Ai2rwu3nzPu9DhqxzO
         GHoWn07fXVcenmQx1c4SYS/VgzrXVXQ+dtdGwb+0WWkAuzNm6wjcx6kntn3HByZrSpwO
         6p3kEVtUY5Y9qzS973BpLR9tvFFSv12gWZhWVNp5OqU/wAu3aPMWvUeOn5qdfk3fvKeP
         /z1zLpVHTUQSUwA4y8kqrn1ZRrUQKUniCBKf9iWwwFtC5gLek+EHbDCASwjIr0d++BIw
         BHpA==
X-Forwarded-Encrypted: i=1; AKwUvBw5ZVgdj/AeSth0PdAdCFe/4fUrIc3OAOoU+9TEIRQ7q6/NSsmgIljtgG9zUZmOjwCMVL4rwBlOvsGInY++it/K@lists.infradead.org
X-Gm-Message-State: AFuF++ksN+1PrAkHsrB3fk7lXE0rD+knQUqI3PWk9wCnNMimMmzBYR2t
	VOPlWUUOXPJwcz6on48xY1bNZ6hj+M/UKHhQGygd6v7TcQ8+6O1I21wq6OeBNRr51hM=
X-Gm-Gg: AYBFou0mp8S99AVAamdSSZK85V3qjPlw+Tkf4Hd89d2UdIiy2jOD6Cara7R3hnVliEY
	3Yx5Kl6arBglROtxwryUxLAs8eFVsHnCwBjm27SHjgIUwHDEzE+u11y4t9R9IcUI1KME5Afzmqi
	b5A0N1OFkUHfh0KQw2voOrcjt3g+Qt4KlVMgBW7M+eU7macojHLMbb37BK7HE1B8tTPRBFjWNKM
	vvIbEZtqNU2QOUEavFdMP4N/uPRk4OTGlkkEiMIdbk35CmCyJa9mbD3C3LTVb+p3g5/bx2BzL+s
	GS2BzPu21BzTwhRpuq/+B6sgeuNA/PVpFUT45cszxm/fobg7LW7414wGQyraIlJXI75fyCO0aJd
	42N3mJuCtfzXIj9a6P7InZQ/C6GpJhXrR6MuoyfWf0jGwNLvc3Eq4i6Ekxb1P0Ife9gMvmkkbYI
	RPMPvQ3b87C88NvEh+6ipYqk4/wmWoaMfqZmYsreg+E+Z9zqQW1jLP5ZUA32jy/PxU5SiyOg==
X-Received: by 2002:a05:6000:240d:b0:484:39b4:5bc9 with SMTP id ffacd0b85a97d-48867093ba7mr4171210f8f.26.1790167694853;
        Wed, 23 Sep 2026 05:48:14 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c267sm6932595f8f.16.2026.09.23.05.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:48:14 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 23 Sep 2026 14:51:55 +0200
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
Message-ID: <arPLa_g4mAg1t2rq@apocalypse>
References: <cover.1789724999.git.andrea.porta@suse.com>
 <22f454003902173a7230d0aee5fbd7261fcc163e.1789724999.git.andrea.porta@suse.com>
 <DLM3VDAEVVEO.1STV7HI3M3YXK@garyguo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLM3VDAEVVEO.1STV7HI3M3YXK@garyguo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_054816_850555_D21F7DAE 
X-CRM114-Status: GOOD (  45.87  )
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

Hi Gary,
thanks for your feedback!

On 20:51 Tue 22 Sep     , Gary Guo wrote:
> On Fri Sep 18, 2026 at 10:59 AM BST, Andrea della Porta wrote:
> > From: Naushir Patuck <naush@raspberrypi.com>
> >
> > The Raspberry Pi RP1 southbridge features an embedded PWM
> > controller with 4 output channels, alongside an RPM interface
> > to read the fan speed on the Raspberry Pi 5.
> >
> > Add the supporting driver.
> >
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
> > Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> 
> Put yourself a Co-developed-by perhaps? You made significant changes.

Ack.

> 
> I've tested the device on my Pi 5, and the fan is indeed spinning now :)

Nice! Thanks for testing it :)

> 
> > ---
> >  drivers/pwm/Kconfig                       |   8 +
> >  drivers/pwm/Makefile                      |   1 +
> >  drivers/pwm/pwm-rp1.c                     | 499 ++++++++++++++++++++++
> >  include/soc/bcm2835/raspberrypi-pwm-rp1.h |  10 +
> >  4 files changed, 518 insertions(+)
> >  create mode 100644 drivers/pwm/pwm-rp1.c
> >  create mode 100644 include/soc/bcm2835/raspberrypi-pwm-rp1.h
> >
> > diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> > index 7297760868790..e1baec8d294d1 100644
> > --- a/drivers/pwm/Kconfig
> > +++ b/drivers/pwm/Kconfig
> > @@ -637,6 +637,14 @@ config PWM_ROCKCHIP
> >  	  Generic PWM framework driver for the PWM controller found on
> >  	  Rockchip SoCs.
> >  
> > +config PWM_RASPBERRYPI_RP1
> > +	tristate "RP1 PWM support"
> > +	depends on MISC_RP1 || COMPILE_TEST
> > +	depends on HAS_IOMEM
> > +	select REGMAP_MMIO
> > +	help
> > +	  PWM framework driver for Raspberry Pi RP1 controller.
> > +
> >  config PWM_SAMSUNG
> >  	tristate "Samsung PWM support"
> >  	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
> > diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> > index 5630a521a7cff..c07fd24f69f39 100644
> > --- a/drivers/pwm/Makefile
> > +++ b/drivers/pwm/Makefile
> > @@ -57,6 +57,7 @@ obj-$(CONFIG_PWM_RENESAS_RZG2L_GPT)	+= pwm-rzg2l-gpt.o
> >  obj-$(CONFIG_PWM_RENESAS_RZ_MTU3)	+= pwm-rz-mtu3.o
> >  obj-$(CONFIG_PWM_RENESAS_TPU)	+= pwm-renesas-tpu.o
> >  obj-$(CONFIG_PWM_ROCKCHIP)	+= pwm-rockchip.o
> > +obj-$(CONFIG_PWM_RASPBERRYPI_RP1)	+= pwm-rp1.o
> >  obj-$(CONFIG_PWM_SAMSUNG)	+= pwm-samsung.o
> >  obj-$(CONFIG_PWM_SIFIVE)	+= pwm-sifive.o
> >  obj-$(CONFIG_PWM_SL28CPLD)	+= pwm-sl28cpld.o
> > diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
> > new file mode 100644
> > index 0000000000000..cfd38e46cc589
> > --- /dev/null
> > +++ b/drivers/pwm/pwm-rp1.c
> > +
> > +int rp1_pwm_read_tachometer(struct device *dev)
> > +{
> > +	struct pwm_chip *chip;
> > +	struct rp1_pwm *rp1;
> > +	u32 tach_val;
> > +	int ret;
> > +
> > +	if (!dev)
> > +		return -EINVAL;
> > +
> > +	device_lock(dev);
> 
> You should use the device link mechanism for synchronizing unbind / runtime PM.
> That can be done in your RP1 fan driver, and it doesn't need locking on this
> driver.

This does not enforce the locking though. Is it enough to just rely on
caller to create the device link in advance? IOW, just add a documentation
comment to the exported function prologue stating that the consumer is
responsible to sync via a device link is acceptable?
Otherwise the only way I see to protect it in any scenario is via the mutex
I've already implemented and a second flag for the removing path (device_lock
will be dropped, of course).

> 
> So Sashiko is kinda reporting a false positive here.
> 
> > +
> > +	chip = dev_get_drvdata(dev);
> > +	if (!chip) {
> > +		ret = -ENODEV;
> > +		goto err_dev_unlock;
> > +	}
> > +
> > +	rp1 = pwmchip_get_drvdata(chip);
> > +	if (!rp1) {
> > +		ret = -ENODEV;
> > +		goto err_dev_unlock;
> > +	}
> > +
> > +	mutex_lock(&rp1->lock);
> > +	if (!rp1->clk_enabled) {
> > +		ret = -EBUSY;
> > +		goto err_clk_unlock;
> > +	}
> > +
> > +	ret = regmap_read(rp1->regmap, RP1_PWM_PHASE(2), &tach_val);
> > +	if (ret)
> > +		goto err_clk_unlock;
> > +
> > +	ret = (int)tach_val;
> > +
> > +err_clk_unlock:
> > +	mutex_unlock(&rp1->lock);
> > +err_dev_unlock:
> > +	device_unlock(dev);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_NS_GPL(rp1_pwm_read_tachometer, "RP1_PWM_FAN");
> > +
> > +static int rp1_pwm_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	unsigned long clk_rate;
> > +	struct pwm_chip *chip;
> > +	void __iomem	*base;
> > +	struct rp1_pwm *rp1;
> > +	int ret;
> > +
> > +	chip = devm_pwmchip_alloc(dev, RP1_PWM_NUM_PWMS, sizeof(*rp1));
> > +	if (IS_ERR(chip))
> > +		return PTR_ERR(chip);
> > +
> > +	rp1 = pwmchip_get_drvdata(chip);
> > +	ret = devm_mutex_init(dev, &rp1->lock);
> > +	if (ret)
> > +		return ret;
> > +
> > +	base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(base))
> > +		return PTR_ERR(base);
> > +
> > +	rp1->regmap = devm_regmap_init_mmio(dev, base, &rp1_pwm_regmap_config);
> > +	if (IS_ERR(rp1->regmap))
> > +		return dev_err_probe(dev, PTR_ERR(rp1->regmap), "Cannot initialize regmap\n");
> 
> You mentioned "rework regmap error paths" in cover letter.
> 
> But the issue is that regmap doesn't need be used here at all. RP1 is on PCIe
> so there is no need for bus abstraction, direct use of MMIO is sufficient.
> MMIO accessors have no error paths, so you're saying yourself from having to
> handle that, and also reduce the overhead by not having to go through an
> abstraction w/ indirect funicton calls.
>
> I suppose regmap was used when syscon was there; but it's not needed anymore.

True, and I don't have any issue in converting back to MMIO call and drop the conditional for
error checking, but please consider the following, since the driver may be extended in the
future to support more features:

- regmap gives you free debugfs view on the registers, which may be useful to test
  the new features.
- regmap_write/read may still return an error in case the passed register is not in range.
  This will be trapped at runtime only, but could still be useful during development
- I expect the PWM driver to be a access with very low frequency, so I guess the overhead 
  imposed by regmap is negligible.

Since we already have it, I'd prefer to leave regmap if possible for the aforementioned reasons,
but I'm obviously open to drop it in favor of direct MMIO calls in case you or anyone else are
not seeing those as real benefits.

Many thanks,
Andrea

> 
> Best,
> Gary
> 
> > +
> > +	rp1->clk = devm_clk_get(dev, NULL);
> > +	if (IS_ERR(rp1->clk))
> > +		return dev_err_probe(dev, PTR_ERR(rp1->clk), "Clock not found\n");
> > +
> 

