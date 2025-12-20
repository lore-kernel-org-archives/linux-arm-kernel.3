Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AD9E668B4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 15:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hXY/Xgwn2ah/OT2EVksB0yo1qCE1vpluyQy4Uj7mR4=; b=z5pTQr0w4Ue8r8sqJeM9W+7OyJ
	xKsYx7ko77ETnwEBuAO6OR8OAsSxtk8Ba9mO8DUZ6eoh1GgktIJP3pIWnW3w4IdMqNe7tY1rZKMsF
	34ZQYRrYaG8IUjumAjVMEzJwsK6iRJ1RaHGgw6GWzTY8Eda5sLjsCCeg2dKNcHCMaBwf+l1AZ9+jo
	lAX/pjhuPFB0bGwAe04bmmV3S4VtIvCIXeMX5hTJI5QDrTe2DSgFOI4moRs2AnBywIuvS4A+WQRc9
	KRV9WlCGQp/xyDNN2ee9d3/pGXEHDuMkMr6aTvsCV71n852JaL0fK2i7u4gn4qpZbDCr40/SUaZFp
	JH/Lsutw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWzMx-0000000Bi8O-1U5B;
	Sat, 20 Dec 2025 15:59:47 +0000
Received: from mail-eastusazon11012053.outbound.protection.outlook.com ([52.101.53.53] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWzMt-0000000Bi5N-3CyN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 15:59:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uY8eH2udI5WFNxJT4EeTW1DoEWIHVWDAbm8/db18QbWUIoUQmmwLePeSCnOEDcCjHB4b6J6ucjQcy8QC+qntILkVTK8EMc5UCEcKrkc9Aq/bVn1ZSUt7K1+CHARDgRz1O0fo1J/2xgxAU42LGMIjPzOmQyK1vvdi43MbYJNcrFanoVJFdaUE6a1pbx2m0Df0u7UyOLDsAe2ETh2llzUBD+8MtptDq3ed8bnHd8r7lpT9XwTi8ZHnNHVSoWHNbsH34ZvoX6M1J108+7udChZYEOgxOE1jKedkX48oRxU2taAv4QgKCtck7HboeLWztafjBwpmTjvHJA7xWLBxzMU8OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hXY/Xgwn2ah/OT2EVksB0yo1qCE1vpluyQy4Uj7mR4=;
 b=ZtdxfZff5MQZ4r/yM1zsRhoK+Z4QnQWoq7HppjvY6lG64QPiVZ+I/UE76SS1mI6R8ks9ed3mR2yucQhO9gKOZKPFGH2Jt/Sl65Wyy+DjqAMbwiOMRy4SmJoaA3WvjU8YZRwkKtWseNdTj9+YAjPKvGN+SuJ78/h72CejK8ll4wnk7XjNU/otIq02LIgx3/QD9teaKvw1RLiERK7IgqitGRd5chjv05nyhCycubHCm8R+s8wDX1X/XWxmeb5BkXyEeDBX/hZRX6WlliSeAUVkGDjam9k9EGpovwWJARR7n88u7VoKXG1CtxB0M22YRh3L90NJA8xEhnuuDhUGeErJCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gondor.apana.org.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hXY/Xgwn2ah/OT2EVksB0yo1qCE1vpluyQy4Uj7mR4=;
 b=t89qnMYAdxz8M2bVD/DBH3ul2p4VkQCOenvvcX6Jxu/vOP0F39anx+q6NwoPTI3vFrUl2lNaNETMwcAN3UiVxQDwUGdKWi7OHwGA7GzwkQtMYw8Xq71MaVQrjiulDeTxDbGOBtp1FcEfBTX2GZ8Poz9TVXRLS2qy/Id907p373o=
Received: from PH3PEPF0000409E.namprd05.prod.outlook.com (2603:10b6:518:1::4e)
 by PH7PR12MB8053.namprd12.prod.outlook.com (2603:10b6:510:279::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Sat, 20 Dec
 2025 15:59:33 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2a01:111:f403:f912::2) by PH3PEPF0000409E.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.8 via Frontend Transport; Sat,
 20 Dec 2025 15:59:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Sat, 20 Dec 2025 15:59:32 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sat, 20 Dec
 2025 09:59:32 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sat, 20 Dec
 2025 09:59:31 -0600
Received: from xhdharshj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sat, 20 Dec 2025 07:59:28 -0800
From: Harsh Jain <h.jain@amd.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<mounika.botcha@amd.com>, <sarat.chand.savitala@amd.com>,
	<michal.simek@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<jay.buddhabhatti@amd.com>
CC: Harsh Jain <h.jain@amd.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 04/14] dt-bindings: crypto: Mark zynqmp-aes as Deprecated
Date: Sat, 20 Dec 2025 21:28:55 +0530
Message-ID: <20251220155905.346790-5-h.jain@amd.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251220155905.346790-1-h.jain@amd.com>
References: <20251220155905.346790-1-h.jain@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|PH7PR12MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a1b26c9-8ad2-4d89-5158-08de3fe0c42b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+kKXox4kpDmTqeIHt2G2PJ+5tSW6jNwnabi7WNv+nYR6pulGZF6t4RfWVNuf?=
 =?us-ascii?Q?5HPNv2atjeSNYmvFzlzwile1lz8wf6bZV9JFZt6jvVhcGgBK8lPEBoHLnhyF?=
 =?us-ascii?Q?nTJg8cBDkMJU3Ci2Mg1+Q/kETl2vadIl4lWUsPs3xzjUiOjgBhSyrAOui3Yt?=
 =?us-ascii?Q?IZ9r34Rw6vg1Z/mz1aHu42JvtLjMBOiL2oNEp5zYMoNgyNf1OfRtZ36XEnyW?=
 =?us-ascii?Q?oUt1EPM4pcwG4DNg3mkDf8+oH+YVQX+NWh9wvnNprpM7M/h6WTw1Lp1Gu4Uc?=
 =?us-ascii?Q?4GMRcyqAsD+jfeGnxd2wpKlrQ1UF9Xwx+dxv2FD5B9IY49I+5D0uf6Wk6Pi4?=
 =?us-ascii?Q?OsK7wnl3REGfBF/z32oYqd0NWJIpHMm5zIeREAm9Hdiw940gCw+mzPyrGcmf?=
 =?us-ascii?Q?jM+b+5U16mzC85IGiy7fy+zJi1K5DNAj9TITrHBRDFHrSwBfsrzlWE383UR3?=
 =?us-ascii?Q?+g/xLjzxOoiCcd+yA2ymSBSRrrNGktykqeotPVCQcrALJTktKzHUAaps4G8Q?=
 =?us-ascii?Q?b0cWPelsbFRLBBL97TBylHJkuh908tixj3ehnOyVZEN1MNHWU9FGpBYM+gSv?=
 =?us-ascii?Q?ORUxtDgj+p9L0pRCreXJO2LJ9Jg65CZaaPvlYMu+B+6uWKijPXXqeX/n0LzR?=
 =?us-ascii?Q?npDNh1taPI7gMOp0QBL3XoDo/IeLaal7ySPsYQDm6sVwIGzDev/2/M+w3hKq?=
 =?us-ascii?Q?/FSwFix7dZakiN2gGWthCMFH32479rA6PtMMD580XMaxTsFmd5167gJ8Gyir?=
 =?us-ascii?Q?XCde7XkMGikIliV7aMZ2iWP4iwMer7FEfM3YazPT7R9BOLLDbyPY0Gy9x5tO?=
 =?us-ascii?Q?M4IhJtTIA6b4OnVE9cMlmtftTaoDkxPptNFAheDeg75VeU379nQXFBgjh6Dn?=
 =?us-ascii?Q?nPHR6CcL+rgGbYlalNwqdnZn6hFZD3nK39Wv5d3A6/3dL7cKfrapZyZ//m6W?=
 =?us-ascii?Q?JGJcCDdihZdLXnhbuH18LCit8OGZ+AQKa9HG1pP+LRN2Pp2eilmt1vC9oRz6?=
 =?us-ascii?Q?Js0i1XUAplMR8PTIgHNqvGXgSWHs1RGnHRHsfOvk2C7YsRgE9ob2qGRmhA8/?=
 =?us-ascii?Q?7k2DuFeJVeXwjgvoVENjMckrxiplr1XNw9c3ROxUd6RT2u8k9dIduREEtnv2?=
 =?us-ascii?Q?28K8PSYCCJbVxjf1KEeyFI+3j6hndZgz9mwIjjc8ah89fDuzCVtIDhMwr7CB?=
 =?us-ascii?Q?y3Y4T1UF1ApA642KXAmgNTflh8576+upYO0kee/8xWoPnZMK0LcyIwJMnn/N?=
 =?us-ascii?Q?SHI5erHwo9BF+l8wbA/TVxnw2YslaxN+neU9m+Nulmdc/YBs/xlkydC7ZHOx?=
 =?us-ascii?Q?IOV07OF9brBnyhsrVRS2Gq7Q8sdKg15Jm7phzjWxwehWWNTmUDCePId17UD3?=
 =?us-ascii?Q?W4KHlRvrfIgRQC0k4fZELAYkyDFsK9+z3wMnVDoubcDCPk2uraperoDxoG5I?=
 =?us-ascii?Q?bBBsYvo1qelDfklZKamSihINvsWNb3JqR4YnsLHrqEKPF2V/jmV8H6FE5kwq?=
 =?us-ascii?Q?eOifggxmJ1FXrr4kz/MavA4YQOfH36tICOsnzPUs4FISoCSd6I1EbbUWRlfb?=
 =?us-ascii?Q?U6nAqXejaAv2RWApTZ6y6jXqKnDCVKUwlmL7M0vP?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2025 15:59:32.8711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1b26c9-8ad2-4d89-5158-08de3fe0c42b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_075944_795664_E955BCF7 
X-CRM114-Status: UNSURE (   8.84  )
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

zynqmp-aes-gcm updated to self discover, corresponding dt binding
can be mark deprecated.

Signed-off-by: Harsh Jain <h.jain@amd.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/crypto/xlnx,zynqmp-aes.yaml   | 2 ++
 .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml          | 1 +
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/xlnx,zynqmp-aes.yaml b/Documentation/devicetree/bindings/crypto/xlnx,zynqmp-aes.yaml
index 8aead97a585b..20134d1d0f49 100644
--- a/Documentation/devicetree/bindings/crypto/xlnx,zynqmp-aes.yaml
+++ b/Documentation/devicetree/bindings/crypto/xlnx,zynqmp-aes.yaml
@@ -14,6 +14,8 @@ description: |
   The ZynqMP AES-GCM hardened cryptographic accelerator is used to
   encrypt or decrypt the data with provided key and initialization vector.
 
+deprecated: true
+
 properties:
   compatible:
     const: xlnx,zynqmp-aes
diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
index ab8f32c440df..9b6066c7ffe4 100644
--- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
+++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
@@ -104,6 +104,7 @@ properties:
       used to encrypt or decrypt the data with provided key and initialization
       vector.
     type: object
+    deprecated: true
 
 required:
   - compatible
-- 
2.49.1


