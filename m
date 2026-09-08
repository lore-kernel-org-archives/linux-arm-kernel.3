Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9117C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 05:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EVHk0NXXIU8EHUIjtyFuKryvLqKxApr9W8JeHmHPt8=; b=eTMN7jI7sgkN853kftkR+OqisA
	BbW/8ltX1kDibItOs7NBIf8y7gFo4/oRrDFjwhaX07qBZ2NEs6mfU/VA65e0MsOC1f2hA1wXsfGO7
	iMTBOxXkj2L+jzc6OV/qt68eUg2cUzpuMIPu9bZorlnLjb8s8Z1t4TGhYuwHlk00IHWpeUeOqj+R7
	DqJN1KP0fsOt7N5IuvyiSUQ28jeDSMiBz0qyO6K6yK3krxRXws4yH5dXOR6Rq9CmJp12tZRQC84Ec
	e0uTzrapHtLQ2X2Rchh22MN4vq5kEEHXWE7+pf0XyCqQ+9u5iSibJ+PpM3rXkpnbf/F5jZ3nNSqC+
	Dil7GTJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oMW-000000083yV-2uYR;
	Tue, 08 Sep 2026 05:27:18 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oMU-000000083x4-0yPO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 05:27:15 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso3008578a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 22:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845233; x=1789450033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5EVHk0NXXIU8EHUIjtyFuKryvLqKxApr9W8JeHmHPt8=;
        b=TtVHGPTgQikoOQpU2kNjBkrWqM36Art58f0P/gSTXza+lN/VJ5ENGRk8u3MBsTpBPJ
         9LXVwFdBrGsn0EriSzI2/hVf9GVS0K85qR5UPc3nKjOwFfck9rJ94VFHnN50+LqUHNo6
         CFlps2uBwjoXxogSK16ceWZCGKQ0d4is7Llq3z6nY9eASJ+6Ux5RKvfv3myUWOE4f8BM
         l6C1wkFZscNsMfbrgNawp7hpbuEHU6rT4qVKugyA47UJowUOfr2WRFWBLJhKPQKxKld+
         HqVEM/Cu7O1kyRHoh76D5RiTtceXmrpo9kWSe9+zSO41S5+JIkdNJcJ7VsE/VUyD996M
         7KiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845233; x=1789450033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5EVHk0NXXIU8EHUIjtyFuKryvLqKxApr9W8JeHmHPt8=;
        b=V3kzqjOTiKe7vhlxbrdyfsVABDJUk5f+UvYr/C9Sjv6dlmL7FxM3T3C0xzMJdxYsMY
         f/0qdRb5VUV/VY75/V4XS8gnUtDKjATuxQAqxORYqE3tjEUgLoS9L6lwI+dIlg/RMTf2
         Z9f5A302JVTg/+rCFzQ8x1axjdpT8DfbbwpawuPZIrDSGlz2myJHeuVlMtgf8QoETRbc
         eJhj909vEQLq2g5Hjkjd+PHxyb5F2zgxxEGC2VTnN5Lgqnd4HADq49AgeLfJunbLf50e
         cMqonwtuLQFKri5SYD3Gm2yU0XnGXEKzQbjGhwcQEw9tUa/0ugm5w1JjB5r2KlnjDBtz
         TV0g==
X-Gm-Message-State: AFuF++kmrwjGpst3VfBMV21+r+HBE2ktTC1iu6aBaEKY+MqR+Znq3wdK
	yd+I5ZcfTL9cfIEO6nEXzr4Rv5Xtyhle/4G41nKVOFVujACUTa8WuL3D
X-Gm-Gg: AYBFou3FXPnqoaedZxy21im6f++P/WgouOo1sD7vgAtM9mqfq+b5+tfSIjrGvykWfAS
	sMIWTgl05P01EuRVFtawaJOiCaYWljj49Hz2xMSZuNsIDnYjjWSPC/Ka7PsRIuUMShRHUZnCzWS
	0yc1XFsaRQU2L+hbCx6d9EVWgcMguSz6FZF4zOX7xawsyUKstYYbykP2HplUezWDY+kdlqGVmpY
	NQAIY2z53HRk4/bShexTmfxTrrJVlX/N7tnIgxto+zWHzbCYnCJoKqlkCHqElbcYuTUSJymUzA+
	524pW/Bg5T8iOPm23pyBbaSoAU0xda3WWqw/SmFPG/Kc0Xko6dfokQuVFqphd+wMxdkxNsyUq9U
	MLeR8t9H9Wk3vhaVUnb8dTOla2RlbkLgEQxXrjc8z1UpTerYIDRUn19Ag7Oole93HeUYOHbHa63
	wO3G3pL1ej0tlorzUhPqClO8GEVsTIlhYHJjiEODYtjMxt44ElXZxqpnaElwPADTdnm6vi1IsIF
	y8fQtqbUFgxeElzARBj1eKu
X-Received: by 2002:a17:90b:4d06:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-39b2614df74mr38607866a91.1.1788845233163;
        Mon, 07 Sep 2026 22:27:13 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:27:12 -0700 (PDT)
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
Subject: [PATCH net-next v3 07/10] net: marvell: fix typos in comments
Date: Tue,  8 Sep 2026 10:55:59 +0530
Message-ID: <20260908052602.27497-8-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908052602.27497-1-hemanth.selam@gmail.com>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_222714_371658_A2A3ECF6 
X-CRM114-Status: GOOD (  21.64  )
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
 drivers/net/ethernet/marvell/mvpp2/mvpp2.h              | 2 +-
 drivers/net/ethernet/marvell/mvpp2/mvpp2_prs.c          | 8 ++++----
 drivers/net/ethernet/marvell/octeontx2/af/npc.h         | 4 ++--
 drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c     | 2 +-
 drivers/net/ethernet/marvell/octeontx2/nic/cn10k.c      | 2 +-
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_dcbnl.c | 2 +-
 drivers/net/ethernet/marvell/pxa168_eth.c               | 4 ++--
 7 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
index 061fcd444d50..3ed5670f01c2 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
@@ -729,7 +729,7 @@
 #define MVPP2_MAX_TXQ			8
 
 /* MVPP2_MAX_TSO_SEGS is the maximum number of fragments to allow in the GSO
- * skb. As we need a maxium of two descriptors per fragments (1 header, 1 data),
+ * skb. As we need a maximum of two descriptors per fragments (1 header, 1 data),
  * multiply this value by two to count the maximum number of skb descs needed.
  */
 #define MVPP2_MAX_TSO_SEGS		300
diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_prs.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_prs.c
index 93e978bdf303..ad677cfddb4d 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_prs.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_prs.c
@@ -382,7 +382,7 @@ static int mvpp2_prs_flow_find(struct mvpp2 *priv, int flow)
 	struct mvpp2_prs_entry pe;
 	int tid;
 
-	/* Go through the all entires with MVPP2_PRS_LU_FLOWS */
+	/* Go through the all entries with MVPP2_PRS_LU_FLOWS */
 	for (tid = MVPP2_PRS_TCAM_SRAM_SIZE - 1; tid >= 0; tid--) {
 		u8 bits;
 
@@ -1212,7 +1212,7 @@ static void mvpp2_prs_mh_init(struct mvpp2 *priv)
 	mvpp2_prs_hw_write(priv, &pe);
 }
 
-/* Set default entires (place holder) for promiscuous, non-promiscuous and
+/* Set default entries (place holder) for promiscuous, non-promiscuous and
  * multicast MAC addresses
  */
 static void mvpp2_prs_mac_init(struct mvpp2 *priv)
@@ -2241,7 +2241,7 @@ mvpp2_prs_mac_da_range_find(struct mvpp2 *priv, int pmap, const u8 *da,
 	struct mvpp2_prs_entry pe;
 	int tid;
 
-	/* Go through the all entires with MVPP2_PRS_LU_MAC */
+	/* Go through the all entries with MVPP2_PRS_LU_MAC */
 	for (tid = MVPP2_PE_MAC_RANGE_START;
 	     tid <= MVPP2_PE_MAC_RANGE_END; tid++) {
 		unsigned int entry_pmap;
@@ -2539,7 +2539,7 @@ int mvpp2_prs_def_flow(struct mvpp2_port *port)
 
 	/* Such entry not exist */
 	if (tid < 0) {
-		/* Go through the all entires from last to first */
+		/* Go through the all entries from last to first */
 		tid = mvpp2_prs_tcam_first_free(port->priv,
 						MVPP2_PE_LAST_FREE_TID,
 					       MVPP2_PE_FIRST_FREE_TID);
diff --git a/drivers/net/ethernet/marvell/octeontx2/af/npc.h b/drivers/net/ethernet/marvell/octeontx2/af/npc.h
index 719b3618eeb5..309244fe8754 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/npc.h
+++ b/drivers/net/ethernet/marvell/octeontx2/af/npc.h
@@ -84,7 +84,7 @@ enum npc_kpu_lc_ltype {
 	NPC_LT_LC_CUSTOM1 = 0xF,
 };
 
-/* Don't modify Ltypes upto SCTP, otherwise it will
+/* Don't modify Ltypes up to SCTP, otherwise it will
  * effect flow tag calculation and thus RSS.
  */
 enum npc_kpu_ld_ltype {
@@ -140,7 +140,7 @@ enum npc_kpu_lg_ltype {
 	NPC_LT_LG_CUSTOM1 = 0xF,
 };
 
-/* Don't modify Ltypes upto SCTP, otherwise it will
+/* Don't modify Ltypes up to SCTP, otherwise it will
  * effect flow tag calculation and thus RSS.
  */
 enum npc_kpu_lh_ltype {
diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
index 153eb57bad06..d80d2c00bd84 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
@@ -4974,7 +4974,7 @@ static void rvu_nix_setup_capabilities(struct rvu *rvu, int blkaddr)
 
 	/* On OcteonTx2 DWRR quantum is directly configured into each of
 	 * the transmit scheduler queues. And PF/VF drivers were free to
-	 * config any value upto 2^24.
+	 * config any value up to 2^24.
 	 * On CN10K, HW is modified, the quantum configuration at scheduler
 	 * queues is in terms of weight. And SW needs to setup a base DWRR MTU
 	 * at NIX_AF_DWRR_RPM_MTU / NIX_AF_DWRR_SDP_MTU. HW will do
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/cn10k.c b/drivers/net/ethernet/marvell/octeontx2/nic/cn10k.c
index 3e1bf22cba69..f98ef5431c90 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/cn10k.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/cn10k.c
@@ -301,7 +301,7 @@ static void cn10k_get_ingress_rate_cfg(u64 rate, u32 *rate_exp,
 	 * policer timeunit * 2^rdiv ie 2 * 2^rdiv usecs, to the token bucket.
 	 * Here policer timeunit is 2 usecs and rate is in bits per sec.
 	 * Since floating point cannot be used below algorithm uses 1000000
-	 * scale factor to support rates upto 100Gbps.
+	 * scale factor to support rates up to 100Gbps.
 	 */
 	tmp = rate * 32 * 2;
 	if (tmp < 256000000) {
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_dcbnl.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_dcbnl.c
index f110dfa42360..91d346d114af 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_dcbnl.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_dcbnl.c
@@ -67,7 +67,7 @@ static int otx2_pfc_txschq_alloc_one(struct otx2_nic *pfvf, u8 prio)
 	if (!req)
 		return -ENOMEM;
 
-	/* Request one schq per level upto max level as configured
+	/* Request one schq per level up to max level as configured
 	 * link config level. These rest of the scheduler can be
 	 * same as hw.txschq_list.
 	 */
diff --git a/drivers/net/ethernet/marvell/pxa168_eth.c b/drivers/net/ethernet/marvell/pxa168_eth.c
index bbbbbba63e15..2370b2ddba6b 100644
--- a/drivers/net/ethernet/marvell/pxa168_eth.c
+++ b/drivers/net/ethernet/marvell/pxa168_eth.c
@@ -514,7 +514,7 @@ static int add_del_hash_entry(struct pxa168_eth_private *pep,
 /*
  * ----------------------------------------------------------------------------
  *  Create an addressTable entry from MAC address info
- *  found in the specifed net_device struct
+ *  found in the specified net_device struct
  *
  *  Input : pointer to ethernet interface network device structure
  *  Output : N/A
@@ -806,7 +806,7 @@ static int rxq_process(struct net_device *dev, int budget)
 		stats->rx_bytes += rx_desc->byte_cnt;
 		/*
 		 * In case received a packet without first / last bits on OR
-		 * the error summary bit is on, the packets needs to be droped.
+		 * the error summary bit is on, the packets needs to be dropped.
 		 */
 		if (((cmd_sts & (RX_FIRST_DESC | RX_LAST_DESC)) !=
 		     (RX_FIRST_DESC | RX_LAST_DESC))
-- 
2.48.1


