Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DDBE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 03:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00MV44O/wLuPQ/RpQp8S/rpHXiOskq9DnLB00pReqmw=; b=PimkM3LUNvyNP+lanCY2bvz6AQ
	XQA6KpQkGfL8yhV4Jfyl3OKVPESTvZNxlglL/wBZjrcNXHQulYkP+yU6b1QCc7k7WOzgBaPqcSE/i
	bE24O5HiX1vQxgf7i/3AA8KgVXpOwGLiV6248QREuWfWiJz24s8rbIOjTwZcBB9A+4RjghCOQbn9X
	97xet2b/oeZYBTyRn0sPim58eorLokBN3HRo2DLt5yfN/HWpHR2qgVorM2jaRKC2eIBDUlpMuyE/G
	5THmOSMS0ZdKyQxfF8xWnp0WRcp76LY2cRCpy1EU+FNA7RC0QxReuoUk422J2JUzHm6nOcL25zt8b
	CcqRFdgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS6Dt-00000004Q0h-1p8a;
	Mon, 30 Dec 2024 03:13:41 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tS6Cb-00000004Pli-2P6h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 03:12:23 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2166f1e589cso136672215ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 19:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735528335; x=1736133135; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00MV44O/wLuPQ/RpQp8S/rpHXiOskq9DnLB00pReqmw=;
        b=KdeJYZ85LnWSIN52afzyVDJMSMjXApoS7eupT5t0oXiPDQb6r8d/dvWcsGvGRndKpf
         64353f8c49gWpoGkrTnP7U0Q3jLonUNcfYIjSpOLWuzyjVzUqvhTo0hKih3pGGgItgAT
         QyJb+fTnOxIdFUpVOh8QKCCicfVlWgbE3DvB+/AwZUZpoRQO/3DK0iCdo0/fKhvEjo5E
         8EISg5+4ae0WDnpGkgQ/B1ilWYGVFa9ITXoxYxg/ozhsMzsOyWsGp96ItvYwX6yOEuHn
         FG8qLrk83uqVQZ9mNlfWO3rxRElozLH860qK2yidEwfD8OVRXh3JG+lqEkX67HQRgPuk
         t8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735528335; x=1736133135;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00MV44O/wLuPQ/RpQp8S/rpHXiOskq9DnLB00pReqmw=;
        b=ogGJCMpiAlo5r6AnGhRuHZ1ztv+tUJAPrEpOwtflIPGGQH5QGSvWl+L6DZiZ2Uj6gu
         n8T8z5NDNwvU57wtL2QvsPUBe5JwlltbkZTbE+uCFoukCUiSjfL3F/2J7SUU2nnH/8dm
         a7m379t+yyXDIiHL4sGapuip2tgZZRtb6wg+AboNmwQmA7BM5KhKnyxF1exXcN3kprHO
         WJMZ4weDDn3vWetzgPFbFm3g6t5OvAuCJSfYmRY6nH9vyEK6927VfFTxXyepcMfXvDIt
         m3t8bjPv2tLdoWQ0O5cJnwVP28pTtvf/629kIVgJ1GbgNslUN3XK57hqEDCYpz9ujfe/
         T36A==
X-Forwarded-Encrypted: i=1; AJvYcCXivS85B+JmyRZaA0jSmxI+8IVbemO3ERE6WE+bvWoT7Tub26/zhCtPBEKNU4BDoOeLsfKwj6JMlPGJ4ml/8odP@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3B0qdJ8S5xStyqfU84lktfK+l1OwX4+PXDbm3WQxJTuQ9JfdS
	GoLEFbFHI304qSNch9ITDdkQZb817jeDgxBYwuTqraoLVxDhdBGH0W7XXbylmR4=
X-Gm-Gg: ASbGncvv6urILW42mk6iDqL+mrpz3t/qBTs4dJdGSkX41ikBcjwNwzFUfq9sL0k/fAB
	lcElbIDxsyKUKF4u4F0UhfLmwGTWaBdy0K1TkX1fq4Xf2dBkKMO8QJyRr7b0tW/MnkyIep3GD9i
	/19Y76ptuPcEe+hDGBRsntud1brL0g14YD4oFph/iV6GQVv+IVSfsDbSalGedNXgsF3UK8NjvmJ
	18Gi+vITYCPRmqLh/qN+9HmUq6gd7s/1AqZcZa3lI+rSvGS5DdbtQ3nfmm/jhJLFfQj8RE8fNwF
	S47XPw==
X-Google-Smtp-Source: AGHT+IHVtuGTDJKnXgo1JS5AtVrvj0I/cg1dyieo6seko5BYBtWvsXqnYPIAVAFKhaTndzKmWg8VgQ==
X-Received: by 2002:a05:6a20:9185:b0:1e5:7db5:d6e7 with SMTP id adf61e73a8af0-1e5e083f019mr66304616637.46.1735528334820;
        Sun, 29 Dec 2024 19:12:14 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad84eb45sm18191842b3a.88.2024.12.29.19.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Dec 2024 19:12:14 -0800 (PST)
Message-ID: <9cac5690-c570-4d43-a6bc-2b59b85497ae@bytedance.com>
Date: Mon, 30 Dec 2024 11:12:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/17] mm: pgtable: remove tlb_remove_page_ptdesc()
Content-Language: en-US
To: Mike Rapoport <rppt@kernel.org>, akpm@linux-foundation.org,
 kevin.brodsky@arm.com, peterz@infradead.org
Cc: agordeev@linux.ibm.com, tglx@linutronix.de, david@redhat.com,
 jannh@google.com, hughd@google.com, yuzhao@google.com, willy@infradead.org,
 muchun.song@linux.dev, vbabka@kernel.org, lorenzo.stoakes@oracle.com,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
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
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z2_EPmOTUHhcBegW@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_191221_631013_338C0517 
X-CRM114-Status: GOOD (  10.61  )
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

Hi Mike,

On 2024/12/28 17:26, Mike Rapoport wrote:
> On Mon, Dec 23, 2024 at 05:41:01PM +0800, Qi Zheng wrote:
>> Here we are explicitly dealing with struct page, and the following logic
>> semms strange:
>>
>> tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));
>>
>> tlb_remove_page_ptdesc
>> --> tlb_remove_page(tlb, ptdesc_page(pt));
>>
>> So remove tlb_remove_page_ptdesc() and make callers call tlb_remove_page()
>> directly.
> 
> Please don't. The ptdesc wrappers are there as a part of reducing the size
> of struct page project [1].
> 
> For now struct ptdesc overlaps struct page, but the goal is to have them
> separate and always operate on struct ptdesc when working with page tables.

OK, so tlb_remove_page_ptdesc() and tlb_remove_ptdesc() are somewhat
intermediate products of the project.

Hi Andrew, can you help remove [PATCH v3 15/17], [PATCH v3 16/17] and
[PATCH v3 17/17] from the mm-unstable branch?

For [PATCH v3 17/17], I can send it separately later, or Kevin Brodsky
can help do this in his patch series. ;)

Thanks,
Qi

> 
> [1] https://kernelnewbies.org/MatthewWilcox/Memdescs
>   


