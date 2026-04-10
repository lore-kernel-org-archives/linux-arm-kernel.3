Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472C3E99071
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 10:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKnPag+J1FK879lrPixqSysMm2rbphTSL3HqF/0DRQk=; b=HJaJ0+Im6IoeWULhuuOhMvfQj9
	cz3Mh25PvSWH3IskKMP4MBNC+5Kf9FO8uncp+ECoNspO5EVGpJIm6L77U3HIJ/5ZukhEQy3fF60P+
	Jz/4vN4uSpxkUGZ4c5R0PPHbKJE++fs+DCanMSusdM+OuvRC9PKORyL2T24MPMHF1rpXvIUaw5+R4
	y8yb6ImP2TxhZzpYsoscbvRR1lWk2jkNnfI8kv6VsK/ptnKrAamH7lOSD+DLQpyNM9uGcE416p9WC
	0arVMtvxUJqM4fsM1Mw48iRcaonEGuul55PE0T8u/V6zv++zyWkzrsacRYIg1qfAb7L2SRGMg9DZR
	juwJS0HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB92Q-0000000C0Jp-2w5I;
	Fri, 10 Apr 2026 10:24:34 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB92N-0000000C0Iy-28ni
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 10:24:33 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-43d5e87a507so1416521f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 03:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775816670; x=1776421470; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZKnPag+J1FK879lrPixqSysMm2rbphTSL3HqF/0DRQk=;
        b=Q9+WFEkc/LKfQ1KV/DwDK3jxWxv7Q7HFv6uNw4tmg63dUrmPOesbWXtmUzHThvRIVP
         KdeuUnGiKlqVLxJ6/miARrnKIAYjOOO0ne942LNs+6ck6RmzEWDgLBpB2Bi1R78JbLc9
         AiIueBZHVMz+PMRECl5ArMH2Lkd4sX/F9I4feDsU0XhFscHShLRxuXwqqr4+wz7qQhd6
         oYEKqtRExAJSg4OQ6Ix1O7AEYXnVkSmo+mPtVPOxwc9MqWzbtiLZJVrE6k5uTM4YJKTv
         fWys6SGiYI4E9q9y0aoUoC+Qz+cof8zkUXWqgW9p6p4CKjUNey3QaCn4rtef0m5toMyU
         FnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775816670; x=1776421470;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKnPag+J1FK879lrPixqSysMm2rbphTSL3HqF/0DRQk=;
        b=tCnh4Q0tFB/KSVedEZFAa5dshP9v5/sbPPWsjLaJyATNRLrmVQ2KOmfpyKz2MMXeaN
         YjwWtUZ9+NPLnBGjI0mtlheNxus2XLKCkyOYj3PysFxW578SXK5uw4hKeWyBrt7L6WAM
         kKxFVWXzp3IoL/RoUirPy6we5bUbkoc73i+Azcg5rwrl/4xgJCFpD/Bv+ai0Kyn/rah0
         AvXkv6Cn3O+4y46rFqYQnixFj1DvaDRw8AYG8y0lk9oP3USCLXBUFX2eELXpHPhd79fc
         a2tSGZfwBUoooXaR7P6ml6ePrwlz13hPZL34vdAAlLOeGYFbUzVK5a0i3IVV1MXBazUe
         LkxA==
X-Forwarded-Encrypted: i=1; AJvYcCViu8/O7yEpZKwbabA2vxKNuGyBF/orYQ6pv87dmYcZ5zi85eZaN+dREtOtAvl0ZcvN21VG+22pTdb+lkPYIHXZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxD0ILdUGjgTvxWyv0Wm4iYjne8Ta4tTeNPlWY59cIVqmwMrO0i
	F/JLT6k70MtDM+zrnmqHXh9GxY6nLaTja9Ybjp8Ha32ZeQz0Vg6ytz0sX7xHEf92RcY=
X-Gm-Gg: AeBDieumwwsE+ZV4AMYjVsGK5lNl0qSlarLYd2hbNR6OxF8y2HL3tK5BRYGYX4NtVQ7
	NDmv0doFNvKZWBEOmMmi9u3CEiaetjcpjMXa0lPXOvhDvNb1E07y5l1WuRI8X30TCXn0fVbiYG1
	A6W6pUHZ0ldortIrKPjrqqmpSKiBQZN3HVTKONGxwUxYbnR7KzXACCIg79WE9WDFUcsZazP4v6E
	NTctIW31ZMNYlQVIpjy8tMINgaVaQ1WJFXIIW/ovxF6llRR07DlghVjyLSV4uLh6TcLi960k5Ow
	TIq4UJ41jxutylEnpRHZthbpsRLdcpqBtRlp5FRVwN2K59iEqgv7FhULmPa/dspeaPW1s6KXb3e
	wc+eCiOJp1u7ewPzUHKMvvj7iT9aiDXBBXmyfHaTd+rJ1R5x3uqwmsQX6jEH1VYU+PehuriTpH8
	Op8FwnxjcBtGkM+ed8GsCOdUYJjiIxUYi3E6GeQhU5V27DynhFqA==
X-Received: by 2002:a05:6000:402a:b0:43b:8f23:a87b with SMTP id ffacd0b85a97d-43d642d9d59mr3841629f8f.44.1775816669353;
        Fri, 10 Apr 2026 03:24:29 -0700 (PDT)
Received: from localhost (93-41-3-120.ip79.fastwebnet.it. [93.41.3.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm6454744f8f.33.2026.04.10.03.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:24:29 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 10 Apr 2026 12:27:35 +0200
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
	Stanimir Varbanov <svarbanov@suse.de>
Subject: Re: [PATCH 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <adjQl37-6a--_y3Y@apocalypse>
References: <cover.1775223441.git.andrea.porta@suse.com>
 <28e29fbfc20c0b8a115d006233c2759d8f49e639.1775223441.git.andrea.porta@suse.com>
 <adLTwOTbkJ0VQXy6@monoceros>
 <adfQ6Tvst3Vd1Mxe@apocalypse>
 <adiW1tBC8Imd14LD@monoceros>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adiW1tBC8Imd14LD@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_032431_591125_4FF15D69 
X-CRM114-Status: GOOD (  29.29  )
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

On 08:27 Fri 10 Apr     , Uwe Kleine-König wrote:
> Hello Andrea,
> 
> On Thu, Apr 09, 2026 at 06:16:41PM +0200, Andrea della Porta wrote:
> > On 23:45 Sun 05 Apr     , Uwe Kleine-König wrote:
> > > On Fri, Apr 03, 2026 at 04:31:55PM +0200, Andrea della Porta wrote:
> > > > +static void rp1_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
> > > > +{
> > > > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > > > +	u32 value;
> > > > +
> > > > +	value = readl(rp1->base + PWM_CHANNEL_CTRL(pwm->hwpwm));
> > > > +	value &= ~PWM_MODE_MASK;
> > > > +	writel(value, rp1->base + PWM_CHANNEL_CTRL(pwm->hwpwm));
> > > > +
> > > > +	rp1_pwm_apply_config(chip, pwm);
> > > 
> > > What is the purpose of this call?
> > 
> > To update the configuration on the next PWM strobe in order to avoid
> > glitches. I'll add a short comment in the code.
> 
> .pwm_free() should not touch the hardware configuration. Changing the
> pinmuxing (which I guess is the purpose of clearing PWM_MODE_MASK) is
> somewhat a grey area. If that saves energy, that's okish. Otherwise
> not interfering with the operation of the PWM (e.g. to keep a display on
> during kexec or so) is preferred.

Sorry I should've been more clear on this. The pinmux/conf is not changed
at all by this mask, only the PWM output mode is. The controller can output
several type of waveforms and clearing PWM_MODE_MASK is just setting the
controller to output a 0, which is the reset default i.e. the same value
as just before exporting the channel.
I guess this is the expected behaviour in case of a fan, it should stop
spinning in case you unexport the pwm channel, but I see it could be
different with displays.
Honestly I don't have a strong opinion about that, please just let me
know if I should drop that pwm_free entirely.

> 
> > > > +static int rp1_pwm_resume(struct device *dev)
> > > > +{
> > > > +	struct rp1_pwm *rp1 = dev_get_drvdata(dev);
> > > > +
> > > > +	return clk_prepare_enable(rp1->clk);
> > > 
> > > Hmm, if this fails and then the driver is unbound, the clk operations
> > > are not balanced.
> > 
> > I'll add some flags to check if the clock is really enabled or not.
> 
> To be honest, I guess that is a problem of several drivers, not only in
> drivers/pwm. If this complicates the driver, I guess addressing this
> isn't very critical.

I'll come up with something, we can always drop this check if deemed
too 'noisy'. 

Many thanks,
Andrea

> 
> Best regards
> Uwe



