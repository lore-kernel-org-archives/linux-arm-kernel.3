Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D80D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 06:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BSDo7aH/DecQGOGSEI6/z/SFKnpTJhF1eNXGHC91qeA=; b=YXZaPb+NNZ6h+bt6oeYDpSMKlO
	XVH5TTkZlvft7HMpwBE7gubBtgr8aJzSDRiYd2zzGooxiyJHSuSNU5Hy1RCKExd0w6z/CFz5NZEV5
	qC8L5w7Prr0wJ2TrfcieUk7H4thLpEeen6Xp010g5f3ZiMuGH/oHe9ANxrr+mpptUg56eJIOi+26x
	8ufgZXnvKiclw1Bu7Z3TjVKsbQCj2LuGygM4cOnASZCy04oaL+CosE1mMwCdw58QlqIUW7orF8owf
	Zip6w+vO0AXWOWsGEVpDQzz0y6GT772NOHfnYj+R49Ka2O5AtJT7wphRAQrAcCO+fBV8SCThdgfxj
	wfb0j7uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi4yg-00000003Flt-0Sac;
	Tue, 20 Jan 2026 06:12:34 +0000
Received: from mail-westus2azon11010025.outbound.protection.outlook.com ([52.101.46.25] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi4yc-00000003Fl8-2HjU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 06:12:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRM3Sw3nFira/0ury2OhL6v0NHR/MY5eWgcZMQyI5+6JWhSs1Frz/r+eB8NAxFcOeh81kE4hM7AFOhXufqOJe2M08iIKWcelSU3X+wxOyT/r8Uv5pfTqIpL8NG1LYnc8SXLeMI61BxUXteRmvKTve/2fbCuX/btKAAOneLQxrCvYEkwP/7DbBiNbl794+9fE6QCUgLdAITfp76jMFJBFSWWrRSAq6oJYZA7kz1hMvbobUzWmHSspBDmBcpcrverWP+xejQW5a/IKb6/MvkZIZT+FCDwMbKtKnBOu4aqQIMQLbIUaJ3WZgqF8FcRvryLzLX+5yXKMXdBRCGv5oEhipQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSDo7aH/DecQGOGSEI6/z/SFKnpTJhF1eNXGHC91qeA=;
 b=IoJ8tC6Bx9RP51z3LSdev+LxD8J+z85+Jg9mCUPF4OMkve5prwn8s7cZCSbz8yj7UzHmO7G7MchCbcyXVmnaScmc2567h3D9/Nrezq0L4v6JNULoOWnYeFMUchOFLXMyBuTttLOiK/gw1G8Blx1LBA0zjUvjCtTq204RTCeBjwMVK6CGDYzE3FdbJMcRv+Sqa4V/zr8EnSEZYnOt5gGKTAtVwrlTWj4KMSb22bCFQKPmtuLv9fmzDilD6pHI87Skk7HdRr9mGS9xzkKmkCFl6aNVASBighA4JPfQkH1MJWzElEj/hM01luFS/hg0QRKFJj6K+/wDJxYTKuD2z54/gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSDo7aH/DecQGOGSEI6/z/SFKnpTJhF1eNXGHC91qeA=;
 b=Y12PmSChjjG4vn0a3dhQxlYlDdFOYGwAaKpaX5GHBCCG+f0W8ManSLuglscRWtI8Q2DHtarps3HAbYASLDBEVkqK/8FgnThoYHLpcS0yJ2OT2hMmn8wyqdTrwlpbDBu2nJrn4SLR6xxxfiXB1fsvuJ1HDLdt3E9nxBz3x9DL3KY=
Received: from SN7PR18CA0022.namprd18.prod.outlook.com (2603:10b6:806:f3::21)
 by DM3PPFA35BF3976.namprd10.prod.outlook.com (2603:10b6:f:fc00::c3c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.13; Tue, 20 Jan
 2026 06:12:26 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:f3:cafe::e7) by SN7PR18CA0022.outlook.office365.com
 (2603:10b6:806:f3::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.11 via Frontend Transport; Tue,
 20 Jan 2026 06:12:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 06:12:24 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 00:12:20 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 00:12:20 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 00:12:20 -0600
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60K6CFP9569454;
	Tue, 20 Jan 2026 00:12:15 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <bb@ti.com>, <afd@ti.com>,
	<p-bhagat@ti.com>
CC: <stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am62d2-evm: Fix missing RX delay for DP83867 PHY
Date: Tue, 20 Jan 2026 11:43:24 +0530
Message-ID: <20260120061335.1497832-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|DM3PPFA35BF3976:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ced4f0b-b851-4d4b-201b-08de57eae11f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vu/QH5RrfHyk9OMzmpMUMjq4nUdDk4PKrSS1VspfcGVUrcIhzxwWWl98p/kn?=
 =?us-ascii?Q?dkgBUxFP2UAgIiFwXuyL5GB2ZCfEldETuSQU36CGGa1wc1jnoeNy7FhfN66y?=
 =?us-ascii?Q?Yn6HonLBXUdIxnimWe2hScRk5oglpEswFUu6Y8IGIVprWZqLhdFYonNMUrIh?=
 =?us-ascii?Q?7MQ4vDP4ifIzBvm1OAJBxH2jpfBxnEpm8BdfW8q+BMB9DBYvlztgIepv9373?=
 =?us-ascii?Q?f+7indi7AhFJetLegfjRg7nFmAwEgeSRFxlMHIIvUpQhhQtinth3wbVmuU9q?=
 =?us-ascii?Q?MVRpy92Rulqd90c+KPLkjh8uDPJNM948jrkZ8c8J7xRJOeVbuHtWk1BN8nXT?=
 =?us-ascii?Q?NMVsF+jV4Xhp/bFDFC5ulWAVpzkfxALwslNDCixEI7Wj2ldzYyXvjrIYId6f?=
 =?us-ascii?Q?/VvrUqhgdyeQzdkJQBZG+xEvUY5tC3X44i97CVxR5AlMvSEgQnUOUe71KBD2?=
 =?us-ascii?Q?AeOFRtkrvQaL/KLC7Iub9VW+bKbh7qDXM0g98vt5a5YHeUpXbJm7/65M1V1z?=
 =?us-ascii?Q?6WEIW2XaTObFRWHh6iE81i542ZHkc65PgS5tjtBqtGXwxyiMkdB70EwiHlo2?=
 =?us-ascii?Q?V9EDuPMbSsR6TQ0BNdyNWhCYI73VVzO+rcZAf/+jutBTDMjjRl9RGEUE9yMN?=
 =?us-ascii?Q?8+ci6BZujMyvXivNYRu9cATsOGRp7kMP6ybsUR+pUAnlRA8Tr5XONPwW1VYz?=
 =?us-ascii?Q?31SeSeO3S/5Gc+0llirVEVLH4eqYLy3LTuuOj2o742ce5wKvDsf/JJgzubrW?=
 =?us-ascii?Q?ZC9THcrEg6YMi1j7E2L/lJAZnDXBnavYp2VFyx1Taf/JS5K+Cln4s6xhpmu2?=
 =?us-ascii?Q?AKuHXj6mfgdRkIaHc2s0DW27L1FoEgtpKgVyM8FSnSlohu3vZjwIB5c5QPrz?=
 =?us-ascii?Q?oii+8PO/zhKzaLf5yyjqJvmS10T7lw2vfnejbFxoVHJtiaeGOtAQicgWNJbq?=
 =?us-ascii?Q?x219oj6nHczaPPm0QJaVV0orWZvOc7CKM0pljN7N5KXVfVkxrr6tt7uMByiH?=
 =?us-ascii?Q?qjPFmg8Ys5vXU/0P2k56iqwFgDvU086/5ej+vYsqkVndfsa2jh9nIhqasADD?=
 =?us-ascii?Q?TNZ3D1mmJNVj5vqjW+FP2kB8FztM995XJioCJqJdZ5VhF5Mb5qkspOOnBJxo?=
 =?us-ascii?Q?3152UG0zNEm/r3Nzvr4ZCNk3iZ/P+UjaPXdakn6BaTCoNfaCy77RTZSBAnOe?=
 =?us-ascii?Q?zZwl7LeubKn5oHBwyEeA37mCuZLolaRxoCLu+XbnIB/gC9woCnLg51WVrkQO?=
 =?us-ascii?Q?4Qqf1a1jrfeGisSGpY82uEnnhyrsg8zx1+vM4SmYj+QuWJOWyZNIKA7JD0q5?=
 =?us-ascii?Q?OEytGm0IR36cJGJkxlADKhxIupTmiokkeiaND2RFi6ZjDPR+a+5gtN+Rhlqe?=
 =?us-ascii?Q?KMU52z2wFYRqJ0K53koCcDnwsvPc3+xDx+FHTdIzWMM3yJCy2NWescB/SX+L?=
 =?us-ascii?Q?eNgw7yWPhfQNzkfJNKwSyWITlxHmPBORFpXQTcpRFtLHbZQxd2pe+76LBkKr?=
 =?us-ascii?Q?HpKk4VJHr52wIMBS/3oKp9qdUd8bxr3uo52Yl2uRq1K1EQIp5q9xtyg2tgds?=
 =?us-ascii?Q?HC7FMaTO/aPwpRIfk0IyVJehoIA/QyK9KPUGV5hP/UZCCrm5RfHukZ6j7v02?=
 =?us-ascii?Q?6DrEWzWr8ATBa8MwtE64ENJifnosDosN2p24ty13jAVxJpImmm+FPuVos//X?=
 =?us-ascii?Q?BhSbkg=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 06:12:24.3229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ced4f0b-b851-4d4b-201b-08de57eae11f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA35BF3976
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_221230_609147_5A25AAB6 
X-CRM114-Status: GOOD (  14.77  )
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

MAC Ports 1 and 2 of the CPSW3G Ethernet Switch in the AM62D2 SoC are both
connected to different instances of the DP83867 Ethernet PHY on the AM62D2
EVM, with the 'phy-mode' set to 'rgmii-id'. The DP83867 Ethernet PHY has to
add a 2 nanosecond delay on receive (from wire) based on the EVM design.

Since the device driver for the DP83867 Ethernet PHY coincidentally assumes
that the a 2 nanosecond receive delay has to be added in the absence of the
'ti,rx-internal-delay' property, Ethernet is functional.

However, since the device-tree is intended to describe the Hardware, and,
the device driver for the DP83867 Ethernet PHY may change in the future,
add the 'ti,rx-internal-delay' property and assign it the value
'DP83867_RGMIIDCTL_2_00_NS' which corresponds to a 2 nanosecond
delay.

Fixes: 1544bca2f188 ("arm64: dts: ti: Add support for AM62D2-EVM")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch is based on commit
24d479d26b25 Linux 6.19-rc6
of Mainline Linux.

Patch has been tested on the AM62D2 EVM verifying Ethernet functionality in
the form of NFS (Network File System) mounted using the CPSW3G Ethernet
interface 'eth0'. Test Logs:
https://gist.github.com/Siddharth-Vadapalli-at-TI/04c51da22c0a05f7fc930afc98997571

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index 2b233bc0323d..17c64af4f97b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -649,12 +649,14 @@ &cpsw3g_mdio {
 
 	cpsw3g_phy0: ethernet-phy@0 {
 		reg = <0>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
 		ti,min-output-impedance;
 	};
 
 	cpsw3g_phy1: ethernet-phy@3 {
 		reg = <3>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
 		ti,min-output-impedance;
 	};
-- 
2.51.1


