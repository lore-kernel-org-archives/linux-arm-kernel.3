Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CE3CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 06:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFsUPJB6SaaXKKKx0UYaUjZbPCut9YkVSHYZInHzZW8=; b=M1+Dnon4c2ZFE1xxjIT1Des80Y
	n3pCh85gH9AB6gJZs6fam8S28uXOtFrr+yxK4guoH5dPzvUtT0C4IpP2J0oyCdFdVvfzrs4t+u1nB
	mRvd1CO0OYgTgl6kT3AprnPHfq+WZDhVG7Omxy2PiJU6UI5d1BSQqZOk+m96VMiyLCp1PpIn6SOI+
	n2CgAu2YQSJaU6fQP+OGCvPOXD+k5X7dxp6VoY6x6nNGpiXcPX/J5KkiDfKJ7g1AMx3u1SDodcssC
	+mzQx+Pk/eBQ3eusNo6vv5VEtWmQi75HitizK4cUKLHg1fVhwPkhDqP4lNZD1+aptqVxvOcrcMkw7
	784NpIfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4NI-00000005eXc-44zg;
	Fri, 09 Oct 2026 06:46:36 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4NE-00000005eVs-3ahR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 06:46:35 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vktFTw4qWW8oE+sG9x5qR8D9ef8mSFpgfTQbBAYXxomYQ1nY22cPztVIq+Crzw9ve6GO5WMKQkW3cxKjneiG1AC0JDh8aXNalXqMF7QWqncS1ZxHf9KQ/ZgHD/eYQwvaSST4yF0sgrStEnLGs7OUQIUuFo8js7zW7WHbgx4P17S/gD861xZGylN5B17u4K1Lnv8Kdvx8JiQULTIFVNTx8nMVVuol12zS026OOEsWsM1EVUlJcX4Lw1HbII7iPbZKdl36DKOa+Ii6AJmhjoDtjemA226Ld2mJmdNNXmChM6y2RmhTNjHeqIz1ZSRN4avnXMhBB3d+LKXXaXXX31MCwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFsUPJB6SaaXKKKx0UYaUjZbPCut9YkVSHYZInHzZW8=;
 b=KMXsFW6y2uPfv95QpTUhUj1/4ykCTRiwMi5BPbJRRTca6N8f4nqnJ45ViLKDZhjWRXECdW8NDDszWdkiooffEm43puMARio0OzJth9hNL58iGboXN+dLeirazPgPKMibDXJoduVOjaIupdAg70ZlSEeBZTFnepEABR90BxZ5G4Afhcy62We/l2nmnOKEGkVkd1Z3HcKxgeRVZ7nAZLQNXONvKaxSo67n6uNe1MhNxZcotaXOOowiJQFCE6oGJYMa8O1LSULYhz+xh6LWNO4KaQ24nMUHtoW0cGZ1Nm1C4LxawxiL68UXgaBsgK2VST6bdQHUy/11ddmVyG6PUAyTtg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFsUPJB6SaaXKKKx0UYaUjZbPCut9YkVSHYZInHzZW8=;
 b=rjNFxm6avSxOXgKoEfadcRktdnAczJa8X3cNaSV+XIKODP8vHhIaBnGtBYv3YZ2sbqpKBJfoJ57uFrbn/A0u33iW0eFa6QpwfU/UVdQxdxQRsgadc6HRLLtTuyc69kPy8kTJjke3bXwJJoJaQo0YZAXf7Aa3zvUbFjdHN4pTVuw=
Received: from ZR2P278CA0061.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:52::19)
 by AM9PR08MB5924.eurprd08.prod.outlook.com (2603:10a6:20b:282::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Fri, 9 Oct 2026
 06:46:23 +0000
Received: from MI3PEPF00008493.eurprd03.prod.outlook.com
 (2603:10a6:910:52:cafe::98) by ZR2P278CA0061.outlook.office365.com
 (2603:10a6:910:52::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 06:46:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF00008493.mail.protection.outlook.com (10.167.240.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Fri, 9 Oct 2026 06:46:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mnpUyiAxA0CzCHPjksihZAsMXB5xpMF0HBfwP6FwkSoBoI+GkO6ScyB0T/ytZBgkMt45swx4Xw56bqkfTcs05sMFTq/bptgS20soZyeKWCt5vJA8L5JXmc5hUKoXNPf9ykTsOEmIHMhGg5d8aVRAqK42MZkGlmi5bDJePtCXJ5nIgMXmvq4mQeqYZWoJu5AUIcyP/3loyH8lgQZmEG/FPI+k1M+Tvd94E0k1Gup1DWIIL6glhYYCbumjDotHz7XG2zfraa4iw7vsVNqKCZw21MLPb/jXfAscF25VXKSjjId8BUiLi+Pt/MeUgrPGOY9RjvjhskFl2sEfdntCWqAU0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFsUPJB6SaaXKKKx0UYaUjZbPCut9YkVSHYZInHzZW8=;
 b=OecB9/J03L210liakdxrV2DWHaRskKnlllNcXDDS/0YOFmPTZp0nUpELdBMx47hWXl6cDCoYLmVFNZaHCF9KIMh3eQK6D7UpY07vsYo1g6RVTlHkepPReqBIkQKlMstTwE8sKSXP2RLuYOVHFbJk/js1jDq9U8tND6QxhUFELrHU4m59Tj4/roQVTgfyRu9KbVSQ8+pGRN4xXHWDlGRCVkAPMyvQa+FRZ9EuUuG482OY4ZYHB0xtn5kWOsrXVN2TFB3x1Vc6X5cmtT0PQGMFUPwdwUTPwyFomGSjIowaEGRGigeefV9BK5aR3PCFEGXhCAipvILYhojNMKeMavQPrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFsUPJB6SaaXKKKx0UYaUjZbPCut9YkVSHYZInHzZW8=;
 b=rjNFxm6avSxOXgKoEfadcRktdnAczJa8X3cNaSV+XIKODP8vHhIaBnGtBYv3YZ2sbqpKBJfoJ57uFrbn/A0u33iW0eFa6QpwfU/UVdQxdxQRsgadc6HRLLtTuyc69kPy8kTJjke3bXwJJoJaQo0YZAXf7Aa3zvUbFjdHN4pTVuw=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB10391.eurprd08.prod.outlook.com (2603:10a6:800:20c::6)
 by AMBPR08MB711877.eurprd08.prod.outlook.com (2603:10a6:20b:78a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Fri, 9 Oct
 2026 06:45:50 +0000
Received: from VI0PR08MB10391.eurprd08.prod.outlook.com
 ([fe80::fa6b:9ba8:5c2f:ac91]) by VI0PR08MB10391.eurprd08.prod.outlook.com
 ([fe80::fa6b:9ba8:5c2f:ac91%4]) with mapi id 15.21.0522.002; Fri, 9 Oct 2026
 06:45:50 +0000
Message-ID: <dc46b576-fa33-4475-b69b-70bd8cb53f1c@arm.com>
Date: Fri, 9 Oct 2026 08:45:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] MAINTAINERS: cpufreq: Replace CPPC reviewer
To: Christian Loehle <christian.loehle@arm.com>, rafael@kernel.org
Cc: zhenglifeng1@huawei.com, zhongqiu.han@oss.qualcomm.com,
 viresh.kumar@linaro.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Huang Rui <ray.huang@amd.com>,
 Perry Yuan <perry.yuan@amd.com>,
 Vanshidhar Konda <vanshikonda@os.amperecomputing.com>,
 Shubhang Kaushik <sh@gentwo.org>, Beata Michalska <beata.michalska@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Ionela Voinescu <ionela.voinescu@arm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>,
 Jeremy Linton <jeremy.linton@arm.com>, jonathanh@nvidia.com,
 zhanjie9@hisilicon.com
References: <20261008212832.354382-1-christian.loehle@arm.com>
 <20261008212832.354382-2-christian.loehle@arm.com>
Content-Language: en-US
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <20261008212832.354382-2-christian.loehle@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0191.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:376::18) To VI0PR08MB10391.eurprd08.prod.outlook.com
 (2603:10a6:800:20c::6)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB10391:EE_|AMBPR08MB711877:EE_|MI3PEPF00008493:EE_|AM9PR08MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2de2a6-0375-4b39-9e4c-08df25d108c3
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|23010399003|7416014|366016|1800799024|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 0ENzvph9VrD5tQtmpC9RG/ntCPf9c3JtyDs538Ya6I4cD94MXW5R5MN9Q8a10MjWv7ue+Mms2f/spNOw6JruLSQ7QDZ00VnEnWErtgWdgZSv4dCxYzlXayBHDAVUVB2qM7UVFGvOpgan0WcPsl8vrjQsEoTfMfN4GfCn0tJwtN9DHLE7iLdCmpm9o/N7i1I9EttVnLGi/IprLLHODHr4NEtbAgIA5/JQvCCFkOqb4Jq1zVMrHP68XJNirFYscX4qDMJLpK+zuPb7y2CbuTltP2/mPKNkYlz9nDxN3wzKAX3kH9+k6pwjw2cMiHRwOfbaQUvnWS2apw9jcS3SIUb5Z5eoDo909xqR+rXLmUxpDo2rZC6qryChyqPDzgpskgxrPXnHg9wM35QsrpRppCdSVbQtY6d3HJCrd/e/9hnYSpAi14tZIqKGp3M5J7/EPheoGdPQHJFsszvh4z1JddZpp+ZscW9YogoxtBKBNHUZV/Hoi9RQLaeOi2L5/2NgqNh6kpeTXOltgHssgcBICbOlAWNDYdD4gh6IB8NlAkIxrIHxme3ZFO7h52dhM1c0QYp3EaY6c3mOc9L5cMZaB0yIWFK+5QedHhNSe0gXi+/v8YOxwAVBZ9iBGyJahT82WDFVdeVEZcT/4Xj5LTEuvXcLsUsx9c4QMkfAMtbgKGzlBdM=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR08MB10391.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(366016)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: H15d+k+CBKL/98Egww+98l5DaKi1orv1/1fzEuzyXPeL05XC3XLajloVOVbEDp8EMCsmieydpGBa1DER77d0zHcCdlX1h6Gw+bB7WXGoJKL712IpleNYhqslBgZQ86iDELhmYj/iZNMXMNOMRld53E7LnP0jHL/IspJoQQr4GdJAjffw2WZmyvZCDZdHzVNxSirELtTWw00Vekh/WQ2wdI+b5F/IujuAtyVgjO5sOy7w+jMOedpOk/rFSfmj/13SjHD5E1AtSX15cIF5hSDBagSHrrETUHn/MySrSFcxeFqia3TgP0qlGdEPrMAVXf1jNr+ikxlag0webOUjrq7vDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR08MB711877
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: MI3PEPF00008493.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 07e9e75b-6d7d-4a1b-904c-08df25d0f4b0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|14060799003|36860700016|23010399003|35042699022|376014|82310400026|7416014|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: L2bJfl8YsUurPPetvjyonS/yZgM52aj273vmRqiH7z9cEpy3UOlBVoRwt2xyYLinxvfyrRvAuPm12/kmezT3LcrKlS1vDjSCOr+JUQLBRDZKy6z4waVTp/YkCvEoOSutlVGXdpUkxA8HgGiyAQCrkldDoSlkpVSCRnK8pcS3JfFtK/C/lO+wNKAicI2iLuS5YIpWd/juFNZYyDaEWVcZwO0xlAWFpdpgPnOugLAhbJaMmhtsSqz0ZmjOg6mtlN6XyleKR3eo5AOUhR9WHmWXY2JAi0aAulodwXh6JbQe8IvVjgYyHHSb5Q8rR+Lo4sFUGtpv5FnyBZj+4ceYo6ZJ0Za1qD+5TyR9RxOkU1RtBlf/6onNeH7phL5HUubWd/zEq8AEQNRswbCD1TfuMsRhDEiwb0sTseA4HQ9D65jPiQI/PbobwK45E9G5j77jT+/IJkbCYLlbd50buJHzU0nAktJYAwg2qcbr0hyo7GJtGAMa26PpHb9hIIn+vkMNoqPOYZYgr5zLXNMikfB7fFQ1d1/JVew6wMPHO3KY8+AdmHwMbxXfWD0nrR6wIwsZ+uV4XWVY9nyijczT8/xzztUkpdslOTqjoUmkexmZaOXphoNNthGDheYPOQS7I4kh29g3G4CsNKHchsKWd4E3hvtnGoo5nw5U89umZahdFVdsE1zDBpjiRDywx47xbPtIORP/K8atbtMMWp6U3ftZCurvnA==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700016)(23010399003)(35042699022)(376014)(82310400026)(7416014)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: U18ln+gkOXmKbnNZ0yc0Mz0c8aZxnOXD82AYVI2YGsC0CLDdcvSjieqDPIT0xFDVjOYAc07WZuGYy6ELElmmuPkcJF9fOBk3OD1vpV4mCyycYMQ9GrqBwZXmeJ/pKyzVvqIIURGaoxwQuUtt3YzxOw1i78TZQUo5aw3mrPLaE6mpZmVELgzH3ZuJUPSPevL2MIvmmHRwRYDOCfvNm8cPC9p156ThNG9uiG6YabtKDSSAVhBSrCYbXnd8BucQcedQB/YsrAA3y/TbdkQ9CYWuVcArRu/gttQWjTRhjly9IH/muy8GfAkgLsFojzx4cFBbJ4hFmXRg9A+yPZY5E1bnv7TeDIL9YoCcj1wID3Kpb/E2Z8QRB0gl9xaEsU3j3TUYum2EGUv9Ve5HH5vq7VHETS0rafZNsD/Og0Yn5gzm0BwO85SsMmjyR78yf8mJpjHq
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 06:46:23.3748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2de2a6-0375-4b39-9e4c-08df25d108c3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008493.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5924
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_234633_505385_5055C83A 
X-CRM114-Status: GOOD (  12.01  )
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

Hi Christian,

Thanks a lot for this,

Reviewed-by: Pierre Gondois <pierre.gondois@arm.com>

On 10/8/26 23:28, Christian Loehle wrote:
> Take over CPPC cpufreq review duties from Pierre Gondois. Thanks to
> Pierre for his reviews and contributions to the driver.
>
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 65e8a4b5c90b..3064942ef05c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6765,7 +6765,7 @@ M:	"Rafael J. Wysocki" <rafael@kernel.org>
>   M:	Viresh Kumar <viresh.kumar@linaro.org>
>   R:	Jie Zhan <zhanjie9@hisilicon.com>
>   R:	Lifeng Zheng <zhenglifeng1@huawei.com>
> -R:	Pierre Gondois <pierre.gondois@arm.com>
> +R:	Christian Loehle <christian.loehle@arm.com>
>   R:	Sumit Gupta <sumitg@nvidia.com>
>   L:	linux-pm@vger.kernel.org
>   S:	Maintained

