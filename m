Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBEEFB3CFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 10:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KkkAFLIvRI9zbhlBsGEiZc2ga0bV9zpZLbn1/DHdfHk=; b=pkJ64BI1T/AsQz4lrLx+2GTDCs
	ve9/HdbIYs1XJOj5ZlKSHI1Cadw7g0BsNoVt+6q++b3BtyqV/wYMrrughV53w8vTXgyKdpnnjDLbY
	aymjKKQ66KVq+7r95ME/j59MHP/xsvlcbS+qk1cPozy3w8SXX/sV0j4KIDPjvEY5TGdzpQ6MGy1Mv
	YzVvo0LtKXGRRneZR6U64k3fOQvFS4qlySzpfUwQKJ+W/WBDJkWTsR4CZSW6NpU4ZsHu4WGX3Ulaj
	Vj1QHWCW5H4DL8Cgb5eD/HshKwql45/W1aYWZB8AG7oTYSD+qdDsq0DGVbPqGzUu3lX1CSTAWh5BQ
	+lh+7TyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79Qg-0000000B0Se-0xiK;
	Mon, 30 Mar 2026 10:01:06 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79Qb-0000000B0R5-02gT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 10:01:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISnTByweLJuO/3xstYSHgU4ddMZAsxzBg1BPRwKUas1vDoG/UTSpA9pNUSHjU6hGgBZeTj5VIOCgKWV1KngmzZEEazM+9901Us3dkrSLY9RLNe+MT7xbmEop94d5QZma+YBZ/Gq5qt9ghrwD7gfhYFuQDqjhmTIqWKUHoh+qDolCKoRBt2MSN0jitYxyTYz8AWtxCRSOAovMY2Xc1Yv5VmNOkbOIq4eNVifA6XvMsojc40Py2wiOlBxVWqQ23aur56Fa22mH5iIDb6jcuhqJ9wbipnUcII9ytOmJECazgDbqKrvMg3X70ObvxN4mtmv5jvXxURng5Fypl6gxeRzcAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkkAFLIvRI9zbhlBsGEiZc2ga0bV9zpZLbn1/DHdfHk=;
 b=Z8ca6TGxece0JU67HiFPIi3y9OEqPCkHYe9AGgl2ThesWVX6VP2roXZHDMDQRYmdVDeVR8abip0yibpI9yP9505ICaMH3VBrpFEVkL4lE4x2QiTMkzX2PX+i0jHdL0z/gT8sI/SAnibn+lJVCDq5dryrUvMd09DQPv4c6qgSQJn0CNQZIY+zDUzsRbg2cn8jR0fN5abH/CvP7VKbcXhdKTGq5zs4hrZcoDYRb3NNvOUJzj5LdyGNKdgd/fu8TqydZlBcyllYlZRGti6zZjeqOkzOL2wJZnaYCuFLFj88OfHLaUKBG4zPe5wCswwA1z7sIc5085FA5R7rzmpihAF7dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KkkAFLIvRI9zbhlBsGEiZc2ga0bV9zpZLbn1/DHdfHk=;
 b=D1KZ0MpZvp9vN/x12DWoHUXGYAUTUJd+znPFGeC/qxhtkMTJW72BHvEVfzmIVpFxa6GRLJo/qiGx1jWhfttwzmPnK9zUKPZ62fXLfRzBZE0ksYC5ZtdndKvuoOj+z+3eaKBl5/XkbR0fN95ZX65mbR+uwPQPfUqfRz6FMfpfM68=
Received: from DS7P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::6) by
 DM4PR10MB7452.namprd10.prod.outlook.com (2603:10b6:8:18d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.28; Mon, 30 Mar 2026 09:45:05 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:8:2e:cafe::c) by DS7P222CA0010.outlook.office365.com
 (2603:10b6:8:2e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 09:45:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 09:45:05 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 04:45:04 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 04:45:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 30 Mar 2026 04:45:04 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62U9j0bg505460;
	Mon, 30 Mar 2026 04:45:01 -0500
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <gehariprasath@ti.com>,
	<y-abhilashchandra@ti.com>, <m-shah@ti.com>
Subject: [PATCH v3 0/2] Enable audio support for J721S2 EVM
Date: Mon, 30 Mar 2026 15:14:57 +0530
Message-ID: <20260330094459.128648-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|DM4PR10MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: d76888b6-afc5-435c-9bad-08de8e4105cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: MqoFFS+QQ6tp7u16inuMSM7BO2y9nEF7xwfaKPN2L7SdhSWNlwPB0xpA0Dl5X+gGGZQl28qV2B3iZLBC9LoHNc7f4e9LEBobLD84rcI/RW6MA8nODPZL+3Skx/s8uiNKHn9cusrC2/sU5TBbKzNISpirOEaclwD/JsgZETodhOeqyMqCrNV9aTeRMXqyMdn5Efq9L+L5XKLermJAR2lw7HwN0u9OJQl9T3FC0goDaaykIRbTnZydcvTa2T55G0mYD3JMRTsOiSmddAlywUFAd2GUU6StpbC8fd9hioQ3oYlgFaD1qma9IUhXygMnT9YuRRuJBaiIoM00zNswcjmgBwx/sRL33Z+rfh93KZRLU/vNMW+e1JHkyzRfsq3KUjcEFyaPipyofapuMvcawmhtHN3aHO3Gl/3AfBn5GxHktMba6iYBIf99awoyj1pIEMz28ZcxWj8lsFqrtz6ngkui/xq6EM8Opz/kq9YdLOG7hIa1FDyaA0RC/r6GMDmHgL0fndrM6CaPJGiGlCzAih2vWOUdkake4Jbe4CWKtLQRFNtvDipETfljOqnAVtkhqEnkQz0449LAPnXvqkEtIONP8wwN0KJxqaPjhtcOO/FQLKpq6ts8rep5MyOKvl47tOkfs+pmqWgOabFNopVLZpnmo0OW2tnNu6pdAurWPpNfgofJxfsRhHUNirozlX3V2INVZ4YulKEPDq95efcIFiOg1gMFyfGuBF7THefIVwejWVw=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TN4Yi5VBjthl7bPxP2qTkDlUScYsXgCn41vAS9G1buYuIPmFD+a3Rsy/BrxdRXY+ObzMdw4XCftm7EsmC7SqjWIeE8SZPb95xQw/9kVdMTUmP3cWeFsYWMSTF0+1GI2bPvjVv6171++E+EFUNNhEPNmkmocEIqHSMTj0ermX3x8CXAD16tZiaFZnAq1mzfVgB7DvL2dbHMDUCbmTt3MWSS0Lydg0GBrrtjrWTwz5OzmWQOv4ZqcHlIIf/oS1R8UxmMWkz0MGRSgUT2xIRfe+i8uwZehIUaKdrPzNv5IXhmkH6n2G01kdlnwGnY6X+RTcKSB7joSgIawYyKRyl/AdjxpgUTKGqFB6DS8RV1FEtCL37Hj/Em1D0PLezR93G5mktZ5dKmx1I7lui7DBFXc67R8nTikTc3uXAoo5J7RBK4WyH3c3+I4MvjRkqZrfEsxC
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 09:45:05.3691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d76888b6-afc5-435c-9bad-08de8e4105cf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7452
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_030101_613918_D4BDEFC0 
X-CRM114-Status: GOOD (  13.04  )
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

This patch series, adds support for analog audio on J721S2 EVM using
device tree overlays.

Earlier version of the patchset sent upstream[0] was rejected as
its dependency[1], which resolves the DTBS check errors introduced
by [0] also got rejected on the grounds of ABI breakage.

Another solution to fix the DTBS check errors introduced by [0] is
to modify the ti,j721e-system-controller.yaml binding to allow
audio-refclk as clock-controller child. This is done in the first
patch of this series.

Changes since v2:
Link to v2: https://lore.kernel.org/all/20260205130707.2033197-1-m-shah@ti.com/

- Fix Makefile entries to follow alphabetical ordering
- Update model string from "j721e-cpb" to "j721s2-cpb"
- Fix gpio-line-names typo: "UBS926_PWR_SW_CNTRL" -> "UB926_PWR_SW_CNTRL"

Changes since v1:
Link to v1: https://lore.kernel.org/all/20260112104536.83309-1-m-shah@ti.com/

- Convert the changes to an overlay
- Enumerate the I2C mux used
- Remove CANUART_MUX_SEL1 gpio hog
- Fix typos
- Add gpio-line-names
- Fix commit message to showcase the right idle-state for muxes
- Carry review from Rob and Hari

Test log: https://gist.github.com/Jamm02/4d4c00bf88fa76cddae6319124341c53

[0]: https://lore.kernel.org/linux-arm-kernel/20250604104656.38752-1-j-choudhary@ti.com/
[1]: https://lore.kernel.org/all/20250603095609.33569-4-j-choudhary@ti.com/

Jayesh Choudhary (1):
  arm64: dts: ti: Add audio overlay for k3-j721s2-evm

Moteen Shah (1):
  ti,j721e-system-controller.yaml: Allow audio-refclk as
    clock-controller child

 .../soc/ti/ti,j721e-system-controller.yaml    |   6 +-
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../boot/dts/ti/k3-j721s2-evm-audio.dtso      | 161 ++++++++++++++++++
 3 files changed, 169 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso

-- 
2.34.1


