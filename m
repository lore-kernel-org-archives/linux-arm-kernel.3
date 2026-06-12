Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22120CD98D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 12:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8AIGBBD/cubOyS+IX0zvNZrh1ykNtlwrQERuYNfoXc=; b=uuy2IvSacMIUM15QpXIcFt9YQj
	IVtZaXWpiRqLXwF5BuyIErbI+VDYpRsUP2H27MIXc6JgvwjzJDbnFeZsvzgfLqKr/ckag/4Kregix
	KqREsYLQ8fbMyps5uqg92EwhCjA3DLE0niDsyr480yOOj2VXXV+6OjANo35fXOwmI6+idbdN/1BxB
	lp8iUSmp2YtrOwuPUzBRaOqCi2wf2s49wqnvlMUr312/zsYZfyigAEqcNqoFLjxzGVs34LpWVKK4M
	WBnZs7QLRnoBe2Ed9U1BRNL+K58hlV1+Y4ejGNxKADxP9fD+9F+XO95U4g7lcz4sqNmJt7rf8UJGP
	R9WTQqug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1Qx-0000000AupD-3ftO;
	Fri, 12 Jun 2026 12:56:27 +0000
Received: from mail-francesouthazon11011054.outbound.protection.outlook.com ([40.107.130.54] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1Qs-0000000AulV-2fbC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 12:56:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgTExjTrnXOZ7HnsfcJHAy+1/aFjabNbwSK0TKANpj1kexREUlWy2cERulcLnrMNOgJZrujNanh/B0KzvSydPm+5omVEBWkho4fogliFWm9kfJ3TiOkD83uGnpGOuwfZ1fTRXZAMdOmjYtT2nJbTjjGkcp4Z2F3q5JrRxdMVs5thlULiNR/4j9bnAUdX/MP4TI1GrBep7qYQYCQRkK21kHYE+o25gfiM7ftXzzp+R1rIfnKlI8f/3L0K9mh7j5Ra3GWo1Mi7qgGVccPyJ5nBrxuo/jIjWIpCUkw39YT1KG/P7lCZZ5YFQ5m/qTazgTBjrbK9IV3VC5HNOCi12Ff4hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8AIGBBD/cubOyS+IX0zvNZrh1ykNtlwrQERuYNfoXc=;
 b=KGV+Q/O3IdK9MdNKG2tqxQGzfMMGWJpdaoHDfB1FNZYx6F/WB74GxU71swMBiVRkb//dyAGlhvLd0dSyb3sUhA9PmSx/eNvraLu/Je0xLv1/lDPjcZn7Za64PRVqyTPGhK/8V7K4+pPuf6wUMQtGQzbBPaIg4uI+X6l5J7MUpGLcFMDASazhT8s0do+wD3aWJIJyEyX+Tjc8AWnQKqyBvhHmP8ZoDJpWrvlykL54a793HQBRTUt4oxuXyXQ6gWnTDaS6x5sAxGYH95o6oUikdEPE8yhIPsh5k6iuxf43KLkEb4yeoayentMz52K1viZCzFNawBx2CSU9++D0XtOvSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8AIGBBD/cubOyS+IX0zvNZrh1ykNtlwrQERuYNfoXc=;
 b=Rw7jHvZSNfjBypjh3V+opK+RIiSHamLU1tvXgyMJIu6f7c6EKOKDL4WV+YgjRQxht5U7Kom+QTN/rvgjfvFL/aIlueVhIIEA+WZb581YOq4GyljLnrxT+SqfMFNVcfX+TRxjqtBj0ggElrZPFEhIdzGzEUMvntR8v6fmBHqqyyyQGfJuxyC7DfHEmXti56yy6oSeC4ZSPaZGUNgOv2FFCHYA7AFFDSsjLrXTUr1rhjT4VGW/YArrldVBJJCcnjESrlI+PBj8wacsAu7QC0o2OIFPweEXb8Z9njeZokdiV6sTca3Mj6Yg07VVkohST0+4mgjF9op+2wEO9MrIhrGu+Q==
Received: from DUZPR01CA0237.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::20) by DB4PR10MB6189.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:387::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:56:14 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:4b5:cafe::50) by DUZPR01CA0237.outlook.office365.com
 (2603:10a6:10:4b5::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.14 via Frontend Transport; Fri,
 12 Jun 2026 12:56:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 12:56:14 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 15:00:29 +0200
Received: from localhost (10.48.87.71) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 14:56:13 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Fri, 12 Jun 2026 14:56:03 +0200
Subject: [PATCH v2 2/5] ARM: dts: stm32: reorder cs_cti_trace node in
 stm32mp135f-dk.dts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260612-node_reordering-v2-2-f68032ca3088@foss.st.com>
References: <20260612-node_reordering-v2-0-f68032ca3088@foss.st.com>
In-Reply-To: <20260612-node_reordering-v2-0-f68032ca3088@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B622:EE_|DB4PR10MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: af04a009-270e-4344-af78-08dec881fc8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|23010399003|36860700016|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 00zMHPDHoetvwnyCWv0+9z9OeafzrqC19sdEfANIT9EBBbMl6pRvsk85eantpmZbDocEGT9Np8zr5IPRVWvG8SRxWrBQEcLo2nQ/+CAo1Jez3QkIgvG2e8PI80hmUrmWnTcp0mB0qGdJHTpMCbH+yG7qIb5yAvGeSYBQHhFklZSZrKLhx8wOR/21cI2b8d4g99cgWznxCJk+ujUORtlmlKPKRc9AaskBHsxLBAGAkmfY/Sp/ZhRm+6FEM34Izwvz7j8A2Gyq9z3dv9FRovn2RVbSVa70le8iPXPu2Wi4DkK7PngtJrDheqhbHkfC0ybOv0coRVjBoBrI0Ki2oYXFFrDn+n52R2xI4iJvcoSptUo18HMLyR1uTkB8OPzVwKQn6ham3q6t02hvw65y1Saf0Q5dI12jvTcvmsFJArUL+sI1VoXLIts0uQA48b3lb0vY++0PjhplkE6+P9FAOlmS5S0sv7VvplB9V30FF9rQcw6c31CLlex9/pqBopohLeof+OKGQYC24axxs4FYWsV0DtTnOTBlU+O+K0c2j4uRQraiMNXWQgvVI1fTjtzs87Oc3iDCsLF0JdjzvvNuh6k9QWPwM//SvyEeC0i11O7TM7k67OhErLcNbu6ymeFjvBZcS7IK7/4ghYcgzddwwjGv5t+iaGRe9NEnEr780/6BKJEm4S7Rf9GgznJ+BhWNK8I97bJWlagaJHUxP7FuSpsMnP4GcInEbegvAv7IaGwNkA0=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(36860700016)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +jgjc8O6xbGnO5wRj/CB/z7mLqyttXhg61ltQ6q4PnFuGk/vra/Y/SZRopQA0ZiaL23tJjgZe2CYxUswf/WMyCfUe/JoZLaYE8mzrv+mKSNBwGfVnrAJevrHlMq/5XXN1bjhbAAw4pZP1hUYuuEW6ABkenJJjjLJ2dRL19gV12XxKtBRGTbushwJ+7g0a5vahDRRkwCgl8yr+HvgDztjuQL4gva5+9TW2duI7XeNTrBe2A5iqtM6asQAIyaDWLd3vps22H3FIcsAhgNDrbCJsCJr8keTlkQe68RhUSAVptvn/8OAnyy8axE+QpMSw1SECjBHTiLkp35qo+sOe16vVa1FqSGiEgmOe29E5n5+Ct8sFziDuLbrBV1/80gsLwxJctdc+MSwmI3/gjX3PAGkZDc3khbYteYWqg24lr9NLSKS2cIPa/96fOnItSlk2xNv
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 12:56:14.5571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af04a009-270e-4344-af78-08dec881fc8f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_055622_668101_C7D3CC5B 
X-CRM114-Status: UNSURE (   8.58  )
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
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 6022e73f58af..bc3050a9bec5 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -190,11 +190,11 @@ &cryp {
 	status = "okay";
 };
 
-&cs_cti_trace {
+&cs_cti_cpu0 {
 	status = "okay";
 };
 
-&cs_cti_cpu0 {
+&cs_cti_trace {
 	status = "okay";
 };
 

-- 
2.43.0


