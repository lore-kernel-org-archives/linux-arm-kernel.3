Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C598E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 10:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7W5YPbOuWNXK/WgaN0UD4jtjjMRT8CarJqibKLKKgAE=; b=jN0TlDL7VOIkvehCzaCXBriUL+
	lr1sPlwK780Jekryf8jcuNKdZWzBjVZOr2tMIp33MKDjf14+/G6vxbuXFC9aYlnfjkqzH85BTOrr4
	7TxnzdywJ6ElwHuVuu84ONlrhTzZY9x8fWNfLLsGy1e11phzXBpnMcoM8MYZ5YpC6YclHoGRCT1cI
	aO3nrJqZrbC9PQjju4H0YAxxVhnqEktjIAMwmrBBC4MtVXkAifnj4L6bpHDQv1CwrhGkwINJgc8iF
	TLDWrlviKZcUGsIaO1bsAb/Wvf01+aKs95ESb+evNfXTk9JgP2Um6+DHChxXKXAD1RZarpiVC14Ip
	1xqlUnXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxjp-0000000BB57-2a4v;
	Tue, 10 Dec 2024 10:45:09 +0000
Received: from mail-vi1eur02on2061a.outbound.protection.outlook.com ([2a01:111:f403:2607::61a] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwf5-0000000AutU-1Wi4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 09:36:12 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yGO5uvu7rdXow3oVExoY04OYLhM85IegevxdaJDX1/FqhXme9cKLUhEixYCCkl5R0I8o/do9ExLgRCuwJ9YXStDwnymvrjMWksh8JKJmlcPFCghy4WxOy1Llsk+W/nlSLZUn/9Y73Z9pLe83I1ebvvLTmpgDnTJdFANRumfvJPXAec4fobZlbtYWcXCNQ1Btl7ZJIoBwmM5lh10yFuHt7Uc1OV6FoHWlUjVHMkzH6u3twgXDpJ3UHtfukHnhqkPkJF0jFUsZDDkazAplFSX8ZqTP4hzqBuNCsLsV+r47orbMKxtxCET+QBSPVSD5TdNHlF5kW/NR2NJ2XnrrPxNxFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7W5YPbOuWNXK/WgaN0UD4jtjjMRT8CarJqibKLKKgAE=;
 b=c6VSzcoO+thqT+IVHC1KbalfxNn7lcj+wPhxnn3hsvsVZ0Rgh3uGVzweiga9w1WErCBjZBPrLPcLykWDqwVEqQw9mbjEmmIQdpik4tKvXbApHP18FoPHHuwUrgH4nqSKoQYtYK9gkSSlHRiXY+QWMvyp3JyrUXOQSbnuccuONUU2t1nP7lPxyMHF6rwBliB7gNuI71Jy6zxA7cWN1nq926VzW6+aAfcW9UpBI0der+6zoQSgyvXcqdNOOvfAlGUIdMWagHaDQSt8CFJFRCPf081IlM8SOmxT2L3pXhzGCx0EI3AFNl7v6g05xk3gGVyGcfeCQuLlT1+XfEebg4EYZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7W5YPbOuWNXK/WgaN0UD4jtjjMRT8CarJqibKLKKgAE=;
 b=NhLzQdFA27PcimDNXOTiS3yXzc/W0QzIvGHpgsbU7G5oKUg5y1xUfsvTTbfF4PReDsN0f4m6KI5qMhtSgFLn+brwcz3egsQR2iYwooTdWbDOINu91AQ1q8TDIl0TkJ6uHa1npzynDU4VUMbyPrw0k19FpFFwgGp83bZjp6Ovhac=
Received: from DU6P191CA0056.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::17)
 by AS8PR08MB9313.eurprd08.prod.outlook.com (2603:10a6:20b:5a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.17; Tue, 10 Dec
 2024 09:36:05 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:10:53e:cafe::e9) by DU6P191CA0056.outlook.office365.com
 (2603:10a6:10:53e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.15 via Frontend Transport; Tue,
 10 Dec 2024 09:36:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.7 via
 Frontend Transport; Tue, 10 Dec 2024 09:36:03 +0000
Received: ("Tessian outbound 3df7a8fbf509:v524"); Tue, 10 Dec 2024 09:36:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ae228c32c5c3d83a
X-TessianGatewayMetadata: kngRs6acfCVUfj6D8d/+PJrtW9gXhpe8cw2j5KfRAwI9SG10gNwGVeMfM4/dQNpY+/7pQg3EfK2rrfEWeNKHXNjgKSZeHNV9WWzrizY/vSRXyAYijddvwVu5yS/vaUreL9fj+b/bfTMxiRBZWltmTb6Vrvwp8BR1PW4/hYM+bmQ=
X-CR-MTA-TID: 64aa7808
Received: from Ldad54e930cfa.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E018F170-03DB-4819-AFC5-8DC0D7562EE7.1;
	Tue, 10 Dec 2024 09:35:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ldad54e930cfa.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 10 Dec 2024 09:35:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJwAh9K7MWgxM7esRILoBmnOvM4g+5w/OUyg/5etCq/xUYKVtx41FT+rZP5mwW/ExviWZX6ckfrGz0399Wyl/l4c5Gw4wJmJmEJkSzQjhSuTnIiGvdxDbilulaNN7fzXurIwDMLv0c95kLJ5jh8VfkDrDjqygyxXDPbhAN6JBFnXeuiclvzLVSkZdomo34vDld+AVfgCN3Z9bTE44wZInHLBXFw9Xoxh/KklI30+CWDh8YOYUitViRmpE5VfT/gJ3LTFFTK6D1Tn3rijmj3iUMIV9avEoEpopKAL9ddZrJqMQ8v754PaT8tljvHMyu76bioazv39b+EfRFmaxGe9/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7W5YPbOuWNXK/WgaN0UD4jtjjMRT8CarJqibKLKKgAE=;
 b=Tyi0xWB7CKYqZunjSX99ZGhsaJfhO8tNXJ3x10L42kMXPfBAnoopcdJ4XivBi4W3I1VBAHjDn5Cd7UITQ8q/9sUsYxR3oGWfmGyjm5T2yp0yZYq2Ws5tkbJPVP5m9TDGCsbTjSumSPvGxs1XYgBB/fMEfA1Xax/LdC4RfxnO75JqiixjWIVftnbtgdRMpcayJb/hRZqW8TjvNnloTsRYxVoJ7FKyadxpOy8iCw4lT3Axbr/DwqKECztxkx9+7TvVKkIAIz/izGnTJcXe4HT9SY1JiH3HF0DaQMegoRnpTEAjS/jVqbxMU/ecmazcYlLD+unNfK2AamsUPqZ5ar50mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7W5YPbOuWNXK/WgaN0UD4jtjjMRT8CarJqibKLKKgAE=;
 b=NhLzQdFA27PcimDNXOTiS3yXzc/W0QzIvGHpgsbU7G5oKUg5y1xUfsvTTbfF4PReDsN0f4m6KI5qMhtSgFLn+brwcz3egsQR2iYwooTdWbDOINu91AQ1q8TDIl0TkJ6uHa1npzynDU4VUMbyPrw0k19FpFFwgGp83bZjp6Ovhac=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PR3PR08MB5852.eurprd08.prod.outlook.com (2603:10a6:102:8e::21)
 by GV2PR08MB9926.eurprd08.prod.outlook.com (2603:10a6:150:c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.19; Tue, 10 Dec
 2024 09:35:53 +0000
Received: from PR3PR08MB5852.eurprd08.prod.outlook.com
 ([fe80::f44:d113:1c29:825d]) by PR3PR08MB5852.eurprd08.prod.outlook.com
 ([fe80::f44:d113:1c29:825d%3]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 09:35:53 +0000
Message-ID: <7e62661d-03bb-43c9-b15a-fda0a379497a@arm.com>
Date: Tue, 10 Dec 2024 09:35:51 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64/sme: Reenable SME
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Dave Martin <Dave.Martin@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241204-arm64-sme-reenable-v2-0-bae87728251d@kernel.org>
 <20241204-arm64-sme-reenable-v2-5-bae87728251d@kernel.org>
From: Luis Machado <luis.machado@arm.com>
In-Reply-To: <20241204-arm64-sme-reenable-v2-5-bae87728251d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0427.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::31) To PR3PR08MB5852.eurprd08.prod.outlook.com
 (2603:10a6:102:8e::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PR3PR08MB5852:EE_|GV2PR08MB9926:EE_|DU6PEPF0000A7E3:EE_|AS8PR08MB9313:EE_
X-MS-Office365-Filtering-Correlation-Id: 85070e89-43d1-4e98-c51a-08dd18fe10c7
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?SjJkRXhvUjRhM1h4bllYYlhGNEFtWGZnZ0p5T1k1WDJiQVhZNzB3K0VkRjZP?=
 =?utf-8?B?WnFBN2NDenlYbTdjNUV1UzYxRGJwVFo3b203NEtTbCswM2pBaXJkSGZhQy9W?=
 =?utf-8?B?NmdHSXhuR2NSK1lzQkN5b1hDcnZwNW5ZMS9uc0t6NEk5bEJyUHZKYTJlbjJW?=
 =?utf-8?B?QjI4OEdUY3kyVlk2Q2hmeUxjYU1OdHJEdXArRXVHcmRsVjVxdCtJRnNUZW5O?=
 =?utf-8?B?YWNtb1lyeXNhd29CaC9ORmJBRFViRW9IK2c4Z1ZOY1AyNEVrQ2JDT0ZheWxX?=
 =?utf-8?B?c2VoVkdlWnNMdDJsY0dkbnJLcVQxT0RDb0JiT3hFUkUvQzkxd29qMUx3a0F6?=
 =?utf-8?B?MEZDRk51alBDQi9HeVlCenhvemdqdXI5Ym5zUlZ1UGI3M0tuZnFoMFJsRkJx?=
 =?utf-8?B?SWpUU3NDWHM4ZVdtaG5idCtLbXA1czdhTXRTTENUSVlOM2psZVIxMXVXZGhP?=
 =?utf-8?B?RWhJcjNvSlN0dGNEdWcrUENDNndxWlZQMFFjNmhiMDJsMUlIQmtuZWJRNkZH?=
 =?utf-8?B?SEIvRmdrdytqS0xZZGRSRzJkQW1CM3BYMUp0Qjk4OVlVNXFBSis2a2MxblFl?=
 =?utf-8?B?T1MzWlFPWVhtRlZ1T3VmNnFjTjJTQ1lzSHBVTzVBRmN2OFpKeUFDa0Z1QnlW?=
 =?utf-8?B?ODBoMkwrejkwS3lYcVVyKzlVTmlGdUVLZHFHRmt1azRsM2xZWHlsV3VjMTNy?=
 =?utf-8?B?a2REUVBaUHRpMWhocnVEZVhLdWZQSzY5ZGVSeDVmN3paMGpUNCsreTRhTVBz?=
 =?utf-8?B?VVdSVHA1TmRkNWFKWU9xREhLYTZvRVZ2a1I3UHEyUWV6RGRuVUl0cUpCcmZQ?=
 =?utf-8?B?TThDdFJiQUp0QjVTc0JpQnI0NmhRVUVvVVFReEd5TE5RZ1NwelM2ZmVVN1BU?=
 =?utf-8?B?d01EZWhlZ1U5Q29CTEgrZ2h2ams2a1NqVXk5RUNZQVBQYjVpSmtVU2ZTdmxL?=
 =?utf-8?B?SGxoZkZVSkFqV2NNSThxWXRmRFY1ZnpsNCs4TGhob3dDYWdoK2txSXBSQU9E?=
 =?utf-8?B?aVROS0Uva2ZtSTc3SlZyQ1BPZThWU3dJVTk3aGlZSndnRVZHdExlM2t2SXFE?=
 =?utf-8?B?UHJYZEVFelVVMU9aRUxvNVRNQWdRLzZKenhJK2w5TlVhVlRqSFM2aUx5N0tY?=
 =?utf-8?B?cGNNRXYwclFBbEVuQk85UVFCcjUyWU1UcWVGYUxKRkNQMnF1bnNwUnB1eHRH?=
 =?utf-8?B?OFI3VGkwYjA0dW1aSnp2T3gvVXN2YVVQaGNhczVDci9uczhaSDMyYnZFMndi?=
 =?utf-8?B?d3h4QnA2U2FnOGxUVWFwV3pnKzhtTFlqakR1VlpwaXBRZGxLRGF6U2RkTjcz?=
 =?utf-8?B?V0Qwdm9menZjRjlkZ0dOa3cyZlI5TUZ2M3hsMy9KTVBPWExhYis4MnRpbnh0?=
 =?utf-8?B?SGwxVm9idy9mSnVzVlVhSkMzcjlXMHcyS0dISWdUSHMyTHNEelY1Wis4RFJs?=
 =?utf-8?B?OEhHeHZVSkNNLzliMFpCZW0zL1B2LzVhT210WUhPa1M4YUxJQS9jMWJBK28x?=
 =?utf-8?B?WHlGMmZ3a0lQM3kxK2xqQyswampJVWxqQzJnWGNCRW9yTjJHUjZuWHhiaXhl?=
 =?utf-8?B?dlRmWWZBWVZzSjNPUlJQeGgwQ1dTbEs0MlFydXVUZUp2ZWJYRndoUGRwM0Ra?=
 =?utf-8?B?T2tjQTVKN0t6ZzhhVnV5bkZObHNTM3ZBSnVMMVBOaDZqbHdwQXBDemQ3eEdT?=
 =?utf-8?B?bjYxejdJdHRZRmJQVVc5akJ6YndmSWN2OXd3UlNwVTlNamlrT0NyT2lua0Uz?=
 =?utf-8?B?bTZ4V0JLTmkrTGhKcWhCWlpMS2lINGZ5cjUvKytNTTZBdzhvSUcxQVRNV1Ax?=
 =?utf-8?B?RVVJOE1UTEN3RE53bm1GZz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5852.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9926
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:102:8e::21];domain=PR3PR08MB5852.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 05c9ab2a-570a-415e-fd2f-08dd18fe0a63
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|1800799024|36860700013|376014|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3VRdXh5QVR2UzdVc0dxOU04d2I4bFA0Um1uS2k1TDdTc1ZlOUU3THRHZHZi?=
 =?utf-8?B?YzV3UGhtWUJHVGU3K0swYnNaRS81Y2tSeHZEc3hFWDBmVUdZVVBnRExGUDhN?=
 =?utf-8?B?ZW1MM0wzVnY5dU5SM0ZyY3JiZG5LbTRldDE5MTFCM3NjNHdDZjMzbVRJRGNI?=
 =?utf-8?B?V3krbHJ5MkdyQ1U5cEhyZzdVMFBLZHkvYXNHbGQ4cDhuVC9HY2xpNkI0b3ls?=
 =?utf-8?B?dTZXMkhhejJzQVRIYVdTTUZyVVpPRnNYQWk3NG92QVkxQ0tpN0NBQTY4OXpU?=
 =?utf-8?B?VFJNM25VMGtlbWk3TlFXYThBN01PRDV4RFhiN21hakU5bFhiYXRsdG0zc1dV?=
 =?utf-8?B?R2RSUkpRdUxGRU9wOVpELzFCN2xHOXcwL2ErV21kMUpXWEJ6TnRNbmF6aDFQ?=
 =?utf-8?B?WVcyMDlqZ1Z5eWtpRlVCbFVzQ25meU94YktaYThpMnlSenU0cldYdEZoSllX?=
 =?utf-8?B?aUl2am05MFp4MGVQZjdFOXNFTStPNmRQWFVqVnRoV1kvSGYxUTVkMEtrNGs3?=
 =?utf-8?B?bzJFSmxlZGE4RXFXWWNpUEdhNFFrR25CTEpRUDRJSmtaNzdsZ0JlMkhaZ0dE?=
 =?utf-8?B?U1NSSGxHWlZUTGRCb3ZndExTSzVQdkVTVFhabHlyNlZ4M0pFdElWMHdGelZz?=
 =?utf-8?B?RDg0QWJWRUlTdkFpTnc0K2xIQ0oycW85bXVNYTFkbHo4RzUwWHUzM0dKbXA3?=
 =?utf-8?B?RTFpMGRvMGZ0RDNYYW9WaDY0cUNkclpXNWgzUHpCaE1RNFJ2bXBKMFMzR2sy?=
 =?utf-8?B?cFIxVWdwdzVQUHlSOGV1NGlCVmZNOXhRbytUOHVMd2pGS2RDdmIxdGtzQ1Nw?=
 =?utf-8?B?VU1GenlFby84RXFmRytxNDZydWtzWWZpTXNjc0ZHdXptbVIxV2tqZUxzUCts?=
 =?utf-8?B?OUpXNU8wdnBoV1hwMHJJV3RLUmFNS2FyeDg2M0NEKzlrYTZacGtnSVpuK0Ns?=
 =?utf-8?B?Y3lGQXQ4a2owenQ3OEwwTlgrQ1ZtWXBES2twRmJjcHBnV05FUE56cjRRcDhI?=
 =?utf-8?B?YUR4QWU2ZjBBTUJ3WlVNMkVuSk1RWXRtb3VkSXRaTW5qSVFMNXJpaldERVp6?=
 =?utf-8?B?REdlcEdSS2dXT3JycEdvWXBLdXE5Qkh5RExSQ2hUYnFOMFFITWdKL3BMYjhT?=
 =?utf-8?B?WThueWlrYVE0TlJDdzRxeXVNb2J6NUFTVEk3UW9hTldWVjZOeDN0bmlzc250?=
 =?utf-8?B?SW0rL1p1TVJrSjRuNmhQV3dGS3creDZhbmc1cHpqeXJuNnpmTWR1YndJUUZM?=
 =?utf-8?B?Z0xQN1BCQTVQVktRdUFCQ04xYUY1VUJybStPaTRIcEZSbHdVdU5aUDRlMXo3?=
 =?utf-8?B?RitCVXNJSXUvL3h3SjQ4Y1d1eGROdEJpdXhFcGFnb1JjcWpOVzl5N0JCTldr?=
 =?utf-8?B?aUVuWmJYUU9QY2JaZWZoMnYxYlZ6UUtPazQ3eUNzbWJCNGliMUs2bnJGa2Vi?=
 =?utf-8?B?ekwxbkp2WmhLcjFrUGFHdWdjd0lELzlHV21rdlU3SjV5U01ma011M2NUdkhy?=
 =?utf-8?B?WXM1YTJaUlVoMlVCelg4NGw0dkx2eTRRTFBNK1krN0N5TDU0U09kUjVIS3NZ?=
 =?utf-8?B?clpQZjF5U0pabG8reGV4aW1idlBySTVGTjZQbXF2R1JOeGpMOWdMUWs0MG81?=
 =?utf-8?B?b3pDNGxZQndKS3dhYmM0S0g4SlFQVXFYb1VPSFNZb0Jkck9HVWs5b29HREZv?=
 =?utf-8?B?Q2huL2syblJodVRvbCtSYmhzMmlxZWdlZDBuc3ZRU1ZpTExsOUtsR3huY1h0?=
 =?utf-8?B?ZjRQWDUzWVpZQjVlQ1RYSEY4OGwrcWR0RitHKzRXRzBvRW9jNThxVFJGT3VO?=
 =?utf-8?B?cXVyYUE2cTZubjl5bE5aV2F6RWtVL2g3K01aOHNQUnNCOUNDVUpLL0k5VUVz?=
 =?utf-8?B?WGlJeW5UR2N1NkhoSUVmejhsRmVIVjl0WVFXN1ZMS210WFZNTnMzR2R1cDZ2?=
 =?utf-8?B?ZnhiUjd1d0NJNnplTlY0dEtRV3ZJRTFhVEh3L0FsOEE1TzB1MU5lVEN4Rkt5?=
 =?utf-8?B?Ykh1R1lRbWp3PT0=?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(36860700013)(376014)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 09:36:03.8609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85070e89-43d1-4e98-c51a-08dd18fe10c7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9313
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_013611_568714_F6B118B8 
X-CRM114-Status: GOOD (  16.02  )
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

On 12/4/24 15:20, Mark Brown wrote:
> Now that fixes for all the known issues with SME have been applied
> remove the BROKEN dependency from it so it's generally available again.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 100570a048c5e8892c0112704f9ca74c4fc55b27..7e3182dd6fa0dadd961c352f88484cff0e520eaa 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2270,7 +2270,6 @@ config ARM64_SME
>  	bool "ARM Scalable Matrix Extension support"
>  	default y
>  	depends on ARM64_SVE
> -	depends on BROKEN
>  	help
>  	  The Scalable Matrix Extension (SME) is an extension to the AArch64
>  	  execution state which utilises a substantial subset of the SVE
> 

FYI, I gave this series a try with the emulator and GDB's SME/SVE testsuite and
it still looks good from userspace's perspective.

Tested-By: Luis Machado <luis.machado@arm.com>

