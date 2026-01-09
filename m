Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C17D1680B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 10:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9l9OD5UtJ51yyhOAdrv6McKpN/7vVd0EQ1KH39HGq0=; b=IWR9XgExOJs6d63wYveUm3Q+9q
	iIJ+wcBleSTaQCDDJar1B2e/ttJobhFv6LjozY5Qdk2A35Om3kWkVydT3pvpdHrKuGFc2/ZKuozov
	KQKu5hb38eyGPi/QTu87o2wQhMq/hUmxERsFUzkCAXH+yefVIyCofPIwuGFdpoNtu/HF5iSBIY0/0
	mWMbmb9dA7+jYgz3GgsFz4dcFMttMVKhgMQPcUWHjiNYtRm17wAgyDCN+5CcMENCYdDLxuaG+P4b+
	b9faft75WlJCDdZW0QYwWQNvLVCjr3OiIcqB5OGuYVOOxkBuMvSCdmZglOjZR4TRXGZfSd5DK25jD
	SxYhMDoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veABj-00000002BE2-0Jj4;
	Fri, 09 Jan 2026 10:57:51 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veABg-00000002BCG-3lrn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 10:57:50 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609AoMcm3699166;
	Fri, 9 Jan 2026 11:57:33 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com (mail-francecentralazon11013039.outbound.protection.outlook.com [40.107.162.39])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bjqctsww5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 11:57:33 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YoEwlVTIxBA/HYvHsvOwrZgmm/GprTa53cJlLPUcSrLyozWZVeMPU3VIgyo3O9YS9kfVnUJsZC8mfFeVHjksBXRaBSlUCkWrbe8AZvjmT4NuVD4h6WXTKTL2UOZZhyT4VGQ6amSm4wll6uWxS6d+8i5hCBCURpURMMYzKQkvdDaJwpYLM9Qs+B7R7/wL6llIB3w7vt1ybrmRJvtw/4kMBw2/vHQo8cVSzghtVgLc6H1fBXv9cNr22j53zqgSdLzCIykENKE1XSgNGuYglr1vPQbPgwuWc2L7S03+1+8zdgxnxPH2Seddjp8Eez1qq8VchsgPYeX5V6GGjK7Le8ItGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9l9OD5UtJ51yyhOAdrv6McKpN/7vVd0EQ1KH39HGq0=;
 b=m4WR0e9snqLkjV3u7rTJ1fbgu9hXZVbnSUt3dUi8eDyv+hcDhTHnYvOi/BLub1r302o/tbwJDcnMx4fGgBQZILPJrVqVNWLHZDelygWrcl44KBOQ2YGDqTU9Q57moB7YEEigh1wZvE+WOjUV8NxtMhus1lzg2SLg53ZcIJZ5p/vKpTHmjMErJWb7R6CpyO8oVXK/OePcUH1dIyKhvdw9F5faoJfKkp4UEe52lVMa9laGM+ok7TMt7aDGTabdK1iwKQm/Yjg1s9PIA8V49CpvW5P5nE04QOMgvF5LpzVRmLxL6P5kEjoy3y/BAXonjpPP2ndnGO12BFFgVdKCDgE8Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9l9OD5UtJ51yyhOAdrv6McKpN/7vVd0EQ1KH39HGq0=;
 b=CpvS20Wq2P1PF9dPESdgkWttUe5jrD+eFrCWET6pzKUzVqJy6u2c0++hQIegEu5U8GEdpkug6R0MtbygbT6mUwMxGRc2k1TbtNbPpg9OpvFjwfudsbqGqplNjXnh0vKdWHhQvgWxDlhtMdcxZl/j5+aMfHrh783Jj+GqQfMjoerBeYkJHXE8UKolpmLN/kaFfl0C6Dtyae/97wD19KcM8vGdmYilISijMmG10T+dE6seePQuMXzHpOELidpsih/x6cRuD0O+pgmzAp1RBgHH/RLfq/Qq1CSZy7glCw+uy6yvRzfnp3v3E/bpBjAzRuiXR/CJlLybuSHzwaIZUrTppg==
Received: from DU2PR04CA0197.eurprd04.prod.outlook.com (2603:10a6:10:28d::22)
 by DU0PR10MB7095.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:42d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 10:57:30 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::e4) by DU2PR04CA0197.outlook.office365.com
 (2603:10a6:10:28d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 10:57:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 10:57:29 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:58:44 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:57:27 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 9 Jan 2026 11:55:09 +0100
Subject: [PATCH 09/11] arm: dts: stm32: enable CoreSight on the
 stm32mp157c-ev1 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260109-debug_bus-v1-9-8f2142b5a738@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E1:EE_|DU0PR10MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: 44bd723b-d7da-42d7-80db-08de4f6de24f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K21PNXNGN3FoUjFmUkFjSGY4SWZGeWw2cUlnaXJjOFNIRlk4Vmc3ZzBzQkNO?=
 =?utf-8?B?OGs1cDluRjZ3WDRCZmVIR0doZ3FNNTlsMEsvZHlLU1FsekJ5SDBqTWNJdUN0?=
 =?utf-8?B?MitxeHJwMU9WYVNxTzg2eE1FalBPamNEQysrRnhKUXlKWHBxTllGZjF1K1Uz?=
 =?utf-8?B?WHA0Y01BNE03R0l0Vm1WUENQOWpXY1dHazVpdkJod1FhRG1IRnRCOGdDRG9Y?=
 =?utf-8?B?RXg1cDNUVGZpTGhrTkJFRWV0Z1U1MEJHUHRLMHlzajJ2Zld0RHZPdG8yZ1NM?=
 =?utf-8?B?K1lUMU9wQUZQdnJmVzJCZnpndXE0YlRkUTRKMUFVaUhQcDh3WDV1MnYwcjdo?=
 =?utf-8?B?dzdiSk1EMXhRNE81cmxabFJkKzNmL3JtTzhxUEZKWDJzcmZqaldRMlk2bzh1?=
 =?utf-8?B?SXd6U25pbTJiV1BKdVhFcmdIbkUyWjNUdHNuVTNhcnBUcE1hb2lRNHl6Y1RQ?=
 =?utf-8?B?SXBZN2tRaFNZVldsb1ZyRnRLbWpCK0hUdWNLOFdDWEVPWlAxUFN0aWhid0Qz?=
 =?utf-8?B?dTJ2MTdrVHpoVW9MYVpQRzN6bVpWM2xGVC9taGRNU0FPRGY5Ym9lamxza0dD?=
 =?utf-8?B?MUJuV1A1ZVlMNXVXYnh6VTJYelpWRG43QThNMWdGRHdJVXF4YnA4YU9SNTVP?=
 =?utf-8?B?UkxNK0toK2s4anR5Tm82QU9JVGZ0RHBwVHl4MXNUZEdyQnJwYXpEZ3BZZm01?=
 =?utf-8?B?MkxQVVcvR3R4M252U1NHOGthbkN0UHh0WG9tbFQwaWJBaXN3MkJXcjBwY0dR?=
 =?utf-8?B?OFhOdkxRKzlrcG9tc05qcUd1QlNtajlwZ25LOWxickhZVHU5TkJNWHY1TWdk?=
 =?utf-8?B?TEF4b0l6TUJyRUNxT2NERXVzQmlETTJCR2htc2I4NDlZYVlJWXhTd2hLU0JY?=
 =?utf-8?B?T1BqZXErcUdhbC9RQWhkNjFyMWo3VlNpUGRLNlJSZjk5dWp6R3BwbHVET29y?=
 =?utf-8?B?a1VmdlF1WmNNaGFMS0NvUmVhZGRIWW5RL2xxSC9NQmU1b1UyYk1YdmZBcFp1?=
 =?utf-8?B?eGhBYm9PRVRiMWZLUmY2Z3VRbHFOZkt2Nm9qaVYvNUU2YkFXekNUTEMxUEww?=
 =?utf-8?B?b0pOVTB0VS9lTGFmWGZCb3ZmaU5seWxEVW1YMjVrTm9vc0JKWk5IOXpUdlhm?=
 =?utf-8?B?NWpvM3Y2dUVEZCtMNlB0UURmK1NLTTNsTDZjSjl5S0ROMGNGVVZmQVN6TjZ3?=
 =?utf-8?B?TFdJWTZtSjJqZkEwdFFwM3ZnQytjc2N4MFpSZlVXaEl5cEFwcWFGM2UwV3Mx?=
 =?utf-8?B?WmlXWjh5OFVmdzlLb0d4TGIvRVRIMmRDKzg4ZzcrUDhzV2NoYk02S3dXUTFB?=
 =?utf-8?B?TkdEbUhUWjRCU0IveGV6clZiQ0pKRUN6bWhlTktMdnVaNEk3K3d6UmJnd1lH?=
 =?utf-8?B?U0VSak16SkNCUmRXWVdTdkE1SXN6TUhvVTMyYVhvMlRSb29uaDBsZ2xaTmp0?=
 =?utf-8?B?d3NLV09jSng0SFp1UFVNelpoZnRDd1I3ZFpXd2ovYUt3RmQ3eHptS1RMYVM1?=
 =?utf-8?B?ajNwYVlJRUE0NGh2TjF5WVA4NGJMdXBQWkFEWDZtN0l3QjAwMFQ5SFNHT0xw?=
 =?utf-8?B?VTY2WFFoYWdKbjczT3ZubDdveDAwN0lJak16SXg0aWtTbnpML3lVNU1EOUE4?=
 =?utf-8?B?Y3k5V2V5ZkF2ZFNGeCtveFhqRTJIK2xHd2VUT0FaTnNodmhTaG5ZTXBGSmN1?=
 =?utf-8?B?QTJYRWpyL3k4UE04L0V3QktIaWNoZmJLTnYxejZIb0ZtVWxHRVJleGVUQXlS?=
 =?utf-8?B?WldDTTB1em00WVlsZUdMVU5Gc21peDVNVVplWjAzeXZFREk4WkR0NnlCQTUx?=
 =?utf-8?B?QkVsQ3NBMkxCRXZuYTBUUzgxbTdlbE5ndVE2bUo4Tm1wQjB5NG5EeFpMODNu?=
 =?utf-8?B?N1RJamxIUjF4QWk0SUcxM1hkVmVRd1ZBRVhIQXF5K0FMTzh2dCtpMmZBUVRt?=
 =?utf-8?B?dFVUc2VJdEI0bjVsNjhxcWJzUml6TkpKTXhnS0ZvSHFzNVJQR3RiQkxZWHBV?=
 =?utf-8?B?ZzdIaFMwMG0xWEFUSVpUK2kyd1JKbkxKYStSWHRqWVZnWXoxeGg0aEdud09l?=
 =?utf-8?B?VHZJdTRqQlpvbXQwZlhBMFdXZ3ZZbXJWN3RBRHhKeFBrc09nM2Q2UHhsM1gz?=
 =?utf-8?Q?BuaPS6JuqfxKKshz8wQuC8g6T?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 10:57:29.8981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bd723b-d7da-42d7-80db-08de4f6de24f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7095
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4MCBTYWx0ZWRfX3iNd0u8BSN78
 ovbZ263IFJzlYCMJsC1Gl40GhEwUa7sKUDoVScJMkU8tLDngdpb19jkHzDsv7xSnRGu3Nb7xITT
 BjPBm4ce3dGljHbGYnpcBZ62OQma7gsLSSbLP+Lw6Ur+u6dj3ZA2Y8V15DjQrPXtsaXB6o3CUGC
 qdzGbZ2wWUnZrU6cy/h9QGP54lKICNZgdk2GwOLSrVHlRSIgoLxSpkxUL/aGVZ5IdqNJvFYl/Ga
 0yPSA2+zk2WpO+Luan+K4fzCQS1+I79OtbkkJT813f1EVR6DfTkMpnz4oE5J0uzWLpu2dMNdI0l
 iuogJhA9+Z4mVZ4Jc/WfBAY0ShMP9hX31YFhe2tntPyY3qZlUHJI1odVWzEcrP7jvnpY2sENxDf
 UwLLL299ZM5jJ2xVqtkmUxz0Zjnvz9QDIxaoqoy+Ot2K6rOF/LpML8PDaGrzveYQ35kIobF2xVF
 zmeauy5tr1fimBRy7TQ==
X-Proofpoint-ORIG-GUID: SxUK9-cj-6mu5jNld3ekEDOGoexkW2UX
X-Authority-Analysis: v=2.4 cv=RubI7SmK c=1 sm=1 tr=0 ts=6960df1d cx=c_pps
 a=6PCtUV3SjW4dSF/fw/j/Nw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=WyXvt1svF0yAhq5Ft7oA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: SxUK9-cj-6mu5jNld3ekEDOGoexkW2UX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_025749_237544_078F9A32 
X-CRM114-Status: UNSURE (   9.18  )
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

Enable CoreSight peripherals on the stm32mp157c-ev1 board.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index e69c8e282c8b..913c20e31196 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -81,6 +81,42 @@ &cec {
 	status = "okay";
 };
 
+&cs_cti_trace {
+	status = "okay";
+};
+
+&cs_cti_cpu0 {
+	status = "okay";
+};
+
+&cs_cti_cpu1 {
+	status = "okay";
+};
+
+&cs_etf {
+	status = "okay";
+};
+
+&cs_etm0 {
+	status = "okay";
+};
+
+&cs_etm1 {
+	status = "okay";
+};
+
+&cs_funnel {
+	status = "okay";
+};
+
+&cs_stm {
+	status = "okay";
+};
+
+&cs_tpiu {
+	status = "okay";
+};
+
 &dbg_bus {
 	status = "okay";
 };

-- 
2.43.0


