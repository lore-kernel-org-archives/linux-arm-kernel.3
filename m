Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E216CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7NnV3eqraDFqVYDcKFCeKin09qktano3eAT2xMof4Q=; b=RVpSN79BXmgUrrpYx7tfC92Mpd
	7d1KifUiLzChwr5/7GrjHLdZInFgwTdf5slU2WzGAvOo0xS6wgDqFKK7hwsd/2qdFTaTTlLS/EO/b
	iRfbka4y6kjC4J1ZV/i3fowsYK+yfi6C83M9fyog9xiIFadUHLNaUgcFnmvvX/g0RSqZjK1GrniL+
	kauLAZPCDpKIZpIJDMrm9rugQ2xElLSIkgRtJ+EgwjWa3GTS7IfwfXQwRzSGuw5J9tfeTqf06Box5
	xreYmTABciQRQSdw46D+FSLCoE0oNZhZ5xcqyEyR0ert8ZMFSTz4BEMgeWxPhLljqqfvwZePwZRUB
	KBgfnK/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g6h-0000000CTu9-06JA;
	Fri, 03 Oct 2025 13:45:59 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g6f-0000000CTsx-0IQg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:45:58 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso1669906f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 06:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759499154; x=1760103954; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a7NnV3eqraDFqVYDcKFCeKin09qktano3eAT2xMof4Q=;
        b=2KUgRybN2Ovx/hhlegoApiNO2qA9O8BfOFCcaupVDB0yNU+M3bSvDyAnZnjjFwXrc5
         ZykjvO9BAl9nzypU2PxogLAqP7pbzm1evThaQuDvMfR3R12XEM9FqWPnsEqKcrxLWFbT
         gaYqBkF0VJlE3bWAyFUPyBDl3uzkjThbE/CCX9qFqnEc/cFq2jDEU/Hf2VNATSpUQHLU
         sJkqFMNG63IV4/UU0w2a+YzzHfwwBlA4NqK9SWg7TwRUI4PeBI0BwbOR7lYEL+XTDSnw
         5NcEu32KOFk7XgC/C/dlmrSQlgSMtWLHXC1rcx+LXkX/uEjL/A2z4lkib9CJA/+dvHYK
         GNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759499154; x=1760103954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7NnV3eqraDFqVYDcKFCeKin09qktano3eAT2xMof4Q=;
        b=PI/kAT3CltGXGc2qzKeM9PeKiYVVrZxzWaiPtCjq3pRdDfOA3MsIons/cr8y8/j24P
         oildJ3S7q2wPWFksfsfAQw9faO41ZKoanQequtNknCUBsObZ20JGGriIBhbNubtNqYPQ
         MI94itJR2s/Vtcp9aC1BIHG82bAIQ1NzfbDM2pognUoVociYLjqLCsBucCYbc0DPoFv+
         kiDlyEj8lGzv2dcnKCsQMKQ8lYNO9K+AC79m40bkf2cS78jbe3R0RpwMRU/qOdNo7VnE
         4lVuon353/KXGOh5PvQua60BTIkxvhWVdASFJszLX5zEz9dKLxBzk705ovsrXGKXHPwE
         ScoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUJzXu9bHmTOPuPmZk/Y3kJSmLKO8AeJkA6ONVTsiEA8wk8zANYQnP9DEoaCHqlW36cIaM2p1AZggr5aSM3Yje@lists.infradead.org
X-Gm-Message-State: AOJu0YycVEfh2xM/BJMerYIktl2awf2g9CMVjRnri9SQDw/WdGEuBIST
	TiatW6GYoj2mqqu3Q3a1dQHklTEQBpX6Q0xk56w/k/68JFvtMIpE/VdrA1uOTb0d/w==
X-Gm-Gg: ASbGncu5iL6aP3LWINoKFh3mJya1NAuwpmlm3kRR8xBh5IsKszguuXR77S1P85cTsNL
	EGuf3kmzLaZbt+xu7UKKcaatvk4t0n9nvydACWbyvCkyw+twOCDzw7ix1Ok/GA2vnQzMVT4/fGR
	1mqpDtR/oQpj0FMHGnIoNNOkHbozi8/0LIe5PJNqJb6JdMO005+boD5FfhUUI1TKSxoYTHsgbm4
	gRg1awmNMlmBeBlr1hZonUhHhlZjfULfXKZRF16PN/5/2OjKiPSp0dhpZJzVVN7d5eV7SV4oEJq
	Cx5QhiZJdH0+eEs2GssTClfEBHRw2ZJ2EykTDKE5btxefJ3avhga8AT19E96An2dOkoQM3dZK3j
	mxrkkcQQPZOkaCrHL+JtSZpBPO0tJK7UgIUKDuTl045ASKhy80GSHJItubGcGSvASYQ91mL5cqI
	aNmZ8SJZlBkSBfgGtyA/Uju4s4e+D2i9jSr0zumDpN/g==
X-Google-Smtp-Source: AGHT+IEavx1XQVkYuSWqBefYKiu6P3uDkj7db45yOXEIBwP67t8LkAcoTa6xCOF8nZoREgj6u0pW7g==
X-Received: by 2002:a05:6000:616:b0:3ea:bccc:2a2c with SMTP id ffacd0b85a97d-4256713edf9mr2335026f8f.11.1759499154166;
        Fri, 03 Oct 2025 06:45:54 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f01a0sm8064916f8f.48.2025.10.03.06.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 06:45:53 -0700 (PDT)
Date: Fri, 3 Oct 2025 14:45:50 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, qperret@google.com,
	sebastianene@google.com, keirf@google.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v2] KVM: arm64: Check range args for pKVM mem transitions
Message-ID: <aN_TjloudttqBUtf@google.com>
References: <20250919155056.2648137-1-vdonnefort@google.com>
 <87plbkxcvv.wl-maz@kernel.org>
 <aNG417MneSKBxyn8@google.com>
 <aNHcxAJXHeS2T7TH@linux.dev>
 <aNJmA-1ZlikW2Knw@google.com>
 <86plb7ync9.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86plb7ync9.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_064557_125605_8A922D78 
X-CRM114-Status: GOOD (  28.15  )
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

[...]

> > > > > > +static bool check_range_args(u64 start, u64 nr_pages, u64 *size)
> > > > > > +{
> > > > > > +	if (check_mul_overflow(nr_pages, PAGE_SIZE, size))
> > > > > > +		return false;
> > > > > > +
> > > > > > +	return start < (start + *size);
> > > > > 
> > > > > I will echo Oliver's concern on v1: you probably want to convert the
> > > > > boundary check to be inclusive of the end of the range. Otherwise, a
> > > > > range that ends at the top of the 64bit range will be represented as
> > > > > 0, and fail the  check despite being perfectly valid.
> > > > 
> > > > Do you mean allowing something like start == 0xfffffffffffff000 and size ==
> > > > 4096?
> > > 
> > > Yes, this is what I was alluding to on v1.
> > > 
> > > > But I guess that would still put all the following checks using "addr + size" at
> > > > risk. Also, I believe even the code in pgtable.c wouldn't support a such range
> > > > as it is also using a u64 end boundary.
> > > 
> > > I'm not sure I follow. Ranges are pretty commonly expressed as a range
> > > terminated by an exclusive value. This just hasn't been an issue yet as
> > > the page table code is only ever dealing with TTBR0 or VTTBR
> > > translations.
> > 
> > If I do exclude the end boundary, evading checks would be as simple as making
> > sure we overflow the end boundary?
> > 
> > e.g. __pkvm_host_share_guest(phys = 0xfffffffffffff000, size = 4096) 
> > 
> >         check_range_allowed_memory(phys, phys + size) /* nop */
> > 	....
> > 	for_each_hyp_page(page, phys, size) {  /* nop */
> >                ...
> > 	} 
> > 	...
> > 	/* Install a valid mapping to phys */
> > 	kvm_pgtable_stage2_map(&vm->pgt, ipa, size, phys, ...) 
> 
> Why shouldn't this be as simple as this:
> 
> static bool check_range_args(u64 start, u64 nr_pages, u64 *size)
> {
> 	if (check_mul_overflow(nr_pages, PAGE_SIZE, size))
> 		return false;
> 
> 	return start < (start + *size - 1);
> }
> 
> which correctly deals with the boundary issue?

I am concerned about allowing ranges that will still overflow "phys + size".

e.g. phys=0xfffffffffffff000 and size=4096 would pass check_range_args().

But in __pkvm_host_share_guest() that would mean:

  bypassing check_range_allowed_memory()
  bypassing for_each_hyp_page()

  but installing a valid mapping to phys with:
   kvm_pgtable_stage2_map(&vm->pgt, ipa, size, phys, ...) 


> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

