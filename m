Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA8CC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=muMECbO96Q17a8vw7+GcxCDFTKIrG/mBOtBi3cQA3vw=; b=DGnCiRE8a6uEwTn/4JryaBWiUU
	AfIfstJmOUiTT9nLi4BYXhkSzQ9RffRVfKz/86jJu/UUQA7EXXvBbARGYkMuUDo1aSdTcMW97LefU
	uJDMnlgftwSb6P0oBUPxuRQ0H+WyfotxgSpBGEl38BN7gwrC3lByEb3nLE8VrHS4Uza+5f2WOk8Mz
	+Dj4gcKGm0ZOl1bCRwvXG37WUVLLrW3GNBRdyMblAFiuJikSJJXX00jvhUFx1vrtUTMhRBVYgbqkz
	BofK9zunkwBKhlMymuNblaWgEjo+EeQVAtTRQW8FYA6WKx1aY8OaOqrCkAKLqa7rJOE2qKIAme3+T
	lDwdUvbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qib-00000008KVg-0O2e;
	Tue, 08 Sep 2026 07:58:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qiZ-00000008KVD-2G4s
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 07:58:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=muMECbO96Q17a8vw7+GcxCDFTKIrG/mBOtBi3cQA3vw=; b=aDbGLLE0YdURJK5qQfiCORisZl
	8UOAwXm5fR16WFpaltJeELP6X/KR4WmzUjljXZ6TiNOOLWY7adJFdDZbvSbgo+IrCHGFP1pTuGYos
	fK7SOYBrLNpBooFvWlC/KaRF6Og1OqZu+VZyi1ewz/KRINPNLJRphcvTL4FeZWWciWYHYsqMF/6+7
	4atV63/oF8+LJIxz3ptlI9C1eWt0w0HXS/epWzdq9NMBa/1BL+Fgw0rcueR5yehG0X1lRbJ2/ZKeE
	3T8qGbjUTrBWrYbmEa9We9rG7UtT1EkRnn04PeDFLWVMlhxb+v9gmp5Q0QCynr42EZOmM1R6BrZ0z
	5ZupaKxg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3qiQ-0000000H5Ok-3YfT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 07:58:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B40361476;
	Tue,  8 Sep 2026 00:57:57 -0700 (PDT)
Received: from [10.57.7.202] (unknown [10.57.7.202])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D52773F7B4;
	Tue,  8 Sep 2026 00:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788854281; bh=muMECbO96Q17a8vw7+GcxCDFTKIrG/mBOtBi3cQA3vw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Wot4HfEz7L7Q1yhwW45ocjyTfVDEuEXikMJ5kqcAakvtvEBJPgf7VrrSQ+VR90R66
	 nQTplq4uplypYc4ur9gFPAllc8RxJ18oJh2EbVsjZ0sqmY7En9vasX7BBaIfw72daz
	 tcrAlaVBIZk7x9aCnwAAI39FOlKwEMbyjHI3frww=
Message-ID: <df68a260-c9d0-4f5a-918f-00dd2fb8d6fb@arm.com>
Date: Tue, 8 Sep 2026 09:57:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v9 01/25] mm: Introduce kpkeys
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-hardening@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linu Cherian <linu.cherian@arm.com>,
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Maxwell Bland <mbland@motorola.com>, Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 =?UTF-8?Q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>,
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, x86@kernel.org, Ira Weiny <iweiny@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
 <20260818-kpkeys-v9-1-743ad31b2c8f@arm.com>
 <178877845406.3691569.6930315020588094755.b4-review@b4>
 <3f6e7678-0784-4ac1-acb4-b128887803c5@arm.com> <ap-wnHAwfdX_b39o@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <ap-wnHAwfdX_b39o@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_085808_117027_EFBC7DB6 
X-CRM114-Status: UNSURE (   8.79  )
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

On 08/09/2026 08:52, Mike Rapoport wrote:
> On Mon, Sep 07, 2026 at 05:49:42PM +0200, Kevin Brodsky wrote:
>> On 07/09/2026 12:54, Mike Rapoport wrote:
>>>> +
>>>> +#include <linux/bug.h>
>>>> +#include <linux/cleanup.h>
>>>> +#include <linux/kpkeys_types.h>
>>>> +
>>>> +/**
>>>> + * KPKEYS_GUARD_NOOP() - define a guard type that does nothing
>>> Nit: I'd suggest to drop "define" from all the descriptions, they would
>>> read better without it IMHO.
>> Fair enough, but if we say just "a guard type that does nothing" is it
>> clear that this is a macro defining a type, and not a type itself?
> Then maybe "helper to define", like cleanup.h does?

Sounds good, will do!

- Kevin

