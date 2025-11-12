Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61738CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49QLGGSKf2Q8HYB5KyHPDZ0qkqGkNyLhuwIP3PFCXAM=; b=mnWORTs3HsQkKAd2nIxZJwnWOE
	62etpTFllgKMs1+XbeIdV1GS5nFWWpBWx8A0DJntRfbQjNmy29ZMhB5WoDDJH6lkzSFfa27dJkIbf
	BvvD8hq7kLn3WH586urvN2tCUWuHbYzss5GH3kAh/97AFnZZwZ8eWVQdRykT5sJYg8481vNYJy/JX
	UrYlLXofKmP5V88rLcrjC6ab5Cb5EE7ccSiHTnjUI7zCx0e5X9OMiA+oubLF37wbkZ0AFT3N4kdsA
	u8S+NkiBwMqHVeieUxiXlyFMnL4zyzz0MXRODSV187Lr3x4tQ4DhrvhD0d7vDoaQqxHbHdDvYMHJY
	ucpSc+Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD5j-000000096ID-0vDP;
	Wed, 12 Nov 2025 15:49:03 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD5R-000000095x0-2WLX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:48:48 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACFS4Hj1067045;
	Wed, 12 Nov 2025 16:48:38 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011069.outbound.protection.outlook.com [52.101.70.69])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4acreu18xm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 16:48:38 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUoyhdYjCnkWrDDvnPGpBnocZaNSgpeZ/EK5Y8TwO6tc+anKcDwr5nI4K21ge2lydAKUlZc2pAoIqoOhgEh+SpZek44fIQoOZF9AhJS1XMs+jeyRCVN52qRr9tryHuT5tVROoCWRGx7Cms4rueaWYxy+58wZXBe8Joe+k4O965OiBS64TYoP+8giMcnDoeMjzp/k7rMPPFXWImb+7rpHv5UmIPu+j82Z7YC0pj55BZPwNxXjkN3gvgS5sRqLyc2TVLc60Grob3/08Q4x5mu0ZplCvq2XtscV4sudp952ZwTlWc8/jKH4riFs0G40JD4rfZwHO0KH+/jLVO38eU5lMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49QLGGSKf2Q8HYB5KyHPDZ0qkqGkNyLhuwIP3PFCXAM=;
 b=q4juJYe4vEQq5Zhmq+7PZNouAr+FdoeSq9R3SBjTgDzmjHKAOQvP7O/vYuIkB/FXthtxoZ7RTzlyMH9DYoqiHBnjKmdCf4G6zs0O9wfpglhU/EetX4Uv13yfj+SzZa1CF5EwxzYPcQalSu6AVif7G4X/cM1JjSx7/4urxnFVWbVqBCyeohgZpBYzoFskzaFwQB7uQbKQq8/wJAwICgiA7E9z6TRxG6RWzy1PlVkxyzdAItd7iQgRqiCIWqOLIWj+8ltMFC+oFqZeh7Quy9KDwYZd1T6EtmD/w1atG4xsrNM8KyNn1UK4iv3XqYdQ4yx8xF0UOcOXU1T13hjY5GjM6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49QLGGSKf2Q8HYB5KyHPDZ0qkqGkNyLhuwIP3PFCXAM=;
 b=Qn5DY0l2Ha48e45WeFGrPglybBYWjnCQr5Kdbpm8npttqjbpP56JmroUeyv7yn692+Tj3mooCdvZ/qn4cCODRrZWU78eE9EdjkiwbvYA/5RBns75+9zoYWqHkPsN4Ux7UxbAN088c92aHLG3Uu3PaE0ogAckNXQXIaYiL4osZ/iuO6IdhhCctiTqj+JdtSpG1nwTQ2E9NPhut8bwIWu3a8xSjZTZZg/BubmYPlrAvJNgv+Qvt0OI46CvQ4Dt4ir20iZ5TxrsZyQXIpkLAJ17KQUgP8Dp16io/TMG0801MJq4tTx6NkVhtkGkmPrFcBHbtp2TfGhOPXyR+ol0X/Mrfg==
Received: from AM0PR02CA0168.eurprd02.prod.outlook.com (2603:10a6:20b:28d::35)
 by AS8PR10MB8016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:52b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 15:48:31 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:20b:28d:cafe::70) by AM0PR02CA0168.outlook.office365.com
 (2603:10a6:20b:28d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Wed,
 12 Nov 2025 15:48:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 15:48:31 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 16:48:39 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 12 Nov
 2025 16:48:13 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 12 Nov 2025 16:48:04 +0100
Subject: [PATCH 01/15] ARM: dts: stm32: Add boot-led for stm32429i-eval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251112-upstream_add_boot-led_for_stm32_boards-v1-1-50a3a9b339a8@foss.st.com>
References: <20251112-upstream_add_boot-led_for_stm32_boards-v1-0-50a3a9b339a8@foss.st.com>
In-Reply-To: <20251112-upstream_add_boot-led_for_stm32_boards-v1-0-50a3a9b339a8@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004E:EE_|AS8PR10MB8016:EE_
X-MS-Office365-Filtering-Correlation-Id: 54e2bba2-871c-41c3-e592-08de2202ee2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGZRZ09Ec3ZrVzdPTndKVTRnTFQvSnJaZVI0eUZ1bnBSeXdNVXNxSVZLc2Nm?=
 =?utf-8?B?akk1b21rQ3dOb0R5N2xJdFdUUjl5L3g3V2NWTEd6Tmo5U2g5WFdxdVByejVw?=
 =?utf-8?B?THM0K2kwQXdDVkNCNWxiN3FzU0s2V0htcE1OeTRUeGY3RStseHpNMkxwWndH?=
 =?utf-8?B?TEk4MXhHUEl2VXdUN0dSSW15OXk5S2FyK0tsUHNxS0hDM2ZlQThGeHNWZEcw?=
 =?utf-8?B?UlJjVGJTKzNTUjAyVTVwTXJZZnFlKzk4LytzZ09GMUpSQzNTRkdRZVJaTTh2?=
 =?utf-8?B?MHdHdkZyczAvZjlrcXllQVN2eG4xU0MxcG1XMlRwamdtbkF1R1lwbkJtVVBO?=
 =?utf-8?B?eUlNYVFKNFduN3UxTVlnWTZnYjVIZTNGQWhsUWNOdVlLc2JFOFkrS0ZTWTZB?=
 =?utf-8?B?eXBHVkFraVk1R0JmN0RxeUJ1amxFTTRmMjRPRkQxNGFETXBUYm9TUW9weU1a?=
 =?utf-8?B?bWt0RXpxWU9ZK2xWTzVUN0tQcG95eVR2L2RVdzkzaCtVMGVqOXYxdEZhdDM1?=
 =?utf-8?B?Zmh2VHpXNzh5QTRsWW5KeFBDV0FpYTl4N2VOM1dpQWRPVXFRWkJBYmZYdjJK?=
 =?utf-8?B?cFlVVUczV0RlUXV2Q05oU2FKOUxYdWMxcVAwSXVvbUNNK1A3Z1llbGlneTNV?=
 =?utf-8?B?VWJDdEhKLy93dnA4UFFGY1RLV0FkbVVpemhISTdPd0loQUxrMndmcEdNaGRt?=
 =?utf-8?B?SmljVk1jM1hkejRDY3M4S1J1UHJ6RVN4cG14YmR5Y29oODJXV2V5RE50MFpq?=
 =?utf-8?B?NGhydytITTR1U01OL09PTldhNW4wTXlKbXhMWVpPdnhTaE5RdVUwdHVIVFg3?=
 =?utf-8?B?UGxselZJR3ptd1ZIQm9wUllTVEZkdU9rWEsyNW13cmJXOWkzWWwvdDNIZklq?=
 =?utf-8?B?Z2ZZamhGY0ptQmxEZGhVUHpBSUlOaG91L2N4VmJyR0kvdGRoWHdXUTJnenhD?=
 =?utf-8?B?a2FpMFJFZWErQjc2eFFlYi9teEtQeEp2S255bm9XZzZSUWhrTmNjakFKeE43?=
 =?utf-8?B?M05nQ2crYnVhQy9Ed0wvTU5ieDRjTzZVUHBjTXViZnBKTXAxZFVzOUczK3pB?=
 =?utf-8?B?SENxMVVmWnRZK2FtaVFidVEwb3RtU055dlc2OFJrSmhRODBtcjdZUW0wWkZR?=
 =?utf-8?B?NkQwVFNtY0dCdlcwOXZhdlZzb1BsNDQ3QVRuRjQ0MzhKRkhvbExydm1xNGph?=
 =?utf-8?B?Rit0VWNpeHRCZjNXUFNkVURNR0RxMnJXWVExdmNmUVVUUGZOOUxsN2Nxa3Az?=
 =?utf-8?B?U2JycGg3L1JFOVpoMmVKL3MxRTBnNUtyZVZSQ2pWeWxiQnZWTGpTdmtDUmlL?=
 =?utf-8?B?L2kveUk1dmJGRnZpaGVvenZXcGthMGNUWElFOUxpT2VlUFJPYTBYcU4wb1Ra?=
 =?utf-8?B?U2lMT29RNDY5czhVYjQybVl1T2RlK0xVQXJlVzJQK1lzK3pma29SZUVHWG15?=
 =?utf-8?B?Wml3bW1RVUlFbGFoQlZBRXpyc2gxTTdSVm5aeG1iOGFoKzBGaG1Sa1JKZ2x0?=
 =?utf-8?B?cmExU3hhTndObWF3d3ZjeUs2d0l6cHgvY20rWk1mcnVCZmozdG9tcHVGR2JU?=
 =?utf-8?B?RUp1ZE5seXYvNWtKNjFER0VEWFNpallJTkVpT1dTRDBpR2tRSDNaL1N5NnQy?=
 =?utf-8?B?ZHluelhCclJCaXF3ODZHYXVTVGZUaUNEL251ME5aa2NLSHVpT0N0d0RiWHhw?=
 =?utf-8?B?UlA3OGo2NDNVQnRJZHFqdno1YzErL0Z5amdUQ2h3UEtIc3VKWlZBaEl1MUVk?=
 =?utf-8?B?RGdpRUxRMVJNOW9xZnpndk9xOTkrMUZZelRQc1VtZFhycG95ckhRamQycFlZ?=
 =?utf-8?B?c2RDMzNWNTk1SGxLWllybDJMQkV2YkJmakcvejIyWGNLSWhWYTdFK3Z4dGxG?=
 =?utf-8?B?eEE3SkpNMFdEWk4rZUd0STJUVUoweVlBRFpCTXFkbU5pZGIrWjFwTnVJblpY?=
 =?utf-8?B?QUJGd2ZRaXpHYVJtY3JFNHhFdGxPNkVqVkc0VUlTSGVlbldwZllhamRDT3Zj?=
 =?utf-8?B?bFhtdnltT0xYR3RlNERvWGp3aklGSUIxUWtITzVkcG9OcnArd3ZBem9oSW9Q?=
 =?utf-8?B?bnovZkdVSUYxR0NFNm9nS0tEaEVzUG9KcmhncjEySU1ETVczWmlNa0ZuVVFr?=
 =?utf-8?Q?xnYo=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 15:48:31.3723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e2bba2-871c-41c3-e592-08de2202ee2f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB8016
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyOCBTYWx0ZWRfX/Hx1PaZKV1nK
 lGj5SBjYSJw1M6GNV//cgrVg1SF1TrlOWAQel32j6mxDcRQgvhspuj4UPNtkrhq7Mh5TQuQMLd/
 i9B9TmrH8Qwn2sbgXomWvpb9/2QyxOXGjpRsu/f86OI9f1wPDwXzWwGCNE/C0gvE83AV5ow1HE7
 T/yYR12MXq06z2YauerQfYV5YdYLu6VyZdizAKlnHe5S4iP874b20ajqyzb+Cg6GaUh/tXW2BPE
 03Z3ygrT+RNiwjgEQ+1ctYXIP6kQBfetOSOv6TIkN2z/mHUab+/A5tnjiLvLLLd+QzZnycvT83i
 4hSqUXAudYfQRibgXc0FjzjSBPrm0Wmghaw2ISQ9wz2lHMNf3JiGInxFORO0AsCH+QlCrSxqlMp
 JRkygYWL3GoMNlKmOt7OLw9AxFGDeQ==
X-Authority-Analysis: v=2.4 cv=D+hK6/Rj c=1 sm=1 tr=0 ts=6914ac56 cx=c_pps
 a=p0FW1gfgMMgpKxjma+OggQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=W-ctBjF8gBjfULJAvIMA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: Uo_5r1FwMgXZBZzXl3I8z9p1PcgrEuXW
X-Proofpoint-GUID: Uo_5r1FwMgXZBZzXl3I8z9p1PcgrEuXW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_05,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_074845_966104_B0970897 
X-CRM114-Status: GOOD (  10.67  )
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

Add options/u-boot/boot-led property to specify to U-Boot
the LED which indicates a successful boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32429i-eval.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32429i-eval.dts b/arch/arm/boot/dts/st/stm32429i-eval.dts
index 36415d4d2ffd..f4b1c4eb64f2 100644
--- a/arch/arm/boot/dts/st/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/st/stm32429i-eval.dts
@@ -85,7 +85,7 @@ soc {
 
 	leds {
 		compatible = "gpio-leds";
-		led-green {
+		led_green: led-green {
 			function = LED_FUNCTION_HEARTBEAT;
 			color = <LED_COLOR_ID_GREEN>;
 			gpios = <&gpiog 6 1>;
@@ -126,6 +126,12 @@ mmc_vcard: mmc_vcard {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
+
+	options {
+		u-boot {
+			compatible = "u-boot,config";
+			boot-led = <&led_green>;
+		};
 	};
 
 	panel_rgb: panel-rgb {

-- 
2.43.0


