Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4817D1680D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 10:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WXg3iXMmpRHZCN2cjVNGSQhinaxSnLv1tVcF/S5ZuQ=; b=lqvVtTkuPFJymt1BmCxhW/conE
	MPMmDfAqp6Mb8Rcka98vK6EyAgaA+PHC7pOsSobM4LrzStsBcd5i8m3g3eAlhvouKXv/aodwhyo9N
	hlBY7TsjodlgjCMc6Y09NevRT+0rN+kejFBWlEyMbW3IZgrfiKv0hGBVResf/d9qsU/U6QSNp72OA
	ijK1akZdF/Fhrmo5XAS9BXlqNj5JFkjZUh+UtdZEpO+joapDLENA6YFRZQ1v8xnqr3/yycggb4C9i
	HwwldBQQ8pugoiwJMfGhyCX8zw3cO7T/rdWnwzySRhc4eHHsdEFQsfo6udWi0MUUtUx3jHaFwnUwg
	i6OtEZXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAAi-00000002Ajg-1qEh;
	Fri, 09 Jan 2026 10:56:48 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAAf-00000002Ah7-0ssx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 10:56:46 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609ArtSv011276;
	Fri, 9 Jan 2026 11:56:39 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bjv2212w9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 11:56:38 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfokrrkLkM1opS3Zd3IFGD8VHWlnUq2vURZ0yzObNXdO1RZbNOrFPijmilosJIEIAl2/jgVIICeFvCgy+FREfm6Wm4ngE+tDjko/CDv3EvAaHZxuNZsst4+hGXQPaZmIKz/PJMJGx5JUxiiys+Rj08MhhZvLqpJ7qeP09DyqzJW0l+B2vcNoBBEsX9GtYGcJOwtY8I8cgYkEACsoaxhfvLvb20lPHSZF8p2toAFImtWGoU8OcCegODeqDMEcAzVpEV5dBdGGftq5WstbPH+kXKY3WyXj+bSayjLc8cxm9ZtqEb3FuZXpey5Fb99ZAib/+onx2lOLkSgxqJLg3ZiQQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WXg3iXMmpRHZCN2cjVNGSQhinaxSnLv1tVcF/S5ZuQ=;
 b=yFSEsSWn4V+qMa5dQhZFYYsc8MJ9PqfPjMvrimGfbu/T4CRmHQFhRPwmduLDOyx9NcSTZ1L5X+392TtkQOVCVBxJLWbg0J+9js5Bek1js2L3209N3mwiYlp5KdaLPU5a1nG5au7WLNEmI3xao6fw+riQl5N+ZV6KIrPoY+RENMNbPASFGLUZaXfHaFa+3KlvzXvYIiyAr1Bo8svEHnz5T4Ue5tHQCgIhcO/EOEOb419p/NhWXgAevcyeUlfv61GYARFshpU5mqawzgjatUWR1zc6KXX2VYRZlqaon8gRPRy9g3IjHxs0OjrzegBc+99eJSHx/1HyFx6JRiXq1TiPZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WXg3iXMmpRHZCN2cjVNGSQhinaxSnLv1tVcF/S5ZuQ=;
 b=bz2/W/TQdtFcTwr3W1x3AMU1sboG0oUHQfsfpL/4j4JapumZDNvC1S/j1RC+zPRrQ++cpEapdCA/ZIjdX2KnazgxZCBHin6ViguzrY6qtV70hlcsZzqIG1hP239GsjlSWHWwvfipLn/87rIpLPCRq9w402lMaf9aQuu925MYIF44OjIwWiN3wg3JxrdsKT0k9Zb6USpLqpzazeUNu/EvuD4eG6W30OTpX6vjY0i8doELrRpD8UMadqo6lA9VrPFGKlxPs0h1ZdW8IfG7i1aRRWWuqwkB1Ie+uIH/FZvsV8HcBVT18miOUpUnVKbNdTOveUf8kl/0nlkTzqfvJHZ3bg==
Received: from AM8P191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::17)
 by DBAPR10MB4041.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 10:56:34 +0000
Received: from AMS0EPF00000198.eurprd05.prod.outlook.com
 (2603:10a6:20b:21a:cafe::ed) by AM8P191CA0012.outlook.office365.com
 (2603:10a6:20b:21a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 10:56:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000198.mail.protection.outlook.com (10.167.16.244) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 10:56:34 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 9 Jan
 2026 11:57:48 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:56:33 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 9 Jan 2026 11:55:04 +0100
Subject: [PATCH 04/11] bus: stm32_firewall: allow check on different
 firewall controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260109-debug_bus-v1-4-8f2142b5a738@foss.st.com>
References: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
In-Reply-To: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan
	<leo.yan@linux.dev>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000198:EE_|DBAPR10MB4041:EE_
X-MS-Office365-Filtering-Correlation-Id: 07d4ef0e-50ad-4df3-7b30-08de4f6dc118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnhFODd5eGRvYS9GQVhBanllZVkxVFJMQmhQWE9kYk4zdlRrZ1pmYkVVOGEr?=
 =?utf-8?B?TWQrcC9Sd0dQc3hHL2EzMDBpQlY3WEhVZlZtWXpWSGhsa09LT0g5d1FqZzhL?=
 =?utf-8?B?eEV2TGl4NVZlK2ZGdjZuUXhUaEQwcWprc2NVdkNiRGlGcVpDdFEwUlRBN29u?=
 =?utf-8?B?bHZidTZVVi8yRGdGb2QrRGZEOWZLelVDWFZxREZNelRwVFZPN3FhdXpyaWRo?=
 =?utf-8?B?Ym5rUGxxSldhamNsSWx4aXFDL0FvUUs3WWVLeDk2VmtodVVqVjhodEUxMVlP?=
 =?utf-8?B?WHZERnovZVV1cUNuOWZSdmsxYWs5UlBKUEUxMDFSUmgvY1dyZC9NV2I4ODFK?=
 =?utf-8?B?QWhJT05EeERWeU1FMXdLWGhKTWtlNVovR1BGbCtLMmZxZ3dvTVBpS0FKZ2l2?=
 =?utf-8?B?THZRQmdOdGMrZWpISmhBa3ErUXY4QUlKSWxNUzNrSzY0MWFEWjdVL0gvU1pn?=
 =?utf-8?B?QVEzTmxiR3h3bUdvNkZSVTVQN1A1a2lwa3NnbHBpQVJmZU1QYU9uQmREQnN0?=
 =?utf-8?B?YVZ2eUZieDArT0NDdDRFSXZWeFRKc1FpUWxlUE40dThxWENGbnVBMXJpY1VI?=
 =?utf-8?B?bExTK3hSaSt4ZFRRdm1HUmlSeVJpMFB3c3VvMnY0RU1nM3kxY256Y041THNm?=
 =?utf-8?B?TlduUHloekVqV3ZWQ2c2NFRLK1NOK0M1NUxqYmNETWhLWGxGazhVTmhGdmJS?=
 =?utf-8?B?M04zZWNaVHAyT0UycTF3YzhhaFQxWkpTZm52YUpEbTkrNjF3R1lWRTV0MGhz?=
 =?utf-8?B?S2UrU3AwaWtzR3NNSmcvU0VtTDhWczFmc1F5eVBkQlZPdm9kQjdCbnluNGxl?=
 =?utf-8?B?cE9SUlJZSFpCWVVkTUlvdXJFOWI1bDV3aTdBNWg3eDdqeERtUC9rTklNME1B?=
 =?utf-8?B?WXJKU0lOTkwxWmFBbHdxY25zYlVqam9MMjFGWU5sSnFvNTYwZXlkcndlRjZD?=
 =?utf-8?B?VGpFVU1KNG5vOFpLak1GelR3TysyNnViLzVqUWl5bkdreERYOVNhRW9MZTZR?=
 =?utf-8?B?N2kwaTJnd2dlaSt3a0JKUEs4TUYveml5b21YU2xxZGxjeUwxa29NRzlCOUpo?=
 =?utf-8?B?VmFxUWlaZDBRRWN0ZU5MdWsxcDB3OWh6N0lWQktzTURKcms5NzJaSnpqOGV5?=
 =?utf-8?B?NlpZMzVkaUFkbk5obis0bE96bVNtREtJdjdMaHJLVVNYRDV2UzlCRHorcTBQ?=
 =?utf-8?B?MTdrRG1kNlZmQUtkdDUxMVNCTmdJTVpnTWpsNStLK29McGM1NjhsOUxZTzgy?=
 =?utf-8?B?WGZoNTNTZ2lXM3JtY2Q0c0E3d2U3Q0owQXhLdHI5ZHFOSlBiOExIc1N1ckxD?=
 =?utf-8?B?RmZmSmg1ZG40UEtkU2RiVHlGVFpET0tPYlZGVVhoWG9Hb08vQjczTnVxYnl4?=
 =?utf-8?B?YmppbkQ1bU10eUx0SnlZbEQ3WGZYamNUYnlDRUdpZElRdjFWOERmUzRRbVJs?=
 =?utf-8?B?d0tic1ZZSVZ6MTcyMUE3R2FCZ1gxbzJIeU44blB2RTU5Rk11dHJjbGRKQXkz?=
 =?utf-8?B?TEFWc25RblRhUUhQNWEvVWxENkVlWEF0REVYalBBOW9aTndJN0ZWQVR6Z3lJ?=
 =?utf-8?B?dnVaY0labS9BT2cvYkZZeXRObmFvdDZsSEUvZ0d3WnZvOUlQLzhvTVpQVHNn?=
 =?utf-8?B?ZWF6bnV2MFFaNk9CeEUxVWZQLzVPU0tMb0RRRzM5U0k1MENJMW5YallZTjBC?=
 =?utf-8?B?ZzNGRmxUNHh2NENzMjJodlU0cWdXcEE0QWl4TnpLamxTSXZ2cFRmam8xMTZX?=
 =?utf-8?B?V0dEVVdpSThsWTRyYm5EY1VPeVloTzd4a1RMTVVqbVp5RjJwZW5naUFKV05L?=
 =?utf-8?B?N1ZzRTFHTmVhWTJGVnBmbHBFOG5UTVFDRTVYN2lPL3ZoZHh6blpuVnMrU09a?=
 =?utf-8?B?alUvS3VOMlFsNXlIN1c1UFZIQXUzNU5nM080bXVlTERVTkVUZm5iQVJQYU0r?=
 =?utf-8?B?eElydlA5ZjhFdTU1VkxnQ0hnU2pTRFJDYVowN0hOY3R4UncrbU1yUk04bUNs?=
 =?utf-8?B?NGI1MExPdUJMU2JTazlYL3B5aVJCbjU3eEZiSmpQWmVneUpsVTBHKzZuTlRh?=
 =?utf-8?B?ajRRS0xSYThXVjdlQ0dnQTMrYXFDd0VoKzN4TFdBMzhrMWpJV2lHR3NnQzNq?=
 =?utf-8?Q?pdOvrJOIC1gSBm3m+ueYjOpXD?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 10:56:34.2049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d4ef0e-50ad-4df3-7b30-08de4f6dc118
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4041
X-Proofpoint-ORIG-GUID: nc6OgGrLiHUnZiXuOQT09YmZWN271hga
X-Authority-Analysis: v=2.4 cv=d4f4CBjE c=1 sm=1 tr=0 ts=6960dee6 cx=c_pps
 a=zFavDl515riqcEWy6M9o2g==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=E_Tl1f5C0o25NIMeFyMA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: nc6OgGrLiHUnZiXuOQT09YmZWN271hga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA3OSBTYWx0ZWRfX2JmXYLpJ7Hdm
 gb5BktwtT78hcaItsenP4mwWLxltmL6dxoSrHeQfuaa5toNMk0YGnG/p3nlAVXqEka/3A49fJLR
 0RSk8dDJ7N/eSGOtUDJKYiKHXi7nb4mmxtCHKP2d7mAie+FmjVppCaj0CAcTZuB+l764elz4jQ6
 NkLlMpv+BCxDDQGQ/CYj0FxpN4PG85NmZUktnX/eQxNBeqCjGZRmF3gM8XuYjZd5M1n8HOGiO4H
 of1y2sFB7MGN9cZvVZBjCl8QsYslV9gwWH/JYfCyw1JWk1ITKo1220udE1f9vtBbbjBQk9NGQ6F
 8YHZ4ywUaEH+7cdBp/olJ6wHOlMPOagnbi/EH+sGJth/cZcOY9U+cnACAxL/vgAC4crUEVMOGii
 yxKXuG9s0WaaJmaHvBixcs50uaFCMkUQGIWOQ14J8X89bMsP4SCPwNlLvBrifjd692cmsmsyDse
 1k9ZkeA1ZZfDafXJLew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_025645_535578_118D9615 
X-CRM114-Status: GOOD (  13.04  )
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

Current implementation restricts the check on the firewall controller
being the bus parent. Change this by using the controller referenced
in each firewall queries.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/bus/stm32_firewall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
index 2fc9761dadec..2717754d811d 100644
--- a/drivers/bus/stm32_firewall.c
+++ b/drivers/bus/stm32_firewall.c
@@ -274,7 +274,7 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
 		}
 
 		for (i = 0; i < len; i++) {
-			if (firewall_controller->grant_access(firewall_controller,
+			if (firewall_controller->grant_access(firewalls[i].firewall_ctrl,
 							      firewalls[i].firewall_id)) {
 				/*
 				 * Peripheral access not allowed or not defined.

-- 
2.43.0


