Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00264C47BEF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 11:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7K6OJup2/LAZXwG7dCz1UWiVqUvCpunWmb4PyV2CvpM=; b=ADFebtPdnxPTSBOesw/vjz0bL+
	hKBEYy636wIgbd4KnmR1IEr1JRM3Z6jv91/3ZB+wfv2tkJSzbmHWvQcdd5aS0eRgtWr4Nm+lUi7qo
	jpYW4anTZiWhyEYRteESpTOVWReRGzRQGtc3rEfWXUfCyQhdYi+Hq97YmTYrFv0I3Uxw0RsxnCWx/
	P4dT42tOsSKu1iYq9KswbH/oLbzW4sNIUxI+WTI1XpLZHNG6qB+f60dK9RloxVA2IXcGoO9OOtCV/
	LEZiY5fxWjqgKCpfE8PaEZX25Hi403PlvHWzcLdqS5p1jlB5ebnw3uvu7lQezkkFJc8CiCTHTcbEk
	amodaV4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5L5-0000000CtV6-2LBe;
	Tue, 06 Jan 2026 11:35:03 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5Kz-0000000CtO1-2tWu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 11:35:00 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606BSjMN4092649;
	Tue, 6 Jan 2026 12:34:36 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013014.outbound.protection.outlook.com [52.101.83.14])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bfdj5fes9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 12:34:36 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aItzZtZ8vbO3eQvOZFlDVcYnBmwj5a13XwGAN/LAsJ0eWP/9sMWDitVqJuH4XGfZtTNhYQzlZcxTwDLZw51RteF9VxbtLBxdiA6Tzdso8NUn9Du9nj8wxePUK1K03nm7ZnVeCNsCO47yoTR8HXTseQAYHazgzj6KBArpFcukyspXENzpndMhtrdNU8Y1C4dumozEAd2sXrmBLBJTPH5yXg1bUj7qBmXIcYst7osQVIKS+ISLw6wU6SR8DsWlGD5Ak8jzU8vjsksRj1OF13HFe1nVMZ2j5JpVDl4cM1hWLg9quR4Ib4fmLBlkXt0sITI/c1ca+7hUKyl3BoZVH20lhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7K6OJup2/LAZXwG7dCz1UWiVqUvCpunWmb4PyV2CvpM=;
 b=cWbFWysLewUHwt6o8xDPfZxD7oxfPWyCmYulJZHn4A24wiKxluv9mVkNrwMfwvQKt7fUKlm/KEHjNCXf0Pn3F98R7GsLk0cKT2gr1BKd9g7DoHxhwA+Lp4RVKyVk6mQ8L4aI7y0Zto6ffRqG3Du8VgJ4HhNepXSeVAm4/VgIYfhkTWPuQhJYppzdWYpRY+e0cHTaojXDc+TecdIc+LYn4M6254w3EgrKZ7gZJqhX02KZ/kKkpeBKkMgfubn1DAKG6Q+RsEk7s8snhY8koIFjPOafd9QYY1D11DR+i2ZZn5Ihkq2I1cWwsT84EHWGEk3MqQelK/Z4SMxMBIkHbCVDvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7K6OJup2/LAZXwG7dCz1UWiVqUvCpunWmb4PyV2CvpM=;
 b=maQAwQW3LU/0UrT9GOKf0xc+R6W9SfVGISq+R9p+P/F3UUosc3Ow8ZNaEtB7Jvjet74ElcEgh73kDGp4C5oobg4VpUeL+NvbCy7m+dntAtdctn/aYizAMwug37sdtG3KoZtCfZqowzbDB4odTOtTzKdHZO4dWh2crTKVs71vhC0CJTDEy9wk3fShtxq1/dDZVPaZxbKkksiXZAT7I/46xoNT+6qUqakIywJ4bfPH6YlP3jwZ8QzOJcpkc/DI0Td/D+51NGNHkQkFECOXEJIaxZEMrgZTJA2ZhevCR9/rbAM0/RNJh5W/NqtwKt/BW8U6/NRvpf0isvkpFZ9YMkkYFA==
Received: from DU7P251CA0008.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::21)
 by AM0PR10MB3249.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:186::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Tue, 6 Jan
 2026 11:34:33 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::a2) by DU7P251CA0008.outlook.office365.com
 (2603:10a6:10:551::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.5 via Frontend Transport; Tue, 6
 Jan 2026 11:34:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 11:34:33 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 12:35:46 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 12:34:31 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 6 Jan 2026 12:34:30 +0100
Subject: [PATCH v2 02/12] media: stm32: dcmi: perform
 dmaengine_slave_config at probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260106-stm32-dcmi-dma-chaining-v2-2-70688bccd80a@foss.st.com>
References: <20260106-stm32-dcmi-dma-chaining-v2-0-70688bccd80a@foss.st.com>
In-Reply-To: <20260106-stm32-dcmi-dma-chaining-v2-0-70688bccd80a@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>,
        Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.130.74.193]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885F:EE_|AM0PR10MB3249:EE_
X-MS-Office365-Filtering-Correlation-Id: 89450c70-205d-4d9f-c4d8-08de4d17906f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0lqZTRxMzZuckRXSUJ2SjFLQ3h1b0xlN1F1VmRzUE5TQ2ExUUN1UlNwS3M0?=
 =?utf-8?B?RTZJZDZ4TFNKSGg1MEVKaGxPQU9oYkI4UkRjTnRmZFMydlpMRmVWS0Q2WEdx?=
 =?utf-8?B?ekdqSnhFV0ZPS1hPaEJ0bmUxTmZKM0JocWJQVEZSRm5meHMxdmhHQ055RDBt?=
 =?utf-8?B?NUFLOW5uaGtEcFlBb2pBdzlnU2oxK3laSDl4NDlyU3dRclpEVWc4YVpBVUc4?=
 =?utf-8?B?KzV2ZXdSTTZjeC9hcGFhb1VmS1BXY0RpSjRPMWVuVW1wa1kvdWZaWHAxMEpi?=
 =?utf-8?B?ZkZyTHFXcmU1VmJCeDFISFE4c25VR3hYNjRKektyYnZ3TnBQUGNtN1EvK3B1?=
 =?utf-8?B?T2dMRm5RUFIzYldDWGlmbFFyYVhBenhpYzM3RHhONGpOVjBma3AyZkV1WmpO?=
 =?utf-8?B?cmg3bG1saUxXNVFaemlXWU04Yi9EczgzU29TeUZ0NGpsOEkyeFhSSjVHZ0cz?=
 =?utf-8?B?MGdXSVMvMWNrdjBnZWFYWk5aeW05cXNPTC9OZldBb2czQ0IzTUcwNVphWjls?=
 =?utf-8?B?R21ac3R6RktpQTlCNFh3eW9MSEhVN0VFTnVQZXhGRXIzeHppRUV1QWpCTmNq?=
 =?utf-8?B?YnhOYnk3aGNHdEgzN1F1b0YzQUZLamY2OUdIbnlEeUF0L1R6MThkWDBvdkFx?=
 =?utf-8?B?dmtOcWlwR3ZMdUwydHVjdXg2RkpLelhkQXVTV2VxNGIzSUpCQTlxczN6RFRS?=
 =?utf-8?B?Z3ZPeWd4UTVMSWRldUsyR0h0RlpTSmk5ZTVEM0diaE1hdzZNZVIvdjZZcERt?=
 =?utf-8?B?SzFKc3BZdkNVUWpOY2w1b0wzb3l4MjMxNzl5OG9MRGpGbDFOaTArTFRPU3pR?=
 =?utf-8?B?LzhLL0YxY2tySzBpbjhDb2NVaHdqTHVhUTNXdWhUcDBpeDlNOVZldTlJK05x?=
 =?utf-8?B?NEpwaEVLZ1FQRmxvZHY3NDIxODJGcjF4NzNmWTNYT0hGVjdDaUsza0hqbkhY?=
 =?utf-8?B?RCtGUk1tZ2lJNWZSVXJWQm1QQ1NaS2VTZHRodkVPWUM4blpvd2lNZXpnNTRk?=
 =?utf-8?B?blNqZENuanRta2QwK0xDd28zaU95S25pV0srdEFha3AzVXZkNlVCTkFiN0Mr?=
 =?utf-8?B?ZDAyYmpVK1JYUmxpc1Q2TlBaVlkzZDZad2htc3NodWhpNjBhbGdLdGEvWGFU?=
 =?utf-8?B?NFZtZG9mS1lUTmJQSklFMTc4eGZiS29rVldNckh6KzJqNTlmTkVsQXhRZitS?=
 =?utf-8?B?cXVScVR4S3JvMkF1S3hyZTJEM25oTlljcmV6ZFJVM1YvdnJ5bUxZYUVCbzBL?=
 =?utf-8?B?SkpQVTB4QWVSOVd4UFRmRE1Mem1hMlNuMGZaYTdTWTlGVkNXdG1GTyszbjhL?=
 =?utf-8?B?U1Z5MWNKeXUwV3Q1MkQrSDl1emRHNFZWT3AyUHJaV0gvUkc3ek5MVWhrdFla?=
 =?utf-8?B?L0c4NkV4ZGd0NUd6OEJHS3lHQSswSVhHU1dpMFlWOU12MlJYMnI0V1lRS2Rk?=
 =?utf-8?B?RXQ3d1pZeDdVN1VOL0NWbndXak8xLzIzaVVqbXBpc1ZXQ0UzN0x1cDd4NTQ0?=
 =?utf-8?B?L3paUGtFUTdZMzgybUovRFBGajBEeTdlOHpLUXlDU09USGU1VmovMWdmK0di?=
 =?utf-8?B?c1hPUzBIRUY3Y24ra0c3OTJGdFRXUVptTDd1MEFRcXgyQ1NWbDdpRERHMFNj?=
 =?utf-8?B?bWNQYTNvVVk3TERFZlVtOW9ZN2ZOVThOUkw4aW5zTjF3QnE2ditLbndFNWpm?=
 =?utf-8?B?SzNVeEMySjhNS1lmeXlsOVBranFIdG1BU0xXSzNvWUpWN1lscjZneVc2aldZ?=
 =?utf-8?B?V3BCMklzb3FFbnJiRXgxYVlmNlhOOHMvRGZWcU1ZMFJzVnZnRUx0NEtzVjlY?=
 =?utf-8?B?c0J4NDZ2c3Q2ZXVLc0tpZWg1cVU4dlRGd0tBQ0EweTVreFpzeEY0OVBSYk1l?=
 =?utf-8?B?WWMybDFjeFFoVitlczlqb04ySzhvUGptNUs3QXU1SW41WEwwcnovSVdLenYv?=
 =?utf-8?B?bHBVakxoendPYnVlNlZmS2FKWjBITXBhaEU2cmRIbXFCTVVnU0ExZEJHWFZ6?=
 =?utf-8?B?ZE9xNUNuODkyWXROa3o4NDBnSmtoblpEd1dxKzVXTmozTFdvWGs4SXRqMUs0?=
 =?utf-8?B?SDR6eG90Q1NGa2R4bmVZRGpFeUJCWUlwZmE4citCdkZFbTdwYW8zY3h3WTVB?=
 =?utf-8?Q?BOEY=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:34:33.4972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89450c70-205d-4d9f-c4d8-08de4d17906f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3249
X-Proofpoint-ORIG-GUID: UrEU47o7QkvnGag38_nmMCoSlk_Bc943
X-Proofpoint-GUID: UrEU47o7QkvnGag38_nmMCoSlk_Bc943
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5OSBTYWx0ZWRfXzYxZm99N1f1U
 9klzdkz7T3dDxBEE45PxShVLu8X5SmjX1Ls+WuBqwiaOs5QiuC0Tux/A56kYogIdFb7BgJ4/ht3
 rnHR3T/JRlJUOtpTviYWT9eChNFgT8T9Nj07Ef459nBHryVpIkdtdw0pk8KMRCHIqDG3jTfAp3p
 s21BFqA/sNx6Af3UEzH7SAGE5YxKg+DJunzRMOwCbtxeSHXlsOpu3hQKs2k20GjeyAi9xyTgIVg
 LDFeTDoa36ZaYHZUT+emD466KmQ66Uo7Jovw05GuzA64qmWrqhYJt9ZApQIAZWBQoOsgYVIIv41
 kjHhq35QjX6XM09bpKxZCyPucf5phCZtyLbj+GbTPcIsPtqZatR3lBQz+4dzvVqhyRaETYK8QbG
 01wJLsejC/aZUyaHVId9Q8GnAcmuCWWRxdr0umAIQ3cCY2kEHhHQPIZ4xThbw52LIECGY4+wiVw
 AfXW0UslKjErWNcYW5g==
X-Authority-Analysis: v=2.4 cv=SMBPlevH c=1 sm=1 tr=0 ts=695cf34c cx=c_pps
 a=g9/3GMKIs+LCGVgKrk4MiA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=JtklpnBJFm0c8pyAJu8A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_033458_017932_52762430 
X-CRM114-Status: GOOD (  16.08  )
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

Perform the dma channel configuration at probe time right after
the channel allocation since this is fixed for the whole lifetime
of the driver.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 32 +++++++++++++---------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 619b0d981211..787c5d778db2 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -301,23 +301,6 @@ static int dcmi_start_dma(struct stm32_dcmi *dcmi,
 			  struct dcmi_buf *buf)
 {
 	struct dma_async_tx_descriptor *desc = NULL;
-	struct dma_slave_config config;
-	int ret;
-
-	memset(&config, 0, sizeof(config));
-
-	config.src_addr = (dma_addr_t)dcmi->res->start + DCMI_DR;
-	config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-	config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-	config.dst_maxburst = 4;
-
-	/* Configure DMA channel */
-	ret = dmaengine_slave_config(dcmi->dma_chan, &config);
-	if (ret < 0) {
-		dev_err(dcmi->dev, "%s: DMA channel config failed (%d)\n",
-			__func__, ret);
-		return ret;
-	}
 
 	/*
 	 * Avoid call of dmaengine_terminate_sync() between
@@ -1888,6 +1871,7 @@ static int dcmi_probe(struct platform_device *pdev)
 	struct vb2_queue *q;
 	struct dma_chan *chan;
 	struct dma_slave_caps caps;
+	struct dma_slave_config dma_config;
 	struct clk *mclk;
 	int ret = 0;
 
@@ -1954,6 +1938,19 @@ static int dcmi_probe(struct platform_device *pdev)
 	if (!ret && caps.max_sg_burst)
 		dcmi->dma_max_burst = caps.max_sg_burst	* DMA_SLAVE_BUSWIDTH_4_BYTES;
 
+	memset(&dma_config, 0, sizeof(dma_config));
+
+	dma_config.src_addr = (dma_addr_t)dcmi->res->start + DCMI_DR;
+	dma_config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+
+	/* Configure DMA channel */
+	ret = dmaengine_slave_config(chan, &dma_config);
+	if (ret < 0) {
+		dev_err(dcmi->dev, "%s: DMA channel config failed (%d)\n",
+			__func__, ret);
+		goto err_dma_slave_config;
+	}
+
 	spin_lock_init(&dcmi->irqlock);
 	mutex_init(&dcmi->lock);
 	mutex_init(&dcmi->dma_lock);
@@ -2072,6 +2069,7 @@ static int dcmi_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&dcmi->v4l2_dev);
 err_media_device_cleanup:
 	media_device_cleanup(&dcmi->mdev);
+err_dma_slave_config:
 	dma_release_channel(dcmi->dma_chan);
 
 	return ret;

-- 
2.34.1


