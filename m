Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBABC44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 09:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzjBXZKIKg4NMJoFDhnAAkVBwR6E1EVSUHn48IzBxJ8=; b=EuGUIJNmCS5sOKhTmmUb87wdlK
	UqB76KqL0kxpxgS4pJy7GoLASVl3li2czKW8M7TuGV+YJwtB7yDaluLjPR38eY2WypG1y+NM6RG6p
	2Pjw3Vyv6FNkJQ5nRqKnrSD3sGZkBLCT+S6KUKXQdDFQlNSBx98ninUexZOkk4VcM+Qt51jByHrAm
	8/dJ7uHarU3CaZNHr9P6bsDls4K8lH6llKa/+pXwLRGFEZSlTroETuNEVsBLSyhJTSKm6yxb+mJMT
	hHfyGRKlY6RD8BhatzOwDYzzfaDBn/G4dvgTZUu11JgznbVzVVgl1JPJdc30thjfQRn5xWTsyQN4Q
	a5fhwxBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkeln-00000001pHg-2V8r;
	Fri, 17 Jul 2026 09:22:11 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkell-00000001pGy-0VmX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 09:22:10 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49548e01d02so2606315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 02:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784280126; x=1784884926; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gzjBXZKIKg4NMJoFDhnAAkVBwR6E1EVSUHn48IzBxJ8=;
        b=W+6PSZvG5dy2aYgTzI2QlT7TYPjTiIEMdYI88Rp6wrNFxiTVghI1ckeK6zk73q05Wa
         HFR0AxKmc4j7dEVm1jPYTzNBttIEO/bI7gZ9V8gJhIcsfCvlstvfzxtqrtor1cQTwK+q
         +mbOg6k+OVDrhujGIs3wda+mY/i9ReH8Tcg7GiNgXmzLGuwtJSXGBQlPHgQEZ8Si7ARh
         td1Bm8FRdQN7pCJbBPrLdJs1+sbAW8OSX0jyQNcunMTsu1qeFcTNLMlfRHqWFCLdj7w5
         IIR+9B3b/6FHA80vlruLE4nP2NMCd82rblgQ+FOeaZsDapklejBc6MLEAW+dxpfUK/3S
         EOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784280126; x=1784884926;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gzjBXZKIKg4NMJoFDhnAAkVBwR6E1EVSUHn48IzBxJ8=;
        b=mxLNa/UjVlkaM0i0+Q1u8YwayLhItrsLLbgOFi0c8GV2enQEOWFjCQUM/cG5hg1mUn
         ce91/2QCYzdQjDZCKpW+5jQ42UbKxF+od9vn5v76JgRw/G4U13UjeEL1T0t0CAlecgoV
         snNehnSFAB4kpO5jxri3ZIYZd4GYMj2UDCj6thmgjq6KnyhWn/EZj8A0XD47xwoD+fay
         k6gVgU98mSzB3sfMK/buCe2pk1XhVzUgKhtXJx7haAPNkbPrzU8L/2Nht9CLSqNaO24N
         lQDJ5Ey7M2Bcakh5gzemk8k1XlD+Z+TkH2f/rz6QMb5JvYnVP1W2ITsES0Yte/R0r38y
         fk9A==
X-Forwarded-Encrypted: i=1; AHgh+Rq3tvxyi7bOd4BzqBPxb7XVjrFpYMz8H36q0Dfhegq4E1AcnVB1LmTynz7Y1auW3H5jdzuSa4Pi+O+Y6jb3z2Xb@lists.infradead.org
X-Gm-Message-State: AOJu0YxJnkcia6Ed7VzWqE0gMga279YhWeqgt20U/cay8vVU7DuZ7Sop
	aYNt6QrJPzJDHgf9M/C+HU7Zr0N2vNARqX16ANY/A4/jWxu578JcuSDJ9VJvUH7WFoI=
X-Gm-Gg: AfdE7cmGdHd9CibPKt5SQIgNWUthA2NYb2pnLgfyppc2YSb6OSce0uxA9ImHuN03lMU
	MfS1ex++ED7gKInPfg+wc/xbWgrugwkV9oshPZZBy/KUVegx9H/eaot5YyAOb8TQzx6vLDT8F6j
	B/8EFHv6TLw1h8l7EZRduif8GPdXyxr/i44raU+ePmJ1+G6fBrt3yyVu/NDFzZOsDVl/6uKqcQC
	gkfcwvmvROrIgJ+Q6rh4rNvrK0EoqrIdWxsKI6xn+AkYxIXqOaGkGUY7OcK1Q33eh+ovPqG6lxG
	T5IeuYRZsE5nsQcMvYEpDodoCQEr1Ja3GSp4HIiBM5lZ/MfJr+DPgGcwYJ7uwbxXXGP/4LGD2xB
	Gdxp18dV+8a1ET7P0P8QoMV+iPPUpufVc5fcCEK4xO0Sbt8UKeVXVHl2dzTa9ftOJLgPnMmYQnD
	fCsqDxehnshfg=
X-Received: by 2002:a05:600c:a40c:b0:492:53e8:3bc1 with SMTP id 5b1f17b1804b1-4954a3eb0b4mr13340425e9.17.1784280126576;
        Fri, 17 Jul 2026 02:22:06 -0700 (PDT)
Received: from localhost ([195.94.145.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549c96fecsm40535225e9.11.2026.07.17.02.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:22:06 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 17 Jul 2026 11:25:35 +0200
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
	Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com,
	Sean Young <sean@mess.org>, Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH v6 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <aln1D3E5QZULZ2U1@apocalypse>
References: <cover.1783097764.git.andrea.porta@suse.com>
 <5171610d8bebdd10eea44bff5236502d765b5918.1783097764.git.andrea.porta@suse.com>
 <alibzwe9Mjf3GxJo@monoceros>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alibzwe9Mjf3GxJo@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_022209_228420_0B8E4D56 
X-CRM114-Status: GOOD (  36.59  )
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

On 11:18 Thu 16 Jul     , Uwe Kleine-König wrote:
> Hello,
> 
> On Fri, Jul 03, 2026 at 07:05:25PM +0200, Andrea della Porta wrote:
> > +static int rp1_pwm_round_waveform_tohw(struct pwm_chip *chip,
> > +				       struct pwm_device *pwm,
> > +				       const struct pwm_waveform *wf,
> > +				       void *_wfhw)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	u64 period_ticks, duty_ticks, offset_ticks;
> > +	struct rp1_pwm_waveform *wfhw = _wfhw;
> > +	u64 clk_rate = rp1->clk_rate;
> > +	int ret = 0;
> > +
> > +	if (!wf->period_length_ns) {
> > +		wfhw->enabled = false;
> > +		wfhw->inverted_polarity = (pwm_get_polarity(pwm) == PWM_POLARITY_INVERSED);
> 
> pwm_get_polarity(pwm) looks wrong here for several reasons. 1st the
> polarity is defined in *wf and should not depend on the current state,
> 2nd for a disabled hardware the polarity doesn't matter anyhow, and 3rd
> you should not call pwm API functions from the lowlevel driver (which
> might interfere with subsystem locking).

Ok, but in this case what the output of the disabled channel should be?
If it was inverted before the disable, would it make sense to let the output
be high? Or are we allowed to hard code a polarity value on disable?

> 
> Also please initialize the whole structure, best done using:
> 
> 	*wfhw = (typeof(*wfhw)){
> 		.enabled = false,
> 	}

Ack. In this case inverted_polarity would be falsei though, see above.

> 
> > +		return 0;
> > +	}
> > +
> > +	period_ticks = mul_u64_u64_div_u64(wf->period_length_ns, clk_rate, NSEC_PER_SEC);
> > +
> > +	/*
> > +	 * The period is limited to U32_MAX, and it will be decremented by one later
> > +	 * to allow 100% duty cycle.
> > +	 */
> > +	if (period_ticks > U32_MAX) {
> > +		period_ticks = U32_MAX;
> > +	} else if (period_ticks < 2) {
> > +		period_ticks = 2;
> > +		ret = 1;
> > +	}
> > +
> > +	duty_ticks = mul_u64_u64_div_u64(wf->duty_length_ns, clk_rate, NSEC_PER_SEC);
> > +	duty_ticks = min(duty_ticks, period_ticks);
> > +	offset_ticks = mul_u64_u64_div_u64(wf->duty_offset_ns, clk_rate, NSEC_PER_SEC);
> > +	if (offset_ticks >= period_ticks) {
> > +		u64 remainder;
> > +
> > +		div64_u64_rem(offset_ticks, period_ticks, &remainder);
> > +		offset_ticks = remainder;
> 
> 		offset_ticks = period_ticks - 1;

Ack.

> 
> > +	}
> > +	if (duty_ticks && offset_ticks &&
> > +	    duty_ticks + offset_ticks >= period_ticks) {
> > +		wfhw->duty_ticks = period_ticks - duty_ticks;
> > +		wfhw->inverted_polarity = true;
> > +	} else {
> > +		wfhw->duty_ticks = duty_ticks;
> > +		wfhw->inverted_polarity = false;
> > +	}
> > +	/* Account for the extra tick at the end of the period */
> > +	wfhw->period_ticks = period_ticks - 1;
> > +
> > +	wfhw->enabled = true;
> > +
> > +	return ret;
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
> > +	u64 ticks;
> > +
> > +	*wf = (struct pwm_waveform){ };
> > +
> > +	if (!wfhw->enabled)
> > +		return 0;
> > +
> > +	wf->period_length_ns = DIV_ROUND_UP_ULL(((u64)wfhw->period_ticks + 1) * NSEC_PER_SEC,
> > +						clk_rate);
> > +
> > +	if (!wfhw->inverted_polarity) {
> > +		wf->duty_length_ns = DIV_ROUND_UP_ULL((u64)wfhw->duty_ticks * NSEC_PER_SEC,
> > +						      (u32)clk_rate);
> > +	} else {
> > +		if (wfhw->duty_ticks > (u64)wfhw->period_ticks + 1) {
> > +			/* 100% duty cycle case */
> > +			ticks = 0;
> > +		} else {
> > +			ticks = (u64)wfhw->period_ticks + 1 - wfhw->duty_ticks;
> > +		}
> > +		wf->duty_length_ns = DIV_ROUND_UP_ULL(ticks * NSEC_PER_SEC, clk_rate);
> > +		wf->duty_offset_ns = wf->period_length_ns - wf->duty_length_ns;
> 
> The duty_offset_ns calculation is wrong.
> 
> Consider clk_rate = 3000000, period_ticks = 8, inverted_polarity = true and
> duty_ticks = 4.
> 
> Then you have:
> 
> 	.period_length_ns = 2666.6666666666666 ns ~> 2667
> 	.duty_length_ns = 1333.3333333333333 ns -> 1334
> 	.duty_offset_ns = 1333.3333333333333 ns -> 1334
> 
> but .period_length_ns - .duty_length_ns is 1333.
> 
> To get this right, you have to calculate
> 
> 	wf->duty_offset_ns = DIV_ROUND_UP_ULL((u64)(wfhw->period_ticks + 1 - ticks) * NSEC_PER_SEC, clk_rate);

So it will end up as 'duty_length_ns + duty_offset_ns > period_length_ns', which is
timing violation. Is it allowed (or even required) in the PWM subsystem?

> 
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int rp1_pwm_write_waveform(struct pwm_chip *chip,
> > +				  struct pwm_device *pwm,
> > +				  const void *_wfhw)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	const struct rp1_pwm_waveform *wfhw = _wfhw;
> > +	u32 value, ctrl;
> > +
> > +	/* set polarity */
> > +	regmap_read(rp1->regmap, RP1_PWM_CHAN_CTRL(pwm->hwpwm), &value);
> > +	if (!wfhw->inverted_polarity)
> > +		value &= ~RP1_PWM_CHAN_CTRL_POLARITY;
> > +	else
> > +		value |= RP1_PWM_CHAN_CTRL_POLARITY;
> > +	regmap_write(rp1->regmap, RP1_PWM_CHAN_CTRL(pwm->hwpwm), value);
> > +
> > +	/* early exit if disabled */
> > +	regmap_read(rp1->regmap, RP1_PWM_GLB_CTRL, &ctrl);
> > +	if (!wfhw->enabled) {
> > +		ctrl &= ~RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
> > +		goto exit_disable;
> 
> Please don't use goto unless for error handling.

Ack.

> 
> > +	}
> > +
> > +	/* set period and duty cycle */
> > +	regmap_write(rp1->regmap,
> > +		     RP1_PWM_RANGE(pwm->hwpwm), wfhw->period_ticks);
> > +	regmap_write(rp1->regmap,
> > +		     RP1_PWM_DUTY(pwm->hwpwm), wfhw->duty_ticks);
> > +
> > +	/* enable the channel */
> > +	ctrl |= RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
> > +exit_disable:
> > +	regmap_write(rp1->regmap, RP1_PWM_GLB_CTRL, ctrl);
> > +
> > +	rp1_pwm_apply_config(chip, pwm);
> > +
> > +	return 0;
> > +}
> > +
> > +static int rp1_pwm_read_waveform(struct pwm_chip *chip,
> > +				 struct pwm_device *pwm,
> > +				 void *_wfhw)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	struct rp1_pwm_waveform *wfhw = _wfhw;
> > +	u32 value;
> > +
> > +	regmap_read(rp1->regmap, RP1_PWM_GLB_CTRL, &value);
> > +	wfhw->enabled = !!(value & RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm));
> > +
> > +	regmap_read(rp1->regmap, RP1_PWM_CHAN_CTRL(pwm->hwpwm), &value);
> > +	wfhw->inverted_polarity = !!(value & RP1_PWM_CHAN_CTRL_POLARITY);
> > +
> > +	if (wfhw->enabled) {
> > +		regmap_read(rp1->regmap, RP1_PWM_RANGE(pwm->hwpwm), &wfhw->period_ticks);
> > +		regmap_read(rp1->regmap, RP1_PWM_DUTY(pwm->hwpwm), &wfhw->duty_ticks);
> > +	} else {
> > +		wfhw->period_ticks = 0;
> > +		wfhw->duty_ticks = 0;
> > +	}
> 
> Ideally use *wfhw = (typeof(*wfhw)){ ... } here, too, to make it obvious
> that the complete struct is initialized.


Ack.

> 
> > +
> > +	return 0;
> > +}
> > [...]
> > +static struct platform_driver rp1_pwm_driver = {
> > +	.probe = rp1_pwm_probe,
> > +	.remove = rp1_pwm_remove,
> > +	.driver = {
> > +		.name = "rp1-pwm",
> > +		.of_match_table = rp1_pwm_of_match,
> > +		.pm = pm_ptr(&rp1_pwm_pm_ops),
> > +		.suppress_bind_attrs = true,
> 
> If the driver cannot be removed, .remove() is just dead code. Drop it
> and note in a comment that this is needed because a syscon cannot be
> removed.

Ack.

Many thanks,
Andrea

> 
> Best regards
> Uwe



