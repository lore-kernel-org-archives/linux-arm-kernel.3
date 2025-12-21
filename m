Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DE2E66886
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 23:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XeWhsJZTu3rAVX4z+hOGn0Su1q8DDCWu3t4UovQVl8g=; b=4WNAN8NC94lLD3akueKKahAcbA
	iPBxdLs/EO6ReyGHcH8yOUiGh87acoUwkI1eKuqNgc/SF03tyH1gP9HO7y/4VvspjJxdh1d3D55jn
	BEDJ8F0wsTdLZhJnUin66C6e/lvG23iuENSexrr7XLRV6ecQCExdrwMVcmYicdR2Xns/fbeG6Y+8l
	AQfwnkVaBPMot7NBRAUmk6n6lFMTIUhcSOdn1i0Iqq0R18nAjSoKYtn+cdhQVfeys2l0PFf94uBuw
	GuKCxTrWyiJml0KTatnKPaHmkH3tDs1SqxcUXHbmbIqZlNFdXPCZVymDNHRuaFy/HsKSdCDLu1A7b
	8X5U4/nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXT2A-0000000CslS-2xna;
	Sun, 21 Dec 2025 23:40:18 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXT27-0000000Csko-471T
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 23:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766360416; x=1797896416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e9eJeejx8g4//rFgeHHEHuKIrp9YsEoXUX37jxFDU1k=;
  b=EtoB3VKigX4h5QOms+D3vGjm/XnxhL441GwP1J7jC0rs5KRDyW9gN72k
   TqvUbUSSfVrk/ex0e2bKK2Bo3ik6uqknEZyCchgowpZRLz4IKiwBGn4xa
   riM3UBECYF5uFr96FXYmcqHDL3n6XkXMbtKmr5N7C9MIzkt45gHqEPrHZ
   J8ZuqtPGeaHAILPfkPU/NiqKx/GCmJ7wZnL2vHc+rQrtjrCrbkH2Pl2DF
   8Nbmt7rFbCOmI0wnFiq//P8mWW3EtyKrq2jMRIcuDfCG857POxPDQ8v69
   F122pj2TUNqUBoAEdW6vrx2QSmU4ugQVH+f7bqYkXsu6iRTeP0wL8SaDB
   Q==;
X-CSE-ConnectionGUID: zkU6vW5KRFSKNd/4IuDWFQ==
X-CSE-MsgGUID: 3Tz7M2WaRTip0f49lWUTdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="85805553"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="85805553"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 15:40:14 -0800
X-CSE-ConnectionGUID: IAayTUEtQcmpvCzIfBzPsw==
X-CSE-MsgGUID: tZ7Ss/XWR3ibjJDzWPED2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="230040405"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 21 Dec 2025 15:40:09 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXT1z-000000005H6-24HZ;
	Sun, 21 Dec 2025 23:40:07 +0000
Date: Mon, 22 Dec 2025 00:39:10 +0100
From: kernel test robot <lkp@intel.com>
To: Ahmed Tiba <ahmed.tiba@arm.com>, linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, tony.luck@intel.com, bp@alien8.de,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, rafael@kernel.org,
	linux-doc@vger.kernel.org, Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com, ahmed.tiba@arm.com
Subject: Re: [PATCH 03/12] ras: add estatus vendor handling and processing
Message-ID: <202512220010.sdcS5LYV-lkp@intel.com>
References: <20251217112845.1814119-4-ahmed.tiba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217112845.1814119-4-ahmed.tiba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_154016_061110_81ECEFB9 
X-CRM114-Status: GOOD (  17.43  )
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

Hi Ahmed,

kernel test robot noticed the following build errors:

[auto build test ERROR on efi/next]
[also build test ERROR on rafael-pm/linux-next rafael-pm/bleeding-edge robh/for-next arm64/for-next/core linus/master v6.19-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ahmed-Tiba/ras-add-estatus-core-interfaces/20251217-200718
base:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
patch link:    https://lore.kernel.org/r/20251217112845.1814119-4-ahmed.tiba%40arm.com
patch subject: [PATCH 03/12] ras: add estatus vendor handling and processing
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251222/202512220010.sdcS5LYV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220010.sdcS5LYV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220010.sdcS5LYV-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/efi/estatus.c: In function 'estatus_source_fixmap':
>> drivers/firmware/efi/estatus.c:126:24: error: 'FIX_HOLE' undeclared (first use in this function)
     126 |                 return FIX_HOLE;
         |                        ^~~~~~~~
   drivers/firmware/efi/estatus.c:126:24: note: each undeclared identifier is reported only once for each function it appears in
   drivers/firmware/efi/estatus.c: In function 'estatus_handle_arm_hw_error':
   drivers/firmware/efi/estatus.c:656:9: error: too few arguments to function 'log_arm_hw_error'
     656 |         log_arm_hw_error(err);
         |         ^~~~~~~~~~~~~~~~
   In file included from drivers/firmware/efi/estatus.c:23:
   include/linux/ras.h:27:6: note: declared here
      27 | void log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev);
         |      ^~~~~~~~~~~~~~~~
   In file included from drivers/firmware/efi/estatus.c:30:
   drivers/firmware/efi/estatus.c: In function 'estatus_do_proc':
   include/linux/estatus.h:231:71: warning: passing argument 2 of 'estatus_section_iter_next' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     231 |              ((_section) = estatus_section_iter_next(&__estatus_iter, (_estatus))); \
         |                                                                       ^~~~~~~~~~
   drivers/firmware/efi/estatus.c:817:9: note: in expansion of macro 'estatus_for_each_section'
     817 |         estatus_for_each_section(estatus, gdata) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/estatus.h:208:51: note: expected 'struct acpi_hest_generic_status *' but argument is of type 'const struct acpi_hest_generic_status *'
     208 |                           estatus_generic_status *estatus)
         |                                                   ^
   drivers/firmware/efi/estatus.c: At top level:
   drivers/firmware/efi/estatus.c:947:13: warning: 'estatus_print_queued_estatus' defined but not used [-Wunused-function]
     947 | static void estatus_print_queued_estatus(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/efi/estatus.c:118:12: warning: 'estatus_panic_timeout' defined but not used [-Wunused-variable]
     118 | static int estatus_panic_timeout __read_mostly = 30;
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/FIX_HOLE +126 drivers/firmware/efi/estatus.c

   122	
   123	static enum fixed_addresses estatus_source_fixmap(struct estatus_source *source)
   124	{
   125		if (WARN_ON_ONCE(!source->fixmap_idx))
 > 126			return FIX_HOLE;
   127	
   128		return source->fixmap_idx;
   129	}
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

