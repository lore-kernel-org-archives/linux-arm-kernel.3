Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED1DCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 09:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpzoZAFKRYAZK0vmypXj69JCTnwzveyOnoaIj0OblW4=; b=JkzMt7v3vQuK6d1+wtUW1nHhH8
	+V3VLVkXneTwWNsT/Yc1TZIvU/Ddm1yfmUFhaJjB2Tw8c7LusuAK2pRHePrXrymNZ4nuHmQVMXGUt
	2kbPUI8qA46AFJu5VUyJvK686b4bthRr3SSqWjItA+NmUet/9JVplGFpSs3pS346/dMdobbeQTqcF
	y5jmuuqCY9PWrtUcr8GMvBarteNRmtGzu84jXWowVaaNU+JmaQIdpy0npI8aNojlnx6ComwnL5B0A
	gJVTFpWXQolV57bWeH0A+i3lQ3Obo9M6UmumNCh8MCaAC14CL5txaTGvBv2JiwuA89vGO7AjRDm8j
	x7Bp3Axg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOBSJ-0000000AVbv-0iG6;
	Sat, 16 May 2026 09:37:11 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOBSF-0000000AVak-2pu6;
	Sat, 16 May 2026 09:37:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 23D474E42CBF;
	Sat, 16 May 2026 09:37:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D128C5FF2B;
	Sat, 16 May 2026 09:37:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE5BC11AF8A00;
	Sat, 16 May 2026 11:36:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778924219; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rpzoZAFKRYAZK0vmypXj69JCTnwzveyOnoaIj0OblW4=;
	b=y8w+I41uLf2848/1cF2YmOC2nvTaeFeozSLUnA1DZsM+70KdBbSIuZdwJQPCAtQGcBUfnn
	B6yfpQy0vmRLXp6lkXCcF48W1c3IIM+o2b7qU5mRkDlLxrDiIcvX4igT+kaXtHo51pXxbK
	5xw7kJy1+QLQN/DS0HgHcQ3n5Z1wbuXCdCkyLEw4sOhj1zItQeiMmc2BE6DuGx7/A1uqkd
	RGQFZP08UTuq61i1JKw5d9R5R8TycnkoYhs1B2+Yuv9bDPY9qgHfhRP2PIYQeH71pT1r32
	1jjQdvwzjXkjO/IPTcvcaqBSyVwDezAlVa6X4BTpcGlEWFvgFtHISi4704yhAQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 16 May 2026 11:36:46 +0200
Message-Id: <DIK002QFFNBY.31C3KUX2SQC6W@bootlin.com>
Subject: Re: [RFC PATCH net-next 0/3] net: macb: candidate fixes for silent
 TX stall on BCM2712/RP1
Cc: "Andrea della Porta" <andrea.porta@suse.com>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rpi-kernel@lists.infradead.org>
To: "Lukasz Raczylo" <lukasz@raczylo.com>, <netdev@vger.kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <cover.1777064117.git.lukasz@raczylo.com>
 <20260514215129.33559-1-lukasz@raczylo.com>
In-Reply-To: <20260514215129.33559-1-lukasz@raczylo.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_023707_873315_2FB3B9A8 
X-CRM114-Status: GOOD (  32.20  )
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

Hello Lukasz,

On Thu May 14, 2026 at 11:51 PM CEST, Lukasz Raczylo wrote:
> Andrea, Th=C3=A9o --
>
> Thanks both.  Replying to multiple points in one mail since they
> intersect.

Hum, you forgot some parts of my email to address. The good thing with
interleaved replies is that you see what you need to reply to.
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#use-=
trimmed-interleaved-replies-in-email-discussions

No big deal.

> First a correction to the v1 cover: the "zero events post-patch"
> claim was true only at the user-space watchdog visibility level.
> With patch 3's warn made unconditional (which is what Andrea's
> review re-tested with on v6.19.10), kernel-level evidence on my
> side now matches what Andrea saw -- patches 1 and 2 are partial,
> patch 3 is empirically the load-bearing fix on this platform.
> The v2 cover acknowledges this and reframes.

[...]

> ## Th=C3=A9o -- the four questions on the cover
>
> Welcome to macb maintenance.  Quick answers; raw 1 Hz traces,
> dmesg dumps, and event logs available on request for any of
> these.

Thanks!

>   1. Tx-only or Tx+Rx broken?
[...]

ACK, makes sense

>   2. Recovery: link down/up vs module reload vs power cycle?
[...]

ACK, makes sense

>   3. TSO / SG / EEE disabling helped some reporters?
>
>      Mixed picture, with one gap in my matrix.
>
>      Tested fleet-wide since 2026-04-24 as baseline before this
>      series:
>        * EEE off (--set-eee end0 eee off + advertise 0x0)
>        * TSO off (-K tso off)
>        * GSO off (-K gso off)
>        * RX/TX rings 4096/2048 (default 512)
>        * IRQ affinity moved off CPU0 to CPU3
>        * CPU governor schedutil (default) -- earlier tested
>          performance, no change
>        * qdisc fq -> pfifo_fast
>
>      With all of those, the stall still fires.  Pre-patch
>      fleet rate was multiple per hour with these knobs already
>      applied.
>
>      Untested by me: TSO + SG (scatter-gather, NETIF_F_SG) off
>      *together*.  That is the specific combination rtheobald
>      (cilium#43198 comment 4188846955) and the launchpad
>      commenter (#34) report as masking the stall -- "must be
>      both, not just one".  I tested TSO + GSO, not TSO + SG.
>
>      Both patch 1 (PCIe-fabric race on TSTART) and patch 2
>      (peripheral DMA retirement race on TX_USED) are
>      consistent with descriptor-fragment-path interactions
>      that SG-off would mask, so the workaround being real
>      isn't surprising.  Closing the race rather than masking
>      it should still be the right thing for mainline.  Happy
>      to canary-test TSO+SG-off on one node if you want the
>      data point before v2 review.

Honestly I was surprised by that comment and doubted it. I don't see how
those could be related. Don't bother testing the full matrix too much.

>   4. cdns,*-max-pipe DT props -- lead dead?
[...]

ACK makes sense

> ## My own audit -- two issues v2 fixes
>
> Worth disclosing before someone else catches them.
>
>   * Patch 2 (v1) reads ISR in macb_tx_poll(), masks off
>     everything except TCOMP, and discards the rest.
>     raspberrypi_rp1_config does not set
>     MACB_CAPS_ISR_CLEAR_ON_WRITE -- the driver assumes
>     read-clear ISR semantics on RP1, and macb_interrupt()
>     relies on processing every bit it reads in one pass for
>     that case to be correct.  My v1 patch breaks that contract:
>     any RCOMP / ROVR / TXUBR / etc. set in ISR at the moment of
>     my read is silently consumed and never processed.  RCOMP
>     being lost is the worst case (RX completion never scheduled
>     until something else asserts the line).  Race window is
>     ~200-500 ns per macb_tx_poll completion; significant at
>     moderate-to-heavy RX load on a level-triggered IRQ where
>     the consumed bit drops the line before GIC delivery.

Careful, you mention your raspberrypi_rp1_config doesn't set
MACB_CAPS_ISR_CLEAR_ON_WRITE but there is a catch: we expect that cap
to come from runtime discovery, see macb_configure_caps() and
register DCFG1/0x0280.

My understanding is that read-to-clear is only for old variants and all
modern MACB/GEM instances use write-to-clear.

I don't expect your RP1 HW uses R2C; my past comment was about making
sure you support both W2C and R2C to avoid breaking the driver for
some.

We have `dev_dbg(..., "Cadence caps 0x%08x\n", bp->caps)` to dump caps,
including the runtime detected ones.

>     v2 patch 2 drops the ISR read entirely and substitutes
>     (void)queue_readl(queue, IMR).  IMR is the read-only mask
>     mirror, no side effects, still flushes prior peripheral
>     DMA writes via PCIe ordering.  Loses the "directly sample
>     latched TCOMP" half of v1's claim; keeps the PCIe-barrier
>     half (which is the half that actually addresses the
>     documented race in the existing macb_tx_complete_pending()
>     rmb() comment).
>
>   * Patch 3 (v1) boot-time false positive described above to
>     Andrea.  v2 fixes:
>
>       - netif_carrier_ok() gate -- no carrier, no completion is
>         possible, don't fire.
>
>       - tracks tail movement via a bool tx_stall_tail_moved set
>         by macb_tx_complete() under tx_ptr_lock when tail
>         advances, cleared by the watchdog tick on the same
>         lock.  Form suggested by pelwell when he reviewed the
>         same series anchored against rpi-6.18.y at
>         raspberrypi/linux#7340 (merged 2026-05-08); 13 days of
>         fleet runtime in this form since 2026-05-02 across 24
>         nodes.  Folded into mainline v2 patch 3 directly rather
>         than carried as a fix-up.
>
>       - netdev_warn_once -> netdev_warn_ratelimited per
>         Andrea's ask -- operator visibility doesn't disappear
>         after the first fire.
>
>
> ## v2 follows
>
> Sending [PATCH net-next v2 0/3] threaded under the v1 cover
> shortly.  Plan to drop "RFC" from the subject prefix (~3 weeks
> production runtime + the rpi in-tree merge tip the balance
> toward a regular PATCH); happy to revert to RFC if you'd
> prefer the iterative-review cadence.
[...]

So you skimmed over two parts of my initial comment:

 - Upstream kernel? From your messages it seems you only build test.
   My question is two-fold:

    - (1) Can we confirm the bug reproduces on upstream?

    - (2) For my personal knowledge, can you tell me why everyone uses
      the Raspberry Pi vendor kernel? I see an upstream DT for rpi5.
      I'll boot one on my desk next week (hopefully).

 - .ndo_tx_timeout() is probably the right approach for [3/3].

---

My recommandation would be this:

Let's get a .ndo_tx_timeout() implementation merged that will mitigate
the issue. If you can prove [1/3] and/or [2/3] are useful, then we can
get those in as well. Otherwise we drop them and keep digging to find
the Tx stall reason(s).

Those are bug-fixes, HW is broken-ish for a good chunk of users, so they
should target net and not net-next. You need a `Fixes:` trailer, it
will probably date back a long way.

Thanks Lukasz!

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


