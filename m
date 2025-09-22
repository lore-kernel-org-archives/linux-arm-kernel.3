Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C358BCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 04:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ouRHS3eeYe7ktGggPLPm5Pb5SjM6PRMXN4idtPLQk/4=; b=k3hyboXnVwLEsHbUmgTCC4PCfy
	mPhw5biCm06ylGE36xqySg3bd2TNNYx4RWOL2Nugvz6BbqU/GGsGT8P0KqAi53iDnwSq1Q4Pp7L1t
	f3rmjxajjWDeCi9euDFwaTSDVi2KkN/LhIAtqD1ChoWTILICBiWfHWAmoUP24FyYlK6TlXDWdj5vt
	u5y7lnhT50l1G+nKYtn3L4Ygcd28v8gHfTZ87kH1ecKaDUWuKQD8IGxrVms9Pjdi1Z5CVjPs2SUE3
	rNG2iiSP6zGe1kmfgtITlEgZsqxXBIM2T55UBjeYY3EEKb/YJJkpmQvD755WEPbCid+UWum6PGY1A
	i0DYKLLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Xpx-00000008kuJ-1n6y;
	Mon, 22 Sep 2025 04:07:37 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Xpt-00000008ktM-3D6x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 04:07:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758514053; x=1790050053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G2V1IzI07Lo+cAvCBkq1btsiFZLerly8BvX9QTJo0j4=;
  b=J4+eny5E3PXpjWrLrB5THvvvICH3DGyyg9Y3v8oXyZxOY5TifSGnqBmV
   iC2HRWKc8wGZ9udtVAF/pbexA9RZRM69mo1w0tfiRezpKjkFlx7qfAK/d
   BxJJ1BXpNq4lpXbXtOelnnVGDG5tgGePfwqi0QPFERFiFyO+AS4l0cnpy
   To2ne2pGdkiJ6SbV4qW68jAsBpqbMOi0BPUJxONrRVA7Yws82pr4F64RV
   NKHR9RYeMVbJEY6c5XHm4aLpiI7lsiZue1XzztmAwBvxHLqesRnwDJGzh
   gl30CHR8TTnz/d4N63n+ZC3Wv/IQlNYP4v7l6v8zl5/vi6evTcLQfOsZ+
   Q==;
X-CSE-ConnectionGUID: lnmSUpJIRyKM5dAnggJLrg==
X-CSE-MsgGUID: v90hrOAZQaqIM/9pV6ccTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="59809006"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="59809006"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 21:07:33 -0700
X-CSE-ConnectionGUID: zqpl9hnCTuyexJ28zpHKKg==
X-CSE-MsgGUID: yfvJgNhsSFqEUX/ZvNjTxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="176811092"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Sep 2025 21:07:28 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0Xpl-0001J3-1y;
	Mon, 22 Sep 2025 04:07:25 +0000
Date: Mon, 22 Sep 2025 12:07:21 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>, chester62515@gmail.com,
	mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, s32@nxp.com,
	bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com, linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, cassel@kernel.org
Subject: Re: [PATCH 2/3 v2] PCI: s32g: Add initial PCIe support (RC)
Message-ID: <202509221101.JBhoJaEX-lkp@intel.com>
References: <20250919155821.95334-3-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919155821.95334-3-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_210733_823953_A6BDEA61 
X-CRM114-Status: GOOD (  11.54  )
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

Hi Vincent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.17-rc7 next-20250919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Guittot/PCI-s32g-Add-initial-PCIe-support-RC/20250920-005919
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250919155821.95334-3-vincent.guittot%40linaro.org
patch subject: [PATCH 2/3 v2] PCI: s32g: Add initial PCIe support (RC)
config: openrisc-randconfig-r132-20250922 (https://download.01.org/0day-ci/archive/20250922/202509221101.JBhoJaEX-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509221101.JBhoJaEX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509221101.JBhoJaEX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/dwc/pcie-s32g.c:133:20: sparse: sparse: symbol 's32g_pcie_ops' was not declared. Should it be static?
   drivers/pci/controller/dwc/pcie-s32g.c: note: in included file (through drivers/pci/controller/dwc/pcie-designware.h):
>> drivers/pci/controller/dwc/../../pci.h:632:17: sparse: sparse: cast from restricted pci_channel_state_t
>> drivers/pci/controller/dwc/../../pci.h:632:17: sparse: sparse: cast to restricted pci_channel_state_t
   drivers/pci/controller/dwc/../../pci.h:635:23: sparse: sparse: cast from restricted pci_channel_state_t
   drivers/pci/controller/dwc/../../pci.h:635:23: sparse: sparse: cast from restricted pci_channel_state_t
   drivers/pci/controller/dwc/../../pci.h:635:23: sparse: sparse: cast to restricted pci_channel_state_t
   drivers/pci/controller/dwc/../../pci.h:639:23: sparse: sparse: cast from restricted pci_channel_state_t
   drivers/pci/controller/dwc/../../pci.h:639:23: sparse: sparse: cast from restricted pci_channel_state_t
   drivers/pci/controller/dwc/../../pci.h:639:23: sparse: sparse: cast to restricted pci_channel_state_t

vim +/s32g_pcie_ops +133 drivers/pci/controller/dwc/pcie-s32g.c

   132	
 > 133	struct dw_pcie_ops s32g_pcie_ops = {
   134		.get_ltssm = s32g_pcie_get_ltssm,
   135		.link_up = s32g_pcie_link_up,
   136		.start_link = s32g_pcie_start_link,
   137		.stop_link = s32g_pcie_stop_link,
   138	};
   139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

