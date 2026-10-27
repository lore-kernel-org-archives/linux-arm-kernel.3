Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A508B606A7FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 11:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ad803QeW;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=l2ojKu3I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6fRga4PLyhDvRmvdApHZbO2HfBP0tzzKD/rmKO+880Q=; b=Ad803QeWz/EmyB
	X/1gA4aUG1amUKNwsbRCto5PCMo0lcsdxgB50o5cDw/2RN4LQk3vcdU1XLSVntsnd0kDmRnfVBavL
	GGENeIN7rOO13vKg9Ef162Z1BwF0Ukp4nTZrLu2JV0GvwLXo5xiaQXG90zRPkLv8uUeprc5qP5zwA
	J4QITLoRHWralT2MctSwqqj1N/M9wlHl0BxEdMOVwl5IWJJCMsCCGoWH1pfnLzZmj0Oz2YhREQzIU
	McqzjO/g2OK9QEj5IWmJLcfo+h/sOLdgxxciVTUCK/QUksAotlVsTpH27SEf+ZzF7PZGWgYwVjYuW
	v+vYIiGmTXw7hd7xq9xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfdR-00000004W0r-1G1T;
	Tue, 27 Oct 2026 11:46:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfdP-00000004W0R-0wwj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 11:46:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5AF815A1;
	Tue, 27 Oct 2026 04:46:26 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA94F3F59E;
	Tue, 27 Oct 2026 04:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793101590; bh=aQvS8xrI1rrJ9Ub2g0brfCcZrqaYMf0KkHjzaD4o2l4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l2ojKu3IKqobyHKB3LWMy3WiBjkW12rVYJUpa1k/psGeIhNTfHyav5r2NPSl/+/gl
	 A+NfM4qPgmjBtML5qis6lFJRMSoN/YfDBbY1m4Nh3/mQVFrxTZLhmTO9IaCpYyABAn
	 n6+ccYnLMvahZSsY8PmmJIE+l8vaJnRCogV8Gn4s=
From: Leonardo Bras <leo.bras@arm.com>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	liuyonglong <liuyonglong@huawei.com>,
	Oliver Upton <oupton@kernel.org>,
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
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 5/5] KVM: arm64: Enable HAFDBS for guests not on migration
Date: Tue, 27 Oct 2026 11:46:25 +0000
Message-ID: <auCPEQmnFwWldTaM@LeoBrasDK>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <8eaaba87-7881-49c4-a76a-51dec2f29ffc@huawei.com>
References: <20260901171558.2674031-1-leo.bras@arm.com> <20260901171558.2674031-6-leo.bras@arm.com> <aqneWnlsdpocLIl6@kernel.org> <aqqhDs3NyjtkZzXK@LeoBrasDK> <aqsl1_IqnV2r8kUL@kernel.org> <aqvt2gnlBZeNsaf4@LeoBrasDK> <as-mH36YSMxAosND@LeoBrasDK> <3e464bef-8dfe-44a3-afea-3c276ae87cd8@huawei.com> <attMtUqxNsuPooix@LeoBrasDK> <8eaaba87-7881-49c4-a76a-51dec2f29ffc@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_044631_380571_D94D4C27 
X-CRM114-Status: GOOD (  49.97  )
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

On Tue, Oct 27, 2026 at 10:02:55AM +0800, Tian Zheng wrote:
> 
> 
> On 10/23/2026 8:01 PM, Leonardo Bras wrote:
> > On Fri, Oct 23, 2026 at 03:23:04PM +0800, Tian Zheng wrote:
> > > 
> > > 
> > > On 10/14/2026 11:56 PM, Leonardo Bras wrote:
> > > > On Thu, Sep 17, 2026 at 02:40:42PM +0100, Leonardo Bras wrote:
> > > > > On Wed, Sep 16, 2026 at 04:27:19PM -0700, Oliver Upton wrote:
> > > > > > On Wed, Sep 16, 2026 at 03:00:46PM +0100, Leonardo Bras wrote:
> > > > > > > On Tue, Sep 15, 2026 at 05:10:02PM -0700, Oliver Upton wrote:
> > > > > > > > Hi,
> > > > > > > > 
> > > > > > > > On Tue, Sep 01, 2026 at 06:15:56PM +0100, Leonardo Bras wrote:
> > > > > > > > > When dirty-logging is disabled, even non-write faults make a page dirty,
> > > > > > > > > which avoids a second fault when the page is actually written to.
> > > > > > > > > 
> > > > > > > > > On dirty-logging enable, this approach causes all (writable) pages on the
> > > > > > > > > memslot to be marked clean, even if they were not written to, which can
> > > > > > > > > take a lot of time, while holding the MMU lock, doing atomic writes to
> > > > > > > > > PTEs.
> > > > > > > > 
> > > > > > > > Do you have any performance numbers for this? Enabling HAFDBS seems a
> > > > > > > > bit involved to avoid some stores on the first pass.
> > > > > > > 
> > > > > > > Not yet, but if the idea does not look too crazy I can find hardware and
> > > > > > > collect some data :)
> > > > > > 
> > > > > > TBH this looks like a micro-optimization so I'm not expecting the
> > > > > > performance gains to justify the behavior change.
> > > > > > 
> > > > > 
> > > > > Okay then, I will get a machine to figure the performance gains :)
> > > > 
> > > > Got the performance numbers here.
> > > > I tested both the case where all PTEs are dirty, and the case that 50% of
> > > > the PTEs are dirty.
> > > > 
> > > > For that test, actually patch #5 could make kvm_pgtable_stage2_wrprotect()
> > > > slower, which is counter-intuitive, in all platforms tested:
> > > > 
> > > > When we walk the S2 pagetable to wrprotect, using the new walker, the
> > > > write to the PTE itself is so cheap* that the cost of the branch
> > > > misprediction (write PTE or not) for the 50/50 case is significantly higher
> > > > than the cost of the 50% extra writes, which makes the 50/50 up to 60%
> > > > slower than the 100% dirty case. It is still slower in the '25% dirty' as
> > > > well, and starts to get even at '10% dirty'.
> > > > 
> > > > * (non-atomic, everything is in order, walker is small, cpu will probably
> > > > bundle it all in a single cacheline write)
> > > > 
> > > > Since the idea of patch #5 was to reduce PTE writes in the first wrprotect
> > > > walk, it becomes faster only if only a small portion (<10%) of the VM was
> > > > write-faulted while the remaining was read-faulted, which seems to be a
> > > > really reduced audience.
> > > > 
> > > > Since this comes with increased complexity, and also carry costs of
> > > > having HAFDBS itself enabled outside dirty-tracking, I don't think it's a
> > > > good idea to further pursue patch #5. It's only value is that it served as
> > > > a base for HDBSS implementation.
> > > > 
> > > > Thanks for reading!
> > > > Leo
> > > > 
> > > Hi Leo,
> > > 
> > > Thanks for running this, the numbers are really useful.
> > > 
> > > It means the hardware dirty mode (HD=1) should only be enabled while
> > > dirty logging is active with HDBSS support, and stays off otherwise.
> > 
> > Hi Tian,
> > 
> > Correct, it's actually counter-productive for it to stay on without HDBSS
> > before dirty-logging.
> > 
> > > 
> > > With HD only enabled during dirty logging, we also keep the DBM-based
> > > encoding for the HD=0 case. On systems that support FEAT_HAFDBS, DBM
> > > remains the write bit and S2AP[1] the dirty bit even with HD=0. This
> > > works because kvm_s2_fault_compute_prot() maps any writable page of a
> > > non-tracked memslot writable-dirty (WD), including on read faults:
> > > 
> > > ```c
> > > if (s2vi->map_writable) {
> > >          *prot |= KVM_PGTABLE_PROT_W;
> > > 
> > >          if (s2vi->device ||
> > >              !memslot_is_logging(s2fd->memslot) ||
> > >              kvm_is_write_fault(s2fd->vcpu))
> > >                  *prot |= KVM_PGTABLE_PROT_DIRTY;
> > > }
> > > ```
> > > 
> > > So there is no WC entry for hardware to promote, and HD is simply not
> > > needed outside dirty logging.
> > > 
> > > In the next HDBSS version, we'll only turn on HD=1 when dirty logging
> > > is active.
> > > 
> > 
> > Right!
> > I will also send a new version of the pre-patch (4 patches) for us to
> > discuss. The first 2 patches will change meaning a bit, but should still
> > work as they do today.
> > 
> > Thanks!
> > Leo
> > 
> Hi Leo,
> 
> OK, I've seen the new DBM RFC patchset. HDBSS v6 will be based on it.


Hi Tian, thanks for reading it, and for accepting it in your series!

Before rebasing, please wait for the ongoing discussion on it's 
correctness. Maybe I will have to send new versions before it can be used.

Thanks!
Leo

