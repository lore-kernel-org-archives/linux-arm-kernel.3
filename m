Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CD3D1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxCMouV5fr9nzS922twZQy8HKbRQa694u01+LyKAIr4=; b=Z6/oUFFGGgbkxck/oVEc3BKoyO
	wURNZ3CFvrsGY3C7tyEbJ8Ic06hwXgFQGa+ZgHwAF6zn0Zmd9CdZXjRO+9NpvtCdzSuyFwbjAM6Ht
	dTL7ig2CBNiefYXs6BqxI60FvvNDPVaEuBqF+O+HrH7sGxSIO6PjJuI8gWnJ20/hrWbmrdvuW2gcq
	7f0lpg1emPRgMupl2Mwg6U2NpqOPXKVk/AymbsdOnR6vDVOcDXNTaBGXJ8gPUgjiRCn0nHRtJRYCd
	LHzjS4TOvdenkgWiwF2qE91mZF7fLRNvCy4LBIn+3tK84BWpV6f3aXiD0aYWYaXVSQZHSb7G45yvJ
	K7cZ8FQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtFK-00000000DJl-24eq;
	Thu, 08 Jan 2026 16:52:26 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtFH-00000000DIu-0TpF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:52:24 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608GlCj71810031;
	Thu, 8 Jan 2026 17:52:12 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013046.outbound.protection.outlook.com [52.101.83.46])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bhcy8yu7t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 17:52:11 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jc2vNklUTf5C+T+RH1RRacD/4lxfMFl0KBN0habv1bssP7HxAptqQ8UzLLoFdbCgdJFRo+nJQ2gKiu6EEs5zDEXBV+3CCi5Cjv6+KvmZ0qdOQsKOK1SwtGa9h3uwj9XuOrOWfPRtsUlG+Nw6IsFOkg5oPtZ3ox0pZ9OJV6rre/VGTYinWd97Z9oDgsik/t0Wu7jpLidHU9THVvUw4Eu6jXc0AG96k7L8QxqJMtzWwZ0S353VZLAZR/CR+BbpAren4tYVNUqYGDUCXCeKofcgawOusJbuGTHU4607VcIzO8Rpp1v6K5lHV6OsxabothqfMrYgLW2HFWag5PHz9QZKXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxCMouV5fr9nzS922twZQy8HKbRQa694u01+LyKAIr4=;
 b=vuo3n7gKI4cLBxA7uOEmoD9GwwzHV308QWzbGkPiCwe/5EKR/401Iaqr/sHOX/8pEFUOWAUMoCWoOt59ncK/Yny4khQDrFZx7VbL9YOnMBha7zVpo3iIPAknTczV6s2K6+mUdNItXoIFSc/XKfMJnrvEK8kTj47NYyUAFrDfr8IQNxu65KFOzmLoPJYjEKiP97m82CD3GaCyORZJZ5ylDUkUKxAIUsfYGG92XTT615mrrvatCK4U0mBS/gkjDhuXvDTqMaGfG0Djk1LFIkvNx2vDnq2FuTjnNnmquNAVnPXjcssGkeZ3BQRBAgLWhKNchNlC5FlIMZ6IqymPF/4GxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxCMouV5fr9nzS922twZQy8HKbRQa694u01+LyKAIr4=;
 b=fc0sIVavpnxG5RHnjPEjyPgBFF7javOOnPZbozJBr4vkWPhNfeESFIQqJyOxd8i2W4nsAuM/eHRnLI1ENhNU4LAaZ4fdVDJtwoCzCHos45h2R+iWxckP7QiUeYEGK7nyTsRcwCfvRk5XsZbnMl7wD9spkJKPNssZ3eHhRl1MH4oZW2G4tNYK4eYczH5TqhMYdEGhbbwXxPL3hFIJXeRXw5+gcAOuviBFTduruezN2a7GubdX+QBYSDaiz+hLdOmT2q2a4ekqG2IPOYy9rYDilqCiCJupavEmcQT6fOdMJuF/dFe3v8PUobsjkDjW3LwHQB30/gVJdTxCOCYb12uHKA==
Received: from AS4P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::9)
 by AS5PR10MB8122.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:654::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 16:52:09 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::2c) by AS4P191CA0011.outlook.office365.com
 (2603:10a6:20b:5d5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 16:52:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 16:52:09 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 17:53:25 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 17:52:08 +0100
Message-ID: <e969f825-800e-478e-b82b-7fa7da5be881@foss.st.com>
Date: Thu, 8 Jan 2026 17:52:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/7] Add DDR4 memory-controller bindings and factorise
 LPDDR and DDR bindings
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
        "Krzysztof Kozlowski" <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Julius Werner <jwerner@chromium.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004D:EE_|AS5PR10MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b499a86-c063-427e-f486-08de4ed64359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjlUTmV3MWN1SmJNL2dIQlpETUJFRGNCQjFjbWNrNUc4MGc1Nm1yVVo3Q2ZX?=
 =?utf-8?B?cHNHNFdORkVvQ0NzT2c0UFh5dVROY1Jzdkd5TFVMNWFZUVQ2bHlDeDRaa2Fa?=
 =?utf-8?B?Zzd4cVNQSy9xN0tjYUV4NmF0bnFyRDJ1V2V4aWl5OVk0aHhNV2IwcjRkbzlm?=
 =?utf-8?B?RDNna1E5ZkRudmxFU01wZmhHRzBoTkI1OEcxTnJ2NjV6SzZFZ1lvVlFDd2cv?=
 =?utf-8?B?ajN3Ryt6d1ZnQTJlaDFMdTNCQnova3JkZ280Vm5Yb3ZlYTRuQi82RnJ6Z2c0?=
 =?utf-8?B?RVNVVnZSdXRCbFowWXYrWlczNm5qdXRvT0Z5NW1YZkFQTW10TW5ReTBaZmJn?=
 =?utf-8?B?Y2Q0M284SkxZS1ozNUwzV0NJM1N2by8zRFpVZjZCYXQ0dmdJSGNQY0Q1L3Q0?=
 =?utf-8?B?NFNhQmVYWnoveEFCbWEvSEUyME5aTGh5Q09zSUpBMXJ5T0REaUQ2NmloNmxK?=
 =?utf-8?B?QjRpSHY3SUpocU1SWlNQdWdjQkcxeFBia3RobGx0cVZtS0pXUyt2ZTh1akMy?=
 =?utf-8?B?ZkthVm1hei9rTGkybm92YWxCU0RQVlF4U1l6SEFmOXczclpJYlhJRFBSclQw?=
 =?utf-8?B?eWhSSDNtaTdPQlhOejVnbkJScEczc2xhSElWWGtEbUg0V01TeVB6WkNPYWpz?=
 =?utf-8?B?S05oSGNzK1lQVmxwWWtoeVlDcGlzUjVmZWxhSUF4ZUdiWHJYMWM0Tlg0dWdD?=
 =?utf-8?B?UE4yVGVQQ0VNbjRGaTh0NGtGMkF5WmRQSUZGd1d0Q3VHQlFTa2JRSHd3TG9Z?=
 =?utf-8?B?QkQ4R3liQW9uVWhFK1VQb2MzZHlQNW5Hdy94WG1kb1lGbDBPK0U5UUVhVHhv?=
 =?utf-8?B?NWJNV09vU1p3TzhEdCsyR0E0TklOYWs1UGpQZCtOdzBjbmI3cUFZeE1acUg4?=
 =?utf-8?B?aFphbGFQaDcvY0ZZN3lNNTR6R1NyRnNnakR5UCttOGIzSkVzN0pqUmRpWVBk?=
 =?utf-8?B?eDdxcENFU0pqLytCbWZGaTQrWjJrTmV2bG51OTVncU9pc0RCbFI0VDhvQmtn?=
 =?utf-8?B?SXZxZm9Gb210ZWdiTXI2S2tGR0ZtQVRyVmpucU5SYUdrV2o4ejJ1d2xzWnQx?=
 =?utf-8?B?WEtQdWtPSXducm9Wd3V2RFVJa0lyYjV0ZjM5THY2OHlDc2xwTXNEOWpXeno1?=
 =?utf-8?B?YnRsWGlzNjkySmEydWRCM3cwRW9TVGU4VGRwRnZLdHBTZldOUERFV1ZkNlpV?=
 =?utf-8?B?Z0x6RDhYa0ZRalJsMm9icDZCMmNRckNVVGZNd1p4VU80cTBRZDdsN1kxYkk0?=
 =?utf-8?B?d29VN0xwZkdVckVleTlpQ3UrdTFpZW9WK1Q5VWdNUXlNVUtnSUtXRTFUY1U3?=
 =?utf-8?B?OVhPMEIzZlFzcXZpc0Q5bjRHanZJZnlEWlAyVkxFTWRFMm9pUmt1NERyQklM?=
 =?utf-8?B?cVdZWU9wZjYzVWJ1UDZicFRVaGxaM2dzckpoVFU1REk4KzJmU0NoRWtSV0ZJ?=
 =?utf-8?B?ZmlvTlpEVTZkdW95bzVNQ2hxbVJLZHM2d1lRVkNmU2RQYSsvdTF3cVFoTEJF?=
 =?utf-8?B?VHNoR3FWVi9KczR4VHZZUGw0L3g0aDc5UEl6ZStiQ2xhSDdER29jc1MvdlE3?=
 =?utf-8?B?S0VWVmdDajdZOVV3WDZlZWREV0FNcFRFazNlbTZVNWpqMEZrNDBINEVvL2ZS?=
 =?utf-8?B?eGhyVU9uS3Y3Yzk3ZWE4NGdmRVQ0QlFpejMzT1hNR3JhVkZLL3dZR0hGMzEz?=
 =?utf-8?B?YSt0YzZoM3NhOHY2RmtjTDkzVWllQWE0OWlWUlFLTjZtN2V1Y09YSGZGdEov?=
 =?utf-8?B?NkdQbG1tbEUrMlp5NTkvNjkvTkZFREtzV1FQSVRIcVhyOHlGVnQwWmtHemd6?=
 =?utf-8?B?TFJxUUtwa0xXMTdWajR6WUZZci9od3BVSlozOTlHQ2VIcE5FaWxRbnl3akZ2?=
 =?utf-8?B?RWRpQjFaUk1YNEtQNVB2UHd3N1o0NFc1S05saGhZSEhTbERQZ3RTdHI3VWZE?=
 =?utf-8?B?UkdybFRoVW83S09JeU5GYU9GTzVhNUo1bVMwYnc4V1A1Vm1qZ2xQeWp5cnZq?=
 =?utf-8?B?cVVVVytTaE5jRm1vN3pkd011S01RNG5TOUNtTmJ6OENDYit2U0w4WjFYS0tu?=
 =?utf-8?B?SHpUNVNwaHd6TExkOGRvby82T2VqQ0d1MEMxaXE3blJoNjdBUHZhSXE0eGJK?=
 =?utf-8?Q?l58zMvJWcX+pMQTv3/QrBCMcD?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 16:52:09.2267
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b499a86-c063-427e-f486-08de4ed64359
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR10MB8122
X-Authority-Analysis: v=2.4 cv=ePkeTXp1 c=1 sm=1 tr=0 ts=695fe0bb cx=c_pps
 a=XUW+b4G2ANNWtaUD5ifWjQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=TP8aPCUxYTYA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=I_6LyowMBXdOziAKmr0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: pKvaeJ3_jtB9HA7d6dqYdQHaripFrqFx
X-Proofpoint-ORIG-GUID: pKvaeJ3_jtB9HA7d6dqYdQHaripFrqFx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEyNCBTYWx0ZWRfX4Qx+cpKwAeZ5
 eQKdYTvihjZgl+8lxCJvOjGToQTMdxA8MpoVZy5VpeNlSwySBbgujGw51CEUqDug/SAEfaiQ9pS
 X49JDO5HnBBc7Z/a3r7p0F7iB7xG3caKNnqNqEEoLZCw9tQdjfHZoVyVkloNzSzBiGsgkFdOANj
 OsQoaOy0HYGRQmGASFEMNvHC0VC70vXwJE1zM9ja4ZrrYoLxYJs4ZulyKoqrdNUo/siTFwBybOl
 hi7HFRX2Xawp7pkxEl9o40SU+AD7AJeWaUwUFF1CONhbLjjLUKwEvPrvlEeKbfRKnFDWNMxCiYe
 +1NhijWE2gm/Xu3fNVLEmRPIRuf70htTjvdnhdM9cmSzK0wp0at9Ct5EttzwURXQugueerTHSpH
 jthg0UvJDzS1TYiKpHEMuUdc6W/OYmx6FdFM7jvD/kQd3ELL+af3zSTaVsGAma0bp5rLkDoqz4E
 sq2zT0eYncgYD4Ju/NQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1011
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_085223_556437_CE17D034 
X-CRM114-Status: GOOD (  14.34  )
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

Hi Clément

On 11/18/25 16:07, Clément Le Goffic wrote:
> Introduce DDR4 bindings, which is the first DDR type to be added.
> As the DDR and LPDDR use the same properties, factorise them in a
> sdram-props bindings file and rename lpddr-channel into sdram-channel.
> 
> Changes in v9:
> - In the ddr4 compatible pattern :
>      s/ddrX-YYYY,AAAA...,ZZ/ddrX-YYYY,AAAA...-ZZ/
>      The comma before the "ZZ" part has been replaced with a minus.
> - Add information about how the compatible is constructed in the patch 2:
>    "dt-bindings: memory: introduce DDR4"
> - Add Krzysztof Kozlowski's trailer on patch 1
> - Link to v8: https://lore.kernel.org/r/20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com
> 
> Changes in v8:
> - Globally fix typo/grammar in SDRAM props bindings:
>    - DDR4 bindings compatible description:
>      - s/lpddrX,YY,ZZZZ/lpddrX-YY,ZZZZ/
>      - s/in lower case/lowercase/
>      - s/statis/static/
>      - s/~/-/
>    - Add an "s" where a plural form is used (e.g. registers) in the DDR4
>      binding revision-id description
> - Fix the number of chars that an SPD can contain in the part number
>    field.
> - Link to v7: https://lore.kernel.org/r/20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com
> 
> The v7 is a subset of the v6 and other prior versions, split to simplify
> the review and merging process.
> 
> Changes in v7:
> - None
> - Link to v6: https://lore.kernel.org/all/20250909-b4-ddrperfm-upstream-v6-5-ce082cc801b5@gmail.com/
> 
> Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
> ---
> Clément Le Goffic (7):
>        dt-bindings: memory: factorise LPDDR props into SDRAM props
>        dt-bindings: memory: introduce DDR4
>        dt-bindings: memory: factorise LPDDR channel binding into SDRAM channel
>        dt-binding: memory: add DDR4 channel compatible
>        dt-bindings: memory: SDRAM channel: standardise node name
>        arm64: dts: st: add LPDDR channel to stm32mp257f-dk board
>        arm64: dts: st: add DDR channel to stm32mp257f-ev1 board
> 

DT patches [6]&[7] applied on stm32-next.

Regards
Alex

