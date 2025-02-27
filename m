Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E978C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 14:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dstJD8WLS5jCmN22tXX53Qt/I49sr7jw4PIBeWtaYbw=; b=GsEIFKDfrvzMu/RxIAG8Gf56Pr
	JKM++2FgDfC/baGYK6GCRU8rXbi8ZDfR6x68S1OlSgQD/7wnmleeOZgH7aXxPaTJCehYvSanYe1Ja
	EG2rKW8YAbPGZE50pdXfmpqbqmt1WYjYJeVFebJbRLYbu6pkS9lMyKfx+y20wm0yEcanw4mQZuEVg
	JYfxUPMhHlHYnWV0LKSc8yC8Xey3AAkdXcX1JxrU5QpMLvuht0ARR2TZB+6M+n8sFAIRp4ipqLAvB
	C7icwfE14ZGuzjvOTCW/7A9Afyal57qD6hucbbIKFA6aHVx8fFw4p2UB6+5yirIY4QvQq26Mp18Sk
	rwA3lPJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnerR-00000007jDW-1cEz;
	Thu, 27 Feb 2025 14:27:37 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tneTp-00000007dlT-0QM6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 14:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740664993; x=1772200993;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=uHdGb/XevWeuAeirmuP1VjWhxLIfjbCVWdgvvlUnyvM=;
  b=IgWzdtk/pR1w2GflvvEenn9qpqWIIsxxdyTqfzglIVvK5NNlY6EFqlIo
   1YMaPsH4lAP2U2zOhjVhxCk+4++T58L3Az9VhShmcxKlqYgfMhM0/gCcE
   uKXs4NGBdcUPbcdTTjc+ioElbo5ZfyuukXkcfEnL/Xpxm3SrhISeligr9
   YzwRWpgfeRXA/xkP4Z+BMBydZ2FsnT2MryF3/0NPpCuVaoLqElp6TT8vR
   icCmsLOjEcApJi8/tNRxlk3BWBD22jftNFuZ1ASOAxpNYjaqcgfzrc3xa
   yHxVDCORDQgEanjgdq3z2VNajv13PjyWYKww/mRVBxQpD2ABEUTusjP9c
   Q==;
X-CSE-ConnectionGUID: 670+36mlTw+qwKI/pBykmw==
X-CSE-MsgGUID: Qfnc6Zl5QlOjci0dZi7syg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41752414"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41752414"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 06:03:12 -0800
X-CSE-ConnectionGUID: AAz8e3ToRjSYv13sn+kcPA==
X-CSE-MsgGUID: oWxo3uO9Ti2Oo0PSKFMpvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="122149646"
Received: from mohdfai2-ilbpg12-1.png.intel.com ([10.88.227.73])
  by fmviesa004.fm.intel.com with ESMTP; 27 Feb 2025 06:03:04 -0800
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
Subject: [PATCH iwl-next v6 6/9] igc: Add support to set tx-min-frag-size
Date: Thu, 27 Feb 2025 09:01:54 -0500
Message-Id: <20250227140158.2129988-7-faizal.abdul.rahim@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227140158.2129988-1-faizal.abdul.rahim@linux.intel.com>
References: <20250227140158.2129988-1-faizal.abdul.rahim@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_060313_186042_9F536D7E 
X-CRM114-Status: GOOD (  17.03  )
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

Add support to set tx-min-frag-size via set_mm callback in igc.
Increase the max limit of tx-ming-frag-size in ethtool from 252 to 256
since i225/6 value range is 64, 128, 192 and 256.

Co-developed-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
---
 drivers/net/ethernet/intel/igc/igc.h         |  1 +
 drivers/net/ethernet/intel/igc/igc_defines.h |  1 +
 drivers/net/ethernet/intel/igc/igc_ethtool.c |  5 +++
 drivers/net/ethernet/intel/igc/igc_tsn.c     | 37 ++++++++++++++++++--
 drivers/net/ethernet/intel/igc/igc_tsn.h     |  2 +-
 net/ethtool/mm.c                             |  2 +-
 6 files changed, 43 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/intel/igc/igc.h b/drivers/net/ethernet/intel/igc/igc.h
index 705bd4739e3b..2f3662143589 100644
--- a/drivers/net/ethernet/intel/igc/igc.h
+++ b/drivers/net/ethernet/intel/igc/igc.h
@@ -42,6 +42,7 @@ void igc_ethtool_set_ops(struct net_device *);
 
 struct fpe_t {
 	struct ethtool_mmsv mmsv;
+	u32 tx_min_frag_size;
 };
 
 enum igc_mac_filter_type {
diff --git a/drivers/net/ethernet/intel/igc/igc_defines.h b/drivers/net/ethernet/intel/igc/igc_defines.h
index 22db1de02964..038ee89f1e08 100644
--- a/drivers/net/ethernet/intel/igc/igc_defines.h
+++ b/drivers/net/ethernet/intel/igc/igc_defines.h
@@ -551,6 +551,7 @@
 #define IGC_TQAVCTRL_PREEMPT_ENA	0x00000002
 #define IGC_TQAVCTRL_ENHANCED_QAV	0x00000008
 #define IGC_TQAVCTRL_FUTSCDDIS		0x00000080
+#define IGC_TQAVCTRL_MIN_FRAG_MASK	0x0000C000
 
 #define IGC_TXQCTL_QUEUE_MODE_LAUNCHT	0x00000001
 #define IGC_TXQCTL_STRICT_CYCLE		0x00000002
diff --git a/drivers/net/ethernet/intel/igc/igc_ethtool.c b/drivers/net/ethernet/intel/igc/igc_ethtool.c
index e2a14edf7552..081e24f228b2 100644
--- a/drivers/net/ethernet/intel/igc/igc_ethtool.c
+++ b/drivers/net/ethernet/intel/igc/igc_ethtool.c
@@ -1789,6 +1789,11 @@ static int igc_ethtool_set_mm(struct net_device *netdev,
 	struct igc_adapter *adapter = netdev_priv(netdev);
 	struct fpe_t *fpe = &adapter->fpe;
 
+	fpe->tx_min_frag_size = igc_fpe_get_supported_frag_size(cmd->tx_min_frag_size);
+	if (fpe->tx_min_frag_size != cmd->tx_min_frag_size)
+		NL_SET_ERR_MSG_MOD(extack,
+				   "tx-min-frag-size value set is unsupported. Rounded up to supported value (64, 128, 192, 256)");
+
 	if (fpe->mmsv.pmac_enabled != cmd->pmac_enabled) {
 		if (cmd->pmac_enabled)
 			static_branch_inc(&igc_fpe_enabled);
diff --git a/drivers/net/ethernet/intel/igc/igc_tsn.c b/drivers/net/ethernet/intel/igc/igc_tsn.c
index acfff3919793..c9c70544c4c1 100644
--- a/drivers/net/ethernet/intel/igc/igc_tsn.c
+++ b/drivers/net/ethernet/intel/igc/igc_tsn.c
@@ -7,6 +7,12 @@
 #include "igc_hw.h"
 #include "igc_tsn.h"
 
+#define MIN_MULTPLIER_TX_MIN_FRAG	0
+#define MAX_MULTPLIER_TX_MIN_FRAG	3
+/* Frag size is based on the Section 8.12.2 of the SW User Manual */
+#define TX_MIN_FRAG_SIZE		64
+#define TX_MAX_FRAG_SIZE	(TX_MIN_FRAG_SIZE * (MAX_MULTPLIER_TX_MIN_FRAG + 1))
+
 DEFINE_STATIC_KEY_FALSE(igc_fpe_enabled);
 
 static int igc_fpe_init_smd_frame(struct igc_ring *ring,
@@ -129,6 +135,7 @@ static const struct ethtool_mmsv_ops igc_mmsv_ops = {
 
 void igc_fpe_init(struct igc_adapter *adapter)
 {
+	adapter->fpe.tx_min_frag_size = TX_MIN_FRAG_SIZE;
 	ethtool_mmsv_init(&adapter->fpe.mmsv, adapter->netdev, &igc_mmsv_ops);
 }
 
@@ -279,7 +286,7 @@ static int igc_tsn_disable_offload(struct igc_adapter *adapter)
 	tqavctrl = rd32(IGC_TQAVCTRL);
 	tqavctrl &= ~(IGC_TQAVCTRL_TRANSMIT_MODE_TSN |
 		      IGC_TQAVCTRL_ENHANCED_QAV | IGC_TQAVCTRL_FUTSCDDIS |
-		      IGC_TQAVCTRL_PREEMPT_ENA);
+		      IGC_TQAVCTRL_PREEMPT_ENA | IGC_TQAVCTRL_MIN_FRAG_MASK);
 
 	wr32(IGC_TQAVCTRL, tqavctrl);
 
@@ -325,12 +332,34 @@ static void igc_tsn_set_retx_qbvfullthreshold(struct igc_adapter *adapter)
 	wr32(IGC_RETX_CTL, retxctl);
 }
 
+static u8 igc_fpe_get_frag_size_mult(const struct fpe_t *fpe)
+{
+	u8 mult = (fpe->tx_min_frag_size / TX_MIN_FRAG_SIZE) - 1;
+
+	return clamp_t(u8, mult, MIN_MULTPLIER_TX_MIN_FRAG,
+		       MAX_MULTPLIER_TX_MIN_FRAG);
+}
+
+u32 igc_fpe_get_supported_frag_size(u32 frag_size)
+{
+	const u32 supported_sizes[] = {64, 128, 192, 256};
+
+	/* Find the smallest supported size that is >= frag_size */
+	for (int i = 0; i < ARRAY_SIZE(supported_sizes); i++) {
+		if (frag_size <= supported_sizes[i])
+			return supported_sizes[i];
+	}
+
+	return TX_MAX_FRAG_SIZE; /* Should not happen, value > 256 is blocked by ethtool */
+}
+
 static int igc_tsn_enable_offload(struct igc_adapter *adapter)
 {
 	struct igc_hw *hw = &adapter->hw;
 	u32 tqavctrl, baset_l, baset_h;
 	u32 sec, nsec, cycle, rxpbs;
 	ktime_t base_time, systim;
+	u32 frag_size_mult;
 	int i;
 
 	wr32(IGC_TSAUXC, 0);
@@ -502,13 +531,15 @@ static int igc_tsn_enable_offload(struct igc_adapter *adapter)
 	}
 
 	tqavctrl = rd32(IGC_TQAVCTRL) & ~(IGC_TQAVCTRL_FUTSCDDIS |
-		   IGC_TQAVCTRL_PREEMPT_ENA);
-
+		   IGC_TQAVCTRL_PREEMPT_ENA | IGC_TQAVCTRL_MIN_FRAG_MASK);
 	tqavctrl |= IGC_TQAVCTRL_TRANSMIT_MODE_TSN | IGC_TQAVCTRL_ENHANCED_QAV;
 
 	if (adapter->fpe.mmsv.pmac_enabled)
 		tqavctrl |= IGC_TQAVCTRL_PREEMPT_ENA;
 
+	frag_size_mult = igc_fpe_get_frag_size_mult(&adapter->fpe);
+	tqavctrl |= FIELD_PREP(IGC_TQAVCTRL_MIN_FRAG_MASK, frag_size_mult);
+
 	adapter->qbv_count++;
 
 	cycle = adapter->cycle_time;
diff --git a/drivers/net/ethernet/intel/igc/igc_tsn.h b/drivers/net/ethernet/intel/igc/igc_tsn.h
index 7ba232ef37c9..7491fd65b846 100644
--- a/drivers/net/ethernet/intel/igc/igc_tsn.h
+++ b/drivers/net/ethernet/intel/igc/igc_tsn.h
@@ -14,7 +14,7 @@ enum igc_txd_popts_type {
 DECLARE_STATIC_KEY_FALSE(igc_fpe_enabled);
 
 void igc_fpe_init(struct igc_adapter *adapter);
-u32 igc_fpe_get_supported_frag_size(u32 user_frag_size);
+u32 igc_fpe_get_supported_frag_size(u32 frag_size);
 int igc_tsn_offload_apply(struct igc_adapter *adapter);
 int igc_tsn_reset(struct igc_adapter *adapter);
 void igc_tsn_adjust_txtime_offset(struct igc_adapter *adapter);
diff --git a/net/ethtool/mm.c b/net/ethtool/mm.c
index ad9b40034003..4c395cd949ab 100644
--- a/net/ethtool/mm.c
+++ b/net/ethtool/mm.c
@@ -153,7 +153,7 @@ const struct nla_policy ethnl_mm_set_policy[ETHTOOL_A_MM_MAX + 1] = {
 	[ETHTOOL_A_MM_VERIFY_TIME]	= NLA_POLICY_RANGE(NLA_U32, 1, 128),
 	[ETHTOOL_A_MM_TX_ENABLED]	= NLA_POLICY_MAX(NLA_U8, 1),
 	[ETHTOOL_A_MM_PMAC_ENABLED]	= NLA_POLICY_MAX(NLA_U8, 1),
-	[ETHTOOL_A_MM_TX_MIN_FRAG_SIZE]	= NLA_POLICY_RANGE(NLA_U32, 60, 252),
+	[ETHTOOL_A_MM_TX_MIN_FRAG_SIZE]	= NLA_POLICY_RANGE(NLA_U32, 60, 256),
 };
 
 static void mm_state_to_cfg(const struct ethtool_mm_state *state,
-- 
2.34.1


