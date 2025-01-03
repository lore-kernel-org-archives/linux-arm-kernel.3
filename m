Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A84AE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 03:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExtURrdtg4wvz/5S73kPKLfYL+g+cN7JWlBZcDSiUw0=; b=YDjqs3VdutlSJWbeoElHziCpV/
	QWHT8jPFI/3UAtrDqozkVCaPYEZFIz4Y8O/lSoNk+gEeSuEPeXfE0nao9aEoJHVu0yh+u6rdgnaSx
	kQyuUIQAvpV0JNrnfgWi9oBiiqhL57VGPguahDP3AeUHZZCWlAhy4P10SeHR3w6QzaCdhDXHOyr+0
	wt8NEkmqw5ZpvzyDjbUA8vmDk7N8FMcRYUB+D4zH9WLZYBC6+5tbhZ8cJAM16rp1RXd7wjYzubvDl
	wQecFjDZuPPLVIbJ3vJcJK9ahY612yWtv6RDmrgh7P87JZ/Vouuy6nHmnXDuj1CPbsarJBQhNUG0a
	NGwsTN6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTYmR-0000000C33U-0E5V;
	Fri, 03 Jan 2025 03:55:23 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTYlH-0000000C2tn-2IpY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 03:54:13 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21644aca3a0so84483055ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 19:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735876451; x=1736481251; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ExtURrdtg4wvz/5S73kPKLfYL+g+cN7JWlBZcDSiUw0=;
        b=B1fqOdhK8IHuMqOIFCeOIkU7l0urKOAAMNoqYQCOqlti8pXiHNEzZdUa02M5M3JXZd
         /G4dvwJKTNmeM78N+W5XLVvCUTkyKzJUCaKNhf2NKzAofb8bvN61EOdN6YXdyDS8Qd4Z
         2Rk+bgQkgzM6rIaI/01npNJcGLKuK3B4MzqwOGbuU5u7SktcgEeDNxCTfuUfccomjA11
         yGGOB5t/zogG3unf55NheSQ8usD813F1SwvR4/xqGe16jowW1IQtfZtCUhTNGebEu3ME
         fLO2qX+nSu+TorzNAIQENiN3yDUbNF/LPA8sYRzfkEliKwMtThRy6nzl3DjNvu9684U7
         KmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735876451; x=1736481251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ExtURrdtg4wvz/5S73kPKLfYL+g+cN7JWlBZcDSiUw0=;
        b=j/ksoGkRQTl4DF+7/NtZgOVwn1qGp6v330HeQJP27adSqhjNlIpL+IutpQMdGgzcD5
         vvyHKaQOprvHkVwm84bcyKddw9Rv660BqL4g0CxlwcduJ1oZ3/TVUHG3Y8o1hILrt3bW
         xmsmRNNZG2Kj4OEZaCKZAt3MqU1azBnZwjYAIFqhSxqzTWCGi5nlo5FBOMYnhRZn5YGG
         MQiTozBEgF7oNfJMhrfrM3G02Lb5PIw5CajPi46bigQuHJAJnVUnzqT0keCdnC28R1jo
         R7+PXgjVKiBcrM+xoCKwpZ3lKpNLMngCQL2GMrV29VplHcUSh3l3IX0dF32XjqzsJtin
         MNBA==
X-Forwarded-Encrypted: i=1; AJvYcCXlKqruDtM9HxK2H7kVbtkK1u0VWlHmHaA3zrwIoiT+evOC1iZSTZGRnckXeHrYNaPlsZz79w2MI5cgquLp47Tn@lists.infradead.org
X-Gm-Message-State: AOJu0YwjJds/7/1gSVKp9U9Z1RPm3v28Ib9MIPeMOsXtjpi0dbg18oOT
	a+2/VnIHC6S/e0MG1/sGpxCJWmz4bI3mF5brNfnGIw8NKYjfcgi98LUBX85pOnI=
X-Gm-Gg: ASbGncuQFZZNUwEg3xp1UfND73vgzdcC0TqwcseVRpU2qZ2GLk6HOVj5WFIss2t2hsv
	G2je2mTvPzZKnsHfsRqc292rowUcCELDjY0XqSoRXMHjp1VY1yaZI58lCK2PacjZg/f8XSupqTB
	CNt/4sb8MMWzu4ynVUkaAmrRAcEcFStdG84OrfB7A0esLAcJMFylBNaSb4H8R7YdfRIXrQ5UZuI
	GH5Ht0MSxDnM2c1LgBpgVGybArgO1D6y0kppToNyt/TjGJ9Me/Fkk1/fzS+qp6tr/Crks2D25lW
	jdAsbw==
X-Google-Smtp-Source: AGHT+IGRLBberTsNPcVz5fDDiJ496OTTAGvxwwTdPWwuUiji7gMKzctc+wxIQ/Y0LkCE8MhlfHWUlw==
X-Received: by 2002:a05:6a21:6d86:b0:1e0:ae58:2945 with SMTP id adf61e73a8af0-1e5e081179bmr90059001637.31.1735876450877;
        Thu, 02 Jan 2025 19:54:10 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fba98sm25284573b3a.161.2025.01.02.19.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 19:54:10 -0800 (PST)
Message-ID: <77c202bf-e0a3-45e7-bf8d-eef7903e3c64@bytedance.com>
Date: Fri, 3 Jan 2025 11:53:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] mm: pgtable: add statistics for P4D level page
 table
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, palmer@dabbelt.com,
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
 <2fa644e37ab917292f5c342e40fa805aa91afbbd.1735549103.git.zhengqi.arch@bytedance.com>
 <237a3bf6-c24f-4feb-8d3d-bb3beb2fd18e@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <237a3bf6-c24f-4feb-8d3d-bb3beb2fd18e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_195411_592664_2EDD5F0B 
X-CRM114-Status: GOOD (  10.21  )
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



On 2025/1/3 00:53, Kevin Brodsky wrote:
> On 30/12/2024 10:07, Qi Zheng wrote:
>> diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
>> index 551d614d3369c..3466fbe2e508d 100644
>> --- a/arch/riscv/include/asm/pgalloc.h
>> +++ b/arch/riscv/include/asm/pgalloc.h
>> @@ -108,8 +108,12 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
>>   static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
>>   				  unsigned long addr)
>>   {
>> -	if (pgtable_l5_enabled)
>> +	if (pgtable_l5_enabled) {
>> +		struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
>> +
>> +		pagetable_p4d_dtor(ptdesc);
>>   		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
> 
> Nit: could use the new ptdesc variable here instead of calling
> virt_to_ptdesc().

Right, but we will remove pagetable_p4d_dtor() in patch #10, so this
may not matter.

Thanks!

> 
> - Kevin

