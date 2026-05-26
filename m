Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B97CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 18:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OL4ezgVHqxIU9/ztDnUrt+XU8dQB6VIAk9+zK2VqSU4=; b=m+HXX/kA/afY7pO0ADRUb3XniK
	4u0MM4zHyxDmP2swMfVCv+dJ052xYpT+QK0ioEJC/4AS7B8J1rHHhXeuknR3lTXUN7S0rIOXlNgzQ
	7hHsy4NbB5zD+pmnTKBdIXCX6uMB9hlONP5Dk98Rx4FnRpZ7tK50ebbf6F4iHOKdiidp1giWcioMi
	cYgrtlbmTK+tpwinRallXtJVz1gLGlKvWP18el9o8pGH6eECOt9tRHO/5C0EffnGhusvNzM/EpSla
	QGxkjGJiZcT+oRaXBymgliimPyeN92ibErAvGCHZjECs6TBr5BJl5irl71PwpFtj+pL+aNJqn/b30
	QAlYdyww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRwy8-00000002sc3-39ZW;
	Tue, 26 May 2026 18:57:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRwy5-00000002sbd-2Gag
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 18:57:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 946302BCA;
	Tue, 26 May 2026 11:57:26 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B78F3F7B4;
	Tue, 26 May 2026 11:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779821851; bh=9JHhyqB0zfSMPkqz7enVGYRVoj1TTMjap+1OvUN5cXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BFi0Td14nrTZoo2hbXxOvq/kGAdkv7R+vZPGnLjZm+U//3g+5cVegAJATL4VUYIyr
	 eW4CE1WZdV42Ohj8DWQaIKpv+G/xSQgkv2jfiRyQTXnywy9m7n4y3PO0JaflIWk1Il
	 Z4fxBXGPJ63d8dj6C9/B16L/UbBziH0xPvt5Phv8=
Date: Tue, 26 May 2026 19:57:28 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: mm: drop redundant remap of FDT first page
Message-ID: <ahXtGL7QI82ZHPDO@arm.com>
References: <20260513170101.1858213-1-ekffu200098@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513170101.1858213-1-ekffu200098@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_115733_906062_C3543D4C 
X-CRM114-Status: GOOD (  17.40  )
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

On Thu, May 14, 2026 at 02:01:01AM +0900, Sang-Heon Jeon wrote:
> fixmap_remap_fdt() calls create_mapping_noalloc() to map the first
> page of the FDT to read its magic and totalsize from the header. If
> the FDT does not fit in a single page, it calls create_mapping_noalloc()
> again to map the rest.
> 
> The second mapping redundantly covers the first page that was just
> mapped by the first mapping.
> 
> Start the second mapping at dt_phys_base + PAGE_SIZE so it only covers
> the pages that have not been mapped yet. No functional change.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
[...]
> diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> index c5c5425791da..f8aea5572f7c 100644
> --- a/arch/arm64/mm/fixmap.c
> +++ b/arch/arm64/mm/fixmap.c
> @@ -167,8 +167,9 @@ void *__init fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot)
>  		return NULL;
>  
>  	if (offset + *size > PAGE_SIZE) {
> -		create_mapping_noalloc(dt_phys_base, dt_virt_base,
> -				       offset + *size, prot);
> +		create_mapping_noalloc(dt_phys_base + PAGE_SIZE,
> +			dt_virt_base + PAGE_SIZE,
> +			offset + *size - PAGE_SIZE, prot);
>  	}

Is it actually worth it? It's not that we allocate memory here or take a
noticeable time to reach the first pte. I find the current easier to
read.

-- 
Catalin

