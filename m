Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D6AFA1FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 20:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNmqoevTMA7TZOfLTXuBEUda8+Q04h0r5OP6u0QNP6M=; b=a47i1hKqVotdcOhLsxCSHZHwIY
	OdP6gmuykOYkVFlFz00JxOrpIaCdGezaep75YthCs30S4CzwPLC4rMlJOz+TonTaN9igp1J3uH2lh
	85m3njxjKFXkZyZadzfXYOttnzwcrojjOhSEfzQ9Kwe48gjo8JpiJTE2/duqRI6TqG6iL00d6LhI9
	vz3O9wIOAHSsdtP01UerwlBDpFinTYXsg3k4pOzTcuRIgngDWalr+mhmJtAIWXeSMpg4717t0xn9s
	tserD51VgCntI+gsMLDScgoL6/vtbDAh0lR7QIdxWCmJzpwXsACtTINZV1l1pxstvAknUfb2ly/Wc
	NgZi+l3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFe9j-0000000Aifh-29Gn;
	Wed, 22 Apr 2026 20:26:44 +0000
Received: from mail-eastus2azon11011021.outbound.protection.outlook.com ([52.101.57.21] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFe9g-0000000Aiey-1FRZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 20:26:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5/6R7RnSTXGp5lGszw30U5u38HDba05BejnD0Ouynz4j09qodse/BDtKGESQSDG1WL14NE1uwQSPF0mE97m8V8W3Qi+JXNUHGZo6O1Yn068Kr2nK4UYKsozVEPvD8zvYbmuuxaUpc8HQ5IAbmsiqESDfe2k2oPC5fglkrzAgw08yVeDQcn5em+haXfVdqGBBR4MtVynxU6EjBZH9veBkN+lnRASyO4d8AcS5MbEiyNiJVspITQdHIUblPQ1k1hQ0B1fnwDz7VsUydkROicKhBdkEemj90CmyagMw3lGSpt0TtG/6mv5HbIQJwamflxwwpB/uSXWwtA2fKggnieTTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNmqoevTMA7TZOfLTXuBEUda8+Q04h0r5OP6u0QNP6M=;
 b=n7R7hc7TUS6b2mlBOE0YSeXio1uPmTDjFlea0Oe0XtAgneNDrLvawnwVBwoMgYkDDWtwayVec/NVu/++wRZ7kpGgEGApmKA3U4YlaYSQ6VJs3XIDdJKc5W1uSpN2O8LBb99Lp2FRXFCkMgjBepHSzrLXl/mfaJemgNE6rXpmPj/ePQb1dMfCNuCEfiKKM3Pcqb1Sc4UrZE1KcLt8jp6bR2j+S1gh1WTWPiQarj+ISBkOTMo/BgSnvyNgrB8yYgoSGyZZwiud2UPX7L3BAVbolTgptzK3k6ySdpMYhlnSew6a9XkskCz3//rrVm1vfFEq+LQksohajoEdusmeWP10JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNmqoevTMA7TZOfLTXuBEUda8+Q04h0r5OP6u0QNP6M=;
 b=iinbwvFQ3oTPOepVC8L35poXfa1LYXwbEjvNFSyxtRS+yy/Hxu6DF/m3HFcVpnXi5cBfoPUxYrS8VXzOMF+8hcIucUL7HxQ7O8YS3Rrp7ERhp61eHL91/98o8ZTLymIXfRVG1Rf9udR0AbTjrqRUiqypuvtM6P1HNkPODEoY6Wc=
Received: from PH5P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::9)
 by CH0PR12MB8529.namprd12.prod.outlook.com (2603:10b6:610:18d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 20:26:29 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:510:34a:cafe::b2) by PH5P220CA0012.outlook.office365.com
 (2603:10b6:510:34a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 20:26:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 20:26:29 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 22 Apr
 2026 15:26:26 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 22 Apr 2026 15:26:26 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <michal.simek@amd.com>,
	<ben.levinsky@amd.com>, <tanmay.shah@amd.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: remoteproc: xlnx: add auto boot feature
Date: Wed, 22 Apr 2026 13:25:57 -0700
Message-ID: <20260422202558.2362971-2-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260422202558.2362971-1-tanmay.shah@amd.com>
References: <20260422202558.2362971-1-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|CH0PR12MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: ce6f0573-82c0-4120-5d68-08dea0ad6f60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: KsyUV9oaqKSClj/K7mZNcXUyi6jR87nBMl7KBKakaZyvcSw1E4on6MZpkO63V++wdC7vkXzY8hPJeiOT1R3ki7rqpPoIj4V8yApDDnGumBE5dUYoP2716/Oa1v+vQnDyn1MtDRNLDCbvZDzpaPzMtodxacfHAtgAlqhXbgRMrTrsCxacVdJlqMXxaklxZYvMlmmYUYEOXEwAynpMEsNok9yM3drTo5WWxlISPiZZkB4/VsrrffkJW4yt8cdEEiTrdVFgnbunz/ppSHnkhhy2rpUjFNF97gnFUNvUUtYzLFoFmP7ruVJhlpK3HzvPO5nWpNssZygCwYxtY4tj65csEhS4nQH+JUvmamiQ1FszkaWAMcFMkIW0IhpuJ7NmatnztkMRlajDvzhaYBGRZFiTLb8SEs3oqJSoSt4N/Tfb1fFy+Gcur2Be0LNspgdB/auYHC+4bbqrd6Kqtg5VKGaRjkjAUfMfqWogWTssjTobflqSJJpBwvOitUGckJsemvwUwM+Tljp4DvFIk1MyHxe57mizwq3wO93ltDTp8FtA5DeVk4FPRo4msI5aeEqlmbg3w3b1qAxYZYpIDkwBq5wKbRZkpTcB9f4NfEw5BFhjvNOREN0Kcr/5j9S8RUDTDHDfMt5WlyOQGnV4cS4AJg63H/yZ2TppzqMPAvk/vAEqRA2H41kY7uBJGhNJpyaFHc3rYC1ZoaUYod3vLSLUHeMq4AACc0YZEUdHhceZ1Yyx+AdUvOujrw7kRPw5aQeKtw29se26pr3cAs7WIQX36yAfIg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lH5SAxAGsL+yuG9IO/ir7Hv0rEnymAFFQ8sBhzqBnsNxfp4EAJpJ65TRzSDs55RhE62W0RljxEvuW2oXRyIEIP8N0RNSWXVOZkeLSrSNADGtNpHn+krJRqtrk2r8afWWCIjkXU7wCNO5/fOMwzFxdLGivOQdB6i76hIMJ7yZmHBCO47VKL7btAwBlDQA8Fa/32FgBJ/22/5qPnGek0FsCX02paV/s5dipNdcvEHgFWIrCFevTSq98pM5a4hILzGs2LfcBKGS30/VCtNbVk2R1XxuEpsnxCy2nZeEKGmWBEdk8xlEJvNGOTazZWfo4swK3zrCu+TTHnOCfk68zrkQYFgGZGyG01Mhhu3yxsvFOc1JgTwFY+SlwzDN7ahZro34fy+DdiwUv4EWN9amweVFpMr7obD98A/TD8IT3XlyBVbUIBDXlYAe+Rvm+/rvVQXF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 20:26:29.0703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6f0573-82c0-4120-5d68-08dea0ad6f60
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8529
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_132640_402992_9DB5D645 
X-CRM114-Status: GOOD (  11.71  )
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

Add auto-boot property to notify that remote processor is setup and
ready to boot. Linux can attempt to boot or attach to already running
remote processor. "firmware-name" property is used to mention default
firmware to boot when linux starts the remote processor.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 .../devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
index ee63c03949c9..0d27260e3baa 100644
--- a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
@@ -135,6 +135,14 @@ patternProperties:
           - description: vring1
         additionalItems: true
 
+      auto-boot:
+        type: boolean
+        description: remote core is either already running or ready to boot
+
+      firmware-name:
+        maxItems: 1
+        description: default firmware to load
+
     required:
       - compatible
       - reg
-- 
2.34.1


