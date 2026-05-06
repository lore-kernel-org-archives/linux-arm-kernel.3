Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1ADCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 22:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2M9x4aX4d7Rz8hjq9oGfdKv/HBHH7LxpobCw3rVI4o=; b=JdYHrFxtVz8xhUWeJ6azD0pajy
	ELfcYTWaIIWHT7oM/mV51zCwa7QtIVffhD/vuvwP58m/rlZTQ6MahPgeOOBcExRbp1isszO8u85b7
	2AvJ5WQqsfjRk2rpNK1W7fKA7hnGbcxfBgYMj6eFVNj//XnXrBYk435hHf1bHRjYV86kx6XiIXDjL
	q3XbEcQdEVEGKjeU/fD5PgdV0Uw+a2B+INGTFFuXJqGcUNTAkBf0E+vthCIp59uYDDD3ZtOqwrAjV
	GNVkBnf0SxNG84/2sbUKVdqUtN//+YHJUDUfeUQv0oqlgtcxnBHnaguijC13qHrg8P/ehaFhLP7aR
	5ZOwL4Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKkrk-00000002D8N-3FrF;
	Wed, 06 May 2026 22:37:16 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKkrj-00000002D7Q-2N0R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 22:37:15 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-679b072ed3aso109214eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 15:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778107034; cv=none;
        d=google.com; s=arc-20240605;
        b=Dk64b8BHllDj+F7al9G90ookJNJXVxctWiaSHTNv1al54VOZ+97Mvm2gcufc37khAY
         rrWKizOyuyMHmSIaEgnzrVz9Ox1CfrLxImYE4Q5XDxWAVgzewMn/I2/0fRO0TpEkMiPZ
         oeEI9H4uR20H4EG+DpjB4Zfd5sfKcikumft8wqmVMbeXyu/WPa1c/VewxsKKlTPmqqh5
         HBfyjhWnMbVu/xufNiDBPm5vPyAEM/hjvevz0RYl/t0aVMBro0emwv3E78ik1P5UeZzM
         Ad9LFW1YZ+2h/1NecWcTQYas1Igynoll+Ej3reyBMqgN0Uk/6lXF2qGvnOk8DnoJuWzP
         QY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=O2M9x4aX4d7Rz8hjq9oGfdKv/HBHH7LxpobCw3rVI4o=;
        fh=LtBGdfPbWzlZihU619lvMOex9M0btu8bKrxGRuh6RZQ=;
        b=aNHuwh2Ac0Zk1YIrY5409zLDbPFrUmmXd9VkLNBykygN14CbaJV1CjnAMbCX5zxjOp
         BARMadoOM/2bWgU/hKl9Br7ShDqf7VU3U5kAZiDUygcYVvY6cUiHh/578N6dSyYvws2x
         RIB0a2EZHpGzKJGul0DJLDI+GvO7ALDmDrcDhkyC0RM7HPdhklhI4uwxCYlnlqtXGjwP
         NFTkvfR45gEJu9x1Pl4h6uiiIhuvM5aMgr54wnLemY4h2S1/LR7jfbjV2oFMJTx6JPan
         bJszYV55fWIIClD9C/8TjzTDtESWfRqRBXaiBcyfxqNssILSi3V9pKopbJJlEx3lxppQ
         u4Ig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1778107034; x=1778711834; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O2M9x4aX4d7Rz8hjq9oGfdKv/HBHH7LxpobCw3rVI4o=;
        b=buavlPntA4ReY/NEoEkAoiKxu+Kj9PWJViNI+ZIlq2wto24rb/AI6iwDGRYeC7xAMF
         QEZtQNrtXEgEryjBEOKT08uY1RpdRJTS/5k0R3Z0YPFN1bbo2V3LuVl58gS9P+gU3gUO
         xc424STlnQC4/53yeiyQG8+I41A4CXfAo3x5x4VjQLD5bLq+Cgwl2CEZQhCExTT4CBBd
         33jK5/FM+zQvREr0hJZbGXD4vmWBpK5c7e8zXG3HNltotvTeXWdaWKNgobeqrm4QXqiy
         4DvS3NCHWIq+nWF4WC6TxiXO/8jAg5pSTze3ingXo9z1T/MzZSgoLFsesixqxGq14JaN
         ct5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778107034; x=1778711834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2M9x4aX4d7Rz8hjq9oGfdKv/HBHH7LxpobCw3rVI4o=;
        b=Yfj72wE535uppIJqWnjjmCTnK8L0dBtWySdZD+rJGx2p0mggwnNpUq1W4D1ncq36Hp
         icEWIpg7rbqUG/1depRqfi7iTu89eJhhkIGq+pfZLN/Pwhn49e5epX7+7F8LxlcuZBfK
         aU/uodGa/aXeFAx6JDtNErtPc/HzLHMvSkzrkEbd0jW6sNpSV991yayE/ostVavzDO+u
         xbzeySthoCUReVqeVJ13uJI2EIQxdAjjnxqt21Z2Hk+KdHaQNi6zAsPbCgQh2iI1iwwI
         yfEzU9Wr9QwA9PcF4CeZUuNqWlwNdV4RvUNMLHmGv8kqWOyAqTsWzuIAJzAXc4v7O09y
         qoNw==
X-Forwarded-Encrypted: i=1; AFNElJ9kieHgr22QSvz92q0hq9bMfV8AauDSO1BQ6tNO0Ie/hREQEITLnVYBgk3vxPTFhIcY8ALbuUqeAHr1sqCRhP/Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yyfoep6u7HfT/sZIqy3IBACu6wSns4I9xfJvSwbwEd19WbvtoH6
	r6ooobpWpOAo3Kxkh+fxAlg00ZBWwPNasMHdYi08DI6FNbxQCsGVtVXlJFNy+0M27j1Pj9akl2/
	GwgN15Dqeje/CXW9BeWnLctpeDOdyIUxGReFKVGzkhw==
X-Gm-Gg: AeBDieuRdBhPK1obJF+86oWtsE4yxix0z9YFIkV90RZz2wszRqTwqmZyYtVw8LImYxA
	PZIKsifhbNlGCmIVjX3LRpF+nserICdRvM1fi0/TzVRbMB4YWjBaDrwAwU9rgtElUCqi/ZdFel7
	v3Ac7+Y5GxyNYRb+Lcf2sgXYCPM3F1XqVOnhtevap9J8Z37jt34Y+pnFtE1pvnhVkKGnfDcncnt
	Sa8fXeZxCy6CeBSWLe/ArSJgxRhgFts5JlmDHsqkPdelnpv+djxiI6y4SB7kLA8RcInYp/gLDm7
	XmMLKRRUcpIuWW0+wQZIUJvLOJqu+Y144kAV1T/XD0bybzYlcov0rSvnSIE3GcYf6FK4olVBQVm
	mumpG2hvXVwaXn/bBZ+SDpHdYqPvw5uZNra84G5GrtQwgn/aeFA==
X-Received: by 2002:a05:6820:4c08:b0:68a:e01a:9b99 with SMTP id
 006d021491bc7-69998d4fdfdmr2825460eaf.50.1778107033777; Wed, 06 May 2026
 15:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260505-printk_delay-v1-1-5dba51d7f17c@thegoodpenguin.co.uk> <afn-H1EQJxnDs0BZ@pathway.suse.cz>
In-Reply-To: <afn-H1EQJxnDs0BZ@pathway.suse.cz>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Wed, 6 May 2026 23:37:01 +0100
X-Gm-Features: AVHnY4Ja58VfipZT-8soAZYnzo0HXiglj_UpI9Yp8PzxiCF3zB-23LSxITGGZYE
Message-ID: <CALqELGxhXO=kzh9bpztd9=Ug9ykPL2NALo9Apq3=Oj6aeiEcKg@mail.gmail.com>
Subject: Re: [PATCH RFC] printk: remove BOOT_PRINTK_DELAY
To: Petr Mladek <pmladek@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Randy Dunlap <rdunlap@infradead.org>, 
	Clark Williams <clrkwllms@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_153715_833641_777055F4 
X-CRM114-Status: GOOD (  45.41  )
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

On Tue, 5 May 2026 at 15:26, Petr Mladek <pmladek@suse.com> wrote:
>
> On Tue 2026-05-05 14:45:00, Andrew Murray wrote:
> > The CONFIG_BOOT_PRINTK_DELAY option enables support for the boot_delay
> > kernel parameter, this allows for a configurable delay to be added before
> > each and every printk is emitted. This is DEBUG_KERNEL option that is
> > helpful for debugging as kernel output can be slowed down during boot
> > allowing messages to be seen before scrolling off the screen, or to
> > correlate timing between some physical event and console output.
> >
> > However, since the introduction of nbcon and the legacy printer thread for
> > PREEMPT_RT kernels, printk records are now emited to the console
> > asynchronously to the caller of printk and its boot_delay. The delay added
> > by boot_delay continues to slow down the calling process, but may not have
> > any impact to the rate in which records are emited to the console. For
> > example, if delay_use is set to 100ms, and the printer thread has a
> > backlog of more than 100ms, perhaps due to a slow serial console, then the
> > records will appear to be printed without any delay between them.
> >
> > It would be unhelpful to add a delay to the printer thread, and it would
> > not be possible to disallow selection of CONFIG_BOOT_PRINTK_DELAY at build
> > time as it's not possible to detect which consoles are nbcon enabled at
> > build time. Therefore, let's remove this feature.
>
> Heh, Randy proposed to remove "boot_delay" few days ago.
> This RFC goes even further and remove both "boot_delay" and
> "printk_delay".

Apologies, I didn't see this. I'll co-ordinate with Randy.


>
> Honestly, I do not feel comfortable by this. The delay seems to
> be handy when there is only graphical console. I would suggest
> to do:
>
>    1. Obsolete "boot_delay" with "printk_delay" as
>       proposed in Randy's thread, see
>       https://lore.kernel.org/all/afn2sYKKsqG4QBVX@pathway.suse.cz/

Your suggestion was:

" 1. Add "printk_delay" early_param() which would allow
     to set "printk_delay_msec" via command line."

And I assume the intent is to replicate the functionality of
boot_delay, by allowing printk_delay to be used to introduce delays
from early_param time? Thus deprecating delay_use.


"  2. Modify boot_delay_setup() to set "printk_delay_msec" as well.
     In addition, it might print a message that it has been
     obsoleted by "printk_delay" and will be removed."

Given the intent may be to deprecate boot_delay, I'm not sure that
setting printk_delay_msec as well would be beneficial, as this would
extend its functionality to add delays beyond SYSTEM_RUNNING which is
where boot_delay stops. Unless you mean to use boot_delay as an alias
to an early_param hook for printk_delay?

It seems that there are also differences in behavior between
printk_delay and boot_use, with printk_delay unconditionally adding
delays to all printks, and delay_use which considers the loglevel.

With this approach, existing delay_use users will have the
inconvenience of having printk delays post SYSTEM_RUNNING. However, as
this is a DEBUG_KERNEL feature, maybe we don't need to preserve
behavior. Additionally, with the proposed changes for moving the
delays from printk time to console_flush_one_record time, the impact
for an uninformed user isn't as drastic.


>
>    2. Move printk_delay() from vprintk_emit() to
>       console_emit_next_record() and nbcon_emit_next_record().
>
>       For nbcon console, even better would be to use a sleeping
>       wait in nbcon_kthread_func(). But it would need some
>       changes to call it only when a record was really emitted.
>       Also we would need to use the busy wait in
>       __nbcon_atomic_flush_pending_con().

This makes sense.

If the use case (in a post kthread printk thread world), is only
relevant for graphical consoles, then I do wonder if printk_delay and
boot_delay can be replaced with a more specific solution? Now that we
have printk threads, the time in which a printk is presented to the
user may not relate to when it was created, and I fear people may
continue to debug issues that rely on that assumption.

I think the most pragmatic solution for now is:
- Move the printk delay to the point where the printk is actually
printed (e.g. console_flush_one_record and descendants)
- Add an early_param to allow for printk_delay_msec to be set
- Deprecate boot_delay, by using it as an alias for setting
printk_delay_msec, and include a user mesage that it is being
deprecated and that it now extends to beyond boot (which could impact
performance on non PREEMPT_RT and non nbcon systems)
- Update printk_delay function to use the appropiate mechanism to
delay based on stage of boot and using printk_delay_msec instead of
boot_delay.

If that makes sense I can fashion a patchset.

>
> IMHO, the only drawback might be that the delay might be multiplied
> when more consoles are registered. But I would ignore it. People
> would use this option only when the graphical console is the only
> one. It does not make sense for serial or network consoles.
>
> Best Regards,
> Petr

Thanks,

Andrew Murray

