Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98AEEB7EAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 08:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJS45T4LXa5bVUI2jfMqUdvmKsps5YT2cWbQfq2oPtw=; b=y1u683m5E3XBFQgD3tB61S+Auw
	yWy7Au8/WHuzOToj3Vf3UUBhY/6e+MJev8BAXb+UNQK2i7Ynv8pVbg1pGvSNpHRZepQ0zvTV0EgQm
	QqCpLiFnrve6KIZecXMmJCdDcOH2FTGLYGK0ilcxQfOm8nMLTkWu28+iGap2KMy/nTBIsWR8T+rva
	Q9g0VZ1HzoGgCxinrJRc2PqPvRM81Q+zCgPk/6vQt4Nd24hLW2iKX+98MDpjoYdV6zwp10YPSvuXv
	6H/KyQgWaBsoTdr738C3j7wcakbsU8hITBPAJChNAVFopVDRgsu3SX7IFN70e8525vjnuJn90Ja43
	T1w3pMQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhv8-0000000GmPf-1eXn;
	Wed, 04 Mar 2026 08:49:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhv3-0000000GmMT-2fvz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 08:49:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77349339;
	Wed,  4 Mar 2026 00:49:17 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C377C3F7BD;
	Wed,  4 Mar 2026 00:49:21 -0800 (PST)
Date: Wed, 4 Mar 2026 08:49:19 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: Linus Walleij <linusw@kernel.org>, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	James Clark <james.clark2@arm.com>
Subject: Re: [PATCH] arm64: Implement clear_pages()
Message-ID: <aafyD6G_Moz8tg1A@arm.com>
References: <20260303-aarch64-clear-pages-v1-1-ad0c3ee9a555@kernel.org>
 <aab0SvA0dU0R0pnl@willie-the-truck>
 <CAD++jLnhe_k1-eU90KjOi_Aj57S53a9GJoCZ-LTE0fz-TVSqvg@mail.gmail.com>
 <87v7fcuij3.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v7fcuij3.fsf@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_004926_974888_C48A78A5 
X-CRM114-Status: GOOD (  22.99  )
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

On Wed, Mar 04, 2026 at 12:05:04AM -0800, Ankur Arora wrote:
> Linus Walleij <linusw@kernel.org> writes:
> > On Tue, Mar 3, 2026 at 3:46 PM Will Deacon <will@kernel.org> wrote:
> >> If we have CPUs that are this sensitive to branches, perhaps we'd be
> >> better off taking the opposite approach and moving more code into C
> >> so that the compiler can optimise the control flow for us?
> >
> > Hm! That would be to create a default clear_page() in
> > <linux/mm.h> and simply delete the existing lib/clear_page.S
> > and let the default kick in.
> >
> > Right now every arch is implementing it custom.
> > Maybe for no reason in some cases, I could try it!
> >
> > I doubt the compiler would emit this part though:
> >
> > #ifdef CONFIG_AS_HAS_MOPS
> > (...)
> > alternative_else_nop_endif
> >         setpn   [x0]!, x1!, xzr
> >         setmn   [x0]!, x1!, xzr
> >         seten   [x0]!, x1!, xzr
> >         ret

It won't generate it. It wouldn't be a pure C but have some inline asm.

Anyway, I'm fine with the .S file, I just wonder whether the DCZID_EL0
read inside the inner loop is causing problems (not the FEAT_MOPS
variant).

> > Three instructions to clear all pages. But maybe that is not good
> > if this is a gigabyte, and the per-page loop provides a good breather
> > preemption point in that case, and then we just shouldn't touch
> > anything.
> 
> The code in folio_zero_user (clear_contig_highpages()) takes care of
> chunking up the clearing based on preemption model.
> The idea being that if you are running with preempt=none or voluntary
> then you might want to call cond_resched(), say every 32MB or so.
> 
> If you are running with preempt=full or preempt=lazy, then it would
> just clear a full GB page.
> 
> That would need the set[mpe]n instructions to be interruptible though.
> (Seems to me that that is true but maybe someone could confirm.)

Yes, they are interruptible (the SETM). The x0, x1 register are left in
a state that the SETM can be restarted from where it was interrupted.

-- 
Catalin

