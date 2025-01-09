Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCA1E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 07:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=goDrdg8W+niPDn8ee1CTbptL4R9YVIAcGFLpDdY+Uh8=; b=qSKs2QiYZCWuiGZ+NTAoE4/khI
	Hs5xQbq2wQ7GFXcev0TmFx4nARyCUQQt3iV6PZT8AioYMdYlJiUb1MRnqJUD8IPMFJF2iD/E6W6SP
	jOuuNbuy6YMYAXLoRzGecMF6hxUs25kaiQ44Jx3e/YP2J6gv7hp5kPZBCPTRUh5ZBlP5w706Les+D
	REfknv7bv4+q7If7cDIw3f352qgjllQ19VqhfXLFEL1sLBY+sMXtxd26y+XzQE3rnUswPTkNDsf6a
	Rrh1c7PRGU0yyZalsxuJNNTjxqfPv60tcIm9tlqBiaMSBS4tmw8q1K3RZ+DrQ/mZy1lyR7miVtsab
	y0VR1N/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVmow-0000000B1oB-3XZ0;
	Thu, 09 Jan 2025 07:19:10 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVmnf-0000000B1ew-1Uw1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 07:17:53 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so1018804a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 23:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736407066; x=1737011866; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=goDrdg8W+niPDn8ee1CTbptL4R9YVIAcGFLpDdY+Uh8=;
        b=dU8daxRXC5QfxtFPymz4wkij7v9nJV5bF/qQn1G5lsXE6bPAjmhXBBp6l3AMXGUaGS
         o5vOoyktzu63e9tnql+a1MMktTR8NHnF3sqjWh+Ymb+iWADt1ekEtb/OmVy8tvD8oI6a
         tJhx5o27DlwAIdDONotlcuYn2HMbqOO8cJ0SikIS+ug9girZgGapLlnIFRA1DTOybhzZ
         eyrHWOGn/E3ZmjMGg5B+x4pJuVZ5lj2N2EtmMkZ4OEo9Tu3iD6ZMj1lZNlPNBSKZ8Pvl
         nf99oAQp2gv7oe5DPcMuqKg45QW0E2jiCrCkGzHmOs4nNX39uC6mV93H3NXP9B2quuzt
         lmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736407066; x=1737011866;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=goDrdg8W+niPDn8ee1CTbptL4R9YVIAcGFLpDdY+Uh8=;
        b=TAUI5mFzHcb2a1lN1q9bvru5wSq/H5wZNlm99vEBISrl2gpdNpSibKCltDOL7EUAQs
         IA2bcOS0ZK4FBisooEBi49MAStBYY6ysJTrXwJmi6Y2gXjqb2UNDkpdNCL6UkaodHLhG
         lI4hjEHsBK1C/RS6KoRnEYzGtkvbatrKmb10rUTMmWs6VWFHKyhkFqZRMJ7zZC32eGAl
         JoX51aAX+nP38NbgcmrfIGyu22nHxRITClnPKEozkAWIdc3UFzIhRk5mxOlc7VazgUAX
         t/lPYQRygWieZoQk3WHoyuo9QhM2m2VnZv6sD93NBEdcMYFbtSHDIjeud7QXFo0d5WTe
         dYoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSyHollwo3pApbM2YNsDJ06nHypNvWEsKrPWl+6nvRklO/uaJGEjbafcSdKZGh6QTt1Kz7mzT9wSqh3NPlVgPW@lists.infradead.org
X-Gm-Message-State: AOJu0YyV0BHsMHGRXQhIl1qeJu3Zu0erbaHL7WgQ350RFpidKho4KnRd
	6s8nYgE1GEYpoqeQtwswcR4JNqqxqp/omDo+FcnWHQtopC5ygoyX+z6oU3STQRE=
X-Gm-Gg: ASbGncvuczIVRdE0zm9eICeiB00ChM2LEV0hcIZNqOIV+089oQ6Fu4xJ9fWmeCcIbZz
	PKJS4P8bDODWCWtrD6Oe4g3AdBzimlQlApm2XLerP2ZSKbCjKIXR6JwlTjdPqvCgK5CEfMdtH3P
	XHAWfVOscpWzRIv19ps8jFFeIPeAQDCt/+GuBdFf2MLvCMvOY3RgG9bCWIQATkNKGCzVlT0wGlI
	DxYuu/BUTOKjgoUm2tg+tRETwmnEIhlh71ZHZX6Sv/ovprY5VehCu/4TBkRxFIuk35BmcI+bHPc
	TQAy
X-Google-Smtp-Source: AGHT+IEsAuvKeLfnjNnQ0YmOJjZ/KDeiDHrFAudvPLzZf1ylAUBvPZmXYBm85/H4yI4Dr4XRcKGbcw==
X-Received: by 2002:a05:6a00:3910:b0:728:e906:e446 with SMTP id d2e1a72fcca58-72d220077b5mr9905948b3a.24.1736407066229;
        Wed, 08 Jan 2025 23:17:46 -0800 (PST)
Received: from [10.4.51.182] ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad848020sm36417198b3a.81.2025.01.08.23.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 23:17:45 -0800 (PST)
Message-ID: <6b4c4abb-8d53-4b17-8a1c-1d28fb4d5f88@bytedance.com>
Date: Thu, 9 Jan 2025 15:17:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 13/15] arm64: mm: Guard page table writes with
 kpkeys
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Andy Lutomirski <luto@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Quentin Perret <qperret@google.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org
References: <20250108103250.3188419-1-kevin.brodsky@arm.com>
 <20250108103250.3188419-14-kevin.brodsky@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
Content-Language: en-US
In-Reply-To: <20250108103250.3188419-14-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_231751_716176_DF64F040 
X-CRM114-Status: GOOD (  25.00  )
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

Hi Kevin,

On 2025/1/8 18:32, Kevin Brodsky wrote:
> When CONFIG_KPKEYS_HARDENED_PGTABLES is enabled, page tables (both
> user and kernel) are mapped with a privileged pkey in the linear
> mapping. As a result, they can only be written under the
> kpkeys_hardened_pgtables guard, which sets POR_EL1 appropriately to
> allow such writes.
> 
> Use this guard wherever page tables genuinely need to be written,
> keeping its scope as small as possible (so that POR_EL1 is reset as
> fast as possible). Where atomics are involved, the guard's scope
> encompasses the whole loop to avoid switching POR_EL1 unnecessarily.
> 
> This patch is a no-op if CONFIG_KPKEYS_HARDENED_PGTABLES is disabled
> (default).
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>   arch/arm64/include/asm/pgtable.h | 19 +++++++++++++++++--
>   arch/arm64/mm/fault.c            |  2 ++
>   2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index f8dac6673887..0d60a49dc234 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -39,6 +39,7 @@
>   #include <linux/mm_types.h>
>   #include <linux/sched.h>
>   #include <linux/page_table_check.h>
> +#include <linux/kpkeys.h>
>   
>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>   #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
> @@ -314,6 +315,7 @@ static inline pte_t pte_clear_uffd_wp(pte_t pte)
>   
>   static inline void __set_pte_nosync(pte_t *ptep, pte_t pte)
>   {
> +	guard(kpkeys_hardened_pgtables)();
>   	WRITE_ONCE(*ptep, pte);
>   }
>   
> @@ -758,6 +760,7 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
>   	}
>   #endif /* __PAGETABLE_PMD_FOLDED */
>   
> +	guard(kpkeys_hardened_pgtables)();
>   	WRITE_ONCE(*pmdp, pmd);
>   
>   	if (pmd_valid(pmd)) {

I noticed a long time ago that set_pte/set_pmd/... was implemented
separately by each architecture without a unified entry point. This
makes it difficult to add some hooks for them.

Taking set_pte() as an example, is it possible to do the following:

1) add a generic set_pte() in include/asm-generic/tlb.h (Or other more
    appropriate files)

static inline void set_pte(pte_t *ptep, pte_t pte)
{
	arch_set_pte(ptep, pte);
}

2) let each architecture include this file and rename the original
    set_pte() to arch_set_pte().

3) then we can add hooks for generic set_pte():

static inline void set_pte(pte_t *ptep, pte_t pte)
{
	guard(kpkeys_hardened_pgtables)();
	arch_set_pte(ptep, pte);
}

4) in this way, the architecture that supports
    ARCH_HAS_KPKEYS_HARDENED_PGTABLES only needs to implement
    the kpkeys_hardened_pgtables(), otherwise it is no-op.

Just some immature ideas, and the related set/clear interfaces
are currently quite messy. ;)

Of course, this does not affect the feature to be implemented
in this patch series.

Thanks!


