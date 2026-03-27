Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A7810ED64F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GVFHoPOge+f9c+1l0iJRdsDt/lLNhfRWq8rae2E9h20=; b=0ksI6cBTz4fdEnf7mO5vCM7sUo
	j9LxAAc25xmiRmoBRupNLxnZ0TXyea7g5kOsCg0UHZXKMlVEfh1EbbnRwpJHaSmtTXCByviHMDA8j
	GnoytIagueC4cSHLcONCyJiVcDSgN9iQ4DsnrcLCowximndEJVmqxW3cvomGJpJEy1zV1ibW37pH8
	ORqTozWdPqRKLSkNTwgLkHTWjQ/gpRDk83xJudZFp11DaKsfzpqwgkeQUEQwUm7/x6TbFT9v53X9F
	2H804sYStTa4EFPMhkkJU4ZAffcwqZzuW32/lVsOpDxZopU5Gnv/8YeK4Mt1+P9ZuBjfNh+f3Zsjk
	9clCBHvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63wA-000000077TS-1E5B;
	Fri, 27 Mar 2026 09:57:06 +0000
Received: from mail-japaneastazon11022077.outbound.protection.outlook.com ([52.101.126.77] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63w6-000000077Sf-2JJp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 09:57:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYuqMPQqB5W+A0O/F58PkW+QGm+I+ESiJ7hUlmFpK6FBg4dWdDhmRZVyAWXG+XZ7SZtFllqUL2IdqhjSyLM+VYs31xpo0uZQAA6GrGo/jbYYWSAxoBNYY5S2O2Pkw3Z8b2hf6OugprcxecoM4a75g/ii+f+pHUxUYLGLb8/GlB9NorLgkzKCHrjnwm4Y8i3bjIBcObW2PbyLf4EIUzC5YzjEkyUdDjbZavzfoBapsmbnd3JJmt7J8Ew0kXWb+OrwcYJ5kMyFGjiZ1olysOm1oiRhYBt3tE1t4kbj3oJ18OlN3ZytheHQP2Ja/tRfdRI7L2b5WnxJzJM1kWPQED1Dvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVFHoPOge+f9c+1l0iJRdsDt/lLNhfRWq8rae2E9h20=;
 b=FoejELkFEDvMtSPrSSdN4cWYyI3UiXfkvyZAUVCCnRYYu/ybvNYy8XdTHwlQ1oNVeYPfSZNWg2bSLFS7cMANtKQeamQP4siMd2VvOxsQemvRaAH13GMOzI6pACNzhpWIwlEph8C7N19vjc31sQfRnMBQhtw2lNrwq3YTMdCmIWiCr4L14VCTfVQXlNtpgQ+NGKOmo0K/u82uwXVqwCM4jOToSibNzaryCRfys5D9+UpBSab9nksS38IDZqPWobQtjc1xokAaQlXPn8NaYdiVnhffm6gdD7eUCAaxfI7PVyoTdXhyhZtP+RIvGaA+X/WTCKgTHiULkEb0aexmXNDe2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0041.apcprd02.prod.outlook.com (2603:1096:4:196::20)
 by KL1PR06MB7286.apcprd06.prod.outlook.com (2603:1096:820:142::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 09:56:54 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:4:196:cafe::f1) by SI2PR02CA0041.outlook.office365.com
 (2603:1096:4:196::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.33 via Frontend Transport; Fri,
 27 Mar 2026 09:56:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 09:56:53 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B3F014126F95;
	Fri, 27 Mar 2026 17:56:52 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: arnd@arndb.de
Cc: krzysztof.kozlowski@oss.qualcomm.com,
	geert+renesas@glider.be,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Peter Chen <peter.chen@cixtech.com>,
	Yunseong Kim <ysk@kzalloc.com>
Subject: [PATCH v2 1/1] arm64: defconfig: Enable pinctrl/gpio/pcie for CIX Sky1 SoC
Date: Fri, 27 Mar 2026 17:56:52 +0800
Message-ID: <20260327095652.3793688-1-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|KL1PR06MB7286:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2813f174-d34d-4e4e-3290-08de8be72cba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: OF/cADiRaWxfWRYjuHkosuU8Dm8H3JL414FUJFRbwasF2y3+fhgxUPbA9QwoZNw65a7ameAeafoiCyxhnL0Ut2nD5YJKcMKTW90/3Oc0rKIicelxIVuDhI+fPtSTT1TYaABKK/zjIgUfS9museg+u5vrbrmOb1WaygOUSFfFtggCfou7NqeImut6+bQICqtME9SUkfHjX1TTpWdTcBwiwolTR3+/aQkfO33yxxwcu5SZjq7yvrCGrdBgF3JRbqz6CD2zBcaU1/YNv/wpm9si5KCyGKxSe8+m4PLBC2u87SReP2i7HrCOPuClvbR6SICJ0u1pFrGUrI8g9/w9XvruuKeToFfOdq3d3CeOhcOaeBVDEu8ANMyWxJPADe11/3xtQb1/oVWLCrW7Z6RW+eCNUbCbbt9Fgi7UsHAn8+sgC7hT0TAauvBwoXU30WWAoV0gM6BdnY/6LymT1S/uu3Is5ApRiBVDO+o3D8k+WqIYBjNqQTZnPUvgc2KX/KxhHcid19TPWbLKwJDwZ6N1CtGe+gzH2xs/nclSgQFcpT/Nc4T5I9XaOdTPQpM2safe2D3tijQS0uREj2VT4jQhVFsPjb89CK9X7GpHCBguXDUsz/Il3pNi6BO7dCygDt1FHUplLvwYV3ZX2z4Fzbw0p49GN6uCPuJeIVxvDHe/c/DA/94KMiY2WhagqVPQUM8fjTdD4rnbwkkYEti0QpsfCpO2/+yM5sdc9v8TqZH4TLT+LJx+TFk+PLtLWHViXVEpBcx4axcxCLRua/tZOqfHaXX9hw==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CI9kwIF1TD1Jq7BZ4kM9SNfg0qNsHymzZKjsJirOQnYy+Vwda9LAhfq6gI71NDBdNVdU8lNWX7mC/WiGBvWM8eOd21NOp6Sn5hTwewmxV3jl8FtYFK7FPyHlv3L8mVMGvQZMGe61gZCEo+cYoWTD1YN0mUjposH2YrwTN2pbfhDs9DVPvGjuruRIsp2ztzZIbGvHAPlwBCKFeXjkM8K6m1auViKC5BW3L9Qmgg6kj0oykJtLENbfR3rq6LHUrM6OjiTQUIL4dgYUwy6MB5+FRhElpUw3T5yH8nuNvpKacydB5k4EfwpQCfI+33C9K1xYTT/O6usCXXQTKgR17kuFJHFuhMlMBIIUwWebo6gJ0hlV2CwxH9lsnZbZXKj4zFHGBm1ykgiQ1uoRNHLlaV07jIX6EEPmBe8CWIUBJu4+mBeLxhmnyqcE61sg0FpMZZK8
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 09:56:53.5686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2813f174-d34d-4e4e-3290-08de8be72cba
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7286
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_025702_587104_F63912E8 
X-CRM114-Status: UNSURE (   9.49  )
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

Pinctrl, PCIe, and GPIO device are used at Radxa Orion O6 board.
- Pinctrl is the base for peripheral IP and peripheral device.
- PCIe NVMe is needed for Debian boot.
- GPIO is added due to Debian bug report[1].

[1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1131772
Cc: Yunseong Kim <ysk@kzalloc.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
Changes for v2:
- Delete CIX HDA configurations due to it is not used at current
  Orion O6 board device tree.

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..f9be52484008 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -241,6 +241,7 @@ CONFIG_PCIE_XILINX_DMA_PL=y
 CONFIG_PCIE_XILINX_NWL=y
 CONFIG_PCIE_XILINX_CPM=y
 CONFIG_PCI_J721E_HOST=m
+CONFIG_PCI_SKY1_HOST=m
 CONFIG_PCI_IMX6_HOST=y
 CONFIG_PCI_LAYERSCAPE=y
 CONFIG_PCI_HISI=y
@@ -676,6 +677,7 @@ CONFIG_PINCTRL_SDM660=y
 CONFIG_PINCTRL_SDM670=y
 CONFIG_PINCTRL_SDM845=y
 CONFIG_PINCTRL_SDX75=y
+CONFIG_PINCTRL_SKY1=y
 CONFIG_PINCTRL_SM4450=y
 CONFIG_PINCTRL_SM6115=y
 CONFIG_PINCTRL_SM6125=y
@@ -701,6 +703,7 @@ CONFIG_PINCTRL_SM8550_LPASS_LPI=m
 CONFIG_PINCTRL_SM8650_LPASS_LPI=m
 CONFIG_PINCTRL_SOPHGO_SG2000=y
 CONFIG_GPIO_ALTERA=m
+CONFIG_GPIO_CADENCE=m
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_MB86S7X=y
-- 
2.50.1


