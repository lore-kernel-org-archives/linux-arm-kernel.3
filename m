Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7436C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 17:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67X5LYINdi0M9S36BvC7qBNu0eKXvr2elw+XJ07fWOc=; b=ge0m4PCWhWC6gzwZbcFmIqWKoS
	0xOCHSUqe5I+YG3LzVVGCkLbg/G6Hhp3SX+yvzhqXDgD2ZAvsm4m24h0FDhTiO4ZmXySPEJ0U1TP2
	i8l22GL6Sv2jqsyHm9khz5UUQ5Y8jzoCFLK1LNjsSZ9UTP/U7P5GCuRVRBr9J7qSea55tLL5SzhfH
	bK/CBFUfMHDIhHmfMoYJMVWO/bIPLzL30Gj+guCSGw34yo5tIl3KSb4O11ot+vxPC6TKcWJY5Q8Jm
	14DajJDaKYppju65TX4evlCtLvw7Kb/rYSAcXQTCqgCojv2OrK/EMV9VHqSWapRnloJAax1hP05o7
	LjGv20Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgml2-0000000D9Wj-05iN;
	Mon, 06 Jul 2026 17:05:24 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgml0-0000000D9Vo-2gOo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:05:23 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-48d6c621a67so1490576b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:05:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783357521; cv=none;
        d=google.com; s=arc-20260327;
        b=Tt9L/h/4/LAyXJcAtXfINQUz0RvUoCA3iYk+ScLZLERxGdz3UsmqXAWGZrCm3tT8D2
         /0ayDPXqEqCRt6HXijwIjJwsoyb8KQCeQbbaOY3yOV6+kjnGSj9vS9pgjpJPPNDjAL44
         mQ3Pkhh4DsOQ0mx4oNXnRAVh17OiKcdNPlGbDSE1UsQna0MDPKiJy90L5B5GuiNzDR0L
         SWCR1Em8CtigEovn8t7m8wOOmdGb2CquGQ1TXAOTaNJxt35XQzkYWYw9HYIuWHXUUwDD
         iHd/GdwB61w5f4WvDbHv4POiXgM6HzXVemNcB40I4OjQukqo2XCKdRcu+Bzo1vxm1xYG
         wz8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=67X5LYINdi0M9S36BvC7qBNu0eKXvr2elw+XJ07fWOc=;
        fh=2kHlRZcQccZDcsyjsRIfdDb1zCM+/1vd/XLh7GtGCQE=;
        b=ZdoRBT6/2jSGa2X0CQE2ovhrGQbClGtSd+zDfB1y8mnwBo3Bcr1obiOyNPs8wWm6QI
         GoHk+FhAZ/Jv1I8VRHyna6/5zayKghQGqKqvk1toHaNkv0hwAKf3cCpYGg5IqzgxE3gu
         JFmdDxjRQueSWSENLQd1Aq6DiG6z0ACqa8ORRWoujE5bRdx+sAZWOTX3DOrCIOnKyKw7
         2b5KzQN1zpItdenmz/A3opT27/Cczt/nYZc5M76olhKJPuU60K5Qg5cqa0I4vfTORs3G
         ea/9VteGzt0MCPTba4IAB626bhV38vjyBHnIeBJIyeoH5UNFSmpzmL+zdOyB+vxkCwR5
         FEQQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783357521; x=1783962321; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=67X5LYINdi0M9S36BvC7qBNu0eKXvr2elw+XJ07fWOc=;
        b=qYRoSv6R1cZnPfMvIUtOAYDyuikyVB3cqAxCLkLNZMq0FD5ZBPZtIGbz/s7MIYD7Ng
         Rq5SDSQpfUfLNfI+ExLNFKFADcI7nsyGoeBrRT1SVRo+/0yxhXRJUOmtaMiX9Eg6VIBm
         7KLNE2Zp5ny3wd8g4BnxK5mCU0A418T51HzMjFbWhiTkvlc5x6sXLwfFdSR4PsBjge+D
         3O9//vSCZCXBray/nKEj/KuoW1Y4iPamHNr857Xmp4B7SajZ2m9hpU9TGWDbf8Omsz2C
         MP5/1S3Fy50wfIsZcWuI/Oe7mKxw3XQxKNt1QhJsZgLbkgwzTJNkarkNVlXa6V3FFxC3
         cLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357521; x=1783962321;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67X5LYINdi0M9S36BvC7qBNu0eKXvr2elw+XJ07fWOc=;
        b=QHnoYzA/ogQqFdmEQSdPL9DHBHfMnGcPjwgtKVNhCPJhG3/c+d88TLVvl5liJ+zkOQ
         330xWnDIvN6zd1JCzkjQ3TfhE0wSoBDndLV9gR1w6O40/flc186GRnpiSq972i9PaGhJ
         as35XBQO5NTDNnauJ43n489O8vCAR1zSSdDeXi0efJhFnWaUGdQ8j+hEHIlOSvdnFOCv
         oJuWxARPUy01iLQ9C4JiXYzANwoA8e1UXSzDVmJC3lJdEeWHjG+hUZoBGrn+1ZGutp9Y
         sNW6FFLqqxXPyZ9BKSCOg4cvaDhq4Np6mtEq5WOIa11yY+LTvvwVSDqPA2ipcu1XX9xO
         drtg==
X-Forwarded-Encrypted: i=1; AFNElJ8WelPwTT3lOfUBb+8P2bFJG1tQcmHJipTeRx+1iOP8bi8RIEhV/B2oKwpFJRdLIs3hyV82liqx0ucXuzkqVyDY@lists.infradead.org
X-Gm-Message-State: AOJu0YwnF2ygTd7mPekbyKLx9HGzUe9dTqtTxwe4SnBLAnxAMhn8lqj1
	LwZtiMbCnBz/+OwEUF2+1ku/Zoa0yBV/zf1gkP5nTOCUvSBFnwlDHudybbzEWNjeYfXeEHqKh5N
	9Ph9qlW99Rz1VffoVEV5PKRhQRff0Q3SjxtZPV2JnLg==
X-Gm-Gg: AfdE7cmubGdk5137wnlf0m7irmNhCaFIihh6xwOtudw4+BnA94xfNPIPZPw/NBCancA
	4QnSq7piolhl3JhMGDJ72P8D0YVeiYV2brpdaebduVuPjqpVy473Luq5YTaBcCEiE/wQpSkwYMh
	hs8VXkXcWYtq3tSzQkugX5fLnx9Wd0oU88etDFjYGb08Tj5loeDuvlYwTUOnbP/UbIF1Yq0rLlB
	8VBC8cYC5zC0o4L8Y6Be+GkoEP2ZpIHbUMW5HtDjRJBN8aHwcujeOfv7tcZzk1t9Nef9KKpg58y
	EGyjCBsHycL52hC/pYmvQnQoC/573rpN3UfvD9xlbRlqLSyEAR5PaiAO4SHhzbg+FlNbWQKt71w
	AHOswgrJ51Q65PmnlsE9KJ+IqmHxA
X-Received: by 2002:a05:6808:d51:b0:489:f088:5f70 with SMTP id
 5614622812f47-49fdc43fd75mr863942b6e.12.1783357518923; Mon, 06 Jul 2026
 10:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk> <20260703165654.71be8707@mitra>
In-Reply-To: <20260703165654.71be8707@mitra>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Mon, 6 Jul 2026 18:05:06 +0100
X-Gm-Features: AVVi8CcK4KThiGNbLieHoBIY_N240yIFnZsI-soA1OiCf8SyfTEOi9AvBW_Bzmk
Message-ID: <CALqELGz-KSrGq5JYvLedZiO-p21pjpRKbceO+jiSfwZGyx+91Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] printk: nbcon: move printk_delay to console
 emiting code
To: Benedikt Spranger <b.spranger@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_100522_681302_5610288F 
X-CRM114-Status: GOOD (  27.83  )
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

Hi Benedikt,

On Fri, 3 Jul 2026 at 15:56, Benedikt Spranger <b.spranger@linutronix.de> wrote:
>
> On Tue, 30 Jun 2026 17:35:59 +0100
> Andrew Murray <amurray@thegoodpenguin.co.uk> wrote:
>
> > The printk_delay and boot_delay features are helpful for debugging
> > as kernel output can be slowed down during boot allowing messages to
> > be seen before scrolling off the screen, or to correlate timing
> > between some physical event and console output.
> By now, it slows down the boot process, which is the handy part of that
> feature.
>
> > However, since the introduction of nbcon and the legacy printer thread
> > for PREEMPT_RT kernels, printk records are now emited to the console
> > asynchronously to the caller of printk. Thus, any printk delay added
> > by boot_delay/printk_delay continues to slow down the calling process
> > but may not have any impact to the rate in which records are emited
> > to the console.
> Using this feature to slow down the boot/suspend/resume process and
> implicit make printk() happen, is the usefull part of that feature.
> Imagine this sequence (which hit me on suspend/resume on i.MX after
> shutting down all secondary CPUs)
>
>   printk("A");
>   (do some stuff)
>   printk("B");
>   read from peripheral --> system got stuck here since peripheral was
>   not clocked or powered or both any more.
>
> The delay (and later on a ugly patch to make printk() synchrounous)
> helped to locate where the failed access happend. JTAG did not help,
> since the CPU got stuck --> no JTAG communication to that CPU.

I understand the use-case, you sprinkle printk's so you can find the
point where a read to a register causes the CPU to stop. This requires
that the printk happens before the read, and the output from the
printk is printed before the read.


>
> With your purposed change you *may* see "A", but never "B".
> Quite challenging...

At present you may see 'A' and you may see 'B'.

Prior to the changes in this patchset, and assuming an nbcon console
(which may not be your usecase, but is perhaps representative of
future use-cases), then the printk delay will always happen within the
call to printk (and always before emitting). However, depending on the
context, that printk call may return (and proceed to your CPU halting
register read), before the message is actually emitted to the console.
I.e. it's a race.

This series moves the delay to the emit side, as well as moving the
delay after the emit. Thus the calling code may make progress more
quickly, but depending on the context, it may also flush/emit before
returning from printk.

In my view, with or without this series, there are no guarantees that
you will see 'A' and 'B'. And in any case, achieving the functionality
for debugging required you to modify the printk anyway.


>
> So please leave the delay on the calling side - it is helpfull there.

If you want to ensure printk is synchronous, perhaps you could call
nbcon_cpu_emergency_enter() prior to your printk, or perhaps there are
already printk wrappers that do somthing similar whilst debugging?
Would that provide a more reliable way to guarantee output?

Thanks,

Andrew Murray

>
> Regards
>     Bene Spranger

