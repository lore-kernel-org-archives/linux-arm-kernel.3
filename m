Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6364CD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 02:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPBnHCMcJan4ctGF+zcZRN31l++FIMVrmZPVx/pQOgU=; b=WUu+ZC2i7+AqFxovzIym4gLe+r
	2TmXSiyOPR3sXpGw+djGssxWPPiQxX3klS88ujnWpDiF8EjXWVQr6EzF52LuZuizuYnVuVIGbSVQ+
	vH2EQNvlDKukXVnnaQGtp6OmsZdyU3bWLYvsuBDnSV+o6FxmeWW4cXfgU0itnqpux6O/CQ1EwJ6vx
	NiGHDLvJTjwA9B8wQOwwpW9reksk/WeTEmeNHkm1sk89SWcegXAfn5noIbkUxXRHfzMirzF3GDKvo
	qiWz1/SOChD7dGO1dHzSd/cudVN8rnoEHHrY3rh7QmeMOxuyS8zBQrc9xCJ5Y6D9IhR7D+as5Gj0j
	8BMS1Liw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSmmk-00000006dcF-2kbm;
	Fri, 29 May 2026 02:17:18 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSmmZ-00000006dXi-12RL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 02:17:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGzk8AGYbk/0hyW5apMfQJSegGDTeQaO2fkegJNeWKam+kg+52WGEv9EdsRXcH56+jczdVjCP9DKU7d85+3IO/azXXSm+V0f27OBzMQIqF5xFzs0KmfZk4fHT4nqQ3oouNKA74q+pdYpasDhU3bcEs1yeo8kUJa0nBBbOk6l+WaZQq3LnLt6m2gw3sBWFaOuNjn4olCpJrc+PAiLtEB8dGR/TqBNJ3AJy+CCRSgY+JO8OahlaS8ckemuWb9hxFpedYSprHs1tNMkIuWc3/Gzg+tFXcQ6cUQoDRn590V4zlIx0HOoqKZjMK7RCBdWGBPu1Ho9HybgkjpkatWl/Qzwtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPBnHCMcJan4ctGF+zcZRN31l++FIMVrmZPVx/pQOgU=;
 b=EWVlzov9oC+mdFtW/pJGEFfhSqxX0wp5D8hYXo91fx6122Y/ungprzV1iVHEem/FbSQdNj6uNCHTPY4WWtox92VEmmdpMuHmz4n+fTbKb9Vi3dwKaOUGSkVUhOojyhzD5EUKPIzZ9uSgRm3kYaVQ2JPdByz3uJJrvKeK6OtiZRKflsExlvoRiH5njEjnYVW3O63XwU2QLeY00O4B+xd9mK3QQoQkwrgS+b04oVVjK7c0N6LPTCoFLumKGib+wyYLPR4/RKXIvlCDcbCTQtCqiaQ/GEdJqHg32Ya8YNIHFWEZdQBdkrFdz3Pv9/wHmNqfdYMwtSq3oNwUCagXlp8RoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPBnHCMcJan4ctGF+zcZRN31l++FIMVrmZPVx/pQOgU=;
 b=HWlD3u2qGcxD3/TtwjuZQerk0Vzy6y8Yx36cLMVc68zvYXcug7G2NHaCiqI15t8RRhgmDokU8UR5ZYFHM9/TUsgKQ/Zgov4X6gi2F1OpHKTsCmgX3jIX6IezH3K47kKN7osyAQkLnZgnwxy1ZL+4g9VKjDdNKKE+DeUy/VMXBNA=
Received: from CH0PR08CA0006.namprd08.prod.outlook.com (2603:10b6:610:33::11)
 by SA1PR12MB7039.namprd12.prod.outlook.com (2603:10b6:806:24e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Fri, 29 May
 2026 02:16:59 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:33:cafe::af) by CH0PR08CA0006.outlook.office365.com
 (2603:10b6:610:33::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.14 via Frontend Transport; Fri, 29
 May 2026 02:16:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Fri, 29 May 2026 02:16:59 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 21:16:59 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 28 May 2026 21:16:58 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>,
	<ben.levinsky@amd.com>
CC: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "Magnus
 Damm" <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	"Tanmay Shah" <tanmay.shah@amd.com>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v3 3/5] remoteproc: mark wc-ioremap carveouts as iomem
Date: Thu, 28 May 2026 19:16:35 -0700
Message-ID: <20260529021637.2077602-4-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260529021637.2077602-1-ben.levinsky@amd.com>
References: <20260529021637.2077602-1-ben.levinsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|SA1PR12MB7039:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cf804de-6909-4263-37dc-08debd285d66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|56012099006|18002099003|11063799006|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info: Fay+azgUHKwL555qMDuV+ZVKQvN2SwqOnEqSuL/QLCcVr8374DBCLeO+rq1FXuuBFuuAH7aeuX5I1VzX4wanlOoabXFOuUdqbwvX9Dh/1hDE2GSV3iCdaRQgYSlxkBxgfw4g4Ew7zzmTzpsZnSnWHNz8tmIkClqRxxMqgB6ZZw1EnQz6lQiAJU+/r7SSuRdqcAT7ZhCQcodblkUKhDG0pdqzPY7dtM0lLwEVEwt7WGpoxnohnLpHFYFw4FVC93despdZ5qKTKOoud/b8OyyS/DSVXT4SEcMOsa/yMxSPvlfZh+qN/Tf71m6ywYCJ/HnSoBqeVV5yKvduArnHT5OICjjataYEhPd8Q/YYo9tFCngBPt20wGmCt7gl/lSDNA154s+VxpdW+b6drXyCjWiPt3G2TRq+7mHt6AKcr43HckU8ZAnWL1UWbUdVrs4Qa6K6CEd+LSe3li+K1wzgLkDfpNwderRcUpCT8hdTjYKD0aPGffT1Y40twM1okokxoRI8LoOq8N3CfwvHi3Ng7l0JGRaBdZTnKOf6MsBAedGshqT/dRnl3wDU/nbFwOZfRKkOoDiJidK2Us5OBcPKscxEhTjw5zdQj82xUVMiL3HJwrh7DvsGLPKi6n5Mbk+OnfIP5pnlnDTaD41UUQ7iBU29mCIC5gUAiYff/znlRr/gl3Use1QxCHu1y8xjcri0FPEnGOuDVBUocjzJxHczXbuLfuWAcIc6uQoob1PuEGpFtas=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(56012099006)(18002099003)(11063799006)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fAdSOttbnIX7PY9BlZRxYTETvrKvBkS1qufxDtz2mjB0yRx6EJT6/uImYcqKEttzSkJOkZ/rHfKW7JfkhRwI2YsGTCEGVY9sM4E5WksSELnh2e98yfjThV68Z/hSf1p5cfbaiuJg57XhsUCaZJCoZSyF28aNBhzMQq6y4bKkTW3L/X53riPJV26EVVz3JkyTGm8w58uTsME0fMbm9kOyX4PoApEg97Gt6OrEgtfG3OXqbwEt7U9MhFmzHq53pztj+XndUWQSLZZAa5RXr21RnE5O41cMworex71LFxpBMLONJhDmXuxJ6bJ3z0Td1FP4A7WdBOqCfghukYZANv/7k10fLlJgvW40m43OsPM4TN3dYfJC2UAiAryWoq9QFob22DWUbL7Lt7EIzZM3k+4HTl8AXzZ1+gu3qGFEMsOgGJt4E53zcCYyJtIhltU51ATe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 02:16:59.5909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf804de-6909-4263-37dc-08debd285d66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_191707_287926_135CB758 
X-CRM114-Status: GOOD (  12.16  )
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

Carveouts registered through the shared wc-ioremap helper are backed by
I/O memory, but rproc_da_to_va() only reports that to its callers when
mem->is_iomem is set on the carveout.

Without that flag, the remoteproc ELF loader and coredump paths can
fall back to normal memcpy()/memset() accessors instead of the I/O
helpers used for iomapped memory.

Mark shared wc-ioremap carveouts as iomem so the framework uses the
proper memcpy_toio(), memset_io(), and memcpy_fromio() accessors for
these regions.

Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/remoteproc_internal.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 46080c1c030e..9afda697271d 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -136,6 +136,7 @@ static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
 	}
 
 	mem->va = (__force void *)va;
+	mem->is_iomem = true;
 
 	return 0;
 }
-- 
2.34.1


