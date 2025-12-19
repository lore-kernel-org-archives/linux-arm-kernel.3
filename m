Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C4AD7878A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 14:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNxWuBgDy/T5D0c4qiiYTUOY0EkdQtRYYNNFtZ91icg=; b=3oHQHur+pdy+oznbDHejZoU1x+
	4HX2TDq5PKbMVd8KzPuTZ3hITY++iM/jtMsNjqVggLgCN6aSzhUz75xaq8HWl5Ofc4PTJjM3Z6X0j
	1pwZMlbfHwAWIcJYQz+mThL1nOlN25dJXzpl99z9gMZx4NwQV0dNOeUNQira2E0lyOFPXhOc1LiZm
	v6Z8kwKIieIpd/mcuK6fUKg2f6C+1V+Gg7ypsu0K0qjYd8TQRZRjhMA52y8nG9cNWpAYUaRAlElNr
	IZZpcahJHr+UWYTF6XFkXMnfhvqIKArA0oriOGv/ZgL9eEosii0qEgdV8iec5tuXFvZA9E5VdnZrR
	VuPkAs8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbVs-0000000AP5h-23au;
	Fri, 19 Dec 2025 14:31:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbVk-0000000AP1h-2T8D
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 19 Dec 2025 14:31:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=iNxWuBgDy/T5D0c4qiiYTUOY0EkdQtRYYNNFtZ91icg=; b=bX3onpCLnodrbSyrPdkIPltBLo
	Dtlo/xwK+hLyo37NRZRUx6s3ZqxtNblyn3OIBKrTYQ0W463YsZkGy7qPXBea9O39nhsF1K2nsvrK2
	V6gA2Wpo9cTnj+W3C2URDrKt4DU7bUtLwi1zSLs2axcEolSoP5iYe6ze4yzzIsd8v5tNR5AV04BE5
	b/vervdojQX1/dt9tYT6WUG1YuIULpVDhSJKNoubIb+O0BTilQUCOTrbZF83HoaX5rsXDPomIjfhh
	8juT0RGv7OyCC1Vlj746pGRnQeHfMv48+peNe+qTgisxX7egIBrL+o1GlWOy53+0t0hVtgjr5lFlm
	hqCnWU/g==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWaeF-0000000Az0B-0gMs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 13:36:01 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJER5dT1581582;
	Fri, 19 Dec 2025 15:30:57 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012023.outbound.protection.outlook.com [52.101.66.23])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4r31bq9q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 15:30:57 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYGxSgfH1vjbMY37oKEfmZ4uBwvUPDDsIUkI1nMhCeJui20z/OmjPm0lwPzii4BjQgEA0e93f9dbH3lAxEsm0Stuhg1Irpj4D8Yymyvkdh6RVu0cVTNmX1w0SzR24E1ueikvqj2/dHlty+ZU2SeWBvjI5gOgMVry+QN6x7BzFFXdAip7ifj+POSE+YuqF8lu/0qNfXRGlBnRjZtogO2k0WqAdXUAKSmgt1E3sKKj8zrhFMkiCJqitOKcQv4Y8BxZI4Iw6NtahthqjRbdBjsxvqf+C5yhZ7hxKR8srEf5QsbAi/T1CI7bnnwgD6lYeuuZTT1Ko9QM0VqE3xDZ0LB0+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNxWuBgDy/T5D0c4qiiYTUOY0EkdQtRYYNNFtZ91icg=;
 b=zVFKpdwhq5/vjkGY63hNevGoizicig7zkHiMwcM5nlyS8HeQKrADdv9wIJu31blW+dqC+tuqqUxaKApUsov66r8sBa3dXO5tgCPuYJydeQJqFy/kt2P78aF8iTMPfXQyc48ZVx+aUySCMFAOoeNkJwDooe/AWcUuC2gikvxpzoENe5lObNGCUZC2iqNwcmt3EPThgA6DYbxEMTuaYef+pzMehqoC3MX5i3xq9wlPDtrfDIF7ZOnpkoBikUnqbCsMRl05CQ1ngRhWc46hCwkxQ60A3SmW69r+NItC8D67DOF0GvGlkfgFWsvGnB2Bzj6/aq++cOSM3WaeoPhgXxuT/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNxWuBgDy/T5D0c4qiiYTUOY0EkdQtRYYNNFtZ91icg=;
 b=XoSWXf8ZCh+X1AS9Qp0vPT7GrmbeGJtJHP0T4nXDotXGF65mA0TW1pQ5ETTlEm82zkpyorWQaVJGvjEoCU6KTfUeogp6Li3hxE6H6qZ4fEqTdQNNtl6gnrFe60rKdqVkuPW1ooQg8Oq4DgLGGxFbpCXHwKRyurw67pHC/r1Bm4mkxWkn3FfgrNkK1T/809u4Hv5dEMnXhKFHeH5mNxXDX4qtSY93P4zZvcXu2yV3ogdhTPmeWvxElw1tWsCbrJ/qC19Ea5OAQND5VDa3H8fbJje5JYRjRW0JLniP2TCQe8zuAPt5ZV44B9/7QoR3SRW3H2IULCu9lJYKrGUdk36YpA==
Received: from AM8P190CA0015.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::20)
 by VI0PR10MB8569.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:23a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 14:30:53 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:20b:219:cafe::41) by AM8P190CA0015.outlook.office365.com
 (2603:10a6:20b:219::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Fri,
 19 Dec 2025 14:30:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 14:30:52 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 15:31:37 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 15:30:51 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 19 Dec 2025 15:30:38 +0100
Subject: [PATCH 4/6] media: stm32: dcmipp: add Y10-Y12-Y14 in all subdevs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251219-stm32-dcmipp-enhancements-v1-4-e2f8d46f022c@foss.st.com>
References: <20251219-stm32-dcmipp-enhancements-v1-0-e2f8d46f022c@foss.st.com>
In-Reply-To: <20251219-stm32-dcmipp-enhancements-v1-0-e2f8d46f022c@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.130.74.193]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AB:EE_|VI0PR10MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: a1539ec5-e533-4616-04e5-08de3f0b366a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3NNSTlUMjlkckl3Y05mZXpkZzB1Vys5MXd5U29CYjBrQko0ZEpqanA3Z1Mw?=
 =?utf-8?B?ZVIzeWtlUStjRWxXQjYzQUxvQ0tWM2xRZEVaZjByTEhsTEowVjRqWGpIUHlm?=
 =?utf-8?B?ckNLWDZMMmVBeGM1OE5qRkNzKzF5QjlWZ1JxWEd2NlkrcWtUb2dpa2RoUmVE?=
 =?utf-8?B?S0tuYnltdGRCd2Z5UUlFNUZBSjh4TnFCM01iai96VWdKSlNSSWJicUZhaGdC?=
 =?utf-8?B?eGxyU3BlSzgyVjRPaEMyZk5vaFFsNFo3QytNR2hmNUlpU0VXZUVtZmJGRnM0?=
 =?utf-8?B?L2ZRWlRsdXRKRFNqeENBOWZmd05iRjdSdnA2OHVnQzEwVkp6WjQxYzNQUU40?=
 =?utf-8?B?Rkhzd3ZKRXFhMHUrVGRHa3F5L1VvVFlZY2xZVldleU05eVZRZHFhaXpyQjR2?=
 =?utf-8?B?RDFpcm1KYzZNOGpWVUF0czdXMVREc2MzZ25RYS9Kem5JZWlvdzNZV280VUVQ?=
 =?utf-8?B?N0VqWDV6VUNtNVBzeDNVOFplalljd0hhdFBFSi9QejVpRTBwNDBRdTU1UlBk?=
 =?utf-8?B?YXYxUlIyWUVKbElVbUxYTnR6U1BrNVhmNTVWVnZtRXNOQmV6T1JwWW1oMm9j?=
 =?utf-8?B?NFJuWjZzREhOcHN6K3I4YVRtQ1Fab0x1aU41aGZ1dnpVVkhRYldqWUpPZUhD?=
 =?utf-8?B?WTR0WmhkeEowSTFxVmY3NUU2RFlaQ2ExTHBESUtzWWF0ckNtRVFrSzNqekdx?=
 =?utf-8?B?VjB5UTJGZTBKR3NmRUQwQjl2RVRmTUtnVzJPN241aklqOWExZ3g3RnVXaWpD?=
 =?utf-8?B?alNDbk9IT1lhRUdaTmlVaXhNcW9wNjZYYlVuR0NBZUdCaWs3QmJ5eGthVmly?=
 =?utf-8?B?ank4Y0Q0RjNMcU9uUlMxVU5ia0Q0QllHaEx4TCsvQW9aUmxQZEVDemdvYTRQ?=
 =?utf-8?B?SUpUMnZOVXF5S1k3QVJOSTNZa2hZWFRDNmV2dkhoU2lXMmlCKzZLZHpGcXBr?=
 =?utf-8?B?RUtkci9ZUnZreVdDa20wQWJwKzZBVmVGK0U4dnd1cXRxUTVDWXU3cElqOWJu?=
 =?utf-8?B?SjNBd3RObDROdU5weWt2OHFZeU9kcS93VEE2NldpcEdJTGlqU3FUOUlkdnl5?=
 =?utf-8?B?NE1oYUxHUXBtS0hqYjIzVW9iYnhEN2tlRzE5clY0V1RObkYzSTZKZ2hnLzlZ?=
 =?utf-8?B?QVNmbXNDdXU4bjZGL0s4RVRaT3ltektybXZ0S0FQOVRlUlBoNkI2WFR1dkxv?=
 =?utf-8?B?ekF4SjdvVkJsa1QzdEhzcVJVaitQb1JRbTluenlBeW82L1ZFNlJMWGtqM1Vh?=
 =?utf-8?B?cXpKWk1zK1hYZ3ZqNUxlOG1mOE1jMUtKRzJycERkSDBodnFZSUxlYWJxa0Rk?=
 =?utf-8?B?aVEyRENCN3NaQnZRdmh2bjZoOFNuVkw1RGpuY3c4dnp2ZFZvaldRcjNJK0ha?=
 =?utf-8?B?MGsxVm1US2RBeVo5TEZNTGlUbTBFSWpGbFQxVkdZb0FYQlBoOXFtQTJMdGZH?=
 =?utf-8?B?ZitKaDloVjltSFFtVDZyc0svQzBtVmhOT2FadDBKY1JMVkQ3eHc4VUlnazhv?=
 =?utf-8?B?emdVZkR6ZTNXSTI4MytiS0pJU1hhcCsrM2lSaU9DUkQ0ZlRUNHZPU2dHNWRP?=
 =?utf-8?B?ZW9aWElkckJXUm9LY0JrY1c5WGVuNzVzcENLOEE2RTNlMFdhNGJvSkc1dFov?=
 =?utf-8?B?SDFkbkhocFRrTGdJK1B6K1F6K3ZFT214UzJ5MkdEQ3J0ekpYUWpLaWhpT1RV?=
 =?utf-8?B?RDBEOWdOcnRqOEJrRklRSmhxbWNQZkF4TzdXeVV5REdOTVFmYTRxanI4RUsy?=
 =?utf-8?B?TzFoTmZiV2Y1a3h6MzZmQnd6dUVxVXRXVDg4RGd4T2s4eG41V0FzMEI5SWUz?=
 =?utf-8?B?N3M0ZmhQVHI3QWNmbWlNaVBXSUVYdDBOS3E4QWtLU1Y0cDhjTkFlMm5hVExw?=
 =?utf-8?B?WTlqc0Q5WXA2bEh0RVN5RWhnVGNTMzNqNTZjekM5bG9yb2NhVzVFeHQrWWU1?=
 =?utf-8?B?bGxtK05yRlZRL0FkRUkvU3JVOTY2Z3dZeEhTY054dDdjOGsrYnQvWDZFYmtN?=
 =?utf-8?B?V3phemVyeE0zNWNrUDQ3RXRheVovVUUwTTlsT0lDK25ybkpXYldjclRxZG5s?=
 =?utf-8?B?elBLaC9RZ0pMdGhMbXFORHRLa040cEcrc2hPY21MZU1xOXFvaWZBZ3R4SGRa?=
 =?utf-8?Q?5ED0=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 14:30:52.2510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1539ec5-e533-4616-04e5-08de3f0b366a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8569
X-Proofpoint-GUID: NRG-AHbGy7ClfuI5YqD0W0byRtYUyP_Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyMSBTYWx0ZWRfXy/0ByDRBbzOr
 Vd6eQifLNlaKEiWB1fyDKo7v2ndWe+vbJ2+88E46zISA6A134ii6ZF2rnP0xrH2ZPzK9sgsUG4S
 fcRXtnEJZIDEWPSzRcnLcIj3kPcvfP2pZOCeKzm7umw8XmGb7ChkQKyqsp9LNgJeRC/WlgW+Mxo
 lrsCfMiP9B5/DG/jtZpwwjOcn+WG6qxVDql9ThjZVrnHasAkyn9CFKR1A1kSplY0xNU0dEO/EQu
 GYfxlyuPhkQ5gyAPu5oRML0JXYQfYEWM+DvQOAUNZpfcz1E/X3LKGLQm+Fr9VSytiQjZpCpl/k5
 RB1CvMT5Qp/YqPWnqvws40XZKcza4o0YjGd/zoh9vEelUoL8LNbffYUVQ1N8GVQk3J7lPJ4vsYF
 wdBqk/KcoRXSNVmNOJQ8/bbr6kHA4BLFLreFmldVnIRyGOSl7u3aSIKa9RnifHxp/dPyJNlP/Yv
 Fw7X1+8CKNJqiITBhUQ==
X-Authority-Analysis: v=2.4 cv=G+4R0tk5 c=1 sm=1 tr=0 ts=694561a1 cx=c_pps
 a=75iWbPoZHhoD3Jfch1nqtQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=LbXnUja61GXj8iswy4wA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: NRG-AHbGy7ClfuI5YqD0W0byRtYUyP_Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_133559_330401_60BEB15C 
X-CRM114-Status: UNSURE (   9.34  )
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

DCMIPP can handle Y8 to Y14 input formats however until now only
Y8 was handled. Add support for Y10-Y12-Y14 in all relevant
subdevs.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c  | 3 +++
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c | 3 +++
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c    | 6 ++++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index 6d42517817fd..dcb791c56d4c 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -67,6 +67,9 @@ static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_pix_map_list[] = {
 	PIXMAP_MBUS_PFMT(VYUY8_2X8, VYUY),
 	PIXMAP_MBUS_PFMT(VYUY8_1X16, VYUY),
 	PIXMAP_MBUS_PFMT(Y8_1X8, GREY),
+	PIXMAP_MBUS_PFMT(Y10_1X10, Y10),
+	PIXMAP_MBUS_PFMT(Y12_1X12, Y12),
+	PIXMAP_MBUS_PFMT(Y14_1X14, Y14),
 	PIXMAP_MBUS_PFMT(SBGGR8_1X8, SBGGR8),
 	PIXMAP_MBUS_PFMT(SGBRG8_1X8, SGBRG8),
 	PIXMAP_MBUS_PFMT(SGRBG8_1X8, SGRBG8),
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
index dde28ed288cd..f45a3027f8f3 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
@@ -60,6 +60,9 @@ static const struct dcmipp_byteproc_pix_map dcmipp_byteproc_pix_map_list[] = {
 	PIXMAP_MBUS_BPP(VYUY8_2X8, 2),
 	PIXMAP_MBUS_BPP(VYUY8_1X16, 2),
 	PIXMAP_MBUS_BPP(Y8_1X8, 1),
+	PIXMAP_MBUS_BPP(Y10_1X10, 2),
+	PIXMAP_MBUS_BPP(Y12_1X12, 2),
+	PIXMAP_MBUS_BPP(Y14_1X14, 2),
 	PIXMAP_MBUS_BPP(SBGGR8_1X8, 1),
 	PIXMAP_MBUS_BPP(SGBRG8_1X8, 1),
 	PIXMAP_MBUS_BPP(SGRBG8_1X8, 1),
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
index c44d664f6a0b..c4bc76909b1c 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
@@ -25,6 +25,9 @@
 #define DCMIPP_PRCR_FORMAT_RAW12	0x2c
 #define DCMIPP_PRCR_FORMAT_RAW14	0x2d
 #define DCMIPP_PRCR_FORMAT_G8		0x4a
+#define DCMIPP_PRCR_FORMAT_G10		0x4b
+#define DCMIPP_PRCR_FORMAT_G12		0x4c
+#define DCMIPP_PRCR_FORMAT_G14		0x4d
 #define DCMIPP_PRCR_FORMAT_BYTE_STREAM	0x5a
 #define DCMIPP_PRCR_ESS			BIT(4)
 #define DCMIPP_PRCR_PCKPOL		BIT(5)
@@ -89,6 +92,9 @@ static const struct dcmipp_inp_pix_map dcmipp_inp_pix_map_list[] = {
 	PIXMAP_SINK_SRC_PRCR_SWAP(VYUY8_1X16, VYUY8_1X16, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
 	/* GREY */
 	PIXMAP_SINK_SRC_PRCR_SWAP(Y8_1X8, Y8_1X8, G8, 0, MIPI_CSI2_DT_RAW8),
+	PIXMAP_SINK_SRC_PRCR_SWAP(Y10_1X10, Y10_1X10, G10, 0, MIPI_CSI2_DT_RAW10),
+	PIXMAP_SINK_SRC_PRCR_SWAP(Y12_1X12, Y12_1X12, G12, 0, MIPI_CSI2_DT_RAW12),
+	PIXMAP_SINK_SRC_PRCR_SWAP(Y14_1X14, Y14_1X14, G14, 0, MIPI_CSI2_DT_RAW14),
 	/* Raw Bayer */
 	PIXMAP_SINK_SRC_PRCR_SWAP(SBGGR8_1X8, SBGGR8_1X8, RAW8, 0, MIPI_CSI2_DT_RAW8),
 	PIXMAP_SINK_SRC_PRCR_SWAP(SGBRG8_1X8, SGBRG8_1X8, RAW8, 0, MIPI_CSI2_DT_RAW8),

-- 
2.34.1


