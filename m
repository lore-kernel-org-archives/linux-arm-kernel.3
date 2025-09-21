Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30AACAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 06:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kSZ8f26xwP7W9tIwfcRu6xgyhwwb76kKsTMsYf3aGXI=; b=nPJKSmAlclLaxISLmuuPpbVquA
	fGxBHhhAUqI5krJpQjFSQh82h04OsqUDKgdXaXYP6GYoqwbwXi3xXGqLPY+br5scxQKpbWCl8T2Hy
	dZAevTN4xL+6DYoPpBgPG0PhqxrCd1SVpdCKLL7PeLj5WCCjWL6TO3FZ+5Vx4QZkRw/4saGJTx/aD
	+uuQueCMVEs0WhgUVvsD/RX8sjv/RL+gyF7TmW1ehOzLpK5IbtIYS31zq+CWWm0VEvruSI0ElVVgU
	7cphxhZS8TC7ZpmK6z1t7d5mttZsK4yuTwCfUZ4E6FzKzXhYsz+qlmGgzl/UVBFQ1GnwqOM2oKQqK
	28UIAKYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0DCz-00000006kx9-1fYL;
	Sun, 21 Sep 2025 06:06:01 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0DCw-00000006kvr-1D7b;
	Sun, 21 Sep 2025 06:05:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758434758; x=1789970758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8ctr9bJIScthH2cD/1XQ1vcsW7U4Lt1MN5qWna68e2c=;
  b=IYRQusscBlZsCXn5DqtivMP4hI7cU7Tb8Wp2Bl5BHZpKhaqJH6M5WMhZ
   yPZxFfavZQlzFOXnH3VOvkO7xIGEwcB7Axl+ioOPcZdC6tYjqel4AzB/7
   +KK7beEqueYQe5yho6JXsmZUmwa2Luz35JoJPLYFi9h0n7jZjr87TSiXS
   tbBFhLe7QjUR61HcwgKi67vFFLn3aVN+/GqHyS6FGM2+e6Bwkq9g2U7yZ
   RZEWZqKlvgZIvYBwCAF707sPutdf4XHKFjocO44wARqiR6Bi1m1/ZuoI7
   19bSCZIV6ZxqucqaVGDWcrUAzs5s77LB+cm3EsWhyVxhcGZaMQNPizH01
   A==;
X-CSE-ConnectionGUID: Si/Tqig6RbiAgGW0wYzADQ==
X-CSE-MsgGUID: YWQdOxgSQwGTrimau11wrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="59769789"
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="59769789"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 23:05:54 -0700
X-CSE-ConnectionGUID: Bx5ZTH74RSeyEBDMZHWvWw==
X-CSE-MsgGUID: rnp+F5cfT3GT6/klwfGJDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="199916867"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 Sep 2025 23:05:51 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0DCn-0000Ur-0u;
	Sun, 21 Sep 2025 06:05:49 +0000
Date: Sun, 21 Sep 2025 14:05:06 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Cc: oe-kbuild-all@lists.linux.dev, Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [PATCH] PCI: mediatek: add support for Airoha AN7583 SoC
Message-ID: <202509211315.51HZNnRI-lkp@intel.com>
References: <20250920114341.17818-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920114341.17818-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_230558_370213_E2A836CC 
X-CRM114-Status: GOOD (  12.22  )
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

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.17-rc6 next-20250919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/PCI-mediatek-add-support-for-Airoha-AN7583-SoC/20250920-194637
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250920114341.17818-1-ansuelsmth%40gmail.com
patch subject: [PATCH] PCI: mediatek: add support for Airoha AN7583 SoC
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20250921/202509211315.51HZNnRI-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509211315.51HZNnRI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509211315.51HZNnRI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pci/controller/pcie-mediatek.c:163 struct member 'skip_pcie_rstb' not described in 'mtk_pcie_soc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

