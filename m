Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DB6CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 11:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QmX1T5Z1Z1Mon9lysEvu1tgyuq7ma2gqfZkpuoX2E4=; b=VmDYWCES52ulUGvFUWfi3B+Sbj
	CYyhS+szqJfyvgV4LQUYtuDp0itJMvPA3+YIckCULIAO8uGly2C66PNxRxcSn8vtiATthRPEhGFg2
	+c720LiKZAVPslYC/EcEvnpkbWIS8flACNtdPIYgTDZ14MqdxrsjfEyYsxKdaBpLcELXWYpU43kug
	vjxMOs2VmkZDliNpj0alDL9+pFVRXg1pX7p+iyrwbUql/MYl9Yz6JIYtrRGswx39h4WBT20glYHZJ
	uvHJIOzfKWBHEOE8t81MqiPtUO7Bv1gY6c3l4LNt4bLOWPe04S56yF69kzh+GBDgGNCtFLmNQ6YuW
	tWemw5ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0Tf-0000000AhbF-13WU;
	Mon, 01 Jun 2026 11:06:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0Tc-0000000AhaR-23OD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 11:06:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 064561E7D;
	Mon,  1 Jun 2026 04:06:29 -0700 (PDT)
Received: from [10.164.19.28] (unknown [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E1123F632;
	Mon,  1 Jun 2026 04:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780311993; bh=rIPCRJlF3C5CGybciFVEHG8kM8P9Y/ochm5Nk/iXQLA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l6m577XdcFp83GD11AjZtBk9/x8HVwX6Ol04tR2Bdgz1+7hCiLXGiRbqT8axEXbFf
	 kE9xwaZFqE+GQKddJq6yGwpqqS2+dXTVbFKMhcxwC5PZRCgArJ1h64IlrNE8PUE91X
	 p06wQOo7mkNU7qeLlwGG1tCmc9n7PCivgQLkKbA0=
Message-ID: <2000d7c9-3188-4539-ba9e-654d6460e21d@arm.com>
Date: Mon, 1 Jun 2026 16:36:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V2 13/14] arm64/mm: Add an abstraction level for tlbi_op
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, Usama Arif <usama.arif@linux.dev>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260513044547.4128549-1-anshuman.khandual@arm.com>
 <20260513044547.4128549-14-anshuman.khandual@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260513044547.4128549-14-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_040636_618664_4F112D58 
X-CRM114-Status: GOOD (  16.10  )
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



On 13/05/26 10:15 am, Anshuman Khandual wrote:
> From: Linu Cherian <linu.cherian@arm.com>
> 
> With FEAT_D128, a new instruction aka TLBIP is being introduced for the TLB
> range operations which has an argument size of 128 bit.
> 
> Add an abstraction level to void (*tlbi_op)(u64 arg) helpers to support the
> D128 variations when applicable.
> 
> No functional changes are introduced with this patch.
> 
> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/include/asm/tlbflush.h | 70 ++++++++++++++++---------------
>  1 file changed, 37 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index c0bf5b398041..361d74ef8016 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -162,49 +162,53 @@ static inline void sme_dvmsync_batch(struct arch_tlbflush_unmap_batch *batch)
>  
>  #define TLBI_TTL_UNKNOWN	INT_MAX
>  
> -typedef void (*tlbi_op)(u64 arg);
> +typedef u64 tlbi_args_t;
> +#define __tlbi_wrapper(op, arg)		__tlbi(op, arg)
> +#define __tlbi_user_wrapper(op, arg)	__tlbi_user(op, arg)

The suffix "wrapper" sounds weird. How about "emit"?

>  
> -static __always_inline void vae1is(u64 arg)
> +typedef void (*tlbi_op)(tlbi_args_t arg);
> +
> +static __always_inline void vae1is(tlbi_args_t arg)
>  {
> -	__tlbi(vae1is, arg);
> -	__tlbi_user(vae1is, arg);
> +	__tlbi_wrapper(vae1is, arg);
> +	__tlbi_user_wrapper(vae1is, arg);
>  }
>  
> -static __always_inline void vae2is(u64 arg)
> +static __always_inline void vae2is(tlbi_args_t arg)
>  {
> -	__tlbi(vae2is, arg);
> +	__tlbi_wrapper(vae2is, arg);
>  }
>  
> -static __always_inline void vale1(u64 arg)
> +static __always_inline void vale1(tlbi_args_t arg)
>  {
> -	__tlbi(vale1, arg);
> -	__tlbi_user(vale1, arg);
> +	__tlbi_wrapper(vale1, arg);
> +	__tlbi_user_wrapper(vale1, arg);
>  }
>  
> -static __always_inline void vale1is(u64 arg)
> +static __always_inline void vale1is(tlbi_args_t arg)
>  {
> -	__tlbi(vale1is, arg);
> -	__tlbi_user(vale1is, arg);
> +	__tlbi_wrapper(vale1is, arg);
> +	__tlbi_user_wrapper(vale1is, arg);
>  }
>  
> -static __always_inline void vale2is(u64 arg)
> +static __always_inline void vale2is(tlbi_args_t arg)
>  {
> -	__tlbi(vale2is, arg);
> +	__tlbi_wrapper(vale2is, arg);
>  }
>  
> -static __always_inline void vaale1is(u64 arg)
> +static __always_inline void vaale1is(tlbi_args_t arg)
>  {
> -	__tlbi(vaale1is, arg);
> +	__tlbi_wrapper(vaale1is, arg);
>  }
>  
> -static __always_inline void ipas2e1(u64 arg)
> +static __always_inline void ipas2e1(tlbi_args_t arg)
>  {
> -	__tlbi(ipas2e1, arg);
> +	__tlbi_wrapper(ipas2e1, arg);
>  }
>  
> -static __always_inline void ipas2e1is(u64 arg)
> +static __always_inline void ipas2e1is(tlbi_args_t arg)
>  {
> -	__tlbi(ipas2e1is, arg);
> +	__tlbi_wrapper(ipas2e1is, arg);
>  }
>  
>  static __always_inline void __tlbi_level_asid(tlbi_op op, u64 addr, u32 level,
> @@ -475,32 +479,32 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>   *    operations can only span an even number of pages. We save this for last to
>   *    ensure 64KB start alignment is maintained for the LPA2 case.
>   */
> -static __always_inline void rvae1is(u64 arg)
> +static __always_inline void rvae1is(tlbi_args_t arg)
>  {
> -	__tlbi(rvae1is, arg);
> -	__tlbi_user(rvae1is, arg);
> +	__tlbi_wrapper(rvae1is, arg);
> +	__tlbi_user_wrapper(rvae1is, arg);
>  }
>  
> -static __always_inline void rvale1(u64 arg)
> +static __always_inline void rvale1(tlbi_args_t arg)
>  {
> -	__tlbi(rvale1, arg);
> -	__tlbi_user(rvale1, arg);
> +	__tlbi_wrapper(rvale1, arg);
> +	__tlbi_user_wrapper(rvale1, arg);
>  }
>  
> -static __always_inline void rvale1is(u64 arg)
> +static __always_inline void rvale1is(tlbi_args_t arg)
>  {
> -	__tlbi(rvale1is, arg);
> -	__tlbi_user(rvale1is, arg);
> +	__tlbi_wrapper(rvale1is, arg);
> +	__tlbi_user_wrapper(rvale1is, arg);
>  }
>  
> -static __always_inline void rvaale1is(u64 arg)
> +static __always_inline void rvaale1is(tlbi_args_t arg)
>  {
> -	__tlbi(rvaale1is, arg);
> +	__tlbi_wrapper(rvaale1is, arg);
>  }
>  
> -static __always_inline void ripas2e1is(u64 arg)
> +static __always_inline void ripas2e1is(tlbi_args_t arg)
>  {
> -	__tlbi(ripas2e1is, arg);
> +	__tlbi_wrapper(ripas2e1is, arg);
>  }
>  
>  static __always_inline void __tlbi_range(tlbi_op op, u64 addr,


