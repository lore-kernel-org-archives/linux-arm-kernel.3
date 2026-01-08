Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA9AD1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wj9jlYYOJjbZj9tul3NrAhECW8LTAytOcnDevFRqewQ=; b=UBJDx7Qtw5JoYPg7FIYOnbd8wG
	/tiJYhNDW71V9SWjSt4fQHF0YrYefZ4Rx8ist0GeN4EYDHIvYJs9AwKkWjjanz0lQIrNhK7M/Mh7J
	bEmI4t2sMxrzZ6sx8kIHm3qERvNFQ2MBBwpBVFHmZqY7dUwZR2gG12pQP0yp74iaX0WVLWIDhStnp
	77XAm6CMCG9D0f3YmpPcQ/zmrwnPYye1+Xiftq5cf7IFIb8vIti0p6KAXmHmMtgA4pXj0vXfXMfVi
	19ukjTf6NwVGPPtnTIlFXXeiybbKfbrlPo95AKyjNynL0KtXRtyJTyC0KDbltyI9rPNJw86k6wWcD
	K02zejHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtWS-00000000Iz2-3PsU;
	Thu, 08 Jan 2026 17:10:11 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtWQ-00000000Ixw-1MmI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:10:07 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608H3wt21835961;
	Thu, 8 Jan 2026 18:09:54 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11010067.outbound.protection.outlook.com [52.101.84.67])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bhfd37fre-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 18:09:54 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUCZsXQhkE68WSaI3wN9wRmEJuS/GoDPkytvaMqrw8PAZtzd3jQLU+o+Wj0VUIcxsFaYtm+N2nhHl0eyUJLe8lkHfxgZErD2JmVXWrDa2XHLzc5Mdd0uZqkslnTRonjYl79BVNSkEjAsiEWH+ZpPI/+E1BlReyrF20evhfovkSKs3AC31pFEJ52ToNo9J89TCxjSU2J9ivG9gRcApC0iOOFBukMoHswCJB/o558pFhRqkh7nUwW4jCbmkCdwcarIvhsj/OjR9A5uCFeOT6M0hgqTMtLDqpVTuB8OAO/M7bIEGILRfmcffo2/XCZHLTB5gakSybNqbAc/DjoQp2Q1ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wj9jlYYOJjbZj9tul3NrAhECW8LTAytOcnDevFRqewQ=;
 b=M3pxgwwzLSoCcbI8qaIR3EfitfIP0JyvGF7TkvFXGuM8GZqQjqU3Gzg4pOwSrdq8svenI7gl8B5bp/azV1YlUWoycJ7XKwmcODRPXF22XnVLL0Jjfw57qfVRKBkUdHlifz4jHxbOVTasghtyC7FnvD8PC94t22hQnMNmBBQqbpiynLhGBDzFs5qUxY7yIQDXbVF3ydyLRCfCMFlOn8hzuaP/NbNLZ07G3oI8j24gRhKmGWKHaNoziTeQ4PUdQZKl4aZQpwAnDqM4yqRf4kmE7zTO6qzzkH4wxC9oNg0ZV3kB+VWbMzdM61MaOfKwDpX43YllX/z9CysLFtB7hy0/vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=infradead.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wj9jlYYOJjbZj9tul3NrAhECW8LTAytOcnDevFRqewQ=;
 b=HI1E6NuWrwfZjrDmQD3rgbQtwBBko5hnWZplMd8zdCOT+IUwel8JOXbr/63YOjIZWyVCISgQ3CdaasfozUzr27YG00/kjPaPplqiMcUkJBDaqU9Mt9JINgmeyemj/ozP8VyptkS0dfZSPzC7phjt8fsTAWbjvdW9e/V10TcKJ6C+6dvb3XRRVQchToWg1LsHUGcd2RxESGa3Bjd2ZDLG+q5s7yvEGjWKF95GD/64YsNkevk9K+n+IR4MNlgu1tKBmdI411nVwDYHs0YgS2mvrEdKh5SWSUnn1gYhrw1vbMwmuRW2zd234pmAubBABvOxR7SBAbfN7daItKvNBen4Qg==
Received: from AM9P192CA0007.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::12)
 by DB9PR10MB7626.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:337::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 17:09:52 +0000
Received: from AM3PEPF0000A79A.eurprd04.prod.outlook.com
 (2603:10a6:20b:21d:cafe::e3) by AM9P192CA0007.outlook.office365.com
 (2603:10a6:20b:21d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Thu, 8
 Jan 2026 17:09:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A79A.mail.protection.outlook.com (10.167.16.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 17:09:52 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 8 Jan
 2026 18:11:06 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 18:09:51 +0100
Message-ID: <eedd657d-158e-4391-b92c-593f22af715e@foss.st.com>
Date: Thu, 8 Jan 2026 18:09:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: STM32: drop an undefined Kconfig symbol
To: Randy Dunlap <rdunlap@infradead.org>, <linux-kernel@vger.kernel.org>
CC: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
References: <20251230181429.3429404-1-rdunlap@infradead.org>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20251230181429.3429404-1-rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79A:EE_|DB9PR10MB7626:EE_
X-MS-Office365-Filtering-Correlation-Id: 838f049d-4a64-4ed7-f8aa-08de4ed8bcde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elhMZmdwTy8yOUFsNE54ZEtjR0xzWnV6VnZWRkhEOVZRc2dSYmt5QVFOYzRi?=
 =?utf-8?B?MW5EaUxLaE5GUkw4b1ZmaEplMVFvL1d0aDJaUVNSZkhtNnBPNnRtdSs1Vlg3?=
 =?utf-8?B?VEpIRit4OVVYdVU5UXdNRnMvelNVcndMenpPN0lrZUIyUWRuVHB1UDRTWkMy?=
 =?utf-8?B?WmJvYzlDQXc5ZHhoTTF1QUY5NmdKZ3lJUXBRMzhralpBcWY1NkxzcG41V3BG?=
 =?utf-8?B?SWs3ZEhpR20walJvWURPRHBTS2QrWG1HR1VwQ2NyeXUxNDk3a3M5dXBLZm9k?=
 =?utf-8?B?bUczMFhQYU5OQU5wS1U0eS9NRzU5WUJyWW5ZdDJuVWcya0RoZjdhYlBqRUZw?=
 =?utf-8?B?QnpnS2VCVW9vaXExVHh6aTc1TkhDbmVIU3pZTFMrNmptcFVLSjJDTFR6Zzlq?=
 =?utf-8?B?Y012b053SlJvWW1Nb2EwSFFrMGorQ0w5Ulp5dkorWS9kOHE0UmxYM3U5a29w?=
 =?utf-8?B?UGtVSVgybnBEdStWVnZNb056MlVMVlQvZ0VlU0pKWUFjR0hFT1BkTU53TUNC?=
 =?utf-8?B?eDFnNjVwYW5kVXp2YTBabjR0c29GTnFhVnU5TVlYSVpZOGZINS90K3dKQ1Rp?=
 =?utf-8?B?UzM4cGhoRUVJaS81RTk4M3ZMRHdTS2wzUFlVR2ZmMUU4QWJkaDN2OTNja29H?=
 =?utf-8?B?RVBRWVhTTlZ2akd4Zm85N0lPMlNhTkgydEkvK0JFdG55NFA0N1Zrb2ROY0t1?=
 =?utf-8?B?L2t4Mm4weXQwVVFQOWt2L1BKZ0Q2dElzYjB6dGRKbmpuaFFXUmY1dmp0K3d0?=
 =?utf-8?B?dmR0TWwxT3ZPNzRlVlU3VWdnazJiQkNpZEQ3ZmVCc2hzcTdHT2tPS0pYZUFX?=
 =?utf-8?B?a0RiQUpmZzgwemJDU2oyYnN4bzd3Y0NrYm1WTHVBaFhwYTY4ZnBFMmpLRVh5?=
 =?utf-8?B?SEhJa1k2WTVVWC8rb0dqcVBBc2dIcjRXUmFNVHhONTFGWFFCdVFCWUZ1WWZv?=
 =?utf-8?B?QVpRRFVPRWNsRk5INWZmcldySGVnTnFHZmh4UkE1VGppSjg5a0VUUytLdlU1?=
 =?utf-8?B?VEJlUjF5RUx0dytPZzNGTzR5KzVRODVLWjRIc3VwVHgrRHQxdVNnT2dySEt1?=
 =?utf-8?B?T2E5bE5OV0puT0g0SVNrVjVUZC9lei85RkExbkI0SEJ5dHU1SEhrNFVzWDZM?=
 =?utf-8?B?VHNzR2c1eW1FZURSOE5lb0tmeW4zcndDWTY1dHFrWUxxWlJ3YW9zMHNkMm42?=
 =?utf-8?B?eHJoN3Q0YmI2V1YrZWxoU3FvSXUxOU9vcjU5UXN2NXp5dGxSNUJqRG56Snp5?=
 =?utf-8?B?emxQZVpTeldRNnN2TXVIc2VZd01QdDkzclVaQXFnY3B2ZTIzQXFaVFFHWFU3?=
 =?utf-8?B?eTRyV0hKZzVoQzdBQlNNOTdXV2JMUEY2WXptcEhYNHJ4OE82cWU0VVJFbVdh?=
 =?utf-8?B?Z3hYVlhHbGt5OFl4T3BMVWpDcWJjSFV6MW5TeDArcjRXYkdldEZZempEa1dN?=
 =?utf-8?B?SVR2WkFsMEExTFZGcmRRKzd5UVNZQXlxaWJmeUhLSkNCNXVROFpjaGJpeWpa?=
 =?utf-8?B?N3lPM2djeVJxRUFGMFFDVE5pNnNHUGRlQ2xLdmpWaU5JWDU2Q2xTREQzRDVq?=
 =?utf-8?B?WjJhU3VsaUFZV1hYdXRGSHd5UkptUDZSNFVNL0FPajU0SXNDdnB0MVZDRE1s?=
 =?utf-8?B?MmZzalJGRWpmVWlhSmFGMUs3aVZtU3ZqQllzWDFJNzdWYmNMVjgveTNLc3M0?=
 =?utf-8?B?aEJzNWJkcTFJbnBFSE9FcmxDdjJnaUxjZEI0TjArQU9HbitLakJPSSs0dHZL?=
 =?utf-8?B?VFJBMW9YNUo4ZWszc3lGdDhZbERYT0JkSGlqa3ZFUkFiamk4ZE9HU2p5MzRM?=
 =?utf-8?B?a3I1SjJnYmEzYlpjU3hZemtKWFlwSW0wRXE3QnVEbWRrQVR6OGt4ZEw5OE14?=
 =?utf-8?B?VWVVZjA4aU1lVEJLRTJ6b3E1NDM1TmVCT1YxaW1WcmFUWHZLWEd2VHVTSnBI?=
 =?utf-8?B?Yjc2MERkaWtNa1gxeEU5ZTdBZUlhMWI4WU1qOURTNXZqM3BjZDFsWC85alRj?=
 =?utf-8?B?T2JwSk1WVzF4eTVnWEVzTzhHWlJLSGhKbGg2eWFobGZybkVlSU1pcXlvMElR?=
 =?utf-8?Q?5QdCAY?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:09:52.0959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 838f049d-4a64-4ed7-f8aa-08de4ed8bcde
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7626
X-Proofpoint-GUID: SxZcRVj6WAILzPFrN2MIpAJDbiEcJLap
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEyNiBTYWx0ZWRfXwfP2U72o/NrO
 lENg44R2TYyXhTmeu9ngBmBzh2HQACVkhwiHX3Xm4c9REuwuqQ38+K3yx7kpu0Wl/oJ0zbFwbzQ
 G77pa5WoM2X8ZODoTlFLpPNu3m1fjVpMnSNXKeCRbGCl7Lrc/mopMdjvrG2mwzjPqTDHd9JEyrL
 NfOI0252Np1iJS8F0cCIELRj/9CZfZl46nA/ygU6O2dM4RtNgKiDRJZ1VctxYXrLQDGwUgG9ryf
 AzZaowXvdVseUsK84EASqhl7q0sMrcaddvzSDZ6x0LZCAKJWIw3WGHyi5D0CO6wrhS7Xhdece2u
 BQiteOzjwQVxJS0KrhFVoCH9GCvyqjnIKwLh4gpG88z1KwHsd7crhVxsEVOgJqq51jYTTKhlh4m
 vYGZOTp/LT44SjB7us36xAlUbQaHKXP+xSftyq3PHTYvFDlD8p3qfwKHlxjaJw2Y3vEIjBjFatB
 rffg+eVuPivQya3PWFA==
X-Authority-Analysis: v=2.4 cv=Hc4ZjyE8 c=1 sm=1 tr=0 ts=695fe4e2 cx=c_pps
 a=a1Mm9n66rdXMmngOfDGndw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=TP8aPCUxYTYA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=JfrnYn6hAAAA:8 a=8b9GpE9nAAAA:8 a=pGLkceISAAAA:8
 a=phlkwaE_AAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=GQMxEzRw6_G7CHmWyYkA:9
 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22 a=T3LWEMljR5ZiDmsYVIUa:22
 a=uKTQOUHymn4LaG7oTSIC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: SxZcRVj6WAILzPFrN2MIpAJDbiEcJLap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_091006_637553_6C8B4121 
X-CRM114-Status: GOOD (  11.38  )
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

On 12/30/25 19:14, Randy Dunlap wrote:
> Drop ARM_SMC_MBOX since it is not defined or used anywhere else
> in the kernel source tree.
> 
> Fixes: 9e4e24414cc6 ("arm64: introduce STM32 family on Armv8 architecture")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> 
>   arch/arm64/Kconfig.platforms |    1 -
>   1 file changed, 1 deletion(-)
> 
> --- linux-next-20251219.orig/arch/arm64/Kconfig.platforms
> +++ linux-next-20251219/arch/arm64/Kconfig.platforms
> @@ -372,7 +372,6 @@ config ARCH_STM32
>   	bool "STMicroelectronics STM32 SoC Family"
>   	select GPIOLIB
>   	select PINCTRL
> -	select ARM_SMC_MBOX
>   	select ARM_SCMI_PROTOCOL
>   	select REGULATOR
>   	select REGULATOR_ARM_SCMI

Applied on stm32-next.

cheers
Alex

