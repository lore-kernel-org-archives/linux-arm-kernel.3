Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFADF4611B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 13:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7TNlMcHJEqX0XG6NyAL6GgjVp8eMQKTfhrmkvsySwM=; b=LXCuDXpPM3rOXWopF/kmdmAtUz
	+bZIbky8KiR6EPhhpIQE+LvxSTop+JhtXR+k7F8YIH/Jmvs6nY14MPoosfQpgcXlyYwvE0exVNT43
	IkKeNJCBLhF0+TdHQLXblioCd2S2cdIBPrDOXiGxrNmg3eO/v7V7d6dvffkAQwuP1lyKttj4hiemU
	U6pLaS+HmV88M5wPJ1FAkU8fQek+lW0xGY+ihaoU2DckZ83LhzUefQhARS+24txq08HvzOXkfZE13
	4Yc2X90pyq1QhagEAchAFsg+4cjCX/yjYWINJnSsTccYfY7Ay5QDwT4M6gNQsmWBD2ySu5rJaV+DV
	Oz/1U/mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fiB-0000000Gs2f-2HIN;
	Mon, 23 Mar 2026 13:52:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fiA-0000000Gs2W-1OXt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 13:52:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC4AE600C4;
	Mon, 23 Mar 2026 13:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD45BC4CEF7;
	Mon, 23 Mar 2026 13:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774273973;
	bh=7jiJnoPiC7mzd34UzA0mbtNzWXYVJzwZa57Ijvymt78=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jiXSiBK1QppgTl6/vLB9H2UV9uQ3VzRFjylVLGRov5URWxPGikF8RYzBU8sU81r1j
	 e5/aesdfmYjWK28UOhtXO1QjriCaLqRmHYovbKGwUtwFrLAoaWfiwaYikXJ2G6s5hu
	 x3THcGuYBrqjdziWwQx7E17Ze/NtNvByZh8XoyaTibSuRMZjzlQSHzrDTKdz2CDmRQ
	 70+wqO3Go3/1cc0ySV4+WofNkpJhabURRMUj7jvvBJGDXRx53GQO71K7+GoWXZARdx
	 t3cOeG/YoymTlcbBK7d6fJgLghKpFgBblkfGGHk+2iO1UI7iNz58EV6IVsdQagVHkY
	 eGUXY/Rh7Gbyg==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v3 2/3] swiotlb: dma: its: Enforce host page-size
 alignment for shared buffers
In-Reply-To: <202603092320.JgtItJg0-lkp@intel.com>
References: <20260309102625.2315725-3-aneesh.kumar@kernel.org>
 <202603092320.JgtItJg0-lkp@intel.com>
Date: Mon, 23 Mar 2026 19:22:44 +0530
Message-ID: <yq5ah5q6odoz.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

kernel test robot <lkp@intel.com> writes:

> Hi Aneesh,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on arm64/for-next/core]
> [also build test ERROR on tip/irq/core arm/for-next arm/fixes kvmarm/next soc/for-next linus/master v7.0-rc3 next-20260306]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Aneesh-Kumar-K-V-Arm/dma-direct-swiotlb-handle-swiotlb-alloc-free-outside-__dma_direct_alloc_pages/20260309-182834
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
> patch link:    https://lore.kernel.org/r/20260309102625.2315725-3-aneesh.kumar%40kernel.org
> patch subject: [PATCH v3 2/3] swiotlb: dma: its: Enforce host page-size alignment for shared buffers
> config: i386-randconfig-012-20260309 (https://download.01.org/0day-ci/archive/20260309/202603092320.JgtItJg0-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603092320.JgtItJg0-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603092320.JgtItJg0-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from arch/x86/kernel/asm-offsets.c:9:
>    In file included from include/linux/crypto.h:15:
>    In file included from include/linux/completion.h:12:
>    In file included from include/linux/swait.h:7:
>    In file included from include/linux/spinlock.h:59:
>    In file included from include/linux/irqflags.h:18:
>    In file included from arch/x86/include/asm/irqflags.h:5:
>    In file included from arch/x86/include/asm/processor-flags.h:6:
>>> include/linux/mem_encrypt.h:60:9: error: use of undeclared identifier 'PAGE_SIZE'
>       60 |         return PAGE_SIZE;
>          |                ^
>>> include/linux/mem_encrypt.h:66:9: error: call to undeclared function 'ALIGN'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       66 |         return ALIGN(size, mem_decrypt_granule_size());
>          |                ^
>

Fixed this by including

modified   include/linux/mem_encrypt.h
@@ -11,6 +11,8 @@
 #define __MEM_ENCRYPT_H__
 
 #ifndef __ASSEMBLY__
+#include <linux/align.h>
+#include <vdso/page.h>
 
 #ifdef CONFIG_ARCH_HAS_MEM_ENCRYPT
 


Will include this in the next patch update.

The other alternative is to switch that to a macro 

modified   include/linux/mem_encrypt.h
@@ -55,16 +55,10 @@
 #endif
 
 #ifndef mem_decrypt_granule_size
-static inline size_t mem_decrypt_granule_size(void)
-{
-	return PAGE_SIZE;
-}
+#define mem_decrypt_granule_size()     PAGE_SIZE
 #endif
 
-static inline size_t mem_decrypt_align(size_t size)
-{
-	return ALIGN(size, mem_decrypt_granule_size());
-}
+#define mem_decrypt_align(size)        ALIGN((size), mem_decrypt_granule_size())
 

