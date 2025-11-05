Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88734CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 20:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KhtvpAly1rSbVWFRcCzRfZAdS7wlJniEzGb34AmT2a0=; b=GyVKNPqu9pPD7+glr5Q2lOhuys
	xKQvBf4uwiFTlos2RxmNh6J3EcdIpm+ggZdCBQHpKm64YrUlh7cwXPBATbOpyndblgsO2AB3J/3QU
	sj84r0Eg6pcZbW2JJY3k4WndfnwdGJIhmOZMYi+WNuV9VMQJAFAT1WqGxdIqy0AAcQHS0oO1w2xQ9
	EkspsoiiadEmFMWJdvAPaMu08Ps8X9GPExT4dVc4C/wYdWS0OEgOF1qrZTnmdq24uOoccB9DIAP2b
	cWRULEGCgNeUqEkTr41KYTMEzkkV1CwHevShgPE3puN9KOQlN+AQXz3SWdmEy+llRSXulD0y1iMDQ
	WbYfW7Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkNP-0000000EOEF-3VWt;
	Wed, 05 Nov 2025 20:45:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkNN-0000000EODs-4BTw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 20:45:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5ACD744144;
	Wed,  5 Nov 2025 20:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AED3C4CEF5;
	Wed,  5 Nov 2025 20:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762375505;
	bh=sPe36kIYZocF0/o/4FR0Qmm39n5Ka3RhbFZLvjyVrUo=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=hPMneKrTuDgHHyhmaAKUDCnvQEHDsQfUtf/wnHMlIxsXaMLQtALZe51eTFIDOD+aR
	 PmBcBeiJx9YKF+i6rn1Ez/+MspssHqsk+tp7laNK4cDbBTsFzKEakYT2pNpozgRBrY
	 4kMKAvY5KcOWJSAglraR71om1odzkKx5/vtIUO2ibgS1ahwNMmZP1y3QJvWZy+UiUG
	 T6bbArvrqfbnh4zi4BzTuhgEriSwT5hV6GJ0BvMN1pE3VqtkTFQAY2wb2ry78Y1Jja
	 Rdw0romEaYcREHVpU+6S8v3duKE4mF+c9hKIJdVN/gHPiSXvxn52z1gNrqMOOcz8Ku
	 aFRNhETvsGstg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 37BC5CE0B94; Wed,  5 Nov 2025 12:45:04 -0800 (PST)
Date: Wed, 5 Nov 2025 12:45:04 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <39609c25-cbcf-430a-9fff-289029ca920f@paulmck-laptop>
References: <aQoyPox1DjlBT32O@arm.com>
 <d132771d-3a3f-486c-b674-de4ec976e929@paulmck-laptop>
 <174614f9-70f0-440e-ae68-dc5f540b8454@paulmck-laptop>
 <aQtufeFU-PAE6YDk@arm.com>
 <8f7997f5-fdb3-443b-90be-3c68d796b416@paulmck-laptop>
 <aQuGR1fx2qBrJSA-@arm.com>
 <8ef2390c-e805-4b8c-8417-88a6762f9a54@paulmck-laptop>
 <aQuimp4CRywdy97S@arm.com>
 <dd77458f-95f0-4c3f-ae5c-4a09b51e386a@paulmck-laptop>
 <aQuw1WUZAjWLRgop@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQuw1WUZAjWLRgop@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_124506_059220_B31AAB96 
X-CRM114-Status: GOOD (  19.53  )
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
Reply-To: paulmck@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Nov 05, 2025 at 08:17:25PM +0000, Catalin Marinas wrote:
> On Wed, Nov 05, 2025 at 11:47:07AM -0800, Paul E. McKenney wrote:
> > On Wed, Nov 05, 2025 at 07:16:42PM +0000, Catalin Marinas wrote:
> > > I think we should change the percpu atomics, it makes more sense to do
> > > them near, but I'll keep the others as they are. Planning to post a
> > > proper patch tomorrow and see if Will NAKs it ;) (I've been in meetings
> > > all day). Something like below but with more comments and a commit log:
> > 
> > I do like fixing this in the arm64 percpu atomics.  However, this gets
> > me assembler errors, perhaps because I am using an old version of gcc
> > or perhaps because I am still based off of v6.17-rc1:
> > 
> > 	/tmp/ccYlMkU1.s: Assembler messages:
> > 	/tmp/ccYlMkU1.s:9292: Error: invalid addressing mode at operand 2 -- `stadd x2,x4,[x0]'
> > 	/tmp/ccYlMkU1.s:9428: Error: invalid addressing mode at operand 2 -- `stadd x3,x6,[x1]'
> > 	/tmp/ccYlMkU1.s:9299: Error: attempt to move .org backwards
> > 	/tmp/ccYlMkU1.s:9435: Error: attempt to move .org backwards
> 
> Are you sure it is applied correctly? There shouldn't be any trace of
> stadd in asm/percpu.h.

Right in one, apologies!  And just for the record, it is a bad idea to
apply such a patch while rebasing and being in a C++ forward-progress
discussion.  :-/

This gets us to the usual good-case latency, in this case 8.333ns.

Tested-by: Paul E. McKenney <paulmck@kernel.org>

							Thanx, Paul

