Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450DBD1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+WiGQvEP3fwQVH9VeiuV4q3ot0NWvMyX+Z6x8Pm6TM=; b=IAKPxzvunCd6fyXuMpkgNclhZo
	wO5e/8DTddY7TKyjkrWTN2g9QRkeS50atuaZhtMVQuQDnmwSRh4mIeojzpmr4NluDxxrbeRyI3Pzv
	ZKpUa00jG2sdJunyRRXApSOTm5o4m+JEdyBPXscbXhkS509iMvprCmhXJqcmJOxCrFXQJZrhGQiVh
	eFPhiQ477bYrVM/0JWnmjmrfIKSdhDzNXw/U6Bx99+eNKlyp650F+dMLs4dgudKHIymXkC+Ytq1OC
	6J/fEDv9bTdoFDLavRN4bTpfyK+a8ryyVOTZ/qVz4S3s8ulWDHoq8WPH78la3s1LiewQ9ADltZlsd
	oBRinU2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsgx-000000005Zy-1fCJ;
	Thu, 08 Jan 2026 16:16:55 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsgu-000000005ZS-0etM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:16:53 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608GG8cU2711012;
	Thu, 8 Jan 2026 17:16:41 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011052.outbound.protection.outlook.com [52.101.65.52])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bh7mkrcsf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 17:16:40 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2rpWiyiJTA9mSCyjOva6i7v8O9/FfPsu1zASrD4WBuUe+nM0moOTNuJxCyhZq3UkyhGJBHVABdchb9mX3hFtrqtDlZJTe4kpAslwhASjp+i0xIdf/7wp5RfiAm1a0+7sqdyBYg5VyhKL5oA+FqxP+0ImgfadhmIcdq7EUKXZ6LBzweBE+eX2IKbfe6xjuHQbUNGm5GYFfVdNCe6LMhF4/HigD2UKNBCQf5ArmlskEDc2kPDYDpvMN5a4efIxuB6BLGNYcfT9ZqMhsJqqpt4g0iBgJRwtLWZqbzGvG3y+y+5/5bVpy914Z6dBQL0UfjemQPhTxuFwIzVKR3O1Dvnug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+WiGQvEP3fwQVH9VeiuV4q3ot0NWvMyX+Z6x8Pm6TM=;
 b=h7iPjnHiU7qy1sdRE9E/n2NI4iUHlRfdCDzrRa4vyxNryhCIl9GGY76j12RZasrXHRcS8BdJG8UugoU8JHMZsI+vlMkFtXD+YvGyqJN0ZrjF8UEFasMqkSVwZD+cYNYNbXeXL1zuClbuywybCZyiP5xWIkbZrgRMA4VT0Xx6cZrK8RjV08bBNb5V9qC5er2rKTTX6oFbIQ02+ib/quKrIwhk8H8DwtXxJ0YGlG4mQcPlCKPKHPcqIhqL/RhOQJE3CbV+EBmP9irrzdzwA3+4/1ik8WiHQYmhSiUCuknnvs5jY/69TBuqtzUnxDSxJDWCn4wlhzVITdBooum2Ypid6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+WiGQvEP3fwQVH9VeiuV4q3ot0NWvMyX+Z6x8Pm6TM=;
 b=Tg1vCi42TnDqMKyGt8ub4nrR7mBt1YZvfpKEYY76q8sf2vyFHFXlfAvoIXLTKKEwZoSZ7YTTAcn3PHdc9JotodCrEp4awD1KFWWUHEPsMJOEg3p5E/LJNqCC38dMBMX9m0EVV2MMw6k9m1SHKN9wB07LSg22EdJChQiCcSpzXpgPtZZiO2Qef4KihNy3NEleKz/T4tcwzPESVxxgMBPIXC737W0LBKwvniWI4/PwAbM2WaJh+pMm1IbO4kF+qFb/ym09K4agbJjR7jaM/PUHD0XgkfOg3O9NPHLgMrxeacERMiOd4sxmIjxyjRFWSSylKNWZCQS+bfWZY89xNu+DCg==
Received: from AS4P189CA0027.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::16)
 by DB9PR10MB7313.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 16:16:37 +0000
Received: from AMS0EPF000001A1.eurprd05.prod.outlook.com
 (2603:10a6:20b:5db:cafe::d) by AS4P189CA0027.outlook.office365.com
 (2603:10a6:20b:5db::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 16:16:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001A1.mail.protection.outlook.com (10.167.16.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 16:16:37 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 8 Jan
 2026 17:17:51 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 17:16:36 +0100
Message-ID: <6f9041d1-fd3c-4fba-ade8-f91f0d760921@foss.st.com>
Date: Thu, 8 Jan 2026 17:16:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: st: Add boot phase tags for
 STMicroelectronics mp2 boards
To: Patrice Chotard <patrice.chotard@foss.st.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Patrick
 Delaunay" <patrick.delaunay@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20251114-upstream_uboot_properties-v2-0-3784ff668ae0@foss.st.com>
 <20251114-upstream_uboot_properties-v2-6-3784ff668ae0@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20251114-upstream_uboot_properties-v2-6-3784ff668ae0@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A1:EE_|DB9PR10MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: a3115061-02c9-4b64-1ee4-08de4ed14cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elhiWWZlTkowSitoQUtSNGJGV3M5cjFMa3F5WG9ZSE1ScC9mYzlRbk9FenNC?=
 =?utf-8?B?RUpNbUxFeGYwY1ozbVJLa3BqY3lsd2g4YUdYSlA5MjU2TGlueU9BY0dMVmdM?=
 =?utf-8?B?V1BGdXBWMnNPdm1FMUc5bm5UY2laV3NmSmxXZXJxa2tkdHRVeTVxMkU0MFlK?=
 =?utf-8?B?bTd5WXRvTzFPYmRJcmQ4bVAzYS9Bd3BhNTZBTkRNazZEMWVOZXRYaFRFNXh4?=
 =?utf-8?B?K1NmbjF6S0N3cnZXYmphRXR6dzFlU0huMFdUT2U0UTRXSk1JUFVUbVNyMGsv?=
 =?utf-8?B?SlVkOVNLOXJJcDNwOE1aV1JvWkMyKzh1VUk1VHRTK1Q0SVNzTWlJQlcxYzFO?=
 =?utf-8?B?akpHY0QyY3IreTdXZ2pUOGJaR01TYWlIMHBNcUEvVGptZVdmVlkwb2lSL3Jt?=
 =?utf-8?B?aUlYbXRLVEZOSzFsbFc5eUJRQWdwVmNndTFubmFHV0tXV1VEbXUrY2xqVEVJ?=
 =?utf-8?B?VVhwcVYralZJeXRmdzJCMm9qd013UWpzWjhGS0taM29oTzdDbE8xTU4rMmov?=
 =?utf-8?B?VjN6VjEzb21ST2JQWVcwYzNJbmJVa3pOOXRUUE5XT0pLY3ZrY1NiQ0RJYnlE?=
 =?utf-8?B?cStKdlR4ZUZSeitGdUtQV3hDMVpIMXQ1ZHM2c1JVdVZCbHJ1ZG1SRjQ1VDVE?=
 =?utf-8?B?NzhvL2JBTGFvcUJmczJreU1EMm1zaFFLL09CNG9KVklzaXFqYW1jd05Vd3lz?=
 =?utf-8?B?dkRqZTluSy9zM21iYnQzMTdvNWhSeW01ZU9pR2E2TDA0T0M4eWYyeE5RWXFR?=
 =?utf-8?B?Y1ZtODgyWTVmSFJ3d1ZRQnFwODZTOWhaTWlrZmQ2ZjN3OVQwc1hTZEFNS2h1?=
 =?utf-8?B?SWFVejZTUzhFdTdyZ1NPeDJORGtUUklZcExxWTJoaUsvNDRhTHhKcUVpQ2Ry?=
 =?utf-8?B?cWpZWU1nVFdWZC81Mzl1WncvM1diRVZhWkFkMDR3RVpZdXRERjk5ZGtERm9j?=
 =?utf-8?B?czhZdUN3ZEx5OUoyb1BZNXlWYnRQekozTjl0dXJuQVpvMit1NE1XdnhsYVF6?=
 =?utf-8?B?b1FBQ0VoWFN2ck1CS0Nwc2IzWGt2RkxSeUxFZHZoaExnVFY5K0dCRzI2S3Fy?=
 =?utf-8?B?L3l0MVpNR1hNRHU0K1BnYUk1VVdxbXFKUDBvWDNHL0UySkZJbW9GaGh5cGpH?=
 =?utf-8?B?RE0xTFlsTExpZm5RcWlaT1Nrbkl0OUNTNDNreDB2WTlaak96V3d2Ti9QTzlq?=
 =?utf-8?B?R2lYTmhGa2d5VnQvNFhWNlBBenR0dlFySnBLZjBwOEZIRWxOYUxmWFBCdjF4?=
 =?utf-8?B?MkFabEFIWkxjSW1VeWxBUGZpSW44VkhOZHlKdUVYdEwvWkc4TzVyaVFQRlBn?=
 =?utf-8?B?a2VubU1sbDZKaEFpYy9uRXFsKzBsWjRDbzR6dnNJSUNvMnVpRjlUVmhQZy85?=
 =?utf-8?B?K201N2pRUjZQZlVTcHNyK2ZudXY0eStjd1I3TkJ3bGhlQmFTaURlT0tZb3FY?=
 =?utf-8?B?aFBLcGJjbUgrWGgzaTJvUzV6MWdhbStZQU5JeHVkOFJ6dm55RDBKN1JrS1FO?=
 =?utf-8?B?YVZ2bWtwTXllRE91RTBMVVF1QWRabGdaTGEwRnJyTnprUEpieHYyUUhCN1lH?=
 =?utf-8?B?RXFxWm5MTzlEd0docXBWVWhjNmU5a0plRUxhWXZoSndxVW4wamJBM2VqTzgx?=
 =?utf-8?B?YWxlRGI1ZGs0TU1USUJvS2tLUlp3U2lVSDlrRzhWUkdyenZmc3FIakhNWlVB?=
 =?utf-8?B?dmM4M1BVT1JEMXNvWUV4UC9VZmpic1ZTUEZOUlAwOENjQ0RyYndHaU44VFIy?=
 =?utf-8?B?VDFIbUgwRnd1cnNYa2VtU0Vidk9WVkk0b3Z3bFFBRTVNMDBpUFV3cjhwb0Qr?=
 =?utf-8?B?aUg4bCtwZWlyUnJVU1M4OGJNMWczaVVIclMxUHVWeTZaNEg1bWk3YkU1RVVK?=
 =?utf-8?B?NU5zODFHU2FFWXI0SzBMQ2hzWjNIWkcwa2ErOFRkNlljdm51WHBWajlHNjlR?=
 =?utf-8?B?YkVPaENrTmpZRHIrVTlkUFhPMlFYd3dsZVVuVzA3Q1B1YXJxNnZWcHpuMEly?=
 =?utf-8?B?TDdKTU5OeitFTHF5THVtcVMvZUVEVmp6RTU2cVhRa2NvWndWYVlwbEd6QTBx?=
 =?utf-8?B?Ky9FQUpwT056VmU3MURjNEVuSmplKzJhTFpIUStIVFZUdFVlaTJ4MW9wMnRt?=
 =?utf-8?Q?XyVs=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 16:16:37.5212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3115061-02c9-4b64-1ee4-08de4ed14cc1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7313
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDExOSBTYWx0ZWRfXy/x44F/u0wzR
 G4wNNNy1Sjnv+DZaLfB2NvSI6hrZuz66dkPmXiW0xIoWNBvdvCoZIF9BnfeGCyeQVd80YEfmr09
 J7it1d7pj8IRHKh92wUamOh8I38xSOuGCu8HQlmLnBH6Ewmr8t2e2TJc1981w+H97R5oxxHTkzT
 9gGsGwNI4peQC56a0PwFdT3wQ/1ry/7TzOP5za9QDQ9LAFoiq7CfsDnEDw7fdnfSsjpJSjjBL4h
 r6uUmKjZVFdsuL9Rt8/dD/26uQ1h0ripocSnGO7k7mTZh6IETgSWz8GiTsSqLcYmU7ifWZWGA8Y
 5giB10o1R4MG4NsRskiaSmW+7EUWApn5n2jJuCqEV6SCJEt1BxL+a4HWL0sOOxzNz0eZddGwCG7
 JaVjxwThm2ygFQK50Uoyef0Y2gm0SzJLD7z35A4ab2zuDM7ORHjVE1Uy0/MBoKUtsIycVqtIPyY
 np3bHo6TEXHVan4WQnQ==
X-Proofpoint-ORIG-GUID: yz_dN2gSEXS5Aa6V4m_b1GJpIsOi8byO
X-Authority-Analysis: v=2.4 cv=X+pf6WTe c=1 sm=1 tr=0 ts=695fd868 cx=c_pps
 a=t+Agv/4bEvHkrKSCpahcKA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=TP8aPCUxYTYA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=C65gxnBunJGBKR08f3YA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: yz_dN2gSEXS5Aa6V4m_b1GJpIsOi8byO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_081652_592582_8580B2EA 
X-CRM114-Status: GOOD (  14.69  )
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

On 11/14/25 18:26, Patrice Chotard wrote:
> The bootph-all flag was introduced in dt-schema
> (dtschema/schemas/bootph.yaml) to define node usage across
> different boot phases.
> 
> To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
> present in all boot stages, so add missing bootph-all phase flag
> to these nodes to support SD boot.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   arch/arm64/boot/dts/st/stm32mp211.dtsi     |  7 +++++++
>   arch/arm64/boot/dts/st/stm32mp215f-dk.dts  |  1 +
>   arch/arm64/boot/dts/st/stm32mp231.dtsi     | 22 ++++++++++++++++++++++
>   arch/arm64/boot/dts/st/stm32mp235f-dk.dts  | 11 +++++++++++
>   arch/arm64/boot/dts/st/stm32mp251.dtsi     | 26 ++++++++++++++++++++++++++
>   arch/arm64/boot/dts/st/stm32mp255.dtsi     |  3 ++-
>   arch/arm64/boot/dts/st/stm32mp257f-dk.dts  | 11 +++++++++++
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 11 +++++++++++
>   8 files changed, 91 insertions(+), 1 deletion(-)
> 

....

> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index a8e6e0f77b83..f6576304f42f 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -66,6 +66,7 @@ optee: optee {

...


>   
>   			ltdc: display-controller@48010000 {
> +				bootph-all;
>   				compatible = "st,stm32mp251-ltdc";
>   				reg = <0x48010000 0x400>;
>   				interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
> @@ -1577,6 +1585,7 @@ ltdc: display-controller@48010000 {
>   				clock-names = "lcd", "bus";
>   				resets = <&rcc LTDC_R>;
>   				access-controllers = <&rifsc 80>;
> +				bootph-all;

duplicate property = build issue.


>   				status = "disabled";
>   			};
>   



