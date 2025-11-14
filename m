Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27FCCE7A8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 09:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D01tx361+ElDXtfVSXJdEqo4rsQsg8TLFJ9zQvgeIj4=; b=MFMmFg3UiDsqk3RYwBgmuRyEn4
	Hkm/VSd96MaEPPms8kUWZTO07t49jWvdsdIRUPKosTB8NFeTEHuLxHZk0p1ZI7sjtkJ0PJsElgJ7X
	KKY/yvhO0e6jHAn1kxzA1kjn7gUez5Gc5F+lEtddjMbJiLwlWGkOKoqTEru4orRUNerk+8f74Hy4F
	04JKgE/8XsOH8fL7wCd0dD3FP64kPTikKDGgZvqxCsiO4FgR/KW26rt5djopRzl3zqrb9btazOWtF
	tZPVSntVeCf+KD9oWMNdBP2WrJ12NHEtjviMKr55soK7kFaYPw63CW2QXHYRRemM9zxgodN3OXwuq
	urUdJqTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpvE-0000000Bsyb-3NqK;
	Fri, 14 Nov 2025 09:16:48 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpvC-0000000BsxQ-3jDs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 09:16:48 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE9GU7G1899192;
	Fri, 14 Nov 2025 10:16:41 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013044.outbound.protection.outlook.com [52.101.83.44])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7j23dr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 10:16:41 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOTC2LlySID9mD9hkpLCATuq1oFL8BFfgmv3XbELGNkkO+pn3bIQif92dRsnnhQkB0Nv/WFfRnqmlEmdDsQreX1WOmPmBHbgskn6bmW3qxb64tj8FaIfUcBPn7EWiVBbezN90dZLqOEJLNcCDYdqITFuD+Yz0Hkv2fC8LF8F08ftzZ1wPT4k5d6g7WkNUjZKRW+6Y2AGaeQjl+VYxglZNOQzg9ZzaOm0Aj1ZvKnGv/+TfsvJuOQWH37Vyhgyhna+5YzOVp+fQLVjSQ4cDQkTKt5jmonOWXdhEhfbZ95VzmuS1eBmFReGYifciJ8KIhj6GrZYzwPiA9RKM/hw0HgkSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D01tx361+ElDXtfVSXJdEqo4rsQsg8TLFJ9zQvgeIj4=;
 b=Z4+ZfLl/yZarkh9grsEmBenYHLnLNKqBCASUIJJq9OEivUZUK0sdIRFNP53RV7BXz0+FNDYB2NpNho3LyVzB/yh1jsXYQ+Oci48/h6vpDm32z7B/UM+gAZz4LhVGs47vmODNtsVXxDMaNgrrUSXpR0rnTy0wzHoz69WsUHHmcCERXBhsRz8g55bxPbLiRBQ7+R95VUvQETa7EKAZDFC7TZdQUNTn3rPPgSkI4w6cJoI6HJPzlwn3G1qmVLn0GmHtfJ+FGtIMDLFdyT58rN+R+YifBu1mWcVgHPtYxroZtjh7N2hOQTy03PKKLRCFdzsNVzoeb4Xz0YBDLm0cmooptw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D01tx361+ElDXtfVSXJdEqo4rsQsg8TLFJ9zQvgeIj4=;
 b=aih4a+QS1qJxoKa9R8KIFmyi+meDtGmqIQQ4PhNtbxe28Q2cvBqnjBnPBNlJj1Gy+gTXqWfZlgiGu3djO64xt/OHvte/74cXvkMMdM3VJ85KyEs1znhkWpqu7tCBETRo0oc5Tl4XDvUcK4iW+54Tq2UGYWP7BtKr5TwjqaPZIlFLanI/nDk2uANaT5gnqbjw0Ph8ybiOmTkuqEJnItTrFdmjkklMy51MqoWrDi02Mb1B6F1FuhiJPUGtNNqPvRVRI3/YKYNGR7FQjLbbbxW+BXKLkFrG8rTia/qIDde28k6mGwMUdDlUF/1HRVekYRVq0N6NU+QB7+vQq1LTl8dBpQ==
Received: from AM0PR04CA0144.eurprd04.prod.outlook.com (2603:10a6:208:55::49)
 by DU4PR10MB8830.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:567::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 09:16:38 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:208:55:cafe::40) by AM0PR04CA0144.outlook.office365.com
 (2603:10a6:208:55::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 09:16:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 09:16:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 09:43:15 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 09:43:03 +0100
Message-ID: <03dafc79-737d-4f51-8827-8d11c0797fcc@foss.st.com>
Date: Fri, 14 Nov 2025 09:43:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] ARM: dts: stm32: watchdog updates on stm32mp13x
 platforms
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20251031-iwdg1-v2-0-2dc6e0116725@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20251031-iwdg1-v2-0-2dc6e0116725@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9E:EE_|DU4PR10MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: 8653b1b2-7bf0-44af-5f8f-08de235e8445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1VGc3pDMkNWcmNJQkw3NjJjQWF2dm12bFJWelZwVERUOEFaRWVvckdyOHp6?=
 =?utf-8?B?TDNtV0I0ZzgxeWJCaE5GV3FJU3BkVWxBRzF6ejV4T2hiL3RTTGNQNzlsTXkw?=
 =?utf-8?B?aThWTGhxUytzQW1GU1Rmc2E4R3R4b1RJK2l0NEdiOW0vWlE0RVJkL1BUNGdr?=
 =?utf-8?B?amtFMytHYXd0cVQyRUhCdjFMTW5JRFRtR1o2WVd3SzZtUmx0blNoUHN4Nk5O?=
 =?utf-8?B?OUdRK1VlZFRwUEFnd3BPSlIyOERjL3RIQi9vSnUrS3ZNNzJ0QmxhUENmSHdn?=
 =?utf-8?B?NWU4R1NUbGlBMlN3R3JtYWplR2w3MmJxRGs1a1N5OEZzWnR2YkM4RDV2Sk0w?=
 =?utf-8?B?SDg1aTlKU2R1c2NyeGpkdENxZjE5Tkx0eXczK05kaTdwaVJJZ2lPcUQxWjd2?=
 =?utf-8?B?VHBiSDZsVCtiUEZKcm9SZkwwTmZWL2NZMCtBdUtlS0cwWkpaU2h2a3kxSGM3?=
 =?utf-8?B?M0oxRmxjcWx0NVhJS0JkR1NsbFExK0VsdnJLWFhJRklPMGJ5QTFCRUxjWFRh?=
 =?utf-8?B?U3RvcnFaRkhzem5USHpldTVobU56TmRtL0xuYXBySm9Lc00xTjljMk9TMTVT?=
 =?utf-8?B?R0dyQnZCeXZ3Qlh4N05DN1Z4NHFjNHI1L0lRQU9wTW9ad01BNGFjV05kRjBN?=
 =?utf-8?B?ekF3UE9zMGpYM3MvRFdqOTJwK1ZmMzNaK2VHVG1aK2s4QklPRXBzRDZGT214?=
 =?utf-8?B?MjFTZUxlR3J3eWtIejNkWlh4VGQzMDlvRnFlZ1oyaE90aTVZVm1HRFBFVDRt?=
 =?utf-8?B?NkZUYktDeGhrQllMRXo3N0l1bGg1ZldWWnpTYzFRSk44OWtNa1NQR2VTWVpz?=
 =?utf-8?B?UGdRNkZDZG5kQlVmMHVxNDFwVXVBWCtKMlp5V1lyb2xUTnRkckduRlc1Tnpq?=
 =?utf-8?B?eG5JUncwaGxpNEVadHllb3E3TERqbTNjdzFETzJkb241SU8vblRjeUtjY1Zq?=
 =?utf-8?B?cE4zRWNLd0Z1bHAzZVVEK1A0K0FJOVhBeUVISUdUMklCVEZ4NWY4VE1YQXlp?=
 =?utf-8?B?eTZqdkxzNWxPenpkNjZtSGVlTTA3ZnQxR0VEWFRBZFlmKzFZTFdXeFpDR3Qw?=
 =?utf-8?B?NzJYam5lY0IyQkdEWnc0RzlwNGc2NWNnc2hmclJicU5PNG5VVGZoRVc0eVJy?=
 =?utf-8?B?K0hQSjltU1hPRTlnSEpqU1phd0h5cHU3WjMwY0JEK292THRKSm9lUHphRnRS?=
 =?utf-8?B?R1V5NGFFYUxzcmt3aDBWQlRza01vY3VoZjlYSnJVYjZXSm56QldwM1AzcU5o?=
 =?utf-8?B?b1g1YWxWNndnNkpxUCttQ3lBd0VLQVhtYm41cHlCME00QmUvN0JZZE1aQXpJ?=
 =?utf-8?B?NCtiWXVzSVYyQ094b3hyRjFESlFjUUVuMVNnZjNQaHdhZkRPUjJiWk4ycitJ?=
 =?utf-8?B?VlV2WTg5S2hRNXVyb1V4ekpaNXZpSjNUVmZ6MWRHQldra2JONGd5L1ErSS85?=
 =?utf-8?B?UTlwWFJNeUx4QlRFeDFpMlE1MkVISHhvREtKdDhzL1IwM1N5NUsvSDlUcXhV?=
 =?utf-8?B?aFJLSkQvQW1FdFE3MHZtRStPbjNPV3hySDN4UExkODI3K2tGbHFVeDVKTnBR?=
 =?utf-8?B?NWc3b1UvZXBPUC8zNmRHRm5SMVUvLzQvZGZRNTlBTHkyTkUzSWF4UzZFMlBQ?=
 =?utf-8?B?N0tlL3p0d0g5NDJ6NHNCTkRDYm5vM1RFTUkxeHUxRmdHcUxNRk4rRFdLQk5V?=
 =?utf-8?B?dXRJa2x0SlA1NGJ3NGVkeitaeWN2OU9QVytSd3d3eVMxTUF0Q3hRQ2Mxbzk3?=
 =?utf-8?B?RTFBNXA5RW5SY1dIMm5OMTlNZHNYVFFoWFFUb29KKzAvZ2dRSjJETWh2OFFH?=
 =?utf-8?B?S21DdFgrMHExelg1VGlhTFpSSlVZbW4vL3h5OVlHT3FMcDZKRXJxSlRRMnQ1?=
 =?utf-8?B?WjlKNVN5eFJLeXdnY3BkbjVUSEcyb0Z4OTdYMmNRN1dxZWFLUXM3aUw2VXFl?=
 =?utf-8?B?Mkxha2Rpc2dYa2FTeXNZVXNkeEk4R0lLS3B1YUsxL011dFpJb0lhS2Q2VVUw?=
 =?utf-8?B?U2ZCam95SjlEWXBxR3h5ODFqSFQza1BMU1R3NW9keGVnMTFJRFdNVHhmZm92?=
 =?utf-8?B?eHhEWFEyR0poamlOQ1FyVUJNMDFHbmFUdWFtVGhCMnNFYk94cnprNHV0ZzVR?=
 =?utf-8?Q?uCYo=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 09:16:38.5356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8653b1b2-7bf0-44af-5f8f-08de235e8445
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8830
X-Proofpoint-ORIG-GUID: dKgsHT0UmdyOmkC59WZB3t-l-SXcMmvY
X-Authority-Analysis: v=2.4 cv=DPqCIiNb c=1 sm=1 tr=0 ts=6916f379 cx=c_pps
 a=OSeeJTVnBUJr8jItDWg01g==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=TP8aPCUxYTYA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8
 a=ZJun502b34-ZsPDsu8UA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA3MiBTYWx0ZWRfX3hyyDJz0kVuw
 Y6qxjb+S6tT4k+kuVffOg5wWz/JdT0icJe1+nq8upxX1P3g4YXW7/mQrU/nh7JFc0tad7NV76Ly
 BddBzxk1gESR1whl0yeYqoTGZgyy7/natfgRsdTxlgzhaU5dTGaYCdA6XQXT5qGwKVWSjFp33nL
 tdbWkC2MFXKLejmTAQ8RMDdVsEWTunKwQX00ZJbriRiLMnvi88jTkSbFcLJSxe0IZtvp/EHtIT0
 5zRA14xXg6lkIjmdglQpvOdqGw0+cofwBO6RXW3xMxSgi11XWrMvHhDrgEQMkBzmt4BCQlddHPO
 G/tTNZvmC+GUjJwX4RSKRtl1JZAeKper2Z03S/VFPEMwJXQg2DSzMJGKm4prIuxlAz8Kk4Bt4zy
 qSCAx9/+MwubOBQdS2zhmUzwuxMZXw==
X-Proofpoint-GUID: dKgsHT0UmdyOmkC59WZB3t-l-SXcMmvY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_011647_219011_7C0FC25F 
X-CRM114-Status: GOOD (  15.87  )
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

Hi Gatien

On 10/31/25 11:00, Gatien Chevallier wrote:
> The IWDG1 can be used to monitor the Cortex-A7's activity on stm32mp13x
> SoCs. Add the IWDG1 node in the stm32mp131.dtsi SoC device tree file
> in case this peripheral is configured as non-secure and managed by the
> Linux kernel.
> 
> Add the arm_wdt node in the stm32mp131.dtsi SoC device tree file in
> case the ARM SMC watchdog driver is necessary to interact with the
> platform watchdog (e.g: the IWDG1 is configured as secure).
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> Changes in v2:
> - Moved the IWDG1 under the ETZPC as is it securable. It should be
>    managed by the ETZPC bus.
> - Link to v1: https://lore.kernel.org/r/20250918-iwdg1-v1-0-02c2543c01a5@foss.st.com
> 
> ---
> Gatien Chevallier (4):
>        ARM: dts: stm32: add iwdg1 node in stm32mp131.dtsi
>        ARM: dts: stm32: add the ARM SMC watchdog in stm32mp131.dtsi
>        ARM: dts: stm32: enable the ARM SMC watchdog node in stm32mp135f-dk
>        ARM: dts: stm32: add the IWDG2 interrupt line in stm32mp131.dtsi
> 
>   arch/arm/boot/dts/st/stm32mp131.dtsi    | 17 +++++++++++++++++
>   arch/arm/boot/dts/st/stm32mp135f-dk.dts |  5 +++++
>   2 files changed, 22 insertions(+)
> ---
> base-commit: 53c18dc078bb6d9e9dfe2cc0671ab78588c44723
> change-id: 20250918-iwdg1-0f7ea155135e
> 
> Best regards,

Series applied on stm32-next.

Thanks
Alex


