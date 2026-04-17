Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D06BF43685
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 09:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yaq3oZZPP0zgJO7shSO8Tq5EbFEPwmFPXbYiMglTcK8=; b=RCdh20xqtEAVammgjVxQlIW8Xi
	JNcHC9WrMUWjDZKB665SKnXqkWZpSIv/LGUNIR+6EftJ0fYu54ukNu3hRMytobcT7I3S6fjMj6F0n
	C6BIHKyfVhKrjPQu1Wu1OQhF5VX3Mmw+3n2LHv8BKNAqhSZ0DXI0XqCd2709nzIFcZJKrLjGgelo0
	Wa1NFDhfG2ZNOWzsMVoQVhU7nWIuRaZbaLmo/gKmFhRfFwlXtoXh+3tNfC5hkHUbzalkQKlAExTM6
	iRPwJFt666l5yAAZjLCRF+pqTChU/G1t1Mx1FGiM97SJLYy86QCJzP66WmnkSIjSBIH7RRtypeWUv
	S9+Y+RJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDf68-00000003jAh-2JoK;
	Fri, 17 Apr 2026 09:02:48 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDf64-00000003j9q-14Ld
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 09:02:46 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so6623015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 02:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776416562; x=1777021362; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yaq3oZZPP0zgJO7shSO8Tq5EbFEPwmFPXbYiMglTcK8=;
        b=P8cPSQH/8JPlSUx8vE/Z3rX01b07DLXEqqKCBgRYvLmhCyW49EDjhfPd2205RbydgR
         KDxD1AO7COD2k6ISVyKww5arfaU4QphcCCzHQbYOv8ZFb/IQ5jqJZgWIge8KfBUljQMP
         +NNTVPTnpTd4SAtPhKErhodl5CJeqvnAxtJIXX0JuUhvpeFc0tffpa3OJiDPD2rCMrV0
         5Xvq3BwpfoTvHAdBFVhbW7VbAU76PqOSuRhZF5qUFCt11SaRhb8yYzkg8rmzzfDKZ677
         Q4V1LpxJTEqup6x9vZms6yXVl0Qx7yyDRK/koAZ4A9fDIPAiZi3vOjNbTes0rYx+aL5T
         3few==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776416562; x=1777021362;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yaq3oZZPP0zgJO7shSO8Tq5EbFEPwmFPXbYiMglTcK8=;
        b=Uw+YUCPa2t+U4Z3Jf+MTtWepTTCA9cRxBeEo5aEnjuSQJS9gJapg+YSnKsfHgFRWrQ
         iSi1P67dx9Nj9FcUCpGkGywEw48DmOp1n8C3857s+8JbGBz32HpqjqpAxCYnkTpzl1gg
         VM72Jkmsnrw84AV8wera89Wcb2erGGCJxg1MIBb8GJgqfpZi9GGOwTuc0djdBDZfeU2G
         ciha8QOfCyfBCXsw7JMO/7VXNUvpXPzPJ2vVZMFaynPVVSSoyF7g4pEwweb/351UuQYr
         y39ZlTyyLCGLGHGfc8VrsFW99RBb+MHCznB71i7GMNrX7/AwPNVrCeEIn7gkGhlwkqHd
         4HHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7DrLkNBjskZmsYxPRSTPPwCIIEhucWqdjhKlxitXKVKeTO34FdmZy2b6/0HbKP6o+E1n2Hss/XNwkWwN0/DIS@lists.infradead.org
X-Gm-Message-State: AOJu0YwV1ZFcuaUVXUex9KSdsWlwDs594xbloRjzOJDLbdFioc7Ymylf
	BvoeN/sn0oWKLcbF3BD+jlOB0ajJlqI+tsU48Xpc8486jaBwY/WsIub4zQhGetA9rd0=
X-Gm-Gg: AeBDietB5wLT02wkwIp0DfycNoLVtDwMDvHkrPeUrIa6UK+yC7+uXNME47Vy4PTOWIq
	TSXxfW81dIqCf75WVCCn8FPWgmxjUuQHbODg7t7OhUE7erlJePsuxFZbPv5EruoxZCIGG5KV+Zz
	1IBuYWC4EWKPVoBYLM2tur1fQKzA50MC/PNIJbncJTZnsvhDa84UP2aykNGYPxgoPLVKnSN6Cqn
	jNaynET1lqrqr1XGWBuEbCJq0RFX2whGSSIi1Pn/MLac4graT0j8fNZkxK86uF2JMeoicdypfbz
	3UhW/YaaSJI/zXG1z1SJeb3WWJRRi9COI/Y5kvg4Z8QkYi3gI508Dr0k+rETJQ2EHyrp/JwZiO2
	gFlasVFMg901Q5H3q9tsqNC6LDZRGZ3qshn7yu0HoMmjHcdf0tcMAeYWLRDalw5HAUinIQx42Qw
	eLGPFS9DC2/ye4gWlZ9Eg/Pov3d1qmvoDq7uf49oVI/1oJ1OiDKoKVydsH0Szw8JJImHTqKiZvS
	8Ck3kA=
X-Received: by 2002:a05:600c:a30a:b0:488:8d44:bf98 with SMTP id 5b1f17b1804b1-488fb74a5f3mr20968355e9.7.1776416562061;
        Fri, 17 Apr 2026 02:02:42 -0700 (PDT)
Received: from localhost (host-79-33-140-232.retail.telecomitalia.it. [79.33.140.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1001bdsm49367405e9.6.2026.04.17.02.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 02:02:41 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 17 Apr 2026 11:05:51 +0200
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
Message-ID: <aeH373a_xmr6fnAy@apocalypse>
References: <cover.1775829499.git.andrea.porta@suse.com>
 <0d99317b9150310dfbd98de1cb2a890f0bffe7cd.1775829499.git.andrea.porta@suse.com>
 <adkrHkANCzxO8KUP@monoceros>
 <aeC6U7D6TfWm8JPx@apocalypse>
 <aeDmk-t5Lc1zpkg9@monoceros>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aeDmk-t5Lc1zpkg9@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_020244_346427_BC2E34F5 
X-CRM114-Status: GOOD (  47.08  )
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

On 15:48 Thu 16 Apr     , Uwe Kleine-König wrote:
> Hello Andrea,
> 
> one thing I forgot to ask: Is there a public reference manual covering
> the hardware. If yes, please add a link at the top of the driver.

Sort of, it's already reported in this driver top comment (Datasheet: tag).
The PWM controller is part of the RP1 chipset and you can find its description
under the PWM section. This is not a full-fledged datasheet but the registers
for the controller are somewhow documented.

> 
> On Thu, Apr 16, 2026 at 12:30:43PM +0200, Andrea della Porta wrote:
> > On 19:31 Fri 10 Apr     , Uwe Kleine-König wrote:
> > > I assume there is a glitch if I update two channels and the old
> > > configuration of the first channel ends while I'm in the middle of
> > > configuring the second?
> > 
> > The configuration registers are per-channel but the update flag is global.
> > I don't have details of the hw insights, my best guess is that anything that
> > you set in the registers before updating the flag will take effect, so there
> > should be no glitches.
> 
> Would be great if you could test that. (Something along the lines of:
> configure a very short period and wait a bit to be sure the short
> configuration is active. Configure something with a long period and wait
> shortly to be sure that the long period started, then change the duty,
> toggle the update bit and modify a 2nd channel without toggling update
> again. Then check the output of the 2nd channel after the first
> channel's period ended.

I stand corrected here: after some more investigation it seems that only the
enable/disable (plus osme other not currently used registers) depends on the
global update flag, while the period and duty per-channel registers are
independtly updatable while they are latched on the end of (specific channel)
period strobe.
I'd say that this should avoid any cross-channel glitches since they are managed
independently. Unfortunately I'm not able to test this with my current (and
rather old) equipment, this would require at least an external trigger channel.
Regarding the setup of a new value exactly during the strobe: I think this is
quite hard to achieve.

> 
> > > > +	if (ticks > U32_MAX)
> > > > +		ticks = U32_MAX;
> > > > +	wfhw->period_ticks = ticks;
> > > 
> > > What happens if wf->period_length_ns > 0 but ticks == 0?
> > 
> > I've added a check, returning 1 to signal teh round-up, and a minimum tick of 1
> > in this case.
> 
> Sounds good. Are you able to verify that there is no +1 missing in the
> calculation, e.g. using 1 as register value really gives you a period of
> 1 tick and not 2?

You are right. The scope reveals there's always one extra (low signal) tick at the
end of each period. Let's say that teh user want 10 tick period, we have to use
9 instead to account for the extra tick at the end, so that the complete period
contains that extra tick?
This also means that if we ask for 100% duty cycle, the output waveform will
have the high part of the signal lasting one tick less than expected.a I guess
this is the accepted compromise.

OTOH, the minimum tick period would be 2 tick, less than that will otherwise
degenerate in a disabled channel.

> 
> > > > +	if (wf->duty_offset_ns + wf->duty_length_ns >= wf->period_length_ns) {
> > > 
> > > The maybe surprising effect here is that in the two cases
> > > 
> > > 	wf->duty_offset_ns == wf->period_length_ns and wf->duty_length_ns == 0
> > > 
> > > and
> > > 	
> > > 	wf->duty_length_ns == wf->period_length_ns and wf->duty_offset_ns == 0
> > > 
> > > you're configuring inverted polarity. I doesn't matter technically
> > > because the result is the same, but for consumers still using pwm_state
> > > this is irritating. That's why pwm-stm32 uses inverted polarity only if
> > > also wf->duty_length_ns and wf->duty_offset_ns are non-zero.
> 
> Please align to the pwm-stm32 algorithm (as of
> https://patch.msgid.link/c5e7767cee821b5f6e00f95bd14a5e13015646fb.1776264104.git.u.kleine-koenig@baylibre.com)
> here to decide when to select inverted polarity.

Yep, I did already done when you sent that patch.

> 
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +
> > > > +err_disable_clk:
> > > > +	clk_disable_unprepare(rp1->clk);
> > > > +
> > > > +	return ret;
> > > > +}
> > > 
> > > On remove you miss to balance the call to clk_prepare_enable() (if no
> > > failed call to clk_prepare_enable() in rp1_pwm_resume() happend).
> > 
> > Since this driver now exports a syscon, it's only builtin (=Y) so
> > it cannot be unloaded.
> > I've also avoided the .remove callback via .suppress_bind_attrs.
> 
> Oh no, please work cleanly here and make the driver unbindable. This
> yields better code quality and also helps during development and
> debugging.

I wish to, but the issue here is that this driver exports a syscon via 
of_syscon_register_regmap() which I think doesn't have the unregister
counterpart. So the consumer will break in case we can unbind/unload
the module and the syscon will leak. 
If you have any alternative I'll be glad to discuss.

Many thanks,
Andrea

> 
> Best regards
> Uwe



