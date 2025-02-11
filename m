Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482C7C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 03:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZuCVGHj2siA1FeN0jM50/1UWhVlGr3BCjxNx1sMgmQ=; b=g6KA+5DISC/bX0
	MkpkbfgZGEP5TebUVE2Tx9533+7jlUsrfpYYqiaI4ArNtmXFCy2goptqvZJykdiihJtIf1OY++aUC
	NSqf8qRWdw83dbldnNZH+4MO6YfQZjOABJ2+wknfFqmfzsnl9klz58x6gXRZ9VV4MMmNT06cUt8RU
	rGdhRQwVvSVvSLBIQdd3WuzS0izv9gsR3WUcfJqtRImlgCpxuX9Q/LiNRgK/9nJxotf6ESor3HJ7n
	IMatVspuLH8TBgIWGBNOplcnVySfiNlz2gTQk0ZF4l+x36zwT7wNAQknGxJLfFBr5eBwTzhbQda9r
	9Lhnq/jVzslhVkQ3kajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thhEf-00000002QVe-1Te7;
	Tue, 11 Feb 2025 03:46:57 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thhDF-00000002QNb-36a9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 03:45:31 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21f6022c2c3so47285415ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 19:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739245528; x=1739850328; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kZuCVGHj2siA1FeN0jM50/1UWhVlGr3BCjxNx1sMgmQ=;
        b=gVU2xxpoHm4Wq3ZsfiK7vjnUOJzNVZ6q7NqhX1JdfSp8Bg8gm9YoiU9bGF2udvaRR5
         NQ9dKIARBzodN75ShWnl2yizvEs/vxOn8JrYfplla9X33bB3SxLYjycK8r5R5jbJG+pO
         w/484B5q1d0t9AlQQ5cDipZB9QxWvQMrHXAzYQWVpdVqY+781FWJ3qMLYYiPJ9y6PSTE
         RQTw+XKkNEmbcLaipIE+j+a8AxeNuIWZbi0AEgWGJM4DUg/9+PwHxa5C8Ghn5LMObDOJ
         ehdTrVQWiqhoyoHC5LVAaqA8ULmBwFMo93i+bx4+yB3UriY4wgM9xy2aYlWW2FFcvydg
         kayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739245528; x=1739850328;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kZuCVGHj2siA1FeN0jM50/1UWhVlGr3BCjxNx1sMgmQ=;
        b=l/nC/4j29WrNQFb3J4SEiFVBgBLggOToOvR5fY26BAsNoaSC5RyM2opar0mRuKTjWJ
         DqOgw99mwvkJvg5/5d0+kl8CPHwk5/IiXe4PTAh4WCyrjyrJWbQ07MEyAWiKJgdQ+yVf
         /2u7f0tNN7dpThyjm1O+xWNi5/tbDJun/n9gvZI/M/5qkmex/Q++PiYfUzvgSczbm6lF
         EjnIwvwx74yerGHq+Z8/vsAhXc5/vRkDhEynHz92BL9fm0iLzDFmQT82WtLgPvVYypmA
         60wjkRx7eUmk6pULt2rm3aGp/16TSLDim8Svm1lAPJ3ZR3PQKdirseA84mRyX93vP92i
         upSg==
X-Forwarded-Encrypted: i=1; AJvYcCVL5PwmyB0O+udSgU6XyUfqEtDJ3b2PPHnZpAjpga7Wpov+SUgE9JlwmBn/DPo34cqGsKZEIboBoSkqwwCbqEuR@lists.infradead.org
X-Gm-Message-State: AOJu0YxZdrH4c+Z8JgLRr00BlE+IeBm/dFWvuGY2XZupgGoChAXW1U5K
	1uU8ObPP1QyIbOLs00GyOGUQtgn7ZwRQMSGL2gCriHAdLegqXBmlVCACgTYG7NY=
X-Gm-Gg: ASbGncsela/bcHxBb18o2DWNz2Pj9xo/R3JA6t7H/8fXGf6Efet3kJ5sCxPD5/tm3lv
	+VfCZUb87kWQ+2624X9G0p/dm7xYkZ5n6atEYU11id7mY3mN2emV2YOw840RJnydt4NLKC5VPSD
	jN0HPOiTDKw9wPeDRVqlElC4UUD8LIJRpFXc+UkkJ6wYV4Nsq4DNGeCX3CL6WbAbd8FKAMcS0dO
	NnDCgJRtYGiUgmqdShsN8x6hODDGgo6FYG2FtMtEtMZzVuUzxp/XiG+0fKJS68ZhWC/8ndPLZOG
	EcGwyCcug+wm+NXOzJnM42btretzhAgdZFjnVEwpfQ==
X-Google-Smtp-Source: AGHT+IHDT5ZHgM+82fxxyVFS+emJuJ8X1+3KqM06GzB5RQUXgFH/rG4FkcHvF8IbgaPTrjU21R58hQ==
X-Received: by 2002:a05:6300:6713:b0:1ea:f941:8d8e with SMTP id adf61e73a8af0-1ee4b7260e5mr2764148637.16.1739245528143;
        Mon, 10 Feb 2025 19:45:28 -0800 (PST)
Received: from [10.84.150.121] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7307b967019sm4702806b3a.109.2025.02.10.19.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 19:45:27 -0800 (PST)
Message-ID: <5d50d714-197f-44c0-94e0-ff70ee51e866@bytedance.com>
Date: Tue, 11 Feb 2025 11:45:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] NULL pointer dereference on ARM (AT91SAM9G25) during
 compaction
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <CAM1KZSmZ2T_riHvay+7cKEFxoPgeVpHkVFTzVVEQ1BO0cLkHEQ@mail.gmail.com>
 <Z6oxUdrVBPd5ZTEu@shell.armlinux.org.uk>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z6oxUdrVBPd5ZTEu@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_194529_966329_A4557C92 
X-CRM114-Status: GOOD (  18.39  )
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
Cc: linux-arm-kernel@lists.infradead.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ryan Roberts <ryan.roberts@arm.com>, open list <linux-kernel@vger.kernel.org>, David Hildenbrand <david@redhat.com>, Hugh Dickins <hughd@google.com>, Muchun Song <muchun.song@linux.dev>, Ezra Buehler <ezra@easyb.ch>, Matthew Wilcox <willy@infradead.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, Peter Xu <peterx@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, "Mike Rapoport \(Microsoft\)" <rppt@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Russell,

On 2025/2/11 01:03, Russell King (Oracle) wrote:
> On Mon, Feb 10, 2025 at 05:49:38PM +0100, Ezra Buehler wrote:
>> When running vanilla Linux 6.13 or newer (6.14-rc2) on the
>> AT91SAM9G25-based GARDENA smart Gateway, we are seeing a NULL pointer
>> dereference resulting in a kernel panic. The culprit seems to be commit
>> fc9c45b71f43 ("arm: adjust_pte() usepte_offset_map_rw_nolock()").
>> Reverting the commit apparently fixes the issue.
> 
> The blamed commit is buggy:
> 
> arch/arm/include/asm/tlbflush.h:
> #define update_mmu_cache(vma, addr, ptep) \
>          update_mmu_cache_range(NULL, vma, addr, ptep, 1)
> 
> So vmf can be NULL. This didn't used to matter before this commit,
> because vmf was not used by ARM's update_mmu_cache_range(). However,
> the commit introduced a dereference of it, which now causes a NULL
> point dereference.
> 
> Not sure what the correct solution is, but at a guess, both:
> 
> 	if (ptl != vmf->ptl)
> 
> need to become:
> 
> 	if (!vmf || ptl != vmf->ptl)

No, we can't do that, because without using split PTE locks, we would
use shared mm->page_table_lock, which would create a deadlock.

But it seems that we cannot simply bring back do_pte_lock() and
do_pte_unlock()? In make_coherent(), we traverse the vmas and exclude
the same vma, but different vmas may also map to the same PTE page,
right? In this case, we still cannot directly hold the pte lock.
But this part of code is quite old, maybe I missed something?

Thanks,
Qi

> 
> but I haven't checked wha tthe locking context actually is here
> (I've been out of MM stuff too long to know this off the top of my
> head.)
> 

