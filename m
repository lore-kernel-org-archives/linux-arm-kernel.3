Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BC4CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 11:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYxOnpq9yBeiaN2mTbvYlWTQWFXGZfN7UV/tTv9hfZQ=; b=qjQk0RV/p2LOEwbfiUYsO68+zj
	yjV8k9KAHDFB7sbmErsZ/Y1p4G8reepzbRegTjsiRRd/6PJesMq9eFlSbS0EeGS2lE/FMeaoniE4y
	0Rm2asW3GyI3lSQysAMsczQ+yW9VSsVs2jjkVmdsJccg0bXPQgbww+MwbKpfAETesBwcypXSv3B7a
	Q9bnZ71n1Q3JBzYCWZMu1R3JI4YAmbrza62s0ZIH4LT12DynRcu5b51pE94fHcsp4xenGgnfmA9z7
	zerebleKpkhTnPHX/T5daw5HsdHMPZhiQliwVvMqtTKodqmzj7arpO6O7uO/T2nWYJJ5KVtvOKyX+
	P7eOm2Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYjHt-0000000CvY2-10hN;
	Sun, 14 Jun 2026 11:46:01 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYjHr-0000000CvW7-1FRz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 11:46:00 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-48633190849so941927b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 04:45:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781437558; cv=none;
        d=google.com; s=arc-20240605;
        b=e5QuwBAtDYxBLZR3JvgjtmzCD8PInU3ui3B78fdTrdHFu79dWVk0TFJjnmr3svf4C6
         wkWOiCfBvep4z3CHfzruOW9c9eQ1T5drQYdwlXxxUHtPQAA0AUCdlbCRtwcNLIllmDG4
         DZc+nb1y6AqNa+6oO9RZcRurvHTppYXJ0qRloihzYbKMD98I/wCplKMISGfP7wPiKZQW
         jkGWRA5KmhUA16eOH7svOsiVUNkGPsHgb2ksd9UX7qopo+3mRQqT6L2XeSd9VdfxiIVi
         QvgeH7zLWZsfcOqo6mqbUb7GFiNd1hMbhVttIsP51sgnxlc3B8lyeBP3bWG9+oGmLRBq
         JYYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UYxOnpq9yBeiaN2mTbvYlWTQWFXGZfN7UV/tTv9hfZQ=;
        fh=d1Q0fyfUhgoa6Y0J9B1ismyr8nNesbvUPzvVUHaojSs=;
        b=KsqwSyEcoqAg0GvMZ+MFpnESVwV0bhuf5yH0oxWLr1+e+O3WTu3msTw/iY27p0aG/N
         XrdtXqnUD1alx9uvbIAZ6jN3GBxH4cZuuMpFBzJJVv5UAj9ruABY99shiQT67WxRVWV1
         CDURrOLCOzuDHKONVHkdp9SBZctjnrLO4MPc27eS6qNm2X9Ykn91brwJiKnWWpgm3SeS
         bhXzgQcD1r68xigb9/8+Cc4QN0XWl4pybYXWeqbLWc1yHuYw+YK40lo+77UPFWLn7RHx
         /hXtaIXCLf4Xeobl4bDwKmy9vM1sbGdFhnKaHI6BfYkqJmynOwQ7r9TmUsU0QrrXaWGD
         GGOQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1781437558; x=1782042358; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UYxOnpq9yBeiaN2mTbvYlWTQWFXGZfN7UV/tTv9hfZQ=;
        b=x0b+Pml/EXgn1wfukHCB6H6PtsZ+j3AkJDKIhhMcxThD5w2BZbauG/jDj5xh9/PHqP
         Bwulg7VV25F8Kh3anHEo77TeBChFHpOBR4AJbvNPohjgNvvWW99du6pnTNBq1nUaSKjc
         ltJo/OGQeAfNLUPs2CGeukl0w+y8369v0JwVTZq31El/H2+TMVHNxtrO2m5+KJE8IsCt
         +JkbQPzZWyg8VJbYv7hPtYBpVsdrLbSJsWoQ4bHlSK3CwW9611XNz8RIFMXgQLQxoJ5E
         WKuX8rCEPHZosMTmOL3hrZqLg7g9nTq6y2r+Cyos7kTxA4GZPj1QpD/nlLnQpOP+incM
         SUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781437558; x=1782042358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYxOnpq9yBeiaN2mTbvYlWTQWFXGZfN7UV/tTv9hfZQ=;
        b=m0QTH7ZcPtmAkog7rsPKAKrSsJ7l3Fvb0kKUK4n+SzGg/6KCKwCLuWHOuIemoKalyd
         +RZOtfGe2Wo+hjJAkgpgFTDd5mVJC67Ynq/u5IwFoAzcVNoik7R5C/dTTPqxqWBfHITB
         NTcbVs0DV/CAft0+uagwwvkYUTJDtRPhHEKwEJUocj75hfd52mPoN8ynzH74XQkVPbOY
         QsyFvQk0rZMiz4XZY5uE03rwWIMJeqNQmnWlI9raK4dWkPNQ479lFeXMmOmcJMFBzAw/
         oj2ojbsuKUpzkCMS6BjfqRInHzaCoO5nAIbUhgHQnCPrbyI4zfKOdDGi1dqk7LIUKW+O
         lY1A==
X-Forwarded-Encrypted: i=1; AFNElJ80HA6LSQnjmQnu+swtMU1uCETrnGMZ1DjchGcL6ZY86Y+hsZP9FNmnW9Xhfobi4JMLNeryP/AaBLetyTY/j7NO@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd4IOnQ8naBC8esvgguZ7VQEdXjkoqGqceCKnNvaFnm4DEVSMj
	+Q31Lg7SFmxMHoMJlxUtneF5vCFACxbuCeiV5/EdRyNZe2JZqYaCXMGPpwbdwYWfrxSEZsJ8gWP
	kWde1glr8R9ZSZ3qOjWoGVTtzU0KDT3RfNQnnDTPW/Q==
X-Gm-Gg: Acq92OH3tQ6j/Lb8tb7D/zZVonh/vq8KmoLVhUSpze1mX5pV3TIq5zPZArcfD4MWQVv
	Cr/MKZgWB/LPPIB02JoY+lC+YLEdUfCpW/jXAwduduiivOrwFyagdzdbis8qauoxF7yRkmZoY6V
	ELla6rY3A4JvvIOxTAIDGDbgNwnN/kCbpnrnc9iKLpYy/3WjkqV0yhlytDV41miv1K8ej8zmrwZ
	6hxgNqGYRfP5vmb2vjbZCHVhmSVDbOCNN+RskRktDenZh9yuRqV9fPaLMrBxZp89+trLP6qWvUe
	fnMLSAzeexhShNgdS0zUFFAVc3cABx9O8LEC1zK0wNq/A9EeSFZrwvwFBqr1RqxGtLvCUKdwHVV
	x4gBbuC7Q6iIQXZ5GwWYrQb4P/FoeJogS18m9/dk=
X-Received: by 2002:a05:6808:4f21:b0:486:5275:8144 with SMTP id
 5614622812f47-4874194d5damr4572042b6e.2.1781437558100; Sun, 14 Jun 2026
 04:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
 <20260601-deprecate_boot_delay-v1-2-c34c187142a6@thegoodpenguin.co.uk> <aibMr16r55xE26rU@pathway.suse.cz>
In-Reply-To: <aibMr16r55xE26rU@pathway.suse.cz>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Sun, 14 Jun 2026 12:45:44 +0100
X-Gm-Features: AVVi8Cfqmzx5ANOaLYg4zATzHJIZn1Vg14oXTdjpHhDh_VtEe2JUNu4nQf-biNo
Message-ID: <CALqELGzTH8cTLVgX9CXuf_LFLgC97_yfqYJVHzU9ghPuev7SNA@mail.gmail.com>
Subject: Re: [PATCH RFC 2/4] printk: deprecate boot_delay in favour of printk_delay
To: Petr Mladek <pmladek@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_044559_337470_65E942E9 
X-CRM114-Status: GOOD (  34.08  )
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

On Mon, 8 Jun 2026 at 15:07, Petr Mladek <pmladek@suse.com> wrote:
>
> On Mon 2026-06-01 00:17:38, Andrew Murray wrote:
> > The boot_delay (BOOT_PRINTK_DELAY) kernel parameter and printk_delay sysctl
> > are two distinct mechanisms for providing similar functionality which add a
> > delay prior to each printed printk message.
> >
> > boot_delay provides a kernel parameter for delaying printk output from
> > kernel start through to boot (SYSTEM_RUNNING), whereas printk_delay is
> > configurable only via sysctl and thus is only used post boot.
> >
> > Let's deprecate the boot_delay feature in favour of printk_delay. In order
> > to preserve functionality, we'll also extend printk_delay such that it can
> > additionally configured via a kernel parameter.
>
> I would make it clear and say: "via an early kernel parameter".
>
> Note that there are also kernel parameters which can be modified at runtime
> via /sys/module/kernel/paramters/<parameter>

OK thanks, I will update.


>
> Also I would make it clear that this changes the behavior, for
> example:
>
> <proposal>
> Behavior change:
>
> The delay enabled by both "boot_delay" and "printk_delay" continues
> working even in SYSTEM_RUNNING state. It must be explicitly stopped
> by setting printk_delay=0 via sysctl.
>
> The delay is skipped when the message is suppressed in all system
> states. It used to skipped only for the boot_delay.
> </proposal>

Yes, I'm happy to make that clearer.


>
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -1339,11 +1327,34 @@ static void boot_delay_msec(int level)
> >       }
> >  }
> >  #else
> > -static inline void boot_delay_msec(int level)
> > +static inline void __init printk_delay_calculate(void)
> > +{
> > +}
> > +
> > +static inline void early_boot_delay_msec(void)
> >  {
>
> It would be nice to print a warning that the early boot delay
> does not work, something like:
>
>         pr_warn_once("Early boot delay does not work without CONFIG_GENERIC_CALIBRATE_DELAY enabled.\n");
>
> >  }
> >  #endif
> >
> > +static int __init printk_delay_setup(char *str)
> > +{
> > +     get_option(&str, &printk_delay_msec);
> > +     if (printk_delay_msec > 10 * 1000)
> > +             printk_delay_msec = 0;
>
> Sashiko AI warns that this code accepts negative values.
> It might cause long delays, see
> https://sashiko.dev/#/patchset/20260601-deprecate_boot_delay-v1-0-c34c187142a6%40thegoodpenguin.co.uk
>
> The problem has already been there even before. But it would be nice
> to fix it.

Thanks for pointing out Sashiko, I hadn't seen its review on my
patches. Are authors expected to get emails from it, as I didn't?

In any case, it's a good spot, so I'll address.


>
> > +
> > +     printk_delay_calculate();
> > +
> > +     return 0;
> > +}
> > +early_param("printk_delay", printk_delay_setup);
> > +
> > +static int __init boot_delay_setup(char *str)
> > +{
> > +     pr_warn("boot_delay will soon be deprecated, please use printk_delay instead");
> > +     return printk_delay_setup(str);
> > +}
> > +early_param("boot_delay", boot_delay_setup);
> > +
> >  static bool printk_time = IS_ENABLED(CONFIG_PRINTK_TIME);
> >  module_param_named(time, printk_time, bool, S_IRUGO | S_IWUSR);
>
> Otherwise, it looks good to me.
>
> Best Regards,
> Petr

Thanks,

Andrew Murray

