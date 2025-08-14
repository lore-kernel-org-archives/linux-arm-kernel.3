Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E347BCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 00:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41vZQE4qVj2qb70cjSoEC4RwtvqSxYt+zihXufpvrB4=; b=0z0f3GvC6j29lPoL6ZH0OxZIiu
	MMWr9B9dfTxp/LwBkqsLTvevuimL8pIUtVqdFxTkyM8nnqgTOxejMV13KVuFFEqJu+XIqlBbzmSOa
	/xTdi0V3OMpJe22wZF56fpmUP/OYnfr3OXnnm9BSzdzdjx0vjuaB3alpHyBQqlSDimfDikjcUk88R
	8RfFJ0WAHsSTK0P6zfrHC3xQ2z364Itebrjh17v8z0iM8L2ItzXcLIiqmUxRnHbAxyCNH2yH0rO2r
	SdnnlLVYDdxT1s0wijFa0Y5ux9BP5KVTj9/nEDdcGOHgGy6zYLmEk9H/60rBS9tmLGnrBNGyUYv9Y
	fAGT64Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umiki-00000000xoy-1t1H;
	Fri, 15 Aug 2025 00:57:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umhIk-00000000mkw-3xUn;
	Thu, 14 Aug 2025 23:24:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F1C8C60053;
	Thu, 14 Aug 2025 23:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1B7C4CEED;
	Thu, 14 Aug 2025 23:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1755213845;
	bh=Lt6jBIulxaTo9RIUgXftMb1SwjwcRMNvaTJxyrnlj78=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=0jiS0MN4/TWhe764dHWzjTgvAGMJecSSdfZWFOkJUS7BuIjhyZKOl+A5PrqjFOduD
	 IsxvOxBO+k+v+PziyRQf+Q7TQM0DhZnFEQ2PaknBTmYhxEHSQRHua4azWjzIgmIkiW
	 ecFxYV+H+SUkeqY9R/HRVhofTlwwyNEN4NBGc7RU=
Date: Thu, 14 Aug 2025 16:24:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org, x86@kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
 nicholas@linux.ibm.com, christophe.leroy@csgroup.eu, Rohan McLure
 <rmclure@linux.ibm.com>, Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v16 06/13] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pud_clear()
Message-Id: <20250814162404.e3a0f12e2aa1a87de51322e7@linux-foundation.org>
In-Reply-To: <5aa057d0-dc76-4723-80d1-82065320a428@ghiti.fr>
References: <20250813062614.51759-1-ajd@linux.ibm.com>
	<20250813062614.51759-7-ajd@linux.ibm.com>
	<5aa057d0-dc76-4723-80d1-82065320a428@ghiti.fr>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 14 Aug 2025 14:11:45 +0200 Alexandre Ghiti <alex@ghiti.fr> wrote:

> >   	for (i = 0; i < nr; i++)
> > -		__page_table_check_pud_clear(mm, *(pudp + i));
> > +		__page_table_check_pud_clear(mm, addr + PUD_SIZE * i, *(pudp + i));
> >   	if (pud_user_accessible_page(pud))
> >   		page_table_check_set(pud_pfn(pud), stride * nr, pud_write(pud));
> >   }
> 
> 
> So this made me realize we (riscv) did not implement 
> pudp_huge_get_and_clear(), which was a mistake since we support THP PUD. 
> I have implemented this function in this patch 
> https://lore.kernel.org/all/20250814-dev-alex-thp_pud_xchg-v1-1-b4704dfae206@rivosinc.com/T/#u
> 
> That's a fix so I'll merge it in 6.17 (at least I'll try) so your 
> patchset will break the build on riscv, I'll keep you posted when it 
> gets merged!

Thanks, I'll temporarily grab a copy of your "riscv: use an atomic xchg
in pudp_huge_get_and_clear()" to keep mm.git compilable and testable.  

