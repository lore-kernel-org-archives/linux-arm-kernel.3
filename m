Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC37606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 04:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DBOjbYrc;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Szc8bvtd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mUqu+6HsBuPxnZ0xvfhrdFnRGtvir4qjhgMAVr4T9Ko=; b=DBOjbYrc9+gD+4b7Cdng1YFBlN
	0GsN+swzDdKMIsM0a8paC8yFyp+jHaTf5dcEEyIfXvvfzETKaS3DkNwXhtWjylEO1pBndO5B/nbKT
	WB7ErsEo/TAWN6CBjYeAST5SaskMvXy7isPRUzPh4EyX9Ysw5umIAymELiu1Jpqu8at0NfzUZ66N+
	fTdUswaywzNEKJ2TE2iNVbYNpiTZpKQTGsUJOgwBlEFW5aYXVccr5Tzzy/gjC1P8y4F3dddxWM/z7
	CDsRZnxcAuO8EIiXhBAbJu9XbkbbaHeFvkXtIE21hmgfCK1yzBbjeKX4mOBapDpJ8Dc0GCKc7I2Gl
	j618TOTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNN0O-0000000Ds3z-1IRv;
	Sun, 01 Nov 2026 04:17:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNN0M-0000000Ds3q-1gWb;
	Sun, 01 Nov 2026 04:17:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B672A4095F;
	Sun,  1 Nov 2026 04:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3681F000C1;
	Sun,  1 Nov 2026 04:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793506633;
	bh=mUqu+6HsBuPxnZ0xvfhrdFnRGtvir4qjhgMAVr4T9Ko=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Szc8bvtdgyfePD3Lcy+welmLY8PIM/MtSN+SWIMLPjyxSAUjFYbtzX/kg/Gk5W6ob
	 AYPG16F5BppYWK28ekq6B4oHkbVsa+lhdlIX9kk2K7luf1zP8bvyIiQlN7cxKLefnz
	 AoI6Ac242CTEeqI3aifav4i4kabOUAzpWrpQTkliA8ZqivaSs5YfaonNvidpfoWMJa
	 6jPJ8xnrDXxGgY7hl5m0qHxKAk5XJempL3eDIBY50vaX+CFknAYUnPM1R+RrTcypkl
	 ukEcKPlOK+p0kKrGynfvdOLrmP1tOsJWpENln+kYeylBrjzAxWzp/+bUv9vsW/XkIc
	 9w+/Glq+JuypQ==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v6 6/8] dma: swiotlb: Centralize memory-encryption pool
 sizing
In-Reply-To: <auR0fT1yrKQ9wbm8@FCCLS0092175.localdomain>
References: <20260924060756.1325156-1-aneesh.kumar@kernel.org>
 <20260924060756.1325156-7-aneesh.kumar@kernel.org>
 <asVs3doaJ4WrT3M2@willie-the-truck> <asYZFXGyafRjjBS0@arm.com>
 <asYiOgskwi8JYLe_@willie-the-truck> <yq5awlrt3dwo.fsf@kernel.org>
 <yq5av77c92oo.fsf@kernel.org> <aseRzPshcoys7AJS@arm.com>
 <yq5ao6d48dqr.fsf@kernel.org> <auR0fT1yrKQ9wbm8@FCCLS0092175.localdomain>
Date: Sun, 01 Nov 2026 09:47:05 +0530
Message-ID: <yq5a8q3d9oe6.fsf@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Kohei Enju <enju.kohei@fujitsu.com> writes:

> On 10/08 20:02, Aneesh Kumar K.V wrote:
>> Catalin Marinas <catalin.marinas@arm.com> writes:
>> 
>> > On Thu, Oct 08, 2026 at 11:03:27AM +0530, Aneesh Kumar K.V wrote:
>> >> Aneesh Kumar K.V <aneesh.kumar@kernel.org> writes:
>> >> > Will Deacon <will@kernel.org> writes:
>> >> >> On Wed, Oct 07, 2026 at 11:04:05AM +0100, Catalin Marinas wrote:
>> >> >>> On Tue, Oct 06, 2026 at 10:49:17PM +0100, Will Deacon wrote:
>> >> >>> > On Thu, Sep 24, 2026 at 11:37:54AM +0530, Aneesh Kumar K.V (Arm) wrote:
>> >> >>> > > @@ -496,7 +516,8 @@ swiotlb_select_pool_policy(unsigned int flags)
>> >> >>> > >  	if (swiotlb_force_disable)
>> >> >>> > >  		return SWIOTLB_POOL_NONE;
>> >> >>> > >  
>> >> >>> > > -	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
>> >> >>> > > +	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
>> >> >>> > > +	    !restricted_dma_pool_present)
>> >> >>> > >  		return SWIOTLB_POOL_CC_GUEST;
>> >> >>> > 
>> >> >>> > I think this check on the restricted DMA pool is too general -- the pool
>> >> >>> > could be tied to a specific DMA-capable peripheral and so treating its
>> >> >>> > presence as a global property isn't right.
>> >> >>> 
>> >> >>> I agree it's a hack but that was the simplest way to avoid the pVMs
>> >> >>> getting a bounce buffer after this patch. More than happy to leave it
>> >> >>> out and reduce the buffer on cmdline or we come up with some better
>> >> >>> heuristics.
>> >> >>
>> >> >> Hrm, that does mean that reverting just this part will regress pVMs
>> >> >> because they'll suddenly be allocating a tonne more memory for an
>> >> >> entirely unused swiotlb buffer. So I think I'd prefer to drop the entire
>> >> >> series until this has been worked out properly.
>> >> >>
>> >> >>> Another option could be the arch code passing another flag that it
>> >> >>> doesn't want an encrypted pool (e.g. when running in a pKVM guest) but I
>> >> >>> don't particularly this either. The arch code doesn't know whether
>> >> >>> there's an alternative pool.
>> >> >>
>> >> >> At that point, the default size may as well be driven by the
>> >> >> drivers/virt/coco driver.
>> >> >>
>> >> >>> That said, such heuristics should have been a separate patch to make it
>> >> >>> easier to review/drop.
>> >> >>
>> >> >> I think the only right way to get a semi-accurate heuristic is to take
>> >> >> into account the set of dma-capable devices that will use the swiotlb
>> >> >> pool, but that's fiddly and should probably be tackled as a separate
>> >> >> series. Maybe a simpler hack in that direction would be to take the
>> >> >> SWIOTLB_POOL_CC_GUEST if _any_ device is going to use swiotlb? You'll
>> >> >> run into the usual problem of not being able to tell if a device is
>> >> >> DMA-capable or not, but you could probably look for a global restricted
>> >> >> DMA pool and, if that doesn't exist, check for per-device restricted pools
>> >> >> on dma-coherent devices (since restricted DMA isn't supported by ACPI) as
>> >> >> a reasonable approximation.
>> >> >
>> >> > So, something like this?
>> >> >
>> >> > 	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
>> >> > 	    swiotlb_cc_guest_needs_default_pool())
>> >> > 		return SWIOTLB_POOL_CC_GUEST;
>> >> >
>> >> 
>> >> Detecting a DMA-capable device is not straightforward, and if we get it
>> >> wrong, we will enable SWIOTLB_POOL_CC_GUEST unnecessarily. Would the
>> >> code below be a reasonable approximation of what you suggested?
>> >> 
>> >> Another option would be to make swiotlb_cc_guest_needs_default_pool() a
>> >> weak function that architectures can override. arm64 pKVM could then use
>> >> a different scheme (for this patch series default to false). Would that
>> >> be preferable?
>> >
>> > Even the rmem check for each device is still a hack that may bite us in
>> > the future (private devices for example would not need swiotlb). I'm
>> > thinking more and more of leaving the sizing an arch-specific decision,
>> > don't bother generalising it at all.
>> >
>> > On pKVM vs CCA guests, there's really nothing specific here to pKVM
>> > guests. The only difference is that confidential guests that so far have
>> > run without a swiotlb buffer will regress if their memory is tight. For
>> > confidential guests without dedicated rmem (either CCA or pKVM), I think
>> > our options are either command line swiotlb sizing or dynamic swiotlb.
>> >
>> > Could you respin your series while leaving out the generic sizing? IOW,
>> > no x86 code generalisation. We can discuss the best strategy on sizing
>> > later (I haven't checked how much of this series still makes sense
>> > without the generic sizing).
>> >
>> 
>> It would mostly consist of the first three cleanup patches, followed by
>> three patches that replace the addressing_limit argument with flags.
>> 
>> #define SWIOTLB_VERBOSE	(1 << 0) /* verbose initialization */
>> /* Initialize a pool for devices with limited DMA addressing. */
>> #define SWIOTLB_INIT_ADDRESSING_LIMIT	(1 << 1)
>> /* Initialize a pool that requires architecture remapping. */
>> #define SWIOTLB_INIT_REMAP		(1 << 2)
>> /* Initialize a pool for DMA to memory-encrypted host or guest memory. */
>> #define SWIOTLB_INIT_MEM_ENCRYPT		(1 << 3)
>> /* Initialize a pool for unaligned kmalloc bouncing. */
>> #define SWIOTLB_INIT_KMALLOC		(1 << 4)
>> /* Do not initialize a pool unless SWIOTLB is explicitly required. */
>> #define SWIOTLB_INIT_DEFAULT_OFF		(1 << 5)
>> 
>> This results in the large change below. I'm not sure we want to do this
>> for no real benefit other than making swiotlb_should_init() slightly
>> easier to follow.
>> 
>> static bool __init swiotlb_should_init(unsigned int flags)
>> {
>> 	if (swiotlb_force_disable)
>> 		return false;
>> 
>> 	if (swiotlb_force_bounce)
>> 		return true;
>> 
>> 	if (flags & (SWIOTLB_INIT_REMAP | SWIOTLB_INIT_MEM_ENCRYPT)))
>> 		return true;
>> 
>> 	/* Explicit requirements override an architecture's default opt-out. */
>> 	if (flags & SWIOTLB_INIT_DEFAULT_OFF)
>> 		return false;
>> 
>> 	return flags & (SWIOTLB_INIT_ADDRESSING_LIMIT | SWIOTLB_INIT_KMALLOC);
>> }
>>  [...]
>
> Hi Aneesh,
>
> I can reproduce the CCA regression discussed in this thread:
>   https://lore.kernel.org/all/yq5azeyxyfol.fsf@kernel.org/#t
>
> The guest runs out of SWIOTLB slots, causing disk I/O to fail and
> preventing the guest from booting.
>
> I would like to test the fix on real CCA hardware. Could you please Cc
> me when you respin the series? I follow LKML, but I may still miss the
> posting by chance.
>

The conclusion was to either use CONFIG_SWIOTLB_DYNAMIC or swiotlb kernel command line
option

-aneesh

