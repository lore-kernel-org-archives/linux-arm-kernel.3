Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90466C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 04:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MaOGTKqs4zCtYD2EtLkk0CPkV3ZOn17wZw1VeEEVBTA=; b=2FQ/jDll3pCJ7N1HnQHRpZZXoh
	7J3+hlYiuHVSih91MpD7QSl1PK1IfgStBvBKSJZ6X4dwqAxYwfMC4eYhgEOx+wlSF57B71PyNDEzW
	7ku0GOxtrB5CtkT4LPkly5AK5cqB8qCz3If6mlTrCBDlJMfF937UUI7Ua5dPrO8iPiheXZ7I6ILkF
	Lu/SMeleeMTMFos3PHxb/fP/UEbZawGVqto16CJBJ7sfILyrCny+RPrvTcGm9o2PSGVpDb4fZfMag
	OV3JvLZl6+gFzoNlosZ5yitSnSvih9P1wgnVWutswiVO0Sj0nE5EcHCxlMPW4Cw9mLJs4fCBhrFhM
	SM84XRfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x73Qu-0000000AYQ3-2cCI;
	Thu, 17 Sep 2026 04:09:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x73Qt-0000000AYPi-0djP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 04:09:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDD791476;
	Wed, 16 Sep 2026 21:09:03 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 912E13F882;
	Wed, 16 Sep 2026 21:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789618147; bh=5GXteUxX4b4RFIQjbUzEzoICCQe6hAeor7DxccEGQU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HAHadbtUWor+UPPD2El1Ab1cLvu9Izc8++N5S4s7CeE7KFBgmGEZXWsnXfIuWP4Mv
	 HAc+BNzsQF5s88XfpBnGVobDPR0JDXHHP72RfKJDuZ8wxOXfQO4WHUOU6lXIN9UU+Y
	 +Bi0DzCzabD1DvTrF3pC9rUTS22Ux+BhRv3HIZDc=
Date: Thu, 17 Sep 2026 09:39:03 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH V2 05/14] arm64/mm: Override read-write accessors for
 vm_page_prot
Message-ID: <gyb53u42u6klaqvkqdzsqjp6tzjrywnfi6ceg4a2p7nxftbll2@wi7i7sytr46a>
References: <20260907035030.2839978-1-anshuman.khandual@arm.com>
 <20260907035030.2839978-6-anshuman.khandual@arm.com>
 <51993407-083f-45b7-990b-105a0c08a5a0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51993407-083f-45b7-990b-105a0c08a5a0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_210911_237664_E0128676 
X-CRM114-Status: GOOD (  15.66  )
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

On Wed, Sep 16, 2026 at 03:39:31PM +0200, David Hildenbrand (Arm) wrote:
> On 9/7/26 05:50, Anshuman Khandual wrote:
> > Override pgprot_[read|write]() accessors using ptval_[get|set]() providing
> > required single copy atomic operation for vma->vm_page_prot.
> > 
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > ---
> >  arch/arm64/include/asm/pgtable.h | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> > index 66bf5bbe484e..2b457db19be0 100644
> > --- a/arch/arm64/include/asm/pgtable.h
> > +++ b/arch/arm64/include/asm/pgtable.h
> > @@ -122,6 +122,18 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
> >  	return ptval_get(*pgdp);
> >  }
> >  
> > +#define pgprot_read pgprot_read
> > +static inline pgprot_t pgprot_read(pgprot_t *prot)
> > +{
> > +	return ptval_get(*prot);
> > +}
> 
> Similarly a const pointer here.

OK - will change.

> 
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> 
> -- 
> Cheers,
> 
> David

