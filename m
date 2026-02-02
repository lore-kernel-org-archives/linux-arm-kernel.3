Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D37E73179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 13:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rV2Vy44R47kEwtUuVJqd0Yij8unfHAg61KjqEYR0WGo=; b=yXuhIzWR32eDRa0ZblAK38YpDR
	nWHP/rTLPRBO7pF101OuZLE/MOgfl2mgYwnU4ADf55kXDUhArZ520Q2PM19LptYnXRAXL3hqQp1SK
	n7djimSMfnQRe/9H5gHa6hE7cmjVFYmWzLMs1rwCSVK50mI8WotoQsxEHMkwmKPdmhVSF+lKriNWP
	kPMlFkehY8XpKRH7qVCwILvuJrBe1tGRd1wsJcr6yEWKfYCiZbdjRiDFVCECz3gkOb5ZmJd+USHOZ
	jG2P1Te2bn6IK4vJkQQjHapdbqHkmeKSLq+mjm3osX/hCeTzwakGu380dVdX2NRjSTXXWOVNepFJH
	tc/d7OZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmuRN-000000052eh-0D1s;
	Mon, 02 Feb 2026 13:58:09 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmuRF-000000052YX-3RkL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 13:58:04 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612DhivW3353509;
	Mon, 2 Feb 2026 14:57:49 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012032.outbound.protection.outlook.com [52.101.66.32])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4c1am0wten-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Feb 2026 14:57:49 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXge0+1iwLfMhC32BWoTbIrcU1PVZhbKCJszIbk1brpLJkgMq37I9N+XVC31+4jYVGkPhGuzS0Mj+G+ybmPF3F1r/uXQzt8ekv3UUwTto2psnDTtXuH6pktLGEA5cZ5Mlw0NrlYhBtL2lnyqC3MYq6znwnwmBGZvw8ef8B+sQWpdBF+YCJxhI8Inh5LD04mibAYx+m0yAlPWnruwrTf23YaxXp+MejqgkqTFOBua5hGy4bT1XqMfxWo/qAjhN8HBD50bl9vndIFnJKxgtrEBdqotQCavHAXia2NjXyfs/9DrtjIqALZrHDtNwY8VSnkOwhxLBIRrBACEt+XksFlPCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rV2Vy44R47kEwtUuVJqd0Yij8unfHAg61KjqEYR0WGo=;
 b=lb858Bb2HNxWlq0vFjHhafsyiqEo1uHWNg65/znOu8RDKnfnB86AVTxtA+U6gnQ7gWp8i1Y9Sd7WxeReWqG2/lLoQRt8SK7ZuG44G2s4yYMPb2PWhfgUPmux6I1l9MkvxJ5DD7wdLkb0I7zSKqSEXcj2DtnEq5WTcEFFCWXNFBUqH9ArQRJ+rbRk+UFHhkj/jLBQtnz7dg6a9uIvDd2NhP8KVErwvPQ01Cq9iXWWIM03P80FEcm2pj/EtBvYa7IJcvAR73kG7pirH2WfgWRUhOWCP0Y6OXVhr4Zcwh7GCcn9at2ExWrCfmMnf5FsrkXDutVlKvqEMhAQBqDH77mcsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rV2Vy44R47kEwtUuVJqd0Yij8unfHAg61KjqEYR0WGo=;
 b=DKwviCAuos0/nOj7Kk+VgdcwFtW6r7NbdbVL4A5vFkMz91Sqaljw2NxBrHShfqtWz24DdbktUxGoKUIDmhRcIEH5jcniqC4mG8uONY6jRSHh2eyHmObIiDwLKQertIVhD18BVONVar9I4P2HEn5yG0Chjtp6YpeDygmyeXMtJBLzHeT76qJVibH5/fsckyeW3xJlwtHKHAcFR1rdWobmT2JOgVmXd3+Zh2wyZV9/D471q+erRCUduhLZmcj1OOHYj7WGEPH3mOuhoidVKx0LHZd/T0A63td+T1NY6Zyw64yUaXj7xawiBPDjAvsmWXiGxla1RFbN7YR8NSgO3u0dkQ==
Received: from AS4PR10CA0009.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::12)
 by AS2PR10MB6448.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:55b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 13:57:44 +0000
Received: from AMS0EPF0000019A.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::bb) by AS4PR10CA0009.outlook.office365.com
 (2603:10a6:20b:5dc::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Mon,
 2 Feb 2026 13:57:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF0000019A.mail.protection.outlook.com (10.167.16.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 13:57:43 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:59:29 +0100
Received: from localhost (10.252.7.227) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:57:43 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 2 Feb 2026 14:57:28 +0100
Subject: [PATCH 03/13] media: stm32: dcmipp: bytecap: protect CMIER
 register access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260202-stm32-dcmipp-pixel-pipes-support-v1-3-8d8d51f5e014@foss.st.com>
References: <20260202-stm32-dcmipp-pixel-pipes-support-v1-0-8d8d51f5e014@foss.st.com>
In-Reply-To: <20260202-stm32-dcmipp-pixel-pipes-support-v1-0-8d8d51f5e014@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.7.227]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019A:EE_|AS2PR10MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: f686271d-0b02-4fb8-1c5c-08de626309ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3YzWFlMcDJQNklhVUYvT2w3Z0MxSVFPdVVLVGFLbGgyUGI2ejZQSFplMkg0?=
 =?utf-8?B?MGxGcVhQTTczQUswOHFmcVpuaFRaVDB6UEhXVmlHcXFMa0YyRkFIb2pXSUhD?=
 =?utf-8?B?Nk9EZ3dsSDlTd0xxTGd3SWsvOGpxRmVySTM3b1hqS3d0OWo2bnh5SHRUUitU?=
 =?utf-8?B?anFyTjBNdUZBaHVzUThaN2Fnb21HK1JaZGtQK3IwWkVIVUc5cXVpU2RpUGEv?=
 =?utf-8?B?Yk1yUVU1N3FybEhpUUJaK3dpVzhZQ3pHOGNPRll6cG5McmhEbmU4MlJTSkxj?=
 =?utf-8?B?dDVQWVl0S0ZiRGdEdWZwRmg1M3VtVjFYak9DUTBUVlZxdWpXTzFqOHp5TnFV?=
 =?utf-8?B?NjYvVkNLSURabWZyZ1Bua0s0U0RZRHNsbDI1MFN5aWtmRituLzFDaU1GMTZ6?=
 =?utf-8?B?STZoVlhOczNiM2VhQUZMdlZzenlVUGo2MDdzcGg1bmhxQXlxRldMTnNqKzdq?=
 =?utf-8?B?TmVIYm5XaSs2ZnB1NDlkNHhhRGV1TFc4Wk1LQ1FOM1ZrQjZndUNQK3dLaWt4?=
 =?utf-8?B?RUEzZjFtcWFUWE1WRTdRRzBHQ2FYdit3c2RhODN2WWVhNGpmNE45d1F1UW80?=
 =?utf-8?B?aERwOXNuc1NmSWlkMW1rTlBTSlFNZTYxSGoySzBXY3pIYUxNR08xMnNJZmgz?=
 =?utf-8?B?ckJ6L2l5SDNVakFhL1I5MjNsRlhKbWlvcjkvL0ZPSWQ4MGd0c3JLY1cxVmlS?=
 =?utf-8?B?R1BxaWlKL3JTYnhSa2p1REU5WW9HcXRBRjFTRTRoZmpQM2M2K1FFRkJoTVBN?=
 =?utf-8?B?U1g4c2xITDBZRWlhN0N0ZEI5VzdFQzg3MVQ1L3dzZjBEN0gvK0ZOK2RGSkw4?=
 =?utf-8?B?R0JaMklJd3lvT0RoK3dxSVRmL0dKWVBITDhQZXZMa2xjc2l2V010elh0VTZE?=
 =?utf-8?B?TEgrK0pJLzhwaEdSYnN5UFFPM29LL0J0S2pYSUxiUHpxWVI4aGpaN2VjUW1a?=
 =?utf-8?B?VmJWNGhoSWplbm1yTnFOUnRuZFJrSnRReWRzRFZDOVg3QWRzUUJRcENiamJ4?=
 =?utf-8?B?a2NES045bHkrUk5ZcmN0TmZnaGtKMjR1dGNKS0ZTbVN2ZVhkRTBIeWpQRmtn?=
 =?utf-8?B?WDFNY2VjWDZwNFB3Q3pObkJ5eUJMOHI0aS81d2RmU1FZSDFVWStVUC9QVjZz?=
 =?utf-8?B?RHBYRS8vWWNpV1hxRmM2OXMxc25JbEo4S0lmSDFBOSttV0RtWTVMT0d5RWRk?=
 =?utf-8?B?bkxqZ2FKSjFYTzl5clZzSGIxTTBQVDRDcDBIZGdrYmZ0dlJta3lQZ1MyOTZn?=
 =?utf-8?B?WlNhbDVHeHdSOUNUbU9MZUdrYS9yR1ZzZ0FQK0RFZ3NYVG9nSGdkY3FNbk5z?=
 =?utf-8?B?dUtJNDBwK2tHejlZNlRPdTI1VU9tUFZXR250YnkxVCtTZjdIWDZVeUdmY3ZM?=
 =?utf-8?B?NXpoaWhzNlJBU2tRODZRNURoL0R6N3NrZWFPMnhOQ3dZNWVjazlhTTVGei8z?=
 =?utf-8?B?bjY2RDZwVWx5SHpudlZBM0FvWndjZzJQZ1M3QjlET2hISmN0bmJhcVhQMGlL?=
 =?utf-8?B?aG5odnpEK2gzeERkNFp0YytTL3JkRngxeEVWcUVDeU4ycFZtQmtSUlJwNTgw?=
 =?utf-8?B?MWhvNXFwd1M5TTJFUzF4cndZQzV2OW9XdWRIZU1kM3JkVytyQUVBeFRtM1N1?=
 =?utf-8?B?NVFoQUZsSUo5eVhTYldwMnY0MmdJd09NSGhxeTdwV1YxKzdGVWNhWHBGZnpF?=
 =?utf-8?B?dVFDOVJHMkw1VjBKY1pYdlRYUFdYNHRSZXZqVDRkbkprTDlsZnhISjRKUWpP?=
 =?utf-8?B?ZE1YcWc3WGVWYjRJc2dIc2IvaENJaUU4NDZ3ZUdNRXZ0Qjl4c1hJa2lZZmo3?=
 =?utf-8?B?VkpiZUd4Q1VDQnZGY2owajQxblZXbnZWeC94Y1ZtanBDa2hhbFZkdDJ4d29s?=
 =?utf-8?B?T0FNVW1GT01kKzUrbW5TOXYvSS9rUHpHbVBqSjYwRUhMSEJSQllmWlJiTFNr?=
 =?utf-8?B?bTdPVVpNcGtta2JRd1FtSzhNaERxMTJRbUFrYlJnRjFjRlBsT0hiMzJaR21p?=
 =?utf-8?B?ZmZFWWNNSXpaa0QxYTJEZGhtUnMydUhRcG1OeGRZLzNjdHUxYWVRcmRWcm1m?=
 =?utf-8?B?T3BTNExIYTJldUI0S3BFT2pValQ0TCs0Tll6SGU3ZVRjeGNqazN5cERlYm54?=
 =?utf-8?B?RUVxc1kwdmY0Z3FyaTlUZG9QRCsxakl6YUJkYjJHd1ZRbmhQZWx2UVZ0Q0sz?=
 =?utf-8?B?TW8xMzV3dDRtZFhWVlMxTVhLeHdqS1dzOVhCZEg4NXhKUmNkU1pvNEJJeXBW?=
 =?utf-8?B?YWdHd2VTekZZNXBYOG5wT1c3TytBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HUTr5dnD5GlQeOVN7MijEqV90zAg0h+tm/OmTicRv7If9XbvGbrqLi7gLRUrT1lr26iXQ4y/DN1nP2uZmMfDkIks0eI9FrMNPBHBABdpGaxtuSuDxL3Ie9d4itSmZsw9Z4et/V3NFbn7WKKZ1kZtATKKKmHX5u5s1rGPJmQNFU3zqJqmDhovWdEd0E42VOHisBncu+DMdk87I3pYFFFHgFXAvpnLUuT0UM35MkaIXHr4D+ZcQ8DDpkd8ulOLuqMqWSCG8PpLazr5SfwzTKB6iebmKXZyT6URbZDA1g7ERTso5+F1grpQcVUdJyHQRsv+Nv6yQdcsjd4HkOSKc4pKEvtR2mgUJ2qcyKBL/5FC8admMQsV1MWkCjzXiXxbEs0D6WSbdleHALGDjmaaltRBz+8P79f67k2tXVhKozSbssxkAGseGXPGIHsI/SBLeyPX
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 13:57:43.9986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f686271d-0b02-4fb8-1c5c-08de626309ea
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6448
X-Authority-Analysis: v=2.4 cv=CKsnnBrD c=1 sm=1 tr=0 ts=6980ad5d cx=c_pps
 a=Rrpy6ZZndnJsE5qr2ew1qg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Xa52oM6mtQYA:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=JcXk92-dJu8NvfVU0rkA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: CCsisQnmGDZjItq-XKQJ0eVFYRikhuf4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEwOSBTYWx0ZWRfX406oSf2QMGA3
 V/Lqv3EBfOLBBUFvQITnGdXdlb6JAmhtX95J1nmIQ+/PyjX4HO4LOxOx5sHVYynSM616+HItcH+
 OW/zU883DssSjoyt3XD8TrducIOiFvDNfNFMGvLFpySXWgabWI46PcAwRCkoP/r0F3SlyW05B0K
 YyTjgrmNu6FD1J+qIKat57clFRYAD2BjMrFYzD63HdWHn2KY8falDyB1xR7dLxdKib1NWmbiSYH
 vpxh8auVOA2kzqGtftX6cF/8cR7HHGhaJbCktvtJ1iFodeUpUpwLOWovCPs7v4BEWq+luAzjQ19
 PZXumtX95YrC4vgmo/sJ0rSapVHhZRY2bzbeJVCqaV2bXQtL4vpJKNZtuSb9ESkllTHhBjzLeS8
 2WTjnQbH+LUukcZbX48UM2veJUU2SmbygqKQV+WFBp1DGXwo77sioWAs0rXPL+C9PzpEtEXqS9R
 MDBRkI9x0L0eXfmGSRg==
X-Proofpoint-ORIG-GUID: CCsisQnmGDZjItq-XKQJ0eVFYRikhuf4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_055802_304526_177A62F1 
X-CRM114-Status: UNSURE (   9.97  )
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

CMIER register is common between all pipes and thus needs to be
protected from concurrent access.  The struct v4l2_device structure,
unique to the whole driver embeds a spin_lock which can also be used
by the driver itself as explained in its description.  Rely on this
spin_lock to protect from concurrent access to the CMIER register.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index 1b7edf0d2938..0b1d1fbda5d6 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -436,7 +436,9 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 	dcmipp_start_capture(vcap, vcap->next);
 
 	/* Enable interruptions */
+	spin_lock(&vcap->vdev.v4l2_dev->lock);
 	reg_set(vcap, DCMIPP_CMIER, DCMIPP_CMIER_P0ALL);
+	spin_unlock(&vcap->vdev.v4l2_dev->lock);
 
 	vcap->state = DCMIPP_RUNNING;
 
@@ -492,7 +494,9 @@ static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
 	media_pipeline_stop(vcap->vdev.entity.pads);
 
 	/* Disable interruptions */
+	spin_lock(&vcap->vdev.v4l2_dev->lock);
 	reg_clear(vcap, DCMIPP_CMIER, DCMIPP_CMIER_P0ALL);
+	spin_unlock(&vcap->vdev.v4l2_dev->lock);
 
 	/* Stop capture */
 	reg_clear(vcap, DCMIPP_P0FCTCR, DCMIPP_P0FCTCR_CPTREQ);

-- 
2.34.1


