Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0169760A380F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 17:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hDEwbnfi;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pZ5dsDWT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O/ANBHquPJzT0qjnhEl/ApZzQFwUp2IhZEW0Vv75qFc=; b=hDEwbnfiQNwj0/6w5ysE70P/KF
	IgPIqUtCno9rviVZD2S+97mDpDeqLzHzQvCBShliR7UhecGXhOG1RIToJFUWDTZUOez6kD+DcNZW/
	ChWdoNjK/HzgvXXfWsXPdapyd5pUJ5frK4Be1ZOjRIkd5R3kqYJZwaCQR99n8FgrMLSiVFO7tCGHd
	cH8o+f4fh76zDiyGK2MfVZjVqWZHWrGh7qwI+CiBHUsJrdABFkjWo7WCpgiwwEv7NunukJKZKU5E6
	fIS5iklX4A1v/VcnytkoYJnevsmh+eM27gcQj2l9bh6EtIpNmYJTwkZGQERVDEqoFT5z6Qlocfzh7
	b0opjhPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM7aV-00000007g5N-3kte;
	Wed, 28 Oct 2026 17:37:23 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM7aO-00000007g1l-0El9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 17:37:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqD7e9bflfl364P3d3krGRupQ+fywda1xuRUaDpdQbowBM8CuDG9d9zoFcKpu9K3dBtHh4Y6Mppeax/wE0uFykIT/MqquzRx4GeaEDGFCR2NYXyW5TZdAjLIcYn6piXV9i0sZlPIgBPjAwySFE7mcqLDpX9d4AY7gTzNgIzq0LV985Yka1vjq62L1dQqW7xd3fPshxe50pUauN+sczo96OqIskFUTUr+qo2fifETOpxvZboPeKa1+aNiVgOl/KO7jl3aAfTIHnc/M+AO3OoiloYvtjchIkWGaqR0mJy82F6krUfYaM3iHWZalPJy8Lp/BC5n9J+z7ynVRmMpecly+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/ANBHquPJzT0qjnhEl/ApZzQFwUp2IhZEW0Vv75qFc=;
 b=dtSTMCrtUqaC6EVrqeRNsVPTsn+vTKb5yDwqkGmZelkZiKjurSa95djrYl4q1h4u8v9zHQmVlgig+5NubDMQRe0JyhUSXDVcV6AYW1tkVTJF6IbS3+Sly0q6UH/501TYY84B8LDJpnIjSE21Pa/q1Pc0xmfoS/HLfxesVORsJelp5yWWHjwBmyANRwHnHzGDqZY+7LqrgmKwPf2LumLcy7Iup1NCCjqLEjxlFN4/ig1szG3LNt7RkEN5lmcsF/xUi8ofpSGXtRLp0qE66gVmN8MYhZtYe6jGILmwAcKiXjq7YB9yKOZYJZLibZZRoEQLZ/kt3+luhD6u15RIJN1E8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/ANBHquPJzT0qjnhEl/ApZzQFwUp2IhZEW0Vv75qFc=;
 b=pZ5dsDWTrwPwmb+dAtj4gY6HZc94dhY+LSM1nfBF/C2YhP2QovehGGp2LKa3l3Edgj3+Fqyv9xoXhN87UK7wfGtcg6G6g+WfSNG0zEMv+a5wBX7IODRc+TzvXZIpZTqGB4y+X8PGDGOZMtPr5/dPRGjdUrdZHclo8y1z8DvxLFbRZ1Uh/CEwQ4BL53cN+Rav/aVVTpg0M5O6gaa+YkP1HPZC+fsPkn8dBlaIKfHrhpfAAVZRIXLycoJJwhtyk7LM1QMY9jklTBw9knTmrHr/PV9+Ebjh9XjvE9XmEdQUcinsWdo2qvAz9O0CNimUd055W9AK/Rs/WUhAw0oFB+sMSg==
Received: from PH8PR07CA0047.namprd07.prod.outlook.com (2603:10b6:510:2cf::10)
 by PH7PR12MB8155.namprd12.prod.outlook.com (2603:10b6:510:2b2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 17:37:05 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:510:2cf:cafe::84) by PH8PR07CA0047.outlook.office365.com
 (2603:10b6:510:2cf::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 17:37:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 17:37:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 10:36:41 -0700
Received: from nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 10:36:39 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>
CC: <devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Jacky Huang <jackyhuang@nvidia.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
Subject: [PATCH v2 2/8] ARM: dts: aspeed: ibm: Declare SPI NOR flashes on boards
Date: Thu, 29 Oct 2026 02:36:09 +0900
Message-ID: <52c863fb87b9e8656d7f2cf63c6b36e66b947d38.1793179064.git.jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793179064.git.jackyhuang@nvidia.com>
References: <cover.1793179064.git.jackyhuang@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|PH7PR12MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f46afcc-76c5-47c8-4e78-08df351a14e3
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|82310400026|36860700016|11063799006|56012099006|261009223027099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 0qoq+9a0f+roknY7eRF1qtHYT5nOz2WKtqgBM2RHMP3ax8FZrfdE/MSqoZi7EqPLpNs/yZgeH5y+etweh83SG4X+Bw48havoRgkRpCbYNu/83goGeHHiZAWGOI18MvpnTMllA6BQoZpZA9DkaFx2p4r8Xsl86UXLd5IZZtrUV/4BHSC7CsWQRsdrln5in/pTRD0tzGSkmyVvyG/34fFzMCRzn6I5LkobzAaKkcsrEwkzAQ8C9MocYcE0jvQhPzPI4L8T9SZNFYGaCQ/OpK/e8PoKXkrzY6u+D0ZoC+9BcCNTzEnh5sT40fBSi2xij6puEnASIZIvuRsc1zfvMaOCdiR1o0SIxDAW8NsGS+dEaBLcJMFh6t911BMCvWNsTZ7TLoTbZQGwzx6UbiDIGhsoTblFU0KlxsMIJUVE8Grv6jifaKtLJY8sMgsBIpKORkPA4UclXAeyRwPtcj4R6QS6rQSeLm6tNlmG5ztqZjFbHaX16TOG4ha90u/IKHxbUTRW/Mw0zCVpqJaVtFPUXThckry4zFLpz8s4r3us+JHF4w9CBozxDvexEJXsdYmPRrPmIXYV/9NpNd9ktkWGCAG7CL/ZLlRsaZNJdw50zMpPtXGG76eTeBXzW9anoMvK+Ry7yOvpJ24xn3ofa55xCUBcyJ2xdiubAU0sO6Bv7C7myLzCCag9Uv7+drp9M04zILL3euSXtso+yzAD0/N31iBAQQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 94wBklRSnbs+LX1feMHy5e512xe/LsB2UcHLY0lcQXyUg9TdDQEl8/lPGSi5BNOdtcU7m4DbdSPTiZMjroej/y39DzkRULgxDU81iZ3YpxX5AIyVd0M29NPEk+a6ab180LKs9oj0zFY8bNyZ4FPWgON9OqRLK98f8xBo+18iOFvqyOGNPJ0GeEi7RG1Y6KaU2l+2ekSBG2nHa9m2dxwIAKZLVRUU9bkKBcBymBwoCL7Sn0C6sgiHIG8rMULUvPCDyEkuAhYgNC4bH0A0ic/WFvUBGCjW7CRPJCn07TI2pTFJ4Twe07BUYD+yiGWvNw9nZsnworIIwugMnQzaYHDpsFuHieV+O4jw/VJOuZdxvD2+wLSsVmPMI9pfDElDuFNHqGwSxjAoSDYu9VxKdw9G0PURQxoxH4ydjx+FfiGTTf4Og1jXkk1wBcqT8gVZ7qzB
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 17:37:04.4331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f46afcc-76c5-47c8-4e78-08df351a14e3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_103716_097421_81291A05 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Declare jedec,spi-nor flash nodes with the properties previously
inherited from aspeed-g6.dtsi stubs. Keep status = "okay" so these
boards stay enabled while the SoC stubs still exist.

Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts   | 6 ++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts | 9 +++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts
index dbadba8eb..df45f6192 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts
@@ -1551,20 +1551,26 @@ &lpc_snoop {
 &fmc {
 	status = "okay";
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <4>;
+		spi-max-frequency = <50000000>;
 #include "openbmc-flash-layout-64.dtsi"
 	};
 
 	flash@1 {
+		compatible = "jedec,spi-nor";
+		reg = <1>;
 		status = "okay";
 		m25p,fast-read;
 		label = "alt-bmc";
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <4>;
+		spi-max-frequency = <50000000>;
 #include "openbmc-flash-layout-64-alt.dtsi"
 	};
 };
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts
index 6fe702359..d886f2478 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts
@@ -140,18 +140,24 @@ &gpio0 {
 &fmc {
 	status = "okay";
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout-128.dtsi"
 	};
 
 	flash@1 {
+		compatible = "jedec,spi-nor";
+		reg = <1>;
 		status = "okay";
 		m25p,fast-read;
 		label = "alt-bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 
@@ -161,10 +167,13 @@ &spi1 {
 	pinctrl-0 = <&pinctrl_spi1_default>;
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "pnor";
 		spi-max-frequency = <100000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 
-- 
2.43.0


