Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD482C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3VGnXCa8/+c+qXxxpDN0SzecjTWYnKYnTQWIaynhzc=; b=d4T4DEMOCQvzXk1A8Nx5DMG4XS
	ATIJ9K0yxN1Ok6NidhMuzL8sQeWqqwSpnrBlaBPOyqthdJlz4gm9Cag8lPS99RjeuE9S0K6DwvDgc
	PSQrSsifLEmIu+6e5j18xt2GjABDstncNAgHuQv8bgl8PqSfUjjnVriGG0dqv1RQ/Hi2PP78IBT6O
	uCzcfWnK4aJxWP20PKdy0ddFkk60NfP4jpsi95X/CvR5HMC/IIv5+/rwHEFyW6to/b7odcEoLdNuY
	nol1bP1jDrZr8SBvuogVhKmN6oqhT/o6w8HC79z613tqKvMzY9fhqNUXEi5pCrmVo6gmRtqjso+n2
	cAxGdS7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTf3-0000000HP4k-0Xkb;
	Wed, 08 Jul 2026 14:54:05 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTf1-0000000HP3x-0uhb;
	Wed, 08 Jul 2026 14:54:03 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783522438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E3VGnXCa8/+c+qXxxpDN0SzecjTWYnKYnTQWIaynhzc=;
	b=WpLRTgKvqxcp6FYh952df/n+IomBdU93YPgLSN0mmevxMFmXWgFd6nWPQeIA3zWNoP6kSQ
	neIkQIOanLS4Ekt9VH9fQ3iHSMv3O3Pm3mJnFQDYq1dhAnnnyJY0A/t+Mxs7rYQhMeqAZS
	EyWQ9u1VfKxeJKJCCtpn8Xy4TPtvbTg5IdKsUT4MiY4e4w5zUGLC/HGAABQMtkyYEpRZF2
	aK7IOmVyQwpAD9RutNxvz6NZ1jY2yitTw75cEQmd/84vJI2Y00+RszK5YoHyAc01DLWwxz
	vLlOruTCeeNYWHe22uiI9yc24cwBOV/ejJ8W2e4bA9BXu+cMRrlwlVb4hf8qIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783522438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E3VGnXCa8/+c+qXxxpDN0SzecjTWYnKYnTQWIaynhzc=;
	b=t9ji51pJCgLujO8YuF77uRSc/fBfpumhfWE8RcPnNA3u0g700c6Qp+4PIL1DE10oy4ZDiT
	BfnkJjMTr5jmJlDg==
To: Petr Mladek <pmladek@suse.com>
Cc: Benedikt Spranger <b.spranger@linutronix.de>, Andrew Murray
 <amurray@thegoodpenguin.co.uk>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel
 review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Steven Rostedt
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
In-Reply-To: <ak5eCp5qw9LYrnAH@pathway.suse.cz>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260703165654.71be8707@mitra>
 <CALqELGz-KSrGq5JYvLedZiO-p21pjpRKbceO+jiSfwZGyx+91Q@mail.gmail.com>
 <20260707145411.53a10893@mitra> <ak0VguIf-PxmbUOS@pathway.suse.cz>
 <87qzldvqpm.fsf@jogness.linutronix.de> <ak5eCp5qw9LYrnAH@pathway.suse.cz>
Date: Wed, 08 Jul 2026 16:59:57 +0206
Message-ID: <87zf01ttve.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_075403_427855_72AE0395 
X-CRM114-Status: GOOD (  15.59  )
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

On 2026-07-08, Petr Mladek <pmladek@suse.com> wrote:
>> The synchronous mode would rely on the driver being nbcon. I envision
>> something like this:
>>
>> ---- BEGIN SYNC IDEA ----
>> --- a/kernel/printk/nbcon.c
>> +++ b/kernel/printk/nbcon.c
>> @@ -1200,7 +1200,7 @@ static bool nbcon_kthread_should_wakeup(struct console *con, struct nbcon_contex
>>  	cookie = console_srcu_read_lock();
>>  
>>  	flags = console_srcu_read_flags(con);
>> -	if (console_is_usable(con, flags, false)) {
>> +	if (!(flags & CON_SYNC) &&  console_is_usable(con, flags, false)) {
>
> The dependency on con->flags means that the sync mode can be entered
> only in task context where synchronize_srcu() can be called. It might
> be good enough. But I am afraid that people are creative and would
> like to have even atomic variant sooner or later.

You mean it can only be _modified_ in task context. Yes. I expect it is
either specified as a boot arg or modified via some sysfs interface.

> Also it will do the flush in NORMAL_PRIO which is good. But it might
> fail to get the context ownership when it is blocked, for example,
> by uart_port_lock() which might be even sleepable context in
> PREEMPT_RT kernel.

Indeed. This is the same limitation of the atomic printing in
general. But I do not think this can be worked around during normal
operation. Ignoring locks is not an option.

John

