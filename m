Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C94D1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ckm0c1WQqnFokmQDoX41MBm8sfOage00YMuGwQIDya4=; b=oqtKVDGpz+sWsuRW1CFmfDy12K
	V4H48S0a4c8Qq2OHilRLv/SEiZY1Qhwuksbn4iH1qI92egWC8RtDA8sQlzZ8IofzQeoLH1gPqx00P
	PjupvOwRtK1zZKi9XbkEBjqfoGWuFLo8zeQ8cwP0IVM+fs1CT8SKpX8O4CcPjbsx4fHLwbqwoyXIN
	JV3oKGO8vGIRMJKE2Pa6da5+Aw1wEmUhQUCSpZ04Qfm28l2a0HLo1YsnVvopg6ntMtvdAkS8szXdU
	8LT6NopS399Uxl+NtgW4+TIWTlJacTWkqj0mOosTdABcDNPkGYgHb2ywqYbcbzRfrK9P1EZfkcE9P
	6BIQtItw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtKB-00000000EiB-2Rh8;
	Thu, 08 Jan 2026 16:57:27 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtK1-00000000EfH-12Wr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:57:23 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608GmOfv1812035;
	Thu, 8 Jan 2026 17:57:09 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011054.outbound.protection.outlook.com [52.101.65.54])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bhcy8yuqe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 17:57:09 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSDNnCJ/uZDmuKjUlI+5djheLGdgHSK813poYh0oXeWhkiYHZ+vi96Hwg4NutDWznRM2jMh23ts92O0kzzluNwHCECtbe9TreXlCBsoboXD1IcjF9Cb2hZHQ/HXVC6duZwDpYLmp18qCqVjtk0CXnqJnwatZwwTCCzkD8cs/OVRRlhVrYNLI9ds4WhESf4kF2LfAOB5xVFeQfIFJZliLJsQtHP8FvFmCA5SWMnzn5xEsmvhokfb1dtotcaXr7V9w4H0PD7Y0A8pPpP0Vb5lbD5xFyTXtORp97DV56OvNst9h+niZ+0IBV4LH5T0+4UiRb4e6BI7AkmEXX9h9+ageBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckm0c1WQqnFokmQDoX41MBm8sfOage00YMuGwQIDya4=;
 b=D+NXfgvKGInT9KmTVn5ZumACDS1S5VH2YhEIwPCWOO/wtSIqkt1AKvR9DlpqakBvHUVceSdvu9h/fgqR6Ax65BEzgGWZ921C8hmA9w0D5vH+5RLglKiSHA6ZuXC/oYk+q5BA4hHxh0vKF3IWGT45LQqd28xx+JDknVagzSUk09WdKmbgoDNSRw/lnzVAL30DMI16nBQc8V2zpz8ZGYt4IdyhE9r4XSctSliUcbtycUyZf8mPfYtjb6vgc/hwUWjPWnB3ejoKr9Dza1nx12n+H9OeVLgePnQ44iObpVF53Ja7eA9kp8KmlRhvH2hUqRjLch4jRKCGULOC0xUVhPfMbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckm0c1WQqnFokmQDoX41MBm8sfOage00YMuGwQIDya4=;
 b=ZR2ieKthZoI5yChvws1fldRUpVpz1kslq97q9G7teCFIp9mmRwfrtKP3fWEoB7NmUR5neT1bUQFFWmA+yXMSBDQ2R1cOzT8CZWv2AaRJBPp5dnwTYSYbcwaWlOotrPT7W+0cpOUZJiNIdzn38kwSFZyHFQudN0sKFuw494Y32JfKG5Ltz0jCUwaCbyXAA9+tFJbLtdHtD/M/nhp3qyyJP8ncoSYreqcK6yuIvxGoLcaB09IYxwCUylHdITVspUkhpJmKvrdBILMH9dRyunQyUHXy406R84wiOOcD3pt0xcybsHhwekEW/WrY4U5rHveVfDhZOcCdCMGWAReqGsqJPA==
Received: from DUZPR01CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::6) by AS8PR10MB7135.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:61d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 16:57:07 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::9c) by DUZPR01CA0013.outlook.office365.com
 (2603:10a6:10:3c3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 16:57:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 16:57:06 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 17:58:22 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 17:57:05 +0100
Message-ID: <f88530c5-9ec0-4f23-a8c5-4155983a4ff1@foss.st.com>
Date: Thu, 8 Jan 2026 17:57:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] spi: stm32: stability & performance enhancements
To: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Deepak Kumar <deepak.kumar01@st.com>
References: <20251218-stm32-spi-enhancements-v2-0-3b69901ca9fe@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20251218-stm32-spi-enhancements-v2-0-3b69901ca9fe@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFF:EE_|AS8PR10MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: e479694a-1101-4fb7-fd50-08de4ed6f488
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkdSVXQwblo2bm5BWmdBMWRjYmQ2NGd6RE1VaEdQRUNnRFBUdk5iR05sQVNn?=
 =?utf-8?B?NnlUWm9uaG5zakxaS2Y2eW5FSUxCK05NVlRIMmhCcUVYcEx2TUNFRFg1KzFh?=
 =?utf-8?B?Sm8wWVdSRnVZdkJvMGkzVm9BeHc5SkRnUER1R3lRREx1bjlKdE5ic1lWR1Vy?=
 =?utf-8?B?QTNRUXpUNG93NzlCSDlpZVZMZ3RvTDJqT3ZYTXdac3VRa0JkYk9xUkxwdCsy?=
 =?utf-8?B?bmlpMzcybHZjaE5XcXZvdWpUVmpOWTBPcEcvTlhxc2VkTDhrWjhwLytFbGpW?=
 =?utf-8?B?eGRDblRxZWpKZDU2elI5QmlCSnYzUGVTcm5zSWtxZmpackc1VDdERzNHMVpR?=
 =?utf-8?B?ZUpDSkxNT2FEeVR1eUVrakhZRkliYUJ2Qk1RWUpFREhBSjAyekloVVRuTGg4?=
 =?utf-8?B?bVRKV21LY2RzUDZ2dVE1clMwMjU2ekNjTmhOMml4eElTVk9CQS9qVXlQZHhR?=
 =?utf-8?B?aVZWOHYza2FqR2dERzNHczlFTnNWdGU0NnBwRndXUU9DNm55aWZqajNzRzNs?=
 =?utf-8?B?eWVxdStrL3dXZ0FhODNBbm84d2JFdkw3WmhWdm9CaDBkNnlKVVNWUDJBMEdm?=
 =?utf-8?B?L3VxY2JHbE8ybWJYdk1KREhCZERvYXZrTjdVWEhLa1BGZnJIN05YRVkxVlBU?=
 =?utf-8?B?ek5BZGE1czM1bDNscEF5WW5QdEQ4S0xoeWR3OElwQ29PVnVzOWNQSGxwaU50?=
 =?utf-8?B?RzFpU2NFUFAxTVVIcEFjaFpDMmQ3NENtc3dLNExzbU9xcHBGMzd6MnphL3Vm?=
 =?utf-8?B?WEFxZFJ6WW5rWE9aWFhUS2hSNkZiL1BmdUZDcTBKWUxTK2xhWXlJNWdHVW0w?=
 =?utf-8?B?L2xNdW9ka1p5ZE43dStkMkhmSk85K2luSXhiYm5nZ0hud0tEbVdFMklaRjhH?=
 =?utf-8?B?YXZBekFCWDhqazcySmJxYWRCRmNzOWVIVjVNMVBXaWpaQ3FZK2hJcERZUkU5?=
 =?utf-8?B?SnlqQ0taMG52TWlVcDRXdHJJeGozdXhkcnhOOHAvVnViK0xpVHpLcUVHOXJR?=
 =?utf-8?B?b3RUQ01SZEwxLzBrcm9Ib0Rsem9lSnYzWVJGcGxlWVg5UnA4dzlUTjhLbTY5?=
 =?utf-8?B?UlVVaWlvM0RnMjFkWWpQSlVrOFVSTUZ1UW1EV1BBN250R0YraDRKVERNT0N0?=
 =?utf-8?B?aDRER1I2bUp6S1diZGJYZ1RsTWtGbjdKdWM3RTdjR1RPanhFbFVMdjV6eUYv?=
 =?utf-8?B?dFIxNVFId0pSLzRHZ3VrRXphTnJhOVpzRWgyY09EbHZMdnVxY0k0ZGEweWU4?=
 =?utf-8?B?czJja0tSSVpTM0c4UUkydjJLYTgrM25WdERCU1N4QkVJOVZYN0hjK1dzUVpR?=
 =?utf-8?B?cXc1dG1jaXVEL29veldtV0JkWTRHMityMndWWTlqVUdQem9FSVhJTnlLeEpW?=
 =?utf-8?B?MXlBV2VKcFVNdXh3TnBkSTlvLzZVMGt0elhFcWlwdmExbGg3RXlvRzRhV056?=
 =?utf-8?B?QWlzZFpyRjNxMmJrNEZyOFJ3VDgyZjRzcU5mZGtvcEFYTmxsMTJiSk1Ha2VX?=
 =?utf-8?B?azFsUU9BNVNCUmx4TGtzK2VwdDUxdTU4cGM2TytMdDV4VHFjMmdERzhDUEVV?=
 =?utf-8?B?WnA2cDA3d3NzR1lSRXg1UXlCWFBNRUtjTU5TNU9KV2dNR3NBZldxS21SNzFQ?=
 =?utf-8?B?dTYvL21oRW9wTExoOFdmdi9oMU9QN2VmN2hkekl5ZlFIelZjM3RuSE4xY0x4?=
 =?utf-8?B?SWZ3UXQ0SVdib1U2bEdvRXVLMGdBNlNISDVJcnhOQUpsNWN3Q3liSmRTWDFp?=
 =?utf-8?B?WkxXcXdteHE4c01NYWw4bGlnVExiRGVPS25vZFJnUDlacFlHU3RpcXBDQlhm?=
 =?utf-8?B?SVhDSXR4WEcxRHdLTUJFTEowUGFtMWhON2I0Yno0Wkc3SVhublNjWWhmdjc2?=
 =?utf-8?B?N25SWTRObXFEQ08vQXgvSmF4amtsbFU4NTJZQXdLdWVXeS9aRHY2ZEhMYXJu?=
 =?utf-8?B?R0VDdXBzV1g1bks1K1RxYU9IT2Q4UktRKzRhMTJHUVB4RFk5KzhSL29JbDNk?=
 =?utf-8?B?NW1BUG5GN3FpajBzTVhsOEJoUTliUnk4R3hVZVhNUHkxVlYvVllXUFBJcnlv?=
 =?utf-8?B?UmNQK3AzZk1JR2ZVR1lOOHA2SEIxekxhMG5HejhBTHJjSEJqbkN1S0kwRlRv?=
 =?utf-8?Q?nm+AUAX0XBKqjO/pL+9DD0nse?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 16:57:06.4617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e479694a-1101-4fb7-fd50-08de4ed6f488
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7135
X-Authority-Analysis: v=2.4 cv=ePkeTXp1 c=1 sm=1 tr=0 ts=695fe1e5 cx=c_pps
 a=+0KVRcNz3+e5gX6inTwS6Q==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=TP8aPCUxYTYA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8
 a=nipYHikrYMoUsCsrsasA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: g4PPOzxbpQn-KhzisBGtgw8qAmv0EhJx
X-Proofpoint-ORIG-GUID: g4PPOzxbpQn-KhzisBGtgw8qAmv0EhJx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEyNSBTYWx0ZWRfXxpmvwi4Z0bjO
 SHAz5u3uK5TSRwm+RqMDmpKi1kQZRfHKwP+5c08ga8bsk80OZGKE0oLXPY221xKQ9DrrloHvugb
 XVz3yKjgcOjVqA6wL2uGkDAdsopW3R/onfW/E7UvMZFTeLib+nhcyHGNfvUCfqp3ivQEkiLvBQb
 NTChpvxJ1lo36GAPq3DB457QGYfvhMo2jLwJDdgjli8C44kK9MVr/xoXFxs53GQVEjDMw72UdvL
 cT2B2vGbB/jbiWhgeaGaWAAlWAT3bc/Pmv8Pu9Nm4V+ebhpF0qSn/sHvtvRSF8kgZTZbUv0XFsv
 j7THgMT1wcaq+0IYJvleieUfDtST8oFnA4nIGweco5D4JasTT88T4SiPb4WcEb3ay5fpk/K0G/l
 jJrJUzIuGdkUQi029sReTV5H1+HsSnPH83CSvjU2udpYQEbii7sHmKmdjNJKFK0rNiDRa78xaY3
 zJI7xhTKtBH4C+52G/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_085717_583158_793FA5DF 
X-CRM114-Status: GOOD (  14.74  )
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

Hi

On 12/18/25 11:48, Alain Volmat wrote:
> The series fixes a stability issue when dealing with <8bpw
> transfers, as well as enforce an error if the DMA information
> provided within the DT are incorrect.
> 
> Performance enhancement is also provided by allowing a polling
> mode which is triggered when the transfer is so short that
> polling mode transfer would lead to faster transfer than
> if it was done in a interrupt driven manner.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
> Changes in v2:
> - reordered commits, putting fix commits first in the series.
> - no changes done in commits.
> - Link to v1: https://lore.kernel.org/r/20251217-stm32-spi-enhancements-v1-0-943348b8ff66@foss.st.com
> 
> ---
> Alain Volmat (3):
>        spi: stm32: properly fail on dma_request_chan error
>        spi: stm32: perform small transfer in polling mode
>        ARM: dts: stm32: add spi1 sleep state pinctrl on stm32mp157c-ev1
> 
> Deepak Kumar (1):
>        spi: stm32: fix Overrun issue at < 8bpw
> 
>   arch/arm/boot/dts/st/stm32mp157c-ev1.dts |   3 +-
>   drivers/spi/spi-stm32.c                  | 106 +++++++++++++++++++++++++++----
>   2 files changed, 96 insertions(+), 13 deletions(-)
> ---
> base-commit: 865a1f17d5e41c0b34929afcab0afa6bdb90d33e
> change-id: 20251213-stm32-spi-enhancements-29da9bc29133
> 
> Best regards,

DT patch applied on stm32-next.

Regards
Alex

