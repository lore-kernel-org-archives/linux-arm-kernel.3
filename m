Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34D6C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 10:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzKFECSuOrjGHmvVYUyn73AvVxJwOW9pPOz9BQr1u1k=; b=X6UT6lZVbi8QYsZNY8QqY4eslY
	t7fqwWzwaayZqDBPVKPwXT6Wfl/zAghUmBRWzxc7S8bTpHV0tB8FPRE5mBKaA8Q/TXoWntQMGJ2T3
	dK9HpHZisv8UPRbw2iljjD3/OxQjI824iI2t+BPDIxmngcIGyZ2w2XDJ2yMfZO0jHiVuh3aInxTht
	XtWwRBymfapmyZF8oTDmyfZsQpB69iOZCoon4LCCb4AEWS4H/PwXvuntFPovzZbC1azL/PPNgG73x
	IZUTJI0/PMY8J7+r+3Bs+LIkIGEmN0fAZupuILQMlAC0QnBP/ZvIBiwC+RKOSNhqn9jhBJu4tydRA
	xK67yW1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdROK-00000008Zb3-1r6e;
	Thu, 30 Jan 2025 10:03:20 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRN0-00000008ZDC-1IiP;
	Thu, 30 Jan 2025 10:01:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2040D43423;
	Thu, 30 Jan 2025 10:01:38 +0000 (UTC)
Message-ID: <03594835-6f12-4582-a4f7-cbb1630dba91@ghiti.fr>
Date: Thu, 30 Jan 2025 11:01:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] riscv: add support for SBI Supervisor Software
 Events extension
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>
References: <20241206163102.843505-1-cleger@rivosinc.com>
 <20241206163102.843505-3-cleger@rivosinc.com>
 <a21df8a8-a50f-49df-a098-69faa51ed8cb@ghiti.fr>
 <649fdead-09b0-4f94-a6ff-099fc970d890@rivosinc.com>
 <a0012a8d-0c2b-4948-b5c7-7d8efdf1cab0@ghiti.fr>
 <32cc0753-a033-4f55-8aca-09416f62faa8@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <32cc0753-a033-4f55-8aca-09416f62faa8@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedtgeeuhffhveeujeetveevieekleekvdffudefleevgefgieekkefggefhtddtveenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvuddrvdehngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegtlhgvghgvrhesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhop
 ehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehhtghhrghuhhgrnhesvhgvnhhtrghnrghmihgtrhhordgtohhmpdhrtghpthhtoheprghprghtvghlsehvvghnthgrnhgrmhhitghrohdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_020158_477588_7DC9D92B 
X-CRM114-Status: GOOD (  14.46  )
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

Hi Clément,

On 28/01/2025 09:10, Clément Léger wrote:
>
> On 27/01/2025 09:09, Alexandre Ghiti wrote:
>>> I believe the goal is not the same. Using CONFIG_VMAP_STACK allows the
>>> kernel exception handling to catch any stack overflow when entering the
>>> kernel and thus using vmalloc is required to allocate twice the page
>>> size (overflow is when sp is located in the upper half of the allocated
>>> vmalloc stack. So basically, this is two distinct purposes.
>>>
>>> AFAIU, kvmalloc allows to fallback to vmalloc if kmalloc fails. This is
>>> not what we are looking for here since our allocation size is always
>>> quite small and known (STACK_SIZE basically).
>>>
>>> But I might be missing something.
>>
>> arch_alloc_vmap_stack() only vmalloc the stack and does not implement
>> any stack overflow mechanism, so I'm still unsure we need the define.
> Hi Alex,
>
> So actually, the stack overflow check itself is done in the exception
> entry. It check if the stack pointer did passed in the upper part of the
> vmalloc allocation (see entry.S:122). In this allocation, the stack size
> is actually * 2:
>
> #ifdef CONFIG_VMAP_STACK
> #define THREAD_ALIGN            (2 * THREAD_SIZE)
> #else
> #define THREAD_ALIGN            THREAD_SIZE
> #endif
>
> So even though it does nothing special by itself, it centralize the
> allocation size/method. And size the size is larger, using vamlloc makes
> sense I guess. The same mechanism is used to allocate irq stack as well.


You're right, it makes sense! Nit: we can avoid the ifdef by using 
IS_ENABLED() but do as you prefer.

Thanks for the explanation,

Alex


>
> Thanks,
>
> Clément
>
>> Thanks,
>>
>> Alex

