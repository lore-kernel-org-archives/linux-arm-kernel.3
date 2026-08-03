Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAE2C55162
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9I3rxKoy5/dXB1KU88+vpCEhS6/ObhPU/teGTbu4Lxs=; b=G8vsgSFxy2erFVVs60p/u1toYO
	q5ljcpo7xxpOisvApF3CJ++balBWGNe/M/SetQiF/Rl+jpyPIHG8EvD2zEmzdnpQyrNn4nAdln0gU
	M5NWJIPn7qWpehrqFamT2P4YuhybsHBAIydypmmFeufxeMXzCp1QTO0bQJcH3CP8l6FRn2KYWCU40
	Y7EVw81C4JOLrA0TZRsSlrN8lBHV6t2Cj4pUGoR3rSgQhvqY8bdQ9Id/8EBbjqdDD8bwih3cBMIEz
	ry1Ouz/+aiub1zlER4nxzuYLamj9aESBSOXq9eF/gQ7LY9EAujgJI6rDiMtJ4mmdqJptZC7M6BXAD
	d+Ai2ldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmjo-0000000GUIt-3H0v;
	Mon, 03 Aug 2026 07:05:28 +0000
Received: from mail-centralusazon11010060.outbound.protection.outlook.com ([52.101.61.60] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmjm-0000000GUFC-0KSp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:05:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k68oi/14GYpDRwbnu4Hu5q3/vqQz89d1m1qJM04oJfWA+wwcFstWJoMDBK0lanvymOCAwHIGHzDr62enW/1ApkvHCcvPACIBwveJS/xVcHmwR1So4ddWGrwdznVMW/XikJWWYtENBNKJNgML6af19j2Xl9ny3a/gGEl4W8aGJmRivQROfZmOolWEV/o604Ffo5iM4gi48PluTLZHOIphIm4oY8+Sm0Dyy2NmwlUpPsOoC/n6YHYsxvr8SgtCMogmPlyrxQx3Sz33/TvNt8Jsv/yoIntIT86GhbpZ9KwaLX55VjFTnNGJDbtFoxvrlsmANeT8mI36d4Fexxak8rV3fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9I3rxKoy5/dXB1KU88+vpCEhS6/ObhPU/teGTbu4Lxs=;
 b=UX/MrupTcjDXDK3ty2JdQ3YDO3denwXlZnW+7PyTPJoPfFUaNvXyuCL9zyX2D3vB5XSDxba2/ATZxFl+QeRAlwskd1sWGCHYgeC4hY07+hKKYJSK77Ojx0m9sHg81dHFPJiTQITEqMva5n7pasXVbdaJk2vbOhEuXiU4knfrQbNUyFufJUqAxDXN5DVyt9/uP6IQQIhHHAXKTkfgeZpBSmCroVCBcDC7fPbosSebJ5NcJLOzBlR78oIn4A52fouxdugDOfr/52syzyjW6TU2ifpu62FEnBiYj/XBCtc1WCN2IGrv2AlorILdMV+IOg4Eq/27rRUHGcCzC5Vf2ndV5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9I3rxKoy5/dXB1KU88+vpCEhS6/ObhPU/teGTbu4Lxs=;
 b=geDJgfcrHRurbnaz6pAi1DExE+8PJ75XxFIfmLVPym+UtMO6L6v3xRCb/ZE0Bn0JbbHSYRx3aTgzTqg/Alh7LsWq4NTv8FHu7SB3VVTm4c61kIKx9sbQLO4CvEuVIKvaFuiVRiTooGd4gfuUcrbkVUqeS9LYsF+ATp32z3OfFmBHwNsN/tPX0GyQVHToltkMfXnNmFsMGn6X2cfZEYnngvKR6JU6dzcWZsyVMI0dku8XrQyqpsrAc3jc6Y2LRm5+R//upJbPdrAX/y+m2/Py6uD0pAWx/y8047mPi2N+5koESf5C7I44veeqpu2mrqiASEXTBd0Ly0L1pbWEO+Axqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by PH0PR03MB989258.namprd03.prod.outlook.com (2603:10b6:510:3bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 07:05:16 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 07:05:16 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	dinguyen@kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.torgue@foss.st.com,
	peppe.cavallaro@st.com,
	joabreu@synopsys.com,
	mcoquelin.stm32@gmail.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: agilex5: Enable pagepool Tx buffer quirk
Date: Mon,  3 Aug 2026 00:05:13 -0700
Message-ID: <20260803070513.4657-4-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260803070513.4657-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260803070513.4657-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::11) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|PH0PR03MB989258:EE_
X-MS-Office365-Filtering-Correlation-Id: 29a69a94-2da8-41d5-10d3-08def12d9246
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|11063799006|56012099006|10067099003|55112099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: gs0RjApFVf6TNdLe+NRzQ0VW1lE+QOWNatiuaJz+i9IWHUB8njDtdwIFVIBzi0N8qNSNrkau2YYJQVbQPV/ttcxJrFp2f1uWqrlZggD19Kbt+Tw2uQaSJvJ+mqfqoBbRJtQhr21sxj1hUUxuWJpkXE7mlVuAgx9qGYR2JqV7BmUyw6bRqP6U7c+oQpBxKYUizI//2jGr8hLz8ngGd6pJhszaPD/UFzRzEzuKlbxIapKtX2AoBrtEHRaApGZQVC2J2QJV00XYQp2sSWRP0C4bqMCQB7BjCGXR4pUUvjJNJYRPvv8/6Q8NsBsZn4+G/Clk7kGaAHU6vrIcxjI+O+ToRR8E/M8w2ix+OeMJ57VL6NzYmk3Yp5r93eqIsspnkyVAfPgx2h5g2dGvc/pSbYz42wlyg9dCw7/0hktjdAVkM1At9W5i09zSqMgOhg0Vl7sISf2+nK4dJsGovbfM6bZv0HaU/QCuRcNiqEiI1Aj/qBFFucGxlVE6nJtyYv/GVpwn5h9um5fKDdUHYc2QGSPe2B9bvlyjx86A2EdFcIrwnc1sFnuJPHYaLoTzXEuIFX6uaL1OQQKv3EzcPfrBopb3A0TY88x70OODcdgB29+VdKcBnzs13AhuOyQDPYwL12tT2GfQF5g15iEV8XXv2TU7VlBrl450DCGlOzaby3d/lUg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(11063799006)(56012099006)(10067099003)(55112099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ntp5rJJ7Dv6FgYI12OXISB14p8QGck6J1mcyOVOpu0K0DSNtRoJnEuxJvkjK?=
 =?us-ascii?Q?1cfyz1xnvn3Jrv2NIvs3FdCU41hTL1/rwttCztqiadEUMwDaKZ5BG8Vs3q6b?=
 =?us-ascii?Q?kJs8NjpxKNTqlSBxS/MuIrZ4d1U+z+YZYilwNmaJbwKs1jmws8xpT61DdSMA?=
 =?us-ascii?Q?vpoCY2kKMdW0aJNDn1n5MOwkFxMbZGjQb0J9Qw3+C5uddfPViflaDHdNkVTd?=
 =?us-ascii?Q?znX6xM6MUPBZGlOpmPHmqndmq2dzUaccbSjErBAo8g7ph5eSnK2R8q2H58Kx?=
 =?us-ascii?Q?ivB0YexzHLNWjwZF5uvVX3MYh/veg8dPW91wIi0cJOmyc6sac946S+qSfsEy?=
 =?us-ascii?Q?tLadernE/+CYfdy0XixRoer1bWsCWbfFDbl/SHMu1KF5o0lSsPRhLW3aktzq?=
 =?us-ascii?Q?3ugw+Sa5Bh1aEASn+M9KtH4HWQLGMHC+QsukV72dRyoxj+mOq0cwJO5wu7pT?=
 =?us-ascii?Q?Q51l5gNxTrM+rhqmobk3Bn5DgO5uArK7PSo0d1IzGeG4+F22AAXibmsLBnYe?=
 =?us-ascii?Q?5MsvlQ3AUlDit35myhkwWf70EuktkkyoMnHep0BCJH+wQmatj5PZVlCnRqjG?=
 =?us-ascii?Q?rFOQfJh6QHNkpncTZCYfeOB8BWKY1GF6ZyGgRWmdxjLE7ptxaNpL+bpjFlUo?=
 =?us-ascii?Q?O2GgDNaSfEeHiBtyDTG+oj/06IxgsAi4czxofoiS6K6GzDAYc7mKAl8jIbUJ?=
 =?us-ascii?Q?DK1qW4IU0j/hcGNmKYYeAT/4tvQTOhYt73nAZeQiWGdXeC3BGo6G28gMthWH?=
 =?us-ascii?Q?+bxGLvW+wFW1cAqTMroxAQlIvlP2wlHH3h0Hcno+5vRJKJy7gAkxKlVMM7uM?=
 =?us-ascii?Q?ugcdxihtDbzAjT1chFyWcLPySHrVN6EWPezJb+DA/UO0XBKHkBfbMHqrDABX?=
 =?us-ascii?Q?OWqBZuh+cE84l6ijCX0QOVcTxRsiA3HMwPbM4jTOxTVuGp3t9DIzrZFX2tWh?=
 =?us-ascii?Q?aoa2ddG8RuUrogbyaxfk+V3W+U+G9x/sVjBenaf5Lm1fTTiPR8qWTkocw+AP?=
 =?us-ascii?Q?Hd2LG7WwQY9SlpCmuTF+Bw6YyKUO153YCRejs+1YDDH4z1qt6Bs09tFnGKM5?=
 =?us-ascii?Q?QgEQDDu1zmYFtAc/QJgmgiedMzv0fCxVj/ZfklhI8WnuDqpKNdwk7Dnq0awO?=
 =?us-ascii?Q?HdSA5FrFZSoISY+j8xrR6oERI34/0ZpZ+AMpUzhDSEsdE6NVVNJ7AyBHY4UH?=
 =?us-ascii?Q?Jy4+rToIj2XXKTsUmsDS4MX8LneZuRvlYRL2/I7nHJcKj6h68OhpAwXRF0VX?=
 =?us-ascii?Q?bXsgFDHjDPxJs4A3kelkdSd9wGRW1SyuF2rO+U4yda/Sxle5Whu46cuXrYRL?=
 =?us-ascii?Q?yBcDBIgEBDks0Ql9mHeIcTV/iyk4DCV36FrWscdHdMevtTaSG14Xzod5f1fl?=
 =?us-ascii?Q?Ah98lAgjIHpp70Q0h3of+/pszfw5gDzt/ZT0DEkPqBentzBJDes5/XVk0tpV?=
 =?us-ascii?Q?hXt1IiLCEJm3lXvKsbhJRTzRTMNWSheeqOSq0wnOEQscMrMlQztyP4LgQcUz?=
 =?us-ascii?Q?gSBPQiBVmz3e9dkCpNjBFeCzXxjU0qwRmMd7NeHIDm705G3Kb1UfMX2AZBzj?=
 =?us-ascii?Q?10y2Qhn33i1yvvVSGvVN04MaH6l1cl/0bU/C47poioJJOErVDQLYhRKA8hf5?=
 =?us-ascii?Q?TA3vX50dsCTwU7Q8hSUJmq7ZEjzeaCM/+NmNrp3BdSy3p/mxegKun5YNUSY9?=
 =?us-ascii?Q?/NyNFZUMIQNXajD2Ia4RngIriLLd/w+shUxMgkHFz6D75BltvCPKCGyRiy4v?=
 =?us-ascii?Q?QGh53JY07TMe1C5lbq0nh8sf6830DGRrCYUN9dzw/FkOHk5dNBnHE7maPVsk?=
X-MS-Exchange-AntiSpam-MessageData-1: SBfA0HP7QruyEw==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a69a94-2da8-41d5-10d3-08def12d9246
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 07:05:16.3944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4tE9qk5+9DruQKxcD0wFHXoo+DF1lLMminOEYCxa1rICD1S+toIN/RMfQCOZkTqBTeDqEx4GS5z1DQryk02rRSUIC4kXqzrNsztxQrXCF5rwTVmzyp4lNujyLCCImZSxH7ZEE6A12X3C+dnAhftWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB989258
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_000526_125132_7F36F792 
X-CRM114-Status: UNSURE (   8.80  )
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

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Enable snps,pagepool-tx-buf-quirk for Agilex5 gmac0/1/2. These ports
use an IOMMU, where avoiding per-packet dma map/unmap invalidate cost
improves Tx performance.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index f54767d1526e..4ce4fa091385 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -605,6 +605,7 @@ gmac0: ethernet@10810000 {
 			snps,mtl-tx-config = <&mtl_tx_emac0_setup>;
 			snps,pbl = <32>;
 			snps,tso;
+			snps,pagepool-tx-buf-quirk;
 			altr,sysmgr-syscon = <&sysmgr 0x44 0>;
 			snps,clk-csr = <0>;
 			iommus = <&smmu 1>;
@@ -751,6 +752,7 @@ gmac1: ethernet@10820000 {
 			snps,mtl-tx-config = <&mtl_tx_emac1_setup>;
 			snps,pbl = <32>;
 			snps,tso;
+			snps,pagepool-tx-buf-quirk;
 			altr,sysmgr-syscon = <&sysmgr 0x48 0>;
 			snps,clk-csr = <0>;
 			iommus = <&smmu 2>;
@@ -897,6 +899,7 @@ gmac2: ethernet@10830000 {
 			snps,mtl-tx-config = <&mtl_tx_emac2_setup>;
 			snps,pbl = <32>;
 			snps,tso;
+			snps,pagepool-tx-buf-quirk;
 			altr,sysmgr-syscon = <&sysmgr 0x4c 0>;
 			snps,clk-csr = <0>;
 			iommus = <&smmu 3>;
-- 
2.43.7


