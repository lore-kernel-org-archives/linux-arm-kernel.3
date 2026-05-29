Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3843FCD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 04:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eaGfYqsccDWsJTN0WYM3ff7hRWxPyaL2TevoJQw06eY=; b=2StoyXdwkq4tLKQy/8pM7oGSrx
	XOJaWMRnebfswOuG0cVGo4xHVuHyie7KuPXI7LsSmvbzbcKYikot9ZHXZoo8I2cPu18z7dU8ObK7X
	4kazoDv9VQz22Q6a8a9U629Qy1Eh9gv4T14wlTQaM8v6phaw6622z62NQgxwGXOyZlOG+CkfP+tQZ
	IwZ/qv1NpDlixphVOfmL8NVxuToFfvXNyY7IVhf939eW/S1TYvCXKUSonqCRY1cI5VYtpqWCIRDZl
	H1R4gBVtCTv7xuaYVAM0XG3oJYAe1jatUKr6YBk8ZvJNtrg4vdx1r933ymgonSeo3j/dnONW8juC6
	nWiDvVZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSoR5-00000006iNS-3th2;
	Fri, 29 May 2026 04:03:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSoR2-00000006iMu-3GJs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 04:03:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B0CC16A3;
	Thu, 28 May 2026 21:02:52 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82F1E3F7B4;
	Thu, 28 May 2026 21:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780027377; bh=eDyqfPL3Tk2ANdqi4jSCbSbhgcCNem97wosvoWpsFcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OOY3mvD22sd6y3WIPIIBcAbQvrNOHJdbg8VSwgi08Y8G4+HVYqhi78mSOgyEElCPS
	 Ro423BqzSe1PsgPppGukcVfWG5BAtkTRz5nbljRvC3GK70b/CNF/WOmP+OAVY9L0p6
	 3RicJRMfamLoi/GNNA6iHWitua0Dnln1bXAOOp9Y=
Date: Fri, 29 May 2026 09:32:52 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Usama Arif <usama.arif@linux.dev>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC V2 13/14] arm64/mm: Add an abstraction level for tlbi_op
Message-ID: <ahkP7IWLX-0QCoul@a079125.arm.com>
References: <20260513044547.4128549-1-anshuman.khandual@arm.com>
 <20260513044547.4128549-14-anshuman.khandual@arm.com>
 <37917d56-ae26-4789-ac4c-15f8ee12398b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37917d56-ae26-4789-ac4c-15f8ee12398b@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_210300_936133_97302F24 
X-CRM114-Status: GOOD (  16.75  )
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

Hi Ryan,

On Wed, May 27, 2026 at 03:50:10PM +0100, Ryan Roberts wrote:
> On 13/05/2026 05:45, Anshuman Khandual wrote:
> > From: Linu Cherian <linu.cherian@arm.com>
> > 
> > With FEAT_D128, a new instruction aka TLBIP is being introduced for the TLB
> > range operations which has an argument size of 128 bit.
> 
> nit: TLB range operations -> TLBI-by-range operations ?

Ack.

> 
> > 
> > Add an abstraction level to void (*tlbi_op)(u64 arg) helpers to support the
> > D128 variations when applicable.
> > 
> > No functional changes are introduced with this patch.
> > 
> > Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > ---
> >  arch/arm64/include/asm/tlbflush.h | 70 ++++++++++++++++---------------
> >  1 file changed, 37 insertions(+), 33 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> > index c0bf5b398041..361d74ef8016 100644
> > --- a/arch/arm64/include/asm/tlbflush.h
> > +++ b/arch/arm64/include/asm/tlbflush.h
> > @@ -162,49 +162,53 @@ static inline void sme_dvmsync_batch(struct arch_tlbflush_unmap_batch *batch)
> >  
> >  #define TLBI_TTL_UNKNOWN	INT_MAX
> >  
> > -typedef void (*tlbi_op)(u64 arg);
> > +typedef u64 tlbi_args_t;
> 
> nit: tlbi_args_t -> tlbi_arg_t ?

Ack.


--
Thanks,
Linu Cherian.

