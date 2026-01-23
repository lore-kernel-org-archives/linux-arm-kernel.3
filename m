Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E55DD6CFA7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 22:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cgn4beNryWeHkPhmajdZZl89n3fhCyXoaD4OHnQSNNs=; b=VPXORaQeIsU9A9Iy31y+q18OyO
	X7mzParwjrmcsQ7PJCoB9qQkvzi21gbCOItMrFYJr6dqafBQPBcbhqN/rEgU/NTSqpvvLY9Z4UKEL
	H7KQy8TuIS03+OT3XKgU1lp+QVvjxglUZSIgvJxT690NfQe7l0XIdLV/Swecr0KoCa7QYmQ8Ni1RC
	bKlSo7VdyRxiAmL1PJ4UDR594fG6pDDoxi0V6D4ypojw7uFF55jrDOIWfE8nNfSeS3/4G1PfQBKer
	I1a2OBhyA8Qp0ulIeFyX1IiVAAG9q8CSPTNqtClowUG2yeS+q9i9vZf6FEXLZ7wxxvY8cPbsU0GIJ
	Ti3/xOlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjPzK-00000009YtL-0yau;
	Fri, 23 Jan 2026 22:50:46 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjPzC-00000009Ys3-3UUc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 22:50:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769208639; x=1800744639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z+l/Iumm08O54OJsNbQka8X+9Q72qsZNUebKuOgH+/4=;
  b=UEofURccI1S2ztv+985E35aBkNq0JjyjxrOl7c4sqxHGQwdd5PsueWYX
   HomJkgHlkjp8e85xpqUIFu41RfE3ftfSzA+3Ghwn6Sm0dUHdq2fY6nLoW
   u0IKyOy5kj6XF2lUzTYKWMoqkJSAUeCcMQwnmJnb2XQczMlKCzKp6w6sb
   sPW7S8Tcx7KVgWbs7VvmqMcw4h7c94d1ubzOFwbQfGEbSUblEOTWq0pgS
   Tw05sUu3CO8/ClpQkaF32y+SDbaQs27KwiR9r1XVXopsr79VOg47B+jXW
   YX+NH/UZSfgdE05bnhVqTj5QMN80VW8J4i0o/3kLk5SvvPkQOPloQpxAd
   g==;
X-CSE-ConnectionGUID: Vs3rhQd5ToCqKS25ur2nKQ==
X-CSE-MsgGUID: 4WIIyaOmR9awJOWY/DoLRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70515850"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="70515850"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 14:50:35 -0800
X-CSE-ConnectionGUID: 1tqy6JmdQH6dK7zPWXXK8A==
X-CSE-MsgGUID: TK0Z7lPeR1ypTpwa1GDYeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="211996524"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Jan 2026 14:50:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjPz1-00000000UYK-1voE;
	Fri, 23 Jan 2026 22:50:27 +0000
Date: Sat, 24 Jan 2026 06:50:04 +0800
From: kernel test robot <lkp@intel.com>
To: Parvathi Pudi <parvathi@couthit.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, danishanwar@ti.com, rogerq@kernel.org,
	pmohan@couthit.com, basharath@couthit.com, afd@ti.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alok.a.tiwari@oracle.com,
	horms@kernel.org, pratheesh@ti.com, j-rameshbabu@ti.com,
	vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
	krishna@couthit.com
Subject: Re: [PATCH net-next v12 1/3] net: ti: icssm-prueth: Add helper
 functions to configure and maintain FDB
Message-ID: <202601240625.YSMR8XyP-lkp@intel.com>
References: <20260123135932.535735-2-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123135932.535735-2-parvathi@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_145038_909874_A2D818BA 
X-CRM114-Status: UNSURE (   9.60  )
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

Hi Parvathi,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Parvathi-Pudi/net-ti-icssm-prueth-Add-helper-functions-to-configure-and-maintain-FDB/20260123-220750
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260123135932.535735-2-parvathi%40couthit.com
patch subject: [PATCH net-next v12 1/3] net: ti: icssm-prueth: Add helper functions to configure and maintain FDB
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260124/202601240625.YSMR8XyP-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240625.YSMR8XyP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601240625.YSMR8XyP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/ti/icssm/icssm_prueth_switch.c:570:20: error: call to undeclared function 'kmalloc_obj'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     570 |         prueth->fdb_tbl = kmalloc_obj(*prueth->fdb_tbl, GFP_KERNEL);
         |                           ^
>> drivers/net/ethernet/ti/icssm/icssm_prueth_switch.c:570:18: error: incompatible integer to pointer conversion assigning to 'struct fdb_tbl *' from 'int' [-Wint-conversion]
     570 |         prueth->fdb_tbl = kmalloc_obj(*prueth->fdb_tbl, GFP_KERNEL);
         |                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/kmalloc_obj +570 drivers/net/ethernet/ti/icssm/icssm_prueth_switch.c

   564	
   565	int icssm_prueth_sw_init_fdb_table(struct prueth *prueth)
   566	{
   567		if (prueth->emac_configured)
   568			return 0;
   569	
 > 570		prueth->fdb_tbl = kmalloc_obj(*prueth->fdb_tbl, GFP_KERNEL);
   571		if (!prueth->fdb_tbl)
   572			return -ENOMEM;
   573	
   574		icssm_prueth_sw_fdb_tbl_init(prueth);
   575	
   576		return 0;
   577	}
   578	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

