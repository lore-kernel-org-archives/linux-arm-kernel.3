Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5942CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 22:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOv1QluCJ9AWegMvz+I4pgFiV+v9V2iBt+/BshZLs3Y=; b=Gn0R1XKSUMed5cL33HKbRPZ7C4
	45b10/z1GLkI23e84lTQ8NeTi/aYoQNUKVT9NACuqAaoyBKPir8hQrVf89hYUGY/tM0nPLDG7pyHR
	6nuXBqre8TatmkCVKVAb302zYBxLcn3flCMRc0v+RlO9Y8bUIwjh+cv5FYxE0CdPHbfXHi2rm/Ewf
	PH0qWPmYJcqhvEHqqIDNLyH76Y+kBhX+xr68v14sJWnjVqSZzWCoUSOm6VW1Bjvw0etapkKSQpeG9
	RKdncLPGCBAH5dqxAE+tS6WNuY/Q0TakjXPGtvewsc2g5qJxSEekT8VuSJgDLiIQ1BCZmObRh92kF
	B9hfjSTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv1DA-00000008ZXF-3QYT;
	Sat, 06 Sep 2025 22:16:45 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv0cF-00000008VmC-2jd3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 21:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757194716; x=1788730716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JXEOk2QzWC9682vZw1qqeUMm3THVRhXOl6giQNpWULQ=;
  b=fHgesfxoSjLYRhXm6NkKuHJKlRJ84GZxQ2UIYBquOUTkmhoYAP3r4s/N
   epboUDPP0sUoZA8bfmqdHrHhcuJS2EhT9eAMcK9t4Omwf/QWmJ/YXPvtB
   bcwNu5kmKYKtBmbNcbNvIdvsnmbSsPIjL/xcJAZg+Z7uNWzj36Iv9XQ2k
   1gs00mLeEbKlAteomdSKuydtkRvF0asFDKlEiodz9pZuryL9quQFFyRsk
   vFOipcYgLXTwn5NcqxWe3RVVqrZKMKlv5AP9VI/TDNl/nH3iEWZz5Zrrs
   7z+A7cyLC8G6GDMZz72igJNHQwexQz7LhSN3/qdDntyGJCBBiQxYQF+jW
   g==;
X-CSE-ConnectionGUID: 3yMEU8gcQ/yI+bDc345pqw==
X-CSE-MsgGUID: u6blzMNWQHm721TKRt9S3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="70932766"
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="70932766"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 14:38:34 -0700
X-CSE-ConnectionGUID: 4tTalin+TdCn15mJRkFqKg==
X-CSE-MsgGUID: RkmorfaWR/aVxvOOQ20rTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="176792664"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Sep 2025 14:38:28 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uv0c6-0001oR-1W;
	Sat, 06 Sep 2025 21:38:26 +0000
Date: Sun, 7 Sep 2025 05:37:52 +0800
From: kernel test robot <lkp@intel.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, jingoohan1@gmail.com, fan.ni@samsung.com,
	quic_wenbyao@quicinc.com, namcao@linutronix.de,
	mayank.rana@oss.qualcomm.com, thippeswamy.havalige@amd.com,
	quic_schintav@quicinc.com, shradha.t@samsung.com,
	inochiama@gmail.com, cassel@kernel.org, kishon@kernel.org,
	18255117159@163.com, rongqianfeng@vivo.com, jirislaby@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com,
	s-vadapalli@ti.com
Subject: Re: [PATCH 11/11] PCI: keystone: Add support to build as a loadable
 module
Message-ID: <202509070521.fQTJ7ygm-lkp@intel.com>
References: <20250903124505.365913-12-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903124505.365913-12-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_143835_739563_B2858D33 
X-CRM114-Status: GOOD (  11.01  )
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

Hi Siddharth,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.17-rc4 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Siddharth-Vadapalli/PCI-Export-pci_get_host_bridge_device-for-use-by-pci-keystone/20250903-204848
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250903124505.365913-12-s-vadapalli%40ti.com
patch subject: [PATCH 11/11] PCI: keystone: Add support to build as a loadable module
config: arm-defconfig (https://download.01.org/0day-ci/archive/20250907/202509070521.fQTJ7ygm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250907/202509070521.fQTJ7ygm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509070521.fQTJ7ygm-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: ks_pcie_host_init+0x594 (section: .text) -> hook_fault_code (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

