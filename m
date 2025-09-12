Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFFCCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mh9tztPGFQu/muha8+cTvQnHWHX3Iq1GCBr0/lImpA=; b=xKm8Ox55PXDMbXaIBOinnZzpNd
	Gyege+1BZaB6dgLCBesSZJ7eGBR8EWrjO/8KpiC5RpYR4zl6Aw/G8qR4MZBXebPL0UQjmvztvDWS4
	k/E8E6j2Wv5UJgCxst5+qkqM51CWpHGpn56ZcBJguzldRVekNdQuEUGp6sIJnnVGpfUmFMdB5bwMS
	4nD2yAylH2rsAsIImpKRZjP6cImUijclcQYLJ5z/g1ZF1K4iJLAtoZAy9l2AxfOW9P11FslmFaSpA
	QjxqLvBMHTNxmzv0HiFb2d+w5M6ljySEzSniUOu9V7VDZxMkHD6Po4CSNsJzMYbl5dFdi3j/aenjF
	Hx712ciA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2mc-00000009CHl-2Gfw;
	Fri, 12 Sep 2025 12:21:42 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2mZ-00000009CFL-2IUz;
	Fri, 12 Sep 2025 12:21:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757679699; x=1789215699;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b5WHxd4xwn9rgvCSXcEEDbW+90LANpn1Bb2s22tI1ac=;
  b=NHKGVgEgfVEIz2n7w8DlCsy2IEVut6YMdklapvp9HNNK6SX8pUwF0Q+i
   MqPSUTG+12wt3T6mej/DHKMwsXvEjCY2sl8SuGbulxj9LcvY1WkOix8/B
   0J4tyG6aGY7EWOT9GWlnwCAH5iIm//JZHUia/gttnCNhj6gEemlYl4MJw
   YC+itvZjRLfFkIi5rGTQKHKWJ6FB68I/gLVvsvDofbfuW9XHKZwAvSpN4
   pfhyI7EsLLthGIA22wMQC58vjFcQsfeprB0RJw/sHTcxpWVB6I9rzy8oO
   x/lRWllhb2wQkUlk68G32/dkH3gBafT5+R4A1gBDZDpioqN4FXXk8nFJV
   A==;
X-CSE-ConnectionGUID: VzqROIRER0O5goPO6fR/Uw==
X-CSE-MsgGUID: 1UqM0t5oRtKkRxVCgMxlBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="70647306"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="70647306"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 05:21:31 -0700
X-CSE-ConnectionGUID: GEbi4FkfSrOFGVHD0mHSpQ==
X-CSE-MsgGUID: TN0X/Ch1QVyqm85T/0E1MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="174396413"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 12 Sep 2025 05:21:29 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ux2mM-00010m-2S;
	Fri, 12 Sep 2025 12:21:26 +0000
Date: Fri, 12 Sep 2025 20:21:09 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH mt76 5/5] wifi: mt76: mt7996: Add NPU offload support to
 MT7996 driver
Message-ID: <202509122047.IrKGvn3P-lkp@intel.com>
References: <20250910-mt76-npu-devel-v1-5-dbde4a37b9c0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-mt76-npu-devel-v1-5-dbde4a37b9c0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_052139_627248_8949C3DD 
X-CRM114-Status: GOOD (  11.84  )
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

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8620dfbed395fc72f968dfd07f1b50eba352bae6]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/wifi-mt76-Move-Q_READ-Q_WRITE-definitions-in-dma-h/20250910-230350
base:   8620dfbed395fc72f968dfd07f1b50eba352bae6
patch link:    https://lore.kernel.org/r/20250910-mt76-npu-devel-v1-5-dbde4a37b9c0%40kernel.org
patch subject: [PATCH mt76 5/5] wifi: mt76: mt7996: Add NPU offload support to MT7996 driver
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250912/202509122047.IrKGvn3P-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250912/202509122047.IrKGvn3P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509122047.IrKGvn3P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:371:9: note: previous definition is here
     371 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/net/wireless/mediatek/mt76/mt7996/main.c:2261:2: warning: use of a '#elifdef' directive is a C23 extension [-Wc23-extensions]
    2261 | #elifdef CONFIG_MT7996_NPU
         |  ^
   2 warnings generated.


vim +2261 drivers/net/wireless/mediatek/mt76/mt7996/main.c

  2205	
  2206	const struct ieee80211_ops mt7996_ops = {
  2207		.add_chanctx = mt76_add_chanctx,
  2208		.remove_chanctx = mt76_remove_chanctx,
  2209		.change_chanctx = mt76_change_chanctx,
  2210		.assign_vif_chanctx = mt76_assign_vif_chanctx,
  2211		.unassign_vif_chanctx = mt76_unassign_vif_chanctx,
  2212		.switch_vif_chanctx = mt76_switch_vif_chanctx,
  2213		.tx = mt7996_tx,
  2214		.start = mt7996_start,
  2215		.stop = mt7996_stop,
  2216		.add_interface = mt7996_add_interface,
  2217		.remove_interface = mt7996_remove_interface,
  2218		.config = mt7996_config,
  2219		.conf_tx = mt7996_conf_tx,
  2220		.configure_filter = mt7996_configure_filter,
  2221		.vif_cfg_changed = mt7996_vif_cfg_changed,
  2222		.link_info_changed = mt7996_link_info_changed,
  2223		.sta_state = mt7996_sta_state,
  2224		.sta_pre_rcu_remove = mt76_sta_pre_rcu_remove,
  2225		.link_sta_rc_update = mt7996_link_sta_rc_update,
  2226		.set_key = mt7996_set_key,
  2227		.ampdu_action = mt7996_ampdu_action,
  2228		.set_rts_threshold = mt7996_set_rts_threshold,
  2229		.wake_tx_queue = mt76_wake_tx_queue,
  2230		.hw_scan = mt76_hw_scan,
  2231		.cancel_hw_scan = mt76_cancel_hw_scan,
  2232		.remain_on_channel = mt76_remain_on_channel,
  2233		.cancel_remain_on_channel = mt76_cancel_remain_on_channel,
  2234		.release_buffered_frames = mt76_release_buffered_frames,
  2235		.get_txpower = mt7996_get_txpower,
  2236		.channel_switch_beacon = mt7996_channel_switch_beacon,
  2237		.get_stats = mt7996_get_stats,
  2238		.get_et_sset_count = mt7996_get_et_sset_count,
  2239		.get_et_stats = mt7996_get_et_stats,
  2240		.get_et_strings = mt7996_get_et_strings,
  2241		.get_tsf = mt7996_get_tsf,
  2242		.set_tsf = mt7996_set_tsf,
  2243		.offset_tsf = mt7996_offset_tsf,
  2244		.get_survey = mt76_get_survey,
  2245		.get_antenna = mt76_get_antenna,
  2246		.set_antenna = mt7996_set_antenna,
  2247		.set_bitrate_mask = mt7996_set_bitrate_mask,
  2248		.set_coverage_class = mt7996_set_coverage_class,
  2249		.sta_statistics = mt7996_sta_statistics,
  2250		.sta_set_4addr = mt7996_sta_set_4addr,
  2251		.sta_set_decap_offload = mt7996_sta_set_decap_offload,
  2252		.add_twt_setup = mt7996_mac_add_twt_setup,
  2253		.twt_teardown_request = mt7996_twt_teardown_request,
  2254	#ifdef CONFIG_MAC80211_DEBUGFS
  2255		.sta_add_debugfs = mt7996_sta_add_debugfs,
  2256	#endif
  2257		.set_radar_background = mt7996_set_radar_background,
  2258		.net_fill_forward_path = mt7996_net_fill_forward_path,
  2259	#ifdef CONFIG_NET_MEDIATEK_SOC_WED
  2260		.net_setup_tc = mt76_wed_net_setup_tc,
> 2261	#elifdef CONFIG_MT7996_NPU

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

