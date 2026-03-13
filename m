Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586C8106FD82
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 06:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjYX+W97cRDDa2kO+CrUbS9Up1wd9PYuT7fIp0yZtSk=; b=a9Zon6hKDdh2fezvTtKz0o6kju
	8itMoyAV7PhN9ripuk3MPd4U6MXXcm4n2zwK5j4EI34UO8/sWo4nBlE82oS5upIbMWPLgt+ZGitoZ
	lAqmRTZBik6wc8Wdeidgh/XiUl2kQZ9vTJg5o0WE7kfJHhB48CBp7bJTR8la3JwJEeZf4aOpyo25U
	JJWSHPfvW7yWd07WPN/gbBCrwnIqQxPmsAiPiBTHtVjH6ApTT+dCaGDMvakkoC4op6TXD9/e6ogXy
	yWLjUf3CTrFi4N4TvNQ98l6H3FjkMquaqR/pDiLkdqm/sqe9RXpemo5rioo5tWBYr1rv9ac/XdOoE
	psaz1e5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vcE-0000000Gio1-2WB5;
	Fri, 13 Mar 2026 06:03:19 +0000
Received: from mail-japaneastazon11023138.outbound.protection.outlook.com ([52.101.127.138] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vcB-0000000Gimj-3j7G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 06:03:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYOGaojCNLQCz0UtKdT2VOIcOHyApObU+cAK95xeZYyhvB3IGunp6IzgA2wnbGqhsrgwrpVOjyXlvmH42l6J5MaRYlauKTIH4BPgiYE8l6fOMPvWjgeBZvH8gT3uPenCvYEvdnHhE0hq+W5SxeUloyNjaOk0mnrAAR9ToduHP5luVIoFXKKq0A1qtFXEo3aHYUpGpRN7G524BmXNWkzs6qCrldyQCghwExiggZ1iiInL8ARKt6h6jQpH0/ap4KkWgrqjwULZubVsg5QBZXF0y7vPvmrjNw9SFd2DTQwIhLX3y2RiNnZ06ZLYUNq51UfT5MDdp95xw0YcM0b7ldxbzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjYX+W97cRDDa2kO+CrUbS9Up1wd9PYuT7fIp0yZtSk=;
 b=VC7jWb15j/zyciJfWjjUbSH+p1cFJvOFuqs9SnwrRhd8owSWXpN7/EA1OKlXPLUI7Na3npRoVRDRwAHz/EkQBVT7lshq5YvZ7bu2jdNH+Tobr+JCZiEbxcLl/O5oZBvK6Q/I48qbf/c1FQ/RFaOndXaJPJlzV/SwkZaCpd9tn6w9NgRAIXB0HUSqXrYC4y7wYcTpH1zTZUvGJXmgMEFt9dE9T1U0tcv3RRWyDuGIDJZ6dyIUvDPuvMb1s75k50kA4b9pvqV+U+z9dcw/+HtwFC4547Q2r8P9D2j6VQh5GphMwYhAKRYSYEGgreRYGNZgbNcMavVStc1iiRnQcFrqPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS7PR01CA0270.jpnprd01.prod.outlook.com (2603:1096:604:255::9)
 by OSNPR06MB8468.apcprd06.prod.outlook.com (2603:1096:604:487::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 06:03:10 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:604:255:cafe::bf) by OS7PR01CA0270.outlook.office365.com
 (2603:1096:604:255::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.29 via Frontend Transport; Fri,
 13 Mar 2026 06:03:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 06:03:09 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id ADAC24126F8C;
	Fri, 13 Mar 2026 14:03:08 +0800 (CST)
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
Subject: [PATCH v3 1/2] dt-bindings: PCI: cix,sky1-pcie-host: Add power-domains
Date: Fri, 13 Mar 2026 14:03:07 +0800
Message-ID: <20260313060308.1300518-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260313060308.1300518-1-gary.yang@cixtech.com>
References: <20260313060308.1300518-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|OSNPR06MB8468:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 46aa8b3c-704b-4311-5b6a-08de80c6341d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: eJijjM1XmYNZ1tMHd/Hj9DVj6JFDxQ4lHLTQteddAwazLHgccPHqc43Q4fHXA0xxm1C7kbSFNeCxZkkTGvAxldyw8yzFwXTkEnOq/RtE+/Nc7jBrhUFXyiXI3Zq3d/pdbsn4Sm+BFcMh4XWwLClnUrynC3Re0BqPks18iwwPpdwIDfGPaGx1OXFV0VZkiSFUiA1TRYOXGyVrBxBgywPqcrT99jusODdxbuvLSlp9m8atOZnkR5VDNomITy73YJJ1iaHeqM9kC0M+kupxqN/2HSjG6vFzKOxH1vgvE1Q8swRBREwQYoTV9/c/IFY11pLJc2oLb8lCB5IdEqxvqkveA3Iyb4Vf+NroLkc9KSgs7hZ1ZrtWNOALrmjFln2bBL27ofiFlGOeTr73xUFez9TRXOsZh5M9l2Zx/G5zyJrPQI3N51DidTt306fDLXYT/8Si41iuPawgsGPcnJuObX99WD+nJxswdZPbbCd9xleF4uF++KpE2hCKKkzVsj8+olQyYD/zaIALrZzGQUH1DPl3uTzZJtZYP4dj2rTRoB/MNMyQ5xoHemAuxxjh1QXqQIbbLynOOHK/PPM5LOjOvh1zErxzTYaQNPmIAuY/G0nsk2oDJMI2ZDaIVE9mXbol1zX1dLori0NascghI4RIOdvYtLM5HVaMzIxtRBOBmbfsixe3d1roPS4KlRIrRIU4M3fRhLmVEpLYjPnWKlqw+b9Y3VT6wUlWVGGE8QA+JsdZB8Q3NiAz6WCbnL/bmB3VhivzGrHCF7lPGQxx5WBUZJO2OA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4j79iUDLr7mtBqtcwCXvbBrU6rWNCdCQZvu0ksw4++H4bUpfTrPv1tMEU5CYoQfWB/5QXop8v7/QztGlAlUwXsU/91V/C6P789WB9UobLQsnwMCralymTlVWpJdEK0roRMxXE9sI8CENX46ogEjwIKV4DwxlsbUIqzQsIUvDXFTB08sYII1lbFcoJ5JszkrAhhuO1NETTdN21C6YTe6GmQOnerHz8JB+cObvYZ4wckABOgcnV1a5QY2JUn6QX7S84+lQrpI6MInOSKIrbKl9iZyPl6Rq/EfiMro+K72IB/YXcPtY2PtFDcMdVx8F8QeXmRrMahir5pOG0gBJfaZny6VCLDnPHft7b4po83FSW5cXMTWJSEIZnvLLhuiMLWGBe0TbUSbXDvgG5UBCc5TlegdovAqf90+tNVor/yAOfT/qiuDjFxOWCQYfKMQURz6z
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 06:03:09.4096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46aa8b3c-704b-4311-5b6a-08de80c6341d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB8468
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_230315_926125_73B0FA9D 
X-CRM114-Status: UNSURE (   7.41  )
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

add power-domains and power-domain-names property

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 .../devicetree/bindings/pci/cix,sky1-pcie-host.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/cix,sky1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/cix,sky1-pcie-host.yaml
index b910a42e0843..6f194319be52 100644
--- a/Documentation/devicetree/bindings/pci/cix,sky1-pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/cix,sky1-pcie-host.yaml
@@ -38,6 +38,12 @@ properties:
   ranges:
     maxItems: 3
 
+  power-domains:
+    maxItems: 1
+
+  power-domain-names:
+    maxItems: 1
+
 required:
   - compatible
   - ranges
-- 
2.49.0


