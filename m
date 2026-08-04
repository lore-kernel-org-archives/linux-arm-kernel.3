Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEB2C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 05:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TrVxu2qOE8/zk207d2vC1cuKGjf4cBJGnXEC2Mpu6iQ=; b=q+SMlQdrsS5hasOqIC31Zww+Ze
	Ph6qvGwgrFAvrF966gkz8uBL67xZ/tytJJLQW22tMk+YdAv8GaGxEmhfEAtMb/H+C5x+XayjQrqb4
	Wvhp8e+l/EklZfRxxVQ0s6GAfjATNj7wPles1mZgNq+AR4QCuCqvJO44p4XSnAM+Pv/mlBxXkA+Gu
	ZmIBXtaWYJVeYAjaJmjhaBNT6jBIKJCHqaTatksqq+0q4zR8G/8DL1KxbSdZ+HoN3fq9lUcNtI63Q
	hwkKcjOYZQeqO0GqhxEsKISOHECqj5x4i52vFKNzkupt4JnVk5OiouRC12rwZJQoOOiaZYvcGVoLW
	y+V1YL5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7Yh-000000012Hi-483g;
	Tue, 04 Aug 2026 05:19:23 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7Yf-000000012HB-2IvH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 05:19:23 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6742GnnA1214709;
	Tue, 4 Aug 2026 00:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=TrVxu2qOE8/zk207d2vC1cuKGjf4cBJGnXEC2Mpu6
	iQ=; b=gfakitXEwFZ48/tq2O3cihucWEESwG/JtAAjxY/RcCqVejmWaP3fHvm8K
	F9AltjnF6d7rFOUMO1bKQnOX95Qv8bww85OB9S6S9cWz243Tn9VMVERZ+SMqEmcG
	HUeCelfeXeNdUbCWi4vO+5dCt6j91ryii60wF7v3gblH7mNy1GegBbE7kt5Eci2P
	2nMmS1ZfEHzzA0l9sHD605TXycBnV4vC13pFVHB9PBP/g1hR3X22QsStbSoRG3gW
	N5lCdhpZWqeKKdXUlEpyXffsb21JL1yt/uUtaLpXK9t13E/SJEMidUEwJbpR0aqQ
	t9rCfSdtBRb8ClGS/aocrqeQIvDzQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010015.outbound.protection.outlook.com [52.101.85.15])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fu75hs25b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 00:19:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjvjoPuMncSjtRrd7mtBV74ZGyfarZ4gFKU7U6MbyGqQFaaOCVVLzWQBrYzyCCAaHafNxFeAOr6X+hHSG9NadrKltU0fFkvxb4qlTDl63J+3X2aJgXaezYBAWVkKKnU8GRMgBIRvm/CpH03X/W0gp4vo7mut0gXjoZUwFlck5nuOVslCwtWsqs6e+xJq4qrSSAc0Lc1MM+Gl0Dag4Dr6I5aUVjtuwpXfTp27xGjzmc78Allr/YjCdxxmLhQwYSDbJWlKdSc+FunKHqj6qU2N5dFzEpVB3H6TPpm9SQJru5CiBvmP4Ut+fECIoognVx+lsDTdE76jK5LIz9lTDT3+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrVxu2qOE8/zk207d2vC1cuKGjf4cBJGnXEC2Mpu6iQ=;
 b=utTMsHrgks/mT+yg0tZ4CPVU9ODnaCimQkK3GuWKczvFVEQxe2lXYwttf9Omch8tUrcPerdN+zBVEsL4BIQFrX9qnoulO+gtjdn+Pk/2XzTJERd9eBZaaxGA0jEXUivTPalkOGpRFCH6wZGEru9EY6b/2ZpOjhnBAO8G4m8wicVGrJScI2GnpzY3pQ1kTaiXxL0KehSC5GtNVn3N3N6B/josJ4SnJBkvBe7MnGWDICJNLQN13xfocb+NRaEjk+GkfKDDSFmuD+KuXGpXrORXr1oaNvrhOqvYZ+lu/MQpbIC+XLUbLY4mi9J3Xi22RrmprUVgL2+dBNps66f+cwas8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrVxu2qOE8/zk207d2vC1cuKGjf4cBJGnXEC2Mpu6iQ=;
 b=rfdxw01hSDYzvVLqI1wjj1+RyKxGG8htLeFBKpIZnYKyjSfPkju5s0uiENPm3osJ2ME38NvbAmilJ7K7N5jJzCcndzDQVGH4TMRRUf5Jn54y8qOJwkwOAnwKKMEaCD0hD7IG0BD02K6IJvIcHggUnHrgJ6J20HGNV9r+0QAg/Bk=
Received: from DM6PR06CA0093.namprd06.prod.outlook.com (2603:10b6:5:336::26)
 by PH7PR10MB7783.namprd10.prod.outlook.com (2603:10b6:510:2ff::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Tue, 4 Aug
 2026 05:19:11 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:5:336:cafe::1e) by DM6PR06CA0093.outlook.office365.com
 (2603:10b6:5:336::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Tue, 4
 Aug 2026 05:19:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 05:19:07 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 00:19:06 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 00:19:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 4 Aug 2026 00:19:06 -0500
Received: from [172.24.231.164] (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.231.164])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6745J1VN3068354;
	Tue, 4 Aug 2026 00:19:02 -0500
Message-ID: <0982bc98-233a-4ef3-86c0-63919b925a14@ti.com>
Date: Tue, 4 Aug 2026 10:49:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62a7-sk: Add bootph-all property
 for ethernet boot
To: Vignesh Raghavendra <vigneshr@ti.com>
CC: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Nishanth Menon <nm@ti.com>, <afd@ti.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20260716064449.2505650-1-c-vankar@ti.com>
 <178582009758.4187098.13677911190468773934.b4-review@b4>
Content-Language: en-US
From: Chintan Vankar <c-vankar@ti.com>
In-Reply-To: <178582009758.4187098.13677911190468773934.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|PH7PR10MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: d5898b4d-a481-43aa-985a-08def1e7e87a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|56012099006|10067099003|4143699003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: oy5SGO4tzY5ggP1sKu9doEqIvAjAuIt6bDHmYU5DseAxV+O8lfdmJ3tM0ZME1qd21I42lyGEcSFG9SG9ERnK0+3V3ZQJoISpEhzT4nU4dv2mhM7r4PF6lNKqBNcWPWzsWlok4BM0GObDZpzvNATO1YgXfpwA9+nIvZ2IY+yHBFcF50+oDCL9iH7cuxTSJqjekV/94yQ/ayOsOzjRO7PwM6AHc3vVLCAYya94lyPuoeECUw6FPU8rJRHpH/Vb5BiV+BUYWyvpbJho7GqS15f8GCn0fvXvARAnMnaxS/5Wnn5lkhbteRN9FBGCzFQQaLxNhnhVw+zch0cc2TxyX8KwQVlm9RSs9kgczhBpH+c7m/KC/U8EE5gF3AyliligxNvnnP7swWPWeYxI65uSPkiAR3Hk54qbKxUultaJW6SNQuXGiZ9KQWVtt/EyQYiNZJz/0rkvMSIHKxSWGCZqcr/r3SYsJBKFAiJjlQdcH8hdRe3WrlH62Q3Sezbc92eGuhWhRE8h229JhgcUQ1Bw4HwUvh+xM2itwu2diNG2v5aH/4mtzcBgO7CKCKEMTmGIq3Iq9ojFUigrP1FyqXnMjM/XtY6nz0hlh+Pddw4SmSPDvbEzCnF12nZ9qPn/4zzxfSc/4ZNUg2KUARnXXRzlqyXVXw==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VsGk1NvT66yNGAGH3IqPwDQlT3ak4nv2p4k+5rXO3R7kpWBF8bzIC49JdYTo9DK8gUqsg8n2gbVN6YrYL0Jk63mWI/ObzMzl9h+L6U5fdXtS5RU5PO/+Vo4SVp4k7DAKAaqOdjlag6JXgjqsShjQ+9u8qxQyX1UqwhC0T/M3oUBKMkQRO1GB74jAmLV29hfBcx/kcw7ql//I9rN62b8hhqbErf48aNr+ZMjiy+ILXbKuyNYdiLjjPRv7FQNKUi1LDMDyn3bvoJTUpfk/T1l7ZWN7Giw5aBj0kVozDkFT7oLBDjm6gM8HYazUh3qANAKMgHVTZf9vIncvd5Y78GeS9zva6gERbz87NqxWaPkI9iYgcaDhWGsnYxdRgGyR03YCrFxTUJ81h+P4jt6gAyORftdxDonfTkmOnWBvdeofRkKBZrMFRL8BypVMS66jW2vh
X-Exchange-RoutingPolicyChecked: oEPAgEmytKafvGC+CV0hbRuEzbnLr5dppqx0UXVvCJOsKRSUD3lB637S5DBM/hfaCH/9zZnl/ipkbJwNqGq5xya/Q8t+EdsQ2hW+QNPF4TkjApwPSKznlZldF6MdH7UH3MXmeESpXsNuXbVAno9n73fquP0op0SMa4Yg5eQq6zquS6mzES+hw+kKlhjrQbahHcR5gJpvRdvq9uPxJlurMXiH5nP75etI5kbdGYQzGw/xpPUHLXf60prEyQ9Gqrxmb/ABQpnXJKQ2C2BVl3SrdfTDqtl7fvDiRMfCgpU+hwqpeOJDiTmu+F2f1ap7y+r6jTSuQ1wrKtV1jBk1TGGL9A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 05:19:07.2240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5898b4d-a481-43aa-985a-08def1e7e87a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7783
X-Proofpoint-GUID: OQoTefn1qWekeLwpZkzTXhdSKqt6OS0H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDAzOSBTYWx0ZWRfX0ugKEVFyhchH
 mo/9DI9HTzpWlYrLYo9nz2zA2b4oTeSB5RizVBWgpeIay16AQSMpyIbyukBLFkoGPMQ5A3Bartb
 UQVZjp/VbsPbGEAl2mVHE72bzyOYutDig5jzWdTn4fQcfIwK9we9xATQ4UlMph01MzhBJMR3aNy
 SoZuhNNKNk+US+6uJuMd5+iDwWIi+yRlgHPCiQsifjlF1r2tiC1ALHK680OQMLLmffoYZNfaIdC
 SyQsdi/sJ+SObdehXmIg/hjcDC8HcypMzZhsxcwDLWyAdJEO9lkVe1hdEY1bKv1KPHqRH2FA78Z
 Eh15Wk4TSSy1gutg0+UAsAKskBiEuEazHt15j5+lgHVmFPeAQQJI+5IeFWFSvaRbRPZBmA95KJw
 nUNoMS3nfAnmt25I9lEb4MhQ0D3D4GapNKwKvMKkDomoBuzUHnIp51AnIeOK9J2W4olKseq8WFf
 R95ueissN3+ujD8FSGg==
X-Proofpoint-ORIG-GUID: OQoTefn1qWekeLwpZkzTXhdSKqt6OS0H
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDAzOSBTYWx0ZWRfXysfFYOHg5T0N
 QryCWLJTbGCGyHnYFfaZXdYpGWxREz5BIg4cqt65c9jYGT8N5+G7u4CLAk7D8E2CCHPhTVIVLax
 BFaKlpe9QgsVMbBZqTxnynvC8PpOUx0=
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a717655 cx=c_pps
 a=7JMGdgN8pDCDbqlksaqmUg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=P-IC7800AAAA:8 a=sozttTNsAAAA:8
 a=sZ0pxheXnf-8KqBq1o8A:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_221921_716758_6DC21631 
X-CRM114-Status: GOOD (  12.01  )
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

Hello Vignesh,

On 04/08/26 10:38, Vignesh Raghavendra wrote:
>> Ethernet boot requires CPSW and PKTDMA nodes to be present starting
>> from R5 SPL stage. Add "bootph-all" property in CPSW MAC's eFuse node
>> "cpsw_mac_syscon" and "main_pktdma" to enable these nodes during SPL
>> stage along with later boot stages so that CPSW port will get static
>> MAC address and DMA transfers are functional during ethernet boot.
>>
>> Signed-off-by: Chintan Vankar <c-vankar@ti.com>
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> index 821a9705bb7d..59cf49a14f61 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> @@ -230,6 +230,10 @@ AM62AX_MCU_IOPAD(0x0030, PIN_OUTPUT, 0) /* (C8) WKUP_UART0_RTSn */
>>   	};
>>   };
>>   
>> +&cpsw_mac_syscon {
>> +	bootph-all;
>> +};
>> +
>>   /* WKUP UART0 is used for DM firmware logs */
>>   &wkup_uart0 {
>>   	pinctrl-names = "default";
>> @@ -241,6 +245,10 @@ &wkup_uart0 {
>>   	status = "reserved";
>>   };
>>   
>> +&main_pktdma {
>> +	bootph-all;
>> +};
>> +
> 
> I ended up applying v1 as bootph-all for main_pktdma is already present
> in the k3-am64-main.dtsi making the above redundant.
> 

You mean k3-am62a-main.dtsi?
https://elixir.bootlin.com/linux/v7.2-rc5/source/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi#L153

Regards,
Chintan.

