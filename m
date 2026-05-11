Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD7ACD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 02:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0upIL/r5PlHA2QmAdZKfeZ5Wg4iPfn0PljTHC25lCFM=; b=fqhLjGuk+LxAElCWcVvedjHSz/
	2drGkwKgc7E/qYVNxKPTtThx8ZTf6ThbyQNVFohWoZ3W9wylvwDt3DatAxiDBQ5zvh0vP9/7ft6pl
	naw4oQjVboIAYoAYKSANEPqBTp4VLaNkAzCo/TUCGtmjJpmDrIBbdYgHO3tAgue2tmbsoxBwzwRqm
	PgGzSBJzPBchlfk9/wKMJxoecxZflTylLzI8m48c7kQDbw5yc89cKh7BGlHf9q1PaQYoUlgrRVAKx
	fF0V1W+SimRw00S72YEgY4sX+CbSEixysuoVZ1LsXMbN7RhrN5YZesDObaWd0mFlqsJ7DOGxxQ2J3
	z0MxgQrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMGoR-0000000C5dF-2nnZ;
	Mon, 11 May 2026 02:56:07 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMGoO-0000000C5c6-0XUD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 02:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778468157; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=0upIL/r5PlHA2QmAdZKfeZ5Wg4iPfn0PljTHC25lCFM=;
	b=t0MOwfl31OQ/IlqZiv4c5V9u9NoiCsjgMgF1Apo2avjRr7EtVdC20NNHJCVsFpXofgNNCHlpOFBkv2TKiFcQygCTMx0Tyc87Zc10o8fxq7FJUh4deWgSeLu1V7HLj0hOsECtVV7tyzoyzmwPrWUdksp4xQKuO8CPxDGux9M6wVw=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X2dsRpW_1778468153;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0X2dsRpW_1778468153 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 11 May 2026 10:55:54 +0800
Date: Mon, 11 May 2026 10:55:53 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Liz Prucka <lizprucka@google.com>,
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 02/15] mm: Make empty_zero_page __ro_after_init
Message-ID: <agFFOZvRHMWCtPHm@U-2FWC9VHC-2323.local>
References: <20260427153416.2103979-17-ardb+git@google.com>
 <20260427153416.2103979-19-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427153416.2103979-19-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_195604_791397_E7D5FB82 
X-CRM114-Status: GOOD (  19.43  )
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

On Mon, Apr 27, 2026 at 05:34:19PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The empty zero page is used to back any kernel or user space mapping
> that is supposed to remain cleared, and so the page itself is never
> supposed to be modified.
> 
> So make it __ro_after_init rather than __page_aligned_bss: on most
> architectures, this ensures that both the kernel's mapping of it and any
> aliases that are accessible via the kernel direct (linear) map are
> mapped read-only, and cannot be used (inadvertently or maliciously) to
> corrupt the contents of the zero page.

Reviewed-by: Feng Tang <feng.tang@linux.alibaba.com>

We did hit the issue that zero page got corrupted due to non-kernel
reason earlier this year, and it took us weeks to track it down to
zero page corruption and the final root cause, as it randomly happened
to different user space tasks. Thanks for the patch!

> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  mm/mm_init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index f9f8e1af921c..6ca01ed2a5a4 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -57,7 +57,7 @@ unsigned long zero_page_pfn __ro_after_init;
>  EXPORT_SYMBOL(zero_page_pfn);
>  
>  #ifndef __HAVE_COLOR_ZERO_PAGE
> -uint8_t empty_zero_page[PAGE_SIZE] __page_aligned_bss;
> +uint8_t empty_zero_page[PAGE_SIZE] __ro_after_init __aligned(PAGE_SIZE);
>  EXPORT_SYMBOL(empty_zero_page);
>  
>  struct page *__zero_page __ro_after_init;
> -- 
> 2.54.0.rc2.544.gc7ae2d5bb8-goog
> 

