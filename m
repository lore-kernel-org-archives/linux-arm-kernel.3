Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5A1CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmuAgNdVmjniBdoQIHgLOr41745ZNLiPqGkW8D/yo3w=; b=W2b53QZISD1wAHyYTmw+bTXe1H
	ewMPeKIa6xxWMiZqJMorfyo306vYBkfnJ17+p26hDxIkKjoYnaAJVH2jxQeCDo1Z/uYvtzyrzdrFY
	OqxQnZ8UQbpmtEw1TH5HuFtoVSLq/D1WxYY42L8kfQg8sX54JJ4Zz93aXJWNWcJnE+JrTTcU8ET7B
	nS2P5nj7omcI5Wm3nRUV0JjGd6Y4YRhT9SaFCM7E5/4R2XO0pkg3hIfeqMTSQC+oSXwSfqnEN6LM7
	SBRt4L38h04TBnUpOlItpeDjn0oQjYmhiae5Y5dqg7dfAIxCJLbPzzY2Skldde5A2uuBCPdQsaER/
	WjlEnMKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuDf-0000000ClgU-1YEY;
	Wed, 17 Sep 2025 15:37:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuDQ-0000000ClTR-48c0
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 17 Sep 2025 15:37:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jmuAgNdVmjniBdoQIHgLOr41745ZNLiPqGkW8D/yo3w=; b=kBziVJcE1KoVa5NtQYXPNJzc/k
	4tZWWABRX93d9rN3Ip30g5vOlNPY+5y81xWty0noAdVrCvXGKAQhcQdZXLJ9tUv/X2yEsVC5NBt+i
	Z8gx5C2if73LG6ksrS7vAbrMit2oD0rprOYgRpWngu6aRqYilD982LTYA4bJ1TIwI1X6aJ4R4Lc2r
	8kl/7otsMNHAU73IyhCg6GY5P8vbJmlU1lYK0XoPQMnL7YiBIDJ4MYs7bIijmq6ev1dOzyCrBsw2x
	VgLr7ALBG3LNgEEGyt35mRVHyRqJFRC7Y7yvgLFUH4ZRLJ62ez37ffQXJrAiiZ4OLml5iLD4/JvGg
	KPHwdoCw==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuDO-00000007RUt-03dp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:37:03 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HFX7P2015745;
	Wed, 17 Sep 2025 17:36:47 +0200
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11011043.outbound.protection.outlook.com [40.107.130.43])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 497fxavgnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 17:36:47 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXRFaPSQMrCxwcwJxJR7FjJsJOvyXMSaHoOo9+cfKfwlfUTFh40WiR2CObwOvlnZ44CfmtobLIwa9VLe90KjelR6K1H5Qdm0wEqzfzeYo8F51CcSLmrTsamD7tVwbyaVeEVy+cpnOutlFhKg0CxBW5mqG77kb8MTyLkUn2WqkMdTH6PPz/PE1+wPqcPro9hcEyvFiPqNwTsrmCEjURnCA6LFJ7wjoXTLYz5Uv9KnX8vtbq8oxMsdgLenDe7rKBsOnVZKD/m9TBW7Am1yZrxxVeaLRJdXqC1jK4czeaNzEXuD+kctAOdWJ7prZjoai9sd/3XqH5SMe2Uto48Ux1H4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmuAgNdVmjniBdoQIHgLOr41745ZNLiPqGkW8D/yo3w=;
 b=VA5M9JCikORultrwhoK23ZVfC/9YVJ3oCN6QmSV/1NcyKnSxV/BY26k3GkSDLYZ2X6q0Eu7vagi0DaVVIFHGeHy+u0nWCI2L1xGI8152+YlIpZwIPdmyiHKeXlhqyAouas2bww80UF+2qvvVg/19lexCfMcDQjwDYA8Hw4qh54ADAYpJZyC+fA501eMeDDS3WaMeA7SVEO7yPbcUqkQYGTQ8ROhlL8hHRwD8RB3CrH9THGkm0UV+gG/0FCcdjEtkWKM2H8iOrB8uP83oRjNPLMayiW8tem68Uh3h4Z1JH5NsSYbRSL9QCCMvjN2m2u1AczHkt85QgqwCyk5TuV+64w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=google.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmuAgNdVmjniBdoQIHgLOr41745ZNLiPqGkW8D/yo3w=;
 b=GXTsrjyvakez3EZx5fgw1VdcmWf1WPif/LyhzxmNBCqdZDJhdIJSNjStS3SpK5Jb+1HB4Aib21QJjledFuwQw7p5xysunlTwzUjONq7R8MC4v7MlSci+q40oJhJ41rPVxRR5/JDZIFtxg5zZ6sMI4WUborGoRsZgPtzZSMgXyDFCXnF8a2zmkU9X4HINuTAl6eW+P5Bt7oTdeo15Tei+tIEkfxg+As9noGfD6+cin6MzVv9TZbiyLD4n854nI1024yPZRI8aJ/dKm5O5g57VW3j6e4h+V0qm/embMa2rftDTt8IjoZxVNwuBgWJNPbCfKSQKOrZDvutdrX7U4DhW2w==
Received: from DU2PR04CA0311.eurprd04.prod.outlook.com (2603:10a6:10:2b5::16)
 by AS8PR10MB6055.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:570::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 17 Sep
 2025 15:36:44 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::2c) by DU2PR04CA0311.outlook.office365.com
 (2603:10a6:10:2b5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Wed,
 17 Sep 2025 15:36:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Wed, 17 Sep 2025 15:36:43 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 17 Sep
 2025 17:29:39 +0200
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 17 Sep
 2025 17:36:42 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 17 Sep 2025 17:36:37 +0200
Subject: [PATCH net-next v2 2/4] net: stmmac: stm32: add WoL from PHY
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250917-wol-smsc-phy-v2-2-105f5eb89b7f@foss.st.com>
References: <20250917-wol-smsc-phy-v2-0-105f5eb89b7f@foss.st.com>
In-Reply-To: <20250917-wol-smsc-phy-v2-0-105f5eb89b7f@foss.st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>,
        Andrew Lunn <andrew@lunn.ch>,
        "Heiner
 Kallweit" <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "Simon Horman" <horms@kernel.org>,
        Tristram Ha <Tristram.Ha@microchip.com>,
        "Florian Fainelli" <florian.fainelli@broadcom.com>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885E:EE_|AS8PR10MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c5087e9-c186-400c-cf92-08ddf6000146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWZuSTk3U21jcjAzeWhWZlI3SmZmN2tEZG1CS3A5NmsreEl6c0NJQ1FiOTE0?=
 =?utf-8?B?R0IrZ1NxMEFqVWF3SWJPZzFJczJrU1NMYjg5dXZkNC8zTndLcy9Jc1c2bTYz?=
 =?utf-8?B?Y1c1UGdpVHNUNGJWNW5wRmZjNWhqMm0wQ2pJY0NsbkZhNFBoclBwUXAwTlJk?=
 =?utf-8?B?Q3Y1R3RXWjg5ZElieThLYXJEeUJ1Q3ZOWXczQUdLMS9GZXU1ZHgyeDVlRUhz?=
 =?utf-8?B?aWJST1VLV0hpbjZsOHlVWmhQYWxaNWx2ZVdJUVVTcnFVYjl2UUMrUlRKbCtI?=
 =?utf-8?B?V1VQa3hwWXpQbThLUU9SSGd2V3M1NUs4Nlk1MXNNd2pSaTBVYXhuOGNyM1VV?=
 =?utf-8?B?THRYQnhiYkY5YWtQdWw3SVhTUTdOTlltd3hseWtyczh2N0RFaEhMcUFZa3pE?=
 =?utf-8?B?Nmx2emQ5ay9mUk0rcXFLdzhsaGxOSEZQTVlycmJqUUsxaXRPbHlJVDhhTHBN?=
 =?utf-8?B?Q2dtK0RkTm0rRHk0UzE5Y0RLWllFMS9yWlBQblc5YjZVY0R4a0gwOVprNVNw?=
 =?utf-8?B?VDZoU3pUTS9BaXRSTTJUNWNOdGFDUHVHbEtpWm5LN0pvd21RZksxb3ZUaUE2?=
 =?utf-8?B?QU1rYktzQ1hYdkV3akxOZDN4bmNqWVg2OUVjaUNLYUFQNERVdUJPNk50Y2dj?=
 =?utf-8?B?S0NnaXROMjA1UndXTmVhcnlpaW9aOThtWXpFWURoNXA3TnB6WTRPMUZHVmlp?=
 =?utf-8?B?alB2dVNDdVlwWlliZTBreWVWZUk4ZEVQaE1wTDBOVnJSWlFHeUZsRlhsU2Vk?=
 =?utf-8?B?Y1RhRUJhMk1MRFFKdFpxZWFUaEpsTjVFajBkMll6YWp5NTJ3cldNUFNtR0lK?=
 =?utf-8?B?bE5KNkxEVjVIUVg4QUNuUXBQUGM4OUZVSTIxM2JYQWRmUVlMZUlNaExSeU1a?=
 =?utf-8?B?Z2lVaWczNzJYYktwZUxrYWN1Z2dSVjVJRGlMaktCSUZMa0dEVXRMVS81QVBT?=
 =?utf-8?B?WXpxR3JYS2pEcVNVdmR6OHVCSmFyUGpYN0ZqRFZtQ1N4VW9Xc2VNc3hhTE44?=
 =?utf-8?B?VmxHeUw4VDhiVnZ2QXNIR09YWlE5UkFaKzRJd0oyYm95VFdiY2xRM3RsQjNO?=
 =?utf-8?B?UXVEc0VXZnFLSEVjSVZkRi9TeGZ1c0FROUY4Ri9zTFBFczY5WGRySVhNOWM0?=
 =?utf-8?B?azRSTkxFd3JvSkcvQ3FOLzVNdjhqenB6VkdIekh5aEpMMSsxWWxoRE9rZThG?=
 =?utf-8?B?NHVTYWtSWnpNbmhGZzZRK1dFaDlpWnBKM2tZZVY5NkFkczNWdll0NXQrNW5L?=
 =?utf-8?B?OUh2WmNabTdxdXdXenpVb3VURmx6RTFqM3ZBWVZtaUhNMk1jOTA0VGtsNm9F?=
 =?utf-8?B?Rm5oSFJxWWYxOXdFeVZzY1NxYmV3VlJmdFM5SU8xQmVKckJaQzlEbkY5cmQv?=
 =?utf-8?B?bHdIUXlWU05GNDdvTnhnS1o4OEZQUUcyaC9kVnc2Q2cvWm9SUmNnZCt1V1l5?=
 =?utf-8?B?N0xtMWszVHNIdkkvekpsaUJkUzEzOTcwbitNcENLNVpSYjV2QWp6czBtYWpW?=
 =?utf-8?B?TThHaCtuQXRKZ0ZsVTIvT2R3ZmI0OGNncnpmUUZBV01wc2Y4a1JGL0puR09q?=
 =?utf-8?B?RThCSysyT1BzM0hBd2JxNFBaOUdNZC9iaXJyM2JISUk4U080bCtKYWxLdjIx?=
 =?utf-8?B?NVFGa1lNaXZubUdnRXpEQUVqWnpmZE5MU1NGMTM1dE1uREQyNXZJdUhIckpU?=
 =?utf-8?B?V3Jwbk5paGFqRUdyRUkxdEhYdld4MTlFdDZLNDhqZ0xja2Jla3R2enY4NUZW?=
 =?utf-8?B?YmpjTGJsY3N3S25hUEV4SWMwcTZtVEhVdDJ1cFpVTGNKOWJRRDh2cThkcDZi?=
 =?utf-8?B?QlVFVElESlYwdXc2MTFDLzU5aW5OSlRET0U5NlJJb3BoNmVLNUthNm43WXBL?=
 =?utf-8?B?T3pMMGVZbHgyMmp2L0laS0llWlZ3dlV5dG5iOTlwN1JieDZockxSNGx3UE1j?=
 =?utf-8?B?dTRnMk16TUFTdkxpeEdtbGFHNm9kaFl5UGNhVFZsVmVaTjZlTU5kTHpZU1NZ?=
 =?utf-8?B?WTBEVzk1RFU5WVg2L21xWVBRV0hodC8xL2thai94dmQ1akpHUmxYNGE1R013?=
 =?utf-8?B?K2JGY1YrQ2d6aXdiNGxUN05POCtKZDlxcjk2Zz09?=
X-Forefront-Antispam-Report: CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 15:36:43.7130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c5087e9-c186-400c-cf92-08ddf6000146
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6055
X-Authority-Analysis: v=2.4 cv=RPOzH5i+ c=1 sm=1 tr=0 ts=68cad58f cx=c_pps a=CUAEBjslK4IwMcEc9encMA==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=ei1tl_lDKmQA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8 a=KdhiARzPwkhzkzMreFQA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: qC4pqSwilYu0NXw46aJRt3LpocmAZcEV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX3R9ZFB1LPR2R 60ooqj/r49VFxKhUX++H2IVOXsIPWrWkqlp3e9sUEqgbU0buina0uKglEWlBD5Lfv3pVLjkqdzV MxQ//FKn1gZwV7f04wKxob0kneQwzKKeMzKMLktHo+aOZbI03sl0moXWlVS+TMf+Pi7d9lT92/m
 6dLg+d8gtIWKKcANnTGUrH3nfXcm8gaQQ15gb/uYnTj3XXEJP6cQzwb3pK4Gqt7fkqipLbSp2To MehuuG8U5UBIHwfItTnCd4coTUFGSPz1CAXulm9pgcXFUqE1gYeTw1AjsYchRgeF4nE0mCwl/wq krVwc8QMeWFNXMW9b15kA0SI4Wh6p9vKu28xwXCLP3+WGhMTqOap02+IalazzrUcUlOll+z2i2t /3huRtZA
X-Proofpoint-GUID: qC4pqSwilYu0NXw46aJRt3LpocmAZcEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_163702_227363_DAD99013 
X-CRM114-Status: GOOD (  13.84  )
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

If the "st,phy-wol" property is present in the device tree node,
set the STMMAC_FLAG_USE_PHY_WOL flag to use the WoL capability of
the PHY.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 77a04c4579c9dbae886a0b387f69610a932b7b9e..6f197789cc2e8018d6959158b795e4bca46869c5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -106,6 +106,7 @@ struct stm32_dwmac {
 	u32 speed;
 	const struct stm32_ops *ops;
 	struct device *dev;
+	bool phy_wol;
 };
 
 struct stm32_ops {
@@ -433,6 +434,8 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
 		}
 	}
 
+	dwmac->phy_wol = of_property_read_bool(np, "st,phy-wol");
+
 	return err;
 }
 
@@ -557,6 +560,8 @@ static int stm32_dwmac_probe(struct platform_device *pdev)
 	plat_dat->bsp_priv = dwmac;
 	plat_dat->suspend = stm32_dwmac_suspend;
 	plat_dat->resume = stm32_dwmac_resume;
+	if (dwmac->phy_wol)
+		plat_dat->flags |= STMMAC_FLAG_USE_PHY_WOL;
 
 	ret = stm32_dwmac_init(plat_dat);
 	if (ret)

-- 
2.35.3


