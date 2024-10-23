Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9D9D0BB42
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfpk+F3SfrIPqxvB7HhWP7UX3rXUvM+HByqIQxbUDN0=; b=qCUARrwvevxWhjmOacf2QIumNp
	YGpoyBtqTnUNJA803Xzj7kECY86WPDYgtmn6Z5pfBpRKk7zRVNiilcL5IGNzqBN8GmzazPDRFd2bv
	PvoiHk2+bQF9DdoipjWTmU1rYep7lc23zMZjxS1FD6zxMhX77arC1CFVHsPk370OOMjdUF1ssdcH9
	Ei+/mL+8ymlvXf5EhWiaVJjJE97qUt8gk3FKVlF/UqlpyfKgzwpWR87YiiAeYqyKAAtsr9JNTwwnT
	ZVqJhXhpmTxbNm7h6XMZViFf2zKdU/pgyKLs6jbcT+uG1BfjzFgi/a2j3LsVYWjQeNPvqYhFxdZO0
	YNK42kWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jcQ-0000000G4CD-3x4y;
	Wed, 23 Oct 2024 22:14:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jR8-0000000G2Es-3c22
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1729720958; x=1761256958;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=J8qCXnNG/OAP9j8DsIe5XLMigohB45RpGMYrjnzBjeQ=;
  b=w/7RxdVJEkHX4UzvKhFH9ARUhXkjWmmMM6/i+j/fOlAubbDzuqIe2CKN
   9FrqVA8YedzP7YbNTq/MItiqod8ktNHFualHo8V1kF3P/K+dRst9Xzvk6
   b7I06BzaaNaDCbkBmZc5L1cpL3a/ArfrgobJgxrRmrxzZ/K3aYEW8hHPp
   gHmYAhTdW5ku0Rs57JvbH1filFoXircgl2izQbjGBC6y41OzAiKxnB5S9
   lKh9WIUqxgFNzzlL2E8FF8ToNDF/86/zuFgAB8RogJGnM0Y+J7wDS27+s
   nTYF7vPNXJ0AURREuq0qKbaS6NEKdL8GIzA4OW2Daf9Av2y0+yz+LtGxJ
   w==;
X-CSE-ConnectionGUID: wd8IJW4NTJ64cR86gqDN2Q==
X-CSE-MsgGUID: pOvqRvkuSWyNcGFxl+BJxQ==
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="200831268"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Oct 2024 15:02:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 23 Oct 2024 15:02:08 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 23 Oct 2024 15:02:04 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 24 Oct 2024 00:01:26 +0200
Subject: [PATCH net-next v2 07/15] net: lan969x: add register diffs to
 match data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-sparx5-lan969x-switch-driver-2-v2-7-a0b5fae88a0f@microchip.com>
References: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
In-Reply-To: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Lars Povlsen
	<lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	<horatiu.vultur@microchip.com>, <jensemil.schulzostergaard@microchip.com>,
	<Parthiban.Veerasooran@microchip.com>, <Raju.Lakkaraju@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <jacob.e.keller@intel.com>,
	<ast@fiberby.net>, <maxime.chevallier@bootlin.com>, <horms@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Steen Hegelund
	<steen.hegelund@microchip.com>, <devicetree@vger.kernel.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_150239_322661_E3396E0F 
X-CRM114-Status: GOOD (  18.12  )
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

Add new file lan969x_regs.c that defines all the register differences
for lan969x, and add it to the lan969x match data.

GW_DEV2G5_PHASE_DETECTOR_CTRL, FP_DEV2G5_PHAD_CTRL_PHAD_ENA and
FP_DEV2G5_PHAD_CTRL_PHAD_FAILED are required by the new register macros
which was introduced earlier. Add these for Sparx5 also.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/lan969x/Makefile    |   2 +-
 drivers/net/ethernet/microchip/lan969x/lan969x.c   |  12 ++
 drivers/net/ethernet/microchip/lan969x/lan969x.h   |  11 +
 .../net/ethernet/microchip/lan969x/lan969x_regs.c  | 222 +++++++++++++++++++++
 .../net/ethernet/microchip/sparx5/sparx5_regs.c    |   5 +-
 .../net/ethernet/microchip/sparx5/sparx5_regs.h    |   5 +-
 6 files changed, 254 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan969x/Makefile b/drivers/net/ethernet/microchip/lan969x/Makefile
index f3d9dfcd8c30..ff40e7e5d420 100644
--- a/drivers/net/ethernet/microchip/lan969x/Makefile
+++ b/drivers/net/ethernet/microchip/lan969x/Makefile
@@ -5,7 +5,7 @@
 
 obj-$(CONFIG_LAN969X_SWITCH) += lan969x-switch.o
 
-lan969x-switch-y := lan969x.o
+lan969x-switch-y := lan969x_regs.o lan969x.o
 
 # Provide include files
 ccflags-y += -I$(srctree)/drivers/net/ethernet/microchip/fdma
diff --git a/drivers/net/ethernet/microchip/lan969x/lan969x.c b/drivers/net/ethernet/microchip/lan969x/lan969x.c
index 488af2a8ee3c..0b47e4e66058 100644
--- a/drivers/net/ethernet/microchip/lan969x/lan969x.c
+++ b/drivers/net/ethernet/microchip/lan969x/lan969x.c
@@ -92,10 +92,22 @@ static const struct sparx5_main_io_resource lan969x_main_iomap[] =  {
 	{ TARGET_ASM,                 0x3200000, 1 }, /* 0xe3200000 */
 };
 
+static const struct sparx5_regs lan969x_regs = {
+	.tsize = lan969x_tsize,
+	.gaddr = lan969x_gaddr,
+	.gcnt  = lan969x_gcnt,
+	.gsize = lan969x_gsize,
+	.raddr = lan969x_raddr,
+	.rcnt  = lan969x_rcnt,
+	.fpos  = lan969x_fpos,
+	.fsize = lan969x_fsize,
+};
+
 const struct sparx5_match_data lan969x_desc = {
 	.iomap      = lan969x_main_iomap,
 	.iomap_size = ARRAY_SIZE(lan969x_main_iomap),
 	.ioranges   = 2,
+	.regs       = &lan969x_regs,
 };
 EXPORT_SYMBOL_GPL(lan969x_desc);
 
diff --git a/drivers/net/ethernet/microchip/lan969x/lan969x.h b/drivers/net/ethernet/microchip/lan969x/lan969x.h
index 0507046ab9af..3b4c9ea30071 100644
--- a/drivers/net/ethernet/microchip/lan969x/lan969x.h
+++ b/drivers/net/ethernet/microchip/lan969x/lan969x.h
@@ -8,8 +8,19 @@
 #define __LAN969X_H__
 
 #include "../sparx5/sparx5_main.h"
+#include "../sparx5/sparx5_regs.h"
 
 /* lan969x.c */
 extern const struct sparx5_match_data lan969x_desc;
 
+/* lan969x_regs.c */
+extern const unsigned int lan969x_tsize[TSIZE_LAST];
+extern const unsigned int lan969x_raddr[RADDR_LAST];
+extern const unsigned int lan969x_rcnt[RCNT_LAST];
+extern const unsigned int lan969x_gaddr[GADDR_LAST];
+extern const unsigned int lan969x_gcnt[GCNT_LAST];
+extern const unsigned int lan969x_gsize[GSIZE_LAST];
+extern const unsigned int lan969x_fpos[FPOS_LAST];
+extern const unsigned int lan969x_fsize[FSIZE_LAST];
+
 #endif
diff --git a/drivers/net/ethernet/microchip/lan969x/lan969x_regs.c b/drivers/net/ethernet/microchip/lan969x/lan969x_regs.c
new file mode 100644
index 000000000000..ace4ba21eec4
--- /dev/null
+++ b/drivers/net/ethernet/microchip/lan969x/lan969x_regs.c
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Microchip lan969x Switch driver
+ *
+ * Copyright (c) 2024 Microchip Technology Inc.
+ */
+
+/* This file is autogenerated by cml-utils 2024-09-30 11:48:29 +0200.
+ * Commit ID: 9d07b8d19363f3cd3590ddb3f7a2e2768e16524b
+ */
+
+#include "lan969x.h"
+
+const unsigned int lan969x_tsize[TSIZE_LAST] = {
+	[TC_DEV10G] = 10,
+	[TC_DEV2G5] = 28,
+	[TC_DEV5G] = 4,
+	[TC_PCS10G_BR] = 10,
+	[TC_PCS5G_BR] = 4,
+};
+
+const unsigned int lan969x_raddr[RADDR_LAST] = {
+	[RA_CPU_PROC_CTRL] = 160,
+	[RA_GCB_SOFT_RST] = 12,
+	[RA_GCB_HW_SGPIO_TO_SD_MAP_CFG] = 20,
+};
+
+const unsigned int lan969x_rcnt[RCNT_LAST] = {
+	[RC_ANA_AC_OWN_UPSID] = 1,
+	[RC_ANA_ACL_VCAP_S2_CFG] = 35,
+	[RC_ANA_ACL_OWN_UPSID] = 1,
+	[RC_ANA_CL_OWN_UPSID] = 1,
+	[RC_ANA_L2_OWN_UPSID] = 1,
+	[RC_ASM_PORT_CFG] = 32,
+	[RC_DSM_BUF_CFG] = 32,
+	[RC_DSM_DEV_TX_STOP_WM_CFG] = 32,
+	[RC_DSM_RX_PAUSE_CFG] = 32,
+	[RC_DSM_MAC_CFG] = 32,
+	[RC_DSM_MAC_ADDR_BASE_HIGH_CFG] = 30,
+	[RC_DSM_MAC_ADDR_BASE_LOW_CFG] = 30,
+	[RC_DSM_TAXI_CAL_CFG] = 6,
+	[RC_GCB_HW_SGPIO_TO_SD_MAP_CFG] = 30,
+	[RC_HSCH_PORT_MODE] = 35,
+	[RC_QFWD_SWITCH_PORT_MODE] = 35,
+	[RC_QSYS_PAUSE_CFG] = 35,
+	[RC_QSYS_ATOP] = 35,
+	[RC_QSYS_FWD_PRESSURE] = 35,
+	[RC_QSYS_CAL_AUTO] = 4,
+	[RC_REW_OWN_UPSID] = 1,
+	[RC_REW_RTAG_ETAG_CTRL] = 35,
+};
+
+const unsigned int lan969x_gaddr[GADDR_LAST] = {
+	[GA_ANA_AC_RAM_CTRL] = 202000,
+	[GA_ANA_AC_PS_COMMON] = 202880,
+	[GA_ANA_AC_MIRROR_PROBE] = 203232,
+	[GA_ANA_AC_SRC] = 201728,
+	[GA_ANA_AC_PGID] = 131072,
+	[GA_ANA_AC_TSN_SF] = 202028,
+	[GA_ANA_AC_TSN_SF_CFG] = 148480,
+	[GA_ANA_AC_TSN_SF_STATUS] = 147936,
+	[GA_ANA_AC_SG_ACCESS] = 202032,
+	[GA_ANA_AC_SG_CONFIG] = 202752,
+	[GA_ANA_AC_SG_STATUS] = 147952,
+	[GA_ANA_AC_SG_STATUS_STICKY] = 202044,
+	[GA_ANA_AC_STAT_GLOBAL_CFG_PORT] = 202048,
+	[GA_ANA_AC_STAT_CNT_CFG_PORT] = 204800,
+	[GA_ANA_AC_STAT_GLOBAL_CFG_ACL] = 202068,
+	[GA_ANA_ACL_COMMON] = 8192,
+	[GA_ANA_ACL_KEY_SEL] = 9204,
+	[GA_ANA_ACL_CNT_B] = 4096,
+	[GA_ANA_ACL_STICKY] = 10852,
+	[GA_ANA_AC_POL_POL_ALL_CFG] = 17504,
+	[GA_ANA_AC_POL_COMMON_BDLB] = 19464,
+	[GA_ANA_AC_POL_COMMON_BUM_SLB] = 19472,
+	[GA_ANA_AC_SDLB_LBGRP_TBL] = 31788,
+	[GA_ANA_CL_PORT] = 65536,
+	[GA_ANA_CL_COMMON] = 87040,
+	[GA_ANA_L2_COMMON] = 561928,
+	[GA_ANA_L3_COMMON] = 370752,
+	[GA_ANA_L3_VLAN_ARP_L3MC_STICKY] = 368580,
+	[GA_ASM_CFG] = 18304,
+	[GA_ASM_PFC_TIMER_CFG] = 15568,
+	[GA_ASM_LBK_WM_CFG] = 15596,
+	[GA_ASM_LBK_MISC_CFG] = 15608,
+	[GA_ASM_RAM_CTRL] = 15684,
+	[GA_EACL_ES2_KEY_SELECT_PROFILE] = 36864,
+	[GA_EACL_CNT_TBL] = 30720,
+	[GA_EACL_POL_CFG] = 38400,
+	[GA_EACL_ES2_STICKY] = 29072,
+	[GA_EACL_RAM_CTRL] = 29112,
+	[GA_GCB_SIO_CTRL] = 560,
+	[GA_HSCH_HSCH_DWRR] = 36480,
+	[GA_HSCH_HSCH_MISC] = 36608,
+	[GA_HSCH_HSCH_LEAK_LISTS] = 37256,
+	[GA_HSCH_SYSTEM] = 37384,
+	[GA_HSCH_MMGT] = 36260,
+	[GA_HSCH_TAS_CONFIG] = 37696,
+	[GA_PTP_PTP_CFG] = 512,
+	[GA_PTP_PTP_TOD_DOMAINS] = 528,
+	[GA_PTP_PHASE_DETECTOR_CTRL] = 628,
+	[GA_QSYS_CALCFG] = 2164,
+	[GA_QSYS_RAM_CTRL] = 2204,
+	[GA_REW_COMMON] = 98304,
+	[GA_REW_PORT] = 49152,
+	[GA_REW_VOE_PORT_LM_CNT] = 90112,
+	[GA_REW_RAM_CTRL] = 93992,
+	[GA_VOP_RAM_CTRL] = 16368,
+	[GA_XQS_SYSTEM] = 5744,
+	[GA_XQS_QLIMIT_SHR] = 6912,
+};
+
+const unsigned int lan969x_gcnt[GCNT_LAST] = {
+	[GC_ANA_AC_SRC] = 67,
+	[GC_ANA_AC_PGID] = 1054,
+	[GC_ANA_AC_TSN_SF_CFG] = 256,
+	[GC_ANA_AC_STAT_CNT_CFG_PORT] = 35,
+	[GC_ANA_ACL_KEY_SEL] = 99,
+	[GC_ANA_ACL_CNT_A] = 1024,
+	[GC_ANA_ACL_CNT_B] = 1024,
+	[GC_ANA_AC_SDLB_LBGRP_TBL] = 5,
+	[GC_ANA_AC_SDLB_LBSET_TBL] = 496,
+	[GC_ANA_CL_PORT] = 35,
+	[GC_ANA_L2_ISDX_LIMIT] = 256,
+	[GC_ANA_L2_ISDX] = 1024,
+	[GC_ANA_L3_VLAN] = 4608,
+	[GC_ASM_DEV_STATISTICS] = 30,
+	[GC_EACL_ES2_KEY_SELECT_PROFILE] = 68,
+	[GC_EACL_CNT_TBL] = 512,
+	[GC_GCB_SIO_CTRL] = 1,
+	[GC_HSCH_HSCH_CFG] = 1120,
+	[GC_HSCH_HSCH_DWRR] = 32,
+	[GC_PTP_PTP_PINS] = 8,
+	[GC_PTP_PHASE_DETECTOR_CTRL] = 8,
+	[GC_REW_PORT] = 35,
+	[GC_REW_VOE_PORT_LM_CNT] = 240,
+};
+
+const unsigned int lan969x_gsize[GSIZE_LAST] = {
+	[GW_ANA_AC_SRC] = 4,
+	[GW_ANA_L2_COMMON] = 712,
+	[GW_ASM_CFG] = 1092,
+	[GW_CPU_CPU_REGS] = 180,
+	[GW_DEV2G5_PHASE_DETECTOR_CTRL] = 12,
+	[GW_FDMA_FDMA] = 448,
+	[GW_GCB_CHIP_REGS] = 180,
+	[GW_HSCH_TAS_CONFIG] = 16,
+	[GW_PTP_PHASE_DETECTOR_CTRL] = 12,
+	[GW_QSYS_PAUSE_CFG] = 988,
+};
+
+const unsigned int lan969x_fpos[FPOS_LAST] = {
+	[FP_CPU_PROC_CTRL_AARCH64_MODE_ENA] = 7,
+	[FP_CPU_PROC_CTRL_L2_RST_INVALIDATE_DIS] = 6,
+	[FP_CPU_PROC_CTRL_L1_RST_INVALIDATE_DIS] = 5,
+	[FP_CPU_PROC_CTRL_BE_EXCEP_MODE] = 4,
+	[FP_CPU_PROC_CTRL_VINITHI] = 3,
+	[FP_CPU_PROC_CTRL_CFGTE] = 2,
+	[FP_CPU_PROC_CTRL_CP15S_DISABLE] = 1,
+	[FP_CPU_PROC_CTRL_PROC_CRYPTO_DISABLE] = 0,
+	[FP_CPU_PROC_CTRL_L2_FLUSH_REQ] = 8,
+	[FP_DEV2G5_PHAD_CTRL_PHAD_ENA] = 5,
+	[FP_DEV2G5_PHAD_CTRL_PHAD_FAILED] = 3,
+	[FP_FDMA_CH_CFG_CH_XTR_STATUS_MODE] = 5,
+	[FP_FDMA_CH_CFG_CH_INTR_DB_EOF_ONLY] = 4,
+	[FP_FDMA_CH_CFG_CH_INJ_PORT] = 3,
+	[FP_PTP_PTP_PIN_CFG_PTP_PIN_ACTION] = 27,
+	[FP_PTP_PTP_PIN_CFG_PTP_PIN_SYNC] = 25,
+	[FP_PTP_PTP_PIN_CFG_PTP_PIN_INV_POL] = 24,
+	[FP_PTP_PHAD_CTRL_PHAD_ENA] = 5,
+	[FP_PTP_PHAD_CTRL_PHAD_FAILED] = 3,
+};
+
+const unsigned int lan969x_fsize[FSIZE_LAST] = {
+	[FW_ANA_AC_PROBE_PORT_CFG_PROBE_PORT_MASK] = 30,
+	[FW_ANA_AC_SRC_CFG_PORT_MASK] = 30,
+	[FW_ANA_AC_PGID_CFG_PORT_MASK] = 30,
+	[FW_ANA_AC_TSN_SF_PORT_NUM] = 7,
+	[FW_ANA_AC_TSN_SF_CFG_TSN_SGID] = 8,
+	[FW_ANA_AC_TSN_SF_STATUS_TSN_SFID] = 8,
+	[FW_ANA_AC_SG_ACCESS_CTRL_SGID] = 8,
+	[FW_ANA_AC_PORT_SGE_CFG_MASK] = 17,
+	[FW_ANA_AC_SDLB_XLB_START_LBSET_START] = 9,
+	[FW_ANA_AC_SDLB_LBGRP_MISC_THRES_SHIFT] = 3,
+	[FW_ANA_AC_SDLB_LBGRP_STATE_TBL_PUP_LBSET_NEXT] = 9,
+	[FW_ANA_AC_SDLB_XLB_NEXT_LBSET_NEXT] = 9,
+	[FW_ANA_AC_SDLB_XLB_NEXT_LBGRP] = 3,
+	[FW_ANA_AC_SDLB_INH_LBSET_ADDR_INH_LBSET_ADDR] = 9,
+	[FW_ANA_L2_AUTO_LRN_CFG_AUTO_LRN_ENA] = 30,
+	[FW_ANA_L2_DLB_CFG_DLB_IDX] = 9,
+	[FW_ANA_L2_TSN_CFG_TSN_SFID] = 8,
+	[FW_ANA_L3_VLAN_MASK_CFG_VLAN_PORT_MASK] = 30,
+	[FW_FDMA_CH_CFG_CH_DCB_DB_CNT] = 2,
+	[FW_GCB_HW_SGPIO_TO_SD_MAP_CFG_SGPIO_TO_SD_SEL] = 7,
+	[FW_HSCH_SE_CFG_SE_DWRR_CNT] = 5,
+	[FW_HSCH_SE_CONNECT_SE_LEAK_LINK] = 14,
+	[FW_HSCH_SE_DLB_SENSE_SE_DLB_DPORT] = 6,
+	[FW_HSCH_HSCH_CFG_CFG_CFG_SE_IDX] = 11,
+	[FW_HSCH_HSCH_LEAK_CFG_LEAK_FIRST] = 14,
+	[FW_HSCH_FLUSH_CTRL_FLUSH_PORT] = 6,
+	[FW_HSCH_FLUSH_CTRL_FLUSH_HIER] = 14,
+	[FW_LRN_COMMON_ACCESS_CTRL_CPU_ACCESS_DIRECT_ROW] = 13,
+	[FW_LRN_MAC_ACCESS_CFG_3_MAC_ENTRY_ISDX_LIMIT_IDX] = 8,
+	[FW_LRN_AUTOAGE_CFG_2_NEXT_ROW] = 13,
+	[FW_PTP_PTP_PIN_INTR_INTR_PTP] = 8,
+	[FW_PTP_PTP_PIN_INTR_ENA_INTR_PTP_ENA] = 8,
+	[FW_PTP_PTP_INTR_IDENT_INTR_PTP_IDENT] = 8,
+	[FW_PTP_PTP_PIN_CFG_PTP_PIN_SELECT] = 3,
+	[FW_QFWD_FRAME_COPY_CFG_FRMC_PORT_VAL] = 6,
+	[FW_QRES_RES_CFG_WM_HIGH] = 11,
+	[FW_QRES_RES_STAT_MAXUSE] = 19,
+	[FW_QRES_RES_STAT_CUR_INUSE] = 19,
+	[FW_QSYS_PAUSE_CFG_PAUSE_START] = 11,
+	[FW_QSYS_PAUSE_CFG_PAUSE_STOP] = 11,
+	[FW_QSYS_ATOP_ATOP] = 11,
+	[FW_QSYS_ATOP_TOT_CFG_ATOP_TOT] = 11,
+	[FW_REW_RTAG_ETAG_CTRL_IPE_TBL] = 6,
+	[FW_XQS_STAT_CFG_STAT_VIEW] = 10,
+	[FW_XQS_QLIMIT_SHR_TOP_CFG_QLIMIT_SHR_TOP] = 14,
+	[FW_XQS_QLIMIT_SHR_ATOP_CFG_QLIMIT_SHR_ATOP] = 14,
+	[FW_XQS_QLIMIT_SHR_CTOP_CFG_QLIMIT_SHR_CTOP] = 14,
+	[FW_XQS_QLIMIT_SHR_QLIM_CFG_QLIMIT_SHR_QLIM] = 14,
+};
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_regs.c b/drivers/net/ethernet/microchip/sparx5/sparx5_regs.c
index 1db212ce3df7..220e81b714d4 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_regs.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_regs.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2024 Microchip Technology Inc.
  */
 
-/* This file is autogenerated by cml-utils 2024-09-24 14:02:24 +0200.
+/* This file is autogenerated by cml-utils 2024-09-30 11:48:29 +0200.
  * Commit ID: 9d07b8d19363f3cd3590ddb3f7a2e2768e16524b
  */
 
@@ -140,6 +140,7 @@ const unsigned int sparx5_gsize[GSIZE_LAST] = {
 	[GW_ANA_L2_COMMON] = 700,
 	[GW_ASM_CFG] = 1088,
 	[GW_CPU_CPU_REGS] = 204,
+	[GW_DEV2G5_PHASE_DETECTOR_CTRL] = 8,
 	[GW_FDMA_FDMA] = 428,
 	[GW_GCB_CHIP_REGS] = 424,
 	[GW_HSCH_TAS_CONFIG] = 12,
@@ -157,6 +158,8 @@ const unsigned int sparx5_fpos[FPOS_LAST] = {
 	[FP_CPU_PROC_CTRL_CP15S_DISABLE] = 6,
 	[FP_CPU_PROC_CTRL_PROC_CRYPTO_DISABLE] = 5,
 	[FP_CPU_PROC_CTRL_L2_FLUSH_REQ] = 1,
+	[FP_DEV2G5_PHAD_CTRL_PHAD_ENA] = 7,
+	[FP_DEV2G5_PHAD_CTRL_PHAD_FAILED] = 6,
 	[FP_FDMA_CH_CFG_CH_XTR_STATUS_MODE] = 7,
 	[FP_FDMA_CH_CFG_CH_INTR_DB_EOF_ONLY] = 6,
 	[FP_FDMA_CH_CFG_CH_INJ_PORT] = 5,
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_regs.h b/drivers/net/ethernet/microchip/sparx5/sparx5_regs.h
index c4e8b581c1f3..ea28130c2341 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_regs.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_regs.h
@@ -4,7 +4,7 @@
  * Copyright (c) 2024 Microchip Technology Inc.
  */
 
-/* This file is autogenerated by cml-utils 2024-09-24 14:02:24 +0200.
+/* This file is autogenerated by cml-utils 2024-09-30 11:48:29 +0200.
  * Commit ID: 9d07b8d19363f3cd3590ddb3f7a2e2768e16524b
  */
 
@@ -151,6 +151,7 @@ enum sparx5_gsize_enum {
 	GW_ANA_L2_COMMON,
 	GW_ASM_CFG,
 	GW_CPU_CPU_REGS,
+	GW_DEV2G5_PHASE_DETECTOR_CTRL,
 	GW_FDMA_FDMA,
 	GW_GCB_CHIP_REGS,
 	GW_HSCH_TAS_CONFIG,
@@ -169,6 +170,8 @@ enum sparx5_fpos_enum {
 	FP_CPU_PROC_CTRL_CP15S_DISABLE,
 	FP_CPU_PROC_CTRL_PROC_CRYPTO_DISABLE,
 	FP_CPU_PROC_CTRL_L2_FLUSH_REQ,
+	FP_DEV2G5_PHAD_CTRL_PHAD_ENA,
+	FP_DEV2G5_PHAD_CTRL_PHAD_FAILED,
 	FP_FDMA_CH_CFG_CH_XTR_STATUS_MODE,
 	FP_FDMA_CH_CFG_CH_INTR_DB_EOF_ONLY,
 	FP_FDMA_CH_CFG_CH_INJ_PORT,

-- 
2.34.1


