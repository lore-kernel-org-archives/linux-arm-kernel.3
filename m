Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E39C982D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 16:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3NWBBrQwsD6pUIVyRPrwI/MHLBw5cBhLdN2ZEoHg2Tk=; b=RRD2WgTgKG2Fh7sznTbQlqJbj4
	Xg6dzwfC2ichG2Z81yByGtElnjwZHcrR7oeMQojKl3iQblobrCe2DRWJVuPL66iJO0Uso/0nHkDsA
	Y7F1HzCGP54+048ziR9NFVZb+9HrUgsvz8Ge9YSub7KVnLIU3xTRwFPq8lTNhE5z1/R1fokMbVAiK
	ftp3fL5mouWREWtaJJPpzlVYYeNggqcdPGShnG1zFXXyAjKn2EtiEzF2rOUHZAVVWOarRHr2YSNul
	syITXw1Z7a+ZjYFHtoDIqZYeK5Urgj70VwlNYMeO//y7o/9FaAWddfKCPNfrF9QTMH41F8pW/Kr6C
	6VHoKeLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgmjq-0000000ETUP-0ir7;
	Fri, 16 Jan 2026 16:31:54 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgmjn-0000000ETTt-0PBp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 16:31:52 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GG9ddU1682518;
	Fri, 16 Jan 2026 17:31:36 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013029.outbound.protection.outlook.com [52.101.83.29])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bq94k35kq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 17:31:36 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enuIRkBIcvay/36teFvzoDF/wJR8BJZQFxyX72/TY16V2oG0aBs9NR5g2BNVIbGJBzE+WeGG6lXaUhmqJ0rlJYNnaGdTnYjT0LeGHb0W/RNQB+TA2rb4k6AkmlgL32VK6Tl+lRfeoXq2MPTaAQZcjvSiGKL0SR6S3WYNA9tvVUJq0fA3JvtQtRt/Q90lIiAscsf8epexEE/swpLgBShovHkac6cbudOwwLvn2FxGjxSiF9W1stcMgORCayzuswqAeMOCniMraslZ/f4zRqwEuSRKCv56K1EBrDQv70haf2lPVGEkCtBGPI/MIS0yyal2vo/wpykv2dDY14qfYV3INw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NWBBrQwsD6pUIVyRPrwI/MHLBw5cBhLdN2ZEoHg2Tk=;
 b=ogXQ4hTFYg6RPC50+kr4R2H3K6W2PkVnGuA/VXhx4T4wPoKNuDMJ1FcfN0cdxebtenhGgDGgd42v0CpNlECjbCGgNV6P6hyADc5NcJrte50/koTPNVf7WkQKOvO52z3ynkYDpYRA7KVbPfmEOwLUmaj8vFb6TDOaQRg2lmstDYo3aU7h+QhCCGXKlZgEg+Mh0vdJhBZ/GZkRLMyIXH7xMF5PJzTiKUuJ3vxT8Oo/Oc0p/e3PJ0plFHr7cfZ7F2qZt8pwBBaEV6uEOY1BtQVQYZQ3c8JwzhftLUmPW9kT0eaAmxZXTpcwuu8nzCt5CEdaNt1u/8MTz39oRDWXy2+vWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NWBBrQwsD6pUIVyRPrwI/MHLBw5cBhLdN2ZEoHg2Tk=;
 b=KSQwzHisRPSJ73CueyJRDilkTZxq7x08Z0Be3yuwEprkYWtaH/Do+YSwPEwFiMQb6hI5T1OzFCoicQT25cbdPa/kFCn3PQaJo8D9ksD+eoOM9+Pq15+j/2RQe5SNryt9qEwVAF+gtUSGe9imRnW4lnGq5ecYBLorpgCrwPKBlHW8k8IK8rY2zsR+a5ylbGRy3EruG45mrbDuM/2t69pFYBVQrhANH4dl9ivxAoIKpq310K/igm4N6wKuudu7l2WarUe63kd+eaegeL2AMTdYUweIkpRMNrAxK8Jkn7t8AKQyaXCpufhTIKCMzfVa73+7Q7cmsLTm0YJVL4BHDFttVQ==
Received: from DB8PR06CA0048.eurprd06.prod.outlook.com (2603:10a6:10:120::22)
 by FRWPR10MB9324.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:d10:177::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 16:31:32 +0000
Received: from DB1PEPF000509EA.eurprd03.prod.outlook.com
 (2603:10a6:10:120:cafe::a9) by DB8PR06CA0048.outlook.office365.com
 (2603:10a6:10:120::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Fri,
 16 Jan 2026 16:31:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509EA.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 16 Jan 2026 16:31:31 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 16 Jan
 2026 17:32:49 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 16 Jan
 2026 17:31:30 +0100
Message-ID: <7c380ade-97df-4908-b571-d08e5437c72e@foss.st.com>
Date: Fri, 16 Jan 2026 17:31:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm/arm64: dts: st: Drop unused .dtsi
To: "Rob Herring (Arm)" <robh@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <soc@lists.linux.dev>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20260113201340.36950-1-robh@kernel.org>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260113201340.36950-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EA:EE_|FRWPR10MB9324:EE_
X-MS-Office365-Filtering-Correlation-Id: 32c59e16-fb3d-493f-d73b-08de551cb522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SU4rZ0plZUk5aStZTHdmeldpTzdzcUNEUmJHMngxWG9MM2hHdWJkTitiTEVK?=
 =?utf-8?B?ME4yQmhCY0gvUVZuRWNlcmxXYzFDNGdUWnpZekpZRnc5Vy8wenJzcGp2RWFs?=
 =?utf-8?B?MUpCemZzc0pxYmN3SENXOWtkTmpjRE1UWXlGS3JGUktuUEM3aHFNd2E5Tm9t?=
 =?utf-8?B?SGU4a00weEZFd29SaXNwTFZyMnBaWkV6RnI4N1o4NThpalN0ZzJOR3ZKS0Yr?=
 =?utf-8?B?dkFMcXNMbk94NEorVEg5UHM3R3VDcVRrZ3ExYk9yOXVBakhpZGJ0VGhkY3d5?=
 =?utf-8?B?eC9FTE1nV0E2SWdkSG4rSzRsNEJxcDZlWUttYXg1eG8yM0hGc1NLbUlJa3VF?=
 =?utf-8?B?OUdPNWZoT3JaNG5NbFNJNVM4VEd4VVZ0QndkT0tHZjIxN2ZVeFRROEg0VXND?=
 =?utf-8?B?dnZtWWtaN0l5QjFsa0lheGhkTGlpU1BDcURzNGpIMWt0U2tuczNOT0RSbE1U?=
 =?utf-8?B?VXBNTFpNUkl1b1B3N2lPZUw3cXNXc3p3eHlqRE9UVHl2YXFhUWZsbzhaYkRG?=
 =?utf-8?B?NG1KbTg4Wjh6VFFGK05KcTNsWjNtYll2bzhFUkZOeW9TTEVpL283cnVlOEJE?=
 =?utf-8?B?YkJoYnJPRVZZWm9VelRlL2E1MFdKSUoyTG4yTXcwZzFaNkdDdEtzVTNpUHBC?=
 =?utf-8?B?V2lyQUR6SmhMcTRWOU9DbjhKWEdRUEttS0FjRW10eWtyWFh4aTRpT0RFRWFm?=
 =?utf-8?B?RFVIYTI2YVBUaG9TWW5naXhYdEZZbDc1RFU2SGpPa1l0d01DZC9lSXZmUmR4?=
 =?utf-8?B?bnMwY3o1eW1NbFhuSXBzU1RHNFkyRVA3aHlISEpxZGNsUkREeGRKZnZScUEw?=
 =?utf-8?B?VTdZS2laMHZ1YlpXMG9uak80ZzdwZW1MUWc2a3RJcU9pd2NPREJONGxSYmo0?=
 =?utf-8?B?L0dTQ2NpenlYc1E1YkcraVQ2T0RGZFNkd1g5cHZBWDJ2anpBUkhEcXRpYVBi?=
 =?utf-8?B?QVVwU0cwNGpWV0locDg1WXRHYStaSWlINkJIQ1JUN1lYdnZVZFM0dnBKNDhN?=
 =?utf-8?B?VDdMeXNIRXc0TlBHSzR5UzE2VGp3KzU4d2lNTWZPS29BeXNIM0Q4RU92Qzlj?=
 =?utf-8?B?ZlpuNVFDZkp4R0FCR3JsblgwMERYalFZUGRtTUdzcHdXTHliVjMraUlFRkhL?=
 =?utf-8?B?Ulh2c01mejFvWVRHM0FJaGZvTm9QTCtmZFRYNEpVNmx1VVowdFhtNlEzQUdC?=
 =?utf-8?B?LzR0SWZZMXA5aGFOY1YrRGtTanNtTllzNndRTzVvNnRjakNEZ0I0SFZBZ2hJ?=
 =?utf-8?B?K2I1dU1laTNVUWFRaHhLOGVvWFVBclVJQ3lGVS9RVmVYUS9hWW5hZjF3TGdV?=
 =?utf-8?B?WFFZdnJ4ZWowbWtzaTl5VTV2ZVZ5M3BXWkV6UTlKZWd1cXZZbitRNjNWUmE0?=
 =?utf-8?B?MlNiRURrb0doMCtPL2JWNXYweVpxY2hVRVozSW5LVThWR1dYaHV6d0Z0RzV1?=
 =?utf-8?B?NEtxZnBXeHhzcXo1dkR4T0N2U29yYzRPV1RHNTNEZkFFUGM0dXoxZjdENmYy?=
 =?utf-8?B?eXdwVEhkV2NSYTRkemRnUmdUaVN0QVhISmwyMTd2S1hDcFdUeExDL3lZblQr?=
 =?utf-8?B?YmtqUEExak5WczZrLytFU0RhSFQxT0Z5cnpEeHk2aER6SWRtOTRmNjBVS05w?=
 =?utf-8?B?SzY4MmM4RU5wbHpFdzNHZmMvanhlOFcyYWV2c1JSTW9zN0tvZ3lkVERqc3Y2?=
 =?utf-8?B?dUFYVXRBMzRPbDFrU3FBU1BJN2lsM2lUak5xVHVLSHk2SlRDcFdEWm5pRzhl?=
 =?utf-8?B?N2NtOU82bjl1MzY2ZVV0eWF3SjF5K2o4MGt1Qnl5dlJ6Z01Za1o2TkUvQnF2?=
 =?utf-8?B?T2xvVU9jSFp2a01hODFUOHBJMWR3WWdUMWErRC9VczgvRngrNXlKWWVPNW1Y?=
 =?utf-8?B?N3BUcnBhQ0JtUzFMeTlSNzBnZXdHTmxVNGNZTnk0VzU2aDl6bXQ0d1VLdVZS?=
 =?utf-8?B?QzJwUWlrVXA5Ylp6dkNNcUw4eDFoYjR5emRwM2w1d2trNVUxY3pMU0xKS2o2?=
 =?utf-8?B?WHl4cG9RWEhlb3lwN1dvL1Jybjc0bVpwSTdCMTNZajZmeTVXQlJDRzJSNXRD?=
 =?utf-8?B?RTRibXdQanNkTFMvYUFnWlRtNG5VQ1l3RTBGZzIva1Y5Y0tHVG54dzVPdWkz?=
 =?utf-8?B?VklraVVXQXQyMUNhRnBJT1ZITi9yWU84UVYycW5ENWhpZTlMNWgvMXVHRDdE?=
 =?utf-8?B?aFd3TmxrUGtUVWptOFd2R2o3YkU1TngydVFUc3I5L1JGWjhOcDhSMGxWQ2ty?=
 =?utf-8?B?dzRXbldsb093Q0VQZHdRSEQxOE9RPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 16:31:31.8450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c59e16-fb3d-493f-d73b-08de551cb522
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR10MB9324
X-Authority-Analysis: v=2.4 cv=fYmgCkQF c=1 sm=1 tr=0 ts=696a67e8 cx=c_pps
 a=y2vOfj/AjHT2qeE8d5FlLQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=TP8aPCUxYTYA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=VwQbUJbxAAAA:8
 a=ijObrN4q47RCNrEETbUA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: XMA0XC9u0S39Kp6pytuk3eor6fNsk6-l
X-Proofpoint-ORIG-GUID: XMA0XC9u0S39Kp6pytuk3eor6fNsk6-l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDExOSBTYWx0ZWRfX18a3VTlM0S3T
 lKvcGkNwSlepGPkEz29S/HCaOWAJ/ryd9OwnWrYrQK8rBB9A5BZdsWIQvqmhllYDvxzOmJ4tfTb
 2jiL3ZcBoIMtvGcSJYXkNaBG73GQ0WGng/Hp1Ay7h1ir9r6dllYVFyM9ve/3lRChR/Ye9klRsdC
 ++ZTu3nQcUpIliaUidZOrevf2vYWhJTNDsn9oOuTyqrwphfUOKDTBLPOTkw9HrZUVqIggGfHQ9t
 JBAjgBo+kmdnQWDxgVUXNI42CT6ZDYFxabVOY/WQly0Sv1L86qBbAYHTJRGA7tBS/CeOSC2c15T
 rCnkkWh/S7LbnEDfGZnndwH/Vde3aMVTBNd0lJyrlG5bWQOYCEppSzTGaq/1uqQd1ZoH5vzU+QB
 d+6KvRtwrBIbNMValJZYEjhu3F/OcNeplGzmjidqTULY+dq1VqAcPsrhJ91agCcf/fvmNcpadKB
 ingW5B7Fl4O9sXU9xJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2512120000 definitions=main-2601160119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_083151_746871_19B568EA 
X-CRM114-Status: UNSURE (   9.48  )
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

Hi Rob

On 1/13/26 21:13, Rob Herring (Arm) wrote:
> These .dtsi files are not included anywhere in the tree and can't be
> tested.
> 
> Reviewed-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>   - Drop erroneous QCom .dtsi
> ---
>   arch/arm/boot/dts/st/spear320s.dtsi           | 24 -------
>   .../boot/dts/st/stm32mp15xxab-pinctrl.dtsi    | 57 ---------------
>   arch/arm64/boot/dts/st/stm32mp21xc.dtsi       |  8 ---
>   arch/arm64/boot/dts/st/stm32mp23xc.dtsi       |  8 ---
>   arch/arm64/boot/dts/st/stm32mp25xc.dtsi       |  8 ---
>   .../boot/dts/st/stm32mp25xxal-pinctrl.dtsi    | 71 -------------------
>   6 files changed, 176 deletions(-)
>   delete mode 100644 arch/arm/boot/dts/st/spear320s.dtsi
>   delete mode 100644 arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi
>   delete mode 100644 arch/arm64/boot/dts/st/stm32mp21xc.dtsi
>   delete mode 100644 arch/arm64/boot/dts/st/stm32mp23xc.dtsi
>   delete mode 100644 arch/arm64/boot/dts/st/stm32mp25xc.dtsi
>   delete mode 100644 arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi
> 

Applied on stm32-next.

Thanks

