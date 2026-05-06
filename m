Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66327CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPed1cEalE8p9ynIcjerRfBMest/+qZpKOCHipzUr1A=; b=QPCXzfmeTLa/67i5FDD4xbeJWa
	GGYtqwu3nTpD05+1Q2MXgaMdHLD4FoX6KDPLWNV2YWX6+JO6iwWkEshDNiHd0qS0dIvqAR6WMi5K5
	2qCtceQsy1Kw/2xzuDz9X1qsNK8f44KYPLZyfN8gE4nMKKYyfES5jwwpPuiECjBRDPYpRuAYGbGMa
	0uN5LeEKVrU1trXG0DJoUPQrlMF8uBgF0lFllBHwIBTtgTa3tNsEh5aP3Eneazb5HG8R3/MhoYMWA
	/tcELS27g31OOAapdT7suNPMSpOV4WNzHZZraDutOt2kZiPYfHV7KSdYcVhPbg6dQITq3ppejHK/K
	bytbCGbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeC1-00000001KYg-20i2;
	Wed, 06 May 2026 15:29:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeC0-00000001KXv-2Fa2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 15:29:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB5FC1A00;
	Wed,  6 May 2026 08:29:37 -0700 (PDT)
Received: from [10.57.35.178] (unknown [10.57.35.178])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0ECE23F7B4;
	Wed,  6 May 2026 08:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778081383; bh=ip9HLEiG0rLbNmSPtdtn1g8pMwO4gElNKtnSHYmseRU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uFirFSB72AiOef9KIv+LoT9vVvtJCtTeQjSPmbbHWBwooyjT8eiFl6hli9r8u2BPS
	 gHyC5cl7Wkl3o2/jxclgGiXD3j4kM3UhGaulOOhnlK8I+2AmysP0zN+JdbUzX+Vc9a
	 hoBjF8BQMLMCsZkysXmV9xqpxgEHR0MXfBg+hjU8=
Message-ID: <77d63e89-04be-4b76-b360-dc45badd1a78@arm.com>
Date: Wed, 6 May 2026 17:29:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v7 00/24] pkeys-based page table hardening
To: linux-hardening@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Andy Lutomirski <luto@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Ira Weiny
 <ira.weiny@intel.com>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Maxwell Bland <mbland@motorola.com>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
 Yang Shi <yang@os.amperecomputing.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org,
 Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>
References: <20260505-kpkeys-v7-0-20c0bdd97197@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260505-kpkeys-v7-0-20c0bdd97197@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_082944_661332_F555CB6D 
X-CRM114-Status: GOOD (  11.89  )
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

On 05/05/2026 18:05, Kevin Brodsky wrote:
> Kevin Brodsky (23):
>       mm: Introduce kpkeys
>       set_memory: Introduce set_memory_pkey() stub
>       arm64: mm: Enable overlays for all EL1 indirect permissions
>       arm64: Introduce por_elx_set_pkey_perms() helper
>       arm64: Implement asm/kpkeys.h using POE
>       arm64: set_memory: Implement set_memory_pkey()
>       arm64: Context-switch POR_EL1
>       arm64: Enable kpkeys
>       memblock: Move INIT_MEMBLOCK_* macros to header
>       mm: kpkeys: Introduce kpkeys_hardened_pgtables feature
>       mm: kpkeys: Protect regular page tables
>       mm: kpkeys: Introduce early page table allocator
>       mm: kpkeys: Protect vmemmap page tables
>       mm: kpkeys: Introduce hook for protecting static page tables
>       arm64: kpkeys: Implement arch_supports_kpkeys_early()
>       arm64: kpkeys: Support KPKEYS_CTX_PGTABLES
>       arm64: kpkeys: Ensure the linear map can be modified
>       arm64: kpkeys: Protect early page tables
>       arm64: kpkeys: Protect init_pg_dir
>       arm64: kpkeys: Guard page table writes
>       arm64: kpkeys: Batch KPKEYS_CTX_PGTABLES switches
>       arm64: kpkeys: Enable kpkeys_hardened_pgtables support
>       mm: Add basic tests for kpkeys_hardened_pgtables
>
> Yeoreum Yun (1):
>       arm64: Initialize POR_EL1 register on cpu_resume()
>
>  arch/arm64/Kconfig                        |   2 +
>  arch/arm64/include/asm/cpufeature.h       |  12 ++
>  arch/arm64/include/asm/kpkeys.h           |  76 ++++++++++++
>  arch/arm64/include/asm/pgtable-prot.h     |  16 +--
>  arch/arm64/include/asm/pgtable.h          |  66 +++++++++-
>  arch/arm64/include/asm/por.h              |  11 ++
>  arch/arm64/include/asm/processor.h        |   2 +
>  arch/arm64/include/asm/set_memory.h       |   4 +
>  arch/arm64/kernel/cpufeature.c            |   5 +-
>  arch/arm64/kernel/process.c               |   9 ++
>  arch/arm64/kernel/sleep.S                 |  12 ++
>  arch/arm64/mm/fault.c                     |   2 +
>  arch/arm64/mm/init.c                      |   1 +
>  arch/arm64/mm/mmu.c                       |  48 +++++---
>  arch/arm64/mm/pageattr.c                  |  29 ++++-
>  include/asm-generic/kpkeys.h              |  21 ++++
>  include/linux/kpkeys.h                    | 177 ++++++++++++++++++++++++++
>  include/linux/memblock.h                  |  11 ++
>  include/linux/mm.h                        |  14 ++-
>  include/linux/set_memory.h                |   7 ++
>  mm/Kconfig                                |   5 +
>  mm/Makefile                               |   2 +
>  mm/kpkeys_hardened_pgtables.c             | 180 +++++++++++++++++++++++++++
>  mm/memblock.c                             |  11 --
>  mm/sparse-vmemmap.c                       |  29 +++--
>  mm/tests/kpkeys_hardened_pgtables_kunit.c | 198 ++++++++++++++++++++++++++++++
>  security/Kconfig.hardening                |  24 ++++
>  27 files changed, 923 insertions(+), 51 deletions(-)

Sashiko has found quite a few issues, some of which are potentially
concerning. I'll address them in RFC v8 - no need to point me to them
until then.

- Kevin

