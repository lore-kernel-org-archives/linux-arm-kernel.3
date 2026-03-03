Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32874EDEBF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 20:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rp8GXgPDjtFzFEDyQK6pjLff936huWRlwT4Sp6aeP8g=; b=pETeK6Xe8AR8hg689sy564DoC4
	V/jTd4D+8dBujnyrqbHHPSP/cnrJ3bSkxWVC6sS7vdvmSzjj3hklOZdjPgv/XJUIQ+dsKz+PxG+PO
	UchDkiS3zXaXZ0BshEiHdD82gJpZxRYDysP/PnDrgwrCtIRqiF6B+gyrj3p0EGFUsuUwTb43deroJ
	SJV3mGH+eMPtUxMvPIWfdLAluj+3+U5wjvz6YIIBy3z6ADcO1ni9Z0lhvHyDETxKyJ9uvnWSqFi2B
	sOddyZAkvr/bfrt6qC8mUYkIfn00q4LfkmC+5hze3jAzKJVRXkLulDhr7ndyonxUL7h5ezwaNyivv
	UULJoIzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWjZ-0000000Fvou-2jka;
	Tue, 03 Mar 2026 20:52:49 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWjX-0000000FvoE-36xY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 20:52:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lo00pHSscjEV+vJKXr61Fuo9Csnuv8WEl2ncJj9P+CVlS8kvAacaKKvuFx++m023kA9/6FHoUqKUn3XR4VXRfDyKYVWKvFfiGbqXw3qQwrIW89u5PN+nQI84yx+dW8OVBruB1o/JiWmA0sbixJS6FpadirhyMvsQt0QJG6F9Ho0ad+MmvQDGleKiZUKtAEH02d7yuKfHHPDG1tX4ZKahCyXgVmOeCwArJpRWpD/Tyldk+cxQ/wH6RCxAxNJvJH8wUSES1AwyTBJ3YNWXJ8BQiO2VCn//fgmSTrUcDJh1gm6zJuX+/L7KtE+yTPtPbpA54SGEl5ueQ1Fpy5OH3NgyzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rp8GXgPDjtFzFEDyQK6pjLff936huWRlwT4Sp6aeP8g=;
 b=XHVwFDxQ3GKJyQ1gvXvQejY70/tgWyOTNza37dDwX+6eXereMOZqMejhqlVOPcDQcrdbyoatFVeFYTJ4fe/OtV6L2D9ay4sLJN5m8ilVJEDFjCX17Q7kjDrFvlIYpy8A4CuYM44zAWiyB6BdQcKg5lm+86Gbw8GL3ddAXfFaqfxpZuVWtd3CVrR8jYSveqEY2auZXGjFFwtHQkpVm9tC2LSiGiktQsu4l7FKBsZ2scTk9OYbRpVut4smzLKqNR6Ie/cagSVlkawUi9vGPDsTf+eOITD+8ziQGiROewqiXmoQmQDdMTM3NpzE1mPkP4ESIchZb0xm6Z770x5cIDpJ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rp8GXgPDjtFzFEDyQK6pjLff936huWRlwT4Sp6aeP8g=;
 b=sVb5nPjYf7PUs/cc5qw/o+3daHZTUEuBZ8b5jwCm8pAlpFeuuHh5yES0qsyk1QFuFZHorh+0udQqpKfCeaxsJ3ij2UMQGzsj60pfNPewn+qZqy7Kv7R4SAlgudEaLo6lnhiTq05kCLjuGlq7gbl6JYy4VyfQgZzSTkgf9d4reFc=
Received: from DS7PR05CA0090.namprd05.prod.outlook.com (2603:10b6:8:56::13) by
 DM6PR10MB4251.namprd10.prod.outlook.com (2603:10b6:5:21d::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.22; Tue, 3 Mar 2026 20:52:41 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:8:56:cafe::ad) by DS7PR05CA0090.outlook.office365.com
 (2603:10b6:8:56::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 20:52:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 20:52:41 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 14:52:27 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 14:52:27 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 14:52:27 -0600
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623KqQBu2782957;
	Tue, 3 Mar 2026 14:52:26 -0600
From: Andrew Davis <afd@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 1/2] arm64: dts: ti: k3-j7200: Make MAIN domain system control bus a simple-bus
Date: Tue, 3 Mar 2026 14:52:23 -0600
Message-ID: <20260303205224.108217-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|DM6PR10MB4251:EE_
X-MS-Office365-Filtering-Correlation-Id: 592f774c-929c-4c13-e9f1-08de7966cfc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|34020700016|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: OqX6eTkbVeMcWmgzZimVMiDsr6JJjhW97Ra1J+E33jQ0WD22M6+Upu8xJtJK89xOtFbvA0UAw2dABgVY9GMstIlKEL88GbhjaOF2bEltNaYw2qngGMoRAqGV+joHRZdKkCLpvaQyVTqq+2+/jN/WGAMbH8PsMFAmU06FCKPonWidOhADBmFvJXlYexL+aKUsTqE5OmPF3juuvFrIOx9+IdEIA1pYwUHNpHyu3V+1T815qEfYCDcRJJjDmtL96+3vw+h9qjPptJXtrCgwUStWTTXllhkI3JIsw4t0EHYwiQzx6IM5LM02XqlYLpPe/ZGWSukwKeFw7nuTJ2A4h4GBF7ty8Xnm/ZimS+Eg1PrlY+CLcYL+dghEaz2IOLyyOkzrgwokkHCMU6JMi32qC0NpI9BTdrI7gAX0xBDccQwskqJQh4Hb1ro38OE6izeYQMjAHtfL0YzWYvYsJgLqSjxLnW6NntNd8Kf9zaL19sIlJXlsfDyDHORFXzNdJ0JyCAGqIeO8m5WzbNmyFDjNUTnHQ6p73vFfFhVEhknKwxW60gOG9ceSlsRvS7WC1Q1ZE/ndKXfd6zsA6DgU2J4GgwtgHy/ga89e5dBhmVO30xqicv9bHigr532QqbU6hRAo2dm6vvc6CvIhyl9dRRcP8ns2+R/6aW68kAJF3gBp++1GiOXe9DhhTYeZrbjhd61AiI8kztIGztU8iOmpH4bXf0kv1zJpnWcFO0SHTlXmTfa7LwvIMrg3FL0hMSKAyIa1WzKGqk/QmwIqq/SGJsYTiqWsi6iiorqDIhQhGs5oCv0PkjqcHNcCFaAS5JWuFOQ5k/pkdJ+ib6Lhq/o+00Q7pk9s2g==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(34020700016)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kTkEYhKCzIqlejSXKjXO+0l+OgcE7T+p2rK9laq+3mqf0sq1ni3YM9VZxmSxSKBu6RFwsw5KIA4mWN/a9Q34iMRscXvf0z+L0K/A/5f13fF3hWqOc8c75Yns8wJZ0a6C+XovyzCb2g9jWKrAha50eYqLv6BhY2daIYGl5rJU8JQ2m8aww0tnW5R8niSN2bKP192sa1W4mYfcO7R+HaX1xxA3M87bEVg5oTZnj6NwmtE7Jf6hQu59G7pYp43F3LnBTYxy2TXPqlq2npidFBKHMwLrLGCJJTXMD8nrFxBkS5JHb9EiYFGfZbybMl3JcztaSS61t2fFks2eDSddf+np1Wrl352rDUU0ohEvEQDv08GaU2sjWkrpV31hvqcT+QQSOxO0IcGtWOy26vVwdhcVOpASQaw4CoUbxBKGmOf5eFH900yOqibFuBkYkLdV+74q
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 20:52:41.1433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 592f774c-929c-4c13-e9f1-08de7966cfc2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4251
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_125247_777675_38C45DCD 
X-CRM114-Status: GOOD (  12.16  )
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

This node describes a memory address range containing several sub-regions
with control registers for various IP in the MAIN domain of this SoC. It
was described as a "ti,j721e-system-controller" but this is a J7200 SoC
with is not compatible with the system controller region found in J721e.

No project consuming this DT has been found that makes use of the syscon
compatible for this region, to prevent any from using this node like a
generic syscon region in the future, make this a normal simple-bus as
it should have been from the start.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
index 628ff89dd72f7..67fde5667b8d9 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
@@ -25,9 +25,8 @@ atf-sram@0 {
 		};
 	};
 
-	scm_conf: scm-conf@100000 {
-		compatible = "ti,j721e-system-controller", "syscon", "simple-mfd";
-		reg = <0x00 0x00100000 0x00 0x1c000>;
+	scm_conf: bus@100000 {
+		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00 0x00 0x00100000 0x1c000>;
-- 
2.39.2


