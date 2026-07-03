Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CD2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 14:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RtbeAb4anjju2Gg5Hr2svmQH8LAj1CgUb05x/8fx3ZI=; b=kNZpWGxlMMBZIPcsO5nM4qiEkZ
	ceMfQdATws3E5xWJVc9+UwaYC0Rh3JZiU5VuWvQvjXxzDoPgX3+9gYi/cp2tLxpQat+Ul5tLom08W
	IySSTbMXsZ+as399bX1FKEHUUBfkuFhewYHOiRtgVz7of7ThhJm9NFkoFoNltEmxgRSK93aNhNnOw
	A7f6uLVtkn6+1y2lhMcKC+ddhlqjGEnZ5WGOvooKV+hhCReDdySwhsQ49OY8pW3RARFzvedRhWBp6
	sLY2gA2kLmsluL+OHy5ntiGlDrvMkXfOqvp6m9rmhU8eBiQEWQnFU7FpXIWFCF2wLrsYgxrWkKz3M
	aUGW9XoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffCN-00000007Jg2-1Iac;
	Fri, 03 Jul 2026 14:48:59 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffCI-00000007Jf9-0Uvj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 14:48:57 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso4124305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 07:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783090131; x=1783694931; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RtbeAb4anjju2Gg5Hr2svmQH8LAj1CgUb05x/8fx3ZI=;
        b=Y8oK4/uuV/H2elAqajhmVEEyu1z02FQrgRuCYlxfxpnRwfIerHx/4KDGa2OSN1hhey
         IkHiPDTkOtZ/JOGl9vT8X+mJIlwCGVO5MmIv+LUt0M80rqlrlHcOFoNEb6qdGcWXhha7
         zggbBBcwd4oiZQ1jkuQlwiZEt89PXKDiVcrW064or9HQFEK3mwIp0bZ8zLGK8vol3kuH
         FHhYwI7thXeYfn3rIUDTYAzvtuic+i+2XVwUwow4zh6IupFrN4jRZT3FZc2/3487ZFzn
         woEg214ZG3J1Agpy03SCv3/uyePr1YUAo1h7KwECbRRpf+c+rCORQd3YARc73myQXz9m
         H0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783090131; x=1783694931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtbeAb4anjju2Gg5Hr2svmQH8LAj1CgUb05x/8fx3ZI=;
        b=HWHHF2LucbDRf377GAC/vIIMQ32LqiDYjVLGNihYSIKv4qn+m4yfSHLd3t7b5XjbkZ
         QAuag5JSPGncb3JvUT7MWosOqQ5805S+FJN1Xjtt4XL2fe0sfk/GZuUNqXcRdAQ+zbSY
         DiS2idHzH99vN4Wo3K1gl8kyQQ3Tlm0KcutddfWqTIh5cbzd3+aIAG/wHxdy+ZKwgoob
         p0vigx5Be4lGaDkdhhW7Jnu9/RdpvV+nvfEUHseeQq4IkIr7JtTsv6LC8HguWF1wL5k2
         wLOEGMV7B3YcmZfwS/VJGB9WE7xkX6ZKxf9PdLRqW2MGnNW2Cf2qWrFDhsiFxwaCE/1f
         e/VA==
X-Forwarded-Encrypted: i=1; AFNElJ94NhWHEz+zz0bXAOADI22gLcumAyHfPQ6SH1Sl8saG5+hKBJ03mBa3CW5c0e5xyB7XF5Rd/VXArQ7+S9zSvCJ+@lists.infradead.org
X-Gm-Message-State: AOJu0YwQjbDTdP5UexjiQJtzKnaAbMyop69vYUEQyl3au9bXdvcrzY6R
	T+dxBzKFmXbTarwFVf3YkP8aSwIubTPZy5iW+An+s/FMZpS/3Al72CjP2ys9+zOqTyU=
X-Gm-Gg: AfdE7cmYnPuOdDr66/7CfwdK4vlDF9vnXgSvwxL+dgLLbl9VxhAg91CwfrPABMNi6a5
	hTkMIt4hipuWMekeuP/j8OZA3hulr98a4OLBK65aVdAmJxbEq7pFBjd84GDToMxxhVUvkG0Vmum
	gjX5VEcVe8jSdLH0SuZV3clkPjvayvanfis1lk10v8NcNrcGkRzD7gHBYdap3ae4yV52EjtmgFc
	CLwXXKkjktZRRhe42MP10WQCY3rxcBlPBA6yi8g18J6O3GQKqWLa4Zl8/+isDxNKJCS/9h2ksXm
	hZEEQjCCdZx5HF22iGKEBFuXZfeg78B4+EJ58m21nZ88DoLV6amSd9uIFK0ekvKXkhEHIZKMinN
	MIzK7U8xztIacHWuEI47HI83oPMkBPYm/TDKGnJmLvfjRhBso6EMQP+nAt5QvYuEsbUEPGv54+q
	QmHRxK3+kBRmY=
X-Received: by 2002:a05:600c:34c5:b0:493:bc4a:e7d3 with SMTP id 5b1f17b1804b1-493d0f4efa6mr1735385e9.39.1783090131280;
        Fri, 03 Jul 2026 07:48:51 -0700 (PDT)
Received: from localhost ([195.94.145.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm149767675e9.4.2026.07.03.07.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 07:48:50 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 3 Jul 2026 16:52:17 +0200
To: Sean Young <sean@mess.org>
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
	Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
Subject: Re: [PATCH v5 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <akfMoQfzmEEiH9VC@apocalypse>
References: <cover.1780670224.git.andrea.porta@suse.com>
 <f8dd46a553351adaf9d29fbba9f98e803b672fe7.1780670224.git.andrea.porta@suse.com>
 <aiwX2YWVJnDNTNiu@extorris.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiwX2YWVJnDNTNiu@extorris.mess.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_074854_167040_E620D009 
X-CRM114-Status: GOOD (  30.24  )
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

Hi Sean,

On 15:29 Fri 12 Jun     , Sean Young wrote:
> On Fri, Jun 12, 2026 at 04:01:27PM +0200, Andrea della Porta wrote:
> > From: Naushir Patuck <naush@raspberrypi.com>
> > 
> > The Raspberry Pi RP1 southbridge features an embedded PWM
> > controller with 4 output channels, alongside an RPM interface
> > to read the fan speed on the Raspberry Pi 5.
> > 
> > Add the supporting driver.
> > 

<...snip...>
> 
> I don't understand the point of the clk_enabled field. If the probe
> function succeeds, then clk_enabled = true. It is set to false during
> suspend, but after suspend the only thing which can follow is resume,
> I think. In resume, we set it in to true again unconditionally. So
> it is always true, no?

It's true unless enabling the clock again in rp1_pwm_resume() will fail.
That will trap the unbalanced condition mentioned by Uwe in:
https://lore.kernel.org/all/adiW1tBC8Imd14LD@monoceros/

> 
> > +};
> > +
> > +struct rp1_pwm_waveform {
> > +	u32 period_ticks;
> > +	u32 duty_ticks;
> > +	bool enabled;
> > +	bool inverted_polarity;
> > +};
> > +

<...snip...>

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
> 
> period_ticks = clamp(period_ticks, 2, U32_MAX);
> 
> Although that misses out the `ret = 1;` which I am not sure about anyway.

But we need that ret = 1 to announce that values have been rounded.

> 
> > +
> > +	duty_ticks = mul_u64_u64_div_u64(wf->duty_length_ns, clk_rate, NSEC_PER_SEC);
> > +	duty_ticks = min(duty_ticks, period_ticks);
> > +	offset_ticks = mul_u64_u64_div_u64(wf->duty_offset_ns, clk_rate, NSEC_PER_SEC);
> > +	if (offset_ticks >= period_ticks)
> > +		offset_ticks %= period_ticks;
> > +	if (duty_ticks && offset_ticks &&
> > +		ret = dev_err_probe(dev, -EINVAL, "Clock rate > 1 GHz is not supported\n");

<...snip...>

> > +		goto err_disable_clk;
> > +	}
> > +	rp1->clk_rate = clk_rate;
> > +
> > +	chip->ops = &rp1_pwm_ops;
> 
> Can we add the following please:
> 
> 	 chip->atomic = true; 
> 
> This means that the pwm can be controlled from atomic context (not process
> context) using pwm_apply_atomic(). This is very helpful for the pwm-ir-tx
> driver, which produces a much more faithful IR signal in atomic context.
> 
> Using pwm for infrared tx is much nicer than using gpio which bit bangs
> the IR signal and holds the CPU with interrupts disabled for upto one second.
> 
> As far as I can see there is no sleeping code in these code paths, so we
> should be fine.

Sure, added.

Many thanks,
Andrea

> 
> Thanks,
> 
> Sean
>

<...snip...>

