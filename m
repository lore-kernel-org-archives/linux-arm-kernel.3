Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2331AC369B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 07:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVpSZdDFsCHY8ZMtKH5F1+nDRJuSrIJos7FNpfoAwZg=; b=Z0ZdldKDm+xck733F47dR6x/yH
	NALTaZnM3IAirpwVC5Skv9xrERhW0jyk+1+ek41KfyxgW3d5uzzl60VAMwPgBiXdnkxXNiwBcJNG1
	jDXFGBC1QWVMKnC0KOfxJsbHSmBv028Gf32sMrrCu8pqwdFuRZld9WNNs/kMtCwEhjwyLxeXeFYJf
	UNRvlbG8p6otTunqZoDzuH4D3slVIfxkg+Ht4xAhOcMdMte5dCgFV8wW8/6oLDJbECW7qZYGrzysG
	49qjl8rJfcrdX5DL5c2wbE+hRlaKbfYW0MiasWgLbjKMWQBiCKR8nh+8Fxm/CEEIAxmeXWu+CLpnA
	4bPMd9Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ar2-00000004pUJ-2H4b;
	Tue, 15 Apr 2025 07:37:12 +0000
Received: from mail-tyzapc01on20704.outbound.protection.outlook.com ([2a01:111:f403:2011::704] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ahl-00000004nbq-0L8o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 07:27:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flLNF6L89AZQo38YV6k24tV8PnXkwAgseaAipjmL5XBUZr1POb0NlVuxYaYO6KAxO6DNuRW/EQGryhGgb4p0QcB32IxSK34QSqFyDNchYAzRcJGjh+Iz9RDIIBJ9uLPcE20t6qfbRU36XG97zxcAo2EAEU5EAfbVGcquKNzjH4sVd0p/QcHM+PSOYJQYqIHE4qYpjS9jxAO3HsN71QGd+c4sJe6zFNNsaC3kERKYPo/NLdTa7yT0FnVnF6sNbk1OZFAYgaDomjXyG16TKGccapBI9juplMQBz6oZIaDXZIIWiCaj79R+9PNESYBQHzUaJW07R2v87vibPWPFDlDgHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVpSZdDFsCHY8ZMtKH5F1+nDRJuSrIJos7FNpfoAwZg=;
 b=TPf5N/fYr4sga2uEDGPKvon4PpJ/V16nZIUIJjGn67t4reCl/I0HBmIN6m7OGUVS3g9Mp/EavToaQvELLyMVqYBxFuMlvJgaryfIQd+xdmpx/5ZvkhNbiuIzh5xL6YcRe9YTZd+sbKsBHtCGYM8WA1G56nzGxIciDtwuecJ0haJI6lK5uhW+r2FGX+kgMCn2T/rbJRiUft9wpqpUv6bE2Z36104P5FPrEYJ3vXQ12MfzeGcN3VUQBBheXc2wr3677uh2gIbK3VSZ8PgR3KEEQaNiqeunlzwIpzAeVL2EUXhRRsTN1PT7l7WL0uGyfICiNGfeQnWa1J1FkMDU5WVW7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from KL1PR0401CA0033.apcprd04.prod.outlook.com (2603:1096:820:e::20)
 by KL1PR06MB6553.apcprd06.prod.outlook.com (2603:1096:820:f1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.31; Tue, 15 Apr
 2025 07:27:26 +0000
Received: from HK3PEPF0000021B.apcprd03.prod.outlook.com
 (2603:1096:820:e:cafe::57) by KL1PR0401CA0033.outlook.office365.com
 (2603:1096:820:e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.32 via Frontend Transport; Tue,
 15 Apr 2025 07:27:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK3PEPF0000021B.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 07:27:25 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7B19D4160CA2;
	Tue, 15 Apr 2025 15:27:24 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: soc@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	jassisinghbrar@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	kajetan.puchalski@arm.com,
	Peter Chen <peter.chen@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v6 01/10] dt-bindings: vendor-prefixes: Add CIX Technology Group Co., Ltd.
Date: Tue, 15 Apr 2025 15:27:15 +0800
Message-Id: <20250415072724.3565533-2-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250415072724.3565533-1-peter.chen@cixtech.com>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021B:EE_|KL1PR06MB6553:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 10bff7a5-763d-477a-9af6-08dd7beef866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pd5iCuc2XpOtLgVDgEEK/NWg3zNvYGpOIh8gUesI6fcMgSGQB0Swb+hYhMZb?=
 =?us-ascii?Q?Qez/41sJXUH/LL/scu603WZnSJIwqYq4Q39dDKpYs8ZS+hvrVjBkZDRmTOUa?=
 =?us-ascii?Q?EN/TdDSa9zXPTsulcVNCmqA/D+UNkQtm7NNE+7X8CPADZRscd9ONRia4hTCU?=
 =?us-ascii?Q?H2BnloFWf1yPeoxmpTfLT69ZdG76SiVWVHaVVhQjr/FH334Vu24q9UFtaW21?=
 =?us-ascii?Q?RgE8jskft8dn50SPSroDyy9Hf2dzRLOvKWWWD7dF2HPSgYbSpP2+rcNCflRn?=
 =?us-ascii?Q?CFPDWBZVs/bDbMLGR9dc53fYrOxjOaJe0GQgvvtQSbdH5pCU2jTI1S1mfeNt?=
 =?us-ascii?Q?OQ2GhT8E6yydr5yq416I4HzkfIbfvmJM6SEG4oDVLDf+QO3KIjjMUFMUSot9?=
 =?us-ascii?Q?O/mRlkJaBYIRzYUO4qh00nw5GkaLds3y+5obsWnDlLRkEMLfOq66l9Qe1IoD?=
 =?us-ascii?Q?OTj7ea2bqKveukb1M5tddi7bpf3WE9OYZiuA0PruTgr1mm2gFmLbhWNXeDK7?=
 =?us-ascii?Q?zhB7ua9z8xIsDKPRSOlEYhl4DHnpVHkHomQM8OZXcVwjJEOweeDL3eYRH1Ps?=
 =?us-ascii?Q?fUWOLfoziqnHdAyvIyhIp3osA5vWfPTQ0+sXbkrUyn5YJs3ZWaEaHodCVzLw?=
 =?us-ascii?Q?H6Nx7tnxxTBMk2oqiAFsPPWvbEFa3963lXffmMSXalnzvchHWozxp5qiKZRc?=
 =?us-ascii?Q?qlAm8S+V/eQul1ZWJVrOS/MGWoGDSvqUOiweu+XbrmML2i5z8fDQO8RjylH8?=
 =?us-ascii?Q?BaShmAsRV7VrSNjXOmyjJ3sdMq77GE2OjXCJnBiPkUIf3PfE8jA/DmNQ6fFf?=
 =?us-ascii?Q?bCG3x9l3hGajYi/51vPn17VZ7gJZtFBoRaI8tk6pmAnj1jToAq4FiIQf3iTW?=
 =?us-ascii?Q?0y6SjIakQghBKW+m6ERMI3bconEy24ZXf83Ow32wigt7+uLFwuG/0KJmcOsv?=
 =?us-ascii?Q?RIhwHKIjUENrwrvRoI4VYuFnUq5eEAu5hKcmpmPfEZZHWcbBNFqJqxlRFf6I?=
 =?us-ascii?Q?d9gFRWHttajQmOmCsiB+TBxrJQ21iDlIwm0lRmLxB3Y4H1phZwv5ztagS5DP?=
 =?us-ascii?Q?MOUVOKewed8E6dUSPYbfN87pFNtORg2Fc5BkCBPkMeVmu/pel/9E+xXvFFV6?=
 =?us-ascii?Q?YG3ex5hJ2T7diFxk4pGDClPXdQjvdh1wVGkAHGWwyVYF7ntmLs5Gw1uUo0pM?=
 =?us-ascii?Q?nf5uHL9D2YBCHPzwIN2C2QMqaQ9p+6bvOwRIXYHebgljVkTFUs12nLQEACGD?=
 =?us-ascii?Q?JMxO8crcja1HTxjt88Lb87H/EBZYtd/HMkAZgCET1BJVNq/tLIE5Pz0kEw09?=
 =?us-ascii?Q?BvFRsllYeFgxZyWMBqe0iAdwUW8c/OM21qTVSNxNDR1CcT4+wLezaK7vFMA0?=
 =?us-ascii?Q?202BdTmil3asJcZK5SFQT1KL8QWUmU8dHe3SGJRCfkBLZZXo0ZVarzPJpMW6?=
 =?us-ascii?Q?DBPuJH4i9fjzGThe+b1aHtH1z3jNh5P9+LSwe2fvqUMj83SYTYlqBQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 07:27:25.4041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10bff7a5-763d-477a-9af6-08dd7beef866
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF0000021B.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6553
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_002737_119916_15FFD4E3 
X-CRM114-Status: UNSURE (   7.59  )
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

CIX Technology Group Co., Ltd. is a high performance Arm SoC design
company. Link: https://www.cixtech.com/.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae..661c8c0d76b6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -304,6 +304,8 @@ patternProperties:
     description: Cirrus Logic, Inc.
   "^cisco,.*":
     description: Cisco Systems, Inc.
+  "^cix,.*":
+    description: CIX Technology Group Co., Ltd.
   "^clockwork,.*":
     description: Clockwork Tech LLC
   "^cloos,.*":
-- 
2.25.1


