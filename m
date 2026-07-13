Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA67C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 10:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1xgXQxdE5wr+brIFuY9AM8bp8TM+6ylnwB1VY1uIwg=; b=HM04xxaaryyvU41KKWSO1uLwoj
	5P2GnZWmWdyMe9i/Un+9AgFKc4XZC41l98ppUvUw0w4lBbfy8Y3E5Z5nZh78dKnNLOj9PZhrOLR9F
	/ZhR5oSxmG8v5/GZ0t+TwskgHxTX120f+vrSZjEXf4MxJj1Je0Sk2Nnj+Azgaqa0uawsinR68x8Mx
	de5kzOOC6V5/5E4WnJucKg9O2r9FzhMjRBGn5MAOctJwaSDbdkReZYK4MzSt/+6kbvgWilXFIam33
	DU3tlO1Na0HnNqZK4P7xGkQTmrGlPrmpsp446Zyh/V1TP2Dn8Vr2FQtXEaUrmBI38YuAjMSznyvJ+
	XgGZr10Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDgP-00000008r4N-3NWO;
	Mon, 13 Jul 2026 10:14:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDgM-00000008r3b-1Rhu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 10:14:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 106E21576;
	Mon, 13 Jul 2026 03:14:32 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 300E63F93E;
	Mon, 13 Jul 2026 03:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783937676; bh=hOTtIDDwEJ38L9MsPeZ5bG3KTsWQQaBXqxWIWrr/gWI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rdk5qzyzFynDS7AUmdGerzb726zmchFq1rtgdUHYqLhzfjGlSFg8qbUIc2XqnlHPQ
	 2GlOoBtSaaGXUB/P7FhIqhRZET45/O3YFgXUtEABKJ3Rg84lS4G6bZMHCkmB4W/Msy
	 ED4jMdeT8O8zkVNK+AET6iqQqpbRFIwbj/Q4buXo=
From: Leonardo Bras <leo.bras@arm.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] KVM: arm64: Introduce KVM_PGTABLE_WALK_SKIP_LEVEL* walk flags
Date: Mon, 13 Jul 2026 11:14:32 +0100
Message-ID: <alS6hwzsBUEfvBEk@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <jiy6rtx24nqnnduze3uuvc2ifqrjlskhefyctlwyh2jshdjrw2@a2wpodq6ife6>
References: <20260708134101.2514759-1-leo.bras@arm.com> <20260708134101.2514759-3-leo.bras@arm.com> <jiy6rtx24nqnnduze3uuvc2ifqrjlskhefyctlwyh2jshdjrw2@a2wpodq6ife6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_031438_772858_C70F90C4 
X-CRM114-Status: GOOD (  19.00  )
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

On Sat, Jul 11, 2026 at 06:53:28AM +0100, Wei-Lin Chang wrote:
> Hi Leonardo,

Hi Wei-Lin, thanks for reviewing!

> 
> On Wed, Jul 08, 2026 at 02:40:58PM +0100, Leonardo Bras wrote:
> > Add the new walking flags that tell kvm_pgtable_walk() to skip lower levels
> > when walking the pagetables.
> > 
> > Signed-off-by: Leonardo Bras <leo.bras@arm.com>
> > ---
> >  arch/arm64/include/asm/kvm_pgtable.h | 13 +++++++++++++
> >  arch/arm64/kvm/hyp/pgtable.c         | 19 ++++++++++++++++---
> >  2 files changed, 29 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> > index 41a8687938eb..20c7c12e0e76 100644
> > --- a/arch/arm64/include/asm/kvm_pgtable.h
> > +++ b/arch/arm64/include/asm/kvm_pgtable.h
> > @@ -311,31 +311,44 @@ typedef bool (*kvm_pgtable_force_pte_cb_t)(u64 addr, u64 end,
> >   * @KVM_PGTABLE_WALK_SHARED:		Indicates the page-tables may be shared
> >   *					with other software walkers.
> >   * @KVM_PGTABLE_WALK_IGNORE_EAGAIN:	Don't terminate the walk early if
> >   *					the walker returns -EAGAIN.
> >   * @KVM_PGTABLE_WALK_SKIP_BBM_TLBI:	Visit and update table entries
> >   *					without Break-before-make's
> >   *					TLB invalidation.
> >   * @KVM_PGTABLE_WALK_SKIP_CMO:		Visit and update table entries
> >   *					without Cache maintenance
> >   *					operations required.
> > + * @KVM_PGTABLE_WALK_SKIP_LEVEL0:	Skip visiting level-0+ entries
> > + * @KVM_PGTABLE_WALK_SKIP_LEVEL1:	Skip visiting level-1+ entries
> > + * @KVM_PGTABLE_WALK_SKIP_LEVEL2:	Skip visiting level-2+ entries
> > + * @KVM_PGTABLE_WALK_SKIP_LEVEL3:	Skip visiting level-3 entries
> 
> Just a drive-by nit:
> Maybe avoid the level-$LEVEL terminology? Since as you said there is
> level -1 in the architecture, in that case you'd have to write
> "level--1" which is awkward :)

It would have to be something like level-(-1), or we could call it level+1, 
LOL.

Seriously though, yes it's bad.
I could call it level_1 entries, but level_-1 also seems weird :(
level(1) & level(-1) could work, but looks like a function now

maybe just saying 'level 1' and 'level -1' can be better.

What do you think?

Thanks!
Leo

 

