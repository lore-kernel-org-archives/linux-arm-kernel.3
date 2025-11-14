Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C52ECE7B01
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 12:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dGI0iYJMHbdKodYuc+InefI9A2Chk672D/5+dPTUj3w=; b=Hy6eFXrTuiX3i6b5mCKVCvLSDK
	hLKh8lTufemvU4LOUscnpLCWTBHyo2CG9gYbMLsRsfQ6fOQ9xaANy4ApINa1s/grtiEt1gX3sNOKw
	UoSVgXSl0Xerq7xzyY2JLZstxhRL55gS3PnLpq6D/LCybLonMCiF4TYzKZieSw4UJZUsZaIFsU9ze
	fzF2xrj+oD3QNFQJXrkb4Kx5BhYx+Vq/tKwD2G5HKA8Lc1VsM/CEpBpE60OJ8c2UxdpQU0U7vyNcT
	5UAdXSuB01dAVffawS5IcCxubMjNLslBpNA8Z9T6nROjRbV/D7MzLatfYySOwa9IPxsk8B66CXTec
	UDIUmZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJszq-0000000CCUK-46yg;
	Fri, 14 Nov 2025 12:33:46 +0000
Received: from mail-westcentralusazon11010003.outbound.protection.outlook.com ([40.93.198.3] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJszn-0000000CCTr-1pbl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 12:33:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BzmY+d1yoSRwl5EVR/LMc2r8LN21KU29YVWABo1b13EuEKh2BgCzSyTan0QSyb9lTJYWk18Jq3i31yHA64/aGn8Cx4odZXWh2gcaeSgsOzhD+8cZajuQJkGAH9YdAg/kZmlbpGCeq2FIVgi1VoJAw5ld5zF0R2nh3QhoVrXmKnAzpQ2lk0+FglF/z2n2NoAB8Zezkywyy8aHS91jGSqDve8slmrRkAGMXkcVLTM4Di5ndnk1QOwWTldd+qe6SvmrLb+T91b8ptoeMBtdmmkKoxf7c9cVQp30SwS7Z9SJZXr2JQldi1jT6MPSkZQpnpUNo2lRY+L4j1HeM3VscRTXQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGI0iYJMHbdKodYuc+InefI9A2Chk672D/5+dPTUj3w=;
 b=gvnRw/v+etTiXO91wSVKeokHHXA8AS8k3oCV4AoM3PcQhIjBfjHshO8jsPGDSS57IN/jjrepzoHW9YQz3HgCExPJeOwRmMcgGo/LIYM+adAJ2eTRSoiM/iBJr20TkjG6yu7EJb8nGx7RvfREcfu4sXDKyG8CTafRlj1riXhexkaiuI6XQUr+yIVXjVED/iAO2ktwru9RTkxcTFxwYvmtwN7xe661JEqGmMvy2fhGWeEeHaGDfa5/vr3H8B6cLUvOhV0DKkqblvGXhBwWgEWtzufTssWFl1kEeuH1XgIDy650+XvywsM5oq+GgocWYTO8X5mA+orsclNY2GnILHKuow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGI0iYJMHbdKodYuc+InefI9A2Chk672D/5+dPTUj3w=;
 b=qo4Gp26Nrjep008Ji8H3vfKCmzSWCvcHveTOxPdnhfB8GURMm8GoL1vo79u0K5afx1a0yS39fdEpJSWIkQCPeTAxqos1HS39Ev7659a3fMfiomhZiE0exEkq9PU9aU50B3FrPAUhzFef4WIU5C9mnA1a7P/ggNUb3H271RaE01o=
Received: from SJ0PR05CA0084.namprd05.prod.outlook.com (2603:10b6:a03:332::29)
 by DS0PR12MB9039.namprd12.prod.outlook.com (2603:10b6:8:de::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 12:33:34 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:332:cafe::79) by SJ0PR05CA0084.outlook.office365.com
 (2603:10b6:a03:332::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.7 via Frontend Transport; Fri,
 14 Nov 2025 12:33:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 12:33:34 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 04:32:46 -0800
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 14 Nov 2025 04:32:43 -0800
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v2] dt-bindings: usb: dwc3-xilinx: Describe the reset constraint for the versal platform
Date: Fri, 14 Nov 2025 18:02:39 +0530
Message-ID: <20251114123239.1929255-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|DS0PR12MB9039:EE_
X-MS-Office365-Filtering-Correlation-Id: 205f6cb2-b170-4d10-7d4d-08de237a0732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ViCghLvOKsEFIMb5rJ6FsP4jLWP+NE6Qdmrkfj0w4til6qFbp0SG3darqy1I?=
 =?us-ascii?Q?bWLX3FKUOTRL1uroqGGbVt/GSTudIbrNC9MaeEs6GgTQWhSNJ07yd1q4kTE+?=
 =?us-ascii?Q?H/iA/6k53Wda62KMJKMCH1+ptG/1PKR82u4Bd4wla5MR6C8r7KbDYy6mFIxc?=
 =?us-ascii?Q?OlQ77tY5FwRNqd+0RNdVJ0IA0v0Avt7jBWPFvLIf27iXZMC78LntORg5DvVb?=
 =?us-ascii?Q?OuQzf+rPM0R4lcz/dFZd6opq3sCaseXUaBy2/MzkNu0idV7dcH5SGOwJIrIf?=
 =?us-ascii?Q?BO3ocCR6wKaFlJBcyRnEv9zWECXYz3l4Y4ZUsvi1DfaAYDrCY22Rno6JQuZm?=
 =?us-ascii?Q?kReEpickbxlL+pKekyeLik5/84L5FRVBh8QBr8v2Lnee7l5n/WoKxulCAiuu?=
 =?us-ascii?Q?5xe8Y82/EkdHZz7PWx4DeRKO5HUrhWk+mH+P9E8Vij4ElruvOASlGLnFWCw2?=
 =?us-ascii?Q?bcWitNmQznfoMxbrhefjxN2YfkXJpIPs+ALlgWHwdolBcNIKL6C77IwSAu7Z?=
 =?us-ascii?Q?3OBO2NcIkpAkD/jiSebCnaYIXeHsw8JcxGCB+Z10ICjlkHnJHR8HEFeZqDWL?=
 =?us-ascii?Q?krjaDjDGuypp5P9fjbVRG6weIPPe/8n3sQ5lr61R7LRbjWmCI/9sheJWiMwp?=
 =?us-ascii?Q?9dImeZKIVocnNP5kaU9/bLdNxMNh/wZD47PlV0BBtCb/JkvumVY1xkzfmas4?=
 =?us-ascii?Q?p57Qkv5fpNpP4ZeQmHdgDkdklw8QdIoCDw+yT5kR8yFcsYhfm9dMgUjAc6NE?=
 =?us-ascii?Q?Df00p65GQemSLJCaz7mi/ye/uyVNTxm9aFviJUYNHeGmHZK+c/tcmWshroc0?=
 =?us-ascii?Q?5z/VTpS3YiSF8R3eiJQj1IIjlbcNGgI771rqDPN8xSwzkexSUbw2gGy6S227?=
 =?us-ascii?Q?6tW2b4Z1PbO6pou6d/my+HQ7XI/UcZZQSVv1ADiSkBk1bK9BarV+tN1EaPFc?=
 =?us-ascii?Q?hefUKV+Zsu9Kxr5f6+8ghzIT8fymQ5WGAx/CrxzDdd8EfUyzokeZlI+cbBzv?=
 =?us-ascii?Q?+wk6tlnpKgwAiC+W0Wugufgp0rAu8K0bGyetThShpCHuZr1iAMimzVCnK6I2?=
 =?us-ascii?Q?P1ZudrxsJtk9hHmpc4dYhpg7+JQXI8uVsvVXMHa3Tr1P1VxgqdhhCug0KHAZ?=
 =?us-ascii?Q?Da3w/ht62QBgkkDxSdSmoViDeK7StSc4GzgB+7ZW19/dqQkyZdmOjtaRjooH?=
 =?us-ascii?Q?7FAHB6RvcjVOgI6TAUF4RJdLvow5YuFdysLvxvPyFFZ6qXgrkyvPYsj54zoO?=
 =?us-ascii?Q?GsNG2uKCAfOrznDBYaAYfk1//Jjd60moxsr/TIJPdOT2UysDn7IOVXrSGjfJ?=
 =?us-ascii?Q?Z7PYjQGIGdZNkLczdxwH6NZ0DWxM8CSU51SPkAt0vps6iV7ia/jhpNivU5zT?=
 =?us-ascii?Q?aIKWYLqalZ26i/OGtBGbC0G73SoF4Fp6mYKO+iR7SaO2s6KI5RZKS+2zUeUa?=
 =?us-ascii?Q?9x5vW9WL47AGUsKAsjzX4wThNQ1dfhi6/kU8fgyDP/IOwIRQ4V2dUrIDfJFM?=
 =?us-ascii?Q?Ite6hwkc/zW4+QFf5goW1fs5P9czZpOYQwUyJmtWOxHGv0T7ST2ayLF1PCE+?=
 =?us-ascii?Q?2bJCd/JXWxx9VwSQ/jI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 12:33:34.5580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 205f6cb2-b170-4d10-7d4d-08de237a0732
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_043343_538816_66A7A4F0 
X-CRM114-Status: UNSURE (   9.78  )
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

AMD Versal platform USB 2.0 IP controller receives one reset input from
the SoC controlled by the CRL.RST_USB [RESET] register so accordingly
describe reset constraints.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v2:
- As suggested by Conor remove oneOf stuff since both platforms
  have the same first reset.
- In compatible else case drop maxItems as is not needed as it
  matches the number in the list.
---
 .../devicetree/bindings/usb/dwc3-xilinx.yaml  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
index 36f5c644d959..d6823ef5f9a7 100644
--- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
@@ -47,6 +47,7 @@ properties:
       - const: ref_clk
 
   resets:
+    minItems: 1
     description:
       A list of phandles for resets listed in reset-names.
 
@@ -56,6 +57,7 @@ properties:
       - description: USB APB reset
 
   reset-names:
+    minItems: 1
     items:
       - const: usb_crst
       - const: usb_hibrst
@@ -95,6 +97,26 @@ required:
   - resets
   - reset-names
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - xlnx,versal-dwc3
+    then:
+      properties:
+        resets:
+          maxItems: 1
+        reset-names:
+          maxItems: 1
+    else:
+      properties:
+        resets:
+          minItems: 3
+        reset-names:
+          minItems: 3
+
 additionalProperties: false
 
 examples:

base-commit: 6d7e7251d03f98f26f2ee0dfd21bb0a0480a2178
-- 
2.34.1


