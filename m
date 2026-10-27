Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1437F606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 11:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OUKDFy8V;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kVgmw+6F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O7vhfK9LUwcbCXy6Lz5w2AgaOehiRMtoFkoe6sMjwzU=; b=OUKDFy8V31G4pA
	+3P985Rq/gMWQ8ioF1b68OJSPxbyQ2khmbwcDAIlZkFR8jk2Qqmifr9DabzfixtI1KNS0lH0Yyuac
	zRiM9GQQD2PMC2XxV8dQlToCGQ7RxYLBG2Za05TO8Cl6OgBa8vXIsjsVwJXx7maV1J+JnIR8I6UI8
	FnyiPiXSQuYBpfrt47byqNlUzHp4kDkWmFvszVG2m/WO5oIrxVsHM40faz0PMv3z4EIh8wEmJcwww
	jgAltMFpZhpwXvr4JnpP9T9QWS8HJn2KcS/evYR27KnZxZSnKlRKfetsVImjWLUK+FYaeXWtWPIII
	CfBH3kPNVXo7eWpFRT1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLffd-00000004WW4-3XZG;
	Tue, 27 Oct 2026 11:48:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLffb-00000004WVc-0xsx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 11:48:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CA0A2C1E;
	Tue, 27 Oct 2026 04:48:43 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 324883F59E;
	Tue, 27 Oct 2026 04:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793101726; bh=4i03Lff+oqO8PKJE3CBuMVnwfvifHeKsuOaAebMHbYM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kVgmw+6Fqmnn0FVvLxNLgUv3QdifXiyMmx7F/nnk1SuZwg+ZsRZaXVxBrH8+ZzjhM
	 LGl8H+mmx9XFZf1mLf9ZyJce8nQudSfO1zhncune6e/lbKr65mEVNy2jNt01tDb2hF
	 e9Kkwk1FnLMDDMoiow4zCil36BIDElArpf50BJF8=
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
Date: Tue, 27 Oct 2026 11:48:41 +0000
Message-ID: <auCPmYvvkwILa4j-@LeoBrasDK>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <auCOj9dgk42AE1WX@LeoBrasDK>
References: <20261026144413.441566-1-leo.bras@arm.com> <at-lSy7H-K60LhCB@kernel.org> <auCOj9dgk42AE1WX@LeoBrasDK>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_044847_360003_38504A59 
X-CRM114-Status: GOOD (  44.79  )
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

On Tue, Oct 27, 2026 at 11:44:15AM +0000, Leonardo Bras wrote:
> On Mon, Oct 26, 2026 at 12:08:59PM -0700, Oliver Upton wrote:
> > On Mon, Oct 26, 2026 at 02:44:06PM +0000, Leonardo Bras wrote:
> > > When HAFDBS is enabled (VTCR_EL2.{HA,HD}={1,1}), having a DBM bit allows 
> > > hardware to promote a non-writable page to writable by setting (S2AP[1]=1),
> > > without having to take a fault.
> > > 
> > > The reason for this patchset is to add the DBM bit when setting-up writable 
> > > pages, so the code is prepared for future patches that make use of 
> > > HDBSS/HACDBS to accelerate dirty-tracking. Write-bit detection still 
> > > happens based only in S2AP[1], so no change in that aspect.
> > > 
> > > Having DBM set on block entries is undesired, as we benefit from the first 
> > > fault for splitting it in PAGE_SIZE entries, which is the granularity used 
> > > to track the dirty pages in KVM. So introduce a new walker that, on top of 
> > > clearing S2AP[1] for every entry, also clear DBM for block entries.
> > > 
> > > Also introduce a new VCPU request to reload Stage2, as it will be needed on 
> > > future HDBSS/HAFDBS patchsets. 
> > > 
> > > Please let me know of what do you think!
> > 
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
>  
> > > Changes since RFCv1:
> > > - Dropped patch #5 on enabling HAFDBS on non-dirty-tracking guests, as it 
> > >   proved to be counter-productive on wrprotect, contrary to expectations
> > > - No more moving writable-bit to DBM. That does not seem to be the intended 
> > >   use. It makes sense and it's easier to convert code to new DBM approach.
> > 
> > Sorry, where was this concluded?
> > 
> 
> Sorry, this is my viewpoint after re-reading the documentation and 
> being really pedantic while trying to get a proper answer from the people 
> responsible for keeping/improving it. 
> 
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

s/DIRTY/WRITE/


> 
> My suggestion with this series is to have WRITE=DIRTY=S2AP[1] at all 
> times, and have DBM to act as a "can be promoted to writable on write" bit.
> This way we don't actually need to convert between encodings, and it still 
> works and complies with the architecture.
> 
> > Beyond making the whole HAFDBS easy to reason about, I want this for
> > FEAT_S2PIE which reimagines bit 7 as a literal dirty bit that can be
> > managed by software or hardware.
> 
> Humm, and would not that work with the above suggested approach?
> I mean, bit 7 (Dirty, S2AP[1]) will both mean WRITE/DIRTY, but it will be 
> able to get promoted (nonW->W, or clean->dirty) based on the indirect 
> permissions.
> 
> What do you think?
> 
> Thanks for reviewing,
> Leo

