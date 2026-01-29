Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70B0D61014
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 12:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=za/h0i1/6FNCaeCXAWZBq6Qzg2NepPH8tjAe9+8KgHQ=; b=VS3rBRVeyJM3G4yXY0rOd4YBxA
	DAyk5cecLw1JAc0Ft9ArtteDVDMBsRRbdosnW51TNiHqpC7AfpxsNMIrMcj+hhiHQYjC1Ukk8lWNe
	Lz7co3A+jM4Bngw3VxT+YtzP1V2v/+S8ao1Gpx579XanuO/Ks5yOcJTXi2bnDqPugu8tNp0ag1eH5
	HYrdVsb/U9mdV8cwjvIkdY0zHd/F0lwhipyhMjqBXncjnuSJuGdamZ8kxE26t/23M7tmG3gndJg4H
	IUoGe+Ql2ntEKZ6elY0unce/xvogfLw5xPQnou1SXdPEOuqq1gDCinm1jHTjpFBLLNNLra8c1m3df
	sBu0POCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlRa9-000000007gY-2dUh;
	Thu, 29 Jan 2026 12:57:09 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlRa5-000000007gD-3VaB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 12:57:07 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TCrqQZ1027564;
	Thu, 29 Jan 2026 13:57:01 +0100
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11013059.outbound.protection.outlook.com [40.107.159.59])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4byk2km8ws-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 13:57:01 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQ+ZfJpL8DF4IiPGdGME7d1ExxgiwihDJdHKQG4tSmX5SZwh6MBtG7MKdBwM6J0I3XZf6gRgnwtriDYEeawXWFgiPUkAy64cy+m3ZbR3t6nYuP1Wdp175VOhp04VJsu2KL7z+5MT8KHyhGNaz39Yk9aM/BXYS0a9865rpXH1HWSvZfeYgxDIxLctSN5k8ZnMGfbko/Nwz8/v63j8zpeAIO5edhqsfLViN3eJC19PPeGwPhLC+wgJAlL2ib1s+vZhVQyxVhiVSFMZ7D4khLEtMIlZEjJFcqqC+Xhf8VT8JsLH0NrAYEyYN4Sy79wRjSytQcqlpv3Wqti4iWEnABTI0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=za/h0i1/6FNCaeCXAWZBq6Qzg2NepPH8tjAe9+8KgHQ=;
 b=GEnmywTdW/3SzNvQalrR05S7h33+rkfU1OgvfQ7el7u1m8lshVmtZG75dTvmd5lnCWfNm4S+fQhIitB7GqYUEd9RPH17c04mLxLSyLY1Jw4atOUkpGM7m/I30VDfAPaqBtqzdfEOwGUVLrBHoTg2E9+fyzUrJqME7IjhmrxWPbPXE6us8VEEQcMyp7sjNpQp48iYfpLo4c3fdQg70oQsIoqoCjOfOR7JorE6kPi08j2waGTwwhxqbnJv0M1dO43kS+4QlQoocfh0XLRm5bbXFv8pEU77BYdbnGI3sQltJVcq+EnVas/D/+o+pdYyHUUmLLF1DYhVDdQpTWS6rCSjIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=za/h0i1/6FNCaeCXAWZBq6Qzg2NepPH8tjAe9+8KgHQ=;
 b=HCOznOxBrIawZx2tHd3Z5Nh3BvxmPL4DcPn5ZkXeqWS+aC1MrPvjtquHYl8kuL/z22mOev3dfoqNzyLmm3oWyjSpESXlK+adrKAWrlUCTaJja1xT54oW10NLUeIStXdddPU4h/6+PqGFUyQbJcU/vwF8Ts7BxqA3qzfx11XrYb2DxwgFlizQPboQb4BCLQns+QQn4T8JIrfBkxUVuG4rTqX5bpK2mZf7+9Nmjnp9+dC0s7S4+s2obN1cgWON9xsg4t3fhUj0UuN5g0ztdWccWWPXAcMQy1jPD6jJh8dcFBtglXs/k4Z/x2u/ta9JhZh/EYIObBEp6llW8DygHO6h7A==
Received: from DUZPR01CA0259.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::7) by VI1PR10MB3536.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:134::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 12:56:53 +0000
Received: from DB5PEPF00014B9B.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::2f) by DUZPR01CA0259.outlook.office365.com
 (2603:10a6:10:4b9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Thu,
 29 Jan 2026 12:56:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B9B.mail.protection.outlook.com (10.167.8.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 12:56:53 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 29 Jan
 2026 13:58:36 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 29 Jan
 2026 13:56:52 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 29 Jan 2026 13:56:17 +0100
Subject: [PATCH] bus: rifsc: fix RIF configuration check for peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260129-fix_cid_check_rifsc-v1-1-ef280ccf764d@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAPBYe2kC/x2MQQqAIBAAvxJ7TtAtwvpKhNS61hJYKEQQ/T3pO
 DAzD2ROwhmG6oHEl2Q5YgFTV0DbHFdW4gsDauy0wV4FuR2Jd7Qx7S5JyKSWgFqjtdRyA6U8Exf
 tv47T+37IX+XAZQAAAA==
X-Change-ID: 20260129-fix_cid_check_rifsc-bf200288c4e3
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9B:EE_|VI1PR10MB3536:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e1a776f-b5a2-4c58-20b3-08de5f35e039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmRkL1JibkhqT2NQVFAwUGV2OWIxcWVQSHBGeGx2aE5kc3ZDSkcrZ0ptTUdV?=
 =?utf-8?B?UG94Y2NpcVhmUlNiOWNGeGxRNSt6MTM0Z1AzZnVQSGE3Y3FEU3k0Z0EwTTQz?=
 =?utf-8?B?ZkFOMlRaVjVFQUpPaWFlRVZxTEpsbnpibjRJR2k5aHoreVZNVDJwYVdPMldH?=
 =?utf-8?B?bi9JcG9veUd0OWszV1MvOUdONzQvMlVLc285ZEF0em9vL256VXlXT1hyeGRm?=
 =?utf-8?B?TURURTBaKythNy9ZQitla1Zjam1TUEFMUDg4azVFSUdxOUZxdzhqdFAwWVU1?=
 =?utf-8?B?eVYrYWJlYmRkL1Y4c3J5SDNMT2RxSFR3V0dhRkFPakxWZmFWd0pQV0Z5MkpO?=
 =?utf-8?B?UFJtN1p0K1pZcENYbk9VSzI2aVVqL0xveFk1cDhFWGVJQnMyMGhZUzRqOENT?=
 =?utf-8?B?RnpRdnh4U3ZOMEx0eFBwMitRZkdjcUpLV2FHVXAzUE9md2ZNZEV0c3lYYmQy?=
 =?utf-8?B?ZWl2YWdpNVpuNFlqS0VGcit6RDRuMkl1N0FiNGxZMDd0dEIxUHowemEwS3A0?=
 =?utf-8?B?VXQzYlF2QUY3RFc4VS9IbUp1M3FHZkw3bHp4K3UxRWJ1Z2U2Wkg4em0zYjkx?=
 =?utf-8?B?M2xpN2JEUWQ2SHNBUjloT1FyZEZuR3hMWDVoZUQxdEFRODVkdGgwUmd2UHdw?=
 =?utf-8?B?S3lQR2lrNXgrdG5GN0MvcURjZjVaaXZObHRKU2ExWEk2dm05Y2d4bjE3cHJF?=
 =?utf-8?B?b2Z6RDFzZU1FNS9oRk9LRUR3a3lSczk1VmdOMmpGRUJFaUJtVGdhWS9LKzJa?=
 =?utf-8?B?K0U4NGZ6UkVrUHFndFI1UWl4NlUvcDBnNmNrUUtRR2xCWEJWWWViRDlyMGdk?=
 =?utf-8?B?ckRFVjBiSk1aNGNGcVI3cGlGWCsyVy9UbzlTbzEwZGxROWxGQWZkV0szRmJ6?=
 =?utf-8?B?Q0lKUG84bkhZZHhLWlNHeVByWXNXSVQxT2F2ZzdIWUUrNHE5dWVMeEFzSVhw?=
 =?utf-8?B?K0JWcUVtWTJnYXZSbW9iS1pTVlQ2NnI1aThCdWZnOG9EKzdsVEJmMi85K1h0?=
 =?utf-8?B?M09vd2lobUYzc0ZtTGhNRS9pOTF0eG4zNDRPaFJPY2dSZVQzUFoxNmVwUU4v?=
 =?utf-8?B?aTJpcDgyUVZTa2lNZFEvMjhEZ3M1aUtBUC9ldFlCRUxYTGxPQzdnMTlLM3o2?=
 =?utf-8?B?OTRZbkRVNy9aSjJ1SHNRVldqd1dEcENZYTR3czRGanQxR0ZVNDNWODRTVjdo?=
 =?utf-8?B?SDBYaWlFVTB4b0xiRzdwa2htaVM0eVVRWkRXeXk3UkNhSVgzTi8yeWliQk9S?=
 =?utf-8?B?ZUtMaEZWdUZmck40YXRFU05YRmRVYlhlQk55ai9jemx0M3FVZ1VQYnFscGlV?=
 =?utf-8?B?eUVXZXBIV3BQRWUwVzRCdzMzQ2Y4NWJIaTRQMUVEWWVJbElDUDFzWTd4U2lq?=
 =?utf-8?B?RjNGaGtiT0JiektlWFlxZUZjRkZ3Um8vaTI2NnJFOUdDQzlTdE1PSkw3VDR2?=
 =?utf-8?B?QjZiK3kwaTRSQ3pjOUx4Qm1YZXB5OW1KZnlNZmVyMGxtQnBSYWoyWGIwL09F?=
 =?utf-8?B?R0R2WlA0RjdHUWxjTlJJOVk0NGNxcFVTeHVMSmYxbWZWQjFha3A1bXZUaUIx?=
 =?utf-8?B?VVhPTkdaUGNKdGFFQ2tWKzJyVE8wcUdkanVpd0s1Wms5MzhFeGVyQUpWN25h?=
 =?utf-8?B?OFRIL2tsWmpTeVN2eG5UakJlSmRUZWY5WUJHekRZSEhuQkVWclJiYWZ1dmI0?=
 =?utf-8?B?ZzJKUVNSZTErVEttQS84U2x5MDhrK0RIbThFK0MxSWc5M242TURSam83cmRn?=
 =?utf-8?B?R2ExMWZKUXZhMGpZVFBCZktVaGg4VmdrRDN6ajRyR0E5V0NPd1V6Y3hvdGZ5?=
 =?utf-8?B?dGRwSEp4L25HWGlDMlNyRy9YSTVUYlNuSHdTWElqWkJaN3RGRXl6dGprS1ZK?=
 =?utf-8?B?UlNUQWhTbkh4SW85aGUxQXBlNE02YnlSazBiVEd3YnkxL3FvUVZKUW00SXd4?=
 =?utf-8?B?SEJLNWtzTzNBWE1PMEJBOGpld3hEVDZ5WnBIWGJJS2M2VDMxL3BYc1YwRE1u?=
 =?utf-8?B?RU14OVhCQlBnRlB1cE1GaldKRDZFcTRJUW9KZGUzRFFuWThRU05naDFEMHAy?=
 =?utf-8?B?WCtFTGV4TjFsY1lQV05FVy92WFJhUFZNL1dGQ3hMSXRFOG9BRjBWM0xEVFVa?=
 =?utf-8?B?Q0RwY3lKVVRlNzdUMWdmT3NuWlJpeVVuVHJOSGJVS29WOVFVVk9Vbm5ob1U3?=
 =?utf-8?B?ZUtua3VEdVBIVVJFYWxiV1RTU1hhUW9kVVRJMldOVExQUGY2ZzdpeVc1SUtz?=
 =?utf-8?B?eVV1ME9SOWVoVDlEcWl1M1pKdEl3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 12:56:53.1739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1a776f-b5a2-4c58-20b3-08de5f35e039
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3536
X-Proofpoint-ORIG-GUID: 4X6wqCHxY4AYV2yZGLxCgr3g3j_-PFmu
X-Authority-Analysis: v=2.4 cv=Lb8xKzfi c=1 sm=1 tr=0 ts=697b591d cx=c_pps
 a=wn3I2JnDdEmzcqpN0poLFw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=qOaWUdmZZxA87Nd_ETsA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: 4X6wqCHxY4AYV2yZGLxCgr3g3j_-PFmu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA4NyBTYWx0ZWRfX95aEVhf9UYWA
 9BQhma7DUjedhuZQyhXh9FTzhYhHPGCcg/5KObbSWHJq5mFlncvkS5hMSt5Rc80uaI7jgpF13pA
 vNKoQ0mfT5LT1F0SsS1ACWz2YJvylsnyMRlofrsmBjIk4idcH5OojCHWB3TyDRhEomUSqw3akbc
 /n07T+yFCJmIg8CYGtn4oUiy2dHpVLsBGD4yl1HIRyp5oDMYG6Wph1GBh4HS5keotghFRCq66vk
 ikkfcfzjdZb0ZSrxOnbqr5YkDIbABO8gzAc5koKrCMdZKdbiU4ZDxr/J7kB4vq9wExGOE5lDTUI
 oV1HaLnFmayKBxdp3WRUcatxZxI5NaeReh/gHlJ/N3G+hI9BkHW8hKTn66dd3LX4nKMWYxGq71J
 Z7UU98v6hBoN1tOkVgY/K2CbZKGocC05zhEY0/4p6oJpCDpZvJ1ntJGqtoK9YZXFODEseZWIHEu
 9QzkHdJ119UAmljDmtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_045706_646091_60359A85 
X-CRM114-Status: GOOD (  16.22  )
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

Peripheral holding CID0 cannot be accessed, remove this completely
incorrect check. While there, fix  and simplify the semaphore checking
that should be performed when the CID filtering is enabled.

Fixes: a18208457253 ("bus: rifsc: introduce RIFSC firewall controller driver")
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/bus/stm32_rifsc.c | 52 ++++++++++++++++-------------------------------
 1 file changed, 18 insertions(+), 34 deletions(-)

diff --git a/drivers/bus/stm32_rifsc.c b/drivers/bus/stm32_rifsc.c
index debeaf8ea1bd..5682c086ba1e 100644
--- a/drivers/bus/stm32_rifsc.c
+++ b/drivers/bus/stm32_rifsc.c
@@ -688,34 +688,6 @@ static int stm32_rifsc_grant_access(struct stm32_firewall_controller *ctrl, u32
 	sec_reg_value = readl(rifsc_controller->mmio + RIFSC_RISC_SECCFGR0 + 0x4 * reg_id);
 	cid_reg_value = readl(rifsc_controller->mmio + RIFSC_RISC_PER0_CIDCFGR + 0x8 * firewall_id);
 
-	/* First check conditions for semaphore mode, which doesn't take into account static CID. */
-	if ((cid_reg_value & CIDCFGR_SEMEN) && (cid_reg_value & CIDCFGR_CFEN)) {
-		if (cid_reg_value & BIT(RIF_CID1 + SEMWL_SHIFT)) {
-			/* Static CID is irrelevant if semaphore mode */
-			goto skip_cid_check;
-		} else {
-			dev_dbg(rifsc_controller->dev,
-				"Invalid bus semaphore configuration: index %d\n", firewall_id);
-			return -EACCES;
-		}
-	}
-
-	/*
-	 * Skip CID check if CID filtering isn't enabled or filtering is enabled on CID0, which
-	 * corresponds to whatever CID.
-	 */
-	if (!(cid_reg_value & CIDCFGR_CFEN) ||
-	    FIELD_GET(RIFSC_RISC_SCID_MASK, cid_reg_value) == RIF_CID0)
-		goto skip_cid_check;
-
-	/* Coherency check with the CID configuration */
-	if (FIELD_GET(RIFSC_RISC_SCID_MASK, cid_reg_value) != RIF_CID1) {
-		dev_dbg(rifsc_controller->dev, "Invalid CID configuration for peripheral: %d\n",
-			firewall_id);
-		return -EACCES;
-	}
-
-skip_cid_check:
 	/* Check security configuration */
 	if (sec_reg_value & BIT(reg_offset)) {
 		dev_dbg(rifsc_controller->dev,
@@ -723,19 +695,31 @@ static int stm32_rifsc_grant_access(struct stm32_firewall_controller *ctrl, u32
 		return -EACCES;
 	}
 
-	/*
-	 * If the peripheral is in semaphore mode, take the semaphore so that
-	 * the CID1 has the ownership.
-	 */
-	if ((cid_reg_value & CIDCFGR_SEMEN) && (cid_reg_value & CIDCFGR_CFEN)) {
+	/* Skip CID check if CID filtering isn't enabled */
+	if (!(cid_reg_value & CIDCFGR_CFEN))
+		goto skip_cid_check;
+
+	/* First check conditions for semaphore mode, which doesn't take into account static CID. */
+	if (cid_reg_value & CIDCFGR_SEMEN) {
+		if (!(cid_reg_value & BIT(RIF_CID1 + SEMWL_SHIFT))) {
+			dev_dbg(rifsc_controller->dev,
+				"Invalid bus semaphore configuration: index %d\n", firewall_id);
+			return -EACCES;
+		}
+
 		rc = stm32_rif_acquire_semaphore(rifsc_controller, firewall_id);
 		if (rc) {
-			dev_err(rifsc_controller->dev,
+			dev_dbg(rifsc_controller->dev,
 				"Couldn't acquire semaphore for peripheral: %d\n", firewall_id);
 			return rc;
 		}
+	} else if (FIELD_GET(RIFSC_RISC_SCID_MASK, cid_reg_value) != RIF_CID1) {
+		dev_dbg(rifsc_controller->dev, "Invalid CID configuration for peripheral: %d\n",
+			firewall_id);
+		return -EACCES;
 	}
 
+skip_cid_check:
 	return 0;
 }
 

---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260129-fix_cid_check_rifsc-bf200288c4e3

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>


