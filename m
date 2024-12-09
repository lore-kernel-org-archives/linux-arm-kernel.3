Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35768E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwyB39CTHJItaPJMEkgmfbCR+5h4SkV01S+BaiaQNUE=; b=jHHITbuBiy9qfqt3MOUuB5ZNvz
	6iWFMPqz3cBd60JmjDKbuhOlz/HMzvdOqhhueDH85+6NJMPqTTLChB9rjkLsvEpqJjrxL8PG8u+UW
	0ICe4gcHMNu11t5aORk6J+fSewpL/wRX29tFntYBerCjZsBTzjI3klbdiQwDANbtkL94skaH8oAFE
	wutz9G9qf4GqkUO1/npM/KaPdG+HisHifsONL645stoBsRGBimlivs+duO6qk7t29TdWySuclwc+b
	hiq1xDF7hEbzaLkZhjEVQjlLL5UNvk53s6Uk6MCAHocapjMAA6p/FwKw9zBXkOco59y/6+hCMwiZQ
	tPOf2kUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKb6Y-00000007JYv-0wLb;
	Mon, 09 Dec 2024 10:35:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKb0v-00000007HsO-38j2
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Dec 2024 10:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OwyB39CTHJItaPJMEkgmfbCR+5h4SkV01S+BaiaQNUE=; b=PweqRT0qTad9szFeFrP/3wFWgV
	G+rE52BJVCWGEtJdcEJBF7uBGFl5C/3zBQqli1dXtNLe2xD/4Z/Z8ZBczPwm4W3lOM8RCjpCNNhNW
	qU2qVTjAN4HhH05MMd3wu0PYTjIcZ+zor4GvWB5ZNXgLZGY7bV6/g7lnB0aeLjwBkstz40RxP6yBx
	rM2jGPOQwECfIV0R7Dbq9aLER8Yf5o3vD7sao85/Z1l4M7howYVQajrqTSKreE5bxK7zWJnqWbKw0
	iXGNpz+IWIJtQWmItGqr+ekrk9KBG2Ts94afNQXCL46iEgXlyn3N8E33vc6tZeQb1yEWpetdcTCYD
	JJw8aUTw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tKb0s-00000001HHL-2aAc;
	Mon, 09 Dec 2024 10:29:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id DFC9A3003FF; Mon,  9 Dec 2024 11:29:13 +0100 (CET)
Date: Mon, 9 Dec 2024 11:29:13 +0100
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
Message-ID: <20241209102913.GJ21636@noisy.programming.kicks-ass.net>
References: <20241206101110.1646108-1-kevin.brodsky@arm.com>
 <20241206101110.1646108-14-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101110.1646108-14-kevin.brodsky@arm.com>
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

On Fri, Dec 06, 2024 at 10:11:07AM +0000, Kevin Brodsky wrote:
> Page table pages are typically freed via tlb_remove_table() and
> friends. Ensure that the linear mapping for those pages is reset to
> the default pkey when CONFIG_KPKEYS_HARDENED_PGTABLES is enabled.
> 
> This patch is a no-op if CONFIG_KPKEYS_HARDENED_PGTABLES is disabled
> (default).
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/include/asm/tlb.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
> index a947c6e784ed..d1611ffa6d91 100644
> --- a/arch/arm64/include/asm/tlb.h
> +++ b/arch/arm64/include/asm/tlb.h
> @@ -10,10 +10,14 @@
>  
>  #include <linux/pagemap.h>
>  #include <linux/swap.h>
> +#include <linux/kpkeys.h>
>  
>  static inline void __tlb_remove_table(void *_table)
>  {
> -	free_page_and_swap_cache((struct page *)_table);
> +	struct page *page = (struct page *)_table;
> +
> +	kpkeys_unprotect_pgtable_memory((unsigned long)page_address(page), 1);
> +	free_page_and_swap_cache(page);
>  }

Same as for the others, perhaps stick this in generic code instead of in
the arch code?

