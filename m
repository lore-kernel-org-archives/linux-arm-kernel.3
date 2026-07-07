Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8829DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 13:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5p98PRn2cxjDk+JJlvD1wzmliW0l2W8nSc95PJxuTqs=; b=2borw2ghJXQhtw+YeTdWFs77tX
	Iv9JWoH6DufwsenrCcAHv824iJaGsfH5TcIO7AiyAEDrU8c57IHU15DU3nX4MxJT9sFbZpC9IA3O/
	SkhLzF7FZ9iu8REallEh1u9QnF9bGA6IfIzxIQDAvybVfDCvzOMoQTe/dqfVAA9zh39JscrlvDoTc
	wcHWdU4w0HFNvz34RfexfyPV2LBwPUQMIR7+UfqR3fBhrOKI8PfkoRpS6G3aTgZsjwOJ862GlFYGX
	hWIgDtD45vcSTJ8w12thK4fR/25bG1GNWmx2g1KOn39cil7X7/r5KElqJAJ2koWP20OFLlxEI1yqh
	PTuPsfGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5gF-0000000F2CS-49Uk;
	Tue, 07 Jul 2026 13:17:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5gE-0000000F2C5-32PE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 13:17:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D68443D6C;
	Tue,  7 Jul 2026 13:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1D01F0155E;
	Tue,  7 Jul 2026 13:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783430262;
	bh=5p98PRn2cxjDk+JJlvD1wzmliW0l2W8nSc95PJxuTqs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ekBlEtaXKEYUfjDrvSvzpx89vlzX8XAx0GfpW4nUJOaQ3SRolAmuk/Y7CfTfPGgJ7
	 JP8faT51OLBKI00vsvtQZWw9WIZOFJ3rVlmmw4hHsISJu7I7SgSszbErKQ1L870E8d
	 KIls4KWjd6p/bXVbraoj9gw0JDhauAiy1T2Ba16ZZW274Vbl+qZ+0JC+Qgt9C12Fxs
	 vwHJ02whL36oG1D1TQm/f57N0ubo2JltZ/dSnWg49uXAigoG4zbLnXj1TDipXQh/i6
	 ou8ugFM8ohRJLocIx6s+ZM7/hodfALjZxDkmwUMVIbVeNlu0X6hQMWJfwQ5uzJLzfr
	 vrbb7unCQNidw==
Message-ID: <4bfeb697-9c1f-4316-96bb-9bfd66f959df@kernel.org>
Date: Tue, 7 Jul 2026 15:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mm: opaque hardware page-table entry handles
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>
References: <74182e50-b54f-4d2d-a27f-3a59a538d6bc@arm.com>
 <31d36023-d728-4eee-90f8-158c7066f565@kernel.org>
 <e22407d8-4509-4a53-9ba4-491b9d5c5ef7@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <e22407d8-4509-4a53-9ba4-491b9d5c5ef7@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

[...]

>>
>> typedef struct {
>> 	pte_t __pte;
>> } hw_pte_t;
>>
>> And then simply use
>>
>> hw_pte_t *hptep;
> Make sense. So you have suggested to just hide put pte_t inside a structure
> instead of complex structure of pointer. I've tried to implement and it reduces
> churn enormously.

Right. And for most architectures we can probable leave both types be the same
under the hood.

So we'd only have to convert common code first, and can then e.g., look into
making architectures that care about the difference (e.g., arm64) actually have
it be two separate types.

Just an idea to further reduce the churn and limit it only to core code (because
I saw some very ugly stuff in some arch code that would make such a conversion
harder).

[...]

>> Why do we need this and what would we use it for?
> The idea was that there should be two different functions to read value. Let's
> leave this out of the first initial series. It is complicating the original
> proposal.

Right, let's leave that out for now. I'm currently working with Levi on an
approach that tries to avoid the overhead due to READ_ONCE with folded page
tables. [1]

We're still struggling with some bits, but looks like we can make it fly and
have it be fairly robust.

With that, maybe there is no reason left to have separate pXXp_get() vs.
pXXp_get_once(). TBD :)

[1] https://lore.kernel.org/all/08ecabe9-0664-4aea-82fb-f9cb1739f762@kernel.org/

[...]

>>
>> I'm still not sure about the _once() really, and if we need that right now. We
>> survived without is so far, why do we need it now?
> The idea is to convert all current pXXp_get() to pXXp_get_once() and convert raw
> dereference to pXXp_get(). Let's keep this idea separate for the other work. Let's
> discuss it later sometime again later.

Sounds good.

-- 
Cheers,

David

