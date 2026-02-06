Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0253EE6B46
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 19:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ht9p1aNqLGbr+lS6/xqx9Tx1QwH/JPls6GsfzVUtVQ0=; b=Rq2itZgFnx/cFqAsKGysX37izY
	AJfVGfoX7ZOE9Jc1zWXutoAP9c0HTmkYb3MNYS8LjEQwXD5sZEsXLhY287HpZqcR1oGhv4Os765mg
	ADQygH9C5o9jAA0VKigCsLiVoD2hFna8ASyI9O/JoVhkW6FzGq0jxAzwfFc3hCgiyhV8oADAW3R2x
	iAcepG4lLs/FDKCTOaV0B5PhV8x6hKK2ZMR5kBI6jfn78cBj6/Uv8AgJsrQO+KqgjRcsMK/A/gId8
	psu9kqJuQnmTmhe+FXP88fQ6A+GuseLgMcgtQ15tVvYdsycjOYBtnpadqQJxH/4qy5bsGKdujigQX
	BbnCEZvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRMS-0000000BjHP-0jgM;
	Fri, 06 Feb 2026 19:19:24 +0000
Received: from mail-eastusazon11012049.outbound.protection.outlook.com ([52.101.53.49] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRMN-0000000BjGW-3ebq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 19:19:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1TD30qvhr+f9EzmnX7K/K8kuBEvjCieLerBcMQDMcH0TWGyI4SZwLf/441OAA9+ofA9lVJ0gd7I8nAQGdB2kF2ErcHU7CYcSfe7kd4FFFmOzwNgK3XlUPBxmjFPUKpnrYTxm5aJBC3a05kpcDxh60714261oXPjEBlrlCjdST7CsicHARf3IbgJBLQJj+w0Hmp5eBClq00aTHQ45yVLT3b5bkrXqjk4J/nlEt8Q3sZFAkxOsOigLNyrs5qUcDgidwoECk5+O/JWqe3LcRLO6Wb6kgcvgAmWAKJz4MkW/b7yTvuf63+x7tgOff3rqcfa5X0VCo1WKZgcdfOpfJntCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ht9p1aNqLGbr+lS6/xqx9Tx1QwH/JPls6GsfzVUtVQ0=;
 b=pxPgeILZpfVIP/uOdDRSR6ux7wBcLxQiTzJSVWbt/iwQQt7hnswFhV0ggXxt4OzfHzRLfkY02il4fH7fWcKdbp40w2NpzEmmTjYiFewhvpkyz0M/6pLaLpCKLNmwWntBefu3zyeWzrlAdWxVMZ7OqP6fj7+Xoe+nKAfGms+gdqTlUHN2RoqhQ5u4BLBhnzzb9r57gSVdDbJJoHlh5A52F2w5+Ju9zuP+ug1cbC8izxgiky60os/xdTPFbm3Kr9sVFTLPASeviZJetSCleVyVY677GALx8dYEvAZcVjL1RWpZrDl7mumoNOb6V4epw2fBQwfJTQST7AmqAcYbBVGnCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ht9p1aNqLGbr+lS6/xqx9Tx1QwH/JPls6GsfzVUtVQ0=;
 b=URINHYAgkUjdivDHO54ZewRaYMVRpSBxBIDQr+RWI4V8vK/XAkjzmueLHGqZgmkYLiWaalnUOF3bekUUIPRjx70M2rlE+a10h+WTnkK6TlsZa0fN1zRkj9P1OjT3ozU0zGV80z8Up/ByXMW32IEs51Xgq78UgU7T4RxFJo4tVXQ=
Received: from DS7P222CA0023.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::9) by
 LV0PR10MB997662.namprd10.prod.outlook.com (2603:10b6:408:33d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 19:19:15 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:8:2e:cafe::56) by DS7P222CA0023.outlook.office365.com
 (2603:10b6:8:2e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 19:19:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 19:19:15 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 13:19:14 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 13:19:14 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Feb 2026 13:19:14 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 616JJEK71401656;
	Fri, 6 Feb 2026 13:19:14 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH v2 1/2] dt-bindings: hwinfo: ti,k3-socinfo: Add nvmem-cells support
Date: Fri, 6 Feb 2026 13:19:13 -0600
Message-ID: <20260206191914.52878-2-jm@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206191914.52878-1-jm@ti.com>
References: <20260206191914.52878-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|LV0PR10MB997662:EE_
X-MS-Office365-Filtering-Correlation-Id: e8cfcfd6-8751-4e80-2b55-08de65b49e0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B7CPan/SFJn5E5BrCtVU/2WgQYl2kqVaQh0Osic5OUcf5w7t5+N7b1plTAfR?=
 =?us-ascii?Q?3e9IYyC2V0IOgHqHSaYRxxakdFqBEt7WTquaBA9Veo89dsLlW5dwa1Ude7Ux?=
 =?us-ascii?Q?IckZLCcJAuYyHrwQSPGZu7G/wUZ6h7rph5ozoBoHNWyaFA6J5g6JvOwMCzyj?=
 =?us-ascii?Q?LDNQOo1nFJHzbB5WdBVBXKYoq3MA6lb8+5TwM5ybws5bp/z0Xa1653czOmz1?=
 =?us-ascii?Q?DxoAHDXU3lQR82CuczaIHqRJhnrKeUPWcwMOdmhipNsTTJiC2lrtEtWkZ3hn?=
 =?us-ascii?Q?P+cDdHyhQ6WqsTDTt6awH0TZlyqW5EDL4XsvBb2YxD1O0aDNd4wntK8G+h0G?=
 =?us-ascii?Q?CEsgozTg0iLq91sFrrK1l8rn/Ko1IBJklI8gdjf4ibrqutjG5ZpHVCW2pOrN?=
 =?us-ascii?Q?cROaOdqnvUvhfr5iyDzq99AwvGBvEefMckv3TNf0e+uXKUG9/ooeApplElPW?=
 =?us-ascii?Q?KRtgfwAUtGti9zZvj9yxFZUInw1OQVBcSdYqIDj/QX5TEYdSZwaaGo7EBipe?=
 =?us-ascii?Q?ydFyMPiJ0cJlV416fXA3jg4NzcXGzWVKrp3bmFA6NV0FK37Dyv62+3d/Yrqa?=
 =?us-ascii?Q?m6ff6594uilqQ/NKo2dlLM1/cOOuS9s3rzaJ9V76b44l49Bp+OnAx9b5a2GD?=
 =?us-ascii?Q?Wlhdcb1Q1vhP5efyJzvAm0f69XrtC7kzoe1aF2g/vKEfLndJP432JtcV93hq?=
 =?us-ascii?Q?LkUEDz/7hCOZdOsAW9CxdzU5UzkO9UETgX/K4qpZVpnO8tSEi8PQ9viANLYQ?=
 =?us-ascii?Q?NkzsXClcW2W1c4+95atJsPBZMWLCfza+rXIbTJLeRLvVPGFTTfhd56GmiVVz?=
 =?us-ascii?Q?MGCCioONWGsifpb47sRSEe7ewXvu+nm4i99QU4NUr76PaadtzWuaFZ4y778w?=
 =?us-ascii?Q?CtlKbr5qpyBcbcsyny/s0kNry+baO9GoWu9u0cZPZ3rmHNy/cFgpN6YILpfB?=
 =?us-ascii?Q?XW2QnrHgegDv83NW8I+6WQXBkm9OEfAp36eTpfD9bo6fjmoSLD9cp2xJjnuC?=
 =?us-ascii?Q?m7i9wiuJ6snMjdDIhKrmm9YW+AcNHjTusK1RF4cdZRavuhvKEpXp2GCUi/Xl?=
 =?us-ascii?Q?ylRnUhd8DCe6YIedSSsS1JHKHIqoB6r7JuWMIlplpd2sUEw86pue+DrFcecy?=
 =?us-ascii?Q?BxrWOrosnHg8k1W4v+XalKfeexYNwrif8p6Nrh3gIQ/qERFXkanxzEvPiE8Z?=
 =?us-ascii?Q?vCYami6zycqIFm06kWv4eeKhycjJySuZ6sCFq84NRx+okAUFSlecyStx9x4z?=
 =?us-ascii?Q?MiKxtOzwz6cFalEK1fR4kzzOL0KND5c6XONkf53KFqC1EpDQQc27q68ozlqM?=
 =?us-ascii?Q?9ddNAgK1RWEK5LFfKMe+WdlW99BFtSUFVyEQTHcRtaOsNmgoTab+Gh4Bzuca?=
 =?us-ascii?Q?mZEcJ0aVBeUU9gFzHIaEiGEfnxyl+JqAuwcKep+p9WoZfL8N09VG6I1Nk2aG?=
 =?us-ascii?Q?H/PsLWHzEegLo3nOyMPuQFOrWwPjGEPu8NN5qiL94b5Me7x/1D7mXGyeQJQ0?=
 =?us-ascii?Q?YLfdrRY+cAi7A8xbpQ+MdIqOB5R0HmKUUAyxIw0DfQdQKbEacdGdaHDDFwxN?=
 =?us-ascii?Q?8wfmJBYXcc+nLdh40AZML/18RfxybgAMh2v7ntY0uPeaPLKCLhJBgzp/eQxu?=
 =?us-ascii?Q?WZ0MuvF4/jOaBMPo51vTmP6OHUtKoEffS+t+dmxZ142TY4lDyS+FV+p+hbgU?=
 =?us-ascii?Q?EVT7RA=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Rz/E4tfC4QhWtHNmJJT31DLkBcnP6bxWuVaD29VujNxXilHpZf9SsVYLUYj5FjjxApPzFWtkx2dTZviG+luCzfdpxXugyo4rEzCbztt+uIQBCCRYowWia4iuIIGgSKhS/NJeGiTejdXFMQ0bwtUxEw7wsWKHE9E6/PzUE80sUSk+4WLKFY40BXse+xN8zczd36l6KUgqtxqztRGqhYUzwodyTwlttnpJz5CSlHvcLiOdf4dUwJ4hWZA2nFvaU3XYX6c/Hx/8DtoaMqaeR9x80qA+L0crvQ5oVuxKVV4x6E6eyF/3C4bi1Eo0XbuvDNjxTcu1lPCl6L41es8nyhnLh4S5eiOeaD/CjqoAn5kLl9nSDIb6uKmDS2gQWze6q30ISNc0s/9ocI0fJpmFGhmBSXjNv7peFVsDYiwDdLbha8t5Qx/egfkARF0B7jYYz7C3
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 19:19:15.2569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8cfcfd6-8751-4e80-2b55-08de65b49e0f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997662
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_111921_144970_68E8C71F 
X-CRM114-Status: UNSURE (   9.47  )
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

Add optional nvmem-cells and nvmem-cell-names properties to support
reading silicon revision information from alternate location using
NVMEM providers. This is used on AM62P to read GP_SW1 register for
accurate silicon revision detection.

Signed-off-by: Judith Mendez <jm@ti.com>
---
Changes since v1:
- no change
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


