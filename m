Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0B5D2D0E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/t1TqJ/QytQ4pwnW0ti9Z6aH6KsPUuA9eSuB4Dv3RC0=; b=BWLp1cAwXyfGCsWPBwr0ywiUBz
	zVSsvD+laGjvvZY0bO+WDcQ12LB4FtwKt8IWZ6hTcH8fDHPY/OwuAJkRNP8RlpK5eWGAvGgET43Ri
	0aD02F8Gt7dnI2rNqFjGYzqbPb4lNSrKH0tLm2w97UAOfTXTHKTstoNUXSn46GFMkrU9ihsn3icM5
	5rAtXYywvnE3P2Ar++WFFsXMWbeUyVimqrkLNJQSVnUNqYeR3pK9+C3jaUbOXk3dXa4lt8MaTk0Zi
	qqXDOChuQptgu+xL+AANK6V027Ggv5A+9PA1/sSSz+M76AfpkVtXrD34JILGg0d+hBLjhUCx/nLVs
	pashLt5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfczc-000000072nW-0QT7;
	Tue, 13 Jan 2026 11:55:24 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfczZ-000000072mk-0jp2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 11:55:22 +0000
Date: Tue, 13 Jan 2026 12:55:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768305316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/t1TqJ/QytQ4pwnW0ti9Z6aH6KsPUuA9eSuB4Dv3RC0=;
	b=aNUIsG7ODXHBXQCF7fvbI53vWnCXJ7BjljV3qdn53vS+0hFdDKZCyxHxZId/nq+kwqrKGp
	mU8TRE2qBujeQzZswDXy1EFSLk0QKxnBbx+pwdp6D9+GIHN3o5G383gvOiQmcb1Lc+R+0a
	3DmkFkFThf7xlcTikmuVeGpGj+m7xb8DN8TbEtNVVPKghgimbwvH9U3tEXz0qC20XUVGpj
	mLC6/p+Y0rhJZUIih0pLIBLiR0ZMzYxdMoCJy4uE8u0xN+RT7cgVelg1IqgyhhW8mcTBdl
	M7MmhjEV4/VCQTTQVF5rnVnd3Ld6yeGUppFZm8xZTrAZyYxP4s8bEQTcvn4clQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768305316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/t1TqJ/QytQ4pwnW0ti9Z6aH6KsPUuA9eSuB4Dv3RC0=;
	b=IR1pUfTN8KG8eSEJOvT2Nop/9mwi3jU1rVIWE0jaKQ7DjndFPE6lXIzZHIPqNs/IXVoBHv
	mncQ3oCkNt+WuyDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Waiman Long <llong@redhat.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
	Alexei Starovoitov <ast@kernel.org>
Subject: Re: [PATCH] irqchip/gic-v3-its: Don't acquire rt_spin_lock in
 allocate_vpe_l1_table()
Message-ID: <20260113115515.98Mc29Nm@linutronix.de>
References: <20260107215353.75612-1-longman@redhat.com>
 <864iowmrx6.wl-maz@kernel.org>
 <87ms2nsqju.ffs@tglx>
 <86wm1qlq7l.wl-maz@kernel.org>
 <87ecnwij44.ffs@tglx>
 <86v7h8l9ht.wl-maz@kernel.org>
 <40cec799-f363-4642-969b-24f5a2d56dfb@redhat.com>
 <87cy3eg94y.ffs@tglx>
 <5f4bfd8b-8699-4bef-bf49-f29965e95ca4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5f4bfd8b-8699-4bef-bf49-f29965e95ca4@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_035521_360434_EB967B81 
X-CRM114-Status: GOOD (  13.66  )
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

On 2026-01-12 12:14:30 [-0500], Waiman Long wrote:
> On 1/12/26 10:09 AM, Thomas Gleixner wrote:
> > They might be acquired though. Only alloc_pages_nolock() guarantees that
> > no lock is taken IIRC.
> 
> Thanks for the suggestion. I will look into using that for page allocation.
> I had actually attempt to use kmalloc_nolock() to replace kzalloc()
> initially. Even though it removed the call to rmqueue(), but there were
> other spinlocks in the slub code that were still being acquired like the
> local_lock() or the spinlock in the get_random() code. So I gave up using
> that. Anyway, kmalloc_nolock() doesn't seem to be fully working yet.

with kmalloc_nolock() you have to be able to deal with a NULL pointer.
Looking at kmalloc_nolock(), it has this (in_nmi() || in_hardirq())
check on PREEMPT_RT. The reasoning was unconditional raw_spinlock_t
locking and bad lock-owner recording for hardirq.
There was a trylock path for local_lock to make it work from atomic
context. But from what I can tell this goes
  kmalloc_nolock_noprof() -> __slab_alloc_node() -> __slab_alloc() ->
  ___slab_alloc() -> local_lock_cpu_slab()

The last one does local_lock_irqsave() on PREEMPT_RT which does a
spin_lock(). That means atomic context is not possible. Where did I make
a wrong turn? Or did this change recently? I do remember that Alexei
reworked parts of the allocator to make the local_lock based trylock
allocation work.

> Cheers,
> Longman

Sebastian

