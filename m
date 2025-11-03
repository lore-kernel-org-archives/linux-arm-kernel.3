Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5E7CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 14:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yOIN4al8o3hvby2tYjmv7154iKKH2/FeWfWDeE8Z1b4=; b=HQu/VnEMB7y56yEmlSF/HbSanw
	/1YAjeJRQzKGC3wGA06KDdLFo0K6nunVGyCNO8ZvjfHnUodBkbKJRhddu0OEenfiPmJ2lDLgQAXPS
	1Ry6APqdgctnzzkx+ubw1rJNBtfQPoaFMq6GOBsqj/cAVc95wBsRwcYTSibi2zWb5TA51rL7Lj4Uy
	LnaLymCLAuYwECkm8rzdrD38NPCRJoV8DgJKaCMtwNq74PMMJRfK7zeNZygksi7dsZNgnC5jQgclA
	Rceq0QpRbiBviYtfE3eEsQF6JNz36GkTpA2a8ATwdrjEBOzUyLGcWR+1lcd9aWb1Q9zsK45DtJ80s
	4tR0jKxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvkA-0000000A2A7-2yZA;
	Mon, 03 Nov 2025 14:41:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvk4-0000000A29b-3NNH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 14:41:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 90856439B7;
	Mon,  3 Nov 2025 14:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D5CFC113D0;
	Mon,  3 Nov 2025 14:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762180867;
	bh=LjFjByiv2udyhbpyhBMDGQWMK+5W1S4rpccn8+FhmMU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JDHYLNBZtzPaNXVho2kDaLiARfyfnqFPnf9nfQ6EhFuKJtSRiOUtDhjFgeY/WYmAn
	 2YcV9Ima4gdxz6cuzyeN28w4y8xpgk+5Ly7cWdY/OlR5ff6W4eurh8O+6DXGuBSCTW
	 S2j+eMw/HHoN8UL7L718UMmeUmCy2S1K6SNGIqjFwGOUwxvFrVtIZFe8DJ2URkyBhZ
	 Tb92uq2SfYTN5KbWc24raM66iJwD5mL5Ozm4oD0p0h/1rzNSg62ZSWCLuf2SZM+3FT
	 4Rf8uDV0VWwRxE0K2MzM9oTB1Qk0vatyWHOVZX3p8H2Pd1dWTH1NsaUfAqBYnjUKXv
	 7/Y3vSsYDIfPQ==
Message-ID: <79a1f2dd-6752-426c-84c1-a38d300eb78c@kernel.org>
Date: Mon, 3 Nov 2025 15:41:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/huge_memory: Initialise the tags of the huge zero
 folio
To: Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 Aishwarya.TCV@arm.com
References: <20251031170133.280742-1-catalin.marinas@arm.com>
 <aQiu-hU3x5V5drHF@finisterre.sirena.org.uk> <aQi8dA_QpXM8XqrE@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <aQi8dA_QpXM8XqrE@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_064108_871782_99A7C07B 
X-CRM114-Status: GOOD (  10.18  )
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

> 
> -----------8<---------------------------------------------
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index d816ff44faff..125dfa6c613b 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -969,6 +969,16 @@ struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
>   
>   void tag_clear_highpage(struct page *page)
>   {
> +	/*
> +	 * Check if MTE is supported and fall back to clear_highpage().
> +	 * get_huge_zero_folio() unconditionally passes __GFP_ZEROTAGS and
> +	 * post_alloc_hook() will invoke tag_clear_highpage().
> +	 */
> +	if (!system_supports_mte()) {
> +		clear_highpage(page);
> +		return;
> +	}
> +

LGTM!

-- 
Cheers

David


