Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE05CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 19:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPouUhrqRxgjcMBstonzlhFIxQsnreNI+UXdXwtR76k=; b=ozXKHlfo3+20eJTahr2gwBEnq0
	dt4LeF/i+3gawsHUuM/GD6YRRtUqUayo4hcLzmKxxYGMFOTaennwc4Ylaou3HdwtNrK0xhb/B7LEH
	Hnl8F1Wb/l8J0Ag60JoTdpMRnNSmFuDfmFUAd+LJ3k5lRNsb0kIRDGQ1ip0fD+EJHK7u2oSnA7kkb
	sJOohDF0P9nV34Sl2MAeIDFV9SzmZDqGvFt3Eu4bgmLksihDWPha+/TsNRtLGz7LnyF4f1cYDYKwg
	dYsYxtOIrKMDTI4U8WcNTdXeBTWouCzLE28SpCbVxZcBAouaBtwtiZA3U4dMu6q1EvvBDCvmQXSRw
	7s0/IrFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC18G-00000007O2C-0J6y;
	Thu, 23 Oct 2025 19:37:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC18E-00000007O1V-3Eq7
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 19:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mPouUhrqRxgjcMBstonzlhFIxQsnreNI+UXdXwtR76k=; b=mDLRhhIhquKrorvuU/0e3BejOg
	7mpKk/ArnGRyAv3oDiQB9zhVWDnqIOnLivelVjdxXX+PqnnUix97OXcSl5Q6ZBw4X2srWoPUDSe8G
	RbDEs84g9vs2BzLXa6DMV0dc152tyr+5iq0haI/DiIxYDPrLqL04HHq3lxSRTiUb2FQ2zgaIcG7lA
	3NSzJMZKpwh53R+Bz/mf5i/hTtDcAi+MC+ygMdfdpT82Yt6iYMDQGLryozVuaGZ2ScrpBc73mrYmv
	KnirJoex1pPmYxNyqAnJT17dQooGTEYAFQ6RUAr4s+VvtOhomccFZP0oVMyOTbLLMmM81bUYbheLn
	N/ngeSAg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0GX-00000001fVD-0upO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 18:42:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761248269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mPouUhrqRxgjcMBstonzlhFIxQsnreNI+UXdXwtR76k=;
	b=X9x77gtUeFB9P2Y1NDhdz+y4dG0Qtj6fNerHDAr21cajZCTrfEtJ7y3Rbzlh5QtLFb0d44
	BAZ8+4Px5hGKLS9Duk9Bqpw5Jj9AckHDz8isM6zaWJDsbyYsfIzd0BEqYeZ3Zoqz5+REjI
	JFi/n1wiYxN/11RkjJo3A8xR2F8ncTM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761248269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mPouUhrqRxgjcMBstonzlhFIxQsnreNI+UXdXwtR76k=;
	b=X9x77gtUeFB9P2Y1NDhdz+y4dG0Qtj6fNerHDAr21cajZCTrfEtJ7y3Rbzlh5QtLFb0d44
	BAZ8+4Px5hGKLS9Duk9Bqpw5Jj9AckHDz8isM6zaWJDsbyYsfIzd0BEqYeZ3Zoqz5+REjI
	JFi/n1wiYxN/11RkjJo3A8xR2F8ncTM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-zmLN0YcKNjaVYb_6tdxI1g-1; Thu, 23 Oct 2025 15:37:46 -0400
X-MC-Unique: zmLN0YcKNjaVYb_6tdxI1g-1
X-Mimecast-MFC-AGG-ID: zmLN0YcKNjaVYb_6tdxI1g_1761248265
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-46eee58d405so8060485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 12:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761248265; x=1761853065;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mPouUhrqRxgjcMBstonzlhFIxQsnreNI+UXdXwtR76k=;
        b=az9OR9kAGt7ctnQuz5YlzCz6xGeEMinSeduCPhFGQTLI6KecjfLd1116k1IoGM6FEq
         8TroXtQ+bJdkMIJm5U5NAPPEH4+Om2BgB7MmkkmuqKZ1duka4Q1IUHUDVRZTB/HovZrB
         XdN9ok9Is5/WYhN8A6LdT8axmxsFK9xL6cQphPbsUzGHqNF+qmTwySev/9E5YCum7pMK
         WRFxbu9M9i5Hduhdo6v7u3/hoLruduvLJRVURNkVBv9PFu/DonymLPkMOPFUeHoEn49f
         noIQ9/44RHBtVzb1lrkoiKLNn2hTnrgduN8rOixPAU6fRL1uT/9/TZyMuWyS+MMmXFLE
         uN6g==
X-Forwarded-Encrypted: i=1; AJvYcCUDbo7xH8UYbpJhy+bcYGbo+f9UX8l9nxrHe/cwPNowJPSpIh4AAlMNNuFMG7S74qBucFaGqbH8w8ZfhJ7HE/7H@lists.infradead.org
X-Gm-Message-State: AOJu0YzobeENuKgqD50VFLF2+3LeE1Gv8DU/K86ByH9VqdQmrh7cBI30
	0RaUd9RInKpzhLaMshZ8jGjycz5c70gifSV671gNPsJLd9GWZdcxoCdOHmpZbC3fm71PGsoh9YA
	ekf5fvrqRYfpZo4iD/eTm+90xxdbEMpjk86Jmvh2yAkq4uakyXWLMGYGONbXu08PF6f/1Y4Amo4
	dW
X-Gm-Gg: ASbGncsK5zDnBXRmkCPYhdjiqNjauY6z3HPWf5su5WHYr1CFyPsPCz5AEIRa/u7+tTn
	oJ1KM9w+66z+3TyUN734BC/IBdkWBTcBUfg5gBtF9rWt/Aj1tCKjYVV9cL0KM9n1ZAfOUdk1Q65
	17IhrcCb9umcuSrfksY8Y5S4nZ5nODBGvLReRc0V1SwMDGBxtwQjUNTFAJUhal9RQI4Id2lu9Gh
	DpsraGF6nrVBLDy8/H54BtuU95sjMNPRNsQjMedGZ+n6UBCKEV6jXNagRxHJE75nsOLUj4NPHf9
	t+Wrs40pgERUs7GWd8gs8bCIFordv15PlFx4MO9BL9/NTFrwoZGp8nZaEVcTPRW+aYWrkYBtpKt
	o6mjp6HQXBPLOV82lSDP2yc7sHFX3/ql/gP7V20Y4fZAiSNf39ceRk8Hl+mFmuHIPdaFr7ikW1m
	Pt5jMXJ/Mo09XSk/bKWGy5oAtE+3Q=
X-Received: by 2002:a05:600c:3149:b0:46e:4b8b:75f2 with SMTP id 5b1f17b1804b1-471178a7ea5mr175792145e9.16.1761248265267;
        Thu, 23 Oct 2025 12:37:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZq8ETk/dxv6lw5okKbvprrCeAKa5W7ysoK9CYeQHAr2H0Pl+EqcgQ1cUF8EEIwcu7bpKOCw==
X-Received: by 2002:a05:600c:3149:b0:46e:4b8b:75f2 with SMTP id 5b1f17b1804b1-471178a7ea5mr175791855e9.16.1761248264842;
        Thu, 23 Oct 2025 12:37:44 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4369b5esm130845595e9.15.2025.10.23.12.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 12:37:44 -0700 (PDT)
Message-ID: <b0373792-a7fa-41c4-9bf8-979c10be49a0@redhat.com>
Date: Thu, 23 Oct 2025 21:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/13] sparc/mm: implement arch_flush_lazy_mmu_mode()
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-5-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251015082727.2395128-5-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e3Yschy0vzOnWMfRfSCd8ipxnSsCA_L68GtvBzTPqak_1761248265
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_194225_472896_102644BF 
X-CRM114-Status: GOOD (  19.56  )
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

On 15.10.25 10:27, Kevin Brodsky wrote:
> Upcoming changes to the lazy_mmu API will cause
> arch_flush_lazy_mmu_mode() to be called when leaving a nested
> lazy_mmu section.
> 
> Move the relevant logic from arch_leave_lazy_mmu_mode() to
> arch_flush_lazy_mmu_mode() and have the former call the latter.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>   arch/sparc/include/asm/tlbflush_64.h | 2 +-
>   arch/sparc/mm/tlb.c                  | 9 ++++++++-
>   2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
> index 8b8cdaa69272..925bb5d7a4e1 100644
> --- a/arch/sparc/include/asm/tlbflush_64.h
> +++ b/arch/sparc/include/asm/tlbflush_64.h
> @@ -43,8 +43,8 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end);
>   
>   void flush_tlb_pending(void);
>   void arch_enter_lazy_mmu_mode(void);
> +void arch_flush_lazy_mmu_mode(void);
>   void arch_leave_lazy_mmu_mode(void);
> -#define arch_flush_lazy_mmu_mode()      do {} while (0)
>   
>   /* Local cpu only.  */
>   void __flush_tlb_all(void);
> diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
> index a35ddcca5e76..7b5dfcdb1243 100644
> --- a/arch/sparc/mm/tlb.c
> +++ b/arch/sparc/mm/tlb.c
> @@ -59,12 +59,19 @@ void arch_enter_lazy_mmu_mode(void)
>   	tb->active = 1;
>   }
>   
> -void arch_leave_lazy_mmu_mode(void)
> +void arch_flush_lazy_mmu_mode(void)
>   {
>   	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
>   
>   	if (tb->tlb_nr)
>   		flush_tlb_pending();
> +}
> +
> +void arch_leave_lazy_mmu_mode(void)
> +{
> +	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
> +

Just like for ppc now a double this_cpu_ptr(). I'd similarly just 
replicate the two statements.

> +	arch_flush_lazy_mmu_mode();
>   	tb->active = 0;
>   	preempt_enable();
>   }


-- 
Cheers

David / dhildenb


