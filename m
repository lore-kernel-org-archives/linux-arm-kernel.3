Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E826DCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 04:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ZOl6v+wdP3otqdDpJkJ+aZKDcVCfxwf60saQVERFOU=; b=CqnasbU28dOCBEB+RfdkRLtMil
	oLvFyumWUG1Tl2rRIQbULZJiG5geBA6vzqJ+yF2A9UmU1WVQ+udigovjY/rih1Ll3GKzlL1ybYCtv
	iQ/xq8DQo1oL56KincK2Y1NhQQ/XLPpv/3r+52cGnF0Mt6Y9SzLtJRzzES2ecVPSIBnoHRovduHbK
	NvBTtZ5mffuftSVqoKPpX8fNxZD5/gWTtHCeZcvkYi37/284RPUciCuvA3oZk/gPPVGhZIT9ttv0B
	EfjUpmueOgSrZa8aJOe9w3Cfyy2UmnmleOnPdAS1a1zbT8ygr9TuZ4JmPPTKgNDl5OCgSGubbynVS
	NHeKwlsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8t2F-00000000Py5-1Up8;
	Wed, 15 Oct 2025 04:22:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8t2D-00000000PxZ-25LE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 04:22:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E7C21A32;
	Tue, 14 Oct 2025 21:22:36 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2BB13F6A8;
	Tue, 14 Oct 2025 21:22:43 -0700 (PDT)
Date: Wed, 15 Oct 2025 09:52:40 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Zhenhua Huang <quic_zhenhuah@quicinc.com>,
	Dev Jain <dev.jain@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>
Subject: Re: [PATCH v2 1/2] arm64/mm: Allow __create_pgd_mapping() to
 propagate pgtable_alloc() errors
Message-ID: <aO8hkMtIQ0YjqTRt@a079125.arm.com>
References: <20251013080220.2027757-1-linu.cherian@arm.com>
 <20251013080220.2027757-2-linu.cherian@arm.com>
 <87f23627-d0cc-4d9a-a4f8-df1f61716b04@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87f23627-d0cc-4d9a-a4f8-df1f61716b04@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_212245_583290_F1208E69 
X-CRM114-Status: GOOD (  14.76  )
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

Hi Kevin,

On Tue, Oct 14, 2025 at 11:29:05AM +0200, Kevin Brodsky wrote:
> On 13/10/2025 10:02, Linu Cherian wrote:
> > [...]
> >
> > @@ -1877,23 +1926,30 @@ int arch_add_memory(int nid, u64 start, u64 size,
> >  	if (force_pte_mapping())
> >  		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
> >  
> > -	__create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
> > -			     size, params->pgprot, pgd_pgtable_alloc_init_mm,
> > -			     flags);
> > +	ret = __create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
> > +				   size, params->pgprot, pgd_pgtable_alloc_init_mm,
> > +				   flags);
> > +
> 
> Nit: usually no empty line between a call and a trivial if (ret).

Ack.

> 
> > +	if (ret)
> > +		goto out;
> >  
> >  	memblock_clear_nomap(start, size);
> >  
> >  	ret = __add_pages(nid, start >> PAGE_SHIFT, size >> PAGE_SHIFT,
> >  			   params);
> >  	if (ret)
> > -		__remove_pgd_mapping(swapper_pg_dir,
> > -				     __phys_to_virt(start), size);
> > +		goto out;
> >  	else {
> >  		/* Address of hotplugged memory can be smaller */
> >  		max_pfn = max(max_pfn, PFN_UP(start + size));
> >  		max_low_pfn = max_pfn;
> >  	}
> >  
> > +	return 0;
> > +
> > +out:
> 
> Nit: since this is an error path, it'd be clearer to call the label
> "err" rather than "out".

Ack.

Thanks,
Linu Cherian.

