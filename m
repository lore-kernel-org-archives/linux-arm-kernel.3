Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBD9EA7944
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 21:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVRUuiYN+gi6u5rd6F59xpCZXUbCxQY4osjgHeFqudQ=; b=zdVFjEp6BwMO8dHSr8AJTHjovW
	/ypA/ECw/bhJWH1/grlQhareH1t6K3RI9lUJY2+i3RWmemGF3LvgZ+EZG88+eMbdlmOKayYtn0Sa+
	IFmE4AYMMxLAyrddt04PG5s9l4xd1kWswUTzspS8sny/biv24uHGJ14l+0dhbHNiD8N8wAw9XqDf/
	x5SRBdzd90UzRwS2gAHMgVx3DA/GfEpRvGQ1rbFtsH7GeUcXUdfsv5KZno8fBeAy5ca58cLjf8aRL
	lyrLzOKKnvyrSkfNaPU8lkOnIwhrnlakZz6N+XxA4fO+SOTID+J8CBazXgVyCpDNR4072UqoLphYz
	wzUUwlgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnkZP-000000096XJ-30mC;
	Wed, 04 Feb 2026 21:37:55 +0000
Received: from mail-westus3azon11010070.outbound.protection.outlook.com ([52.101.201.70] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnkZM-000000096Vx-2XN4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 21:37:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/KmYIPyJE2NDxbvLSyWFG3foAr4iJ9Tvd1YW9wUXPRLvgno7MEhK2xXhrP42dojHg+2wRG1Kxsnz5SZqyRp1C3H9OHa6QODuvdxfzfSmF5dr73uMm+vnj6P25eUeW2sbrRf+2zjP4eLGA9NpgDxJptkuOs+7kLL8i1WQp2Ny4kmoVhQoqDEpdiGEYxN14/bC9efG9k/K2Ek2vW7pjiJut1otvu9UzZYNJSNjX7nVE4edfJb66a12MarqUJRE25q3/qfI/ScGCgL5GJQ/0O6kq+7zitQkq4vpZQHf7nu0YqAn1no0mUOwQXRJxj2XpyHHtm28IgbNjgFBeCHXBaNXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVRUuiYN+gi6u5rd6F59xpCZXUbCxQY4osjgHeFqudQ=;
 b=L4PNSvh/fxuXHJ4CS8tIFKahyAqV41knR9Spx5qhd7GKUOIr+QTIyZm3EKXcutr1uEuKDod422XVRq80p01SE52c81RiWaWh5p72YLZ092Dk/zy39D/ZvRIqa2iEp00dOw0zmXxh3gRE5myEIFzGA8L00gwWbjGoLT/G2rp0sD95RJLG/20xuTcAIMT8V3FGJDvAYMjh3m1Q9UgO7Uoc17UrH6WgqHBdqS5y4aiQinxbsTJvse3jfZU8z1vmXNht1BbKd70ftsq2SV7LIIYokM5G+jP+1JuoGevNfEy4jR7c9ZibtftUdDo4hqHRU84qhDecFfoF5vg3e70dtJd5lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVRUuiYN+gi6u5rd6F59xpCZXUbCxQY4osjgHeFqudQ=;
 b=TzUVn6l1CelXeqJWB3nNYQOtO764Zi4SZBTTkKcJga1CM3/Ja+288dRX/4l/yRVu4wNcVdpu3kMBGvcE8mIt/j9Uw7TkazivsUUxfeuqaQpOdn7i0xQpYgqohz/LVUdSL3XHmER+mNkQeo8HOmiDcEMuf+Ct9swdAjI2OTXMNKE=
Received: from SJ0PR03CA0133.namprd03.prod.outlook.com (2603:10b6:a03:33c::18)
 by CH2PR10MB4277.namprd10.prod.outlook.com (2603:10b6:610:7b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Wed, 4 Feb
 2026 21:37:47 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::50) by SJ0PR03CA0133.outlook.office365.com
 (2603:10b6:a03:33c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 21:37:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 21:37:47 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 15:37:46 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 15:37:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Feb 2026 15:37:46 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 614Lbk1R2231525;
	Wed, 4 Feb 2026 15:37:46 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 1/2] dt-bindings: hwinfo: ti,k3-socinfo: Add nvmem-cells support
Date: Wed, 4 Feb 2026 15:37:45 -0600
Message-ID: <20260204213746.2589028-2-jm@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204213746.2589028-1-jm@ti.com>
References: <20260204213746.2589028-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|CH2PR10MB4277:EE_
X-MS-Office365-Filtering-Correlation-Id: d5bfb533-ce2a-4598-df41-08de6435a399
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rCcIux1Oxn6msV0LTVXS6ghln33npSz74wfQuAdzGyTnHBs/84IBl1TWbzb2?=
 =?us-ascii?Q?29qt9iq2dpipje9a9JnnKNfvRWe7QpyoYGWXY+QfLrUE6Ldm9/vFGAKqgfZs?=
 =?us-ascii?Q?e39YRAssUSoZN3LvW7KEUkKRWTLKugh/wLqWSplXXcsC2pZRFMimGAcqw3tw?=
 =?us-ascii?Q?BiYcGd9bAJHXhA5TPxOuIpNVRNCiAgUZlJzRuqTC70PSH3zSt93RbenJI6xJ?=
 =?us-ascii?Q?JdhsEbHdhd0ffRGogcKoJ+cpNWe7W7ddglD+6osybaX5i0s9EE+Q5cdg/K37?=
 =?us-ascii?Q?BA0jnIf+ld4Nexkl2MGDFdJT/lFAthzoa6cXFWbpz97xeeg/cqjzmGqszxPR?=
 =?us-ascii?Q?VN7hHDdneYsy041bMkmBWYZ66w4qtOY6PXDyRIn2aRTWfao+dI/Svy5oXVqI?=
 =?us-ascii?Q?UUdD8NpJNmhCs2jKFFDB106exwPIcQphV8ewgVf6RmAziNvowOE6ni/iOuWK?=
 =?us-ascii?Q?s+i0fF+SrEFm+fZDgxAK35EC2mE9VMzr/dvCrOkEbEyYnjA3Lx5Zj7yvT3UY?=
 =?us-ascii?Q?MdKmcmZFpa8ws3gqA4fOPKN3DJQkScV1nayAgF443NK08AI7Kl6DucqD3tAX?=
 =?us-ascii?Q?1O6zsv0gO7dTwYgPIRLFWdMdXGmZkzucACyO6yGgBQV1K1GJnF3iUP6DDih2?=
 =?us-ascii?Q?NgH4PHa7rP8ZcwnWRBTbiKA4tDXFN7XeCmkh4wHst+w8gPoe6cfR446hhShx?=
 =?us-ascii?Q?7EwpCrUcPjmYgLKfytr1yWNFcNrpAgHCfQ24GmN4GnbhNcJuKa+CgwZE3SkW?=
 =?us-ascii?Q?JYj5fl9l8eIYTde1m5HKHN+4ySTHym9EoWVbpnNxyxq22yyJSDzuTkJNfTtC?=
 =?us-ascii?Q?FFHm7veMIjNJA66q0kqwpmv2jZin6pGtThii5tbFJJ9/bxmPszFPD1jXLJxf?=
 =?us-ascii?Q?X/NAdYDTwOEwycFrxCAmnmJbs5CfHCwxFbC2QUU901yq8Q1N2XIiAneT1A9h?=
 =?us-ascii?Q?KPZO/K2X+xe3pQ1J2/UlbkP7CwSO1blN66oO8dzpWEocqQB/xZ8hAsPLtpxG?=
 =?us-ascii?Q?Ticp9Zf+r1Ik1pdyUIahc543LE6MfCDnV5+aL50eBYdE9qSEbbCuuWj+me32?=
 =?us-ascii?Q?cKiHbvyUMxeaQsYfS9ICDiTgZql26WTElMyRnoiIFUvj7ZTUIzTbqhbGkbtN?=
 =?us-ascii?Q?GCV2c+z9ZtlUu9vIFxBK9M7fqmeof8qbgPWSW4ktUnQvGsVlRae4Q45gtWwZ?=
 =?us-ascii?Q?P4A0bXzd/nE2mCGe1mpuKTMgTHCkGhddP99mSQ0YFP0Wu8pNW/IBt2qXWHiR?=
 =?us-ascii?Q?v/a6Gqakcdru8q1Vv9+3Y8zAcesd3we/h6dF2BkIfnZ/245pHDz9dWRmHQwj?=
 =?us-ascii?Q?ZzldzptQ9pOH7byVPh2kS1KA89e/E+uxOgdMvckSPNkUSuKuxTvHz6VzNAkK?=
 =?us-ascii?Q?EfdIpuJBZji7Im/ClZUiyPZWXe0AI5HwVnOcoE7K+Jkf0cE0mdt/MT+EuOKS?=
 =?us-ascii?Q?CJWmSnhERlJs3NIlrmkcWSvpMO1LkJccB2kx5sAAbWVWQyuvtMcnw0nCBir5?=
 =?us-ascii?Q?RQS0XFJnEzq85yYKjHh2chMhddTK3NZUdddJJmeQhr/uPmlAe50a36ozchI2?=
 =?us-ascii?Q?QJqJuvqbcCTeeXgpEmUlHGGnzPhZ+WusO/BjQxRXdUX8nLynLJIHswhu+OlY?=
 =?us-ascii?Q?EZ5s43IOyfVEpBuiyf5wXNgrd0pCmCLz1hmcviVfE+WOQFq6dsXs89yyj+HC?=
 =?us-ascii?Q?JibtqA=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WA+g1ZpEAA2niErsa+mX0hkUBAdS9q26/xRJOHtq9sI8eT5fvpiPQkV8KnnuJ2ANRjoigqbmvTZceoRr2z4CG2RiRvCG/tWK95j3k3z3rX/TJF3SmFeW9+Av+FxD+FIdMZNaQ+jHO0tBNhNRerVllsd8MJhCbNh/aNA6O2tzwUEen6HSNN9Ixanu1v0ZtTTFNFdh8X3RE7/riquOLT6tOjvYawLYL5rsx4eKWkl1vNGlKmri4aMPl12USCC1HqaSNA0/HrVAnavc2Yem0VT7TokpVxn9AWi2rf4GcTRTILN4v9IHBhvznj4JnxYrZPKQT2fF5FeeYW+43O2QUST17kRfDVa7rhJUcJpmCSgEA454knXUaLYunZm+Za7S7j+SaSeO5brauukWK24JZeSRH+HRivp2Zz2Am+Rp18QODNZfAxR6WnOY2oU3DMq0WpIq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 21:37:47.2646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5bfb533-ce2a-4598-df41-08de6435a399
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4277
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_133752_781360_46B2B657 
X-CRM114-Status: GOOD (  10.41  )
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

Add optional nvmem-cells and nvmem-cell-names properties to support
reading silicon revision information from alternate location using
NVMEM providers. This is used on AM62P to read GP_SW1 register for
accurate silicon revision detection.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 .../devicetree/bindings/hwinfo/ti,k3-socinfo.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/ti,k3-socinfo.yaml b/Documentation/devicetree/bindings/hwinfo/ti,k3-socinfo.yaml
index dada28b47ea07..58cc937e13351 100644
--- a/Documentation/devicetree/bindings/hwinfo/ti,k3-socinfo.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/ti,k3-socinfo.yaml
@@ -15,6 +15,9 @@ description: |
   represented by CTRLMMR_xxx_JTAGID register which contains information about
   SoC id and revision.
 
+  On some SoCs like AM62P, the silicon revision is determined by reading
+  alternative registers via NVMEM cells.
+
 properties:
   $nodename:
     pattern: "^chipid@[0-9a-f]+$"
@@ -26,6 +29,15 @@ properties:
   reg:
     maxItems: 1
 
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Reference to NVMEM node containing revision information.
+
+  nvmem-cell-names:
+    items:
+      - const: gpsw1
+
 required:
   - compatible
   - reg
-- 
2.52.0


