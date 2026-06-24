Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B0ACDE002
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1iWNv8UMjbzirzjYFBDDqDzI/ECu6X9oRwH81I3cQ8=; b=VldsKbB2uBKKMzEuN9w9R/acQP
	HBLwCrQZGP3jCvlfDeOMY3rngz2vBqokQDpnQiNImlpr8jYkTdzmPT5jLRG6bTiykgvkl22Un5vRJ
	rW6dF3KBninn2AfK4hV/W1fgm2W/xSd5IOBtkNUFp3w3dn7kFS3U+3zEyf3KvY1O0pJvd2hZdJD1z
	1EVphdzwllmdqrvkOG4hPNZwaNdG2Wy+si/p6YIXZCzqIg+3lR/5iMt2bgwyQpJ2Slakcvq7RCCHL
	Jzph3f83AzYQ+w/BzyQCd2p3zB1OUG5iussCj8AyknZeEDtTcOamCJZSnvnsWf9EQd/vO61i8N8vF
	zu8X4Z4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO1z-00000007rKH-3Xc4;
	Wed, 24 Jun 2026 13:52:43 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO1w-00000007rHr-3Y48
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 13:52:42 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FzVPCWH+JYOLZhirM7k/EqN7Xo7z9JFCZiynYxfgIvmab9jG//rgRcqVTmukdetD+ziiFw2BoBl2D6bpcKznpaSMgQp3Mnos9pyI3oxDssSccHjhrW6xDigrLPrnL9epX4/y9usYEPkOxSQBPdt5151iGjV07BU25Gq0VfQYk0Vgwu4qMuAhCnBW+VA/kqCR60Is1BbzyHti2OMMzMIdRPPcraM0d5kA/Ae4DqetQsIuUMpP4DNE862uQgQh8qLHnWZ+i4YEo4MhtRkYyxC9EK7rxFWC7c6JuAZKmwc6Jin6VgsrZ/ACJC1+DSUsJFEdtCny6/jHTHj0uNbtUpLk3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1iWNv8UMjbzirzjYFBDDqDzI/ECu6X9oRwH81I3cQ8=;
 b=k/QdA/ig8/nHyOMIq3hpqiXEBgLdmzufxWXqqH2PI220R2Kb1rHvFVUw+Gu0nXSlBNQP+onm9VmtW4tXGMH9j0BOuU2YP+wEkWo45h904lPB0iaq5+xHWJnoP0Aw3rL03xoiyERfpKMQ9AqmcZj+KUjAUF6cxCObMoZ4IsXdyrNS+i4W9kTlx1j/lFxQra3N9ZSu62K1r6GBN7/h9DRP2Zz55aA8ocrxp/vSBBN78KxMfnD9W6FwrtYOuN+nwqPVk/4AnVIkAEqNceLpr3h44s7tVKUovEgLQzuV/Ar0pdr3WU3fABp0T01nShthV1j6SQthtJZTqY7vuIFJ3+wzGw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1iWNv8UMjbzirzjYFBDDqDzI/ECu6X9oRwH81I3cQ8=;
 b=eEDIE31EAKVM+dNpRGRZxjCe2x0EkhhQWX8VOCKun/aTS/1f9bpODUDsHS4Rr5hHw6MlVY2YYshbDESqr036G4Dh2kFkHevgYpPxPVdEIapHd68otnNueGZvilDCef6Du2IckrYpVc9Exsq8M+wwFSbLyTsm9JyZZdXLUPYK1AY=
Received: from CWLP123CA0257.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19e::17)
 by DB9PR08MB8458.eurprd08.prod.outlook.com (2603:10a6:10:3d6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 13:52:30 +0000
Received: from AM3PEPF00009B9D.eurprd04.prod.outlook.com
 (2603:10a6:400:19e:cafe::1e) by CWLP123CA0257.outlook.office365.com
 (2603:10a6:400:19e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.19 via Frontend Transport; Wed,
 24 Jun 2026 13:52:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9D.mail.protection.outlook.com (10.167.16.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.10
 via Frontend Transport; Wed, 24 Jun 2026 13:52:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yeqUgGVSPnQXZE1l+O2v56+hIU+2H2Q2oCOm4QTUJDgtB+couYUBZgRaTnBZwJ5SS+Qj/BNQAoLdCORdcodRXOkuf5Fy8xKE2UCLvwkG+cZqjUTwjLG8vbvOwCJVAXuM2CZz6FqoBKHQxDxnpeUdvdyS1K5t2WEtcJqgKxvAXA1o5T2/TuqTnGxDOOnis8xL+fDzBkq3bPIJ14c7UIORiSID7+egvMNeZaKEvYjcMzO2DJrMMWvDGdhmtq22m+YLcL2gTsamW1anX9L+uCNk/Wkq1Z0TYoqWUnRiMmp8ks5K3gsXxTjjbw5ct9Z7IsxKwSCmD5SUcbBoJHNCxmClEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1iWNv8UMjbzirzjYFBDDqDzI/ECu6X9oRwH81I3cQ8=;
 b=N+gQ6lZEEcDf/ckDyG/82j7VwVm+Q7pxJ4VTMwIXZ3hC9G4SITc5+my0+6i9rGfBBjfMSU91NMsC9glNf9PuFlmfoG/mSUeajy3bGIrWAWSxxMMRsapIY+i/CKHERdPfATEDyJaydfLAtacLcT70uOLFCB2MT8Y4EbR1U4BmAwoxnpsy/gkYMFsN764jF5BhBkBc7qW1Ivrj+A0ilSQ682P0niTD46QvbVgOdp9WZG3q/SgruH3VjLlKTh6OvlS0cr7dDhNU+m6ZRPemF23P2OcVwD2Cam4PJsfpVb9ucDZ5cVFnux6SC+q4l6zJxm3A1ov+57SsBMyRyu/hXLrcYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1iWNv8UMjbzirzjYFBDDqDzI/ECu6X9oRwH81I3cQ8=;
 b=eEDIE31EAKVM+dNpRGRZxjCe2x0EkhhQWX8VOCKun/aTS/1f9bpODUDsHS4Rr5hHw6MlVY2YYshbDESqr036G4Dh2kFkHevgYpPxPVdEIapHd68otnNueGZvilDCef6Du2IckrYpVc9Exsq8M+wwFSbLyTsm9JyZZdXLUPYK1AY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com (2603:10a6:102:46e::7)
 by AS2PR08MB8382.eurprd08.prod.outlook.com (2603:10a6:20b:559::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 24 Jun
 2026 13:51:22 +0000
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15]) by PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15%7]) with mapi id 15.21.0159.013; Wed, 24 Jun 2026
 13:51:22 +0000
Message-ID: <471d7a92-3629-4274-a303-8906d3626037@arm.com>
Date: Wed, 24 Jun 2026 14:51:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Jie Gan <jie.gan@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
 <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
 <f39ec59f-97c4-4d5f-bf02-560adae312d9@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <f39ec59f-97c4-4d5f-bf02-560adae312d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0047.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::16) To PAWPR08MB10975.eurprd08.prod.outlook.com
 (2603:10a6:102:46e::7)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAWPR08MB10975:EE_|AS2PR08MB8382:EE_|AM3PEPF00009B9D:EE_|DB9PR08MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 41329c93-b63c-422c-9f4b-08ded1f7d48a
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|921020|22082099003|18002099003|11063799006|56012099006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info-Original: RXs/rekn/rJda6jhzNBVXmsZ2V0jWGhbUVGsKo3dKe+M6KjznuORwRmaTF/nj8RM81ge2j8ZAhOjF8Lv9nOXJD1ss6Qxl+2p5RS6F/767epz/plCUarG/dqHG0OsYS/VC6zw8XWHZsN5sEH1akmxTZ6bk1W5gQpz5IhNxzonYF6uHdMnEbiJ3W+q7Sdq6Uouhhdd4ng57JZCpRR//nOuL3TOsshzILPnCZZitSJwgihCfoRPNncYLZJb0+R1bSEUKDIf8QINf9HITY8Zfmaq5wA9m50orgs+e+F7lDp7FKJ4O8/OhU34LMcNGfa8U8YeApc304FTVnaKiz5jHyUUfNcLVooUF3oElio+4stp6HBxlddTB9pLx0bVZ6qdmicQVfV8LRh5FPX5LMWLcIMTNTryIlK/WUZWCeE/VyBgqbt8MMBbY1yHqswzaNsMd5P/BlsUDj009xBZ7OJHQbHNCFjMSfRwn+tfnCc0YLe04vnEbKtWAW1SKz15wMflZ7LabGUtMFztunrl9a3oo3GTaQS31tHhIsTPVcTm0sJoel2hNnC9avy5gXNjUtjCKA7tepb9Ea/N+pIjAmfLheY1RIoBy/nVQ498cN9qFW4mkdhpbTVp/lhzlh2bi4XGb5Xa6NYRD92cFrGjVKCQuVBia4uUk53+vTRxoslb/JpoOvQHsnM5PwyJ5c7X6ya6zl1ZYA40rhyKhLP1+yTsXKI7TA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB10975.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(921020)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003)(4143699003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: CT14iNNbK2JNPi88q7o8MGpeqAeXyRyYAohTU7yHTR3VggGITwXZWqRlvJdCJUbEAvRDv3K5fFhN0dYGqAKUunH6oCH7nA5xnReXMPjneGlkKvJuhHouFw4zOnjhaa8Gztbqwo1b6Se3HaFpFcRB2YY9s9vJzRCBBqcJWpSsjRAU45ENqor8f8GNNKIoXY1Ezfr9ZI/NSiI94YjnV6DxA+GnpHyhMfOJOOta/0WQPj6PvXJimeB241I4cdgRFVL9rfQIDI8dEdHs2w/3PlmirvAx19HnyWQWk46PEDs9YbDcCNvXRomsRstGA7ssBFKhI0V+9KdOVoyl50tDivdPhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8382
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 28debf3d-4f19-4d7e-f700-08ded1f7acd7
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|14060799003|36860700016|376014|7416014|1800799024|82310400026|23010399003|22082099003|56012099006|921020|6133799003|11063799006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: M2JO2z9zc83K01DSsTv06t6fDklsuP50NW+G2bqbuAXEQ7dhni5P7OaV+H8UwKw/XbT7jcUYONcCDFjuWNpD+IKYnVgjjHKbZYcK4IHKtP97prEfmEzBZVw7bDr01ZsTpEzUs5rBCJW75bNqvNKWkqs+/ixw9Rn5cV94Zq7QJVxV+f5TRmInEijTifvJlfN5e4HT7wGUOAnuks6cDmD0p6fiL+oqPZlOr1ng9p7YB6AjncP/xK9QhplBBpBB4bpwaBNN/525v1AOCOrNNqfU7GRWt8ZMYxEBdBU71eEN926P/1i5u8MHSKhFWI3/OXXQdQYwy4c3HWrAJ1o5BN3p7d/uqoFer4RqYa5RvHCVEZ6BShhCnTaaBTu10wBdyNAcDlmCmyMaXBUyHidUY/3cnwNW8+5zDux0oFQAuLKAh4M30xcFOc4KGN3YALw6r9UKxRkQZY87AL9HNBq5TDfZ5NM2gkHuDYZjBRt0xFbVpXFBWEGHB82monAObAU423J8iQUNGG975wVSE877q6SBptmXx4sCz1pxFt9NV2AM1y+eHIjkL4jvxjzi8R1Kbqndne/Nzkv+FXVcro0zpPMSFLKHRUUiwtLM+B6zfTv1ZPZv6lCy2aCMA1W6SiV07J20gviY8Nf/gxQWbubxi0rh5wLlcCE1G6YNpPoXXQqJL33WRG6+B9KlwqrRdinWHsOZMPGraONA+Yt1CTyAjET/I/SH5NLhUzJsGELVOo/tslKJdUNVF30T1JfgncyqD6+S
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(36860700016)(376014)(7416014)(1800799024)(82310400026)(23010399003)(22082099003)(56012099006)(921020)(6133799003)(11063799006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: e3naW3xpHmhmQXlFYkLgJg4b1ZQABp/bPcBYVjI0L+Y89MxI1WsEP69y8MYD9lwQIoJQdJRxkuq5UsWb+uOqoco8l4ErIkTaKbqf5c3PzvUvgZxTHhQzPOp0JdqqxJlNKQXMkNWXXSp7RLB+RTb/ADuYDkLmc9B+HIqa+/rbY4Ytyx5l0Vnt136QhP9KVa6qh4xpdxRX7MWZ3eRc1RFAzswrfISLwsGezCoVgU1lARn6vQ0xn2txL+YzQyNWUHq2hl3QtNVbDdQWQ9zHX1aiEdqbtWEYpMcn/eCVmr0MXZ1oucQaj2TkwcUOIzNxeKgIW6USWs4DyDj6IeA/urcuHNontn6IkW/H/BgdlNb1ITCUKqa0evfE+AxL/q997paylKrnlZAtSz18Egwubkd8Ysi4wUxQFhCqpsOZtxpb4QH6Vsc12PR5rW5Dv+Bhl281
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 13:52:28.5267
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41329c93-b63c-422c-9f4b-08ded1f7d48a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8458
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_065241_064342_4923125D 
X-CRM114-Status: GOOD (  19.04  )
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

On 24/06/2026 14:48, Jie Gan wrote:
> 
> 
> On 6/24/2026 9:27 PM, Konrad Dybcio wrote:
>> On 6/24/26 11:49 AM, Jie Gan wrote:
>>> The AMBA bus attempts to read the CID/PID of a device before invoking
>>> its probe function if the arm,primecell-periphid property is absent.
>>> This causes a deferred probe issue for the TraceNoC device, as the
>>> CID/PID cannot be read from the periphid register.
>>
>> Why does it probe defer?
>>
> 
> For an AMBA device, the periphid is mandatory for probing. In the 
> amba_match function, AMBA attempts to read the periphid from the CID/PID 
> registers if the arm,primecell-periphid property is absent in the device 
> tree. If this read fails, it returns -EPROBE_DEFER, and the probe 
> ultimately fails.

Why does it fail ? power management ? hw broken ? Is it really AMBA or 
do you pretend that to be an AMBA device by faking the CID/PID?

Suzuki


> Most AMBA devices expose valid CID/PID registers, so specifying 
> arm,primecell-periphid in the device tree is usually unnecessary. 
> However, for the TraceNoC device in this case, AMBA cannot reliably read 
> the periphid from the corresponding registers.
> 
>> And is this required for all TNOC devices?
> 
> So far, the TNOC device has been added to sm8750, Glymur, and Kaanapali 
> platforms, and all exhibit probe failures due to the same root cause.
> 
> I prefer to fix it on Kaanapali first.
> 
> Thanks,
> Jie
> 
>>
>> Konrad
> 


