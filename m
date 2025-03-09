Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F65C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 10:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+Ye6TTWwvky+KLF3GpOv7DGBNHrL/MmGpa4yhR8C2EI=; b=Kb0y44y3Cpn7gAyRWX5CQH4dOT
	6SDJRJ6wsxlJWzrUxXZbrZtpbW1COsrdp2lnHFqCWfIOpcHBD4Wk3c2j4p73brsc2QbJZrqfwWXd8
	ZnG81T8Aj5cTCmu1rF2veghPoxNWWoT0VkaQcPI3jUsCrYEpLXDs8BBqAvTzp0Bs9SqQQzw4yDCPu
	Ipm72rBIdttjY3Gh0mnzV3eV7U00CSNNc6IcyYsGuOcT9Qt6Aj652ITG8Q1S0hvbRK4dwMZLzJdrr
	d3Zy2mihi6LOSRpuLWl44cUelgXdMbJ7QdizsQ1Lm/+43cdZSLEEu8eRscPwG0q20gI+mdEPOz42y
	DxPWz44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trEDa-00000000OL5-1I5R;
	Sun, 09 Mar 2025 10:49:14 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trEBw-00000000Nzl-1L8g
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 10:47:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741517252; x=1773053252;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gaATRxCv8mxIrm7ifZcAAU6l1X+ryj16LFQRYn8ijOs=;
  b=H6lL+f9+7PKC4So8+pkfzRSs3fxFeTQf1DK1MmcOvuzMv52XyyXblM1j
   rHKJhciOS/mUc0bDHYatOgHSJsynFyR0Z4ybsNqnT3HUI3yPWJtSyrUmh
   CtgFI6vRrRPbDhzZzCeLt29k/dVxQE++Q2WtH7+je0g3AYb5yAHL4HuMr
   i43VQjH4UDlCapVy8/VImmRDBbuFsfjkOLaTa+xPFxH7y9JQeVbRLoXc9
   TipWUiavihIgkDj8uDrAyIbOOqnsHuRwKj5hvX7WaqPsIJd1pcTGgfTAU
   Q8df5mUG+zztVwPHAEGsD3pe6wcZuW1MXQ978qpWO1EQjBV03RZ2Xvkqp
   g==;
X-CSE-ConnectionGUID: 2rmidBB+QauGGbNUEjIwxw==
X-CSE-MsgGUID: Gn9xj8p+QC2cEgzNkRxcNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42635939"
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="42635939"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 03:47:26 -0700
X-CSE-ConnectionGUID: jJsX9phARz+Q8COOr0Q1gQ==
X-CSE-MsgGUID: hGetJpvRR4aNMm1Vipmd9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="124654969"
Received: from mohdfai2-ilbpg12-1.png.intel.com ([10.88.227.73])
  by orviesa003.jf.intel.com with ESMTP; 09 Mar 2025 03:47:18 -0700
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
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Chwee-Lin Choong <chwee.lin.choong@intel.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org
Subject: [PATCH iwl-next v9 00/14] igc: Add support for Frame Preemption feature in IGC
Date: Sun,  9 Mar 2025 06:46:34 -0400
Message-Id: <20250309104648.3895551-1-faizal.abdul.rahim@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_034732_441201_8CF0547C 
X-CRM114-Status: GOOD (  20.35  )
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
v8 -> v9:
- Add Vladimir and Fu Rong Reviewed-by, patch 1
- Remove Faizal Co-developed-by for patch 2
- Remove code that reset verification state when link is down, patch 2 (Vladimir)
- Refactor TX buffer and RX buffer magic constants with macro for each field. patch 5-9 (Vladimir)
- s/Rest adapter/Adapter reset/ in commit description, patch 10 (Vladimir)
- Replace igc_fpe_is_verify_or_response() and igc_fpe_lp_event_status() with igc_fpe_handle_mpacket(), patch 10 (Vladimir)
- Comments on separate lines from code in igc_fpe_get_supported_frag_size(), patch 11 (Vladimir)
- Remove mistakenly added igc_fpe_get_supported_frag_size(), patch 10 (Vladimir)
- Remove max limit 256 of tx-min-size changes, patch 11 (Vladimir)

v7 -> v8:
- Reject SMD-V and SMD-R if the payload contains non-zero values (Vladimir, Chwee Lin)
- Move resetting verification state when link is down to a new patch 3/11 (Vladimir)
- Move frag_size related handling outside of spin_lock_irq_save(), patch 1/11 (Vladimir)
- Renamed IGC_PRMEXPRCNT to IGC_PRMEXCPRCNT, to align with i226 SW User Manual, patch 11/11 (Chwee Lin)
- Use IGC_PRMEXPRCNT_OOO_SMDC for frame smd errors instead of frame assembly errors, 11/11 (Chwee Lin)

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
v7: https://patchwork.kernel.org/project/netdevbpf/cover/20250303102658.3580232-1-faizal.abdul.rahim@linux.intel.com/
v8: https://patchwork.kernel.org/project/netdevbpf/cover/20250305130026.642219-1-faizal.abdul.rahim@linux.intel.com/

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

 drivers/net/ethernet/intel/igc/igc.h          |  15 +-
 drivers/net/ethernet/intel/igc/igc_base.h     |   1 +
 drivers/net/ethernet/intel/igc/igc_defines.h  |  55 +++-
 drivers/net/ethernet/intel/igc/igc_ethtool.c  |  80 +++++
 drivers/net/ethernet/intel/igc/igc_main.c     |  69 ++++-
 drivers/net/ethernet/intel/igc/igc_regs.h     |  16 +
 drivers/net/ethernet/intel/igc/igc_tsn.c      | 207 ++++++++++++-
 drivers/net/ethernet/intel/igc/igc_tsn.h      |  52 ++++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  16 +-
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |  41 +--
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 174 +++--------
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |   5 -
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |   8 +-
 include/linux/ethtool.h                       |  73 +++++
 net/ethtool/mm.c                              | 279 +++++++++++++++++-
 15 files changed, 870 insertions(+), 221 deletions(-)

--
2.34.1


