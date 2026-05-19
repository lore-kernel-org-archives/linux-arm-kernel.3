Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DA3CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BdY2bbbRX0dHnUUVJHe45hJDpJ0fuJbislf0WvTlD3c=; b=GLq+UVgjBj1dRoFdP34slAVqrH
	6FNBz0KggsBGWrHO/W9F69WuO6qSX4cBXolu/Hw7Huldre6nCNrWYoSa67tbrrRkwePuatASghtS1
	CMM4iLUFrc9GgBUEGutac1T4GLptptxwmN7S1Tc8qwLMj0ts6gVlBLDSaQDWRzQe6XwklEndIehy4
	urS+ED/SCl886oi+hw9cSAODiLL/mGXMX9OisLj4UR9ADUQmJNYrE5V0SfRM0iaWrna/5XnMwyzTe
	exVsJuUpAkO9FoileoaiBXCWzliCIWWRRKyOXuV7Be8B6NAsV9HkNdjgOHtdqP+n1t+dwn20UVlR/
	7PaJxV8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLMr-00000001oiv-0UeP;
	Tue, 19 May 2026 14:24:21 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLMo-00000001ohG-0yam
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 14:24:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/9ZQP6+WgsryVRcK4T2nejgTtOHpF27IfWoGYkRjGB+DMwJRoxNodSGX/GqP00JnU/qux8238ysi5FtnryZc0SaIdNwg1SCczBVn4LSy7wfwGvellRr30R89rLOlm6O/aWA3r+ZdNr3USAkKUtCtfD/0pfVjeeWzaHzboAGKa5jF53muc1DT9zEKGgdTdef9QhVA2GcgOT2OJEAwpnJ1ngHH+R+k8MwgxauThb1NPOHJKPmOfcTnEbA4q17mqJInxcWVX8r6sGuYGtwHrnpvNCH82syvgGiscUzwQ0RFpngfKBDsonNbz23e7w0UZ4zp0OSslt90eTj3CV1Xan1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdY2bbbRX0dHnUUVJHe45hJDpJ0fuJbislf0WvTlD3c=;
 b=tPlMDWC0SZckbEjvNCEMKiJRbUi5Zy/BfVcV5MLLSVlyFaGy+McThOGC8uMdo7GhikSqiDTVjcpS+WzOazOxq6+bwD1SM81yoeq9QZqEO/Ik97z/+oLEYJi84sKxHjR+9e2JFTWt+sPBKF8wp+tjzkLL9/WRuI5jZizhCqK3d2PsyLFGNfjj1JPbNwVhMZNtHI8XaEjxtVq83jFDxMB1qoOZ7Px2focFPtCViHidrVSEsK7EzI+o7rLm/SZ4vynozH1QbQ5F64lypZqBm3w/zNNK+pR4iLeIJiUUSssBIgJ/mos3wsvmcSuKmlBDYT5lmD79uIx1/v9Q8935E/L/Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdY2bbbRX0dHnUUVJHe45hJDpJ0fuJbislf0WvTlD3c=;
 b=gNcVGvqX8b8uHMnkB66/5dGRmYAUZrgILCT+dCU1DUxHPglyPG8C6ue8CmbV8x+5SgngWe6FzPXZQ7sFExKL6kcD2vxxse9ba3HnJuI3l4jvr7gFDoC4xysBhdjpgIsQZhAC4NUYlQZE9K2CusnM6TaaX+My9++A9YXAxGKjJmo=
Received: from CH3P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::22)
 by IA0PR10MB6697.namprd10.prod.outlook.com (2603:10b6:208:443::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 14:24:13 +0000
Received: from BL02EPF00021F6D.namprd02.prod.outlook.com
 (2603:10b6:610:1e7:cafe::3e) by CH3P221CA0008.outlook.office365.com
 (2603:10b6:610:1e7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 14:24:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F6D.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 14:24:11 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 19 May
 2026 09:23:46 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 19 May
 2026 09:23:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 19 May 2026 09:23:46 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64JENgoT4183406;
	Tue, 19 May 2026 09:23:43 -0500
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <gehariprasath@ti.com>,
	<y-abhilashchandra@ti.com>, <m-shah@ti.com>
Subject: [PATCH v4 0/2] Enable audio support for J721S2 EVM
Date: Tue, 19 May 2026 19:53:39 +0530
Message-ID: <20260519142341.2531948-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6D:EE_|IA0PR10MB6697:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f1119fa-0f67-4df9-4099-08deb5b24be1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: se5kcEGdmiv8og3Wckf497cbsdrJsrij/iKJE9ZPyykQmX26ifL19LyWU+hAvW5eUuO8dK7bXsi8wHTIeJ1XOlzPo9E1lmtUu1eBjmBBvR+6WWK6/Vd7GgTqtWTaJ2M5x9iulAN031b+aa2xqr2tA2sz7Y+AU2iqTQLmUNfgEYp2JmkW5OlIglZZqZuNYMBxCBnOKSrVrrx/OarQ1wu4BsBp9mVPzAr5FWonuhswwCj6hIIR5OO5VOYFpVtVBzICODNhaVh6d4nk5stldplLju+buJh8EC/UZEawGnEylZzYhGX9V7opSlo4SM82vR5ehTIqRXduMcsnJ38pNxEyuqZQUWuVGYkVGZSQmfB7yxoUbp9u/lnXGOnxVlcRyvUIujCLW3NvGRQEDIuaXyqXcDifnORwp/x3c7/L1XolnI64MQsvOq/atpA/AUCKsNO3b4T07Fce8Dsem4llmmjm3Yp7+f0toAMyQEMDY0RjEffzkzqu/c9X8es53MpFP1cfh8MqRSkTQP9EoDa0/g3pV/reVR9Su/IHCbnxtfP4jucLwW5kzO54oytYt3FKu8t3b1ANAWNitXFMXAbSYHdshrUqHr0BfyCD6wEbhJNAWxsa+5r67Obp2HMHRh9THIH/bc5pTHYKqadkT59bA9/BaNEN678ukVpv73Fx292pfSVBGsgckxeYDf3uMElHGxq3
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 62wyp5RHuxphM2M+PI7HusoKUEyZEYWDqECVL1aQX5+7j0g/sCxnFBghLgWD80Wc+oABFX9EggZdoE/z+CwrHt7LH6TRufgVHkwxdLccR0QkIsXAoNhc5fxuAkQb/cbZFPsxKNQZWoLhM5ed6z9RaNASWchlbPIYl5u+e3lH+t1grWIR5nxlx+L4WnjgeYvdofUk3O7h3d9qUpoBGlTj5ujvDUoYiDp+DTrX9eTa6zHlChb8DwKTqqg/a2uuAD1fS2/4W6DcUfdXZ0fxQNnoN7sZxrz15kVFtELgjc8DvRLKntAE0QBedbhInHL4YJEmzP0dwWsr/Q5y25nfuLIBA71wKeXjzbBMcGr4VV2TbUHg65T5JTB6x3Y3pXRAG3itAog4VkXZDr1R119GCmtpGd1HCI7B8nMJ4THyLhlu2Nq/BXuNCOGqUO3EaLaG+9iu
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 14:24:11.3863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1119fa-0f67-4df9-4099-08deb5b24be1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6697
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_072418_364099_FB09A806 
X-CRM114-Status: GOOD (  12.92  )
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

Changes sinve v3:
Link to v3: https://lore.kernel.org/all/20260330094459.128648-1-m-shah@ti.com/
- Changed compatible from simple items to oneOf to support both AM62 (legacy)
  and J721S2 (primary SoC-specific) compatible strings.
- Pick up missing R/B given in V2 of the patch series by Hari and Rob.

Link to v2: https://lore.kernel.org/all/20260205130707.2033197-1-m-shah@ti.com/
Link to v1: https://lore.kernel.org/all/20260112104536.83309-1-m-shah@ti.com/

Bootlogs: https://gist.github.com/Jamm02/f586087dad227450abe8637e8a688c68

Jayesh Choudhary (1):
  arm64: dts: ti: Add audio overlay for k3-j721s2-evm

Moteen Shah (1):
  dt-bindings: ti: Update audio-refclk binding and j721e system
    controller

 .../bindings/clock/ti,am62-audio-refclk.yaml  |   8 +-
 .../soc/ti/ti,j721e-system-controller.yaml    |   6 +-
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../boot/dts/ti/k3-j721s2-evm-audio.dtso      | 161 ++++++++++++++++++
 4 files changed, 175 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso

-- 
2.34.1


