Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80630CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 18:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3FRlLZpzWAQ+ivPb+ne/d7YqvU6Y39kZKobx/lLyB8=; b=J0xzmLi3xecplo0N751bAntVJ1
	PoO/0+tcG9TG5+gNbkf9oUIqEngfb8CKsY9bchmgJSYbv2CM3RiCj/p6Q8Ogd+cjjnU3Yi7Lmbvoh
	pwc0TI+01QaIpiCpdtJkluRZsNHtb6XtvGhcno9wvv/79gpJc/5FAusl6cy2/aciORHaodMgEtHtC
	/jNyB7frBDhXq/Q+igbDUx9J17xNT0E95usTaMCWx+h6i8K7XFD6K4ng0snd1Y1WOrIafngmBDtub
	KZgPUNCCzebnhWGmOTpXJy3ucYt+YrKIUm3CqZ819HM3LkV4/EsdJgP9hre/3meA/iPRPC4rYeXH6
	OIZWSabg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRwXY-00000002r9u-2AVu;
	Tue, 26 May 2026 18:30:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRwXV-00000002r9R-36o2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 18:30:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08D0F2936;
	Tue, 26 May 2026 11:29:59 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3E1B3F7B4;
	Tue, 26 May 2026 11:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779820204; bh=6vvHGcSi157N+oB7lexlZ4A6+hiMatNMYIGzRqF2drI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K/npMv4i2qW9g/9TU4YdmxeRtolv5aI+yYuxqrzCkqOAO0TfYmwr/9lGtagn5lDHy
	 kUb6WYJsmvaZyqjf/yYSt0EfWt0QBpXZkHpmhEWeMUAzJZg2fHl899jOyYpLoDya1L
	 fdhLirTeIBc/bG1S5sbIByG52ch1pvgV5xHx5sq8=
Date: Tue, 26 May 2026 19:29:58 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v12 02/15] kasan: arm64: x86: Make special tags arch
 specific
Message-ID: <ahXmpvVwV4wWLFxT@arm.com>
References: <cover.1774872838.git.m.wieczorretman@pm.me>
 <6080be7964fc726327186d5bf7979e16ddd282bb.1774872838.git.m.wieczorretman@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6080be7964fc726327186d5bf7979e16ddd282bb.1774872838.git.m.wieczorretman@pm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_113005_822872_8B5E1507 
X-CRM114-Status: GOOD (  17.79  )
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

On Mon, Mar 30, 2026 at 02:33:16PM +0000, Maciej Wieczor-Retman wrote:
> From: Samuel Holland <samuel.holland@sifive.com>
> 
> KASAN's tag-based mode defines multiple special tag values. They're
> reserved for:
> - Native kernel value. On arm64 it's 0xFF and it causes an early return
>   in the tag checking function.
> - Invalid value. 0xFE marks an area as freed / unallocated. It's also
>   the value that is used to initialize regions of shadow memory.
> - Min and max values. 0xFD is the highest value that can be randomly
>   generated for a new tag. 0 is the minimal value with the exception of
>   arm64's hardware mode where it is equal to 0xF0.
> 
> Metadata macro is also defined:
> - Tag width equal to 8.
> 
> Tag-based mode on x86 is going to use 4 bit wide tags so all the above
> values need to be changed accordingly.
> 
> Make tag width and native kernel tag arch specific for x86 and arm64.
> 
> Base the invalid tag value and the max value on the native kernel tag
> since they follow the same pattern on both mentioned architectures.
> 
> Also generalize KASAN_SHADOW_INIT and 0xff used in various
> page_kasan_tag* helpers.
> 
> Give KASAN_TAG_MIN the default value of zero, and move the special value
> for hw_tags arm64 to its arch specific kasan-tags.h.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> Co-developed-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> Acked-by: Will Deacon <will@kernel.org> (for the arm part)
> Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
> Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

