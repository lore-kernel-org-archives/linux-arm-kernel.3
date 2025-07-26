Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09383C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 11:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cgh/mzwfNXoMFhKdTEgNvrIDVRpmwYMlBxQ2Gb2eEEE=; b=JbzIeMKrh5xy0+TylbBe1C2gok
	npVC/Y15yk3QtE0XbOQaItDY2WcB9xlVrKYqyBs75k9MIf3kclRqER9hGIIp8TCbKiV7VaYwCQI12
	EDVPEmaa1CZIgFZcuLXZ3KlGk5YZAoEvvs9dtgxms8TPw2dZj5g/08un3WZgeJLPT53ixkacoL82z
	Fk/db1ut+i88Xe4TnSSQbGSvUcInlKQ4EZ9oQrBmk9jh9iT4+VWOAj36e0ar+yQNT68l/Lt8Ba3/t
	zI4EFjrakQsN4EIHWz8n+Ug5EfqOxbfycrgofjbN37KZJyQDdLFqvijQ41U0ot2GI15ACgfKiD1QN
	BZ/wg8nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufcpw-0000000BOXX-01xm;
	Sat, 26 Jul 2025 11:13:08 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufcnV-0000000BONs-0Bis
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 11:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753528237; x=1785064237;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UMCcVYsotsVlB3gqcvdhIUZ3BeNnGlt6WBjFL9Fw4Rk=;
  b=AAukXd9UsIubthaMhwf+TxjLA0aK8RHnZchI4Etlf7BxARssHCRcPuJO
   blAVeZ21YNU6uigIrI6+vvhyzsr9j1sYOfXNPEH9EvECY4C/NJ+CeWdQp
   0XuiTm4WpDJ8vy1owxr/yXv5wSkQ4aAcofht9M7O3Rd5Z8z/mMyyqqQli
   Rzl3RMkbL0Nmuv3mEgeIk34dDSlXSmrwNHJNRBEtogyTEt8wSanmw1l+4
   P7mn6tjdT9nvPrqmmdoWqkKf22CMGsRNUCWdY4qECvpI335hWtxf+0rMN
   rDiho2b2W7k4XQ/h9QBjQSxbEhBOo9ht9LA5RofAPYSxUHjWA6o0kUuQK
   g==;
X-CSE-ConnectionGUID: qyWGKwVhQVC6iKiqxlfIeg==
X-CSE-MsgGUID: 68O1MlWRShi74KOQELFKZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55057931"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55057931"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 04:10:32 -0700
X-CSE-ConnectionGUID: EJG24i+6RqSQiqQjoMiUgw==
X-CSE-MsgGUID: PBODKjChRlO5kTuwV5iXVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="192442294"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Jul 2025 04:10:30 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufcnM-000Lut-0G;
	Sat, 26 Jul 2025 11:10:28 +0000
Date: Sat, 26 Jul 2025 19:10:11 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Shi <yang@os.amperecomputing.com>, ryan.roberts@arm.com,
	will@kernel.org, catalin.marinas@arm.com, akpm@linux-foundation.org,
	Miko.Lenczewski@arm.com, dev.jain@arm.com,
	scott@os.amperecomputing.com, cl@gentwo.org
Cc: oe-kbuild-all@lists.linux.dev, yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: mm: split linear mapping if BBML2 is not
 supported on secondary CPUs
Message-ID: <202507261822.ikaBRFsG-lkp@intel.com>
References: <20250724221216.1998696-5-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724221216.1998696-5-yang@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_041037_126369_CA91C49A 
X-CRM114-Status: GOOD (  13.41  )
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

Hi Yang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250724]
[cannot apply to arm64/for-next/core akpm-mm/mm-everything v6.16-rc7 v6.16-rc6 v6.16-rc5 linus/master v6.16-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yang-Shi/arm64-Enable-permission-change-on-arm64-kernel-block-mappings/20250725-061534
base:   next-20250724
patch link:    https://lore.kernel.org/r/20250724221216.1998696-5-yang%40os.amperecomputing.com
patch subject: [PATCH 4/4] arm64: mm: split linear mapping if BBML2 is not supported on secondary CPUs
config: arm64-randconfig-001-20250726 (https://download.01.org/0day-ci/archive/20250726/202507261822.ikaBRFsG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261822.ikaBRFsG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261822.ikaBRFsG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/mm/mmu.o: in function `linear_map_split_to_ptes':
   mmu.c:(.init.text+0x23c): relocation truncated to fit: R_AARCH64_LDST32_ABS_LO12_NC against symbol `repaint_done' defined in .data section in arch/arm64/mm/proc.o
>> aarch64-linux-ld: mmu.c:(.init.text+0x23c): warning: one possible cause of this error is that the symbol is being referenced in the indicated code as if it had a larger alignment than was declared where it was defined

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

