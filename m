Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62789CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 09:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:Date:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PiM5gwx7v9fuKjSNGU0XIbMsJHzNcD3t6sxDOvTigVo=; b=P/T3m0jNedLRnak6KYCebYlKWd
	rkxuEPDX4RmcdVNW/OQxXhp/WWnfIvLwkjfI23KfbQFJ2P+ng6RcfGUBs5hxQhX4lR+skLkFAIfYy
	vuXWvzMQix7b/foQrZoIE8BmNMaJkVdytRGt/sk2EohzK9MQE1GB6wgacz6kO8pBg4HWD5kDKlcRZ
	DGNLG2RVF7MzY2qNHc2mUM2/kW8fyWN6RvHknGFdyWN/RlZ2NPZDVgc/Kk+UvRHkOel0oTXTfBtNf
	pW1U2+rhC4uZTPXuR2EbE6OCzI+ktrjedz1yllKh3ZTrwe+NZi6eLdMHi+VooaBx6/lBsEtPIE+KX
	Ggm5EbUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaHl-0000000DREv-3nos;
	Wed, 05 Nov 2025 09:58:37 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaHj-0000000DREU-1TUg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 09:58:36 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-294fe7c2e69so61862465ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 01:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762336714; x=1762941514; darn=lists.infradead.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PiM5gwx7v9fuKjSNGU0XIbMsJHzNcD3t6sxDOvTigVo=;
        b=FCEHgyBCHsuORXu65Kv9qHVNWFEPR+4ZV8eBJVqzKrVF9BVtR7Rw9nhZd761EEx1my
         wvi1VtJO7Oqsjs+iunLuySy1oW8T/b3Apqd5elkM5bOiGAKdd9he5oeBHvVzoASxmzVZ
         rZTwRMVKP/iPHXNot41LOKXQzilJiDfPzcP3scAe5d39eCFrvNN5LP/6sR8w/sXDBHXL
         yZrh8mmaOkGFOuJBEUgn+H04t2MoKONRkFci4bSrXdov+yib8ro2Ytr4D3HCT8tRk06B
         l4OmoX5+4UX/e6gcRcSXvcrClh+qW4CO5EA8UUBgm7Bova4LCgc08BE1pJm6H9sZPZoH
         NhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762336714; x=1762941514;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PiM5gwx7v9fuKjSNGU0XIbMsJHzNcD3t6sxDOvTigVo=;
        b=XuI+s352YO+AspdInZ0xBplaFfLrgFPANTSjiFcxHMzjMJLNbrVSU5dZLG8I00mOnT
         Q0lSbPT8d/enPImC73hE9xYPl8tIUL8tB5yZCZro+3ijk8oc8HndSiHl/fVjeY61bdvx
         crHjS75nJaFBoCFft8xYDDnkl642yDYu+qhwbQ0ShHC75jVGsaoTi65NrpB3Kx2Kn4kK
         0e1pmJxvGMEKcCBfrstbPU7/ZFvBCH1Qbmrjk+/qbfXvD4K4ebB/RJSNFKxdjzh0CamM
         W3OgIi1OZ2qu2qOgn+PMGf6QOog/PO7M48eFrMbI0kaubLD2z5UutFziCfu7VprxcmkT
         SLeA==
X-Forwarded-Encrypted: i=1; AJvYcCWU2Kv5JPfk74Y0kiXl7r10HeiWByWzjcVE5ikODIpuSBSa3JPAr9YDdkQh236si/rU7z6snm42tHHX1vB1MXvH@lists.infradead.org
X-Gm-Message-State: AOJu0YxPVpGDtyFOtpOSk4lPSZ+xDHqnEt/7irEOsXD5LJwIss2dGG21
	qat2eF1cmzFVAP3EOvbd2I2fvoOYMpSLO5lFOE0ZpHPUmruklZ27//ZK
X-Gm-Gg: ASbGncsVl/vqUnTrkOdotdRu7RKVEIxlV0aA+wNnofg0d8nrXUHx4oZlrdywGD+1pFC
	Qkb/PN8u4qAuxrtIh6yi8v/T7iSQk5yoSHmLfnFl66IYxHT3G0cHKwmzs7i2O7Y9VW4rqQn4Dyy
	BPGzG93ok3fpc2TWu3vB78hiYbjWk+4k695iffEMqaA1e5GwAEBKVW57QZ1E8qA2INmqyRIxxho
	ss1hk4xhDqo7NhJfkFDT090u83ZPrBtLhPRTusDD6L1CbJs/ZpAt2u6bJFFm8rWhorrr1FVhT14
	OLWqQRpQtazVBDcQnbJzpLClYWNqwm+ZIs0jkyCkAsSZ8Fe4G8pd7FjvhQtsXMHnfq9EXfYztdQ
	dS5/JQ+v7O7jFVJD1KIJbE0aB40zx4h+4BsP2Degdko3KuSlh56ZxExsu5eqd2Q5VvEMdFw==
X-Google-Smtp-Source: AGHT+IHbi+0zqKpbA9V2mHcqMUNAu2olVZcwJU6s62eDD+69tSv+JW/d6KHzoaPAbvo+C4JRz5nOFw==
X-Received: by 2002:a17:903:19ce:b0:246:7a43:3f66 with SMTP id d9443c01a7336-2962adb2b0fmr33595265ad.7.1762336714441;
        Wed, 05 Nov 2025 01:58:34 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601972ad1sm55039695ad.19.2025.11.05.01.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 01:58:33 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v4 03/12] powerpc/mm: implement arch_flush_lazy_mmu_mode()
In-Reply-To: <87pl9x41c5.ritesh.list@gmail.com>
Date: Wed, 05 Nov 2025 15:19:35 +0530
Message-ID: <87jz044xn4.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-4-kevin.brodsky@arm.com> <87pl9x41c5.ritesh.list@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_015835_398957_89169CA8 
X-CRM114-Status: GOOD (  28.66  )
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

Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:

> Kevin Brodsky <kevin.brodsky@arm.com> writes:
>
>> Upcoming changes to the lazy_mmu API will cause
>> arch_flush_lazy_mmu_mode() to be called when leaving a nested
>> lazy_mmu section.
>>
>> Move the relevant logic from arch_leave_lazy_mmu_mode() to
>> arch_flush_lazy_mmu_mode() and have the former call the latter.
>>
>> Note: the additional this_cpu_ptr() on the
>> arch_leave_lazy_mmu_mode() path will be removed in a subsequent
>> patch.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>  .../powerpc/include/asm/book3s/64/tlbflush-hash.h | 15 +++++++++++----
>>  1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>> index 146287d9580f..7704dbe8e88d 100644
>> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>> @@ -41,6 +41,16 @@ static inline void arch_enter_lazy_mmu_mode(void)
>>  	batch->active = 1;
>>  }
>>  
>> +static inline void arch_flush_lazy_mmu_mode(void)
>> +{
>> +	struct ppc64_tlb_batch *batch;
>> +
>> +	batch = this_cpu_ptr(&ppc64_tlb_batch);
>> +
>> +	if (batch->index)
>> +		__flush_tlb_pending(batch);
>> +}
>> +
>
> This looks a bit scary since arch_flush_lazy_mmu_mode() is getting
> called from several of the places in later patches(). 
>
> Although I think arch_flush_lazy_mmu_mode() will only always be called
> in nested lazy mmu case right?
>
> Do you think we can add a VM_BUG_ON(radix_enabled()); in above to make
> sure the above never gets called in radix_enabled() case. 
>
> I am still going over the patch series, but while reviewing this I
> wanted to take your opinion.
>
> Ohh wait.. There is no way of knowing the return value from
> arch_enter_lazy_mmu_mode().. I think you might need a similar check to
> return from arch_flush_lazy_mmu_mode() too, if radix_enabled() is true.
>

Now that I have gone through this series, it seems plaussible that since
lazy mmu mode supports nesting, arch_flush_lazy_mmu_mode() can get
called while the lazy mmu is active due to nesting.. 

That means we should add the radix_enabled() check as I was talking in
above i.e. 

@@ -38,6 +38,9 @@ static inline void arch_flush_lazy_mmu_mode(void)
 {
        struct ppc64_tlb_batch *batch;

+       if (radix_enabled())
+               return;
+
        batch = this_cpu_ptr(&ppc64_tlb_batch);

        if (batch->index)

Correct? Although otherwise also I don't think it should be a problem
because batch->index is only valid during hash, but I still think we can
add above check so that we don't have to call this_cpu_ptr() to check
for batch->index whenever flush is being called.

-ritesh

