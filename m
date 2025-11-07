Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E049CCFA1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 10:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTaFnrMfgwsK/Y0rWELE74IDf4CX/iWox9UwYfRSyyM=; b=IOjKhnO/mlawKSWREq34RRPYwu
	FTuJXuaeM+v8XfNiynH4eBBu2ZbKm8PGKqpCyvyTNg8qODgyoWBCBl2kJMQJzmmvXyiEmKr4EVp+D
	+ixB7lKLOIdVg/dERwRMmis+24/8uIM5lIdxfcnqoJPnwnWIn3gnKQavJfCgjXPQA3rhz8lQ7cyq1
	WinzipID/q0X6zhBlRmcZQ0RqcT4Zk2jtBQqa6ZS5MI/myYkzE9rPjt4tl51o4m0gtHCrDwWZ8Y5I
	os4Wq6W8K8ROEgzGpY0YNk7HzYpJkU9Rlsn+h0hjQu16yCSA01uknZY6UnJ6jJZdGEMdar8kuYOFQ
	By6ZpLgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJkq-0000000H618-222H;
	Fri, 07 Nov 2025 10:31:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJkk-0000000H5yQ-1P7A
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Nov 2025 10:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=OTaFnrMfgwsK/Y0rWELE74IDf4CX/iWox9UwYfRSyyM=; b=HQ0ZLh0UK6g1k53QEt0HgsX25s
	wSIeQACU6W0WXXBmR9Lbi7U0vRV/U3OhGxO6s10gt+iBroB/JGRCB4Nr8Z/fxolm0DF4kgOlQuLj3
	QujPdrfaEaFn485W02lAsb8j94R8vIm/qwTYWQ+iGFfWOvS5rUq+rAgpQi2q/+KtO0rQ8XX2zg6zB
	yPCqgojbxjF4pUfkA1fzySNUlDUOZ1ZH+LityERz2qR7tBBQJWjjMyV4oBqKKk5gpH5q2FZirnx6k
	DHOhscU5I1a7pbeAn51wWHzaAVWtOfDcj5w1Scit/KTrEKW6B8ODGLC3B6qSK57UBdf03vsQABPEE
	h9SfOXaw==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIt0-00000006BZd-1Cqo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:36:04 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-429c48e05aeso330941f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 02:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762511429; x=1763116229; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OTaFnrMfgwsK/Y0rWELE74IDf4CX/iWox9UwYfRSyyM=;
        b=m9uqmmK/yvJHvQc24fsrh+RvWG46XaNBWUFhD1ZJvsWzgoAVwuNF/lzbMh/8HLfCnl
         6nOKMaRQcCgAYLvYsi7fQEDiAzCO/NRST787eyq+SUFn8ZLWgt4YVEEQCQKLSGtn2ukO
         17Ja/eBkLRxjLEcY2H8leXrzlJr+gu1pgfIFG3zCX6enY2cy2EYWA09ToGwt9yMOCa3M
         urj1b9M1KHway8fitlQU3OvYHxfk+ap8WKoaY4/8JK/PAChP+EbTYemFzedsgsaFIvWY
         wk8ykK5wKHo+rZkdUDuaCqvoq9Ti3LEzbN2C46taAoSdTY5AkTUbdY/lOZaJf/RymYeI
         U9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762511429; x=1763116229;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OTaFnrMfgwsK/Y0rWELE74IDf4CX/iWox9UwYfRSyyM=;
        b=ddCqJG+3ZAEMfpDlNIJHwdZx7FJMDXG1Fxg9u75CVmLCm/GzBXIF0qt2eX9VM87rAU
         YgvDCrFhshDCWVONEVyK0MXh1q+ZnhQEBs6BjUd9CdRrrBo5vMk4zBpVRM8fKKemcDoG
         3r/iuv7w4n0NxBmOptOdZIEb9YEZYWFUEYk2hAK3AilzrwbM7KhEVSYvhSs7TxRwXHJf
         1BB3Jv7dFygL3waqy21vWlKCokdCWzGdpc5szjjiWszBC/ixAFpdFFxrwS+i++hHFp4/
         5mzTp4rZmkQ3QCSxTE9kq4uVX+6cHDUYpdx6vTLM22mHdsGSzdLXcfSDXRaMDFn0Sm7z
         C1RQ==
X-Gm-Message-State: AOJu0YyE8mqak8mhTsD411zFSDSwYZcxfgwYLfR9IX0xqsvZHlAnp3Iv
	kplHnmq13NNMmu8bwj6FutXxZ/J17a24AoF5znQxTXyB9CMiWEIEG4NVYhc4kg==
X-Gm-Gg: ASbGncsja16c87HDz0CX+CvZTahBNK8qqhGT8R+AC9X1lDjAhNjYuE/RptSPyyhw61K
	uOpo2wTv5pJeBARLAGpEemtwHxxUyJRTwWMUaJiBxDWX5KpPAn7ULmWieubtldmRz4ZXMeFbJYu
	F/mCUXdkl1ZTAN8fCWJJQyAdrkiiBDFQBy6ZZNTNWFUYpkVaQv8IUcFdF+1C1QWnpeP63Ke90Mi
	GulXD4nZX2Bo+hHpsSqGL688A9k0LFpzfb2WMtsncANVnN3Sj/aLwYBXY16RTBYIFNRR/M+jm0N
	2hsYXiVW6S+HaNp7x+xxgTvn3OHPSI78iNR0udB2SK6tVJ9XokMRZrSZbYjj/QW8G5xecqwxk25
	FyvpU09CNZ2f/iiz9rc69TZ63iVdoHJYuQ+sc6NyuYcmaNJALDNxO/XSkkBYoVzNQAOOVJ9zsVD
	97qWE5E+bdRG1OPyfn8Sg5k/yE6MQo90fZZ+vxYEWlJuMPi2kh/xE5ojH/TcXz1uJdr7oleQ/QO
	Vb1B66uEve9CQJ8HUtKY4cypLjMijqXrdeyh369ZQ==
X-Google-Smtp-Source: AGHT+IH9e3WHuUqghIJpAPhDDy64w9bMHrDK5rygv/+w/a+F3j9keJGpNvreBtnKXT2yCxrruP9uCQ==
X-Received: by 2002:a05:6000:22ca:b0:429:ba83:dea7 with SMTP id ffacd0b85a97d-42b26fc3b3bmr1005075f8f.25.1762511429477;
        Fri, 07 Nov 2025 02:30:29 -0800 (PST)
Received: from ?IPV6:2003:d8:2f30:b00:cea9:dee:d607:41d? (p200300d82f300b00cea90deed607041d.dip0.t-ipconnect.de. [2003:d8:2f30:b00:cea9:dee:d607:41d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63b7d7sm4706368f8f.11.2025.11.07.02.30.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:30:28 -0800 (PST)
Message-ID: <5a56fddd-62a5-47b7-b048-8aaa8f283903@gmail.com>
Date: Fri, 7 Nov 2025 11:30:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
To: linux-arm-kernel@lists.infradead.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-8-kevin.brodsky@arm.com>
 <87ms5050g0.ritesh.list@gmail.com>
 <50d1b63a-88d7-4484-82c0-3bde96e3207d-agordeev@linux.ibm.com>
 <48a4ecb5-3412-4d3f-9e43-535f8bee505f@arm.com>
 <d5435e75-036b-44a5-a989-722e13f94b3e-agordeev@linux.ibm.com>
From: "David Hildenbrand (Red Hat)" <davidhildenbrandkernel@gmail.com>
Content-Language: en-US
In-Reply-To: <d5435e75-036b-44a5-a989-722e13f94b3e-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_093602_831242_CC7FF655 
X-CRM114-Status: UNSURE (   8.06  )
X-CRM114-Notice: Please train this message.
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

> So without in_lazy_mmu_mode() check above the arch-specific set_pte()
> implementation enters a wrong branch, which ends up in:
> 
> [  394.503134] Call Trace:
> [  394.503137]  [<00007fffe01333f4>] dump_stack_lvl+0xbc/0xf0
> [  394.503143]  [<00007fffe010298c>] vpanic+0x1cc/0x418
> [  394.503149]  [<00007fffe0102c7a>] panic+0xa2/0xa8
> [  394.503154]  [<00007fffe01e7a8a>] check_panic_on_warn+0x8a/0xb0
> [  394.503160]  [<00007fffe082d122>] end_report+0x72/0x110
> [  394.503166]  [<00007fffe082d3e6>] kasan_report+0xc6/0x100
> [  394.503171]  [<00007fffe01b9556>] ipte_batch_ptep_get+0x146/0x150
> [  394.503176]  [<00007fffe0830096>] kasan_populate_vmalloc_pte+0xe6/0x1e0
> [  394.503183]  [<00007fffe0718050>] apply_to_pte_range+0x1a0/0x570
> [  394.503189]  [<00007fffe07260fa>] __apply_to_page_range+0x3ca/0x8f0
> [  394.503195]  [<00007fffe0726648>] apply_to_page_range+0x28/0x40
> [  394.503201]  [<00007fffe082fe34>] __kasan_populate_vmalloc+0x324/0x340
> [  394.503207]  [<00007fffe076954e>] alloc_vmap_area+0x31e/0xbf0
> [  394.503213]  [<00007fffe0770106>] __get_vm_area_node+0x1a6/0x2d0
> [  394.503218]  [<00007fffe07716fa>] __vmalloc_node_range_noprof+0xba/0x260
> [  394.503224]  [<00007fffe0771970>] __vmalloc_node_noprof+0xd0/0x110
> [  394.503229]  [<00007fffe0771a22>] vmalloc_noprof+0x32/0x40
> [  394.503234]  [<00007fff604eaa42>] full_fit_alloc_test+0xb2/0x3e0 [test_vmalloc]
> [  394.503241]  [<00007fff604eb478>] test_func+0x488/0x760 [test_vmalloc]
> [  394.503247]  [<00007fffe025ad68>] kthread+0x368/0x630
> [  394.503253]  [<00007fffe01391e0>] __ret_from_fork+0xd0/0x490
> [  394.503259]  [<00007fffe24e468a>] ret_from_fork+0xa/0x30
> 
> I could have cached lazy_mmu_state::active as arch-specific data
> and check it, but then what is the point to have it generalized?

Do you mean we should set ->active before calling into the arch 
callback? We could do that I think.

