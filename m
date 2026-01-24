Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70785D778BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 00:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LvT5el1wZXVAg4vWFXCNDiGA2ePOJpbv3J1YrpHFYOk=; b=H3mvVobtTOrfIYUKwUV3mt43Jg
	tx0X7U1cZpuboxV6IL2L61uZZXVQvom7/YRoamxUPCAynr2jttcmBGhPHjqpcwHYKEFXtMQ6BGAlk
	+9WRxFRIwcR5Zoge4VL3zjzyaPUCX5r3aB1BFKS4oS1XQYjZVGPTw/9uxUFuYMpPPMDo7/8eCtXf7
	ZLDRmsirmQIQhreGL49NZIDsWp3kCaXWgiy5ugFSx56oCIPtR+hL7dlwyleXSvtmSLTAhlUjCqgNC
	EFIWXjr4jOG++uoTg4mf8cWarDy/19QWsCjfWQAh9jkRCYNHKdYxhax0Px5IPk2zj1aBQ54o02MXx
	3A4PE9cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjRVA-00000009d0o-2tR2;
	Sat, 24 Jan 2026 00:27:44 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjRV6-00000009d09-1sMt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 00:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769214460; x=1800750460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VHc+ood7SEDDTVYtj6h78HTHL/niQHjShbtHLkiGDcM=;
  b=U8yIRg/iWgM+mNfmllJ7r79A5G3nOZqmkNevMguxQkBIrtA9P9RFYABr
   TqBRgP34bgs+ZrvF+4o22ttWe8GoW1ea7fTGV8Z+Cox0Ziau7XPB9yvUx
   E8TFnO0D/9WPFmJzjCuzvmbQQ6UjctLLhSNt7t8w95zY0+b82LULzidfD
   EfbgQ+TWh/UwkIyX3gqKe9oK2+2BBd4fNmRLg2+CnpXfCYK8E+WLHJrM9
   QtUVA7fAE6R8QDUyfnbfMCOWYObtWPfnHUddaABz5Ym8QgZQmRMxeHQFQ
   g61Ijz3dQjnVaDgSuQzpBsiIU3tg9L7ks4iCoNov6Tb8fFfuEvGJLrmEY
   Q==;
X-CSE-ConnectionGUID: Ns7kg94ORZy5h4rekJc6cw==
X-CSE-MsgGUID: EfsMnZxeS+qZsFu20d4S5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70385035"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="70385035"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 16:27:39 -0800
X-CSE-ConnectionGUID: v6SaiR5vRSC8oY4EkA58Qw==
X-CSE-MsgGUID: dVfew6zvTgGp3Vy07SieDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="244771100"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Jan 2026 16:27:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjRUw-00000000Uck-3trD;
	Sat, 24 Jan 2026 00:27:30 +0000
Date: Sat, 24 Jan 2026 08:27:00 +0800
From: kernel test robot <lkp@intel.com>
To: Parvathi Pudi <parvathi@couthit.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, danishanwar@ti.com, rogerq@kernel.org,
	pmohan@couthit.com, basharath@couthit.com, afd@ti.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	alok.a.tiwari@oracle.com, horms@kernel.org, pratheesh@ti.com,
	j-rameshbabu@ti.com, vigneshr@ti.com, praneeth@ti.com, srk@ti.com,
	rogerq@ti.com, krishna@couthit.com
Subject: Re: [PATCH net-next v12 2/3] net: ti: icssm-prueth: Add switchdev
 support for icssm_prueth driver
Message-ID: <202601240851.tTtFq786-lkp@intel.com>
References: <20260123135932.535735-3-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123135932.535735-3-parvathi@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_162740_533462_6700DE02 
X-CRM114-Status: GOOD (  11.92  )
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
patch link:    https://lore.kernel.org/r/20260123135932.535735-3-parvathi%40couthit.com
patch subject: [PATCH net-next v12 2/3] net: ti: icssm-prueth: Add switchdev support for icssm_prueth driver
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260124/202601240851.tTtFq786-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240851.tTtFq786-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601240851.tTtFq786-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/ti/icssm/icssm_prueth_switch.c: In function 'icssm_prueth_sw_init_fdb_table':
   drivers/net/ethernet/ti/icssm/icssm_prueth_switch.c:581:27: error: implicit declaration of function 'kmalloc_obj'; did you mean 'kmalloc_node'? [-Wimplicit-function-declaration]
     581 |         prueth->fdb_tbl = kmalloc_obj(*prueth->fdb_tbl, GFP_KERNEL);
         |                           ^~~~~~~~~~~
         |                           kmalloc_node
   drivers/net/ethernet/ti/icssm/icssm_prueth_switch.c:581:25: error: assignment to 'struct fdb_tbl *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     581 |         prueth->fdb_tbl = kmalloc_obj(*prueth->fdb_tbl, GFP_KERNEL);
         |                         ^
   drivers/net/ethernet/ti/icssm/icssm_prueth_switch.c: In function 'icssm_prueth_sw_learn_fdb':
>> drivers/net/ethernet/ti/icssm/icssm_prueth_switch.c:649:20: error: implicit declaration of function 'kzalloc_obj'; did you mean 'kzalloc_node'? [-Wimplicit-function-declaration]
     649 |         fdb_work = kzalloc_obj(*fdb_work, GFP_ATOMIC);
         |                    ^~~~~~~~~~~
         |                    kzalloc_node
>> drivers/net/ethernet/ti/icssm/icssm_prueth_switch.c:649:18: error: assignment to 'struct icssm_prueth_sw_fdb_work *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     649 |         fdb_work = kzalloc_obj(*fdb_work, GFP_ATOMIC);
         |                  ^
   drivers/net/ethernet/ti/icssm/icssm_prueth_switch.c: In function 'icssm_prueth_sw_purge_fdb':
   drivers/net/ethernet/ti/icssm/icssm_prueth_switch.c:668:18: error: assignment to 'struct icssm_prueth_sw_fdb_work *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     668 |         fdb_work = kzalloc_obj(*fdb_work, GFP_ATOMIC);
         |                  ^
--
   drivers/net/ethernet/ti/icssm/icssm_switchdev.c: In function 'icssm_prueth_sw_switchdev_event':
>> drivers/net/ethernet/ti/icssm/icssm_switchdev.c:170:26: error: implicit declaration of function 'kzalloc_obj'; did you mean 'kzalloc_node'? [-Wimplicit-function-declaration]
     170 |         switchdev_work = kzalloc_obj(*switchdev_work, GFP_ATOMIC);
         |                          ^~~~~~~~~~~
         |                          kzalloc_node
>> drivers/net/ethernet/ti/icssm/icssm_switchdev.c:170:24: error: assignment to 'struct icssm_sw_event_work *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     170 |         switchdev_work = kzalloc_obj(*switchdev_work, GFP_ATOMIC);
         |                        ^


vim +649 drivers/net/ethernet/ti/icssm/icssm_prueth_switch.c

   575	
   576	int icssm_prueth_sw_init_fdb_table(struct prueth *prueth)
   577	{
   578		if (prueth->emac_configured)
   579			return 0;
   580	
 > 581		prueth->fdb_tbl = kmalloc_obj(*prueth->fdb_tbl, GFP_KERNEL);
   582		if (!prueth->fdb_tbl)
   583			return -ENOMEM;
   584	
   585		icssm_prueth_sw_fdb_tbl_init(prueth);
   586	
   587		return 0;
   588	}
   589	
   590	/**
   591	 * icssm_prueth_sw_fdb_add - insert fdb entry
   592	 *
   593	 * @emac: EMAC data structure
   594	 * @fdb: fdb info
   595	 *
   596	 */
   597	void icssm_prueth_sw_fdb_add(struct prueth_emac *emac,
   598				     struct switchdev_notifier_fdb_info *fdb)
   599	{
   600		icssm_prueth_sw_insert_fdb_entry(emac, fdb->addr, 1);
   601	}
   602	
   603	/**
   604	 * icssm_prueth_sw_fdb_del - delete fdb entry
   605	 *
   606	 * @emac: EMAC data structure
   607	 * @fdb: fdb info
   608	 *
   609	 */
   610	void icssm_prueth_sw_fdb_del(struct prueth_emac *emac,
   611				     struct switchdev_notifier_fdb_info *fdb)
   612	{
   613		icssm_prueth_sw_delete_fdb_entry(emac, fdb->addr, 1);
   614	}
   615	
   616	static void icssm_prueth_sw_fdb_work(struct work_struct *work)
   617	{
   618		struct icssm_prueth_sw_fdb_work *fdb_work =
   619			container_of(work, struct icssm_prueth_sw_fdb_work, work);
   620		struct prueth_emac *emac = fdb_work->emac;
   621	
   622		rtnl_lock();
   623	
   624		/* Interface is not up */
   625		if (!emac->prueth->fdb_tbl)
   626			goto free;
   627	
   628		switch (fdb_work->event) {
   629		case FDB_LEARN:
   630			icssm_prueth_sw_insert_fdb_entry(emac, fdb_work->addr, 0);
   631			break;
   632		case FDB_PURGE:
   633			icssm_prueth_sw_do_purge_fdb(emac);
   634			break;
   635		default:
   636			break;
   637		}
   638	
   639	free:
   640		rtnl_unlock();
   641		netdev_put(emac->ndev, &fdb_work->ndev_tracker);
   642		kfree(fdb_work);
   643	}
   644	
   645	int icssm_prueth_sw_learn_fdb(struct prueth_emac *emac, u8 *src_mac)
   646	{
   647		struct icssm_prueth_sw_fdb_work *fdb_work;
   648	
 > 649		fdb_work = kzalloc_obj(*fdb_work, GFP_ATOMIC);
   650		if (WARN_ON(!fdb_work))
   651			return -ENOMEM;
   652	
   653		INIT_WORK(&fdb_work->work, icssm_prueth_sw_fdb_work);
   654	
   655		fdb_work->event = FDB_LEARN;
   656		fdb_work->emac  = emac;
   657		ether_addr_copy(fdb_work->addr, src_mac);
   658	
   659		netdev_hold(emac->ndev, &fdb_work->ndev_tracker, GFP_ATOMIC);
   660		queue_work(system_long_wq, &fdb_work->work);
   661		return 0;
   662	}
   663	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

