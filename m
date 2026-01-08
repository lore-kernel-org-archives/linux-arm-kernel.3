Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCA4D1D47A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 15:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wzth2xhNfDU4XulUTKJFsqR41xTwEbxQp3XA8yMNXu8=; b=yFKOiswurZLs3ShRRQ4GEw/bI3
	th52HMazL0QbBiqgFfWhpzoYnkIR+HI1/MbFpik6VCVOHeecFcukqfsN4m3/96gdC99hnqFl03044
	1j4qe7V5ohV+DjeqU7qdBZJWOlFSMbvPsC68ldkDzWQn9FEsdOffIU9vQU4SkrlfXqyKr5mMa8wI8
	JPJiITTILhugobB3p1gWjAheliDLGKmFqWSbKfY/CS1iez/GhjlXvis7eU+dB/fNuthwTvaeBxcQ9
	HJ/0K+dbMLBYfrjzPwcIjXsjcjlMJibLO+BWnI8M0usnFz6jSpucIQK/dsZcUaXdlixLebM4aNj+y
	oLoKyiYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrsO-0000000HVph-1vGj;
	Thu, 08 Jan 2026 15:24:40 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrsL-0000000HVoo-0Vqq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 15:24:39 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608FNTK33051790;
	Thu, 8 Jan 2026 16:24:31 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013046.outbound.protection.outlook.com [52.101.72.46])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bhb7pft81-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 16:24:30 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SdRRvhx/fmUDXk/jW/fJVGBRRIFlvQlaYlQEo0fszlaIHi/x66GJVl4czKy0pPM3GKzqgx42lIQ3V+keV/IKDP5B2QAjG7ZqLT0TyLd7ur9UYNamIeRlUPdzyifuAgX1bs6eTnqLGfmVlw4TXaHrNjo+LMo2BQVCmrvDrQaDXzh/YlhlNCog7mPZhQY7HPMo3r4x3CYo0IWoY89QBxso6GUgay0ku7dXvPOybyJxW0oa+qPsWH/r801DXYOoD8C3QiD1Sv0bKMk0p6FauZpM5Syh8mmGU4HuNc48k7Xt2gLoIVy85mlGk1/zibMNwwHp5RFR0fYl6Az3c9YBTaODlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wzth2xhNfDU4XulUTKJFsqR41xTwEbxQp3XA8yMNXu8=;
 b=Zxzl0kBBqSkcONPyeokbaQE6VMHwi4Gq6C2FOiITPWgLgX2z/hv5/PIvjQRTO0/GntaHvKs55SoYWpQJMydVpM1chExPkQoesUk0tvG/kgA9QToWzmqvOuMBdtU/4/oReXgkSkrzImyCsMXqnofrOKc9YpyNE4wQv8LUXv2gX5AzIvk7BVMFS1JrfgRAwtn7YMO+CGN6QSRUXVXaG2UiU306ZdX5UAMWicCvML3xea7mGFn98LwVhEwdLuCu5LVV3QknHgVLLNxh5WnQzHrd5/kvtbHtej0aVsGCNnHGisuPy0aueFMGSr+E1mGmiPBQ5u8rqElSvuraiautOanebA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wzth2xhNfDU4XulUTKJFsqR41xTwEbxQp3XA8yMNXu8=;
 b=i2NNgiGPsN5OUpIxLVzMYpAb9A1z/i0CBTq4pYUMzhPz972wUhj1GPXq4RHR9Ym0NLrUe00KEhBFU9LWfBNPnlw71zpG34U4cRp+pG/Ky/3Zl3CNhSysWCrKN9wrUP39RzLL0M146xakiq7rS+o0tsC7VUAGvoOgFltzKI5mDqTmsRzf95FfwocIGNAIXrhto0TyWYqAsO4Fi/kEftnWuU0R+JNtbmdhmQq+yLPYsY985onC+idTSvrKZ+Hj6zKUCrNy3BhYfMwXWaYumTOyHhBAEWf9V8AICPipP4r0WKGzo02qbOH0iost+UbGxRkN2AOYYehj7PKoj5iKlR9y4Q==
Received: from DUZPR01CA0025.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::13) by DBAPR10MB4092.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:1ca::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 15:24:27 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:46b:cafe::f7) by DUZPR01CA0025.outlook.office365.com
 (2603:10a6:10:46b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 15:24:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 15:24:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 16:25:42 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 16:24:25 +0100
Message-ID: <95a72b44-3802-422e-a720-6e9578769cce@foss.st.com>
Date: Thu, 8 Jan 2026 16:24:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] bus: firewall: move stm32_firewall header file in
 include folder
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
        "Gatien
 Chevallier" <gatien.chevallier@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
References: <20250916-b4-firewall-upstream-v7-1-6038cf1e61d8@gmail.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250916-b4-firewall-upstream-v7-1-6038cf1e61d8@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FB:EE_|DBAPR10MB4092:EE_
X-MS-Office365-Filtering-Correlation-Id: 899865b4-4eb4-400e-40d7-08de4eca032a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFRpSXVQd2FsV3JhbW9OeEtGUTFjQlJBSklYdkh6VlNpdkdMeXhGcTZmWTBD?=
 =?utf-8?B?b2pMY3pNZE1na3ZqVTFST1Q2ZjludVJzUXBvZVlPcG5wT0xlL01mMXYvV092?=
 =?utf-8?B?V1ZvTzlQai9DTEF1SEttSjJ5a3lVUXV5VmEzRlk3dVArZXRrV3ZsMDdxWnV5?=
 =?utf-8?B?TWpOVm5tVjUwcmpLMkR0T1RORXNPVUdyZmlJNXhydzBReUtTWWZrNngrU1Q5?=
 =?utf-8?B?WFRxeUs4MzVwKzNsd0hQdzd4SU5NZHZRU3JsYlVuVkZreEM4VThrNG92NDNV?=
 =?utf-8?B?VkxpeWY4T0d3S1FUalRZbzFGYUY2cXEvZDEySzNSeGJsd3gvTnZlWmtVU2k0?=
 =?utf-8?B?RXBoWUlIUE1SOFExU0txbHVzdTlJU21EQk5WUHFKeW1IVkY4cDNkblhmM3JU?=
 =?utf-8?B?Y1dqV2k3dzJJc1JGbmYvVHN3UEpsY3ZFbXlaSmE5Y1pYZkNPbGFIMy9MNVhT?=
 =?utf-8?B?R2RESU95L2F1ZnRxWk5wZDV6Z3dwdy9jbnhMR2N6Z3dBZ3lzTkljdW41VmZz?=
 =?utf-8?B?dmMwMC9wNTd5ZVU1b0tBK3IvN3FYRGNGYXV3WFg4RkFtYnRYanpqcGYzWEFM?=
 =?utf-8?B?YlRLQkp6YTdzellJaHdVRTE3NXNiaVJvcVhNRVJxVUp4NGZhY0NHTHVoT2NT?=
 =?utf-8?B?WWtRSGZISkdSVDFXTGI5ZTYvd2RUNzVPckNmb2w4ckE5Z296N0ZILzFuNHhq?=
 =?utf-8?B?SklFUXlTUXUxN1Y1VElUU1M5WVJYdXNJZnhCZ1h6TEJCUFFqVFNzbmR5dXdQ?=
 =?utf-8?B?VWh2RWI4SE9nZ1BWRUVWalY3VVFvVUxtV1ovTkRVRzdtOW9GejBDMTc0SDM2?=
 =?utf-8?B?RHUzMkpMT3JZR2tvNnpTK3VVblNqeGY5TXZDQURIMkxFWndwNlpENlpYb24x?=
 =?utf-8?B?OTRHMGprNEtIMDVuSlZWdm9PZjBUeWFDeG1JSWFEMGdxOEpiQnFNQWtrNTAz?=
 =?utf-8?B?OElDKzNMVTNwR1dGb1lJZzY1RkkrTXFvdzVNeFE3Ri8rT2hCRU0zYUxnTnBv?=
 =?utf-8?B?eitMTzdYUlJybU5TOEt3VE1GOXloMmd3Y0xrTW0ya09TdjZRVC85anR5Z1Z2?=
 =?utf-8?B?TGJRRUM3eFE0ZnlrZnZRV0ZLTkFKN1pzTFJ1SW9DdFVLMzFTa0dSbXJZdVMx?=
 =?utf-8?B?SkZRdUJkVDJWa2Q0TkRYdjRtSkp5Zk9MMmx3b3JtNzFHc25jRlZqMVBUdWg5?=
 =?utf-8?B?MjJsdVlXaVdEcTAyNFJCTXNXeU5sSGcxVHhOMnRMejZvZlJOQmtjTWhTdW9n?=
 =?utf-8?B?RkdGczU3TkVKMjZtMWJkU1dGejNVYStMblZ6YnFsT3RQWjBNL2ZCOGwzRWVO?=
 =?utf-8?B?L1ZHcHFvNWZOWDlCOFlmbUl3cklGZDdHcUNkRnRwWGFwYjMxeWZmQmZmOVNX?=
 =?utf-8?B?bnVPUWduakdCQVFTTW4yTFVvcmJpb3cwdU0rWEZRdkZGK3VWNGVFd202c0ta?=
 =?utf-8?B?QnpRV0tUVXBtajNKRkIxQ3piTzdzMVd2bkhnUDVkUGFTT3l5QjJyeVlDOFNK?=
 =?utf-8?B?V3p5TTNRM01JTWZHRitLTU03VEovMjBoc2lLZmliTHl5d2N5MkhvTkhoODVi?=
 =?utf-8?B?b3dhZ1I2eTZJVlp1OFo4ZGFNQXdVSU5KS0drREhkcjJwMThVb3ZrYzBwMnpl?=
 =?utf-8?B?N1pYWXlXL0FyUWhkSmhod2FuMkMzTDFVMDZwUktHRFNMNU5KNEVVR0hCaXN1?=
 =?utf-8?B?YTAxMVhpb2pWczc0WDZTZTYyNFpDSlQ2UVkvaWJUY3d1UEt6djcyNlVia2VH?=
 =?utf-8?B?ZTUyUE4vcFQxTDBucndmZ1NiOURmYXlYVm1mT2VJRFp0eE5TYnl1Z2JZT1lD?=
 =?utf-8?B?QkVmV2U5Uy9WRzlPY1Ntc2pFc1ljTitFZENLMy94WmlEMkgwV2MyMUVldzgw?=
 =?utf-8?B?RkJlTWhZTEt6V1A3U1A1WjNkZGx3ZkxDNXhMSFIwWVc3Y3NSU0R6dHNaMTJt?=
 =?utf-8?B?bmdKbnBIQzVSaXJETk9keTI4OWtlMDV5Sk5pQmV1S1NZWC9RUXcwTEZ3dExu?=
 =?utf-8?B?SXpSeXZoeTZsMDBLN1lQNWFYSzRIOGd5RHRDOUdhcEdQSmorRkFWVVRKK1Fm?=
 =?utf-8?B?OFBsUDNjYlNYN3VDd2F2ZDJiQVVURnIwcnZOM0xUTHNNTGRMOThGdTBGL1Uy?=
 =?utf-8?Q?IUXA=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 15:24:27.5508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 899865b4-4eb4-400e-40d7-08de4eca032a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4092
X-Proofpoint-GUID: sqSKkKiV8KB6j7zm4fj1yIJGghbonL63
X-Proofpoint-ORIG-GUID: sqSKkKiV8KB6j7zm4fj1yIJGghbonL63
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDExMSBTYWx0ZWRfX7NYoAu3QJSCy
 Ju0sei9K9J/bEga4czF0ifFRUEg02Y6e4xA8JskiM6SGYwDiYG7FL9Vyyj/JWoTLIcC+iZNp81Q
 AkkfJqy9lUTg2duqxaw4HLRiPfB6swh+Y8xMFBlwYTbTTg73exjsrlzmyTtNiCt1Xf+Mw6P0oVx
 v+YaOdBuKzzejwGAVM8mLv8bD8BaTKJSYF4tQRgv0Kh0vLTe1ZyqjBaFBKZOPvTQ9S1Q6xOVCYc
 sTjD7mRHQdHPlMdFNVBgZPQrQEFDsDXgcmulqSimwIHZmtVszXnQqumRAijlp3E/P84V+AWicPs
 +W1kuZtQHiBn/LZaywGH5FSqpgs/rv2LuyJic+y3GYeKgs83yVWwMu13glCCP56U+hWuflz01Lt
 kCuFJcKgtagbf5V4Cn+uo4TXGqS4CvM6R3EjSj9FUxRBYLIaIc2Wqs5JNsVaUJ430oghRoMLdLK
 dlcz3MXtnVguZ4lHwgw==
X-Authority-Analysis: v=2.4 cv=DZ8aa/tW c=1 sm=1 tr=0 ts=695fcc2e cx=c_pps
 a=0otYnZb9jYh6zTWiql1myw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=TP8aPCUxYTYA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=8b9GpE9nAAAA:8
 a=6IJXQf5pAQi8IoiFzbAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_072437_785393_A00942FD 
X-CRM114-Status: GOOD (  14.31  )
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

On 9/16/25 11:07, Clément Le Goffic wrote:
> From: Clément Le Goffic <clement.legoffic@foss.st.com>
> 
> Other driver than rifsc and etzpc can implement firewall ops, such as
> rcc.
> In order for them to have access to the ops and type of this framework,
> we need to get the `stm32_firewall.h` file in the include/ folder.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
> ---
> This v7 is a subset of the v6 and other prior versions, splited to simplify
> the review and merging process.
> 
> Changes in v7:
> - None
> - Link to v6: https://lore.kernel.org/all/20250909-b4-ddrperfm-upstream-v6-1-ce082cc801b5@gmail.com/
> ---
>   drivers/bus/stm32_etzpc.c                       | 3 +--
>   drivers/bus/stm32_firewall.c                    | 3 +--
>   drivers/bus/stm32_rifsc.c                       | 3 +--
>   {drivers => include/linux}/bus/stm32_firewall.h | 0
>   4 files changed, 3 insertions(+), 6 deletions(-)
> 
...

Sorry this patch is a bit old. Can you rebase it please ?
Then I'll merge it.

Thanks in advance.

Alex

