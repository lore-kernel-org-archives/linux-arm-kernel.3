Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C96AC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 22:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JX9SZVoeNyb9hnQLR5WESeNoKs+AGmbquSRw8WqkOsk=; b=2GRi1I1WLw1sWlG/0Grf3gLT9S
	+LbJNE18HT1aSWdyJYm39UIu+YbUrdxXkWcZe1SihgGyn5+kpJ0QmQAyU8wmWP7vfr1aLqkhogi9z
	BzAbWnPju3ISNcuLzkCwQHIsXAbjS1wIx+uLe9OV15bgVsxonxh6bd5ILBym8S1z14BQqp/loAYnS
	oVvHem7HWBD6e3UBtXxjzb3/wv6Ly0SNuOYDxeBi+EcTYf+sw0Kd/sOJagxP9AZFdTuNXKzCBTLhZ
	DySOy1SXeLHB4ztffOiA3/fVjpvJn+6YtdGltPEmHlEnDlEP9jTuhAhH5JU6F8ZYCsW8ob7Pi+kF+
	XxRjI8Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEy0H-0000000Dekd-3ld5;
	Tue, 13 May 2025 22:21:37 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExxy-0000000Dean-2oih
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 22:19:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747174754; x=1778710754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fqeZJOEOY2aVWBB3599olrvu/ImNPnFHF5EeqlYBts8=;
  b=dSANFsEDobtuc0Jf6WoBGsnfQjHn8n/Bnx8STck2ozEk/lJ6QBYtYDRi
   4HTpq2ppHo51IATwwE9KvdFvEL1/vBNF9a7lS00yj94Y3dRR+MjL3JopY
   f+rpl3vreZIwwiurcfdjAMMdq1MRXDxTSDwkgDY3JGMUWosNjBC7zuQdH
   aDTCLYlbauK2CdBphl2a3oaMvFurhTM6i0y/jV263nvMqYrJ+cZ2VCnRe
   KAFs06u2q/HF7mW61aejQX4nq6aYxZzs2QrmK2zpStTQ3dsZK1rK4BEIN
   ToebMKD3538hyohmojzYP0dmQCnFQm/HhZlxtE3DWuUL6o9a0vY38lhBw
   A==;
X-CSE-ConnectionGUID: NVgPWDR/QHaF8Bc6Z+T/5Q==
X-CSE-MsgGUID: 3ZixgnjhS6uJZHCmkGBiYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48156553"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="48156553"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 15:19:13 -0700
X-CSE-ConnectionGUID: VvTFqD7DS6qBfKMgls7JIw==
X-CSE-MsgGUID: mLGuGxC8TGm/YKdAHuzHNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="138825627"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 May 2025 15:19:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uExxs-000GRz-0m;
	Tue, 13 May 2025 22:19:08 +0000
Date: Wed, 14 May 2025 06:18:09 +0800
From: kernel test robot <lkp@intel.com>
To: Can Ayberk Demir <ayberkdemir@gmail.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <monstr@monstr.eu>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Can Ayberk DEMIR <ayberkdemir@gmail.com>
Subject: Re: [PATCH v2] drivers: net: axienet: safely drop oversized RX frames
Message-ID: <202505140618.dkbky4zD-lkp@intel.com>
References: <20250509063727.35560-1-ayberkdemir@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509063727.35560-1-ayberkdemir@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_151914_730601_D1B5765E 
X-CRM114-Status: GOOD (  21.37  )
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

Hi Can,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]
[also build test ERROR on net-next/main linus/master v6.15-rc6 next-20250513]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Can-Ayberk-Demir/drivers-net-axienet-safely-drop-oversized-RX-frames/20250509-143942
base:   net/main
patch link:    https://lore.kernel.org/r/20250509063727.35560-1-ayberkdemir%40gmail.com
patch subject: [PATCH v2] drivers: net: axienet: safely drop oversized RX frames
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20250514/202505140618.dkbky4zD-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505140618.dkbky4zD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505140618.dkbky4zD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_rx_poll':
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1227:45: error: 'ndev' undeclared (first use in this function); did you mean 'cdev'?
    1227 |                                 netdev_warn(ndev,
         |                                             ^~~~
         |                                             cdev
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1227:45: note: each undeclared identifier is reported only once for each function it appears in


vim +1227 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

  1184	
  1185	/**
  1186	 * axienet_rx_poll - Triggered by RX ISR to complete the BD processing.
  1187	 * @napi:	Pointer to NAPI structure.
  1188	 * @budget:	Max number of RX packets to process.
  1189	 *
  1190	 * Return: Number of RX packets processed.
  1191	 */
  1192	static int axienet_rx_poll(struct napi_struct *napi, int budget)
  1193	{
  1194		u32 length;
  1195		u32 csumstatus;
  1196		u32 size = 0;
  1197		int packets = 0;
  1198		dma_addr_t tail_p = 0;
  1199		struct axidma_bd *cur_p;
  1200		struct sk_buff *skb, *new_skb;
  1201		struct axienet_local *lp = container_of(napi, struct axienet_local, napi_rx);
  1202	
  1203		cur_p = &lp->rx_bd_v[lp->rx_bd_ci];
  1204	
  1205		while (packets < budget && (cur_p->status & XAXIDMA_BD_STS_COMPLETE_MASK)) {
  1206			dma_addr_t phys;
  1207	
  1208			/* Ensure we see complete descriptor update */
  1209			dma_rmb();
  1210	
  1211			skb = cur_p->skb;
  1212			cur_p->skb = NULL;
  1213	
  1214			/* skb could be NULL if a previous pass already received the
  1215			 * packet for this slot in the ring, but failed to refill it
  1216			 * with a newly allocated buffer. In this case, don't try to
  1217			 * receive it again.
  1218			 */
  1219			if (likely(skb)) {
  1220				length = cur_p->app4 & 0x0000FFFF;
  1221	
  1222				phys = desc_get_phys_addr(lp, cur_p);
  1223				dma_unmap_single(lp->dev, phys, lp->max_frm_size,
  1224						 DMA_FROM_DEVICE);
  1225	
  1226				if (unlikely(length > skb_tailroom(skb))) {
> 1227					netdev_warn(ndev,
  1228						    "Dropping oversized RX frame (len=%u, tailroom=%u)\n",
  1229						    length, skb_tailroom(skb));
  1230					dev_kfree_skb(skb);
  1231					skb = NULL;
  1232				} else {
  1233					skb_put(skb, length);
  1234					skb->protocol = eth_type_trans(skb, lp->ndev);
  1235					/*skb_checksum_none_assert(skb);*/
  1236					skb->ip_summed = CHECKSUM_NONE;
  1237	
  1238					/* if we're doing Rx csum offload, set it up */
  1239					if (lp->features & XAE_FEATURE_FULL_RX_CSUM) {
  1240						csumstatus = (cur_p->app2 &
  1241								XAE_FULL_CSUM_STATUS_MASK) >> 3;
  1242						if (csumstatus == XAE_IP_TCP_CSUM_VALIDATED ||
  1243						    csumstatus == XAE_IP_UDP_CSUM_VALIDATED) {
  1244							skb->ip_summed = CHECKSUM_UNNECESSARY;
  1245						}
  1246					} else if (lp->features & XAE_FEATURE_PARTIAL_RX_CSUM) {
  1247						skb->csum = be32_to_cpu(cur_p->app3 & 0xFFFF);
  1248						skb->ip_summed = CHECKSUM_COMPLETE;
  1249					}
  1250	
  1251					napi_gro_receive(napi, skb);
  1252	
  1253					size += length;
  1254					packets++;
  1255				}
  1256			}
  1257	
  1258			new_skb = napi_alloc_skb(napi, lp->max_frm_size);
  1259			if (!new_skb)
  1260				break;
  1261	
  1262			phys = dma_map_single(lp->dev, new_skb->data,
  1263					      lp->max_frm_size,
  1264					      DMA_FROM_DEVICE);
  1265			if (unlikely(dma_mapping_error(lp->dev, phys))) {
  1266				if (net_ratelimit())
  1267					netdev_err(lp->ndev, "RX DMA mapping error\n");
  1268				dev_kfree_skb(new_skb);
  1269				break;
  1270			}
  1271			desc_set_phys_addr(lp, phys, cur_p);
  1272	
  1273			cur_p->cntrl = lp->max_frm_size;
  1274			cur_p->status = 0;
  1275			cur_p->skb = new_skb;
  1276	
  1277			/* Only update tail_p to mark this slot as usable after it has
  1278			 * been successfully refilled.
  1279			 */
  1280			tail_p = lp->rx_bd_p + sizeof(*lp->rx_bd_v) * lp->rx_bd_ci;
  1281	
  1282			if (++lp->rx_bd_ci >= lp->rx_bd_num)
  1283				lp->rx_bd_ci = 0;
  1284			cur_p = &lp->rx_bd_v[lp->rx_bd_ci];
  1285		}
  1286	
  1287		u64_stats_update_begin(&lp->rx_stat_sync);
  1288		u64_stats_add(&lp->rx_packets, packets);
  1289		u64_stats_add(&lp->rx_bytes, size);
  1290		u64_stats_update_end(&lp->rx_stat_sync);
  1291	
  1292		if (tail_p)
  1293			axienet_dma_out_addr(lp, XAXIDMA_RX_TDESC_OFFSET, tail_p);
  1294	
  1295		if (packets < budget && napi_complete_done(napi, packets)) {
  1296			if (READ_ONCE(lp->rx_dim_enabled)) {
  1297				struct dim_sample sample = {
  1298					.time = ktime_get(),
  1299					/* Safe because we are the only writer */
  1300					.pkt_ctr = u64_stats_read(&lp->rx_packets),
  1301					.byte_ctr = u64_stats_read(&lp->rx_bytes),
  1302					.event_ctr = READ_ONCE(lp->rx_irqs),
  1303				};
  1304	
  1305				net_dim(&lp->rx_dim, &sample);
  1306			}
  1307	
  1308			/* Re-enable RX completion interrupts. This should
  1309			 * cause an immediate interrupt if any RX packets are
  1310			 * already pending.
  1311			 */
  1312			spin_lock_irq(&lp->rx_cr_lock);
  1313			axienet_dma_out32(lp, XAXIDMA_RX_CR_OFFSET, lp->rx_dma_cr);
  1314			spin_unlock_irq(&lp->rx_cr_lock);
  1315		}
  1316		return packets;
  1317	}
  1318	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

