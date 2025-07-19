Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441BCC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 08:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nOVatDFiRlh5sqXFbOnFLUTQiQD1tlN3s2KcV26RJI=; b=10Nl2DHcNdfj0Vt3Y/e2ijDpUl
	/CK82eIDjYB3pXCn4pmaogvx3BNvMnPzgdR61Y9oOWg4IZ7IZGYzAHfzOVjVQIo6NiUxr7cWr1XWQ
	NXBPoAYIBxf9gPt0i/SCOydwxNStm7JXPSuT4AMuxEXq6w96sloZFLRSxTjN3JqAcBOpBdncZ1YJw
	6ObbHxxD0G5wBTzyMtxIbplDCzruu+yec9OThJDe1HNmF+EgPPhha8jDPP0r9JQyHcqyB7xQPBRdX
	PZnvuJ43xH1yepG0e7EiibXhBO535aungs0Zjuch5++Klwjyc5k8bNvYgJJxp63aE0SKQa0HHesaP
	idn4FSAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud2vo-0000000E2Np-3Rsc;
	Sat, 19 Jul 2025 08:28:32 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud2tL-0000000E20p-09o2;
	Sat, 19 Jul 2025 08:26:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752913559; x=1784449559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4eRGrkNw5Cb+IWU2kFLOeD/+YDj6S0Mo45vQlVKl17o=;
  b=MOxZIkFLujG3WMO1D1+WNuS2BjEgCFyNkkSbqcNfPP+Jge6fvy12KeBD
   HPJ8CD60uOTykDAbV3KJgwxo1yr1mlRC0gxwWZbcF0JqpjfkFFi1cWl8q
   5ajaeBR/lziTwsyczuK1ObLxSoscQ8EGbxmj1tcdL3de+d07vNts+mdiG
   AbRONOwWvfqR8J/AqJWlZaVTG6vtecdUU4665C4NsDEXX+JkpaglLlJBJ
   LXp5Nljin2Nj1FEhtNzNZ7XknCN00jcRctRZh1UWXopdGUi+uhjUKmgpi
   yP4hyuzH07UOmN6NsuBRYBLek1gtKiLq/tHe5qfo+gLesopaoLmJaYhaA
   w==;
X-CSE-ConnectionGUID: ynOCx6+kRr6IK9TMS1XCBQ==
X-CSE-MsgGUID: Y48d5tBWSYmLyHY0EBICyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="59011637"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="59011637"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 01:25:54 -0700
X-CSE-ConnectionGUID: +7S6gRYbTFKNwAB/ImkwEw==
X-CSE-MsgGUID: K0XQRP2vRl6ZkaKXZaYvSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="164052562"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Jul 2025 01:25:49 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ud2t9-000FLL-05;
	Sat, 19 Jul 2025 08:25:47 +0000
Date: Sat, 19 Jul 2025 16:24:47 +0800
From: kernel test robot <lkp@intel.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	openembedded-core@lists.openembedded.org, patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>,
	Ramax Lo <ramax.lo@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: add device-tree for Genio 1200
 EVK UFS board
Message-ID: <202507191640.Ghk47rXu-lkp@intel.com>
References: <20250718083202.654568-3-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718083202.654568-3-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_012559_120814_6CF07F84 
X-CRM114-Status: GOOD (  11.81  )
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

Hi Macpaul,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on arm64/for-next/core krzk/for-next linus/master v6.16-rc6]
[cannot apply to next-20250718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Macpaul-Lin/arm64-dts-mediatek-mt8395-genio-1200-evk-Move-common-parts-to-dtsi/20250718-163459
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250718083202.654568-3-macpaul.lin%40mediatek.com
patch subject: [PATCH 3/4] arm64: dts: mediatek: add device-tree for Genio 1200 EVK UFS board
config: arm64-randconfig-001-20250719 (https://download.01.org/0day-ci/archive/20250719/202507191640.Ghk47rXu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507191640.Ghk47rXu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507191640.Ghk47rXu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dts:10.1-8 Label or path ufshci not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

