Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08D1C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 05:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0G6PBNCNI9Yj3CIpfLEh1JaSFXkOQqLFV+7Mz1Okng=; b=TETLWx/1IKYufBNUf0wMq7aXmm
	GwN6M4nM1pH9jeDsI1kXUzCvFOkuLDp21nPI1yhlpQwumgfOxQRVYgSdl5du7k6KOTdGCGaqhZzdW
	ac1/blWFF/qDbgpZbDMHCScTbl9raKWaptx0rgwe6B14iMy/ldHPhibrni//DipAsj4xf4/kD82Wl
	1GeAG0pPfWcGxZ/aNKTaoACfvB+L41hL7ZvRI1q2ST0EIhQBbO+tKyt2eZMoijC5+J//ygBMGMEeN
	iqXgRrMpld+8eC/Q4lN1MWO0TZXvLoyzgrdpXmMzeAHkKMQaA0+VgHK5PcciOiRfLqH9kNyDVoBr0
	592US3VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oMi-0000000844W-3Wug;
	Tue, 08 Sep 2026 05:27:28 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oMc-0000000841a-1sEc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 05:27:26 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cc1b838f9b6so4549638a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 22:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845242; x=1789450042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a0G6PBNCNI9Yj3CIpfLEh1JaSFXkOQqLFV+7Mz1Okng=;
        b=rA3ZobTLb28IzpVblw6rRp/+k9ct2DE8wQ7U/hLi9Me/NuXDZovKNwHW/Io2noF8F/
         u+j2l09u/xpUdPhcNhXUPlvWRKEBW4uj4c331DyNMLZ3hgvFI5GEn6+EpTCx/tl3dwPW
         Vcwd14JKorbmhnkdh6ZXDjiK4hvJql6nJUuFs09p4eQWahB2HJVlyX3QnODnr/bPG2pj
         5qheQOyWwILZ8E4Jq2LIfRK1QrchIoDXyBfyqLvhC1uNBbRLbnd+8GfCXaDN3ZEXExpF
         +cL1XVudQSeOMLNSfKk7MKtmCssZbeWxZXPJ2PMt0/fJdzefap+jhwe6jMakCAXBIwSy
         BjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845242; x=1789450042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a0G6PBNCNI9Yj3CIpfLEh1JaSFXkOQqLFV+7Mz1Okng=;
        b=i6IlMfsgWxaa4c3luDc1owQqCOpGlDFeoOAXt1MngKWuJG7ekqgEiFY9NZR5W08Ui3
         Q52PE6Dbk3slzDFesOt4E+nmAuB+Qtl8G+CbxNXuoKlQiYMmyLrJVLwpedz78wvOPWxt
         8wsW3TiBu0g9CaBLF4eryb+sfqixZr6viWMRbduzsf9EivK0P13QsQ6FIWbPh8cJ6uKJ
         sjiadWQlgC5yNaxPXFRSPrAKq6aYvCc0X1X6TspbnXQdlI8TS882DCqY0Ce5dmYJzcnV
         aevo9LqOzBIIqL5pECKF0kVvvCilGxIqodSQANkWJZtHTHpD8wX1LoQsZq1557aihp94
         NZvQ==
X-Gm-Message-State: AFuF++n/2IcS9iycRnwxjryf6sXGN6pho0ERxKiD9gOg0BaIIWGjLqdJ
	rINCxTrOXDKTXx7AQtdLMWkMeYg6oy/Xd+DUfpcEEJmOWpfZjdsqQaDL
X-Gm-Gg: AYBFou36KUX/V/5LFO7K8Xr4bH9thV1XE80MvTF50VJNhySVoN10FkP6+US1wr0Bdyx
	TH1tl4b/2uaWNb9J6M2FJSf4nIAilK7hwuL+zWg1qB022bfaBhu7g14gwjQLBfOvCDmTCosll5k
	4j09f85uYJ+0n2SuMBzSPUaHpR/IUk88eseANQcvVaMdnRhMIEFLoo9cF/ib91nU4wUSiV/6QKo
	masTZk2hek/B1WzDU840+4Gs6njyjU25r0aycXga+0sBsK0kqwNtUpGZqf9Q4uFwFWjZ5VUH07u
	+3117Dkj7U42rup93kzJbPbT33tgifsFqlL3kTV/Nm3mMyVzerqFq/gOqycLD+Ulvu6AfOmm5B3
	ojKLnFirw34ocZrqj4OQMWPBFdS/aNx3cPrhFpD8cnm2D4Px0fujtxXv6OgixUQOoi4MMMUPtbx
	w0bkxeiesNKI+BCFswpFrbCCkvPVkLwwq//T5WUFzq0iWTxIAeEQpB4TKJ8aCi8WN+mFRKAl0yo
	f4p5rapg+xh/A==
X-Received: by 2002:a05:6a21:a38b:b0:3d1:deec:9265 with SMTP id adf61e73a8af0-3da39b5832bmr46064670637.6.1788845241699;
        Mon, 07 Sep 2026 22:27:21 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:27:21 -0700 (PDT)
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
Subject: [PATCH net-next v3 08/10] net: hisilicon: fix typos in comments
Date: Tue,  8 Sep 2026 10:56:00 +0530
Message-ID: <20260908052602.27497-9-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908052602.27497-1-hemanth.selam@gmail.com>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_222722_609257_A78A66D1 
X-CRM114-Status: GOOD (  18.97  )
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
Reviewed-by: Jijie Shao <shaojijie@huawei.com>
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c        | 2 +-
 drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c         | 2 +-
 drivers/net/ethernet/hisilicon/hns/hns_enet.c             | 4 ++--
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c   | 2 +-
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c     | 2 +-
 drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c
index 91391a49fcea..a59fd280a045 100644
--- a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c
+++ b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c
@@ -591,7 +591,7 @@ static int hns_mac_config_sds_loopback(struct hns_mac_cb *mac_cb, bool en)
 #define HILINK_ACCESS_SEL_CFG		0x40008
 			/* hilink4 & hilink3 use the same xge training and
 			 * xge u adaptor. There is a hilink access sel cfg
-			 * register to select which one to be configed
+			 * register to select which one to be configured
 			 */
 			if ((!HNS_DSAF_IS_DEBUG(mac_cb->dsaf_dev)) &&
 			    (mac_cb->mac_id <= 3))
diff --git a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c
index 5013beb4d282..408d36d85fb1 100644
--- a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c
+++ b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c
@@ -139,7 +139,7 @@ static void hns_ppe_set_vlan_strip(struct hns_ppe_cb *ppe_cb, int en)
 }
 
 /**
- * hns_ppe_checksum_hw - set ppe checksum caculate
+ * hns_ppe_checksum_hw - set ppe checksum calculate
  * @ppe_cb: ppe device
  * @value: value
  */
diff --git a/drivers/net/ethernet/hisilicon/hns/hns_enet.c b/drivers/net/ethernet/hisilicon/hns/hns_enet.c
index e905f10b894e..d819d2bb3450 100644
--- a/drivers/net/ethernet/hisilicon/hns/hns_enet.c
+++ b/drivers/net/ethernet/hisilicon/hns/hns_enet.c
@@ -1230,7 +1230,7 @@ static void hns_nic_update_stats(struct net_device *netdev)
 	h->dev->ops->update_stats(h, &netdev->stats);
 }
 
-/* set mac addr if it is configed. or leave it to the AE driver */
+/* set mac addr if it is configured. or leave it to the AE driver */
 static void hns_init_mac_addr(struct net_device *ndev)
 {
 	struct hns_nic_priv *priv = netdev_priv(ndev);
@@ -2317,7 +2317,7 @@ static int hns_nic_dev_probe(struct platform_device *pdev)
 		ret = device_property_read_u32(dev, "port-id", &port_id);
 		if (ret)
 			goto out_read_prop_fail;
-		/* for old dts, we need to caculate the port offset */
+		/* for old dts, we need to calculate the port offset */
 		port_id = port_id < HNS_SRV_OFFSET ? port_id + HNS_DEBUG_OFFSET
 			: port_id - HNS_SRV_OFFSET;
 	}
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
index e6af939c1c19..bf35f55f5b8f 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
@@ -10527,7 +10527,7 @@ static int hclge_get_link_diagnosis_info(struct hnae3_handle *handle,
 }
 
 /* After disable sriov, VF still has some config and info need clean,
- * which configed by PF.
+ * which configured by PF.
  */
 static void hclge_clear_vport_vf_info(struct hclge_vport *vport, int vfid)
 {
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c
index 00c3f2548bf6..bf533b8f46ae 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c
@@ -35,7 +35,7 @@ enum hclge_shaper_level {
  * IR(Mbps) = -------------------------  *  CLOCK(1000Mbps)
  *		Tick * (2 ^ IR_s)
  *
- * @return: 0: calculate sucessful, negative: fail
+ * @return: 0: calculate successful, negative: fail
  */
 static int hclge_shaper_para_calc(u32 ir, u8 shaper_level,
 				  struct hclge_shaper_ir_para *ir_para,
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
index 063a692c2b41..5d14d29b0296 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
@@ -1880,7 +1880,7 @@ static void hclgevf_reset_service_task(struct hclgevf_dev *hdev)
 		 * from PF as cmdq would be in unreliable state i.e. mailbox
 		 * communication between PF and VF would be broken.
 		 *
-		 * if we are never geting into pending state it means either:
+		 * if we are never getting into pending state it means either:
 		 * 1. PF is not receiving our request which could be due to IMP
 		 *    reset
 		 * 2. PF is screwed
-- 
2.48.1


