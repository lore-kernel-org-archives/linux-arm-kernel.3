Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60056CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Nov 2025 11:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPPSeu511L0k6gL1IYpux6jfrEM3Z2mSgCdofcykt0M=; b=cecriPR1xacoSEOk3t9xb9NBef
	GcIpWLhjP4itRmNALnWFJ66I9RXdiE+wevi9vpedqG8fgnMk+ysY97SVwMw890Q7a7jot8m6J0epU
	xy/NjH0RFq9HyoGG7vO2PFE+DwUP2TwSue0kHHVI5oabZ0QMmErkhqVYv/LWzPgd3+LaFmE7Oe/Zt
	eMWQLUGWw/LEPajV90tzk6CdWmwSwTt7yarYzzvTeruPehZk7uWiBYJA1ymAnI8MIQqL7+DAfWzit
	7ZB+spiqeIMbn/xUMagBJ+sBlyT0atOIGfexYnSgkvfkBPIqRE7e4JIY3y796Ub9JmpmGSMmTnWFU
	1/1hpknw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPfTW-00000002Fnl-37Ap;
	Sun, 30 Nov 2025 11:20:18 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPfTU-00000002FnC-0ENu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Nov 2025 11:20:17 +0000
Date: Sun, 30 Nov 2025 12:20:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764501610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gPPSeu511L0k6gL1IYpux6jfrEM3Z2mSgCdofcykt0M=;
	b=H/O9ZzYiHw/2G2WBqoGZ3K3FPLNuLrAWvk4v/z+wfncXBs075k6aX+F8Iqp8Vgp+LcjyHC
	z1G/MHOyvAh7TA4mK+eXChXlqCIy+EZvNiofVHBTXaCED1jIhLqVlWUxXvtoHpu1Ah9S2e
	F9JX+agQqQ/wqp8/A44N9X3E6LhxoLVaz+GSa+Dj2DBQ++P2UMEGoJSFjvRTB6wNi21E8W
	3esGxnfRtGW9Xy9r7VrNCc6RRigIODj87/eRuf/oAicuV8uZFco5gHUlYiB3CiXIVKxoYP
	MZ7+6xcVMAYjC7Z8e8XAfZYx6UOUYsx3qf+zjw3RwTW8FcJLWYP9IkNoABFSNQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764501610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gPPSeu511L0k6gL1IYpux6jfrEM3Z2mSgCdofcykt0M=;
	b=8RrraBCZU5plsGR6xmde28IoY0RzxSIbtXdVMZm7XVpNQnachUBhpN47q/W3YXgJIb0ERh
	gNxYivhVx7Dx+TBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Xie Yuanbin <xieyuanbin1@huawei.com>, akpm@linux-foundation.org,
	arnd@arndb.de, brauner@kernel.org, david.laight@runbox.com,
	hch@lst.de, jack@suse.com, kuninori.morimoto.gx@renesas.com,
	liaohua4@huawei.com, lilinjie8@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com, marc.zyngier@arm.com, nico@fluxnic.net,
	pangliyuan1@huawei.com, pfalcato@suse.de, punitagrawal@gmail.com,
	rjw@rjwysocki.net, rppt@kernel.org, tony@atomide.com,
	vbabka@suse.cz, viro@zeniv.linux.org.uk, wangkefeng.wang@huawei.com,
	will@kernel.org, wozizhi@huaweicloud.com
Subject: Re: [RFC PATCH v2 1/2] ARM/mm/fault: always goto bad_area when
 handling with page faults of kernel address
Message-ID: <20251130112008.DZYHlSPm@linutronix.de>
References: <20251127145127.qUXs_UAE@linutronix.de>
 <20251128022756.9973-1-xieyuanbin1@huawei.com>
 <20251128120359.Xc09qn1W@linutronix.de>
 <aSnVXrnuY9QKjTKg@shell.armlinux.org.uk>
 <20251128172242.cCNBVf7H@linutronix.de>
 <aSndJ1EYUnMGsUYX@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aSndJ1EYUnMGsUYX@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_032016_241776_A0575F07 
X-CRM114-Status: GOOD (  25.81  )
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

On 2025-11-28 17:34:31 [+0000], Russell King (Oracle) wrote:
> On Fri, Nov 28, 2025 at 06:22:42PM +0100, Sebastian Andrzej Siewior wrote:
> > On 2025-11-28 17:01:18 [+0000], Russell King (Oracle) wrote:
> > > > I hope Russell will add them once he gets to it. They got reviewed, I
> > > > added them to the patch system.
> > > 
> > > I'm not sure which patches you're talking about, but discussion is
> > > still ongoing, so it would be greatly premature to merge anything.
> > 
> > This thread
> > 	https://lore.kernel.org/all/20251110145555.2555055-1-bigeasy@linutronix.de/
> > 
> > and the patches are 9459/1 to 9463/1 in your patch system. They address
> > other issues, not this one.
> 
> Oh, the branch predictor issue. Yea, I'm not keen on changing that
> because I'm not sure if it's correct (the knowledge for this has
> long since evaporated.) There have been multiple attempts at fixing
> this in the past, and I've previously pointed out problems with
> them when I _did_ have the knowledge. Have you looked back in the
> archives to see whether any of that feedback I've given in the past
> is relevant?

I dug up the emails from 2021, 2019 and you complained that I open the
interrupts too early. Now I moved the invocation of hardening the branch
predictor to happen before the interrupts are enabled. Based on that it
should not raise to any complains.

> > So Will suggested to let change the handler and handle this case. The
> > other patch is avoiding handling addr > TASK_SIZE.
> > Any preferences from your side?
> 
> ... and now we have a new proposal from Linus. I'm not intending to
> do anything on this new problem until the discussion calms down and
> we stop getting new solutions.

Okay. If we could please sort out the first part then it might be easier
to move on here once the dust settled.

Sebastian

