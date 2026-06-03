Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D446FCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 14:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7AW+vyG7Zy5sugCSrnQQ/bGv+ZjbD6txqKZsU9lVcH8=; b=G/zyxRXupfzjno2kQor5XXfjvM
	o+RvlnP5C2owWsnimmVeRYJHUdr2/I4CrTm36RWrIE9xrA4uCV1fyjP1DHUT4SogIkAXc/PHHroHz
	crfjTx20ru3vL9sPF7qTsgeJDsc/joMxpkGzYdfmJeo/6b7JvHmuSi8zNkKTD7o9sPOGyTPCcSVla
	sA6q5k6A1tk9brNgdE6Z7fRmPSZ+ThirSleKLnO4PCf6pRmc9+s+DApv+earUIyL5Q7/5rqxzG3k0
	l6QAeM/NiT1qD0PiouoDcY8iJxWUs9J5ZjBTt4QnkGkknfDmhkC91hFpHQnj+yk1ar7zQ6U19wlfZ
	a0M3niSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmSY-0000000FEkg-14vn;
	Wed, 03 Jun 2026 14:20:42 +0000
Received: from mail-westusazon11010060.outbound.protection.outlook.com ([52.101.85.60] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmSW-0000000FEj5-07bo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:20:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YLkPqbmRzA0KaXGQgfmtwLawpy6nlhhhccT/gbeyFuxpSjHRq04rmewLzXNNk1UqevZWFmfMNMV9NKwGWWF6pbVKB5MRq1gqCrKYJeDn0gGBzBZBPrYi1tVBCNuUmQoiy/Vx4bUv5qcPDF4Aq+eIhBeN6YvE0XQkYkIcYS9IUQ2qw+AJiQjgSbjKoUnVRVFhR9AK09ZDYdzqBswc4gvPxSxPQlrIdIqzcFam/4ZojXugwE5oTRtbFapud8boN5YVJSA/Lx7blm19+kMAuOxKse02RwyX8KyhC+hR17Osz79t/gonGzL0U5zggzzWncGGD98J8nozMDHprturNtwg2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7AW+vyG7Zy5sugCSrnQQ/bGv+ZjbD6txqKZsU9lVcH8=;
 b=qdHrONyCUFeDLaHEKg71jabb48lBbSYOOzVRn9jT1qZx0X82p7X1xsBl5XRYDEyITiMp0q1tQ2beEpcX8ayWjR/3oXi4PqcoSPPmNZpP2/N2/kp7rDAvYlKAj1UUx1Iz/VeoY9gnTKeW+ha/xK2eNn9gdaGeHdsP3T3YeOtfQNfvelid9ETvjG9osy3wKpyjOOlhDefjZP6HTEiEQKenSXpvoIlxjz4TMchcLT3JVmAq5IunaEIIS5xh6Pq23Lhd2hDMrhts9pv63bXBjIFVBnBuIJ11LosMTQaqx44Sp0z8awlowQ6dlftdpfLI3gJSZf8vQIdMc20JmwlyGb/0jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AW+vyG7Zy5sugCSrnQQ/bGv+ZjbD6txqKZsU9lVcH8=;
 b=scfNJ8JWcesrciSdwaGOzBwzkkexmrhtFBkEboz8+74XLAB5W691D1OyhrbnjymcRpcMENIphzY1MD3LUCVaMh4oBotyYaNbjbYkoXonmik8sfqOYgJVQYDhDEb4QIuRL6b7ult0sk7P9YTiIFJ98MdQxnyeboAr2EMStf/9e8Y=
Received: from SN6PR08CA0010.namprd08.prod.outlook.com (2603:10b6:805:66::23)
 by SJ0PR12MB6733.namprd12.prod.outlook.com (2603:10b6:a03:477::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 14:20:26 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:805:66:cafe::d9) by SN6PR08CA0010.outlook.office365.com
 (2603:10b6:805:66::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 14:20:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 14:20:26 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 3 Jun
 2026 09:20:08 -0500
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Wed, 3 Jun 2026 09:20:07 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: <mikko.rapeli@linaro.org>, Conor Dooley <conor+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>, "moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 1/2] arm64: dts: xilinx: drop bias-high-impedance on SDIO CD/WP pins
Date: Wed, 3 Jun 2026 16:19:52 +0200
Message-ID: <e01c8e60e1d9ed68c347f1a3741f89149109d8b7.1780496388.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7719; i=michal.simek@amd.com; h=from:subject:message-id; bh=fRs2CllGGqoGbfKeyzY+Xc+NAMO99W9soVX19IHTUXU=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWQpWAis17n4/9vpW381Tn9d6Fp+LLv72EmW2QKdqZ4cP Zx2xu2vO0pZGMQ4GGTFFFmmM+k4rPl2banY8sh8mDmsTCBDGLg4BWAi150Y/lfd1N3e6id95AG7 4IqPfycpL5k9Y9IGBrF5VvMf7d/e47WM4Z/GXg0WiZ6zSVxHQ9wPn1DRE5Ts3rhNvfkw17o5/F4 uyYwA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|SJ0PR12MB6733:EE_
X-MS-Office365-Filtering-Correlation-Id: fb117da5-51b5-4ba5-e431-08dec17b41f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|6133799003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 4ZavO2G0VVmXFzuIVvec1+WBUFaMp68W69ij9CrP3tHC1tSahoK54kWCkTHGnrwMwxEAtWGNrOkYsIY3nP2bhPMxQb6PMeG58vh8bJ0lLMtKzsvkIiK59erpghR/sm8SMjVzv3DcO2MG32AmCrINTatK0JzD8rLbyfaoN/IUyyHTZBV2Cbj6Aud98ijoXwV8Z7LFNBVTTcgdDvhJf6XhkrU0uA2VBGfKxOlwxpzyBHYkw+LsFAoKCYH60Ji1ss9OpvwplpRakOlZkaEexAdwQ+zC664U1Ng8XpDSma6GNPAkWipD6TJ1EHuzTHEFihETX+oA+PR3kPoSmsWXIqU4pZsZkACJZ9lULqpVHWNN6R9gzdo0pT8w2FxkrX0RNqn/Hv/Tu4+zAkfwOujO6ohl2lARHFpC0k3HldmBti2T1Owygp7pDsjW7p/eBt5lo3rjfiJ03XiKHYKMON5JBJpRomRm+3ocSIQKcitXuHQ8y7KOHZR+R9d9RwqeS/WDVnN1hhijW5E7gy/YVOMKy3QYTdxl+rfE5BBFB1yuc/pDmg5usSR8zEN4pvP4xhCygL5OY1stXpb734ERTpYScusrJZv9rv413szEeiZamRylsi9qlwDvQ0Dv6Vt0I8m4cfmxMBoneNTB8xlF8OnBwe00NmDXyBRvprraUPeD1yEG8Jj5eEpCDQbdpDvzkt1UNVRxM3T6AyLTwPSGjL8DiPMJfJGG97iLQBnSwiAZztza9eM=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(6133799003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iCkMVQkhQnoLwDsELbBjAu7LmUuDAY0BCQnnoKtBWOsVzrx28l8z+klSFCbD03okq9gV1udC+cJDXar1yVFvFOUj0IITSErXu96GLRLNT616CsMYp37EqMxqCDpW+fuVzueO7/4l/kvitQ7L5KbczWB39/LxpHjZ9/ZS0opRBQibnu9oQvsm18kOVBl+RJ8EL6aow2qxhxE64gSTqls+vItdL9+k1XMczguuqc9RcL8mRsjRQZYnd48QIIqhoucUoiA+RS6i0gGDgqW90JRwtV4lEeJHblO35p5eyo3PgnVay+gAhWEW69CPiJ52MYJwLNrugY1IRzJp1MQiqWLdWhNoRXfQyqLiK+E+gDZ9klcNnODi4flPDNv43VrIp2QJ+frfbDCz0qalskslUP03GD7scGo9ibWg/QWc8nDHENQVHCca3IpxmhT81SmE8CVH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:20:26.4466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb117da5-51b5-4ba5-e431-08dec17b41f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6733
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_072040_172948_4883382E 
X-CRM114-Status: GOOD (  11.11  )
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

Since commit 9c105255108b ("pinctrl: pinconf-generic: perform basic
checks on pincfg properties"), the generic pinconf parser logs an error
when a pin configuration node specifies more than one bias mode.
Several ZynqMP boards described SDIO card-detect and write-protect pins
with both bias-high-impedance and bias-pull-up, which triggers at
pinctrl probe:

  generic pinconfig core: /firmware/zynqmp-firmware/pinctrl/.../conf-cd:
    cannot have multiple bias configurations

On ZynqMP, bias-high-impedance enables tri-state while bias-pull-up
enables the internal pull resistor; these are mutually exclusive bias
settings and only pull-up is needed for CD/WP inputs. Drop the redundant
bias-high-impedance property and keep bias-pull-up.

Reported-by: Mikko Rapeli (Linaro) <mikko.rapeli@linaro.org>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221586
Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso   | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso   | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts | 4 ----
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts | 2 --
 arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts      | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts      | 2 --
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts      | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts      | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts      | 2 --
 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts      | 1 -
 10 files changed, 16 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
index 923a70d750bf..44834bf1c19c 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
@@ -374,7 +374,6 @@ conf {
 
 		conf-cd {
 			groups = "sdio1_cd_0_grp";
-			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <SLEW_RATE_SLOW>;
 			power-source = <IO_STANDARD_LVCMOS18>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
index 563e750b0e08..49732de5fa4b 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
@@ -365,7 +365,6 @@ conf {
 
 		conf-cd {
 			groups = "sdio1_cd_0_grp";
-			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <SLEW_RATE_SLOW>;
 			power-source = <IO_STANDARD_LVCMOS18>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts
index 6aff22d43361..f57987dad50f 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts
@@ -270,7 +270,6 @@ mux-cd {
 
 		conf-cd {
 			groups = "sdio0_cd_0_grp";
-			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <SLEW_RATE_SLOW>;
 			power-source = <IO_STANDARD_LVCMOS18>;
@@ -283,7 +282,6 @@ mux-wp {
 
 		conf-wp {
 			groups = "sdio0_wp_0_grp";
-			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <SLEW_RATE_SLOW>;
 			power-source = <IO_STANDARD_LVCMOS18>;
@@ -310,7 +308,6 @@ mux-cd {
 
 		conf-cd {
 			groups = "sdio1_cd_0_grp";
-			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <SLEW_RATE_SLOW>;
 			power-source = <IO_STANDARD_LVCMOS18>;
@@ -323,7 +320,6 @@ mux-wp {
 
 		conf-wp {
 			groups = "sdio1_wp_0_grp";
-			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <SLEW_RATE_SLOW>;
 			power-source = <IO_STANDARD_LVCMOS18>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts
index 53aa3dca1dca..737d445dc16b 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts
@@ -270,7 +270,6 @@ mux-cd {
 
 		conf-cd {
 			groups = "sdio0_cd_0_grp";
-			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <SLEW_RATE_SLOW>;
 			power-source = <IO_STANDARD_LVCMOS18>;
@@ -283,7 +282,6 @@ mux-wp {
 
 		conf-wp {
 			groups = "sdio0_wp_0_grp";
-			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <SLEW_RATE_SLOW>;
 			power-source = <IO_STANDARD_LVCMOS18>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
index 4ec8a400494e..41f312a82bb4 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
@@ -320,7 +320,6 @@ mux-cd {
 
 		conf-cd {
 			groups = "sdio0_cd_0_grp";
-			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <SLEW_RATE_SLOW>;
 			power-source = <IO_STANDARD_LVCMOS18>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
index e172a30e7b21..a5bc521ab679 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
@@ -896,7 +896,6 @@ mux-cd {
 
 		conf-cd {
 			groups = "sdio1_cd_0_grp";
-			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <SLEW_RATE_SLOW>;
 			power-source = <IO_STANDARD_LVCMOS18>;
@@ -909,7 +908,6 @@ mux-wp {
 
 		conf-wp {
 			groups = "sdio1_wp_0_grp";
-			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <SLEW_RATE_SLOW>;
 			power-source = <IO_STANDARD_LVCMOS18>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
index fe8f151ed706..32509083e54f 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
@@ -359,7 +359,6 @@ mux-cd {
 
 		conf-cd {
 			groups = "sdio1_cd_0_grp";
-			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <SLEW_RATE_SLOW>;
 			power-source = <IO_STANDARD_LVCMOS18>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
index 3ee8ab224722..96699be8430f 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
@@ -371,7 +371,6 @@ mux-cd {
 
 		conf-cd {
 			groups = "sdio1_cd_0_grp";
-			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <SLEW_RATE_SLOW>;
 			power-source = <IO_STANDARD_LVCMOS18>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
index 7f6c87d4d77e..52441e5c8739 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
@@ -895,7 +895,6 @@ mux-cd {
 
 		conf-cd {
 			groups = "sdio1_cd_0_grp";
-			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <SLEW_RATE_SLOW>;
 			power-source = <IO_STANDARD_LVCMOS18>;
@@ -908,7 +907,6 @@ mux-wp {
 
 		conf-wp {
 			groups = "sdio1_wp_0_grp";
-			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <SLEW_RATE_SLOW>;
 			power-source = <IO_STANDARD_LVCMOS18>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
index 428b5558fbba..b34e4c93d249 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
@@ -750,7 +750,6 @@ mux-cd {
 
 		conf-cd {
 			groups = "sdio1_cd_0_grp";
-			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <SLEW_RATE_SLOW>;
 			power-source = <IO_STANDARD_LVCMOS18>;
-- 
2.43.0

base-commit: 6218e588ded718ad365fed5fa7fb151a85abe5dc
branch: zynqmp/dt

