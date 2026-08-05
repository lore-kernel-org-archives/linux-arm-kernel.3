Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD50DC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 14:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kov5DddpRaSHaT5QtIBhO+yv3izobi8lORUTe2us6Es=; b=RpW38dS51oqB+OZ1Q+3iYC5hoR
	83EhpPzyYXDuOD9h2MkPPqH6fmmTcpTUGDO27QLYdOBPyXR1kwIeCKG6Zu8TcQAcUQoAwM7eDWIDf
	lcphot7vDpjiRHwqkgTiQgKSSlVfsrYegMZEvuATWre6en6v/ye/5v8gJNtDp8bINohnCE6s3nq30
	RWJOAFLXOyaTzA2la0rpW9FncJdLvwhbcbDlDyjBzkAjW64RFk2bWUEv/Uki7WNyiYyEMBaHOa55U
	6DPoGEMBVSAR3XWtEhoNo1BQr4nJ72QYbXyYsXqgjg+sH7iir7yb5Pw9fuxfawEIy/a5Y+UGGFZ4B
	Ptr788gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrczz-000000047OP-0AYs;
	Wed, 05 Aug 2026 14:53:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrczw-000000047Nb-2CkY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 14:53:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D705F153B;
	Wed,  5 Aug 2026 07:53:28 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A06C3F632;
	Wed,  5 Aug 2026 07:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785941612; bh=K0NMuw1cdB8mhCo22y55f2vhoceFHsGS1XGjNj01RFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XgANokC1wy/pXB+aYJ4f7KYRB1lAKM4KkLXZvORJwCDGWcBvspQ5D2OkQ0mEdzGOw
	 IfCn2OXVY2KnBju9YVSjsvw24cmBPBpNC0hQn/mS+3lJWMJys3O8g7ZXwNRoex59zK
	 a9PT5dHCKKnOQwWU2QAJ6XszSUhjjlD/4dkCiI3A=
Date: Wed, 5 Aug 2026 15:53:28 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Yang Shi <yang@os.amperecomputing.com>,
	Ryan Roberts <ryan.roberts@arm.com>, dennis@kernel.org,
	tj@kernel.org, urezki@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, david@kernel.org, akpm@linux-foundation.org,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
Message-ID: <anNMvTAvUJkfspSR@J2N7QTR9R3>
References: <20260715180455.515692-1-yang@os.amperecomputing.com>
 <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com>
 <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com>
 <amCPBrdltFSE_fEf@J2N7QTR9R3>
 <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_075336_659616_E3BAD622 
X-CRM114-Status: GOOD (  24.76  )
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

On Mon, Jul 27, 2026 at 03:06:27PM -0700, Christoph Lameter (Ampere) wrote:
> On Wed, 22 Jul 2026, Mark Rutland wrote:
> > I expect that should come with a reasonable benefit, but I don't have
> > benchmark figures yet as I haven't finished converting the xchg and
> > cmpxchg implementations.
> >
> > > It sounds like it just moved the cost from one place to the other
> > > place and it also seems hacky TBH.
> 
> Yang Shi's patch has *no* critical section. There is no additional code
> for the RMV instruction. The RMV instruction is executed on the correct
> per cpu area.

None of that was in question.

> One of the reasons for the performance win is the
> eliminattion of these critical sections. Your approach still has some form
> of prologue and posthandling like the current preempt approach and
> therefore will not be able to have the same performance gains.

In absolute terms, yes.

However, I'm fairly confident that the vast majority of the overhead we
have today can be eliminated with simpler alternatives.

There is a trade-off, and there are surprisingly complex interactions
between page tables and other things (e.g. entry code). There is risk
and maintenance burden associated with that. Hence people want to
understand how much of the benefit is attributable to what. So far, the
statements haven't convinced me people actually know what portion of the
overhead come from which factor, e.g.

* How much of that attributable to conditional work when re-enabling
  preemption?

* How much of that is attributable to RMW sequences to modify the
  preempt count itself?
 
* How much of that is attributable to system register accesses (SP_EL0
  and TPIDR_ELx)?

Any of those could easily dominate the other factors and might easily be
avoidable. Most of that should be measurable today. For example you
could restore the preempt_{enable,disable} calls atop Yang Shi's
patches.

> The code is more efficient, there is no restart necessary and the
> technique is already widely used on x86 for a long time.

It's true that the per-cpu page table approach will have fewer
instructions in the fast path.

However, the other statements here are potentially misleading:

(1) There is no restart in the scheme I have proposed, so restarting is
    irrelevant to the comparison.

(2) On x86, this_cpu*() operations use segment relative addressing, NOT
    per-cpu page tables. If arm64 had a similar addressing scheme, I
    expect we would use it.

(3) There are a number of novel problems associated with per-cpu page
    tables (e.g the various unsolved issues Yang has described), which
    do not apply to x86's implementation of this_cpu_*() operations.

> Having the ability in general to map mmemory differently depending on the
> cpu opens up a number of other optimization like

> What we are proposing here is a basic new feature that simplifies code and
> allows addititonal performance and functional features that are so far not
> possible on ARM64.

While this simplifies the this_cpu_*() operations, I don't believe this
is a simplification overall, and IMO, describing it as such is
misleading.

Mark.

