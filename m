Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6E1C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 22:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4z0UilpwOeP3VuXbpZflhcYtGlNIMIy++fBOMiI2QU=; b=P9rrpwVmE98Dk+L8JP1gNJzI/f
	vweUNKbW8W5BPVr3Mj0IiBgVbcAxT93sEwYh7+9oGhU1XqeVk+y2L3ZAq0VjFtj3th+UBq1Dhe98N
	+oC7ZhM5AnQlLatdWQlTxP2sIlxmgWoTeZ6cVpSsI2jS1cXcMaufs9N4yYigiDRkrymzMGqbUn7B6
	BvYIIPbWPKseE4rKGGmm7fOP3uTBKRmDurwAe7g4Ky8oeO/haBWaWfiQvYkYTkeMEWiVxgFblYqBJ
	dyPdbmuj76VavF70YmSFtDHY6xEhWQta8zlrHkZocywbm4dO8AqZp4OjyK4u8XdKXsQ0JD1Av3+d4
	qoL9pMdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uboBS-00000006KVu-0pZ4;
	Tue, 15 Jul 2025 22:31:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubo92-00000006KS4-1zj8
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Jul 2025 22:29:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=P4z0UilpwOeP3VuXbpZflhcYtGlNIMIy++fBOMiI2QU=; b=CqhXKbDyZLp69pducX7NkbAmJc
	xJH/sO0zJr6bchyDMS6xUlmt8waJy3VNmSNE84pdvWxPeWjh7Yiyhs0qrzeFhxQ38l9Kog2OnObZi
	UDOqad8irTy6deJ1pW7XvHHGiixUJ7KVWS42B2HP3vf2pTS1M5gjlLGy9O+GrwEwRbbV5J3GN3Nar
	hIV7YDjVXV01wqbmdUmKfDYVoFL0HRjE9okjltCVLk8DYEy7Acdv2cQ/IE2AHe+3gi5kHEBqNPcP5
	2aSymDuGw8/9WUJOeKL4ZeAcTUNZWMZPVE59cqyFc7s/FzFGG8/Vm1TWTSEW+/uesjpjxgFm+3qYb
	iqN/A5BQ==;
Received: from mgamail.intel.com ([198.175.65.20])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubo8x-0000000A2C1-2BMT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 22:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752618540; x=1784154540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G7+Ffs9WIWMcBynLHK1Sql++GiExP0QoYD+fUsrCxEU=;
  b=UWm78EAxBJc18gyknzHEZXtcE6WovhYJnAyvKEI32Yo692DOLSd4cwB/
   Bb5blCYIZm3Bv1ns5p2QTIzuGzCQj64I77LsyOf7Gtt89fXxmlZQw4wsc
   pJc0q62It6CJ6yRNPG/MhCsEh1+Dp6lpKTmPIWWweYCPnWfmItd0Zt/0t
   F7R/UwBRrXTiy3TMuzFvoItcV1LstYD3YWFWTzoMxR1aXWDj+XeT/RJXb
   SXiQUBVTxt+xIk7ueUh3HQ9hyh2cEgNaytM4Io6HFl2Ax9rKKRbzI9euQ
   jOgrfA8tX7u544kjRSNeOi1Fe34Do+c98CCLpAjkBrHqXjOKd0YDiox2y
   A==;
X-CSE-ConnectionGUID: 1HPISSpdT8CrAZCH23MS8Q==
X-CSE-MsgGUID: 3ZkB5NOVQouZCr8qe2cUtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54562894"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="54562894"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 15:28:54 -0700
X-CSE-ConnectionGUID: 43scBKa2Q+GlwkjRdyCeQg==
X-CSE-MsgGUID: nj7Vi7qCQFKk7YaTE34tRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="181023525"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Jul 2025 15:28:49 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubo8k-000Bbf-0v;
	Tue, 15 Jul 2025 22:28:46 +0000
Date: Wed, 16 Jul 2025 06:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jacky Chou <jacky_chou@aspeedtech.com>, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
	p.zabel@pengutronix.de, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 09/10] PCI: aspeed: Add ASPEED PCIe RC driver
Message-ID: <202507160642.yzIrPY1i-lkp@intel.com>
References: <20250715034320.2553837-10-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715034320.2553837-10-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_232900_689937_917719B0 
X-CRM114-Status: GOOD (  12.27  )
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

Hi Jacky,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus robh/for-next linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v6.16-rc6 next-20250715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacky-Chou/dt-bindings-soc-aspeed-Add-ASPEED-PCIe-Config-support/20250715-114814
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250715034320.2553837-10-jacky_chou%40aspeedtech.com
patch subject: [PATCH v2 09/10] PCI: aspeed: Add ASPEED PCIe RC driver
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250716/202507160642.yzIrPY1i-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507160642.yzIrPY1i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507160642.yzIrPY1i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pci/controller/pcie-aspeed.c:179 struct member 'pciephy' not described in 'aspeed_pcie_port'
   Warning: drivers/pci/controller/pcie-aspeed.c:179 Excess struct member 'phy' description in 'aspeed_pcie_port'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

