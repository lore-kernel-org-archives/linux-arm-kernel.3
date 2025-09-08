Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A92BCAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcmzbjGdSV43TSn9hWtfad8Dd1ljA//VweD7HsC5AIQ=; b=tj27ag1ywJxGjdDzFfZMRDy+g+
	Hacp5MSM2aGDJsw1dDCn16eXpLuW7dtbN7K2W5DsNPHrOpQGB26xphKO6iJiBDPwEvbqTI0IHNfCO
	xcJQK1pOCMTxmPni9COGNAb1d9xZD1lfNFGr/qvNTLaoqS4a8rifNEUqEuTfi9B2CKJbqERnwe6qD
	uRPq3VHuY6WvtwjKyGw3O0ogY8xp3cbVMG2FXBR+QLPnvmoz9HPnA/qpHk+6cU1AFag2sxBEk3Fkt
	AyHwuCVUOhz8BPcfe1lSNRedN1BndCnOiMvSvgUQB9DV4HbEFDP4MzYqP5tMU+9pK1b+KAnxKQEnC
	hH5QFMGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfMt-000000012aQ-3bBi;
	Mon, 08 Sep 2025 17:09:28 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbSj-0000000HD5W-1frr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 12:59:15 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588C7A7Z000554;
	Mon, 8 Sep 2025 14:58:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	LcmzbjGdSV43TSn9hWtfad8Dd1ljA//VweD7HsC5AIQ=; b=E7pHDMoFyXt23onE
	EkgL5Jj9agsTLDkjREb0ezpORr4FhScHN3tQZ/WGQWmq+CFLg151HabieyZITYNH
	veLZKU4KmlUh3cUjw2XCYRKyL6HE6rsLV6hB2hT6MTl+9Hr//8wLpOWtJdTYX6O6
	J0OSJnWHYq36277E3WS9x+Oo8BQPiab21h3HHwc9kGHzixmpynUrOhpUtMMSedxH
	BYpfC9+HwM0uDO44/X6YZISeBmQl+O5PyniF/vZe4ixxstHs25iIe2mc3dtZNUQ+
	L1LK5+U3YRvZAkekjI6CFPUK9nO7H4DKDdRw4z9T5vNVwNhtpjPPu1+Ccq4otLUe
	aa/o+g==
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 490a37xxy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 14:58:34 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yl2US6NDiUQ/MqZ5BK6ZRb3aowN17WqM06uYx/NyJOdns1jd85DJsAQqSyqqebjJEhDJh1Rwu2H8DHvmyayWxz5EexOnvpHqE90WyyDDEI/gRtPfJTjCM3vi4lXkL30Klu0AzMBBNBdRR1MsTPzgzO0ZIjwJ0Zr8URoiU28b3QOFYVlHPLRjxGbyLswC4iq1E3uOBb/BDP5S2/5/QQtqEnbv0+8CnwVyP0tME7Mz0AgVswhtqWMZC98GIa+YoH1Ex7F+uvSQFE5raPJUEXuCq+KjzV1qfEeRYDs9U5vPVvXdJ3zp0N6Te5Y3Hc20gDyHUfzyWh0j6yDaoE8SZWRzwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcmzbjGdSV43TSn9hWtfad8Dd1ljA//VweD7HsC5AIQ=;
 b=dwWTP1rGRtsL8hvRrx6iME+JQQhzl+uE0ACgBAbQZWJLbXjbDU06nVOGDrnwUGP8Cr/d6AbpG7T2tqU/w1jzsnC6srWYFKNgUAu7V56GcytL1TTd/KTbzkCwoYgTNRKDumxoW87lXxQXpnr9ZCUUgYuE9c94mBYB4KlBL5Y+8MRjLP7Y6IhKfYX45PP0AatVfyLVi0+G43NjJP4mxPhQuHQV//lFUX4eTEHXZjJXE50xhaU6SBWghRdspQ12ppch0cZtIPLHDjqTkvFPOf2QecG3p5hwezZsaLCwut03gLSfWd9a+kC94NxrBBxz5IKRDxx9OzVzZJw4PiZa2Vxbeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcmzbjGdSV43TSn9hWtfad8Dd1ljA//VweD7HsC5AIQ=;
 b=JWZetut/2MvToYXIjZoAWYxzBe0k98SrFSPnmt025LtddGrzZ/TZkiI+DXoxSxF5JcHP9LQoMjZJ7VaYexpWwUX12oCjhksa/KYPa0GMpS16ubFhDD9M43IJ8IVf8ZVp86boudhtkp/uWIXKWzuLCzkQyh/e4wSaad9XC4hkkm0=
Received: from CWLP123CA0210.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19d::19)
 by AM7PR10MB3143.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:103::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 12:58:30 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:400:19d:cafe::53) by CWLP123CA0210.outlook.office365.com
 (2603:10a6:400:19d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 12:58:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Mon, 8 Sep 2025 12:58:29 +0000
Received: from SHFDAG1NODE3.st.com (10.75.129.71) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 8 Sep
 2025 14:51:18 +0200
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 8 Sep
 2025 14:58:28 +0200
Message-ID: <12fb9af9-3d32-40ba-b30e-ef72a3d07669@foss.st.com>
Date: Mon, 8 Sep 2025 14:58:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christian Bruel <christian.bruel@foss.st.com>
Subject: Re: [PATCH v2] irqchip: gic-v2m: Handle Multiple MSI base IRQ
 Alignment
To: Marc Zyngier <maz@kernel.org>
CC: <tglx@linutronix.de>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <mani@kernel.org>
References: <20250902091045.220847-1-christian.bruel@foss.st.com>
 <87tt1izhkp.wl-maz@kernel.org>
Content-Language: en-US
In-Reply-To: <87tt1izhkp.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B2:EE_|AM7PR10MB3143:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a2b21cd-7318-4cf9-8679-08ddeed76869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEpVSVhHNDdUaG41cnd3ZTRTWHNDTWlOcHdKUjl5Qm9NMHNYMGx5OHh5TFIy?=
 =?utf-8?B?Y3FiUXF3T1laNTBEOFZOdW1CbUdod3kwcklKelB6U2FBakhPWjN0aXpNMlVr?=
 =?utf-8?B?bmRlbmpiSUlqVk5YcHhmVFVkcEptbmZZcnBuL3R3aUkxRWFuZFNCakdMbzRh?=
 =?utf-8?B?NUpwWGNQejRnR1dKU3F3cjdkSHB6eTVYQkNBNVdmYlBNU0JZNDBYT3c4Vm9J?=
 =?utf-8?B?VkxqbXVtdFpDTkpLNXhrZkl6aVZiRUQyN1YwMnA0UkprSXNKMXBXamRWcWZ5?=
 =?utf-8?B?eWIzUkdNVFdUSHE3bUVmUFNmUTFmakEzamFHVEZ0SG9Va1ZyanZuK2FseWd1?=
 =?utf-8?B?bzFVcjdIaDdKbTllR1dxY2cvRW9MWTA4am9yTzQ4QUE3V3V3U0tFcERxUHAz?=
 =?utf-8?B?ZGM2SHkwT2YxQnBXZlJGd3U1cUI3THZROThLc1kwYXcwR3ljdmdZNEtlVE1x?=
 =?utf-8?B?M3BicTJ2Qml4R3l3ajV3Y2c3Lzd3dS8vUGpXWStQUlZDUGREaGZZK3FWZzVD?=
 =?utf-8?B?NmRTZ1k5VGdBNFFrc0lLdEE5Tlp4bGV5UHd2N012VmcvL0FKNjU0WGVjbWVN?=
 =?utf-8?B?SGxvd09MWGh5Vm9qUmlUUEh0dWVTSXd3UzFoSDJ0SHZqZGd3YnUzYjE2bzhB?=
 =?utf-8?B?N0ZiNWFwMjFSQzNlbjNBMHVsOW94OUZjaXE1b0o1dU95MDllZlpYQ0JFZ3BW?=
 =?utf-8?B?UjFNVlRGZHE4c1VwbGMrN3FtdDlVOFBnaGt6RExwUnhtekJCRjBXWHVLbGk1?=
 =?utf-8?B?RW5qYnVuaDc1OFZkOElpYlJQa0UvcjJDd2kzd09idmZpSERtbW00RDFLMi9j?=
 =?utf-8?B?UnhiSDkrSURocVB0WWtJc2orY0JBMEhIYTVPNklLRDhIemllaEYrVU9hMDZG?=
 =?utf-8?B?VVFmOU9mWllGU3liSnllODNmQ2hpd0lyRmpqT1NOc0tkQ0syK21qSHp5SEs5?=
 =?utf-8?B?RjRxbXd4TXpuTTl2clg3Y2RTZElaSFpvc1c4VFFIVlZ1SDQwblg0OW93eE5N?=
 =?utf-8?B?U3IzWkJiZ05xSjZvMFRONmdrQjdWa25IMUNRTWp6VlR1eGRGZnNuRmZZbTVG?=
 =?utf-8?B?NFlwQ0xPaSs0M3ZmbnFwSGNmZi9iWWNEbFoxSmhEUnRCQXY0amFxalY0QjF6?=
 =?utf-8?B?cFBMZWNLMzZoakEzYVBleWhPYm5TU25KSy90Q0huNldxQ09mWXhuVWtRZXY4?=
 =?utf-8?B?Vjd3cGcyQkZFZEhrT1ZWM1dHcmFvNERIQXlja0VRNmt1cG9UVlJjSjJiVVdG?=
 =?utf-8?B?cUtNamNYNjd6bi9mQ3NLVkdZZTJLajFiRVFNM3BxNmdhbmRNVWNSUW95S3hK?=
 =?utf-8?B?MXRUOG5peGVYSXQzRndMbEw3VjFhNkh3QTFtSWVvbEFaeitsYmVqU2t1ekZI?=
 =?utf-8?B?aGFzTTNvSGUzWXpwcUdUQ1N6T1ByUGZ2Tm40VkJqNWozaENTRVRxWnh0SDNm?=
 =?utf-8?B?L2FwMW9qZjhPQXVLdEpPWExpeXFITUtaNFB4UGsrWndzKzIvK21hdUZKMkpz?=
 =?utf-8?B?R2RMZmtZTTZTaDJISDhndm5BU1RwWjVWeGxucnVheGgycEpOTkVhbHA2Q2JN?=
 =?utf-8?B?WXVYWm5oa1ZORC9VL01BMmFpYU16akdmRXJPWjJKRnFlTm54QTJmL29MZFo0?=
 =?utf-8?B?aGhHR0dsbjlQN0lhYlZHbG5LK0JyeXJqd3RYZmxiWEVjTkZxekFnQ0N5eERm?=
 =?utf-8?B?d2g3bUcrVXdqWUlmZlpmQjlHRmllQWJ5N1J3S1h3Tjh2VFl2aXBPSllOaEM4?=
 =?utf-8?B?SEg2MkdTbFBBdHRTTnpPZFpENXQrZ1ovL01ZMUtXVUFIS0hwbnc0K2dnbmdY?=
 =?utf-8?B?WG9ESTZ0YTRmV05SZjIxVGJMcC9td1Vib3VMMDJRZDJMdCtYMCt5VFJDVytJ?=
 =?utf-8?B?OFNvL0UwdnJ0TTNMeVRXOTd0YWFsL3g1aXRGbm9xQVNwN3VmRzk4M1lYeTBu?=
 =?utf-8?B?Vk1VbFFNYkRYQkNWeCsvTmgrQmxLOTMwTzlHbzJxZUFkSElqejd4M2FrM1Bp?=
 =?utf-8?B?WkVZS2RPQkdndGkzRWZPTC9VUmo0OStSdG5pU0p2by94dkZ6alFCajVSbVJH?=
 =?utf-8?Q?ku7Ru/?=
X-Forefront-Antispam-Report: CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 12:58:29.2764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2b21cd-7318-4cf9-8679-08ddeed76869
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3143
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDIzNyBTYWx0ZWRfXzfvQgodxwdcy wXEKtYylFQlV842DWckugo4kzkIBwpO65pE34boNdVL7d5XiEE4ie++oj8iM9tKnrmmhJvKir/C z5q3OS18nS46dKoa9KjHKxRlyQ/C7WZbbXG251F8NEkFTOA7ghacK4uNz0eB+3sh76qPhMyhvgS
 JRjNSAKDwQ3WOxcZb7dzo3KCeeXhJP3KA/16lhkacuiNITbFrUwWQSwLjy7DIbYjytAnYVsIlpT JJ5RpcDYgRqR0gSXGbvm/aRPusxv7mbmWBZHbUYxJhV+tWXqaPxCy/rmqpjtJ0gogwenfPVN/0O SeLaxP0EqqAhW2i0WkechuJc7h98bfEmNutcgcSuBi1hNyywvn+NGFgUs0hkhsHxGl2f4OArLwi IU8PeMln
X-Proofpoint-GUID: vVcWFA29vojZJv0EvNFtOkt6mzVOM0FJ
X-Proofpoint-ORIG-GUID: vVcWFA29vojZJv0EvNFtOkt6mzVOM0FJ
X-Authority-Analysis: v=2.4 cv=WLB/XmsR c=1 sm=1 tr=0 ts=68bed2fa cx=c_pps a=UbmQIC3lcl3QVQAAqiiJ5w==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=RA8ZoFPxCIQA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=ve0JAh34pgqQSo_yLtUA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_04,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 clxscore=1011 adultscore=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2509050237
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_055913_930772_48376410 
X-CRM114-Status: UNSURE (   5.47  )
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



On 9/4/25 11:35, Marc Zyngier wrote:
> This is actually v3, right?

yes, I mistakenly used the wrong versioning. The first revised patch 
should haven been v2, not v1.

sorry for the confusion

Christian

