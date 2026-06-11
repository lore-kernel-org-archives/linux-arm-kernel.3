Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81AACD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 08:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOtJvHekvBqe134NJdsNaCbQFFdESqxgqDmFG7Pv4ic=; b=FEkQHHZi5oI9VR898qnUV8ATvF
	bVwrjuZBFsfpz9p/e/yufkyqUVSAkstw5yduSJ6wWLcfuj6p5BhavbCAjz9m2fZ5kthMJj4D+Bf+3
	n9rIS+E78Slj+FU8Ks8d/aOgvdVZMTNyZrkePtVRU2cGlQH1vL8EcxczJByK4uaImG+nHxfOJSRfp
	vA3xDqOOs3IH0RwIEAWqaj3upXbvh57ZVozMIhYC8IhyoJD+ho8UM+9TDpiNSJzGHukfV6uAqr0Ph
	2hL7OCFQxuJVwKJsH3mxcmsVxJ7ithtcgTKJ59Ho9j0tS6IDw2uLLbxzvU5BrR0ERGG1K3miEffRm
	MCGL4IZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbFD-000000094Nd-0SVT;
	Thu, 11 Jun 2026 08:58:35 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbF7-000000094K4-1HkT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 08:58:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1vjPmerkdXgvimWFm7qkSmgfX2SzDWh3TKg1mfI/Tl9j0M0RXlkL7aK0xoN+LsykGkgP7S9L8ODnYDvt8YndoaFjlGIxaVWW6X765QaqtZuWWhHN571CcJhSj1HtYnH5WMQikLH71VDkrfVmTTPEAqojz+ksOu08SHY590qxRkflYIpqFaRFLwRC05pJeYFOPojydWAkeAuiV5BGQaQC7dEP1TlGG15NKcS6XzRC2tdg9w5EZwz1iHzvQ0GudXhdkmvzfmMtEHkTFp6L72xOEuTX1oedx3VxVemjvsoYptUtZzJbbd/g4URr6VjbPjeDZpWVCqgJ0JN3+ggweQO5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOtJvHekvBqe134NJdsNaCbQFFdESqxgqDmFG7Pv4ic=;
 b=Rl4TfJpehbjy3swtdmX9DPF27Bdj/K8vGH5/uQnuw8KXbGeVz22zCMfNxQfH9A3vFw6oIE0DnrdfirjZ2TkgdSlhwe+wyObgY+55Z7tJgMOLzSBlJfC8hcDq09gDvf21+nc3jh/mrZCeDhYdtriufUx6Zwt8J/8U+itjtsvV3VV0rzgLirdYLLzDKgcwopuwmnPVKPijedlv1+81Cksj6y+Xtyv8OWldKrjxP5BN8UYDABKaMETGF9WJin5blkmvI1k9MQI++9hP1MCBK1UCe/2r81pj53uHbLgIq2yBJPK4QS5r7ifL/D/krv7qnQnKeeDTbXA0uZUGQtmmexiIPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOtJvHekvBqe134NJdsNaCbQFFdESqxgqDmFG7Pv4ic=;
 b=K6KCeDX85tbfGUesBJt8cpep2B48n/Ce0uyqDt9YEFiYVOgluK/AsY5JPyRY+dFLBPJvR7itY8kFsVH2Ut0v8vM4eVptTFB5JkLCv03ksWZDhUlB6E0IKCidBPrPRkKk7BUSgtRNuLQ3Y04mGGb4QiVJ82CFK94WgIKDTNjJxpWQIlEzuzUohxLYT900Q40FISRw4xLDxhhJZGxag8qT6BB/QuS1xmXgrkxTwMu8/YkgyLVFyAlSgWUgU6DKxZtvzGxCKmqTisbiJWtLnfs+gu5ErKc0fxVeCKQ65QfHmFrjLoSgG+JEOUFVbjttOkfn1IniRTHOEBRpOB58kha8cg==
Received: from DU2PR04CA0181.eurprd04.prod.outlook.com (2603:10a6:10:28d::6)
 by VI1PR10MB7782.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1be::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 08:58:22 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::6c) by DU2PR04CA0181.outlook.office365.com
 (2603:10a6:10:28d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Thu,
 11 Jun 2026 08:58:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 08:58:21 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 11 Jun
 2026 11:02:35 +0200
Received: from localhost (10.48.87.71) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 11 Jun
 2026 10:58:20 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Thu, 11 Jun 2026 10:58:18 +0200
Subject: [PATCH 4/5] ARM: dts: stm32: reorder cs_cti_trace node in
 stm32mp157c-ev1.dts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260611-node_reordering-v1-4-7e519f2cb456@foss.st.com>
References: <20260611-node_reordering-v1-0-7e519f2cb456@foss.st.com>
In-Reply-To: <20260611-node_reordering-v1-0-7e519f2cb456@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.71]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|VI1PR10MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: de22edd8-cbfd-4ccf-5735-08dec79796f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|23010399003|82310400026|1800799024|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: vzQ+ohkii3uop0Zv1hHKjnO92aco3cHvXtAEDOK3qajyiGsyLy/jvvMyiSJCx7xpSAKojPUx972DPGxS72/bbLq59bwEizDGa3GETimPfuQsvrEt5D2f52Qj5tDwc2WgO90nVfMKSDi+TB7TqwRjL6IrGgYkbksGXl9LgcGzdduOw0MqaX2hIZjA8jzcWiQ3BEEVOd5lUyl5dgQ7l4LEG+T1vi+UHP5d3XcnK5pTUT5iHFOeAwDEGUwxCHY1jBvdc7HlX38JEVumpREFqePiFUUyAnYL8EPMUTnWykb6HWLe/t4qBPj7flocxR8Xr2xifR16BPW6QixiuLcaUFOxUvmybHXysAYjvR5m5C+TzJ2DVnZfjL6mPoMNFLmNo874Zqr6KcjQSnN7Y/1RROo1zp1bYH1rawJU4PXHrZRGsTS48+jvasJugxqOSWyCWyWyKicDCbQoOo17CSQYLEDaiFH2nAfPDjW+Ghmcad+ZgexCf8kp5hp7NYUTirpFhnetor7f21og8n9EutBdg2CY+ucxpFyMj/fobMtYSCEXaHI8F109s05X+vtNE1LoIMKJhoCqEw5AuIPRprRQgStDgQz0iuMrAxmFMNWfCVHNQLCDgNYpiJYudVQa13FM2H3T8aeQH58yNowfXFBqsYH+9eiU7dgZAPw+FKQoVVPJGe1FJQ8u2pLSm15e3eqx2II+wzetSKYOI/5GQbR6y4hIdRKXlhjuQwPS+OwefkbO+h0=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vGoF61tMc5CrlxoAZmukPdT0vyEAJEnNGfqM60y9tx9hTJnIzegIXCkmuU8XzWFjPl4kEhAp5xro/X0l3IBjxxkVS2olQ6Ig/SBVE54jAyV/MPohI2lrneWGkcrYFvWCaq1SWguQPHLrLA++FSKKSYSLRkt34YPZz3rOeRYs2dMYzGGYD2zyq3YgPQGLtIIeKziU2RyrSNOQ3F8UCRWaz3pfPorvOcrjw4KB45CN35MhfIY+IIUgxRSIgf9+WuQqq1V16u+/7N9xcKavdNRChjUExHTpEiRtv80x2SuYjGPYHR5sPKCPz5SpRMcm2fj0SAqQqEVIKIiDmEHuMyONXeVf/VEYc2RrB6s6NNkFxUF4eYLNHqZmexdrBmo0XZrE4/7FA6173WLf5zoH141OL8LdqefZ/Rsdz8qfJNhJnJuv+0WW14eiHialT220EN5r
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 08:58:21.8377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de22edd8-cbfd-4ccf-5735-08dec79796f0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB7782
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_015829_370112_7DEBEE3B 
X-CRM114-Status: UNSURE (   8.18  )
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

In the ST board DTS files, the &label entries must be ordered
alphanumerically.
The nodes became misordered when Coresight support was added.

Move cs_cti_trace to the right place to avoid future misordering.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index 0e65a1862eb5..eaab09e1755f 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -81,15 +81,15 @@ &cec {
 	status = "okay";
 };
 
-&cs_cti_trace {
+&cs_cti_cpu0 {
 	status = "okay";
 };
 
-&cs_cti_cpu0 {
+&cs_cti_cpu1 {
 	status = "okay";
 };
 
-&cs_cti_cpu1 {
+&cs_cti_trace {
 	status = "okay";
 };
 

-- 
2.43.0


