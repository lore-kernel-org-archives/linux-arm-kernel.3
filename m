Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDCDCA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSeysckHnQabKeNlXpR7/heI2C5aygLCwktZgmt+6TI=; b=4301ztA+O56memEraoocL62Huo
	BsIDC1Pi5opCxyAHph86SSLk9DoB8iRgJ6k1N6Z8Eo73w/j+T4r6/OdGtNTndb6Uj8FYqS0V38l/X
	35joevr0cNquMhRqOO3ylQqjJvrpYeAHgJpIWsIQFVdx0xHhgZoOZrbG7Gqsm73Vn4kivkSr8fwjK
	04HpuhATwfy5l/q0V1uQRbnEsBCWWeE87xcX34xS9dum2HTya+8lyFgAmTEuL+bbsZWhXdGgApkrs
	n4hXn8pgjC3NXxjiHBIcB6ws54j7TS9G9HhETmSE+tLirCyGGz4T+2BrMdUSan13h3jkZy/Mp9JVm
	LYOXlgVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9oC-00000007C3D-0WFF;
	Sat, 30 Aug 2025 00:51:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4X9-00000006jJ0-3G7b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 19:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756494790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HSeysckHnQabKeNlXpR7/heI2C5aygLCwktZgmt+6TI=;
	b=VEwjGNuGjmJyyQhkKmb7N9/QCYcdSbVAn36byMVg5TN9liqxRXorvMNby3LoEbGs4dyXsX
	inkoU3JPNVwLMsJC91sS6M/IxRscnGv/PEb7Ase0qeqBVkT5FqOcEI5yMGNvE3zI+PxIIu
	ihx2kKvG/OYCmVfevGcBdqMZdhMDaLo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-PnWbQWJSNYGf-AWUX9CrFA-1; Fri, 29 Aug 2025 15:13:08 -0400
X-MC-Unique: PnWbQWJSNYGf-AWUX9CrFA-1
X-Mimecast-MFC-AGG-ID: PnWbQWJSNYGf-AWUX9CrFA_1756494787
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3ce059e3d42so1286137f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 12:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756494787; x=1757099587;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSeysckHnQabKeNlXpR7/heI2C5aygLCwktZgmt+6TI=;
        b=USTJzOHlYEK5ID4fDfkfXYSageW2cH5OvJM/rC34HVbD/U8DDnGb6JVC/qJv+2SILw
         0PbXw7fP+da5TL3FpeOl8j5BTIcccp059h5WF7k0P4xpuExeRnz5baJflecna1zEjQBx
         pbYUrpYl+LnICNLQMtUEZyAVwuWBrwGh8Px2bWmng9uyh6AKvvx9YJuB+F0rjXZ7xgyz
         2UpRjzDAlzi3JGSKyZJkfGp1pS28y5n2Qeq3nisBTr/J7bFJ9uLMdWSl9pKPVsTE91MH
         +Ieykw/mpeHTOLFg4cvKLydHkcK1s2tXZI1IIVwrIAgPKYhgyCXTpXZR8XJCdohhBIJ9
         Vppw==
X-Forwarded-Encrypted: i=1; AJvYcCX7onuRZC3Mw3t+tDoQBldQpquMooEvWoprNhsnsN2rSxKSOLxR94gI9h52CHWaJvlmU8YZe7ciyJUU6D1i8f+f@lists.infradead.org
X-Gm-Message-State: AOJu0YxUyflyMmZhAkYj9hD2FmMF8S5SGW6xHqABXvOE5Q7/Z1dXdVRI
	N+Mjoi58QKAoCHqcNsO5red6J4zF/IQgLmcc4dyJQDAVhfxkPfVAWQFI0/yVa3Ugc/NYvXQZ2xW
	2XcMIW/8WH2K1KeL8KH/HyMzeiLwKgzzk25p2DHjepimpLw9US6T5Z2hL5OUY8SGJCczAqL0lAK
	P0
X-Gm-Gg: ASbGncvPAN+7PkxHZNWw0YTVTRDVmXzsgP7EkIO9YuQsM53XHiH99euw076+5a3/ZVT
	z6dXWKhvmm+gUBzC1m/ZU887a2dEK7VnFGgRG/OmnBmDvsHkTUtso27DMmnghNR9pvWsLORAgWj
	Qo8G21Wr8C+odhXa9raGi/vfXnHr/tOX2iqoDEt3B1gYIQCo4IWUYeVaXViPjeluo7tSfkLXTOf
	U6z3M9VQW6atWZh9XXPVGVlQASrWIJ8n6F1M5BdjJDJ8uA9VwpXl27uKFTUUjGmXzJHCyZgCnHC
	4E9dhW6hL4jB4mScHJKpYAtBi3zp6YfMu/pJv2hpUDv5qmQroZxfvrg3RnhXsNAN959CEYY=
X-Received: by 2002:a05:6000:2586:b0:3cf:ef30:c808 with SMTP id ffacd0b85a97d-3cfef30cb83mr2947755f8f.47.1756494787309;
        Fri, 29 Aug 2025 12:13:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfFSQmPSWsWJpQ1EFrfCPCBmA+jrDFQVagOXqI3mWiU8K//z/Ui607sGHoFijBJXlyfIX4Rw==
X-Received: by 2002:a05:6000:2586:b0:3cf:ef30:c808 with SMTP id ffacd0b85a97d-3cfef30cb83mr2947734f8f.47.1756494786855;
        Fri, 29 Aug 2025 12:13:06 -0700 (PDT)
Received: from [192.168.3.141] (p4fe0f07b.dip0.t-ipconnect.de. [79.224.240.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e898b99sm49008435e9.19.2025.08.29.12.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 12:13:06 -0700 (PDT)
Message-ID: <c13af2e9-a0ac-4e1d-be8e-4612ae8d9c0f@redhat.com>
Date: Fri, 29 Aug 2025 21:13:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: mm: Fix CFI failure due to kpti_ng_pgd_alloc
 function signature
To: Kees Cook <kees@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Yue Haibing <yuehaibing@huawei.com>,
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, James Morse <james.morse@arm.com>,
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 Zhenhua Huang <quic_zhenhuah@quicinc.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20250829190721.it.373-kees@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250829190721.it.373-kees@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8AX_CRRuVbh2h1wwPZ1X_mzNXVv9v3qHTYUWnjPjEcg_1756494787
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_121311_899082_0F850D40 
X-CRM114-Status: GOOD (  20.85  )
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

On 29.08.25 21:07, Kees Cook wrote:
> Seen during KPTI initialization:
> 
>    CFI failure at create_kpti_ng_temp_pgd+0x124/0xce8 (target: kpti_ng_pgd_alloc+0x0/0x14; expected type: 0xd61b88b6)
> 
> The call site is alloc_init_pud() at arch/arm64/mm/mmu.c:
> 
>    pud_phys = pgtable_alloc(TABLE_PUD);
> 
> alloc_init_pud() has the prototype:
> 
>    static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>                               phys_addr_t phys, pgprot_t prot,
>                               phys_addr_t (*pgtable_alloc)(enum pgtable_type),
>                               int flags)
> 
> where the pgtable_alloc() prototype is declared.
> 
> The target (kpti_ng_pgd_alloc) is used in arch/arm64/kernel/cpufeature.c:
> 
>    create_kpti_ng_temp_pgd(kpti_ng_temp_pgd, __pa(alloc), KPTI_NG_TEMP_VA,
>                            PAGE_SIZE, PAGE_KERNEL, kpti_ng_pgd_alloc, 0);
> 
> which is an alias for __create_pgd_mapping_locked() with prototype:
> 
>    extern __alias(__create_pgd_mapping_locked)
>    void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys,
>                                 unsigned long virt,
>                                 phys_addr_t size, pgprot_t prot,
>                                 phys_addr_t (*pgtable_alloc)(enum pgtable_type),
>                                 int flags);
> 
> __create_pgd_mapping_locked() passes the function pointer down:
> 
>    __create_pgd_mapping_locked() -> alloc_init_p4d() -> alloc_init_pud()
> 
> But the target function (kpti_ng_pgd_alloc) has the wrong signature:
> 
>    static phys_addr_t __init kpti_ng_pgd_alloc(int shift);
> 
> The "int" should be "enum pgtable_type".
> 
> To make "enum pgtable_type" available to cpufeature.c, move
> enum pgtable_type definition from arch/arm64/mm/mmu.c to
> arch/arm64/include/asm/mmu.h.
> 
> Adjust kpti_ng_pgd_alloc to use "enum pgtable_type" instead of "int".
> The function behavior remains identical (parameter is unused).
> 
> Fixes: c64f46ee1377 ("arm64: mm: use enum to identify pgtable level instead of *_SHIFT")
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
>   v2: Fixed the Fixes line. ;)
>   v1: https://lore.kernel.org/lkml/20250829154913.work.943-kees@kernel.org/
> Cc: Kevin Brodsky <kevin.brodsky@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Yue Haibing <yuehaibing@huawei.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: <linux-arm-kernel@lists.infradead.org>
> ---
>   arch/arm64/include/asm/mmu.h   | 7 +++++++
>   arch/arm64/kernel/cpufeature.c | 5 +++--
>   arch/arm64/mm/mmu.c            | 7 -------
>   3 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
> index 6e8aa8e72601..49f1a810df16 100644
> --- a/arch/arm64/include/asm/mmu.h
> +++ b/arch/arm64/include/asm/mmu.h
> @@ -17,6 +17,13 @@
>   #include <linux/refcount.h>
>   #include <asm/cpufeature.h>
>   
> +enum pgtable_type {
> +	TABLE_PTE,
> +	TABLE_PMD,
> +	TABLE_PUD,
> +	TABLE_P4D,
> +};

Just noting that we now have "enum pgtable_level" in 
include/linux/pgtable.h that could at some point possibly be used here 
instead (not in this fix).

-- 
Cheers

David / dhildenb


