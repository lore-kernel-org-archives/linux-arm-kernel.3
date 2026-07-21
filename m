Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71D2C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 05:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6g7HvbqEwH+3mGJefUuDbmttsOXFpjb2xDOqx79GnQ=; b=ijlA5lsI3gAZQ9Cu3Sk4NDqhPO
	qJLhmmp83q4cUZugYC3BNhdOizesymTQf3y0nqtaknWeDwzGpBkZ7UFH11xJyC5ApKRbbzjZ5AWZi
	2WIRpSEGy/RPg6A5QWYgbcNJ7YNS3XoyeW7Y+KCeaqw7EWrG5HrPOh3fOTlLAZuCJZc5EwpTYSEfL
	2gmnZ9w9u43nRj9nAGk/0dkM3QbFJyiG8zHZjmV/fMY2xcaWdleMKqVgP85DA43nagXIWwTWnrVtP
	XTKVzyu3jxE0GApJ2qmfTBr3vGAObKI1nfR/Ah15iKKglqcAN5vgfiY0gT+6mGYOIYahef54ySQD0
	RRSwH6Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm2iX-00000008Ph3-3RAP;
	Tue, 21 Jul 2026 05:08:33 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm2iV-00000008PgZ-1BJG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 05:08:32 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66L2ff3N3857726;
	Tue, 21 Jul 2026 00:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=m6g7HvbqEwH+3mGJefUuDbmttsOXFpjb2xDOqx79G
	nQ=; b=GQhOco5Hv5nepUJ8jwLgrGFa5N3NXSKBrVwq9j062wngJk4opc51uthJV
	W47wDa/zIW42k76bw5duPNqvAdPrJKJUYsH34TwjLGnIVG3+gmxBEZ+5BK4QJpsb
	6Bdpg3sH2YHtrmlwYWKAqgpiKM1jfq6FJOyEA6h6tnZ2ohFUaA2o9HnxUWXxVh7J
	B2scZWGrFRVB4+/VDueme7LM7SYtxy3ezaZ4ieR6rLXg8dlYYEX5CPMJ9NW8zOMi
	0O+w974lEDezFvpb/PvbbKHflYNoBmfrWv6PnP93g7ekGiHDZ4kGPOQ1OirrMfqB
	LF7F691v9ej5bQbJ8Is/F9n8EWJjA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012003.outbound.protection.outlook.com [52.101.53.3])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fj077gjb5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 00:08:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TObB+tPKKROWJgdBQTN6hMpGgnNAHYRHSt6zw0nmoHxW4msto4Wd3SC4FTs0+OTYZsCDvqOW9/msnjxma4TF9jrQiB5F11MDaMgYwiqAsSivRSilZNqB8zZBBFOA5/fAiValnCB6VHRF+2lF9CFwPBt9GJf3lJ8b85Ysky/kDkqegwHe8dQWOS+zZHcP+dU44T9tQsUrFoZPa4qSBexCFpuEkwYQLjshdLV8IsBTmUUGbMRIzya1rVFMlwP1U28OF9E5xW+a/fRbX7QZ+bwXQLzc0y7EXqEOPS+rjR/p+BBYPgVJkUHTRayyrxr10Pft0CAL/YGej/43Mv9lPTifGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6g7HvbqEwH+3mGJefUuDbmttsOXFpjb2xDOqx79GnQ=;
 b=VC5PHl8+H4iM08Hjwv4NJF8DSZYE9+QukEmiJhfKFyMzahXep/hCuvrbM6jGiSZAI9mYcRO3KtgCQhFY55ozTnQfrcltU2CkqfgGgRtAHHoFF10l9R6rPOQ9RSrcB178X3MXTEdSv2zIjIs8EK6jWL2XnADAppPkxK68slSqEhiaukG85tOt/5UUbAjHNDoD5tJqvqTIlQ9RHN5yEKE7bBaFo4968pPXs104hO1ytzgn9rpN6i8npTTW7Z1yuUQugxWZif/cdFrr45oKxN2Dl9dRASgwkwDVFeeqSv1nZoE9BiGUxPr6U0VNwIAADaqpe5z4EsyudBUFjnIOgYXHnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=dolcini.it smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6g7HvbqEwH+3mGJefUuDbmttsOXFpjb2xDOqx79GnQ=;
 b=j/Q8yAOXC/LbQDNaYdfbsiAB9X5015XYVqMEi+mhCOiKEtK/7eHr9VK8oI0500TgbhDf7vi/FYHiJqqR73GW63nVV1cy7GLX9MwUjbkj+I8A9xtLD4wo7IfHtOBZrnfdsLm1BE3xRJEGddgumdSSfZNVp+tCXYfasDlfD73ddkc=
Received: from IA1P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::7)
 by CY8PR10MB6538.namprd10.prod.outlook.com (2603:10b6:930:5a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 05:08:18 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:464:cafe::a2) by IA1P220CA0023.outlook.office365.com
 (2603:10b6:208:464::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 05:08:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 05:08:17 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 00:08:06 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 00:08:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 21 Jul 2026 00:08:05 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66L582q7524876;
	Tue, 21 Jul 2026 00:08:02 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Francesco Dolcini <francesco@dolcini.it>
CC: Francesco Dolcini <francesco.dolcini@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
In-Reply-To: <20260715055446.31139-1-francesco@dolcini.it>
References: <20260715055446.31139-1-francesco@dolcini.it>
Subject: Re: (subset) [PATCH v2] arm64: dts: ti: k3-am62-verdin: Add RPi
 Touch Display 2 7-inch
Message-ID: <178460998969.873002.13457104811182482283.b4-ty@b4>
Date: Tue, 21 Jul 2026 10:29:49 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|CY8PR10MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d11aeb6-0493-412b-b90e-08dee6e61345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|18002099003|22082099003|56012099006|13003099007|10067099003;
X-Microsoft-Antispam-Message-Info: ZLI/1MMyay9gCwiaRbEZIo3XB+s2g2i2C2+V3yekFl2QxvyEBjjOBpXDHzShoKCNfxL1xAa0yx/mvGsWicHmX62C+WG7GPStGqePh5DSdr4AtdniCuLdErbmrb5fesKu+/6W/P/UjGQj4Y+MB2smjAh4LfR69sAqJzpc+6PRJorEk30zL106VP2yXIidVJOQ6upV/cZ0lBbWZ2WnU2yNQUeu0ohkGJjVTlO/3YRxLudvwctM7xs2K3USAoo4BNO3wFPcsr3Dk2MebCWWV9cRyeAxmT2OYNROl3g5Eya7dX3Xes/Y6CfAcEfk0vMQDRVeRCkkvFJLRhfCRLVz0KNQx8DZN0xxoXCUJLHK9+HjIaN1qOIwMEv93qkf+2+epYJhc19REb3aKjjRn8DZUkKdolQNjzwy0Rq033MsPWIGS7GO23urqNSsgar+5TWlzCps1DwKOxgTyBHxkP4nMyOuJuGbrHg8a0nLplYvszWGYI0x6vX0rLBAdtIDDZJCKVlJABGwE8q2g6PPHCG3NLFLYXt6tmprl3JIsWjym7dtdL7wcPzVOj+r345OSPvri1OHb4nJO8DjDYlQ4/20UYAoYg44ADS5nCwG8xkYz1pKW+lVrBHWs1QULNHYTpgf1gv6u3Jsx5xvOnxuzh+osCr1OcireVUFi+2NlqtyZYUSGnyYtBPIMIAXdmwOrbHMVmMpoa8QZE4etUrLJWC1H06uBg==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(13003099007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LQUnrNqJTEmERAGMC6xc9TmchX4kAJYXE4NJH485HBTVx9yV39M1UWLYZFNxqI0tdmSYC5m3fm/B4nowBSyM7vY19BMs20Cq/Ncf6LbMLf0F6cVSl6xh1cunUN4XtnjPT0b0Zd0Sevki1M34RSVnvPyMappS7D3GdSFFpNJ9UW8htad50m83hQ8WLPKSDs1IR7BL+kfD+0IN5MsfN9k1Wq/4nhsjVILXPVopkb7GEOuIoC1C7FYOvmtY6qeM0X1fxSLFmVkoj554oeYPMy+BFGbWSbwUB6CAzQ7xg+/UbdxSLpgUX2Jxv98CAS8BCQb8GYROWJ08LgMblosE0sbdla2gxmTJxk+g4aR+1JkzqcSLHPFqJHMO6e37jW5flqJi9T/aBjek59qR4QS45MYqVpGCHwXYr6FA9Knshk3JIBqL280DqQfrdhiXSWrhCwDL
X-Exchange-RoutingPolicyChecked: lokdwlPhEk3How5jCEceD3o83YXkB8VUSnsZNhLYtslKhTjfNrR2cV2rvEXpKC2g4w5XozjaPfNLRubIen4MuvuCrxpBvXefqJF09hG+K2uR6HGyDmtIh41YFW/84amK713COxrHT9Vb9hh7gJL07B3bL2rbRKQtuo5kwX1V3AnTlakKZ0UbLimPCsURPozZf81wOALFC1Tb4bFKIfr1LNI6p63QfFgyDL0w9/Z2qi1W5Xv98EaER+UYaagFG/+VIjabk2ZOigq4JXAfpcKYZBMcbV3VyLZj90d4c82mM7DleB1l4hBTSVKD2BU/tM+Ksqo+rmo6+PLYRbQO8npImg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 05:08:17.2236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d11aeb6-0493-412b-b90e-08dee6e61345
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6538
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA1MCBTYWx0ZWRfXwi+0yXLazuDx
 jiWRLyo7h8oxk9zE0aBYAEqu646u3zCLAUuVhM1bxYQJKAbJJ/pHy6fXGl3j52Lj0nAPJsx+GRZ
 fPdX/QBFDBgebo2twyC2ZCTfIjUAF+wGTSyl3T/6+zUVwjpG7wt+gxZZaCL2cevQHsHmZwbzYKL
 y3x9b+xkbxJovPjvWjjISlnB8S8HaIDogVbTcdzkbR1Lij6i0qQu068oY4pEEjSbQYpVtA0QNb5
 zsiAyHT1O7d7Boe3UJUm8WKR9h01/lLR3T4TuHJWy/4CjoYdqzzPT+s6Z4VTV/qg2HIVKKQb/44
 7kmOahRiKiWQxjCBOlAfoSS86W5SN8b5dm7opkc2lHzxogOUQyxqFtx5NxGXrjQOPfFNe2FDAjy
 oNpUgOK0rdo1tTSGsFvixepLZXMdKTPcMtRECFoa7Y8+M0T3RC/v2aobsXTmE8Eo90HOiHksSfR
 vV+uoXNq47/0u4GSNcQ==
X-Proofpoint-ORIG-GUID: 3dF9sXzHkUBIyQ_sA0gnn0oLB5jKwY0S
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA1MCBTYWx0ZWRfX7ybbW/TCSgah
 OB5BWfKVSn8MDAOaAUlAk1a8aZ4WAwBhQFgNq1N5tm71BrGYwFOO88te9tiGEm/qavpfGH6YKyY
 xbxKUFraPXiWxBApAXEAITjg7uDKM2s=
X-Authority-Analysis: v=2.4 cv=KabidwYD c=1 sm=1 tr=0 ts=6a5efec8 cx=c_pps
 a=eZaJmiuXqmfvnt2b4sL4XQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 3dF9sXzHkUBIyQ_sA0gnn0oLB5jKwY0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_220831_357051_BABE6E0B 
X-CRM114-Status: GOOD (  11.41  )
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

Hi Francesco Dolcini,

On Wed, 15 Jul 2026 07:54:45 +0200, Francesco Dolcini wrote:
> arm64: dts: ti: k3-am62-verdin: Add RPi Touch Display 2 7-inch

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62-verdin: Add RPi Touch Display 2 7-inch
      commit: d55f26485cd17f34bb4d5c0acb32a199e235628e

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh



