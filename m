Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8799ECCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 21:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9HVhnpGR04YIFKkFQpDaoXZsZzBX/bD4krjJmUhGsw=; b=YuxzXdPBvxk6hWpWIYfj1OU0X0
	PUexyo4QtixJie83YrE2FlQO8ZAP7nkGbl8jIlw9gF5Mymr/t/DKu1/0Bb/iUjKlJTqHOWWbHK13t
	ZCOFBS/DQM/8tamaavUnVKNwBPl2dOMHTue9ASj3qbY3US+BMYcaQqxMuK3jX0OC0bb6aozZkiwhb
	mBMaz0feRFpMhfahc0O184K/cSyki58XxsWA8D6BVk3MbprtiVA6r+mkPcQPWkttUG4vd3hko0GvV
	8MNdwEHpWR/i+5QUG85V4kQr95zni+IS86seQabI1OYh6UfUMExJrFWq7qFSFjYnJynqptSABkW49
	qzG6ipGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDrNw-0000000GhjL-3FDu;
	Tue, 28 Oct 2025 21:37:44 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDrNu-0000000Ghio-20YK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 21:37:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OtLHbhD8htVF8G8rRwPyR51570m3/PsVRGT8QscdhdFFz56ikhpebUrFERttHSpZsaGz64tPvNi7DwFUNQRscY71eHVXDELimx6ZA7DxUmCG0FAzBsg+y3ufQVWASzD9c7G5oTDrhJVDlcsMBP7PeNZj8TUaNMBMHRTYDlHEGrQ1lwvCfu6f+AuCkBssoW2tvSw2IcCXPsNSh1DxUnboFhU1pwdvp7lyFkOHaaTxPdF3D3BS6xShqemRg0szvW0tKGUlSDUPlDxKAZQJ7P/RPAbLVuAYUmQbfoLVMCO6mlrIYZK3RihHhhPNheqsxvuLiZ/nCKwvWNYwRrBS/Ta8Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9HVhnpGR04YIFKkFQpDaoXZsZzBX/bD4krjJmUhGsw=;
 b=HWhE7aR6HdogLohaVoKKiUTs/4pEdQP7H2l7m1c1JHY8Hp/z7BNLcCCx/K2gKNdEJtgP9due+HBc6q0MFSn3Tn6UouyIpm3fz4E6/OubX6DpVc9ZOvVuyYbW7a0RtQwqyahUsxwzhZBtpJXHzRFFarZ3a4GGX+lc57uOfXvtxFedGsNytgNUbRDzblnfBiOCgnIgsjZqr4xNBdPf2zK8sT45ic1kVMeLk+mXG6E/T9BgDZWtvN+KyqJuKSzOcWZQYBVnYQkZVfgbF6DJU1OgdYQiJs+VdeZufnY1KDse+HoPsw748CVjBuBEljNZxMbCvBpJ1PvZqr7cWvvr1WCjwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9HVhnpGR04YIFKkFQpDaoXZsZzBX/bD4krjJmUhGsw=;
 b=VzfrmXExvllhjtym4EcBr/eegxq8LtG17Z4avObO0jWVkzVXFY/XAlXMS95CX7SBEpSymWYw9GN93Aitb+yJB7syRs5bJJgYmLyVVmgRCdtHsPjqAlVB6Y8uH1ON3z49Xf3hSGnjOUKv4iNFosmOsWrl+ChTKoIs29wvJUPjvsE=
Received: from CH5P223CA0003.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::19)
 by MW5PR10MB5805.namprd10.prod.outlook.com (2603:10b6:303:192::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 21:37:39 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::ef) by CH5P223CA0003.outlook.office365.com
 (2603:10b6:610:1f3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Tue,
 28 Oct 2025 21:37:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 21:37:36 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 16:37:25 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 16:37:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Oct 2025 16:37:25 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59SLbNva2969774;
	Tue, 28 Oct 2025 16:37:24 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
	<s-ramamoorthy@ti.com>
Subject: [PATCH v2 1/2] arm64: dts: ti: k3-am62d2-evm: Fix PMIC padconfig
Date: Wed, 29 Oct 2025 03:06:44 +0530
Message-ID: <20251028213645.437957-2-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251028213645.437957-1-p-bhagat@ti.com>
References: <20251028213645.437957-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|MW5PR10MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fa8f46d-e338-4eef-aa62-08de166a362e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|34020700016|34070700014|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CEj6Uzl3Bf8D3HI6rvmobw10rI/C8bx9yYo1UTJWCVu8bnufgE39AQAg3bUV?=
 =?us-ascii?Q?zOuc90cWJSteJc7EB6GuolwmSheSDp4GdTqaw0Ivf1vXLxzszpP68kkVBc+x?=
 =?us-ascii?Q?64dcNS5OJtdeKdyDw+NatiNqmVbkeutpDky0aU01dxkEKtJNmdqKuyisXvau?=
 =?us-ascii?Q?8SFKKTpO75bflOWdoscI+49Ebx44QaRh5Gv3XSw9vNtaSecYrke/5Xh0/qYB?=
 =?us-ascii?Q?1CTd9IQgZwq9FOQzn8KdMp98g8H+kUmxZbrReaK7MZp4IsDzMVEL11SHAJpa?=
 =?us-ascii?Q?9FwVZnhgd6TthgVHpbC8v8YBqrOeoibmAufmgVxL2JhNMef2Zu9iYho1yP59?=
 =?us-ascii?Q?09AMITPoAVwvdQdYWeCIE74wLhHr4s8hXlLvalJak8KHoSPZQil1mXB5LQE+?=
 =?us-ascii?Q?EgwAAPUY+LZw2/6VcsNoyEEithU5pB5iwA9WRtRgKvsB82i0CZCykMYJrhvB?=
 =?us-ascii?Q?Z5yPFdJrLyBZVuGv+SeWcofkpU1ZiAEdgmezP57sZjEKmVn9TrnJkEKnkXMy?=
 =?us-ascii?Q?gxG8n71olCxHllakMri6SUGJTCBYcoDqu+q+865rooeJoEmCRD+AV3U42HFF?=
 =?us-ascii?Q?PUaleGzgRgCzElry+by5kTpKmEjpiBMQVfgtIbF92lrES68SP6MHp+IeGkh+?=
 =?us-ascii?Q?rmGY3EA8HGlFcmwlNpI0oW6yuZ+pHUS4LTmFydm4pkTWy76mUtIf9YqyltF6?=
 =?us-ascii?Q?J2hktgcUVz8kBvauHZNkqP0MBl/ZlliMnAm6a2wk3gndhuSHy+Gb23Yf0bxv?=
 =?us-ascii?Q?L7GV3094YKAGG+mxlK5QHgx1dm+k8kNFORcYIEwi4p7cxEZL/yoVUNzjMoG4?=
 =?us-ascii?Q?LsSqjongEs/CnszfnYWHhwCEKFN9rN7an2/EgTKTJOUtMnteDsMdpXsOJ+We?=
 =?us-ascii?Q?XGh/Al/Erh0Y2IH7mklWFVoR/7gTPxAgXVOpgh2aMhPUeJIZsdXZHeQx5jTd?=
 =?us-ascii?Q?NGb96vNJXcvfxtkG6zuucAH46Yvh6lmDKiB/abe3w/D4YqqsVVbwtWCSExU+?=
 =?us-ascii?Q?rGiCLWvEI2DD8jOoTPekI0rjetA3vzDs5RtTcOmaFgOV+229fZsKE6LZRF/F?=
 =?us-ascii?Q?7dgKuAL/iTQWo88m16LO20r/vNVccjDRX+kkjiyUbSXv9IwQlke+ficFKaNY?=
 =?us-ascii?Q?xmBsag1NNa9catmyoK0FCv+0mVGPMFJmDUEyzS1OMWyegLB+5pawRw3CI7BZ?=
 =?us-ascii?Q?Tb7ljGCq01m+c5FPw4Jyl9xsu1X53dqezr6L6adx9EheWsc4Lk/EWguGHBHm?=
 =?us-ascii?Q?GEQTCAOizxIsln3kAWNOfon51KpPcrMsPxETkAB9Map6Ce4v575B9gc94Ki4?=
 =?us-ascii?Q?40bwkF0U5mvTlv/ejkSUn4XLE2w0Ta7Mf39deLCgNuHNdvJIozQaBmVFCmrc?=
 =?us-ascii?Q?CRt07bXLW4ay4CFnwUrTDig4fUCuQT0NIwa7T/27G4XYUiQnGXwP1qlqAakC?=
 =?us-ascii?Q?ZaLG1R5ejsCpkrdDTrIBCh+KkuuNWKQa1/M7OQOaV/xTFamOug0WFr4j5l4t?=
 =?us-ascii?Q?emAJ1ejGbGYKuUM=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(34070700014)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 21:37:36.3902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa8f46d-e338-4eef-aa62-08de166a362e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5805
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_143742_520238_A8BB770E 
X-CRM114-Status: GOOD (  10.96  )
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

Fix the PMIC padconfig for AM62D. PMIC's INT pin is connected to the
SoC's EXTINTn input.

Reference Docs
Datasheet - https://www.ti.com/lit/ug/sprujd4/sprujd4.pdf
Schematics - https://www.ti.com/lit/zip/sprcal5

Fixes: 1544bca2f188e ("arm64: dts: ti: Add support for AM62D2-EVM")
Cc: stable@vger.kernel.org
Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index d202484eec3f..9a74df221f2a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -201,7 +201,7 @@ &mcu_pmx0 {
 
 	pmic_irq_pins_default: pmic-irq-default-pins {
 		pinctrl-single,pins = <
-			AM62DX_MCU_IOPAD(0x000, PIN_INPUT, 7) /* (E11) MCU_GPIO0_0 */
+			AM62DX_IOPAD(0x01f4, PIN_INPUT, 7) /* (F17) EXTINTn.GPIO1_31 */
 		>;
 	};
 
-- 
2.34.1


