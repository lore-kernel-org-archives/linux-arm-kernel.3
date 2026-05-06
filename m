Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51FACD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 20:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1bIXre2eAv3BVV7BaLcyn3p4E3/VgBUw2Y/vqkGWy5k=; b=Ef9gS8ZiC/qJMjfd1exqlYiMbn
	no0Gi33+3F4pmC6xDsieZ7MZ1xRTqTSpxWcmtuVkArqyb/wxSw5ndVziamQeEMb6O67HNZ4iV9OBs
	tb2Qi8qPiUWhbXQtHVm1IUDdZSbu9aOlvCekbmTw/xUqYFEhN+awGYpiyGkc9eKJWKC6gIMW19Ow5
	Habnc5NV4mDHEemw/R8pbv8bYvxayd/i7kPMf2z+zW3BGowK+ZNLEDJyKJ5JyS+u04oDW1vqKBmp8
	qwa8XG0vWAGTqtl3tsP2AeoSusbDxIyEwgiQu5vmJU1UI+pQSknRriysQCkuVqTh7Y1S4f4+T3O38
	Zye0neiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKii4-00000001xkx-3wfV;
	Wed, 06 May 2026 20:19:08 +0000
Received: from mail-eastusazon11012035.outbound.protection.outlook.com ([52.101.53.35] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKii3-00000001xk8-2045
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 20:19:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbFd+PwaJ/V1+rKHA8+aT7ot/HfioyQr6xMUvSdIyHukXE/IIy72QqAy4UbTjxXW6L5EmcItgwjJLyl6snAG2QK9ieUjY5uk0CsaMRYQ0FTHzSMVfzkThrPNXr8UMYFOfLWMYjykIFdZfpXDaCeSOFd47SnAcV+OvNzfYMZYVwDhKDYXkWqpXvLZLmLsxI5jH1ywRTO4dffjybiFxdylLzCybHZH5V66U5s6Xd7G0pF4kmIzfIH9MtjXmMh7BIqhwicjNwg6IXjHLoB4h8v69aJRWIxFXPAP4XqhdVmwTLLJLAa8iODfLif7tWxKt2f2UdEgeqS5kvMD183cwiTARA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bIXre2eAv3BVV7BaLcyn3p4E3/VgBUw2Y/vqkGWy5k=;
 b=r8lJiVZ1NcItiw0a33eB+K+hbPfn6naAsliZrggQ9cgZPy9mZdv9WaMSYRjJ0CR38OMY0p+7rjuMS9bmXc+KqYCYJgf2liD/ipLrm82pOBUjRrIQkCfEN+rRe9t5Q992cGj8YGtENwMtXub77RhItPS/V9iNfaJwSbqnzba3yMDa+0yWq1pCCZvZMAlruCdCfcyyPTsgOWLNMXtmesQoJsU0ldmMGumjS5FQNmmPumhoQJTqw3Bah5NgyhWsZLGlYlFtZ/l8hII63PDmGE7u2e1yZYCaimmewUOdOx5860pCLv/XXt/25cdHmu3FJtpOUL8KwnQAa3kPVuPSNWhedg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bIXre2eAv3BVV7BaLcyn3p4E3/VgBUw2Y/vqkGWy5k=;
 b=Y5FQ+F+jCG81tLEdogO7IQRwirxLD4R4ChR2HTu/ucNtojQZ4b+TaPDNwCXo7HPrT7s2+ckA7jzHeqOtYcZ+M/Vcvb2L82Kq2v1/Gl87P57ug8+HL/j8Aq/Im8ilO8kid/Xl+YLKN0Vd7wYqbaLOuFJeQdqzdW/5qxKEjKueUpc=
Received: from BL1PR13CA0425.namprd13.prod.outlook.com (2603:10b6:208:2c3::10)
 by SA1PR10MB5844.namprd10.prod.outlook.com (2603:10b6:806:22b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 20:18:55 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::8c) by BL1PR13CA0425.outlook.office365.com
 (2603:10b6:208:2c3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 20:18:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 20:18:54 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 15:18:51 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 15:18:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 6 May 2026 15:18:51 -0500
Received: from [127.0.1.1] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646KIp6P2099285;
	Wed, 6 May 2026 15:18:51 -0500
From: Antonios Christidis <a-christidis@ti.com>
Date: Wed, 6 May 2026 15:18:40 -0500
Subject: [PATCH v2] arm64: dts: ti: k3-j784s4: Add GPU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260506-j784s4_gpu_node_upstream-v2-1-23d6a2565ac0@ti.com>
X-B4-Tracking: v=1; b=H4sIAB+i+2kC/x3MQQqDMBBG4avIrBtIg1rxKqWERH/tFIwhY0QQ7
 27o8lu8d5IgMYT66qSEnYXXUGAeFQ1fF2YoHovJaNPqRrfq9+pqqe0csw3rCJujbAluUR7dE37
 SgzOeSh4TJj7+6/fnum5zCZ11agAAAA==
X-Change-ID: 20260506-j784s4_gpu_node_upstream-be81ebf0ca2b
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Antonios Christidis <a-christidis@ti.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778098731; l=1542;
 i=a-christidis@ti.com; s=20260224; h=from:subject:message-id;
 bh=X0LD5jQE+G5QnPYTm0jaN9+gi/jDVPAl7XKw9tUlJqM=;
 b=M3OtoKPQTwS5AQtaAURp9JAoV+Aj3RkOrI1/5+FgxUqvE+xIXQe+OWbBHe+W3nTRa1f0qGux/
 z7xiAmi2+SnAD6J3Y3ci3K2fIUtPFESKXFKdRWSVFkrUSM5D7o8KSTu
X-Developer-Key: i=a-christidis@ti.com; a=ed25519;
 pk=HcbNQnPnde8WLoob9CZpry+ZyXrXg5+wessZiBGMaFw=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|SA1PR10MB5844:EE_
X-MS-Office365-Filtering-Correlation-Id: e32810f8-7396-40b4-ec91-08deabacb24a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: sDg3E7lQSY/sEpq6cbpxoLJomgiLN5DpYD+NDeFnztFcCLbiZ/M73qCAM82MacBHGWvK5VICPuaU4EyN88mO0Z6Gy/vjkN6KFVS/1ksSfIO49LXeoNY20C4Wv7YKmUh/b9SyizzWyM+ECOj2rWYh0l25m7RgzcTYBT96ypLyyHaQDxAROmOnGJpx/EHXOi08Rew72oYLcx4H4nyxQluXuBmZzOytoqP2VABIR1JEbW4KEmDntF0r8lkvaknqxFDahPt11Alkcp/Btdnc9KtjtZRz7qM+137P1QuGzMhJnumZBFKjRudv/AsYHSxkOVYrhsSmBaGBEkV03EA+Nj1nSMGPmUjYnaP4eRus39keg+zlwQwL0Y3MkL7jtzbHMlSpPAEptOZ2Raa5dRZUFZ9T+e4z7TW05dBZS+pRvHJn6c8WbnqSNDHVNXt32lx1GwnbioJqsir4rTVZAE5Hp+OreGWVipPr3h6NwEXx+MN6/HyuioULUqUQD+N03kSEGQQ0UfgQ+02YbzJrAQEshtnKv4L7RLPKSKLwak5OceNJkpwj8hxKx5HN7Lch04Yytf3uc8KDQhygz12XlioVGu/9Pp/ZLXajOba4hqCZnmSlAvesfloY51cKIpeV1ZffIYa4gwW+g7SeDQkhGBeLENHElElj0bqxaMvUI5EBDm8B6pZ93u8KKyLe0u6z9oVX7TBagU426kQAJKVrye52Vf0G0X8yb08IKas0zSIGepLeVTM=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: j4sCXooj2Uqs+LSp4KmJX61lPyq1TaIUSd/Kuk2fWzKmNpAJ2u5YtU/nniozikvCYp7lXLk7HRpPsrzMEMaNWeGoVbMKBbxCvNfwHLYRpBbbY34KY2bRbIZNJfV9fZxhvB4fuxF0lNm+4Sf+Yiqcd0oxP1JuGUNlURL8CcS72MOe69+CqmZfim+L9XlTAFO2j4Mls785j4Ooiwr9lBSW8bmGyaAeuLtfRd40i/q4Ptrd34dcYmbVi6L7k4ElP/fhmHekymVAyzr1e+bCAroLLLcYZNFdyg8hI5nK9Uj/oVEDtku2cDknQI26Bvqx3qiQ6ifkDI3C6Pw9w7ibfJFkQ77J31DTThGUEUYOsEcXuELrd4OmodZsJQOHXH3Fma6vYKWqA3IcNOxpvG2Qv/HtzCp8hclmzhrnNp4yRZWmqCKtOBlbLsCwYDf97v33YUez
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 20:18:54.5688
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e32810f8-7396-40b4-ec91-08deabacb24a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5844
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_131907_749248_DA435BC8 
X-CRM114-Status: UNSURE (   8.95  )
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

Add the Series BXS GPU node for j784s4 device tree.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v2:
- Separated from the original series ([1]) per reviewer feedback ([2])

[1]: https://lore.kernel.org/all/20260224-gpu_dts-v1-0-cc5ddffe140c@ti.com/
[2]: https://lore.kernel.org/all/20260225010507.flvt775fs5kfe7ez@unknotted/
---
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
index 78fcd0c40abc..ddb9385cd942 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
@@ -137,6 +137,20 @@ serdes2: serdes@5020000 {
 		};
 	};
 
+	gpu: gpu@4e20000000 {
+		compatible = "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";
+		reg = <0x4e 0x20000000 0x00 0x80000>;
+		clocks = <&k3_clks 181 1>;
+		clock-names = "core";
+		assigned-clocks = <&k3_clks 181 1>;
+		assigned-clock-rates = <800000000>;
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 181 TI_SCI_PD_EXCLUSIVE>,
+			<&k3_pds 182 TI_SCI_PD_EXCLUSIVE>;
+		power-domain-names = "a", "b";
+		dma-coherent;
+	};
+
 	c71_3: dsp@67800000 {
 		compatible = "ti,j721s2-c71-dsp";
 		reg = <0x00 0x67800000 0x00 0x00080000>,

---
base-commit: 735d2f48cadaa9a87e7c7601667878de70c771c5
change-id: 20260506-j784s4_gpu_node_upstream-be81ebf0ca2b

Best regards,
-- 
Antonios Christidis <a-christidis@ti.com>


