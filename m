Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CA4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNMm+K1n82gXoA0QCvJimYEIEGXjevfFGtDXgwHf6mU=; b=d1cMsVzDzTz3+DCSjZ+qqdGDgV
	noSq0StFJIpZs7ziuzqtFLJPCtRVFhJWHwj8NXlO7CHFbG2JxQoMi1cKFMUWYhjqY84vER3ySjg/k
	H2bKMxdj7woMR/RJxdxn7OccGFMDUgm8UFxas7wx2lnuLEr5JHyrOnFSFc1owCHT1mH/xsVTQQHPa
	XUnF/kAG6FNrhhngOn1g3T+UoahQMfgjVJrl8oLiyfgHI7coOhDRvErTGmG9SQC1CjNAfjw44VPFI
	OIuG27PbRvLUcR/4dAYRN7MUUIEtKY2n+bd0NoY9e23g9qhYjJjrbTrZyPscD3QhvaTgw/1xN3pWd
	hurX8qiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7Ln-0000000FExd-0tdM;
	Tue, 07 Jul 2026 15:04:43 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7Lj-0000000FEwj-46yS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 15:04:41 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-493b691cb44so30985565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 08:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783436677; x=1784041477; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MNMm+K1n82gXoA0QCvJimYEIEGXjevfFGtDXgwHf6mU=;
        b=WhIli26Ko793l4tqrcRCYlQhL+9tNq28J2EX7Yz2F/cLPXA8KBaG81kbo48drwjhn2
         JQZJhSMQR8+865ZnQUrd5cOYGM5bKxvIKIhnjzRFBofVL10EUxbbBE/l6iuSsGuoQjpa
         kv/kSIxKbNcQSX50+EoGR2+4dAk6WFRtqcj6w9fgAExDYOkmJVJrXAAs0u3MmXRYqlsN
         HTDVx05IVSIoDC5xmNEQXQtVVePkzbQ6YP4F1QUN1Zwgp5DbviNWl6ijbdTPSoRcm2oF
         ulfV5Ro/0h+lkp8DFr6broX2HBf9zFYcNkCLteltD6E5JvQ9T//4dbNKuHhSHSo31coU
         v2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783436677; x=1784041477;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MNMm+K1n82gXoA0QCvJimYEIEGXjevfFGtDXgwHf6mU=;
        b=TQiIsvKG7ljDnLSiF2g/XXZ45PFc2/Kfa0/u+AQ/CBp4dSs7kt/8EBeIypD+kCHDU7
         BtZVDC0Ek5gvFFrckNjhYW3ca1A/MQuwBQ3YC+nXXMT81U8rqI5wWcaQLMcJCA43NIZP
         B9XuVX+adsnK+7dgGr3yTvKT03JrDYQhSdU4S5wCcNaF54e9BcUGJlDgtS8wXZuD1xJP
         XC4QNtSxcnS3VMQFYm4YlXedmltlAvyKyDOpTY2ql2OPU+hHa5AY+CqCJNxQino9xxlD
         qZHcphmJCJUWDEV4Y/4c2UWsjIZHBrXfKdAp8I0nPV9hFWZu774JCw4b41sY8SogvxIb
         lr8A==
X-Forwarded-Encrypted: i=1; AHgh+RpBNiMbIeLgCIyrPCbebwz2H/J5GS9Om6Zg61/MbB7BWHmvJOaP2T9QdpGdaVtztF++I+U67999NWiQH3qH1S30@lists.infradead.org
X-Gm-Message-State: AOJu0YxQIbgh8eKNPZEf2bSBBEZP5E3+JU78nt8qG8KzQRk0U5X0pwSc
	rhk79WCfEt/yx1lXzmJ5IWdtRmz09CHBTvRgucGIqvHs7kAMbol5Ark6ytjTFA2J0SY=
X-Gm-Gg: AfdE7cniP+GmA2TI8+Z/s1YQy5Fxw4wk8IpUxh9g13zrEy/lEuVp7dqBtP99068co7Z
	vyWz5iD53m+JTTmghjZ5hM+/FctLNGVnpiNKRKItxQeG8cqVGA2l5LLl05deORHJhlPi9m5aYNe
	bMMLfavtju84UDMgddEojJb8sX6A80XY3dDeX2ux5R1iPK3LyosbwHIKalq0P1RjcdDyfBA9s+P
	cKM8GJG/kwfsgxIYMZesNSZiOXU6kxE3IhnzttpG5l/+ucOntKATPe0CjLDVWzABCMWxkbQQugc
	hIcZbtuqEfNrB9raDe6YdFaGOJUdcZXpUKmErUz2WF8Trwra7WDOwehOQonQuYQsmdKEe2vDRaN
	pCXiwvfZXPPZ/PDn5z+CBgV3CXh1sbpmC4M0c+/jk9XXubpyZ7psLU2V4CVWBiHm/4Hbsrjl+fo
	QUQ6piFVQKwRXyfiE=
X-Received: by 2002:a05:600c:198e:b0:493:bed6:85e6 with SMTP id 5b1f17b1804b1-493df0711f9mr67136355e9.15.1783436677306;
        Tue, 07 Jul 2026 08:04:37 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f294a6sm123915975e9.1.2026.07.07.08.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:04:36 -0700 (PDT)
Date: Tue, 7 Jul 2026 17:04:34 +0200
From: Petr Mladek <pmladek@suse.com>
To: Benedikt Spranger <b.spranger@linutronix.de>
Cc: Andrew Murray <amurray@thegoodpenguin.co.uk>,
	Jonathan Corbet <corbet@lwn.net>,
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
Subject: Re: [PATCH v2 3/4] printk: nbcon: move printk_delay to console
 emiting code
Message-ID: <ak0VguIf-PxmbUOS@pathway.suse.cz>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260703165654.71be8707@mitra>
 <CALqELGz-KSrGq5JYvLedZiO-p21pjpRKbceO+jiSfwZGyx+91Q@mail.gmail.com>
 <20260707145411.53a10893@mitra>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707145411.53a10893@mitra>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_080440_039385_2BF2887A 
X-CRM114-Status: GOOD (  47.09  )
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

On Tue 2026-07-07 14:54:11, Benedikt Spranger wrote:
> On Mon, 6 Jul 2026 18:05:06 +0100
> Andrew Murray <amurray@thegoodpenguin.co.uk> wrote:
> 
> Hi Andrew,
> 
> > On Fri, 3 Jul 2026 at 15:56, Benedikt Spranger
> > <b.spranger@linutronix.de> wrote:
> > > On Tue, 30 Jun 2026 17:35:59 +0100
> > > Andrew Murray <amurray@thegoodpenguin.co.uk> wrote:
> > > > The printk_delay and boot_delay features are helpful for debugging
> > > > as kernel output can be slowed down during boot allowing messages
> > > > to be seen before scrolling off the screen, or to correlate timing
> > > > between some physical event and console output.
> > > By now, it slows down the boot process, which is the handy part of
> > > that feature.
> > >
> > > > However, since the introduction of nbcon and the legacy printer
> > > > thread for PREEMPT_RT kernels, printk records are now emited to
> > > > the console asynchronously to the caller of printk. Thus, any
> > > > printk delay added by boot_delay/printk_delay continues to slow
> > > > down the calling process but may not have any impact to the rate
> > > > in which records are emited to the console.
> > > Using this feature to slow down the boot/suspend/resume process and
> > > implicit make printk() happen, is the usefull part of that feature.
> > > Imagine this sequence (which hit me on suspend/resume on i.MX after
> > > shutting down all secondary CPUs)
> > >
> > >   printk("A");
> > >   (do some stuff)
> > >   printk("B");
> > >   read from peripheral --> system got stuck here since peripheral
> > > was not clocked or powered or both any more.
> > >
> > > The delay (and later on a ugly patch to make printk() synchrounous)
> > > helped to locate where the failed access happend. JTAG did not help,
> > > since the CPU got stuck --> no JTAG communication to that CPU.

First, it is great to know that people are actually using the
boot_delay and printk_delay features.

> > I understand the use-case, you sprinkle printk's so you can find the
> > point where a read to a register causes the CPU to stop. This requires
> > that the printk happens before the read, and the output from the
> > printk is printed before the read.
> Enabling existing debug features in the kernel was a good start.
> 
> > > With your purposed change you *may* see "A", but never "B".
> > > Quite challenging... 
> > At present you may see 'A' and you may see 'B'.
> That's correct. 
> 
> > Prior to the changes in this patchset, and assuming an nbcon console
> iMX swtched over to nbcon, so your assumption is correct.
> 
> > (which may not be your usecase, but is perhaps representative of
> > future use-cases), then the printk delay will always happen within the
> > call to printk (and always before emitting).
> Which is quite good, but can be better. (See the missing sync feature
> mentioned in Johns reply)
> 
> > However, depending on the context, that printk call may return (and
> > proceed to your CPU halting register read), before the message is
> > actually emitted to the console. I.e. it's a race.
> I am aware of that.
> 
> > This series moves the delay to the emit side, as well as moving the
> > delay after the emit. Thus the calling code may make progress more
> > quickly, but depending on the context, it may also flush/emit before
> > returning from printk.
> Unfortunately it makes things worse.
> 
> > In my view, with or without this series, there are no guarantees that
> > you will see 'A' and 'B'. And in any case, achieving the functionality
> > for debugging required you to modify the printk anyway.
> The "sync" feature is on the TODO list as John mentioned. 
> 
> > > So please leave the delay on the calling side - it is helpfull
> > > there.
> > 
> > If you want to ensure printk is synchronous, perhaps you could call
> > nbcon_cpu_emergency_enter() prior to your printk, or perhaps there are
> > already printk wrappers that do somthing similar whilst debugging?
> As said I did an ugly hack and forced printk() to be synchronous.
> 
> > Would that provide a more reliable way to guarantee output?
> It does.

To summarize this discussion:

  + Benedikt would prefer to add the synchronous mode before
    moving the delay from the printk() caller to the console emit
    code path.

  + The delay in the printk() caller code path did not guarantee
    the output but it increased the chance to see it.

  + The synchronous mode will be even more reliable than the delay
    in printk() caller path.

Please, let me know if I did not get it right,

John, did you have any plan how to add the synchronous mode, please?
Does it look complicated?

I guess that we would somehow need to "mis-use" the emergency
priority and force it everywhere by some global system setting.

Best Regards,
Petr

