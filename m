Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752A3FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 13:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQtZTpELJ1liX6xujaqBk9rq103ELoK9RGJIqb5f6ZI=; b=y9QlaLzbXyfAD3sZccBTb/Big4
	NpmbLZId1THiFTkWt0sFXSLjTQ4KKVlFijbxIB+NHomUmBb/cpFLAxcCBJYFIj0TahjNdMxPLkZyl
	noAJxfIOWnd47cH50jJKK9CE9crVa/xRyw+l5KwDAxuU1+iRTBAcXujeQZiTZ/jljlgdJ/eimfm7X
	z32tHMfs6JJ4HstYhDIR+XNS0S+y8QRrFdincdbV6d4hlo3DqEs089Cyask00HyCO/IRNJENyHSrn
	GvHkBsxn0wWt37a0pr6gohit3bv/s/Irr4zdcgdnBzGTvden1sbMquAQfDvM/6yq+juGQ0zktRS96
	16ekUwZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5Q2-00000003iSn-2JDN;
	Wed, 29 Apr 2026 13:57:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5Q0-00000003iS3-1uL3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 13:57:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FB45337B;
	Wed, 29 Apr 2026 06:57:30 -0700 (PDT)
Received: from [10.57.62.76] (unknown [10.57.62.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B54813F62B;
	Wed, 29 Apr 2026 06:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777471056; bh=51AOjeUHqGDov+TlvZ961wTG4/ToLBw1MVjjZ/EnINw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VZYMMPruwp21m0Xl4JeKfECbeTob5+cc9VVBwFqewef4YFQpd9Inm1HT5mWQ5/6XG
	 ItElSh4Ig+yLgjTKWv4g3SNaz5OOVx2Ve3sKphhXFiZ/dF5OXmmvFug+NBjU9oGbIA
	 5KSpb9He9n9hVC8WDP9z/KmEA1lJ8qPdpTJ9HzCk=
Message-ID: <21a547ae-7121-4cd1-b203-4d8182eb7cc9@arm.com>
Date: Wed, 29 Apr 2026 15:57:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/15] arm64: mm: Remap linear aliases of the fixmap
 page tables read-only
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
 <20260427153416.2103979-32-ardb+git@google.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260427153416.2103979-32-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_065736_537917_E9737E83 
X-CRM114-Status: GOOD (  10.58  )
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
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 84d81bae07a7..e76fe5b0c5fe 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1076,6 +1076,11 @@ void __init mark_linear_text_alias_ro(void)
>  			    (unsigned long)__init_begin - (unsigned long)_text,
>  			    pgprot_tagged(PAGE_KERNEL_RO));
>  
> +	/* Map the fixmap PTE table at __fixmap_pgdir_start R/O in linear map too */
> +	update_mapping_prot(__pa_symbol(__fixmap_pgdir_start),
> +			    (unsigned long)lm_alias(__fixmap_pgdir_start),
> +			    PAGE_SIZE, pgprot_tagged(PAGE_KERNEL_RO));

Is that definitely just one page?

> +
>  	remap_linear_data_alias(true);
>  
>  	if (IS_ENABLED(CONFIG_HIBERNATION)) {

