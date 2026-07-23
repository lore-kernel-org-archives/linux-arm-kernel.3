Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED04C531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 10:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybpk2brmQuhbE1+K0KF8vmtEg0Dq6Ei7nHBIr433PSg=; b=bvylaqR8eLnmcsV8XL8dI7SXml
	fGiDimEfu+p+FPJWNh5hHLfynPAOkEpZo1+VRvPgrpaCdOzZQOSqfB0d8JsMS6mHzKywzy1pkKBZb
	SdtvgevfPGIzfoNuuL2SQpswgqYZiT08DiD5NarsXg4HINl5/16DBYwsc8zwWLgweITOb8arYNxcL
	j3pfcQNCrHi9nwl/IAIXJ7uNhO5YlFWsQeNcoKtVqPzj0hZeZ0RJjJLEUzDYKrfVR8YTsj5vQztwl
	4k0KEo7yID6SC6hwUookJsGUDuKqBe3TuyzJFyR66DaN6Sf16ewjFPzayT2zFFCzXcIPMKY8brDPh
	5XyOCjlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqcY-0000000E1Ng-1ElU;
	Thu, 23 Jul 2026 10:25:42 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqcT-0000000E1Lw-3zhA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 10:25:39 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8t4JD1974520;
	Thu, 23 Jul 2026 05:25:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ybpk2brmQuhbE1+K0KF8vmtEg0Dq6Ei7nHBIr433P
	Sg=; b=kJls7oz+XjWY6N/VFWf0T70gOqiU7Ovw9Ijud39hKqm4s2ZvN09zba7P7
	1Uhm2q00BD+1jgV/Hu0Q9iBHZt4lZVGlkiOJN5RQVSeeqb/k8bykmJNtFC3z7lWT
	9WfxfHA3VZyr+EDjWPkRuzXu1mPbviwqc9tXHV3uCxBh16cAUOYLwkuEbTdpSguz
	XyPEZncxf3OMCk+UBQaHCwl5VhDEHNABXW5WAqxJh+QtTxA4RYU5f63eMw+3MFvb
	prP09DLr8SRxe58T0Wsb5sFyMnWfiItrufohdmvYSTs+0SMyazpi4WRhqvmapcHF
	ZZ55yQSSz6Im7drbb2zxKC6cp1a4w==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011010.outbound.protection.outlook.com [40.93.194.10])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fjwjbxp09-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 05:25:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0L4lmo5m5xFrzyGNAYIlfT6eAgBWMLeKogFFB28tXihU02V43PWbpcY3HqFQ/jN+NnhVG3z/mHhuT2Mjemmk0P7Ii9nLQJYeYOAHAhUbQSyPPWhLJZ0oAZE9/BExVAcs0QYJIDwXtaI7hO7fewVQLSa7VF534kuN6+sj/ZF/qjaowTZCIVvMjta9/cJ0IlUl4oJjfQXhE4k1r8t+FhgAKjV2cD+5fK7VrUPRqaQIIlVEgL97NsOX6+ZLgmIY7D1rF7WDUgD8GwGZo8t4U8HaL4hPnotIf63nweLxO66F3w9hPWtAigBRJn0a3JaUKmh4rukkrb0fgBq+74uBRZG/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybpk2brmQuhbE1+K0KF8vmtEg0Dq6Ei7nHBIr433PSg=;
 b=I6FSS3BAk37PJ2UDI1losnlrivTvZG8ij7MExUjjLVN2AomJO2gu8I79R+M3VDfqNc3McW9JDxueC49lk0FOxnCBJvmFsM/RDYG5AxH51L+LiekOPStve30ySuxW9gM4kcLTHwQUkWn4vGACyb6mD0JfBB7EVkI1DUKBChEBIhYGva8ILlWuxj2/5yTUK53oS5TEx79nqal0zP2LK+kWXsZW/c0YEgVI6Bw9cc5Krv1UOHm8YxmbzTif+L2EgQopJgGs0USgM83JBx+niIkO8WzaJoGKZab6WxN51yZEBdjmkWvQQZPPF0h51ERJ1O/noO22liUs6q4E+X6Ya6ecrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybpk2brmQuhbE1+K0KF8vmtEg0Dq6Ei7nHBIr433PSg=;
 b=wIWBf5QXpeV1HQCKogJc+bVimFWWB9ov/UNqDzhH3P80NuYbq9WVddZAxJHkk6N/OgJWHk1BKVUT082nOKvz7d/MVhO21xLR3sgZSXyuKT/KGefBmrxYG+Nl8CV6mm1AKrqIeh8W6w6XiyR46BlkmC7OwFbgxfExuVentPa+dUE=
Received: from PH8PR05CA0017.namprd05.prod.outlook.com (2603:10b6:510:2cc::29)
 by LV3PR10MB8106.namprd10.prod.outlook.com (2603:10b6:408:27f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 10:25:30 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:510:2cc:cafe::83) by PH8PR05CA0017.outlook.office365.com
 (2603:10b6:510:2cc::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5 via Frontend Transport; Thu, 23
 Jul 2026 10:25:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 10:25:29 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 05:25:29 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 05:25:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 23 Jul 2026 05:25:28 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66NAPKNg1518375;
	Thu, 23 Jul 2026 05:25:25 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>
CC: <devarsht@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-jain1@ti.com>
Subject: [PATCH v3 1/2] arm64: dts: ti: k3-am62l-main: Add DSS & DSI related nodes
Date: Thu, 23 Jul 2026 15:55:18 +0530
Message-ID: <20260723102519.3581762-2-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723102519.3581762-1-s-jain1@ti.com>
References: <20260723102519.3581762-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|LV3PR10MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb307f5-d3fd-48fd-b95f-08dee8a4b839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|13003099007|18002099003|22082099003|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: zd/NGyGAwwEKth15Vaw56QjXfDcMfcL2tZU6kMmhy9lV9zCUXaEWDKVQycF1EB9O4B1kKnYoX/2Zicd2vt1vqbG4lcP5/vUbP5fTmZutvcmSkTJHM+kNiwIk5ZL579Ey58fF3c8i2DsniowDytAAMHSF6YTzfRVTKimDOvJu65WsgqMpqd0XtSZ99gthRYSVGx4WuM5oD6Ix83Bg7mglpWldpZ2jjDWkZTxZXQLSuXTGd2ogWTh9gC6WeWQMrlO3+bw2QGE8+E+qdKO7x54tM5WJb+n8W2i9jJ57LT/LfjMJm9dOwoTjQs5chKQEHm4Zg3lyqPmEMOprUxWFpflc5YKYrFKxpbiqcXxJoWXbm44es9irk8CecePSEyKZC4zTaZiJ5WvyYu+HhRg3GDPtjbVHcDwn0HWXsf9//nlTG4yROAsbeJOAbRUquznnvIyANWjEhZy74pDYj7tYePWUhzn8uQFlcrMQSnpJPgsVfpXuD9Dh4p5L7KostfmrsoWr6EuEofb9+cVjhhYS2Gy8DC1uB5R94RZck67f44Lf4Oc6MVA4HV8ECEWrmrIUtr/xBV+iRAHLMpB3+bq8AiUCqswbR16oAV5bUDky81piFobT599pqWDse2XrJsXIM1JrHrNIpHUG2/quHIY6QHhb4pQjnx/93JuXAFZq9H7k/qNlSZN/SaWaZlpbioIy4ToKj6Gs+QYehiKkvE6I5vFevw==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(13003099007)(18002099003)(22082099003)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fq92ETZBnkFswL7ufzCG8ktlpTBExV8JYKkPCTd38QhxAwmPCRmOPUTXP05oGH/5qTAI2i73zTJy1nFjOqYD7gFsXEvo5pTl8o/4ktHMYUphcjb6/+rP6WalukL9ukrOqYNfe79NLpkHuknySil7Z0lWHY74J0m0+AIJbCrZbvlX+S2wy36o0OP9Zv3NFMOIl8w6iPs9Y3FAgjmSt7tjNbLG/RND23e7wxwNucMuckAqTSpgCggJcVXFl45dFpG6yrWHQavA5ElH8pt71wliEEB7/y5dhkZcWQ2mFyEEv5ESx1pyDViiTF68RWKyfMTZCZdk+MQ1R9jeYE4s81NvMqFKgBHsn0E7R0vW4w5Uk/tvyBcCld69MjhdLPn99WpSEyLwEdDe5bS2TCz2m08ixug8mZnyX0HUUOw5V2/k9Wvc09YHrAufWY2PpGZcootN
X-Exchange-RoutingPolicyChecked: YVau2rSX3dwZwA3K7Mfkhe9VBTs7F+7NyLGEikS0MyWyVtlOPnNT2ZsodQuumUpCllmh+GY3YYbsVKfPFpwSintvZS3wTXrmeFWnSe822PSrg728SRm0YGQ+qrvUZrhMwHGJtpTwZxRnhzOT0PmnaD2vzitKHcWXVxa66mKgEVWkg26W+x1p9z1NS8oQqreGD/3q8CmJlf5yeGscHjaGML/+gBfy7ID9yv0862/gu+E5Qmzi3W/FSk2EJY/Kz1zkwRPZpyGRPzbO5s0Yp/6yOu3/SgvDR0/pXBbOuA7OqTs3ZLCRx+Y5D8YEPx/kRvOP9YCDxhfeMUr1BsHVITY9qA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 10:25:29.5476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb307f5-d3fd-48fd-b95f-08dee8a4b839
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8106
X-Proofpoint-ORIG-GUID: cn8wm_MDcTbW0Dxm95We46S2tGJ05ULT
X-Authority-Analysis: v=2.4 cv=LPRWhpW9 c=1 sm=1 tr=0 ts=6a61ec1c cx=c_pps
 a=PJn3dW4q50A9PoMJtOr6Ng==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=FLfJYUKuRQtBdiMmcTAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwMiBTYWx0ZWRfX5ldKAYnIRyfd
 rmTYqk6F1t87y8RpEWMSZCmWjTaoXT/OzB+BTu6OWGy48j6VsjqrZnnTcVKVnxQ1ImDHE3hL0zE
 RNiIo3TsGOxTrnCui/3SIDsGCMGzECfuDnO4Uo1QT/DRc2NcYRJMfXfyckJZFOomhoBSOSE5Plo
 gD8BtEdeVP7NB+R7efxsqwKBKaIA/iDtFQODqDqL6X6pjPdb5wcQNez7kytMQw8xgTKTrWFu/x1
 FK53jUnAyIEuOYDDDqwft+0XHAYmNwtDzLQfX6LIUdIOfUPk0l7kV7Bb4l/5MOThgKdq9xTfT9G
 i3vdhpHc5vmFKP52DwPHq/o6m7qP7hez0zeOSn9xHLntppuh1hPfycZR7X/KW+IU6GArlbPQB5r
 bHXaS2DG++5Msh2dbxmWo8hcfJ9/N6jLG/ULUu0pcI7vX7jntbw5h96M3TvSY4HVdJI/OgkXemZ
 L2x601cimwY2E6OaRaw==
X-Proofpoint-GUID: cn8wm_MDcTbW0Dxm95We46S2tGJ05ULT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwMiBTYWx0ZWRfX748HqhoG0Ntv
 JlYZl4OBDr84wormByWHfx2402I0OIuDxn6bvkFk4v3NftgUfLYJ3Z3g67bXTZItDdRWG0Z5SVd
 BTBq7zQFLHF2iEz0FHd/RMNgvdPA1k4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_032538_118387_11F12A3F 
X-CRM114-Status: GOOD (  10.67  )
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

From: Devarsh Thakkar <devarsht@ti.com>

Add DSS, DSI and DPHY nodes to add base display support on AM62L[1].
AM62L shares a single video port for DPI and DSI output.

[1]: https://www.ti.com/product/AM62L

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi | 60 +++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
index 80615ca1e01a..a3199a2455c3 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
@@ -544,6 +544,66 @@ elm0: ecc@25010000 {
 		status = "disabled";
 	};
 
+	dphy_tx0: phy@301c0000 {
+		compatible = "ti,j721e-dphy";
+		reg = <0x00 0x301c0000 0x00 0x1000>;
+		clocks = <&scmi_clk 348>, <&scmi_clk 343>;
+		clock-names = "psm", "pll_ref";
+		#phy-cells = <0>;
+		power-domains = <&scmi_pds 86>;
+		assigned-clocks = <&scmi_clk 343>;
+		assigned-clock-parents = <&scmi_clk 341>;
+		assigned-clock-rates = <25000000>;
+		status = "disabled";
+	};
+
+	dss: dss@30200000 {
+		compatible = "ti,am62l-dss";
+		reg = <0x00 0x30200000 0x00 0x1000>, /* common */
+		      <0x00 0x30202000 0x00 0x1000>, /* vidl1 */
+		      <0x00 0x30207000 0x00 0x1000>, /* ovr1 */
+		      <0x00 0x3020a000 0x00 0x1000>, /* vp1 */
+		      <0x00 0x30201000 0x00 0x1000>; /* common1 */
+		reg-names = "common", "vidl1", "ovr1", "vp1", "common1";
+		power-domains = <&scmi_pds 39>;
+		clocks = <&scmi_clk 162>,
+			 <&scmi_clk 161>;
+		clock-names = "fck", "vp1";
+		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+		status = "disabled";
+
+		dss_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	dsi0: dsi@30500000 {
+		compatible = "ti,j721e-dsi";
+		reg = <0x00 0x30500000 0x00 0x100000>,
+		      <0x00 0x30270000 0x00 0x100>;
+		clocks = <&scmi_clk 155>, <&scmi_clk 158>;
+		clock-names = "dsi_p_clk", "dsi_sys_clk";
+		power-domains = <&scmi_pds 38>;
+		interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&dphy_tx0>;
+		phy-names = "dphy";
+		status = "disabled";
+
+		dsi0_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+			};
+
+			port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	gpmc0: memory-controller@3b000000 {
 		compatible = "ti,am64-gpmc";
 		power-domains = <&scmi_pds 37>;

