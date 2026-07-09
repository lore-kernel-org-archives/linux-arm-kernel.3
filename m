Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E34C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 15:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ETsmdmb+3cHXN08EH+iCV/ETN1CcrQj41jPmLj5YZI=; b=P2nXA3MiqRRFE1c7yVUyLQvm2Y
	cn5MVikIo32+whNRmwlprcec1Zr2gZktbNvEOjb3xkausFbAz0wDB+0xgXr3XLHkOifLlM0Rrlfou
	kYxdaLObHgkFpknABFwkGFqMQv0K+bK3aFcT8G7tGp3vi55oTYkivKXtZt/7PztP6fosBUFQMFK+H
	ArxHQ8G4L4GdKifdHLDai8cowHdY94an9sggPeoshsWDEjcrFpyUauKA16pXjDz4cr80jmNXW7y7Y
	HjXoMCR9av+isIFtiaHpPF88kzDR9RlpA31ckUKxRHV2J+/bhMTcfGt7tBMbv8nh6tYJl1FqESfKm
	5nQZgw9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqfT-00000002vD5-3HSf;
	Thu, 09 Jul 2026 15:28:03 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqfQ-00000002vBs-1Zdt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 15:28:01 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-44ae14b4fd6so1074725fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 08:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783610879; cv=none;
        d=google.com; s=arc-20260327;
        b=fxDKEimzpub8xxUrfoDalY7cQ+C3sV8VuVBYmcyFyGN7sXI2Pk/C60xFYxzpk4zEDN
         EXU7MV1JY1RKDE0Fy8oRc9k9dNBxQcgrciBAnwqpMHK0W5qNPDOJL68yWgli1ho1voHC
         g0rrSWx12NIgZSHg+7PEwXj/y45FmEzEAy5yF2Lq15VdfDQicRXyfd94RucyEuyJNE/i
         3qgrtLaMn/jfWZEbD3GJQCBkeDXJ88QOrHSfO83Jk0sT2Ra1b/s2ftDOGhhV0JLtuJmx
         vZ+JVSruSl5nxzx3gNGR6YnP7ru6FT1CTBQptArcALTWtFYXmpU7vLBfKy23gA934j+A
         X75A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3ETsmdmb+3cHXN08EH+iCV/ETN1CcrQj41jPmLj5YZI=;
        fh=Mxsvs3aAOOP99u+CQJcXioNV8VPxrUQKjeWsx03xIHw=;
        b=RyNUsUY8pMWrKBav22jIUUCe9sCORS9XjYnownTqCVjlzoEBCiflNzlbPH6wobq/D9
         jbZ27nl0g0gQmoWtfM2gnFBh0FXWHd88nu4d2sCm8eGgjRuaGC8u20HiCAkWBRU0mPEp
         9hYfP9wKr2nMDYcadvqmowjkSyyCWDIungv8cPdEuF01tClfrzPb2wQ6K5sdkXU+Kgci
         B1e8hT+nEyP9OFQN6RX2+9GlW7R3z6IMdiNmC1AFTMYCXuvbYBtJk59mLPt3HJzOAFgJ
         pEzoR2q2XTm3iXpbUGQxcwk3gPBYPD7FOUT78OcmavDLKHnfX0Vw3T/Aag8N1TNFs7YX
         wybw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783610879; x=1784215679; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ETsmdmb+3cHXN08EH+iCV/ETN1CcrQj41jPmLj5YZI=;
        b=ETi4Kw/vLzz/sYi9HKPCrkwn/xgjvsQ6bZP9Q5hmWpE3K4F0lhQFpUY1uD594LQ6+L
         jb7L9uGc1uUhPJcpuMv71nZYwtD7XxUoZXCQwapoJ3qMVrwsobA82uaof7IrsmU99KxW
         vzaMyJUl77u2gb86sCATh7eLd16lLGlnSK6HUvoqCGWdJth73s9oeJsSbQ8lqSKTxLbR
         Gu1BnlbGW7/n5bUXt1x8TrMkIP48EYU7KhEW4LZXS5PaxXbT7/c9Km5CB/y0GzAQrJwe
         3UXHcK5i24WhMpZ2xYyBHi4WvT05QGzen3MWjAiYx0+DXHnU/cyJ7NhI6AZVJyfcQ/80
         C/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783610879; x=1784215679;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3ETsmdmb+3cHXN08EH+iCV/ETN1CcrQj41jPmLj5YZI=;
        b=rtmeyaULYwiuFgJsftgEz6x0V+X3iFoPhsl6AbY8l/YjlZ2cpIXYz9oMm5qHSZNsZ+
         wBw7iCL1LJ4WotrwPhvLTeslKvGGAe/04lvtLH6PB5m0T30Tosbrb7czZIZbsoh4/vJW
         1gkyD0huukF88IosSIvNrxFZmALf05gNpKOpoK7a5rXhrhUjzr9C73eHjGfuU0gJgAQj
         rjeppZFlgjG+apjqlzr79388bZDr1v/2t2B6IZ1Wn1ouKmZwBrVFc9/IGQGftli5g+3V
         QwXOlwPrVmWr7B11k8fgOt4mwlDoJLNSdMMxe9bXpmuNyEavf+iobt7MSpQ6PCvl1Gcy
         qyNg==
X-Forwarded-Encrypted: i=1; AFNElJ/KgqQLM61qQjcwk36Z1naN/C5w0r2AfvQFrzEfDrmycyLaWLkRcSl8SQJil05xc9fUfGWPQHt/pn1QkJEuuNhj@lists.infradead.org
X-Gm-Message-State: AOJu0YxN+irWktvQ5PmECA6tz4qE1B4znR9UojMuqm4USFbvx0Ut1t8T
	wktiUOWgJC6jkBZPbttvWN5RA6OOa4ClTM9otjalgvqsqlxoZg1c51E7HVFgKiEbUqlY3OB2J/V
	AJrH26tzUhCV+WxWUaG8PhnEmJ9xfIMRcmWGg3NkAyQ==
X-Gm-Gg: AfdE7ckxRM6s5Ur7O+8r4DM9uHk4zb6xR0o3R2C1ey2uPJNjXnzZz8UBHVBv9ModxcP
	4Fntf0Eu/smBos+/3Poa9r1y3oRTLqkWZYDmdI+pthFDxG9ByWKZrYVpZy0YFJsChq2h8mDQS5S
	R37t5ytpRSq7kWQ2zRnpaJ653g+ivFKtT5d67v3QXNZcH82OrxRFv9iPaeBxpqaWxp9fdz71uxV
	nJguFnxZuigdEDIZjFIBBILln1U7t8bFM+uAP+tudNo2I+XzQn19dTZSGP94tD91MUO+rMVtJMH
	keE1eW7muimASiwJYaih8JFVDYj5owkQUAjx/hkQuaEvSGAB4TCIvBz0n4thS9wMu0Q98o7tp5u
	UlpkyZBahDR7eRonn09LYrQDL9yjA
X-Received: by 2002:a05:6820:4dc6:b0:6a3:c14:c985 with SMTP id
 006d021491bc7-6a36da6566dmr5303668eaf.72.1783610879362; Thu, 09 Jul 2026
 08:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <87zf08w7qo.fsf@jogness.linutronix.de> <ak0b2S9jjYy49a8V@pathway.suse.cz>
 <87echdvkd5.fsf@jogness.linutronix.de> <ak5X718OcOi8OeT4@pathway.suse.cz>
In-Reply-To: <ak5X718OcOi8OeT4@pathway.suse.cz>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Thu, 9 Jul 2026 16:27:47 +0100
X-Gm-Features: AUfX_mzqUqAOJpVXS1zSrcgE0KUX94znIqSV83ZukwijZLhjWKW1vacbJxvZC-s
Message-ID: <CALqELGwMa8N8VRQeDWK=vWX+YGpa66HNMSA1VmvSvu1-adbh3A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] printk: nbcon: move printk_delay to console
 emiting code
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_082800_589804_CEC29E86 
X-CRM114-Status: GOOD (  32.75  )
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

On Wed, 8 Jul 2026 at 15:00, Petr Mladek <pmladek@suse.com> wrote:
>
> On Wed 2026-07-08 12:42:22, John Ogness wrote:
> > On 2026-07-07, Petr Mladek <pmladek@suse.com> wrote:
> > >> This is too deep (also pointed out by Sashiko) because it multiplies the
> > >> delay times the number of consoles. For the legacy printing, it would be
> > >> more appropriate to put the delay inside console_flush_all() and
> > >> legacy_kthread_func().
> > >
> > > True. The question is if the proper solution is worth the complexity.
> > > We would need to pass the information down two level of the API.
> > > It would require adding a new (output) parameter to console_flush_one_record(),
> > > nbcon_legacy_emit_next_record(), and console_emit_next_record().
> > >
> > > It is not that complicated but these functions are already hairy
> > > enough so we should be careful.

Indeed - It would have been nice to put the delay in
console_flush_one_record, but nbcon_legacy_emit_next_record and
console_emit_next_record don't provide an easy way of knowing if the
record was actually printed.


> >
> > Fair enough. But then it should be consistent and
> > console_emit_next_record() should perform the delay before allowing the
> > handover. Something like this:
>
> Great catch!

I'll update the series to reflect this.


>
> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index 2fe9a963c823a..62fd6a5ebef66 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -3161,6 +3161,8 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
> >                */
> >
> >               con->write(con, outbuf, pmsg.outbuf_len);
> > +             printk_delay(false);
> > +
> >               con->seq = pmsg.seq + 1;
> >       } else {
> >               /*
> > @@ -3182,6 +3184,7 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
> >               printk_legacy_allow_spinlock_enter();
> >               con->write(con, outbuf, pmsg.outbuf_len);
> >               printk_legacy_allow_spinlock_exit();
> > +             printk_delay(true);
>
> It is pity that this is inside printk_safe context with IRQs
> disabled. A solution might be to call it before the write.

I tried to be consistent about always performing the delay before or
after the emit. As part of this series I moved the delay so it now
occurs after the emit. This made it easier to know if the message was
actually emitted (rather than delaying, and then a handover occurring
before actually emitting).


>
> But maybe, this is good enough. This code path is called from
> vprintk_emit() and it might be in an atomic context anyway.
> Also it increases the chance of successful handover which
> might help as well.
>
> Anyway, it would be nice to mention these pitfalls into commit message.

Sure.

Thanks for the feedback Petr, John, Benedikt!

Andrew Murray

>
> >
> >               start_critical_timings();
> >
> >
> > John

