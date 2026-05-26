Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741B7CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 23:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zPK4eqo3sZctgPG5SRAOE+TZZKYTO4LbS4Ma8cPCEA=; b=U12dB2LMiH+AWQbef2jnyY5H6a
	6wdcSA9b+QwAA1VAFkWmy0r072Hzf111L2MkwBT4VKseLUwUAWsnimyRDBcIc76Wl/WLybxgQvyDT
	Z+PPIuIl9UD9ca/iyeWMQMPgQJPCBdoAOr4R33eJQqQwaiYpn+uxabNUHdfR2fSyI4roOZ7xj7Un1
	D8nfa6KgeQlPNHlUJMer/v93V6TwKHgG1ZIP5heFLRkn6ebEjpogda6rcel0LRjWYh6p4pv9i2qNs
	BI5UY+yszMl8AOQ19BCtZEcj3lncXD8Mk7uXlSYlLVqVRd7R5Cd9FKazVCujhGjMDP1UqK9xBul5W
	NG8MSoxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS1bP-0000000345p-3YnF;
	Tue, 26 May 2026 23:54:27 +0000
Received: from mail-eastus2azon11010049.outbound.protection.outlook.com ([52.101.56.49] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS1bM-00000003458-3NDf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 23:54:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFyBfS8uz/T/0eA37nVPksArd/KWCWheN3Y5gFcp1kbJzEDHrgihTLnNWxe8C8f3wY3w4tl4cS3Um28CXvP1FiK9xzZm7zGuz5KxiCnQviD11RyGcnLWld+F0UcwuNPWC+7V4A4WGnRxqKbS0hOtijtO5XXC41hoGvCjVD+biDtggEGiXi4nbU0/mxA4r4PuCAd978ipiZxWV/+mzTOXkbfJmCB7ncy1KAjyKVDpvv2p5wFVU10QnOlq8DbCfrp0dRO3MdQyOYbGTdTvO+IyVjd7Y5x2qQH1xs38+7Sfmb9hNavD4YmRvl1zkFD9mx+sHWdjmOadeHQ/MLbZhZ+Ztg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zPK4eqo3sZctgPG5SRAOE+TZZKYTO4LbS4Ma8cPCEA=;
 b=ugSVAkbSy1t/6Qj74G5ok6ImL+Tgus73bp5QOofNfTVZh8dv0//RzMRsDu6lgxva3STTUna+2vjiKmeRWR8SB0bd5+c1+o99IVtf7MMP3j3IXFV/t1JY0K+VywNnAjOLIISmrtNmhc9x9acp3KOAWnvGApVFolm/6HIDh4zFrqMwkeVcPI36r7+50dl1O/Aoxk7dqMs1auoeylsks6PR5C2nDPOlimfa5UZsWylFNYy/jWzV6Kpof5Wnzknt92dLkBuoGp45B6+32SxyShC5bzUoQVc+6Sh9JBzTxIRmstfisphf9Tb4NCPmgR2Dw7bW2HGzPKoDJK5c/oUMbWBJBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=microchip.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zPK4eqo3sZctgPG5SRAOE+TZZKYTO4LbS4Ma8cPCEA=;
 b=DKzwoFOEipq1uBr23igA9cOyHv8Oc4dzu0sbNtpDXcG8T323Yy5DGSNxA9eZH7y7OCTvIj9cONYObFmNWmtHYD7nGHn+v1vLMtZFTvHWpeApOPuq2Z3S2g2DK7RYyKEor8KUvCFnkCfCtW1ox+Nb6iV+5u05OfgS0xFxxECjU5Q=
Received: from PH7PR02CA0026.namprd02.prod.outlook.com (2603:10b6:510:33d::35)
 by DM3PR10MB7928.namprd10.prod.outlook.com (2603:10b6:0:44::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.11; Tue, 26 May 2026 23:54:20 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:510:33d:cafe::59) by PH7PR02CA0026.outlook.office365.com
 (2603:10b6:510:33d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Tue, 26
 May 2026 23:54:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 23:54:18 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 18:54:18 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 18:54:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 26 May 2026 18:54:17 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64QNsHIQ1896232;
	Tue, 26 May 2026 18:54:17 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>, Jason Kridner <jkridner@gmail.com>, Robert Nelson
	<robertcnelson@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/3] dt-bindings: arm: ti: Add am62l3-beaglebadge
Date: Tue, 26 May 2026 18:54:15 -0500
Message-ID: <20260526235417.1326187-2-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526235417.1326187-1-jm@ti.com>
References: <20260526235417.1326187-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|DM3PR10MB7928:EE_
X-MS-Office365-Filtering-Correlation-Id: c1bd5593-782f-4d6c-2a83-08debb8219bc
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|7416014|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: MCM5eVDB2FjXY3OMAXWk3Ylp0FbDGo1BdZFf4YyUIaRIKxEN2JIFz525FJbdfLTP7BB7dHPXaWsr3V7CqcfeLLIhD8FO4ynBAW6Hfqs5+8cvax9+slBdOvI3ymrrZnEWRPlZ2u9pq/FGiIYJW6IjOqal+xrV64oh7IACo21VQmM44wJy/YknIH2qz0nSHeYCXaWvRSU9w9Th+fN7Sj4ai2t1b57cQGXfvVsFdCJvcO6NozRAJCSkXuiq65ziqhNZv6VSxxMIu6cbM7FLD+wBusc4u5z1usyFc2oTpEpt+j4I6eVFizv5GJEGabx6bOKy7IXQtEpw8wUVOsqN3CNaONNtTTGPRQJqPcINQ4SkBNKMbAQdW9bjgcrdWKCU40betV4KJxxkjmp1DMAiNKLWGOpD1UUI7NVFY279OYdPD9eseq5JXvRY+/d2o6VHqrs9Yb2VjD2QTq8EWu4CznwS8h3/cMTGMt18ME0vqftefphkROv+sS/wEPn3PnVN0IhySKS4e089n+GkcV6LlxY62c1tiVQrh7dIFH2qg6xr3fRzeq+QTtE9Nd847Z6pLbnOZrewImSG6pu2n/OmDJyGjP+xpfzV6fjN7HfhryQBOPSq/aZ+tMCv3P5rbe4Gh6gm9cNXLnkWBWCg/9SlBVmx+BwuYlPdjPpZHtjijde/coQrZJ3OwLD52YKDwFCAD40D
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NYLJycGJqZK70CxQMiBv/3JnoACjG+ReDz35Pigm3r4bK1a6w1odweYcch5GNpIHcGaUU7o1J8GcEzakXstCCMKavFBl+pYL97y9oH4oDk0kVotDklONF7qs4+M3BtzwIjfYlqj3qGz9h9OmwH/Yz+wqoi1VAI6qC3JPptwW6MDPRZmpvx3aelEATzu/FXoQuEaxoMhE5T3olB0yaDzVJTsai9hzdiw/opG2wZUVB+nXTISeRCa4aBCjNtsGvwFMJYCbRo2+Hh5tdV1qHiwbiI+b99DvD43Rw7TXdvcAQzHhObzf0yQeTzCbDsiFZFgkirjbsz1mxWBcDLZAMR9c1uyZXntHjQIKsQye/SZYTldSj76Kq0mx/N6pUdi4+my/N/R1yw0VLMW2O7pOkq6PicghaYxr/0hzLl4/Z/FB2W1IbqE2WN3PdZP6HnAwP5Fi
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 23:54:18.4226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1bd5593-782f-4d6c-2a83-08debb8219bc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7928
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_165424_970696_1821F700 
X-CRM114-Status: UNSURE (   8.13  )
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

This board is based on ti,am62l3.

https://www.beagleboard.org/boards/beaglebadge

Signed-off-by: Judith Mendez <jm@ti.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changelog since v4:
- Canonical URL fixed
- Pickup Conor's review tag
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 2a6a9441c23de..d9cd3fb712fdd 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -40,6 +40,7 @@ properties:
       - description: K3 AM62L3 SoC and Boards
         items:
           - enum:
+              - beagle,am62l3-beaglebadge
               - ti,am62l3-evm
           - const: ti,am62l3
 
-- 
2.54.0


