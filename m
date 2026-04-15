Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C202CF41990
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 10:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ah0PhSeyxPJ+iyZTlPevBN3vuUak12Ucav+orIO6GFc=; b=eLtQuvGs+CMUM7SzUDOVTvLeWz
	JpW9Q7EmDvoDnJwjYeSbmfYrtirQ8upq38M9MebYYQv1e8+xxosy32AqpYlwMnMwbT+pNV4N1MA7k
	aiQngdvdxN7obsic2V74tnzxGlxyVdQdwF/wePCeqc362j238A/iWhM2cT/lSboQrTXymN4tnjTb9
	zQamnc1+DEBcKVcyH7DKmkAN3ybjCko23e5ByqGqXmbuiIAPGmXiGGK9rjJdsSmyi/lBNRijQyd+f
	6MyY0bb/eyRV5b/YCDBmJltulclMHZG6j5HgyyILFnEZeihqhizjjxPYz1vFK5GbBT0hvZ2IkFtiM
	ouSiraJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxvZ-0000000103o-29MO;
	Wed, 15 Apr 2026 10:57:01 +0000
Received: from mail-westus2azon11012060.outbound.protection.outlook.com ([52.101.48.60] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxvX-0000000101a-0ghE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 10:57:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CC7I3mnaBajDK3b966xTljts/NHXr6m2NJZP0YSkgrtSfnSpoTMj0/8GVMaypVcUGbPP2afVai008kX4086LZzt4zgTxOd+dnYVI8IgFYCEFYR1uj+ApuaxU0BJ+J5xPios2ioOFe1nDjuLOxg+epp2nYs7IsTzzkuA301wsDGWccsgzoeGeCnfrWwafzcZFOFX2ic1B7QYn8asXJWarQnLisvMLdiNqgnHuofTphMMZLAR/C1pl+8cW6ORqm05r7P0hFPRbbDGtzrXXL1q4HEkDANQE9qFUJK3gDL07lhw8mJKP8lzF7YcrT8HwpB+xQRiWqWpAn71PMGHVfO+dxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ah0PhSeyxPJ+iyZTlPevBN3vuUak12Ucav+orIO6GFc=;
 b=kPFCHQoZfhnWmdoEXcN7pmOf5dgNMY99QK+kcnQI2kOfGB1IVX2OQzH04voxyVQn3vhSDqxIwxICLA1X+7YWAsByCu328qVlLn1kpBtN00Rxl1+nQiLrssUag4y6EpYKjP4yi8RHAZ8gYcV6FIp2Q6+8l02cc4fV/ttAJkTSoLOmKMy7eQndNHKeQqAUQDBz5ws24y7DBgc2GzxURVwaUngOWHfN49dwEJuoTt/0XH1MYJHWdCzg/YR9bv7byLGCkEdbaCWTv4XlJx7NsQTacNp3zlsmx7DR21RFhhx4SUukOKDbZKDTvCVfrJBDdW0RFWQbl8YYxFCfdFxFw/8AKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ah0PhSeyxPJ+iyZTlPevBN3vuUak12Ucav+orIO6GFc=;
 b=ylGoSx5BsDCV5Nwm6iUDrV5UO/UksQ3a/bLyCYYJSFiyk+cYHEhbnBnCYtSC4B/5M/HTLuaq9gX81Ygg+NHA7NGlW4sMEKPR6QqhVDYj9sAtT6csNmfg7z0Jn0IWD/ciVDHlPO33fsE2zac6ivnGrncMp5i3QimA8+LHj90j/Kk=
Received: from SN7PR04CA0190.namprd04.prod.outlook.com (2603:10b6:806:126::15)
 by BL3PR12MB6569.namprd12.prod.outlook.com (2603:10b6:208:38c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 15 Apr
 2026 10:56:52 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:806:126:cafe::2e) by SN7PR04CA0190.outlook.office365.com
 (2603:10b6:806:126::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Wed,
 15 Apr 2026 10:56:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 10:56:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 15 Apr
 2026 05:56:50 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Apr
 2026 05:56:48 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 15 Apr 2026 05:56:45 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, Michal
 Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 3/3] gpio: zynq: Add eio gpio support
Date: Wed, 15 Apr 2026 16:26:28 +0530
Message-ID: <20260415105628.957689-4-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415105628.957689-1-shubhrajyoti.datta@amd.com>
References: <20260415105628.957689-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: shubhrajyoti.datta@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|BL3PR12MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 6123da8f-7a59-494e-4cf0-08de9addb319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 23XL3EYY62ogfNFAJxZ3oeJtNT03sg5s4Eq4GDxI2Ye4lZYiYrg0HPytaSQ+v2/WbnlQRCPRfy9U9iiqEm7WwfHviTkrJ/55pLMmOVqSMWHg6zZlfGBwfi8NvfnAToYmXDWjHC4IaUIEUa+2dLf3Qzu8KoqTtOjodLsuv4pg1sp2MwTkNj5RiaXccGEhd0zDtbGS9RfCvn8DgxqAgRWD0WBIw1qpJm3eYTn3y4bygyEktLJ9Xs2UmwEK4kKK3OyDJD7B6biQk4KbM1GZtrrLZ7oOtEa1qAf+jatd7CiS0lVBTT9DS/jQgDcdL4fhoIUAijdxlTQyVtz/sQk0kYsuNeNfSatAOl0FaqgmybS/Ae0miTKw+DtlS3K2lNGcRpJ2epwzDuMIT2P3FoTIydz1+0c4ZsOfRFvoh9IUbcDnwM+imD992hG984aU158HO6RTE0zoAG/ytv+0yl/6v86+phd0K7Y0Wjlv/At+F8i+qaN8sh9q1jAC1fXl4fbHSxoG2ZdjUtDSQy+nLxRIDS+m5lNDiyCjkmLFafbUqwBijrxqWd1rmlVz7vm7FKrAs9tIiiai58Xy41hwnq8xjl4bRlSmwtzO7v0HO7Y1jserPhz7gGyDvmFL0puYGx90jd9rfX/YdHKVIPxxj6x8G/ps/inkva2NkYUV/ZdDxzvnmqg5VQpVlUJQvoxoCPnkNUN92VO03zYi0Lfuv0gMx6RTJd6GlOWJSSWueZthH/IPBu5fEbSBbXpwM6Gd6rU8Fp8WtCVIUgSekvUA0CPsmTZWng==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Z3BTffQ2b9IPpoYQ8x6UzUtXjsAl8eFvLEOf1z1uNnSHSphXs3bh4kp+40vkp9BZyDi4lObvr39xyUQsH55HXlefhZvXVgcvyOjigVuIle58wQytD6qsCgxfw94M7Ye5UtT0JqXkCwLJ/zXpnp1/MX1SUrzx/JRmPMFbKnXIAtR2dURyZMr7KOLnz64LEn2lR20RHnMXJjJ7O+Jd4Wl9BZHlUIafb4D9otTXNpgrWtxqDAueQWGUmZhzNrCTEVRODoBggy75DkGTZ/qIkkTNfJz+4HqriWunA0DsNMWsJ19061Ofa942SOKdB7sQjRVIQNyl6/55BnGWQAOSLM/8xlvLQsaO0wqIPkVi+SYbJOk1WfLu23dDP2tQRX9uJ62Vxnf9l/yKgugS59u4HbK/MqEwsqWtHFp1CxD960KOfXUzEiWFRy3zs7+YjSdh0Yez
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 10:56:51.6035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6123da8f-7a59-494e-4cf0-08de9addb319
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6569
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_035659_219586_260873EF 
X-CRM114-Status: GOOD (  14.61  )
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

Add support for the EIO GPIO controller found on
xa2ve3288 silicon.

The EIO GPIO block provides access to multiplexed I/O pins exposed
through the EIO interface. Only bank 0 and bank 1 are connected to
external MIO pins, with 26 GPIOs per bank (52 GPIOs total). This
change extends the Zynq GPIO driver to support the EIO GPIO
variant.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v1)

 drivers/gpio/gpio-zynq.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 571e366624d2..8118ae3412c2 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -25,6 +25,7 @@
 #define VERSAL_GPIO_MAX_BANK	4
 #define PMC_GPIO_MAX_BANK	5
 #define VERSAL_UNUSED_BANKS	2
+#define EIO_GPIO_MAX_BANK	2
 
 #define ZYNQ_GPIO_BANK0_NGPIO	32
 #define ZYNQ_GPIO_BANK1_NGPIO	22
@@ -818,6 +819,16 @@ static const struct dev_pm_ops zynq_gpio_dev_pm_ops = {
 	RUNTIME_PM_OPS(zynq_gpio_runtime_suspend, zynq_gpio_runtime_resume, NULL)
 };
 
+static const struct zynq_platform_data eio_gpio_def = {
+	.label = "eio_gpio",
+	.ngpio = 52,
+	.max_bank = EIO_GPIO_MAX_BANK,
+	.bank_min[0] = 0,
+	.bank_max[0] = 25, /* 0 to 25 are connected to MIOs (26 pins) */
+	.bank_min[1] = 26,
+	.bank_max[1] = 51, /* Bank 1 are connected to MIOs (26 pins) */
+};
+
 static const struct zynq_platform_data versal_gpio_def = {
 	.label = "versal_gpio",
 	.quirks = GPIO_QUIRK_VERSAL,
@@ -882,6 +893,7 @@ static const struct of_device_id zynq_gpio_of_match[] = {
 	{ .compatible = "xlnx,zynqmp-gpio-1.0", .data = &zynqmp_gpio_def },
 	{ .compatible = "xlnx,versal-gpio-1.0", .data = &versal_gpio_def },
 	{ .compatible = "xlnx,pmc-gpio-1.0", .data = &pmc_gpio_def },
+	{ .compatible = "xlnx,eio-gpio-1.0", .data = &eio_gpio_def },
 	{ /* end of table */ }
 };
 MODULE_DEVICE_TABLE(of, zynq_gpio_of_match);
-- 
2.34.1


