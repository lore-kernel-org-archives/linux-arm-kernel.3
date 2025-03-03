Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A2EC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 10:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PDxaGwIkML6S7j/D0tNfes6oFSCXyaFOJyhElmkyVRw=; b=GMaM/j4PGXP1Hs2PbfI5wgMhwr
	sIpx3xBPOXPTF9X2Ak5a+xAWliZQHt8233pBBMNJYCPmfxwo50W47zR9QOWPK7T5gPUsHueAXNwDS
	UJ+rH2kuAa+lH5Bih09L/0FK3/c17WmCjGCOGBQ66fytaFQPqvZKOn24rPY6yTRoJyyReG+SGTGDC
	j4ubr2+i74S2doZAcS150cCFagW1R14Kgkc+JFABW2rv8rXRySK0RDfSChYsJ5hP2OnQ+TPdRNg0O
	GgmBgqfI7LRTDWE+ztveRKBNExEnOUE8/EXqwcWvsjpJzmhe4HL+I56ggm8D34ntrj978uC/3QnDn
	pHRVpekg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp32v-00000000KML-0HYj;
	Mon, 03 Mar 2025 10:29:13 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp31L-00000000JwH-2CI3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 10:27:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740997655; x=1772533655;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FDz6ptuo+7Aft80tGDKuObfSvghbYDAnsgP6ShdB+h8=;
  b=S0tIRhBs+t3W7GovNcA0rTTVXWeTcbeNtY+RbGxtzd7fQAEy/5bmcnJR
   IXBRz3ZuCjf4elNERMqo12lqgnIuQ1S6zFhGuuMSDxMrUPLWo5MvxhOJ7
   F6LWkuid7XYNzHUGi3VNpMSH7dei3Szr/dTdes932vdXnReYTEcV2DbtZ
   goGIcXjjj0LWp3hbVu4Q32CYlyniRwvbQvxhEJg5M8VWsUTHlwCw0pdjK
   dXrQfZkAzcx+1mTleBO/1Tsvxy16qj/xy4Y3FH6hl5zn0JYmkBrLdsyWp
   KdUa2qaz5FWdVnS0tkrFwGpTadbACQVgpX4hb7d4FKZ5ECw64aDoMX5QA
   g==;
X-CSE-ConnectionGUID: /WmmvRl9Qymt/CvctXi5pA==
X-CSE-MsgGUID: EK9oscfbSyOwgb3BmbrKzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="64310036"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="64310036"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 02:27:31 -0800
X-CSE-ConnectionGUID: hMmtywriTWO7zIp6xwLCmg==
X-CSE-MsgGUID: 3pHgk5o+Sj624jh43tBMjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="122569850"
Received: from mohdfai2-ilbpg12-1.png.intel.com ([10.88.227.73])
  by fmviesa005.fm.intel.com with ESMTP; 03 Mar 2025 02:27:22 -0800
From: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Furong Xu <0x1207@gmail.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Suraj Jaiswal <quic_jsuraj@quicinc.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Gal Pressman <gal@nvidia.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org
Subject: [PATCH iwl-next v7 0/9] igc: Add support for Frame Preemption feature in IGC
Date: Mon,  3 Mar 2025 05:26:49 -0500
Message-Id: <20250303102658.3580232-1-faizal.abdul.rahim@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_022735_619380_CEDF97BF 
X-CRM114-Status: GOOD (  16.93  )
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

Introduces support for the FPE feature in the IGC driver.

The patches aligns with the upstream FPE API:
https://patchwork.kernel.org/project/netdevbpf/cover/20230220122343.1156614-1-vladimir.oltean@nxp.com/
https://patchwork.kernel.org/project/netdevbpf/cover/20230119122705.73054-1-vladimir.oltean@nxp.com/

It builds upon earlier work:
https://patchwork.kernel.org/project/netdevbpf/cover/20220520011538.1098888-1-vinicius.gomes@intel.com/

The patch series adds the following functionalities to the IGC driver:
a) Configure FPE using `ethtool --set-mm`.
b) Display FPE settings via `ethtool --show-mm`.
c) View FPE statistics using `ethtool --include-statistics --show-mm'.
e) Block setting preemptible tc in taprio since it is not supported yet.
   Existing code already blocks it in mqprio.

Tested:
Enabled CONFIG_PROVE_LOCKING, CONFIG_DEBUG_ATOMIC_SLEEP, CONFIG_DMA_API_DEBUG, and CONFIG_KASAN
1) selftests
2) netdev down/up cycles
3) suspend/resume cycles
4) fpe verification

No bugs or unusual dmesg logs were observed.
Ran 1), 2) and 3) with and without the patch series, compared dmesg and selftest logs — no differences found.

Change Log:
v6 -> v7:
- Squash the cpu param to the prev line (Przemek Kitszel)
- Use igc_ prefix for fpe_t (Przemek Kitszel)
- Move new ops to different line in igc_ethtool_ops (Przemek Kitszel)
- Documentation for igc_enable_empty_addr_recv (): rx -> Rx (Przemek Kitszel)
- Documentation for igc_enable_empty_addr_recv (): s/IGC/the driver/ (Przemek Kitszel)
- Change preferred style of init, from { }, to {} (Przemek Kitszel)
- Remove inclusion of umbrella header <linux/kernel.h> in igc_tsn.c (Przemek Kitszel)
- End enum with "," in igc_txd_popts_type (Przemek Kitszel)
- Remove unnecessary braces in igc_fpe_is_verify_or_response() (Przemek Kitszel)

v5 -> v6:
- Added Tested-by: Furong Xu for patch 1/9 (Vladimir, Furong Xu)
- Updated logic in ethtool_mmsv_link_state_handle() (Vladimir, Furong Xu)
- Swap sequence of function call in stmmac_set_mm() (Furong Xu)
- Log an error if igc_enable_empty_addr_recv() fails (Vladimir)
- Move the patch ".. Block setting preemptible traffic .." before ".. Add support to get MAC Merge data .." (Vladimir)
- Move mmsv function kernel-doc from .h to .c file (Vladimir)

v4 -> v5:
- Remove "igc: Add support for preemptible traffic class in taprio" patch (Vladimir)
- Add a new patch "igc: Block setting preemptible traffic classes in taprio" (Vladimir)
- Add kernel-doc for mmsv api (Vladimir)
- olininfo_status to use host byte order (Simon)
- status_error should host byte type (Simon)
- Some code was misplaced in the wrong patch (Vladimir)
- Mix of tabs and spaces in patch description (Vladimir)
- Created igc_is_pmac_enabled() to reduce code repetition (Vladimir)

v3 -> v4:
- Fix compilation warnings introduced by this patch series

v2 -> v3:
- Implement configure_tx() mmsv callback (Vladimir)
- Use static_branch_inc() and static_branch_dec() (Vladimir)
- Add adapter->fpe.mmsv.pmac_enabled as extra check (Vladimir)
- Remove unnecessary error check in igc_fpe_init_tx_descriptor() (Vladimir)
- Additional places to use FIELD_PREP() instead of manual bit manipulation (Vladimir)
- IGC_TXD_POPTS_SMD_V and IGC_TXD_POPTS_SMD_R type change to enum (Vladimir)
- Remove unnecessary netif_running() check in igc_fpe_xmit_frame (Vladimir)
- Rate limit print in igc_fpe_send_mpacket (Vladimir)

v1 -> v2:
- Extract the stmmac verification logic into a common library (Vladimir)
- igc to use common library for verification (Vladimir)
- Fix syntax for kernel-doc to use "Return:" (Vladimir)
- Use FIELD_GET instead of manual bit masking (Vladimir)
- Don't assign 0 to statistics counter in igc_ethtool_get_mm_stats() (Vladimir)
- Use pmac-enabled as a condition to allow MAC address value 0 (Vladimir)
- Define macro register value in increasing value order (Vladimir)
- Fix tx-min-frag-size handling for igc (Vladimir)
- Handle link state changes with verification in igc (Vladimir)
- Add static key for fast path code (Vladimir)
- rx_min_frag_size get from constant (Vladimir)

v1: https://patchwork.kernel.org/project/netdevbpf/cover/20241216064720.931522-1-faizal.abdul.rahim@linux.intel.com/
v2: https://patchwork.kernel.org/project/netdevbpf/cover/20250205100524.1138523-1-faizal.abdul.rahim@linux.intel.com/
v3: https://patchwork.kernel.org/project/netdevbpf/cover/20250207165649.2245320-1-faizal.abdul.rahim@linux.intel.com/
v4: https://patchwork.kernel.org/project/netdevbpf/cover/20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com/
v5: https://patchwork.kernel.org/project/netdevbpf/cover/20250220025349.3007793-1-faizal.abdul.rahim@linux.intel.com/
v6: https://patchwork.kernel.org/project/netdevbpf/cover/20250227140158.2129988-1-faizal.abdul.rahim@linux.intel.com/

Faizal Rahim (8):
  igc: Rename xdp_get_tx_ring() for non-xdp usage
  igc: Optimize the TX packet buffer utilization
  igc: Set the RX packet buffer size for TSN mode
  igc: Add support for frame preemption verification
  igc: Add support to set tx-min-frag-size
  igc: Block setting preemptible traffic class in taprio
  igc: Add support to get MAC Merge data via ethtool
  igc: Add support to get frame preemption statistics via ethtool

Vladimir Oltean (1):
  net: ethtool: mm: extract stmmac verification logic into common
    library

 drivers/net/ethernet/intel/igc/igc.h          |  15 +-
 drivers/net/ethernet/intel/igc/igc_base.h     |   1 +
 drivers/net/ethernet/intel/igc/igc_defines.h  |  15 +-
 drivers/net/ethernet/intel/igc/igc_ethtool.c  |  76 +++++
 drivers/net/ethernet/intel/igc/igc_main.c     |  66 +++-
 drivers/net/ethernet/intel/igc/igc_regs.h     |  16 +
 drivers/net/ethernet/intel/igc/igc_tsn.c      | 192 +++++++++++-
 drivers/net/ethernet/intel/igc/igc_tsn.h      |  52 ++++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  16 +-
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |  41 +--
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 174 +++--------
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |   5 -
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |   8 +-
 include/linux/ethtool.h                       |  73 +++++
 net/ethtool/mm.c                              | 281 +++++++++++++++++-
 15 files changed, 814 insertions(+), 217 deletions(-)

--
2.34.1


