Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B57ACD8C87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 15:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8yQXrkJ0i+Z8+ZkP3hxRefHuxJh/VQSECDB0Yte1l8=; b=vSXw28WKTeYXAWldsULgPTiY/L
	lCKLIc/NsMjqKLFIPFjSrYYPz7URK45hrcjVyawKjFL9uvA2jd/PZTA/hEj2FtAElFbXLsgqCVhX+
	bWsAYS6SKTY8iNg14Y+n+HoZKDgbA9oWRaGL1UUVNv3R2f8SQRT9qYxnniHeGRIT4UXvW9xjVOPnx
	C5eY8eaVMRwA44qqPggFamZbxJ0zuZQwoQUcNcgnSpd94vhbm/tKmqH/vHcUu7iQ4sX78Ht+9mKOz
	ZpsXMa2kJhZPUUbyPmyn47HB+b5d8Y921WtABOtUnkVq+0UwWGDHs3/XfgH41FDJu1gS1/ScPl5Ap
	CVG7FLNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZ1i-0000000AfLa-10Sd;
	Thu, 13 Nov 2025 15:14:22 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZ1c-0000000AfEX-3d50
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 15:14:18 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADFE6E8269746;
	Thu, 13 Nov 2025 16:14:06 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com (mail-westeuropeazon11010060.outbound.protection.outlook.com [52.101.69.60])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adc9s9g3p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Nov 2025 16:14:06 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVpXYmM8h8o6oEpWGCcAKmD1HH1KoB9n9op3j22z0eS1mIJwRXL1ukma5bbnnyBW1+1xk9hA/XeVhSdAGGfgzCiOjLWyr9ZseQkjXd1+uGTAilDjofJsdbBQ+rtbIrhLvjFZeY4KZPj1VDL9e0YOEGVHWBIX31CvvOu+j8PNP4CfJFF79Ry0g11xHj2tZfAikTHO3mLyeTeVJ3hiX6XjI8KGE9nX1KYyJGNv4NRHVtYwXNr+VqvSdZPKl0F9sTMgFmTRXqNqGRcStkH0oiYpQpr3f3mMohafkf/Q7TSflpwVfA05Fv0n2HvtlPkRzUdkBDTaqFsEqmUm/B2O4Vc5Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8yQXrkJ0i+Z8+ZkP3hxRefHuxJh/VQSECDB0Yte1l8=;
 b=cwqus4KSCQ0c4tgrzXkw61uYfdtVqjQE0DpeABudaHWrby0rDhc6Z4rDM01E8+tnyhrwDqIGSgoKc04M4kPx7TNdMkbES+QvVxVTPjLG/slcdtnf6aiH+G+egm4qxl8XjOV/t0eH21q9wNt6ctpW3F2k/Pl7trEfiiuD3YVt+t5FyqtYvtoAoaboP/dVQUnOWqEGJwXIj8tYwAseFGEHdSA0cIa8RTECJZ80ayiLsGD86p45U3UwIJ1i9aItC+1Hg+xDT2uCH4qbQY+xpF9SA37u1K3jJOkagOga6lCOHj/uPvqMBBPTEtyGZvlUFzwmwKDvLPo87qEFxp+8ISOisQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8yQXrkJ0i+Z8+ZkP3hxRefHuxJh/VQSECDB0Yte1l8=;
 b=UGR0x2Mp88QrNGPRqaF2DGQsviUCkOlK0I4FR4DoIFSDpDLDr0mG1gFdANJfnLbiozm/TweUHI0/os1weL6TiibCLPKGIRUnTxm9hHpSiuTvYG+atCKwz5gxaDMYn78uMsPb+idcTyV4Z7f2ZTnpQAWH2bUSSN7hE429hk/AXHi+gFutj/7y2BRyCIxhID8SFb+9yiHj/pXYxxWnoKYTPGuV79c2127f5h9kVWaXbTpcXfBClsFIMbSIjV8PaihaX5txYCuguLxPnLeKIUwBs0Y+vp9Xq8ZOsbjnRnzF4YTpkFqPs1FFJrZwVLzh3/xoApaGgWboA3OO/CcBeKPbjA==
Received: from DUZPR01CA0020.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::16) by AS1PR10MB5627.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:47a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 15:14:02 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::72) by DUZPR01CA0020.outlook.office365.com
 (2603:10a6:10:46b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 15:14:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 15:14:02 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 16:14:12 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 16:14:01 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 13 Nov 2025 16:14:00 +0100
Subject: [PATCH v2 09/16] ARM: dts: stm32: Add LED support for
 stm32h743i-eval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251113-upstream_update_led_nodes-v2-9-45090db9e2e5@foss.st.com>
References: <20251113-upstream_update_led_nodes-v2-0-45090db9e2e5@foss.st.com>
In-Reply-To: <20251113-upstream_update_led_nodes-v2-0-45090db9e2e5@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8A:EE_|AS1PR10MB5627:EE_
X-MS-Office365-Filtering-Correlation-Id: de26b9b3-f8ba-4177-392e-08de22c74778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzRDUloySHh4SHJ6TXFzVGJJKzlPUjZCaWlYYkFIM2JzSituWUVVeHh6cXhI?=
 =?utf-8?B?KzhIYkV6clM3ei83ZHZOWUM2UmMzYklUUllmZzdRMEZmcW84aGV2Yi9NVnhX?=
 =?utf-8?B?V1pUand6Sm9sUWlaZXdmZmJEYnFtZWZ0YlAwdW1HSzUzNHV6Snp1dVpCSlFO?=
 =?utf-8?B?K2lnUWJ0c0ZzZFpQeFcrTnJhQnZNQmVmUWpnUkgzdEVLZXdmdVlKTDViUEtw?=
 =?utf-8?B?WVBwb3Jlem1PZ2xwTEIrWnVMdnh0U1RqSmlDRXBOMjErYnRjYnZNQ1hWNUsr?=
 =?utf-8?B?TnQ2RVpWLzZSUGJKRVVhRy9nU3ZuTlZOSStRZFRsRitjN0NZWmlEYkRMb1FX?=
 =?utf-8?B?S1VheC9FY29uYW5sUXp5NGdoRytjRkczSTE0NGlWWjRNMndyUXhCOWZDSnNR?=
 =?utf-8?B?VUc4cjJCWGlBT1ZCWWlaamJjVmFkUisrWW15U3dWSHFveFk1dmpEZ29rblFw?=
 =?utf-8?B?dytlNml0enpEQStFNG50UVNWN2ZlZXhPMExHT20rck42QU5NUUZQaXpaS3FC?=
 =?utf-8?B?WTZTVG40TDVJa2pkS3c3SmNxV1VROEZ5SVQzZlE0NVlsUFFaa29MTXV2SnJB?=
 =?utf-8?B?TzBuZExsZFNpd3N2WENORG1oYldaN2R2SFZWU1E2VEhrVEZSQW9jbEFwSlRs?=
 =?utf-8?B?Y0RkU2oyTDNRU3N6WW94UnZpRTU3empkbmpENDNIOGMzL09pdkZhNE1YUFFy?=
 =?utf-8?B?S2hZby9VcUV5bHdic1pZZTdGSWpQK2laQzJOcCtHUmt1dUtYbE4xQUhKTTBE?=
 =?utf-8?B?aVR1K3ZWcjlrNzZxT2VCeVZYZEtnM3g5S0tKMTl1MlRnd1M5SnNEUm9BaXVG?=
 =?utf-8?B?YmpRVktYTTFxcVZBTWlEYm5uN3E0UGZmKzR0UGoyam14ZTl2TjUyRHN0QmdC?=
 =?utf-8?B?U1BZNFp2N1ViM043bnVQQ0tlZVlUb0daUGdVWHV1Z2laUFd4NVF6dXIvOVND?=
 =?utf-8?B?RTUza3liaittak5VVmxZTkdEZHk4V3huMGVJNmZUVFIxT0hGczdnRm5jQ1ZN?=
 =?utf-8?B?Y2pOZi9zRUZRUUxPYUhLWXB3K0VPOHRSYTBZaUd5VUJnZDBaUWg5MXJOUk04?=
 =?utf-8?B?Ym16dkZ0bDA3MVY1N1F3YmhCektGOFJEaThiSTFhNlhSc0U2T0Q4UVRRMThi?=
 =?utf-8?B?bFMxQ216YXA5em9qWXNMZnpyT1VQVTFTR0t5bzJVZFF0RVlpQkozaDZxQm5K?=
 =?utf-8?B?Um9qQkQzbEZIY1AvWDJzYlUyaG1wNzNkMUZUSU9qcGpTUXBjV0lITmlDNGpj?=
 =?utf-8?B?ZkpRNjQzTVAzczgxV1BuakZkdFJsU3k0TzVzc3NqMktaTFpFSnpvM25PdmZ4?=
 =?utf-8?B?KzI1cG0xYXcveXQrQlZYNUozbjJrak1HZm5ISXpkUDc5RFZnK2dEVzhjUDRR?=
 =?utf-8?B?YWNyb005U3Mwc2hVejhiVHBjMi83K2NqUTNvdGx6QTJLZEVyTmNnOFBqbW4v?=
 =?utf-8?B?dGVWYUswb0FrQm8xSTVkM29KbEJwbmpRNm1FU3djaS8xRDJKa2U2eEt3Ulds?=
 =?utf-8?B?bDRyd0NmbURVRmZ4RkdZUGxQWmJ0RmxoU0swQnpJbms3TWlXV0d0LzlWU3lZ?=
 =?utf-8?B?VlBEWng1ZnM2elg5Q3pZdHhNUnFpTy9rMlhyRDRSSlN3Rmo5Yjh0TkFDSCt4?=
 =?utf-8?B?ZTVqOEplU0FySEdNbkk3azBOb3lPbm1wNVhNLzIwYm5OR1Vvd2NJZ0I0K2ZR?=
 =?utf-8?B?bDRGS0ptdFZCRzZKbnpUbjhvaHFRVGdPU3JZV3ZyTlpEcXhEa21GeW5xWmVC?=
 =?utf-8?B?SEdnYkMvYnk5L0NtOUVYT0FqOWhuV0p4a2V1TG5jZEgwdU04dStPVFJ4WGx4?=
 =?utf-8?B?TDVVMzRKNitnM25kYnNlSUg2c1lyRy80cnNaSVZlWUtidDVuUWlwZDZJV1hY?=
 =?utf-8?B?TW0vU2lsVC85QklraWcwNU5Yc0k0Vm5ycURTa3lEaE0rUlJJOVRuSWZ2UWRH?=
 =?utf-8?B?cTZ6emcrMXFYUUhTUTVQMm9DTVZva1Juc2JEYTJKZmRMSGV3NDJCdjdvYW9W?=
 =?utf-8?B?MkQyODUxUFBoZ0ZGWTRpcmJoWThWbVFKTlhhOXFOZTlObmdRRVZVSWF1UnFh?=
 =?utf-8?B?c1NxRThkQmxkTDVjcDJVaWg1L0k0WVhMa3NmODNYYWdZT25rZEQyNXhrUklz?=
 =?utf-8?Q?P/Ig=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 15:14:02.4964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de26b9b3-f8ba-4177-392e-08de22c74778
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5627
X-Proofpoint-GUID: p5Uk7ILvB2rQiolE2w78bMDgvbhzO-Fa
X-Authority-Analysis: v=2.4 cv=M/FA6iws c=1 sm=1 tr=0 ts=6915f5be cx=c_pps
 a=CMSZtrJrl32HS2KLlWJ9cg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=DTfS_Qm12qqBGa833i8A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDExNyBTYWx0ZWRfXxkSOOXoHru0X
 5SyQ3T6m5Jhh3TYHWYCxpD/HyuKWsVFEYWk4s7E975nKG8nxXwKSCjtW8gkYz/6WgyqmrsUfIds
 /OZ+paYbZVqlV9tMJUqdzn8npLZxSNBTCrwNbzALIB23f3ib8uWhw0gttYVxQBaemtBMBqgu7JZ
 ER/z+d0+40ho83e+vrR5+8dxfEJKc6Zq8x5cb/XlpuCzXRkziv9jbusc5XD4JiHp1ZVqmgD1OvQ
 kFuTbTgHWMp/8s4abpn6gHImwAf1SxCtsA6RXKX0dRq7XQKXPQBXseXE5Fh4Ij+RTGmow0+I+l/
 s01r/WESRkTmOzZrzoUxhxYo7aRP8eeaHehJd6hbzsKSnX+HZcdbI50K6/5f5WpsoAWHVFhJ9ES
 hI+bcImMzp+0Z+vLA2q766kSewQs/Q==
X-Proofpoint-ORIG-GUID: p5Uk7ILvB2rQiolE2w78bMDgvbhzO-Fa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_071417_177207_11065785 
X-CRM114-Status: UNSURE (   9.69  )
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

Add green and red LEDs support for stm32h743-eval.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32h743i-eval.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h743i-eval.dts b/arch/arm/boot/dts/st/stm32h743i-eval.dts
index 4b0ced27b80e..4b3e0c5a9009 100644
--- a/arch/arm/boot/dts/st/stm32h743i-eval.dts
+++ b/arch/arm/boot/dts/st/stm32h743i-eval.dts
@@ -43,6 +43,8 @@
 /dts-v1/;
 #include "stm32h743.dtsi"
 #include "stm32h7-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "STMicroelectronics STM32H743i-EVAL board";
@@ -62,6 +64,22 @@ aliases {
 		serial0 = &usart1;
 	};
 
+	led {
+		compatible = "gpio-leds";
+		led-green {
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpiof 10 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+			default-state = "off";
+		};
+
+		led-red {
+			color = <LED_COLOR_ID_RED>;
+			gpios = <&gpioa 4 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	vdda: regulator-vdda {
 		compatible = "regulator-fixed";
 		regulator-name = "vdda";

-- 
2.43.0


