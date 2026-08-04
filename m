Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF34C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 21:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rATGksJxqmf7X+xvyDILA25WPxGLr4j3iNG9rXuFeqA=; b=V6P2W91NcFElhImHN+G0d3kgb3
	S/m/vSX1ipqy6fSMXcikgumO3e/V5CMSdbZjtnYm9k/9Yhc3CoMcR/cK/KFAfxAMuIOW/rZhLs5HC
	uzGLnNemTYp0u2ucuWLIXmlSbxr53iYtkrsIW7QooHDZo+vMjXIXD/1ne0zeWTfIxuKbcj1sTn06v
	V7Co5vsKq3/uyfgwwYFDydbQTiRPFngPWk1A/MuyhEsqupQhONTjxJRGETS0yuQNnjuG+pXCNacpP
	Zjr+AuT4ld8RyNYxVmJtO5fHQgu8bMaLU8Z7eY/edaz7gBw6kGwp4tE5mAuRsTup1zt1ymavSgqFZ
	WIo8kqDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrMLO-00000002nh3-2UJs;
	Tue, 04 Aug 2026 21:06:39 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrMLK-00000002nfe-3Bdp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 21:06:37 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 674JoM2k333452;
	Tue, 4 Aug 2026 16:06:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=rATGksJxqmf7X
	+xvyDILA25WPxGLr4j3iNG9rXuFeqA=; b=ktlrzXDefs8JyMrqVyyul7LFA+F5B
	xCpd03Rma5lzEUsrqVdP4hWyBzINJpOeXwJS09JBmrg+HXQZraPtvOcG0YPOp2r0
	Ncxvu6n+x6k5fqLWyWCi/StiyRVtGDTrRuZZ1uQeo5a4OfKbOp7l4fxnkvUV3Ui8
	vz/lce5qBb4bDvj9+g5+U6WWzPRenjaHGq94ZK7HTXmLZIKWQvqAzZEoi+C374Aa
	WA56NvVdVG//L/dEB5RJIfgFjX+k3UktDoENjhhRlPtbicrHPxIq4h908nKweFI0
	4rxxSOo5TfaWGXfr1/drRzIYese5zvKuuy9Q4IfKrOzrhIUnYSeXowH6A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013027.outbound.protection.outlook.com [40.93.201.27])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fubus5kxy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 16:06:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v1SFTQ+8or+J/DGKyIazPH4Y1lrzB3eGDNpNkebQWKA/NKjcRvhqeqTvBQwX8Ps4eBFJC4ZAg+lDzhwPZ5pRbUSkpc1tjcimS9pm1myVkLMsYGFF4NPSIKDtZJlzmmj3WUmJZjxIivo5NStwtOkGtuJXpyu3sxx0QQucxlGBb/q0DM0yOUlLPC7w3R6s6x5bdn9/uCDrPPSq7pMQkeRrymsKHBuqxx5nk1pmgRsGS3B+GqeWMzTEgWfhnO/ejQMm00rRxu/iF3cIexFwCv7chrqTM7rXVIZZhfGa+uhkLE5PKeleMpgj7Frr7tO43ahTauGW/m6a+6sk0rDNv9mZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rATGksJxqmf7X+xvyDILA25WPxGLr4j3iNG9rXuFeqA=;
 b=zHt/itY+lqmJZzUKI92Am9Jxp7Rfd+cTRLMGiPHA6p+ZLH2+Nkuu/v45ud5gBmwDkEr0Q8/TjptvwSNr6c5WDtY3PpcIsTLSdLMMIjH0iGbD5CA7cXLdyzRWAA3GHu5Rzoc3BWLL78ltikPTd/tN1B/WKp3abYyUS4Oati5rMBfahfpgnT/Bt9KAYMjS7LlAvcj/4cY9uWhGz5+8F4FC5rSFWMqH5Er1pHNd8zTWAni234IjJ9uSBTjEVxar7H7BQWp7rPUKTjTFZIkjj+XvY04RUvN0WFeqjgFg+3Ov1iAmf83HwradX4Jd436vXRf5ry4H0bP4x8wpBvvxtgG1Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rATGksJxqmf7X+xvyDILA25WPxGLr4j3iNG9rXuFeqA=;
 b=Ey45U8lymwfml8ovn/JAlnHvlsd8Ce3sz+DkVDmP4uu161gASAUfbCSkjDi+vLnAlZCnFDBKecm1xVW6dsXDZyn0DR2Ah3VMu02HZK5PM1EwssGb64+vAy0iphSh9X0AhcPhTiHXtbfIrgf95AC4RXWAjP/GpJdPPZnOGhuNeJ0=
Received: from DS7PR05CA0029.namprd05.prod.outlook.com (2603:10b6:5:3b9::34)
 by DM4PR10MB6744.namprd10.prod.outlook.com (2603:10b6:8:10c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 21:06:18 +0000
Received: from DS2PEPF000061C4.namprd02.prod.outlook.com
 (2603:10b6:5:3b9:cafe::4c) by DS7PR05CA0029.outlook.office365.com
 (2603:10b6:5:3b9::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Tue, 4
 Aug 2026 21:06:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF000061C4.mail.protection.outlook.com (10.167.23.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 21:06:16 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 16:06:01 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 16:06:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 4 Aug 2026 16:06:01 -0500
Received: from localhost (uda0499903.dhcp.ti.com [128.247.81.65])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 674L61RP913915;
	Tue, 4 Aug 2026 16:06:01 -0500
From: Jared McArthur <j-mcarthur@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Sen Wang <sen@ti.com>,
        Jared McArthur
	<j-mcarthur@ti.com>, Moteen Shah <m-shah@ti.com>
Subject: [PATCH v2 1/1] arm64: dts: ti: k3-j722s-evm: Switch audio codec clock from audio_refclk1 to external clock
Date: Tue, 4 Aug 2026 16:05:58 -0500
Message-ID: <20260804210558.1455777-1-j-mcarthur@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C4:EE_|DM4PR10MB6744:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da08207-f4c7-4c67-16af-08def26c399c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|56012099006|10067099003|3023799007|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: qx9DHSAsYLb336Uxi16PcLa3TWAi7pkpU61bxXqkiW9T7dFamtHigUhK/fqplvZJfnfV3JAQx5NPohGcQBG2NLMRpqCyRZ0w+H9olsZcz9Y9CNo69TeooHC3QCQ2kkffae7I35USIfsxKhKBAuVDzSTjtnHO8kvKlvOz0FfmlTs36FZYeXlDmYXYZxNghvRYksnyH9XwxXDGuSXcHJL1/aMfqx0UJGX7n+BTc2ICzRcM8Tr0RFY26kzRMYfMl+lvu5egfwYtF0j8yB8JICBOyCY1H7FiVbnTGAWqnGvsWZnGlfBar5s0MHawIHG+HOdBfOfN+78fX8fcWK3g8B/2UlHEzRQ3EzslmWm3K5os0WcwNiWtEEMK+9i45uwtxWQl2IcQnxBaZqMnh6c5OizAvZNhtEo7h0gvM35Dm8xG0K12vwZqOq5L50V6xw9rAIAOmuL8+e01o2TLYekhbitsm7GtcZdtK7a8w8klVWP/x40+TLbUE2NgZWmiHOvSNao7lf0lTeBosulkONLNj8UinFRGzrRjatkaLmezkkbRehoyFH+PKYHE7BUTw4rCwhZM5bSOqwB4wGo454aunSPKPS7WjDL3pFRbg0xcdyf8sqzPBZewx2RX8QrXqybqgCgr96xezNBfPGAqp7BP8V4OaZLHIt5C3iZHZbGifgDnORErsjhQspuunIv/WQvCZAk3TXKnbiWBmkyoZ57uUHnWYg==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(56012099006)(10067099003)(3023799007)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gEa67/08ulOXfS2I92Hv2WEpuwQz7GxXaeTTtcQscv43oJvoyF3/XvhRv+FsLD8NhCW+wUC264iEiJbSC/COGedT4BYch7m6+wJh+GQ3A3x6PiwmakMRTdqRk/un7MgUPmZjE5B7kGR7GpwxMVsJ76M9wZjcOnbXkL+DFLjk8m+8xvzeIDI9TCKmIt7YkZCJjc7MoGaCCwS5R+uNH9g02ih4GpRwYIi5pFNiSDyuvGpPHvphkNfP+cG0GRMSYNx11yLV8blqMN9TEgf10sCfJssKf2GOisWLTe2hg8Om2D+Gw1ZgtJJyjXVJwbDJrYOUIwpAWTU5PXqULc7wMFLfFiVUZ2UJb6mgGgWkyapb2T02VZvsAjOGOeOA7fRmctcRHu0h5hcjRqxwVC9HNiF5jBF562iQEIeAYw/pTPEuOH6icycIhubqpj/U6jLb1Exd
X-Exchange-RoutingPolicyChecked: A3sRIlFY45rywoi7qMWwCq2F3wD7YHk9JyVmSptq4+MvuOzN31hU/W7pykHBbHj436FeChOytAnKCZxFAd85PhrU/Ym5h+eD8lAtq97W379eaaF+T9SjdrX6fNyl6T65shR1Z4AaSJMZx/r4bjgqNP/epqoRHRdYUTX/SqSPPQXSsEp8FWMhGYwL75JFpVksAB7G7N2xy5C5r/DBzdl02jmV0CVE1nds4BakL5girvZMulXpfieZ2FO1+zqigkZkS3FKeDLyfDlVL4V7YvWKdZONNV1h7Sw7a4gY+SWNYAvj95KJVEs9QeUD26XYnrKhE2J22grG5vDcjBo5YuI8PA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 21:06:16.9174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da08207-f4c7-4c67-16af-08def26c399c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6744
X-Authority-Analysis: v=2.4 cv=RaagzVtv c=1 sm=1 tr=0 ts=6a725451 cx=c_pps
 a=WwHAhc24fKszT02xmrP0gg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=Yxu9Mjik3s8nxsdQ4ZAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
X-Proofpoint-ORIG-GUID: 48eBTt02kBzWWNmzVkqS-7mVAr2_wjVP
X-Proofpoint-GUID: 48eBTt02kBzWWNmzVkqS-7mVAr2_wjVP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE3MCBTYWx0ZWRfX217cTvdHq9d6
 glKDD7jkrWU5eTr3DEDfP3RFouyBWBkPZ/7K8leX+cYuNXEFdOVo81mJ1/v3ZPERgPV5jkHI1KK
 4/+ccR3WXhV1lv3S+OZKqj6yVn2VX9BMFMcj96tAx4kVmhVvPumOYsN1Txyv6JsqxGWs4AUAApd
 R7I6FXHDB8Ku7YDWyQ+c3teTFxEC+ETh9myIqOqg0Ykot9ez3EXVjdAqzNNI6mwxLa8Mqj99hU5
 1fffH8IybDNcUKnxR8T3fmBQulNLx6b0hw5/40Q5IjexV3OjIR/7e7taBt95N6FZ3NIGmba1B+5
 q+9ZcAMB38IrE0nMB0mCaszO+HLW6DsBuD9Kid3QLRb3veJYCVrTdnNeyDx11Xs3+J6bSmGgEwF
 gn9yiEc7goW08OEqvUPGC3tK/+0LEH4OqAa9LWJrvGfpvVsD2Gd0Yv46ocw3HUK56kJ2e8rDQEE
 VCEieilBy3NfSV8aUqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE3MCBTYWx0ZWRfX0AbH47O3uzcj
 qULZujdjzDOWvinuxXBXwsRjFQv1+ct9gNX0ZNL1MXts7dhA2XR8gOA+EEkUMEzcthY4TP3NgvC
 EcmJtRRAtMgaktSDnbfc1FlD0YsIia0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_140634_965374_FBB44E76 
X-CRM114-Status: GOOD (  13.91  )
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

In revision PROC170E1 of the J722SXH01EVM [0], the audio codec's
(TLV320AIC3106IRGZT [1]) MCLK was provided by the AUDIO_EXT_REFCLK1
(96MHz). Revisions PROC170E2 and later switched the MCLK's source
to an external LMK6CE012288CDLFT [2] oscillator (12.288MHz). The
PROC170E1 revision of the board is not publicly available.

Fix the audio codec's clock by creating a new fixed clock node with
a frequency of 12.288MHz, and switch the audio codec's clock from
the audio_refclk1 to the new fixed clock. Remove pinmuxing and clock
muxing for the audio_refclk1.

[0] https://www.ti.com/lit/zip/SPRR495
[1] https://www.ti.com/lit/gpn/TLV320AIC3106
[2] https://www.ti.com/lit/gpn/lmk6c

Signed-off-by: Jared McArthur <j-mcarthur@ti.com>
Tested-by: Moteen Shah <m-shah@ti.com>
---
v2 changes:
- Change the audio codec mclk's name from lmk6x-clk to clock-12288000
  to resolve sashiko-bot's issue
- Change the alias from lmk6x_clk to tlv320_mclk (this mimics the
  k3-am62a7-sk.dts)

v1:
- Link: https://lore.kernel.org/all/20260724203250.1914444-1-j-mcarthur@ti.com/

arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index e66330c71593a..90c3e3c9c496e 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -162,6 +162,12 @@ vsys_io_1v2: regulator-vsys-io-1v2 {
 		regulator-boot-on;
 	};
 
+	tlv320_mclk: clock-12288000 {
+		compatible = "fixed-clock";
+		clock-frequency = <12288000>;
+		#clock-cells = <0>;
+	};
+
 	codec_audio: sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "J722S-EVM";
@@ -187,7 +193,7 @@ simple-audio-card,cpu {
 
 		sound_master: simple-audio-card,codec {
 			sound-dai = <&tlv320aic3106>;
-			clocks = <&audio_refclk1>;
+			clocks = <&tlv320_mclk>;
 		};
 	};
 
@@ -228,11 +234,6 @@ csi23_mux: mux-controller-1 {
 	};
 };
 
-&audio_refclk1 {
-	assigned-clocks = <&k3_clks 157 0>;
-	assigned-clock-parents = <&k3_clks 157 15>;
-};
-
 &cpsw_mac_syscon {
 	bootph-all;
 };
@@ -358,12 +359,6 @@ J722S_IOPAD(0x0084, PIN_INPUT, 2) /* (N21) GPMC0_ADVn_ALE.MCASP1_AXR2 */
 		>;
 	};
 
-	audio_ext_refclk1_pins_default: audio-ext-refclk1-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x00a0, PIN_OUTPUT, 1) /* (N24) GPMC0_WPn.AUDIO_EXT_REFCLK1 */
-		>;
-	};
-
 	pmic_irq_pins_default: pmic-irq-default-pins {
 		pinctrl-single,pins = <
 			J722S_IOPAD(0x030, PIN_INPUT, 7) /* (K23) GPIO0_12 */
@@ -562,12 +557,6 @@ ldo3: ldo3 {
 	};
 };
 
-&k3_clks {
-	/* Configure AUDIO_EXT_REFCLK1 pin as output */
-	pinctrl-names = "default";
-	pinctrl-0 = <&audio_ext_refclk1_pins_default>;
-};
-
 &main_i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_i2c0_pins_default>;
-- 
2.34.1


