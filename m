Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD498C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 11:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vj4pnAv1lJriMVGawRz5JjDM9OZDa0vt2boAwaSGN9M=; b=w6VegEJeigmi5jSSgpsZ0lX7nn
	14x1QBmrx7kLnWh6AjONFuvfFArhpVpaayiVE3SuSiFLZaXO1L+WWlfDHMe5rdcM2lxpTyXEUUGYX
	++BoRJBfDADAP7JRq1AlxWolf9QuGkF6ZK0+7pVm6Ctc3CsfKfznWsLVUeDgWCpn3y281kWhQB7+x
	NH5uG0ZkeMkyLfIuDUj8yv6iNyesWtaID5JqaraaRmYInNXcu1J4s3T5+seSZWQabStYmQah5UlY6
	UypKtx6CTar9eiQDE0KUVTIm7CiS1r88gr7qzZNHhNHXon7Pi9TxGxqm5hTQOGEeLIoHIvBwGSoJ6
	JyCG0z9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUyM-00000005h9z-35H7;
	Tue, 18 Mar 2025 11:19:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUwP-00000005gTK-1Qh5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 11:17:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2685113D5;
	Tue, 18 Mar 2025 04:17:09 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A6BC3F694;
	Tue, 18 Mar 2025 04:16:59 -0700 (PDT)
Date: Tue, 18 Mar 2025 11:16:54 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64/mm/hotplug: Drop redundant [pgd|p4d]_present()
Message-ID: <Z9lWJsA2hg2UKZ0T@J2N7QTR9R3>
References: <20250221094449.1188427-1-anshuman.khandual@arm.com>
 <20250221094449.1188427-2-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221094449.1188427-2-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_041701_458295_4DF6DEA3 
X-CRM114-Status: GOOD (  15.56  )
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

On Fri, Feb 21, 2025 at 03:14:48PM +0530, Anshuman Khandual wrote:
> [pgd|p4d]_present() are inverse to their corresponding [pgd|p4d]_none().

Maybe their implementations happen to be inverse today, but the semantic
of pXX_present() is not the inverse of the semantic of pXX_none(). In
general, !pXX_none() does not imply pXX_present().

> So [pgd|p4d]_present() test right after corresponding [pgd|p4d]_none()
> inverse test does not make sense. Hence just drop these redundant
> checks.

I think the checks make sense in abstract, even if they're redundant
today

Is there any reason to remove these specific case?

Surely the compiler optimizes these out when they're redundant?

Mark.

> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/mm/mmu.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index b4df5bc5b1b8..66906c45c7f6 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -952,7 +952,6 @@ static void unmap_hotplug_p4d_range(pgd_t *pgdp, unsigned long addr,
>  		if (p4d_none(p4d))
>  			continue;
>  
> -		WARN_ON(!p4d_present(p4d));
>  		unmap_hotplug_pud_range(p4dp, addr, next, free_mapped, altmap);
>  	} while (addr = next, addr < end);
>  }
> @@ -978,7 +977,6 @@ static void unmap_hotplug_range(unsigned long addr, unsigned long end,
>  		if (pgd_none(pgd))
>  			continue;
>  
> -		WARN_ON(!pgd_present(pgd));
>  		unmap_hotplug_p4d_range(pgdp, addr, next, free_mapped, altmap);
>  	} while (addr = next, addr < end);
>  }
> @@ -1114,7 +1112,6 @@ static void free_empty_p4d_table(pgd_t *pgdp, unsigned long addr,
>  		if (p4d_none(p4d))
>  			continue;
>  
> -		WARN_ON(!p4d_present(p4d));
>  		free_empty_pud_table(p4dp, addr, next, floor, ceiling);
>  	} while (addr = next, addr < end);
>  
> @@ -1153,7 +1150,6 @@ static void free_empty_tables(unsigned long addr, unsigned long end,
>  		if (pgd_none(pgd))
>  			continue;
>  
> -		WARN_ON(!pgd_present(pgd));
>  		free_empty_p4d_table(pgdp, addr, next, floor, ceiling);
>  	} while (addr = next, addr < end);
>  }
> -- 
> 2.30.2
> 

