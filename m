Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCC3D358CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 07:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHkI3PZzKwLnY0iIUxXr0M94trmVE4fulgah0rnqt2M=; b=vLUuAXKqwsdixwPoWQgEsip8Ji
	dXs6byTyRQQviRwDEYUNUptrGu2s9HEfzsSUsSr7jx2PYoS+H9C+j00UAkaVwsJ9j+xcEiBJY+DUc
	rbtSG6PqgOf6isJY/77D6o7D5XE0Fa7jLn+3bcyo57h8R6kpecsVYB7e4TylNpl1KvCzcWKz/8eDH
	XZ34X5YUBFiYC0rPZWhcznwxhcxkFTlcqA7fFS6jasjEq57J9SuVigST3DnUZfUNx8hgIC+92RVe2
	G9fhMaDNwPxE7kj+R8RQ3rHcAIKaW+euGlOqwUrd2aEJmhWbnnWWQdhJIe/G8F4M48hzfVMI+yK1s
	Z/l6OAtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlM1Z-0000000HLhF-2Kry;
	Thu, 29 Jan 2026 07:01:05 +0000
Received: from mail-koreacentralazon11023107.outbound.protection.outlook.com ([40.107.44.107] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlM1R-0000000HLe8-1wSI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 07:00:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSp+e0xRyPF5J6dt1nM88Q39iUVj/ZHOfiTQ3iecw2vxYF2xTVIiBSggqQrtnLF46njcZtDlFA/0VHMTIVLaIXuuKBvsgXWqqQfG6mF5ezAnfDrER9dPjlkBA7zoF8e6vmNtS+BVGq4bmFRxC1F+bMEOI7r+zL4irv0JkrhwXJAc65AKIhuETssCH5rtVYucqWgFMs3A7mTtfdCDyFZLk7bl1226q2+lK0MuCuO/nVqffbFHKzh/yFjPtqjMnUngrkEPUELRtgmsAVE9sF+CSsiIRIL79XzcKofNA+ZDOj5tlhEjXDh3Vnhmtla9uDJcNZpR+YGJttO59KHgfm2LSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHkI3PZzKwLnY0iIUxXr0M94trmVE4fulgah0rnqt2M=;
 b=hbnnLmKMDM38jcb1WLo8ZFtz3uCCjLZ0NgfBJxU/XNfA49P+2rbonVrj83zDQNgJI7U2bAnqMqYs6NK12++jhVO2a4lUCVPJuzsFjk05IzJdnxj9obHoMZe3+xqBehQnBeF362g0lh1q/HjgNIJU+ps1sLxCg1YbgagU6Vj/9b7lG+AGrrHZt+VhV+ET+Jo7spv8czW/97tagWYcZ3qlmq8TNJ+NSjH8+KwkiP5FtiqlOeONjvlNlMAxu68rmz7Db1XkQbsvPTnm8Twe7AWxENhvzEJI/897/AZ9GURH2oeDoKccXws/NuYG4QwnnwpX+TsX9SE2DNoEcE1/rQhewQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:300:2d::13) by SEZPR06MB6459.apcprd06.prod.outlook.com
 (2603:1096:101:186::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Thu, 29 Jan
 2026 07:00:48 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:300:2d:cafe::1c) by PS2PR01CA0001.outlook.office365.com
 (2603:1096:300:2d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.9 via Frontend Transport; Thu,
 29 Jan 2026 07:00:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 07:00:48 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 079ED4350718;
	Thu, 29 Jan 2026 15:00:47 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	peter.chen@cixtech.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v5 3/3] arm64: dts: cix: add support for cix sky1 resets
Date: Thu, 29 Jan 2026 15:00:46 +0800
Message-ID: <20260129070046.2601503-4-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260129070046.2601503-1-gary.yang@cixtech.com>
References: <20260129070046.2601503-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|SEZPR06MB6459:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f6595683-01f0-4fff-d043-08de5f0421cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CsIfUaQS5Lo1icx7IeylGnvnf8FoQDux1j21g0O1Z4tHtzhlUryTXK3RH61b?=
 =?us-ascii?Q?i4k10i+78ZwF7fzQbszwRbcyA34E+JhjwgCV6LNDFzVyDfFnTXccdJvQAI7I?=
 =?us-ascii?Q?c8/io+dwuJkTGAK87r1LgYLgw6j5Jqsmz21UMBNmxImol7GUyE/icJgpDy6J?=
 =?us-ascii?Q?lurKFnwYh5vnHMXPSgx4GpObUmVx0WzWji5gHLmhsZlhJAtc8FwD221/YbwT?=
 =?us-ascii?Q?mWcCbWIka3cRWYK6tNd3mNqDsIVoi+K/Pvgxvjoskvk2g/QR4L+bDC21dO3V?=
 =?us-ascii?Q?jWhLdjc4GDP1OkzpVr/e4h3ov/s12LBwluVuhhvnWKHaFbdguhRhzsyRub1q?=
 =?us-ascii?Q?TV+0cEX+E2xu/F1TXOoxC4PM2zxgkzwXaAVj3+WISvmRA8dBsR+T2LjYy3ud?=
 =?us-ascii?Q?3DId60pXrRehB4IKBXmlb96Erpq00xpKUKp5V4AmkAX+f636fTLkBtGThPVs?=
 =?us-ascii?Q?WCOke0HXQgJCMfsUgdGPEWudywdVjR3VpViF5V1XAqme0+k0r4I53D3f7Dir?=
 =?us-ascii?Q?X+lmL2Jjfok6jgzw3i3mUBwibt+OdKmTr/pwOR853E81GkQBfUDs7eBccOZu?=
 =?us-ascii?Q?1JYMuGjGm5XCi+zsRTi3tl71whOT9zSEiGREA2Ruqe+cYatpyr+dTYMt4DX+?=
 =?us-ascii?Q?x4Hb6ArfyXMsJm1Zk08+Yfe3//UwebiUmGBC4OmceEe5c8/UGFF32AmmZltY?=
 =?us-ascii?Q?pTFsvYysxzxgJjMRjxQ2u0zHtV4lzEYQ1VPu6YAHqb10eB4NqpFflpKRq44e?=
 =?us-ascii?Q?AV1n33TfrZEc8wKncm2MoHAiPU5+ZNsPQ5S8eerPaQfig+tXGZZuxzR33aPh?=
 =?us-ascii?Q?ExJcLuWAZyeVQEoBUmqJ7C+dKZAKuClQkTY4Qr5dQDZE6hm2PalUP9qBVfbg?=
 =?us-ascii?Q?5MIWVHkL1EJ/pPC+cynws4yJItGlA1pjpU+mabW7QKYVrIyOyfh1FxSACGyJ?=
 =?us-ascii?Q?FGWE7AVs61J+OM0XEjf86Z5V7eHKpZ5DcJS8/gCVo6xkADH6QZwfqukNqFvX?=
 =?us-ascii?Q?yIvGIyklEfU0nRlYU+tf93MNghYZftycg23t/6pM5nEqsQXG0JE6PtWB8k6D?=
 =?us-ascii?Q?F4Gyf+JCUBW3+LovaSNc/8DcHfzGHdqhR+JYAdx3AR+VTfcVUVGuihRpuMYv?=
 =?us-ascii?Q?HORmpRAzHh3opjtyQoS9piStxNAP1TPm2QshGV2zb3AQR8dDgJaPyVoeRPVu?=
 =?us-ascii?Q?s2Nz1s5kfjK2+nreI+Pw0NFPy344mqsnLKtNKzEfgOcWjL53nKSvhC1UAV1m?=
 =?us-ascii?Q?ylnIZ3ccqEbPdJYHWSikIF6hQdCYVwZOZxB5xrHrH2MW4KYG+1FFZ0QUBEfV?=
 =?us-ascii?Q?MmQpoC1QYZMnNrKEFGu8229uIq5THjzLKgwTATw/O34WjwMWYspmoD3ywKn1?=
 =?us-ascii?Q?RXnQYEuA8myvv/bBKqrNCmGy12VB2PuypHyCasD/eRk8sJIlpextbt5iixOn?=
 =?us-ascii?Q?KAd6uSxqxCpL0EyWUdbSO4ZWj7Cufudmi9UyjT4QFVyDEoT7AWO/ysf0rogo?=
 =?us-ascii?Q?gyRjz1BJI9H3++hse0Zlvni+QVRBku9ZWszP6pHNQiCqI8h/joZFOnsK3DTI?=
 =?us-ascii?Q?+3zFd4VM6OJmyvlBXgZsPCuvCiDkQ8ADRu3f1JKAvfC0WGAt3daZ3PNUpk7p?=
 =?us-ascii?Q?FfnpefhebwZ4oH0aHS7flI0iB44BAaJhzgV9DU7pmoOu6tckKg3vod3e3fZN?=
 =?us-ascii?Q?FoXU8Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 07:00:48.2551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6595683-01f0-4fff-d043-08de5f0421cd
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6459
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_230057_505596_4D6BC833 
X-CRM114-Status: GOOD (  10.23  )
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

There are two reset conctrollers on Cix Sky1 Soc. One is located in S0
domain, and the other is located in S0 and S5 domain.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 64b76905cbff..a72448cc97e3 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -348,6 +348,17 @@ i3c1: i3c@4100000 {
 			status = "disabled";
 		};
 
+		syscon: syscon@4160000 {
+			compatible = "cix,sky1-system-controller", "syscon",
+				     "simple-mfd";
+			reg = <0x0 0x4160000 0x0 0x100>;
+
+			src_fch: reset-controller {
+				compatible = "cix,sky1-rst-fch";
+				#reset-cells = <1>;
+			};
+		};
+
 		iomuxc: pinctrl@4170000 {
 			compatible = "cix,sky1-pinctrl";
 			reg = <0x0 0x04170000 0x0 0x1000>;
@@ -568,6 +579,17 @@ ppi_partition1: interrupt-partition-1 {
 			};
 		};
 
+		s5_syscon: s5-syscon@16000000 {
+			compatible = "cix,sky1-s5-system-controller", "syscon",
+				     "simple-mfd";
+			reg = <0x0 0x16000000 0x0 0x1000>;
+
+			src: reset-controller {
+				compatible = "cix,sky1-rst";
+				#reset-cells = <1>;
+			};
+		};
+
 		iomuxc_s5: pinctrl@16007000 {
 			compatible = "cix,sky1-pinctrl-s5";
 			reg = <0x0 0x16007000 0x0 0x1000>;
-- 
2.49.0


