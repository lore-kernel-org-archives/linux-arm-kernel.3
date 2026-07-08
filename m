Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F583C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 13:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gntOwzFKtescMFhT2EhV8pgjBFcz+C06+ta5dBrFjaY=; b=h8uknFD2Lnpq9AlnEX/BZiV0md
	j1+j49fAcdRZCwJWPAtxIbPb5r5AI2fJHjPmF/ChwZvD1rijEu7ezU/81EfLsNNyshOgXn5E4vrgh
	mcDv4bE7jTKZj9QMDVjxgGLkFUvqheEa4032oVxYpGrONg7KO1ZLC/RhQSeq8Mp1da7TFwBQ/wpQF
	xP2lF/jEgVg0GzZzWmNjiQpxzCqwAsEuG9EtoX+VKcWh76Y7d1d7W16Mvqv5VJXxTsQ2WdtygnZmM
	s8lIi8be/uDpHQcBeIk7SZ2HSqmNACjPavnFJ7zU6I7atf5ebtdVJkx+BeupN2DpElh3lALef2zSy
	MbI1ckqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whS5G-0000000HB22-1Cn9;
	Wed, 08 Jul 2026 13:13:02 +0000
Received: from mail-eastus2azon11011034.outbound.protection.outlook.com ([52.101.57.34] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whS5C-0000000HAzm-11WL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 13:12:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSECJYiYfmJ4VhUD4eq6Mgbm+4MTsphoDVUDd0LvAGr+8b47kPipIL8oXSc8GW0hiNpntVKuT2TsS71ukwFfyhf9YqbVGbQEUQj7K0tVs4rAlUJ3GtsWdo1XBblEAjyOULuUpEw5K5gDoV8JV+PxHaXZdyjKw4Bug/c2SaL8SmJW/YxHUgj5mIH23SvjNUbLBjquBycu6b9atJttD3aLyFMJlTGguDtPilScuXh58z0WOg5D1g++1f/b5mYdRxsm15ZZuMhyj3D8Q7yxpSWiXwYU7FNtfJL/PjWkNTfGb5zNgqNgb+sXtCc6K3ivERbCqyUgzMNa8F/JB67LOXfMxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gntOwzFKtescMFhT2EhV8pgjBFcz+C06+ta5dBrFjaY=;
 b=s/BNIyz7lpKUdYyC+tZMWtKfNtLUpFrLpP0SBMfUr5Qn3KIHjImvDfdUKQ4+0ZxLzMJNwQAp4mLtpI6zMFnOAEQHKmrLaZtyoiit5K2Bney1L2Xlmco/kbG63k6gX8OucQGKhNpMOIZovriX2eGXbtCt8KLz3wCLMTu4qiGtOiarVNnR+c9+X32ZZfIiNd8U4lARDHyh3HInR1gznh1daR/A7WrCSj/MpOa9j/k+yLg7OoUm9lXHtJFPAbBPGBwpSRKT1YijwtcQNYXidWw4PyaYpfsJKuMB6CwuCdg1nn7GT3uPOs4uYz3V35R7Cb32i8VLOXntSDhcWowhYQpi8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gntOwzFKtescMFhT2EhV8pgjBFcz+C06+ta5dBrFjaY=;
 b=G9qKYa9Hn4ZVwd3kub9QWjq+SsiN6AHTpIUTfoGzatTWmgw4htq5FVCNgov4hdYQftghw8ueG9GegGLw04D/zcIiLkvvR3eVtowwkuZ7vQ7JHY8sX/d+AKl30llpJ1rwLUtehixAUQW5ObzrG2gDRRyo46g+7fLihC7vntDLXrk=
Received: from SJ0PR05CA0036.namprd05.prod.outlook.com (2603:10b6:a03:33f::11)
 by PH7PR12MB8779.namprd12.prod.outlook.com (2603:10b6:510:26b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 13:12:45 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::ab) by SJ0PR05CA0036.outlook.office365.com
 (2603:10b6:a03:33f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 8
 Jul 2026 13:12:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 13:12:40 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 08:12:35 -0500
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Wed, 8 Jul 2026 08:12:35 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring
	<robh@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, kishore Manne
	<nava.kishore.manne@amd.com>, "moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v5 1/5] dt-bindings: firmware: xilinx: Add missing example for ZynqMP
Date: Wed, 8 Jul 2026 15:12:22 +0200
Message-ID: <12dba601a8b631e565dd98e52a89b0ec18fcdce2.1783516336.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783516336.git.michal.simek@amd.com>
References: <cover.1783516336.git.michal.simek@amd.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1509; i=michal.simek@amd.com; h=from:subject:message-id; bh=aOcMD/LuV1/vAtOT38CtZfDM+OvNBaEMwW/CWQ4aT00=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT5+ezS5/t2YoYIt13/jlvMX462vHnise3uzQkPPkw/l WjkeTRYtKOUhUGMg0FWTJFlOpOOw5pv15aKLY/Mh5nDygQyhIGLUwAm4nGV4b+3l94jw4vXT+i+ mG3VYd32vIH9xUH5tpa+c5IxYVtnzHrMyPBCuDLGZZLP+xXmrtPvXV/QPGHmqQC1uqafKY8kfZI m1nEDAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|PH7PR12MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: 16bea52b-62b2-4359-e8cc-08dedcf2971d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|23010399003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: EkTMR68POKiTBgIZ4V5VjxY1yAf/INFbzymAZzWwsK7nlXxBY1twpvT3N9NBn911CQlbJ5Vxehw0mT1NuF9oGWMvRJiZbiBGksm/tMbBZgxOsUY+DF4G5aLXEFErDW56UzEyEGhYGPMNdbRmB0JkjZNds7vHDaBVwMOGRyifBoaI0Bv582NI+8grgBmQ0y6lAhONzLpnFlETFcmBor3Sx51KOv9iziohFGkWBTQpwcRfCGB5Q7boEUF32zmdtVK7wXeRcVnGCwuO8dAD0Lx24EVeyb6wmrxPHMBLiOSJzgA/ocPOrvOBxrm5PHvfKoMReyJFzNWH/Xvtt9sodUNMcxYdfpX5kQ6GUiBE6vQz5Vw9eNIELCKefVSAtok/yQ50u3pPBwoHHD/0AitCsKHXrUt9aTCDbE5KqA5HmzXrqhZQjCOSvHOlfyTbY90TSEJzDQvVoukVljyW57beBOnzDDyEzjmIxNVTsnIVQOCmhF/0m96S5IJ6rg4LUvfUCQzCjbxNC/88qkeP1WG6bXfrjEw1Gbvg1pf50qCN2aq2Et+IeExZjqJpF5NKQlEud1kk9j1FRbCtF1+GayUly1596ax4CKKDER0kpEVpxiAluXp+AmR1o+HbMKkrfgRK2ewCKM7FNvbSclzVpw+rGjIJ+JsaKqk55Pt/+dcG9xhKFd6aQq+4Jsspd3EEe1upjcs/BROuK0+2C3L27LDjIiLh0Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: R/S1WVNhmQkW9tyz8EF5qhAZlq0YvCGadJ61ynT/8gHbhIIeT8zQzoNPQ4Nh3qykd+YIo6S0KpCYno2hcNHwiZWEPnXJ5XOC/at3RX3jHI1PYG3eNTTNXdvcw88/u1s/W5bwm1DE6Rg2LCc12X5kG0VzYSyGneBRZ8myM7vV58oNpkjZ2VUybr00zoaTEoxb+FZ3dWPBbREPIru11Q1BGH7Us5kpmc0JbKRn3koTVBdti2z/4aoMxir7BtHPEa8uiq/bMQ/evfmmf13Oa8nEejSwvmMhHFE8bNNFFRTijddCIxuugVDy7rGk38nAJRVum4YnXZA9eDZH5KATekd4EfRRaUXNgMPwCYht/HoZvok8AZVbigy9KJY1i/mA4bhiUqSbXoBWPVKRbBMWRtFtrU3bE15QGJQ/D6Z65AR0Jj0EeSKHARgzFjVvYEJa2df2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 13:12:40.7607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16bea52b-62b2-4359-e8cc-08dedcf2971d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8779
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_061258_314652_4613B9CC 
X-CRM114-Status: GOOD (  10.81  )
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
ZynqMP DTs validate against xlnx,versal-clk.yaml (Versal example already did).

Signed-off-by: Michal Simek <michal.simek@amd.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

Changes in v5:
- update commit message s/zynqmp-clk/versal-clk/

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


