Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A677CC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 08:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBG2SFimC367ri+OK5yqfITjdNOx6Z+4gkaFl607Uhg=; b=yiWZsxtDG9hm11oZsqbIetXz8G
	OBKwJScSXDp2rR81dQz95X/eu8r8fezF/Qu+54IAfb6GIXaHspVXXjanrcF3AU5I/wNTe7Hv/6CPe
	wxZBaVqe9SQ+R0+eXGQ9T+WttJDcV/rIsHPtrFsR71oItvdE4dEt8dTTVPhV1p+BqS1LfUuJmJNcg
	a3JvnWyjoRqkR9Khsshuipbbiipj3KaDCOE7YSsv9Z1WAcQm+6Ar6qJGtjm2hHsCK33XeGuwojFPM
	pWyiWZxhbBycMglHRHVg1ppHxp3X1ud8mJZXUZOsdFafJ+kZiYHmFD9p8dO0+Nvewsc10S/fxkvjX
	By4wwNWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twdMZ-00000002cIB-2rwP;
	Mon, 24 Mar 2025 08:40:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twdKo-00000002c2q-3p8d;
	Mon, 24 Mar 2025 08:39:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A3C51A2D;
	Mon, 24 Mar 2025 01:39:05 -0700 (PDT)
Received: from [10.57.41.67] (unknown [10.57.41.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53A833F58B;
	Mon, 24 Mar 2025 01:38:53 -0700 (PDT)
Message-ID: <efc72f28-0dcb-4811-a20c-73bcdbdf28fb@arm.com>
Date: Mon, 24 Mar 2025 09:37:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] mm: Call ctor/dtor for kernel PTEs
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mark Rutland <mark.rutland@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>, Qi Zheng
 <zhengqi.arch@bytedance.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org
References: <20250317141700.3701581-1-kevin.brodsky@arm.com>
 <20250317141700.3701581-3-kevin.brodsky@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20250317141700.3701581-3-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_013903_000441_C9C75BC3 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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

On 17/03/2025 15:16, Kevin Brodsky wrote:
> diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
> index e164ca66f0f6..3c8ec3bfea44 100644
> --- a/include/asm-generic/pgalloc.h
> +++ b/include/asm-generic/pgalloc.h
> @@ -23,6 +23,11 @@ static inline pte_t *__pte_alloc_one_kernel_noprof(struct mm_struct *mm)
>  
>  	if (!ptdesc)
>  		return NULL;
> +	if (!pagetable_pte_ctor(mm, ptdesc)) {

As reported by the CI [1], this can cause trouble on x86 because dtor
calls are missing in pud_free_pmd_page() and pmd_free_pte_page(). Will
fix in the next version.

- Kevin

[1] https://lore.kernel.org/oe-lkp/202503211612.e11bd73f-lkp@intel.com/

