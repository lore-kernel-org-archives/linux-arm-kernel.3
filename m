Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56AECA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 17:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVOLHzyfqUmv7StJG1aPauWki6PAmKd3K90h79SeG0Q=; b=Jg9omOvfh93nfpuHfoC6PipbBX
	nqVrtfNIYdquQi6x+Ycb6D86up2oJ+jMphjWQ5630byUhzGGjy/A7WMDfC8Bpb87nVcget4aM1SVa
	ZF4o2m6Ef6KBGWcAhxVArkGmUHADIB73bsO9xGxLMFI/cbz8OcRhWuJRK/CJW57cSaBBUk8fcU41A
	e4auyBVk7VwjYL6bnIjamz+bFw5tNBlcAxt7CONVpT15DXy6tx0NJTbusQkswNvjyqcr6I2OGnELo
	Nk3NuwYP0Uo3ZOK5mCoNjP0F+2VuQTR4bNNrx7vtf3UAJ2YscpzfqTBN6dgj5eb3d9ceLdkOVHVdh
	ZIPzV1LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJiG-0000000B4sf-48WN;
	Mon, 12 Oct 2026 17:21:24 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJiD-0000000B4rX-3CS0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 17:21:23 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-486e8faff03so903672f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 10:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791825680; x=1792430480; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XVOLHzyfqUmv7StJG1aPauWki6PAmKd3K90h79SeG0Q=;
        b=dXHgRgWKdDdFP4sSx6qshUgiMO75oD9n5D3ORzyrEan2QRZC9BufG4mNAIyzfZlojj
         LCsB9edFs9dbqRVANSNK8/+7qKWSgRXbBagguCu6SnJHQl/omhL+e9MVuLa0WQeYstnE
         UhcuuDj/WWjOoMZTIl/b52//bbIwH8mkW90vpqbtDlSO236aNXL+6nXW0xgHCNrPm+c1
         2iCQsRc7PZU4ODZkxj3LYlIcoMi1ob7kmLC+WZQEqdclTwkQkIP76oFAh6T6HeLz3KgC
         aLxOh65hlRFhzbse+tB2UA7h6JNo9gbewyJpCfr+OeJOazJbwo+2rJPW7JkfnBeLkO0Y
         Rmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791825680; x=1792430480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XVOLHzyfqUmv7StJG1aPauWki6PAmKd3K90h79SeG0Q=;
        b=SfNItlqnXTgrDbXOAiNJ4zQSXaoWZNLwWBzPXPEmXlh8bQZghbj9ylfqMaRP24zOG3
         YDPwDWKjAbeTaqyVmJYLe9C6ALO4/DuP6ku6t6H4Nj5UmDHfWrHcwSJBRSwfn4eg772u
         /Y88wjCZ4ilGMvr8L2DGuiUkaf+eOnr2Ml/PRBQhK3eesyYoj2SLlpZDtn054ordTsYo
         iAypoA5ZuN7ykGlX9ZBdGB+8MA3QaSVtQS3izZWCOKctR0kjgNo6sq9OKGRP8EMJ4GLB
         BDerUpdPDuzVZNGKDIGFg26oVt4ipXunwJROzXt0AX1FpfVIr6PrKMLFhEMwYxbOll7D
         y2Eg==
X-Forwarded-Encrypted: i=1; AKwUvBy5BQVoo7Ee1IvmzghhA079exl+dF6d4yel8KeEQCrcCAW/nR3EX5xU1TpCND0QOtyj+tP9ClVZRw/1+MNQEllF@lists.infradead.org
X-Gm-Message-State: AFq9FYItjRF4m3/PBiTSx090L5i0z31yMtIINaY3e7mmxZtd0CdkN/3m
	2LNB8+Ajg1pmYzjmkL1LjgFzGMablZOB6/0woFj8jK2jatul1LfnxF/p
X-Gm-Gg: AYBFou1/b3mjJDQJKbUqdSqQ0XXLNns0JXQKc+CLzgGKYKdwKd5GlimLVPofFOEs87Q
	QLBKzNA+avQAmR0L7ojAsd/bI5IKjXJajiZut3aNan5dlCwvcQ7mlRJbRoptrR8+TThxdtelEZi
	4puiup/LACZfOQv1lkflxeqpePGB6oi0qNV85D8k2MOZ9bqK2GfEZNYwBbSExwJB/BaQCVVcWI9
	uPFbzdy/styetc5xGfdCF54dIBJ8KliUQPVh+MZ2qoJPXPVtR0Hls+3FO7ojyoTjh/k1bTv4Iyd
	fydCxDuwa5uILiSEOaYAJ6mlrgfCkiQarD47FFmIG47aD3LMcCOBEWzPTRQV1bEdm/VGBCyHffR
	lgGomXuWFNCR/Bk0I6VHb1Esak0cPzumCgGQ+NzXKY93LWoVHUdDlJPFqTKOYPmZj4nyFdGAwHB
	h7OLefYQrg21j2k5hjl2O/BXPmp3XX0Ifcsyut1x7CpuX+KpVsvCLsI+5CfEM6YsaXUw==
X-Received: by 2002:a05:6000:2990:10b0:48d:de7b:9caf with SMTP id ffacd0b85a97d-48dde7b9d70mr2473124f8f.8.1791825679711;
        Mon, 12 Oct 2026 10:21:19 -0700 (PDT)
Received: from [192.168.1.18] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaa21sm583094f8f.9.2026.10.12.10.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 10:21:18 -0700 (PDT)
Message-ID: <3ab63358-8bbe-4457-b21c-bb81bca804cc@gmail.com>
Date: Mon, 12 Oct 2026 19:21:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] mm: fix missing page-table destructor in
 pagetable_free()
To: Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <songmuchun@bytedance.com>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Dave Hansen <dave.hansen@intel.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261010112457.49485-1-songmuchun@bytedance.com>
 <20261010112457.49485-2-songmuchun@bytedance.com>
 <asy-b7_C3SjnmSaS@gmail.com> <145CD5DC-6457-4E1E-8B9D-AE7D1EDB0AB8@linux.dev>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <145CD5DC-6457-4E1E-8B9D-AE7D1EDB0AB8@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_102121_814536_47236A85 
X-CRM114-Status: GOOD (  16.63  )
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

On 10/12/26 2:55 PM, Muchun Song wrote:
> 
> 
>> On Oct 12, 2026, at 19:15, Jose A. Perez de Azpillaga <azpijr@gmail.com> wrote:
>>
>> On Sat, Oct 10, 2026 at 07:24:54PM +0800, Muchun Song wrote:
>>> Since commit 49f599666420 ("mm: call ctor/dtor for kernel PTEs"),
>>> pte_alloc_one_kernel() runs the page-table constructor for kernel PTE
>>> tables.
>>>
>>> HVO (HugeTLB Vmemmap Optimization) uses pte_alloc_one_kernel() when
>>> splitting a PMD. Restoring the vmemmap backing pages does not collapse
>>> the PTE table, so a later memory hot-remove eventually frees it through
>>> pagetable_free() on x86-64. That releases the page without running the
>>> matching destructor and leaves NR_PAGETABLE elevated.
>>>
>>> Make pagetable_free() detect constructor-backed pages and run the
>>> destructor before releasing their memory to fix the problem.
>>>
>>> Fixes: 49f599666420 ("mm: call ctor/dtor for kernel PTEs")
>>> Cc: stable@vger.kernel.org
>>
>> is the x86 case covered for 6.16-6.18? as far as I can see, x86
>> free_pagetable() only uses pagetable_free() since bf9e4e30f353
>> ("x86/mm: use pagetable_free()") in v6.19, so the backport wouldn't
>> change anything there. or am I missing something?
> 
> Yes, you are absolutely right — thanks for catching this.
> 
> I double-checked and indeed x86's free_pagetable() only starts using
> pagetable_free() since bf9e4e30f353 ("x86/mm: use pagetable_free()"),
> which landed in v6.19. So for 6.16-6.18 the prerequisite is not present
> and the backport would be a no-op there.
> 
> The correct trailer is:
> 
> Cc: <stable@vger.kernel.org> # 6.16-6.18: bf9e4e30f353: x86/mm: use pagetable_free()

also, bf9e4e30f353 alone leaks PMD-sized vmemmap pages on those trees,
it needs 39406c05f8f1 ("x86/mm: Fix freeing of PMD-sized vmemmap pages")
as well :)

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a

