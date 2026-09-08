Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348DDC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 05:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5MWj0OBQIEnblZoVl/R41EfExd3TKpD5r96O+gtR9hU=; b=MxrMA6PDwaku+bR25Qvddkt/4n
	YX8IbPPM3YgHCQRblAb0eJ3NlH8ErAeJB9AEu5bY0sqYuhd/99rnQ8+q5mWjo51qkNPddrdmM90Y3
	kPP8J5OsS2P0Pkd7GybrnZJP6W/3RtPM6/OOsnM1w2GaV2+Y5jub/LG6plpeNaSMcC6zCSKWuUQNJ
	b6XNJ+H8FbyUi+tW8F4627Gyjsvyay8FLeUTW8lT8i7Qm+1Pb+GrySdkf6M0HJPdNgXhblnSMb0Ml
	5E2RYmZZXvpHv5vnvzPR2q0ggGBLYQQX9EAu5vTeSYWa9qg/pXU+knk3oi1Iq19XB93KI/P65/frX
	nDL66vwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oLx-000000083fQ-3RNa;
	Tue, 08 Sep 2026 05:26:41 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oLw-000000083eZ-0Fjg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 05:26:41 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2d9b60c652aso49676085ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 22:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845199; x=1789449999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5MWj0OBQIEnblZoVl/R41EfExd3TKpD5r96O+gtR9hU=;
        b=rCllxI/74LEPImxmivtMEyKE8ySJ3aRo3efrvgo0mUnsLo6vWr0d7p7PtZusnpON+c
         tUaRZvYKliTPmbI+TqOYLMP92qeXijHPzarToUiuxysuN/f46uf8XPii8Ne1zfDxMoiY
         XeOpEuqJMoGHhJ7bz/4Fclg/EScXjkDGzgkZ+EQhU75QpsMHTcqg+b3T5S4S7FP8IAzj
         1TwZUrvXAg9UqmuMEmzRx+5A7kdqkrymYAa/IeMMNW3LeJ0KzSQTFqHVedHLQTQc6oaK
         aVik+tq3cNqSPv6tvU5CcpLtKsJolfpm/45J2KF1RwZo2c4/TYRpnMHDTLLADUynytt4
         htLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845199; x=1789449999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5MWj0OBQIEnblZoVl/R41EfExd3TKpD5r96O+gtR9hU=;
        b=GNeG3l+O+lW2DTuAQPIqCveTPOqQ7uHqYgz0HgtRyJMwkvRD1HlQWTsdbRe3lE20/H
         lkBR496gPQzY+27keeV7pVBifm+HXofDkkq7B/S0RBFevauf414p1/I9hH+TggqMx22X
         PhtI2lA+dNlQtLaG7TEPaqM2fszWCQFGGNSagIaCn+X8fsdJ71UHKQAsIUPVm6TwW3Hz
         t7+VcZBqxMg7u/mRAH0vxjuhxzat/UZpDPWvBRE5xg9OnlUE5+pNW/Q7iRcMkRz4mvq9
         yveaxnXn8JT6+gAq0YdGRcWCUoMCUOo94chI4pI224rDuC/uLjtxHvFjAF2Ze5G5zjNn
         T+ww==
X-Gm-Message-State: AFuF++kyodCexcfAv8mRZX0dFP8sXnMn93hEi0jSIpkPXt0IAWqAllk6
	i7TXvRyteKhqDb0/22+1lom+N7M5iIm4BqQ52kk6CExFKCSuPUFKXZBh
X-Gm-Gg: AYBFou08ZAcgJ4l9pNR++vRhua17+cWd21TyZqHgAPtbS5nAby+nZ4pceAl5I7UydYn
	Fqgd8CyhvXVbZC9NOWA4l/dlBvQFFXEnMYPcqgc9GPxNSSBVW1bg0IbKxZ7L14ofVykPeikQSH3
	297HwR5tAPawwjXjEPmmQ4hTOtTbv/b/c10zxgLuZ9Jvzvj9XpAmJHYlM2SltBg4+Urftf5QgaH
	rbt/HgK4Wp2SMMoMvKcryxerqHU1qiW312a+wxMPG62GI0t0bKt7qIM/aBSNmhP28y2JpUgSvmN
	m2u39pU9yTaLkto0LSg0zZDDkEZgo8EL4eYVsys9nhMv40fplj+4r4yQAsnLtrqFY4oQZc1PtQe
	Ijd342ojbENpbrTSyA1OiC2rOls1bx/woQ88udF965pBJxMqsn9RE92ZqfdHVmSkG4mZLx9FRa4
	vPYtBXefEdgCPOLq1e+kCijc7VF5rQHk0fFzBrjFgnwPL3To90anSTNvTRNBThd/LLE6DOIlugS
	8OtwEHJuveApi812J1abfKu
X-Received: by 2002:a17:90a:d004:b0:398:c9be:cca8 with SMTP id 98e67ed59e1d1-39b2609f363mr47292487a91.2.1788845198985;
        Mon, 07 Sep 2026 22:26:38 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:26:38 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rahul Verma <rahulv@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 03/10] net: broadcom: fix typos in comments
Date: Tue,  8 Sep 2026 10:55:55 +0530
Message-ID: <20260908052602.27497-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908052602.27497-1-hemanth.selam@gmail.com>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_222640_114367_DA5F6279 
X-CRM114-Status: GOOD (  22.52  )
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

Fix misspellings in comments, found with scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Comments only, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/net/ethernet/broadcom/bcm63xx_enet.c         | 2 +-
 drivers/net/ethernet/broadcom/bcm63xx_enet.h         | 2 +-
 drivers/net/ethernet/broadcom/bcmsysport.h           | 2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x.h          | 4 ++--
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_dcb.c      | 4 ++--
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h      | 2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h | 2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c     | 8 ++++----
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c     | 2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_reg.h      | 4 ++--
 10 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
index 7ef1babfeca6..f6595fdc888d 100644
--- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
@@ -1564,7 +1564,7 @@ static int bcm_enet_set_pauseparam(struct net_device *dev,
 
 	if (priv->has_phy) {
 		if (ecmd->autoneg && (ecmd->rx_pause != ecmd->tx_pause)) {
-			/* asymetric pause mode not supported,
+			/* asymmetric pause mode not supported,
 			 * actually possible but integrated PHY has RO
 			 * asym_pause bit */
 			return -EINVAL;
diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.h b/drivers/net/ethernet/broadcom/bcm63xx_enet.h
index 78f1830fb3cb..ba8f42cf5fb2 100644
--- a/drivers/net/ethernet/broadcom/bcm63xx_enet.h
+++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.h
@@ -265,7 +265,7 @@ struct bcm_enet_priv {
 	/* number of available descriptor for tx */
 	int tx_desc_count;
 
-	/* next tx descriptor avaiable */
+	/* next tx descriptor available */
 	int tx_curr_desc;
 
 	/* next dirty tx descriptor to reclaim */
diff --git a/drivers/net/ethernet/broadcom/bcmsysport.h b/drivers/net/ethernet/broadcom/bcmsysport.h
index a34296f989f1..6f807e96dbd8 100644
--- a/drivers/net/ethernet/broadcom/bcmsysport.h
+++ b/drivers/net/ethernet/broadcom/bcmsysport.h
@@ -402,7 +402,7 @@ struct bcm_rsb {
 #define TDMA_DESC_RING_BASE(i)		(TDMA_DESC_RING_00_BASE + \
 					((i) * TDMA_DESC_RING_SIZE))
 
-/* Ring indexed register addreses */
+/* Ring indexed register addresses */
 #define TDMA_DESC_RING_HEAD_TAIL_PTR(i)	(TDMA_DESC_RING_BASE(i) + \
 					RING_HEAD_TAIL_PTR)
 #define TDMA_DESC_RING_COUNT(i)		(TDMA_DESC_RING_BASE(i) + \
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
index 9580ab83d387..28ea4a33f245 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
@@ -280,7 +280,7 @@ enum {
  * (db_msg_sz 1 << 7 * cid + 0x40 DPM offset) it can come up with a valid number
  * We must avoid coming up with cid 8 for iscsi since according to this method
  * the designated UIO cid will come out 0 and it has a special handling for that
- * case which doesn't suit us. Therefore will will cieling to closes cid which
+ * case which doesn't suit us. Therefore will cieling to closes cid which
  * has least signigifcant nibble 8 and if it is 8 we will move forward to 0x18.
  */
 
@@ -666,7 +666,7 @@ struct bnx2x_fastpath {
 				 MAX_TX_DESC_CNT * NEXT_PAGE_TX_DESC_CNT)
 /* max BDs per tx packet w/o next_pages:
  * START_BD		- describes packed
- * START_BD(splitted)	- includes unpaged data segment for GSO
+ * START_BD(split)	- includes unpaged data segment for GSO
  * PARSING_BD		- for TSO and CSUM data
  * PARSING_BD2		- for encapsulation data
  * Frag BDs		- describes pages for frags
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_dcb.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_dcb.c
index 9af81630c8a4..3df8a5988521 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_dcb.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_dcb.c
@@ -1986,7 +1986,7 @@ static void bnx2x_dcbnl_set_pg_tccfg_tx(struct net_device *netdev, int prio,
 		return;
 
 	/**
-	 * bw_pct ignored -	band-width percentage devision between user
+	 * bw_pct ignored -	band-width percentage division between user
 	 *			priorities within the same group is not
 	 *			standard and hence not supported
 	 *
@@ -2038,7 +2038,7 @@ static void bnx2x_dcbnl_get_pg_tccfg_tx(struct net_device *netdev, int prio,
 	DP(BNX2X_MSG_DCB, "prio = %d\n", prio);
 
 	/**
-	 * bw_pct ignored -	band-width percentage devision between user
+	 * bw_pct ignored -	band-width percentage division between user
 	 *			priorities within the same group is not
 	 *			standard and hence not supported
 	 *
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h
index 611efee75834..5297ab578a6f 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h
@@ -2342,7 +2342,7 @@ struct shmem2_region {
 		u32 oem_i2c_data_addr;
 	};
 
-	/* 9 entires for the C2S PCP map for each inner VLAN PCP + 1 default */
+	/* 9 entries for the C2S PCP map for each inner VLAN PCP + 1 default */
 	/* For PCP values 0-3 use the map lower */
 	/* 0xFF000000 - PCP 0, 0x00FF0000 - PCP 1,
 	 * 0x0000FF00 - PCP 2, 0x000000FF PCP 3
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h
index fc7fce642666..b5004aab124d 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h
@@ -582,7 +582,7 @@ static void bnx2x_init_pxp_arb(struct bnx2x *bp, int r_order,
 		REG_WR(bp, PXP2_REG_WR_CDU_MPS, val);
 	}
 
-	/* Validate number of tags suppoted by device */
+	/* Validate number of tags supported by device */
 #define PCIE_REG_PCIER_TL_HDR_FC_ST		0x2980
 	val = REG_RD(bp, PCIE_REG_PCIER_TL_HDR_FC_ST);
 	val &= 0xFF;
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
index ea310057fe3a..84d002b31920 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
@@ -2536,7 +2536,7 @@ static int bnx2x_pbf_update(struct link_params *params, u32 flow_ctrl,
 }
 
 /**
- * bnx2x_get_emac_base - retrive emac base address
+ * bnx2x_get_emac_base - retrieve emac base address
  *
  * @bp:			driver handle
  * @mdc_mdio_access:	access type
@@ -3593,7 +3593,7 @@ static u8 bnx2x_ext_phy_resolve_fc(struct bnx2x_phy *phy,
 	u8 ret = 0;
 	vars->flow_ctrl = BNX2X_FLOW_CTRL_NONE;
 	if (phy->req_flow_ctrl != BNX2X_FLOW_CTRL_AUTO) {
-		/* Update the advertised flow-controled of LD/LP in AN */
+		/* Update the advertised flow-controlled of LD/LP in AN */
 		if (phy->req_line_speed == SPEED_AUTO_NEG)
 			bnx2x_ext_phy_update_adv_fc(phy, params, vars);
 		/* But set the flow-control result as the requested one */
@@ -3743,7 +3743,7 @@ static void bnx2x_warpcore_enable_AN_KR(struct bnx2x_phy *phy,
 		{MDIO_WC_DEVAD, MDIO_WC_REG_CL72_USERB0_CL72_TX_FIR_TAP, 0},
 	};
 	DP(NETIF_MSG_LINK, "Enable Auto Negotiation for KR\n");
-	/* Set to default registers that may be overriden by 10G force */
+	/* Set to default registers that may be overridden by 10G force */
 	for (i = 0; i < ARRAY_SIZE(reg_set); i++)
 		bnx2x_cl45_write(bp, phy, reg_set[i].devad, reg_set[i].reg,
 				 reg_set[i].val);
@@ -5425,7 +5425,7 @@ static void bnx2x_flow_ctrl_resolve(struct bnx2x_phy *phy,
 
 	/* Resolve from gp_status in case of AN complete and not sgmii */
 	if (phy->req_flow_ctrl != BNX2X_FLOW_CTRL_AUTO) {
-		/* Update the advertised flow-controled of LD/LP in AN */
+		/* Update the advertised flow-controlled of LD/LP in AN */
 		if (phy->req_line_speed == SPEED_AUTO_NEG)
 			bnx2x_update_adv_fc(phy, params, vars, gp_status);
 		/* But set the flow-control result as the requested one */
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
index 39eb6ab5f805..277c7bd9c6e7 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
@@ -12669,7 +12669,7 @@ static int bnx2x_set_mc_list(struct bnx2x *bp)
 		if (rc)
 			return rc;
 
-		/* Override the curently configured set of mc filters */
+		/* Override the currently configured set of mc filters */
 		rc = bnx2x_config_mcast(bp, &rparam,
 					BNX2X_MCAST_CMD_SET);
 		if (rc < 0)
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_reg.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_reg.h
index a018f251d198..30943f347164 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_reg.h
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_reg.h
@@ -2236,7 +2236,7 @@ extern const u32 dmae_reg_go_c[];
 /* [RW 1] Output enable for TX PAUSE signal to the MAC. */
 #define NIG_REG_P0_MAC_PAUSE_OUT_EN				 0x185b4
 /* [RW 32] Eight 4-bit configurations for specifying which COS (0-15 for
- * future expansion) each priorty is to be mapped to. Bits 3:0 specify the
+ * future expansion) each priority is to be mapped to. Bits 3:0 specify the
  * COS for priority 0. Bits 31:28 specify the COS for priority 7. The 3-bit
  * priority field is extracted from the outer-most VLAN in receive packet.
  * Only COS 0 and COS 1 are supported in E2. */
@@ -2434,7 +2434,7 @@ extern const u32 dmae_reg_go_c[];
 /* [RW 1] Output enable for TX PAUSE signal to the MAC. */
 #define NIG_REG_P1_MAC_PAUSE_OUT_EN				 0x185c8
 /* [RW 32] Eight 4-bit configurations for specifying which COS (0-15 for
- * future expansion) each priorty is to be mapped to. Bits 3:0 specify the
+ * future expansion) each priority is to be mapped to. Bits 3:0 specify the
  * COS for priority 0. Bits 31:28 specify the COS for priority 7. The 3-bit
  * priority field is extracted from the outer-most VLAN in receive packet.
  * Only COS 0 and COS 1 are supported in E2. */
-- 
2.48.1


