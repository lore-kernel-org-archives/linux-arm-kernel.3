Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F46E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 03:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/q466ctbH84kLf48L1cXJtHFTRzDl7be/n0cI3LGmOM=; b=gtq4pkO7kL2dOhqu3+ek7ssPk5
	2hTA42NhHB9D9vBJ0FqJA3tTdD4sXei3EtXqOU/jxHRe2IelgeyclmPga/JUqIgU2O48ssgVoR+yH
	RkIvrgRE3j6I87OWKD7m3T4KAx8CeOIGf9YQS5lMgw2aFYHwVNuGu9Ks5+jJRNmjAO+06cyrVx5Zq
	tGfNRuhj8aMG7PHMk0TF7GrnV+/yEENCZZyM2e8RmCQHVllD6mUS40GSojBnItmKxSs+viaD8b3zF
	BIdMEgGhGfi75AaWIMJTjZbv5CfbRsQRZFUE7aO/hYuRa5KmaUWcBIMHyjrnlZTOZhs/U34E35EcU
	fYzCielg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUeCn-00000000AH7-0KbY;
	Mon, 06 Jan 2025 03:55:05 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUeBb-00000000A8h-008o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 03:53:52 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2ee397a82f6so20360658a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 19:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736135630; x=1736740430; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/q466ctbH84kLf48L1cXJtHFTRzDl7be/n0cI3LGmOM=;
        b=isoXtO3CuYLqt2tyJbp+2B5dmXhmABhJ9wZmXt2QOme+TqUw/AraFkM8Kt+m+Iu866
         moWp8FhZ1aMm/ejkaK180kDGL5OW+KMOvYUbCejAbRc+ZXFfYxr18PHfX1m34qC2T+fM
         wY9It39AP4+BxYIMkX3jvLhF3dDahRttZqsGZj4jq9R/v3LRVeFykTqDSFvZ/VWF7COS
         5F0gOA3N3ua6eFjmwnzVh/wBD/efKXcczvrPhgimM4vLnfFnXOzB7ypZUuMgrMcdCnau
         F0y665LbLVlUMTNJvZeqBRu+0+6BWeCuBBqLKkQxxOGaTPNFUfV+QWC4l+jdjRiSmDZk
         amdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736135630; x=1736740430;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/q466ctbH84kLf48L1cXJtHFTRzDl7be/n0cI3LGmOM=;
        b=mIEzjdaJ6EFE9627UaIR9gODGClhdDM/UcIR09jQOD2bBsTyAnF/hBNvQP3MON5Aat
         ZOxev2zhTqvbJ7ZQW0Cr2AxSIarArSovvay54EU5YmiqrSPsl0HFiq133FVec8Zp56NZ
         UMWPwvW45ggV/9ewSMkzaiCmYDwtwgzjv4ECngeAk0qzSRKfUEv/4ol8b0+822nWS6eD
         K/tH4D6C41RdT7fvYhPyFanyX6P0xBt3YL3PoimnR4xjJqHtvkjddlXEh/6I9KczqBfF
         ToHniOKZEjB/pskG5Cz/+uACXtetpjIXsd5kLMDtN47MgwzpnTQ3P4FBRPWUmBp/n0w9
         41mA==
X-Forwarded-Encrypted: i=1; AJvYcCUuRq7U+cqKEZlkVdEkc6/QkMNBStFydZpPE1joCkgIRnJKpYHEHIy2GirT7HTRYdudGAuDQ+vdFmvRoy8Ljslc@lists.infradead.org
X-Gm-Message-State: AOJu0YxkHCYOLvrjGe7uj4J3Df//ym6ADSeghRAxexBL+XBGFhcHhHoU
	Vttm/1qsI+S3B9r7TPK0QyRf181dW+0FYu6vntK94LD2++JiED96Rx+JcgVI0Wo=
X-Gm-Gg: ASbGncuOblIPMcSa2K/A9Bq/8VT7Ru069Ow3NQzEOE0+Yrnx2Ext3LNKswDo/avED+1
	EYLMay7GpQcLWx+jMNRlWEzhNt0fd8qLO1DbfM/YC7kSbwnkgL8bzIIn0X0CGqSsUqpMYtHHbX9
	0Kba6/F1etyHK2S419DYYSblHO9bEzAOGxjiTuWMPcgABANOZcUjC1Nxd1I88hj3LdtyCfxgOvx
	KpOTi0D8vck17iw3q+P4R9XsJg3QcoFbk/2ICK+4Tjjok1aACIzgaw8SoUYpO8r3Cj9wqA5PmEq
	6tmABQ==
X-Google-Smtp-Source: AGHT+IE2eKUVGb+J7TSGZASTVnkByt6mt8YLIy++PUNY+VFfsnF7zlybMe8WL3Umwm8kwi4ry/BkkA==
X-Received: by 2002:a17:90b:54c3:b0:2ee:a127:ba8b with SMTP id 98e67ed59e1d1-2f452ee83d9mr71788615a91.36.1736135630440;
        Sun, 05 Jan 2025 19:53:50 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02f72sm283551435ad.249.2025.01.05.19.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 19:53:49 -0800 (PST)
Message-ID: <a84a7b0f-dad5-4100-9d0c-3b515e7fb71f@bytedance.com>
Date: Mon, 6 Jan 2025 11:53:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/17] mm: pgtable: remove tlb_remove_page_ptdesc()
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>, Mike Rapoport <rppt@kernel.org>
Cc: agordeev@linux.ibm.com, kevin.brodsky@arm.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, akpm@linux-foundation.org, rientjes@google.com,
 vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
 <b37435768345e0fcf7ea358f69b4a71767f0f530.1734945104.git.zhengqi.arch@bytedance.com>
 <Z2_EPmOTUHhcBegW@kernel.org>
 <20250103111457.GC22934@noisy.programming.kicks-ass.net>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250103111457.GC22934@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_195351_048188_67EE2035 
X-CRM114-Status: GOOD (  19.26  )
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



On 2025/1/3 19:14, Peter Zijlstra wrote:
> On Sat, Dec 28, 2024 at 11:26:22AM +0200, Mike Rapoport wrote:
>> On Mon, Dec 23, 2024 at 05:41:01PM +0800, Qi Zheng wrote:
>>> Here we are explicitly dealing with struct page, and the following logic
>>> semms strange:
>>>
>>> tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));
>>>
>>> tlb_remove_page_ptdesc
>>> --> tlb_remove_page(tlb, ptdesc_page(pt));
>>>
>>> So remove tlb_remove_page_ptdesc() and make callers call tlb_remove_page()
>>> directly.
>>
>> Please don't. The ptdesc wrappers are there as a part of reducing the size
>> of struct page project [1].
>>
>> For now struct ptdesc overlaps struct page, but the goal is to have them
>> separate and always operate on struct ptdesc when working with page tables.
> 
> I don't see how the current idiotic code helps with that at all.
> 
> Fundamentally tlb_remove_page() is about removing *pages* as from a PTE,
> there should not be a page-table anywhere near here *ever*.
> 
> Yes, some architectures use tlb_remove_page() for page-tables too, but
> that is more or less an implementation detail that can be fixed.
> 
> So no, please keep these patches and kill this utterly idiotic code.
> 
> The only thing that should eventually care about page-tables is
> tlb_remove_table(), and that takes a 'void *' and is expected to match
> whatever __tlb_remove_table() does.
> 
> Flipping those to pgdesc, once its actually a thing, should be fairly
> straight forward.

Well, since I've already sent v4, and that patch series is mainly for
bug fix, I'll send a separate patch series to do this.

Thanks!

