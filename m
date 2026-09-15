Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBA2C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLWYVkk2mnHgi7qpJrEKeAb8ahVD2c1ZD12oZK8U7rg=; b=rBEdmMgyprTMzopeirIDa8TXzL
	HGyyIpi+hVLFCtw2sI8Z5fMJQutLAliUCJzCmBRGTxsyU37XRs+h5ttvEDOfEqbVrH0O0Oq2H3o32
	zokXufI1enHsSJuX8L3JfR88zLVyBWjfApia0lPEcZJOEmsiJVa3Dc0pkBVkHr58t9Zw9Ufj1PGNk
	T8j7p5Q8MO0/2eEOQZ48O+B5Axme2BKVUcPc0d7yiZmbXu+L/wFnEbMwjLR6YXcWXOSTbiLVmo++4
	5xQ65nbtMQNqkGCXAHnynEFU7k2g+c085bt/rGEz6RpVWocz6oJVZcTEvhRDbokDIb+xUqUbHkg8z
	5+ojKWKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V8S-00000007ASa-0mTx;
	Tue, 15 Sep 2026 15:31:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V8O-00000007AS0-02WQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:31:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1000B1570;
	Tue, 15 Sep 2026 08:31:41 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (unknown [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 535D63F882;
	Tue, 15 Sep 2026 08:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789486304; bh=mWQLtln8JqbVDxWmmM1gM2C1W+U+J79wvJLkPCMUbsc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IyZL4wyqQLgwyeFgfbXMZ6/AZ5Vx7sUqICfywxm2TJ0en2J04PaaVeSAiGOiHpcKC
	 r9MG8QNuZVXKL5gt0h1UVTA6bAs4B0uCvTejoQYitQkyI1Nlhghtdm0C0ug7v04xja
	 aRyVIPm5GXXYIsd5UFOH5OJDHf4tBqe/b/LNPmGU=
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/5] KVM: arm64: New PTE dirty-page encoding, HAFDBS new usage
Date: Tue, 15 Sep 2026 16:31:36 +0100
Message-ID: <aqlk2ApfQvHAs1j_@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <86cxui7j4k.wl-maz@kernel.org>
References: <20260901171558.2674031-1-leo.bras@arm.com> <86cxui7j4k.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_083148_138336_B4638863 
X-CRM114-Status: GOOD (  29.37  )
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

On Sat, Sep 12, 2026 at 01:24:11PM +0100, Marc Zyngier wrote:
> On Tue, 01 Sep 2026 18:15:51 +0100,
> Leonardo Bras <leo.bras@arm.com> wrote:
> > 
> > This series have 2 main goals:
> > 
> > 1 - Patches #1,#2,#3 : Change the PTE descriptor to use WD/WC/RO encodings
> >     making use of the DBM bit, adapting all usages, and
> 
> What are WD and WC? I can sort of guess that this is write-dirty and
> write clean, but that's not exactly obvious. More importantly, you
> don't even explain *why* anything needs changing...
> 
> > 2 - Patches #4,#5 are an RFC on using HAFDBS on a guest to avoid resetting
> >     all PTEs to WC when dirty-logging starts, speeding-up startup.
> > 
> > (1) will also introduce a new walker for cleaning the dirty-bit, which will
> > clear the DBM bit if it's a block mapping (hugepage). This is needed as on
> > lazy-splitting we need to fault a write so we can do the lazy splitting.
> > This is needed for both the next patches, and for HDBSS & HACDBS
> > enablement.
> 
> Again, this is incredibly opaque to the reviewer. What is the problem
> you are trying to solve? This is what a cover letter is for.

Hi Marc, thanks for reviewing!

Okay, I will try to explain it better on the next version. What do you 
think of this text:

===================

This series have 2 main goals:
1 - Introduce a new PTE encoding (Patches #1, #2, #3)
2 - An idea to use HAFDBS on a guest to avoid resetting all PTEs to WC 
    when dirty-logging starts

Goal 1:

Patches #1, #2, #3: Before adding Stage-2 support to HAFDBS, HDBSS and 
HACDBS, we need to change the PTE descriptor encoding, as the DBM bit 
is required on mappings for those hardware engines to actually being 
able to update the PTEs. Currently what we have is:

- Read-Only  (RO): S2AP[1]=0
- Read-Write (RW): S2AP[1]=1 

and for them to work with the new features, we need to have: 

- Read-Only (RO):      DBM=0, S2AP[1]=0
- Writable-Clean (WC): DBM=1, S2AP[1]=0
- Writable-Dirty (WD): DBM=1, S2AP[1]=1

WC and WD are described in the Arm ARM, on R_XZFQH and R_BRFGY.

We also need to prepare for dealing with lazy splitting when HAFDBS is 
enabled: since it updates the PTE without taking a fault on guest write, it 
means we can't have lazy splitting if we mark all PTEs as WC. 
To address that, there is a suggestion to set, on dirty-track enable:

- All pages as WC, as they don't need splitting, and
- All blocks as RO, as they are required to fault to do lazy splitting

In order to have that, a new walker is introduced to have a different 
behavior depending on the entry's level.

This is needed for the Goal 2, as well as for HDBSS enablement.


Goal 2:

Patches #4,#5 are an RFC on using HAFDBS on a guest to avoid resetting
all PTEs to WC when dirty-logging starts, making it faster.

I really just want feedback to understand if it's worth pursuing. 

My main idea is that we can use HAFDBS _outside_ dirty-logging to only mark
dirty the pages that were actually written to. 

That is supposed to make it faster to transverse the pagetables when we 
need to clean the dirty-bit, as there is potentially less atomic writes to 
perform. 

The price paid for that is disabling HAFDBS on every vcpu before we can 
start cleaning the pages, during a dirty-track request.

Please let me know of what you think!

Thanks!
Leo

