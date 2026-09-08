Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A75C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 05:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMXY7RVPMRlOGVUE1GxTzGvnZE4FGesxKUeRlJf9LaQ=; b=hoPnCpUPhQwjC54WxoXVaWwBfP
	5nUPt4sQz1uHEV9PixZhOhjTx1Z9Nl7gcxpiMyV4Y1pvNt1MTQgcXXc31gFICIP/NewPhiaqrbkIl
	QD2RDjMBmw55wKmLoRgZ8XTKT5UUsU/ISEfXWv8P4nG4y6KmrQroLFtfvuenVYNrvmYCky6wuOshU
	5GohXSPe8bcHk4rEx5AyWFUnAUwmdoZMDOBZzx9yAX/mzR11sYMayXu53CusqkzhDUj/cV10Mtpe8
	Iy7rWWoEfKwpDpJpgZx0Gt2rihM4lXkVl2sJSig21ER4qy3FWO9ceSyTzYHMo2u7BJ25LMurCMhKL
	IWXAa6Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oMp-0000000849r-3yz0;
	Tue, 08 Sep 2026 05:27:35 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oMl-0000000846J-0X7k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 05:27:34 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-39b24d114d4so4360726a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 22:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845250; x=1789450050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qMXY7RVPMRlOGVUE1GxTzGvnZE4FGesxKUeRlJf9LaQ=;
        b=Io6VpAx61x9XKzLWeZ+mBuMD866F2xjwzglzifwDFNxVnFYwwwU61gl96leLjfOR2z
         yKEfFhedB0x15DOHM5UuXw45cwud0ifRvVw7Jn0kIGDpQ8OgnFzghw4YT6JI+XpyXsob
         UhC+GkcC7F9XjaXKOlXjeqq+c7ebnM0ZoonBKnYBWyjKTY5DXLzUeEudq6l1OhsvTqDW
         z6gTJriY5XJ2pvTScIDp7yEpj8ALBgQN0k4U7vFzj05PWVvUZvd8EPTPdfZpcNxYRrKs
         nHvTfNGHhTAidf/P0rifWkzF3QCmw/KpFzBxxrWPGrrb5uspgLsO5mY3DUIFKUeG1r5n
         UNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845250; x=1789450050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qMXY7RVPMRlOGVUE1GxTzGvnZE4FGesxKUeRlJf9LaQ=;
        b=tAIA1qMvYkCEhQOyYjwTGFV6D0cO4CG/ofn5BDcpcvWj9igsgRvCnt7iSnS1Ot7FPI
         j5qsBjosZ8E7ZG3XLa/TU5d0iEZH0/S7QQCDladJh0c4sAiHw1Jw3YFkVzYCNTfSmvs6
         Zj+HxVQgzS7nCN6kUpndFrKIK9wmZbTq65bbZ1v3FpVo94OMFGRqe2U8Y6/G374kHOC2
         6wPYA8p6YG+zdsyYfSz38t2Fr/bQ8JW/hFMB1V4DNFsp1h1LfabNUd0PsLCobUzPDQ/g
         sCxJrTCv5fT7W610sd+w92cdZ65Zaztz4KOrgZd86fl31QD/DR0kH8QRnhRSdYnl/gi7
         CpDQ==
X-Gm-Message-State: AFuF++klUeCal4i5jOcLlP5iGWnJcCfPbfZJS50FRR7/APfNf7miGhWg
	x7EQAzbCGxQr6pE7kbRniWbSecIxO+O/8FlrAg6hFVq/j/hcC1Drajyu
X-Gm-Gg: AYBFou2vMWvcfuyXX4ETYwS506AbpGulU4qlCuGPHP5lyx+c2c7KTXgxZ9Pjr+PsCLm
	6bk5mwCTtK09hsY0DK4T9ErWF18toUUgYEivmE3KFkT6krTqw944lKAnkOVPcdG43s2o7q8MsBU
	Ayay5P4LoRUikOWnqr/5w4EQU68ASVu2PDG5vyBwZLgeBjU43kiD14U0vuNcFg6sSIB83wUvYVY
	XCtm1h9m01N74aqwf7qVBwXYPyLN4O13dasWmqZ39j2R5/Z094giw36cq7Isnl5O0IbKnmRwqU4
	oy++j67FcTCHfaITuEEClgAASaxKXN+Fknc6tRFZWDe5M0ycvLTUZiJqg7pTkZNjr8LbH47SIG0
	fbJhWEa4onbo0LXE7djUTpoBcyilKYdh2c1nHL/nz5xvSkkIh5n6m3nPMcdJf0+ikQV714b4i0y
	pvNfKosvaM4NlahhuyjCGuKDlREGffqM4cYpgkLTDJNEMcH2fIYccSnFTZpMNoyoeELjDnLrb/q
	9z0Jwb+UrH0LQ==
X-Received: by 2002:a17:90a:d44b:b0:396:4cbf:45bc with SMTP id 98e67ed59e1d1-39b26203f11mr43064219a91.16.1788845250288;
        Mon, 07 Sep 2026 22:27:30 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:27:29 -0700 (PDT)
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
Subject: [PATCH net-next v3 09/10] net: atheros: fix typos in comments
Date: Tue,  8 Sep 2026 10:56:01 +0530
Message-ID: <20260908052602.27497-10-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908052602.27497-1-hemanth.selam@gmail.com>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_222731_210411_F30D43E6 
X-CRM114-Status: GOOD (  18.13  )
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
 drivers/net/ethernet/atheros/atl1c/atl1c_hw.h   | 2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e.h      | 2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e_hw.c   | 2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e_main.c | 2 +-
 drivers/net/ethernet/atheros/atlx/atl1.c        | 2 +-
 drivers/net/ethernet/atheros/atlx/atl2.c        | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/atheros/atl1c/atl1c_hw.h b/drivers/net/ethernet/atheros/atl1c/atl1c_hw.h
index c567c920628f..8f03bb561d44 100644
--- a/drivers/net/ethernet/atheros/atl1c/atl1c_hw.h
+++ b/drivers/net/ethernet/atheros/atl1c/atl1c_hw.h
@@ -659,7 +659,7 @@ void atl1c_post_phy_linkchg(struct atl1c_hw *hw, u16 link_speed);
 /* INT-triggle/SMB Control Register */
 #define REG_SMB_STAT_TIMER		0x15C4	/* 2us resolution */
 #define SMB_STAT_TIMER_MASK		0xFFFFFF
-#define REG_TINT_TPD_THRESH             0x15C8 /* tpd th to trig intrrupt */
+#define REG_TINT_TPD_THRESH             0x15C8 /* tpd th to trig interrupt */
 
 /* Mail box */
 #define MB_RFDX_PROD_IDX_MASK		0xFFFF
diff --git a/drivers/net/ethernet/atheros/atl1e/atl1e.h b/drivers/net/ethernet/atheros/atl1e/atl1e.h
index 9fcad783c939..6b0066f47e9e 100644
--- a/drivers/net/ethernet/atheros/atl1e/atl1e.h
+++ b/drivers/net/ethernet/atheros/atl1e/atl1e.h
@@ -381,7 +381,7 @@ struct atl1e_rx_page {
 	u8		*addr;   /* receive rage virtual address */
 	dma_addr_t	write_offset_dma;  /* the DMA address which contain the
 					      receive data offset in the page */
-	u32		*write_offset_addr; /* the virtaul address which contain
+	u32		*write_offset_addr; /* the virtual address which contain
 					     the receive data offset in the page */
 	u32		read_offset;       /* the offset where we have read */
 };
diff --git a/drivers/net/ethernet/atheros/atl1e/atl1e_hw.c b/drivers/net/ethernet/atheros/atl1e/atl1e_hw.c
index fa89bc27f62d..25d3e7469058 100644
--- a/drivers/net/ethernet/atheros/atl1e/atl1e_hw.c
+++ b/drivers/net/ethernet/atheros/atl1e/atl1e_hw.c
@@ -369,7 +369,7 @@ static int atl1e_phy_setup_autoneg_adv(struct atl1e_hw *hw)
  *
  * hw - Struct containing variables accessed by shared code
  *
- * Sets bit 15 and 12 of the MII control regiser (for F001 bug)
+ * Sets bit 15 and 12 of the MII control register (for F001 bug)
  */
 int atl1e_phy_commit(struct atl1e_hw *hw)
 {
diff --git a/drivers/net/ethernet/atheros/atl1e/atl1e_main.c b/drivers/net/ethernet/atheros/atl1e/atl1e_main.c
index 40290028580b..cc6c262868a5 100644
--- a/drivers/net/ethernet/atheros/atl1e/atl1e_main.c
+++ b/drivers/net/ethernet/atheros/atl1e/atl1e_main.c
@@ -2117,7 +2117,7 @@ static int atl1e_suspend(struct pci_dev *pdev, pm_message_t state)
 			wol_ctrl_data |= WOL_MAGIC_EN | WOL_MAGIC_PME_EN;
 
 		if (wufc & AT_WUFC_LNKC) {
-		/* if orignal link status is link, just wait for retrive link */
+		/* if original link status is link, just wait for retrieve link */
 			if (mii_bmsr_data & BMSR_LSTATUS) {
 				for (i = 0; i < AT_SUSPEND_LINK_TIMEOUT; i++) {
 					msleep(100);
diff --git a/drivers/net/ethernet/atheros/atlx/atl1.c b/drivers/net/ethernet/atheros/atlx/atl1.c
index 98a4d089270e..179d74e93efd 100644
--- a/drivers/net/ethernet/atheros/atlx/atl1.c
+++ b/drivers/net/ethernet/atheros/atlx/atl1.c
@@ -628,7 +628,7 @@ static s32 atl1_phy_leave_power_saving(struct atl1_hw *hw)
  * Resets the PHY and make all config validate
  * hw - Struct containing variables accessed by shared code
  *
- * Sets bit 15 and 12 of the MII Control regiser (for F001 bug)
+ * Sets bit 15 and 12 of the MII Control register (for F001 bug)
  */
 static s32 atl1_phy_reset(struct atl1_hw *hw)
 {
diff --git a/drivers/net/ethernet/atheros/atlx/atl2.c b/drivers/net/ethernet/atheros/atlx/atl2.c
index 5560d5cc3169..c9aca219ec9c 100644
--- a/drivers/net/ethernet/atheros/atlx/atl2.c
+++ b/drivers/net/ethernet/atheros/atlx/atl2.c
@@ -2591,7 +2591,7 @@ static s32 atl2_phy_setup_autoneg_adv(struct atl2_hw *hw)
  *
  * hw - Struct containing variables accessed by shared code
  *
- * Sets bit 15 and 12 of the MII Control regiser (for F001 bug)
+ * Sets bit 15 and 12 of the MII Control register (for F001 bug)
  */
 static s32 atl2_phy_commit(struct atl2_hw *hw)
 {
-- 
2.48.1


