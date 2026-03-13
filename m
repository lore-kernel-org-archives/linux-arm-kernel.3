Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBF7105F798
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 11:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDQ8eBfltr4xA11A0P2Tfh/dDhTynDksJ3RkQaHx8T4=; b=lg45Kj4bcOXvyMFDAWCspABDGL
	z6TOKBbTZ6YvbxwdVJvUCz3aa8ykAm25LjHlRABCmZInpUiUFtbIfnWYI0ZFtP4Kc57Ev3jPaKdTM
	prRnHQgjuyl6Ois5KlI37e50mIYeAZXAA9tcTw2WKg69Gt7aX6ip+2pUN+XQejf/4y9YXZldZLOcB
	0SqyHGcUHH+qha+yqNMZNm0D8FZLQuiZOwDH5jlk+oxj0wbHZLSbbg17erPRPuB9ffROE6yRT1IJg
	T0ZQQzXraSIX/kgWlSop85pxxFgC2ByqGsrfVAeA/Ae75VDExYy31wGx03qzYtnAGqKfsPxyC7D0f
	qr46/TNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10Jd-0000000HZLa-0vWy;
	Fri, 13 Mar 2026 11:04:25 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10Ja-0000000HZKo-0gQg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 11:04:23 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iN/cZ7leS/4v+rm19rOCfGFYO5BHSZU0oCVKNJnB92TNlYe8aq1Lb/PSDHy50mBDD6ELhDF6HtdVAHMQ+8oEdzWmYDiD+fA8MJrnVFfoLVxuiI8R4HpoL8iN/lYhBzPE8LAnFUtfGFdsIFax5zcYnmo7VPWyAU+4O/HrPulTy5Dhkzss0b2XFcO3EzzSXnpFLqP1C69E4PNbhSmrCgqxHzxGDDjA2uM25B6FY1yxZ5Vj/TEklcRd9ZaeR317RfzEY6z4LjcgTi5E5r5JVzR6+gTQdoHOB5xUjrkzwkqXEsL+ZyhzWJLTETqz9MgTqJw1Srx1j/hgqX4TzYX0dFu9Jg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDQ8eBfltr4xA11A0P2Tfh/dDhTynDksJ3RkQaHx8T4=;
 b=CzfY3pQv+IT9pCRQNPcJNhUdExlRX3C/ypKg8e3bKO0sZ6jLJ07VJTcKzvu2/uiv2VJK93WjTyxCWuHKMCSBL8sJM2l5D6AP47vLw3IZrk4BjyC8aKhxPY5F+RABFJK23iTUqgl//20U3yJcHCoAnvzUPsvzysGehar6VVHY0nfWtyN8I4XfCNzWfNcI6B4CHLS8o/A6sAYTJn4YTmULkIR1BBD/RslrAznMXyhljl+2bCbxlQiEn5k0Q05XOl2AGUPhFo6h5Nhxm8Yeo2DUL5+2t+3VfyBVjjL/rVw5T67n3OLj5FNmVoBGMGIVEZ3jarm6snFyW3LFa70J94/s/A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDQ8eBfltr4xA11A0P2Tfh/dDhTynDksJ3RkQaHx8T4=;
 b=ZyedSyWrQ00Gi2yxb2zCWOmYBLEsHgmTI9S1iO9sHpUzzDvdPxAifjVd1q46MzjiaVn5EUb5OfvsrOlNmQPEEHQtErHk9TjKH2aT0EujLbPyBmifq92loJJz6iooGMWbOp8fcBqGqKuMCBUPJbiTMGtg8oyY6CVFbzoNeJHFNF0=
Received: from DUZPR01CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::6) by DB9PR08MB8226.eurprd08.prod.outlook.com
 (2603:10a6:10:39e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 11:04:10 +0000
Received: from DB1PEPF00039230.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::81) by DUZPR01CA0067.outlook.office365.com
 (2603:10a6:10:3c2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 11:04:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039230.mail.protection.outlook.com (10.167.8.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Fri, 13 Mar 2026 11:04:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQYtfhk1//5vA4tX3LSdf0j1SrXDj1/mGLPy+9qUyv4NBMIY1vh8DpCu0EQn1Fq19y9/a+/514l1sdYj1EfgtOo+JhBZh0HDO8wcsp93a45Q79BOIGYXVRn/kU1GuIo4qd6HOJcThTgvvL4Vh4nncF+WdovS4nxca2ZNua4ETsUrRt+Kq/lDeXHorlHs5iD081HejaZ/IPWw6iS6D0rHX+rfpwz2sLT58ACu9t/X8BlLxPDSv7atAMPxaWiGQeDmVp2B4pZ+k181CA6nsMlngcMkK9YvlRuuWfKH+7GiJxHr1LnIlno9AqeycjFlbYyt7f21tsJH2UkVGFLT1YK+9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDQ8eBfltr4xA11A0P2Tfh/dDhTynDksJ3RkQaHx8T4=;
 b=E2bIKud1Kl4718YYDNG+5YsXXkX6Tl/Vu0u9DYl/p/RSSsRztpplq0Sb/XT0nEz/M1/pdD642UoaBefH5xMfcusrWEeoiMTgUXRmUY4TpZRogb7R6z5lHRUWogxmKvL2eaD+dVHnHnH6Ct3ys2KStPD+XodOTUX0YIfhMpVWg/v9S5oo8aTf8O4qE7xXzIoNdfppz/jy38IiODAPcNaYvAukkCY8fEc3xOeO7m6m+eM+hw+uWPw0cS59JXSi3F3huwUMS+QTQ8dyLjrb8fMmopdK8zdeAfSFgbAQKOQaEhHD8KDb2UzLB3dsTaF3kXgWO1/o2oTYNhgBe+4BWk0gPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDQ8eBfltr4xA11A0P2Tfh/dDhTynDksJ3RkQaHx8T4=;
 b=ZyedSyWrQ00Gi2yxb2zCWOmYBLEsHgmTI9S1iO9sHpUzzDvdPxAifjVd1q46MzjiaVn5EUb5OfvsrOlNmQPEEHQtErHk9TjKH2aT0EujLbPyBmifq92loJJz6iooGMWbOp8fcBqGqKuMCBUPJbiTMGtg8oyY6CVFbzoNeJHFNF0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by DU0PR08MB10327.eurprd08.prod.outlook.com (2603:10a6:10:474::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 11:03:03 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f%5]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 11:03:03 +0000
Message-ID: <13fbfe69-2d7f-49fa-a191-98aea3fb1f21@arm.com>
Date: Fri, 13 Mar 2026 11:03:02 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/19] coresight: sysfs: Validate CPU online status for
 per-CPU sources
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
 <20260305-arm_coresight_path_power_management_improvement-v6-1-eff765d211a9@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260305-arm_coresight_path_power_management_improvement-v6-1-eff765d211a9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0069.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2de::16) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU4PR08MB11769:EE_|DU0PR08MB10327:EE_|DB1PEPF00039230:EE_|DB9PR08MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: adcb5f73-b820-4c39-6cdd-08de80f040bb
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003|7053199007|921020;
X-Microsoft-Antispam-Message-Info-Original: 9hdeLrFacamoU45ng3NJQ+/PGfyFsrQaca4bfVpJyHJevSCgqBqjrnwoOTKWyvUPAF32vqQmCW9MkHOPAUx5HBWPJVWyCiuhaMxwMgcGWF9ShCploFDXEvj0ehaEgWevLV85BAVghJO8HmVMsU8X2UMyZyvoq6+jECtEPQAWbqB6Ta0HqPbvXn+Bq1kNHOtaQSJDdtHPvfzyH47st/Y71P7gyece2oxQuPWdCiBtHa/3FM2Oq3e/HN+/MDYl+LpnU++fKnUkK/9SREjaBeAc5kclMWrJVqkkCseMHMRhHUKW82VJb0ZVtmkodDvhfdiTL2Et9s+rwN1yyP4JDpVhzNQ5flvohRO+IH/u/Ui1hC4WqYaZjRDS0qlRMtv/ovjM3cUvsVIBOxjoTEKSd7gPuZIWdHNjlKx7agRrcw6ymMby7eOpGoWKL2SwhEw11RiEgknTlG7O/s1BcpgOmO42ZFfmu/MMo6Tw+jD9RgCllKjjNGeGpZsDn6OHVPdU7ES8/8Y43OddWKr3l+iAPFiUzs0u1w/+nWYw0a//DANXcOtNdcLcBsFE7aF4vkvuKG5RRBrKxC1o04uOKWEw3IavKtelwuBKMQ5cbtrvB85+wh2UXPqNLyx6w/wuu6lUssa1vJ7cF+bsOS7up5xK/JJCGAA7IEWdYZga5pXDDN+8HcMjKIbyNUofTf9IEouoq002NQsErwh4azXXRypGL9qCruPntFJ1RJ+kgjFuZjZ03Oug8V9yYN59fVTaNEHUkn86svlzFVGIN1fBqXN7cJn4ag==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11769.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(7053199007)(921020);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: Gt4VJ4H21adnPXzs+G10ioRhrsmYtT51ckRmXm18itXac0fId8Ndes+o28Ws2jE9WKxbpnJrYXOjPbLxWlplk+mxAY+hXWhB4uW0P7/b2HotH1jFoZu9pO6xRpmDJMIuhMQRQzKTpYXLZ31kRNHpmWvQ2kXe2MCtqnAO2SFEncoFFXoV9DwWxJm4wRdGSqhTIIbEHAPFrqVVyOeU7KQRtLWHQJFWJL3Kr+CJ4Pzqp43cBaULDUgXA+W8i+vnGy5AE3aloyzJ0mBcC3hVJE0qPKEYKMzpdjH4yo/nvsGpLBjmFoTrsR40D9ZQESoWBbxWnK8K2HWrjBDPtbx0eyD/8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB10327
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 860d8ff0-4b72-4a0c-70d9-08de80f01907
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|14060799003|35042699022|36860700016|1800799024|56012099003|22082099003|18002099003|7053199007|921020;
X-Microsoft-Antispam-Message-Info: ef7q72rtaTjvsbr326mG0Lcsigek/OL3yekMuWVqq8BRO4PvZY4LtKpaR9rZpUA/Rs8ytZ9sg25rQKi/ZZtvpr+El+ENL3zI0JvqlSTII4SMGoy3CUAmEUUGSdQ/w4pKVVSV2PPWfvvQkU8qClUQGEUjEa/m8/VLYh/4YEeDUlkGcykpYhyYJgRxHysm3yJv4AVoJUnRvqvypj7KK8oTJunUGTD/0tW0gYOaEHlv3Wm6nbsWQBqmKo0gNBDv+g53DD96+zg05IKjcNeUyHu4lDau8MfgSVnvTGgI7nyuYsLW72sE9UoddBDLz7Nr0pgl4OIE/Ii9pccOWJkFY6g1fsmT3OZiLv7a7pn1mxwt1zXVkkDscT8/GdsN/tiDK1GJvoVj9wOEwRI4Msz6tFdFp1Lq3H9bypVRqt0LtOgz/HelXFEAhIwa/lp1WU5903/2NWlwebYuwiKR9h7XVSRYZpvuZwOQOvDOWqhiQW4g4ljPcBHNbySdCYR6oZ/PVKR67iDtka4pxP3zyABnEF45QsNLU/iPt2OIbVnz1Ttka4jcqT5QnQe2mEBjW128yXual7POnAm/xSshnwyqAvFMHG3hl7MPEknaVtlwhwS+8c89W8moRmz01wwg/IP1dY1/+iDMsW2+dSyunaR6OmAyP0zW+UrzhzR8PgSP+Ro9VXyaZFTP+cq2dw8LCysBZ2hxrO7Z3Pc4Es/5M9e8qpY4BtEN7Y7/Eh9qVWtFcE/bqrtlKXzqLzfXxxpnIutWqz7eRc3M6SEzYkhkGEGf6wc6g60pTIqyqOQkNRyvcoBqE+q853VNOVR8KV9j2r4FUARD
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(14060799003)(35042699022)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XfpiNFOIuNWiKP9oFutlhISkYzZmVv8r8Ya39Gk3Ay8g7afp1uMASMlDiqQGK1NB+61L4qs1pEnXTZ3Xcz3EMr3it/TUSvVNhWyIdo73iuWZBuTmUFVQMfhQ57yS7b42zhg7Mgt7yyAOfkJso3hwxb2qjM5yMi5N+KXcBZ1OAAwvkjy9yxVNnTFtWWB58LF4450bD4ROhdFuyNWSHRuX6POXLKtzFVFLXdWeganba/c+NnN8BTG6PaOs7pCyyeXBnwE2VKvAqf7AQbZBlLRFoeqfvk6ZnsNoz/UagNkl8T5XQQNVzLUCRVuJfcYCxGBDTncM2S6V18h+C6KHPtqnkUi1uF8KihkiccWQ+d53h15TpvH5P88ZTGTvHaT/Jb87yYiwlkCJRCrJ3z2eNrM1FHp9BGpWfAZmIff+HOkAFcr2oTwtrLfeR7vLbH6P1Vkr
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 11:04:09.8511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adcb5f73-b820-4c39-6cdd-08de80f040bb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_040422_399065_B8134175 
X-CRM114-Status: GOOD (  18.57  )
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

On 05/03/2026 10:17, Leo Yan wrote:
> The current SysFS flow first enables the links and sink, then rolls back
> to disable them if the source fails to enable. This failure can occur if
> the associated CPU is offline, which causes the SMP call to fail.
> 
> Populate CPU ID into the coresight_device structure, for components that
> are not CPU bound, set this field to -1.
> 
> Validate whether the associated CPU is online for a per-CPU tracer. If
> the CPU is offline, return -ENODEV and bail out.
> 
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Tested-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>

While this works, how about we make it an explicit buy in from the 
driver for CPU bound ?

e.g., add a flag in the coresight_desc.flags = CORESIGHT_DESC_CPU_BOUND

and then desc.cpu describes the associated CPU. Otherwise, defaults to 
-1. That way you could restrict the changes to only those that need the
CPU (ETMx and CTIs ?) Also makes any new driver safe.

Cheers
Suzuki


> ---
>   drivers/hwtracing/coresight/coresight-catu.c       | 1 +
>   drivers/hwtracing/coresight/coresight-core.c       | 1 +
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 1 +
>   drivers/hwtracing/coresight/coresight-cti-core.c   | 1 +
>   drivers/hwtracing/coresight/coresight-dummy.c      | 1 +
>   drivers/hwtracing/coresight/coresight-etb10.c      | 1 +
>   drivers/hwtracing/coresight/coresight-etm3x-core.c | 1 +
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 1 +
>   drivers/hwtracing/coresight/coresight-funnel.c     | 1 +
>   drivers/hwtracing/coresight/coresight-replicator.c | 1 +
>   drivers/hwtracing/coresight/coresight-stm.c        | 1 +
>   drivers/hwtracing/coresight/coresight-sysfs.c      | 3 +++
>   drivers/hwtracing/coresight/coresight-tmc-core.c   | 1 +
>   drivers/hwtracing/coresight/coresight-tnoc.c       | 2 ++
>   drivers/hwtracing/coresight/coresight-tpda.c       | 1 +
>   drivers/hwtracing/coresight/coresight-tpdm.c       | 1 +
>   drivers/hwtracing/coresight/coresight-tpiu.c       | 1 +
>   drivers/hwtracing/coresight/coresight-trbe.c       | 1 +
>   drivers/hwtracing/coresight/ultrasoc-smb.c         | 1 +
>   include/linux/coresight.h                          | 4 ++++
>   20 files changed, 26 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index ce71dcddfca2558eddd625de58a709b151f2e07e..8f22f12e260787335cb71b06ba7c8aeccf603fc8 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -573,6 +573,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
>   	catu_desc.type = CORESIGHT_DEV_TYPE_HELPER;
>   	catu_desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CATU;
>   	catu_desc.ops = &catu_ops;
> +	catu_desc.cpu = -1;
>   
>   	coresight_clear_self_claim_tag(&catu_desc.access);
>   	drvdata->csdev = coresight_register(&catu_desc);
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 46f247f73cf64a97b9353b84ba5b76b991676f5f..f191a0fe802ac6ae1342872e01fff463775c8a20 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1341,6 +1341,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>   	csdev->ops = desc->ops;
>   	csdev->access = desc->access;
>   	csdev->orphan = true;
> +	csdev->cpu = desc->cpu;
>   
>   	csdev->dev.type = &coresight_dev_type[desc->type];
>   	csdev->dev.groups = desc->groups;
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index 9043cad42f01e6d1facb07a1f85623250535ed9c..58113cc1add3fd37afec1b5bc11eb26c0f95b339 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> @@ -226,6 +226,7 @@ static int ctcu_probe(struct platform_device *pdev)
>   	desc.dev = dev;
>   	desc.ops = &ctcu_ops;
>   	desc.access = CSDEV_ACCESS_IOMEM(base);
> +	desc.cpu = -1;
>   	raw_spin_lock_init(&drvdata->spin_lock);
>   
>   	drvdata->csdev = coresight_register(&desc);
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index 2f4c9362709a90b12a1aeb5016905b7d4474b912..5f4ff84f20912a3f8405448d028c742a7c860d26 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -725,6 +725,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>   	cti_desc.ops = &cti_ops;
>   	cti_desc.groups = drvdata->ctidev.con_groups;
>   	cti_desc.dev = dev;
> +	cti_desc.cpu = drvdata->ctidev.cpu;
>   
>   	coresight_clear_self_claim_tag(&cti_desc.access);
>   	drvdata->csdev = coresight_register(&cti_desc);
> diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
> index c176a2f57300fd8cd5d153be5ccb6faaef96023d..788fb28c74a901382a28326ba230455125a471ee 100644
> --- a/drivers/hwtracing/coresight/coresight-dummy.c
> +++ b/drivers/hwtracing/coresight/coresight-dummy.c
> @@ -176,6 +176,7 @@ static int dummy_probe(struct platform_device *pdev)
>   
>   	desc.pdata = pdev->dev.platform_data;
>   	desc.dev = &pdev->dev;
> +	desc.cpu = -1;
>   	drvdata->csdev = coresight_register(&desc);
>   	if (IS_ERR(drvdata->csdev)) {
>   		ret = PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
> index b952a1d47f12f44c15cc845914691305713028c4..b8df9e3c93df167dabd39d90b6f9491def0f6b90 100644
> --- a/drivers/hwtracing/coresight/coresight-etb10.c
> +++ b/drivers/hwtracing/coresight/coresight-etb10.c
> @@ -768,6 +768,7 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
>   	desc.pdata = pdata;
>   	desc.dev = dev;
>   	desc.groups = coresight_etb_groups;
> +	desc.cpu = -1;
>   
>   	coresight_clear_self_claim_tag(&desc.access);
>   	drvdata->csdev = coresight_register(&desc);
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index a547a6d2e0bde84748f753e5529d316c4f5e82e2..2e9e824309bdab5c2983ed1a3e61b27c9d822278 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -891,6 +891,7 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
>   	desc.pdata = pdata;
>   	desc.dev = dev;
>   	desc.groups = coresight_etm_groups;
> +	desc.cpu = drvdata->cpu;
>   	drvdata->csdev = coresight_register(&desc);
>   	if (IS_ERR(drvdata->csdev))
>   		return PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index d565a73f0042e3e0b21fcf9cb94009cc25834d3d..add4cc9c1eca42b58d8f9d7bb3dc8d2ea1241ee2 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -2260,6 +2260,7 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
>   	desc.pdata = pdata;
>   	desc.dev = dev;
>   	desc.groups = coresight_etmv4_groups;
> +	desc.cpu = drvdata->cpu;
>   	drvdata->csdev = coresight_register(&desc);
>   	if (IS_ERR(drvdata->csdev))
>   		return PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index 3f56ceccd8c9f6deaaf783a06a0d19fb06eff7c4..c281c36a84015a73023ba9db2eae29ce13c6e880 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -261,6 +261,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
>   	desc.ops = &funnel_cs_ops;
>   	desc.pdata = pdata;
>   	desc.dev = dev;
> +	desc.cpu = -1;
>   	drvdata->csdev = coresight_register(&desc);
>   	if (IS_ERR(drvdata->csdev))
>   		return PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 07fc04f53b88fdec7ae18d3000046fe74c0cec9d..e947e8f0e8c4bfc4d85da385663ea3805a9b1df1 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -271,6 +271,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
>   	desc.ops = &replicator_cs_ops;
>   	desc.pdata = dev->platform_data;
>   	desc.dev = dev;
> +	desc.cpu = -1;
>   
>   	drvdata->csdev = coresight_register(&desc);
>   	if (IS_ERR(drvdata->csdev))
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index aca6cec7885a551ad5960986b1cdf08baa6b5a94..d60fdec640c760c4648ece8d28636936a1b9fb9b 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -899,6 +899,7 @@ static int __stm_probe(struct device *dev, struct resource *res)
>   	desc.pdata = pdata;
>   	desc.dev = dev;
>   	desc.groups = coresight_stm_groups;
> +	desc.cpu = -1;
>   	drvdata->csdev = coresight_register(&desc);
>   	if (IS_ERR(drvdata->csdev)) {
>   		ret = PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index d2a6ed8bcc74d64dccc735463f14790b4e80d101..7c7d3a3cb9f18a9dfa78eb5c19dda43fa6656271 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -162,6 +162,9 @@ static int coresight_validate_source_sysfs(struct coresight_device *csdev,
>   		return -EINVAL;
>   	}
>   
> +	if (coresight_is_percpu_source(csdev) && !cpu_online(csdev->cpu))
> +		return -ENODEV;
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index c89fe996af23194c7e59432ce39ce20bb65937cf..5af06ae8b44d0e53a479822f25ab58e692a9696b 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -863,6 +863,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>   	}
>   	dev->platform_data = pdata;
>   	desc.pdata = pdata;
> +	desc.cpu = -1;
>   
>   	coresight_clear_self_claim_tag(&desc.access);
>   	drvdata->csdev = coresight_register(&desc);
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> index 96a25877b8240f20921efa979a361eb473c05600..c8530c625c0b04699e82b602e556718717a239f7 100644
> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> @@ -226,6 +226,8 @@ static int _tnoc_probe(struct device *dev, struct resource *res)
>   	desc.dev = dev;
>   	desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
>   	desc.groups = coresight_tnoc_groups;
> +	desc.cpu = -1;
> +
>   	drvdata->csdev = coresight_register(&desc);
>   	if (IS_ERR(drvdata->csdev)) {
>   		if (drvdata->atid > 0)
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 89c8f71f0aff06e87971976efb23feb0057fcce6..b96dfc697b1d881b853839dce196e3024f489fc3 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -593,6 +593,7 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
>   	desc.dev = &adev->dev;
>   	desc.groups = tpda_attr_grps;
>   	desc.access = CSDEV_ACCESS_IOMEM(base);
> +	desc.cpu = -1;
>   	drvdata->csdev = coresight_register(&desc);
>   	if (IS_ERR(drvdata->csdev))
>   		return PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index da77bdaad0a4519bd4e0653cc92e2a333e59e60d..b61cc260ec0b043a96772a47ca0dd536ef12e290 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -1423,6 +1423,7 @@ static int tpdm_probe(struct device *dev, struct resource *res)
>   	desc.pdata = dev->platform_data;
>   	desc.dev = dev;
>   	desc.access = CSDEV_ACCESS_IOMEM(base);
> +	desc.cpu = -1;
>   	if (res)
>   		desc.groups = tpdm_attr_grps;
>   	drvdata->csdev = coresight_register(&desc);
> diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
> index b8560b140e0fa4bf8bf1e5c60fe67077b11798fd..a5254f36820b9e75047241d8690ff39b0f62b143 100644
> --- a/drivers/hwtracing/coresight/coresight-tpiu.c
> +++ b/drivers/hwtracing/coresight/coresight-tpiu.c
> @@ -169,6 +169,7 @@ static int __tpiu_probe(struct device *dev, struct resource *res)
>   	desc.ops = &tpiu_cs_ops;
>   	desc.pdata = pdata;
>   	desc.dev = dev;
> +	desc.cpu = -1;
>   	drvdata->csdev = coresight_register(&desc);
>   
>   	if (!IS_ERR(drvdata->csdev))
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 1511f8eb95afb5b4610b8fbdacc8b174b6b08530..fc6e3551b7002634bcf6a154080a142dfe32c890 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1289,6 +1289,7 @@ static void arm_trbe_register_coresight_cpu(struct trbe_drvdata *drvdata, int cp
>   	desc.ops = &arm_trbe_cs_ops;
>   	desc.groups = arm_trbe_groups;
>   	desc.dev = dev;
> +	desc.cpu = cpu;
>   	trbe_csdev = coresight_register(&desc);
>   	if (IS_ERR(trbe_csdev))
>   		goto cpu_clear;
> diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
> index 5776f63468fa05df255d3dd716f621c37424c048..5217a9930e2632a40ba0523438052872cea62aea 100644
> --- a/drivers/hwtracing/coresight/ultrasoc-smb.c
> +++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
> @@ -482,6 +482,7 @@ static int smb_register_sink(struct platform_device *pdev,
>   		return -ENOMEM;
>   	}
>   	desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
> +	desc.cpu = -1;
>   
>   	drvdata->csdev = coresight_register(&desc);
>   	if (IS_ERR(drvdata->csdev))
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 2131febebee93d609df1aea8534a10898b600be2..6810acc8533e0eb0c5d41a7fbe0bbd03eb94057d 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -153,6 +153,7 @@ struct csdev_access {
>    *		in the component's sysfs sub-directory.
>    * @name:	name for the coresight device, also shown under sysfs.
>    * @access:	Describe access to the device
> + * @cpu:	The CPU this component is affined to (-1 for not CPU bound).
>    */
>   struct coresight_desc {
>   	enum coresight_dev_type type;
> @@ -163,6 +164,7 @@ struct coresight_desc {
>   	const struct attribute_group **groups;
>   	const char *name;
>   	struct csdev_access access;
> +	int cpu;
>   };
>   
>   /**
> @@ -261,6 +263,7 @@ struct coresight_trace_id_map {
>    *		CS_MODE_SYSFS. Otherwise it must be accessed from inside the
>    *		spinlock.
>    * @orphan:	true if the component has connections that haven't been linked.
> + * @cpu:	The CPU this component is affined to (-1 for not CPU bound).
>    * @sysfs_sink_activated: 'true' when a sink has been selected for use via sysfs
>    *		by writing a 1 to the 'enable_sink' file.  A sink can be
>    *		activated but not yet enabled.  Enabling for a _sink_ happens
> @@ -287,6 +290,7 @@ struct coresight_device {
>   	atomic_t mode;
>   	int refcnt;
>   	bool orphan;
> +	int cpu;
>   	/* sink specific fields */
>   	bool sysfs_sink_activated;
>   	struct dev_ext_attribute *ea;
> 


