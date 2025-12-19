Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89E0D74976
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 09:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5hV3Um3duVFZF3GZJmajALStrp1TQh/M+816wJSKKg=; b=1qA7HimFVbIhEX+O7rkteEXVBK
	D9z7c37NFihIiBJna698G2yraAxzyBzifF62by30tRbAlk0YDGkqGXU1Fz4/Z2YazJ+rQ3MzKfblX
	H2dJgonQ7AkjXnkhoQj6l/Q9MsGSfcuu8y0VQ8bPDtqwtSCBZwBgatYkMQr7YEyBoHFSWs2nO3zS8
	lWPtiNWNXjuG68tEDCEnrB2hqWMjt2HteLMVb2IZa5vGNYTGsVUGa5JQuObbkD0N3dnvO+7GOsmDF
	ZnfaFqfrlD6F5OCsJxqg6Rf0Lf1O/KloDNwqA33hS1TM/TioBhq6l807rYLWNSJlJczv0DkxDvZK8
	LSuBjtRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXBs-00000009zFc-3lRl;
	Fri, 19 Dec 2025 09:54:28 +0000
Received: from mail-koreacentralazon11023080.outbound.protection.outlook.com ([40.107.44.80] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXBl-00000009zBc-2wrY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:54:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0YfjYWa+sfP10NYSQW0mr5gFF5hJphQfrU2RMneJZJtbgOeIJ3QAAq9Y4IQGNsJd9Zy4hPxq1kkcZNNo+qqv4ZmNllUYdKXokTES5D2V1Sgjzvi8WSgi4c7KQN7tUmlzonvLxYqFJUDj3l0CX/2X7b2hY3aC6lVBesMol5yVL5KTFLyqjrz4gZfBI3CxEEg6+NQ+b73FUXbzKVD2rfmnQWzA8UAA69yaNSZVZlFNAR9k7O/MP9zl3qDhf+Y0uX8rpeMX1kV5IVS0OBg5l9VosTOoWa5ayrXEnk0qH2shd70w30bGqo1fOiaMqugo40MuIT8PPvckUqqJtbXGvPi8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5hV3Um3duVFZF3GZJmajALStrp1TQh/M+816wJSKKg=;
 b=HBrpLWHUt+M/OkGDmpNOKpReMUpJtfbE+ym+y5wpab0hsjJgrrEf1hAsD0FEU1clQUgBXs6ji7ux+EkfDa6FU8YkqlWNqOaO+3ygpcgWENnG+bsgH4KOgkhmp0ITsfd0nUmT9qQmwUI+OFZBFVt1+IGnOfNSj77yOsdQqtZUJOrz+EkctmDAUfKPf+NyD4zQQdzIW83o1+zpykT+x3tMyo6SRzOlux57vN0FiuyyCcUwkF1O8Vg1BJiP5+IOGJAA+hefellF0U0q7ranPm/yQKNyBZgk7TPvyqeADhI978Ef0xbiQEpjYZjnGDhnSuDDxJh4F6GZhQDwj8suGqH+Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:300:2d::20) by TYUPR06MB6195.apcprd06.prod.outlook.com
 (2603:1096:400:352::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 09:54:12 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:300:2d:cafe::87) by PS2PR01CA0008.outlook.office365.com
 (2603:1096:300:2d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Fri,
 19 Dec 2025 09:53:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 09:54:10 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B9EA441C0A01;
	Fri, 19 Dec 2025 17:54:09 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v1 1/2] dt-bindings: arm: cix: add OrangePi 6 Plus board
Date: Fri, 19 Dec 2025 17:54:08 +0800
Message-ID: <20251219095409.1395587-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251219095409.1395587-1-gary.yang@cixtech.com>
References: <20251219095409.1395587-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|TYUPR06MB6195:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 31561b31-2f7d-4a74-c951-08de3ee48f45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?leHGrQajANx7nG6DxCestv0//B/fqj9OpIU/ttfVmbf4h0eFcVKAIhDdGYJs?=
 =?us-ascii?Q?Pb3JaG4SioMoQxV8l6AkhUOuVZ+aFExSNZy9PROIjG20KJZA+PiDBRUgv10j?=
 =?us-ascii?Q?sPkHe+Yp2xNRUIvsKL7q7HOvgLbSnJoAmIuTw3wPm/dHtniluMygjfztnOiS?=
 =?us-ascii?Q?6/4u3F2gPA+RCyqcyZ0QH9ER+OBC0ruAPolvHdpGj+ssuMzLkYKFK3BfyEPV?=
 =?us-ascii?Q?NjqtdX6EiE6515NEycwo1HfqbjyEQBSVqSBpLtA4NTyrZk5nnkQSTqu81yXB?=
 =?us-ascii?Q?BNnuFWK65a/xCD0cO7hY3v20zhfNlT83MdljeWu1hkIiqDDVA84yhtDV91ud?=
 =?us-ascii?Q?v6bpi45nUyGLdRKttdNq1poC6HBUGYjrGsQ5h8gvZMIYQD5Hl6pt0MICVfCW?=
 =?us-ascii?Q?F0G5LLdyDefs7N9074HEhqrXX7z0Fph7k619swyD7fkcT5j83vWAWIjvYb5E?=
 =?us-ascii?Q?k+YY+bf6xwy05iEwQggFYthTaJObVmC5T0JySsS/3wKdaufgX8UBkZYdCA21?=
 =?us-ascii?Q?XcWPVEYnJ2+zXc0HlayD+BSVgJ7xZwNQVJNFEdNOa4ccQ62xl2ykhZEHOl75?=
 =?us-ascii?Q?yKSQR5fC4Y5tZUmfVgd5oyCLZ6uhZ0o4OX6lqRNLcw6brnjOhQsl1SGYyplh?=
 =?us-ascii?Q?5uL//ZQ1UUfli+wjtNwdW7iS/6OPxn0TQ4q583CXuXQgtYTn/16tjsj+yADA?=
 =?us-ascii?Q?H9ErTPDu28/gfiAUJ9OukbG/zoBb2zRqh853VRcrEsQjMJIlSIMGfiUiHuvL?=
 =?us-ascii?Q?YITkLzeVyvZKDFTHmYNlwxeNMG6CgyWS9Pl/p+MvHns/Tc+mGSEmTt3W1rBX?=
 =?us-ascii?Q?B9LFMK07KHoOZRZcW5UkCPvHCpIFUxy2opADINfoFKaewPUUx6XXb/7IXP5m?=
 =?us-ascii?Q?Wr9+FOFW8ORqM7q3boBZhYt4frfF1v+uLKHXHYlhqJM5134rZ6plPIpJo7id?=
 =?us-ascii?Q?jRcjBY2+ftkJGGrGGtyJtxFP2RUYzysZDUBnzHeoN6c5cN52boq+1sjjrv/q?=
 =?us-ascii?Q?iQl9BusB3mCIJOjUI+UnUDIBJsV1fSXiiNThbVacMER2+PtxsQE5KwoFd7Cw?=
 =?us-ascii?Q?AjLPyoDxdjot0hhIUN0iLLAJy66vDd+iclTFCmxQAHCkBg1cTAKW5OO11dSG?=
 =?us-ascii?Q?S6O8a96XJrOiyXBGt51DHxLFeNfgsw0sACmDYrttcl1jtKXlmlQAq+8RClwT?=
 =?us-ascii?Q?dpebnCcBbvYbcMD4u98LZHDtYIZSi9fiL3DTH0W/6P1RLA1/XVICgY+fnrbA?=
 =?us-ascii?Q?qdaIo60eQ6IzHi2uDyS8SOwkYk2JLtobaQZxmGx7zkaRdc7hogg8LRFemXuA?=
 =?us-ascii?Q?X7OJkurg+boMNc9Be+l7VHxDIQhgdWmgtkEspp4BEivVxlPMHlT058392zg3?=
 =?us-ascii?Q?V/gntyuWJlnJoOqra6ob+2VstW0W5KSkexRqLCOLf0FakwL4V1qsA/pLHY4Q?=
 =?us-ascii?Q?WduO/ft+XIvufB3Os0qvHkda5hps55HUatXzHh76CfKXBHJBWWjWTiLOAbTn?=
 =?us-ascii?Q?sXEv4nYNzHawxgFSHAQQfdB4BGP2FJGNXESUyd3zIRhhyySKMHhWrhMqy3PR?=
 =?us-ascii?Q?AiptcX0yyVBC3VJe37Y=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 09:54:10.6060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31561b31-2f7d-4a74-c951-08de3ee48f45
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_015421_739782_E352636F 
X-CRM114-Status: UNSURE (   7.15  )
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

OrangePi 6 Plus adopts CIX CD8180/CD8160 SoC,
built-in 12-core 64-bit processor + NPU processor,
integrated graphics processor, equipped with 16GB/32GB/64GB
LPDDR5, and provides two M.2 KEY-M interfaces 2280 for NVMe SSD,
as well as SPI FLASH and TF slots to meet the needs of fast
read/write and high-capacity storage;

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 Documentation/devicetree/bindings/arm/cix.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cix.yaml b/Documentation/devicetree/bindings/arm/cix.yaml
index 114dab4bc4d2..92fb4ad7b5d8 100644
--- a/Documentation/devicetree/bindings/arm/cix.yaml
+++ b/Documentation/devicetree/bindings/arm/cix.yaml
@@ -21,6 +21,11 @@ properties:
           - const: radxa,orion-o6
           - const: cix,sky1
 
+      - description: OrangePi 6 Plus
+        items:
+          - const: OrangePi,6p
+          - const: cix,sky1
+
 additionalProperties: true
 
 ...
-- 
2.49.0


