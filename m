Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BCECD98D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 12:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOyMSCwiLOj1tuFlD2t4jdWXePOZwhWzGQbecD60kVw=; b=0zFv6EOgIC1lFFelbVmQVIvGNq
	YCPltw0guAt5RRtAHo2CIVlAsP6Yky+fR5SyQxhJd20jTi1zmRf1jaFe6SMKUsDfgw/03nU7LKMJU
	reT8LdrgbxzdcehZsH7Sidhezt6Veil+PqTB+17kZUVyfnaiCs9jHbRKExS820dxhYmSIdbltTRXL
	X5Ql39zP2ECyF3aNvwFHqklltNIkNDqpSNyiT93xn6w2BbWK72IqkIOkhTJMHyvoMY6rG5DfrGiqp
	/7mQzMRXqxBpgMYoEtlQkk7bS0ZppW/9FOLpUXPwuxNQq8t/OkwGYFEc0KIyl0ruagds5CqAHB/5q
	uvFmju7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1Qx-0000000AupT-44Dr;
	Fri, 12 Jun 2026 12:56:27 +0000
Received: from mail-francesouthazon11011010.outbound.protection.outlook.com ([40.107.130.10] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1Qt-0000000Aum7-2aru
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 12:56:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YLGW4SwbjGtqKqAn85EubzWZyMYPqSI9ywRNWbPvlYFXjLWo4xWseiJ16Uv0K67pUVgC6RWQsh/DDTGVXREk6PVAB0kk8pLsxNPAHGtq6sr95Le4HBfmjCTjzFEdBUv6NwMk5ZifQSvYds1zubus6r9W4+gMa76rmHoEBTizF+9uqEkiTyb/5uUTbd/uyt7hUPkHYaJyGrCd/29MkN1MR2Y1Nu6AqsGWnBFLmXX3xymi8N2p6RUwdhE3RTxD3g0jxUF/UyANBgqas6sip+QDcb+nuRdSE32RxjIyUy9hvZ3tttQXjwhqfDPo1LNugcHE5Gi0dD7IIKNCaovg8UO0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOyMSCwiLOj1tuFlD2t4jdWXePOZwhWzGQbecD60kVw=;
 b=F9hu9OR5Ttg/JSJ14cgWxmjd7fENl7GMj/bKALjcZU7ZFIAgewQvaSeJYAgrT54sHHBYM2Vk/rVJlkUW5+7vtG5EFhXTN4qx+YHE7nFEHOIOiFFOkq2CjIVYaWq8MKm8HKPyUWYbFW1OhHSYf80RCGqmg665JAp88lNYPSrQ4QiYHmdJsT4IgK9pPdSDN5TKaXRUFLsZhhIpg4cTCn+v9UC8dErNisYaEMUsJ7YgbGZYKSVy86qrUQKhrs2+b1v1GUoAQqmg6NqgGQhJnS6+OnyvVuVYOFBaDzs5kAeKTeJ8AP/o0in8idtTgSxt1ANjlHQ4W74cOEccn+qX65eomA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOyMSCwiLOj1tuFlD2t4jdWXePOZwhWzGQbecD60kVw=;
 b=AlFIURSWZBdCamP25mo0ycX9Auch/ZrrsmHPfaNKm5oRafGd3fkKfLexXf3jFIK45sgoucP114ij4POoZtwUdnMsOwngq8YR4NXPlNS/qBdF3oHRZAS6U51EjnvmS60wGZzuKxrdFFZgJuIT6Tp6VvZN0nubHkOUaKPsosoLiwd7S2dN5AnCbCeI19/kUR1EmH1Hlp94lrJ1XQ4ZuLGvFZ5ZdElu6+ufFzXJ/tks+oG2FiWxasNMtq7GhRbJGVhQ7pae4bpd+fWB2ZBaXWrIEKdmLVhOcrVhXzC7C6unkpqPUmzjuvcPmZzA8G/qEVJhdt48wwfn66Z2CXikuTrsrg==
Received: from AS9PR05CA0336.eurprd05.prod.outlook.com (2603:10a6:20b:490::28)
 by DB8PR10MB3722.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Fri, 12 Jun
 2026 12:56:16 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:20b:490:cafe::8f) by AS9PR05CA0336.outlook.office365.com
 (2603:10a6:20b:490::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Fri,
 12 Jun 2026 12:56:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 12:56:15 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 15:00:03 +0200
Received: from localhost (10.48.87.71) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 14:56:14 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Fri, 12 Jun 2026 14:56:04 +0200
Subject: [PATCH v2 3/5] ARM: dts: stm32: reorder cs_cti_trace node in
 stm32mp15xx-dkx.dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260612-node_reordering-v2-3-f68032ca3088@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A795:EE_|DB8PR10MB3722:EE_
X-MS-Office365-Filtering-Correlation-Id: af544954-38ce-4d83-992d-08dec881fd42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: ihWe7RU3jywAppGMykSQAm2cg84TnlRBsS1sde/vMAl0YtfOzkxc911yb8qOb+zrO6YUBbOpfNcVtQ1n8HVm5n+6F8Q1wFaN3KWDosYOcqDD88fxSoN1vCDFaB6zbKAOI0VfjtL5AtPdMG8RWZQzMpJHAdOBzBzI1/ISgyCg2acrA/vucQb+Ji2RgiRtfrisLw1P+XLzCCSIXMlCHtacf4GktPFE6z7qK48dgYr+lrTWdhtxJmIeoB/Y8+5BxoG+3buIWYHsCFLqjy/0+cpSc4aIn0GIguacOEs5IzyZY7VVDtZ5jD51FTgPycJCNrnaethR7MrMhQ9bpH7qLXjO04HRg0/ZwVtv0yFU0JpL5KCWN02Atrv4yJPKI+ojmU9K7Rzxll+Hx4rpXZua6aPWXS+bvY87RFR9sZU28XvX4awe5YL5DnTBRkX2PZncw/lDty5OxYHSm7sZEyAMi35nupPs/UC0xxSqKRM2SvaaUwgrjiWSH9jknwlp0ck3E8ZmQi5ugaUDa1ms+yt29JZ26hQtVFuLxfJTZ2bN9X7QwFsO/cwNEPyH+/D9160N7ROb0tpptCw1QpvcnBCHIQjwLRbzmnp9/ehQ17JKnMT2l3Seg0wlZos8J6+SIXNlpcrceGVqQYVq6U3z160Oxd3nHkvZEmKiaecN7nvIk5nNtVMsIoprVoJCL/kMncgJ82oLhsa+v/nM1c0yLejjDYhmX+wF9QdyghaMQvQgXzpUB6c=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zltSlnKXPnjMQaZi1nqDqS9vupho6ykxRTFh2rEscNqkvc/mROAEunhjlSggaq1sj1SBmBu1h/90UiaCRq6cCeGMzokMSmA6mdERxAAqfLAEmz7GbskfR4cqUAK/Y8UMuUQDoQeMGv0A+ioVaZmJDvahb15HCmmTcvlBYff8Eo8sV7frmAUmVz+ro+6JDMy96K+fVb1dJajYvGgWxj2XkaHL8iwO3+OwgDaQSI3u67wl141ua4wi3gLk9byk3F4vietkUaWqdt+doBlCRDQY2WS5gIS+V83wEnMhwyvuty4+TAGyh3MEqLWvdqHNxmeahYY2sWankqssYzN+IeR9GBGqbAm0VC/3OUyoer8ZrYRa1xQJr0k4A8vqXKZQkwnMdvDDP6MvkFhwpezQ6RaAOtm6xRDmCkCDNCKJqzDp8kY8hRlVML7Nmn5sqx/kpBr5
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 12:56:15.7625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af544954-38ce-4d83-992d-08dec881fd42
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3722
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_055623_655979_E75FAD2F 
X-CRM114-Status: UNSURE (   7.85  )
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
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 599ea07bdb19..956509cef321 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -155,15 +155,15 @@ &crc1 {
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


