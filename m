Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBB9EDB7D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 09:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pnNhq6jFXWqnSModQUJAWzStAw4Oo5Fdv2CEVliu+So=; b=0E8MKHVz6b9pxNCrcIkecYhk8o
	bH+tps1wWZ2kMES9xqzRy9y7rxOcXxF/zvUPtMayhI2/BdIdiPNBHa8Rpz9ftrJrI7BEMAoD38JR7
	aLfhFxmOdizxfGtooGueaityOa+UWGDntQ2Q4XedRrDpUBKNVw7wD+ckgVnTyEJrUXqC+UQ3jPg7Y
	eb8S/VIrZmJfAJksq70KAMqtdiuNM4SYO9okxTRL0yiE6mPh5TeCtwImy37LJnIwikHVhjWKtW4N2
	4IWX0+6Rir7aCUqrlj/Ccq8DPjjiwZ0cqbg0LNK2PUNUxd2db7LyMwtvOQ1q4rxbJ5nu0cmRlUgxL
	CfLYkE2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2am-00000006DRg-0mex;
	Tue, 07 Apr 2026 09:19:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2ak-00000006DRI-3AuY
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 07 Apr 2026 09:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pnNhq6jFXWqnSModQUJAWzStAw4Oo5Fdv2CEVliu+So=; b=D7QQcrgLiuI2ySI8KLtnnvytU2
	BJ30cTtzEhMpLw9E5K7KrHSgADqmQsEBh9B3vLzXyMy+vszD8jjRy69AHV3Q2rGH/u0H0xmDQmtpp
	vnJok9LQ9iVkbePj3mOGESix3XmqrUxfXU+a+vdwPETc8ndHPVJAwYXECA3f+MNKVP3NnWJq16GYi
	cz52t0JwXJvI5Sq5y06Qy+eOb2ekLOWzyfHf/xuNdy2HkmFSmF5jMgqkipGWbVQCUOKVtuM2tHgKX
	KpJCDXqUpZTSHUzSU7Uox+FiSLM6Ze9ERvHlil8BSJ66OJgpOI+6UkrFI+nNl0wrb8BXkNKzKZwPc
	Y5QoQ/mg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2ag-00000007v85-42PL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 09:19:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2A671A00;
	Tue,  7 Apr 2026 02:19:14 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06B733F7D8;
	Tue,  7 Apr 2026 02:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775553560; bh=BkwEBj8W525ocnu66Qj8mQxpO4CVD0nQ+xuY/hsT/6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=heEz3+lB8qCnbyoY8jWEfi1x8w3wgS4ZVS2TS9nXCnF2tiBYh58sQXHAinlQ5yN5r
	 PeH6elIIVZUzfEpc4LF8y1ZxNlbK9IX9mN/QnImlPxzuEeRw/Vok6kfbIW+cVcpT8y
	 7MErmbi5Zn6H36qYEwaclDLSw58JXiAn5aJk5hDQ=
Date: Tue, 7 Apr 2026 10:19:16 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Dev Jain <dev.jain@arm.com>, Yang Shi <yang@os.amperecomputing.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: mm: Fix rodata=full block mapping support
 for realm guests
Message-ID: <adTMFFljx862f7TF@arm.com>
References: <20260330161705.3349825-1-ryan.roberts@arm.com>
 <20260330161705.3349825-2-ryan.roberts@arm.com>
 <ac7VD4Z85nS30GCp@arm.com>
 <160ec79a-f842-421a-bfde-5b4da32b3b4e@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160ec79a-f842-421a-bfde-5b4da32b3b4e@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_101923_452518_B40C72ED 
X-CRM114-Status: GOOD (  43.46  )
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

On Tue, Apr 07, 2026 at 09:33:50AM +0100, Ryan Roberts wrote:
> On 02/04/2026 21:43, Catalin Marinas wrote:
> > On Mon, Mar 30, 2026 at 05:17:02PM +0100, Ryan Roberts wrote:
> >>  int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
> >>  {
> >>  	int ret;
> >>  
> >> -	/*
> >> -	 * !BBML2_NOABORT systems should not be trying to change permissions on
> >> -	 * anything that is not pte-mapped in the first place. Just return early
> >> -	 * and let the permission change code raise a warning if not already
> >> -	 * pte-mapped.
> >> -	 */
> >> -	if (!system_supports_bbml2_noabort())
> >> -		return 0;
> >> -
> >>  	/*
> >>  	 * If the region is within a pte-mapped area, there is no need to try to
> >>  	 * split. Additionally, CONFIG_DEBUG_PAGEALLOC and CONFIG_KFENCE may
> >>  	 * change permissions from atomic context so for those cases (which are
> >>  	 * always pte-mapped), we must not go any further because taking the
> >> -	 * mutex below may sleep.
> >> +	 * mutex below may sleep. Do not call force_pte_mapping() here because
> >> +	 * it could return a confusing result if called from a secondary cpu
> >> +	 * prior to finalizing caps. Instead, linear_map_requires_bbml2 gives us
> >> +	 * what we need.
> >>  	 */
> >> -	if (force_pte_mapping() || is_kfence_address((void *)start))
> >> +	if (!linear_map_requires_bbml2 || is_kfence_address((void *)start))
> >>  		return 0;
> >>  
> >> +	if (!system_supports_bbml2_noabort()) {
> >> +		/*
> >> +		 * !BBML2_NOABORT systems should not be trying to change
> >> +		 * permissions on anything that is not pte-mapped in the first
> >> +		 * place. Just return early and let the permission change code
> >> +		 * raise a warning if not already pte-mapped.
> >> +		 */
> >> +		if (system_capabilities_finalized())
> >> +			return 0;
> >> +
> >> +		/*
> >> +		 * Boot-time: split_kernel_leaf_mapping_locked() allocates from
> >> +		 * page allocator. Can't split until it's available.
> >> +		 */
> >> +		if (WARN_ON(!page_alloc_available))
> >> +			return -EBUSY;
> >> +
> >> +		/*
> >> +		 * Boot-time: Started secondary cpus but don't know if they
> >> +		 * support BBML2_NOABORT yet. Can't allow splitting in this
> >> +		 * window in case they don't.
> >> +		 */
> >> +		if (WARN_ON(num_online_cpus() > 1))
> >> +			return -EBUSY;
> >> +	}
> > 
> > I think sashiko is over cautions here
> > (https://sashiko.dev/#/patchset/20260330161705.3349825-1-ryan.roberts@arm.com)
> > but it has a somewhat valid point from the perspective of
> > num_online_cpus() semantics. We have have num_online_cpus() == 1 while
> > having a secondary CPU just booted and with its MMU enabled. I don't
> > think we can have any asynchronous tasks running at that point to
> > trigger a spit though. Even async_init() is called after smp_init().
> 
> Yes I saw the Sashiko report, but we had previously had a (private) discussion
> where I thought we had already concluded that this approach is safe in practice
> due to the way that the boot cpu brings the secondaries online.

Yes, I thought I'd mention it. I don't see how this could go wrong in
practice as we don't expect any page splitting on the primary CPU while
it waits for the secondaries to come up.

> > An option may be to attempt cpus_read_trylock() as this lock is taken by
> > _cpu_up(). If it fails, return -EBUSY, otherwise check num_online_cpus()
> > and unlock (and return -EBUSY if secondaries already started).
> 
> That sounds neat; I could dig deeper and have a go at something like this if you
> want?

I don't think it's worth it. We'll probably need to keep the lock for
the duration of the splitting (though that's only before the cpu
features are fully initialised). It's something we can look into if we
ever see an issue here. For now, the num_online_cpus() test will do.

> > Another thing I couldn't get my head around - IIUC is_realm_world()
> > won't return true for map_mem() yet (if in a realm). Can we have realms
> > on hardware that does not support BBML2_NOABORT? We may not have
> > configuration with rodata_full set (it should be complementary to realm
> > support).
> 
> My understanding is that this is a pre-existing (and known) bug. It's not
> related to the "map linear map by large leaves and split dynamically" feature so
> wasn't attempting to fix it.

Yes, it's an existing bug I noticed while trying to understand the code
paths. It doesn't need any action on this series but we should try to
fix it separately.

-- 
Catalin

