Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4042C55196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 20:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QdZMIDHMOjSGOgwrTV/dWewojulE6JZ0cwCgQK7kvr0=; b=tdv+903B0qudzguL6yqGSCa74L
	kigvm2jb87C88w5WeL9kgz7b6l9CCugmefmUVe+w1+vjJV/uGGlHpZByTNmbbgcBj3+aAS7HSaA7p
	fmY156PEe3DH7Adtbtfb3Q3swJ9cgdY7uHbV2TJvfzPWhq9XTmX6Y8yqdNdoPDYX+dBUz3jI3LFEb
	yJqEXHpvzMkfeH9DnupjuxyD2ui8brnBj6yAC++a5yhBUnwcmQf9nQNSW3jog+pvx1Vfgv+cPKvEi
	PvVzpsM1wEseVBacYXKWyuQk5/VQT3d80yOaaCKoI9fyucKtmb7B9c/eYYfBLvT0kjaAVd4AnIePP
	1YyVA3mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqyua-00000000TmG-3EwF;
	Mon, 03 Aug 2026 20:05:24 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqyuX-00000000TlO-0dze
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 20:05:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMPXd/bfSftc5cpS30ge59WtwspJxhWNqlpMJCo0rc3mp3ZHbIdfJdLMx1LV734oAidGnRCfcsZkEFu5MhrFLTnmbnUgSc2IeD9xW1Ne8kS8its3P48F8IlNC+X+CBzAqClKImLRdYZ6KOuKpUdMvzLYxp2U4DTBBzU75yxqkWOSHapwhBMUX5tPf9KbPb6SqN8D3MJWIwC2uZSUlhtPI4yKdI47LPHv/j2Q637o3Z7BPb7oVoo39BQzyowrbK+9ID5A5eHzHWWV3sSqdHGFHdVFLz2s2sa/RL7oUQP+VICb1yaL66r8lBVTNaxhd0HEApeeKeg0fsHIFyZPrL+WtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QdZMIDHMOjSGOgwrTV/dWewojulE6JZ0cwCgQK7kvr0=;
 b=i+m91+UZBSe9z5TQG/cSDoX0iZnj13c9UJOpOUkGNDOumTLLBnN2FL6ITtz9V66rYEKFL5tcHjPOtf+X+sO0pRIl8E83bfNFkg8BK3T8bF1II3bSg5BCrnPFRVnV0iDf0B7+pFszV/xEtGauB+BbS/vKEop77eVen7XXEdZRycL3inQvfFpBGUCiuQmyWYkPgId/cLh5tCRxFYUlXpHKm0BDahf2rNNkIFh/IPrknXpSlyiVIp5VqQB8nH8pEBu1vVxtgS6wRlL0JbLdiVJ5ONZjy2nzwVYkGCwVvTh0r2Lv08Lprw/3uOgGl0aE5cLt5/D4Ks1WlzJ24xzzVdRq7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdZMIDHMOjSGOgwrTV/dWewojulE6JZ0cwCgQK7kvr0=;
 b=SIYUhqdjdF7MZ1G1f4rPihLSiy542gjDB+qQy5D3xSxxfQvwbD26B3tEeCu7V+rpH68vQzzBiN5T1NMU4KGXeHYpCCv88VKYc05XhugiNcP92UIniLrBF464yLj37rGunlSrs6/P+3qQ/2l/5/hExES3CmQTGi4RVB8YWkkLg4I=
Received: from DM6PR21CA0011.namprd21.prod.outlook.com (2603:10b6:5:174::21)
 by CH2PR12MB4054.namprd12.prod.outlook.com (2603:10b6:610:a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 20:05:13 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:5:174:cafe::4b) by DM6PR21CA0011.outlook.office365.com
 (2603:10b6:5:174::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.3 via Frontend Transport; Mon, 3
 Aug 2026 20:05:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Mon, 3 Aug 2026 20:05:11 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 3 Aug
 2026 15:05:11 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 3 Aug
 2026 13:05:11 -0700
Received: from xsjpmteamserver50.xilinx.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41
 via Frontend Transport; Mon, 3 Aug 2026 15:05:10 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <michal.simek@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH] firmware: xilinx: support RPU boot from DDR
Date: Mon, 3 Aug 2026 13:05:02 -0700
Message-ID: <20260803200502.209361-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|CH2PR12MB4054:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ebec811-43a1-4666-4aa7-08def19a8696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|6133799003|10067099003|56012099006|11063799006|5023799004|18002099003;
X-Microsoft-Antispam-Message-Info: lrozLL2DFGd4/JWj9b74bkjb3rgWMZzC/CowWxX0Sre6qKj5fPFgPT7KxQdFrAszqtR7Fb2G1KYDhCYS7NYFqfyzxmoKkcoOYQIZShMgtylutiHG1pl5ojPuov9ybL4ANimDZHT37oA2X+oZ8dWJ74Hasn/8iP+6S7vOSujYKaohl/ZHuTCEuxNvC7CNEiyZ2tEaaRzQnmTHfmw5glYvX4CIzSlGO0wCHYelHZcAI9MJcIz1CDlT2MjBTaqqO6o79WHR1cQHMPhdVt7OMWYZJ4RM7KgPgzQcwL/YU4FWIrfSjznlGbOKMg1s6RgZ0XP6yQTOKEQOzyOe7VkZTRzAGkcHbTLGyGqQFfiCvZG1PnWyTdSjdtRMkk2e0HIvpGY2y+FupLStJIDSjZD3c48rbpW8sJsP+IJtySM7Q3f2N4dK62hTXq89wTOrGiLYhOhOrnhn4RmkX8PoM0isY2QJPX8qbtUr8SFAjeFg6kQq6Lth7guU1qSSP+qh1gTFw9RoLadshUAyyGaDteJNA2/2RI0m8j9UsKsVKjrz7Iw1LhtDUONXXjFkkoAi+K1AnZXQyL742jo/yVGQyMmnUq3JSYNkl0hGEgDqYjuU56Sd9P09tq8BHuxnJdygZYBVg/WE7GEO2BiLJGcj0e20Gmj2ellq4W/c550CXNmh2vMSrnmkaE+5wpn8H+Y6tQG0JwB7iZLisKatqH+YWL+9BYaEdw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QsHKnfmPM4M73VER87yMRBg/qWRtfd0tRzd/G1oEa6k5i3BbxICRovwtO/gtndPoqjLhmRrOqEJQCWvb/aXq7/Zkw0CdOcCncJ3SQYn1c0cYMvN6SIJhxBKyFMzP4ZIe1QlZQZbBBvJiUA0Bhqdd6mvhR0lJFrCf4+8x2a9qmuWxzI2cF4Erbwgh9uyODxv+8fj7QBZrm6OXwJi1QKA7y1tttoGmtKsrtfVlz8GrDw89Gyt8OEkGcvs3jqJVYFMMfOC7G/GI1RDD5zGCNIsbUhenaqORxu42BErzPDTwWFvYhjBJltZA0o8ueh0WiCpnfHcQbXG7BZoQjNismTmGU/Bd6HgmQoVM+TmjMDEwPCmC/+7nYH1QhONrFMHFtydVlKVgkvYIgGU97fLSu7cJ+z4ZX4AmM/aforgCJPo8nDy3xho649ayTpHQ3cYuqDry
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 20:05:11.8020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ebec811-43a1-4666-4aa7-08def19a8696
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_130521_193249_F1E4D6E0 
X-CRM114-Status: GOOD (  22.03  )
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

Cortex-R52 cores can boot from DDR. In such case, elf's boot address
will be in the ddr, and it should be passed to the PLM via EEMI call.
Add ddr boot config EEMI call before starting RPU to configure the boot
address. Also make sure TCM-Boot is support for old platforms as well.
Remove HIVEC & LOVEC enum, as now PLM supports boot address directly.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 44 ++++++++++++++++++++++++----
 include/linux/firmware/xlnx-zynqmp.h |  5 ----
 2 files changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index f9a3a95b0638..bc3e407dbac3 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -1523,7 +1523,6 @@ EXPORT_SYMBOL_GPL(zynqmp_pm_request_wake);
  */
 int zynqmp_pm_start_rpu(const u32 node, const u64 bootaddr)
 {
-	enum rpu_boot_mem bootmem;
 	int ret;
 
 	/*
@@ -1532,22 +1531,55 @@ int zynqmp_pm_start_rpu(const u32 node, const u64 bootaddr)
 	 * starts at the base-address and subsequent vectors are on 4-byte
 	 * boundaries.
 	 *
+	 * The Cortex-R5 cores can boot from TCM and OCM memories.
 	 * Exception vectors can start either from 0x0000_0000 (LOVEC) or
 	 * from 0xFFFF_0000 (HIVEC) which is mapped in the OCM (On-Chip Memory)
 	 *
 	 * Usually firmware will put Exception vectors at LOVEC.
 	 *
+	 * The Cortex-R52 cores can boot from DDR and TCM.
+	 * That means vector table can be at address 0x0 or at any DDR address
+	 * that is in the 32-bit address range. Note that booting from DDR
+	 * address 0x0 is not supported and the user must always assume that if
+	 * 0x0 address is passed, then it will be TCM boot.
+	 *
 	 * It is not recommend that you change the exception vector.
 	 * Changing the EVP to HIVEC will result in increased interrupt latency
 	 * and jitter. Also, if the OCM is secured and the Cortex-R5F processor
 	 * is non-secured, then the Cortex-R5F processor cannot access the
 	 * HIVEC exception vectors in the OCM.
 	 */
-	bootmem = (bootaddr >= 0xFFFC0000) ?
-		   PM_RPU_BOOTMEM_HIVEC : PM_RPU_BOOTMEM_LOVEC;
+	if (upper_32_bits(bootaddr)) {
+		pr_err("invalid bootaddr = 0x%llx\n", bootaddr);
+		return -EINVAL;
+	}
 
-	pr_debug("RPU boot addr 0x%llx from %s.", bootaddr,
-		 bootmem == PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
+	/*
+	 * New platforms can boot from DDR and require the DDR address
+	 * to be configured explicitly. If the correct version of the
+	 * IOCTL_RPU_BOOT_ADDR_CONFIG ioctl is not supported, do not
+	 * treat it as a failure. If a DDR address is passed on other
+	 * platforms, the PM request wake EEMI call will still fail and
+	 * the RPU won't boot.
+	 */
+	ret = zynqmp_pm_is_function_supported(PM_IOCTL,
+					      IOCTL_RPU_BOOT_ADDR_CONFIG);
+	if (!ret) {
+		/* config ddr boot address */
+		ret = zynqmp_pm_invoke_fn(PM_IOCTL, NULL, 3,
+					  node,
+					  IOCTL_RPU_BOOT_ADDR_CONFIG,
+					  bootaddr);
+		if (ret < 0) {
+			pr_err("failed to set RPU Boot address 0x%llx\n",
+			       bootaddr);
+			return ret;
+		}
+	} else if (ret != -EOPNOTSUPP && ret != -ENODATA) {
+		pr_err("ioctl rpu boot addr config ver check failed %d\n",
+		       ret);
+		return ret;
+	}
 
 	/* Request node before starting RPU core if new version of API is supported */
 	if (zynqmp_pm_feature(PM_REQUEST_NODE) > PM_API_VERSION_1) {
@@ -1561,7 +1593,7 @@ int zynqmp_pm_start_rpu(const u32 node, const u64 bootaddr)
 	}
 
 	ret = zynqmp_pm_request_wake(node, true,
-				     bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
+				     bootaddr, ZYNQMP_PM_REQUEST_ACK_NO);
 	if (ret)
 		pr_err("failed to start RPU = 0x%x\n", node);
 	return ret;
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 347df66ee176..577a762e624b 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -269,11 +269,6 @@ enum rpu_oper_mode {
 	PM_RPU_MODE_SPLIT = 1,
 };
 
-enum rpu_boot_mem {
-	PM_RPU_BOOTMEM_LOVEC = 0,
-	PM_RPU_BOOTMEM_HIVEC = 1,
-};
-
 enum rpu_tcm_comb {
 	PM_RPU_TCM_SPLIT = 0,
 	PM_RPU_TCM_COMB = 1,

base-commit: 9a4cdc958dd79fc6c3b20b51a10debec6ca09fec
-- 
2.34.1


