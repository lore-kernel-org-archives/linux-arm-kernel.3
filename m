Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C217C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5zh8+YEqIL7Da8jRMe/ZtD44KnS8L2RNXnBst2nX6o=; b=annjNk7h1KQyOoPPiRv5mFHlwY
	MfQYZkFzvYNaOfEZvYorke1pZjb0wcZmOcFqBebg2GTRdYZqGXDdVotiEYNX+TC5xpzJlepD9FCqr
	IiUG+suWCYiD05irmwDpAdpio8wL7oCXecf+g+9bPV7s4f5EfZNiRqVlY495kcK6eRnjmdz6laRs8
	ndjPIsmYVlNOtAipStTrm6HWWtTcktX667nb28lYEIZxWGokos7k3aZIbLJI6jo7NDmjzMr7r1Xrp
	KJKTye/EUs6pxsLwE9KhVJQPC4t/79IWJo4C/CaPiDCc4daFyFjgcI0mBGZKrK98gdISpfWgzwrod
	6L3wmtFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3biy-00000007FIo-1HJx;
	Mon, 07 Sep 2026 15:57:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3biw-00000007FIO-0r6c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:57:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50E381476;
	Mon,  7 Sep 2026 08:57:29 -0700 (PDT)
Received: from [10.57.6.26] (unknown [10.57.6.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 378513F7B4;
	Mon,  7 Sep 2026 08:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788796653; bh=w5zh8+YEqIL7Da8jRMe/ZtD44KnS8L2RNXnBst2nX6o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AaM3yh0xOgzbvXYmz93UziW0pjOZ1xdk/WQ3/O6JBZpUCfdcXFozelYjzp+orLKxK
	 z43acjBXfj4jU2BjMV5jUqWkdSRU1RZzLKUxqilJT1vHvX1ZsaA+m73yq9rjzrXGTK
	 Fl+At6aoBW9W2QS1w2vo0WFra64rnVfprPZ3MDoY=
Message-ID: <1293ff87-51ad-456b-b973-26f29d0beaff@arm.com>
Date: Mon, 7 Sep 2026 17:57:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v9 02/25] set_memory: Introduce set_memory_pkey() stub
To: Linu Cherian <linu.cherian@arm.com>
Cc: linux-hardening@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Maxwell Bland <mbland@motorola.com>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
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
 <20260818-kpkeys-v9-2-743ad31b2c8f@arm.com>
 <apbiQtt-cAlLkDqV@a079125.arm.com>
 <66270f42-931f-4043-b24c-edcc4cad74b8@arm.com>
 <ap694bZb0crWvLo3@a079125.arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <ap694bZb0crWvLo3@a079125.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_085734_289862_ED1A4486 
X-CRM114-Status: GOOD (  10.94  )
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

On 07/09/2026 15:36, Linu Cherian wrote:
>>>> Introduce a new function, set_memory_pkey(), which sets the
>>>> protection key (pkey) of pages in the specified linear mapping
>>>> range. Architectures implementing kernel pkeys (kpkeys) must
>>>> provide a suitable implementation; an empty stub is added as
>>> Could you make it explicit here why we are restricting this only
>>> to the linear mapping range ? Would be helpful to add the reasoning
>>> in the commit message and as comments.
>>>
>>> Essentially we are also making a assumption here that there are no
>>> aliases to the linear map ?
>> We're not assuming this, this function is called on pages that are also
>> mapped as part of the kernel image. But indeed it ignores aliases,
>> unlike e.g. set_memory_ro(). Really its name is wrong as discussed below.
> Just trying to understand, does it also imply that we dont have use cases that has aliases.

We don't need to change the pkey of mappings outside the direct map for
protecting page tables, at least not yet. They are almost always
accessed via the direct map, but as Ard's recent series [1] shows, there
are exceptions.

- Kevin

[1]
https://lore.kernel.org/all/20260827164409.3421848-6-ardb+git@google.com/

