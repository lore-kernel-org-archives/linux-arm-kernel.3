Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B564BD1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzBpdQ1vjhMdXkGrqkO1TrGioyPNu80GkpQ30vUOvzU=; b=cjpmCqM9pC2+hcMU1kyiK6PF92
	YM7c2YQZ5IiHTvAptAFvFNfQsRpiNqcKbO4AFMF6C3XtJ5QMNq5uJy/5pXWCI4xOxB69tsP6ekBOw
	U0e+rSl2M11v/xUKDulJ+RyAdAdIw31SV0c/Cc0FnU71pPUkZndV5Ygh+h3tSFm7PRXde0BgQHVd0
	aCYkH4FUw9L4DJWwK9ieTyvSMeHyxwlrTlHDX5P1Int2nrlrUqmEzQn6ikGBVBteDAKA+BWHZV3Nx
	G/OAYAEDDXvUuTWd2bc7V/Op5hI8dsT5HBhHHq+G4hByzf0yy/IaptnBrCkBOp5jLD85OStWTTQT0
	lbaOxmuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtSw-00000000IP6-0p4p;
	Thu, 08 Jan 2026 17:06:30 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtSu-00000000INk-06tH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:06:29 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608GlCkh1810031;
	Thu, 8 Jan 2026 18:06:21 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011028.outbound.protection.outlook.com [52.101.65.28])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bhcy8yvq8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 18:06:20 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzZMaA6I9mFNiE0Q5oEElZso9yCwDmOv/99hf1Mui+L84ow1n/JcxoT/PFEwRab5hEWIHHMralTYLUTcrFf5BFA55kMR2nktlIwcYL5QavhLGsxdZ1sNCQEQr0Lxf9k6EuxK5kRplW+AeTWeVJxC/yfdscqUBsTiZgHzSiD5V6WL3dvJCpg3bw9HganSGZKOkWSOJ6jZpIAyULUGtEcikVYplcUV2ohKVgFrON1eOPwYM9Z6eHbXq9DgtQJ4koXos5gpWtF5A4Hg2OkIvZqq2iSZnG57e0Q2t488sBlXMTz2srIALRfh4OT8M5ObP8XRAVgS0dx91AJwKD2ZZ8mprA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzBpdQ1vjhMdXkGrqkO1TrGioyPNu80GkpQ30vUOvzU=;
 b=DOLcYK0uc9wdC+67xNnxGvXtxkO/ls2/e66LQBguUqotpXnAog2UI3+FvCmuBIannrRqyGC8gn9uQbae35Or5iysWWGn4DDhr/WKJUWQ6BHESdbeqMmZ4mbXvfSfyH7rnOJxRArTFY6/hOZTPWfJIhi6rTF/ajvjAmhn+zdxdMDOjjRVmf7TfeAzQZoUymatob4pJtTGPXluc09yQzdzNzW12MddWtzul3sWXd7ShWnGGm3d6Z+VVM5IAgV/F56olI4+Ms/0M2Tr4z1FKDUOaVLsvV6moSTRaF/RWEP9O6TdeT/flYgvoRnH7UEygRqHok7vUSLnjvaGEIDIVecc6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzBpdQ1vjhMdXkGrqkO1TrGioyPNu80GkpQ30vUOvzU=;
 b=a1NAS+P1Cqf3Ijxx94vcgVe1e1V3ZhLL2ASyl5oA0uVVO85s/74fA6+IEVRltbuaMyh6CnizUpncOiJhvx7+aJj/NbqZ0l4y8WF/KHNelC4o2lcjs4XwbliW2xxk7Ez7Tk6/BtGCMLebHZEJuX98RcncEt1K5fCLFAPqqlv+VlA7RfKa0AFrwsgHaDuN8s/4mYTtpc70O7egQJlTt6L0Xb1JsciIIoF1ByZbP+3UTawbGHb8appXYs2o66u1824bFlN1mCdlDfwZffiupewSxdAKQnDNJJU24t2QqDQmjss0+aMueD8NyZigJgIe34m6HlQEhafL8r1PT5tSNNvs0w==
Received: from AS9PR05CA0054.eurprd05.prod.outlook.com (2603:10a6:20b:489::13)
 by GV1PR10MB5866.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:55::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 17:06:17 +0000
Received: from AM2PEPF0001C70C.eurprd05.prod.outlook.com
 (2603:10a6:20b:489:cafe::f9) by AS9PR05CA0054.outlook.office365.com
 (2603:10a6:20b:489::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 17:06:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM2PEPF0001C70C.mail.protection.outlook.com (10.167.16.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 17:06:16 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 18:07:32 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 18:06:15 +0100
Message-ID: <093c0166-e740-4f7a-9b4a-0de018610494@foss.st.com>
Date: Thu, 8 Jan 2026 18:06:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: st: Minor whitespace cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20251223152544.155637-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20251223152544.155637-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20251223152544.155637-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70C:EE_|GV1PR10MB5866:EE_
X-MS-Office365-Filtering-Correlation-Id: 960d1c13-7016-4fd0-dccd-08de4ed83c80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzAwQ0k0QWtSL0ZrejV3OTY1S1grSFUzeEhyaHdpVXFLcVA2cUZQQTVqOGJx?=
 =?utf-8?B?RS9Bblhac3drZXVqZnhjQW44T21zcUllMk9HOTcvU3loV2k2bHQwc09jdWEv?=
 =?utf-8?B?dEFiOXBjWGtCaTdneGtxdnRlSHNpWVJod1ZZaGt1L0xyMisxQ0lLcE5jaXpO?=
 =?utf-8?B?VFptcDgxVzZBLytsZnFsLzlwbXZpZU1LbWdEemREWTM5Z2dHZXVLMHdwaGQ0?=
 =?utf-8?B?S3JyK3Z5dzFFOExodnA1d1dLcmhEcjg0MzZxMlJHNlV3VklyYmNHVi94b3M5?=
 =?utf-8?B?M0QrWjkyampleDZkSHc5SG5WbGo1SFg0MEdXY08yZzZCSlRnaXpWTk9ENmRk?=
 =?utf-8?B?MU53UWZ5RDNFd3ZEZ09ZOVJvMlRvbm1zTFQxWnNoclN4MjVHZkJSaS9JaU5J?=
 =?utf-8?B?ME1CanFaOVQzbnRjYzRCTUNRa3ZBdVo1a3hxOTRsdmpDL1BZUElMVzRaSzJR?=
 =?utf-8?B?dERKUFJpVUN3a0FidnhwaDRvenNWdjFudGZCTm15NVFhRG5IZ2gzNGo4YjN0?=
 =?utf-8?B?YkExeFFoMzk3Y09mTnVlMVpHVHNIdyt5WU16c0tsdU0zVWduY3hzZlMrZFk3?=
 =?utf-8?B?TmZuWjc1c09TeFpLL1VUaXA1cUtDNndjUHRaeTJ0czFqOXBqQWpuRG1jN2k5?=
 =?utf-8?B?M28xWEhadVFrOVV4WUhDRDcwL0lvZUJSeEttTENIY2pSd2lPNER1TWxURTl1?=
 =?utf-8?B?RUtSUEV6ajhTRmZOV0t0QytDeUpQSkJhbVEycU96eGM4WEZQSlo0LzBSK1FE?=
 =?utf-8?B?VnRBQ2tVTFdHZXk0eEg2czA2NlNXZG5TMG1raDdhK3ptTSs2STU5M3dyOWoz?=
 =?utf-8?B?OXZUa0VueGJBN2ZMUlU1R0dLT1puK0hidWlsRzFyVWNlV3ZTWWNCeUl1a1Jz?=
 =?utf-8?B?V3RyZGZmajZJbTNwY0tyNFlieEpzSkJSeGtJY0k1KytUWjdlRC9KV3Buak5q?=
 =?utf-8?B?RXkwWllSbEdMZGFQRXFnYm9zNTVqZWw5VnhzbWd0Q0JaVnlYeEJGZDZoRFUz?=
 =?utf-8?B?V1NSU0dzTFdvN3NCZklpcGV3YzJzQlJoYm5aK1BqSXplc3pUbGlRZlFpVlFX?=
 =?utf-8?B?c3duQzRqd0dtbWE0UkwyVm53ZjFYQnd3NXJtcE5oVStURU05ZVBZY3dQVDFx?=
 =?utf-8?B?KzYrN2doS09CWnkwUmFnMTJ1bnNheTBLM1pSY3NDV1EveVFGQWpDeTljOHV1?=
 =?utf-8?B?ZElSbExRdy9rRkRwaXZjb3dqOVlNTVJoR05HNldFUjA0eElKdkF1eE11eS90?=
 =?utf-8?B?UTVrWWRwVmRackxLVENsQU9QWDZWeGNkSWQ5NkM5MEMvelNYbjlWZ29oM0Nt?=
 =?utf-8?B?ZytaL280cWtlZmUvcDFSeXVjR1I4T2cvVEtodFFHWkpNUXFIMktONWwyZWhQ?=
 =?utf-8?B?aXVvSXIxdjkyaUZCdlJCZEhQMmpwUXNrY1RUdGJhR3F6ZUIwNTU0T3dJSjha?=
 =?utf-8?B?VVdJRTVuSW4vVURrWjZLQjhFOXFVQTVkUzEyYTBjTndiTGJ0YXltZm5IbUUz?=
 =?utf-8?B?QTZoTEJsN0xVdk56dUQ3SHhlUE1DMGxNMWhLVXdiQzBIMktZaU15NDhabkgw?=
 =?utf-8?B?cGZ0QVdnN3IwUTFSeFo1TjFMMDl5d3B3KzdSdW9ha3U5c0lydkNwKzZwT1gv?=
 =?utf-8?B?TnpsWGt3SWRDTWs4aE52b0xvTjMrU0RQWFFSNWZHSFlyajRsM2EyMHVmK2Ry?=
 =?utf-8?B?ckFDMzBjc2NGR2J0L1pHTnpZNHNIaW9oc1VydWtvRWF6UnEzc1Q5b29YQllh?=
 =?utf-8?B?Z2JZQVE5emNZUlg0SndQMk0wSThjZ2sydENRRllqdEF0dGoxRXpaNC9qeEEw?=
 =?utf-8?B?ZkJPMEt6UkNKT2ZubVVqaUk4N2JWTmRIdjdSeDBKbjdxNCtsVEJlZlZ5ZUNV?=
 =?utf-8?B?UlBtcFBacHhMbmZZWTlnOEJsYWpRbU5FY2l5TlBnckIwR1AyaDA1U2NIYlNr?=
 =?utf-8?B?bThOZHBvWVIvT0VlRzZHZGZLaENMd0FhUVkwLzZITitqSDFwK3haRk5zeEhO?=
 =?utf-8?B?enlJR2Q4ZzVudi9DUTJjeFVJdUpBT1FKQU9wQVlnd3d2WlROU3RkWVZCMlVi?=
 =?utf-8?B?NXM1RHd6T093dENSWnRMQ0FuWUhwUHc3dTZEOE94UEpDNUZtN3FraWJ3Q0lG?=
 =?utf-8?Q?Wk08=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:06:16.7337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 960d1c13-7016-4fd0-dccd-08de4ed83c80
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB5866
X-Authority-Analysis: v=2.4 cv=ePkeTXp1 c=1 sm=1 tr=0 ts=695fe40c cx=c_pps
 a=f/YTL2VGy3b2GhEhNfAhGA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=TP8aPCUxYTYA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ZZWT3ZfIidy3qYITY50A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: i6XjiT76Zge5SCAuKN4cIbSBuyJPou6a
X-Proofpoint-ORIG-GUID: i6XjiT76Zge5SCAuKN4cIbSBuyJPou6a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEyNiBTYWx0ZWRfX35Lq7gKqTIs4
 9r7BVFaAdfjhyegcCDJEOMO/sJZwebqGPuKdFbo7jZ5PP5lFSbwb+LURJ8Q9qZFNv0yqnp6wAV/
 AY+XrftOA6Zu/lt0cFisIhqh6z8VCx8xo1pePjZCndoGcNs39nUTeeZJqL5NNvQoHR6PK4MZieg
 kigdzX0oX+AX8osQsuiqve4xUNVAi02mp8AJTcax9R4Off8kpGjb0ejDogK3Scyk+DuXpI1PMxx
 WzRNG2I2WVx3ESM4Wos9vXm0GPQcL2Q7rM0I5GHnVq9/T1TEB/KP366KJPOzF/dI8H358f2RKQS
 lJN4ExF3AbCoVKN46HfViFVmifdA05TXfgRLmmwyDFDHrzMFZImVxbNqwxKCNTkHrSWalCEv/vo
 sMCqDy1aFF4ORNByj/7VxHWMqohGsYyxwfTCwrAkCnFUnhi/AQFxfud4syJFPE6pIr+xFVXysPI
 +XnYhsITe1Yj8vNEMdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1011
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_090628_362702_D15CC694 
X-CRM114-Status: GOOD (  12.19  )
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

Hi Krzysztof

On 12/23/25 16:25, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '=' and
> before '{' characters.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/st/stm32mp235f-dk.dts  | 2 +-
>   arch/arm64/boot/dts/st/stm32mp257f-dk.dts  | 2 +-
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
> index c3e688068223..9a2b2f50df76 100644
> --- a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
> +++ b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
> @@ -93,7 +93,7 @@ mdio {
>   		phy1_eth1: ethernet-phy@1 {
>   			compatible = "ethernet-phy-id001c.c916";
>   			reg = <1>;
> -			reset-gpios =  <&gpioa 2 GPIO_ACTIVE_LOW>;
> +			reset-gpios = <&gpioa 2 GPIO_ACTIVE_LOW>;
>   			reset-assert-us = <10000>;
>   			reset-deassert-us = <80000>;
>   		};
> diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
> index e718d888ce21..4a489a8d9aca 100644
> --- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
> +++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
> @@ -93,7 +93,7 @@ mdio {
>   		phy1_eth1: ethernet-phy@1 {
>   			compatible = "ethernet-phy-id001c.c916";
>   			reg = <1>;
> -			reset-gpios =  <&gpioa 2 GPIO_ACTIVE_LOW>;
> +			reset-gpios = <&gpioa 2 GPIO_ACTIVE_LOW>;
>   			reset-assert-us = <10000>;
>   			reset-deassert-us = <80000>;
>   		};
> diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> index bb6d6393d2e4..0c5fc7a7be8d 100644
> --- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> +++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> @@ -186,7 +186,7 @@ mdio {
>   		phy1_eth1: ethernet-phy@4 {
>   			compatible = "ethernet-phy-id001c.c916";
>   			reg = <4>;
> -			reset-gpios =  <&gpioj 9 GPIO_ACTIVE_LOW>;
> +			reset-gpios = <&gpioj 9 GPIO_ACTIVE_LOW>;
>   			reset-assert-us = <10000>;
>   			reset-deassert-us = <80000>;
>   		};


Both patches applied on stm32-next.

Thanks
Alex

