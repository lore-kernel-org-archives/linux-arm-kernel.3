Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E20C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 12:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8TrLRURx8+o8rNCze6e4393X+irFr1rhL6us60KCT4=; b=QyiHzbV/kjB1Lxj19GHzBX+tmP
	BZVFcM25KhePJjIQhUdByK17qCEWxNQl2yCUDZHzQrhUe762bAbf6ZpObBFlYJ3fQmjRZvXKOqG7m
	UXofK4EK7gE64PVLEWFbF6j5ZYsQrtASyOQTZ+Hl48xOnDmP88SKOXp47SFndWoUpMBf/xQijoynQ
	8VK7g044VirxKjUcl4JyOZxo2vZgmzQ706hJZih+hCD9LSAdI8s8PvpZxlHNAYBeUflkXM2JE9yWh
	GHAQXWgruY9+zoJHlZNwgGlRAY1TSbMXfBSian8dOkyeouSJO+4O5f20RkgDrC18Fz50hMDb6WhON
	K8FbUJnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnZj-00000006kTZ-3yu8;
	Mon, 20 Jul 2026 12:58:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnZh-00000006kSX-04gQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 12:58:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8385A2B;
	Mon, 20 Jul 2026 05:58:17 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 56FCB3F99C;
	Mon, 20 Jul 2026 05:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784552301; bh=ZqPwJpCJATgTe20c3VTfaUAxSjzvzDGaSBrLCg2jYwE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hJ0ugiQO9nentJNGljJ4OzLltjO/3B7nfWwZAG6NQTFgaZ1zDbTIsgmgDLGDdVavX
	 FrWPiAaVBlEHM+RGdQoGZCJEZxGKtwj5PK5ppgIMGf2I7ymo4svGpYHgXT8ik/uFcK
	 VwAeILCBvAPDU3TkgoL0CJ855zNpp3sxTdgz6E3w=
From: Leonardo Bras <leo.bras@arm.com>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	yuzenghui@huawei.com,
	wangzhou1@hisilicon.com,
	yangjinqian1@huawei.com,
	caijian11@h-partners.com,
	liuyonglong@huawei.com,
	yezhenyu2@huawei.com,
	yubihong@huawei.com,
	linuxarm@huawei.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com
Subject: Re: [PATCH v4 3/6] KVM: arm64: Add auto DBM support for hardware dirty tracking
Date: Mon, 20 Jul 2026 13:58:09 +0100
Message-ID: <al4bYajWE-v6wofu@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <alpIfIOFfrudBzD5@LeoBrasDK>
References: <20260709104026.2612599-1-zhengtian10@huawei.com> <20260709104026.2612599-4-zhengtian10@huawei.com> <aliKo7dTZzKcWHzI@kernel.org> <0943eb14-9ffb-4dbb-9219-060e97bca2a7@huawei.com> <alpIfIOFfrudBzD5@LeoBrasDK>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_055825_169559_AFFD7B7B 
X-CRM114-Status: GOOD (  21.56  )
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

On Fri, Jul 17, 2026 at 04:21:32PM +0100, Leonardo Bras wrote:
> On Fri, Jul 17, 2026 at 11:58:06AM +0800, Tian Zheng wrote:
> > 
> > On 7/16/2026 3:39 PM, Oliver Upton wrote:
> > > Hi Tian,
> > > 
> > > On Thu, Jul 09, 2026 at 06:40:23PM +0800, Tian Zheng wrote:
> > > > -	if (prot & KVM_PGTABLE_PROT_W)
> > > > +	if (prot & KVM_PGTABLE_PROT_W) {
> > > >   		set |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
> > > > 
> > > > +		/*
> > > > +		 * No DEVICE filter needed here: relax_perms is only called
> > > > +		 * on FSC_PERM faults. Device pages always get full RW from
> > > > +		 * initial mapping and are never write-protected during
> > > > +		 * migration, so they never trigger a permission fault.
> > > > +		 */
> > > > +		if (pgt->flags & KVM_PGTABLE_S2_DBM)
> > > > +			set |= KVM_PTE_LEAF_ATTR_HI_S2_DBM;
> > > > +	} else {
> > > > +		/*
> > > > +		 * Clear DBM on W→RO downgrade to prevent hardware from
> > > > +		 * silently upgrading RO+DBM back to W+dirty, which would
> > > > +		 * bypass KVM's write tracking and cause data corruption.
> > > > +		 */
> > > > +		clr |= KVM_PTE_LEAF_ATTR_HI_S2_DBM;
> > > > +	}
> > > > +
> > > This block makes it pretty evident that the DBM bit really *is* the
> > > write permission bit. I'd much rather we introduce the concept of dirty
> > > state to the page table library and migrate the abstract write
> > > permission to the DBM field, even if we don't have FEAT_HAFDBS.
> > >
> 
> Ohh, that's an amazing idea!

Thinking about that again...
If we adopt the encoding with DBM being the write-permission bit, and all 
PTEs have it since the start, how can we have lazy-splitting happening?

Only way I think of is removing both DBM and S2_S2AP_W bit from writable 
PTEs during dirty-track enable, and re-adding them during the first write 
fault. If we don't remove the DBM bit, systems with HDBSS would just dirty 
it by hardware, without causing a fault.

DBM=0 would need to happen only in the first write-protect (only on 
lazy-splitting). All other write-protecting would just clean the S2_S2AP_W 
bit, as everything is already split.  

Is that what was intended?

Thanks!
Leo

