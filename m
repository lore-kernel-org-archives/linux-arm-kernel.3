Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856A9C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 01:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W82d9TdM4QvB5O4Aqa9vRwclhY+zrfjcDgkX82FRBxI=; b=rdpxdOmr1l3SYeITyFcVUZhgK3
	6B5m8z+2ub1l/dNf4zzVzJ6sO1xiIGAvhDdIeySIHRt/qmGN5pUa1b7jVm1hLz7AnfbSFuhjvSq4a
	pz2NqVNo7zL3r+eOdFql8ORNXDZignJCm559VQaMsA+WRbV2j8vDBaqSTonjnvOTbpe3ua6CrMSpm
	F8kfh+v5Q/YghaOd/1VNbQpRmNzU9mIal6QhsjdRhaBeXFK3lYWJh9g6/prv2M/VZG8aoJes/iHCF
	hyF2PQyfZp1f9xkhYqMJNcPNyGF+SXskBZSqzvqk0uFpaXINlIE/bHvwWqiTibfXtX92exrFuGMKi
	Hdv89xGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwVE8-00000008pyd-2ZFh;
	Wed, 19 Aug 2026 01:36:24 +0000
Received: from flow-a4-smtp.messagingengine.com ([103.168.172.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwVE5-00000008pxz-0bmU;
	Wed, 19 Aug 2026 01:36:23 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id D3AA113801C1;
	Tue, 18 Aug 2026 21:36:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 18 Aug 2026 21:36:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1787103376; x=
	1787106976; bh=W82d9TdM4QvB5O4Aqa9vRwclhY+zrfjcDgkX82FRBxI=; b=A
	0hgbFGg9siCRd5/x57OrVwiXiqFiMBqNUNYPy+2XLL4xdoqBAGx9L362OwqEzblO
	YovPIySygwdsLmSpsKOIOzNmeqgm/x8H71E39/YAvu2fTTtU2pZNXEZ/kRk6nTDR
	3azCVb1CKVjne5gPmxf6D40Nj65mBuL6vb+itGEg9M0NdzmlvnsOn3Rc6gwC0q/6
	taBMIAMj/lkjEW46QiVDfwPPrsqYBs/aWS4ZJs21Hiden4oXa6z8ykzk3S6YoWvj
	mGA0+YCMm71rP44X0inPMdPd5Df+jP3ninCQG3pDNb7rGdvhcrQUz/qes3mPcakr
	TXVSabncnjl42t4aRRK9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1787103376; x=1787106976; bh=W
	82d9TdM4QvB5O4Aqa9vRwclhY+zrfjcDgkX82FRBxI=; b=Id3iv2BQA8ISYaN+c
	UYNAMZRnIskwTdeUy09KhNYmhpvayJQTaIDhoRZJLNsvVuNveu2fs9nmHzlcpp36
	LDYOdcVL2PteSVqveEjzQOALNe5YbItZ9uL4qrJJkbHw0azRqCty0VYiDSKa29X8
	50hR9KZ6wOCgt48GbWh+H8sDoiMWWRUH9fnhziuGDAsFeEJ9cu++ygPoQkFaaTvg
	RM15ZnowAwjS1mXyJxpcA0i29ZDOodFvUpCexErnxtc/VxO6/xBtQSp0ZKGM4vQ+
	4aS0A+S0H+jQm2MEBIxR/qyT1j5xLtCyoVfH1ZSHuyMWqAx2lacTi8fyukxQhsFd
	SUB5A==
X-ME-Sender: <xms:jgiFakpnkwMZP0AVdhtNUTk9PmeilgWRA6-gtexwLYAjKN116uwSNw>
    <xme:jgiFai2HORtG3ATiT0jkykTZal5fp7jIoUerbq5MkntGejWiVeJtZhhFzR_ztZ6NT
    FcBGHtgfp5Ss0Dl4X0HNK6b6BUMxs8EbnBemfN_ko5iotBvlRTRd38>
X-ME-Received: <xmr:jgiFaky-53PfQN7ylBjsqS7yxAaVniSiYQ4SxjExucP0v_SKLqwrHmjcfqXzp3HcO5w3H4JcOHYC>
X-ME-Proxy-Cause: dmFkZTFJlow7ZIObXzXNDK8Gm7fvSajn6CpgYcNeN2YqXc1FBAH3xEc0L6H/uuRiMPvvjb
    vKruD6b0SxiJkrF4ihv5j081zZMpmv0Mmknq2O0bnyskDLSNMfYKMObn0tHjCqIE6hTfn+
    Gr1r+uZRze9PQIHPWX3G+l4WADWb6trkAxpMYbjWTh79KWwF4yjYCrikKfkpxBCcwBwIH6
    iHNMOa+SEWgsm9yK+Fha2R3m+uF+bydhmn/h2aAmlWaQ/vcVWFGnqMkB1ubUql8WNBa3gm
    IR4d6ZrKmHa8bucmMpnHMa9a+MbauXg4QGjKT4u/QEu9EAk7VjO+AVPFgoFs19MeHWfcLt
    eFwdUgsVdJiePd+zayyDpTwrK2+8CsUWbhoo2cgySk4v463tP/aHk4KymxckhGxr0Hmw57
    h23BjeqMjFVa5qkwIyxP8Casbh+/aHG/GiiJm4arNyf1A27khSS2Qduw+tOK8403z9xslt
    2Pm7caxkEY3sl7RjDNZnYOCLmSHxH06iNw7GFSwWGeHkzB5+BD29gMsM3i279K9+sXcE9J
    cy3AB5perxLXzuUeKqF+FRYQF7cKEnf8aePLX4l9bodFo5tO2dl3JzeBM9OrVuDJF1c1ko
    eZXDn5nreIxfcyaCxfLwTRpn8FkdrdlZP7m+7KLuhVa2M4NDNDOOmtuf3zaA
X-ME-Proxy: <xmx:jgiFamjULEfm3a4a-JNEiOFuXAVJoNHvayIvunEpcn6eilXo3izcjg>
    <xmx:jgiFavojGow0eZeInEg_bdc7P3XRKg94GIKMpfRAtEI6cQzlcM8HiA>
    <xmx:jgiFaljA0BCi25gfhatgpi5VNjVa7jV8Y2M2Guw4Pf0hzKJEZigz9g>
    <xmx:jgiFapMQnCbwQTJwFCridH5vBw1L7rTqG4hQ-ziGrJdQJygs7heSXg>
    <xmx:kAiFahIPiXZudNeGa5FtZOyvB98kJfOACEkdAtsjgUVsn8xQROrNAiPY>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Aug 2026 21:36:12 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: royalnet026@gmail.com
Cc: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	chaoyi.chen@rock-chips.com,
	alchark@flipper.net,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 02/12] accel/rocket: wait for a running IRQ handler before resetting a core
Date: Wed, 19 Aug 2026 13:36:09 +1200
Message-ID: <20260819013609.1613919-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAEWPSH7tM9WQUJ0H13ghkiHGzDcdycC1syTuO5B8DpC6cUSnfg@mail.gmail.com>
References: <CAEWPSH7tM9WQUJ0H13ghkiHGzDcdycC1syTuO5B8DpC6cUSnfg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_183621_757296_3FC14569 
X-CRM114-Status: GOOD (  16.25  )
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

Hi Igor,

I checked all of it against the tree and it holds.

The lockdep point goes in the commit message. That the wait is on a
waitqueue rather than a lock, so nothing would have reported the deadlock,
is a better argument for the placement than mine.

Masking before the sync, yes. INTERRUPT_MASK is armed in hw_submit and
cleared only in the hardirq, and rocket_reset never touches it, so on an
ordinary timeout it is live. Your line numbers are next-20260814 and mine
have the series on top, so here it is rocket_job.c:165 and :499. I agree
it is not a hole and that reset.pending already closes the resubmit
branch. I want the sentence the patch adds to be true on its own, not true
because something else prevents the case.

The runtime PM facts are right. rocket_job_is_idle is atomic_read on
credit_count, runtime_suspend returns -EBUSY only on that and then drops
the clocks, and drm_sched_stop zeroes the counter until drm_sched_start at
the end of the reset. The driver does claim idle for the whole body while
holding nothing, and the two puts differ the way you describe.

I am not folding that into 2/12. It changes behaviour in the shared path
instead of adding a fence, and on this SoC it meets a power domain that
cycles a bus reset on power-on, so it wants its own patch and a board run.
It is next in the reset path either way.

Your question. MMU_DTE_ADDR predates the rail by about a hundred rounds.
The entry after a timed out job has come back at one constant with that
reset error beside it since round 138, recorded in the paper and the
log-book, and the rail moved to domain-supply in round 241.

One near counterexample, since you would find it. The round before the one
in the cover letter timed a job out and logged no MMU_DTE_ADDR. It had no
job after the timeout, because the shape that times out runs last on
purpose, so the attach never happened. Your first bullet from the other
side.

I ran your test on the archive. The run with the two MMU_DTE_ADDR lines
has zero "stall request timed out" and zero "paging request timed out", so
the MMU is not responding at all rather than sitting in a wrong state.

The third bullet is what I will build. If put_noidle leaves the device
active with no idle request pending, the domain never drops between the
failed job and the next one, and the bus reset that 9/12 cycles on
power-on never gets cycled. That fits what I have, including the block
being fine after a reboot and not otherwise. The next image swaps
put_noidle for put_autosuspend, and separately forces a suspend and resume
before the next job, so the two do not confound. You get the result either
way.

Your aside is right and it is not mine. rocket_reset_work is defined,
INIT_WORK'd and never queued, and it is that way in the base this series
sits on, untouched by the twelve.

No tag wanted, for the reason you give.

Jiaxing

