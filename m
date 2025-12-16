Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A0AD5C0DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 08:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIKj+Jq7PYV/kCHx7Ty7QLOqq6O+Bm+Gy+IzQxg9I4A=; b=FvG+HEbgUd6FMgjXjZga1I0FoY
	psDUojaRcb91XumFg4BZs9kUwS43ATN6Kjxax+FsBpW9a1ClWg9VYRc4dL9jV1/ogym40v/pxf7jy
	smvzatzgyG68P97ZT2NmSaxy9l45Lt6IlTo0Oad42/spelOR2bI99DPkE3iGS129a4WurPJqCdZvj
	DLirkILZuE5TW7IWqfVLx65YUmvloFq+wk7XloMCrCxsPNRx1NSmZNm5PRROjMrlyw7k2bGJ4O7EO
	3QwT5CaGznq7fMgOlK4Tprra3vJ95Mp5wD3wXInl4MBxFwW0mtd0jcdeyUTHEdQQqlGTrTfRpZ92b
	azOemWyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQU3-00000004vfv-2uVu;
	Tue, 16 Dec 2025 08:32:39 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQU0-00000004vf8-2hfR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 08:32:38 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG8Tw21959926;
	Tue, 16 Dec 2025 09:32:27 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013050.outbound.protection.outlook.com [52.101.83.50])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b11dx98e0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 09:32:27 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsCXLxNab4e6ALKsenSkSMgfyzaKOckOwU7oOonZlol/AFeZ6bO8MzpTJ1asCT1VoJhlzsS6cQfwafzIFR+NM5ZQO4KwQuMv8z8fnyQ9+GkrE+CLGUSNkD0cjyqkGxpdOafexpYgYobAKj/CkdfVUhlwHrOAb5Kbi5B1vBqHjLrS6iYZTywItvRa3XsUnZhiAQYdm8LPpzKBSdksP0K5emkrrP0Z92R251n0QErW1WnmJ6KwVqPjclcHwF/CghPuz3vR84ij8tjJ+iZq/vmzGw/GLt4WJLPMXc81m5lAxdh9gRFaTgpRMAmriZH1H7JgBrKeMjI1dCazBZ59ErvOyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIKj+Jq7PYV/kCHx7Ty7QLOqq6O+Bm+Gy+IzQxg9I4A=;
 b=fVH7iahEU0Qov1wkd/+esBjYZqs5eZKW3FrjUXMW6iKKjCXBnzPKtiEl03+EHSPScjnkfOo086ZKlWTp3fT2yPIQ6kPfVcbwpTFSElIN9opucPmvGNIgOBPZAU/oxUn7daQSO8exuFbJ1xWT7QCc4gHEwNpck7NFF57FOgj7Yid51nMk5srSaapGt/sXP44rkoE9ZiIUv6gZ8SURoxBJLh+hhZGdPxd1IYueOdjwkM7gAJ2Ur3UXs/r4QaMUvx1sN599f4P9fktagIa7Q+2VeTVB4XspsBe9UgmYImyGOvuu+AwYegWJPMs8Gua5dvrc4dLugdB0qtXN5tR8kTCyZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIKj+Jq7PYV/kCHx7Ty7QLOqq6O+Bm+Gy+IzQxg9I4A=;
 b=Nw0Vvh+79u+DRTL+pXn0Mija/gGwcR7kUQKhIIQmilrtPUsRYiq95hw/zmoNy6FcV8cWQQWr7DihnYQfoYbZyQlzIGUXx51+xIxIZfY/d/0sgobhfH4NzTXQob8iuixHSHIRDicyXNl3zGV0i/lQKM4fAKbQXb9nm+rNyr3c+mZSjmR1R+yUbC9l92r+bv+blzpYPC25ploquZQRiEr9OupEvyLzajgEjEh11yQgAY+/r3jMmfr7tB/x5KZguQm42GZIfSIlAxy1yUSvTpu/mn/Wai73MbG1nnBMhZbIPTgXzYef38XGFL3c2YQoTI5xmk3eyWdKxWCwlK6czTW8Ng==
Received: from DU6P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::25)
 by PRAPR10MB5347.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:299::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 08:32:23 +0000
Received: from DU2PEPF0001E9C4.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::dd) by DU6P191CA0011.outlook.office365.com
 (2603:10a6:10:540::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 08:32:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF0001E9C4.mail.protection.outlook.com (10.167.8.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 08:32:23 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Dec
 2025 09:33:01 +0100
Received: from [10.48.87.4] (10.48.87.4) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Dec
 2025 09:32:16 +0100
Message-ID: <81ec27d5-1839-4a8d-9b7e-08ac49335503@foss.st.com>
Date: Tue, 16 Dec 2025 09:32:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: bus: stm32mp25-rifsc: Allow 2 size cells
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20251215212700.3320634-1-robh@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20251215212700.3320634-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.4]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C4:EE_|PRAPR10MB5347:EE_
X-MS-Office365-Filtering-Correlation-Id: a03f2bd5-79a0-4e4b-3dde-08de3c7da2b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWdqKy96QTVqak13MDJuVFo0Sm5nVWZ4OU0wb28zQTlHZGs2SHFabGladnBN?=
 =?utf-8?B?WHE2UkNIUGJIL1oyK1p5Tk0xU0JicTVEVVV1MUFQSEx3a3pUNzhoY0FGZjNF?=
 =?utf-8?B?ZExIaUpRK1MxWXFsYkVqVW1WMi9pZDBwalVXRUVXQnlZR2s1aHNzMUNiUnU1?=
 =?utf-8?B?aDYzYk05eXhrbnlIa1hYb1g5ZFB0M1p1clJyc29SMXJEaEpucXpjM3M2SXNj?=
 =?utf-8?B?VmZlaEJ5TkFUMWkrZmtoZDRWVUdmcXBIM3ZYUDY3WmZzVlVUOGwzQ0VzL2cv?=
 =?utf-8?B?QmtYYnRZRkFoenRiZHZ3UjJRYk1vMEZ5ZzEvak5yOUdXSCtDdS93UjRIWThV?=
 =?utf-8?B?ODE2cE1JYVF5ZWxPSlBSejdwcHg2QktsQ1h4dWtLcTVsaFllckhnbTRWdGJF?=
 =?utf-8?B?c2JsamxqK2FGajhla0xGdFJhd1FFTlRjRU5lU2QwT3FBWlBJNTBMNy9oOG9l?=
 =?utf-8?B?WEYxVUhxY3ZKWlpZNi9LQ29nOVRoUlB1ZEd0WCtwRXBVL3VsRGtPUDFUazln?=
 =?utf-8?B?WnlXYVRXM0RKbDF6OUVCdlRUVWJyKzZqTENUWlZiT3hXNTU3QUJuQlZENUpo?=
 =?utf-8?B?VS9panc5cDI0RS9lMzY1L3pqRnFJVERnaHplZk5xaXpYVnVQemhmRmxCZ3Iy?=
 =?utf-8?B?NkY0MGQ0V0JMV2p4TDB4d3ppWlYvOVN1a1J5UmNRbUgxTG9wTjZMcjU0Z01U?=
 =?utf-8?B?cTcyK3FrRzJlaGFheUJDTGNrem13cjNCTmpnKzNkRWRpM3BPNW92T3QvRXow?=
 =?utf-8?B?dERML2pId1dnSk94QldBZ0pua2lWS1M2dHFSMjNZT3E5dVEvTGVpTFFXcGpI?=
 =?utf-8?B?aHcwWnI2bSszaUlieFZhTUd6Wm9tM2NyREgycG5GSFZpMWJkM00veXAyeGpS?=
 =?utf-8?B?aWFOa2lEb2VCZnljWEsyK3EwNjExMXZOS0c3OE9RV2FPK0xLYm9MdVpPSGs5?=
 =?utf-8?B?dlZJeGZOQy84cmd2cnQraEdlWHFUWHROM3hxZ09LM2w5dG9sSGVWbGpBNm1h?=
 =?utf-8?B?bGIyNENINGRXRlp5ZnpNVWpzOGcvNDdtV251T3U4bmxvODd1R0FvT1dZcmJa?=
 =?utf-8?B?dGRsUUtkREJoT0JFbHdrbVNtd0lPdll5amlHbFZSeGdpNFA5RXB2YUpCSTNZ?=
 =?utf-8?B?MGRrVnZRWmNBUjBCNzdlWVdSWkRsNWIxdHRxSS95NGROYXZEL2xpYXZjZGQv?=
 =?utf-8?B?OG5LTStqWFBLanF2OEtUd0JWcGxzUjdMT1ZsK2ZMaGdrVjU3VFk5Sm1wM2Z6?=
 =?utf-8?B?bWFQaXU3NFNWSTJZL2tHSGpuVFpidzlEYVJaSDVpOUpTZUFtMGorZzlZc3RS?=
 =?utf-8?B?ZjdOOGhURVcwTkZKWTJPVlBiVVBzbUprWEc3MkZYS1RoTXIvL2l0S083MVhN?=
 =?utf-8?B?Rk5ycEhyME1mdnUyMnNiQ2NvdXZFTENVdHRIZnhSQjNyWkdQc1Z5aEtpZDRi?=
 =?utf-8?B?azRzTnZSeFBMbTE5STgyb3crY21OT0EzcHVTUW1lbDhVOVFOeEFYMHEwNi85?=
 =?utf-8?B?M1JBOFRkeEVMbGpsT2U5bjJ2azdBZ25VcTJFb05vZHhrU2YvWXBNMkY5Tk5o?=
 =?utf-8?B?N2FhTVhCNzNzUTA1dUNBdThPeGZ4Z1RNYU9nK0lNNnZJdlVTK1hkL3FoVGto?=
 =?utf-8?B?bmNHRzMveEZkZGs1MGgyTFNHYlZFZUZiR3V5enVwdDVXNWNqT2tUTzN4M2Fa?=
 =?utf-8?B?cVdEaG5zSmozeitJbUVURGp4ZXlWTjlURWJvMUZEOWhDNWd6dlArZlNnL2pI?=
 =?utf-8?B?U09yZ1JJOTFKWVdDSTJ1UGpHZnJiUXkzSFVGY3pqbEUxeXp4Sk1icU5WM0Yz?=
 =?utf-8?B?U1IwUE1QMUNTSEFUUUhXTktEeW4xQWo4MEZwek1vNEljU1liZ2kycUN0YldH?=
 =?utf-8?B?cVFzMXIxc09UZy9PV2Z1bmtxKytWRE1wZE1JcGFIR2Y5dnpPSGVxMHdCRXgx?=
 =?utf-8?B?WFVsYzBDN0FyVy93MXBRQnpONStUZUhRbXNWTkVydmZ1YnNMNlhNUVhjRzUv?=
 =?utf-8?B?YWl2RG10WTJOU1Y2ZFNFN3poNk13Ynk3VWprTXN6TXRuOXF0ajJFOUpMaHBx?=
 =?utf-8?B?QkY0SmE2cHJHVnBhZmtGdnNsclRERzNqS1lCbXNJRUJGMHhOeERtanB2VXha?=
 =?utf-8?Q?AMWo=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 08:32:23.0573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a03f2bd5-79a0-4e4b-3dde-08de3c7da2b8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5347
X-Authority-Analysis: v=2.4 cv=PLsCOPqC c=1 sm=1 tr=0 ts=6941191b cx=c_pps
 a=sIonJkpHxZAhLrw2Sah9ew==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=ODy6o3KmhwcA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8
 a=9lhQ-HanZ_CRFmILVmEA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: FCmmfwbmZWZIdtjuhnIK8iXB_VIAtp96
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA3MCBTYWx0ZWRfX6E+387L5ypip
 35VmuNj9a2EuuBqgpeGw7HPNe5M5gNuCm2b4qxg+frgFC2K9/SRYT4rGGTiEZmBwf9sdqZUBe1q
 xrA9q3oYL+nh/SZYAOX2WNI2tDpaROCClVsgBa//Os/3rRaWw0baO31SrM6s6ZZoLLsihJNvpx+
 5ExQV74lflUKf9Mgij8wpBJ9+TK/jdvKvq+zTl3q6SN3mpmRsv5FzyKCoxv7uvgic/yQvFK65uw
 BKER4Se1rS2KU0OQk7er/V1nr/7TVOsfW/hlr24/qm9KzbW4Etc48taYxGuoDC+3wq/zd+TVZXW
 UQJLZTdVypqiQ3McIEakkGaavl0VarCi25DII1e5oVm1RBPRpqlK5Odum9MRqDSgPTTItq8CskE
 m1QYie1aAkKed+wjv1i0D7DxgE1DtA==
X-Proofpoint-ORIG-GUID: FCmmfwbmZWZIdtjuhnIK8iXB_VIAtp96
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_003237_202829_9C027EA3 
X-CRM114-Status: GOOD (  12.11  )
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



On 12/15/25 22:26, Rob Herring (Arm) wrote:
> There are users already with 2 size cells, and there's no reason to not
> support that.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
> index 4d19917ad2c3..c6280c8c54a3 100644
> --- a/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
> +++ b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
> @@ -54,7 +54,7 @@ properties:
>       const: 1
>   
>     "#size-cells":
> -    const: 1
> +    enum: [ 1, 2 ]
>   
>     ranges: true
>   

Hello Rob,

Thank you!

Reviewed-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

Gatien

