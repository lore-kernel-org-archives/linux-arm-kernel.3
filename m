Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CD9CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 23:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSJos7Pt4AFif5CjaQ8gdnewPsl10bzfXlws+RKwLH4=; b=EstsF3HIAXYX/1kSaF/3t1/Hwz
	gERXOw0EeKLiPWQ2BTlJbf4qXW9v9+/7cfMOoXWT8LsSNuE/jc9gZyt/nRJ88J6pqlvKAPfKMfvcT
	j4tIj8kzAL+Ntuod0PtOUW0H2IheWyqTMS3yTayUPaBj0GTRryx8KDWNYMDEGS4mANXufn4nsM/9C
	LCLqDvqAp8st5ZHfsPkfnkBvznXFJEyityT4aSb7d3UQpt9BI80bKl77XZm+s0UO2phsUnf9bkgzy
	suMsI325oUT9383Tv06MkvM3zAXdCeTg5ATAJRbsVmniGVNmL2hNt8C6NQmZWE2TTNF12TyqolTUb
	HChXyE8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLUEd-00000007hG3-225I;
	Fri, 08 May 2026 23:03:55 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLUEa-00000007hD4-1fMB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 23:03:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQuX02sNeRthv/qw/VRXhY+nDj2ugsVvjjGFi2juSHqiV715NjVZES3sGNRMOpf/WcntmdZncHlpU9oQTiIdWt+fitrswYdeRIFKGNRcXhSvy26aUp1sA56QHlcdKT2cEk8oONQAQNn0gQEGjHaidGA+2e1FaweYMqibV0dIG2Me0y3Dtzbl3zm0FY6H2bH8H+UsBQj5f1b5Tc3dTelN4SffTh3uvyYl3CHE8nja2DbLOtVqxNm4BYB0t4N12b1Vbc/0ZoA4hm8oWuiUsHlqp3vL6Jyw6ogPNEVauvDD7PnvjcMsgPiTIhDhrjTU6TUYhlT5+K/7dNkBCav7KgBSSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSJos7Pt4AFif5CjaQ8gdnewPsl10bzfXlws+RKwLH4=;
 b=KeUNcfiCvsX7ACiTppt9jCsXa3YCGAZlSa/JT3AmI1yqPSSQWkF4vf4LWVFB555v8cefa1hbtvmWAjNehfIJnyKBZQlVBlRtJQ5Fi/tFnRE6HK4wCBMLFrOQm82vj9iWWMopGZ+osGRdOB7it2JLIuyhL3SjSZpW8L/2NDcUVVV4jjB/6SIIGlyqBStkHFFVs81FGUS0g6w654ZvXSo2fLhHwUpmJD8L7+4CCRBONMQLEt5s+CG1G5C/WM6LqnMniTUDNEMNM55Fk4au5Nz2RJo13tyjpdIpsF7xaBHHE8au7APmDKL/hpJo2nv8WGCBMsEdSm4SQS2vounce03Skw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSJos7Pt4AFif5CjaQ8gdnewPsl10bzfXlws+RKwLH4=;
 b=h5mjwxcUMsRdD9iIkKe7eznWZOZyXYDCAV/Dr0/fsd5WbdNiB5P/Llzb9TxJkghapBZIEhoOsFW9wpmSrxG6i6FE/+d0EP7iCYLy8SSSUp1jmX48dIuP5LV7uJ+UQBP8d3rpjsLR1nSk5TYhZwyPTX70OmaFypAagvGa6oZWoB0=
Received: from CH2PR20CA0001.namprd20.prod.outlook.com (2603:10b6:610:58::11)
 by IA0PR10MB7183.namprd10.prod.outlook.com (2603:10b6:208:401::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Fri, 8 May
 2026 23:03:45 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:58:cafe::2) by CH2PR20CA0001.outlook.office365.com
 (2603:10b6:610:58::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.20 via Frontend Transport; Fri,
 8 May 2026 23:03:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.8 via Frontend Transport; Fri, 8 May 2026 23:03:43 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 18:03:42 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 18:03:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 18:03:42 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648N3fnp2869024;
	Fri, 8 May 2026 18:03:42 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>
Subject: [PATCH v2 3/3] arm64: defconfig: Enable drivers for BeagleBadge
Date: Fri, 8 May 2026 18:03:41 -0500
Message-ID: <20260508230341.1891450-4-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508230341.1891450-1-jm@ti.com>
References: <20260508230341.1891450-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|IA0PR10MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: 03e8f10f-1d71-4daf-1830-08dead560d47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: gLx+qS4KM5+UufIGNz42BKMvx9MltEJTaqX5VN2m4ocvDIkXRcs2lO8jUbbLQfT41u+sC+SThiG9AGFgBhUZrHxTvpuGh4E7cHPBVSrSq17Nw6uynODhhA2tUy5LbeMNoadq3Os0sXsfTjzLFj8Vp88jCcHaGOhYFtwCDYaJbcD3TW1gG5OM7DuaWS1NrBJlqAhNeBR9NE/M+YvIHicwBk769MqzB3OahtNlP8hRz3Kwme/rfZxxUMwisxKADwd3xVTiDbV8PQLfkMCWyUJypURDK3CbAdmTFGzLzgZnOriuV8BmXOYE0aarBbyS0ePfPIE4PJ79xGvWb89yqPyxHteIFkNlQgFXI3vHwyxjQE4vP+JOxt2eTdT7fnCPgF/6LkppIbB1wyV67uRCtBcHdu1rQ6l3I3wU88fSHP0xRm1K1na1YoeGTmBnyqlaRse3j4ROEC5djbFL+zpFcAhIS328bQN8cnUJ+ZZ2uJ6FARnkrTBNI7K6WLvn37nKSh+uKI3K0eCoP6SIAEMxZqG8p0jr9I/m7G5eQRf+nDTe/yknl1fwZowT+OWFwUQIFLAqcCa8ev5o9kk/vx7APUaUdaoVfx06DCQAlDOpAd80oN+qJ3OZZlQwOCmKNkgxsRKrtUcs2o3LuXtJ8sCo56JRSpSebnPQacD2BloGQrQckvdP1QRXNN2I+FCvri7loSCLK2MD1BTzO5kHGQUMngPBl1Hcbsdx4KXpFN0BcTKAlQw=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wzb6CoLraS40DbWdU4Pi4x+6f6a3thu8TL4Mi2e5lYJ4vAL7/USia77Pk+Ee9INDFAESN9LLZHp3SBe03LAID4BbNnnXgdwiLXlA89xWzncFok2SIeXzucEnUv6+NR7VAJadyYR1rIoTPFTNObIz5yDbCctzoHKVKoL3tdY2KXnneyY8awoqHrm6XY4+WSP/uUNR9JT8pQDEBbGII2XrKolnX8pX6luYAxSstpZShO1Tpv1EnmOB5STDq6Ifzl2yfUNelkQ+ZNxLRbWBBrKZFn7E41XdVehpqcLJ2DHIclXAvJ64Bx0SQ5pQhaZ18hfGHvsUMt8aaWYWJ4HWv17Qtir9aK+flFp3xvJ/xc6kuy5hXjDKHifXUOMfim8SZmC9vyurKQbLjiH0O3gFHtt4cDIqwr2sO+Er9OtRaXwIRehyAQGWKGA2UMCFywljrXNT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 23:03:43.3791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03e8f10f-1d71-4daf-1830-08dead560d47
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_160352_442307_FD38614A 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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

Enable drivers used on BeagleBadge[1]:
- LED PWM Multicolor driver as a module
- MCP SPI IO Expander driver as a module
- Seven Segment display GPIO driver as module
- Temperature Sensor driver as a module

[1] https://github.com/beagleboard/BeagleBadge
Signed-off-by: Judith Mendez <jm@ti.com>
---
Changelog:
- Add defconfig patch which enables drivers as modules for beaglebadge
---
 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f93..0e4cf5e01146 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -634,6 +634,7 @@ CONFIG_PINCTRL_BRCMSTB=y
 CONFIG_PINCTRL_BCM2712=y
 CONFIG_PINCTRL_DA9062=m
 CONFIG_PINCTRL_MAX77620=y
+CONFIG_PINCTRL_MCP23S08=m
 CONFIG_PINCTRL_RK805=m
 CONFIG_PINCTRL_SINGLE=y
 CONFIG_PINCTRL_SX150X=m
@@ -764,6 +765,7 @@ CONFIG_SENSORS_MACSMC_HWMON=m
 CONFIG_SENSORS_LM75=m
 CONFIG_SENSORS_LM90=m
 CONFIG_SENSORS_PWM_FAN=m
+CONFIG_SENSORS_SHT4x=m
 CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_AMC6821=m
@@ -955,6 +957,8 @@ CONFIG_VIDEO_IMX412=m
 CONFIG_VIDEO_OV5640=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_S5KJN1=m
+CONFIG_AUXDISPLAY=y
+CONFIG_SEG_LED_GPIO=m
 CONFIG_DRM=m
 CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_HDLCD=m
@@ -1333,6 +1337,7 @@ CONFIG_LEDS_PWM=y
 CONFIG_LEDS_SYSCON=y
 CONFIG_LEDS_QCOM_FLASH=m
 CONFIG_LEDS_QCOM_LPG=m
+CONFIG_LEDS_PWM_MULTICOLOR=m
 CONFIG_LEDS_TRIGGER_TIMER=y
 CONFIG_LEDS_TRIGGER_DISK=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
-- 
2.54.0


