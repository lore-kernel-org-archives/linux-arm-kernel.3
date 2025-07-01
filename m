Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E55C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 14:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8YyMNEML0TMeQJHvU6/NoZV3PA2jwoUEU1p/KWM3mE=; b=Kw6qR7q+L1wqwf0pVgQElzsvox
	HmmGB3loeeNaQPKH2nifW9tZHHdPPnf1CJFqY3ouva+pfEWatAHssEFMzjgDr9JLcKlHiFIxjO3bG
	wyPxc3zsA2N6NQmd320a49BCcf62SpDHSMjCM3qsQfmPyKfey3ssiU9v/tZ2ZDCNIz884nfFZXvFh
	V2IyI7Br4G87log8sJjE5aQd024D24JQ1oTGwxt2OxMgPB7gQIjlNWt2a1qav8iiIbuKI/WhH6lBO
	osEnmKwPkkd3/FIL6VqrE3k+79oarj2CH8xiEK133ZXP5zT+uoHaHIHe+HsTxf3jFJHJrtFux1B3h
	aonmL8GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbez-00000005dp8-1Myt;
	Tue, 01 Jul 2025 14:08:33 +0000
Received: from mail-dm6nam11on2062a.outbound.protection.outlook.com ([2a01:111:f403:2415::62a] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaHK-00000005M4a-1QUQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 12:40:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smmuwMngF2+JBuLnWW0DkelBb8ld34LlJvVZn7lycJGnSCSq62lnsmLmiQ0S4cZCUSNOzBCy433dMgbEsVg6/h8YL0fYthMSpSZM5+suQeM8g0YBnmRtaMm7ZbIxTLJI1mieoC37VC6QgBjTEJrvACfqw4m5Y7seUaC6MusdtFT0VZYHCNRB778XzkG8kdPkJvS4iHRWI2hY4aBd91IPrCg9P6/0Id3mQ+iNCJFx84rMvWLCUz3rMFI16sOIXhd6qk93pmT98q7apCarXoadT2jWB7lAAB7amq2s/4kNxrl6oe6SgqIpaduj2gcCTQ+MVv1IoOwUODitEp3syoHFsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8YyMNEML0TMeQJHvU6/NoZV3PA2jwoUEU1p/KWM3mE=;
 b=DQp2PumqSD7JTCOVwA5XaUpOOirRMhNfvZGONDu6aasAzIsFp17IiSzuSrlPARI5T1/2buSGwRlMxaeUU2AdfERRlcbNG3yMSlTV4+RYKnJ/mKQeUwsyzndJeV+/h/0yM2jFv00PgF0aYiPW6zN0gOSRY0qMduQFsnbwMOvD1KszhJXTl5lR2owoOsj2OYWhOlTo8zGLgH6aa+QvtbsQ+q87qFUIchCmZPSARhNPELyF6zTsUNNage+b31WczG6qR2kXZCLxajSIUkCtum5EKyWo2eKtU68y0DCjFgUsPYZE47dfLgDkPwr//8imMyOLwlniQi0OHtQCAp+6f5mDvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8YyMNEML0TMeQJHvU6/NoZV3PA2jwoUEU1p/KWM3mE=;
 b=B4nkj+M6HBMeDXTidMGQXLzyrsI2jeXpn/p0WHjmgjPvQszLWQCtBL94suF/fPwtIpsOATNxhTsS3lSZkQfyBQGtFjFv2wPfcE34CcQPvJbyb3Yw5XZLfcdXu1El34tPGNTYmsSMgSlz6PTrrTeaqvvy7C6lXipkTWv8DRCu9Ts=
Received: from MW4PR04CA0100.namprd04.prod.outlook.com (2603:10b6:303:83::15)
 by CH2PR12MB9518.namprd12.prod.outlook.com (2603:10b6:610:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Tue, 1 Jul
 2025 12:39:55 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:303:83:cafe::fc) by MW4PR04CA0100.outlook.office365.com
 (2603:10b6:303:83::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 12:39:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 12:39:55 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 07:39:53 -0500
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 1 Jul 2025 07:39:52 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>, <linus.walleij@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <git@amd.com>
CC: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Subject: [PATCH 2/3] drivers: firmware: xilinx: Add unique family code for all platforms
Date: Tue, 1 Jul 2025 05:38:50 -0700
Message-ID: <20250701123851.1314531-3-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701123851.1314531-1-jay.buddhabhatti@amd.com>
References: <20250701123851.1314531-1-jay.buddhabhatti@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jay.buddhabhatti@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|CH2PR12MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: e7270580-fda8-4a12-a256-08ddb89c61f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dFI1drr78/8dTlBfJFo1P+OHK5cylfXeqwyfmbd0JiwgVnJ/XD3ulaTfcGVd?=
 =?us-ascii?Q?ZIwsUdugTH4CnzBwM5G6+3KOIrU5OlFS0SxLmVFLJAwsHf7WawwWovFpTX0T?=
 =?us-ascii?Q?v6VVI+VQxZe+1toynvMlttqlt+8ogix6bsn5Ta/zChGExTa3lhZGHnFv0zQV?=
 =?us-ascii?Q?RbtKvDnRYS+ydIHcMKoXMNwzHh97BKqClWTkY56nxznzrX9DmnWx6pf9LjhX?=
 =?us-ascii?Q?1QnDnB2Ug51O7HddwkUnPxs0uRWP8G4pkfAKd4AxNZK11n1aGv8rl/gs5FxL?=
 =?us-ascii?Q?DChlnZoyjnKIwiiRcAKcrvSnCZj2EkHOp5QXuyu2dj9+fd723g9ERiYQVuyW?=
 =?us-ascii?Q?iNCckHdQXd6/mSAmmonCHElTmxTrkqe1wmDohh2GjD9n4kOp4VA4xbctf3Eb?=
 =?us-ascii?Q?f6X5/wWJUla/FqBzg7y7jC0qZfRCwg9ARY8VUCFe4GZTn9yhkCY3zvY+lcpV?=
 =?us-ascii?Q?qpqu3ezu8m1mkr630luMm3sE1OZuHmlKr7JyR0KnAS36AzEK2JsO8ll8ZMvl?=
 =?us-ascii?Q?Sqc3OBRdyWxCnv5FatcAJYKuF9m6y9Pny+C8e+qSW4oVndqIMfYLa2eIkw8z?=
 =?us-ascii?Q?H9K9EgpzjI0Q64/knoPEmXNQYNAQRjQxJxFJgsQytJ/RTPtd0C3Mi6tYKQTG?=
 =?us-ascii?Q?YE+qObY9qbHgxzml24JEJQ5FJqjyotTJIqkqFtTtAamo1KsaAI2+OdeSdJ0G?=
 =?us-ascii?Q?yzGmQCOgzMgARLHDhSBhTWB3cq8ghvUR7GUQe6/L1Rvf+in2S1Q01vIAAOQx?=
 =?us-ascii?Q?eWcIBCzld4rz9iEWPYIK/x11YUsj6s4/uPPwyHdcrd8X+eE0SNWRcaYxt3Ik?=
 =?us-ascii?Q?X7NmV05PxklvHbnwyjCiTfwb+RhqedeZk3+UyDaRkC06fHijWXrc4APj7w+2?=
 =?us-ascii?Q?3H7MizgwSTD+B6R8h/zUy9ZX9Z3uRNCC0VyLntIMRmvA7zBwmTeoNhuU9SW2?=
 =?us-ascii?Q?FxBK9ebXahsS+htPlIwz6+2fMPVi4cqOrUMXw70JCMiNEq5Lgtq7aqXXJ5rW?=
 =?us-ascii?Q?mLCbSHmpXM4r1cdkmio3zTSahTLqqp9mhao1miqo47lbRC5N++mS+oCCJmqE?=
 =?us-ascii?Q?oyJF4QKsu7LrnP0Q5JtP49Q0yNNI0soXo7RMekPp72ac2YsuzI8Dhc/ZmUba?=
 =?us-ascii?Q?NVSRkfUrlSc0Wi5d6VdelYCwIAJY8vAvLNeHKq0R0Kd9onh7P5Vis+ngwEot?=
 =?us-ascii?Q?Uh0mugsgnJQbnii1PKwbinQbrnKjj8LyLcYSr/99TQ0yeM+GTkIbmvVyi028?=
 =?us-ascii?Q?V5beAJRhk1+x90rbgEW57NLp0yEY3Tb7Woc0nT13J+ehcGCuSw1hFAbkKZ1s?=
 =?us-ascii?Q?QPd5aCe4SlWOxS7q+qnnOw53EP7mlZ2IkJ/WQmBxd7Ww7I1xnzTyK+XDGXgL?=
 =?us-ascii?Q?IlJgFw6NCzYnsbUL7J1THYugDNpA34VGXQM82QIamhSbdcBtPSSWGnRUtUx2?=
 =?us-ascii?Q?rJHKUXXaGf45d5QJ46kq3qJdFBqhrOJH2SpWTVyEN+AAOc5eWyHYwice9wOx?=
 =?us-ascii?Q?oR676e1Ss0T/ke1GwP5LR1MWekkOum3A/M46?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 12:39:55.3025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7270580-fda8-4a12-a256-08ddb89c61f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9518
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_054002_384494_B5B2AD56 
X-CRM114-Status: GOOD (  17.02  )
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

The family code is currently derived from the PMC_TAP_IDCODE register
value, but there are issues where Versal, Versal NET, and future
platforms share the same family code. Additionally for some platforms
have identical subfamily code, making it challenging to differentiate
between platforms based on the family and subfamily codes. To resolve
this, a new family code member is added to the platform data, initialized
with unique values. This change enables better platform distinction via
the compatible string.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 32 +++++++++++++++++++++++++---
 include/linux/firmware/xlnx-zynqmp.h |  5 +++++
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 89e0eef219ff..2fb1c29314b7 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -71,6 +71,15 @@ struct pm_api_feature_data {
 	struct hlist_node hentry;
 };
 
+struct platform_fw_data {
+	/*
+	 * Family code for platform.
+	 */
+	const u32 family_code;
+};
+
+static struct platform_fw_data *active_platform_fw_data;
+
 static const struct mfd_cell firmware_devs[] = {
 	{
 		.name = "zynqmp_power_controller",
@@ -2013,6 +2022,11 @@ static int zynqmp_firmware_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* Get platform-specific firmware data from device tree match */
+	active_platform_fw_data = (struct platform_fw_data *)device_get_match_data(dev);
+	if (!active_platform_fw_data)
+		return -EINVAL;
+
 	/* Get SiP SVC version number */
 	ret = zynqmp_pm_get_sip_svc_version(&sip_svc_version);
 	if (ret)
@@ -2100,10 +2114,22 @@ static void zynqmp_firmware_remove(struct platform_device *pdev)
 	platform_device_unregister(em_dev);
 }
 
+static const struct platform_fw_data platform_fw_data_versal = {
+	.family_code = PM_VERSAL_FAMILY_CODE,
+};
+
+static const struct platform_fw_data platform_fw_data_versal_net = {
+	.family_code = PM_VERSAL_NET_FAMILY_CODE,
+};
+
+static const struct platform_fw_data platform_fw_data_zynqmp = {
+	.family_code = PM_ZYNQMP_FAMILY_CODE,
+};
+
 static const struct of_device_id zynqmp_firmware_of_match[] = {
-	{.compatible = "xlnx,zynqmp-firmware"},
-	{.compatible = "xlnx,versal-firmware"},
-	{.compatible = "xlnx,versal-net-firmware"},
+	{.compatible = "xlnx,zynqmp-firmware", .data = &platform_fw_data_zynqmp},
+	{.compatible = "xlnx,versal-firmware", .data = &platform_fw_data_versal},
+	{.compatible = "xlnx,versal-net-firmware", .data = &platform_fw_data_versal_net},
 	{},
 };
 MODULE_DEVICE_TABLE(of, zynqmp_firmware_of_match);
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 6d4dbc196b93..f112cd211c5e 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -54,6 +54,11 @@
 #define ZYNQMP_FAMILY_CODE 0x23
 #define VERSAL_FAMILY_CODE 0x26
 
+/* Family codes */
+#define PM_ZYNQMP_FAMILY_CODE 0x1 /* ZynqMP family code */
+#define PM_VERSAL_FAMILY_CODE 0x2 /* Versal family code */
+#define PM_VERSAL_NET_FAMILY_CODE 0x3 /* Versal NET family code */
+
 /* When all subfamily of platform need to support */
 #define ALL_SUB_FAMILY_CODE		0x00
 #define VERSAL_SUB_FAMILY_CODE		0x01
-- 
2.34.1


