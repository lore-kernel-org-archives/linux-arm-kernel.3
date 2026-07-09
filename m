Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108F9C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgKeluas+jUY/8yJAiAEBG5t4/+qnuDSzD0+HGXJqIM=; b=Bkim5WDln019arLMZjHizWfdaj
	BGDb4FVJ2zOTHlwSp2XJuBeY53jjA201A5mEz2QD5Kt9iZdme64VX0UkUWzz3XRHlUafdzNrafKp4
	9wRWzvIVYHo/Gn0x+EztTqG2OuAQvJLQEzp9MrTSj3gekFTxtSS49w/uyOSBE+0+VbAMC2VUEtcXx
	Qa/tukT6TkuRRuxXOrKHLh5Oy1+YjuFR2oNvg/ZOBRKt2V3kjqLNoOV+hDwJE0HuL2SfN/p7bTgyf
	xSoiUk0Pqz2BsYEEXvhqLCIwmF/D7K2eOYlesHDlm4fgwTxSvn7XgBBo5MfuNpCoypYuKQzeysm9C
	WaSNz38g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpiM-00000002km3-07BM;
	Thu, 09 Jul 2026 14:26:58 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpiJ-00000002kkX-26yc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 14:26:57 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-493b77b150aso15698865e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 07:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783607213; x=1784212013; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pgKeluas+jUY/8yJAiAEBG5t4/+qnuDSzD0+HGXJqIM=;
        b=YJ9cpOSCuAl/jUpxzSPN5YLNndLOdLIRUDiRZ+r5SDAUjstRfKswNc+4u0PWfZYdab
         8Bb5fEK8by0Rqt1WsaEcJIC+eCLZt3aIM1tK5BC210nI8F/aev+4bD1pDC2mW/lBPx7r
         IMZhLRrSyr7a8URaxHWcHjEH7WZGf6A4h2PneQT7T5nhHgWxXct/aqAQI47mpDkf65RU
         /FogtKqCPSkxeFjEU8sL/4HgDX6qXT/gVXGzQXvX9tGKsploWm8V2a4wk4B7QkFtItHe
         hJ1M6HsOWwonk8H4p3BiPKkpOTjdB3aKo/bNsVngfpiWABaLzSrG9CSUf2bzOrLifIuf
         RgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783607213; x=1784212013;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pgKeluas+jUY/8yJAiAEBG5t4/+qnuDSzD0+HGXJqIM=;
        b=XXpSgp8p2Yc/Sf2drChgILmODmkcuvwRF2a0hrusVhNpYa/tHdZ5tZ0Co9SB4mx0F3
         mSnqowgPtpznz2JIE1olx2h5/Uf74gaZfofGCak4SQSHd6GmGOmftJcQ+JWgYF3SDIy0
         4+mKx+IcV/G5szwBXjziP0hHHbCp3ZjOK1nCN4OSIo70LM1xVGIcvhCYG+x8v8E1ZuCM
         LOngPxCXE+NpLRmjFomuOf9P3o65g25vUm3mwlL+NNdoFKupzMDdGUoU93rN+5yzrPeq
         Ms94ipHVahrrmh5bcAJhrHFeZKuO2BhfggQr/Dxc0FmCu2Zke3mqC6WEsgdL2WS+0IfM
         L85g==
X-Forwarded-Encrypted: i=1; AHgh+RqtJzp6FOH2Ms2+TXPknlZINtilxczCqP3/xpXTfc9hNLfd0Yv5S7QSJ15Gv67CmB2nXk1Kh7wNaCAkHfGE8bkE@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpua9680pIC2roiVkrtKMLwcKpaVih2IbU+kpZpYFDA9VpJEgU
	3kEIVDhYljkooygSvvz7VYHJiDkt0rrdgc+BIJvK4S/HxKMqgHqWxvLa1LVf4du/zB0=
X-Gm-Gg: AfdE7ckhEQh2nBfxTe4bCUQM1dqEk4p7BhL9S+lMvwpzKf/ppYhAMeIDOy9d+Wdkdvd
	nqmhyjG+Vguu84d/exGXmq0baOrEQVU5RoWzrs4TibgCC4XcZ85zJbkF0IVOxDxGewViRm1CTdY
	TPlub1WY3I95Usm6puTGyT4kKq+pNNhEcFSJtexdBICpNlr6JpBn1JOCJRoMGDqnGX+Q787/dVH
	pkNBYXDsL3eN1tDj+QeUyLo7X+xMpbQa02dleujRaZ+F6lI2MN27x91KV8ankrqURfoL+MvFWze
	pTDIVSxmCGEgAmNNcSzIjpWt5i2ReR5WBw5MJlvJXyiMBWWgOblcrxkF8IQJ+J7o7lFLdN5fQd0
	mB88jHphbed7L484G5Cywj5INycw3zqKraiyqMNqpBpylvHCJ/KF2d8vqx9txnTMm8X07P0U0Ds
	/pr4zaG2ELis/O9JE=
X-Received: by 2002:a05:600c:34c3:b0:493:bb29:af40 with SMTP id 5b1f17b1804b1-493e689b37amr85711945e9.14.1783607213522;
        Thu, 09 Jul 2026 07:26:53 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb74835esm72452175e9.14.2026.07.09.07.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:26:53 -0700 (PDT)
Date: Thu, 9 Jul 2026 16:26:50 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 2/4] printk: deprecate boot_delay in favour of
 printk_delay
Message-ID: <ak-vqrSr7NLCkGQw@pathway.suse.cz>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-2-f9883d36aa4b@thegoodpenguin.co.uk>
 <ak5mPxUdp2pzCMt5@pathway.suse.cz>
 <CALqELGxjTZAXEp1C1CNO2tLbUpUChZW3DHcNgyhEu4Ma-ct2ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALqELGxjTZAXEp1C1CNO2tLbUpUChZW3DHcNgyhEu4Ma-ct2ow@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_072655_573752_D8E9CE15 
X-CRM114-Status: GOOD (  45.36  )
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

On Thu 2026-07-09 13:32:10, Andrew Murray wrote:
> Hi Petr,
> 
> On Wed, 8 Jul 2026 at 16:01, Petr Mladek <pmladek@suse.com> wrote:
> >
> > On Tue 2026-06-30 17:35:58, Andrew Murray wrote:
> > > The boot_delay (BOOT_PRINTK_DELAY) kernel parameter and printk_delay sysctl
> > > are two distinct mechanisms for providing similar functionality which add a
> > > delay prior to each printed printk message.
> > >
> > > boot_delay provides a kernel parameter for delaying printk output from
> > > kernel start through to boot (SYSTEM_RUNNING), whereas printk_delay is
> > > configurable only via sysctl and thus is only used post boot.
> > >
> > > Let's deprecate the boot_delay feature in favour of printk_delay. In order
> > > to preserve functionality, we'll also extend printk_delay such that it can
> > > additionally configured via an early kernel parameter.
> > >
> > > Behavior change:
> > >
> > > The delay enabled by both "boot_delay" and "printk_delay" continues
> > > working even in SYSTEM_RUNNING state. It must be explicitly stopped
> > > by setting printk_delay=0 via sysctl.
> > >
> > > The delay is skipped when the message is suppressed in all system
> > > states. It used to skipped only for the boot_delay.
> > >
> > > Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
> >
> > Looks good to me:
> >
> > Reviewed-by: Petr Mladek <pmladek@suse.com>
> >
> > Note that Sashiko AI warns about possible problems with negative
> > printk_delay values, see
> > https://sashiko.dev/#/patchset/20260630-deprecate_boot_delay-v2-0-f9883d36aa4b%40thegoodpenguin.co.uk
> >
> > But they should be handled in both the early parameter
> > and sysctl interface by the "10 * 1000" and "&ten_thousand"
> > limits.
> 
> Yes, that was my also view.
> 
> 
> >
> > The only potential problem might be a warning about possible
> > "sign" mismatch from the compiler. But I do not see any
> > even with make W=2.
> 
> I suspect this will come up everytime a change is made in this area,
> or perhaps some W=2 errors will pop up via kernelci or similar. I
> propose updating the patch as follows:
> 
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 5278d9cb19e4..fbb67f10c21e 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -1338,10 +1338,13 @@ static inline void early_boot_delay_msec(void)
> 
>  static int __init printk_delay_setup(char *str)
>  {
> -       get_option(&str, &printk_delay_msec);
> -       if (printk_delay_msec > 10 * 1000)
> -               printk_delay_msec = 0;
> +       int printk_delay_val = 0;
> 
> +       get_option(&str, &printk_delay_val);
> +       if (printk_delay_val < 0 || printk_delay_val > 10 * 1000)
> +               return 0;
> +
> +       printk_delay_msec = (unsigned int)printk_delay_val;
>         printk_delay_calculate();
> 
>         return 0;
> diff --git a/kernel/printk/sysctl.c b/kernel/printk/sysctl.c
> index f15732e93c2e..f256fc05faaf 100644
> --- a/kernel/printk/sysctl.c
> +++ b/kernel/printk/sysctl.c
> @@ -46,7 +46,7 @@ static const struct ctl_table printk_sysctls[] = {
>                 .data           = &printk_delay_msec,
>                 .maxlen         = sizeof(int),

I would change this to sizeof(unsigned int) as well.

>                 .mode           = 0644,
> -               .proc_handler   = proc_dointvec_minmax,
> +               .proc_handler   = proc_douintvec_minmax,
>                 .extra1         = SYSCTL_ZERO,
>                 .extra2         = (void *)&ten_thousand,
>         },

Otherwise, it looks good to me.

> This makes the cast explict, verifies the range before casting

Yup.

> (I guess a range of negative values could result in a postive value
> within the 10,000 range) and also uses the correct proc_handler.

IMHO, this should not happen. I have never seen int smaller than 4
bytes. If I count it correctly, positive numbers should be up to 32767.


> This has the side effect of not showing the following pr_debug for the
> lpj calculation when a delay is not set. Though loops_per_msec is only
> used during boot, so I don't think there is any loss here.

I agree that it should not harm. But please mention this in
the commit message.

>         pr_debug("printk_delay: %u, preset_lpj: %ld, lpj: %lu, "
>                 "HZ: %d, loops_per_msec: %llu\n",
>                 printk_delay_msec, preset_lpj, lpj, HZ, loops_per_msec);
> 
> Can I keep your Reviewed-By with these changes?

Feel free to keep it. That said, please put at least the change
of the ctl_table into a separate patch. I would rather put both new
changes into separate file. It is never a good idea to hide
such changes in a complex patch which mostly reshuffles an existing
code.

Best Regards,
Petr

