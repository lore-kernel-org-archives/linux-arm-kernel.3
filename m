Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE50EC1EB0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 13:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldSIFuXOrFdeUDmcGorastpf/YTfYo/x2FM5gEUpDpc=; b=MIcsR1XkDI8qhU/FMzd79FgqnD
	JkOHhQ2zczRULh7EMrT+VMUBuO+oT0lwQl5gAVZYsTM78MiySlXPDBPcpa0NR9ijiUDeKXmqdwdrI
	6MBbe5gjmmopc8THDNBXoEn4p8qbTfzpHemjERc1i2cE25SJumsHTJdc0SkWdWQzHDjPfvnK7fSZS
	uUipxCkbMvmec1kgV1uA5HaKOGWhk/4sFg5VbKYew291i2wgMUI8pnReP2YF4+Xctq/NJUI6b5urw
	z7O3SGtSDRARd1rCr7q3V66vi96/Q3rlUBji5Yru62eOSnxU6l1cQRI+wFKCvbku4N5iBWXUIkLjd
	A6MRMteA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnz4x-00000009vf0-0nNq;
	Thu, 05 Feb 2026 13:07:27 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnz4u-00000009ve3-1OSl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 13:07:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRuJoLRlxu1GPxIj128mNkeAjnhauHNnHXXOfUYHPCLGbz1Eb0e+iRas1fI26u/I+k50eYeI1WPbbpIWP2fVuWwdmXv3KrCLHIZ/WvLaVml1nL1346DQ9cBY/1DLe+X7E7qzYHx6R2MiosTwK/c0DmSrNdUfwyNKeyIVgiGMhX/qt9Vse2rKJ3IVdNehhbwQZlxLYpinGoOz6XJCqd2qtma4MTkqSYP+jJuhHMurykcSQbKvI7C2pwxAuO+1Gq2fSbq81pNwejEhmhldrkJRDfX2Vczi7WGqhyuWnC+Q2K5yL0j31yV7xLOBZPmawhZ2nqr/OKx8WKcX4AY+BLZjxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldSIFuXOrFdeUDmcGorastpf/YTfYo/x2FM5gEUpDpc=;
 b=tOkNL7fiXsQotNZ+IL2l8cu9Ao/+gTIy8yOXBOENfEpJRNG0my6rU3RLzNi80B2FgMjK7ZnBQ+oKWlyGjA+txdZxiMMm3hk6gU+9Ggqp6hqTMlbNH6vc7sieUt46SzQLKLDTKoJzaR4Q/qw7kYCr0xh8qJlMhbPWI7j+D1AmHV8MnDTsHI+zSh9c304Bv0phDeuXfGyGxUwOzrMWoboKuVSPn/CprxCfRcVXOI7+nsEZfC4l1fDpUqnWbdH/sshWKe4z0psHIhi+K7xjfnkR62fDQSBoHRJCMlTVoz5E6DgZjJbt3CqZVTqHg5v/SyojVeTraoTeGqqOudW9ClPiqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldSIFuXOrFdeUDmcGorastpf/YTfYo/x2FM5gEUpDpc=;
 b=awUV2IcUFIsmXc/WI8FfAspI5Vj+vZhzw6XxS+LJclY/xo3IOuBSDHZ5gHKIBdzr8Dd4Cq/l56ZbJ6+DmqHy7R4jdxFJgjZlIddrRLA9BM3awlTAj/WTqn65iZ5rOWmIpH8gCTrG4anPTqfN4YuDYyPg+8RPV9LHiPNz7M6SSxg=
Received: from SJ0PR13CA0112.namprd13.prod.outlook.com (2603:10b6:a03:2c5::27)
 by DM3PPFDEB3189E6.namprd10.prod.outlook.com (2603:10b6:f:fc00::c4f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Thu, 5 Feb
 2026 13:07:18 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::d7) by SJ0PR13CA0112.outlook.office365.com
 (2603:10b6:a03:2c5::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 13:07:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 13:07:16 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 07:07:16 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 07:07:15 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 07:07:15 -0600
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [172.24.235.46])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 615D77C43027516;
	Thu, 5 Feb 2026 07:07:12 -0600
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <gehariprasath@ti.com>,
	<y-abhilashchandra@ti.com>, <m-shah@ti.com>
Subject: [PATCH v2 2/2] arm64: dts: ti: Add audio overlay for k3-j721s2-evm
Date: Thu, 5 Feb 2026 18:37:07 +0530
Message-ID: <20260205130707.2033197-2-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260205130707.2033197-1-m-shah@ti.com>
References: <20260205130707.2033197-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|DM3PPFDEB3189E6:EE_
X-MS-Office365-Filtering-Correlation-Id: 316e1d18-8560-4ba3-67dc-08de64b77cb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F1GWFwC01xValb3Pp8tZ8Y9G2aory1LbjNdT2yC1g1nMpD9OikkGDewY+T2Y?=
 =?us-ascii?Q?V9lzxdGQD8QXLndLfMH/dMgaieLiCtuz04pD6hy3pD+sBRWHWTRl9mEv9nLb?=
 =?us-ascii?Q?pgITlPJ5CGcjsSoQbTpPg7hW5SrqAUSyJSFQ0KzVvGsy4X6GM9sEVKWtOWYy?=
 =?us-ascii?Q?+E/hoobgLoAJnW3qr9sy1QFWLbKfLaKFXMGP0R21mBYwEXu0JFWHSyGchkbQ?=
 =?us-ascii?Q?slafAR0mIS4CCmHa8paDfpBKzPJ5EcqB3v3OFxk3n1uUUWWFnYIfLtN/C1P4?=
 =?us-ascii?Q?/NSuBjQv1f+mAQPxqsfkt9cSLme7/G2RGi6PeBmJ6W8DSvOzl9aFOiddupWd?=
 =?us-ascii?Q?KYQLrZ7zg9PDM5uEaF+p9dFfi3COV6+njVyO3N5eyf26y03A+1iDMonEZyEN?=
 =?us-ascii?Q?hkwebq3E4UoOdI5dAUWSrGGa2Oh/ws/NZtGm6Itt0rYOZxb11A7AZzGcnTur?=
 =?us-ascii?Q?PE7aJWTBSEm07u1xtbTGZMAv/38eywcgy1L7iruPkT+Q8SryBybXxoikwpWD?=
 =?us-ascii?Q?hJtTMnxuFJE1EXCCsl9LKwxP4rJ4K7BNejsV4+U3v2oepNhyAtgvknctOHga?=
 =?us-ascii?Q?5ZW3X9hchoPEmNDg3M87HgQ+/hFkZC0FcS7NvKkrPrWpjRHimk8m+Q/QKB/6?=
 =?us-ascii?Q?OGN0vwG/w1Al59eF1Cmet4Ng3LQH5HqHWIfKZ2N79X7JiS3H0Mj6hasQrlhG?=
 =?us-ascii?Q?ZmhTQZGUj8hY6CBY+IpvDTCM+RQOA8I0K58Z0dlcH1lP09vzn8dJfxrHFyIS?=
 =?us-ascii?Q?A+GLux5teNcCp65JaU3vpUxZfnbothmt84croag2zBRm8agPjPzTFq5oqUl7?=
 =?us-ascii?Q?fYfJVu6ropPZhUSSVEbjN7d85TVz+DpOp4CXiCFiASYbTYn0Nk+nNEMdx2EC?=
 =?us-ascii?Q?BaZRTtML96AA2kDLWz3lFcdkKCtMmxYfCOVYffdX9v1Uv7gIxWVNK/u2l5o0?=
 =?us-ascii?Q?dbtvkXCMcF4W4h+9fDnem//mZRxnksE9zOht0ROgHpXc7vv/s7a3ZRs9ei/4?=
 =?us-ascii?Q?UqAZhYfrn36wsbDuCWxRnJkRYzJ4+F1HE//DsrBUrQZ9e6RV7o8/ljgonUBY?=
 =?us-ascii?Q?Z4wWPLmpTHl3ea/6PzVtKnBCPaonZ+B3DhfouEErHtTqn8TaQRxh79JCdlPQ?=
 =?us-ascii?Q?OB52wuuhlZrM2rx7fkGokWFz++DIGbCFOeTIGcwbJOeyFEsLx1wWWzw7AgA2?=
 =?us-ascii?Q?4J+riFbM5NqeQwo/Da4Z/K/68X8NxtmlWS7B2f6mojjCdCSESPwXJ0B1m9lD?=
 =?us-ascii?Q?CaIloJQb94+YqxqgI5UbaZjlkN66Tb4uUjNdivv2GZXLQPbdN2lskmN7BBCq?=
 =?us-ascii?Q?B907XsVSVeq1fVRTFJgrg+knaLKAutteHp7ED59YJ9P6xINYq75l23LegqyG?=
 =?us-ascii?Q?IlxmfQeAgr0VoWNMI/JRBrAs3aetlO/GvFGKseRuoRIZBPkmWcUWlwfkOChk?=
 =?us-ascii?Q?YYIMHEzgvLZN05wUyrXmcIgco7LzwCUkIOXqi0ctIIx/cvOOLW5Q8XM2NBTL?=
 =?us-ascii?Q?i7G2iPA4t7zR7lrkSZ8RlcCh7Xe5YZUj1uDQCtr11jNvYwMEfgch1ln6YqPx?=
 =?us-ascii?Q?KMlBFAbeBdichaD/51cqFX/aBn8wPSOLi7UjGj1ESGPN4cSCBvs2NI2iZduI?=
 =?us-ascii?Q?Bg=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xP6os/w2Uh0clhL3qu8Db0wk1h6TUkiyVQxxlc9eGqxxkhc92PG2AktTv9j6cR6BV7SD4nRZo+5ZwyCBl/MkZMdIh+ZdLwJyAmXidj7nT97gcKr6jaHRQvWOBUfa1aFimBTi+RYa6rBoJWZ2u8HYB19jjUcJQ9WTDcnI7BnTnA8Wig3jl8ErbqRRidvjlx1P2BDqRt0n4HLG2z/6JIth7UNh29Izy+ul5ISHOlH8oFoaPzJU6zWOqLI2DxBlFbMEFsNDVDtSWm4cDVJ4qo65nfby701jgAhmNFqmbDWWohT/GeqiEzBRJdeg6jncCtqawdw3LF5lDSDZ2fxfm9pWMsV/7zPc0o0eR7wQn3bu2m3a8sfEC6tOmN1mxtjQybj9IqNEihEVZvY08Vxc1kdRlSo1L8pIE+1bKe3wRUxHYps2/wFbe4QEGuWLMWP+xvYa
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 13:07:16.6126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 316e1d18-8560-4ba3-67dc-08de64b77cb7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFDEB3189E6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_050724_441119_902D55C0 
X-CRM114-Status: GOOD (  14.99  )
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

From: Jayesh Choudhary <j-choudhary@ti.com>

Add device tree overlay to enable analog audio support on J721S2-EVM
using PCM3168A codec connected to McASP4 serializers.

- Add nodes for sound-card, audio codec, I2C3 and McASP4
- Add pinmux for I2C3, McASP4, AUDIO_EXT_REFCLK1 and WKUP_GPIO_0
- Add GPIO expander (TCA6408) for codec control
- Add GPIO hogs to route I2C3 lines and McASP serializers
- Set idle-state to 0 in mux0 and mux1 for McASP signal routing

Reviewed-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Co-developed-by: Moteen Shah <m-shah@ti.com>
Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../boot/dts/ti/k3-j721s2-evm-audio.dtso      | 161 ++++++++++++++++++
 2 files changed, 165 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index ba01a929e06f..aadf783fe252 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -140,6 +140,7 @@ k3-j721s2-evm-dtbs := k3-j721s2-common-proc-board.dtb k3-j721s2-evm-gesi-exp-boa
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-usb0-type-a.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-audio.dtbo
 
 # Boards with J722s SoC
 k3-am67a-kontron-sa67-dtbs := k3-am67a-kontron-sa67-base.dtb \
@@ -268,6 +269,8 @@ k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-pcie1-ep.dtbo
 k3-j721s2-evm-usb0-type-a-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-usb0-type-a.dtbo
+k3-j721s2-evm-audio-dtbs := k3-j721s2-common-proc-board.dtb \
+	k3-j721s2-evm-audio.dtbo
 k3-j722s-evm-csi2-quad-rpi-cam-imx219-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 k3-j722s-evm-csi2-quad-tevi-ov5640-dtbs := k3-j722s-evm.dtb \
@@ -330,6 +333,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j721s2-evm-usb0-type-a.dtb \
+	k3-j721s2-evm-audio.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso b/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso
new file mode 100644
index 000000000000..e00d9b6cef5b
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Device Tree Overlay for J721S2 Audio Support
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "k3-pinctrl.h"
+
+&{/} {
+	codec_audio: sound {
+		compatible = "ti,j7200-cpb-audio";
+		model = "j721e-cpb";
+
+		ti,cpb-mcasp = <&mcasp4>;
+		ti,cpb-codec = <&pcm3168a_1>;
+
+		clocks = <&k3_clks 213 0>, <&k3_clks 213 1>,
+			 <&k3_clks 157 299>, <&k3_clks 157 328>;
+		clock-names = "cpb-mcasp-auxclk", "cpb-mcasp-auxclk-48000",
+			      "cpb-codec-scki", "cpb-codec-scki-48000";
+	};
+
+	i2c_mux: mux-controller-2 {
+		compatible = "gpio-mux";
+		#mux-state-cells = <1>;
+		mux-gpios = <&wkup_gpio0 54 GPIO_ACTIVE_HIGH>;
+		idle-state = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&main_i2c3_mux_pins_default>;
+	};
+};
+
+&main_pmx0 {
+	mcasp4_pins_default: mcasp4-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x0c8, PIN_OUTPUT_PULLDOWN, 1) /* (AD28) MCASP4_ACLKX */
+			J721S2_IOPAD(0x06c, PIN_OUTPUT_PULLDOWN, 1) /* (V26) MCASP4_AFSX */
+			J721S2_IOPAD(0x068, PIN_INPUT_PULLDOWN, 1) /* (U28) MCASP4_AXR1 */
+			J721S2_IOPAD(0x0c4, PIN_OUTPUT_PULLDOWN, 1) /* (AB26) MCASP4_AXR2 */
+			J721S2_IOPAD(0x070, PIN_OUTPUT_PULLDOWN, 1) /* (R27) MCASP4_AXR3 */
+		>;
+	};
+
+	audio_ext_refclk1_pins_default: audio-ext-refclk1-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x078, PIN_OUTPUT, 1) /* (Y25) MCAN2_RX.AUDIO_EXT_REFCLK1 */
+		>;
+	};
+};
+
+&wkup_pmx2 {
+	main_i2c3_mux_pins_default: main-i2c3-mux-default-pins {
+		pinctrl-single,pins = <
+			J721S2_WKUP_IOPAD(0x038, PIN_OUTPUT, 7) /* (B27) WKUP_GPIO0_54 */
+		>;
+	};
+};
+
+&exp2 {
+	p09-hog {
+		/* P09 - MCASP/TRACE_MUX_S0 */
+		gpio-hog;
+		gpios = <9 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "MCASP/TRACE_MUX_S0";
+	};
+
+	p10-hog {
+		/* P10 - MCASP/TRACE_MUX_S1 */
+		gpio-hog;
+		gpios = <10 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "MCASP/TRACE_MUX_S1";
+	};
+};
+
+&mux0 {
+	idle-state = <0>;
+};
+
+&mux1 {
+	idle-state = <0>;
+};
+
+&scm_conf {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	audio_refclk1: clock-controller@42e4 {
+		compatible = "ti,am62-audio-refclk";
+		reg = <0x42e4 0x4>;
+		clocks = <&k3_clks 157 299>;
+		assigned-clocks = <&k3_clks 157 299>;
+		assigned-clock-parents = <&k3_clks 157 328>;
+		#clock-cells = <0>;
+	};
+};
+
+&k3_clks {
+	/* Configure AUDIO_EXT_REFCLK1 pin as output */
+	pinctrl-names = "default";
+	pinctrl-0 = <&audio_ext_refclk1_pins_default>;
+};
+
+&main_i2c3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c3_pins_default>;
+	clock-frequency = <400000>;
+	mux-states = <&i2c_mux 1>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	exp3: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "CODEC_RSTZ", "CODEC_SPARE1",
+				  "UB926_RESETN", "UB926_LOCK",
+				  "UBS926_PWR_SW_CNTRL", "UB926_TUNER_RESET",
+				  "UB926_GPIO_SPARE";
+	};
+
+	pcm3168a_1: audio-codec@44 {
+		compatible = "ti,pcm3168a";
+		reg = <0x44>;
+		#sound-dai-cells = <1>;
+		reset-gpios = <&exp3 0 GPIO_ACTIVE_LOW>;
+		clocks = <&audio_refclk1>;
+		clock-names = "scki";
+		VDD1-supply = <&vsys_3v3>;
+		VDD2-supply = <&vsys_3v3>;
+		VCCAD1-supply = <&vsys_5v0>;
+		VCCAD2-supply = <&vsys_5v0>;
+		VCCDA1-supply = <&vsys_5v0>;
+		VCCDA2-supply = <&vsys_5v0>;
+	};
+};
+
+&mcasp4 {
+	status = "okay";
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcasp4_pins_default>;
+	op-mode = <0>;          /* MCASP_IIS_MODE */
+	tdm-slots = <2>;
+	auxclk-fs-ratio = <256>;
+	serial-dir = <	/* 0: INACTIVE, 1: TX, 2: RX */
+		0 2 1 1
+		0 0 0 0
+		0 0 0 0
+		0 0 0 0
+	>;
+};
-- 
2.34.1


