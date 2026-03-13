Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A229F105F79D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 11:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4pxR76JMOqIQBEMiXt7xgkvKZiqrBwwZ0oEQFjBAmk=; b=r+s6kStv2yJ8DLJOuS7vofSTe/
	smB6F3Bz4A4uPFxhbvBhavr5zPAjQYgN4kZlMeqT4p+EV13fo4Xla1nE3ycC7jRv4wslW1r9SXiQO
	o+jRNykKz0HG+RCtWq6VdKGS6BPMAbDZ712gm9lGlOGCtCXc94KEZvdX9M4ZMOTzgdm0aoWVjOf1Q
	Iqq/HstELIfXaCDlzmKhXdEsVsMnUuM9u3SGl1Xc/o4gVanehff9/fzImKQ4Ek+Vlx9McCVFthfGQ
	39r4IgcRPMQZU6AvHE4BDR7sKLlKIfyKhIap2jKGO861iiQnyo1C3StpVQBSabHO2qaQctNOfmXX3
	Riw+SE1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w111D-000000003gB-43fS;
	Fri, 13 Mar 2026 11:49:27 +0000
Received: from mail-japaneastazon11022138.outbound.protection.outlook.com ([52.101.126.138] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w111A-000000003eu-18Ku
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 11:49:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=webGxCfzsDEi+UgvOYjK9aYRdAoU5XjJBDmajb5k3cHhBWGaNAIblzvm9EjyAtONZfs/G1bSLfLlfb3jetPhr0u6YfqeyxjL9DNKDz3B0yjU9nmEA74WTD9P4xUpBP7hT/Tlt8eaqo4lzqogyezCzKYScg113aMwnh9tTtvvLiv3ftlfmyDg4phhEVgRS7cEnhD1QNfFQJjecGay6PwISQIIpWfFOtXDQApHsM2TekKq5LN6wnXhXYQqcsI2eX33w8kt2Yz1GInWnsIxmUrf+0CECK5/OQpPeurqf/ZLzuXOE2DYpKrWTqfP2Cs+GJigV/UDwj1jFX9b1nVbGjFMYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4pxR76JMOqIQBEMiXt7xgkvKZiqrBwwZ0oEQFjBAmk=;
 b=AhgUtvwQSp72VomGLLRcmwCoO19hPNrU/MEgDBTJFjPrxfua5C1bYM4NXF0gel5ERUxCJ2jw2A3ouErv35PoKnE/9+1lXmj+t9gxH+YRRDYc/0KPxxA5v+rMu9IXqc/5p0Us8fao4c9NQwBZgq4qC0PVNj4xyNuJ4T0Z9+JB6mF4yGBy5oA8FjQChp17zBbd60ejRtWfo/fCSzVAa8gGWkOolwHrgz3pHcapmuJ1BP3e0iscOto5dj2pTlTk/xbt6pwVHjDzwf45u6p86nyMhR8D4csiTY2R7rYzhIYxtq92BYPCM5KRyTtO1zvdgMum80GGj0gDTKmsBUYxNIOnDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP301CA0029.JPNP301.PROD.OUTLOOK.COM (2603:1096:400:381::15)
 by SEZPR06MB5000.apcprd06.prod.outlook.com (2603:1096:101:48::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 11:49:17 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:400:381:cafe::3b) by TYCP301CA0029.outlook.office365.com
 (2603:1096:400:381::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.30 via Frontend Transport; Fri,
 13 Mar 2026 11:49:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 11:49:16 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 0A1A740A5BD8;
	Fri, 13 Mar 2026 19:49:15 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.chen@cixtech.com
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v4 1/2] dt-bindings: PCI: cix,sky1-pcie-host: Add power-domains
Date: Fri, 13 Mar 2026 19:49:13 +0800
Message-ID: <20260313114914.1564115-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260313114914.1564115-1-gary.yang@cixtech.com>
References: <20260313114914.1564115-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|SEZPR06MB5000:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6bc40ccf-9578-43b1-cd91-08de80f68e4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: k6XQPeG+w8wAJSf1eIHI4xviWUvfvlwV5tNcYZxelkY/3TUmCVBPWQNuqdiik3pbfTDIBc+MS/QEAamqi3IuYKneF0FCxKNye8o6cMykAGFwVrcvfdKQ/WNMzfxEXBEj45/1eMqCANSHqhWIxXQKvqwWxqJ3xwhFUOiz4uxoud7PnlZa6PxzCuSHpyVYw+ju3gkSFbAx+DHd4mQ9HdtTslLMmikjgpao1GEOmBX3PMfkxGJHLg1Vmg8dh3lFZYvpWvv5WpavayhNyqaX9CwG559Jwd0C10i3TBNEcN8fi+7w+jQ64cF8O6zgZGV3kJQUQpKkuCZCSkPtqX9Bh5FwQIrj57jFAGDMHqMGqSDkRzMVFgGQwbTYK1qakp2iTlPdDphIuQOFLb3SjoWZN37baCPmfRwhwWHuUFb5owKR1QrRMyHH7fUKd2CSIA3WbU4maeAM9OaSHOugRiUO5gsTaYqULRdhzbVqw9K4YEAMxZN4WVmKvLUGIlK78Nut5RomdTPD3caBwUlP7AvzSAN7ZBddXBF45EaGcEtSOfxA3F7bO8A72TjMAISDF2z8FKU72WAtI+dlNBVzrlFfMib7T8imu1aLuxJ43zp5eFFtmcM45Ua58yfVxEdq+/R4LsqjNBRqsk7oS8WzviBolPEwLtm9Kl0IR3PDrmUzlPTOPBsl5mmbSx3ML4Cgzt1cgrDKm8kGJ3TXohLiXD6MbPT8r4m26HXha1ijWXWth7nL5WwR/iYQ5Uv3LsULl7drvsoXbciQoTVUip9SdfiuyOtjdA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Lv8kwz+kcDf0aLSC6tRx38WRfsb8nTmIYy+t2FsJdcLi3sVLxhes9tUNcsdGM1xAot1qn2chS70tJ3CGIJYqpwMjhy+e4XRs137lBni4BpSAcodTrqh9xf6LUBlCSRpoEfU29I2aVEl2ebqzqUUzMaDA2TJLhse2Djeqa06S7wQOgf69AX+XbeUgXz++2xatqYn4/PuKrui1yj8iCzAMN/pEjbQZW4P0dmDEvJdCX7rNz8JwVuctduyixjC0y6RTiVsZY8oAOfiLHbGUjqKwm0j8MesuqQg5QA+qzGYGwOWLFjaEVoefpdhcAlDCjGGbiZqqxY61gtlDv8dN5Tl6HKzz34ZN0Q/liE0VFVnRIQPuC8U575iRRlKVhX/Q7YZdR0UYJEr0XNXVn7/6ZOffAG7MBWJbUxE/0oU1YjuFLIq19SgoPf6CmszbxGSqKZ25
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 11:49:16.3913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc40ccf-9578-43b1-cd91-08de80f68e4f
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_044924_314666_B45D672A 
X-CRM114-Status: UNSURE (   7.79  )
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

The Sky1 PCIe controller resides in a dedicated power domain managed
via SCMI. Add the power-domains property to the binding to allow
describing this dependency.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 Documentation/devicetree/bindings/pci/cix,sky1-pcie-host.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/cix,sky1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/cix,sky1-pcie-host.yaml
index b910a42e0843..d55d165f1e94 100644
--- a/Documentation/devicetree/bindings/pci/cix,sky1-pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/cix,sky1-pcie-host.yaml
@@ -38,6 +38,9 @@ properties:
   ranges:
     maxItems: 3
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - ranges
-- 
2.49.0


