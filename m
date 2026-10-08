Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D588CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 08:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WKCx015lK2g2OLF1vwDffcMA+8pehqfv69v2WyISBF4=; b=sN7gNetfHsFQcbcLMwATnSghmJ
	DZQ8+E7K0e9Cb+6C2XRVaAN0TCIkvlLdJhv+uCHNiyyVD8desBqeowRgBx8mjhPw82nRVrEpqbcKH
	A1+LcnlBkaukmPA6GXUnZrgsP0l8DCOiV1/e0sjMRuwnjB/03r6TW3m8QgVlxSNpt4UfYST9Gw+si
	JJDDoQU90c3DFitbbFLLoDANdNQ29am8p8sUUDE+G+30cGuUuX+Rl3rBHVCMQHfZYjwn66Lu9806K
	fkE+e5GHFCHFkkgIJRbGCVyX2/bY/Z98OAqe08x6PRQ2nE+VQJv9I5MB4rX+0dKONKLBtGhtVN81w
	biTK5WtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjAj-00000003pQQ-0ht7;
	Thu, 08 Oct 2026 08:08:13 +0000
Received: from mail-norwayeastazon11013028.outbound.protection.outlook.com ([40.107.159.28] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjAg-00000003pPx-2uoL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 08:08:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgJ//oXqVisR5zHuTCwLA3Xj4oHzms28zJaxtn8edJUFVzB4GWOuxd9If09jMQGqVTytStN0jSirbe6CDc0yDYwz3+jUFYQ6KdVrEnmVBE6xVlGlOnjVgf01okTiu5NMjfm4kMHV6170ei39MbU92A+VxsQLSToA4S473Kf6qfmagJh0KxHE8iixYWi4zy3UVSlkv/cYz8RTPnZr+eXmHVzF3WuwBmRIiDR1ThRxuk+uGsKf9e5yLtTOEr9uyCAuGlkQOxtfuqaHoOJWO5sZwS6OO44WOs/iymlFEsd1+BUcVGe9vesUb8B+qzHgNWc6hbT2xI+eubPLQD1P0O05sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKCx015lK2g2OLF1vwDffcMA+8pehqfv69v2WyISBF4=;
 b=oxOH4/0Vr9DPXJeHu3qB1PnAQs2XL6mbPK4jV93xCQPwAonMQebeiM0OGzO8LeR7VMR+bl5+Nw4f6PtVv2Dq5S+9dZBa3J3y9l+Bl62syjBURbs//dnQ5j+h9ruSVZ6creg8Ftn0yWr03lZDalyLfCmqHTR/oNIwsjPgAWazSD6axjwr17sOcjUvM9cldmp4qHWH3+cA2U4WQ4sjhpilyFqKd0Qeo+rZM/4sbtf8+nVJ9K5bZ1KKgcCEZOd+7qHrJiK43h3UyD38PXKmysfVGSzo2Lz/7kpbLN9yhQcQUkRCQtZdTfBkXJHyxI3E3YBxxSV1sFeuaXnv4afQYeYJIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKCx015lK2g2OLF1vwDffcMA+8pehqfv69v2WyISBF4=;
 b=ENwDeG/8HyPwC4eMKkicxNEUUHj/+xelMARMKaJHfNJsx4MCH2GAu1nvH8SnxAx9u1inR4oS+JR+EPqvLZFJTqdFFnk9ry8YiKjjGAJT9xnb6aVOWS1f1JpggJWaRKdV8qAQUP01/SZmM7I54MhMccBHIz+MZ7uPARiIYJCCFDDQ8FDzKBIARAVbiWQEFI2pvUp4YBLe8Z+qTdKTelnztGhnbyK551VBEg1EjMI/P6Su0mIHMkTfJCHd0ZPronOLBY+A9pzsRysBbgb96+6JEPOe4lt3ZnbLetl16bG0Y4iN5oHAa/y0LaouFXq9vFTOdC8H6hOtqP8lwnQWHXnWWw==
Received: from DB8PR06CA0040.eurprd06.prod.outlook.com (2603:10a6:10:120::14)
 by DU0PR10MB5851.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3bd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 08:08:03 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:120:cafe::6e) by DB8PR06CA0040.outlook.office365.com
 (2603:10a6:10:120::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Thu, 8
 Oct 2026 08:08:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 08:08:03 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 8 Oct
 2026 10:13:49 +0200
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 8 Oct
 2026 10:07:43 +0200
From: <gabriel.fernandez@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<gabriel.fernandez@foss.st.com>
Subject: [PATCH] arm64: dts: st: add optee interrupt on stm32mp211
Date: Thu, 8 Oct 2026 10:07:38 +0200
Message-ID: <20261008080738.21355-1-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.87.14]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|DU0PR10MB5851:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a02eb13-4a1b-45bb-3e71-08df25134708
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 3xnG4/SdreCKxfeEUO2Ndie/AxTwzdrPiOxH10Ieq2ZphEqa4z3biqXbguk3de4upA/+vao/29YFdRYagjzt7PpM8cslchwlVbxJK65xEZg6zactlRz6A/E5GJjgrFrM/sNIjmV1PD2iT+RB9RauGfMoLNi+4n3t64p0r3W5SbwQZo9XDgEv9fcC1Kq7mrVp50e0byiE78GBcPocFdoy/HN5pLkKbG7/jnncSPLV+mfdcPcq2nXBAWoTOw+zQUNISE+IDh3pOum0GO9P97M4EkKlUqx1FLDLzjuwy5rEzuKy9xBqcVJJTq+flC6vGWwSar+Rms32mP0AEe5S8s1eg/OixydWAGrIqBZoYh/4jT4Qpzl1rsekENgKE9ChxT40iQYhGImhgBrnoYjiiCkRZzEr940SZ0P7wIDr7Ma1x15HujPGqcnL4b90d63jnrdO60GKgfjb2vnyuMTVZCuGcw5JcHP7gpghOqu7CccUfY/hiFeXVPUhmsSYeIhwAYa34rClmsCn+i/GRtw31CdQNdPLrf+fDDon3jOt9s4CrpU+QjirjBN2oAbMhdEEWvFdP1tBg5wBoYhWtms52u/Z0ct9dug4I0iGm8YxHlTZ9wl4kvI//KcDvOicaJnahvrpsMtYOS//Fny9pGPKAmGKUXp7VbciI+g0tCSuY61jDldLyGULLda6pgNGG7swA8hi+7uoVCcWu2gkW4lS5iF5KQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: a3QM5WOOPMhnUtCcaBHlIjZFw7KA9k8OjoKqL9ve7bJssAW6Gh7TgFxEuCeHH3zhOQDUoMQoANleIvh60Yk6aOYQA2asONJ3+8i9zkBvul6ANvd00qLlMWL6aW7NK8jCGd3re43Q3Nb0SOVYe7I+nGX5fwtbnQOqPb2xgD6X+S9KH3qUnmzwgQiDyQ17KhWaX+VrsH8zeFntnSpqbvuHd6RSoIEFQtjOfBgg36ohqYY+oiUNSo4lBRZn7uVBh826Vtff42YcVCZ7WwBr292+uqyTANPVSnDkIW7x9lcBQoVVBbpmWeJurnIOXMYgA3NoHV6HjJ+7EUMPhTy2OTnJtec3XXN2FyfP/hdpyoRCiPwHyVX6izfKw1jQMoW9RaiXCH/FvQiernOpKxYI2LUZHRfh74QW8dc8WfadwrK6aikhh0xiCCxVGcVnm3YuIaCE
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 08:08:03.5060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a02eb13-4a1b-45bb-3e71-08df25134708
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5851
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_010810_737001_4DFDCFCB 
X-CRM114-Status: UNSURE (   8.21  )
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

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

Describe the secure-world notification interrupt of the OP-TEE node
by adding interrupt-parent and interrupts properties.
OP-TEE uses the GIC PPI 15 (level low) as asynchronous notification
to the non-secure OS.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp211.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index 4bfd58b26b51..11929bf00ecd 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -50,6 +50,8 @@ firmware {
 		optee {
 			compatible = "linaro,optee-tz";
 			method = "smc";
+			interrupt-parent = <&intc>;
+			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
 		};
 
 		scmi: scmi {

base-commit: f831584128ac2a36fb4fa62fe106793d08c2dbf1
-- 
2.43.0


