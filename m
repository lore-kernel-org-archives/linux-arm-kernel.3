Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201F6CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 12:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOtJvHekvBqe134NJdsNaCbQFFdESqxgqDmFG7Pv4ic=; b=xhk6ne06DNil7bXBb8J8nZ/8T2
	nPJlnsa7Z8zpO01ehOx1TC9mQLEGuT/wSfaIfcRA5/hXUoUfaD7SxjAIsrmhkSHxHHZiS5UxbJf+L
	1hmBBwSWmJeh9zDPzzHe2lspKajUNHO6e/6FuNn7MZrAm3knpCe0p8/uoKtB463vH9tZtBDhmOSQ8
	Jb386ZwtfYpTI7PYL9nl1WVFINDusV4BtwoolkZCyG/QDspY6XHsFPy2X96St0Y6BuUI/0ZL+vOV3
	3x8SPWTb8Kt47BMpgWPooSKi4kUY30tNkLp0+PIGBD1Ec9lMOnG/+LK46j9Q/xwdozZCPR1dQCmQ0
	UrhQP1DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1Qy-0000000Aupz-0qOy;
	Fri, 12 Jun 2026 12:56:28 +0000
Received: from mail-westeuropeazon11013048.outbound.protection.outlook.com ([52.101.72.48] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1Qs-0000000Aulf-2GiY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 12:56:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OhrHHIug05Tv3Y3F2X5Ru+sIHjQN+eJipQ4DCcmFiFYF25EPUNurAeJ7LBfgRUC6/VSoQe06oqFtvccWnfc4Nw2X3wW20Bn5Bxc6f9WNW2nzXvlzhd5VaIjj8H48iXpTSXpb1+HSnzDXlef8Mi8l77wuo6nU9s1gVRah8uOXWWlzVpj/2DRfCj9cWfsAlK4f5Yepeps00HCC7HT7630olEPpFYrsAN5S8PItjtPeyWLCyQ8spstzzSLM/umspJzIDzHxkYZhdt9xvs30kiGDv5Kl2+eWXQ0VBPbzaTF/VL8lL6GR9sqpjqZJeWpB9GXlezTmrhd+xMZW3D6L3DDDFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOtJvHekvBqe134NJdsNaCbQFFdESqxgqDmFG7Pv4ic=;
 b=X19xc3xJumCTstes4gxr3XcXLtSpPFoR6Ofb4/RuJGWIKQ1d086YcwY+jANbYhtsHJUsEZRtaM2JD2ofeI+0c8oHBKs60YxjvySYl9T0LNTQNg357KqDb41O7W7cwxBFWjQ/RxvTvV6j5d4uAxseLF4iWaJ7OvgTdyaPAP5SghWv/sm5SJ5PhbavqEbec9dgaaI5pKZXEOjHH/lQUWW4yMIZYn7herwcsC/M+6q+d72L6QfHcfqkrlJ17xNFZQ7Y3rvalzEzMX+NejkJ0APNfyYwnGaPZEl6Q6ef3ZQrwKBpDuU/77RVu5gvTSASgiwL2shEZOI8ur4u+T9bMJuyUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOtJvHekvBqe134NJdsNaCbQFFdESqxgqDmFG7Pv4ic=;
 b=fpmJTlyLgm0tKePZQpIg5aiNPm131SXN0slSwTC4GWSCVMvad5ikanZ2gbabKjVv72ONMRudJUKVShQIpH1KfX+uMk0sPOAhDWKbk6s1aboLEhvqAhPxADsUEkTLkEdJO5CUG7v76TwtGq2Jj0kK4+0TKK1kzMTCZXL+wDY8u9f+AhLRrSoZl/ho5713AA/n9avdqAX/My+hPJydbXf+S69jzo3MPKX/gzFvygKRLJkeYOsktQngt12WTpuSCm29qQzeqpIaBBFeLin0w7pSCA/H3BxCNBp+2ensSy/J/Gym8IZFIJV+YxcLZ0JVvz61h2QcLBID+qPnSU4a5Lf2wg==
Received: from DU2PR04CA0279.eurprd04.prod.outlook.com (2603:10a6:10:28c::14)
 by VI1PR10MB3744.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:135::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:56:16 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:28c:cafe::24) by DU2PR04CA0279.outlook.office365.com
 (2603:10a6:10:28c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Fri,
 12 Jun 2026 12:56:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 12:56:15 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 15:00:30 +0200
Received: from localhost (10.48.87.71) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 14:56:15 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Fri, 12 Jun 2026 14:56:05 +0200
Subject: [PATCH v2 4/5] ARM: dts: stm32: reorder cs_cti_trace node in
 stm32mp157c-ev1.dts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260612-node_reordering-v2-4-f68032ca3088@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61C:EE_|VI1PR10MB3744:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ff3f890-017b-4ef3-4bbb-08dec881fd5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0BbMJeUxFRpsZjBvbbOt2KgRkdJ1m2sUavuKzEeoy8Crt6oAR/V6txU9+yZPGoFMXtU3PCqGwFt/tZaUezv1qOr80fKsSaXWFqN+/jtFfKv0sYHWhzfhyChyjX3sciaGmZpwez4m7aHtaNYq/0RmdZjLJKQ0EWEn39reudfQK1vBAkIbMBO5EYyNxfAxMeG57CbtE0Ouu+8DlflAEwczc4/732uoHrkYFO4sXgH8pnMn8nmlgA8ocD8uZiZljhMPw9ck4rBW13TFD+ssJyYSAcTsaCQBLCPjyI7krQfvZdcH/36/4P39yvnLdaY0NeXkjsZ24UG6SfMVijJDN9T0YGcuYkzWyZ3e0qWyR3eT/SoqFiANvjwhcPBAp+0AGzoXjD0hUJ8QbqOLFRrNcmy+zkfEjwVtGNwVD1xnZdSU5Anvonx+gjxoGwhT1EYTEJsBZT9UbcBwmGemHPeyL25erMLRc+IgUYDRSZJ3rWJkZYZIEWDiUHsWPM2qguojoJXnfehiBsEUzvmiN2fwZ3c3pKvJISWl9oV8U1n4VY+eqH1KxS3ZKcEL0itNDH6GhF5qi70DRxDHJoYCSICUrQ+5rsRHqeZEeGTe+IR2e8CIFnu+PFW8vjVFhLouNSPJpjls5w9NMSus9p5c5ERi4HH8B8YvOH6kBJ7gSJEUeWpABOVyYgN8g5+QkgNuBIIdekSikLR4AcpmOA4XPLWL+hY+57JY09lpTrZswYWLvU/X/Ww=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lbri+Jr/Zaa1eTak2YrxxTnXHtu4lOWr3wbglCq5/WTjzVXy1Fb67xI9qGL3TFsvn+ptq5VoW8VLMJSw+Hp5G52F7GUQPH9IUZ28W3ZIp6Fyb7+INzqA1O+Fl9Aq3qWBrpDntBmo/LpRLVPKyRRpw9rGK2L+9m9J61PoSbj7PFurzfz1Lood+pyHXLkHsBF/KDuaumOSGDDOis2guzxxaHWqwq/R52SiYl828myqgUZ/jJGJKxOumndtFZrpFZt3TSXTXpmapeMGaUKeWJVmyfMaTSSj9g4GzF9Hibl7yy3j+rR5yOmC8y1Fk9j4vRnr2EAntNZpZJMOe6Z5U8wPmiO+3tdZAPxX6OnNNfflpE0FAE8dA3mRRxeBVEYji68iygjjTFyjOqPMmAdX0gp44QrDq1VE4NslcH7Pi5XAi26S75myMXpOCPejw7czQIxJ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 12:56:15.8927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff3f890-017b-4ef3-4bbb-08dec881fd5a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3744
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_055622_572943_EBA7AF93 
X-CRM114-Status: UNSURE (   8.06  )
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


