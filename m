Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53496C54FC6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 13:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CP0SgVQ5qaXNNDwoIZGQSD20snNIekGck/7RfuNkMrU=; b=ZD/3XFNhmvqbebwcmoAAp1lkjr
	rYvMoUP9LWz5kGH508V/0+3CTewzAzk19lIwCRyFQTo2jFD9ruQkTPm7V52NrQ/E5FnFvBUh6Fnna
	DrSyZW8PehbIRWSyDQ01k6aw8fdWjRAYAYriaMzVZ+8VT8bv5tx4yWRQDfSRe8Qi1P0RagzDIqomA
	BbNheR3gJki+GCcJdY616HhrKVK9GGi0R2w0ySH+EGBZM2ZYqy8S6cMwGfvPja52V0wf4l/oEDMyG
	TURTRRcIVJGYfqHA3iIHWJzL3Hz+Nd/Q+SKSBXhM0F29vmU/OS6tWo57tMFcX5C1dG7WKfDnF1lN6
	PXcrAELA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIpOI-00000005uCO-0c7I;
	Sat, 24 May 2025 13:58:22 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIpM7-00000005u7J-1hbE;
	Sat, 24 May 2025 13:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748094967; x=1779630967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nT6QCH2t9NHJHSkhiqFg+TCciSaU2u+6fD4wOw0my9A=;
  b=RjOUCsG4gMfMffnlkNFq2/VrK6c8LsCbxno4BMv7Sj5LmXRg8V99Rfgd
   PbWtbdAAIPzEJcI3Grn/cWSmYL1maUSJAFkklAOh2HnmjKJLiqV4vWzVE
   UcKPjAb6iGt5ZBoL+Ka8v7SEDhyk91ziVQ7cqIMH62k1S6irDq5HG77vJ
   C6GVy5cdu8gtIc7xW2FeqS2PW4cjF9rWU4ZhrM7cy6pgoFFIMvRPv8/2e
   f3Ub+AtJAgMn/3rNsaoFIPYg1ZGNFm/KrRN0pFpODYIzj8nk9CUxj1lK5
   sq14/r4v1ksbQqDcKIcpJH/gBCc4wGGiyuzvlUyYR11yaBP33ETKkKYQE
   g==;
X-CSE-ConnectionGUID: IEWDeIHXQu2aJg643rw1Wg==
X-CSE-MsgGUID: ZCff8TEQRVKMJUT35HDQEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="52755538"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="52755538"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 06:56:04 -0700
X-CSE-ConnectionGUID: xlrkOS08SuWnWMtbmXAaIA==
X-CSE-MsgGUID: w/KrP6sOS9GvTY79VoUOGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="141440807"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 May 2025 06:56:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIpLx-000REG-2q;
	Sat, 24 May 2025 13:55:57 +0000
Date: Sat, 24 May 2025 21:55:56 +0800
From: kernel test robot <lkp@intel.com>
To: Elaine Zhang <zhangqing@rock-chips.com>, mkl@pengutronix.de,
	kernel@pengutronix.de, mailhol.vincent@wanadoo.fr, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	cl@rock-chips.com, kever.yang@rock-chips.com
Cc: oe-kbuild-all@lists.linux.dev, linux-can@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/4] net: can: rockchip: add can for RK3576 Soc
Message-ID: <202505242132.Mau7vNde-lkp@intel.com>
References: <20250523075422.4010083-4-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523075422.4010083-4-zhangqing@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_065607_489696_91773BB0 
X-CRM114-Status: GOOD (  13.00  )
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

Hi Elaine,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkl-can-next/testing]
[also build test WARNING on robh/for-next linus/master v6.15-rc7 next-20250523]
[cannot apply to rockchip/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Elaine-Zhang/dt-bindings-can-rockchip_canfd-add-rk3576-CAN-FD-controller/20250523-211340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git testing
patch link:    https://lore.kernel.org/r/20250523075422.4010083-4-zhangqing%40rock-chips.com
patch subject: [PATCH v5 3/4] net: can: rockchip: add can for RK3576 Soc
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250524/202505242132.Mau7vNde-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505242132.Mau7vNde-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505242132.Mau7vNde-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/can/rockchip/rockchip_canfd-tx.c: In function 'rkcanfd_handle_rk3576_tx_int':
>> drivers/net/can/rockchip/rockchip_canfd-tx.c:173:25: warning: variable 'skb' set but not used [-Wunused-but-set-variable]
     173 |         struct sk_buff *skb;
         |                         ^~~
   In file included from drivers/net/can/rockchip/rockchip_canfd-tx.c:9:
   drivers/net/can/rockchip/rockchip_canfd.h: At top level:
   drivers/net/can/rockchip/rockchip_canfd.h:699:29: warning: 'priv' defined but not used [-Wunused-variable]
     699 | static struct rkcanfd_priv *priv;
         |                             ^~~~


vim +/skb +173 drivers/net/can/rockchip/rockchip_canfd-tx.c

   168	
   169	int rkcanfd_handle_rk3576_tx_int(struct rkcanfd_priv *priv)
   170	{
   171		struct net_device_stats *stats = &priv->ndev->stats;
   172		unsigned int tx_tail;
 > 173		struct sk_buff *skb;
   174		unsigned int frame_len = 0;
   175	
   176		tx_tail = rkcanfd_get_tx_tail(priv);
   177		skb = priv->can.echo_skb[tx_tail];
   178	
   179		/* Manual handling of CAN Bus Error counters. See
   180		 * rkcanfd_get_corrected_berr_counter() for detailed
   181		 * explanation.
   182		 */
   183		if (priv->bec.txerr)
   184			priv->bec.txerr--;
   185	
   186		stats->tx_bytes +=
   187			can_rx_offload_get_echo_skb_queue_tail(&priv->offload,
   188							       tx_tail, &frame_len);
   189		stats->tx_packets++;
   190		WRITE_ONCE(priv->tx_tail, priv->tx_tail + 1);
   191		netif_subqueue_completed_wake(priv->ndev, 0, 1, frame_len,
   192					      rkcanfd_get_effective_tx_free(priv),
   193					      RKCANFD_TX_START_THRESHOLD);
   194		return 0;
   195	}
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

