Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517C8E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NViglkR77PlL2AqsFJ9M2rA8vsy0VBtzEibmSHACi+I=; b=nLhQiCHaOWEpFNbwuGM6B/z3Ec
	8wcExY8AXzaEYj0k2vyh2SlcpSu52o9S6Nf8wmH2WbkuPWO59dHVUC+CI85dp/Hjm2AiSIYGVxjK1
	+U9hv+9Z/WFvUiN9FMYMQNwzbAvWhdZKpbYHFEv2HdyHEIJkQh1q7+v6+lBVcl3Wa8n52E3dwVwuj
	sZ3DygbhQPCCcJIuJwXAWPrRADJtgpHwLh6HcmvAE47gaKPTheQMa6eAVvzGyqY1aJ+aBWRDTTRw7
	UA6gg62qIkyal6Y7/oReaQcInbBtaqhOZ5n1ee7q65ySmtzLjPZ+pp8renpY2T7nnELLPiTm/1cTR
	nq6ScAPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoWY-00000001gNz-29pD;
	Mon, 06 Jan 2025 14:56:10 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoLL-00000001cYW-47V2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 14:44:38 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-216401de828so196142715ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 06:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736174674; x=1736779474; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NViglkR77PlL2AqsFJ9M2rA8vsy0VBtzEibmSHACi+I=;
        b=Rlh/9xjXK2Dii6eJOv0At1o6MrcJZXqiaC9rM2aMSgJGN7m4N8/5IH4Ud1EfeH4E6R
         4LYJ75YJorOPgje+DQmHp9fvPPuMtHwTAK4wEO/jlGQ/RN8XXxS+NAB/juRwE0Dcwmgv
         7aztfE3DfKksNPIsYOB7cHQZGOuGjjPKhUVQ/yX5aqEP4x8iTE91YcQFTDy52jKBMnZc
         uAL0b/PK+GjB5KFeg65TfGBlT79bWSJtwIVOdETTmbEhqscVcyNGg6xIyWC2tGdJ6Nxb
         1/02sOVxL47qeg9T4H81kHDesMsGOKBVoc5SnOOQSndv/O3RHpR/6MDdGIhv2gwqWx6p
         k4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736174674; x=1736779474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NViglkR77PlL2AqsFJ9M2rA8vsy0VBtzEibmSHACi+I=;
        b=EKUSFPCfrUIC3cH50QXKb2GGBBgSFKv+PWMhRMqB6XhzymO+z1Dw26vFxfIrrtKz7J
         fP2RsEiqjuLP7CbVDvL4G6k+N8UQkqaAEar5I4B8Az6H9b3R8k2qMzzfVTfPiSrkBaC0
         FzBFQlD8AziZTNAwRnyOsebdQKb1XZlHHnfdTQqHcJVdgfm/fr2PPp73LVGYfWTsKlKh
         2Re2DA4xTUyBqUJLO17HT/q29cr9pttgo1MnL1EIiy4pIRm2pvyxeQ50awNfCCbD+dl4
         /ZsGmD6Awa66+e6NHY/uNpyZbn0H565XxCiRVpmPt0vBFYRyF+5iJZWijE7HP4VFFi/M
         Dixw==
X-Forwarded-Encrypted: i=1; AJvYcCVL/B8twEMxy5TqXhTmL9ImRXPW+B02kULxzzMvVQmiUPuEgJ38wFMkWbnoFNc2dGJIWEyOMBnQeRSiAtikJQ+C@lists.infradead.org
X-Gm-Message-State: AOJu0YyyIbu32523CcgW394j0pLRnztJn/tZ/i48MKtbcMdG96UxjiY5
	Y8gpzQ7cJV5l9CgyPfcvNhnnO0VL+2YOanQSbjFDzkCn/R9h4vjy3BqrnPGoBpc=
X-Gm-Gg: ASbGncvbU29WjdG7LKrw+lAjvci0rjrHrRzPdmSUm10YkH1zzp87nWNQUsF0eLhtP0u
	LhxGsPiMb1z1QYCd8UhtCVNDbTeEISlgg2ewGyN6dgimTcaj2w1OD8FyV8dd38eXbG5ye5gik5z
	ofAa1GugFAnZMoDSBX9a2fPbes9naw/Dua/+0L91a4Ol5XosRQ5XaLexOG4mnZ4Px2/vHFzotu4
	+vfNAF28A0TjnwrVHZ9kc+V6wOKaE9eJ5AToqI6GdbbKpvJ5xJh9F85mwl/Yk2QEpftvkBNlvnJ
	msz0mvgwdJI99ymHR5a00XFBeBsh5CFUQgEng1FrqtD/M9ryiWYa
X-Google-Smtp-Source: AGHT+IHfRKlSBRBXUw7mHIW0SQFNESOEWbBrtQcBXd7/ffhetsdlBCZHRjeTrMJdIBfoDiMG7l+wRg==
X-Received: by 2002:a05:6a00:ac3:b0:726:f7c9:7b1e with SMTP id d2e1a72fcca58-72abddcadd6mr82367083b3a.13.1736174674262;
        Mon, 06 Jan 2025 06:44:34 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:d64:296c:a8f3:f81e:f88b? ([2409:8a28:f44:d64:296c:a8f3:f81e:f88b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad815804sm31532588b3a.32.2025.01.06.06.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 06:44:33 -0800 (PST)
Message-ID: <dbcbf4c3-f86a-4414-be52-8ac02dae5b6b@bytedance.com>
Date: Mon, 6 Jan 2025 22:44:21 +0800
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
 <2d16f0fe-9c7f-4229-b7b5-ffa3ab1b1143@bytedance.com>
 <Z3vQHplZqtHf6Td8@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <57ea8193-2fd9-41a9-85b4-7af924f900f4@bytedance.com>
 <Z3vqHXdwIMBVQ2GT@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z3vqHXdwIMBVQ2GT@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_064437_008674_2A5D9BFB 
X-CRM114-Status: GOOD (  11.49  )
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



On 2025/1/6 22:35, Alexander Gordeev wrote:
> On Mon, Jan 06, 2025 at 09:34:55PM +0800, Qi Zheng wrote:
>> OK, will change the subject and description to:
>>
>> s390: pgtable: also move pagetable_dtor() of PxD to pagetable_dtor_free()
>>
>> To unify the PxD and PTE TLB free path, also move the pagetable_dtor() of
>> PMD|PUD|P4D to pagetable_dtor_free().
>>
>> But pagetable_dtor_free() is newly introduced in this patch, should it
>> be changed to 'move ... to pagetable_pte_dtor_free()'? But this seems
>> strange. :(
> 
> s390: pgtable: consolidate PxD and PTE TLB free paths
> 
> Call pagetable_dtor() for PMD|PUD|P4D tables just before ptdesc is
> freed - same as it is done for PTE tables. That allows consolidating
> TLB free paths for all table types.
> 
> Makes sense?

Ah, make sense. Many thanks to you!

Will do it in v5.

> 
>> Thanks!
> 
> Thank you!

