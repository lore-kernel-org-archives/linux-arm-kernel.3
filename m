Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCB7CE8D66
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 17:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uiuyxLeQgyxw7XgC4GwO3U+M9n2koPdGeNQJdrIezF4=; b=4b34UdPwnoUJKeHz65eDHaZUgS
	ju/gECOdyq9WXP/8jktDZDtzVWyR4H4CHZo96HHdvCSMNCdrmrvjl6OMecMyE6iC30iUtemYnvsF+
	6LtE9+vhWg64zpm2hYa4bqeJiymRK6ga2GUHBSOVg0ft5tMbbcXYehC+kTYvK5lJOCwEhv0B/cwQC
	gR9gIeWYkLfrVoUEt9PmzJCwBtWrPDW0O/Y+B17Uyi7CGnrhr5kEN1lfHJMJuzBv0xYaaQgrniXyb
	B8vAogCl9DckSAu3M677SBYYRIV+HgBNf6YESan5uZ6U6c7H5mSfxs3b2TFwZf2fG15S/GxtrPuA3
	OXZyRzbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxZC-0000000Cq1E-0Dti;
	Fri, 14 Nov 2025 17:26:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxZ7-0000000Cpxu-0KLx
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 17:26:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=uiuyxLeQgyxw7XgC4GwO3U+M9n2koPdGeNQJdrIezF4=; b=j5raBsai8fo7FvMOR1YSKYuK27
	3MGVZXDD9wwtE9f+hdjziG+dOdYiCo3O3J/p3cc4PpzdNfZ9eCaKQolN3MTW4tpAJchCqIMEGuDkg
	1DE3XZ3u/uOzyjXrfTodp41pLQVHNxZ/KwUgwNwdokxPORqZiKM64JK8uT30pjlVaXIduNAaUQzvm
	4mpfRZ1fex1e/MnJNmQGJcjD0TZcowCvKZy/w2dmwt7NPIiOPfpq3UQ109jmy06icQsToJQ/nxKPz
	9W2Kn4mZ7bnjqdSLYCZwFopRTo1fyr+NOfDiKyy3+RkMM9aNU8yOUMJmKMlj3Lzyp1kHvfeC2e5o0
	YYttmH1w==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwhO-000000037qu-2emi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 16:31:01 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEHGhWA3103533;
	Fri, 14 Nov 2025 18:26:19 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013021.outbound.protection.outlook.com [52.101.83.21])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7kkx9j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 18:26:19 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G8pmHnFcHCW+ghcWz2b2QP9DSjXT3UD11FQhXgxfS1ydDTLkQK93YvHm5NOIdOGVXDDgZ1aSnuaU8a6fb9UIE2i0lRCx+UAld/tTZvw/FhAw5DEeZF9f4ARHP46iayHB7y9bg354sz+m7+YuLfoecLJ/McIw4hcuem+qoM8k2VZkpWsLZmcC+2tVUmj+FvH4Kb9Q4NTAIiqG/DOD8c3+Cg1bP/C+oBWg9JB4GiErkMPZbvCW2NklnfxdEzHFUW9NNbB8vcpOiufZRQkGM4nSI/ujgCNxda0gZXILNuvnMvZdI1U2/aCh4esNH06toNefbff6dT2hlzpEJ4lXvtXGFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiuyxLeQgyxw7XgC4GwO3U+M9n2koPdGeNQJdrIezF4=;
 b=QGsxhowIXb8ZHsHvLP9PvtvzMFcCN6IDEv5GqeuFaWKM9hcWKCRzXdSExgu9rNpJ14TfoY86aFQ18e/o6mzFp2CcQ4QBu45A3kc6LpYuQVZOvgN5JBFZlfIkBDKRmB2PWf2Mu7gR8DG6WfOfHjv1rZBOUNQ7CT6vaHudggX/Ppzh7vzwCkuVRrPkNdL2BrUVyR1MiXTGZJqhfutHVV8YpDZzJd7mtlWytmajj1CSwgE9NHkM6sqy/MvfRyeCx11JPQWjQNigAtq54du4UHhd0e+U6QRSZoYog+7MG6B3Hi7X4VnH/KdEWbKwAAd/I86rSB7C1JMbUjGi85F1ZxZLPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiuyxLeQgyxw7XgC4GwO3U+M9n2koPdGeNQJdrIezF4=;
 b=lwcU4qj+dXXmJg1oHEPT0DdEwweN1VGd9SOLTpMWiAvZOCmhnSzAxQg3XbVyJaPrTxzGPolZ8I2HXROP6BAh7NptpWG78seqwD2tKv7eRb3nEj8rEqJv2Iqenmk/LgmTTPpFMgHZGdYTOno+yJjB9G8e1b08tuOahNmOo6EAmvYC2Ji9clxg8cMF+uVGH0i76xQtW6i7C+ybD5KUyS4vzIKa6n7s3z69JFlaWCQwNZwjVaPUz8bTo+pTCcaWezOyASgiyofj4T2J4lEn1EhXLXTP3I7ZgnvZuPLxq9Kl1qVYcgTTg9HTO/W+0y0vYV4EUGdR6qNhtWKGURS4YNB6Rw==
Received: from PAZP264CA0142.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f8::8)
 by VI1PR10MB3517.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:136::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 14 Nov
 2025 17:26:13 +0000
Received: from AM4PEPF00025F9C.EURPRD83.prod.outlook.com
 (2603:10a6:102:1f8:cafe::d7) by PAZP264CA0142.outlook.office365.com
 (2603:10a6:102:1f8::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 17:26:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00025F9C.mail.protection.outlook.com (10.167.16.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.0 via Frontend Transport; Fri, 14 Nov 2025 17:26:13 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 18:26:25 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 18:26:12 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 14 Nov 2025 18:26:05 +0100
Subject: [PATCH v2 5/6] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics mp15 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251114-upstream_uboot_properties-v2-5-3784ff668ae0@foss.st.com>
References: <20251114-upstream_uboot_properties-v2-0-3784ff668ae0@foss.st.com>
In-Reply-To: <20251114-upstream_uboot_properties-v2-0-3784ff668ae0@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9C:EE_|VI1PR10MB3517:EE_
X-MS-Office365-Filtering-Correlation-Id: c50f585c-28bd-4534-fdfe-08de23a2e8db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDhuUmNkemIzL08zbUZralZNbytpMlNMWlYrUjh2dGF0a0JBMkxCNGd6L1d2?=
 =?utf-8?B?Unc1L0ZZd3oxL0hWNDVIcXBmdUxXRkZqSUI1aWlqdWhXSktNWFpBckxGdTZD?=
 =?utf-8?B?TWVyNjdnazEydXFpNTRWNTBJUlp0cGJWc3hoOG84ZzYwc2tiaW9Cb245em1j?=
 =?utf-8?B?R3VMSlJHeFFjUE9FK3owa1ltMzgxdU1uUEtJajFEUWdqajNkZFhMdnVjTkp6?=
 =?utf-8?B?cHlNV2NIbXBLWndxc1ptWUNUZ3VjS1o4d0pZSnpSTnBZdFdQbVlyQXRhYXFR?=
 =?utf-8?B?T1I1b2lhUnFabzM1dmphM2dTY0pTUFkyWHBiYWQxQXhJUklTSnAxMk9zKzF4?=
 =?utf-8?B?R3JqOVNIaWlCSzVKbXdQa2ZTR2xTVTQ4SDF2bGY3dkdoN3laQlVEcjZiUTg3?=
 =?utf-8?B?ZGREMTFsSEE5UnBCRk9ocWtncE5KR2puVUF6UVZXWTVHVDduYlMwNzVYeWJC?=
 =?utf-8?B?N2ZuVlRxL3RjdGxUV3F1ZEkxZEJrUURYNW9Xd3FQMzVsYUVDNFN5SzlvRXo0?=
 =?utf-8?B?MUZYY2dYbGFDbTEyWTVsRU5SZXh6Y09zS3pMekJEVzVqRW14Zjh6M2w5aEs4?=
 =?utf-8?B?dGFITENtQTZDeXJiTFJsbU1Zc2FwdDRMcVhKY09vTEtTUnk5aGZKV0ZSOW1B?=
 =?utf-8?B?SWNVZjVxbnI0V1VBZHFFRDZCclBFbVFGY2k3cUtGTGFrMFluYm1jSWxCUEFz?=
 =?utf-8?B?MS9QamdwcDl1NzlmbnFRTG1HeFNjV1A2aXRUOWxJN0FPaEUySk4rTGpVaTdt?=
 =?utf-8?B?YnJ4TlR0eW1PeWlvYU42Z1IvdlZhcDh4NlB6WlhmbFAwQ3RmNUVvNXJ0UzNU?=
 =?utf-8?B?d1Vmb1VrUDBsNWF2NUEzWGY4bDZ3MVRJenpsVHNMamJ3a2ZrcjJ5NzNidi82?=
 =?utf-8?B?dVU3MDI5dTdsY055YUwyYjc4U1l4UWJQNFBOMEhFZUR5THZmVzROaVc5ek8z?=
 =?utf-8?B?aE9SNVY3TjEwaWZVUXN4eGxhWnlOdiszcU85RFBLblBjRm9LMytQMHlSVGdZ?=
 =?utf-8?B?VGNUbVZHNS9BYVFCOEZnNFIxZzhmeVlCYzdJZEtwaGJwTGxoQmhuSjc1MW5Q?=
 =?utf-8?B?aUF3c2J5aHZZcmZOcENaYWg1cUQ5VERpZkVRQ0lPUGh1S1ZTVEhqV3EzZHdY?=
 =?utf-8?B?R0FPS2JYcTY5WkhqS2hqUCsxTVJYaG5VeWNJaXcwNXRsVXdZVEM4MXkvZDdP?=
 =?utf-8?B?MlF2YmluR3h2QnliNFdQQTJOeDhkemNQOWV5bk5NYnRGSlJZNWNKWGNJRWJW?=
 =?utf-8?B?ZzJVSENYSzJCbE9pSXNxNno2NVZMTDZpRWNvMTNiYlJOMXZpY1VveVF0Vnp1?=
 =?utf-8?B?V2dIN3JTTDVpM1JkRVFCODBxclp2SnVBeWdIVmREUzVBZlBScDJTKzh1TCtz?=
 =?utf-8?B?Rld2RnFRcHhuUndNMk5Lbmhib1ZUTjFZbjgvTXdrNFhTVXNFaDVhSm9hMU1n?=
 =?utf-8?B?MDFnRWNmaEdRWFNhdnlmVURSS0xXQTFKcWdGOTExY2t0cHpzOXVTRndQdDFm?=
 =?utf-8?B?dnhJOHZOTjN0S1hadjVEUk1pMWZrMnhoUFhSREYrOVh1cmVNNHE5K3Mya1Zt?=
 =?utf-8?B?TzFPUmZxKzN4MFIzMFZ5Q0tNSFlJa0paQkRicXlMd2lBTTF1QWNFa2RDNkp5?=
 =?utf-8?B?ZWtRMHBqeWpyYlhsdkFxelJOUkpLSEd1NE53eGJrekp1eUNkeWd0T3o3MHdn?=
 =?utf-8?B?eXdHOXdsZ0RuVXNoTkpSMDFxV0l1amRoN0MrUzdUY2gvUU1OcmVuWno3ektG?=
 =?utf-8?B?RUd4c2NmUTVwL0orYStQQ3NBTnRBa1hKTVBIbE1McllLNWc2bEsyNW16b09y?=
 =?utf-8?B?NG15TEQ1QzQ2QmJ0SzlsZ1prTVN5dGt1NTNXc0hwV2RBblZ5Z3p0UkJaOE4z?=
 =?utf-8?B?Y1BiOGlWNVMrT3drQkNGb2YzR3BSWDFTZFp0bmw0MCtXczI4a1RrU1hQNllj?=
 =?utf-8?B?U1dpMk9FbFVJcXV5Y254NW5acnFQRUlTL1hiMDhac3RGbmtHbGRmVDNZclln?=
 =?utf-8?B?NWFpWS8zbHgxMEVlYlNFWDVBcXdnNWZqL0FXWGhNS3lGbC8wSlJhYVVvRjhq?=
 =?utf-8?B?Y254K0pURXBTUlVxcENpOHlnQmtrMEw3bjFmWnh3Z2VqYU5GSHhld09OVStt?=
 =?utf-8?Q?NwbY=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 17:26:13.0737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c50f585c-28bd-4534-fdfe-08de23a2e8db
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3517
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE0MCBTYWx0ZWRfX7oVjNhqXlshK
 3iPIbguXvIerL4qtdsEiIIExMOu6O1baFcVfxhxUpf2Fn66t6EYGvIwxxRo/iBfbWF8tcW+72s5
 HCrlMuf2ldE1mPB4eFoDsDiVX7gXSpLcI3JN/5S9gu3APBV9sFGZJkohkT6g7E3yWvtjIh5qyQ+
 cYloQp8Z+aLD/u9Na2K8ny0Qaq0yZpj/Ee/1QM4U1wzYC/p3rPF/zWhOWHYV1vyWDsgJQSpY2uu
 dDrpXMfJ8siIrcuIsIUWs0PGJqDwQ5MwrvtjnIAM+0hPsOawBERfguCOZ3X41ueYALes44zua24
 g3lJuUEGYHWJaWW2vF7qcBVZOc7SM6tVkJ2QA/aPFHW8cwmZs4zjBSdDIIhkSkHW0qDV97/7E/1
 fiNNi80t/gkUs1Y8A+AC2RzBPdSG4g==
X-Authority-Analysis: v=2.4 cv=Xsf3+FF9 c=1 sm=1 tr=0 ts=6917663b cx=c_pps
 a=4V/xMreKffMR3zRy0ai/1w==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=44I5eye_6M4fdnXrIMoA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: wkEhKuWSt8usG8iMLZkBn4MBD3RbpH3M
X-Proofpoint-GUID: wkEhKuWSt8usG8iMLZkBn4MBD3RbpH3M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_163059_849381_6DBAD344 
X-CRM114-Status: GOOD (  10.49  )
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

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15-scmi.dtsi      | 26 ++++++++++++
 arch/arm/boot/dts/st/stm32mp151.dtsi          | 29 +++++++++++++
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts | 14 +++++++
 arch/arm/boot/dts/st/stm32mp157a-dk1.dts      | 43 +++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts      | 43 +++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts | 14 +++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts      | 60 +++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts | 25 +++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts      | 36 ++++++++++++++++
 9 files changed, 290 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
index 98552fe45d4e..c58d81f505be 100644
--- a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
@@ -13,6 +13,7 @@ optee: optee {
 			method = "smc";
 			interrupt-parent = <&intc>;
 			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+			bootph-some-ram;
 		};
 
 		scmi: scmi {
@@ -20,6 +21,7 @@ scmi: scmi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			linaro,optee-channel-id = <0>;
+			bootph-some-ram;
 
 			scmi_clk: protocol@14 {
 				reg = <0x14>;
@@ -64,6 +66,26 @@ scmi_usb33: regulator@2 {
 	};
 };
 
+&iwdg2 {
+	bootph-all;
+};
+
+&ltdc {
+	bootph-some-ram;
+};
+
+&pinctrl {
+	bootph-all;
+};
+
+&pinctrl_z {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &reg11 {
 	status = "disabled";
 };
@@ -72,6 +94,10 @@ &reg18 {
 	status = "disabled";
 };
 
+&scmi {
+	bootph-some-ram;
+};
+
 &usb33 {
 	status = "disabled";
 };
diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index b1b568dfd126..7abee7ce0580 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -33,6 +33,7 @@ arm-pmu {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		bootph-some-ram;
 	};
 
 	intc: interrupt-controller@a0021000 {
@@ -54,34 +55,41 @@ timer {
 	};
 
 	clocks {
+		bootph-all;
+
 		clk_hse: clk-hse {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <24000000>;
+			bootph-all;
 		};
 
 		clk_hsi: clk-hsi {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <64000000>;
+			bootph-all;
 		};
 
 		clk_lse: clk-lse {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <32768>;
+			bootph-all;
 		};
 
 		clk_lsi: clk-lsi {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <32000>;
+			bootph-all;
 		};
 
 		clk_csi: clk-csi {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <4000000>;
+			bootph-all;
 		};
 	};
 
@@ -122,6 +130,7 @@ soc {
 		#size-cells = <1>;
 		interrupt-parent = <&intc>;
 		ranges;
+		bootph-all;
 
 		ipcc: mailbox@4c001000 {
 			compatible = "st,stm32mp1-ipcc";
@@ -142,11 +151,13 @@ rcc: rcc@50000000 {
 			reg = <0x50000000 0x1000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		pwr_regulators: pwr@50001000 {
 			compatible = "st,stm32mp1,pwr-reg";
 			reg = <0x50001000 0x10>;
+			bootph-all;
 
 			reg11: reg11 {
 				regulator-name = "reg11";
@@ -354,6 +365,7 @@ ltdc: display-controller@5a001000 {
 			clocks = <&rcc LTDC_PX>;
 			clock-names = "lcd";
 			resets = <&rcc LTDC_R>;
+			bootph-some-ram;
 			status = "disabled";
 		};
 
@@ -364,6 +376,7 @@ iwdg2: watchdog@5a002000 {
 			clock-names = "pclk", "lsi";
 			interrupts-extended = <&exti 46 IRQ_TYPE_LEVEL_HIGH>;
 			wakeup-source;
+			bootph-all;
 			status = "disabled";
 		};
 
@@ -404,6 +417,8 @@ bsec: efuse@5c005000 {
 			reg = <0x5c005000 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			bootph-all;
+
 			part_number_otp: part-number-otp@4 {
 				reg = <0x4 0x1>;
 			};
@@ -1876,6 +1891,7 @@ pinctrl: pinctrl@50002000 {
 			ranges = <0 0x50002000 0xa400>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&exti 0x60 0xff>;
+			bootph-all;
 
 			gpioa: gpio@50002000 {
 				gpio-controller;
@@ -1885,6 +1901,7 @@ gpioa: gpio@50002000 {
 				reg = <0x0 0x400>;
 				clocks = <&rcc GPIOA>;
 				st,bank-name = "GPIOA";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1896,6 +1913,7 @@ gpiob: gpio@50003000 {
 				reg = <0x1000 0x400>;
 				clocks = <&rcc GPIOB>;
 				st,bank-name = "GPIOB";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1907,6 +1925,7 @@ gpioc: gpio@50004000 {
 				reg = <0x2000 0x400>;
 				clocks = <&rcc GPIOC>;
 				st,bank-name = "GPIOC";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1918,6 +1937,7 @@ gpiod: gpio@50005000 {
 				reg = <0x3000 0x400>;
 				clocks = <&rcc GPIOD>;
 				st,bank-name = "GPIOD";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1929,6 +1949,7 @@ gpioe: gpio@50006000 {
 				reg = <0x4000 0x400>;
 				clocks = <&rcc GPIOE>;
 				st,bank-name = "GPIOE";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1940,6 +1961,7 @@ gpiof: gpio@50007000 {
 				reg = <0x5000 0x400>;
 				clocks = <&rcc GPIOF>;
 				st,bank-name = "GPIOF";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1951,6 +1973,7 @@ gpiog: gpio@50008000 {
 				reg = <0x6000 0x400>;
 				clocks = <&rcc GPIOG>;
 				st,bank-name = "GPIOG";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1962,6 +1985,7 @@ gpioh: gpio@50009000 {
 				reg = <0x7000 0x400>;
 				clocks = <&rcc GPIOH>;
 				st,bank-name = "GPIOH";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1973,6 +1997,7 @@ gpioi: gpio@5000a000 {
 				reg = <0x8000 0x400>;
 				clocks = <&rcc GPIOI>;
 				st,bank-name = "GPIOI";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1984,6 +2009,7 @@ gpioj: gpio@5000b000 {
 				reg = <0x9000 0x400>;
 				clocks = <&rcc GPIOJ>;
 				st,bank-name = "GPIOJ";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1995,6 +2021,7 @@ gpiok: gpio@5000c000 {
 				reg = <0xa000 0x400>;
 				clocks = <&rcc GPIOK>;
 				st,bank-name = "GPIOK";
+				bootph-all;
 				status = "disabled";
 			};
 		};
@@ -2006,6 +2033,7 @@ pinctrl_z: pinctrl@54004000 {
 			ranges = <0 0x54004000 0x400>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&exti 0x60 0xff>;
+			bootph-all;
 
 			gpioz: gpio@54004000 {
 				gpio-controller;
@@ -2016,6 +2044,7 @@ gpioz: gpio@54004000 {
 				clocks = <&rcc GPIOZ>;
 				st,bank-name = "GPIOZ";
 				st,bank-ioport = <11>;
+				bootph-all;
 				status = "disabled";
 			};
 		};
diff --git a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
index 847b360f02fc..f721c398e576 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
@@ -85,3 +85,17 @@ &rng1 {
 &rtc {
 	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
 };
+
+&uart4 {
+	bootph-all;
+};
+
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
diff --git a/arch/arm/boot/dts/st/stm32mp157a-dk1.dts b/arch/arm/boot/dts/st/stm32mp157a-dk1.dts
index 0da3667ab1e0..c4581e28504a 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-dk1.dts
@@ -23,3 +23,46 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 };
+
+&i2c4 {
+	bootph-all;
+};
+
+&i2c4_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
+};
+
+&pmic {
+	bootph-all;
+};
+
+&sdmmc1 {
+	bootph-pre-ram;
+};
+
+&sdmmc1_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&uart4 {
+	bootph-all;
+};
+
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
index 1ec3b8f2faa9..4fc670bb4cb0 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
@@ -79,6 +79,17 @@ touchscreen@38 {
 	};
 };
 
+&i2c4 {
+	bootph-all;
+};
+
+&i2c4_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
+};
+
 &ltdc {
 	status = "okay";
 
@@ -93,6 +104,10 @@ ltdc_ep1_out: endpoint@1 {
 	};
 };
 
+&pmic {
+	bootph-all;
+};
+
 &rtc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&rtc_rsvd_pins_a>;
@@ -103,6 +118,20 @@ rtc_lsco_pins_a: rtc-lsco-0 {
 	};
 };
 
+&sdmmc1 {
+	bootph-pre-ram;
+};
+
+&sdmmc1_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
 /* Wifi */
 &sdmmc2 {
 	pinctrl-names = "default", "opendrain", "sleep";
@@ -127,6 +156,20 @@ brcmf: wifi@1 {
 	};
 };
 
+&uart4 {
+	bootph-all;
+};
+
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 /* Bluetooth */
 &usart2 {
 	pinctrl-names = "default", "sleep", "idle";
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
index 6f27d794d270..00d4855f9a85 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
@@ -90,3 +90,17 @@ &rng1 {
 &rtc {
 	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
 };
+
+&uart4 {
+	bootph-all;
+};
+
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
index f6c478dbd041..f63a3d68d2b4 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
@@ -168,7 +168,9 @@ &i2c4 {
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
 	clock-frequency = <400000>;
+	bootph-all;
 	status = "okay";
+
 	/* spare dmas for other usage */
 	/delete-property/dmas;
 	/delete-property/dma-names;
@@ -179,6 +181,7 @@ pmic: stpmic@33 {
 		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
+		bootph-all;
 		status = "okay";
 
 		regulators {
@@ -314,6 +317,13 @@ watchdog {
 	};
 };
 
+&i2c4_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
+};
+
 &ipcc {
 	status = "okay";
 };
@@ -365,9 +375,30 @@ &sdmmc1 {
 	sd-uhs-sdr25;
 	sd-uhs-sdr50;
 	sd-uhs-ddr50;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc1_dir_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
 &sdmmc2 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
@@ -381,9 +412,27 @@ &sdmmc2 {
 	vmmc-supply = <&v3v3>;
 	vqmmc-supply = <&vdd>;
 	mmc-ddr-3_3v;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc2_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc2_d47_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
 &timers6 {
 	status = "okay";
 	/* spare dmas for other usage */
@@ -399,11 +448,22 @@ &uart4 {
 	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-1 = <&uart4_sleep_pins_a>;
 	pinctrl-2 = <&uart4_idle_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
 
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_hs {
 	vbus-supply = <&vbus_otg>;
 };
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
index 6ae391bffee5..bcf80f76d6bc 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
@@ -77,6 +77,31 @@ &optee {
 	interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
 };
 
+&qspi {
+	bootph-pre-ram;
+};
+
+&qspi_clk_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_bk1_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_bk2_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
 &rcc {
 	compatible = "st,stm32mp1-rcc-secure", "syscon";
 	clock-names = "hse", "hsi", "csi", "lse", "lsi";
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index 8f99c30f1af1..879436cbb72d 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -262,6 +262,7 @@ &qspi_bk2_sleep_pins_a
 	reg = <0x58003000 0x1000>, <0x70000000 0x4000000>;
 	#address-cells = <1>;
 	#size-cells = <0>;
+	bootph-pre-ram;
 	status = "okay";
 
 	flash0: flash@0 {
@@ -283,6 +284,41 @@ flash1: flash@1 {
 	};
 };
 
+&qspi_clk_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_bk1_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_cs1_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_bk2_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_cs2_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
 &sdmmc3 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc3_b4_pins_a>;

-- 
2.43.0


