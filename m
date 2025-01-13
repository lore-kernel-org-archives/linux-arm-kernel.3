Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA718E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 05:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyHyP1rPTLnZFM6ZRfGn/c19YJsCPL6Qu8PJQEE53tU=; b=QWvzHtm0AHw6sj3aO54s1RFZRE
	LqLtE86/7x3YdHDLt9oNncmW/7Kv0z8JtUTnEW2A3RJv6Qfosx+CluNzs3vvgTclpLkAnw1FZ30zj
	XJLAARjc4exKWRVMv3odHWLscCFJHZoVYf/gtkLVLhOi9dsqQ0KuNcMtwTknDfKgVTKlgtyKZORFz
	x6GC/AXdiEni+URussPigPvZyfU1WcsfX1bi30CEsTbEguJ+vp+wUUXYC74/2uDO4sT3yaOUTkNTW
	PubCebrZoSClSeJGxf/MhCqCTRh33CZF7n40DY3zQ8sAOtpR7N6vzN+bz9tH2n4/UCHGa/XUyKpbG
	Cy5Y2Ihw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXCbE-000000041j1-2nkq;
	Mon, 13 Jan 2025 05:02:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXCZz-000000041gM-1Ufr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 05:01:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7106A153B;
	Sun, 12 Jan 2025 21:02:00 -0800 (PST)
Received: from [10.163.57.117] (unknown [10.163.57.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21E163F66E;
	Sun, 12 Jan 2025 21:01:29 -0800 (PST)
Message-ID: <2cf7c240-e8c2-4575-a98b-2f68f4dc592a@arm.com>
Date: Mon, 13 Jan 2025 10:31:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Fix 5-level paging support in kexec/hibernate
 trampoline
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, catalin.marinas@arm.com, Ard Biesheuvel <ardb@kernel.org>
References: <20250110175145.785702-2-ardb+git@google.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250110175145.785702-2-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_210135_445663_7FEFDA98 
X-CRM114-Status: GOOD (  16.16  )
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


On 1/10/25 23:21, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Add the missing code to allocate P4D level page tables when cloning the
> the kernel page tables. This fixes a crash that may be observed when
> attempting to resume from hibernation on an LPA2 capable system with 4k
> pages, which therefore uses 5 levels of paging.
> 
> Presumably, kexec is equally affected.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/mm/trans_pgd.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
> index 0f7b484cb2ff..84594f02f780 100644
> --- a/arch/arm64/mm/trans_pgd.c
> +++ b/arch/arm64/mm/trans_pgd.c
> @@ -162,6 +162,13 @@ static int copy_p4d(struct trans_pgd_info *info, pgd_t *dst_pgdp,
>  	unsigned long next;
>  	unsigned long addr = start;
>  
> +	if (pgd_none(READ_ONCE(*dst_pgdp))) {
> +		dst_p4dp = trans_alloc(info);
> +		if (!dst_p4dp)
> +			return -ENOMEM;
> +		pgd_populate(NULL, dst_pgdp, dst_p4dp);

Just wondering would not dst_p4dp goes unused (and probably leaked) when
pgtable_l5_enabled() is not enabled ? Similar scenario might also exist
in copy_pud() as well with respect to pgtable_l4_enabled().

pgd_populate()
	__pgd_populate()
		if (pgtable_l5_enabled())
			set_pgd()

> +	}
> +
>  	dst_p4dp = p4d_offset(dst_pgdp, start);
>  	src_p4dp = p4d_offset(src_pgdp, start);
>  	do {

