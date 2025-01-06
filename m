Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DF6E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 08:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YiOAOk5kGRx9rmUPaHmWdeff0Y5xhlY6UwwEsQqm8Hw=; b=ZqOhPQ6PL0DT7zWbG1KdzpBNob
	wJ+M+m6iwBy8aCzRTGzslLLYcTICVf/eMNG8qlVmeyAI8M0UO4XskAcLJoSgvF6/zsQWqncEJd+MB
	JMQ3Z4JHziyP41GAErfWzJ8g51c8WqR3AZWlyddIzNyaeiKgXY6FKS80gtL/wxupKgKpsQv2yqZ41
	ZYFKT4HjXS4MQ2404Voaibe0gsunylEKIlBKCJFdj37jsADVhR4aodvZqHt4yvLDLniWNgzzyXyTt
	TYKE7Fgk/mOoTGDF9QDQbx6I5Fh0IUTg/bvGZ/krZDNxE1p70OtVOuI5QPtjT7Vlkobbz/jMGufii
	fwDEsnbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUieX-00000000YDT-3Id9;
	Mon, 06 Jan 2025 08:40:01 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUidL-00000000Y1f-1wA6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 08:38:50 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21661be2c2dso182858135ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 00:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736152725; x=1736757525; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YiOAOk5kGRx9rmUPaHmWdeff0Y5xhlY6UwwEsQqm8Hw=;
        b=YhLtHRliJAH+nVaGq9JLlfFq/roSt+Z5/uK/lPENt7TByuZgR+ZRXkjHkEPJMrPKbg
         Uqv+xKC41iZMdIKj7jXF+j3Ist/TOq3kGaZL912TdGa7i212Pb3JLnmdZW7oOy4fnCzP
         2aAQeZpgD9L8OWFWh/8NKye0niQQ+TMk7BJBlESC/gmNZ39daKZhbzFLb+c74ff/amfU
         MX1W1FyuKlzJqmQ3raCpD+zHRKNDw9fsbsEJFgNSwEPfUO1W0c1u2dKkNQZb4g2ufM2V
         y+Vqs5BjODGIbjPo0+gmmpGoeFKfduXtJBXHFZfskc6kiwm7niramZK4m2DdT+9099Xy
         qjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736152725; x=1736757525;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YiOAOk5kGRx9rmUPaHmWdeff0Y5xhlY6UwwEsQqm8Hw=;
        b=NdpRlSzIxqrm/3yYdK3Q4LV6MnGLYYxCm10galFkFJfPsLz7SrUjmCsAJP4Tl9xKDT
         vgWElsKWKhn+1QgkvcVwS1DpmZ+2UuZWt0aNuN4YG7UN82DejBLza5MoSqJ274UVKiG3
         L3RdW+bH4uRxagjVuhV+uWIVS8o4kmqr6kOi8wL0JeNVx24h+XZ3xhe78FLYftiWJWFV
         4yzHlj95B7X9I+m1/atNJiOzn9sslhuXwGGQnk66/yvortUPp0QKIIFSRCx0m8uyKN9S
         RL5Uu5B8CdAeehqHNjAGdi7OsoGExk34u2HSogikxXHyRXDAgIHGHcPaIfElM6ZH++JQ
         auyg==
X-Forwarded-Encrypted: i=1; AJvYcCVFYWDub7YSsa4LeKh5RtdHXJYlGQTASr4g/cx6fYmQyJ4kYzRFSsnkSzLEsJum7MWqtxpt9t89Ps+BwOUNxTis@lists.infradead.org
X-Gm-Message-State: AOJu0YxTjwAis8J2uBXg/A8ulridR0OU2O4atuq0vdelt1qPsKFwYUCY
	YB4ypc66mDeeDlS28J/RQwpbJY4TIjXVfDvaYjatSmfzoO7rD0g/ktYQpsV5LGE=
X-Gm-Gg: ASbGncuMeqBmsRibav+LoHvGWDQZguDszB9+Oy5T00wsCqiEFGhte/u8gL4nKQWje7Z
	VH0BgiAqeeN2iQhifEadrvoVZs7Uoqo79FWGIHfxecug0iAkhzsK8mzcBGx2JiHt3sqgli+4b3J
	lUMEizTO5jhcg+9hw7wjJtlxcH+O4FPO0uGs/MpAa5UlZ0VRXk7UcDFhxgSWdR3W6fw/YG1jFN7
	wlL1PbBIpR5hmSbP8yhb10hibAfvP1RK08BMocW8Lwd/6lk7DkfwSuCv7WzPA/aGAfZRfIKUYfw
	ZEhCiA==
X-Google-Smtp-Source: AGHT+IGUVd4iqCCZ9lciazZSWpc6AL/Za8b2BM7ngUBHt9ys8AcRhMXZRUNC6JrwIwMnpr/5pGC4Lg==
X-Received: by 2002:a17:903:234c:b0:215:5a53:edee with SMTP id d9443c01a7336-219e6e85b25mr837178605ad.9.1736152725600;
        Mon, 06 Jan 2025 00:38:45 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f5087sm282364745ad.202.2025.01.06.00.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 00:38:45 -0800 (PST)
Message-ID: <ae8aa8d7-4121-4939-9890-c54e0aee7896@bytedance.com>
Date: Mon, 6 Jan 2025 16:38:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Account page tables at all levels
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, linux-alpha@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-um@lists.infradead.org, loongarch@lists.linux.dev, x86@kernel.org
References: <20250103184415.2744423-1-kevin.brodsky@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250103184415.2744423-1-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_003847_838408_B9763E7F 
X-CRM114-Status: GOOD (  17.13  )
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



On 2025/1/4 02:44, Kevin Brodsky wrote:
> v1: https://lore.kernel.org/linux-mm/20241219164425.2277022-1-kevin.brodsky@arm.com/
> 
> This series should be considered in conjunction with Qi's series [1].
> Together, they ensure that page table ctor/dtor are called at all levels
> (PTE to PGD) and all architectures, where page tables are regular pages.
> Besides the improvement in accounting and general cleanup, this also
> create a single place where construction/destruction hooks can be called
> for all page tables, namely the now-generic pagetable_dtor() introduced
> by Qi, and __pagetable_ctor() introduced in this series.
> 
> v2 is essentially v1 rebased on top of mm-unstable, which includes Qi's
> v4 series. A number of patches from v1 were dropped:
> 
> * v1 patch 4 is superseded by patch 6 in Qi's series.
> * v1 patch 5 and 6 moved to Qi's series from v3 onwards.
> * v1 patch 7 is superseded by patch 4 in Qi's series.
> 
> Changes from v1 in the remaining patches:
> 
> * Patch 1 only introduces __pagetable_ctor() as there is now a single
>    generic pagetable_dtor().
> 
> * Patch 3 and 6: in arch/m68k/mm/motorola.c, free_pointer_table() can
>    now unconditionally call pagetable_dtor() since it is the same for all
>    levels.
> 
> * Patch 6 just uses pagetable_dtor() instead of introducing
>    pagetable_pgd_dtor().
> 
> * Added Dave Hansen's Acked-by to all patches.
> 
> - Kevin
> 
> [1] https://lore.kernel.org/linux-mm/cover.1735549103.git.zhengqi.arch@bytedance.com/
> ---
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: "Mike Rapoport (IBM)" <rppt@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Will Deacon <will@kernel.org>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Qi Zheng <zhengqi.arch@bytedance.com>
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-arch@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-csky@vger.kernel.org
> Cc: linux-hexagon@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-openrisc@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-um@lists.infradead.org
> Cc: loongarch@lists.linux.dev
> Cc: x86@kernel.org
> ---
> Kevin Brodsky (6):
>    mm: Move common part of pagetable_*_ctor to helper
>    parisc: mm: Ensure pagetable_pmd_[cd]tor are called
>    m68k: mm: Add calls to pagetable_pmd_[cd]tor
>    ARM: mm: Rename PGD helpers
>    asm-generic: pgalloc: Provide generic __pgd_{alloc,free}
>    mm: Introduce ctor/dtor at PGD level

For this series:

Acked-by: Qi Zheng <zhengqi.arch@bytedance.com>

Thanks!


