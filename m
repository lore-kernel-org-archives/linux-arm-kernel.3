Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E799EC01B6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=em6sO/eE6LyqszYkGsfMmhIKh4bBfx55luPbGKdGryo=; b=LrfPYiNjzObrtspR/4Qd1j7eo+
	ZQM1sYnlyN52GfPlZxHQFoEnMSacnT+7yf0+mvsB2KzFI9bQ4XZfeNCBICCCxcZgaYSOsUVHr/lau
	iW0eGYiOoRI54PfecNllf1VaqbIMtSqaF2b3xd2UE1XFkS9nlsVZarXTSv/S8V88sA2NG2ts3/0ej
	CkXfS+8n+lhd+0GMwiA8bCnVB+T6P+IS7swMpM6LdoHt3i8RaMQt7+LevIgtCjE6EcGfryyJpmIJ4
	QKihfJb4rCED3L3AIrcJv30y25m0MgYEgV0EjW0/Cyp26bGdbejuFKuJ3Mxd0OlkcvU5Js5Yv4JqS
	Sf6pZgdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4buC-0000000GP5C-1Uvv;
	Mon, 23 Mar 2026 09:49:04 +0000
Received: from mail-norwayeastazon11013062.outbound.protection.outlook.com ([40.107.159.62] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bu8-0000000GP4q-0ed6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:49:03 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aSlsQd8H5efWgNCMg4/efrAkb1+uFZh9WN6LNe8WkLA+rdax1sypeZFbKLfFGSbzi6SScNMeLwTzZz5NZEHalUcRpt7o5UvQkMqa2EyatLWcm9S0k/JHU31Xi0p9lop9aIQIu2kzIqY9RPA0u1mcO17Q8vjTgI45K6C7c3CT/txRfCeey1/S4Mr4HKhDmgDkuOD8OmbW3s109C7m5zsD506l6VnJFSzZtPSyHXPpBMbsYLXSG9gpNu6m0HU+7umsPAszDA4dHIszx5AOSOLnSrhEPgFYfkvg7CKDlooj3BzLVvO3aYwLz207WDiIQX831wAalRxb/Myra44urIs+iA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=em6sO/eE6LyqszYkGsfMmhIKh4bBfx55luPbGKdGryo=;
 b=jyED2C7j7GCDkxj3TiyytbRtlx4bUEkmuQ3/Fue72R/FYHT8BDn2xauAYK3acSQiIzzsOiG/qACuFf4Jw4fxCxmZIRkhPUOD5xd8aSV8WbrYEnCaThSgsV+EJ/VxoneaePNxiUynVmhlJr1Z9LWBMxhFGCWCx61rF1fmwxX6MkzE29Ev32n8seLIJGvrY03BVtKcDUAbXAb71AzHfbh7Ha9jOcsarZ3GSCi6wGNWfyESat03jtr0M+/0f7Wdlpj5QMOp5GN2ReLrdmIxR2l2LPty0YG5yKlCwXnmdCRp5dJAWgwL5oPvyqKlfwU2Gv1z2NJUlKdjET84lrxccqBXlg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=em6sO/eE6LyqszYkGsfMmhIKh4bBfx55luPbGKdGryo=;
 b=dt0zOyrhsGxY3PJzv1GyAsKRdtX8Oovxca0szc7H2fCZuC2di6Bb9wQiy9HHg4EwfFYBFkb6M6Q3/qGJpWY6DcHWqJRhGw91uN3+OiE5DEstcNDkhEC+e3KD8bb3VDRO66ATh9KW8iSJDTXyiGGuD0IsOVzjPAAnsStmoEbO0kI=
Received: from AS4PR10CA0030.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::11)
 by GV2PR08MB8368.eurprd08.prod.outlook.com (2603:10a6:150:bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.30; Mon, 23 Mar
 2026 09:48:47 +0000
Received: from AMS1EPF00000091.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::b7) by AS4PR10CA0030.outlook.office365.com
 (2603:10a6:20b:5d8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 09:48:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000091.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Mon, 23 Mar 2026 09:48:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hEPnd01ghXLxWlnHjHZd5+RTVRl3jOlI7wG3Q4e8y7VhoWERjKy7gIWbnAXmtZJfNWvK1K5W+g/prYFKvxZAZVR7rC3ojD7y581hiZmjnkm39+7/XLbDFoMjfPExN6HnjqNEF7GysqLtLKdjQasvUSGZb9/z2VJoSlnTXZ17PmrENP+gg79IDuCKB5LTI7wu0dVr32c+4JGvtqilP3VNs26rT2FlGZNfMKJSksErDJRCQxswfetF+zgSNnQR8VaJdMHlFE99ia38HzpBHUYV+gdoO1UpbOjcPNCjUhAOq/vb0lzU0bUtVIE4ZzGTKByDd0w2EoOgAnsIQqXA/cqlEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=em6sO/eE6LyqszYkGsfMmhIKh4bBfx55luPbGKdGryo=;
 b=HJYNmVGujWIa1bhS9aeKRZHG6PW7bkYmDMd9CbkFaxSsIEyV84V71T84w09PXGvYRtkFcYmR3St2SCZg5jQyEVj14vzXGiA9ZSJXS5VyxsNBDM3m+UH8ldGOjDHcMmDxD74zyBkzGbs/9luFnEQRgpv/uu4MVuNkJdcdtsAIczvukYacsN+s3GU5FSylcnFnfCwcv7pf/kgmYrGhNKTZmAtJz4Q9V+UEGUUx8WbRdR6AGQouWn7CiE77H636egb4fcZXoRodVTQEZngXIlXf35E+5dRL+4XcNbKKkQqd3p/oWkpysJsvFx1Ip2gtIHzjieU1u75XO6A7yq1AKUV0JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=em6sO/eE6LyqszYkGsfMmhIKh4bBfx55luPbGKdGryo=;
 b=dt0zOyrhsGxY3PJzv1GyAsKRdtX8Oovxca0szc7H2fCZuC2di6Bb9wQiy9HHg4EwfFYBFkb6M6Q3/qGJpWY6DcHWqJRhGw91uN3+OiE5DEstcNDkhEC+e3KD8bb3VDRO66ATh9KW8iSJDTXyiGGuD0IsOVzjPAAnsStmoEbO0kI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by PAWPR08MB10308.eurprd08.prod.outlook.com (2603:10a6:102:369::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 09:47:41 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f%5]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 09:47:41 +0000
Message-ID: <5116b14f-a6a1-45a5-a6b3-94d633b2f58f@arm.com>
Date: Mon, 23 Mar 2026 09:47:39 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/20] coresight: syscfg: Use spinlock to protect
 active variables
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20260320-arm_coresight_path_power_management_improvement-v7-0-327ddd36b58b@arm.com>
 <20260320-arm_coresight_path_power_management_improvement-v7-8-327ddd36b58b@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260320-arm_coresight_path_power_management_improvement-v7-8-327ddd36b58b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0155.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36c::9) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU4PR08MB11769:EE_|PAWPR08MB10308:EE_|AMS1EPF00000091:EE_|GV2PR08MB8368:EE_
X-MS-Office365-Filtering-Correlation-Id: 483fb0c2-392d-48d0-3bb5-08de88c1615e
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016|921020|7053199007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: YszzM9KzMJVQBtniyFDrxTTlmjx7V+vWuXq6P32N2AEV+buG0D0T7vDshQQIAQYCivSWLlaXDzLGoex9pU5xCkN1d3PtRoTT9BO63qnoW3moozTcS0ZbRXXn5LMUES0UZ24bI6deDlmz/3Whx883Q0pZg4LJRvfVnfJ95xsSFFtA0TT03V5q0gz/eu5qrnJvbRSmyAZDWFqdcxqg3fEPvRaq8lkOuequ5zUrQJoqZRMYR5SkRtjC757xXztZKw3xlQlmAkUOvKOqfZXbxXyZ5MEBZ+MTfG1YXUqpypme0wuLOiyWBIhCES3ukoClm7UkurlK6u6N3UlG5FaKtaKsNIrc5hR/VI1kcE7pITJ5g6WbhhLh2L/Nhyps8aTm1Ps3leJOVG6Cu/YbCZt5kXS6zKdH0K7JKzBSskStEII+lQoIoxO1kP4EDFymY2BNW4FkZXD3DtpLK2416sTmN/HcaOXHZuGR57+vgARldmrX3s+mpO0mG2IEcLMqKXoid0zl+8KZrhCfCco3X7sKu8IFpo4ygeWjs1G/o2BNsiY3r9XMm3v4tU0FRqcSW3AxRrzZQFHKmbiKDhRora+38h7QI9/MiHG4FSZFOt7s0awy3J1wI6oRzaLfePXERCB0IRvA+45BZfZqFbyHB1lJPH7UawMBOgvFF6SlCnHoCzac/rbkr12Gvs3tVCUMRAzIpEtLK0SGUA0vHZW36cVvRyZAtDGoz+ab5YPaK5i1K3SmCYD1cCHruCVBPHg/274cme1e+e5854gufqof3V4JFD5xyA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11769.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(921020)(7053199007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: I7dZ8SOO19ol3RYSEOnb8kvop+RT/WQTUAygnDGo+CtWGDIXfROksk7khdKucxH0SW8tPna/MvbsOK84cojL995QG0Po0O14Wg4c2ME8lClcX8en3aE9poJWqhGinXNxeZoGZfL68D4FklqPZ6JNu/8HjplwDz6IFOjeh2OSvPPDH9bc9sCOArJrUWerQIlhxFv7yL3b17YklCw9pZzcKivQF6WHqKnf6kYyZDeYAliInF5czmCUSjNT4rW1NOFXliAPmIYsD/0pDqDXsNhwF0zxzIv94FqAjY2JfshcortEhmeIiZhG2/u3rgGF1wQ2WoTZvnnJTgATMznsjBYCKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10308
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0f438eac-ac18-49f0-2525-08de88c139ee
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|1800799024|82310400026|376014|14060799003|36860700016|921020|7053199007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: IeHKL0UUcVlB8+iUEM93kCsQglkyVZAuR0Sjs3mPwzM38QqjvpImLDKxSI72Knc9gkMlz0YMnv6Hwd6TmaWPaRH+K+EHjgNiqm7BxqD/sU9uWJgtsSVOKqATVmt7e0LfNhIZreDPg0xodXLHr86krCxcYCDAmUc0rgEPeWAkHh7x3nEx4lkfZb9X+JQP+ruYSUkydFuwOiwF6zRMEOLmDG8vnqLbsuEo+gvrexR67bXKjfBhjim8eatOiv35u5x25Nls8xyqDH5ohdZ0GGyEocgpQmfRljR+7IXp76AWjPDyQiswHbk7PqL9+/UvhGneFLCa7YZDV4VsrwjGDzKmKldTXEy16Cs7yAkFyZ4hp0dNq9tcbXAup7gLCS7+KotnpJaAxK4fQHwpLRUX0JWcEv/kHD9KYXzWHJVfmprG7MM3UeUX9Lzg57rQKv+ooGIf3NpGQO4MfEl+KetdQkTBtNgEE65TH7Ti68xryNeAQFWRYY8usNsE9T4gVGV3IBgj1aQGBMs5SaBEdTr7Mh0ZPSWcr3U8c0b4fgJU8AXx0oK11L6Wkjce5PQNyvTgthI5/lQd1O72dPiUFMq0qpb7Of/R/aXW/wxPF05247AG502ba39QIeiHdTSAhIlIt/yR3dZ4YGLCl/SarlIJj3RjLkXP0/WG8FVLyvIRpYUHin9IeaFuMoE6ye+INcTbyp/UtRxE1+Og7ojUA8GTPGCo+t9zxUhgBWkZt1gDt/vj4j4XpCG6c7sNP8+3AfNorsLc8XUjo8FRGLJItnb4u4zh55PD39KpLwHMFdGn6DISWkBkn9bcsqJYlPw8dmeoB+ZZ
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(82310400026)(376014)(14060799003)(36860700016)(921020)(7053199007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3g0f8NrNL7LEFXiwgkULB+hhsmK9sPSEPNIQz/T2afVEqOhdr5eYKTlMa1Rdp5wP/LRe+Xx/JE7ktKsTe3JvHuL8o8ygLvmUjKqG6Zoslc3FasIBIJa3j4Pe6VhFpVEowHbnRkIB0kZsGq531IqaFZ1vxEZOVlGPRqXkIdf1pM3zxYopkC06TRXcb0PTCbSr6V+6i1ez6qL5e3O0TYM6KtSnj5KHqSbm4arDKuJEGSfFqqdhM/AXYj8vYUHKw5dsJIxCVohis7fKElw4N/urSLbwZRqm3KqbmZFKFY+WXlhKBlmlMNT7Ze9ixS12mG78VV2O0g8mXkA+hFLrpAHjKgWfw21wKF2S7tIOU1mTmCmohjPXPvXPyz1MiWPfixwTdVkDFswGh8huUbazB69hPsN/5eKT2aVSiwso5R3lWqajcgFv6gt2YjbS2qv/OGU4
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 09:48:47.5699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 483fb0c2-392d-48d0-3bb5-08de88c1615e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8368
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_024900_360179_D6AF394E 
X-CRM114-Status: GOOD (  19.45  )
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

On 20/03/2026 17:42, Leo Yan wrote:
> To support dynamically enabling and disabling the CoreSight path during
> CPU idle, cscfg_config_sysfs_get_active_cfg() may be called by the ETM
> driver in an atomic context. However, the function currently acquires a
> mutex, which is a sleepable lock, and this is not allowed in atomic
> context.
> 
> To make cscfg_config_sysfs_get_active_cfg() called in the idle flow,
> replace the mutex with a raw spinlock to protect the active
> variables.
> 
> Reviewed-by: James Clark <james.clark@linaro.org>
> Tested-by: James Clark <james.clark@linaro.org>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-syscfg.c | 21 ++++++++++++---------
>   drivers/hwtracing/coresight/coresight-syscfg.h |  2 ++
>   2 files changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> index d7f5037953d6ba7fb7f83a8012a1abc5ffd0a147..3b77e4da6b6b3cfc0aa687c0280c8ee5118e286b 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -957,15 +957,18 @@ int cscfg_config_sysfs_activate(struct cscfg_config_desc *config_desc, bool acti
>   
>   	cfg_hash = (unsigned long)config_desc->event_ea->var;
>   
> +	raw_spin_lock(&cscfg_mgr->spinlock);
> +
>   	if (activate) {
>   		/* cannot be a current active value to activate this */
>   		if (cscfg_mgr->sysfs_active_config) {
>   			err = -EBUSY;
> -			goto exit_unlock;
> +		} else {
> +			err = _cscfg_activate_config(cfg_hash);
> +			if (!err)
> +				cscfg_mgr->sysfs_active_config = cfg_hash;
>   		}
> -		err = _cscfg_activate_config(cfg_hash);
> -		if (!err)
> -			cscfg_mgr->sysfs_active_config = cfg_hash;
> +
>   	} else {
>   		/* disable if matching current value */
>   		if (cscfg_mgr->sysfs_active_config == cfg_hash) {
> @@ -975,7 +978,8 @@ int cscfg_config_sysfs_activate(struct cscfg_config_desc *config_desc, bool acti
>   			err = -EINVAL;
>   	}
>   
> -exit_unlock:
> +	raw_spin_unlock(&cscfg_mgr->spinlock);
> +
>   	mutex_unlock(&cscfg_mutex);
>   	return err;
>   }
> @@ -983,9 +987,8 @@ int cscfg_config_sysfs_activate(struct cscfg_config_desc *config_desc, bool acti
>   /* set the sysfs preset value */
>   void cscfg_config_sysfs_set_preset(int preset)
>   {
> -	mutex_lock(&cscfg_mutex);
> +	guard(raw_spinlock)(&cscfg_mgr->spinlock);
>   	cscfg_mgr->sysfs_active_preset = preset;
> -	mutex_unlock(&cscfg_mutex);
>   }
>   
>   /*
> @@ -994,10 +997,9 @@ void cscfg_config_sysfs_set_preset(int preset)
>    */
>   void cscfg_config_sysfs_get_active_cfg(unsigned long *cfg_hash, int *preset)
>   {
> -	mutex_lock(&cscfg_mutex);
> +	guard(raw_spinlock)(&cscfg_mgr->spinlock);
>   	*preset = cscfg_mgr->sysfs_active_preset;
>   	*cfg_hash = cscfg_mgr->sysfs_active_config;
> -	mutex_unlock(&cscfg_mutex);
>   }
>   EXPORT_SYMBOL_GPL(cscfg_config_sysfs_get_active_cfg);
>   
> @@ -1201,6 +1203,7 @@ static int cscfg_create_device(void)
>   	INIT_LIST_HEAD(&cscfg_mgr->load_order_list);
>   	atomic_set(&cscfg_mgr->sys_active_cnt, 0);
>   	cscfg_mgr->load_state = CSCFG_NONE;
> +	raw_spin_lock_init(&cscfg_mgr->spinlock);
>   
>   	/* setup the device */
>   	dev = cscfg_device();
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.h b/drivers/hwtracing/coresight/coresight-syscfg.h
> index 66e2db890d8203853a0c3c907b48aa66dd8014e6..f52aba4608dadc1c7666e0e28c9b43dc1c33d1eb 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.h
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.h
> @@ -42,6 +42,7 @@ enum cscfg_load_ops {
>    * @sysfs_active_config:Active config hash used if CoreSight controlled from sysfs.
>    * @sysfs_active_preset:Active preset index used if CoreSight controlled from sysfs.
>    * @load_state:		A multi-stage load/unload operation is in progress.
> + * @spinlock:		Exclusive access sysfs_active_* variables.

minor nit: s/spinlock/sysfs_store_lock to make it explicit in the code 
and we don't have to look up what this protects ?

Suzuki


>    */
>   struct cscfg_manager {
>   	struct device dev;
> @@ -54,6 +55,7 @@ struct cscfg_manager {
>   	u32 sysfs_active_config;
>   	int sysfs_active_preset;
>   	enum cscfg_load_ops load_state;
> +	raw_spinlock_t spinlock;
>   };
>   
>   /* get reference to dev in cscfg_manager */
> 


