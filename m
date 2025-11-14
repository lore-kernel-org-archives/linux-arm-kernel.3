Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE998CE8D64
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 17:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zdgesra8sUsh2QVglCjzufnpeFIapWv6f1CrS9FLne4=; b=TzUBSLCZzmMM3cI0mokZRRePqS
	wWl09ekeN5aq6m0eV5ojZu3F19wmQbeiIXko6/CvnH6N1M0MKDbvG68O40jZNCj7JdnsDu3JbrZ/0
	By+G+fG7Qhb9rO3XCESB47d5DNth/01g60dFCPKSp0X9RBlBl6BDkf6gwtIb9DyHJbrL0aJfIcxs5
	EJCXugZSQK4Qu2t5ESfT1uoJ16kwtfZlIXE5BgMU3B/n1bi9tKW/7+ZSk11C4MNIXOu2Usoh8X2x2
	HthO5fLlAO2ZVpcx2zLGYz5BjHmE52/zwR8TRc2RJ0xY1dzD4AQb5fcWHP6CkpxtQlmxxPbwQdf/4
	isLNslxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxZB-0000000Cq0B-1iIX;
	Fri, 14 Nov 2025 17:26:33 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxZ1-0000000CpvZ-3yE3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 17:26:28 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEHBWvU2798644;
	Fri, 14 Nov 2025 18:26:14 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11010068.outbound.protection.outlook.com [52.101.84.68])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7j3xhg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 18:26:14 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmIDgc5176g7ncKRlb6jsumY83lMDgX8kQisEfgzZjfP6x7BdcHIMeVjtB9p4SKmJdtYCeoV4AvlNJ6z/fhR/tFw9Oke/JtyYph9XSn4eE8KEgWXueKiSM7UpdRytOfy9x1liAvwe/u90o1Ub60RRI4uQE0eHA/dn+vv6OuS0YCWaRCKgdJOwkQyFJDhculniQAnwbEZpBtoVtZGdhDsL4Qwk9/IiYoNt+sV6yrpoUiRsqcS1DPYO+3q4RRw4+28Lh1MhVhhZCfqSu2JFj/SOgcTjWsHhZsh+6vEhvoxzrjFHNRkRydCEf3d0DbCk6lmBy/4L/n2l3D4di66iWoDaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdgesra8sUsh2QVglCjzufnpeFIapWv6f1CrS9FLne4=;
 b=SNUe7PD3goJ0R3PTXcbnTMPA2y1ZW6fUmvVmixgx6z/9tAxT7nY1HlirOBXGm2X4FH+zmuTTHURtem4jv8bj401BVEiFNafqOXZF2fpYklmEcZdc8wh+OBq/YUCOntbOvbY6GpMjoinnA5qN72gj1DPqDrozYX3t9OZZqXaFly754qo+gf7orgbp+x2VcEjQddkMO/E8DMc8SNPXgS3D6DauYdWekllzt9/XB1fScCplhkY3x4ml0u/KX9WdFuAeFrbof93JzalQ2f3s+vAOUjwXscmxvxqXpc+HuxGxoRd/HBQiLd16kxowZ+teTwxSnvxJU8Q9xA8AlTmy7PPzyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdgesra8sUsh2QVglCjzufnpeFIapWv6f1CrS9FLne4=;
 b=OGJbS+Q/aXVNaWbaLzo+FUULVslcEBvfxxLwM1HKMBsZ/4Sx7+TqlENGlit75nKTMOOAGSSEvY7uMk+BYvMSEHrOp4xTMe7qxcCYiWJOoYb4CIJkT6AnG10e6UMGgOajHjjnlS1Ayp5uVyrr35ng77bfk8kKjGGwJiAuju4JxYdkOSTMNZgk6YulY2DIaAbOcZLbXTCPkEfKE5FCbre94UWsnieePNz/VvDbUBQI5XaxE51LuRmgCZef3XnCU/EsIMW7NAPWcAlVyiOa/rIcrLo9WMRVvy9ZQ3Q5H2HWRTEgP5MsRvBMgyd9H4xcfwd+NuXaduaZ6zW3G9i4WZwAqg==
Received: from DUZPR01CA0216.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::14) by GV2PR10MB9656.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:303::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 17:26:11 +0000
Received: from DU2PEPF00028CFC.eurprd03.prod.outlook.com
 (2603:10a6:10:4b4:cafe::eb) by DUZPR01CA0216.outlook.office365.com
 (2603:10a6:10:4b4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 17:26:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028CFC.mail.protection.outlook.com (10.167.242.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 17:26:10 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 18:26:21 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 18:26:10 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 14 Nov 2025 18:26:02 +0100
Subject: [PATCH v2 2/6] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics f7 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251114-upstream_uboot_properties-v2-2-3784ff668ae0@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFC:EE_|GV2PR10MB9656:EE_
X-MS-Office365-Filtering-Correlation-Id: 78ee245d-21ca-46b9-5963-08de23a2e7a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFVhL1JmeG1xeXJXVVlOQUtBM0F2SFpraC8ybVI2MGhwanVXdlFuWFBBYW42?=
 =?utf-8?B?RXhzQnY1L0FsV3lxajBuUmtjNEdUL2lKbFpuUzA5cFQ2SHgyNTZEQysyalps?=
 =?utf-8?B?bCtRWHZiR2pkQ09JLzBtMnZnS3diQ01rMjNwaWt1Tmp0cFVvc1ZsYXBLa1g5?=
 =?utf-8?B?eEMrRlNibm5CWUl0SmcrYTVCS2JyOUxTNDdYMS9lZkdOSnI4M1VBK1FJQzVa?=
 =?utf-8?B?cWZiL3pLUlNpR20wYk5oeElkd3RTZ0NsQXhqSmV5blNtUU5zMnY1WU5yZ0o5?=
 =?utf-8?B?OU5ZKzlxMFdVTElXaWJtdG45bE5jMVVyeW1JWElhbHY3bGw0WGFDREpZVitN?=
 =?utf-8?B?S0pmb2N5Wkw3VGZlb1RzS2dmWCtycE5QaVk0d0p2ZG5teUFzTDkzQTk2VzM0?=
 =?utf-8?B?ZjN3aXFwZTlKS0I5eCtuRGkyRXF1U05uYlhURHpVRlZkdVlBL20wcVZmTkNu?=
 =?utf-8?B?ZzN2TGdLTXRJa3dOaDhBVkx0aFJqMHVOR3NORnBPdS9jYUxoL2FBMXp0ek5G?=
 =?utf-8?B?RVV1UFJqY254dC9qcmtGU1UvM1F2ZVJQZzhNaFlHUjZoVUQ3ZXpNcDBYeE1H?=
 =?utf-8?B?WWlneGtpL00vR1dpSEZZejhvM0RpK2kyeE5pWmd5dnN4Y3RnQmhSK0lObnN2?=
 =?utf-8?B?ZjZFQkJzUlJ0emVlQkN0dWwwbVJsWkEya0YzbmZ2Y1hqRWR4VTZObGUra1Bi?=
 =?utf-8?B?ZTM2NnQ3K2ZranQ3WGNZVWQ1aGROUUxlUWVkSi8ranp4aXZyLytkcHJ3NkdG?=
 =?utf-8?B?eFJmaTdtTWUwRFM3UTZNdFA4TE9SZWVvbGtodFpWZnVjM2s4WUdpNjNZQUV2?=
 =?utf-8?B?U2E2ZmhPT2oyUlhsWVVzL1ZqaG5ITmhXbE9VZmk4SENmYXV2NHR5eXhpK1NS?=
 =?utf-8?B?YWFWeDZtNzBrRUh2eUNHZHArOGhNTlovL2p0T1JwNVpmV3BJSzRWdm9aQXFv?=
 =?utf-8?B?b2s4Szc0RitIc3Ivb1Y1Ymtod2gzMkpuZmJrREVvT1hOVlJtU3lmNVVuanNY?=
 =?utf-8?B?WXQxSXFpRlVyOUQxSmc5aGVtaVFQY2ZtdjJFbTQzdndWc0lHR1VzOFVCUkhH?=
 =?utf-8?B?RWdlZ3FPNG5sc24zZTgzZWtDVVFyTkkzamhyS3FUc2JFRFFhdDBFc0svaE9a?=
 =?utf-8?B?MFFGQkVsZE1kMUZRVnRxVTErNzNQaHZKU2cySUx3T2lWbVVneHZFL2g2eWYw?=
 =?utf-8?B?bVczQTBRelFZNlp6STJNeVdOanJmdkFwb0FWc1kwRENoY0pTejdDb3lGL1pk?=
 =?utf-8?B?RVd4Z3c4Y3JxUWxQRkY3ZFd0K2dnZnVpUHpKSGU0OFJkeUNWTFRTOGNNcXMz?=
 =?utf-8?B?RGtWY3JycThlUG5IMGVjb1N2KzBMaCtIVm9PeXgxVldKaEI0Um9iNXhNYkhj?=
 =?utf-8?B?S0h0bm5wVmNpZDdxRTlnUStMSEoySTJMTkVKdXdodFZRODh1MmV2RjJreC9y?=
 =?utf-8?B?eGhNbkxYMC93aE5jTWh0bGluL0pBSTk0aFp1cE1aTDlabWRjZGViTjQrcDJK?=
 =?utf-8?B?c3doQjhOcEFVdURKRm9ab1AwK0UzQ2ZqZkk5OTRJWkpHRGVHMUVSMmJuZ0k0?=
 =?utf-8?B?ZWhrcHJVdDJtemlhQm14TFhOdjVuRC9Ja01EdUlOMktvMERQZ0JNRDJIbklE?=
 =?utf-8?B?eXNaWE9ESnNuRlYwclZwWUJiZ0RFaFhDYXZIN042Y0NGdkFNUGZOaW5aVVNK?=
 =?utf-8?B?cjZBZUw5dFlKaXNIT3V4VWVPRTQ2N2piY3FCNHFqV3Z2OFgwMVh6eS81VG02?=
 =?utf-8?B?WThlWXJFS0VuWkJicDIxUHZveXZJdGNLcWdqd2NMTTlQN3U3U215Y2E4emgy?=
 =?utf-8?B?dlU4TEpWTnVMbG91Y09OR3h5K3Uxd3kvZUd5YThNOUFIdDRHZzlNQkpTSnBj?=
 =?utf-8?B?T21HYVUyenVXdTBvSEgwVU1qQ3huRVZIOWlXc2IxYTgwY0h2d0dBazRlY0c1?=
 =?utf-8?B?c3FubWFsQ28vSWVCSWsralVDTnJUSEZ0aEhJaHQvaERpNTh6RmdtQmtoL25N?=
 =?utf-8?B?RlN5NHVZMGlNVHc2ZWpIanhkanNoSzdOYVR2WXJ1akhYeGxQN0ZLRHdTZFhZ?=
 =?utf-8?B?M1lrWjRZcCtqVFhrZlhPVkk3SXUrc2NvTTl2b1Y1b1lISGRCekxPc0gyMnA1?=
 =?utf-8?Q?YkWU=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 17:26:10.9867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ee245d-21ca-46b9-5963-08de23a2e7a1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB9656
X-Proofpoint-ORIG-GUID: aRj6LLo6cNgS9PagUEyIF_KzG2VrlnLa
X-Authority-Analysis: v=2.4 cv=DPqCIiNb c=1 sm=1 tr=0 ts=69176636 cx=c_pps
 a=jcIAchfDan2QaPLKFZfxcQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=fTQ55MeeFdhIrGqxLO4A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE0MCBTYWx0ZWRfX642Znr+hRdpN
 qaJegSgw97oHw/VLFpAYMMsEJWJQ8D3wokSx+SDgV/o1xI1p+4g4uj2qogI54N7uHZy81mZeYhd
 GWiSruNioLtzd+fe9W1ZGxsJ10NIF4mm2JyKlCQo9iKAaZkcY0zSd6ZfyOzZPiiwqnn0ZzOfkD+
 pe/zS80Ro9Km8Q44pSI53x1hR3Zs2vcCIgsopSUynxC1AzaF5isGGSLcWBs9KjzVylhNgppV/ok
 6RC9g/e20K9GL3CObDxMD+loTi9o2K1j0QfbdWS0w2JtKS9JE31qH1mzgUsT/F0QElCQle4ZR1L
 O21qMy1CnUL/CDaV1zjdLXKrd+9j7WrfOEjG2aL7FT06D3LZB6JsFXwntOhokU4XNO0ECAbT9GF
 0cJQ32iArvdCd2vrslirIY1NyIVkxA==
X-Proofpoint-GUID: aRj6LLo6cNgS9PagUEyIF_KzG2VrlnLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_092624_586118_B4BF7AF3 
X-CRM114-Status: GOOD (  10.88  )
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
 arch/arm/boot/dts/st/stm32746g-eval.dts   | 10 ++++++++++
 arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi | 11 +++++++++++
 arch/arm/boot/dts/st/stm32f746-disco.dts  | 12 ++++++++++++
 arch/arm/boot/dts/st/stm32f746.dtsi       |  5 +++++
 arch/arm/boot/dts/st/stm32f769-disco.dts  | 12 ++++++++++++
 5 files changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32746g-eval.dts b/arch/arm/boot/dts/st/stm32746g-eval.dts
index e9ac37b6eca0..26c5796a81fb 100644
--- a/arch/arm/boot/dts/st/stm32746g-eval.dts
+++ b/arch/arm/boot/dts/st/stm32746g-eval.dts
@@ -213,6 +213,16 @@ &usart1 {
 	status = "okay";
 };
 
+&usart1_pins_a {
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
 	dr_mode = "otg";
 	phys = <&usbotg_hs_phy>;
diff --git a/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
index 97fc3fb5a9ca..6b01c3c84272 100644
--- a/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
@@ -24,6 +24,7 @@ gpioa: gpio@40020000 {
 				reg = <0x0 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOA)>;
 				st,bank-name = "GPIOA";
+				bootph-all;
 			};
 
 			gpiob: gpio@40020400 {
@@ -34,6 +35,7 @@ gpiob: gpio@40020400 {
 				reg = <0x400 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOB)>;
 				st,bank-name = "GPIOB";
+				bootph-all;
 			};
 
 			gpioc: gpio@40020800 {
@@ -44,6 +46,7 @@ gpioc: gpio@40020800 {
 				reg = <0x800 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOC)>;
 				st,bank-name = "GPIOC";
+				bootph-all;
 			};
 
 			gpiod: gpio@40020c00 {
@@ -54,6 +57,7 @@ gpiod: gpio@40020c00 {
 				reg = <0xc00 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOD)>;
 				st,bank-name = "GPIOD";
+				bootph-all;
 			};
 
 			gpioe: gpio@40021000 {
@@ -64,6 +68,7 @@ gpioe: gpio@40021000 {
 				reg = <0x1000 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOE)>;
 				st,bank-name = "GPIOE";
+				bootph-all;
 			};
 
 			gpiof: gpio@40021400 {
@@ -74,6 +79,7 @@ gpiof: gpio@40021400 {
 				reg = <0x1400 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOF)>;
 				st,bank-name = "GPIOF";
+				bootph-all;
 			};
 
 			gpiog: gpio@40021800 {
@@ -84,6 +90,7 @@ gpiog: gpio@40021800 {
 				reg = <0x1800 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOG)>;
 				st,bank-name = "GPIOG";
+				bootph-all;
 			};
 
 			gpioh: gpio@40021c00 {
@@ -94,6 +101,7 @@ gpioh: gpio@40021c00 {
 				reg = <0x1c00 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOH)>;
 				st,bank-name = "GPIOH";
+				bootph-all;
 			};
 
 			gpioi: gpio@40022000 {
@@ -104,6 +112,7 @@ gpioi: gpio@40022000 {
 				reg = <0x2000 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOI)>;
 				st,bank-name = "GPIOI";
+				bootph-all;
 			};
 
 			gpioj: gpio@40022400 {
@@ -114,6 +123,7 @@ gpioj: gpio@40022400 {
 				reg = <0x2400 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOJ)>;
 				st,bank-name = "GPIOJ";
+				bootph-all;
 			};
 
 			gpiok: gpio@40022800 {
@@ -124,6 +134,7 @@ gpiok: gpio@40022800 {
 				reg = <0x2800 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOK)>;
 				st,bank-name = "GPIOK";
+				bootph-all;
 			};
 
 			cec_pins_a: cec-0 {
diff --git a/arch/arm/boot/dts/st/stm32f746-disco.dts b/arch/arm/boot/dts/st/stm32f746-disco.dts
index b57dbdce2f40..9545b14d77c3 100644
--- a/arch/arm/boot/dts/st/stm32f746-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f746-disco.dts
@@ -169,6 +169,7 @@ touchscreen@38 {
 &ltdc {
 	pinctrl-0 = <&ltdc_pins_a>;
 	pinctrl-names = "default";
+	bootph-all;
 	status = "okay";
 
 	port {
@@ -207,6 +208,17 @@ &usart1 {
 	status = "okay";
 };
 
+
+&usart1_pins_b {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_fs {
 	dr_mode = "host";
 	pinctrl-0 = <&usbotg_fs_pins_a>;
diff --git a/arch/arm/boot/dts/st/stm32f746.dtsi b/arch/arm/boot/dts/st/stm32f746.dtsi
index 208f8c6dfc9d..b0f012de759c 100644
--- a/arch/arm/boot/dts/st/stm32f746.dtsi
+++ b/arch/arm/boot/dts/st/stm32f746.dtsi
@@ -54,6 +54,7 @@ clk_hse: clk-hse {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <0>;
+			bootph-all;
 		};
 
 		clk-lse {
@@ -76,6 +77,7 @@ clk_i2s_ckin: clk-i2s-ckin {
 	};
 
 	soc {
+		bootph-all;
 		timers2: timers@40000000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -149,6 +151,7 @@ timers5: timers@40000c00 {
 			reg = <0x40000C00 0x400>;
 			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM5)>;
 			clock-names = "int";
+			bootph-all;
 			status = "disabled";
 
 			pwm {
@@ -645,6 +648,7 @@ ltdc: display-controller@40016800 {
 		pwrcfg: power-config@40007000 {
 			compatible = "st,stm32-power-config", "syscon";
 			reg = <0x40007000 0x400>;
+			bootph-all;
 		};
 
 		crc: crc@40023000 {
@@ -663,6 +667,7 @@ rcc: rcc@40023800 {
 			st,syscfg = <&pwrcfg>;
 			assigned-clocks = <&rcc 1 CLK_HSE_RTC>;
 			assigned-clock-rates = <1000000>;
+			bootph-all;
 		};
 
 		dma1: dma-controller@40026000 {
diff --git a/arch/arm/boot/dts/st/stm32f769-disco.dts b/arch/arm/boot/dts/st/stm32f769-disco.dts
index 535cfdc4681c..539517c7991e 100644
--- a/arch/arm/boot/dts/st/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f769-disco.dts
@@ -133,6 +133,7 @@ &clk_hse {
 &dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
+	bootph-all;
 	status = "okay";
 
 	ports {
@@ -178,6 +179,7 @@ &i2c1 {
 };
 
 &ltdc {
+	bootph-all;
 	status = "okay";
 
 	port {
@@ -221,6 +223,16 @@ &usart1 {
 	status = "okay";
 };
 
+&usart1_pins_a	{
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
 	dr_mode = "otg";
 	phys = <&usbotg_hs_phy>;

-- 
2.43.0


