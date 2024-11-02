Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A49E6F07E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 02:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86bN+n8QFqb1ZZUWaCaVZmTx4bBlRj3mA3OnxEr+HLk=; b=Cm57/5e1hUJEZxigeGN3Uq12xu
	shPUY9z+/ahFaQjbsXBmpEdbK9n3xSAJ1zAcIl3ycKPzPCbISxtk5+mQq+O5nlsJmooaR8q7gg0md
	1BtyPcC5kzbo35FB3hcbXFwHV6AoVD3lbNlnyZi5NPSy6Xz0meVOdb8nptES8T1BLkz7bsoInzUFS
	79oG4ZT57a/azg9PmP9cLW/yKFQ0O0a1Pt5BJbPgtp8asm5XK5iM8od7vJBi4Z7xF2GL9n65F+tHe
	C8JaJQXEYPdVVqOmVZkGSsMqgk/53ANdPgixRdMoHaEdbXSxV9C6uPY7yQWo2sPYx6zw3qipkq0pI
	nMtP0eEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t73Xb-00000008rcZ-17ZI;
	Sat, 02 Nov 2024 02:07:03 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t73Vt-00000008rIX-3aDb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 02:05:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730513118; x=1762049118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E1CAt5RimTgnXYsku3rMFPzDboin3+0xmIbr68IVBlA=;
  b=UGWhQ1QnBrZfQTeF79UrzfSTmazBDaEoTaj9l8brsATM+TLlRjJ8Sp82
   kz54d8aQyRwFK63E4bx0Z60LZctGqpKGeTfvGZST4FSljPrNJI1G63RQ2
   9mE4NQMTLtOTQ5hD+JJK+oI5aeYhcRy1j+C3Tma3y2Gy4a0NposJuwleO
   5XDr0f6vAMZJVr8hhDjQ/ZG0OgeC2XpFapgCgB0/qw+H6/A74De+lHX4P
   W/ztap7xnlJqdugJ1GRO7ctzS/VLr5Tefwfr23ELtqOs8BHsMoVP65aaW
   TWDXdaG+1/j2v1Y7Kzey7Uxv6hur1EyOYv6WygcHLNa/zgMvXt7mJ8vCG
   w==;
X-CSE-ConnectionGUID: +HEwImMVQgWugQFn9Jucug==
X-CSE-MsgGUID: RC5go7+jRq69U4jK9crLhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="33127561"
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="33127561"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 19:05:18 -0700
X-CSE-ConnectionGUID: 7m3VjlnsRIOfwM9YALOhQw==
X-CSE-MsgGUID: ZBdLQ1/IS16Qx2F+ZCaIVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="87941900"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Nov 2024 19:05:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t73Vk-000iIj-0J;
	Sat, 02 Nov 2024 02:05:08 +0000
Date: Sat, 2 Nov 2024 10:05:00 +0800
From: kernel test robot <lkp@intel.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>, punit.agrawal@bytedance.com,
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
	kernel@xen0n.name, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, rafael@kernel.org, lenb@kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, sudeep.holla@arm.com,
	guohanjun@huawei.com, prarit@redhat.com, gshan@redhat.com,
	dwmw@amazon.co.uk, Jonathan.Cameron@huawei.com, liuwei09@cestc.cn,
	maobibo@loongson.cn, sunilvl@ventanamicro.com,
	alexghiti@rivosinc.com, haibo1.xu@intel.com,
	jeeheng.sia@starfivetech.com, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ACPI: fix the warning reported by the sparse
Message-ID: <202411020935.IEiVDiTL-lkp@intel.com>
References: <20241031112030.72647-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031112030.72647-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_190517_940008_C6E2E9D5 
X-CRM114-Status: GOOD (  12.71  )
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

Hi Yunhui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge arm64/for-next/core soc/for-next linus/master arm/for-next arm/fixes v6.12-rc5 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunhui-Cui/ACPI-fix-the-warning-reported-by-the-sparse/20241031-192215
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20241031112030.72647-1-cuiyunhui%40bytedance.com
patch subject: [PATCH] ACPI: fix the warning reported by the sparse
config: loongarch-randconfig-r112-20241102 (https://download.01.org/0day-ci/archive/20241102/202411020935.IEiVDiTL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241102/202411020935.IEiVDiTL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411020935.IEiVDiTL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/acpi.c:43:30: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/loongarch/kernel/acpi.c:43:30: sparse:     expected void *
   arch/loongarch/kernel/acpi.c:43:30: sparse:     got void [noderef] __iomem *
   arch/loongarch/kernel/acpi.c:206:40: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'

vim +43 arch/loongarch/kernel/acpi.c

628c3bb40e9a8ce Huacai Chen 2022-05-31  21  
628c3bb40e9a8ce Huacai Chen 2022-05-31  22  int acpi_disabled;
628c3bb40e9a8ce Huacai Chen 2022-05-31  23  EXPORT_SYMBOL(acpi_disabled);
628c3bb40e9a8ce Huacai Chen 2022-05-31  24  int acpi_noirq;
628c3bb40e9a8ce Huacai Chen 2022-05-31  25  int acpi_pci_disabled;
628c3bb40e9a8ce Huacai Chen 2022-05-31  26  EXPORT_SYMBOL(acpi_pci_disabled);
628c3bb40e9a8ce Huacai Chen 2022-05-31  27  int acpi_strict = 1; /* We have no workarounds on LoongArch */
628c3bb40e9a8ce Huacai Chen 2022-05-31 @28  int num_processors;
628c3bb40e9a8ce Huacai Chen 2022-05-31  29  int disabled_cpus;
628c3bb40e9a8ce Huacai Chen 2022-05-31  30  
628c3bb40e9a8ce Huacai Chen 2022-05-31  31  u64 acpi_saved_sp;
628c3bb40e9a8ce Huacai Chen 2022-05-31  32  
628c3bb40e9a8ce Huacai Chen 2022-05-31  33  #define PREFIX			"ACPI: "
628c3bb40e9a8ce Huacai Chen 2022-05-31  34  
4551b30525cf3d2 Huacai Chen 2024-02-06  35  struct acpi_madt_core_pic acpi_core_pic[MAX_CORE_PIC];
f6f0c9a74a48448 Huacai Chen 2023-06-29  36  
4802318a3cea8b3 Yunhui Cui  2024-10-31  37  void __init *__acpi_map_table(unsigned long phys, unsigned long size)
628c3bb40e9a8ce Huacai Chen 2022-05-31  38  {
628c3bb40e9a8ce Huacai Chen 2022-05-31  39  
628c3bb40e9a8ce Huacai Chen 2022-05-31  40  	if (!phys || !size)
628c3bb40e9a8ce Huacai Chen 2022-05-31  41  		return NULL;
628c3bb40e9a8ce Huacai Chen 2022-05-31  42  
628c3bb40e9a8ce Huacai Chen 2022-05-31 @43  	return early_memremap(phys, size);
628c3bb40e9a8ce Huacai Chen 2022-05-31  44  }
628c3bb40e9a8ce Huacai Chen 2022-05-31  45  void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
628c3bb40e9a8ce Huacai Chen 2022-05-31  46  {
628c3bb40e9a8ce Huacai Chen 2022-05-31  47  	if (!map || !size)
628c3bb40e9a8ce Huacai Chen 2022-05-31  48  		return;
628c3bb40e9a8ce Huacai Chen 2022-05-31  49  
628c3bb40e9a8ce Huacai Chen 2022-05-31  50  	early_memunmap(map, size);
628c3bb40e9a8ce Huacai Chen 2022-05-31  51  }
628c3bb40e9a8ce Huacai Chen 2022-05-31  52  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

