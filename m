Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757DEC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlilMlpGicltaebBQ8I/GC+iE4frt6Y1f/gAHvySSDQ=; b=WY2swn2scOpIw6wN+Fp3B9D0PN
	wToWAeAkqELgzls17LMQJbaGiHQoM3/jvOOXzJEqMcnuygoNcDd9+zVa9EciLuXME8DbVtqhj/saH
	keKV5A21vuNPRmmg4IOdX9qRaps6AMGi590EisH8Z6i+e3iyfW1BB+IwPdmgODNMMRFqxp4wnVmfa
	inFD/XAWO7jPS9ymHctTjqpBkQE4lrVXL8Z9xIVl0hoOk6Ip1De9KkF8K96KaI7Mb1EEyUo4ptx8C
	jgJ5iovImrPfiYR/055wx/hDhJdoHjXireCSJDdgbbwlG43F4V7T3ywfW2WFhOFjaUHBw8O2g52rV
	MepnrDAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bcJ-00000007EXj-2N6j;
	Mon, 07 Sep 2026 15:50:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bcH-00000007EX1-0fTx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:50:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F17421476;
	Mon,  7 Sep 2026 08:50:35 -0700 (PDT)
Received: from [10.57.6.26] (unknown [10.57.6.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84DEE3F7B4;
	Mon,  7 Sep 2026 08:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788796239; bh=SlilMlpGicltaebBQ8I/GC+iE4frt6Y1f/gAHvySSDQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iqQG57G5PDVhyw+vfLok9WQkjMSwIU3sN60egn04GlddymBAdaexzT4zstzK5PxY0
	 28Bg4YQ63K5zQ+At/Qb/iDsJW7qSK16xoEp8sCDBbDw6BZlhdLqg23swtYz/GX344K
	 +AGPNAn1CqfVXdKotmnH1oNQu3GUWshCTEXPjLlQ=
Message-ID: <37bfd819-2bd4-4893-9d58-48c7e10880a3@arm.com>
Date: Mon, 7 Sep 2026 17:50:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v9 11/25] mm: kpkeys: Introduce
 kpkeys_hardened_pgtables feature
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
 <20260818-kpkeys-v9-11-743ad31b2c8f@arm.com>
 <178877845406.3691569.11239630051799000768.b4-review@b4>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <178877845406.3691569.11239630051799000768.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_085041_276586_71A57A21 
X-CRM114-Status: GOOD (  15.33  )
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

On 07/09/2026 12:54, Mike Rapoport wrote:
> Hi Kevin,
>
>> kpkeys_hardened_pgtables is a hardening feature based on kpkeys. It
>> aims to prevent the corruption of page tables by: 1. mapping all
>> page table pages, both kernel and user, with a privileged pkey
>> (KPKEYS_PKEY_PGTABLES), and 2. granting write access to that pkey
>> only when running at in a privileged kpkeys context
>> (KPKEYS_CTX_PGTABLES). This patch introduces basic infrastructure;
>> the implementation of both aspects will follow.
>>
>> The feature is exposed as CONFIG_KPKEYS_HARDENED_PGTABLES; it
>> requires explicit architecture opt-in by selecting
>> ARCH_HAS_KPKEYS_HARDENED_PGTABLES, since much of the page table
>> handling is arch-specific.
>>
>> Because this feature relies on kpkeys being supported and modifies
>> attributes of the linear map, it must be inactive on boot.
>> kpkeys_hardened_pgtables_init() enables it by toggling a static key;
>> this function must be called by supported architectures in
>> mem_init(), before any call to pagetable_alloc() is made.
> Presuming other architecures will use kpkeys framework it's better to
> call kpkeys_hardened_pgtables_init() from mm_core_init() rather than
> stick into each arch's mem_init().

Ah yes I was wondering whether it was acceptable to stick another call
directly in mm_core_init(), but I suppose it doesn't hurt. I can move
the call to kpkeys_hardened_pgtables_init() just before
memblock_free_all() and leave mem_init() alone.

Thanks for chipping in!

- Kevin

