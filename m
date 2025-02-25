Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC08FC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3zE8TwrO4+11yKZtBF3E2btmQOgEejie+CjvDtqOFw=; b=ckCdB2IWWajVNs67jrfs0IB6Ai
	4Yw+YVBlNrKiSINVCqr7WHsICjoCViVot+QmqQkBR98Pr8tgrbpLSYcKG609J/c2rlt9CgMzelEIC
	QqJrYIrTVrDi+ACTWQZBZVrIQu5SpY8/KJ8szsBBv0BZBqXwFtsP5hJ0PcrV9YWbjNmWlWJCP4hPr
	x/Gzr+4acD5WMeqYJrbxApeYaAXe59jni9nmkH7l25HK19Fro584pZOFTLnp1sgcBJkShg+/2Mtvy
	+X+lkPvkSwEMiTPq89XqZ2mdyy0nOgW4oaDIV/32i6Cvht/oRm759fekwEkev7ZCozhWLMllXEznF
	uj+8NZ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxxD-00000000Fsq-3kiJ;
	Tue, 25 Feb 2025 16:38:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmvMI-0000000HQut-197p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 13:52:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B235152B;
	Tue, 25 Feb 2025 05:52:41 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC5003F6A8;
	Tue, 25 Feb 2025 05:52:23 -0800 (PST)
Date: Tue, 25 Feb 2025 13:52:18 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Explicit cast conversions to correct data type
Message-ID: <Z73LEkHklpjvIlmZ@J2N7QTR9R3.cambridge.arm.com>
References: <20250219035646.536707-1-anshuman.khandual@arm.com>
 <Z724Q1ofM1GvKquV@J2N7QTR9R3>
 <9e1721a1-54a4-4007-a0f5-d651f5f21ae2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e1721a1-54a4-4007-a0f5-d651f5f21ae2@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_055226_359929_F991E948 
X-CRM114-Status: GOOD (  21.10  )
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

On Tue, Feb 25, 2025 at 01:00:40PM +0000, Ryan Roberts wrote:
> On 25/02/2025 12:32, Mark Rutland wrote:
> > On Wed, Feb 19, 2025 at 09:26:46AM +0530, Anshuman Khandual wrote:
> >> From: Ryan Roberts <ryan.roberts@arm.com>
> >>
> >> When CONFIG_ARM64_PA_BITS_52 is enabled, page table helpers __pte_to_phys()
> >> and __phys_to_pte_val() are functions which return phys_addr_t and pteval_t
> >> respectively as expected. But otherwise without this config being enabled,
> >> they are defined as macros and their return types are implicit.
> >>
> >> Until now this has worked out correctly as both pte_t and phys_addr_t data
> >> types have been 64 bits. But with the introduction of 128 bit page tables,
> >> pte_t becomes 128 bits. Hence this ends up with incorrect widths after the
> >> conversions, which leads to compiler warnings.
> > 
> > Does 128-bit page table not imply 52-bit PAs?
> 
> Not to my knowledge. For now the prototype code base is explicitly sticking to
> 48-bit PA and 44-bit VA (for initial simplicitly because that's the limit for 4
> levels).

Fair enough; info dump below, but hopefully nothing of consequence.

I assume that you're relying on the VMSAv9-128 PA bits [48:12] being in the
same place as in the VMSAv8-64 descriptors, and being handled by the same
PTE_ADDR_LOW mask that we use for CONFIG_ARM64_PA_BITS_52=n.

From a quick scan of ARM DDI 0487 L.a, the VMSAv9-128 translation table
descriptor format always contains a 56-bit PA (though PARange could be
smaller than that). Bits [51:49] are packed differently than in
VMSAv8-64 descriptors, and bits [55:52] are obviously new.

> >> Fix the warnings by explicitly casting to the correct type after doing the
> >> conversion.
> > 
> > I think it would be simpler and clearer if we replaced the macros with
> > functions, such that __pte_to_phys() and __phys_to_pte_val() are
> > *always* functions.
> 
> Yeah, agreed. This was initially just a hack I did to get things working.

Cool; sounds like we're aligned.

Mark.

