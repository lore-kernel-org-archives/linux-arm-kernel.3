Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9FDF8A146
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 10:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HCRqhH2DLFveExlKyLVA9G9WBAn4h6tRZdd4chEffg=; b=xQh44duToIke4idHGtZs+HNfXl
	P4iydT1s8Wy7p8WHNEvsrDPDJ2W1asXRuKNi9hLOu2OliH2rwXUyMzbSxMLIXh4EvN3xzUFj/zH3O
	otX3baORFGmeljw3JUmjMNFtPHgAMJf6NbgarGXQ7tRzJpS1vEUxMlw33Yk2sDX7/U2wUE44xfAP8
	1BAI21R794ohdYt+oikDqqro3hzjIMihOzQkh3FyE5Nx7vjKWlJoEI2IWYWRdvphQ3Wny+V+8lZ/Q
	dUecmEP9zxG2TfRR8BeeUgLLnYP9IENsUw3G7Zwt1JFASl1q6YpgFP0k2WRxB2R3T506AXMsabtcR
	7ibIXilw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJwj-00000002J79-2nuu;
	Thu, 16 Apr 2026 10:27:41 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJwf-00000002J6S-31Cu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 10:27:39 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43eada6d900so1434699f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 03:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776335255; x=1776940055; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4HCRqhH2DLFveExlKyLVA9G9WBAn4h6tRZdd4chEffg=;
        b=WoqDGxJT+tEPQxn1h1cUk1j05uYBlKeSEzll7My260DtYGFIJvTTBy3AAVnQbMPk7j
         d2KBTHHqPTeXhz3b4wiB8HHEqyhDJJtE3y9tWOxsa3Sh/j2LBsECGUxP4oNMYerbAHCS
         K4GcpbHsYuLW2FSJP5rfPnx2jLUknk+EECkBfmHAxtCqU9b6+nTjlhgW1OOhSnamDXtj
         wSqZP8qs9ukgAZSSPfiea6MTG0JhR7pPC1XnRtmtKFd3kLufG5l2mXwbwTC7Tr8NE7Ax
         XMdzVJaIQajCTlRhcVoFrXFeAYJ6t23pBdqB8O+Rnh4TjUNF57u9GuaAltphg5hAGkNM
         akaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776335255; x=1776940055;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4HCRqhH2DLFveExlKyLVA9G9WBAn4h6tRZdd4chEffg=;
        b=HrwE4FYshzj67b+opliAvwUUhLmo7jl6aippwKbG8UWO8mC4zpDR7f1caeurl2vcDY
         /EjJm/yMNGjckmZfluPeR+ZTukGkAWfArFQnUPoiI+pn+vtvZUGHIm18F2dlT72mWjhL
         im9fA+jz8K+e6ogbnvxpAntMTTX2lAqzXaZh5N9huGQONyEiTVnQyRwd7DftQPW2WXsi
         dU0gYzETfrA+a0eNguznL5rlmovLyn4SYbOEMjTcbxbMTiPSCzHewE1pInzKEJh8hUaL
         8lUJE8vxx3eq4SE00uNHynusXLUMmIT5ZVRQ5TROtNCiEL+MkqJpT0Z76WljiWduvC7M
         Od+A==
X-Forwarded-Encrypted: i=1; AFNElJ9Pg9Myi39ffSLCay0JQwg+erug7nuZYSezO/i0SuBmOFS2TO1cqPHbkIHqdt3gXapj9g1cRIGcG9X3E9WD3/m+@lists.infradead.org
X-Gm-Message-State: AOJu0YzAVxzBEDvBpLG9vDUsV53/5HfUskSdD6H4gxTFZnxOLsKTVUn2
	gW315cS9jfs4uZeN8ELO3MlvlX1vnkHR2ThCqKyVtx7/TSpJiGS/j4tAkA3Q9sRko78=
X-Gm-Gg: AeBDievTIBhCxZRGZop/MNDvbgmID/pnhV4nSjRyCS/VrgsoMv68gjn0Ynis3/KFp01
	IzuZTHU2ENxJ0vE0NBLiGJetJHmpT36KYS4VeZ5AHo7tYvv5s4LigSKGsyJPjrjFyYM6h0+7bCb
	JsKceiaA+gukFAPxTkhj9HFoAyfCQKOYGJ8iepzhEQPo/EEeAeXZwhhofSu6AF9rAeDszW1fQoI
	XsJEqMq0/O+rX+r4ziWJcyQgHXyu4JnP6GzLv4JTee8g8o6vd+y/iAK+5epVsRAWvkE6Bzw/VJ7
	ApkDEQrf88i2WNB+kxmxnMbn07bgGAjxkuRj0mUBupzHyXbu51JNxDY2l2Bc7C8CjY+qWisDVjQ
	2Gj4vj5XRiklbYHviPs5HjZQz21dzMeYhSNUPnqIMpGJocnxeb7Z1+7G37YHTEhJMAps5pPT96R
	cUtBXfdptcN1891q6tSnHxTe0r65SU4x5VJw7qUt4WEyyEbnDcHhG5I44OuJR58ESJqNUXpT4nM
	XqKEz4=
X-Received: by 2002:a05:6000:25c2:b0:439:c18f:5aaf with SMTP id ffacd0b85a97d-43d642ccd7dmr38851820f8f.34.1776335254939;
        Thu, 16 Apr 2026 03:27:34 -0700 (PDT)
Received: from localhost (host-79-33-140-232.retail.telecomitalia.it. [79.33.140.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3566b7sm13011883f8f.11.2026.04.16.03.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 03:27:34 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 16 Apr 2026 12:30:43 +0200
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>, linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
Subject: Re: [PATCH v2 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <aeC6U7D6TfWm8JPx@apocalypse>
References: <cover.1775829499.git.andrea.porta@suse.com>
 <0d99317b9150310dfbd98de1cb2a890f0bffe7cd.1775829499.git.andrea.porta@suse.com>
 <adkrHkANCzxO8KUP@monoceros>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adkrHkANCzxO8KUP@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_032737_817110_CD49779D 
X-CRM114-Status: GOOD (  44.42  )
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

Hi Uwe,

On 19:31 Fri 10 Apr     , Uwe Kleine-König wrote:
> Hello Andrea,
> 
> nice work for a v2!

Thanks!

> 
> On Fri, Apr 10, 2026 at 04:09:58PM +0200, Andrea della Porta wrote:

<...snip...>

> > +#define RP1_PWM_GLOBAL_CTRL	0x000
> > +#define RP1_PWM_CHANNEL_CTRL(x)	(0x014 + ((x) * 0x10))
> > +#define RP1_PWM_RANGE(x)	(0x018 + ((x) * 0x10))
> > +#define RP1_PWM_PHASE(x)	(0x01C + ((x) * 0x10))
> > +#define RP1_PWM_DUTY(x)		(0x020 + ((x) * 0x10))
> > +
> > +/* 8:FIFO_POP_MASK + 0:Trailing edge M/S modulation */
> > +#define RP1_PWM_CHANNEL_DEFAULT		(BIT(8) + BIT(0))
> 
> Please add a #define for BIT(8) and then use that and
> FIELD_PREP(RP1_PWM_MODE, RP1_PWM_MODE_SOMENICENAME) to define the
> constant. Also I would define it below the register defines.

Ack.

> 
> > +#define RP1_PWM_CHANNEL_ENABLE(x)	BIT(x)
> > +#define RP1_PWM_POLARITY		BIT(3)
> > +#define RP1_PWM_SET_UPDATE		BIT(31)
> > +#define RP1_PWM_MODE_MASK		GENMASK(1, 0)
> 
> s/_MASK// please
> 
> It would be great if the bitfield's names started with the register
> name.

Ack.

> 
> > +
> > +#define RP1_PWM_NUM_PWMS	4
> > +
> > +struct rp1_pwm {
> > +	struct regmap	*regmap;
> > +	struct clk	*clk;
> > +	unsigned long	clk_rate;
> > +	bool		clk_enabled;
> > +};
> > +
> > +struct rp1_pwm_waveform {
> > +	u32	period_ticks;
> > +	u32	duty_ticks;
> > +	bool	enabled;
> > +	bool	inverted_polarity;
> > +};
> > +
> > +static const struct regmap_config rp1_pwm_regmap_config = {
> > +	.reg_bits    = 32,
> > +	.val_bits    = 32,
> > +	.reg_stride  = 4,
> > +	.max_register = 0x60,
> 
> I'm not a fan of aligning the = in a struct, still more if it fails like
> here. Please consistently align all =s, or even better, use a single
> space before each =. (Same for the struct definitions above, but I won't
> insist.)

Let's use the single space.

> 
> > +};
> > +
> > +static void rp1_pwm_apply_config(struct pwm_chip *chip, struct pwm_device *pwm)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	u32 value;
> > +
> > +	/* update the changed registers on the next strobe to avoid glitches */
> > +	regmap_read(rp1->regmap, RP1_PWM_GLOBAL_CTRL, &value);
> > +	value |= RP1_PWM_SET_UPDATE;
> > +	regmap_write(rp1->regmap, RP1_PWM_GLOBAL_CTRL, value);
> 
> I assume there is a glitch if I update two channels and the old
> configuration of the first channel ends while I'm in the middle of
> configuring the second?

The configuration registers are per-channel but the update flag is global.
I don't have details of the hw insights, my best guess is that anything that
you set in the registers before updating the flag will take effect, so there
should be no glitches.

> 
> > +}
> > +
> > +static int rp1_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +
> > +	/* init channel to reset defaults */
> > +	regmap_write(rp1->regmap, RP1_PWM_CHANNEL_CTRL(pwm->hwpwm), RP1_PWM_CHANNEL_DEFAULT);
> > +	return 0;
> > +}
> > +
> > +static int rp1_pwm_round_waveform_tohw(struct pwm_chip *chip,
> > +				       struct pwm_device *pwm,
> > +				       const struct pwm_waveform *wf,
> > +				       void *_wfhw)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	struct rp1_pwm_waveform *wfhw = _wfhw;
> > +	u64 clk_rate = rp1->clk_rate;
> > +	u64 ticks;
> 
> 	if (!wf->period_length_ns)
> 		wfhw->enabled = false
> 		return 0;
> 
> > +	ticks = mul_u64_u64_div_u64(wf->period_length_ns, clk_rate, NSEC_PER_SEC);
> 
> To ensure this doesn't overflow please fail to probe the driver if
> clk_rate > 1 GHz with an explaining comment. (Or alternatively calculate
> the length of period_ticks = U32_MAX and skip the calculation if
> wf->period_length_ns is bigger.)

Ack.

> 
> > +	if (ticks > U32_MAX)
> > +		ticks = U32_MAX;
> > +	wfhw->period_ticks = ticks;
> 
> What happens if wf->period_length_ns > 0 but ticks == 0?

I've added a check, returning 1 to signal teh round-up, and a minimum tick of 1
in this case.

> 
> > +	if (wf->duty_offset_ns + wf->duty_length_ns >= wf->period_length_ns) {
> 
> The maybe surprising effect here is that in the two cases
> 
> 	wf->duty_offset_ns == wf->period_length_ns and wf->duty_length_ns == 0
> 
> and
> 	
> 	wf->duty_length_ns == wf->period_length_ns and wf->duty_offset_ns == 0
> 
> you're configuring inverted polarity. I doesn't matter technically
> because the result is the same, but for consumers still using pwm_state
> this is irritating. That's why pwm-stm32 uses inverted polarity only if
> also wf->duty_length_ns and wf->duty_offset_ns are non-zero.

Ack.

> 
> > +		ticks = mul_u64_u64_div_u64(wf->period_length_ns - wf->duty_length_ns,
> > +					    clk_rate, NSEC_PER_SEC);
> 
> The rounding is wrong here. You should pick the biggest duty_length not
> bigger than wf->duty_length_ns, so you have to use
> 
> 	ticks = wfhw->period_ticks - mul_u64_u64_div_u64(wf->duty_length_ns, clk_rate, NSEC_PER_SEC):
> 
> . I see this is a hole in the pwmtestperf coverage.

Ack.

> 
> > +		wfhw->inverted_polarity = true;
> > +	} else {
> > +		ticks = mul_u64_u64_div_u64(wf->duty_length_ns, clk_rate, NSEC_PER_SEC);
> > +		wfhw->inverted_polarity = false;
> > +	}
> > +
> > +	if (ticks > wfhw->period_ticks)
> > +		ticks = wfhw->period_ticks;
> 
> You can and should assume that wf->duty_length_ns <=
> wf->period_length_ns. Then the if condition can never become true.

Ack.

> 
> > +	wfhw->duty_ticks = ticks;
> > +
> > +	wfhw->enabled = !!wfhw->duty_ticks;
> > +
> > +	return 0;
> > +}
> > +
> > +static int rp1_pwm_round_waveform_fromhw(struct pwm_chip *chip,
> > +					 struct pwm_device *pwm,
> > +					 const void *_wfhw,
> > +					 struct pwm_waveform *wf)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	const struct rp1_pwm_waveform *wfhw = _wfhw;
> > +	u64 clk_rate = rp1->clk_rate;
> > +	u32 ticks;
> > +
> > +	memset(wf, 0, sizeof(*wf));
> 
> 	wf = (struct pwm_waveform){ };
> 
> is usually more efficient.

Ack.

> 
> > +	if (!wfhw->enabled)
> > +		return 0;
> > +
> > +	wf->period_length_ns = DIV_ROUND_UP_ULL((u64)wfhw->period_ticks * NSEC_PER_SEC, clk_rate);
> > +
> > +	if (wfhw->inverted_polarity) {
> > +		wf->duty_length_ns = DIV_ROUND_UP_ULL((u64)wfhw->duty_ticks * NSEC_PER_SEC,
> > +						      clk_rate);
> > +	} else {
> > +		wf->duty_offset_ns = DIV_ROUND_UP_ULL((u64)wfhw->duty_ticks * NSEC_PER_SEC,
> > +						      clk_rate);
> > +		ticks = wfhw->period_ticks - wfhw->duty_ticks;
> > +		wf->duty_length_ns = DIV_ROUND_UP_ULL((u64)ticks * NSEC_PER_SEC, clk_rate);
> > +	}
> 
> This needs adaption after the rounding issue in tohw is fixed.

Ack.

> 
> > +	return 0;
> > +}
> > +
> > +static int rp1_pwm_write_waveform(struct pwm_chip *chip,
> > +				  struct pwm_device *pwm,
> > +				  const void *_wfhw)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	const struct rp1_pwm_waveform *wfhw = _wfhw;
> > +	u32 value;
> > +
> > +	/* set period and duty cycle */
> > +	regmap_write(rp1->regmap,
> > +		     RP1_PWM_RANGE(pwm->hwpwm), wfhw->period_ticks);
> > +	regmap_write(rp1->regmap,
> > +		     RP1_PWM_DUTY(pwm->hwpwm), wfhw->duty_ticks);
> > +
> > +	/* set polarity */
> > +	regmap_read(rp1->regmap, RP1_PWM_CHANNEL_CTRL(pwm->hwpwm), &value);
> > +	if (!wfhw->inverted_polarity)
> > +		value &= ~RP1_PWM_POLARITY;
> > +	else
> > +		value |= RP1_PWM_POLARITY;
> > +	regmap_write(rp1->regmap, RP1_PWM_CHANNEL_CTRL(pwm->hwpwm), value);
> > +
> > +	/* enable/disable */
> > +	regmap_read(rp1->regmap, RP1_PWM_GLOBAL_CTRL, &value);
> > +	if (wfhw->enabled)
> > +		value |= RP1_PWM_CHANNEL_ENABLE(pwm->hwpwm);
> > +	else
> > +		value &= ~RP1_PWM_CHANNEL_ENABLE(pwm->hwpwm);
> > +	regmap_write(rp1->regmap, RP1_PWM_GLOBAL_CTRL, value);
> 
> You can exit early if wfhw->enabled is false after clearing the channel
> enable bit.

Ack.

> 
> > +	rp1_pwm_apply_config(chip, pwm);
> > +
> > +	return 0;
> > +}
> > +

<,...snip...>

> > +	}
> > +
> > +	return 0;
> > +
> > +err_disable_clk:
> > +	clk_disable_unprepare(rp1->clk);
> > +
> > +	return ret;
> > +}
> 
> On remove you miss to balance the call to clk_prepare_enable() (if no
> failed call to clk_prepare_enable() in rp1_pwm_resume() happend).

Since this driver now exports a syscon, it's only builtin (=Y) so
it cannot be unloaded.
I've also avoided the .remove callback via .suppress_bind_attrs.

> 
> > +
> > +static int rp1_pwm_suspend(struct device *dev)
> > +{
> > +	struct rp1_pwm *rp1 = dev_get_drvdata(dev);
> > +
> > +	if (rp1->clk_enabled) {
> > +		clk_disable_unprepare(rp1->clk);
> > +		rp1->clk_enabled = false;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int rp1_pwm_resume(struct device *dev)
> > +{
> > +	struct rp1_pwm *rp1 = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret = clk_prepare_enable(rp1->clk);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to enable clock on resume: %d\n", ret);
> 
> Please use %pe for error codes.

Ack.

Best regards,
Andrea

> 
> > +		return ret;
> > +	}
> > +
> > +	rp1->clk_enabled = true;
> > +
> > +	return 0;
> > +}
> 
> Best regards
> Uwe



