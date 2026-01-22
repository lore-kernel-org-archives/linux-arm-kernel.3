Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BB0D6260F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKFFY9tRzSJfn5Z1uQsiCL70JsNQR1IfItIxVvAuEvo=; b=kiVBfzARWy6da4mMwVM9hgOwLx
	uRZ/3Ktb5m79wo1NPM4cgU2QahgjpkKDOwLJVu/r0cwwu/dtAUrxyoHnFPr9bCb1+XZgCov4OhINn
	ioyDV935zKexZWBtJFkaFHyqMPst7Lh3H1du64tpZSOEBlZ+eV0ATEhPqcbYi4lW/+5QGRJI9xHFP
	/Bcd3ZhPCPa+RzNn0m8BZfpA7JPqBKnN3gIHfeR2F2N51+kL+M5cpwuw52F7G+axsteBjW/Q2e7Ui
	ZEE2SZFaR7SbHNPmxVXe19PESmpAxkx55uzC8ZUA+WIeqD/jdZEEC3+dhxJSg7nK17F+YS+O6nQPq
	mQz+iVKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virqF-00000006pRJ-2mMu;
	Thu, 22 Jan 2026 10:23:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virqD-00000006pQQ-3GGE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:23:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A99B5339;
	Thu, 22 Jan 2026 02:22:56 -0800 (PST)
Received: from [10.1.194.63] (e142334-100.cambridge.arm.com [10.1.194.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 580EE3F740;
	Thu, 22 Jan 2026 02:23:02 -0800 (PST)
Message-ID: <7e47cccb-5d9f-470d-9de1-8caddc300646@foss.arm.com>
Date: Thu, 22 Jan 2026 10:23:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: mte: Set TCMA1 whenever MTE is present in
 the kernel
To: Carl Worth <carl@os.amperecomputing.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Taehyun Noh <taehyun@utexas.edu>, usama.anjum@foss.arm.com,
 Peter Collingbourne <pcc@google.com>
References: <20251030-mte-tighten-tco-v2-0-e259dda9d5b3@os.amperecomputing.com>
 <20251030-mte-tighten-tco-v2-2-e259dda9d5b3@os.amperecomputing.com>
Content-Language: en-US
From: Usama Anjum <usama.anjum@foss.arm.com>
In-Reply-To: <20251030-mte-tighten-tco-v2-2-e259dda9d5b3@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_022305_861485_F6BDBDBB 
X-CRM114-Status: GOOD (  22.00  )
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

On 15/01/2026 11:07 pm, Carl Worth wrote:
> Set the TCMA1 bit so that access to TTBR1 addresses with 0xf in their
> tag bits will be treated as tag unchecked.
> 
> This is important to avoid unwanted tag checking on some
> systems. Specifically, SCTLR_EL1.TCF can be set to indicate that no
> tag check faults are desired. But the architecture doesn't guarantee
> that in this case the system won't still perform tag checks.
> 
> Use TCMA1 to ensure that undesired tag checks are not performed. This
> bit was already set in the KASAN case. Adding it to the non-KASAN case
> prevents tag checking since all TTBR1 address will have a value of 0xf
> in their tag bits.
> 
> This patch has been measured on an Ampere system to improve the following:
> 
> * Eliminate over 98% of kernel-side tag checks during "perf bench
>    futex hash", as measured with "perf stat".
> 
> * Eliminate all MTE overhead (was previously a 25% performance
>    penalty) from the Phoronix pts/memcached benchmark (1:10 Set:Get
>    ration with 96 cores).
> 
> Reported-by: Taehyun Noh <taehyun@utexas.edu>
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Carl Worth <carl@os.amperecomputing.com>
Fixes tag is required here so that the fix traverses to the stable 
kernels. I've not found the most appropriate commit:

973b9e373306 ("arm64: mte: move register initialization to C")
bfc62c598527 ("arm64: kasan: allow enabling in-kernel MTE")

In my opinion, bfc62c598527 should be in the fixes-by tag. At a minimum, 
the back porting should be done till 973b9e373306.

> ---
>   arch/arm64/mm/proc.S | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> index 5d907ce3b6d3..22866b49be37 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -48,14 +48,14 @@
>   #define TCR_KASAN_SW_FLAGS 0
>   #endif
>   
> -#ifdef CONFIG_KASAN_HW_TAGS
> -#define TCR_MTE_FLAGS TCR_EL1_TCMA1 | TCR_EL1_TBI1 | TCR_EL1_TBID1
> -#elif defined(CONFIG_ARM64_MTE)
> +#ifdef CONFIG_ARM64_MTE
>   /*
>    * The mte_zero_clear_page_tags() implementation uses DC GZVA, which relies on
> - * TBI being enabled at EL1.
> + * TBI being enabled at EL1.  TCMA1 is needed to treat accesses with the
> + * match-all tag (0xF) as Tag Unchecked, irrespective of the SCTLR_EL1.TCF
> + * setting.
>    */
> -#define TCR_MTE_FLAGS TCR_EL1_TBI1 | TCR_EL1_TBID1
> +#define TCR_MTE_FLAGS TCR_EL1_TCMA1 | TCR_EL1_TBI1 | TCR_EL1_TBID1
>   #else
>   #define TCR_MTE_FLAGS 0
>   #endif
> 


