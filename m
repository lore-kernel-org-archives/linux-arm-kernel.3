Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85667C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 01:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASEOde3FKdXXGfs0wJN/vrVK1YqOLY0Hwr6UhkvoauA=; b=PISvOAef1DsiOtVjcOfWbSxFOF
	Xs6nr44K0+vxTvCrfRrujCEXByjTODYwwI33qdW2ZA0qI9pH1wRV9HUGaBHa1BUrIVYGFoQ47UOU1
	3wRBDt2i3qSZl/wy1AhMT9UGqOgzjz6dIdvBmFvO9l7vKpJ7ArSsHH1pwkM3HWHOK7RgdlTz5NGwd
	QKawdJh5h8FeemHMQmK8BiTWceziRi035RCH5MJpu3kbghKNP/IZ864Uj5cJi1ZtAY0NeLUJKLm7P
	LBpdmOPg+/AcCnSVHcmhorV8DOPr2q5uWaOYDkqDSmie4rSsh/lkvmyQS3PSCxkdj/A1jWoxLbrhM
	bAxC4meQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn6GS-0000000212F-1xfH;
	Wed, 26 Feb 2025 01:31:08 +0000
Received: from mail-psaapc01on20721.outbound.protection.outlook.com ([2a01:111:f403:200e::721] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn67R-00000001zyo-00ss
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 01:21:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDN1JJmCBkf8UDeDZPHysAxJR7nsHQ/ONoQfrepZf1uVlusW+tsia5Bh409+eIkDVGCnRYuXT0RkiXFEjqD58J9byS3GooUaefx8PPMwg2aAxReGQIyQGV8+Wq5ViMWGCpEsiANrizQkjDEDMjzxNTdVC4WdkzYYBuzk9SfRmS+/z/0rxgLYXwur9xrgK2g1+k5dUuqnVP0HHTlCfa/9bfOYNhOsL8k6jECGAttOlEVXfq7cSRavHaVDx0E95XZXLKVTv81C2P3P/Ej2s/Jc80a3WJcBPZvdSFFbHZWVGcT6fZqFbHYjT1g2KQAMVlZ52WFgAQvpzHlOjWe+NHoQcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASEOde3FKdXXGfs0wJN/vrVK1YqOLY0Hwr6UhkvoauA=;
 b=UeYmSXbN3ttF8r6PUljUgwh/otu2/CvgBUcZw0SFxrLA2y3YDo6ymBMwdTRGAhYuh0yB01NnGlHm7eIlvnZOh7pA+8VXtIjkvsIBsjJvVAj5+w6uFkX6ndxaxA4AEe7bDMjVUC/IIxGCAKj9XXBaXKaUZ4xn3QVfZg0nqeE2dBkLDj8dRTSRdO561n8hIqBJ2tVk6t/zzNGh8xOiP0Cy3ODo2dMGRf1k3jSih6Q3CkMaFS3UKBMP0+ZYNtlyKCiK0TBRM1tb2B3EMiK7Seto0Hi/IVlRx9tNzJI/7Dg6mrtzEWiVrNTlVxwUEpRyZQFDzge4SsV6AnWuhoAhM0oqdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cixtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASEOde3FKdXXGfs0wJN/vrVK1YqOLY0Hwr6UhkvoauA=;
 b=XAdk3kVyqFrIIHUCmE48JqyqUFK4flVznu44PxKcyV7roa47rwszeXnr4aCHJbt0iB95oJQL1fYBFDBDYEKC5N2f1YBGK42BQx7KA820YSnDAMhOGqlWt0YB6bduY0ZZd+t4/YmH+JZM0Vh5H/FVkfCRItUp0Fzv/1XKxNY6ag47HTkpHvDSfPVGyGvqOqGlmdztBa/sEmWb+OzZTnahfVIAMuTe/6L1+BOpppnh/4eMDHMZpLslkCVbRWCXcg5Wpf0AVF0SUmV457utq1N43PFAdbvtP2PXoFGy16OX4bYddaR5cGfrOURhN0fxFva1vEOizKXf9z6NFifULO5Dig==
Received: from SI2P153CA0003.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::20) by
 SEZPR06MB5622.apcprd06.prod.outlook.com (2603:1096:101:c8::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.20; Wed, 26 Feb 2025 01:21:38 +0000
Received: from SG1PEPF000082E3.apcprd02.prod.outlook.com
 (2603:1096:4:140:cafe::3d) by SI2P153CA0003.outlook.office365.com
 (2603:1096:4:140::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.6 via Frontend Transport; Wed,
 26 Feb 2025 01:21:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E3.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 01:21:37 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6C3B341604E7;
	Wed, 26 Feb 2025 09:21:36 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	marcin@juszkiewicz.com.pl,
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v2 1/6] dt-bindings: vendor-prefixes: Add CIX Technology Group Co., Ltd.
Date: Wed, 26 Feb 2025 09:21:31 +0800
Message-Id: <20250226012136.854614-2-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226012136.854614-1-peter.chen@cixtech.com>
References: <20250226012136.854614-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E3:EE_|SEZPR06MB5622:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0b329291-7978-4caf-f1ed-08dd5603ea52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GWoCZogjXzzVRilZ0CvTj5VChkLxALcBx2i2Oo+7TZ6lTogYxTKNn4ayEWf4?=
 =?us-ascii?Q?wpIuNH8CB22geiCWUBU+pThYxg3t1e7NKPyPSLns8ETz7m3Jpv4ikVhUWBkx?=
 =?us-ascii?Q?zD80sHkKJkKPIJoKe4nKNtV8nHxNIDSV6Q5yy8bUc6gdLFoGsFQKe8OhMytt?=
 =?us-ascii?Q?mb9oSBDLW6yCPGYCpBljLeWuMG69B1+g69kwEjkYIRqgyxRwKtRp2MCv9B6Z?=
 =?us-ascii?Q?I6GaogWpakDFZHOYlv326HHyXlGRZ4kNLF0CXTrJqZ4OxWOuBFIubOR2pCC0?=
 =?us-ascii?Q?HiRa4fDLlXm/olsm2VjSUm09yp1FOrEPQo+Zkefz3yhvH5G+g/V1XbSngFZE?=
 =?us-ascii?Q?/YVjINsnZqSZnspaQLcGGOz3OUpdW7Be/uY/0Vpgf6H7QqM5bXdR0xJCnnOt?=
 =?us-ascii?Q?LBd2jD5Bl2dRlhNGeyaCw2sLaWwZqFc91MqvFyTWSUBBq8poX9B8AXbe+yFy?=
 =?us-ascii?Q?/x85suBxUUrDxhCUSdXN+lYAx0P7YlPL733eT+G3kWeNTL9G9HH60HepmnuD?=
 =?us-ascii?Q?h0+vKXa8DLGiMxccN0Bvavas05ldfr+zISlS6QAgfFeqdy56acM//Jd6jkDI?=
 =?us-ascii?Q?XRNWj86VJwmdLMy/6YbSOVGXSnuPMleB4MMsRRrfKSCeUNjzuvjxa0ICYGaw?=
 =?us-ascii?Q?31NxlUYY4e99lDijqE8BwNvtQpcsAy83u5yX/9b2CuLeq7fFBgocuyS/J9Ro?=
 =?us-ascii?Q?yLp5NU1z57ZUmGEKeujEeIgaUxXoCTaC62DtHeGfBY3tOKf1/aI7aOex99j5?=
 =?us-ascii?Q?/EC0s5ZcjZrCd7Iw/GHmpgD/QRLhZEPr/j0iQ1ayW0HxFGU9MAUiev8ixbpG?=
 =?us-ascii?Q?pWjFltTmn3tV+lIP/NLt+MZfQvwzmWPCfNtK4U/+a4XEH0ga+Kpa3wrIV4v1?=
 =?us-ascii?Q?LI7hxBtYEEuzAXMydwrmpwf00MH0EihrKWvumS+uZIA/4cBLZulXFkSgseNv?=
 =?us-ascii?Q?euCF8+XeMUftyRLyQEKFTw3nfXvGOp9lO7qyOsewQYrx0vaw+POq+dSUbUwO?=
 =?us-ascii?Q?8FOkj9rSPiqoIIFQzK7gPWRLciwPiRj2BwPh+kxMAqWadk6GPg3EmRDRRsLV?=
 =?us-ascii?Q?rRWaXzUGWDTp7WWPMIeiHj97NzkfxT4MNy/aw3yiKNRy6jqMD2qj3QWCY2Lz?=
 =?us-ascii?Q?rCK8sSP8zE0oKQERMEvJhpDyqb3Si3jTBUrBiiIt0YvTTRvJsyTdcZ7yYuSn?=
 =?us-ascii?Q?jrMdR9zjEIkJiAVUZg/N7vpERvs2IUMBv/PzwCTFChuIjIZ3yfLafTCUYvIp?=
 =?us-ascii?Q?OXGwJ0Wm9gynaFiduHuueTEYwJoKR85Ni4QZ5hT3vYIsxvwcuthew8SiZpna?=
 =?us-ascii?Q?//ogEcY+BP+ZUBwga/xY6rvaM/bc7R2r9/QzRlXEoQbBvh9EOSWBW7obh//z?=
 =?us-ascii?Q?RCYBtycOsNWpa5tU9pB2VDNkU1PteuW/npUnwtCURjo09I3vCurDrv7s+HWz?=
 =?us-ascii?Q?xLJgiPCMmBg=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:21:37.0798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b329291-7978-4caf-f1ed-08dd5603ea52
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_172149_045121_B1B88704 
X-CRM114-Status: UNSURE (   8.07  )
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

Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5079ca6ce1d1..5e76223e4570 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -302,6 +302,8 @@ patternProperties:
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


