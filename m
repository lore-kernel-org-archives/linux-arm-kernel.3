Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7ED9C55838
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 11:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ehQ9d6N75axMWk2n+Z69+Svo/anYZ4zabP7mePu8ShQ=; b=KO9ZmWyMShlKIJcPNPPWx0Xv1b
	hknwvGoe5M2ugUl5g7Q8AtmZyPUBomhuKLS7gquOWzR4X3FKhiMMN3YUXYxkKCfzMNWyox341PT04
	6/mZw61XzHfdWDfU/bgBasvRRPIEvhpu7Gq0YqiY7RvSu1fRiI81Yxg+gb/KdnV8b/0jDUJAHKDgV
	pxWYXFxE4Hy9/Ug05ucKj5nLZWWODYqv+ereYoBV7/MU8PVqqV69kQvchPgY1p3YtDnurHgnnLip/
	3F/0FGBIvnUM9fQ2n3VupwtUrX12kyfV0dMF/f0lskyNmWwL1DTvj3qVR0kNxkFuDzEu/XDWL89fB
	AX+ijcog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDVm-00000001jZJ-29io;
	Tue, 04 Aug 2026 11:40:46 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDVj-00000001jYf-1QUL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 11:40:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JUxxfRyYvpvBPGtRPb4BDN2EQudVySjj/SZ5otVgwDQZKvVenrBs2NE0C4oAngDakThxgcFogPP/i/wP0bJkaRPXkTphfiY595vW1leJnM9xaRADfcW+aZGvuaq0gEdlWZ+1EqNw+aUs7ARojVohNZadTKpgXZuorwHObFFwQa2+suT13X4CCAgj0Q7h8WTqcvfH6uRujMjJ4MNDpckXmcc/3lQr3XYdzNLEHbEW/9jWOcYulkktkktYv9U2koI6aPiVRTzNSpcUhX9CnHwWqDHm/xGl/hULW0lV+z8EGVBxJOueYPNYpbURHULsZZH5KHCijsKFr5EsZkYM7L2aeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehQ9d6N75axMWk2n+Z69+Svo/anYZ4zabP7mePu8ShQ=;
 b=aUJwSGb5G56KicrBIpHEmxRjrF8BMxwc9h5oDEO7hs7EpbcJYFIjP/TT2ChdFVp+g/3pgYn+2LBP4FSjuvcTib4i/RDutlVfwQ3MFDEebyM/WL6KoiFaQ2XveUkyfkELfwXK9lyVSCQyHjIogGhik0A0nCW/wdnSZCYOQpAFd28Mj5mVn+wETb4IIRwOUW4IJzfIlzrM400BSUWVjqopKX7/+/ch4NE6q5Pt1+nsNDoksdJc4DGtuEKWbLJc04ur6kjo7xCmk844ukjuuIDlfeltffLTw0nnN0mtavIap0R4TZDo+q82Y5+Y97GKDNx5omlQtK6TbSBCk1ptRlFQpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehQ9d6N75axMWk2n+Z69+Svo/anYZ4zabP7mePu8ShQ=;
 b=lKZgkBlAOdFXlweRl1xZSzSBmQkBd6Dx6EC+Hb1KHmLnQZH2nGMo5CfK2inr4jeqGE6As7Hx2fGIcR+XR4fSU2peEeqcW6t7B6DjR7APYmVgyrpW5RlvcQXUapGclqYjT13DQGxrS9sXbbf+Vjew+6qkyitlvBLivTL8BU4ijFr/Gyewcafo8g2AgoHqiYkVO9qz8J+f3lrt3qewo1pnqGbbYnMZ6u37hDJLc61S3I9Zt9e3bytjIiafS/Tq1Dz1QxfNQ1XzPXzdB6k/0eZ9LnMb2WFNnuSg4sWmpI5+a+dH40WWKmor6WIbL/z51LvzPog1ar5aq+INzkuv5Iy2KQ==
Received: from AS4P250CA0011.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::13)
 by PA3PR10MB9231.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 11:40:36 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:20b:5df:cafe::33) by AS4P250CA0011.outlook.office365.com
 (2603:10a6:20b:5df::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Tue, 4
 Aug 2026 11:40:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 11:40:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 4 Aug
 2026 13:45:27 +0200
Received: from localhost (10.48.87.235) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 4 Aug
 2026 13:40:35 +0200
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/1] arm64: dts: st: Add I/O sync to eth1 pinctrl in stm32mp25-pinctrl.dtsi
Date: Tue, 4 Aug 2026 13:40:18 +0200
Message-ID: <20260804114019.201949-1-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.87.235]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8B:EE_|PA3PR10MB9231:EE_
X-MS-Office365-Filtering-Correlation-Id: 2506f88d-1218-49ba-32cb-08def21d332c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|11063799006|56012099006|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 5qkxtkhfbt1vUr2zK/Zlmjp266+kZ1R9AyHcSi1nrUgdS+XRpRkEJVwx+zQU9nwM55CsOwih7Q3uLUnbzlnkx3AIwgUmo7onrwv+ZN/3vKrGA82/nNUhtHPfAfCZEUbXca+HFKfChFYPR7wk+e9DCxcOs1v7gT6INe8tlBF2SDfnSYUXZi9iC8ZGtfh1dsFY/p5lcnP4OMPx45IjUEWtddoglRyUX1Ch9x3Wfc8zMi/GyhR2V15Zrk8BJq0yjs9YgCR1E+ETiL2Pwfh8qNa1hahcOOr+H2izhIAgk3UX6xb3MV7ZYk5LUX93Ld5LbAXy4bJCiDJUTsxJu7CWjqodztMqyBBdoFYTmfwfYpzZ5hPqIQkk7d7L7A5FslGemVECkw9yrYoE+QDQb1h95UiApeSnzOo4DOOHhqwK8PRvhQ42LpnnUuYlHatoLT2DdmuzumSbQMdJkXCVLwk7e8DGCRTs1Jo8rSjPZXKYmcGRbotm8ZOJs6thtk7EJ7W5JrkOGlmvwmEuN7+W9XvWsqJAX30/NTW/BFpUks3xOhGpXjF6mLb6CzIZQ+pfKbwqPPW6FdGIjs57IogztHxA+PkYyq8QEDw8RlfkGHh794oNKFOqaQkHjPWtdQxTZfdmKOLW9g9z1M2xu4sUxSbRZ+STuvu91gmIiueNhSdM9eTbNeewqbV+bginOOket7IUBC3odoScwSZV6wVTjp4l1A+C4Q==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /ssDBXIV5nlq7bbZPvT9xqNr1J8KC99j3E4mQGrO6TFtlBcnOSc0lPTnW7PO8ixn4subHX4xpuFTywN7rB7fub4jreChhNit8HEO9ZTWswWIv/h4phRf8TPQWnbLqFIZe0O80QkvAQGiTWeiE0VJPIMRyN1YJ781jFUGEIa4siFXnY/KaVt6PhZfKSk+3flFyYJCttavQaHPTf1SvyozWwmoHk4ZCITDV0BwFBaDKuTa47EG9hqmPaXdQOz2Asejst6Jp3/CjXFSimqlX8l/jZae+IHQIbnoXZXdZocl56DDWgPEA+4p6PD43b4hkMV4vEcvPlDKBkrKoE5BLZA5Q5PSEFDLqU25wXOr1U/+P14KsSmumAl9zZ9+0qtsLyWbHmh0jTkwtgm2w/Dlz4//UE5Nr5ygti2pw0MU42/LnFummDNZJT5/NyrnvugA+PSB
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 11:40:35.8592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2506f88d-1218-49ba-32cb-08def21d332c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR10MB9231
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_044043_551554_6BBCEF2A 
X-CRM114-Status: UNSURE (   7.10  )
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

v2: Remarks from Alexandre Torgue

Christophe Roullier (1):
  arm64: dts: st: Add I/O sync to eth1 pinctrl in stm32mp25-pinctrl.dtsi

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.43.0


