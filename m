Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A28C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 07:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8ZEoBcqKgzNRobQRMh7+gF+FHzys4fqC/0fXgc5Wpg=; b=1rLIv0QMr4YPLLtTA+wR8wV4ru
	MGKDVu8cM+ANqDNzhgnwhzNEigsqh6TEUgM/Hqo9YT3cXT3U5av7jnUr2oRCuZAP+NwFGWKb13LIm
	eHOpcuqj3IOdTgRO7o0wYTfycXV4yyPtwtLsAquFPxCyOvqXtQiw7YQ//aFHJdTIsehakvwVqw8ok
	absaUqdUmFVlkVYJZQb3vFRF2c3riCLpXGp6ZWH3VGaTAzKD1DLszj0qSopvTr0Ud46mygGi14a4Y
	/Yf8nedjF0sbL8FJJmiFgb42vvofgjHKa4pdRvX0kDsme4XDjP8mSA9MXZ0Sp0iGcDAlab3l0CfNn
	YnU4x8iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMZ2-0000000GUEt-2VVi;
	Wed, 08 Jul 2026 07:19:24 +0000
Received: from mail-westusazon11010051.outbound.protection.outlook.com ([52.101.85.51] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMYx-0000000GUCq-2HLs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 07:19:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsjW1894m3JQM9gTdLdBSstSWtPB+fVdUNPOVoM2Ck/DppWSkkDhfHpZ+87Z5yZfUOlomE/bBFINfX/CiBDdgaHv51OF3a0OvPlFnU1y6Wi57YPKJBYEUUA1+HkAMlTY+Rcpn8SvORu26oQoNbc/0y/DlzxTyMvn9i32Ueneb7Xq40+0YmeH1292A6s7BHOpV+q2DYQ4Sz06e6WL5Os/lDOh368lNbYgTB/a0JrxU829Ld29W/CDRfKs32Gjp8KYpO9I9wnDGbbVButZroktIJJ2ywbexF24EjWoB5kxRcrsVaXUnEC1eAttGL1yy8ltK+OFqZp9DBXOV7Ua6boicw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8ZEoBcqKgzNRobQRMh7+gF+FHzys4fqC/0fXgc5Wpg=;
 b=JcFSjcbXfCD+t+alr2Kfbgi8CKsWXhbmK7Kuh6D7Ub9M0Qyam2DUQrtjdh9NT1vTDH9L6i9DoLiXaNCuu6Sta87MFbzIJriYIXtpZKTip7KbOH7/iqGE82LZprFTy58CTHzDhl5f5Hx/hDQb2WobtETONxtM991z12SN89+aKF3KJq+dF+CAcobaV0ApEZVDuXuTFjxOdoeXeq2OYnqawvr25/45E/L/NA3t3sUTRl+EPJqaw747ke1YINpKoyUMiciN+BqTFS5hvucUYOUEZS/7g2J6mHub+2dXCUHXBEI1w1iTjPyWmpVMj+hFUqm2Ys8SGTe913KjFhIbQ4akCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8ZEoBcqKgzNRobQRMh7+gF+FHzys4fqC/0fXgc5Wpg=;
 b=gzx+uxpXImHmIQtPYjxY/foCuNObPwKf7ThII1D1tdQHozKy7QuU9WpNCpo5L1S1tCQbHUk3KV+y3wJbeuPTYgz7eg7VJeH4D8fA+FE+JpldBwwn2hEj2tfle40PS5vOpI+hNzfqUi3ZqB6dxCJw7q/0Mwz09tIWf5CwigoD28g=
Received: from BY3PR10CA0017.namprd10.prod.outlook.com (2603:10b6:a03:255::22)
 by MW4PR12MB7465.namprd12.prod.outlook.com (2603:10b6:303:212::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 07:19:14 +0000
Received: from CO1PEPF00012E62.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::5) by BY3PR10CA0017.outlook.office365.com
 (2603:10b6:a03:255::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 07:19:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E62.mail.protection.outlook.com (10.167.249.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 07:19:13 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 02:19:09 -0500
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Wed, 8 Jul 2026 02:19:09 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring
	<robh@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, kishore Manne
	<nava.kishore.manne@amd.com>, "moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 1/5] dt-bindings: firmware: xilinx: Add missing example for ZynqMP
Date: Wed, 8 Jul 2026 09:18:48 +0200
Message-ID: <09439b3fc9dcab12b930113e7a004e94653c970c.1783495122.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783495122.git.michal.simek@amd.com>
References: <cover.1783495122.git.michal.simek@amd.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1466; i=michal.simek@amd.com; h=from:subject:message-id; bh=q4/8keAAPo0cms9nW8wpK+eXG0kso84RLX+tawgn0a8=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT5/rzv5muiVnv05CuXi88SAtepbUm4HH74lA7jo9lCl VvO/dnC2VHKwiDGwSArpsgynUnHYc23a0vFlkfmw8xhZQIZwsDFKQATsf7CyLCxY7/7XfakLe1B tSsPm6vp+P5es45XYlGOydQTV02kOpIZGc4ob+s751Mnsklu+3aT2QYfVjbfc9lYd2lv7LXeN46 Km/kB
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E62:EE_|MW4PR12MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: dc80d267-57f2-458b-51a4-08dedcc136ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Daz3a2dW43g+irfpDPcVakQIE4+hXrRG7kzrGWNAQoIe6rpm94ZsEjZy2k2U5yG1zgu2asl+SZjbE4LD9xkUllgyv8XmWDDHxKxJzhoJEilQHtt4CPOPn0XUdASeoM1Ls8D8OQcnw7hLfVnqQPjqDDw7oZQQPJSm+q0Kkmlyy3d8RC/eHs6fjbAGlEt848OWoIrdpYGPfb5mTKGgvZXNwnHIhuzw0TRD2ux5dmaTv+CKJ+DBC5L7U1GChDQDfo5+A3yVFz2BR34Tsk7UrxwGarMGeZ0MvP0kAb2G0rcKZtOQ9gem/B0O6P3v7+6u2537qBDbOtneLcMjiVtOtVG85/gf34zFpvvFWH2hxAJZW8gkbDa8UVbztsO89HgdB/CdX7iNWp9vS6skZXTAW9mdqL82zvU5dukcttimkt88MEnurGABBIOqadb1NEFP9J7GPzr02vGW70SNwDT0qy9Ltjd4DGlyXZOyZkX1p8ynyNSicLXH/wVpl0qnowEbdv2+ePfMa1Yh9SpcpsCs2qDRLQiMytGL/PPVuWgsoqD4Febf/zvFMGQuJADdgROnHzyml+6rBkN0NwyfC+E1BivS1LZuPqPoJEuyipTOMBgZA829I7i5W0T/wBlE4NOBz98OvscdCCRYJgnC8t9yORSGIQkQZQkaXVQlR7iOZ8iR/3UJfyUh12S0xEMBgIYRyOI6kgPWgv2DPdKLkh7Rky0BEg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4zG0NsR3f150wN5ItPIxIk6fGr5S5j9Abtnd9nsGNB4Lxj74VFlSrPrNnSEJ2oUVo9ATi83LHeQ5Cag0ryMc+RujqATycPvLPuyAZWm5+N1dyAhQXzaoWimKmU2IUrDLdku5jhHVikKEaq6MIQKLXwtr4/twsSfSneozrmGJbdLHa3UOJ9HgJHiQW5AxoVHPVUosOrmAmk7BHValkpJHvGwZndcecfokfRKQkMOGnpMuoYo4MEPRAVSMPq+WFCIB4CdvPJVg2sRlIZsUjIlSk6IgS+BfeydsPjtzszR32asZxU3oaFikOk44CRi1KgYoeeRefhvvfbPm0H7ZGjWN8jnf7QKXONNvJe0bMbpLQw1V8gblJgI/CUvNl69latpJqdl7i4efC/FGZ2INSgrvQT/DyOc6tgc/QQ1BSuI0EuLy/mt5FntcfdWvp6JKaYvt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 07:19:13.8406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc80d267-57f2-458b-51a4-08dedcc136ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E62.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7465
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_001919_584099_145AC36E 
X-CRM114-Status: GOOD (  10.79  )
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

Document clock-controller under zynqmp-firmware in the binding example so
ZynqMP DTs validate against xlnx,zynqmp-clk.yaml (Versal example already did).

Signed-off-by: Michal Simek <michal.simek@amd.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

(no changes since v3)

Changes in v3:
- new patch in series

 .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
index d50438b0fca8..680082c29f01 100644
--- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
+++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
@@ -132,6 +132,14 @@ examples:
       zynqmp_firmware: zynqmp-firmware {
         compatible = "xlnx,zynqmp-firmware";
         #power-domain-cells = <1>;
+        clock-controller {
+          compatible = "xlnx,zynqmp-clk";
+          clocks = <&pss_ref_clk>, <&video_clk>, <&pss_alt_ref_clk>,
+                   <&aux_ref_clk>, <&gt_crx_ref_clk>;
+          clock-names = "pss_ref_clk", "video_clk", "pss_alt_ref_clk",
+                        "aux_ref_clk", "gt_crx_ref_clk";
+          #clock-cells = <1>;
+        };
         soc-nvmem {
           compatible = "xlnx,zynqmp-nvmem-fw";
           nvmem-layout {
-- 
2.43.0


