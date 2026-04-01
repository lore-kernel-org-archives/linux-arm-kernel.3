Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8163D35175
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 10:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wz6XwalJokhYcVR1f6lT3VamIddG/z2OGHjGFwc9qTE=; b=H6L93D5YlxNqszUSZp2CenvdmA
	6jVoebcXzWAeHMlSDFmVE4miF3mC2hWfngLmRitI0fEaa5BfeLlSYNNdeWbrMStBlq2d0l0gdkDMX
	d33idjrn5vRfdWbkTBZ2ayORD4Fr2rzJ4W6zDmzoJsXlIKokDhdc9r2SqihwkcLT1DUTCVdSRxsk9
	FKsXHYs3iPI2eXQo2V5LbFlcoBLkAe9NVPG3CMiWaHvECkjVT5ytaSCDNJzD+vqcptVJLBAyQmM9F
	OOGJvJ9RM9e0jMDOKLTQJjMleFQVpmHTLqRNw6vbgK7eRpPPdCw7xaySQiMn7okGqAipt+B9WdGXl
	AoWn7TIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tDk-0000000EYeC-2F6a;
	Wed, 01 Apr 2026 10:54:48 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tDi-0000000EYc7-1aUm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 10:54:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqGscqLUDgNQ3DBAgvu215wEQmrgNVG1ZYVJhmpVPA0u/f3qcs15jYqxon6FSvzW3HzjFypSf+y5KYKtfXdIaiteBcj2LOibm+t9DU+89VxW7gGlW5Be6VNL1CMqnnpuY6SdaLrtR6ldbc2gpJPBG6OohGJo4DYjeR+vjxtMzOfL748R/BO/6ajBs8e/FFpG1r3aC7Ee3+vBgBObwOLHWDAak43cXhdi8Efq3PnXn+6iGXKevAgZpijX2DQhbQbnjMxoubx4xGr6GR5LeJj3r7Rgjnu/hZp0BNl8LTANU+KDEo3mnvWSvo+EU5V+CSYLlO7rZATBZof03EINKUQHYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wz6XwalJokhYcVR1f6lT3VamIddG/z2OGHjGFwc9qTE=;
 b=gu7ClN0kY4FEaLl4Y6m2G1tj7KPJS9NyRH4eC9+II2tqWifauq3fBob9FRtTWGbb56XvBae+1vMzeEAxYdYuvSldiNWsYkkI3mHpaEeXloyndUDihJPWiOnZJH8JkX1ebkNcpJxC6f1rTun0HF51/+jsG3WJmIu1iNR8J4f+cOvjNPd16upLfJPcoU51RDuaeWaqjCEafsQ/49lLuRU8m7yWAQIHg1lrf0nXcmfz3GnFZibNHQaUyym8HVALivsx/xjeXj8pTzbs/8HaOqulZBwciqnCsD2FKvRE2y9V8wemgNBDsJOtG4zmI+o7GpCGon8HiOZ1J+D7xmiyNfZyzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wz6XwalJokhYcVR1f6lT3VamIddG/z2OGHjGFwc9qTE=;
 b=R2TpJ+6lBPq4GdoQhA/0PJu8ETb6o7sbCjUc3yMnhf5Rxvm2FhiVONTGbtgkTaroMLvQnGeyPRrjFGAxeSSk+R4CJyqwUVjajhIdut4Dlw7VzMpbiSL07fo21q5M17Xnt1ShCKfCDDWSd6EnH5tITX81bhZsQZmsb2TaDWJd6l4=
Received: from PH8PR20CA0021.namprd20.prod.outlook.com (2603:10b6:510:23c::26)
 by SJ0PR10MB4431.namprd10.prod.outlook.com (2603:10b6:a03:2dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 10:54:41 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::c7) by PH8PR20CA0021.outlook.office365.com
 (2603:10b6:510:23c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Wed,
 1 Apr 2026 10:54:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 10:54:40 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 05:54:40 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 05:54:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Apr 2026 05:54:40 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.91])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 631As6KQ4132409;
	Wed, 1 Apr 2026 05:54:35 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <krzk@kernel.org>, <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <rafael@kernel.org>, <viresh.kumar@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>, <d-gole@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <k-willis@ti.com>,
	<a-kaur@ti.com>
Subject: [PATCH v2 4/6] arm64: dts: ti: k3-am625: Add ti,soc-info to OPP table
Date: Wed, 1 Apr 2026 16:24:02 +0530
Message-ID: <20260401105404.1194717-5-a-kaur@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260401105404.1194717-1-a-kaur@ti.com>
References: <20260401105404.1194717-1-a-kaur@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|SJ0PR10MB4431:EE_
X-MS-Office365-Filtering-Correlation-Id: 89bab29e-6adf-4ad6-5854-08de8fdd1357
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700016|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: yq9EnRvtPRFVCuy40M7NXuJycxb66d2La/eWFweoeHAEWpNOOK2jA5rpTICE3yIQsPUlsj/iYAkCtZWN8h6V9LwQ6D/bv/puG1cEmucLLf/j7yBFTtyAGY1E5S4AA77TiU7XKf0x6vGyGDNkKx2IsLNejA8gcfuZyDG0br1Hh4i0KbvcfQbBZUszZYRJK3jwHfYhDwA38U8+sIK5kdebakKkJNc1MZ6gYEal/cqmJFXFnZRCLH8FWewhDZzWPvAoJAI6UQeFho7HaeszoCZ2dWfrqHbMrkMwY2l7a8+4p5FRCFg84bqtiPjQw+F00t/CZd9B3xUcBFDmaFAUoGZzUuZ5rah/7xeO75x0yjzu8KDQLcfeT4x5Ui814/uL171Hj1MjIq5NFgTNQ497USSA70wa+BI1PSKm2gS7gzaHzlNIyEnNF3PYHMAGTbTR53mWIL+VNmusBudvj39tooj5dZbBjbFxgeHfMjmRZbll790u9fyVJ34JXiGgFWRFdcdCHSuuXpSF45GVlISH1xnLE15y7Bs9jLmOJQiThOGpeqhWb5lxoekkdfFJm/+g67MQ4hVwPKA8nSRRBsSO22c/CBQHuSYSukUe1ZlhYmGkuhvZuTdbROuse1cN1EsEeD3h/rR66F2xV/iv5lmM4RWWoqu2EjHZjFXCTeYyf64AlK1nKfrQqDTjuVqZ9KVgA3mbDoxgtj0UURyC+0E5qnyqPWYCcg/CllzZgGxwgd0ofXaDbJICWPG8UpQdghSyOTih2HQJtE8UzQFmk+DhKD40OLXuZCtg18rMJgAkkFAcjUOAcsCFiEbrPx8yRqBaTN48
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700016)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0KdlxpaJbTMYmzzw3nYZ1wGXqh6MLH3QHWENOVURX54A7BvK7vHMB0lhoZArYoX6Cqbm/PvECVfUX+q4/fvwQfMtZ1CZb0ouB4hzQ3BXlX9zKbI/XaNRdp6FVtiZlsJbv9s5fVDULgDWP31sqlN7/oVUDZqubTHfA7dHQvqYgIKbmYQro9fFzbzi3OPNsS+I1Za3yWy/lvm7KnHek3s8DrBlG+Xvsh1+TjOxne3uWcJrgKpMBQoZTuZ27kafLOnzbUqDbK+Yp59JGxGVX+s1HV4K3DFbwvMK3isSbtteLOxOEZSMB0yM0JLBpklpK17fqCmsGNzaMFZItatmj/MVi15bhzK+anbq1ZfXszFgePs0Bszb/WjvpnEr/CR3RoiR3I+Waqxq6qio3t/pCtB3iNT4vABIBlU2wzJR8G429F328O006rx+Tjpgexb5jg7U
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 10:54:40.7409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89bab29e-6adf-4ad6-5854-08de8fdd1357
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4431
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_035446_432016_42FFEE90 
X-CRM114-Status: UNSURE (   8.90  )
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

Link CPU OPP table to k3-socinfo driver for dependency tracking.

Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am625.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625.dtsi b/arch/arm64/boot/dts/ti/k3-am625.dtsi
index c249883a8a8d..b0020e667882 100644
--- a/arch/arm64/boot/dts/ti/k3-am625.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am625.dtsi
@@ -109,6 +109,7 @@ a53_opp_table: opp-table {
 		compatible = "operating-points-v2-ti-cpu";
 		opp-shared;
 		syscon = <&opp_efuse_table>;
+		ti,soc-info = <&chipid>;
 
 		opp-200000000 {
 			opp-hz = /bits/ 64 <200000000>;
-- 
2.34.1


