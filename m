Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309F0C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 10:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jDFyUxRhNp/jKYB4Etkvk2Pc8c1Tm5NPjMbKVb1ch78=; b=RYeO/QEzteJ1fTb1V2hIgQKpCK
	Gh+k+mtpkTMV5lhZu+XglYcseYhYdnBzPV27apiH+RNR69x0ZrZCk068+sfvG9PPAKEQurVV87O3G
	MyzqSDsJ14OSJBxQML0Ck76OxxA46D+8meYITZMoMXaDAYCKNI6NMBJZkDCQiXxfo8eniSPh2uita
	/3kF+kd2phAxpP4dexP6kX3Y6+1i0zVcVjG+tkPjhPzLg8uq1j2np2Wk4PsU3KmSDdKLGgyNZYlS3
	NQRYu/wfXTFpGFoQogb3lL5R0eaPp2+eAdqKhWy0vVzz7QCGNnMVBf+PjUHdpsAbxt0VtE+HOV1G2
	MIdWMeig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcJn-00000002or0-2pyC;
	Wed, 05 Feb 2025 10:07:39 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcHo-00000002oIx-4111
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 10:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738749937; x=1770285937;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oaE6MvXosBwRaUfGg7gC0cYDCnNk9prSVztT1QQcdj0=;
  b=EZysslV0DBKB/qM53pHHXipmZwWjWxFLXM++jKU8UvgOBeYbQidBQzlI
   wKVhuIvL0AhasUIe902zvLC5yKhdaOoudX06mCgBfs7VQo7p6do9WEqRU
   OgL+JUp85GEcojHLTDhlXLzs8/1vDmdqViDL/8XMwi8QVo3htP5O78IY4
   9MWYpo91Ay6GXTUwLMwaorBfGmDINDQONUS1GPcILcBQI93ziaoe8uWg5
   5Vld1oFa1nmsc6/6dtDNu38gP3L3Oaf/QNSytGeB9m+5SCNDXYBquUOWl
   SXXnKFR7f1OJrcRPZwYjY7xpGsFB6a4dEXG/McvLlox3JSrLAQ1LBoEpu
   Q==;
X-CSE-ConnectionGUID: OzfQQEZwTbm5rLsiQ9mVng==
X-CSE-MsgGUID: E9XKvXQGRJKTqHNuIG4OWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39204631"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39204631"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 02:05:35 -0800
X-CSE-ConnectionGUID: RaRy/qV4SDObdLKqG2hLRg==
X-CSE-MsgGUID: 86KMttjBS/m9E6JVm5lvUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111297683"
Received: from mohdfai2-ilbpg12-1.png.intel.com ([10.88.227.73])
  by orviesa007.jf.intel.com with ESMTP; 05 Feb 2025 02:05:27 -0800
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
	Russell King <rmk+kernel@armlinux.org.uk>,
	Furong Xu <0x1207@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Suraj Jaiswal <quic_jsuraj@quicinc.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Petr Tesarik <petr@tesarici.cz>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org
Subject: [PATCH iwl-next v2 0/9] igc: Add support for Frame Preemption feature in IGC
Date: Wed,  5 Feb 2025 05:05:15 -0500
Message-Id: <20250205100524.1138523-1-faizal.abdul.rahim@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_020537_041404_7CD3A9EC 
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
e) Enable preemptible/express queue with `fp`:
   tc qdisc add ... root taprio \
   fp E E P P

Change Log:
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

Faizal Rahim (8):
  igc: Rename xdp_get_tx_ring() for non-xdp usage
  igc: Optimize the TX packet buffer utilization
  igc: Set the RX packet buffer size for TSN mode
  igc: Add support for frame preemption verification
  igc: Add support to set tx-min-frag-size
  igc: Add support for preemptible traffic class in taprio
  igc: Add support to get MAC Merge data via ethtool
  igc: Add support to get frame preemption statistics via ethtool

Vladimir Oltean (1):
  net: ethtool: mm: extract stmmac verification logic into common
    library

 drivers/net/ethernet/intel/igc/igc.h          |  17 +-
 drivers/net/ethernet/intel/igc/igc_defines.h  |  19 +-
 drivers/net/ethernet/intel/igc/igc_ethtool.c  |  74 ++++++
 drivers/net/ethernet/intel/igc/igc_main.c     |  96 +++++++-
 drivers/net/ethernet/intel/igc/igc_regs.h     |  16 ++
 drivers/net/ethernet/intel/igc/igc_tsn.c      | 210 +++++++++++++++-
 drivers/net/ethernet/intel/igc/igc_tsn.h      |  34 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  16 +-
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |  41 +---
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 174 +++-----------
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |   5 -
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |   8 +-
 include/linux/ethtool.h                       |  62 +++++
 net/ethtool/mm.c                              | 225 +++++++++++++++++-
 14 files changed, 780 insertions(+), 217 deletions(-)

--
2.34.1


