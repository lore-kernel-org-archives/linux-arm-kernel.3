Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D71C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 05:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6LsOjIpoezfOQTuidmlHq/lP7hR+WKEHPT5u3b2kG30=; b=FduSjU6JM/glulbED9B8OwrT4P
	pAmYuU1h3DNlSR/NNSjGI9YalA2AG94X3PGYNHQDFOlMuFKRTMGKyY0SyQIc7c+f9oEz3buoiYl1j
	BHMHp8umNMgM74mHNXpSnzKfu8jJOQn9V6l+ec2rle1vxZaFF7JdpGxE/2ECONu1k419oJLqs6w1L
	b3RDLebsw+OQMv/NOsX2b8njUzCWnH/bhF1+ffFcVBDkc1THk6yGU3/RqrEnmQtFq7V0Nnf5YO3B+
	d+P46PvvEZ8QeH0AReNdJFBWkO1LyxRApNjL7HgBkfZd9kxIVikMZBCCZDZ81gL/wQ5rNSjU1Cea/
	4wVbrqFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oMG-000000083oU-0eIi;
	Tue, 08 Sep 2026 05:27:00 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oMC-000000083mV-3hBo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 05:26:58 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-39b9a99469fso219028a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 22:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845216; x=1789450016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6LsOjIpoezfOQTuidmlHq/lP7hR+WKEHPT5u3b2kG30=;
        b=pU1I6L9h0ULlLtaqH0c2G8fi1dbNNkzW/9RyBdOQ62ktHbkGZ3K9IuEk15VqsMODNU
         xxsUZz0Ioc+QhV3NabXr4W7Zjx/YsvkO+gYpNROCvZTUMlgkIUhIf2vfEORpDFcnX2e7
         5ux/3jH9u5pRVAQZxRa150Sd1S/mHk4SXQyF3qoHXis3QZBbig8tnv8qS9tFGSbYVLi8
         u21NjFrhX6zoZhuaYDjQ6NQuq+Sr9jrq1X7Czm0gxA8Wexu2vR9LCjFbGn/vpV270odt
         ld8JgdX+mLatMSbZ0fAW+5CYt8Oo6NUDCgFHk8IMONBVQsc4/JluNkFQYS8FH0ebD6ai
         /azQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845216; x=1789450016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6LsOjIpoezfOQTuidmlHq/lP7hR+WKEHPT5u3b2kG30=;
        b=WmwesHeaIQ6PglcKZRFPuPV2O1v3xoINk62HgUNawbC3prUmsSGnKOu62Q5flnO7w0
         uJLoD5Q5csiMDMPMDmDoNk/+ooiOYhb8BNNDuWPu6WllJwYdNJjYB77Vz2wZiPeBrSVJ
         8HZdU+wSvuCBJnAqfHOIHvd6fobSWdUJ7GInBSoht0ynR9SBNcBWEFR/Ojkz4LEVX/5l
         +VwTtd0AvtBFmb/a4dcbifxJ1DqH3vozlnwGI2juGr2VqpmBiMaBa7oh75+9s1RZXefB
         3YFMZxVSUhSbBAFIczf7kn4A4QuZn5SAz3+O4ECrNxcDCqTGYycQG7Q0Ea6OCJUbythi
         IPnA==
X-Gm-Message-State: AFuF++kWjMVIFabbGJgefKIdiZdjmxhozT7FBu13PInVWk4WNYnIqWBU
	SWqTCq8lHtccQhKD/yClU6fGxQvv/yEUHY4sUvbt1cJN+J8NzNT/kH7u
X-Gm-Gg: AYBFou05ks1Ya1LjCUwvUT8X1O3odC0Q4bzxJ9MVZjxrHX/ASNmFyeHTNVrWB+p40gr
	ixOy61ZaAifA5JxNlARZMkgs62ZmJa5C5eCpruTAI8OumMcBA37vgUhNLD5o4zaqhKIMq3TlN5k
	qANdNLt7eV+pwrJufgNdk8DWp55ATs9IK8PAga/RoZt5iHbe2sPOth6oBFAIbWZZhegJEKToCt/
	m4buStP1SH9uuuvODxrU9KG2b2YSf7sW1aL8aW+Eobw16zMde6WXFsKsyj71Wi0NPlviW89KPVH
	hi8OD2x+dYtGUIwIDtJGB0vH3Tmd/0P2Ibbs60advWAjh4EAuLRJ/Ta04249MaRE/FFHUDQYLlr
	kBvMZ7pFmZd4k0i/Mp8gr2Tnx2Ga5cyui+qAvQbTNa2RjRrD2AhCEGFFLJDAPdVLG9kUDxMcyPa
	3JdizWd7Pnxaa83ZXioOin9hiAJXWJIOFkhTuiir/2S9eSKtibnyeJFBWA1Z7AmrF1u/PGR4CF8
	pR8SSknvsU5TQ==
X-Received: by 2002:a17:90b:39a7:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-39b26125efemr37873663a91.10.1788845216050;
        Mon, 07 Sep 2026 22:26:56 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:26:55 -0700 (PDT)
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
Subject: [PATCH net-next v3 05/10] net: qlogic: fix typos in comments
Date: Tue,  8 Sep 2026 10:55:57 +0530
Message-ID: <20260908052602.27497-6-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908052602.27497-1-hemanth.selam@gmail.com>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_222656_932044_3B6AFC9F 
X-CRM114-Status: GOOD (  17.95  )
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
 drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c   | 2 +-
 drivers/net/ethernet/qlogic/qed/qed_cxt.c             | 2 +-
 drivers/net/ethernet/qlogic/qed/qed_mcp.h             | 2 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic.h           | 2 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c | 4 ++--
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c       | 2 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c      | 4 ++--
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c b/drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c
index fef4b2b0b1f2..79d6a819bf90 100644
--- a/drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c
+++ b/drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c
@@ -17,7 +17,7 @@ netxen_poll_rsp(struct netxen_adapter *adapter)
 	int	timeout = 0;
 
 	do {
-		/* give atleast 1ms for firmware to respond */
+		/* give at least 1ms for firmware to respond */
 		msleep(1);
 
 		if (++timeout > NX_OS_CRB_RETRY_COUNT)
diff --git a/drivers/net/ethernet/qlogic/qed/qed_cxt.c b/drivers/net/ethernet/qlogic/qed/qed_cxt.c
index b70262e70baf..89b947f82cf0 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_cxt.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_cxt.c
@@ -561,7 +561,7 @@ int qed_cxt_cfg_ilt_compute(struct qed_hwfn *p_hwfn, u32 *line_count)
 			 *      block in the ILT client. This is later used to
 			 *      configure the CDU segment offset registers and
 			 *      results in an FL command for TIDs of this
-			 *      segement behaves as regular load commands
+			 *      segment behaves as regular load commands
 			 *      (loading TIDs from the working memory).
 			 */
 			line = p_cli->pf_blks[CDUT_SEG_BLK(i)].start_line;
diff --git a/drivers/net/ethernet/qlogic/qed/qed_mcp.h b/drivers/net/ethernet/qlogic/qed/qed_mcp.h
index 9bd0565fe8ab..50699d600b8e 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_mcp.h
+++ b/drivers/net/ethernet/qlogic/qed/qed_mcp.h
@@ -783,7 +783,7 @@ struct qed_mcp_info {
 	u16					mfw_mb_length;
 	u32					mcp_hist;
 
-	/* Capabilties negotiated with the MFW */
+	/* Capabilities negotiated with the MFW */
 	u32					capabilities;
 
 	/* S/N for debug data mailbox commands */
diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic.h b/drivers/net/ethernet/qlogic/qlcnic/qlcnic.h
index d7c8fadb49de..9728d583b891 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic.h
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic.h
@@ -909,7 +909,7 @@ struct qlcnic_mac_vlan_list {
 
 #define QLCNIC_LRO_REQUEST_CLEANUP	4
 
-/* Capabilites received */
+/* Capabilities received */
 #define QLCNIC_FW_CAPABILITY_TSO		BIT_1
 #define QLCNIC_FW_CAPABILITY_BDG		BIT_8
 #define QLCNIC_FW_CAPABILITY_FVLANTX		BIT_9
diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c
index 47cd9ec665ee..ff337a917243 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c
@@ -1957,9 +1957,9 @@ static void qlcnic_83xx_template_end(struct qlcnic_adapter *p_dev)
 * qlcnic_83xx_exec_template_cmd
 *
 * @p_dev: adapter structure
-* @p_buff: Poiter to instruction template
+* @p_buff: Pointer to instruction template
 *
-* Template provides instructions to stop, restart and initalize firmware.
+* Template provides instructions to stop, restart and initialize firmware.
 * These instructions are abstracted as a series of read, write and
 * poll operations on hardware registers. Register information and operation
 * specifics are not exposed to the driver. Driver reads the template from
diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c
index eb827b86ecae..1b94c42d669b 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c
@@ -95,7 +95,7 @@ qlcnic_poll_rsp(struct qlcnic_adapter *adapter)
 	int timeout = 0, err = 0;
 
 	do {
-		/* give atleast 1ms for firmware to respond */
+		/* give at least 1ms for firmware to respond */
 		mdelay(1);
 
 		if (++timeout > QLCNIC_OS_CRB_RETRY_COUNT)
diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
index ff4f7cd20c79..23ae76ca81db 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
@@ -640,7 +640,7 @@ static int qlcnic_max_rings(struct qlcnic_adapter *adapter, u8 ring_cnt,
 
 void qlcnic_set_tx_ring_count(struct qlcnic_adapter *adapter, u8 tx_cnt)
 {
-	/* 83xx adapter does not have max_tx_rings intialized in probe */
+	/* 83xx adapter does not have max_tx_rings initialized in probe */
 	if (adapter->max_tx_rings)
 		adapter->drv_tx_rings = qlcnic_max_rings(adapter, tx_cnt,
 							 QLCNIC_TX_QUEUE);
@@ -650,7 +650,7 @@ void qlcnic_set_tx_ring_count(struct qlcnic_adapter *adapter, u8 tx_cnt)
 
 void qlcnic_set_sds_ring_count(struct qlcnic_adapter *adapter, u8 rx_cnt)
 {
-	/* 83xx adapter does not have max_sds_rings intialized in probe */
+	/* 83xx adapter does not have max_sds_rings initialized in probe */
 	if (adapter->max_sds_rings)
 		adapter->drv_sds_rings = qlcnic_max_rings(adapter, rx_cnt,
 							  QLCNIC_RX_QUEUE);
-- 
2.48.1


