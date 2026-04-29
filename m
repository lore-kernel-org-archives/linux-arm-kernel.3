Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57370FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 13:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Q44WwHdu89tmf4cDVgIblgyW9em0HLuJhml19unNVI=; b=xyRCmCchUpcT1+7ukp3Ja7KPMs
	iP5YCe185+gTYBg+A3nTqcXgn8k+v6oKaDIaTeEhbrDFlHv3Pz/ty2bGfqSZpGve/T8HweI4TR9r3
	zOGN7v9lA4efQnNWadRK6jYbBh6UoooM98rnUdhebqqvCE0uxVLU4GbKVn8NyohMnKiYdJyT2RIky
	wtNABfYedClsk5HDRF6F8NECa1XfK51mAYLteV0QMoALO2KbaDNXNphLJh5KW2qxgXsu4BJ6Mjq6j
	4emc4eKWBOC6BP60hPAeZZByIfdLwYZ3rES/QkAUXMlv/qPpGnDSEefUyDiQvib4vcD5dPHV0xboc
	zlTLNwkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5Pb-00000003iLx-1lcT;
	Wed, 29 Apr 2026 13:57:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5PZ-00000003iLX-0cmE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 13:57:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4E251650;
	Wed, 29 Apr 2026 06:57:01 -0700 (PDT)
Received: from [10.57.62.76] (unknown [10.57.62.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D89E3F62B;
	Wed, 29 Apr 2026 06:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777471027; bh=uCnIw3CR1viWizfBhTu1oz/vcz1koGemFdz8oEqehX4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tKo7qpcUs76IDv6e5R8HeijntK+tVAsQf3L1gGheC7KBuQnvLjzEHiTDybDxbZD8Z
	 PtAB4aUFl6moEHsC3wTckysjYxLPrEqXAKhGTICBGzpyQ8QAG/d2fCSGec37wtX7SN
	 2lIFCIl0BQq9yN+RECGiSkBoDunVzSNSdbxs6Lhk=
Message-ID: <961e9d06-1520-4176-ad76-3f0d8d5ab146@arm.com>
Date: Wed, 29 Apr 2026 15:57:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/15] arm64: mm: Generalize manipulation code of
 read-only descriptors
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com,
 mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-hardening@vger.kernel.org
References: <20260427153416.2103979-17-ardb+git@google.com>
 <20260427153416.2103979-31-ardb+git@google.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260427153416.2103979-31-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_065709_238616_26CB1AB3 
X-CRM114-Status: GOOD (  11.60  )
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

On 27/04/2026 17:34, Ard Biesheuvel wrote:
> [...]
>
> -void noinstr set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
> +void noinstr set_rodata_pte(pte_t *ptep, pte_t pte)
>  {
> -	pgd_t *fixmap_pgdp;
> +	pte_t *fixmap_ptep;
>  
>  	/*
> -	 * Don't bother with the fixmap if swapper_pg_dir is still mapped
> -	 * writable in the kernel mapping.
> +	 * Don't bother with the fixmap if rodata is still mapped
> +	 * writable in the kernel and linear mappings.
>  	 */
>  	if (rodata_is_rw) {
> -		WRITE_ONCE(*pgdp, pgd);
> +		WRITE_ONCE(*ptep, pte);
>  		dsb(ishst);
>  		isb();
>  		return;
>  	}
>  
> -	spin_lock(&swapper_pgdir_lock);
> -	fixmap_pgdp = pgd_set_fixmap(__pa_symbol(pgdp));
> -	WRITE_ONCE(*fixmap_pgdp, pgd);
> +	spin_lock(&rodata_pgdir_lock);
> +	fixmap_ptep = pte_set_fixmap(__pa_nodebug(ptep));

I don't know much about the fixmap but it strikes me as odd that we
would now use pte_set_fixmap() at all levels. I suppose the question is
whether swapper_pg_dir could be written concurrently with fixmap page
tables at PMD level or above? I'm also wondering if those fixmap page
tables are ever written to.

- Kevin

> +	WRITE_ONCE(*fixmap_ptep, pte);
>  	/*
>  	 * We need dsb(ishst) here to ensure the page-table-walker sees
>  	 * our new entry before set_p?d() returns. The fixmap's
>  	 * flush_tlb_kernel_range() via clear_fixmap() does this for us.
>  	 */
> -	pgd_clear_fixmap();
> -	spin_unlock(&swapper_pgdir_lock);
> +	pte_clear_fixmap();
> +	spin_unlock(&rodata_pgdir_lock);
>  }
>
> [...]

