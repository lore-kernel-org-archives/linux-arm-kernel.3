Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7811C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 00:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v05J72i6O7I9BveR5c1UBCE/JtDlj6CX15LfYPrmwl8=; b=DE6spiv1EdE56ALTcMWpQ2AIdt
	RqKt4Gh6RUozIAyNeX4XzK4e6koUkaEzzngaQY3YCIfBA45//TXWk4sumaFsKmV8BBMpn9q7G9FH3
	KqbpdEJoONsQ+yftwHg8xr+VYAjjSMFtF75WJnWGuTfFNsPTXZf/Rrus4JpQnlxgX+CHwIya1TWjB
	IEu+xo84PJa5Ho4eqZGOnV6jaVGypi6U4aRg9W30453eBMFdiRJW6m5brRTwkO6AdKu0rff0MYQtl
	hQbJuicMwaUiN9qnao13EvBWk4ha1rlQgBsl3tWxma8x7aY1oKbs2eXCf9YmIEEn485LKzDXmy49d
	UXA29oLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJLrl-00000007reS-1fVy;
	Mon, 26 May 2025 00:38:57 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJLpc-00000007rYj-0mxG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 00:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748219804; x=1779755804;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PWmxnlgfXVQMFwih64+oIqpx6GC1/1WEm1ZUh1+lD90=;
  b=kBJfRQh0+loaa5T0ceu3/6IaKZhkqhBu3aFlfvUVrHLu4IRaShePm3jL
   uK4bTg29PwB9plVozCr67m1hCgGwvylHnoJC3omygkeg/kCkASP2mn8Xq
   wmruw/s3XtkQQRJbT5IJWjgRnnx4H5bLyZ/luWrXvHmhbbizu1r+DhfUn
   /A4yF5SXW1wCe8n/6J2UouN4OSPJ/BcYZD/Ra4BxeqDOomRW5Wj5SBHHo
   G41DHmnrkPy2Y7agx7l8wD5+5bLDkLW3btB/X2FxhTbBH+/os5JrPmgGC
   X5AQzWTdvCb8KO6t09oN2B4+lCZ1Qaxydlt/iowPgdICepQJdWN19BMuv
   A==;
X-CSE-ConnectionGUID: 1aOBitJGRbynNQkDWXh2Bg==
X-CSE-MsgGUID: Xyk2bJckSg+7cNbGL+CAyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="67739677"
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="67739677"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 17:36:43 -0700
X-CSE-ConnectionGUID: nxxMPxjcSEOwAFrehzbeGA==
X-CSE-MsgGUID: B4+C7AphS5OWTk0wdO38Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="142594031"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 May 2025 17:36:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJLpU-000S32-36;
	Mon, 26 May 2025 00:36:36 +0000
Date: Mon, 26 May 2025 08:36:19 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Gupta <suraj.gupta2@amd.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, vkoul@kernel.org, michal.simek@amd.com,
	sean.anderson@linux.dev, radhey.shyam.pandey@amd.com,
	horms@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	git@amd.com, harini.katakam@amd.com
Subject: Re: [PATCH net-next] net: xilinx: axienet: Configure and report
 coalesce parameters in DMAengine flow
Message-ID: <202505260804.Mhztve8t-lkp@intel.com>
References: <20250525102217.1181104-1-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250525102217.1181104-1-suraj.gupta2@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_173644_275894_5C5846D3 
X-CRM114-Status: GOOD (  12.30  )
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

Hi Suraj,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Gupta/net-xilinx-axienet-Configure-and-report-coalesce-parameters-in-DMAengine-flow/20250525-182400
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250525102217.1181104-1-suraj.gupta2%40amd.com
patch subject: [PATCH net-next] net: xilinx: axienet: Configure and report coalesce parameters in DMAengine flow
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250526/202505260804.Mhztve8t-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250526/202505260804.Mhztve8t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505260804.Mhztve8t-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_init_dmaengine':
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1524:18: error: 'struct dma_slave_config' has no member named 'coalesce_cnt'
    1524 |         tx_config.coalesce_cnt = XAXIDMAENGINE_DFT_TX_THRESHOLD;
         |                  ^
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1525:18: error: 'struct dma_slave_config' has no member named 'coalesce_usecs'
    1525 |         tx_config.coalesce_usecs = XAXIDMAENGINE_DFT_TX_USEC;
         |                  ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1526:18: error: 'struct dma_slave_config' has no member named 'coalesce_cnt'
    1526 |         rx_config.coalesce_cnt = XAXIDMAENGINE_DFT_RX_THRESHOLD;
         |                  ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1527:18: error: 'struct dma_slave_config' has no member named 'coalesce_usecs'
    1527 |         rx_config.coalesce_usecs =  XAXIDMAENGINE_DFT_RX_USEC;
         |                  ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_ethtools_get_coalesce':
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2196:61: error: 'struct dma_slave_caps' has no member named 'coalesce_cnt'
    2196 |                 ecoalesce->tx_max_coalesced_frames = tx_caps.coalesce_cnt;
         |                                                             ^
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2197:55: error: 'struct dma_slave_caps' has no member named 'coalesce_usecs'
    2197 |                 ecoalesce->tx_coalesce_usecs = tx_caps.coalesce_usecs;
         |                                                       ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2198:61: error: 'struct dma_slave_caps' has no member named 'coalesce_cnt'
    2198 |                 ecoalesce->rx_max_coalesced_frames = rx_caps.coalesce_cnt;
         |                                                             ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2199:55: error: 'struct dma_slave_caps' has no member named 'coalesce_usecs'
    2199 |                 ecoalesce->rx_coalesce_usecs = rx_caps.coalesce_usecs;
         |                                                       ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_ethtools_set_coalesce':
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2270:23: error: 'struct dma_slave_config' has no member named 'coalesce_cnt'
    2270 |                 tx_cfg.coalesce_cnt = ecoalesce->tx_max_coalesced_frames;
         |                       ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2271:23: error: 'struct dma_slave_config' has no member named 'coalesce_usecs'
    2271 |                 tx_cfg.coalesce_usecs = ecoalesce->tx_coalesce_usecs;
         |                       ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2272:23: error: 'struct dma_slave_config' has no member named 'coalesce_cnt'
    2272 |                 rx_cfg.coalesce_cnt = ecoalesce->rx_max_coalesced_frames;
         |                       ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2273:23: error: 'struct dma_slave_config' has no member named 'coalesce_usecs'
    2273 |                 rx_cfg.coalesce_usecs = ecoalesce->rx_coalesce_usecs;
         |                       ^


vim +1524 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

  1494	
  1495	/**
  1496	 * axienet_init_dmaengine - init the dmaengine code.
  1497	 * @ndev:       Pointer to net_device structure
  1498	 *
  1499	 * Return: 0, on success.
  1500	 *          non-zero error value on failure
  1501	 *
  1502	 * This is the dmaengine initialization code.
  1503	 */
  1504	static int axienet_init_dmaengine(struct net_device *ndev)
  1505	{
  1506		struct axienet_local *lp = netdev_priv(ndev);
  1507		struct skbuf_dma_descriptor *skbuf_dma;
  1508		struct dma_slave_config tx_config, rx_config;
  1509		int i, ret;
  1510	
  1511		lp->tx_chan = dma_request_chan(lp->dev, "tx_chan0");
  1512		if (IS_ERR(lp->tx_chan)) {
  1513			dev_err(lp->dev, "No Ethernet DMA (TX) channel found\n");
  1514			return PTR_ERR(lp->tx_chan);
  1515		}
  1516	
  1517		lp->rx_chan = dma_request_chan(lp->dev, "rx_chan0");
  1518		if (IS_ERR(lp->rx_chan)) {
  1519			ret = PTR_ERR(lp->rx_chan);
  1520			dev_err(lp->dev, "No Ethernet DMA (RX) channel found\n");
  1521			goto err_dma_release_tx;
  1522		}
  1523	
> 1524		tx_config.coalesce_cnt = XAXIDMAENGINE_DFT_TX_THRESHOLD;
> 1525		tx_config.coalesce_usecs = XAXIDMAENGINE_DFT_TX_USEC;
> 1526		rx_config.coalesce_cnt = XAXIDMAENGINE_DFT_RX_THRESHOLD;
> 1527		rx_config.coalesce_usecs =  XAXIDMAENGINE_DFT_RX_USEC;
  1528	
  1529		ret = dmaengine_slave_config(lp->tx_chan, &tx_config);
  1530		if (ret) {
  1531			dev_err(lp->dev, "Failed to configure Tx coalesce parameters\n");
  1532			goto err_dma_release_tx;
  1533		}
  1534		ret = dmaengine_slave_config(lp->rx_chan, &rx_config);
  1535		if (ret) {
  1536			dev_err(lp->dev, "Failed to configure Rx coalesce parameters\n");
  1537			goto err_dma_release_tx;
  1538		}
  1539	
  1540		lp->tx_ring_tail = 0;
  1541		lp->tx_ring_head = 0;
  1542		lp->rx_ring_tail = 0;
  1543		lp->rx_ring_head = 0;
  1544		lp->tx_skb_ring = kcalloc(TX_BD_NUM_MAX, sizeof(*lp->tx_skb_ring),
  1545					  GFP_KERNEL);
  1546		if (!lp->tx_skb_ring) {
  1547			ret = -ENOMEM;
  1548			goto err_dma_release_rx;
  1549		}
  1550		for (i = 0; i < TX_BD_NUM_MAX; i++) {
  1551			skbuf_dma = kzalloc(sizeof(*skbuf_dma), GFP_KERNEL);
  1552			if (!skbuf_dma) {
  1553				ret = -ENOMEM;
  1554				goto err_free_tx_skb_ring;
  1555			}
  1556			lp->tx_skb_ring[i] = skbuf_dma;
  1557		}
  1558	
  1559		lp->rx_skb_ring = kcalloc(RX_BUF_NUM_DEFAULT, sizeof(*lp->rx_skb_ring),
  1560					  GFP_KERNEL);
  1561		if (!lp->rx_skb_ring) {
  1562			ret = -ENOMEM;
  1563			goto err_free_tx_skb_ring;
  1564		}
  1565		for (i = 0; i < RX_BUF_NUM_DEFAULT; i++) {
  1566			skbuf_dma = kzalloc(sizeof(*skbuf_dma), GFP_KERNEL);
  1567			if (!skbuf_dma) {
  1568				ret = -ENOMEM;
  1569				goto err_free_rx_skb_ring;
  1570			}
  1571			lp->rx_skb_ring[i] = skbuf_dma;
  1572		}
  1573		/* TODO: Instead of BD_NUM_DEFAULT use runtime support */
  1574		for (i = 0; i < RX_BUF_NUM_DEFAULT; i++)
  1575			axienet_rx_submit_desc(ndev);
  1576		dma_async_issue_pending(lp->rx_chan);
  1577	
  1578		return 0;
  1579	
  1580	err_free_rx_skb_ring:
  1581		for (i = 0; i < RX_BUF_NUM_DEFAULT; i++)
  1582			kfree(lp->rx_skb_ring[i]);
  1583		kfree(lp->rx_skb_ring);
  1584	err_free_tx_skb_ring:
  1585		for (i = 0; i < TX_BD_NUM_MAX; i++)
  1586			kfree(lp->tx_skb_ring[i]);
  1587		kfree(lp->tx_skb_ring);
  1588	err_dma_release_rx:
  1589		dma_release_channel(lp->rx_chan);
  1590	err_dma_release_tx:
  1591		dma_release_channel(lp->tx_chan);
  1592		return ret;
  1593	}
  1594	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

