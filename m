Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61033D1488B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 14:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+fo4oqqy3XvCbNxaVIYZbVpnfs/PKyazstkZfcDtaA=; b=JPK5WnBXZh5L3Qtk4lVJd9gjGl
	6G9072U9rSQlbskKrrhkM0dYsLbpYOHuvWF1MZTzOj1u5JFeuzBwSH+VbvXNireNVI2z3/VNR7sTl
	9b++6Sbs7z2znmQsHeZQJEZoaOIdEc3kgUpysqf/N9CXiKlmCof8B48B6/gKDcRIQXe8Q0KQbZySk
	dupUiPcBrxpnYaPB50jpDMLC8ovy8Fr90gjq6fQXeel6QQWWadx/OwktYSLBu3Bfb6zlX2mx0kRxT
	epvryaSNTeIAhHRzxC03chvGfpO+Cj0xBWPXoJJgHnaYhzmep93NubO+L3p7yd6zv7E8lRSMIkXuA
	BhApxl1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdr4J-0000000HMJP-0iPT;
	Thu, 08 Jan 2026 14:32:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdr4G-0000000HMIe-116B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 14:32:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F45042B02;
	Thu,  8 Jan 2026 14:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44FF6C116C6;
	Thu,  8 Jan 2026 14:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767882770;
	bh=byixFr826bNoUVfEfgOc5fuYDNsV3ya0YDlGYcfLm10=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=j0rcOouUnJyejWkw7PDWaIAj/5BtvE4hHQdaZmaVtE/hZtTZbFy76PldBmv4P627j
	 H+ztR6CF6o64VyyjgrSzH7nCBbDkF6r1z7L6MyPI2f7XxMJvJ8cixlvP2ZyzeUwYXT
	 6jnTsNFv2BhH4ogRxYQBjHyzigb4Whsv5cc0gbfTEWDSoxlnBvbpnLyMtwMkwChxfE
	 JixMwVX/P2D3FzKpmEMYXQN7CnqUAQEBSMa+XIMQU+F25Chjo0nC0PTV0Jx8fYxrmW
	 443vFAl1eEVCvRBFkylhCddVemPhe8rXnZ5ZE/pSyQ8eG1phLLG5wDP+XTz/qPpRcS
	 HkcT+AYac7lmg==
Message-ID: <9ea6abb3-4b5d-4da5-9dcf-21ec520d1bca@kernel.org>
Date: Thu, 8 Jan 2026 15:32:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arch/*: increase lowmem size to avoid highmem use
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>,
 Andreas Larsson <andreas@gaisler.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthew Wilcox <willy@infradead.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Michal Simek <monstr@monstr.eu>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Nishanth Menon <nm@ti.com>, Lucas Stach <l.stach@pengutronix.de>
References: <20251219161559.556737-1-arnd@kernel.org>
 <20251219161559.556737-2-arnd@kernel.org>
 <6089e76b-80aa-4254-af70-12b96d115a2e@kernel.org>
Content-Language: fr-FR
In-Reply-To: <6089e76b-80aa-4254-af70-12b96d115a2e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_063252_325000_E284018A 
X-CRM114-Status: GOOD (  43.16  )
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



Le 24/12/2025 à 12:35, Christophe Leroy (CS GROUP) a écrit :
> 
> 
> Le 19/12/2025 à 17:15, Arnd Bergmann a écrit :
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> Most of the common 32-bit architectures (x86, arm, powerpc) all use the
>> default virtual memory layout that was already in place for i386 systems
>> in the 1990s, using exactly 3GiB of user TASK_SIZE, with the upper 1GiB
>> of addresses split between (at most 896MiB) lowmem and vmalloc.
>>
>> Linux-2.3 introduced CONFIG_HIGHMEM for large x86 server machines that
>> had 4GiB of RAM or more, with the VMSPLIT_3G/2G/1G options added in
>> v2.6.16 for machines that had one or two gigabytes of memory but wanted
>> to avoid the overhead from managing highmem. Over time, similar options
>> appeared on other 32-bit architectures.
>>
>> Twenty years later, it makes sense to reconsider the default settings,
>> as the tradeoffs have changed a bit:
>>
>>   - Configurations with more than 2GiB have become extremely rare,
>>     as any users with large memory have moved on to 64-bit systems.
>>     There were only ever a few Laptop models in this category: Apple
>>     Powerbook G4 (2005), Macbook (2006), IBM Thinkpad X60 (2006), Arm
>>     Chromebooks based on Exynos 5800 (2014), Tegra K1 (2014) and RK3288
>>     (2015), and manufacturer support for all of these has ended in 2020
>>     or (much) earlier.
>>     Embedded systems with more than 2GiB use additional SoCs of a
>>     similar vintage: Intel Atom Z5xx (2008), Freescale QorIQ (2008),
>>     Marvell Armada XP (2010), Freescale i.MX6Q (2011), LSI Axxia (2013),
>>     TI Keystone2 (2014), Renesas RZ/G1M (2015). Most boards based on
>>     these have stopped receiving kernel upgrades. Newer 32-bit chips
>>     only support smaller memory configurations, though in particular the
>>     i.MX6Q and Keystone2 families have expected support cycles past 2035.
>>     While 32-bit server installations used to support even larger memory,
>>     none of those seem to still be used in production on any 
>> architecture.
>>
>>   - While general-purpose distributes for 32-bit targets were common,
>>     it was rather risky to change the CONFIG_VMSPLIT setting because
>>     there is always a possibility of running into device driver bugs or
>>     applications that need a large virtual memory size. Presumably
>>     a lot of these issues have been resolved now, so most setups should
>>     be fine using a custom vmsplit instead of highmem now.
>>
>>   - As fewer users test highmem, the expectation is that it will
>>     increasingly break in the future, so getting users to change the
>>     vmsplit means that even if there is a bug to fix initially,
>>     it improves the situation in the long run.
>>
>>   - Highmem will ultimately need to be removed, at least for the page
>>     cache and most other code using it today. In a previous discussion, I
>>     had suggested doing this as early as 2029, but based on the 
>> discussions
>>     since ELC, the plan is now to leave highmem-enabled page cache as an
>>     option until at least 2029, at which point remaining users will have
>>     the choice between no longer updating kernels or using a 
>> combination of
>>     a custom vmsplit and zram/zswap. Changing the defaults now should 
>> both
>>     speed up the highmem deprecation and make it less painful for users.
>>
>>   - The most VM space intensive applications tend to be web browsers,
>>     specifcally Chrome/ChromeOS and Firefox. Both have now stopped
>>     providing binary updates, but Firefox can still be built from source.
>>     Testing various combinations on Debian/armhf, I found that Firefox 
>> 140
>>     can still show complex websites with VMSPLIT_2G_OPT with and without
>>     HIGHMEM, though it failed for me both with the small address space
>>     of VMSPLIT_1G and the small lowmem of VMSPLIT_3G_OPT when HIGHMEM
>>     is disabled.
>>     This is likely to get worse with future versions, so embedded users
>>     may still be forced to migrate to specialized browsers like WPE 
>> Webkit
>>     when HIGHMEM pagecache is finally removed.
>>
>> Based on the above observations and the discussion at the kernel summit,
>> change the defaults to the most appropriate values: use 1GiB of lowmem on
>> non-highmem configurations, and either 2GiB or 1.75GiB of lowmem on 
>> highmem
>> builds, depending on what is available on the architecture.  As ARM_LPAE
>> and X86_PAE builds both require a gigabyte-aligned vmsplit, those get
>> to use VMSPLIT_2G. The result is that the majority of previous highmem
>> users now only need lowmem. For platform specific defconfig files that
>> are known to only support up to 1GiB of RAM, drop the CONFIG_HIGHMEM line
>> as well as a simplification.
>>
>> On PowerPC and Microblaze, the options have somewhat different names but
>> should have the same effect. MIPS and Xtensa cannot support a larger
>> than 512MB of lowmem but are limited to small DDR2 memory in most
>> implementations, with MT7621 being a notable exception. ARC and C-Sky
>> could support a configurable vmsplit in theory, but it's not clear
>> if anyone still cares.
>> SPARC is currently limited to 192MB of lowmem and should get patched
>> to behave either like arm/x86 or powerpc/microblaze to support 2GiB
>> of lowmem.
>>
>> There are likely going to be regressions from the changed defaults,
>> in particular when hitting previously hidden device driver bugs
>> that fail to set the correct DMA mask, or from applications that
>> need a large virtual address space.
>> Ideally the in-kernel problems should all be fixable, but the previous
>> behavior is still selectable as a fallback with CONFIG_EXPERT=y
>>
>> Cc: Russell King <linux@armlinux.org.uk>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: Borislav Petkov <bp@alien8.de>
>> Cc: Dave Hansen <dave.hansen@linux.intel.com>
>> Cc: x86@kernel.org
>> Cc: "H. Peter Anvin" <hpa@zytor.com>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: Michal Simek <monstr@monstr.eu>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: David Hildenbrand <david@kernel.org>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
>> Cc: Vlastimil Babka <vbabka@suse.cz>
>> Cc: Mike Rapoport <rppt@kernel.org>
>> Cc: Suren Baghdasaryan <surenb@google.com>
>> Cc: Michal Hocko <mhocko@suse.com>
>> Cc: Matthew Wilcox <willy@infradead.org>
>> Cc: linux-mm@kvack.org
>> Cc: Richard Weinberger <richard@nod.at>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Nishanth Menon <nm@ti.com>
>> Cc: Andreas Larsson <andreas@gaisler.com>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>   arch/arm/Kconfig                            |  5 ++++-
>>   arch/arm/configs/aspeed_g5_defconfig        |  1 -
>>   arch/arm/configs/dove_defconfig             |  2 --
>>   arch/arm/configs/mv78xx0_defconfig          |  2 --
>>   arch/arm/configs/u8500_defconfig            |  1 -
>>   arch/arm/configs/vt8500_v6_v7_defconfig     |  3 ---
>>   arch/arm/mach-omap2/Kconfig                 |  1 -
>>   arch/microblaze/Kconfig                     |  9 ++++++---
>>   arch/microblaze/configs/mmu_defconfig       |  1 -
>>   arch/powerpc/Kconfig                        | 17 +++++++++++------
>>   arch/powerpc/configs/44x/akebono_defconfig  |  1 -
>>   arch/powerpc/configs/85xx/ksi8560_defconfig |  1 -
>>   arch/powerpc/configs/85xx/stx_gp3_defconfig |  1 -
> 
> Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> 
> Be aware that it will likely trivialy conflict with https:// 
> lore.kernel.org/linuxppc- 
> dev/6a2575420770d075cd090b5a316730a2ffafdee4.1766574657.git.chleroy@kernel.org/
> 
> Another point is that it will increase the overall memory usage when 
> people activate KASAN as KASAN reserves 1/8 of RAM for lowmem memory. I 
> think we need to look at the impact on available virtual memory, because 
> 1/8 of 2G is 256M which is the size of the last segment shared by KASAN 
> shadow mem and vmalloc.

After testing I see two problems.

First one is on powerpc e500, increasing CONFIG_LOWMEM_SIZE is not 
enough, CONFIG_LOWMEM_CAM_NUM also need to be increased, otherwise 
additional lowmem is not mapped because e500 linux port is not designed 
to handle additional lowmem with standard pages.

For some details see commit 49e3d8ea6248 ("powerpc/fsl_booke: Enable 
STRICT_KERNEL_RWX")

Second one is with KASAN, as anticipated above in my first response. 
With a 2G+ kernel memory space, the KASAN shadow mem is 256M+, which 
means we get an overlap between lowmem space [0x70000000-0xefffffff] and 
KASAN shadow mem [0xee000000-0xffffffff].
So when KASAN is enabled, either change CONFIG_PAGE_OFFSET and 
CONFIG_TASK_SIZE to 0x60000000 instead of 0x70000000, or reduce 
CONFIG_LOWMEM_SIZE from 0x80000000 to 0x70000000.

Christophe


