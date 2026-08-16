Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A394FC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 22:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ypNYetkXLMCgzOOJWnxrc0Mupc0mbGLRNdy1n8UW94=; b=T52uiSgfftHR2EkEZ708+ZIx+1
	Lw7kggJ4lKTAwkYiEvi3YdbS5qnRqu3OTvt09FoM5keoN+EbZhQMk6eZtI2jVVUoux7ZOIqjuh57L
	cUwosYSBXn55Warc2uWQVIKk9VwIkA0XANQCBXoS+FJsVn9aJ9+Ezv89DiKEoyaruRIcFtNUMNDHT
	W2k+6GdMIt1sEXDJ9Iw+ZMhl8kYVL0wBALywHdAv39mVwPYrC2Kw2BtWiw+34eZbXjDaSQJ4Y5ZtS
	6kxviNUe6IqeoqyG+V7lWOZqiyUJtwGWdlhJoyHru2PZFYNKQKcF1QVTgdLcbhzwqxPlP9rh6RbFY
	sCwuStsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvivV-000000058sc-43H0;
	Sun, 16 Aug 2026 22:01:57 +0000
Received: from esa7.hc1455-7.c3s2.iphmx.com ([139.138.61.252])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvivS-000000058sA-2qjo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 22:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1786917714; x=1818453714;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pVjiwzYXzj3mUBgzqtSSepmjg4P1MZh72aHgeka8p1w=;
  b=tNEaeQafuG+A+kEqNvW09DnKKqlLaCB3H6/zZ/lZ28c9v+BhPToaPZDK
   gEg/0XURAzPSdnLkB8I+qFaYNKtEaiTAb5FF+E5ZMtTB0Gvvi7HeV/ZbD
   +Ov4Lt+1iGnKHMXW4j69CTmRvMHuQJ+37BhoeoilZLVO1APwuGytKxOBn
   lpQT/052EIV6gB2vbCBbhK2a52Jv5a7qZIgyJB9dS/ImuW5znSmP43Ppd
   qa+P2miK32xQyJwIWrHXh0cm2dKTeK4M1ds4JqXgmw4xwg6WtVsUyUWC0
   hmQ8fmn54nKN+ysb08QzDSG6FTL6z71lKlH2MY3tAyCsQcMVlxFetwnYY
   g==;
X-CSE-ConnectionGUID: mpgM387YQCyKwwnEZgDfBQ==
X-CSE-MsgGUID: ckq1AV6qRQyb5kC8Knqi4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="230215717"
X-IronPort-AV: E=Sophos;i="6.25,227,1779116400"; 
   d="scan'208";a="230215717"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 07:01:50 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 22A09C015BB
	for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 22:01:50 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id D0BB4C170A5
	for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 22:01:49 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 46B28100008B;
	Sun, 16 Aug 2026 22:01:45 +0000 (UTC)
Date: Mon, 17 Aug 2026 07:01:42 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>
Subject: Re: [PATCH v5 2/6] KVM: arm64: nv: Introduce guest stage-2 tracking
 structures
Message-ID: <aoIzRuS6OSP68nHl@sm-arm-grace07>
References: <20260810205038.118843-1-weilin.chang@arm.com>
 <20260810205038.118843-3-weilin.chang@arm.com>
 <an5puT6fe3lOMY4Q@sm-arm-grace07>
 <y6gzme4o5lsitrjb5bua6vhloypeoluchcmi3ndlvl4e6t6od7@vgkqqf75i25e>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <y6gzme4o5lsitrjb5bua6vhloypeoluchcmi3ndlvl4e6t6od7@vgkqqf75i25e>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_150155_301862_57A8F299 
X-CRM114-Status: GOOD (  29.30  )
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

On Fri, Aug 14, 2026 at 11:42:24AM +0100, Wei-Lin Chang wrote:
> Hi,
> 
> On Fri, Aug 14, 2026 at 10:04:57AM +0900, Itaru Kitayama wrote:
> > On Mon, Aug 10, 2026 at 09:50:34PM +0100, Wei-Lin Chang wrote:
> > > In order to avoid unmapping all shadow stage-2 mappings when KVM
> > > receives a MMU notifier unmap call, we have to keep track of the
> > > canonical IPA -> nested IPA relationship of the shadow mappings
> > > created. This essentially means tracking the guest's stage-2.
> > > 
> > > To do this, represent each mapping by struct kvm_guest_s2_mapping. It
> > > stores the mapping's canonical IPA range and the nested IPA range using
> > > two interval tree nodes. Both nodes will be inserted into their
> > > respective interval trees called guest_s2_mappings. The canonical IPA
> > > ranges will be stored in the tree within the canonical MMU, and the
> > > nested IPA ranges will be stored in the corresponding nested MMU's tree.
> > > 
> > > For example:
> > > 
> > > struct kvm_guest_s2_mapping mapping1, mapping2;
> > > 
> > >     ---------------------> mapping2.canonical
> > >     |                      mapping1.canonical
> > >     |                          ^   (both stored in canonical mmu's tree)
> > >     |                          |
> > > --*****-----------------------*****----------- CIPA
> > >    \\\\\                      |||||                  mapping1.nested_mmu
> > >     \\\\\                     \\\\\                            |
> > >      \\\\\                     \\\\\                           v
> > > ------\\\\\---------------------*****--------- NIPA #1 (nested mmu #1)
> > >        \\\\\                      |
> > >         \\\\\                     -> mapping1.nested
> > >          \\\\\                       (stored in nested mmu #1's tree)
> > >           \\\\\
> > > -----------*****------------------------------ NIPA #2 (nested mmu #2)
> > >              |                                                 ^
> > >              -> mapping2.nested                                |
> > >                 (stored in nested mmu #2's tree)   mapping2.nested_mmu
> > > 
> > > Using the trees we can look up nodes in either of the IPA spaces, and
> > > for each node, find the corresponding range in the other IPA space from
> > > the other node in the enclosing kvm_guest_s2_mapping.
> > > 
> > > Define kvm_guest_s2_mapping and the interval tree here. Guest stage-2
> > > mapping tracking will come in subsequent patches.
> > > 
> > > Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> > > ---
> 
> [...]
> 
> > >  
> > > +/*
> > > + * Record of a guest stage-2 mapping, storing canonical and nested IPA
> > > + * ranges. Both ranges have the same size.
> > > + */
> > > +struct kvm_guest_s2_mapping {
> > > +	struct interval_tree_node canonical;
> > > +	struct interval_tree_node nested;
> > > +	struct kvm_s2_mmu *nested_mmu;
> > > +};
> > 
> > Is this to be used for normal (L1) guests? I guess this series is for
> > shadow stage 2 unmapping optimization, so not sure.
> 
> Sorry I don't totally understand your question. Yes this series is
> optimizing cases where a GPA (L1's PA) range have to be unmapped, from
> an MMU notifier unmap call.
> 
> When we want to unmap a GPA range, the corresponding L2PAs must also be
> unmapped from the shadow page tables. Before this series there is no way
> of knowing what L2PAs are affected, so the code just calls
> kvm_nested_s2_unmap() to unmap all shadow mappings.
> 
> Each struct kvm_guest_s2_mapping instance keeps one L1PA <-> L2PA
> mapping record. For example:
> 
> canonical (L1PA space): [x, x+4K)  <- node stored in canonical MMU tree
> nested (L2PA space):    [y, y+4K)  <- node stored in nested MMU tree
> 
> Does this make sense?

Yes, makes sense. I was mostly wondering about the sturct name,
kvm_guest_s2_mapping you introduced, since this is only needed for a guest 
acting as a hypervisor. No strong opinion.

Thanks,
Itaru.

> 
> Thanks,
> Wei-Lin Chang
> 
> > 
> > Thanks,
> > Itaru.
> > 
> 
> [...]

