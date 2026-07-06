Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84A0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 19:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Content-Transfer-Encoding:Message-ID:Subject:Cc:To:From:In-Reply-To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=+yaV2nYwgAaxNIV72gm61ALSOYBmm7bDIUElv0EL4As=; b=QuZL+5CUjxa6RWsAKVkF3sSYbU
	0tmunJuUneZQG1XWe7aaOIhBU7ZM8oGXiLHdUnUHpQkIe0qtGnxyqEbHJ6qYvaUOHKpJ2nuLKL+DI
	6Ua7b/h6ocbslceLMy00sCZk19bdKANoLRDxQhUmY4AR4I+nS6Wt88duLhaegNEuDayuVszO5tOXC
	Q5b37K6qQUA86Ypr3t6oMdtIROFSbfsLZKSBrzBR+i5Q/98nJQEdpq1k/Q4xFLdP62GnhvpBTZgtc
	mtYiy8JUyeQjGjuG0ErlhqMxEAnv4WR5Gikgbdh+hVCYKVgwB5KPV35xDh+EwvOvXEvux8q+KEpXz
	iksXqYcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgp6V-0000000DSvf-3Cuf;
	Mon, 06 Jul 2026 19:35:43 +0000
Received: from a9-19.smtp-out.amazonses.com ([54.240.9.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgp6S-0000000DSv4-3xjn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 19:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=c127.dev; t=1783366537;
	h=In-Reply-To:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=+yaV2nYwgAaxNIV72gm61ALSOYBmm7bDIUElv0EL4As=;
	b=hL0wCrsmMvM/WL3klErCI7+e6LOjEUUctPNEZaFkHnTRBojfAVNZrLQMzvq1Mwhm
	bhJTmtTGMYZ2Xg5XTwzuLXCUW5jY4sg7JTmzPlFMqQCXd/x+lveUo+Es1081OR1wrBO
	jB+MwlBXsKA/oYmVCdWHcps6XG4e8J/XFBk4hS8c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1783366537;
	h=In-Reply-To:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=+yaV2nYwgAaxNIV72gm61ALSOYBmm7bDIUElv0EL4As=;
	b=gVnWzwzwHjUX9eiYko7eUirjGQIErf3nRIOYjarUqELpOAatA3LR7ojnEBez5MT5
	WdsfIlUvD2FVQALsgRhw605ngZ4vLE7iOdb6NclAoB7FqJb3wBBzk4i077i8kwn7tqy
	G5igf6jTNVFWPmAQ5hRv3IfX+2Kpgnh+wSRtxd6s=
In-Reply-To: <akuLzI9GVGn4eI1j@boxer>
From: Johan Alvarado <contact@c127.dev>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, Jose.Abreu@synopsys.com, pavel@ucw.cz, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: raise TX completion interrupt at the
 end of an xmit burst
Message-ID: <0100019f38edce40-fcb1cb45-6136-4563-8289-df75ca13eaa1-000000@email.amazonses.com>
Content-Transfer-Encoding: 7bit
Date: Mon, 6 Jul 2026 19:35:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.us-east-1.z4rHY0qbNtjoW80ZyzVy+DEul17RQEOMT7FC66S60ffkhLWkV35D8ZWXVyxJY1/89bAuLCem4GFJq1VXsxM0u6ZfZbvT1qSjDUeuZG9/Lxk1uINIqi7CenEa93u+fNllqnJMZ0quaBrclhnmtzdFllG4KHSjZOEcaGLa1BWoSpA=:1.us-east-1.epbACCJLarUaEI78XZoGREJ9LamRjxMH5pM2kZb64rA=:AmazonSES
X-SES-Outgoing: 2026.07.06-54.240.9.19
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_123541_105676_FD8F9809 
X-CRM114-Status: GOOD (  18.84  )
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

On Mon, Jul 06, 2026 at 01:04:44PM +0200, Maciej Fijalkowski wrote:
> Very messy thread. To reiterate - does tx coalescing do any good in this
> driver?

It does, but today only for traffic that queues deeply enough. Within an
xmit_more batch the frame counter reduces the IC density to one descriptor
per tx_coal_frames, and that keeps working with this patch applied: in the
447 Mbit/s test from the changelog the NIC raised ~3.3k IRQs/s for ~40 kpps
on the wire, i.e. roughly 12 packets per interrupt, because qdisc bulk
dequeue, TSO and the intra-batch frame counter still coalesce. What was
broken is only the case where a flow never accumulates tx_coal_frames
in-flight frames; there the timer was the sole completion mechanism.

> I did some digging and seems there was a rework of coalescing in 2018 and
> then some more polishing happened in 2023 (net: stmmac: improve TX timer
> arm logic).

The 2023 change only avoids re-arming the timer while NAPI is already
scheduled, which helps the loaded case. For a lightly queued flow NAPI is
idle, so the timer still gets armed and the completion still waits out the
full tx_coal_timer. That is the path this patch addresses.

> Wouldn't your change imply that tx coalescing could be dropped altogether?
> I do agree that each single batch of tx descs should be signalled with ic
> bit at the end.

I don't think it can be dropped, for one correctness reason and two
practical ones.

The correctness one: the frame counter enforces an upper bound of
tx_coal_frames descriptors on the distance between IC bits in the TX ring.
If coalescing were dropped and the IC bit only set on batch tails, that
distance becomes unbounded, and a batch larger than the ring can fill it
without a single IC descriptor: every frame queued had xmit_more set, and
the tail frame that would have carried the IC bit is never queued because
stmmac_xmit stops the queue first. The hardware drains the entire ring
without raising a completion interrupt, and only the coalesce timer can
restart the queue - reintroducing the same timer-bound stall this patch
removes, now on the bulk path and once per ring drain. With the bound in
place a full ring always contains at least dma_tx_size / tx_coal_frames
completion points; even the minimum 64-descriptor ring (DMA_MIN_TX_SIZE)
still holds two.

The practical ones: the frame counter is what keeps IC density low inside
large batches (one IC per 25 descriptors rather than a single one at the
tail with nothing in between), and tx-frames / tx-usecs are user-visible
ethtool knobs on this driver that users can rely on.

Dropping the frame/timer machinery would also be a rework rather than a
fix. If there is appetite for that I would rather keep this patch minimal
for net and discuss a rework separately for net-next.

Best regards,
Johan

