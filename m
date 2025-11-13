Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87895CD8C87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 15:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XnIO9ZtV4ZnKaaDQxPal+sDG5zR43lw2xFvyuYfXJ0k=; b=lCnwLKjUljxpG4Fn4t4A/9+Eo8
	7AkBjVEA/u0jBfDeLjU4csZsMgOqNlBjtFmlhTsd/8yeKeOS/4CX1noR4r1jUK4zZWFu0p6jURUSV
	nO1VvxCkjB0xcurrchLikUHfMQeJMfoeeXZDxucPCCe7Lk1FitKIyOwYu67rqn0l6UIQIOVOWO1kK
	WC7ThRem5ydAtATsNZ3grKou9j9h1Xa6+b5OC97qkR1wAmZyGE3kKY+1WlUJW4nby/9LE6s+uNnXP
	2owMVdcLRPlbagTVOQfcvTPWs00zX9Jyc6VFl3alrtm6SZwFX7OwLJab/9cKCov7YqMGzP8upM87V
	uj/4wNbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZ1h-0000000AfKA-0e4F;
	Thu, 13 Nov 2025 15:14:21 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZ1c-0000000AfE8-2VNC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 15:14:18 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADFDOZX4003037;
	Thu, 13 Nov 2025 16:14:10 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013012.outbound.protection.outlook.com [52.101.83.12])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4acreu5r96-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Nov 2025 16:14:09 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2kWxv91BjCphOyqQBXmXDdxtRXaJsSoaCnOl4iL55RW6VubF1f3E5ivt9GX/7hw3951LHCOnPlyPrFGh0v2i4fMKvm3sVw9DP4Iiy2aByycue04ej0fjHWIlREntg7zxjQfugL+exPWZg15rH3KRKqrTw62amSZvCsT2Y8DuHKbn/NM5dtwjuMxvAhMSjMzqX0L7Bxa9cAqoD4kzq+7cwHP8RcNZTRuWA4ebTt23dEIb1b9wwkt7OoiStQe9tseqPqt7SXMqEKdTd08qwTKGuaIivlw11vCmwl+IMk/yuZJfq96taLk3CHXz18QZ/0hHtKjX8WRxrogbaebTI114Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnIO9ZtV4ZnKaaDQxPal+sDG5zR43lw2xFvyuYfXJ0k=;
 b=vHEoCMVpqFkT9XhDjqONOHn9F1FcgPPevHiJEQgOfDYmq3cmAliN/QUCQ0vRdUGm1iGzLu+3FKMVyCJASGxtLqPkNLaCeOka9f7iaocxuXnqJsKwZfoxze2o5Plr/dFwJCoeverfxF99RuUnDesaAsh2CECsBPdgv7BiO0b8g6uEUhIg5MRP74q1teAoyAYdV+bctILCVgI4xAzxWK+bjp84/gw3pR+hgYu89Ndwv6/xkulzx189+1d+xfrGkQULDH11oZgmh23eF2M8p6pF1u7ncPtUWoPOHVoN5KMO/uQjkRzFtHOtbzZEVFylb7cnFM2l3f5rdlW+9mfbHDjyDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnIO9ZtV4ZnKaaDQxPal+sDG5zR43lw2xFvyuYfXJ0k=;
 b=Dd8eIL1i/FCnjnRMWO396AMWKRSlvoVH2GQslDAUIoEtGQOJnflASF9wC7bu72oqfRYCmEKc8sMxGEH7lYIU5iwZSSWEWA50QnY4+Yr/V1SW5M9YgMAfah3zuNPW75R6hmDWun8CuJs/O383yLyus0VK51mBSZTd9KbyhkyX5kIk6eXhViRL5qKshA0d5Gv/1tRmk6/+X2kEyryYlr6h0hF4b3bpCsyVBWNiGBKYDOpjBjChOH6zymtDsdp723ynOa2Gzy0fuNAWRnmGz3xs0/5/LA91sLWJ5YMDxRZw3sOqT9gFjyggnCP9Xxk3R7KabBR+9OSGIqeZ1aGkMRGW6w==
Received: from AS9PR05CA0341.eurprd05.prod.outlook.com (2603:10a6:20b:490::27)
 by GVXPR10MB8454.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1da::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 13 Nov
 2025 15:14:07 +0000
Received: from AMS0EPF000001B0.eurprd05.prod.outlook.com
 (2603:10a6:20b:490:cafe::6e) by AS9PR05CA0341.outlook.office365.com
 (2603:10a6:20b:490::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 15:14:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001B0.mail.protection.outlook.com (10.167.16.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 15:14:07 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 16:14:18 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 16:14:06 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 13 Nov 2025 16:14:07 +0100
Subject: [PATCH v2 16/16] arm64: dts: st: Add green and orange LED for
 stm32mp235f-dk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251113-upstream_update_led_nodes-v2-16-45090db9e2e5@foss.st.com>
References: <20251113-upstream_update_led_nodes-v2-0-45090db9e2e5@foss.st.com>
In-Reply-To: <20251113-upstream_update_led_nodes-v2-0-45090db9e2e5@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B0:EE_|GVXPR10MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: baa82480-2ca2-42c7-b1f2-08de22c74a39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFRMdEY0dEpOZXBSSlNMUU01UEFXSHlBaE8xUXBob0cvajBRZzFBVkhmZUpW?=
 =?utf-8?B?UitvNzFCUFRtajN2aysxTG5rUHcvRUZ6a1hLb29YbW1OaGRBMm5JaXM1SW9v?=
 =?utf-8?B?WVNZbkRaelZsTUpDS09LT3BkdU5WYk1JWDlrQm1OV2NWNzJkQWNVL3VPTVhK?=
 =?utf-8?B?UFpSaU9hb3dmeVlQOFEwWU9Ta1hLZ3NnaFp3bGdHOFY1TlVxTlYvSkhuelpU?=
 =?utf-8?B?ZmpFZUlORnludCtnMnBVbUxwaWY3M0Niamp1bEhDV0RPbnZxNGRLc3p0T0ZL?=
 =?utf-8?B?NTNRVEU2UGViTXozK1NmSHc4NVJQWTkyVmJ0N0I4TnRBQTdFYWhzS0ppUmFa?=
 =?utf-8?B?RWNzL1MzUDZRWERLOUUrNldQWXNtWFpBTm1rcFpUNHQ0bThQSUJQOGlNN3FK?=
 =?utf-8?B?cDdmanJvaWpWMXBKVEdwSWttUGVobUZxdjFSZ0k0VEVRc2J5OUhMMGhGQkdo?=
 =?utf-8?B?aDNrRXJUQS9sYjdad3NmSmN2YkxNMTBocFRpRzNucDVhMnZLUU41TzVhc1Bu?=
 =?utf-8?B?ZWdCaXVueUJTL1dHOWVaWE1GK1pyS2hDcTB0MjRuaERqTFN2NHpzaFE2bDdl?=
 =?utf-8?B?K3Z5b2J6QkplSXpJOVg3NnZjNHpLUnFIWHhTRFFwMm4wcmpBTFNVdWcyUXhn?=
 =?utf-8?B?bzdFT1hhQ1pycmQ4Y1duYWNVMzVNMy80SkJ6TEl4YWJVS05MVXdZeGN4RzBw?=
 =?utf-8?B?ZVE1cW9ieTZxemlDRUV1UkNpbFhBc1ZYZm53UlpJRDF3YzUrR085dStUS2Ft?=
 =?utf-8?B?Qm05bmJxd2tvSzZkNllEQlJreS9hMnFhRjQvL3l6elE3RHFiaERXeHN3TlJu?=
 =?utf-8?B?VXdsWXRWQXpMOXRtdC9wQmlvMy9RNStQdFFZbnM4Y1l3Uks4V2NvZk80cG1u?=
 =?utf-8?B?aGdVNVVaSTA0VmZxZGJTY3hnMEhZUFAwcGgzN29YUlQ1WUJYMmNERHFNQ2dw?=
 =?utf-8?B?R2RiQXdITTRhSFpqZldobHhyZS9FNVQxcm1uOUw3NHpSZWw2cU04am9IZDJz?=
 =?utf-8?B?OGhvWXBqWTBCMkNkUytRUzdBOXUyMmtWRXd2emdYMU9oOUtoS2dyeEI3Y1hh?=
 =?utf-8?B?c2g3SkNHeGRza01zNW9jaUpCbDJOaWp1dkdkTjM4Zm9KMEFMeG9MU25EUVhw?=
 =?utf-8?B?YlNXSEhjaWpFWm1JVldqT1ZuOHZDbFczdXJMd3VvbDFaeGZ0cWNoK3kxbXN4?=
 =?utf-8?B?VjliaHdYM2xoMFcvclJoRytaZmNqYnFkMDcrdWsxT2E1SXdFL0J2dXFFT0FC?=
 =?utf-8?B?NXAwTnUvaHFXVjBFQlJvRzkrTmdvS1o2cGNsQmVtUXVRa2tZUU9HN3pWWkJq?=
 =?utf-8?B?czkvZ1YyaWNxL3RXaEpQNE81d1BxL0wxN01uampaems0U01rODhlakpuNTNB?=
 =?utf-8?B?L1k1OGFYMGFablF3TythWGJmeEZrWmFGUDFJODE1ZXVmTTlVeTVrT3Jyckpz?=
 =?utf-8?B?MGZGMk1NUS91b3lVMUwyV1gvYjY4ZVJUZGZzMXMzOTMyVkhJZklLQnFIS2J6?=
 =?utf-8?B?OEFzeFNDVDc0RmpxVTkySEdVdzRSQ0w3eWtSUXYzZklBd0Jjb0dqTXRhZ1JX?=
 =?utf-8?B?UjNKL3p3d3RWNGRoWlJvem5RWndRMnRqYW1FMzlpUi9UYktDWnRsaVU2QWhK?=
 =?utf-8?B?RDhBbGNpZTdOb3NwWkkxbVo0ZXlzcDBtVTNkSzhCdjdxMnlDeG1HdlV1MTA2?=
 =?utf-8?B?V1lFMXRLUmhPRzhXYjJ1T09yS3pGV0ZmMHNvcFhYRDlYYWlSaUkreFpVbG1t?=
 =?utf-8?B?OU9GWjNTbDluUnhCeWJzOHJ0ZkZaejNkbE95bGdUZnlkNWVtSFUwN3ZIRmUx?=
 =?utf-8?B?SlZsTWpYMkh1S0wzNEdDcktHZ0FKcEdjZkU0TGFMNkNwRFhCL2hZaWtLL254?=
 =?utf-8?B?ZThYNldJcUZkNG1rM1FRZFUvbWtENTl1SmIrMFY0ME5peDU3SGtZcTZadjF1?=
 =?utf-8?B?b0RRTnNTc1hxdThaMmlseFpSUFYyWkV2aTFzbXlHb0JxVXRXN1lEQ2dMcTRo?=
 =?utf-8?B?SCtvaG1Yd3BWckR6TFl0cWx6SkVNaXRLV2pTUFhxdTY2UG9RVHo4aktneTMy?=
 =?utf-8?B?Qk9GSS9pYlRJT05oRmVLQ1RSNUF4a0EwT3lPejVTOVZ5clRKU3NINWFiUm5Q?=
 =?utf-8?Q?Nl28=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 15:14:07.1512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baa82480-2ca2-42c7-b1f2-08de22c74a39
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8454
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDExNyBTYWx0ZWRfXydfQCUYH93cW
 yqACUTkc+LcheCQT5dreaq8x3mYn6LUEPx06w89VdY19oHe0BSUTs+XDVBx8/KL7P4xk3XaiYmQ
 cLTGwq0YH5zyzx2DO/AhzvgUc/+8y4QjzlWj83An4BY0k14FppEgQIkL+QuGG8acF6KWJ/iD5Rs
 0F39g0RbYrZ1uVLTnQNfDkquQLboD69PEshjzWtEhGZ+OlZT8f2Z1kToqoHdlLlVIyNBHJYp0ts
 VxvU+AuJ3t1fsUTUscaOVSQtTVVgBNmX6Kx+nX0ySzwILhtSvpiMa/am1HhvpgSXNdoS3oPM78s
 wIZFXeLiYbRN46ihNsKWAakJEZ0tS95Kf8COa9CLM0ru7KFnXs+vRwXSKt/+XlC6M2qhBvq9a3C
 L0hGdzWVeE+Fm/anQW6y2nMKp/YV2Q==
X-Authority-Analysis: v=2.4 cv=D+hK6/Rj c=1 sm=1 tr=0 ts=6915f5c2 cx=c_pps
 a=54GLqzx1wgfshtSOf875Nw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=GoHG9ZAtNuuEcBzL9IoA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: j-d_WYj84uu3uObmYeJTg5HNujBxWMIK
X-Proofpoint-GUID: j-d_WYj84uu3uObmYeJTg5HNujBxWMIK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_071416_970024_CF16B630 
X-CRM114-Status: UNSURE (   8.92  )
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

Add blue, green and orange LED support on stm32mp235f-dk board.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 6e165073f732..f41213187723 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/st,stm32mp25-regulator.h>
 #include "stm32mp257.dtsi"
 #include "stm32mp25xf.dtsi"
@@ -42,6 +43,28 @@ pad_clk: pad-clk {
 		};
 	};
 
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led-blue {
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&gpioj 7 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "off";
+		};
+
+		led-green {
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpiod 8 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-orange {
+			color = <LED_COLOR_ID_ORANGE>;
+			gpios = <&gpioj 6 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	imx335_2v9: regulator-2v9 {
 		compatible = "regulator-fixed";
 		regulator-name = "imx335-avdd";

-- 
2.43.0


