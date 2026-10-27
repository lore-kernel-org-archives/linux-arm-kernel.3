Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABDC606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 23:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qPxQQpXy;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VgjbfQwc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gcC21IdQ6bspw7TEhlauUEjBQvyVhgVj7MtVw7/gPRo=; b=qPxQQpXy70DTaMo9cDUnrlElq3
	1a2qNGdUUrB8YS12/0MJyEodaIva9+ietnK0i2GtH6g1eGIUbseFgk1S9+1kquTmTwapR476QXYQS
	YcY8IsjSwyfVjDIRuUS6X3yQJkr0ofKKTxGZNAGzqAMhucHpuaTlmWlyDm8zRXU5sel4N1p0U532j
	eEO5grcx1rdcLKUt38EEU9Sd3k7QNwZcQZHWgzxcgu9CtNgKIA0ivTsTHyKdmn+DoGmXkKejXt4vu
	Zoiw1436+GJAfVvpJfOwZRhYF+qtWvv/vT/yvyCOVIo+t035ZENh2S35e/qBCC8MTUOBUdwcLTRg/
	izVJF0Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqSC-00000005ulf-48mh;
	Tue, 27 Oct 2026 23:19:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqSB-00000005ulO-0dtJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 23:19:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0D3C60098;
	Tue, 27 Oct 2026 23:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08BED1F01825;
	Tue, 27 Oct 2026 23:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793143177;
	bh=gcC21IdQ6bspw7TEhlauUEjBQvyVhgVj7MtVw7/gPRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VgjbfQwcwbx4G42W26MolZaeZmmXJ+28ATNkVJuDLpN6KYpStv2PVQpQCZthLi0Sy
	 Vg0fSiXXlPFlQ2xu6X1+pCN+9q6fY7DXGldExk148QvFsIMOnibTPS5MsHvQvqsHGo
	 07mQQeDmtm7rZSrNK8pHGNFYOR5ywAuC4MhrwEaXpmUq8KKc33oP7JqKe0HzJxHc4Y
	 cvsHOp+fAuG8FjhIKLfqOa3ge07+dILxP+q5mEHAnecHIR/yExBg4iTxMbXktXJjd7
	 WnCBeJjmEbHqadHxsujCA5q1asob8LX6bl2nZWJtVF+b9irHKjGz47+rLya+R9tQ2D
	 P1OmVj1Q4oAaQ==
Date: Tue, 27 Oct 2026 16:19:35 -0700
From: Oliver Upton <oupton@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/3] Set DBM bit on writable pages
Message-ID: <auExh5laWQbUKmUY@kernel.org>
References: <20261026144413.441566-1-leo.bras@arm.com>
 <at-lSy7H-K60LhCB@kernel.org>
 <auCOj9dgk42AE1WX@LeoBrasDK>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auCOj9dgk42AE1WX@LeoBrasDK>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 11:44:15AM +0000, Leonardo Bras wrote:
> > I'm pretty sure I shared this feedback before, but patches that enable
> > DBM do not make sense in isolation. We need a single series that
> > contains the DBM enablement as well as the corresponding HDBSS support.
> >
> 
> Right, 
> My reasoning is that we can discuss this new version, and make the needed 
> changes, so Tian could pick this for his own patch series for the next 
> version. I do not intend to get this merged by itself.
> 
> Next time I will make sure to state this in the cover letter so it's clear.

Can you just work this out off-list? Let's keep the on-list dialogue
consolidated to a single series to review.

> > The abstract permission flags need to have a WRITE an DIRTY state, which
> > we then map to hardware based on the capabilities of the system.
> > 
> > !FEAT_HAFDBS:
> > 
> > 	DIRTY	=> S2AP[1]
> > 	WRITE	=> S2AP[1]
> > 
> > FEAT_HAFDBS:
> > 
> > 	DIRTY	=> S2AP[1]
> > 	WRITE	=> DBM
> > 
> 
> I agree that it could work, and my first version was based on that.
> 
> But looks weird to me that we have to decide the writable bit based on 
> having a feature enabled.
> 
> Take in account that we can only have DBM being the writable bit while 
> HAFDBS is enabled (not only present), and that it is just enabled during 
> dirty-tracking. 
> 
> It means we would need to convert the whole pagetable between DIRTY=S2AP[1] 
> and DIRTY=DBM every time we enable or disable dirty-tracking.
> 
> My suggestion with this series is to have WRITE=DIRTY=S2AP[1] at all 
> times, and have DBM to act as a "can be promoted to writable on write" bit.
> This way we don't actually need to convert between encodings, and it still 
> works and complies with the architecture.

There's no such "can be promoted to writable on write" in the indirect
permission model. This is why I'm suggesting that we align the abstract
permission bits (i.e. KVM_PGTABLE_PROT_*) with the architecture's own
abstracted permissions (e.g. uX, pX, RO, RW).

That composes nicely with nested virt as it is unambiguous what
permissions we're trying to represent in a shadow stage-2. And in the
non-nested case you can just lay down writable-dirty translations for
most things and use writable-clean when necessary for HDBSS.

> > Beyond making the whole HAFDBS easy to reason about, I want this for
> > FEAT_S2PIE which reimagines bit 7 as a literal dirty bit that can be
> > managed by software or hardware.
> 
> Humm, and would not that work with the above suggested approach?
> I mean, bit 7 (Dirty, S2AP[1]) will both mean WRITE/DIRTY, but it will be 
> able to get promoted (nonW->W, or clean->dirty) based on the indirect 
> permissions.

There's a bit more though. We need to have an entry in S2PIR_EL2 that
encodes write permission and select that with PIIndex. So then we wind
up mapping the abstract WRITE permission bit to two fields into the
descriptor rather than 1.

