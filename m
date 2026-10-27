Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C8E606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 11:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=28mhRTXr;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=rOp2K4ZL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/NltYmfxcgCAYT9YXitMAMuU2GI9OVYf0NS3EireCBQ=; b=28mhRTXrlUfQYL
	ZF3mbwpy6MuScp8kZHAAjjGe4+WnpMDqOPMviB06WA+DLthnRoM3sdPBT0IRdR741MgH7/9ReRi0f
	gbdrkxoxNgXl9UbA3ZKgNF6mY/2Zf4Gbw7u8bpQRPdM8i2a5NvX2m3k/VJBwsWVC25NTV90O83Iew
	3jkWg1RCRLJ3KlYOVW3mpp+atXDdH3qJ+kVIw1lC/QJgVW1LDk/5POAm3CnnfN6eC4zTucfYmwIXE
	LA5P+CTZzuTnLXNff4gc7CtnkvPl0XIMBTzW5RdJ7J0ruLtijkN9pdthB2wnD/mh04p4VO7a1RCcC
	F8KC/Yj2sKmlvEk/Kh/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfbP-00000004VmX-05tq;
	Tue, 27 Oct 2026 11:44:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfbM-00000004Vlo-2R8K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 11:44:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0308815A1;
	Tue, 27 Oct 2026 04:44:20 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 214FC3F59E;
	Tue, 27 Oct 2026 04:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793101463; bh=bBS51vaKu4N9Eu53pEXiAwZopzCyxiYFMo+QzWCX0iE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rOp2K4ZLaAGVLhbHEZh6GbKmrqveQL3g1Pn8k3ESCBGZjUol4AOfSQ1NOMxajxgGl
	 kZ9GCFvIBLAcypc7g/kZET88q4NgnMA9+3fFRJg+W4CqI9NX+y5q5RPJxu8fLPHzU5
	 QLS7umXxUPkoaeATmf95y1jMQAtj2a01kkWBcc44=
From: Leonardo Bras <leo.bras@arm.com>
To: Oliver Upton <oupton@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Marc Zyngier <maz@kernel.org>,
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
Subject: Re: [RFC PATCH v2 0/3] Set DBM bit on writable pages
Date: Tue, 27 Oct 2026 11:44:15 +0000
Message-ID: <auCOj9dgk42AE1WX@LeoBrasDK>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <at-lSy7H-K60LhCB@kernel.org>
References: <20261026144413.441566-1-leo.bras@arm.com> <at-lSy7H-K60LhCB@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_044424_696775_E001A14B 
X-CRM114-Status: GOOD (  36.94  )
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 12:08:59PM -0700, Oliver Upton wrote:
> On Mon, Oct 26, 2026 at 02:44:06PM +0000, Leonardo Bras wrote:
> > When HAFDBS is enabled (VTCR_EL2.{HA,HD}={1,1}), having a DBM bit allows 
> > hardware to promote a non-writable page to writable by setting (S2AP[1]=1),
> > without having to take a fault.
> > 
> > The reason for this patchset is to add the DBM bit when setting-up writable 
> > pages, so the code is prepared for future patches that make use of 
> > HDBSS/HACDBS to accelerate dirty-tracking. Write-bit detection still 
> > happens based only in S2AP[1], so no change in that aspect.
> > 
> > Having DBM set on block entries is undesired, as we benefit from the first 
> > fault for splitting it in PAGE_SIZE entries, which is the granularity used 
> > to track the dirty pages in KVM. So introduce a new walker that, on top of 
> > clearing S2AP[1] for every entry, also clear DBM for block entries.
> > 
> > Also introduce a new VCPU request to reload Stage2, as it will be needed on 
> > future HDBSS/HAFDBS patchsets. 
> > 
> > Please let me know of what do you think!
> 
> I'm pretty sure I shared this feedback before, but patches that enable
> DBM do not make sense in isolation. We need a single series that
> contains the DBM enablement as well as the corresponding HDBSS support.
>

Right, 
My reasoning is that we can discuss this new version, and make the needed 
changes, so Tian could pick this for his own patch series for the next 
version. I do not intend to get this merged by itself.

Next time I will make sure to state this in the cover letter so it's clear.
 
> > Changes since RFCv1:
> > - Dropped patch #5 on enabling HAFDBS on non-dirty-tracking guests, as it 
> >   proved to be counter-productive on wrprotect, contrary to expectations
> > - No more moving writable-bit to DBM. That does not seem to be the intended 
> >   use. It makes sense and it's easier to convert code to new DBM approach.
> 
> Sorry, where was this concluded?
> 

Sorry, this is my viewpoint after re-reading the documentation and 
being really pedantic while trying to get a proper answer from the people 
responsible for keeping/improving it. 

> The abstract permission flags need to have a WRITE an DIRTY state, which
> we then map to hardware based on the capabilities of the system.
> 
> !FEAT_HAFDBS:
> 
> 	DIRTY	=> S2AP[1]
> 	WRITE	=> S2AP[1]
> 
> FEAT_HAFDBS:
> 
> 	DIRTY	=> S2AP[1]
> 	WRITE	=> DBM
> 

I agree that it could work, and my first version was based on that.

But looks weird to me that we have to decide the writable bit based on 
having a feature enabled.

Take in account that we can only have DBM being the writable bit while 
HAFDBS is enabled (not only present), and that it is just enabled during 
dirty-tracking. 

It means we would need to convert the whole pagetable between DIRTY=S2AP[1] 
and DIRTY=DBM every time we enable or disable dirty-tracking.

My suggestion with this series is to have WRITE=DIRTY=S2AP[1] at all 
times, and have DBM to act as a "can be promoted to writable on write" bit.
This way we don't actually need to convert between encodings, and it still 
works and complies with the architecture.

> Beyond making the whole HAFDBS easy to reason about, I want this for
> FEAT_S2PIE which reimagines bit 7 as a literal dirty bit that can be
> managed by software or hardware.

Humm, and would not that work with the above suggested approach?
I mean, bit 7 (Dirty, S2AP[1]) will both mean WRITE/DIRTY, but it will be 
able to get promoted (nonW->W, or clean->dirty) based on the indirect 
permissions.

What do you think?

Thanks for reviewing,
Leo

