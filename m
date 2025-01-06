Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4489FE77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 11:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtS7kKDFbbWBE6dlgb91yolih02/BD7li/VWMu2pf+Q=; b=NQgkBcY8CaWFPXR66RryBU45Ky
	oLcqs+nsAfrUnt8TFudqhAHh22jrJ2/8nacK9tfKsq+pvo5HVGmqiiEahh9Eve8HbhDg7rfFJgs2N
	27CygJo3Yu+I97ikBDtmDgJLd043Hgu9DCaIi06UHp/Byim29+r1/erjEEJwqu+Njn3RYMywem1Dy
	tXgVcAhYONnu1eQhLCRFA1/RrQVIvOVUcit3h01zvC/rwxm8xZMae0RFVT+9QDP2HlAfpQsS9yHM0
	dPSfOS2kuttl2dxjlHyVqoVK+xr7QTzMZYTpayOclRrQau2K3BkGj/GU32FJZBDvb3qh54Rdpst05
	VsFygClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUkth-00000000yCY-14lx;
	Mon, 06 Jan 2025 11:03:49 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUksU-00000000xtY-2L0E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 11:02:36 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2161eb95317so209058795ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 03:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736161353; x=1736766153; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PtS7kKDFbbWBE6dlgb91yolih02/BD7li/VWMu2pf+Q=;
        b=Eus7dqncoI10RzDL5zgOdMzEsHXl/xJ9w81cT25gIev9l4X6mNV0Q8gVlBn4b32n2S
         E65Vbbw0okGDSJ9Xy9u+dY8WNt/wV5e1NlYe8ELRbW+Jg+J/C3+VIXdJiwgdTqGu7hPj
         Sv7gDXqlmQUmuWWs5xpQJ4mkcQmgRsMjwdlPkxGwWslGTm49i1paAQy1agjMwzqQ9Wwk
         0a29UL+N+yHTkLUSJTisJd2tnRmZ5JS8NsFtxxiMifCzGWRLNPUARVe5MtFBrNj4gIvb
         M/6EMqTNfY0toCzrDdKkSTscuUVsvtJz6NdWqFUD/HKLmp6ngNCVzTLH7XiWH9SHwnVJ
         IDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736161353; x=1736766153;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PtS7kKDFbbWBE6dlgb91yolih02/BD7li/VWMu2pf+Q=;
        b=p6LJaQRBVArkGYZClA65ELBxJ3teXpxnJdFI1yAxTn6fVFEQFYQcBMdqZ9kA3x7Eym
         TCoasoFeO5BLzzan3FLRimMzhOp/DyRz3uqagxJvl8+cuoPd5ynLiWEqLL5ioUY27Kxg
         Nx5GlSbNlGH62VrC+ae2QfJcra0kG7LqnuMzsEOXAUXd4L9aYiosSUXkA2wBNO+bsNcC
         jRSKFv42eNbxWKD3NRKkqRTGz323Zp7XMD/ktZYHVU0Ck1Y7fPtuUqFUc71VQvSgmBb3
         3CVbBUfreB5tOk1WlpmuHhQuV4SvTTWKNKxSot5CLyEtdCbF1Y3nRYbjqQUMHKnBeVwX
         hgUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHAJTY+g94hBOdm9h6RmgEELsvv/ydoMVlCPEHcVqJU2br11adxqpljuVe1zs2pWbXv/Vjelu8Ui6TpkoQ35K/@lists.infradead.org
X-Gm-Message-State: AOJu0YzTm97FWHUMmUiOwQRiTzIBlb2A1zXJ+oekpt+lNEWpL8Pjlha3
	62J+G2apFUrgHH2I00QW23QtbIi5v46r5Db+V/UAFKDyuMuaBDBKOGubDyGbGjU=
X-Gm-Gg: ASbGncs7EKXUv6wTHd+4uQE5v+UQhuuFB3tIUvrz3MlO1P7dT/ZKn9l23S30da3mArl
	0JaAHA1iqHp4Jh9NDoAeA+RHEkXBGcu9xitlWRr615zsZNd6heafbjraeeQtth6pumEWydB0lP7
	oS4V5bK+3JjS9ArHHIcatyx3JobNffvUpDdhiZa8WK1UmakD4wThaeh9bZRq7LriSLoKHbwj1Ts
	B3WaW3LtUIY6LM+Y+Ia0J7M6t8CAoyLBW7YoFWgi3yCpczDBCFqTd9eEp7aogKqR1Mzo74/8ms+
	jFzSnw==
X-Google-Smtp-Source: AGHT+IFCeOw2arXEHpOUWAGun1CKXf9/XTpPQ1dFbIMLlKInW35U2LjXZ6DtTEzjdru/7w1/tbEHpw==
X-Received: by 2002:a05:6a00:4644:b0:725:b347:c3cc with SMTP id d2e1a72fcca58-72abdeb9c33mr83929136b3a.23.1736161353534;
        Mon, 06 Jan 2025 03:02:33 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad816464sm31123318b3a.40.2025.01.06.03.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 03:02:33 -0800 (PST)
Message-ID: <2d16f0fe-9c7f-4229-b7b5-ffa3ab1b1143@bytedance.com>
Date: Mon, 6 Jan 2025 19:02:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/15] s390: pgtable: also move pagetable_dtor() of PxD
 to __tlb_remove_table()
Content-Language: en-US
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <ad21b9392096336cf15aee46f68f9989a9cf877e.1735549103.git.zhengqi.arch@bytedance.com>
 <Z3uyJ2BjslzsjkZI@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z3uyJ2BjslzsjkZI@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_030234_603307_B887E38E 
X-CRM114-Status: GOOD (  14.43  )
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



On 2025/1/6 18:36, Alexander Gordeev wrote:
> On Mon, Dec 30, 2024 at 05:07:47PM +0800, Qi Zheng wrote:
>> To unify the PxD and PTE TLB free path, also move the pagetable_dtor() of
>> PMD|PUD|P4D to __tlb_remove_table().
> 
> The above and Subject are still incorrect: pagetable_dtor() is
> called from pagetable_dtor_free(), not from __tlb_remove_table().

Hmm, __tlb_remove_table() calls pagetable_dtor_free(), so moving to
pagetable_dtor_free() means moving to __tlb_remove_table(). Right?
And the main purpose of this patch is also to move pagetable_dtor()
to __tlb_remove_table(). So I think this description makes sense?

> 
> ...
>> diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
>> index 569de24d33761..c73b89811a264 100644
>> --- a/arch/s390/mm/pgalloc.c
>> +++ b/arch/s390/mm/pgalloc.c
>> @@ -180,7 +180,7 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
>>   	return table;
>>   }
>>   
>> -static void pagetable_pte_dtor_free(struct ptdesc *ptdesc)
>> +static void pagetable_dtor_free(struct ptdesc *ptdesc)
>>   {
>>   	pagetable_dtor(ptdesc);
>>   	pagetable_free(ptdesc);
>> @@ -190,20 +190,14 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
>>   {
>>   	struct ptdesc *ptdesc = virt_to_ptdesc(table);
>>   
>> -	pagetable_pte_dtor_free(ptdesc);
>> +	pagetable_dtor_free(ptdesc);
>>   }
>>   
>>   void __tlb_remove_table(void *table)
>>   {
>>   	struct ptdesc *ptdesc = virt_to_ptdesc(table);
>> -	struct page *page = ptdesc_page(ptdesc);
>>   
>> -	if (compound_order(page) == CRST_ALLOC_ORDER) {
>> -		/* pmd, pud, or p4d */
>> -		pagetable_free(ptdesc);
>> -		return;
>> -	}
>> -	pagetable_pte_dtor_free(ptdesc);
>> +	pagetable_dtor_free(ptdesc);
>>   }

