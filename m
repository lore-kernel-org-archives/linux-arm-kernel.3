Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73762EC01A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+jDCzfFVcSCOczVJN5BXTEodNMBWvBVBJY65NsYD0A=; b=IJaad7N8XeqIM5FVS2F+l5PEx4
	goYFIWhTrSlMvxIsXLGaTjIB6i/VP+bUl3sZM09Gh0SCU7vRVgt3B3jZ0dwMqHiw3efSkS0FojmPx
	EFq5yiA81NK9r8YQp/59I+J7B+YI/xB4lsNr5ZmBxuGQa+ELXggKSwd+IzTl9piSf3VvAig8btKl8
	tIeCC1cvq4JIpYrN1AouOuSJKGmxFpAj97XQx8PK/XiHOCAcS3dujsrgIkqGN72ZE1mHMYuDYWV1P
	/J8RlaW69/yvzHqi3S2a/XRbPsVdeIaF3JKvx5fDSVPRMqXkNMTVjz+8FyU3Is8/cu2LNN4d9FdVK
	2QNXM0Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4biB-0000000GOEA-2m19;
	Mon, 23 Mar 2026 09:36:39 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bi7-0000000GODH-3Yxq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:36:37 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AFBhLAAbYv6to9n4meMr/OTCX3qgQ4cqvnFBBD+1a2p+hmJXemldtkobJVimC9/YB0Jgv0gqhPXb79T085n6Qn7f2ELVESWSHXUMi+OKJmt6c+dZMeAz0PvM4GGIicLJ2a/qTAMuwIbdRmFwgk7BQD6a0eUKvRbixE02aFTvPn4FdWc9mT6GUjYRengSg0BuZXz2JrXnVhZiy8SZHPD52CcOfvPAaRnJHpdb84a9x4aGcrN2nhu0h+R2Mr6r7QsQvBkGRPE6ucC5P8RCiwln5WE7aMrZQ+dU2pvenLf3qMRP84BI2lwW5PlrR/3nv0Nm9WoAXfDAeaRnnDL5PvuTcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+jDCzfFVcSCOczVJN5BXTEodNMBWvBVBJY65NsYD0A=;
 b=TKCrjxh8XMXB2Le2jzdesy7CgOThS2i8PhegunxFzCV0ItfO3px4XV6q0qC4N3dwkl/8OlT2bB8jl+1hekIJy0TDHYHCIs7OzSWPT1uP9QmR/W+auq4esKUOA1ltYFu5sfVHTbVE1FUFeJE+bFS16lGIwkesM/8eaYcAW5TsktI7N+wTKniNhiNAKrbsznxPxPiJQPVggsEkGRsCS9lybOJ5dOkEWGaZ27JHVkXJto2fG7noj0OpwUSPSOMZ+UeFC3Tcdd+97wqLz5hhbuQ1PwjdZAPNY+4CDS4Q+kWGvfd/3sJX8jti3+fRxlSQ4o1EDS4EX6+jWZX0mWtLijfo2A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+jDCzfFVcSCOczVJN5BXTEodNMBWvBVBJY65NsYD0A=;
 b=AxF+YIzK3fn/VuST5XwpLFBLLBCxUtA/MAcfLWqYu9gOKpyiPZLGdVpNI3pa8oYfj7bhBfw+EkN+kPyzCCFH4VIPWJ7w29qNuUI9m52qENB3/136zk3xqLyCsGIvz/IjneJtrqWC69quo5Gr8+oohdJbIDikEsZKxmUBCMtRSFY=
Received: from CWLP123CA0017.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:56::29)
 by PAXPR08MB6351.eurprd08.prod.outlook.com (2603:10a6:102:df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.29; Mon, 23 Mar
 2026 09:36:26 +0000
Received: from AMS1EPF0000008F.eurprd05.prod.outlook.com
 (2603:10a6:401:56:cafe::d7) by CWLP123CA0017.outlook.office365.com
 (2603:10a6:401:56::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 09:36:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000008F.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Mon, 23 Mar 2026 09:36:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmIgUGzXhUD+WZ/Giafuqv+dUghcdTWvTMIxk3b+G2NXbTJs8k0ZzJ0WS6InXfu6FYKnxi6eCbnqzVsk6xwfrL/gsjQ0qwTbmahlH4G1rIAJ1bxmEVEv4Y77bpirb/xaQcNqR7NsHoWU/uOEk//TnVwJE+kjhpO5+U6NHilA5Chfl6X0tXmAH4T+lh9/1/Q9Fky9N990XvqiL6rKY8YVc/YWbCjVcvst1SdHobHXvepNO/SXe1zlySA23xGmUerXaWOLSl70W42DNFnhkTAv6GJCgW6f9rySNalhCDZ4CETbYSayVuBRojNY20KelxnXQkTdbB4BfXh1y6+VCx1GhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+jDCzfFVcSCOczVJN5BXTEodNMBWvBVBJY65NsYD0A=;
 b=peHD6YN5Tawl0zrfD55FNtaAdQFwCfZoy3+rxJOAyGZcXVwC/UvF/YaRThrnaVeuhhIGxk2X1Bbek79WGDnoMshOdpqEw2vCCYRdj7bAYBLpr34QioQl+nsR9I/qFMBkEKiKQY9FsSEAnxeqkovd78oa9W5QQR41I+Arvyz2oseDkafEUcyyevO4pz9rhFkbIhSzGm2Vnm3DBh4O6TLdY7KOF9vAaHDRpDKUlWZ9opINRkIOp+zmnhxFQFAOjRaVbnCDWsz4JkW5Qc+QxbuqYcMNFWBv9EG2E6nmsJtcPqlE5kLZrgCnDvEALCMgsVCRtLrtUdWSdO6sS7Yk6oSMzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+jDCzfFVcSCOczVJN5BXTEodNMBWvBVBJY65NsYD0A=;
 b=AxF+YIzK3fn/VuST5XwpLFBLLBCxUtA/MAcfLWqYu9gOKpyiPZLGdVpNI3pa8oYfj7bhBfw+EkN+kPyzCCFH4VIPWJ7w29qNuUI9m52qENB3/136zk3xqLyCsGIvz/IjneJtrqWC69quo5Gr8+oohdJbIDikEsZKxmUBCMtRSFY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by GVXPR08MB10863.eurprd08.prod.outlook.com (2603:10a6:150:154::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 09:35:20 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f%5]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 09:35:20 +0000
Message-ID: <20d7d795-235e-4074-b3e1-429e2a024a68@arm.com>
Date: Mon, 23 Mar 2026 09:35:18 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/20] coresight: Populate CPU ID into coresight_device
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20260320-arm_coresight_path_power_management_improvement-v7-0-327ddd36b58b@arm.com>
 <20260320-arm_coresight_path_power_management_improvement-v7-1-327ddd36b58b@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260320-arm_coresight_path_power_management_improvement-v7-1-327ddd36b58b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PAZP264CA0082.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fa::14) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU4PR08MB11769:EE_|GVXPR08MB10863:EE_|AMS1EPF0000008F:EE_|PAXPR08MB6351:EE_
X-MS-Office365-Filtering-Correlation-Id: f81ebd04-7263-48ba-150b-08de88bfa7b6
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 8cfWjEWApvYsFumruy7oVuPwmvgTf/MkV7tsxPz3oXg80E8orKGe9ds0i5Xgx+gQ7jwAx9kccj2WYPQ2dgIZN5IPFCgFU/dwOCaOzbfN+EecLopFtz/Xd2pbmT7BSVn6d0zznPK4iD/E9fvtEnLqxZBz3XolEUQcGsnOMkvKxVElJkPBUmvEhLO/GJ5vfy3+LShyxJuU/faSAL5ano62DFsn4AxxGUM8ClW+/vdSlb+MOOd+r9SD8dfSIy2r8eJEKW+ckoqZZZtLd3aPSlGDy4II0+e+yHMcWe4T2vDsk4YHb35JqZvXwqQmm3l3vcfhzXq+4YBSzJ/VaAWpAycoQdtWbbpeIBdhvj0etF06o9XJL0W1IZyW6krW4Uu6+p3k0JZ+ZuwhRtsqkGrGOGz96FhtixvgS0rLcp5kcKWyCtZrD0/NH4vALDXiX6SCKmoLvCBFVhMxkn/Q68dv3yVxkbTfDQY9lM3DyVMmb5ftQQuhcZTOIiigzcsV5jOmnDAqCad77YtzjB0OyNph3ilR040MOacFOi2+9iJGrHcOl50zzO4qX5JWD+rxMPFJeLLTAiXpSYUZSp9tu+dw3TbCAre02l2bcGeLIDIxK4q74gFNvvjw+MAASCAftyUQgjIqhJdj+topmXdkf2lxWJ52hJXgScYKjf+vTaIG9C9DQUHSFVlno2sXogyGqWTnSQhsXzzVjFoh/r1U/CloJiE4YqzI2zYtvFKaXN7CHsePMs87A92skKDUYUvDdxh/lnzu7uLiRhrNh4HoWry2mc2+MA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11769.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: n32Wvb0ottZVoceqL5Os2T7R6uuzZk7u6tYtNJzO10aeR0QRX13AARuMwvzVVgxd2ZJO1XOOUazWfkT9MKK+Yl81dgTz4uw/Es/L363OtrATWwQpwH3k2O42H+7ZbEHO0+8b/bD7cwcq896BQmze2hd6xVQmQCKcndVx7ZGcW+C0LEzTKjQv9NS4CuF3400h3YjEzcBRvCs++4PKqjl23MTAcTOg7DIQydzCBnNJmrUwwwi4yOvXE/yvuBBKL0kMC8aBaUZU1xEWI183zdrcy978pqcnUaZ+QlM7YF7e31BdNU9SUkS4E8afDkrNlNL9qg7uVsrZa97DxJ6UqqplbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10863
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000008F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 499b637a-39a1-4dd5-031a-08de88bf7ff3
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|30052699003|35042699022|82310400026|36860700016|376014|1800799024|56012099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: 3TBqUMFoBoW8pbvrYLazzadjACHDxLcyQO6Q6vYCjL+ThnCczVghCdYWIzIJZcm2m9Wrwwg4C5DGA5o6g2hPuiDY3DXYjBTNIJOvtyLo9Jr/bZK/V0ZhANJ9Ua21e+gAoEuqzpuG6TDsoQ0R2+lCpVgMCTBgrv09INw50n0YnXTZirvEwFquvOKy/4EJYG50xi66gwuutg7DuA5Q/sscXDLxANMOXt/XiHFIWkTinbcAnMyf1z8FRqSNKRv//7kbjIINeqk1xIyD0weV5ep97tHSUU2eNpNjNQN5uBAq82c4Ec4EkvLEL1T3uVNo3tPFEwM9onVSs61/EWHQCQ5kGmcZ+3Dj4oYDOrLvNB2+FC0oGKDq1duw9HiR3vqCR28MM05DWhkaEIvTNpYFmDbfVe4EN3/jpGXXNObebmO+NuhVjmrvEaCT+cewpOer4TXya77uUkg8HQxqkpadGcZjvle+kL+05F+slRhD642z2vNNhdQGhmJDHPrFfALp/UZM4jRzQyDVGmOIJLnl/l07o8ipVtsNvNm2mytbwfiObwrnIvNpchR94BtzY7bXTv8V1WnV7YZlEHitSKoiJ7H0Y0CiJ3pnyOk7nGUi6c0L0TINIuMWqSLZU/kdPub7teQvA9LiybQwwiolN0wMt3ib5Mq4cRbQCNa44I97Roy3di+RMnaThVSp8FB767HXP+A+JW/QM1w1VG7RjDQdqoyHWlV7YLNMq5vz62FAJPcvdbhhC6PiDxPog5sQx9mVikFFf+bI8p4JX2t9Ei26HOFDMVJgm63vigA4QeFpyZgTXqCnwtHct3UXes7WqdK1oGnO
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(30052699003)(35042699022)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3jlgHHYeoNVJtPr7gU18iSFTzKf3fDNha9zwgZ06R8evSKWOwwhq9cgN8MjNaSaw/ZRMXXyrrXJWm8oMChzZo6xd6dK91YjMpA1RtUCPs6XzdminMtOB1kKHU5ftHSGlx+0V+hBH1ecdxYHy+9oOJ8tQhZu1niiGJ1YQmXeuFcgVtLPl17gTAxPs35OYGhvl074ONOST6foB2HpPqLQmyFu/548LKiVWFJW7d1P0TGQP+Fs7zA/AwhuvRlCgbQuFOVBG9U/fK2R3IX6eWgaO7pyYMfIIbg5yqaiC/jeWj+3HXgsr367HrALowhxCcIKVonWlo5AF2G5Zh6QSf3cm8CX+nUJOtsXcPkIpF16EtJjKVZi61RAW0a39Bj26jQ2lrx+y0ueZcj/Skt05o5+8Xe9onJ2AEGxM5FZh8cHtrAqa1Q3aSz6ebdlYn2E0BJRW
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 09:36:26.6126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f81ebd04-7263-48ba-150b-08de88bfa7b6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000008F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6351
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_023635_986837_14C23DCE 
X-CRM114-Status: GOOD (  17.49  )
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
> Add a new flag CORESIGHT_DESC_CPU_BOUND to indicate components that
> are CPU bound.  Populate CPU ID into the coresight_device structure;
> otherwise, set CPU ID to -1 for non CPU bound devices.
> 
> Use the {0} initializer to clear coresight_desc structures to avoid
> uninitialized values.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

...

t-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 1511f8eb95afb5b4610b8fbdacc8b174b6b08530..14e35b9660d76e47619cc6026b94929b3bb3e02b 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1289,6 +1289,8 @@ static void arm_trbe_register_coresight_cpu(struct trbe_drvdata *drvdata, int cp
>   	desc.ops = &arm_trbe_cs_ops;
>   	desc.groups = arm_trbe_groups;
>   	desc.dev = dev;
> +	desc.cpu = cpu;
> +	desc.flags = CORESIGHT_DESC_CPU_BOUND;
>   	trbe_csdev = coresight_register(&desc);
>   	if (IS_ERR(trbe_csdev))
>   		goto cpu_clear;
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 2131febebee93d609df1aea8534a10898b600be2..9d85e15337bc7e339695df18bcd5dac291d44916 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -141,6 +141,8 @@ struct csdev_access {
>   		.base		= (_addr),	\
>   	})
>   
> +#define CORESIGHT_DESC_CPU_BOUND	BIT(0)
> +
>   /**
>    * struct coresight_desc - description of a component required from drivers
>    * @type:	as defined by @coresight_dev_type.
> @@ -153,6 +155,8 @@ struct csdev_access {
>    *		in the component's sysfs sub-directory.
>    * @name:	name for the coresight device, also shown under sysfs.
>    * @access:	Describe access to the device
> + * @flags:	The descritpion flags.
> + * @cpu:	The CPU this component is affined to.
>    */
>   struct coresight_desc {
>   	enum coresight_dev_type type;
> @@ -163,6 +167,8 @@ struct coresight_desc {
>   	const struct attribute_group **groups;
>   	const char *name;
>   	struct csdev_access access;
> +	u32 flags;
> +	int cpu;
>   };
>   
>   /**
> @@ -261,6 +267,7 @@ struct coresight_trace_id_map {
>    *		CS_MODE_SYSFS. Otherwise it must be accessed from inside the
>    *		spinlock.
>    * @orphan:	true if the component has connections that haven't been linked.
> + * @cpu:	The CPU this component is affined to (-1 for not CPU bound).
>    * @sysfs_sink_activated: 'true' when a sink has been selected for use via sysfs
>    *		by writing a 1 to the 'enable_sink' file.  A sink can be
>    *		activated but not yet enabled.  Enabling for a _sink_ happens
> @@ -287,6 +294,7 @@ struct coresight_device {
>   	atomic_t mode;
>   	int refcnt;
>   	bool orphan;
> +	int cpu;

super minor nit: Could we keep the bools closer to better pack the 
structure ? Not that it really matters.


Otherwise looks good to me

Suzuki


