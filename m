Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD71C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 09:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnMb3u0yE1PVpSG6moOkuibstHkmR15sFhEujDouJvM=; b=m7O17un31wLHDMFtlUkPp682Rn
	/FDBPayir53DYULY6c05PeF0H/vR3IRqYQjV8OYoTAmlarnn4oFs5dhk4cQOiVO4gD59V+ND/p5Tw
	Ag+ZGy5VlpSq65NwaHS7pLeHXvdw8P6CxHZBIqeAA5C0A6wIecsNavgBVZ6gyEiOhCbcSmSqDHyG/
	Zu3XFjDqvmvvVFIpxIvfgU44aElNLUvRv8s5kEKzhvVOXkU8E+ev0aR63O5dAegocYF0paXt4FPTQ
	qjZh6qWSG2Lp+S9KehAQffaXryaAl1PcRU/TrdK+yCqE5kLJmtPrDg3P6zxKoh1lLb/ptfCb41Vc5
	PMXwgqCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggXI-0000000GNku-3ZqK;
	Tue, 29 Jul 2025 09:22:16 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggJY-0000000GLAX-1BJX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 09:08:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753780084; x=1785316084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u5UpzlLxjeFXPtPFg0oC+Cw7TMJczCQeJysGpqVrRZ0=;
  b=PAr+El4SWbIJqI684k0roZWuVi/eWf77mB8ac16LOIWvuVuY9NnT3aJM
   Tx57hTsUNV/N0GOulJM1AtZD7m5tY3wgDOxdiRJFU6jhiu0SjaefWMFrp
   yiIhpHlulCc3HuwLtwmaNFr+zqkwGrl9mmbL0zGsuZGL/sJYbruA/B8kC
   IjdnHhQ18H5yNhDrW5VNlSo0DR1581AU6qOfY6hhZ3LEi4vnN1zyL2Uap
   e+YUR5VWWqc5c/QNqUrPZHU3HU6mNm3O9jJ4jnU5zrth7080a9bzkDsq4
   j+4r+YVlz0TmxElgo3xJO02TCNyhHz/01MBb6PZuAS12PphJuQdvsrn+n
   g==;
X-CSE-ConnectionGUID: rnJawQ0nT9W2JSYrETYB6w==
X-CSE-MsgGUID: I+dk3bOtTy21ZaDEGhoW+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55980638"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="55980638"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 02:08:02 -0700
X-CSE-ConnectionGUID: UaZkfoxbTzCUs4LYJLaVgw==
X-CSE-MsgGUID: fbz7WF3LRPeOZWk5gKRMuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="162360902"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Jul 2025 02:07:59 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uggJP-00018v-1v;
	Tue, 29 Jul 2025 09:07:55 +0000
Date: Tue, 29 Jul 2025 17:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <monstr@monstr.eu>,
	linux-arm-kernel@lists.infradead.org,
	Leon Romanovsky <leon@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: Re: [PATCH net-next v3 3/7] net: axienet: Use MDIO bus device in
 prints
Message-ID: <202507291640.Zr1m8oli-lkp@intel.com>
References: <20250728221823.11968-4-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728221823.11968-4-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_020804_332730_091BA753 
X-CRM114-Status: GOOD (  10.85  )
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

Hi Sean,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/net-axienet-Fix-resource-release-ordering/20250729-062108
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250728221823.11968-4-sean.anderson%40linux.dev
patch subject: [PATCH net-next v3 3/7] net: axienet: Use MDIO bus device in prints
config: arm-randconfig-002-20250729 (https://download.01.org/0day-ci/archive/20250729/202507291640.Zr1m8oli-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507291640.Zr1m8oli-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507291640.Zr1m8oli-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c:172 function parameter 'bus' not described in 'axienet_mdio_enable'
>> Warning: drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c:172 Excess function parameter 'lp' description in 'axienet_mdio_enable'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

