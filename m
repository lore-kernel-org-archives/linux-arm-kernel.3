Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5712FCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6w3rrJHDXH3gZJo7K9Cu48MXav0WVtIvRr/eQOeJnZ8=; b=Ey7TetM4g4D5Cln4rxjvbFFyTK
	kBkUIClJ648NxxSP/0HrNmPDauJpl6eE+JycGU1l7IaCDjyoqedPwsaVQ0MAnrnsCrRXBo/i6vsuR
	2hJ+lO61YNIutQqMVf8UcPDeF/jPz4ZfFqIZiga5e5nrxMKXjnTVgKzGd9zWV2TocRWpWDOnHgzbt
	WxxgFrgwohxqHy67nbiE0V14g9JU/1roL6Zsbo4NkvBWsgwpn6Mjw0dBgG/KL8YAz611bLWX/T4xG
	Acicr9bpcEOrADJMW1tolps7h0hMT12lL5+DgKArupyHm/gNkH+2+OQnvVQnQnUaj7QSWPNCYJOZK
	O9caS52w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8Nx-00000008bWV-3w24;
	Wed, 12 Nov 2025 10:47:33 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8Nt-00000008bT6-0CET
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:47:30 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACAXZek523393;
	Wed, 12 Nov 2025 11:47:15 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com (mail-francecentralazon11013068.outbound.protection.outlook.com [40.107.162.68])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4acq20gke7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 11:47:15 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1JmYViiPjMfaFt+DUBPadcTvp3FTknCkY/1IMRF20JtcdDMqvx9qXv2nryueUcVHedUAF3tdaaw8kpeT5qlf4ninDEifpA5gJE/If2qtCLoGToLMqjCZue4Dp69XB6Jo0dok/i0dfar1SiH8IoNvaI3kYPr/Xx6oghJbE0y+LLmC56o19kGNne5qL5QzoQcyFbjRQJRUpU9fjzchq0reLw18oBa2s7VqqidHgha/fglA4l0fERORHUC2lW5e8F3tAN8QxqP0fJ97SwlJvASni4rPl4s5FX2QfXrnfykZnOD1yvs1M+JIvK4L0C9EUQHc8t2fOEMPhKk9oyJFAN5+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6w3rrJHDXH3gZJo7K9Cu48MXav0WVtIvRr/eQOeJnZ8=;
 b=syWo2yoXItcn8nPFGnZAdMqrM3qSb5t4KPQcSnZnZMjL9WNUC4d/AHdLy2f9H+dnYCuTssv4aGpByvKEYILzyDHhikLMq3X6c0NPwWa6gqE/3mdrhgfA6l+Q/KPUj7qDYJqYNRVQf6VuNLC2z7IRZFiypV2tnrxyKbL3P4msUhTQ5IOkWhHca6xeqijFhUOpKOT/VIm4f7dFp/bbCbIhroRXb/75a6/H5xsFr63LgSktbdEnH3QxXRDXaEpybEdmLylAI0jhalddP4UbnNq3q3p2VntqKPvR/afaPsfPLK0G1s4mavfghx0Fao07iDwBeoS5Bc3CXYbhTa8ME+OIkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6w3rrJHDXH3gZJo7K9Cu48MXav0WVtIvRr/eQOeJnZ8=;
 b=hI5F9PyVQFPJ/icbcioHU2vaGJyQaxw72zMe+4a67itBsTrc10aj9tz3OKjDyhrmJoDhpl36M1RkpSjps1mdt27z3RYSs7oAT0cXFrgavpe17Fo/F43vCqn6uLtju/fXs186d9ZSr2Zd2H2FTNzmdCaNLbGGbSlD7zusmGa4aBTdVApjuMRHCrSvuwfgwQX4NdLQ3ZQnp12QlJxx+D/3lu3QW10NgDzaWrysVoMPDa0BixV6WgiLpyexJNUBvJ0a34K96K0b6ZmzkVLcs16+YszETkcJybwDv0zvsw4r95E7jLubdYw6ahzDDRfjfoZ1do5E9DB87q+ub6MVrRN8nA==
Received: from CWLP265CA0504.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18b::23)
 by DB9PR10MB5980.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:39f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 10:47:08 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:400:18b:cafe::52) by CWLP265CA0504.outlook.office365.com
 (2603:10a6:400:18b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Wed,
 12 Nov 2025 10:47:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 10:47:07 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 11:47:16 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 12 Nov
 2025 11:47:07 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 12 Nov 2025 11:46:46 +0100
Subject: [PATCH 4/6] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics mp13 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251112-upstream_uboot_properties-v1-4-0b19133710e3@foss.st.com>
References: <20251112-upstream_uboot_properties-v1-0-0b19133710e3@foss.st.com>
In-Reply-To: <20251112-upstream_uboot_properties-v1-0-0b19133710e3@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA0:EE_|DB9PR10MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eeaee40-68c5-4f90-b43a-08de21d8d38f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjU3WlhoeWl1aDhYT1MrRm8rY1M3RG5hbDM0K3BSL1ZZamRZQVp5Y1J2SkYy?=
 =?utf-8?B?Q1BCUkVQZ05KUTdzQ2c4U20xa0pYYjN1aHA5ZDFvR0JpYnFFeXRxZkdUd1E3?=
 =?utf-8?B?RENvWFBDVTA5anVqQnNLUjBtRlEwNlpXOHdrcTdKYlNZc0RpYStMVU1OZmFs?=
 =?utf-8?B?dFh0NytZQWRHTmdSZEhDMUpFa3NpTnJJYWpiQ0lsQkEydGZlZWtqQ1J4K1dr?=
 =?utf-8?B?eWFTKyt1WGlvZ3hqRVp1akZFQXF5L1IvRDVrZXR0OHBsSFZ2Uk0wVVM1MkJW?=
 =?utf-8?B?SS9vYUhpN0hOVEhGazJYd21jcGNUNzl5SVlCSnFUWE1pa3hXeWI4dFppZ3Jk?=
 =?utf-8?B?MnRvN0ZISDJvaklaR1ZrV1dHUU9tY1VNTGR5VjBvdm9GZU9ZNFdNeUVhWFpR?=
 =?utf-8?B?MHErUC9PQjBWYkY1bmF4ZlhYY0d4ZnowbThxTEhwRU43M1lUVFNtN2lBMjFo?=
 =?utf-8?B?MmZGa04xeTN6MytaU1NQQ1B0d3o0WG1xaW1LRDlxc0paY1B6RkdnMGh5Q25Z?=
 =?utf-8?B?Z1I3d1cyai9wSmhhZFFjd21VNTdyNXl6L3ZwOCtDbEVUa3c5YlV5L0JrQnhh?=
 =?utf-8?B?ZTJPYXlWQXY5Mkp3cEN4SFBOUGtHMEVPQVVjMk85cjRMZTBjc0J1MzNPU2Vj?=
 =?utf-8?B?ZXk2aTQ0SDhnQXpNUTVUdGRYTkczT1l2bWE1SXdGbW9MeW1PeEhGekxZeWJw?=
 =?utf-8?B?NFoySTUyUklPeFNKbG1DN3EwRWVFVGduRnBacmZGeWEzRXQzMTA0U05tenNS?=
 =?utf-8?B?VFUrUFFKZG9PR0g0bmxhNVVjRStjSDYxcXgxdFRVRWlyY2ZFbTc2Qm1RVWkz?=
 =?utf-8?B?ckwralU1cUJZamZQTGFDY2grTzFXeWxrUGJuKy9ocGg0RFFsOThoYzJsdlJP?=
 =?utf-8?B?VjFUNU1ZbVFHTE43VVQzQk5XcFV4MFdLTVlXRWNMUTg3SHVjeE1Da3pBSFFZ?=
 =?utf-8?B?NzdSNkgwZ0RGbGJOdlVWZmFqMU9GWkJxeUVaV2M5UGl3WTR1eXpOQlMzTWlJ?=
 =?utf-8?B?WXFxNTljUTIxSU1ISElNZlNqeXhjSW94R3VYZEZQRW5MV1d0S2h5REg5UEIz?=
 =?utf-8?B?QUNObElZT1ZURG1pejJOQkEvWmZYZk9Vc3F0M1o0ZkNCdFFoM0MvMm9RSVNU?=
 =?utf-8?B?SHliRWZKMzFTRlZGSEUvVktDOUIzNC80TEZYRk9HeGlzcVpLVnV2aGEvQmlk?=
 =?utf-8?B?dy9vaVQwcUdWTDhaeGdwbEFkNlZEOUI1U2JIWjVKeEtFa05nMU5iSW1FMlBq?=
 =?utf-8?B?UDRyWEZaTVJFOW8rVXVMYk9KdXVHWmtRTElmWXhySTlWYlNKa1hKa2w2OGxJ?=
 =?utf-8?B?NzR4VVJRVnJhRVUvVWh1YU9mUjA1bmQ4UXlJYzhOUnNUcHZXZGxPSXFOUmJW?=
 =?utf-8?B?V3Jzdm8raC9DcmRqbG5UVUVzOWwybjJEampBR21UNE1qbzhKZzFYbmZsTk10?=
 =?utf-8?B?aWVJZEVrQVQ2RW5GZ1lSamRjVHczQ3poVnBzYXl3L281aWFhU012TTRrcDB5?=
 =?utf-8?B?N3l2YWtlS2VqTW5jZTl2OWtBNVlFRnphOUFYSnk3TW1ldjR0dFl6dUlyMjRO?=
 =?utf-8?B?YXVvMm16cDBicmpiWFJMaHhNWWlzSEpISzZjSkZ6OEY2bm5GVm54VlIzdmJa?=
 =?utf-8?B?R2hUb0xPaTI0Q2JHWkZ6ZTBCS09SY3dTR0F3VDFTMHR6STRNZjlWY0pjYkZR?=
 =?utf-8?B?M2ZxcDVJVEp2eFFYOXdOZE9ySVdsUzdsQmNHVnFIS29sOVJXYWpHcitDYWJX?=
 =?utf-8?B?R1oxUGc5UVArdUpiSWJESm1VV2tNZFhZRWhlVXZyckRUZ2hQUzVjOENVUVlw?=
 =?utf-8?B?bFBNZlRPZkkrTTIrZ25MaFFFeVFYcGFVVDJjSmtLa2JETDJxOWVjWDZKdHcx?=
 =?utf-8?B?a3EzaDI3cnJJeW1EZVE5YnZBc1Z6Y21SSk1ZL2tEcjA0RmdacWhyYXVmZlY0?=
 =?utf-8?B?c0VZMGdtRDZ6Z3pEU3dnYndDNnAxN0xSMWp5YzRBd01zd3J1OHA5MkM0K0Fn?=
 =?utf-8?B?RThLYXcvRit1a2ZDMjgvNFd6Q2NzdTNaNHNKNUxaMU9ScHFvZGlYV05xUlVY?=
 =?utf-8?B?VGhSSzlCbys1d09tNU9Iai8rdjU4ek1XSkx0WU1wQkpqdzZzZGg2YklNYTlt?=
 =?utf-8?Q?7Fu4=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 10:47:07.8450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eeaee40-68c5-4f90-b43a-08de21d8d38f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5980
X-Proofpoint-GUID: hPqdmMMl_R9yKjCGOlddvq3P4p0j_6X8
X-Authority-Analysis: v=2.4 cv=LaQxKzfi c=1 sm=1 tr=0 ts=691465b3 cx=c_pps
 a=cyhFtQRhg4USMAHCudA+lA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=Ml00H7WYq3aDj7q0dhMA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: hPqdmMMl_R9yKjCGOlddvq3P4p0j_6X8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4NiBTYWx0ZWRfXwdpm/0wGYjU6
 KlzPS+pIUkuIF8cahByGExLg3cWw2bUXfbrRSA2/a3p1Sw/uYmGjIEY/HKGmBPVUA16/ZFNbDt6
 AVmuYjdR476v+X2s7iH3M2bxTv3dalZAsRgNFlItRJsj5IcuuYBRxduConJj4LUZvTqMHOv+eHS
 2p4XAz8sh4A9bU2vrf5AyIUSydFO8gyfI7/zZhRbiuLBTy2gdMGaH4fBJ1vCaC6WCf6PPL6BQCr
 Z+0kmebCksshW/p9wZv4gsd7+PMlpXyQ4EsQ9lmcU26hBU1jVcS/6b0HQmciBfw9HVCn8lDkldG
 PTXMLaAOlD+GlpFiHW+hurzlJKgErRRKr9vY8rmOLRnMOe+s3nbly4JBPGBaTBM4xUV9ivp8/gP
 wvoim9pJlEN7PskLcePJPBlUomvrEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_024729_408854_235CB29D 
X-CRM114-Status: GOOD (  10.85  )
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
 arch/arm/boot/dts/st/stm32mp131.dtsi    | 21 +++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 11 +++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index fd730aa37c22..26c3b5529582 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -35,6 +35,7 @@ optee {
 			compatible = "linaro,optee-tz";
 			interrupt-parent = <&intc>;
 			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+			bootph-all;
 		};
 
 		scmi: scmi {
@@ -42,15 +43,18 @@ scmi: scmi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			linaro,optee-channel-id = <0>;
+			bootph-all;
 
 			scmi_clk: protocol@14 {
 				reg = <0x14>;
 				#clock-cells = <1>;
+				bootph-all;
 			};
 
 			scmi_reset: protocol@16 {
 				reg = <0x16>;
 				#reset-cells = <1>;
+				bootph-all;
 			};
 
 			scmi_voltd: protocol@17 {
@@ -88,6 +92,7 @@ intc: interrupt-controller@a0021000 {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		bootph-some-ram;
 	};
 
 	timer {
@@ -131,6 +136,7 @@ soc {
 		#size-cells = <1>;
 		interrupt-parent = <&intc>;
 		ranges;
+		bootph-all;
 
 		timers2: timer@40000000 {
 			#address-cells = <1>;
@@ -791,6 +797,7 @@ rcc: rcc@50000000 {
 				 <&scmi_clk CK_SCMI_CSI>,
 				 <&scmi_clk CK_SCMI_LSE>,
 				 <&scmi_clk CK_SCMI_LSI>;
+			bootph-all;
 		};
 
 		pwr_regulators: pwr@50001000 {
@@ -900,6 +907,7 @@ syscfg: syscon@50020000 {
 			compatible = "st,stm32mp157-syscfg", "syscon";
 			reg = <0x50020000 0x400>;
 			clocks = <&rcc SYSCFG>;
+			bootph-all;
 		};
 
 		lptimer4: timer@50023000 {
@@ -1003,6 +1011,7 @@ iwdg2: watchdog@5a002000 {
 			clocks = <&rcc IWDG2>, <&scmi_clk CK_SCMI_LSI>;
 			clock-names = "pclk", "lsi";
 			status = "disabled";
+			bootph-all;
 		};
 
 		rtc: rtc@5c004000 {
@@ -1020,6 +1029,7 @@ bsec: efuse@5c005000 {
 			reg = <0x5c005000 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			bootph-all;
 
 			part_number_otp: part_number_otp@4 {
 				reg = <0x4 0x2>;
@@ -1646,6 +1656,7 @@ usbphyc: usbphyc@5a006000 {
 				vdda1v8-supply = <&scmi_reg18>;
 				access-controllers = <&etzpc 5>;
 				status = "disabled";
+				bootph-all;
 
 				usbphyc_port0: usb-phy@0 {
 					#phy-cells = <0>;
@@ -1670,6 +1681,7 @@ pinctrl: pinctrl@50002000 {
 			ranges = <0 0x50002000 0x8400>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&exti 0x60 0xff>;
+			bootph-all;
 
 			gpioa: gpio@50002000 {
 				gpio-controller;
@@ -1681,6 +1693,7 @@ gpioa: gpio@50002000 {
 				st,bank-name = "GPIOA";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 0 16>;
+				bootph-all;
 			};
 
 			gpiob: gpio@50003000 {
@@ -1693,6 +1706,7 @@ gpiob: gpio@50003000 {
 				st,bank-name = "GPIOB";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 16 16>;
+				bootph-all;
 			};
 
 			gpioc: gpio@50004000 {
@@ -1705,6 +1719,7 @@ gpioc: gpio@50004000 {
 				st,bank-name = "GPIOC";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 32 16>;
+				bootph-all;
 			};
 
 			gpiod: gpio@50005000 {
@@ -1717,6 +1732,7 @@ gpiod: gpio@50005000 {
 				st,bank-name = "GPIOD";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 48 16>;
+				bootph-all;
 			};
 
 			gpioe: gpio@50006000 {
@@ -1729,6 +1745,7 @@ gpioe: gpio@50006000 {
 				st,bank-name = "GPIOE";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 64 16>;
+				bootph-all;
 			};
 
 			gpiof: gpio@50007000 {
@@ -1741,6 +1758,7 @@ gpiof: gpio@50007000 {
 				st,bank-name = "GPIOF";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 80 16>;
+				bootph-all;
 			};
 
 			gpiog: gpio@50008000 {
@@ -1753,6 +1771,7 @@ gpiog: gpio@50008000 {
 				st,bank-name = "GPIOG";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 96 16>;
+				bootph-all;
 			};
 
 			gpioh: gpio@50009000 {
@@ -1765,6 +1784,7 @@ gpioh: gpio@50009000 {
 				st,bank-name = "GPIOH";
 				ngpios = <15>;
 				gpio-ranges = <&pinctrl 0 112 15>;
+				bootph-all;
 			};
 
 			gpioi: gpio@5000a000 {
@@ -1777,6 +1797,7 @@ gpioi: gpio@5000a000 {
 				st,bank-name = "GPIOI";
 				ngpios = <8>;
 				gpio-ranges = <&pinctrl 0 128 8>;
+				bootph-all;
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 9764a6bfa5b4..a05d458c9b37 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -517,9 +517,20 @@ &uart4 {
 	pinctrl-2 = <&uart4_idle_pins_a>;
 	/delete-property/dmas;
 	/delete-property/dma-names;
+	bootph-all;
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
 &uart8 {
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&uart8_pins_a>;

-- 
2.43.0


