Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21963CF31B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 12:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UR8v1jcGZFA9MrikWEQkAjwveVpto1sFsQoFQcTPFZA=; b=0xiLxbfYe3fs8sOd1TYide/kuQ
	J/KIhalhhy8Zo8+7GfMHNjozeX0iWM22/wmX/y7r2CoDu9AQchaapN5bOfTTkLhJyH5u1eHoj1qfi
	nq/X6NxGOy6v3J6NG6rNXOVmSZRIkWQRyJzvmtqMpbB4uXVFXoVpLFGBJnL+6NmbSBoHlclWPFRlT
	clJE89kXFSJ/+8/vnBSueurAbD/PN9cQIe8iD0uWDa0YWp1LfNeuEk9NflH5dT8TPZHlEoMxk2soH
	ZcbdnzsBT9vh4LO9jv/yoBEuVv27vgiP2HYCCGf4qx+Rxb36OVBTVNzE86y8YxW21vfvCn7rxVRPV
	OECET7Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhMW-00000003Amz-36uB;
	Wed, 19 Nov 2025 12:32:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhMW-00000003Amc-02Kz
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Nov 2025 12:32:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=UR8v1jcGZFA9MrikWEQkAjwveVpto1sFsQoFQcTPFZA=; b=h9jL2OpqFJ69txmibeB0zBXlhR
	iJJ3Kt5GIH6gILizhjNryytpmOHkDpaFzEg3vLiKBwo7XsFVWkNxlLu23tGckgzws8Yp9+KHF64uF
	0bsoPLtzhpqyt5KF4oJ7u18ZvhM5ElFePnIUzlk66t0+1UMtyqPULGmstAHbBZ8Xn6E0mk4FrIsZ8
	jdFwfwgNG494GknljEviorxt3fN9upkawqAQAL5F/rfh9mk2ygyxsWLvPe5hzO8Z2ZpbvepCxZ0+X
	DNAlBnZPfxHg7TJavLPQPVtsm2DZOcpePHZvqba5TmIflVkitQkQvnpoLOmjvw5Cnd28qlda9qeHx
	IBaY6Qvw==;
Received: from mail-westeuropeazon11020097.outbound.protection.outlook.com ([52.101.69.97] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgUp-0000000C47e-1aPd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 11:37:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cEEWkH0UcbS+sPHD/O8c/Na6zeoza2UAg1FyiVlGniFtLauoMBKfmB0RuY4/hMu17qoU/CZvm/yzl6OLxleuQHioYjsQ3mNQqfCPbjQj3Vmuv3Rj65gmpv3t+zaMcUwd3GFvotG+7z6VlZViU4D+X57Zs28XPAt2vXDdVL3wvN/mfTUFTCGSeOaVux7LQ+u9UoFaWpbjSqY/1TLXTQPjqulxWdQHpSCB6UnJ0luGcxnmYwpPvJ1CmEr3ynPDkZH78dn2cioTe6sd3eniyL3gmoUQHXSiOo8ci2VCzo92edMtKqlC3/3Z1M16/gFgxhmrUm5/E9i1dsAO+7l4xkuysg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UR8v1jcGZFA9MrikWEQkAjwveVpto1sFsQoFQcTPFZA=;
 b=fUJ5Iq+6U5VAVuj6ksGCv4LWGPO25evQZNOJG+qnCEoDDtfvxACDmfFjp97QZQg6ujm+oLh4ww+etOjIwYsyGrfZnslOErSKY/9ZhQDIY1omRpMhFm+xQ5rx50922/pfVnIzSCgrrwJaaT0B54gqatTJPkhB0/C9Y0EeMH8HnJzOEK0UckGoBO/HRyAVuaFMA5whvj79dhPl9kbsdjSNqhTVIKdbVazzmAoHcxeLAoMqSPr+XNSvVHKz2s/fSAdZsKySRiqFdx2teBEZTkXMazAO6C0v42njr7jm+8v+lIhVSBpB0j1H2ZeRF6PIMeUTI9qPdC545wFKYgVHt4rziQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UR8v1jcGZFA9MrikWEQkAjwveVpto1sFsQoFQcTPFZA=;
 b=oszeFN+Z/JGh1QfTXs1zdZ2Hk7p9EWRAYaJYHSQAbdhHcU6uM7146YyRvI7FGWct45guAamm5pSmL94X/IVnaeYwNMzaSwik3B8f2KEcwNDXtWXAmslj5J1yUYyzePeWz+Se8nkeSJvDErkwPQtwOnAFjxokeTcsxmPRENnBQhlFX9cIyMM76gxbpVBHOKNCaQJtdz6reLU5doU3dou10vtvVpKKDC7HsOgqEUyc+QwkJYTtLjK2xhhwcrQwZbJBggmAIzlHicDzblDAx/Jt4MLt9Nx2XhN5KTuQC769UttuodtTrRUXizgaJxyc3r2pqzYV8y99i0MLN9qJfHQcew==
Received: from AM8P251CA0012.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::17)
 by PAXP195MB1248.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:1a1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 12:32:31 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:20b:21b:cafe::b6) by AM8P251CA0012.outlook.office365.com
 (2603:10a6:20b:21b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 12:32:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 12:32:30 +0000
Received: from ls-radium.phytec (172.25.39.17) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 19 Nov
 2025 13:32:27 +0100
From: Wadim Egorov <w.egorov@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH] arm64: dts: ti: Enable build testing of PHYTEC board overlays
Date: Wed, 19 Nov 2025 04:32:16 -0800
Message-ID: <20251119123216.1481420-1-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000044:EE_|PAXP195MB1248:EE_
X-MS-Office365-Filtering-Correlation-Id: 5855111e-8df0-4794-4352-08de2767b4ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VOUdHBvAHuuRTtH5RVr1xeVpdnsJN2OMcZUFVBNZuFQk++zIZuWt/CWPYWWv?=
 =?us-ascii?Q?6+zz3koCz5Xz70ea3oMAm8M1pJZOoCMHCOHnPx0VvqntGtRCA+O7aXiZJb/+?=
 =?us-ascii?Q?Jt+6GuLzMWc+RDPKvlcMnKzUuIuIk4vj+n/j6mzFJKFlXPwTNEzaF6V+gjZR?=
 =?us-ascii?Q?/uWoHHJhWw8tCr8yTCzFqsQfoaa0YM59IEj83MvZNNIAxN+9t4+Y6cyJiirU?=
 =?us-ascii?Q?6ZyFThr72/td55nag7hRc71a5J0hvO/6p2GzsiVp+Qt7re56a6Cvy4GJKxsc?=
 =?us-ascii?Q?U6871xE4ooBEGweXufEgPQnPvvjQs//8bDn44UyRz5jWfUSvB+vLB1dA/dn1?=
 =?us-ascii?Q?0n96ivZEBntSaTCeWwGIKHlRLC1sUisAgFywd94n7KFJsbpbQWdpBAuQJZt+?=
 =?us-ascii?Q?75Ukt7cEYBYObEUnKOuJjFuYLP55wtarFhkJ0lBZsOVTUV2bb7hW5j017Uny?=
 =?us-ascii?Q?wN6lZPW2FTRdrlbD1LoQV/lvkhMaYSltoYevVbsuQ6hbq+qLcR0Tl/LrIlA8?=
 =?us-ascii?Q?IuMTEtWvb0X3DxoFqCNqTkQiwWBRawIyYQQj7XOFqwN8yiLLTDHATzHuDBe/?=
 =?us-ascii?Q?6tAU1WU9LJBAsC8MF0eSfXYExmxtsYBFsh2tq6L3pi792fF+ZuJl79cn1nOs?=
 =?us-ascii?Q?GeFjTY5oe11GfNOLmcDG3bXvaqvx3BRoPHtIg2Vf53LfdUzbwbOEJHCydmY3?=
 =?us-ascii?Q?sHOnCfct/llpPlrdaVEe3pwfkN+9V88g3ej390JpGdqslFNUVf1X7nGrISQN?=
 =?us-ascii?Q?ZgQ9nneuRZM8lnXUOS4Jpl+3PI5HuSFh/JszdWLGcgc82mim77dEGDo7KK7b?=
 =?us-ascii?Q?qDUiiBEc7DxGNhk0DOK0te6/fi8/iBnIVDVV8IHWvtuIESF9CfuXuhwRW8zD?=
 =?us-ascii?Q?QuESWQWQnVTL+psKctb4Xq9ZXTMsVGSXplvdLSIcv5Ddfda7295pCZH57vel?=
 =?us-ascii?Q?jEv4DAJdp5Ruqz2LLkBLPvE2e2IWtkPZig7Ug8i6wYqr6dSs7LmZBhEm6+jV?=
 =?us-ascii?Q?FS343TSLFpYfvX7PnYAmjTBwZ7JF8xZI21W5VGkzHeihq0bnyMObcB5zNN0R?=
 =?us-ascii?Q?1HvpnNhqNSqkFYTl/JuwQ2Vikeim/MRZ1j5qIn0cYlFO8s7MoG4Aodn8DuPh?=
 =?us-ascii?Q?wINy399WNArI6pHPViPOt+Z6eIp9e2tQVkzFuFZe8zhD9SYexTrpFRF7sxNm?=
 =?us-ascii?Q?X3S+SXRVgAnPWUw9luqSwIXJLyHY4zRMIGuWY0Tl/vyxI5eJ58HQOKD1M//S?=
 =?us-ascii?Q?7nqX4UaqIYaFNEReP27caXesAMrP6Tgg+khlLetTj0R2sUOovs7FOgzNB/yj?=
 =?us-ascii?Q?I/Ox7J5GgaWSItYfcSHZtpeWMxk436+Dt5GgjgvYKYfkRbyJx56dIczjXS1H?=
 =?us-ascii?Q?/77q/2mhSDgOKbv2SGxmeyZkIUW4l4zKS/7w1Im1uY/xQcM6tstnLwhuzojW?=
 =?us-ascii?Q?Opdr7d/sEY5q5vBHemq1hAcNWlGQF4aGMak++wy8I1el8A4GaO+BBqYoeyry?=
 =?us-ascii?Q?zjbD7ZkMxZwBwHMxO+0JooHO8Ai68tbpzB9mcPd1F2AGhJWo8iCuQUL+SKNA?=
 =?us-ascii?Q?/2aSPuKawCQTI9LD+7s=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 12:32:30.3258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5855111e-8df0-4794-4352-08de2767b4ec
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP195MB1248
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_113711_599418_628E833D 
X-CRM114-Status: UNSURE (   8.17  )
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

Add missing PHYTEC overlay build targets so they are included in
CONFIG_OF_ALL_DTBS coverage. This ensures all PHYTEC board-overlay
combinations are apply-tested during build time testing.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 arch/arm64/boot/dts/ti/Makefile | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 743115b849a7a..0b14767e50d3b 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -177,6 +177,16 @@ k3-am625-sk-csi2-tevi-ov5640-dtbs := k3-am625-sk.dtb \
 	k3-am62x-sk-csi2-tevi-ov5640.dtbo
 k3-am625-sk-hdmi-audio-dtbs := k3-am625-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am62-lp-sk-hdmi-audio-dtbs := k3-am62-lp-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
+k3-am62a7-phyboard-lyra-disable-eth-phy-dtbs := k3-am62a7-phyboard-lyra-rdk.dtb \
+	k3-am6xx-phycore-disable-eth-phy.dtbo
+k3-am62a7-phyboard-lyra-disable-rtc-dtbs := k3-am62a7-phyboard-lyra-rdk.dtb \
+	k3-am6xx-phycore-disable-rtc.dtbo
+k3-am62a7-phyboard-lyra-disable-spi-nor-dtbs := k3-am62a7-phyboard-lyra-rdk.dtb \
+	k3-am6xx-phycore-disable-spi-nor.dtbo
+k3-am62a7-phyboard-lyra-gpio-fan-dtbs := k3-am62a7-phyboard-lyra-rdk.dtb \
+	k3-am62x-phyboard-lyra-gpio-fan.dtbo
+k3-am62a7-phyboard-lyra-qspi-nor-dtbs := k3-am62a7-phyboard-lyra-rdk.dtb \
+	k3-am6xx-phycore-qspi-nor.dtbo
 k3-am62a7-sk-csi2-imx219-dtbs := k3-am62a7-sk.dtb \
 	k3-am62x-sk-csi2-imx219.dtbo
 k3-am62a7-sk-csi2-ov5640-dtbs := k3-am62a7-sk.dtb \
@@ -254,11 +264,21 @@ k3-j784s4-evm-usxgmii-exp1-exp2-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
 dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-beagleplay-csi2-tevi-ov5640.dtb \
+	k3-am625-phyboard-lyra-disable-eth-phy.dtb \
+	k3-am625-phyboard-lyra-disable-rtc.dtb \
+	k3-am625-phyboard-lyra-disable-spi-nor.dtb \
+	k3-am625-phyboard-lyra-gpio-fan.dtb \
+	k3-am625-phyboard-lyra-qspi-nor.dtb \
 	k3-am625-sk-csi2-imx219.dtb \
 	k3-am625-sk-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-tevi-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
+	k3-am62a7-phyboard-lyra-disable-eth-phy.dtb \
+	k3-am62a7-phyboard-lyra-disable-rtc.dtb \
+	k3-am62a7-phyboard-lyra-disable-spi-nor.dtb \
+	k3-am62a7-phyboard-lyra-gpio-fan.dtb \
+	k3-am62a7-phyboard-lyra-qspi-nor.dtb \
 	k3-am62a7-sk-csi2-imx219.dtb \
 	k3-am62a7-sk-csi2-ov5640.dtb \
 	k3-am62a7-sk-hdmi-audio.dtb \
@@ -268,6 +288,13 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am642-evm-icssg1-dualemac.dtb \
 	k3-am642-evm-icssg1-dualemac-mii.dtb \
 	k3-am642-evm-pcie0-ep.dtb \
+	k3-am642-phyboard-electra-disable-eth-phy.dtb \
+	k3-am642-phyboard-electra-disable-rtc.dtb \
+	k3-am642-phyboard-electra-disable-spi-nor.dtb \
+	k3-am642-phyboard-electra-gpio-fan.dtb \
+	k3-am642-phyboard-electra-pcie-usb2.dtb \
+	k3-am642-phyboard-electra-peb-c-010.dtb \
+	k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-wlan.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
-- 
2.48.1


