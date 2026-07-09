Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4477CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 15:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCvSGqbhj9/NhLA9ZbyAvA3dzoWQlSiAOLf8QjRL6Pg=; b=ztNlCZyEE1h5WXQcvIBjed8ZBW
	6vwB+Jy9p+FTiVrGcm8QQEX5JqwPbHKJRVAHnt/j2rJIVAtsPSnx28NQOTpxN97+xTWWWpyyFTUqZ
	VqpdiRMKvdfzQdAgyPXpr1wvfnLDZhTgtiu8DDFY8b1cSm9i7LRRUbZjguE7R2Re4zLdsfffABx4H
	BmBFhcY2EUgpfP9NwrnQTocId7J7XIndNUeT9BX0U0RJyAt42551NLnZMp8F3WL2+XjHg7KZRkNBl
	SfDTU3xh+5Z8uzzfD98elPoRQtyyZnK/cGpra5ZhS7iGoCUPdGuoz1VFYSZiA5iu1smQROkO1HE0R
	UzDgMCkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqYx-00000002tpx-2VeA;
	Thu, 09 Jul 2026 15:21:19 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqYv-00000002tp8-0R04;
	Thu, 09 Jul 2026 15:21:18 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783610472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zCvSGqbhj9/NhLA9ZbyAvA3dzoWQlSiAOLf8QjRL6Pg=;
	b=yPxeCtv7/v66gXx/D1fcRyKL1cphG+7D0+7gfqZuKG5TY3Lov3QxQicfiad2nf95WZilHe
	utDBJu89JL2Yz1xzvn/CqzATfh6OfU3NW4XH6tUL20l0tUE6yLZmhCajmqCiAIoLuyidOu
	D8WEMvAyXq7HJgmxiCJGnfYrMBsKrUU4S4Q1dGOk3PQZXhKlYD6v/GtkW2umOKDT5gsa30
	bxorj8UIbFEVTJRuPqQUX4Jje9dRhNgU9ho6TNhTcp1wnYlbMV1vsk/amHvLmPc0SOkf2f
	HCCzJjeXFQkCmLlYzKz8xyqkS4oA8LMfUjMKTsFtMNcH92sx+hk/Yq8JPgCduQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783610472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zCvSGqbhj9/NhLA9ZbyAvA3dzoWQlSiAOLf8QjRL6Pg=;
	b=bvJKA43vE00gb5w8aGww1E5ceOM62dgrQ8tJ096LJSDDO76decZm7uufcWpQd/8ogpAWkH
	+ZRzcy3uOwxnWTAg==
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Petr Mladek <pmladek@suse.com>, Benedikt Spranger
 <b.spranger@linutronix.de>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Steven Rostedt
 <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Randy
 Dunlap <rdunlap@infradead.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 3/4] printk: nbcon: move printk_delay to console
 emiting code
In-Reply-To: <CALqELGx+7RSKL0+kdOxu0TpXaOifYkzxmOTv+4gTSHqrbLEJ5Q@mail.gmail.com>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260703165654.71be8707@mitra>
 <CALqELGz-KSrGq5JYvLedZiO-p21pjpRKbceO+jiSfwZGyx+91Q@mail.gmail.com>
 <20260707145411.53a10893@mitra> <ak0VguIf-PxmbUOS@pathway.suse.cz>
 <87qzldvqpm.fsf@jogness.linutronix.de>
 <CALqELGx+7RSKL0+kdOxu0TpXaOifYkzxmOTv+4gTSHqrbLEJ5Q@mail.gmail.com>
Date: Thu, 09 Jul 2026 17:27:11 +0206
Message-ID: <87jyr4jijc.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_082117_282238_4D7798CE 
X-CRM114-Status: GOOD (  21.53  )
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

Hi Andrew,

On 2026-07-09, Andrew Murray <amurray@thegoodpenguin.co.uk> wrote:
>> The synchronous mode would rely on the driver being nbcon. I envision
>> something like this:
>
> Is it possible to apply synchronous mode for both nbcon and legacy
> consoles?

For !RT, legacy consoles are already "somewhat best effort"
synchronous. I really do not want to try to somehow improve on that. Our
goal is not to improve legacy, but to get rid of it.

> For the debugging case Benedikt suggested (is this the main
> use case for this feature?), it would be helpful if a developer could
> indicate a preference for synchronous mode without first determining
> the console type.

The developer is free to add ",sync" regardless if it is an nbcon or
not. My sync series (which I am currently testing) will simply give a
boot message that the console does not support sync mode.

>> ---- BEGIN SYNC IDEA ----
>> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
>> index 2fe9a963c823a..beb5bb3c037b5 100644
>> --- a/kernel/printk/printk.c
>> +++ b/kernel/printk/printk.c
>> @@ -2456,6 +2456,8 @@ asmlinkage int vprintk_emit(int facility, int level,
>>
>>         if (ft.nbcon_atomic)
>>                 nbcon_atomic_flush_pending();
>> +       else if (have_nbcon_console_sync)
>> +               nbcon_atomic_flush_sync_pending();
>>
>>         if (ft.nbcon_offload)
>>                 nbcon_kthreads_wake();
>
> My interest in misusing (not proposing that as a solution) the
> emergency mode, is that the flush mode is nicely abstracted by
> printk_get_console_flush_type. Depending on how you trigger the sync
> mode, could printk_get_console_flush_type be expanded to look at a
> flag and return ft.legacy_direct, ft.legacy_offload or
> ft.nbcon_atomic_sync ?

Yes, I could do this, although it would only be "usable" for the
vprintk_emit() case. For the other two call sites:

nbcon_kthread_should_wakeup()
nbcon_device_release()

it would still need to be a @flags check because it is about a
particular console.

Of course, we could make printk_get_console_flush_type() per-console,
but that would be a considerable semantic change that would require
quite a bit of refactoring.

We can continue this conversation once I have posted my sync series.

John

