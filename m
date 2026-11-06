Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CA4606A333
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h93bsfjv;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=IXdLbkhB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1EX2YTA7N1m8201rWClNkOLoSBkj+pXHUt+FjNqM5s4=; b=h93bsfjvNe6clbJlgp01fHCF6a
	3HEeSJ21lKWFg0XCHJUILNpciH9dkrXgElrtKCxUoUJw1OSadzoHvjj+n7QWAJ4X4dMQ+v90IvEcZ
	tLrGD+5gnjQdC++RVi3cnu+ebw4HtR8jkUqQx/dBqukurPuP8grsLTr3W/wMxugPI5PKJuBWOb8ZS
	NQPhiHgDfNRW6AYWMAZbHXxxkkeBCNyuk/VDaINEUsZaepR5+eqcDwIxr3snlyIe6PSeR9tuQ6OrA
	CwemcxsfvHvi8wvCY7SVel7Oa+8JXKOJkNh0xbex1oxAKts+kqamE2OxygJTeq0Vjzp3owVhDcqyJ
	mnH7vflg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHiN-0000000C50T-29nY;
	Fri, 06 Nov 2026 11:02:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHiJ-0000000C4yi-21Kr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 11:02:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 858CB1650;
	Fri,  6 Nov 2026 03:02:25 -0800 (PST)
Received: from e142392.arm.com (e142392.arm.com [10.2.213.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C208D3F673;
	Fri,  6 Nov 2026 03:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793962948; bh=vViXHVIoIW/K//DPywNrgxXC6rqNmWDghWNtpvorf90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IXdLbkhBeUk/3GjTjz8gzknsqr/4kj0JpHND7lmwR/llHNS/s8WDy/vGxCwPqCAUv
	 qNSnIjh162159EV7AtA2tqB2EiVb3NrdpSDa2Z4HJaWSxTxCMynmutIanTjxBGP7/h
	 t3OQ1zlrwiTXg3/kQLIYdW3r0WTMGfjLEdp9E2i4=
Date: Fri, 6 Nov 2026 11:02:17 +0000
From: Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@arm.com>
To: Linu Cherian <linu.cherian@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-efi@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [RFC 00/12] arm64: Add support for TLBI domains
Message-ID: <r7vnudhgumcjrhoo7iiv2nckxhhoax6k2d2xlquehfzv3f3dyk@idottvqbcjtr>
References: <20261001110655.461473-1-kristina.martsenko@arm.com>
 <upkds2ymzuztqvxxuysm62lxcdv5oa3ji6xrxbnz3yt3vntbp6@rw54ndtnpz3y>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <upkds2ymzuztqvxxuysm62lxcdv5oa3ji6xrxbnz3yt3vntbp6@rw54ndtnpz3y>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_030231_613645_5B6E6482 
X-CRM114-Status: GOOD (  37.69  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 05:36:47PM +0530, Linu Cherian wrote:
> Hi Kristina,
> 
> On Thu, Oct 01, 2026 at 12:06:43PM +0100, Kristina Martšenko wrote:
> > Hi,
> > 
> > This series allows the kernel to use TLBI domains. TLBI domains (FEAT_TLBID) is
> > an Arm architecture feature that enables a TLB invalidation to target a subset
> > of CPUs instead of the whole system. It can improve performance on systems with
> > many CPUs. TLBID is not yet part of the Arm Architecture Reference Manual but
> > some of it is described in the latest XML [1].
> > 
> > The goal of this series is to send TLBI commands only to the CPUs where a
> > process has run (i.e. where its page tables have been installed). The last
> 
> Lets say if we have a TLB domain of 8 cpus and a process has ran on only
> one cpu, dont we end up broadcasting to all cpus in the domain as the 
> granularity is at the domain level ?
> If thats true, would be good to make that clear.

Yes that’s true. Linux can’t change the domains and the smallest domain
can contain 8 (or more) CPUs. I’ll add a note about it in the cover
letter to make it clear.

> > patch explains a bit about how it works. This is an RFC since I'm not familiar
> > with the kernel's TLB/mm code and I'd like feedback on whether the general
> > approach is correct.
> > 
> > A few notes and open questions:
> > 
> >   * Domains are described in a new "TLBI" ACPI table. This is not yet part of
> >     the ACPI specification. There was an initial proposal [2] but this series
> >     uses a newer WIP version of the table that aims to be published by the end
> >     of the year.
> > 
> >   * There is currently no device tree binding since the feature is mainly meant
> >     for server-class systems.
> > 
> >   * It's also possible to use TLBI domains to limit a KVM guest's TLB
> >     invalidations to CPUs where the guest has run. I'll try to include that in
> >     the next version. This series only disables domains for guests.
> > 
> >   * With this series a long-running process may eventually run on all CPUs and
> >     just issue broadcast TLBIs. It may be worth periodically reducing the set
> >     of CPUs but it's not clear when.
> 
> Do you have some thoughts on how we could reduce the set of cpus, to avoid
> cross domain scheduling ? 
> IIUC, this should me more of a scheduling decision with domain awareness. 

Sorry, the wording is unclear here. This is not about reducing the set
of CPUs that a process runs on, it’s about optimizing the domain bitmap
of a process such that it only contains CPUs that the process is active
on. Currently we only remove domains from the bitmap but never put them
back, even if the process is no longer running on a given CPU and its
TLB has been flushed. So we may end up removing all domains except the
broadcast-all domain.

This isn’t trying to avoid cross-domain scheduling or to change
scheduling at all.

Also, having thought about it some more, I’m not sure if this series
should try to optimize the domain bitmap at all, since it will require
synchronizing with the domain update in switch_mm(), which will add
overhead and needs to be benchmarked on TLBID hardware first (which we
don’t have yet).

Thanks,
Kristina

