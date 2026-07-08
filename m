Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C66C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 15:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jglJtMgeUyWa6n8zEnVsMKXnKVEICn3GMbuj/cxnkgk=; b=QzmV+0IyiKzmgyMk3rUT3pNLFP
	X8XC25CACfFHGZ3Ki8L87nfrs7w4KDOxsK2pmv9ACPXo05zJ3E+tHf2gVc7SeTuNL2tGlncGMyL5O
	SUYmV1PamKVoU5MekT64cljAQoScp+BqUMTWIt8q2Yty2on9WlafNKdkY5kIQYYsynZuUP+gJUk/s
	8aob2b5dXTthdSwN3q1LI12R8+3088Wr6w+WoiZ9rdGb84LzuyBOmy8f+7JaVNKglB/HUNmfphsGm
	4wdXhyT7QFmDQvFEDNha4NMw6XSRReYuMwoFTqkmRlVDVeRS8QxgQfVoxhsaj9jNSn0rqwyKmEABT
	dljfQn5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whU8P-0000000HSl5-3BJH;
	Wed, 08 Jul 2026 15:24:25 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whU8N-0000000HSj4-2lLG;
	Wed, 08 Jul 2026 15:24:24 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783524261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jglJtMgeUyWa6n8zEnVsMKXnKVEICn3GMbuj/cxnkgk=;
	b=k9ZY/UxCZbSsH/rc098SAyI0bHPPVWzpzgVkApB/wzpkIFccGmCq0YuqclYloDvH2whtVC
	D6M8VQKt1J/GEhjkE6EU6pykSuTzEDJkT30cJmyOoq+VJnkxR/1gwpow2xbVo1gB5OYyfM
	RaYcJ8gf8UA+5LbL5eSEzjavxm2tQ3rIwkFzunJPiVpKsHjyeegej20TOmCwX1IaL42MuF
	kz7ORl1WHlQTc/2dcbDhcP3YWj27KZ0IXKpsoYCGb8fwlRr5HJ8QGa6+nRMGgVg1UXiYv1
	+Dol3Li2DRlD9zzI879vxtof5+fQy9S1t8XYz0IOfCFmmdo5wFFv+uTfzKBQ7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783524261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jglJtMgeUyWa6n8zEnVsMKXnKVEICn3GMbuj/cxnkgk=;
	b=ZoeU5/gXaDY/oKKzK/5TkBRN6U5CpSFPHCR1L5QTwxQPs68Awdxbr1e3D7rkoeiasUdje8
	NeyuTroDF3XyJvCA==
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
In-Reply-To: <ak5oFk3Snnt9Wr95@pathway.suse.cz>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260703165654.71be8707@mitra>
 <CALqELGz-KSrGq5JYvLedZiO-p21pjpRKbceO+jiSfwZGyx+91Q@mail.gmail.com>
 <20260707145411.53a10893@mitra> <ak0VguIf-PxmbUOS@pathway.suse.cz>
 <87qzldvqpm.fsf@jogness.linutronix.de> <ak5eCp5qw9LYrnAH@pathway.suse.cz>
 <87zf01ttve.fsf@jogness.linutronix.de> <ak5oFk3Snnt9Wr95@pathway.suse.cz>
Date: Wed, 08 Jul 2026 17:30:20 +0206
Message-ID: <87wlv5tsgr.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_082423_841602_AB9599F0 
X-CRM114-Status: GOOD (  11.15  )
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
> Now, the question is how to move forward. It would be nice to
> have the sync mode available before we add this boot/printk_delay
> clean up.
>
> Would you have time to prepare and send a patch anytime soon, please?

I can work on this this week.

> Or I wonder whether Andrew Murray might try to create a patch
> based on your "SYNC IDEA".

I expect that the two series will not conflict. I am just adding another
atomic printing path, but the Andrew's delay is implemented deeper.

John

