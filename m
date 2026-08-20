Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1182CC5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 19:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FyhGY/4VEoMFLQbtrF0JZU1Nt44QngDlHNNZH7FknTs=; b=ToA1G6QuIVxaH1
	m6BJ8qY1Qk0UhQSYOYn7wTDNa0hKW2mZcEk6FCBEqIHn2FV0dXvYlr8Red1a/rCZJ3qU2LQdcjNet
	Fo880yy2+f3N0ioVxibCG2Xp+fvmBoAsHOhhDiepjNglYBeIVV7/8yJwXDK+11UdLeH188b8UXJVo
	GwmqMp997mY78SkNW+XESEEeLUwm2AX8+YIAeSvM6W1Nc8TW0Xdbpi2WzSfYECZ7C9rHuKo2Od+7S
	xXDkZGO0IQ8ydFyIqIxSm1YP/GKppX50G84y3nkKfSpGscTlJklhFQHWmxtqzwk4nwGavFtqNqBeg
	0XpDYrJ9htPPTPMoutVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx8Rh-0000000C79r-0T5T;
	Thu, 20 Aug 2026 19:29:01 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx8Re-0000000C79B-2xwp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 19:29:00 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIKQtC1335928;
	Thu, 20 Aug 2026 14:28:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=FyhGY/4VEoMFL
	QbtrF0JZU1Nt44QngDlHNNZH7FknTs=; b=iz0ukuk94YKkwq8Hfynpy427FJSvo
	KHmKDQCWIQfjKt8GpypUmlyG5M12W0G3xwfPI2QL6flbRf6hkx+8/4RuGbuJ0RXp
	3dm/d2z2+jIsqmOy4r/PyO69Y9lzG/xvmiOXUdeR1BRmkI9LuCii/NnlpseHMIEU
	fMyZe68tDiUcVL8CaSJrhmeuU4Y3GpIK57FP1icvnPSIBvf5JHqZASo4Cmx2fU+S
	aD2JYrSpg8peqHQa+pw+loXHPyVynlbnHGVBRAEoIuUa8MNrAmjduBV6vqdcEHTq
	K69C3JPhr6LLTOrPyYR8l4BWNEdeo41wsgbZx8SM0R4krWXvW7Wc5mF4g==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011048.outbound.protection.outlook.com [52.101.57.48])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g5qrkduc8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Aug 2026 14:28:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4t0PEy1djwnAI2Pll0/Zm8Y69p3fGg6/C73LrsBOBJRuLNdD8VE35Tj68XUXBf1dQXzVHqWqg6TAQ3eQjKq/iK+Nkl+DJlE1gkOzMLl2fi6VQ+y4VpKh7AwPE5o89RDrbEgOtQCRVHt7HqtvPMX52NORqGEk3mIernMALM0t9vDoZXutfbuBj5GEzSfZOZK8zWBfaqAOoJVAVhhHN2vr4Cjio3Jn1xf5BhHWX9o7t9yb164HOkRzlWr+lk1clmZWJu/Mn0+ooSjkl/lxfCFECI02gq5DilRsDjY2D04fo3I6eFvoEkcFE4XwOpOBxWycCJf17p2csNfzemfju+7lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FyhGY/4VEoMFLQbtrF0JZU1Nt44QngDlHNNZH7FknTs=;
 b=FNsU3YbcqkG+NnDk/AwCWMhEWt+RM9v2Xv6G2M9czlg6LWHM/EW+T52MDvUX0EcHAwy2vPMleOvzbBztk8uaaSIzI8DJn+mrJpeKPkDI9AqxDlu7/MubwTZIk5+FgfZ43MM4xmfQdy1KOozcTRK34C1uirypeM1c0hwSABkuAW9u4QmES0/ZC/pEAOw0nmqfzgioBTACnTTLxU2FY1s+SaZ2+VQMAt5yTtGuIbDgpsGIus7GGmUxPdcw3USqXoLkp/SLlKzOxpDpZmsTJ6ul9YyMDlQxdAmrIQB7Fg9kNYv0eh6soH/tNFJnNpaeZVIcghn9Jo+m1WUY3Ik6JNpYGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyhGY/4VEoMFLQbtrF0JZU1Nt44QngDlHNNZH7FknTs=;
 b=mS8wt8631/zw8XZt1xwVDnAFxyF+bHOU31j/nYna0Lkx/xCsP3IdCfrKtd/moHUadf81sLTNGtEXAm81AlMK8U+w6xXuH4aDFdwS+3Skwd3pqev4AMzrIhs+LkVH3MQwqvUC22rknMp7+b3llakqbO+KoxRjOti7weyeODfEUPc=
Received: from CH2PR15CA0010.namprd15.prod.outlook.com (2603:10b6:610:51::20)
 by SA3PR10MB6971.namprd10.prod.outlook.com (2603:10b6:806:311::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 19:28:52 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::67) by CH2PR15CA0010.outlook.office365.com
 (2603:10b6:610:51::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.9 via Frontend Transport; Thu, 20
 Aug 2026 19:28:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 19:28:52 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 14:28:51 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 14:28:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 20 Aug 2026 14:28:51 -0500
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67KJSpvE1779937;
	Thu, 20 Aug 2026 14:28:51 -0500
From: Kendall Willis <k-willis@ti.com>
Subject: [PATCH 0/3] arm64: dts: ti: add standby cpu idle state to AM62
 SoCs
Date: Thu, 20 Aug 2026 14:28:43 -0500
Message-ID: <20260820-upstream-standby-v1-0-6a0553b9713d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGtVh2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0Nz3dKC4pKi1MRc3eKSxLyUpErdpNQ0c0MTQzOzFEsLJaC2gqLUtMw
 KsJHRsbW1ACDfl9BiAAAA
X-Change-ID: 20260817-upstream-standby-bef714166d98
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <s-kochidanadu@ti.com>, <a-kaur@ti.com>, <s-tripathi1@ti.com>,
        <vishalm@ti.com>, <k-willis@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787254131; l=1012;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=GhfB54v/L6Bfpwsuhpa5ow0PIKIKUYdhm3x32FVd38Q=;
 b=TnJvsn4HOPirGYyp0iOyQ/LJxlzRID5f27EWA3o6a/LyHMGuhEaQXi3k8fn1V3R5kanwS5nOP
 HzafCq4Oj79C4GLab2zJExSUCV/Bw2MR0CefieJvNw14nPP1hibfXZl
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|SA3PR10MB6971:EE_
X-MS-Office365-Filtering-Correlation-Id: 722300e4-15cb-4242-3166-08defef144bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|13003099007|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: pfCZicBtsrF3WBWq9DNMFCUWItdwiewwhp0ufGBEnV+y6Ri6S4VI0s/vHcOwVM/mx8h9krDdWlcGOLrpgnh4ALuRCsowjmtM4grpsz5YrD0ja7sOHZYqzVeUXofGeK66cIV/X3xail1PfNg8FN17cYoFaSstubzaU/XP2pTr7fP2hC45DZmsYBx6vVzVUAE8AiEK6nORAM+seejoMOaFLYFOGPKhT4r+vUlT+58Tw82eFz7+vhrTcV7nsP2G5reGzeWS7zzQ4UEkbCpUHjZsnlIk5o2atwZiMV1TN4aaDKhh1Gj2L/2eZ814W2ylkAq5VY3ZmW29VeDYR9QScm8mRc6n88ta/r20hwJ5AOZagRM+Z/Qiq2fg10joPY4jkz0od6zhh3XhOtvflRiIfptSO1muZDy/wCdOM0EFS1y5fcbirmIGYMwwK30OfDGj/LEVp6SGpy1rJFU8lRQEdyJPEmPu5Wjxxtti/iyMt4AIvLYNsLlt4mr682vHAZQZnemA7nC/F1j+XXWe01F14v47gudsq/fyH6zqVa+f0q20zKz1n6eqM/iBzTK4syTxgDWIQ/eT4VyQjHVGavaWReBRBERC5ByAk2+8nu90X0PWHCMaEtmK/qsJ5zDBme4uHChZ71n/YPmO9i6+70YoaUclnqs910m+deoOiox0CzzItJE6jtA7LP9jE/i7vnQvN5l2oiOvUVQiLaUYYPwPBdlwMg==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(13003099007)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rQgkFa5g6mpAQy1rT1AvwmlQUPScBnxj+LNZ1QCghLpSQo0Q/hs2h+8Wm3ye4J5ka/4SkXA2Sm+IXhgYqa5sIi0J3sm96bAbQv2FCoSFWYitDhnV/nNR5f6v1xF9dBg83P05aXYIm5yK7v2o8DjbfB98tF0C/pcce0eusOL3fED82vGQatJCJeLJ1f1GJCNjqzU/eXDPQQKoH3XHGPeRVC38X/mRc4tS4dXrU47l6E0r+hgzC0mqi/RWBJ3cBQ1N8f6BTKcTaJgauhpheWyq5vNGDzqR8+p5K2KF4qGaTNeuOIlQ+s2QX3cackkPE9FNiFufelYDc1DtgpYKvLifdQxOalwKqNA1MISY5RBaMjAPFcODQGNlFrAaycvXU/IQMNa8I542JGWWgn7WdNucMj7PRcDDfxPBYaomTcDY0KNMVXf/OH/DJ5B2DDNen+wa
X-Exchange-RoutingPolicyChecked: p9AL+LOnhCdzedCQ5opSBdipVVisrQk0przCs0CeF5xCtGDwmUgzjBH/4iLgZj87agA65B/Rg2ii6xE7b36E7srmCNv3TBwRXRP/F5f9qNtoi4nPYvEooAtN7cw4ORaola7mxFvxU5YQJqxSIs3eJWZtC6LAVejTmWRzao1kgQG08HIOwFu3FC4St3WIV2eAojWt51Xpuc7Jv4EiEm0YCae9UQI/evRH+7/U9V3DKrfz8X2VI9UVz8CsuON6YyGtC0J66gQ7OpMWB3JZKcJAcTj+3Q9TOyGxz6ce/i8ahQe2CAmaj7+nhC6Z1L80rODKxMDlT1Wote98ZzukLIf/lA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 19:28:52.6028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 722300e4-15cb-4242-3166-08defef144bd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6971
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0NiBTYWx0ZWRfXzykQYD0AYgL+
 gQaCu+22rV+JfcsM6/yWHHk0Rsfu/CI2WrEX1MM3L4dluC1aKBh4o0I17Ofena/GJhu/HkqHznA
 NWhxlSQX8UaXU4dRLHt5jnXXQAq0/URJSexyDr6Tjg3WnKmJ6OY59cVQrklktLb/zDiqtDZUqLc
 FEEd8xrsn6KHy0m++nFLE23zSEy5no0M8PrhefNq/RrX4AtxVHbjVA1DFxUEK/s70pJiPCbawKO
 1jQJjaFTR5f7pGegRyTXBzwLDcR0N0nwq7BjOfvLssi9k/WKi131RGZAY1VzuTlihUPeneoIJI1
 N/v+OMhfhbpEkvOW57syOjjOJO8S1XxlD+DgmlCmCJb7+KvfKnhPQhsCsSmMllat6Dr6UbYo6bn
 3Th04Uq1uPsW+ZdlNngx93aEnXteqN/CDA09j4lZhdTx1mYNgvGlDKRtc1epX3E69iN/NaRyWCQ
 djsLC5h2ywKUvDpy8hw==
X-Proofpoint-GUID: tE0T96C9Smi36ZRWUB9DPfKaF-QHIV9Y
X-Authority-Analysis: v=2.4 cv=JprBas4C c=1 sm=1 tr=0 ts=6a875577 cx=c_pps
 a=sTXJTCApLso7sb9o5cHK3g==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=NEAV23lmAAAA:8
 a=sozttTNsAAAA:8 a=yMrMdE9d9fOLPN1CA9sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: tE0T96C9Smi36ZRWUB9DPfKaF-QHIV9Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0NiBTYWx0ZWRfX1hAOLQhKudV5
 /OW60NNHMEsQtB7TqQWUAMz5J6bFyeHvBi/Wk8lxl8sIjOyY1w1OogXvTy8fXNf+CvdJq4eG4zy
 SaAR3nZDrqzo81xEg3t1Z1NjBFb/rrw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1011 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_122858_865243_DC5F514E 
X-CRM114-Status: UNSURE (   7.58  )
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

Add the standby CPU idle state to AM62 family of devices. The standby
CPU idle state allows the cores to enter WFI through the CPUIdle framework.

Tested on standby idle state on AM62P [1] and AM62A [2] EVMs.

[1] https://gist.github.com/kwillis01/0b94f91cec16c7d99f35ce57ea2db09e
[2] https://gist.github.com/kwillis01/de28563aa67838b328f8390c1145fbb2

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
Kendall Willis (3):
      arm64: dts: ti: k3-am625: add standby cpu idle state
      arm64: dts: ti: k3-am62a7: add standby cpu idle state
      arm64: dts: ti: k3-am62p5: add standby cpu idle state

 arch/arm64/boot/dts/ti/k3-am625.dtsi  | 17 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62a7.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5.dtsi | 17 +++++++++++++++++
 3 files changed, 51 insertions(+)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260817-upstream-standby-bef714166d98

Best regards,
-- 
Kendall Willis <k-willis@ti.com>


