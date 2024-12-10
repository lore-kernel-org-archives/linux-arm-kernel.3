Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C6CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 12:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asCEkZ3HCMfe18rmMzExk2UpUIh0/XmzWsDd0egaSEE=; b=e5Vx2fU42wgijzetRhtI/qqu5m
	BJCA8441PUoTAF/FpxDFWwgEgWpr8pTQYhGHnLhymU7+O5uCKeZDpwVWDMY++i/rXDJS57kqj2fSA
	w6IdQFfBz859GNq6EVCC1LxT3booVmHTIav0BfT1c4oCYrfc0Uv0OT9zLzlRlCHO1iI8Do3Vs3sfw
	akaXjvh9EBdeQp4KXHB7iKbpSmzsvZOIdngPJlAkeDDFS47ZERfEBJEOo7sg0kiy49h94UrpOkpQ1
	n9R3gBgHujFVvUA0ITB2bb18ro08Gfp3pnlmnPZ3dG2yrT9rBI2X0qbU3L4h9S4HDf+pjGK2le1gR
	5mGW4kkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzM4-0000000BQbp-0FJV;
	Tue, 10 Dec 2024 12:28:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzKX-0000000BQM3-0tnn
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Dec 2024 12:27:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=asCEkZ3HCMfe18rmMzExk2UpUIh0/XmzWsDd0egaSEE=; b=hKa2p7rV6W6OYuRhhTC5cTHhbX
	Mibcsrrs8SjTX3g20J3q7QPDl+implsVlKonWpylxnP+N+wxtWhlG68ClpotTryZZSFfZRxVMix++
	sh1nXGFNHkNywwDlvTMmYoSiSpAFoTpFYDjXTxZ8sef+yrUsPE2P9ASGMkewddJ5wXfT0c9fuu2ft
	Pum2Zn+EdEdNyych9lY3bvQ6VTfj40Nl/NWq4JuI05VTbLgARL+/cw58v+k5FbrJTfLnBpShxERwk
	Js+aVVY2wESMtDDRQqbZLATemXaaonTg8zBavBMXdtsjh9jhi6BPjRFPvDhcsyLSc5jx434T3FkTN
	sSVxtwuQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzKU-00000003fsB-3SEN;
	Tue, 10 Dec 2024 12:27:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6598430035F; Tue, 10 Dec 2024 13:27:06 +0100 (CET)
Date: Tue, 10 Dec 2024 13:27:06 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	aruna.ramakrishna@oracle.com, broonie@kernel.org,
	catalin.marinas@arm.com, dave.hansen@linux.intel.com,
	jannh@google.com, jeffxu@chromium.org, joey.gouly@arm.com,
	kees@kernel.org, maz@kernel.org, pierre.langlois@arm.com,
	qperret@google.com, ryan.roberts@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Subject: Re: [RFC PATCH 13/16] arm64: mm: Reset pkey in __tlb_remove_table()
Message-ID: <20241210122706.GO8562@noisy.programming.kicks-ass.net>
References: <20241206101110.1646108-1-kevin.brodsky@arm.com>
 <20241206101110.1646108-14-kevin.brodsky@arm.com>
 <20241209102913.GJ21636@noisy.programming.kicks-ass.net>
 <7124d7f4-1d4c-4497-94d8-243af2ed071a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7124d7f4-1d4c-4497-94d8-243af2ed071a@arm.com>
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

On Tue, Dec 10, 2024 at 10:28:44AM +0100, Kevin Brodsky wrote:
> On 09/12/2024 11:29, Peter Zijlstra wrote:
> > On Fri, Dec 06, 2024 at 10:11:07AM +0000, Kevin Brodsky wrote:
> >> [...]
> >>
> >> diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
> >> index a947c6e784ed..d1611ffa6d91 100644
> >> --- a/arch/arm64/include/asm/tlb.h
> >> +++ b/arch/arm64/include/asm/tlb.h
> >> @@ -10,10 +10,14 @@
> >>  
> >>  #include <linux/pagemap.h>
> >>  #include <linux/swap.h>
> >> +#include <linux/kpkeys.h>
> >>  
> >>  static inline void __tlb_remove_table(void *_table)
> >>  {
> >> -	free_page_and_swap_cache((struct page *)_table);
> >> +	struct page *page = (struct page *)_table;
> >> +
> >> +	kpkeys_unprotect_pgtable_memory((unsigned long)page_address(page), 1);
> >> +	free_page_and_swap_cache(page);
> >>  }
> > Same as for the others, perhaps stick this in generic code instead of in
> > the arch code?
> 
> This should be doable, with some refactoring. __tlb_remove_table() is
> currently called from two functions in mm/mmu_gather.c, I suppose I
> could create a wrapper there that calls
> kpkeys_unprotect_pgtable_memory() and then __tlb_remove_table(). Like in
> the p4d case I do however wonder how robust this is, as
> __tlb_remove_table() could end up being called from other places.

I don't foresee other __tlb_remove_table() users, this is all rather
speicific code. But if there ever were to be new users, it is something
they would have to take into consideration.

