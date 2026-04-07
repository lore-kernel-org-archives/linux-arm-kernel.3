Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93B0FF5126
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 17:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEueyiVBNDcr5Fo0H+GtO1sxzYxvbo+EWZ6ibIcH5+8=; b=r0pzblfaNu8AYvjUaubZEUiNKB
	F2yp+hZ1P2dxNwnHOmi+Lb+aHBM3pW6e2tbwuLd+iP7I6ZnRY4nN9pIi5ErD+FSQmj6rrZ7v72W36
	vfNxGQzP4pwiRJ0e0U7prvXkYBpXAjbJvrkHbbEOuFx4zCnBXSurnr0sBUh35quwRGqOxIG4TRzdF
	+LIINiLyIn+vFH2F716Eoq3TEMAjsDKh+gPxREKo6nrn6LjT3dBZkx4dyqTMFLdJiiOSKrQymWF6Q
	QP3NbC2yp8Ys1hl3GSirz4LC3cA7gdMDy+65c/bnLBuJcgfbPzME5CaRffuS+a3bYIawa4wkPzX/0
	Ub7JCKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAA7j-00000006rPX-2PFV;
	Tue, 07 Apr 2026 17:21:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAA7i-00000006rPN-0sCD
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 07 Apr 2026 17:21:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uEueyiVBNDcr5Fo0H+GtO1sxzYxvbo+EWZ6ibIcH5+8=; b=fe/IK1Gk4EaoIe2ir67jCtwPA+
	sZmXoI7WhmbPX9tBg7YK7r1b6qg8nY4IPKeq4SbhALGUyFhYwI5XazMATlG/d6c0DlGWcVKbAT65R
	mtBhpRdFZjo5FQUkKzoYdyxt/SF5nXTAy6tTkLxnBc19TJaC5xRLtNreW73dLBItCxnn1oZ44GEQW
	6vbizhsQyfjuUwM7ajpJayeyOuD3Sx2TmFt3WkyRTi6DFkylXpufqkXEWkjaEBUN8HQgFNmB7sDTU
	f7+ILe6hq7vKM1efNUN4ay3OtDzbvpbgg0rThphN67WOPe1k3srAedoOUG3bT+zYCKDJR/KIFb3hI
	li3zCDKQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAA7e-00000008lv9-1JSh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 17:21:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 216B032E3;
	Tue,  7 Apr 2026 10:21:46 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D52E3F7D8;
	Tue,  7 Apr 2026 10:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775582511; bh=vE/AzNTfxAsg7nwOsnitaQKhZsQBUYcc/ffth8fx+bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h7Z3X3BK/362O7Vz9OIZI86q27eRa/LA1xc0dXRnrXZUnIpaHf0rKSF7N80DEBhWO
	 AGzbcJ48pRiJUqTA+qqJHR05e1ozCHdLAuAUdJ4i+s13fq0yXHT+eAP1EhBD2Wd1vh
	 31Ycs7Bp/OQ/017uELGc0nViD+mDktdsld9TwgKM=
Date: Tue, 7 Apr 2026 18:21:47 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Dev Jain <dev.jain@arm.com>, Yang Shi <yang@os.amperecomputing.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: mm: Fix rodata=full block mapping support
 for realm guests
Message-ID: <adU9KxLC7yKgmyJy@arm.com>
References: <20260330161705.3349825-1-ryan.roberts@arm.com>
 <20260330161705.3349825-2-ryan.roberts@arm.com>
 <ac7VD4Z85nS30GCp@arm.com>
 <1db93bd3-cb47-445b-b8ca-6de6f04b41cc@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1db93bd3-cb47-445b-b8ca-6de6f04b41cc@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_182154_789763_45B46DD7 
X-CRM114-Status: GOOD (  39.20  )
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

On Tue, Apr 07, 2026 at 10:57:35AM +0100, Suzuki K Poulose wrote:
> On 02/04/2026 21:43, Catalin Marinas wrote:
> > On Mon, Mar 30, 2026 at 05:17:02PM +0100, Ryan Roberts wrote:
> > >   int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
> > >   {
> > >   	int ret;
> > > -	/*
> > > -	 * !BBML2_NOABORT systems should not be trying to change permissions on
> > > -	 * anything that is not pte-mapped in the first place. Just return early
> > > -	 * and let the permission change code raise a warning if not already
> > > -	 * pte-mapped.
> > > -	 */
> > > -	if (!system_supports_bbml2_noabort())
> > > -		return 0;
> > > -
> > >   	/*
> > >   	 * If the region is within a pte-mapped area, there is no need to try to
> > >   	 * split. Additionally, CONFIG_DEBUG_PAGEALLOC and CONFIG_KFENCE may
> > >   	 * change permissions from atomic context so for those cases (which are
> > >   	 * always pte-mapped), we must not go any further because taking the
> > > -	 * mutex below may sleep.
> > > +	 * mutex below may sleep. Do not call force_pte_mapping() here because
> > > +	 * it could return a confusing result if called from a secondary cpu
> > > +	 * prior to finalizing caps. Instead, linear_map_requires_bbml2 gives us
> > > +	 * what we need.
> > >   	 */
> > > -	if (force_pte_mapping() || is_kfence_address((void *)start))
> > > +	if (!linear_map_requires_bbml2 || is_kfence_address((void *)start))
> > >   		return 0;
> > > +	if (!system_supports_bbml2_noabort()) {
> > > +		/*
> > > +		 * !BBML2_NOABORT systems should not be trying to change
> > > +		 * permissions on anything that is not pte-mapped in the first
> > > +		 * place. Just return early and let the permission change code
> > > +		 * raise a warning if not already pte-mapped.
> > > +		 */
> > > +		if (system_capabilities_finalized())
> > > +			return 0;
> > > +
> > > +		/*
> > > +		 * Boot-time: split_kernel_leaf_mapping_locked() allocates from
> > > +		 * page allocator. Can't split until it's available.
> > > +		 */
> > > +		if (WARN_ON(!page_alloc_available))
> > > +			return -EBUSY;
> > > +
> > > +		/*
> > > +		 * Boot-time: Started secondary cpus but don't know if they
> > > +		 * support BBML2_NOABORT yet. Can't allow splitting in this
> > > +		 * window in case they don't.
> > > +		 */
> > > +		if (WARN_ON(num_online_cpus() > 1))
> > > +			return -EBUSY;
> > > +	}
> > 
> > I think sashiko is over cautions here
> > (https://sashiko.dev/#/patchset/20260330161705.3349825-1-ryan.roberts@arm.com)
> > but it has a somewhat valid point from the perspective of
> > num_online_cpus() semantics. We have have num_online_cpus() == 1 while
> > having a secondary CPU just booted and with its MMU enabled. I don't
> > think we can have any asynchronous tasks running at that point to
> > trigger a spit though. Even async_init() is called after smp_init().
> > 
> > An option may be to attempt cpus_read_trylock() as this lock is taken by
> > _cpu_up(). If it fails, return -EBUSY, otherwise check num_online_cpus()
> > and unlock (and return -EBUSY if secondaries already started).
> > 
> > Another thing I couldn't get my head around - IIUC is_realm_world()
> > won't return true for map_mem() yet (if in a realm).
> 
> That is correct. map_mem() comes from paginig_init(), which gets called
> before arm64_rsi_init(). Realm check was delayed until psci_xx_init().
> We had a version which parsed the DT for PSCI conduit early enough
> to be able to make the SMC calls to detect the Realm. But there
> were concerns around it.

Ah, yes, I remember.

Does it mean that commit 42be24a4178f ("arm64: Enable memory encrypt for
Realms") was broken without rodata=full w.r.t. the linear map? Commit
a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full")
introduced force_pte_mapping() but it just copied the logic in the
existing can_set_direct_map(). Looking at the linear_map_requires_bbml2
assignment, we get (!is_realm_world() && is_realm_world()) and it
cancels out, no effect on it but we don't get pte mappings either (even
if we don't have BBML2).

I think we need at least some safety checks:

1. BBML2_NOABORT support on the boot CPU - continue with the existing
   logic (as per Ryan's series)

2. !system_supports_bbml2_noabort() - split in
   linear_map_maybe_split_to_ptes(). This does not currently happen
   because linear_map_requires_bbml2 may be false in the absence of
   rodata=full. Not sure how to fix this without some variable telling
   us how the linear map was mapped. The requires_bbml2 flag doesn't

3. Panic in arm64_rsi_init() if !BBML2_NOABORT on the boot CPU _and_ we
   have block mappings already. People can avoid it with rodata=full

4. If (3) is a common case, a better alternative is to rewrite the
   linear map sometime after arm64_rsi_init() but before we call
   split_kernel_leaf_mapping().

-- 
Catalin

