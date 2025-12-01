Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8B1D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 09:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zhri/WaHFa2qtxgCVf5jXmZptcXeLm7jc4tOelOK/Uw=; b=pEaTY3ufifuG93H+SH69Vx33s5
	EN1dAB1ny5MEagpyq6htNOaatlv4AZveclNS+7HmIREen5fQvyzqI0p3p76+HMbAiMsZtuaRUb7w9
	eQpQDYN0R2EeaDGmfiAkghcmHQVI97IKIx2qnnkK2b4LJgjM7yA/p8Vl0lXhlccXypbi+EDu4JTFE
	n8W167FRec0qhPxv6Yvw+0mCZtwLvyvh4LW5b7+Oll50JRhU05LJTjcQJuK+e44cCu27a1nY41N2O
	JMe8l0lTanRXjh4fdSoDUtrZUqszAjqJnCbva4dZRWLyFYnVWSUfCrwYguUwnOF4dA2eTzuY/ruP0
	DyaMqF7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ04a-00000003Cfz-0867;
	Mon, 01 Dec 2025 09:19:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ04W-00000003Cf8-3W3I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 09:19:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25C10497;
	Mon,  1 Dec 2025 01:19:42 -0800 (PST)
Received: from [10.57.43.170] (unknown [10.57.43.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC6FF3F73B;
	Mon,  1 Dec 2025 01:19:43 -0800 (PST)
Message-ID: <c1226873-c790-49bd-876d-4539f95b4caf@arm.com>
Date: Mon, 1 Dec 2025 10:19:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 11/18] mm: Introduce kpkeys_hardened_pgtables
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski
 <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Ira Weiny <ira.weiny@intel.com>,
 Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>,
 Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Maxwell Bland <mbland@motorola.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org
References: <20250815085512.2182322-1-kevin.brodsky@arm.com>
 <20250815085512.2182322-12-kevin.brodsky@arm.com>
 <aSnRVJwuRWPmPxqN@e129823.arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <aSnRVJwuRWPmPxqN@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_011952_916365_210EF77C 
X-CRM114-Status: UNSURE (   8.87  )
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

On 28/11/2025 17:44, Yeoreum Yun wrote:
>> +int kpkeys_protect_pgtable_memory(struct folio *folio)
>> +{
>> +	unsigned long addr = (unsigned long)folio_address(folio);
> I think it might need to use untagged_addr()?

I've never seen untagged_addr() used on folio_address()/page_address()
(see for instance set_direct_map_valid_noflush() and
__kernel_map_pages() in arch/arm64/mm/pageattr.c).

It does seem that page_to_virt() sets the tag if KASAN is enabled
though... I'm not sure what to think, is there a wider issue here? We
might just be lucky and the sort of pages that these functions are
called on don't have their KASAN tag set.

- Kevin

