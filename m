Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71115CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHvnyER8plpPnPKLZZmOnR/AFEmekO3/1VFvFc6VYFQ=; b=OYwbAMwhHs3aRH6yBRAQyFxUtC
	tA8+ckVVRWYuhHy2Y7p0FXJSo0ZezgseTs+zUMfQE1iFktjg9aVtuSgVKw1NMkAYejhIqRuc8fjZj
	vWiBdwwDe7wlslADUPKO/AK1AhoeowIqH6FyZALKMNRfRv0ZccD8yNwCCUrfa+foz1H0XEaPvno7V
	BXmFoWsOHeANp2chcAygN2Vlv1UwX03Zb4kzYv1Z0r9zyUf+6kydJNc5F8OT9hdSta8Z8MEkNd3EY
	i11pn0PnUeufT2Lh2eC5QbHzMLK0PZ7KqrJstRD7JB0JElUcSJrujXp2LnX6pVMv48Vxzo/yqiiWU
	7r/kVOYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnGj-0000000FLKO-0iOP;
	Wed, 03 Jun 2026 15:12:33 +0000
Received: from mail-westcentralusazon11010026.outbound.protection.outlook.com ([40.93.198.26] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnGg-0000000FLJg-3SU4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:12:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpYiLUysIwTHORXVP1YETPri2nn5VOMgaWAMCmGnoC/cZyjX94Koj5FfcszAO+iFFRLDqinU2Gx6ncku4UQJnXBrJ29izoyUqDOcB1ZGrE5lbf5tbUIV2M1thggNZtXW59+OmRNEhDJ5IiMsfwjv23NmKYZ2x/tNC4KMG9qMbPBwnlEDYWCuskTiCbLU6TD5F+gkdaiOAWouZLxekJnvzs5LK5NiSubGbSDxKk62f+QDqWE5iVSCu9baObdM5MMQ1oNbDeWfj9bs9TCpAXLVyvwM24u1AmY1i/qlz9Kv5KjE1AElMEstfRiROGiEbxug1yJHmNgUM1v8RNb3bc0M3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHvnyER8plpPnPKLZZmOnR/AFEmekO3/1VFvFc6VYFQ=;
 b=ZpX6FFsmGocrf0qiYS64KdcsChKcVXa/5i196de1U2+RU8ArHtTle+4Kr7pLj5kr7kzYy7UhCJ5Cn+bL2VXGFFZqzQuWceizE7dw1lmie4NVIFO2lSgnh4LT/K8nxAcpv3OCsFNkmI4O7/8Zw+qDCMfy+e2Wx7pHQJNCzpfAPzbg86IUUqWFU/Rfh+usw821Z/8b5sdeTte4APz0uwp5t+g8Roymd+ICsCVl4AMO8QoSrpLyXJobW3g42xjNPclWOiPDuKVBTeOzE1qxIbQsZRWvt+mWeKiWz3hfwNdWsoye2XsEGM6QRUob/ei/ubo3VkrlXPprF/coFL4k8/sivg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHvnyER8plpPnPKLZZmOnR/AFEmekO3/1VFvFc6VYFQ=;
 b=VyKsvai6MMrS/9ci190ZlVEa8gNu+V2Bkmt/8JWLIs/Tu9F7A8I4qkh7NrRHiOP9HWibQ4dridnjrNMHOuQgmqMr0/yL1DjRBStyV/B77qKegGjp5zzX3HT2hlsZTSlmJbdFX6Uknj6WSMrfpG07rT+95zyQyUEG4MyUqHeVyD8=
Received: from BN9PR03CA0196.namprd03.prod.outlook.com (2603:10b6:408:f9::21)
 by DS0PR12MB6439.namprd12.prod.outlook.com (2603:10b6:8:c9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.7; Wed, 3 Jun 2026 15:12:23 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:f9:cafe::59) by BN9PR03CA0196.outlook.office365.com
 (2603:10b6:408:f9::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 15:12:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 15:12:22 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 3 Jun
 2026 10:12:22 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 3 Jun
 2026 10:12:21 -0500
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Wed, 3 Jun 2026 10:12:20 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "kishore
 Manne" <nava.kishore.manne@amd.com>, "moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 1/5] dt-bindings: firmware: xilinx: Add missing example for ZynqMP
Date: Wed, 3 Jun 2026 17:12:06 +0200
Message-ID: <da152696e367eee8717a644d9303d27df1a3107b.1780499520.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780499520.git.michal.simek@amd.com>
References: <cover.1780499520.git.michal.simek@amd.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388; i=michal.simek@amd.com; h=from:subject:message-id; bh=+PU0EYT06V/4FN2762CEzZtJuX8+TbcCUG0vyAhlH30=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWQpuLg/VgiY/D+pKW+ymKtYDeNGPcn83Tpfdu1devbYj foAhvWyHaUsDGIcDLJiiizTmXQc1ny7tlRseWQ+zBxWJpAhDFycAjCRZ4EMf+XkgmZKKvyx/vVO 8l5306o7E5m/W6k6zRHx2hfM4sser8fwP//k032SDByHJzR//s8jo7muer7lK3kN9WdG8WaLVtl G8gAA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|DS0PR12MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ff4ca33-c963-43db-7630-08dec182835e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: mH09gTTpu3IvXPwwxPNn2R2jVWRO7oRbJaqLic+WOZL5DShvLeCNi2PlZb0p4R3Sqy5ynsnOkceaYsEOc9EsMfdaUj7HGh8Me65DD3BOYR2zuVwjnDZBUZGeArF9C4HjmQfbz6jGjf3Xf6bNZEgbQJQ2PUw4ZvVV9DgrXdnqKe2NWzBoWcSJw1NFPFPge2BlqGpP/zLV4yXaJ2DneMSGfPaZWRv1LvtqCbmHJwIoQlypxdbyXVWhLcDJnfM0WNTNvV+lpj+5CuQCLfz26YXQp55Yy++Uvdjx0B+++SM0ii0nBziXrMnNYjFH/1A+fo7kXqbCH5ZlXTF7bdBTbs4biGDcCmgFQqApe02b/GSLlYitaY+nNHTYlH5j6sY+sJCZnVd+yJ9QQsffJZUXwjrTPFuVpSLGqJ/z2YSPoRj5fJ2Oghmpm9QQm6cIIbpE7nwCejayajsnnIpcP49OGJiyEB4z+ccATCK2nwGk+/QHtjjhXGVWAdTzmBRbQdzD/mB6e4zwEiUywzJNeBFoWT5uF9NUvI9dp35IlX0yZGvuEHMvj85iYes6P57xhBKdiwG6AcusZkO9LCfaSNvRf1+qJNX3oZMIiiuW8Pgi/OUlZTo9c4ktbS5HmR8qKaPHzMhxGPBDTRDr1gDE4nR7HNrsV5zp4mYacVHZIognTQA2pRQ4HVDZkwfdwcZQ12mIpQRYNGQexEDwaokI23XMtDs5e5KmmPqbKitIaNFepyaVeRs=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NoVon72Z8toSvRT4oMzoheAeeij7ZSmDIDvoBVxOx8TmmxHPE9Mpx3nabt0yhcncrM3ZP69tda54ru1Tt9JnMSlyOmx9WS0+5lKWr50vlEjNVPk/S58hXWDntyieAw2Rxssj8u6ijlCl0YfZ2W4TPHm5xtCzfJ6cQUc1aPF+ykgvceKA9x1fig24QRJuHF6bAr89duSetrH8vThuSZ3pa8FgoFqtY32CPcT1TF4PXnJcxugI1fRhTgFZEltmQhS2UQ+rM4QJ2S8FasfGHffxELxgOfxiVL9HMmTRXmu3i8zpr7ZROSY6NAlRddcZ2Oj9g2fMmRYdfx3SaCPW34PxQlribGWNDk3vJCfY2JFvkPDL8aq/4kfJnChmfhKK8j3xuIkyZ6KXSnwMw//PX0aEHxphL9sOJlvIS78zYjQTDshyL8498CGHrqT/K0OL/AP4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 15:12:22.6677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff4ca33-c963-43db-7630-08dec182835e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6439
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_081230_863330_E3FD4FAC 
X-CRM114-Status: GOOD (  10.61  )
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
---

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


