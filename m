Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFD7D4415B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 10:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGN4TVfZGuWhGcX09/dpj9g6/WnA5WETvvZIDIBzp0s=; b=v3ytNwPGBfLQ+BzNoOeku37vUv
	U7bj3lcy5QlJO5YOLVClU77uD7sPZNmDr5pLl2gLUpITpTlGivkKENbg9ghOnqkdTMLQW9Booy1Hy
	t/8dd9orldQ4zYh6Mr3fJ3AOfOz/d6omyu1qGpb/r9Nh0eoqas4zaxqoNZhkprh8NmVToTrcI/rx5
	JW1KqT7Gt4ZUgtaPAzF++Tekgnhjq/HH/YdWTNjga7JIU94JPQd2B8MK85M0JZ8PfO13jKjGcVc1l
	AMXUPTo1HpkpKop3a7LweNpH2bEFV7dw4ERNx6j34yz7y7uWBGO+tPoonEx1zhMPYZwzUGErQHu3M
	1W3oV59Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU02A-00000000PFY-1vFa;
	Fri, 12 Dec 2025 10:05:58 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU027-00000000PEU-1AM1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 10:05:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wbmxL57gW9c2aqUKMTzUx3vGXpixkWNJK0Gm3z+GlEODFjH9psZwhr1x5y4c19NTY6YnD1mSM1DM1omUAWCxSvyk4icUu2sVj8I4rm9ojctyntG8dDbFEHnI6EoRrGfSjOqGwC7EzK+Gu0EFTT9xo5GroJvc1hpFNQvkrPbOsIo4NCp7CIzq6U76ogRrsnVKEqGxyHmFB5ePuryEERJiWZ/1L+C16sorJkC2B5zBa6XkM+XDN8YxX3rhvh91+RPajLdUJPoSj4wpL8VpLBWoqnFoitsGiXu/3QwBopOrxgDmaCs+GthmCRfTIUVFV+gSqC400Q6jx0id1v13MQ7Fhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGN4TVfZGuWhGcX09/dpj9g6/WnA5WETvvZIDIBzp0s=;
 b=cD3D7eYoTJhQo7mA03g5dikQ6oryG2UiSJh9vNhe6+5yZDkDdAfNYJCu7SKj9IDZacHezH4A62nB3vB5cvXiJLbXw6iwosZhwWAUIg6F4KyaVpWfQoM+z9MsUZCRY1teP2bBAcY77hsoCEqc1oZmsWSQArwMuADuNvJIWuxIDde6QtADxyyFRIjWgTY3GohWOpL0ujKQhGded2fnaRKegM8XM8+ARKrSkPamlPEx1wmuKJ68ct1+aqv/vOVS2/O/LLt6kXtxvBvWAKWTWbUonrsiwKoVGrE+g2W4UmiMl4g6ET2JIzFQdY1YszymPAtv8DmMHKKAA3plRSTgjvChLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGN4TVfZGuWhGcX09/dpj9g6/WnA5WETvvZIDIBzp0s=;
 b=RO56Pp4cBbdku1rwv6nCb9qSV5KrfD5CHH2TTY8fig8NZ7Q0QeJgjC2wBWG6t9f9wfYkhx/MC8xWRC2wch4Br26OFmqQD8lc2kIJCYN9LnJ3zqrPuAtjVINxkaYwCC1B4vFMLmcX5FS7k8rsHxvXQFMxXeAa0wKs5gGheapzjP4=
Received: from MN0P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::30)
 by DM6PR12MB4092.namprd12.prod.outlook.com (2603:10b6:5:214::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 10:05:47 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:52e:cafe::ab) by MN0P220CA0006.outlook.office365.com
 (2603:10b6:208:52e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Fri,
 12 Dec 2025 10:05:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 10:05:46 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 04:05:46 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 04:05:46 -0600
Received: from xsjarunbala52.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 12 Dec 2025 02:05:45 -0800
From: Ronak Jain <ronak.jain@amd.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<michal.simek@amd.com>, <nava.kishore.manne@amd.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ronak Jain <ronak.jain@amd.com>
Subject: [PATCH v2 1/2] dt-bindings: firmware: xilinx: Add xlnx,zynqmp-firmware compatible
Date: Fri, 12 Dec 2025 02:05:41 -0800
Message-ID: <20251212100542.2756757-2-ronak.jain@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212100542.2756757-1-ronak.jain@amd.com>
References: <20251212100542.2756757-1-ronak.jain@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|DM6PR12MB4092:EE_
X-MS-Office365-Filtering-Correlation-Id: d8668fe2-d539-468c-77dd-08de3966051a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I2u9oISBSiCGcVRdeI0bsrt4H/26GnK6RtWeIy5cuQDhwodA0YpKb8jut/xj?=
 =?us-ascii?Q?ezRsWXcHrVpTZBnMmnngKS+cw+i2kbICwBYcmQUH3US9Ni5QQWe8clo3wKoC?=
 =?us-ascii?Q?giaiI84MA7tMJ6eP4MMyXbxvCLrxUKyrzTFdWnECVMuKA9cLqXdbTOFFGPV0?=
 =?us-ascii?Q?OvImKscIa8rL2wUX3CzpbEU3wZIkeDGhW/D1HxQ5E+M+sL9Xr/bC6+suHQvW?=
 =?us-ascii?Q?v23lMrnMrHDj8CERjiUR2dGVpDm1Zmxpy+LI3g06NFwhzDf20dk9tEIxWmkg?=
 =?us-ascii?Q?oKfYJtsTWaoicMDUIqNWS4pP3ic/sw2ALOMqCmqyezCN6z4ZLA0vC2QLiVyD?=
 =?us-ascii?Q?bZAPx79peIxpQv1iblG1xgICBjuyXJifL61NwXWEDrZeNU3HprAifxRKFZEX?=
 =?us-ascii?Q?ToOcMkmmK1ALtM+1xupyThnb3/3sDmOnkyh3i9Trv47hy1AM32L4+FjTyXgX?=
 =?us-ascii?Q?+A/CSWuRLnca5rLnkegCMOCEWUsznQQSlP8GyqivxmytYkpA77epzR48Fqoj?=
 =?us-ascii?Q?tIxv7OZ05CwGE3lykYh3QnuU5r2JJ9FIGUdiOlHOIlZXPdl5h9a7ar1VphND?=
 =?us-ascii?Q?02VmcVh6BSgu5y78egOppOhQhtNu4mkybPO4KETVoG72cPL+Yvq8xkwzSfO1?=
 =?us-ascii?Q?JCAu15yTElZ7giaIdFF3r+BXOrBLvZhWKQtYaE3JPX2krxdJd7BLyhrQFSjJ?=
 =?us-ascii?Q?5N0twqDCjwWWgVoLFl/H0DEWvkButggMLDNQXTvKspuo3jm6a4X6QM/8d9pq?=
 =?us-ascii?Q?60O0YRYmOKPl13eNC3a/CCMqa9yj6U9HkxMr+bLDgx5irYTco7lNE9CHdpg5?=
 =?us-ascii?Q?Ux23FtzRn8IYggiyZC3O8EAB0evRuAaArrDdXWOVnwXCyGncSl/h8kXLMi6R?=
 =?us-ascii?Q?E4nL8E2gdCeCLH6m+k0n6w8Ov/pBxiAlHHnEeA1tQgSxc4WaEccmpV0LV/bN?=
 =?us-ascii?Q?bR7gbcOS+vpF6qP2yb1/KbzgJ5D0OcX6RELuW+/ANLxBdPcDTt/J6bNSStmx?=
 =?us-ascii?Q?LNcpSKVSaD/BTHgIfKKqucOdubWPIbICpveO1XJjVJBhMdA1BI3btlpt+3Zi?=
 =?us-ascii?Q?7/K+5PHqK58tGr46d4OlI8n0OONEs8vs7dzUBW40him/jUMDlBpqF2yLzj+B?=
 =?us-ascii?Q?Vlo1I2etcKGR5urDixDmqbSeuxMs+GLYQc1OOY7dxMHavzpIB8VSJd7BSPaU?=
 =?us-ascii?Q?h40ec8bUAq9Q+s9TUjibiumBrTxusK/B2cY2a3hOltRVxPsGXioMzFe6qECs?=
 =?us-ascii?Q?iavAs6T4KJfqdfOuUZFp1CY6jzcraNOmPl+ce2zhRv7pJoDsg4cBRd2BPEem?=
 =?us-ascii?Q?WeKsiRCqeszD3UD7bVQ4T0jIpwHzKpKgtLJKac5fm6nZ7+tB8NoypNsCLgeR?=
 =?us-ascii?Q?9afO7J4ixXo5ut/OAM9bFfPEM5yIHKddk95oFAMIXaa0vqZOm+ci5oHrptiK?=
 =?us-ascii?Q?fWeJJyqIr4CBbMReUJnX7++zD3lcGWli6VuhMudtvv/3WaQDKd5gFYaQuVgG?=
 =?us-ascii?Q?XQidyA2TCN1qWudZPODkjanISgqhE+bj2weq+0vP+uQPq32LmrUQgKDImFpk?=
 =?us-ascii?Q?s5viLHmIHanNK9eXht0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 10:05:46.7837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8668fe2-d539-468c-77dd-08de3966051a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_020555_314115_B61CA809 
X-CRM114-Status: UNSURE (   9.56  )
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

The absence of a compatible property caused dt_binding_check to skip
the zynqmp_firmware node.

To address this, add "xlnx,zynqmp-firmware" to the compatible property
in the example section for the zynqmp_firmware node.

Signed-off-by: Ronak Jain <ronak.jain@amd.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v2:
- Added acked-by signature
- No functional changes
---
 .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
index bd413b6aeaf4..7020eeeb4ec0 100644
--- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
+++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
@@ -124,6 +124,7 @@ examples:
     #include <dt-bindings/power/xlnx-zynqmp-power.h>
     firmware {
       zynqmp_firmware: zynqmp-firmware {
+        compatible = "xlnx,zynqmp-firmware";
         #power-domain-cells = <1>;
         soc-nvmem {
           compatible = "xlnx,zynqmp-nvmem-fw";
-- 
2.34.1


