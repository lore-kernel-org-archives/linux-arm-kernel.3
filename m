Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B111EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 16:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sNaKwX8Yr/4SjaDVprKM7coPLSLQd99kIB+9NbnIxCc=; b=hAmMCm4cb7/TAsiKq689LXprd+
	oIlRgYczWvR9RGLutCZ39cydDpGjHM8z75pSD+pKtVdqTXA7XnM7Rxkvl0DVO2YL6Ddeu6ZEiDoNJ
	BD1M0sYDUxHGYSJvcG0Hz6S2Fkon6kost0rsAFvHQjmQanGSTQehIJ689gLYrhgHv1+rtAq8WH10O
	9B+iksEkluBMpJzocM9qkRCwWd5Hf+Phu0IlNgh8IbKFiu+SUa4Py5mysSzCQy1EJudOXV7D9YxmY
	57e56quzn7iCuOOv9NRjJPMvnFMaZ75tXgP5AfKSaJmk7DPYZi85s/iobNhycxAN445Ciwu8AY4jK
	jv1/tTTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5olZ-0000000GzLP-0jB0;
	Fri, 18 Apr 2025 16:40:37 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ojb-0000000Gygc-2ddb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 16:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744994316; x=1776530316;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xqgpaY93D1rOJgzOV/8X2FRs9Z+GmQNa/gFVzslPY8c=;
  b=ZFCMH9x3iadeVZRqWygqwPj03dMd32Zqztz088APQioQKgPHxP/RN9cQ
   x2ZjKVNLhDinmzpLq+I8MSSnH0KHuW39DLVPH/wp9Gqv+4ZXH0YoLq/dz
   kzdb4xs57Q/Yp9N4bi+sqvTgzWmCTx0pGUXi7/PAfMOiIRD3FI84FWbXe
   COi+4L6GhPDpLSXBRERzgV8COwuedeU6wgnlsrHtsEcs8oI/ccYIUvkbL
   MhWTGFfHHrTWH7VO5vsON1d6CjNSHCkBEjyElLaKTtAWcOvNvHkbosRmr
   Q5gT1ur1ZGVWbKKjqRSxQsKrLTyV6bJ++tjBNX2V9KPc5jSv0ZkiHrXZ1
   w==;
X-CSE-ConnectionGUID: Dvp2Pi6RSZqFMMx2k3Kutg==
X-CSE-MsgGUID: RtnwWBdNQNWyr7sI50VtdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="50454238"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="50454238"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 09:38:32 -0700
X-CSE-ConnectionGUID: +Tbp8mEFSiePHVO4giZG7g==
X-CSE-MsgGUID: erEenTHARDWNKFJ8TG/WsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="130892216"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
  by orviesa009.jf.intel.com with ESMTP; 18 Apr 2025 09:38:32 -0700
From: Tony Nguyen <anthony.l.nguyen@intel.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	netdev@vger.kernel.org
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	faizal.abdul.rahim@linux.intel.com,
	vinicius.gomes@intel.com,
	vitaly.lifshits@intel.com,
	dima.ruinskiy@intel.com,
	przemyslaw.kitszel@intel.com,
	chwee.lin.choong@intel.com,
	yong.liang.choong@linux.intel.com,
	vladimir.oltean@nxp.com,
	horms@kernel.org,
	linux@armlinux.org.uk,
	xiaolei.wang@windriver.com,
	hayashi.kunihiko@socionext.com,
	ast@kernel.org,
	jesper.nilsson@axis.com,
	mcoquelin.stm32@gmail.com,
	rmk+kernel@armlinux.org.uk,
	fancer.lancer@gmail.com,
	kory.maincent@bootlin.com,
	linux-stm32@st-md-mailman.stormreply.com,
	hkelam@marvell.com,
	alexandre.torgue@foss.st.com,
	daniel@iogearbox.net,
	linux-arm-kernel@lists.infradead.org,
	hawk@kernel.org,
	quic_jsuraj@quicinc.com,
	gal@nvidia.com,
	john.fastabend@gmail.com,
	0x1207@gmail.com,
	bpf@vger.kernel.org
Subject: [PATCH net-next 00/14][pull request] igc: Add support for Frame Preemption
Date: Fri, 18 Apr 2025 09:38:06 -0700
Message-ID: <20250418163822.3519810-1-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_093835_686864_3C1948C4 
X-CRM114-Status: GOOD (  11.91  )
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

Faizal Rahim says:

Introduce support for the FPE feature in the IGC driver.

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
Ran 1), 2) and 3) with and without the patch series, compared dmesg and selftest logs - no differences found.
---
IWL: https://lore.kernel.org/intel-wired-lan/20250318030742.2567080-1-faizal.abdul.rahim@linux.intel.com/

The following are changes since commit 8066e388be48f1ad62b0449dc1d31a25489fa12a:
  net: add UAPI to the header guard in various network headers
and are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue 1GbE

Faizal Rahim (13):
  net: stmmac: move frag_size handling out of spin_lock
  net: ethtool: mm: reset verification status when link is down
  igc: rename xdp_get_tx_ring() for non-xdp usage
  igc: rename I225_RXPBSIZE_DEFAULT and I225_TXPBSIZE_DEFAULT
  igc: use FIELD_PREP and GENMASK for existing TX packet buffer size
  igc: optimize TX packet buffer utilization for TSN mode
  igc: use FIELD_PREP and GENMASK for existing RX packet buffer size
  igc: set the RX packet buffer size for TSN mode
  igc: add support for frame preemption verification
  igc: add support to set tx-min-frag-size
  igc: block setting preemptible traffic class in taprio
  igc: add support to get MAC Merge data via ethtool
  igc: add support to get frame preemption statistics via ethtool

Vladimir Oltean (1):
  net: ethtool: mm: extract stmmac verification logic into common
    library

 drivers/net/ethernet/intel/Kconfig            |   1 +
 drivers/net/ethernet/intel/igc/igc.h          |  15 +-
 drivers/net/ethernet/intel/igc/igc_base.h     |   1 +
 drivers/net/ethernet/intel/igc/igc_defines.h  |  55 +++-
 drivers/net/ethernet/intel/igc/igc_ethtool.c  |  81 +++++
 drivers/net/ethernet/intel/igc/igc_main.c     |  69 ++++-
 drivers/net/ethernet/intel/igc/igc_regs.h     |  16 +
 drivers/net/ethernet/intel/igc/igc_tsn.c      | 210 ++++++++++++-
 drivers/net/ethernet/intel/igc/igc_tsn.h      |  52 ++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  16 +-
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |  41 +--
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 174 +++--------
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |   5 -
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |   8 +-
 include/linux/ethtool.h                       |  73 +++++
 net/ethtool/mm.c                              | 279 +++++++++++++++++-
 17 files changed, 876 insertions(+), 221 deletions(-)

-- 
2.47.1


