Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06131E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 10:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iiWBeXHZLkY5Sdi3xSSwUzjrI4LJeRCqf4WbwMSTaXI=; b=ZgfFAkcq+eMoDKnHYm+8QEC5zF
	EEXrG7QJd+nChhOV3aUy7Z4i9d+iNKiHiHUY/uXZNgnae1JTRWjHsQqXL8UNhNfeMpvFczRHX5/mR
	pZiEfjH+ROXXeq/b6UMq+w1C9zm2UNPo0RA7ryWpZygocDoGYCFuzGcQEp6l4Pl9l43AcqDWq+IIK
	/5vaoZpbILAREsMnFC5GQ2K3JhpI4h1YOXOvG4hrUZt2+Da+tBc8bhsETaqcwaD8cxYbp6h/1MokF
	mkCwmEhwnc2HRBziNqEATMyWEcoAgjpRxkEae1IkMhFRZQTY7pI0fqVjiiHM1sGTbj6Z/lPhgpKtv
	aSh89i+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNr3N-0000000GDNl-2uuy;
	Wed, 18 Dec 2024 10:13:17 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNr1j-0000000GDD8-2zWE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 10:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734516696; x=1766052696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WMvlYVGz3j4rZ5QesExKs8qmH9X91M1RjiYxC53mldU=;
  b=Gb9QOlNMpT3iVKbCaHeRNujoqlJxs6G0erZmGYjDK3Uc+Hca8KjGL4ue
   qLnJhiI1AWPgtMw45wNSM+Xxm5E0IVpia3kVaDtEK/QKhpwMIm7tR1QPu
   2ctkcPwhzZ21sMGoSnMY6aIgFicYp1XN+KSoTxb7SwaPCd5/a2MO8o0tl
   wMQXDj/hLbR/JzxzqkOur5T3K3Gegm1HKcQJVDwL5DtsY4/H9d1ME4oqH
   6wyln794i28Q4Ktv2DmBKO8Ci5p8YvcnyuT4VnPSPubp891O/1xPzUHIK
   a/m/WMnHZ3pSEmmVrI7ojwU1IbpnGfYpI/a+t/zWShkJaQhi0INX/+Z1z
   A==;
X-CSE-ConnectionGUID: n5PwaSskSBObPV09AtPxEg==
X-CSE-MsgGUID: ENV8ImsiT4W0sUDar/nheg==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34877137"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="34877137"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 02:11:35 -0800
X-CSE-ConnectionGUID: 4UF7S7U5R9OyuvYrO/UqyQ==
X-CSE-MsgGUID: eh7KBheZQmaDDgvL3CzGlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="102806771"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Dec 2024 02:11:34 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNr1f-000GHK-0a;
	Wed, 18 Dec 2024 10:11:31 +0000
Date: Wed, 18 Dec 2024 18:10:33 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/nv-next 14/20]
 arch/arm64/include/asm/kvm_nested.h:341:9: error: use of undeclared
 identifier 'FIX_VNCR'
Message-ID: <202412181841.zAqOqCRd-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_021135_761153_0BEC7025 
X-CRM114-Status: UNSURE (   9.98  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv-next
head:   1e2a09d0a43f9c19dae9d321b4a5c840d45fc88b
commit: 0cb2c18e124cd31e01221ed6c60fddc478e3286b [14/20] KVM: arm64: nv: Handle mapping of VNCR_EL2 at EL2
config: arm64-randconfig-001-20241218 (https://download.01.org/0day-ci/archive/20241218/202412181841.zAqOqCRd-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 2dc22615fd46ab2566d0f26d5ba234ab12dc4bf8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412181841.zAqOqCRd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412181841.zAqOqCRd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/smp.c:21:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kernel/smp.c:46:
   In file included from arch/arm64/include/asm/kvm_mmu.h:99:
   In file included from arch/arm64/include/asm/kvm_emulate.h:21:
>> arch/arm64/include/asm/kvm_nested.h:341:9: error: use of undeclared identifier 'FIX_VNCR'
     341 |         return FIX_VNCR - cpu;
         |                ^
   4 warnings and 1 error generated.


vim +/FIX_VNCR +341 arch/arm64/include/asm/kvm_nested.h

   337	
   338	static inline unsigned int vncr_fixmap(unsigned int cpu)
   339	{
   340		BUG_ON(cpu > NR_CPUS);
 > 341		return FIX_VNCR - cpu;
   342	}
   343	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

