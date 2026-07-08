Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1553C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+2oxnA5/005eAPx9+D3ISlHqx+7lNA7OCwPVcy4+pQ=; b=OwZPY9XoK2TrRxocpqsOA8f4K3
	ZMS5kzqHauaCPfF3spDilXae6cifCE9IUL/omc/wcb93xTeHQZVPJ+asvbTDSEHXtu3k92/VnQbfV
	qeImHYR16wVwB+5E0G4VX+DnTnXL/g2/DWK47lFKp6q8h6paLhBVXcJ0PtcxgfSDU2Kto/i3PyS1c
	vxiGM4SCn/yzS+M53BBMYsdaDnf9ytoKqV+dJqlfU4AX/ktboY5ehV1i0ujKD6C+W5N9AzvKvYED1
	bXDUT/tZM48N6INegMcrE4BFpkM+M0cwD5aG2ltybayMW7WTwIG67rr1cC5nKo2GLY1HTTLXZpNZe
	wvLbiw+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTEP-0000000HJo5-1fO0;
	Wed, 08 Jul 2026 14:26:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTEE-0000000HJmH-49iY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:26:32 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-493b7612475so6536355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783520781; x=1784125581; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y+2oxnA5/005eAPx9+D3ISlHqx+7lNA7OCwPVcy4+pQ=;
        b=F/ii0ofBrPGeIj2CArYPaWQEw08JYUJZcjcLnr44Kif/PK5nkKn+a986g9zETFO9Yv
         Zg8aDpyEh0+V/Gly4QsGi/t+41PzDHEGexuMGJ9CibfMQjg4gR8ao2Gnmbmus0R7jDvv
         kcy1F2sjtENLQT1xVi2ldlELB7wM/E64zR2wWdt8p8okwYLieSM1og6wSLrUXbKbnhWW
         o+bL+8yP7xYbRMT5sGdSdbmGcwADMcoWvs/lUG5ULcHVXFlTYWSdh9y9H9C2Qimv3+fq
         pD8DEdhJD++Tv0ZjwSl/xFICyxnO0pV2CVEbgeZfrPCooU6aw8HfYCJM+i2Jm5/787x3
         71Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520781; x=1784125581;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+2oxnA5/005eAPx9+D3ISlHqx+7lNA7OCwPVcy4+pQ=;
        b=FfDWOxYEf3gvQUnsUVoXOJuz0DTnyyRcIgLeNHFqZJSMJFjSWNrezqfYUVQ7/KOS2f
         uCTLd7TygMLcLcOJ9uqNP0D0P54PBIywUM9y5RCzOWh4c8oVZRSfFVNJA5+d6rRQkLLn
         3xpRPiARFjqm3iQ47yR3V1vovFxH2TS8QDdGMgX91bbFYRFHt/9nSnJpddN1Fjivm6yI
         dCxM6MULPQh1M+UbOain9fQ4H1vrmajRo3HusMfkPFp4U9ivRGBKXQdhK5V+1VmDLat8
         w+nbUtNUPstc7gfh5JAEsMlusIJ1vYJAgqvAdZtNkuK4PWSNkfPt9IQj5B+31+KP0PZD
         di/A==
X-Forwarded-Encrypted: i=1; AHgh+Ro9xNgYhjCpymhnP3aHZ+L480IIu/2MFhEW/oM8s6hrLl2VWf0PPTdxc/Gaznm6764oIic+wRVJFOcQ2eDyhNbU@lists.infradead.org
X-Gm-Message-State: AOJu0YzA3JJwcXWSrK9Fd2kuDI8s7FKcV//regwMVxhpXSc3pAzaAaR2
	Lv5Yran1gMG47W1aOtWtsCdufE0rtyw0cbOsRtdQIb81jpnjfX70UNRcpOC9PgT0HgQ=
X-Gm-Gg: AfdE7cnJPnaywD+PhqVPbXF6V20D2YZ/pez28LHoR4xIKTbKw1jHMTR/4DXNQQOHWbm
	4LNk20prJ+jwyKU1daOpHY3MfyVkk/XaHtbK598kbCCJ7Cpo47jZioWm1Um2BK5xyq47XMhXIiG
	gQT1CxMJely02oGOu0L3OYWqMzkf88+coTVSWgv4BzYdF3udeQOETl/RmI4uaueMiqYhKBjW4bY
	FkkGlqDr+t2gogHXjazwAxVXSjKxGu3riocIFzoDPeUuNLUNpEuGFiDw25pEk2h/C1QkTn8PJ4w
	/pmgIxPBQzfRFnhto0Qihglyjmk6Lv9lQSU/kgVQ3g1MQETqxhddHz50qDS/Zz28Fs4LIZsjv97
	27xmYTmqOw+j1XS9rVq6EfYY1ZytKba3qjCYrQhJsq/aWY8tlq6Nw2SE8vcW0bByhldK+RkpjGs
	eIik1q6Clehyz91iY=
X-Received: by 2002:a05:600c:4e93:b0:490:e5c1:b8b9 with SMTP id 5b1f17b1804b1-493e67f7c3emr28578075e9.0.1783520781102;
        Wed, 08 Jul 2026 07:26:21 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f5ca1fsm153295645e9.15.2026.07.08.07.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:26:20 -0700 (PDT)
Date: Wed, 8 Jul 2026 16:26:18 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Benedikt Spranger <b.spranger@linutronix.de>,
	Andrew Murray <amurray@thegoodpenguin.co.uk>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
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
Subject: Re: [PATCH v2 3/4] printk: nbcon: move printk_delay to console
 emiting code
Message-ID: <ak5eCp5qw9LYrnAH@pathway.suse.cz>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260703165654.71be8707@mitra>
 <CALqELGz-KSrGq5JYvLedZiO-p21pjpRKbceO+jiSfwZGyx+91Q@mail.gmail.com>
 <20260707145411.53a10893@mitra>
 <ak0VguIf-PxmbUOS@pathway.suse.cz>
 <87qzldvqpm.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87qzldvqpm.fsf@jogness.linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072623_037273_EB624550 
X-CRM114-Status: GOOD (  28.52  )
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

On Wed 2026-07-08 10:25:17, John Ogness wrote:
> On 2026-07-07, Petr Mladek <pmladek@suse.com> wrote:
> > To summarize this discussion:
> >
> >   + Benedikt would prefer to add the synchronous mode before
> >     moving the delay from the printk() caller to the console emit
> >     code path.
> >
> >   + The delay in the printk() caller code path did not guarantee
> >     the output but it increased the chance to see it.
> >
> >   + The synchronous mode will be even more reliable than the delay
> >     in printk() caller path.
> >
> > Please, let me know if I did not get it right,
> >
> > John, did you have any plan how to add the synchronous mode, please?
> > Does it look complicated?
> >
> > I guess that we would somehow need to "mis-use" the emergency
> > priority and force it everywhere by some global system setting.
> 
> The synchronous mode would rely on the driver being nbcon. I envision
> something like this:

Thanks for sharing the code.

> ---- BEGIN SYNC IDEA ----
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1200,7 +1200,7 @@ static bool nbcon_kthread_should_wakeup(struct console *con, struct nbcon_contex
>  	cookie = console_srcu_read_lock();
>  
>  	flags = console_srcu_read_flags(con);
> -	if (console_is_usable(con, flags, false)) {
> +	if (!(flags & CON_SYNC) &&  console_is_usable(con, flags, false)) {

The dependency on con->flags means that the sync mode can be entered
only in task context where synchronize_srcu() can be called. It might
be good enough. But I am afraid that people are creative and would
like to have even atomic variant sooner or later.

Also it will do the flush in NORMAL_PRIO which is good. But it might
fail to get the context ownership when it is blocked, for example,
by uart_port_lock() which might be even sleepable context in
PREEMPT_RT kernel.

>  		/* Bring the sequence in @ctxt up to date */
>  		ctxt->seq = nbcon_seq_read(con);
>  
> ---- END SYNC IDEA ----
> 
> BTW: The sync mode is the final piece so that PeterZ can start using
> mainline code for debugging by serial instead of his own workaround [0].

> [0] https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=debug/experimental

I see.

Best Regards,
Petr

