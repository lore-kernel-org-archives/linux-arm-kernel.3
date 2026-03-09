Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5774EA8554
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 04:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mSi1yTq6L4fwXsdzr9g+PaFvQ4XFZ9/hutjmcWkBAIo=; b=ZpPW1dmCT0Pj3zzu4d0f9GClPl
	y0IBH4oCcEAmKiJlB2eHTg/n5rUR3vONMl/A/OwXPp0uy9z/jRvTv1ejkMNRU8OcyHvx0Gavk3Zi3
	spJFFgxs5wfMIL/TS88Q2WveKd9YEv0atvUfjcJcVanT3KF5bptopBt+Hog1JH8fVJVzUjmgnBlay
	Q7Ux3Xoja41Yyck0rCoWua5penbT1aL0yGimi4qqxb+KqdqnnkLx8cxKTnJAfudLlyyuw/FcG1CjS
	RN8hGGaHYH/x087HosVq0KbagqPt7HyQLB9mKUTujod3dbXwoxMbslZ5ZTu5hBFW3pHzFf9RAqIH3
	9ceH5ZlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzSd7-00000006f4K-0MmI;
	Mon, 09 Mar 2026 04:54:09 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzSd4-00000006f3z-1NeE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 04:54:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xY1LoqAXRnQ0Cf1HH3K0avvC58lwl+S4zoGwgJuC8C7ay1zG3eFrVLQmgyj8lrlWhWh5Z5OLbT071H06zCm4Ju0bD7Xwq8LQ/aTy/Wej5Vovvmi3kD0FBwuEj+SfwGOTjVZLWgT8Ve08bGS6IXXqJ/7vvWEtJBdbmDQPVU+WKcF4nmnkIrK6Ba90bkeshY4Xz/AjNyTHDHZMk5UGMWbQ2ANOymKnBRmpuyO+A5OirS8AYnScBZKrott1qfVhUGMN7vXwMng5w+U4h6qBXYYQyWI0I7reku8U5x4vh7xOSWrT8BLJqbVfWXS2fFzBmaqECnC1SEiZesrqK1LOyNi/0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSi1yTq6L4fwXsdzr9g+PaFvQ4XFZ9/hutjmcWkBAIo=;
 b=J0mN/SffteHzARhFMV33m1Vht4PQQyd/TR+5zbMkC6+yjXVAgYF9yAXcwGdLRzOq4rFLuhmUGUFNNEB8Zo5Wc7GhNUt6obKLWt4yrPePXkphnQAky55axQ6AalfESRqGGCCqUQnkX3s1Gh33lQ160pZ6qbjxdTXg266ZEKskeKXSn6C3v06khnyKLAhU95X0otWaVbfFz8F28KUrJZOkJGL1uvCvYydvbaoSZuVOceIAhIKeBh8K8f42Pe2XP3uCXzqMBMhl0EmOIQcA/T9d1IM8yVNgupJjiLs+71Z40OYnzt5iIiGC8W4knaxi4ylKjLz0ULLK9bD1I/fEFpdoTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSi1yTq6L4fwXsdzr9g+PaFvQ4XFZ9/hutjmcWkBAIo=;
 b=K9z7S7p7LQ+X82lMsyCRnTAUGJlpWMqFjVn2w6ivCTvU/yBefYe1DAK9YvW98Vi75OdsrAX20NVIMyVIm3HTrK5v4FionkF3GROafGblXxCxr7UNuF45BTNWSjysaydDsXNHUunHfQu9zKfQFoO7QFI12g89wWjITGcZ6SUxM8c=
Received: from BN9PR03CA0054.namprd03.prod.outlook.com (2603:10b6:408:fb::29)
 by IA3PR10MB8090.namprd10.prod.outlook.com (2603:10b6:208:50e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Mon, 9 Mar
 2026 04:54:00 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:408:fb:cafe::a2) by BN9PR03CA0054.outlook.office365.com
 (2603:10b6:408:fb::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.24 via Frontend Transport; Mon,
 9 Mar 2026 04:53:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 04:53:59 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 8 Mar
 2026 23:53:52 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 8 Mar
 2026 23:53:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 8 Mar 2026 23:53:52 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6294rmTt410971;
	Sun, 8 Mar 2026 23:53:48 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <jm@ti.com>, <afd@ti.com>
CC: <stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v2] arm64: dts: ti: k3-am62a7-sk: Fix pin name in comment from M19 to N22
Date: Mon, 9 Mar 2026 10:25:32 +0530
Message-ID: <20260309045539.2070793-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|IA3PR10MB8090:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c65619f-0a18-4104-bb9d-08de7d97e07c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: no0eww1wAejO//458qEWE8RDkWnQTp4qz0h6dfjxIUx467ti4AZjI5d2p1dAbbcRkVqQ6U5T9b7v5PuHRNUW+Ix4tXGwr4M0b7KjbsXpmqYKFocDHn8dWBPPKIZojzhlhsOifOSwcC1b0XyRNqCVqYA3MovXI6w3td3KBku3FoZz0W07LWyJDtHSCICqtCEZ48z4g2kGjgKswHiI5Hmap3uQqHISCpPzYtC9aQD5eOgiGVvySZ3+MT0TGhEyNAHwx3DwN7tjV0jdIW+uIoVsMVOhhn1qmWIlAYJbLsECNKloPKjoTnNQX9K1qDsbiaBzovEWMIIj3uudliKVSQkZ0bGY3CbXUSX2bNZZR90/+o2koi2eufI6w6zfof6U5JD8j2IlqhGLVz+HCqxofCu5oOzovUQvEr61knX8n0iG5KfeWs4aHCCK2Du0ovGV4E9o+2Qgr1fRvM9faKPsbmkMUC1bL0S+oQ3ZaVorPAovfPAE+LW0B4HsY+H+G5ZZyUoC5tPrXC8I0e8YDKZlQTlfiK97dPPDqotClQTTeLyWuzxJOPGARNucNyFhUv/fN/l49yZDfX1xDxNcns6KvO0eJoXvnK88IiINjlCNTqVBp845uWfg4AEb+n8T5JAOnPFfnsgsdthrV+r2lEdWZ357d84RPVQuOO7YXyDF8lwnIFTPmsHcsJjnWndgrHLaSqTvsx4rDHDaoNth8HGnhFHvmHimbWbF/34frU5LNS10CXM=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LsRCsHpBwTI0LMIqf+J2ibSJKnIgcY0a8Ecju5YZaI+l5q5TYAtuQBJ0jdTk5YPJHwOWDi+pY8J0kgI3omccoD2obk13b1arPcfYFMrI7HYVqLM9nCg/DZn3wIuU3lWuXgm0174ylfI9PWqKS+68iWQ+SBnZl7ig2tLE+J/NSPbQIha+DPPAmOE3/yI29md1c2zi73iUmeFVPkHJG+qyQS96tchSZVkBEOU0hlzpSM+2Do3TMTVQmXYIleJzMVlfhgGpEpkElZa9hTCRJ9D9cobYzLQORE2iEWEVkusucoU+1FqV6qhpaonEbd4Ad9JJ0U5OSiIL/qlt5LIwn28kedDICTFWXnP7ZDEGNSwj0Ql9Mw5oJPru7vmuPMvtIUd58aoMfH7lyBW6cINkcQF3+UBenc4V8Ujfnkai+fziXWdX29J/xVdsT1yo/xAG8NV0
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 04:53:59.1902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c65619f-0a18-4104-bb9d-08de7d97e07c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_215406_447916_BD1C4B84 
X-CRM114-Status: GOOD (  10.70  )
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

The pin for GPMC0_CLK.GPIO0_31 at address 0x000F407C is N22 and not M19.
Hence, fix the pin name in the comment to avoid confusion.

Fixes: 8f023012eb4a ("arm64: dts: ti: k3-am62a: Enable UHS mode support for SD cards")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Base-Commit: 1f318b96cc84 Linux 7.0-rc3

v1:
https://lore.kernel.org/r/20260212130843.1054100-1-s-vadapalli@ti.com/
Changes since v1:
- Corrected pin name in comment to N22 instead of updating address to match
  the incorrect pin M19.

 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index e99bdbc2e0cb..b1a6f10adf26 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -398,7 +398,7 @@ AM62AX_IOPAD(0x01d4, PIN_INPUT, 7) /* (C15) UART0_RTSn.GPIO1_23 */
 
 	vddshv_sdio_pins_default: vddshv-sdio-default-pins {
 		pinctrl-single,pins = <
-			AM62AX_IOPAD(0x07c, PIN_OUTPUT, 7) /* (M19) GPMC0_CLK.GPIO0_31 */
+			AM62AX_IOPAD(0x07c, PIN_OUTPUT, 7) /* (N22) GPMC0_CLK.GPIO0_31 */
 		>;
 	};
 
-- 
2.51.1


