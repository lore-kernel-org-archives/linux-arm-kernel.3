Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A3BCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 03:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0uoozYQ7yBj4B72akkRVwdk+si+d8C43SW4cV/Ruek=; b=LAGg+Nk1be/9tsVf1hB0rVdyDp
	M4z1H/HFXufQHXMT0cJQ3qJ++z7kfahXOU9wiasM75A8ojqxDLekMEWyY/IWEPPSD8lhojOS0yFpE
	d0DrpFaq34trFEL6ZijVPsNuu3kBGQmqdKgaE2YMPw4fwO+mYEEBOSTq0TuNnWtVb7vmDFDZXVlFp
	iywru63MSyEMxjCdN5bvojIeClwPMbyKDpT7zRNudHjNwG2Wz08gJk7EV80Qq+LYALereXPMWxBxq
	USs4Ie8UoVkPNpZrg+mZ6feFfJgxTW8iFpMNEnScc9cOuxEsFLUJJc23ZLG3VqnesVRqBz25OeKPl
	kryrEIyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDa30-0000000F93V-2zul;
	Tue, 28 Oct 2025 03:06:58 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDa2y-0000000F92w-0rh6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 03:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761620816; x=1793156816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xf1gp9ZwAj290BdaHTZHHGg0zAqBchLXVLReMOjpbR8=;
  b=C1zh5/HPphXhCeFuXE5y94EWP64a0BbHD13T/WlKm0WrgBPkg+9qGWgt
   JedcNdJ6lWz6FsUwkfohoi7Hf7jw7M9KYeH3fqz/PdjD6dIiwh6PpgqxQ
   o+FKWIu04LxWAZpVqJcwzNYYIXsPyynaZOQ6DMDxCKCC2i3+3AuaaJAjD
   Ak9nBodnOjK5BiXElH/0OVyhih6I53t+yTAQ9n0aec+kez8zjIJwxncGv
   UQIN4JyVbduhPeq+msmov9NgDyB29q7DXzNhOO1fzyg4MS2sF0NpxlQsl
   FUD6CD4ZSgcYYq5R4tGrv6ulmyTLPMtBHirbiuqi28PhCFMmhBfVbUMFm
   Q==;
X-CSE-ConnectionGUID: qyuisKqSSLSi50q/QVB45Q==
X-CSE-MsgGUID: hkbJSrLTQ/6wp6jIlf6CWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89181923"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="89181923"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 20:06:54 -0700
X-CSE-ConnectionGUID: BFsbtOy6TMuyeIeXkN5SNw==
X-CSE-MsgGUID: 2W/BbVdhSP2jj11I25GD8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="184851330"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 27 Oct 2025 20:06:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDa2o-000IgT-1C;
	Tue, 28 Oct 2025 03:06:46 +0000
Date: Tue, 28 Oct 2025 11:06:37 +0800
From: kernel test robot <lkp@intel.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, jingoohan1@gmail.com, quic_wenbyao@quicinc.com,
	inochiama@gmail.com, mayank.rana@oss.qualcomm.com,
	thippeswamy.havalige@amd.com, shradha.t@samsung.com,
	cassel@kernel.org, kishon@kernel.org, sergio.paracuellos@gmail.com,
	18255117159@163.com, rongqianfeng@vivo.com, jirislaby@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com, s-vadapalli@ti.com
Subject: Re: [PATCH v4 4/4] PCI: keystone: Add support to build as a loadable
 module
Message-ID: <202510281008.jw19XuyP-lkp@intel.com>
References: <20251022095724.997218-5-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022095724.997218-5-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_200656_279313_D1FA6048 
X-CRM114-Status: GOOD (  10.48  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v6.18-rc3 next-20251027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Siddharth-Vadapalli/PCI-Export-pci_get_host_bridge_device-for-use-by-pci-keystone/20251022-180213
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20251022095724.997218-5-s-vadapalli%40ti.com
patch subject: [PATCH v4 4/4] PCI: keystone: Add support to build as a loadable module
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20251028/202510281008.jw19XuyP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510281008.jw19XuyP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510281008.jw19XuyP-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes/test-kprobes.o
>> ERROR: modpost: "hook_fault_code" [drivers/pci/controller/dwc/pci-keystone.ko] undefined!
ERROR: modpost: "__ffsdi2" [drivers/spi/spi-amlogic-spifc-a4.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

