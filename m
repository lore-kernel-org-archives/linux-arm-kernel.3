Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D2AD1D47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SF0UWeoSnacQTD8eAYQhk+ftRZOyKRuvl7KsAcW1dw=; b=1iYudUO1aImgXbuWWlC+saLke4
	pVzLmHp2k+HSIx3C+/l1bv9VWgMUlukwog0ODsgXupi7S0ZxpXPcYQ6BKoYyazNHkvRWy+aF5ELs2
	CbB5ybDHpHsQdE5Ah7/bzgAB+AAbNfcARxTr4NGbAUFTbchIXRAsv6s8KjZrS3p6Rs2GZOvV/m8+9
	65RR8dsf01RxLWW/XZPGAFJa8DwaJ3ND4kytWl6nl/MccxAYYTLMyYOtucQq02RUHwlAzuiJDiT6U
	5cbdkpfX6fSffFcySW3/t57pHCJ5if6gESpkTSgpBMwk3vBP0QMQlJ9ToLiSoND2Z+69X88unp4QA
	MO2GkqhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsST-000000002AN-2yQu;
	Thu, 08 Jan 2026 16:01:57 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsSP-0000000022P-1vq7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:01:55 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608FwgS33116119;
	Thu, 8 Jan 2026 17:01:40 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013000.outbound.protection.outlook.com [52.101.83.0])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bhb7pfxcw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 17:01:39 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEmN14vChxV5MEiyYdkINGdb8F8tuixTUZuI0WTWwKmulHqdeRw9w6JY2SzI15DSyudIP1ARINUyAcKT5wiTx0mLZaDXzCIvWu9XblRbLN7IOZobVhqLo77sLYpUuKi9vxh2I4Xhh9yxEeX3DktSOSuYwlOJvwfzJQ9mcPjklfqrPYZUQGUujzYCbdGWtjIPp18YRLVG262nKeW/Z/U03EaimzExLaGH5Rrgw0oqE/p4j9dRGENBKXuNnEVhKIOa80H/ORDFJItxkL7xE6bQ8LLMteV5TxGqeb50TTE58sNvvRh+p0gahyVdLlWFqpWdtMuMAe0agvWbA1LS2ZpLNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SF0UWeoSnacQTD8eAYQhk+ftRZOyKRuvl7KsAcW1dw=;
 b=YsRzcsuE/mvqMtZFFX1Z43IJ2wq7Y3cfIQbiPei0ytzsgiMb7K6uSLNC45vGQAvLfrrPy7MXgW8vkbTZ46HszkFdkM2bu90CRmMDcx2MIILIu1wkXzCF0QY2fxrY/E69tlA3zVdIFQI8GTQLqvEWQgrSeaxv3IIC/2drhfp/Hc1JCNlWkwQkyJ9hdhduZdFdjSxOB1rod65KaF/kRtn5Xk9zD6ifIa7QItemr2JRrVa+mr5DjKWx018rF7gEXATcynOawZ0Ecf26qJX2MtLrDWeM8TevUgtOaNJFTU9AFgVyhrF07EKnGJdUCiwamGaE5vev6LNfTk9CPvuCO2VxwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SF0UWeoSnacQTD8eAYQhk+ftRZOyKRuvl7KsAcW1dw=;
 b=gKH9AFL4zMlvWSOrWbgBelw5gaHlfVuzrvyG0UKFKp5LLf5laNRHt7pZ7bdtSH8HobJnK/lk0oGzkGIOKWvjrgPgELASBVS93pQvwJ4SAeGETM33shdngi1xXEbD8bJUGE8HjGbpWgpiiqkrY9E3bDMZBDlWvfk4YpBn6h45VOBRpqNw6An/RHr9KnZJgdd4sE4zMSln72mf+ePoWKoDdleUwoTB+MaevS9eaSOMlLbcGKOWIXjftB1/e9tRB7HtBIgwN5yEReVB5Pu14TzzC4pVy7nkCyLPApPQDX9mU0S96bzdaCPuFJCCjeGfLGhch9U+CpVHMdWcElePiUr6wA==
Received: from DB3PR08CA0022.eurprd08.prod.outlook.com (2603:10a6:8::35) by
 PR3PR10MB3930.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4a::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.5; Thu, 8 Jan 2026 16:01:35 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:8:0:cafe::fb) by DB3PR08CA0022.outlook.office365.com
 (2603:10a6:8::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 16:01:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 16:01:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 17:02:51 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 17:01:34 +0100
Message-ID: <d26f0460-78f3-4ac9-a4ad-1c6692dae167@foss.st.com>
Date: Thu, 8 Jan 2026 17:01:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/16] Led update for STMicrolectronics boards
To: Patrice Chotard <patrice.chotard@foss.st.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20251113-upstream_update_led_nodes-v2-0-45090db9e2e5@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20251113-upstream_update_led_nodes-v2-0-45090db9e2e5@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9A:EE_|PR3PR10MB3930:EE_
X-MS-Office365-Filtering-Correlation-Id: bdfd1dac-a2de-49d5-bd37-08de4ecf330e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkVWaFNhTjRTS1RnaENWaUJUYVVRa0t5NjZvb3dETDlxQ295cWJyS1RLVU5o?=
 =?utf-8?B?dkpoNmcwaGpOT2NhT2VBQVFFQlhBMlRtSjRTeDRBUDJaa2NBS0F2ckkyMlZ5?=
 =?utf-8?B?dGIrdlh0aDNwRjlRLzlwMDVwOTRCb2lZWm81RVBycGg0cUxLUk1kaGJMMlZx?=
 =?utf-8?B?aWw0bXVvN21wQlFtNzJFTXdWbk1ndnVudlRCUU5kQ3BLVVZzZzdvRm9Tc2Fs?=
 =?utf-8?B?SjMrUEdQRysyWmxkWDlPei9tUkZJVEsrVTBuQkVOdkpQYzNobVBBMml3WkRt?=
 =?utf-8?B?QmpOcDlYNzdLbXpRSFdqR1BQZzZyM2NqazVxRUgra1BRUkxRelk3OCtCUnUv?=
 =?utf-8?B?VU0vVTEyNHhFejYycE1TRU4zVDBFenRFS1lSVUFyRHowaEI4RjYydXJFbWMr?=
 =?utf-8?B?TlZ2OHZLQ25qa290dlUvREhVNk9qRXBmVFJ4L3dXWUZRTUpTS0ticm9LK0xv?=
 =?utf-8?B?RUIyUGI1WlNVUW9qQmlJekdyRDFGdHE0MFJqOEpLWEFLYUlkQWFKT1krVnpW?=
 =?utf-8?B?aUYzU204NXgwQ2NOSGFHVGxiSG5KYW9aMldEcmdvUEVGSS93RzB5U0loUENj?=
 =?utf-8?B?UDJkMjY0bXVQNUtoZkNWNEc3eHJsZEJJT2thSjNhQ3VEc3BMNUpwYmlEUE5s?=
 =?utf-8?B?cE1ETmdWc0FnaGlrN3NZbkxEVCsyV3JvUTFQQ0NydHl6TGNiWEhkQUMxZVhj?=
 =?utf-8?B?RDNINXBqcWUrZ2hEcE1QUG1QSGFXc3N0b2tMWmhhYW5SakRxL0FFaW14WWEr?=
 =?utf-8?B?MkIwek1BbGFxRVdZVzM5WG92eUkzZzUrYXVsSXNhbk9UM1hBRkJ1ZnpSQll4?=
 =?utf-8?B?TEZEays5Y1hIc0hRSjZzd2RXYmtrREZJNU9zNUN1MlZiWGRSZEQ5bWJsWUVY?=
 =?utf-8?B?TWhEZzJlRXpUZzZING1XUmwxbE55cFc3ek5obWRkR2FqMGMySDlFNFFpZ21X?=
 =?utf-8?B?Y2Y4bmk3SHdSRHB1ZUFmYWhVenlsK0JSKzFtVmNqMldleXRpcVV5RUtQUUJS?=
 =?utf-8?B?UUlvL2huVG1TVjFaa01ndUg1MFowbWdwQjZyOW5Bd3cyZkd1L2YvL2tlVUlk?=
 =?utf-8?B?WUpRZmVrRHBpdVRjYzZ3OHpUYkZiQm53Mk04ak9nd1FvN2hKVTJRemo4WmdS?=
 =?utf-8?B?SE8rWVBsbDl1VDcrT01FZGtINnRLbmNMN0o4c2VleW9hUVAxekU4ZDNreWI2?=
 =?utf-8?B?MUgySnI1Q2UwSHphUEkvcWVFZC8yQ2VEY0Vrc1BicU10a3piSHNBSmFhTmtQ?=
 =?utf-8?B?eTRzS05WZ3l2RVMwVWppWEJlWlRYWHUvdXVaTVdoN2RYamFRa2NoeE1aS2F3?=
 =?utf-8?B?eWZIYzJITkZwb3ByTW5HQlVRcEU5WndBYXB5Z3BSajJ5L2JRN3pEV0NOWEZ0?=
 =?utf-8?B?dTFvcDIwUVYvQTZXMzFaZjh6Tkpqa1Q3eUJOdmMyc1BNY3hNeklhRVI0SDcy?=
 =?utf-8?B?dEtBQllPYmtrdnQwR0FVbnQzaXEyYzBuY1I4d1V6RjVsTS9JOGJIKzJaRzZK?=
 =?utf-8?B?UDhWWStDaElKOUNCakVxTjZMWFNOWUY0VTRrU0YvN1lKOHJleUVkdEZRcHdn?=
 =?utf-8?B?UkNuV3hQaDg2YjJmRkFVLy9kU3QrZy9nV0huN3ZIY085cWNvY0p0TlE1dW0r?=
 =?utf-8?B?bFBldXBPOEZCTEJJTGVZWWVGVWRYUlZvMTVFaEUxY2FSazVmVmdnbGh3aFNW?=
 =?utf-8?B?ZUd1NlYwSlZsWWRIbnc5WHY1VjFYaEljMW1QbXowOUd3U3o1M2lGcTRBRDVF?=
 =?utf-8?B?dElvU3cvaUF3Z2ZQVzl6UjBtbjBEdWVENDRRcy9VSnlsK1F5VEVjYXFSUDM0?=
 =?utf-8?B?MnRLbEVwZ242b2hNbVZCamZuVmxEZlBnTlduTUFtZjdVYzE4UXRaYzR4M3VN?=
 =?utf-8?B?Y2tGSm5VM2oyWHdadmVVNWJuU0dIWFFUd1JnNm1GVHNnTUxwVzhVVDJ6bVQ4?=
 =?utf-8?B?aFBselp1NUxlbzIwTmpZazgyS0RjOEhZMjZYZ1l1VWdDK09TWTJnZDE4K0Nz?=
 =?utf-8?B?bFdCcGJVblc4M3RPYnpIOFd4YmdXSDdtSjVhS01YUGp5ZGxrRXkyL3hFVVBX?=
 =?utf-8?B?Nmp0cStGUVR5UWNLNjhnODBwUVN6ODZqSytyaGNQdUFaUlJLajB4ZW15M3lS?=
 =?utf-8?Q?vq4g=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 16:01:35.3868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdfd1dac-a2de-49d5-bd37-08de4ecf330e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3930
X-Proofpoint-GUID: 6pr-r_6GmFk8d7KXctGp9AFRkcZY1ncf
X-Proofpoint-ORIG-GUID: 6pr-r_6GmFk8d7KXctGp9AFRkcZY1ncf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDExNiBTYWx0ZWRfXwv6RnNelBDhI
 JAQi1Gfl2I7JuXVvvlVyuKcLTCzuzlUFpx7NnNeVwDyViG9D/YzlQMJoy/3iIJ0/HU7nyPyoeyr
 DlDGNB5PoKlQsqdKd3q5syvBPDKbxw/JD7MZKY88XFKGr49HOKHyvG9DqLgwndppWB4spX33ZkK
 yD3QvdLnpDOKgrsGCs4fmpnEFo7k3Qb8j+bjuTiCUs26LLexIHsrR932a16XIjc7QkbjWBIvyt8
 ydCYT2HOo3vxyYRCOahF7UxO+umerikuNbtPUJxCUAsZ9tFc+gK+5z4LE2icxSaRaujcYylEeOP
 obW/4chppfF/x5EfH6NE4CUBg31Usa4ZPJ0usuYjHChGxgOpcJErNdBVTBg6C1I7L6mXGEOmeTI
 jKYoGOA7Czg8zAf3UZ+4yD5bIaWVJSJUNR84SS+/XQlFxNduPsa+YFRDAU3BcopT9W7c3BVKzAl
 xCm2jZSf71j6+Jy+2eQ==
X-Authority-Analysis: v=2.4 cv=DZ8aa/tW c=1 sm=1 tr=0 ts=695fd4e3 cx=c_pps
 a=nByTnSNBlmrEcbo/XTjLTw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=TP8aPCUxYTYA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=z_SYt2vzrexs4cdNV_8A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_080153_825849_8F3832B4 
X-CRM114-Status: GOOD (  13.25  )
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

Hi Patrice

On 11/13/25 16:13, Patrice Chotard wrote:
> This series adds/updates LED nodes for STMicroelectronics boards by
> adding new LED nodes and function/color properties.
> 
> On STM32 MCUs boards (F4/F7 and H7 series) green LED is
> used as heartbeat.
> 
> On STM32MP1/2, blue LED is used as heartbeat.
> 
> On STM32MP1, red LED is used as status LED.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> Changes in v2:
> - Fix compilation error for arch/arm/boot/dts/st/stm32429i-eval.dts
> 
> ---
> Patrice Chotard (16):
>        ARM: dts: stm32: reorder nodes for stm32429i-eval
>        ARM: dts: stm32: Update LED nodes for stm32429i-eval
>        ARM: dts: stm32: Update LED nodes for stm32f429-disco
>        ARM: dts: stm32: Update LED nodes for stm32f469-disco
>        ARM: dts: stm32: Update LED node for stm32f746-disco
>        ARM: dts: stm32: Update LED nodes for stm32f769-disco
>        ARM: dts: stm32: Update LED nodes for stm32746g-eval
>        ARM: dts: stm32: Add LED support for stm32h743i-disco
>        ARM: dts: stm32: Add LED support for stm32h743i-eval
>        ARM: dts: stm32: Update LED nodes for stm32h747i-disco
>        ARM: dts: stm32: Add red LED for stm32mp135f-dk board
>        ARM: dts: stm32: Add red LED for stm32mp157c-ed1 board
>        ARM: dts: stm32: Update LED node for stm32mp15xx-dkx board
>        arm64: dts: st: Add green and orange LED for stm32mp235f-dk
>        arm64: dts: st: Add green and orange LED for stm32mp257f-dk
>        arm64: dts: st: Add green and orange LED for stm32mp235f-dk
> 
>   arch/arm/boot/dts/st/stm32429i-eval.dts    | 64 ++++++++++++++++--------------
>   arch/arm/boot/dts/st/stm32746g-eval.dts    |  6 +++
>   arch/arm/boot/dts/st/stm32f429-disco.dts   |  6 ++-
>   arch/arm/boot/dts/st/stm32f469-disco.dts   |  6 +++
>   arch/arm/boot/dts/st/stm32f746-disco.dts   |  3 ++
>   arch/arm/boot/dts/st/stm32f769-disco.dts   |  5 +++
>   arch/arm/boot/dts/st/stm32h743i-disco.dts  | 27 +++++++++++++
>   arch/arm/boot/dts/st/stm32h743i-eval.dts   | 18 +++++++++
>   arch/arm/boot/dts/st/stm32h747i-disco.dts  |  6 +++
>   arch/arm/boot/dts/st/stm32mp135f-dk.dts    |  6 +++
>   arch/arm/boot/dts/st/stm32mp157c-ed1.dts   |  6 +++
>   arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi  | 10 ++++-
>   arch/arm64/boot/dts/st/stm32mp235f-dk.dts  | 10 +++++
>   arch/arm64/boot/dts/st/stm32mp257f-dk.dts  | 10 +++++
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 23 +++++++++++
>   15 files changed, 175 insertions(+), 31 deletions(-)
> ---
> base-commit: 53c18dc078bb6d9e9dfe2cc0671ab78588c44723
> change-id: 20251112-upstream_update_led_nodes-30e8ca390161
> 
> Best regards,

Series applied as is on stm32-next. I'll probably squash those patches 
for my PR.

Regards
Alex

