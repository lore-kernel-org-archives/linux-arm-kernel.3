Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198D9CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 03:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ih1BA6VBQclIQnLMrdEp760CNzU2hkoYJjVIAwEnP8c=; b=MSWhuXcdBESMUE/011r9sKfbJm
	rMHZPSDhIfpIli9mH7r/iTBPwPJJ9+Asyb8amp9NCciexq6NkoWyA5codIyKTmMmS59RhvGJ+PqWk
	AhtiNwtv7SbpCSg5lsLuQEPR+ZceHXJxZgPabUA0KV7rUajYbANpNtefXJfRA0AVBeMNtNfjqdyaV
	fCmAqWVVY1UfyFErkPjfjUQH0X8gvD04gnHaEfxvsseatPWNRjtjuFYoFZgtcgAk4w44aG8wWzu4x
	ELMA1mbW3oR2FZqd46u//hSA3MzKU3QpRguC/wAJwRBdqA5h6WhdTYuQqtTITlwZv+Dv7bmqlztWo
	+XMZnX2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9Ux-00000006jrW-46zD;
	Wed, 10 Jun 2026 03:20:59 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9Uv-00000006jr4-1Akd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 03:20:58 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781061643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ih1BA6VBQclIQnLMrdEp760CNzU2hkoYJjVIAwEnP8c=;
	b=TnKTBVRJuvU106/Zwt6YCEBWfPJp5K1VWTaSFRqCyVV/HvjLO52x40h9PunBn/qPPEPU+n
	W5HpnKUtdMxNX2c0p1aagTgWS2XJRJssUy/LyBQ3F98/lV2TyDnX/q+L0kngAjjHEFSfW4
	zLQyiio8VwGcbOAHXVj2V26/cY6XyGg=
From: Lance Yang <lance.yang@linux.dev>
To: dave.hansen@intel.com
Cc: xueyuan.chen21@gmail.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	hpa@zytor.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	yang@os.amperecomputing.com,
	jannh@google.com
Subject: Re: [RFC PATCH v2 1/3] mm/huge_memory: make persistent huge zero folio read-only
Date: Wed, 10 Jun 2026 11:20:22 +0800
Message-Id: <20260610032022.23361-1-lance.yang@linux.dev>
In-Reply-To: <930d9121-9176-4a7b-a2d7-8224f94000d3@intel.com>
References: <930d9121-9176-4a7b-a2d7-8224f94000d3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_202057_476111_87324023 
X-CRM114-Status: GOOD (  18.87  )
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

Hi Dave,

Thanks for taking the time to review.

On Tue, Jun 09, 2026 at 12:33:36PM -0700, Dave Hansen wrote:
>On 6/9/26 07:37, Xueyuan Chen wrote:
>> +bool __weak arch_make_pages_readonly(struct page *page, int nr_pages)
>> +{
>> +	return false;
>> +}
>
>This is a rather wonky function. It's going to cause all kinds of fun if
>it is used like this:
>
>	arch_make_pages_readonly(syscall_table, 1);

Ouch, yeah, it is ...

>It's also kinda weird to have it return a bool, and not check that bool
>at the single call site. Some things come to mind:
>
>1. This function needs commenting. It needs to say what it does, when
>   architectures should override it and what their implementations
>   should look like. It needs to be clear that this can't be used for
>   anything really important. What should architectures do with alias
>   mappings? Are they allowed to touch non-direct map aliases? Are they
>   required to?

Agreed. Needs a real comment ...

Just meant as a best-effort direct/linear-map permission chang, nothing
stronger than that. I should spell out what happens, or does not happen,
to non-direct-map aliases, if anything, and make clear callers cannot
treat this as a hard guarantee :D

>2. The return type needs to be reconsidered. Is 'bool' even acceptable?
>   Should it just be 'void' if callers can't do anything when it fails?

Maybe ignoring it is OK now, but someone may need the return value later?

>3. What should the naming be? "readonly" vs "ro". Should it have a
>   "maybe" since it's kinda optional?

Fair point. "make" may be overstating it a bit ...

With a return value, arch_try_make_pages_readonly() sounds about right
to me. If we end up with void and pure best-effort semantics, maybe
arch_maybe_make_pages_readonly() fits better :)

>4. Should this new API be folio or page-based in the first place?

For page vs folio, I was mostly following David's RFC v1 suggestion.

Current caller is a folio, sure, but the page-range helper leaves room
for non-folio users later. Happy to add a simple folio wrapper if that
reads better ;)

>5. Is mm/huge_memory.c the right place to define a generic mm function,
>   even a stub?

Ah, you're right! My bad, wrong place for a generic stub. Will move it
out for RFC v3.

Thanks, Lance

