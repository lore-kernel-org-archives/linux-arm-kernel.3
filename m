Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECEAC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 02:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MYoA7x/TGYnCcSogsRBZUFgMr3GZ3ofL0Sn5+JwKlGY=; b=pc2CjRBTaikM/BKgAJefDr3txN
	sygFCAcEa1X1guGQ9kzAI8LJRX9O+6Da9aX5c+rqh+kymtQiqWlRdyuCJcLR/afqi1kZb2AoE/3Hf
	u8IxyOIWEmLy5QIyOY5a+08pubCDuptoBx+n0BIU9uRu58kcJ8QMYUgR3VlSQqcfn2vrjgqvd3tju
	RIyfbs2SW7XZqqvGUvp0nzrQVpAVurldYFKGKwUlr3AZQueTm9d6ue03211CYjE1z4FhPfBrF2lGG
	DgMKHKNJ8IK3BGb2XJWNIyVPcPgwvicbZuJu/PrUZFWuQED8HSSElJ8LZ9XrAlXP+VFvFNPsNi6PN
	27nOxaSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGU59-00000006Zfi-0ano;
	Sun, 18 May 2025 02:48:55 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGU38-00000006ZYC-0H0z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 02:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747536410; x=1779072410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w7c2t93JZ1TooToTf7LE5fdMH3d0OmKKh09LPS4m1vY=;
  b=O3PuLxKmK89vKtq2y5kY3x2HTxoyLtqtXAs5dkxfCq2eMxBqPVfhhpgO
   /+BYC+bn2wuKwj4wIS0RguRZvHIQbbeo4Uu+hZAN4kXDE4Xx1YyiWidii
   zT/GkaH+yqHR9smiX4FGomnE+aR+iYdG3dw5q/7MaJ38DRpuV9DHeep+o
   wSzZhNeyEXvFs77yRr32OYh07LlBYEb00tSa8H1bz/XK80+4CcVslzXTo
   ZKq0/9I9dAtk+BEOGK1D133Imb9hs1zg+AkKYCzorxDxZp46yJBf4HYlR
   FxALQuUoBVs+VK/hxB1C76cYZDCHhDyidwtS7t+VSpt9T374xcVCO8YgB
   g==;
X-CSE-ConnectionGUID: 2MuVMKrwRyWULF3ODsZStA==
X-CSE-MsgGUID: he3g2EcASVmBnvN1MRHuaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="52095703"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="52095703"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 19:46:47 -0700
X-CSE-ConnectionGUID: NxbY921FSLOVOHsguJ50XA==
X-CSE-MsgGUID: TL+2Kuo2QgCXwcMO2XqsJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="139443050"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 May 2025 19:46:45 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGU31-000KZj-0W;
	Sun, 18 May 2025 02:46:43 +0000
Date: Sun, 18 May 2025 10:46:41 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:pci/xgene-fixes 3/7]
 drivers/pci/controller/pci-xgene-msi.c:101:10: error: call to undeclared
 function 'FIELD_PREP'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202505181028.k3ALoXkL-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_194650_116449_61C5B0AE 
X-CRM114-Status: GOOD (  16.81  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git pci/xgene-fixes
head:   c6980399484bf12298b068419d522a39387696ad
commit: d05755164e0488102f7c1ca8333a0c4bb20099a2 [3/7] PCI: xgene: Sanitise MSI allocation and affinity setting
config: um-randconfig-r071-20250518 (https://download.01.org/0day-ci/archive/20250518/202505181028.k3ALoXkL-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505181028.k3ALoXkL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505181028.k3ALoXkL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/controller/pci-xgene-msi.c:10:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     549 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/pci/controller/pci-xgene-msi.c:10:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/pci/controller/pci-xgene-msi.c:10:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:601:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     601 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:616:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     616 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:631:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     631 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:724:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     724 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:737:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     737 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:750:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     750 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:764:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     764 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:778:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:792:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     792 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/pci/controller/pci-xgene-msi.c:101:10: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     101 |                              (FIELD_PREP(MSI_GROUP_MASK, msi_grp) |
         |                               ^
   drivers/pci/controller/pci-xgene-msi.c:109:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     109 |                              FIELD_PREP(MSI_INTR_MASK, msi_grp));
         |                              ^
>> drivers/pci/controller/pci-xgene-msi.c:114:11: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     114 |         return ((FIELD_GET(BIT(3), grp_idx) << 7)       |
         |                  ^
   drivers/pci/controller/pci-xgene-msi.c:126:9: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     126 |         return FIELD_GET(GENMASK(6, 4), data->hwirq);
         |                ^
   drivers/pci/controller/pci-xgene-msi.c:131:9: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     131 |         return FIELD_GET(BIT(7), data->hwirq) << 3 | cpu;
         |                ^
   drivers/pci/controller/pci-xgene-msi.c:140:10: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     140 |         return (FIELD_PREP(MSI_GROUP_MASK, irq_cpu_to_frame(cpu, data)) |
         |                 ^
   12 warnings and 6 errors generated.


vim +/FIELD_PREP +101 drivers/pci/controller/pci-xgene-msi.c

    43	
    44	/*
    45	 * X-Gene v1 has 16 frames of MSI termination registers MSInIRx, where n is
    46	 * frame number (0..15), x is index of registers in each frame (0..7).  Each
    47	 * 32b register is at the beginning of a 64kB region, each frame occupying
    48	 * 512kB (and the whole thing 8MB of PA space).
    49	 *
    50	 * Each register supports 16 MSI vectors (0..15) to generate interrupts.
    51	 *
    52	 * Additionally, each MSI termination frame has 1 MSIINTn register (n is
    53	 * 0..15) to indicate the MSI pending status caused by 1 of its 8 index
    54	 * registers. Each 32b register is at the beginning of a 64kB region (and
    55	 * overall occupying an extra 1MB).
    56	 *
    57	 * There is one GIC IRQ assigned for each MSI termination frame, 16 in
    58	 * total.
    59	 *
    60	 * The register layout is as follows:
    61	 * MSI0IR0			base_addr
    62	 * MSI0IR1			base_addr +  0x10000
    63	 * ...				...
    64	 * MSI0IR6			base_addr +  0x60000
    65	 * MSI0IR7			base_addr +  0x70000
    66	 * MSI1IR0			base_addr +  0x80000
    67	 * MSI1IR1			base_addr +  0x90000
    68	 * ...				...
    69	 * MSI1IR7			base_addr +  0xF0000
    70	 * MSI2IR0			base_addr + 0x100000
    71	 * ...				...
    72	 * MSIFIR0			base_addr + 0x780000
    73	 * MSIFIR1			base_addr + 0x790000
    74	 * ...				...
    75	 * MSIFIR7			base_addr + 0x7F0000
    76	 * MSIINT0			base_addr + 0x800000
    77	 * MSIINT1			base_addr + 0x810000
    78	 * ...				...
    79	 * MSIINTF			base_addr + 0x8F0000
    80	 *
    81	 * In order to allow an MSI to be moved from one CPU to another without
    82	 * having to repaint both the address and the data (which cannot be done
    83	 * atomically), we statically partitions the MSI frames between CPUs. Given
    84	 * that XGene-1 has 8 CPUs, each CPU gets two frames assigned to it
    85	 *
    86	 * We adopt the convention that when an MSI is moved, it is configured to
    87	 * target the same register number in the new frame. This reserves a given
    88	 * MSI across all CPUs, and reduces the MSI capacity from 2048 to 256.
    89	 *
    90	 * Effectively, this amounts to:
    91	 * - hwirq[7]::cpu[2:0] is the target frame number
    92	 * - hwirq[6:4] is the register index in any given frame
    93	 * - hwirq[3:0] is the MSI data
    94	 */
    95	
    96	/* MSInIRx read helper */
    97	static u32 xgene_msi_ir_read(struct xgene_msi *msi,
    98					    u32 msi_grp, u32 msir_idx)
    99	{
   100		return readl_relaxed(msi->msi_regs + MSI_IR0 +
 > 101				     (FIELD_PREP(MSI_GROUP_MASK, msi_grp) |
   102				      FIELD_PREP(MSI_INDEX_MASK, msir_idx)));
   103	}
   104	
   105	/* MSIINTn read helper */
   106	static u32 xgene_msi_int_read(struct xgene_msi *msi, u32 msi_grp)
   107	{
   108		return readl_relaxed(msi->msi_regs + MSI_INT0 +
   109				     FIELD_PREP(MSI_INTR_MASK, msi_grp));
   110	}
   111	
   112	static irq_hw_number_t compute_hwirq(u32 grp_idx, u32 msir_idx, u32 intr_idx)
   113	{
 > 114		return ((FIELD_GET(BIT(3), grp_idx) << 7)	|
   115			(msir_idx << 4)				|
   116			intr_idx);
   117	}
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

