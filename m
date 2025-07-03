Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095E4C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 17:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9fsm/GMzU4nqbcKsxS9glFMOJCYfvJ+oEJCI8KRLbc=; b=BWo2+jjSBrdltuqeU+MfqF+qup
	2Mdjc3I5DPPc/mjivXwS+y43uOHWrwjNV6N3BXkfO8CNKDI/cgmNtJedyd8PPlzydnoeAWSXl1Zdl
	WLDeEXOXACTSbcDmZtApVexBRb36QHEP179zvV7tGxYMTyxVa3HjLwYQbeCnt8cr3BXVe6mHsqJDl
	lv4OhMZ4yDq6XrGt1MTaxjMWxhM92d1Q3WDwEckqpblrHZuEd4dWUUIBA+id/8L9QZrX/o69C7Ypa
	RMV/xOUg1Lm1lME9f6ahYCYpqs7/bG2Tf++E7BemZF9A0AGo63RHF74Gzjl0mBE/mRNsULx/B2GRx
	WK6z9lfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNjl-0000000C8wU-1cLD;
	Thu, 03 Jul 2025 17:28:41 +0000
Received: from mail-lj1-f182.google.com ([209.85.208.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLS5-0000000Bktd-0zl5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 15:02:18 +0000
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32b5931037eso3331fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 08:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751554935; x=1752159735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9fsm/GMzU4nqbcKsxS9glFMOJCYfvJ+oEJCI8KRLbc=;
        b=gh1Sxxh2F6lxDqOU0WJGwnh364urET2wfpzXwyqX9etLu1YzThYFudYPpPa1Fda8tX
         aZCYd6kTHAA+uuL4BAuE4fOZRovDWaSoFE9e/EgMuXsUcr4YxmnI41/sGzJ6cV1u63Ec
         A5gt7g+T3UlIxnbfLBVkspG1Fhvjssq9Jg8IgPenifuXLwnqNTmkt7tKOKFAkHjK+Lx8
         YkQqLthsQBtWX0ZCyiuNuFZw5A06ts4Sd8mhkfoiozz8XEAM5O9RSMcKitzV36Id0hdi
         eXx5QuclhVxC/GnhiIa63tzri31ec80HT2yJNfRj0gPyA3NNCkAQ12tiBEO4UehZnwJZ
         2icQ==
X-Forwarded-Encrypted: i=1; AJvYcCWefbAtKW69mmx7NVWRcgaP2yE40KoVTzomBJjAgqvTq68//J7ejJI1u739r/0i2UadFRiumplLGDRUY6Ucv3FL@lists.infradead.org
X-Gm-Message-State: AOJu0YydMjWKOyLIVekmcTtUsI80GmT0Rd5RIXwJ3py/6KbLiekR+Ads
	Yaf85Qms+eji5lEVnqqJC3lF4z2YkmZC1MxwkyyDl60kXL6bfXQpcQQNpRicATTS
X-Gm-Gg: ASbGncseF59cWCdglgwsSaEdVeJ09sPlRevLofIAaYKCph0CjxeFIklVI87IpCWial9
	e9sOe5qFRUC8hfXyvX22vAiMs80xelZytTg9FhiiK/0stladhqiATeP88u6Q2J94kjkWyZLnmL1
	KrAg9dCfvZt7GlKAabezTodPXlQNVEvGbqKq/x8v6jQJ5vkAgtxjRNjgg4v6EUBI/091tbn1RUp
	Fp6PXFcMzmPgq5nk+2kTnZwyi3OxLsf0hAI3ijIEklQb2M/ezdEubbIUFehErBgu6M5onedzhR0
	k6eqgErIgNtJpz/jhBrMGoNLfXKeJBHo4Y5CzJNeW/m2zCYEaCpDYRf70zBBPKAp
X-Google-Smtp-Source: AGHT+IEri2yurMSh6ssyzS0tOyLJvejqQ9bKtd90V7OhU858+wxFHpFvVOr1IMzHvMpLeoNexrxbtw==
X-Received: by 2002:a05:6402:2549:b0:608:a7a0:48 with SMTP id 4fb4d7f45d1cf-60e71e50e18mr3056093a12.28.1751554918954;
        Thu, 03 Jul 2025 08:01:58 -0700 (PDT)
Received: from gmail.com ([2620:10d:c092:500::4:6e61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c826f6788sm10500440a12.0.2025.07.03.08.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:01:58 -0700 (PDT)
Date: Thu, 3 Jul 2025 16:01:54 +0100
From: Breno Leitao <leitao@debian.org>
To: Leo Yan <leo.yan@arm.com>
Cc: cov@codeaurora.org, rmk+kernel@armlinux.org.uk, mark.rutland@arm.com,
	catalin.marinas@arm.com, linux-serial@vger.kernel.org,
	rmikey@meta.com, linux-arm-kernel@lists.infradead.org,
	usamaarif642@gmail.com, linux-kernel@vger.kernel.org,
	paulmck@kernel.org
Subject: Re: arm64: csdlock at early boot due to slow serial (?)
Message-ID: <aGabYkQixrVeYlLD@gmail.com>
References: <aGVn/SnOvwWewkOW@gmail.com>
 <20250702172036.GC1039028@e132581.arm.com>
 <aGZVP8A2a3VVQwzt@gmail.com>
 <20250703114557.GD1039028@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703114557.GD1039028@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_080217_279915_5E6BEEBD 
X-CRM114-Status: GOOD (  24.71  )
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

Hello Leo,

On Thu, Jul 03, 2025 at 12:45:57PM +0100, Leo Yan wrote:
> On Thu, Jul 03, 2025 at 03:02:39AM -0700, Breno Leitao wrote:
> > > In some cases, if normal world and secure world share the same UART
> > > port, it can cause the UART state machine malfunction and long wait.
> > 
> > I don't know how to check it for sure, but, looking at the serial
> > console output, I don't see anything else using the UART. The only
> > output I see on the console at that time is coming from linux kernel.
> > 
> > Would you recommend any additional check?
> 
> I have no experience in the driver, I should avoid any noise. But two
> things in my head for quick trying.
> 
> - First, you could try earlycon mode, e.g., add option in kernel
>   command line:
>   
>     earlycon=pl011,mmio32,0xc280000
>     earlycon=pl011,0xc280000
> 
>   This would be possible to give more printing logs. If earlycon works
>   well, then the issue might be caused by later init code (clock, or
>   UART driver itself).

That is an interesting experiment, thanks for the heads-up.

I got `earlycon=pl011,mmio32,0xc280000` working, the machine boots fine,
and I see different behaviours.

Booting up the system the following lines (as examples):

	[    0.000000] earlycon: pl11 at MMIO32 0x000000000c280000 (options '115200')
	[    0.000000] printk: legacy bootconsole [pl11] enabled
	[    0.493205] smp: Brought up 1 node, 72 CPUs
	[    4.232864] SMP: Total of 72 processors activated.
	[    4.242788] CPU: All CPU(s) started at EL2
	[    6.318137] ARMH0011:00: ttyAMA0 at MMIO 0xc280000 (irq = 66, base_baud = 0) is a SBSA
	[    6.978245] netpoll: netconsole: local port 6666
	[    7.234429] Run /init as init process

Also, I have a trace_printk() in pl011_console_write_atomic, and it only
start later in the code. More precisely at:

       swapper/0-1       [000] dN.1.     6.334581: pl011_console_write_atomic: Printing 49 [    6.334573] printk: console [ttyAMA0] enabled

I understand that the early boot messages got sent by some other
function? (Or maybe the tracing framework was not initialized?)

Anyway, pl011_console_write_atomic() continues to call ~20K times cpu_relax()
waiting for the BUSY bit to disappear, as before.

For comparison, these are the same line as above, when earlycon is not
set:

	[    0.154009] smp: Brought up 1 node, 72 CPUs
	[    0.154012] SMP: Total of 72 processors activated.
	[    0.154013] CPU: All CPU(s) started at EL2
	[    0.466949] ARMH0011:00: ttyAMA0 at MMIO 0xc280000 (irq = 66, base_baud = 0) is a SBSA
	[    0.466967] printk: console [ttyAMA0] enabled
	[    0.466949] ARMH0011:00: ttyAMA0 at MMIO 0xc280000 (irq = 66, base_baud = 0) is a SBSA
	[    5.513307] smp: csd: Detected non-responsive CSD lock (#1) on CPU#0, waiting 5001000000 ns for CPU#05 do_nothing+0x0/0x10(0x0).
	[   10.719305] netpoll: netconsole: local port 6666
	[   10.961798] Run /init as init process


From what I see, using earlycon boots the kernel faster. Here are some
ideas I got:

	1) Earlycon enables the message to be printed earlier, thus, it smooth
	out the serial console

	2) without earlycon, the messages are printed at once, with interrupt
	disabled
	 2.a) This causes CSD locks
	 2.b) CSD locks caused an additional 3 seconds delay

	3) pl011_console_write_atomic is slow on both cases

Thanks for the good suggestion,
--breno

