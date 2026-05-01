Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CD0CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 14:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmfLCFFAgYXtK7z5ADZe+LJsDWsLhgNMzA/50TlZ8nU=; b=t1qbcZxy4DDNUbkJgoq7EJiozP
	O2FKSnBHiEmmRoFL1KMMR83URDDzD5JGTxD+AtKkTnM0zMyEI52pAgUv0eZX5ovqa2yy8dvOf0kc9
	GKlMP8NhsJVTFnomDjXm/05T7T97+wzCWyGQHOHduUYAWsC000KjgQbnFcMwdKouqQjNz89dgjVZ5
	4Tf0MM2n+M4ej7j4UejpOuqF5VaZBGmxNI1yIumB39USGgSW0VsHqkYGd2M7XL1mt7S34fhT6HNvb
	PwAuqFHTBGf9P0NQpA0XQkcUljWuo+k9JPnSB/cdssQpjLHi5sIu7L8Ar0ThL+2K1M0OvPdGMl7qf
	KU24SvdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIozp-00000007HOT-0ktP;
	Fri, 01 May 2026 14:37:37 +0000
Received: from mail-centralusazon11010059.outbound.protection.outlook.com ([52.101.61.59] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIozm-00000007HNK-4920
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 14:37:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXK7gwLXESc1gWy0Mk8yfvmd7EOhT/+O6kt0bipd6tO4TSBWIxSIuWmlmNGJ8tzCaIg+gb0rapynqQX0B5uo8aNF0PbcHJ7Kj5upvgBIZkLdO6rFFfzrREWKjxdDj6yceho/kgpqrIOCqFUPJL0ZOqoK7L8B4m8gwVI7JOBiQDxGe6893wRXOtNkF3t3xuy/yXRlwyhboGoE7FzBKf7AcJFAXM/pQi0aivkHBrve6jSNFTXYOsmbNQwnSvbU9iMQHGxrDyO2U3UmXItYC9fLpWftFTb4jtENF1d0WGyPulx/K5SkGAo9yzxRIZdvGns9ecuy1eRxGvA9yTRIEcG+yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmfLCFFAgYXtK7z5ADZe+LJsDWsLhgNMzA/50TlZ8nU=;
 b=UiqHWlwwfIBERXkBj2SZoVJj69EZY5aZWYY9rEcrcFqeQB4hicSe+NjGnVHDwLKRHGndrgojuEXPqYRlVMm1lrmWFKve0yOhb+iFX47OQ5WboMJYreviI4p2C21JwkkWTCUM824LjsOXdtpM44ScmkgjH+1fkHnjpC7s+NRPID+1GxVWY5CF0hvpVR/xL6BErK038B4rKPRGsZiNkXTF3vsLpLi7JiVVbpnUo+BAhJwPVYYup+99HfSmoqiKqTouBh+H2KSiVUZVjFbubTI2xtBRUQ1uRz1AKWyWoF0NdZ5YAbmMbc2Xagx1W/Wr8Dshob/AVGcwiFTgf5YDlcrXyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmfLCFFAgYXtK7z5ADZe+LJsDWsLhgNMzA/50TlZ8nU=;
 b=DhHvdpjizj+vzRvR5tt5lAQwiBF8J6mnCb+Y6SIbO2sMm17qKt5akfO/iEbW2GFzzmn1dNQtPXmNeTqUfTdUfigJNbwlI3lKiNtFDXNpQhbuggkFKIwdPzQlD7GpzMLZAWC5I6PIcfDXeyYPFFyjyfdRErF7iVOh7UQFgcsoYEQ=
Received: from BL1PR13CA0428.namprd13.prod.outlook.com (2603:10b6:208:2c3::13)
 by BN7PPFCE25C719B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Fri, 1 May
 2026 14:37:28 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:2c3:cafe::8c) by BL1PR13CA0428.outlook.office365.com
 (2603:10b6:208:2c3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Fri,
 1 May 2026 14:37:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 1 May 2026 14:37:28 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 1 May
 2026 09:37:25 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 1 May 2026 09:37:25 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <michal.simek@amd.com>,
	<ben.levinsky@amd.com>, <tanmay.shah@amd.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: xlnx: add firmware-name property
Date: Fri, 1 May 2026 07:37:06 -0700
Message-ID: <20260501143707.1591110-2-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260501143707.1591110-1-tanmay.shah@amd.com>
References: <20260501143707.1591110-1-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: c0ea2111-1586-42a0-55e7-08dea78f2b4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 4z5ljEPRvt3XSn3PjPlh/CCDlMD4xlug5lZlC/vxJxW2rsMR3PhcGjMoTlmIriA7d0k5i+VVFKTZY/PkLFjCfEBqa1mPaibQBf2xT9s+rvbCsEMBJVPd/oBnle4TeddAtOy/RdOqtzBgGv9sbbjYivRUlPjmiSobHu3ncDdmXaT+7k46RM3ZON9yc7Re7lNJh8jkYyaIkEGbZcXpUN73Dg9xveP1hWD2yU+Uvtq5H1Bad6y6PhqSTp4sWkqcBjDKr4BDHCzQl3KX7e827Vd6zQcOAzI74mf+x3uI6Y0k37JNRl+K9FR3uBU6vkmJpTzCVz6SKbpFvo1qiiXFvVtwXSw9q45ECoamPk5if2GHjN4UnZps96maIWCrWM4buAOrYOAr9C+nwsONnGaNj0Z+XRkcv763bw96LWxsnVWsgBm/g8JxZrG4PkmAUiVEaVcLQBiS+D5x9JnSeqAnNIZdHnCrNBXmD4s7p1U6qCrwH8ejz2cuXpjacaJDa6MykIq5iRcKtSv0iLjqp4lklEoBJzcvR7i1sjLCzfPw1JYKoRWBKnKsjg1OjtQJMbNXjHQrUvTs+1pvmEoFT9V0VE7WVxNTZYxLtRH466BPgt0+dUpGovhnV3EJqc3Vqo2/RFbOmxBNV2PJXuE2s4aLE4X9uoxDp/xtBMW7d5Aov/pUj+dkaR/0c4VPRKezdGMGFe0KafXgrODlZHtDAV/sG8Wcz3UC60nl60KWUBfuWorFIBU=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ygUYhPyxZ5h92aErB5Hwb2H3v6HmLrp0KJQCOpZq2vPilYPg5w/Sb08r6RiJxIR02VpdeCUpLuYJQbBQMcR7QLpI5V6y6UyApV00RX+5wc5NiVrO1bQr/UrnOXKddcii3fhMrsclXn9IhNMV37KqPdtHKixQVV+eE1AjH85xNn6VncgAmsKqAzoAWRk++cL8HaDvPsLkFNmVd6ai+U/1jYO5cwmssjbAHE5j8rNoKBE86EP0o9QJDYtiPAU1nozsaYRROvkuC6Vi7SbmUr8Y/7NcOzgku91w2n6w40ez1vUscGbL/6qS0QytCrGHZKCgBGEz7PXKrFXRsi8GD+GFCyMWzVMx/V70NILJd3Q94EQE0zLXxzcavW7Lzd0j9HRd2zTNvGgQ4gVcJKorLX6xQj6kx+a+SAJ4fb8sqdnHYRBuOdULrAFG5VxkrgJ0/2hp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 14:37:28.1306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ea2111-1586-42a0-55e7-08dea78f2b4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_073735_025998_934B3054 
X-CRM114-Status: GOOD (  11.17  )
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

The firmware-name property indicates which firmware to load on RPU
during the Linux boot time. It is possible to stop the RPU after boot
and load different firmware and start RPU.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 .../devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
index ee63c03949c9..ae63c3e39ced 100644
--- a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
@@ -135,6 +135,10 @@ patternProperties:
           - description: vring1
         additionalItems: true
 
+      firmware-name:
+        maxItems: 1
+        description: default firmware to load
+
     required:
       - compatible
       - reg
-- 
2.34.1


