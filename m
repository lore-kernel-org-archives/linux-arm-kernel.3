Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B1E105A589
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 11:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZnzMaRvVNqaBIklhagp6qjC0YM8PR/cvI2xXdNqbOvw=; b=1dWf2XSBbvMfI2pHVISCz+ef3t
	X5P6dYGrBXIx0gh3fxjh+yERv0jq/+bAeQYLFIk6qdnYvpLIRG1CoBy+MgHGAuKny5fSEEB8Efpvt
	1zj8JUfoBNbq+YVgESjLlpPRNcAG7syiN7472dTEmjGt7MqFhPaZfiimqzMGYRD5yKD36IFuOyTFG
	Io2jd4fP+B05EwlwYIJUP1huDGaViLWctQp723JhOHc5j8V/q1BqcztFRHYy8IqnXD3LaXDonS2V8
	7RnthUfKSx7C/gEtu1kKG1Qnod/UOYcqC2QUuWI78gP6CEPAhQ8lljWloCFuZUozVnrtckfl+vKcr
	R1mYiNuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eJl-0000000Dxsr-20A8;
	Thu, 12 Mar 2026 11:35:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eJk-0000000DxsB-1Hra
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 11:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ZnzMaRvVNqaBIklhagp6qjC0YM8PR/cvI2xXdNqbOvw=; b=SZZscReVK6fuZIWEJH7WtRXgxg
	Zf/3tlfFZzAFzxkLqJaX0wP7GPoDFWC+ZNKswKG6pIo5eS7cuSI+K9Opxmu+cTWpX6Ht2K+cJx2sY
	oakfx6EZ8s1i0MIAuDNmWrsjE/7+/qHtqPRSfD+HhfsQlEDRXTXOnyuGQEb94GsmnsaIz0uzmqCk9
	SfwghT77EK/JJFk8TBwsLtoyUSmgGA9/phYtrrQfnTGFHT9578IdK9/P/vLp/uaWy1Wu3SJ3haXWK
	1yZnJzSffm/d91Yrbzin5AQQ1sK0ZCUMStbh4tNZI47mmjl/f6tqe/hT7zxCVWYc5E3Cn1FFi+SwZ
	/oVJq/qA==;
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eJg-000000011t6-1NOx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 11:35:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q69tTpHMa3mzwAxxChGhcwSoNVJfUR1n5omTthVyMh+blUgDm/KkeMkiKGwkRcZ5N/wMzbTpn/g736SjVrjJxgyb5Opq/yIqC0rbk4ldW/oSzIyQkxB4zjsta0kjF8qysaOYaooMaP9AOwM5Z718v4USSD9OqAAFnfs/ccbLHUYoo5nYvkkQfXJejUdQidrKm66EXfyrwttwLi6C3uIfzMA9rho6K2Z0dwz5ZULdOnF7kz7rq2ldN/N1ZvyDxN+R5nzUFnojUmboqqhnfSVH+luMG+YIPzky+KLqxF9Gm2F46c85F4IOjqZu1VOUzaPDT+sKjRMYexVAH6PD+ua8+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnzMaRvVNqaBIklhagp6qjC0YM8PR/cvI2xXdNqbOvw=;
 b=JHJTezAbU8+WnSntlaEdu2yQTkZMlP2SRcKXW0gU0jARa0AyU6RxS1vh+HpwPLGiKd5Gv0Xa+SbeU133Y1DU76ZB/I75MW8AS5h3AlDhJbBK13UyDh1AX2dJreCDnITUxTyAP50PRLcVywgZzohNxEVdGsi7iNKUuHv8sZqMipTRRW7r85p4MkSPwtgAI5rdnUXBfe2t0G3hAA6hF/HBaSC3MrKVRJYqsUxYCN+3LIKin3NKOyBM/+bRvjdR4LbZtP8nkupGuNi7hRea5Tv7CI9wIe3+hGqLrr4iifdmYBn3p3f3WZiK8ghYtwMnCSO5V+Zc+XT/vbPf9ZpsahmaZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnzMaRvVNqaBIklhagp6qjC0YM8PR/cvI2xXdNqbOvw=;
 b=Q1sOxCM9cupEOHO4in2drwXeR6mOv3CATCH3LoKehHuyAmIfjyvAaEU6YzmGWk8jTq2KBG/OG93ZKfpi0lPuXfB51cHLlMzlv7iUda9TuvW68VbyDByqtZx2vJgrGy3hsLjVwCvYZgvpnmlaPXgBdWgk2pLvZLAMI/Bz/UGE2HI=
Received: from BL1P223CA0001.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::6)
 by PH7PR10MB5879.namprd10.prod.outlook.com (2603:10b6:510:130::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 11:34:52 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:2c4:cafe::b7) by BL1P223CA0001.outlook.office365.com
 (2603:10b6:208:2c4::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Thu,
 12 Mar 2026 11:34:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 11:34:52 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 06:34:51 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 06:34:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 06:34:51 -0500
Received: from prasanth-server.dhcp.ti.com (prasanth-server.dhcp.ti.com [10.24.53.104])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CBYmV62227538;
	Thu, 12 Mar 2026 06:34:48 -0500
From: Prasanth Babu Mantena <p-mantena@ti.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-j7: Reserve memory for LPM meta data
Date: Thu, 12 Mar 2026 17:04:46 +0530
Message-ID: <20260312113446.1857592-1-p-mantena@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|PH7PR10MB5879:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d2b4741-c0ac-427d-f7a3-08de802b608f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: LTUxQ7zBKvLRv7OzOXigdox3fvjUNCiDA7uqiktdm8+IapwV5+VnNSm8MWVaDRE65up2+ZTMcC3To0G56eGlTopSBwpYBUPqpB2TKd0fmx1XZ4fpDH8odFp4qQKOhgN/C2KWYaazZddp+KDqXM+5VjJ2ktmTRVpMIls1y0eC7+n4aud42wRkMvtk4noGsmj9OVGndw0z1I4lTro6DjNkcCf6qY7i6fXPdQ9eRxbIj0rULUQO+e+EeaShU+mZYRMenBoQDweHnxvU/hsjsGzWTZ2UGQwqvPr/mYj8nt0sNCjm3BiFPQsesD1jgBlbh0ofFb/QJUcNHMd2ZRagQwNf5dga1MmhC0aKX1SMqmXL4CcyDO/SITcx0yeyFEQmoCORhaUD5ueoYlS2wElVqQgMl3qRHBtEUxcG2A0OZ/JjaLKUWSwRszJG+j3hlin4ib4xGqtpjDCBLzE+8C7qSpqghEncEU/LRRA658HxAc3lEdY+NoKJDlQg8NSaPHBrXkdG0prarCMTBBHeZIXSDLyioHHNxlWHg1t6ZzRkOXOLmi+dvr99M84wzzw++YoSTyfW0F0JxQbsB5rUZC4XdysRN+grPncMt5DBRW7c+36SjDWpNSJ2cplf4+qpxKW6y1/iXFCqZTozS+lAohYbVqrZTWb2q2xzTWhqrYD2FLA6JmfSSAaJva7fc0Bj6/ZKkXNJDv26PPmL98wDgMj/RolUK0cY1ME/jET/2IphB98s/WZ7K5qaw//88RhRTLNKixzio4t4Xxh4LukLScbqxY3/9A==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nX1PnN35Aray2Wn4GXcb7o/NBaLb/gNeSNkb+2DY3dIC6zeJUzYYPdP8TGJkqKrWfjn2aS2Tt9Vqt933JJgtuI7ueJY8Tmd4591LfItvqy9Cs2vlvdlXGaFffW7MwJ7KmvkTrAL76Vy11L/Pk3MCotNEDLocxsZt6T8Lox4+AGTfLgM58CfOlMdUMYkYZifUpCadYn0WWG2kzQvwUJVDHUvSWBQ1frM0kOHwNYR9ZXmLVmjjqhIMGgJ/CbaAldlvY9MbGKu704AsQiX4YSC8AaJH7xZSVN5dtJiDQJpj4by3DIxLVR2uC0PsSjvvvy+XSPnPeqbLAZE7tfms5xStbq/3IjT3lpT7bD+fCd9B7kEr9fhWNFvNTVL0bDrE3RDrFrhauHAxeOy8zeQBPgODQGa5eYVLsBOUNIqpc5EMP1RMThoRJiG6ywKTgXUPKwTi
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 11:34:52.4011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2b4741-c0ac-427d-f7a3-08de802b608f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5879
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_113500_691219_DCDA9B11 
X-CRM114-Status: UNSURE (   7.76  )
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

For TI SOCs J7200, J784S4, J722S, which support low power modes,
A chunk of memory is reserved for LPM meta data, which is needed
for saving ATF context and the certificate information of ATF and
OPTEE and DM image. This LPM metadata area is firewalled to be
accessed only by TIFS.

Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi             | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts                 | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
index 5a8c2e707fde..26c2489c3b91 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
@@ -40,6 +40,12 @@ mcu_r5fss0_core0_memory_region: memory@a0100000 {
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
+
+		lpm_memory_region: lpm-memories@a4800000 {
+			reg = <0x00 0xa4800000 0x00 0x00300000>;
+			no-map;
+			bootph-all;
+		};
 	};
 
 	mux0: mux-controller-0 {
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index e66330c71593..f2ca0354a917 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -63,6 +63,12 @@ wkup_r5fss0_core0_memory_region: memory@a0100000 {
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
+
+		lpm_memory_region: lpm-memory@a7000000 {
+			reg = <0x00 0xa7000000 0x00 0x00300000>;
+			no-map;
+			bootph-all;
+		};
 	};
 
 	vmain_pd: regulator-0 {
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
index ff3a85cbc524..3e79677792a5 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
@@ -46,6 +46,12 @@ mcu_r5fss0_core0_memory_region: memory@a0100000 {
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
+
+		lpm_memory_region: lpm-memory@ab000000 {
+			reg = <0x00 0xab000000 0x00 0x00300000>;
+			no-map;
+			bootph-all;
+		};
 	};
 
 	evm_12v0: regulator-evm12v0 {
-- 
2.34.1


