Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791EFE63C8B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVWLOL8rab7ljNoqUiHOjlrclLljWkUPBHoZcu5S37A=; b=q2CPvCFWo5QGD0csdhhTmcBGds
	B+5iZTpL2d9Ei9QJkmNpZyXH6y6KjKdbsZzjlz55tFjzSIXEDW4vB/kIW6COuYHujKiX9jIDXt/7J
	IrHTZyzwi6gtha3cf46AT5CtU6R6Nd6vC83QeBjuqOif9GIsExyC5cEdrILZo3bW0wJotdUBxCwiL
	Pv84o+yhxznfLSMPw/jaqyKVuTj98jbglyxkd3JgbEXXPPWoDN7yzYnHFHD0ZNUGPrfHs9FpkuPt+
	jAvPK9vs6W+6UelUa/v8zYq+TgqSyLLKGRN9U+Y2agTSLF5bogccMYy8YZ/VL9LZqvTyVMKDE2RNg
	Sotm7fXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTZG-000000005sY-3fxw;
	Mon, 23 Feb 2026 10:53:34 +0000
Received: from mail-westus3azon11012069.outbound.protection.outlook.com ([40.107.209.69] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTZD-000000005rN-2zcR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:53:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umloF5MzcYvfNQEbN0XuAs7M94lRhHO+llNsMGEVW+VXtmyMnt3yae82v1Oeoy+6N9fMhWeQFppPjwttcGxUBRrCUG9Mcj13Q9/qE/rrCOLSQhcCxJomN0z9gyo/Xt28hUvUqTqxuhr2+eZ+sS/exQ39eVcb/HFhG6o3WJFVryHGWQsHfTS62Lx+arjbYfxUb5yVgYjQ9LQ2zJgFEd4/+xlcjY9kqA+a+Ab0Qf8v9j6nLvZ6Y5WwWYoISf7dkS1NZCFGYfcQliKnf2+8cMHQChP4tm37yoTMJeshGK9bRPINC20KmWKDTUUXc54z937qFkz5z5f9dUO7MfURDxbynw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVWLOL8rab7ljNoqUiHOjlrclLljWkUPBHoZcu5S37A=;
 b=Ky4Wd93NYZkzu8BRfZZRjwFHt1l/70l9e9D0cuB9nygEXZ4FpDuui2BGiKYBg1OBEZGPxBRVbUUxG6BaYf5oTRmTFkBYICwv/jfXy2wK8R1vux0Jk1bG5Xh+yPZZ1mbxqPcx3lpVNAj4t2O0XE4pDSLdooYp2oVAnzfj6x+SDyrlitMozou3B52pYG4FRt9I4qk56LXeq6fvS7aZovtOsvFeK1vfSWzBngTAnDpZdtpuL8+l23S7/dlXxfZ6yfFtt1htKLqQEh/LOcGtZAKn0ylM2+/kTbiyK9yIxKg9dRrJwyDMnQNDessFu1siAm+xvQKJqK8tuR2H7JNiqz/Dlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVWLOL8rab7ljNoqUiHOjlrclLljWkUPBHoZcu5S37A=;
 b=r9qxSiARWe0ZFMjhnvbKhpcSemgmTCDEQ4HW7V31EDP1TtROIc0m6jXzAgu+PwOzQtPJEV/z+BPj3Hrkl54DnQQKZA6z/bJxfbO8FpJMclC8HNLvbooDNylnjGIJ2puMsq+6ri8V03WaH2kstGPG6Utc9tZlIlETTvviAWkQnxQ=
Received: from CY8PR11CA0015.namprd11.prod.outlook.com (2603:10b6:930:48::21)
 by IA4PR10MB8610.namprd10.prod.outlook.com (2603:10b6:208:55f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Mon, 23 Feb
 2026 10:53:27 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:930:48:cafe::e5) by CY8PR11CA0015.outlook.office365.com
 (2603:10b6:930:48::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Mon,
 23 Feb 2026 10:53:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 10:53:26 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 04:53:25 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 04:53:25 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 04:53:25 -0600
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NArIFE179443;
	Mon, 23 Feb 2026 04:53:22 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH 1/4] arm64: dts: ti: k3-am642-{evm,sk}: add ti,min-output-impedance
Date: Mon, 23 Feb 2026 16:24:12 +0530
Message-ID: <20260223105448.1110428-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260223105448.1110428-1-s-vadapalli@ti.com>
References: <20260223105448.1110428-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|IA4PR10MB8610:EE_
X-MS-Office365-Filtering-Correlation-Id: 58805649-6958-42b6-ee82-08de72c9c5b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0UwTdhe0Gc8vithtxyo6mbs+df+HdjuYSuLgXasXoXXeURIkDX64XhdDWVca?=
 =?us-ascii?Q?ajZmVpbvrMzBX1EiYzn8yX2159eFw0EPlxf8X7AgeYTGRCYPJ4QWnrfiA1R6?=
 =?us-ascii?Q?070bMRhyyZ3n+KD6mv8BSkAl20Q/A6TPpIn9zmDqYHBcIf7axK7LcRy4TZ+U?=
 =?us-ascii?Q?EsiIkV+EtIQbMVcm+L9yw4DzbPche11pg7K4SEjNAqUL9A0brgD0h3EtW8CR?=
 =?us-ascii?Q?rq8ba/9WLbae57tCgqMpFw98UpRN3D8LRPVW3KDX2KwAlJeJX312MV6GmQvY?=
 =?us-ascii?Q?pBSlbfCGz9jmz8itRPq+xJdEfwXo5j4JqIV6272CuKVJ1ygbbPSKiEr5G3Q0?=
 =?us-ascii?Q?W1D8WkUAOqEMQW4IgMcEUK7J1hky+wibpuk+kjOcpZ4Si/qACozBCJ6gQaGC?=
 =?us-ascii?Q?zbesIeM2MMahY+6E7P2oP1yOkUIsnbhsc666++8p9eKXbPadWsgZ6gk4sS1U?=
 =?us-ascii?Q?QMYBSs8kiRAvxskM1pzh/8GLE+fs4BkilllpNd1A3c/EIz+JIJOuLZViIPmg?=
 =?us-ascii?Q?oi5Bv9BlEEKeYh0v2PzqNMLvWxsFihwJlm+biIgW2hpKO46wn/GN8JoWDK9O?=
 =?us-ascii?Q?BmHQq68m1blP2oROkQhCyiKhMIJeucr4cs8XxPQ8v4UzhcbZhGR2R70mxL6W?=
 =?us-ascii?Q?CPab9v3NenW6KfxzRm7L2PmXYyPA8EQbH1f8neG4x14VKgI1JzX3VBkssa18?=
 =?us-ascii?Q?j96UscPTkHd4UCQ2jEiLtR6tp7PHjBo/3MOCJTPl+/PqsqdKZP0pAU4Fhqrw?=
 =?us-ascii?Q?zkNg3Nsl1rSxAv7T8rsdTGDe2s3yeoRykoMQ9bEK++ZieUWC4c8EqkZhoEDB?=
 =?us-ascii?Q?lghO6+g2sc3nnXQcVVzrEhU9v1X97J9x3DfopVgauzGddYj3xM+nRS5CLie4?=
 =?us-ascii?Q?eLYA96kD/sPpcWH96TTGhtDBmwMPO9be3K2U69HY1ImWed2SDdM7Ru8UW+hP?=
 =?us-ascii?Q?CDmX4FuQ1IVX2cZj9MNFN2KNCurmaJpELejM8N4E/mTM1pp0Wy3C6HTPML3I?=
 =?us-ascii?Q?WiDwpE1sIEQILH5zj9d6RRlpU53Yi5bi8Vf950xnwCucVT6cwjYVjHUmiMyj?=
 =?us-ascii?Q?XTh0fNTzq31EjC46CNPfsIq+s2PVkWlcB6PCcr0zHLv865il7tGLzxOvUkCx?=
 =?us-ascii?Q?CAuJ0JXTOzrSNqGipmuy6DR4DjYYQrkJfZLcZ+XA4TXVfnXfF70s82vFs7+k?=
 =?us-ascii?Q?ZUFgRR9GWVuWcGFrvgs5QkGh4eQIG4hO2TA9YVDkhfbFPXJuHXCTRdzVBDkv?=
 =?us-ascii?Q?A5RpJ5DuOKPnMj/MF69KJEw8BCTK4Sx5/QCz3fwqsRf5/lKqgrLXz6OaYhm2?=
 =?us-ascii?Q?sF+ufAgJ9eUFuumjC2YMtfSqwQ0UT0uM6QSXCGeActLiTzEgk/MuuDqZ9L4M?=
 =?us-ascii?Q?6fLnE7L15sbiTltjh2Eflq4Av+u1CzHSXFdB3V5HX4EalA4R9sB827hx5LO0?=
 =?us-ascii?Q?dsVBGgVOyhc23ldaZ3lJw8PPO2Hjwt9XmtI2ulgzGSgQyT9VtNNKwstKglnM?=
 =?us-ascii?Q?Bf2LgruH/ngIXoiVpUhGYFSQ4lpS5aBAkTOz6d2P6V/9wvmaYq97sEidVo0b?=
 =?us-ascii?Q?z9vW9aa1mMkC7JqX/qrKQui9rN72CzXtyCLELXicQ+ar5e7/b0Omggp9i6WW?=
 =?us-ascii?Q?5+t+pAwc6dqYvR2PyLDnTAoRzvKU6juN6YV3hYA0fm9kMHnSFJ/JcFb9AEPL?=
 =?us-ascii?Q?jC1Big=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bEs/tpPIymAlfrpOG8B4iNdY5gZB2IHEt0JGDG/HxwsbHjmPzq5sZKFNcUUnqqyP5Dh3r/tvuYyXK4IN3P69eeTQst+qyPEV0LO5zPo5resw94/UENuS+oIGo6tNdKrCjZe7adRmdgvqfGdmB5nW71Yi+123nX+gm9oSqKHTQ2egp1/unfiUvK5FsSMHctaIxNhaCOXlEV2U4XUJ8s6hRNLSvaK4Ila/nEWyJYzLjOsJ+lu2txQvCpxFqMxaycKBTeDsmOmP9rbQkit5Nyqcy0lB+UijcD45Id1hpG8HqFUE8LMiAMpOvL6u5Y+IZ61na6TZFfR/xbPOqiOu2klIlx7tsa2hx6MxZ14cF2jcCf60e7JRv17v6r4OOOFUCTGrhYDwwgYaoIumEVTyAE+bhFxNeLPi5DF0i4Jua53Yj95slKd/BwsZRznlPEq1DebF
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 10:53:26.3053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58805649-6958-42b6-ee82-08de72c9c5b0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8610
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_025331_754856_5A960D72 
X-CRM114-Status: UNSURE (   9.11  )
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

The default impedance for the MAC I/O lines from the DP83867 Ethernet PHY
is 50 Ohm. Based on the board PCB traces, this impedance is relatively
higher than expected, resulting in CRC errors for packets being transmitted
and received. Hence, add the "ti,min-output-impedance" device-tree property
to set the impedance to its lowest possible value of 35 Ohm as described in
the DP83867 Datasheet [0].

[0]: https://www.ti.com/lit/ds/symlink/dp83867e.pdf

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am642-evm.dts | 1 +
 arch/arm64/boot/dts/ti/k3-am642-sk.dts  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
index 88093ab74502..bc4347cf7114 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
@@ -601,6 +601,7 @@ cpsw3g_phy0: ethernet-phy@0 {
 		reg = <0>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,min-output-impedance;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
index 34bfa99bd4b8..d28a38c87f32 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
@@ -519,12 +519,14 @@ cpsw3g_phy0: ethernet-phy@0 {
 		reg = <0>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,min-output-impedance;
 	};
 
 	cpsw3g_phy1: ethernet-phy@1 {
 		reg = <1>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,min-output-impedance;
 	};
 };
 
-- 
2.51.1


