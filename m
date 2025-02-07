Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C12DC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 19:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aipSqgLpoDnEPQysiAsIkB3yfOtvsCXrv8LkMUaF/OA=; b=dmS4VSP+foQBHJRv2RFy0IhGWo
	TcRVFWvVsnszt7ffPTnIo1ZuTY7SCffn2LAD7XtEHBl1lIiWpw/a/RvBwU/LBLG/W5cfEf0mzK06w
	dv/GnQ7mwelRtvh2IlJWfdcLTcRLh+89oMPAS5nSCiCpNlzUW+d46Z5QJuM9iHbJsZ3yVrE9l2jQH
	3HtN82KhwuB/bCjRw/YmClgPGGRRTGalkGBnL5xQZsyRGnNYO3YKir3vYSBPOMVtoaOnhj0rodNNf
	5OJjUupSwtoYdt77g8J45NE0smLxLK/ilcHMMGImb+NggVuA9unUBRUobgLNDYm8MBBowTNa8BQJf
	pLhhmWuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTyP-0000000AtXo-30Kh;
	Fri, 07 Feb 2025 19:25:09 +0000
Received: from mail-am6eur05on20608.outbound.protection.outlook.com ([2a01:111:f403:2612::608] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTx0-0000000AtE1-3Bj2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 19:23:44 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TWi7dpT4Jq9SSTiGqBnB4XDZ+XmzN+d+NFC/x1Y5te3sZ2sq1tT0b2fJApmAvg6zedhQFInzTlJNkdY39NyI6cyaG6n4pnPL53X78lWztT3j23HNQ6aNB9PXjWM55SLiHqfAz0cjbT+uTlUm3PXRKtx/34w6hvTsTiMRTVIafD35TPVyEThewK0A4gk5Un0Gja35qZ1+Qb8RgNHFJFYar3QciUxP6DKPeEzu9Rg0HOGc/+IBBfE0DImyrZcHDakc4swTPXiVgkx+5fdRC2x7lg2wS4Tz2L3Ux6BcJKBtH3sI/BBxJnXJ7SYAn80ukT6vUV1JUFFqWT4nsxMoJ/cl/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aipSqgLpoDnEPQysiAsIkB3yfOtvsCXrv8LkMUaF/OA=;
 b=GdjQUO8YQyXfWxpB7U2NQ44CMrpFwFQJWmtwo9cUZ+cpTycNcZJ4spYYbubJGVU5xGZRfIMFGuKyIOXMZtS3zbpJdzbhks8Pivq21PLSEHl3IfsJuqyxzdCgcZFqzD6lJC65YDIg8N5ViHipe/KEZj43mimB/pm43qlVGxRFoE+mi8UuorMQ3teeGa2Uiw5FVYQbPiMMfjNKiIUrriT/jC/TivNpSDC7ALPm3RolA4iBzR8jt4pgOX4PjC5nyPk9VF8b0pDMyAa/Y2IR3fYnKTTLqJMhDQgSf3Y6IBW4XxAwX7uGP//jJh4S0Ji9ehLnqijXl9QQ5JDyf0D8bnoMAw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aipSqgLpoDnEPQysiAsIkB3yfOtvsCXrv8LkMUaF/OA=;
 b=Pkzu+YS2wKlXLGWc/spq+KkLPUu9dzZnpNmSUOJdAWY9LnucFvS0v2oJh0FHz0pXMXlerfPnSAjR5YJXFadhsYxQkS38TsC/iKaJ/Wj+8PqsTdt/vWIZJ43ev37VhkksJgAM3Xcwbyy/RogfVCBpB+eyRDUQvIlYkhdeOgpazMY=
Received: from CWLP265CA0505.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18b::14)
 by DBAPR08MB5719.eurprd08.prod.outlook.com (2603:10a6:10:1a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 19:23:36 +0000
Received: from AMS0EPF0000019A.eurprd05.prod.outlook.com
 (2603:10a6:400:18b:cafe::55) by CWLP265CA0505.outlook.office365.com
 (2603:10a6:400:18b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.30 via Frontend Transport; Fri,
 7 Feb 2025 19:23:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019A.mail.protection.outlook.com (10.167.16.246) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Fri, 7 Feb 2025 19:23:35 +0000
Received: ("Tessian outbound c79bb2535b53:v567"); Fri, 07 Feb 2025 19:23:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1fe9282f02dec424
X-TessianGatewayMetadata: 6ZFWwtMxPats07uXs2Jlpe/t2p8z61JyJgJ0auCJmvHHluNGCl2HGGLEvl7ySz5HQg5DziM80bzSYROt0tw/DpJHNWg2byQKPITvoe1RX76ZrJiPndgU532eUPcThL9GjOFlJz+XYRQwnyJBXae0ZwZze6tXN/Vo0erYWisN8Do=
X-CR-MTA-TID: 64aa7808
Received: from L7dae6bd2ee6b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DD93DFF3-9155-4AA0-ADC0-642EB00ACE57.1;
	Fri, 07 Feb 2025 19:23:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L7dae6bd2ee6b.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 07 Feb 2025 19:23:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBX1n+ZtW82DpBOAnLmh1dXkIYs7KvrB67jPcJFLMh1Opj4S+T1pPr56eDFcuZpwipOmoS317NWx1G61lVYw2+/KljK3RXtZoVnafhPFAyM9JwZ7fQ/83/nt477llMKEoVFJmGS0clfFC6Dd2JdetU10I3s43mBy7YOHca+IXRGGb8r6HNATfsY6VrIC+0pIwDfxRpdPkUClS0yat4asq0BUu1ftMi1/kN2AMj/zgMANXolhh4/TjWHH116BDx26T2zZTSwO7jH2prrQf7YbgajrxjQvUKfHtwqllVqxihiJYXoD37O1VP0W3q7HA4XdbNZ+nABlX2u0B5Dd2eij6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aipSqgLpoDnEPQysiAsIkB3yfOtvsCXrv8LkMUaF/OA=;
 b=BjAN/p/cErzRqCMlYY+qZ/7q/Cv1/T4J0Ix7IActhMa1Hgto/nc/lhqcIjv0pHSW2JKwomBwI0I34S1GEIvboqQd4n8Am00iEMrc3RPMlfi7bF9ZDUzr2ycCbqf/TAB0ERrJw/JSoC1jfQzQbyRxWqsjo7xwN9s1KLCbQgBc3GP6n0vvrxDI4NYZX97K8uXeb26iUNe8BOet6g4TVixLITtKB8EYv+x7VX3LSeP172Nq1eZ77aG5yEGF/3oKVKwIM26nt570z3GoNgYhFN5Gy3pkN16gdWfVn03ZVnEHdBspMRu+GOQlUHT87/dYWw6OQeng/yGE84jsfhcADUkOLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aipSqgLpoDnEPQysiAsIkB3yfOtvsCXrv8LkMUaF/OA=;
 b=Pkzu+YS2wKlXLGWc/spq+KkLPUu9dzZnpNmSUOJdAWY9LnucFvS0v2oJh0FHz0pXMXlerfPnSAjR5YJXFadhsYxQkS38TsC/iKaJ/Wj+8PqsTdt/vWIZJ43ev37VhkksJgAM3Xcwbyy/RogfVCBpB+eyRDUQvIlYkhdeOgpazMY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB7584.eurprd08.prod.outlook.com (2603:10a6:10:308::6)
 by PAXPR08MB7442.eurprd08.prod.outlook.com (2603:10a6:102:2b8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 19:23:22 +0000
Received: from DB9PR08MB7584.eurprd08.prod.outlook.com
 ([fe80::5144:343:7017:bacb]) by DB9PR08MB7584.eurprd08.prod.outlook.com
 ([fe80::5144:343:7017:bacb%5]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 19:23:22 +0000
Message-ID: <b4302bc7-f2c2-4105-a39e-57a60aa242ff@arm.com>
Date: Fri, 7 Feb 2025 19:23:19 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] A mechanism for efficient support for per-function
 metrics
To: James Clark <james.clark@linaro.org>
Cc: ben.gainey@arm.com, deepak.surti@arm.com, ak@linux.intel.com,
 will@kernel.org, james.clark@arm.com, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 adrian.hunter@intel.com, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 namhyung@kernel.org, irogers@google.com
References: <20250106120156.227273-1-mark.barnett@arm.com>
 <ca8de228-68c2-4b2c-bb58-30f275afc49e@linaro.org>
Content-Language: en-US
From: Mark Barnett <mark.barnett@arm.com>
In-Reply-To: <ca8de228-68c2-4b2c-bb58-30f275afc49e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0238.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::11) To DB9PR08MB7584.eurprd08.prod.outlook.com
 (2603:10a6:10:308::6)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DB9PR08MB7584:EE_|PAXPR08MB7442:EE_|AMS0EPF0000019A:EE_|DBAPR08MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fdaf4f7-d8df-43ef-a23e-08dd47aceafc
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Qno3Q0U4QWVrZUlhRm5WSElpV2RobzBMTHplY0FkZllkWjZBNEpvYTg3d0No?=
 =?utf-8?B?d1o2WHZlMytQWm5rZmpVNzV6MDJURFVNY0ZvNHVIK2JtRmJpOW9ESGwxQzFR?=
 =?utf-8?B?MWl1SWlvVXJpcjdWY0lhNGNJbXhKNlg5K0NYMko4WGpnaDhMT0wzSTlvbGZN?=
 =?utf-8?B?N1dTTmpoUnRZOE96bmRwc2RleUYwL3MvOGJsMmFwYmVocWZnSXRRK2k0amZs?=
 =?utf-8?B?YWozWlFheU5jeFNvRk0zTDBaRkVJaFV3ZUQ4bGo3ektXVlJ1OGxIQ2JkaTh5?=
 =?utf-8?B?K25RbmpEZVpqMzY5cVlrTUNRYlpzV3h0RDVuT2s5QXAvWnBRd3FsWU85WThD?=
 =?utf-8?B?RTlRNWs4WlBYNEpJdFQvT1NtOU1MRWJIYmJGTnVGekxFdTkzZzBwYkVuT2pQ?=
 =?utf-8?B?L2p1Z0hQSEpaU1RGYjZFeFFUQWxqVXh1ZUwrcVJ2aTVRQ09mdGZ2ejR0Y0hV?=
 =?utf-8?B?Q0U1cUw3S0JzYUw1am8vb2U3NklxL3BoRVQ3ZUFQRTVuYitQTmw1R1c2UW1p?=
 =?utf-8?B?VFp6MElPQjRzVDVvYVU4UVY0aWRYVUJsRHJGdFlFUlBoK1FCSC8reFh4eFVG?=
 =?utf-8?B?am1IRkRYR1ltSm9ONVpDQlQvSXVBUVBmL0NDZVVlRWFZNkNpa1hub1pUM2lr?=
 =?utf-8?B?dnRqcUdmQkJ1KzQ0RWh2VGNVL00xMHZZUkFHS0NSU0ZjTnNOYTlLbWNEbFY0?=
 =?utf-8?B?aS9KUU9oblJkL3NSMVErWmhlUFo2d3VhdkxUMGt5WnpMaTBpeHFqcFAxZTg4?=
 =?utf-8?B?OVJnVWhaSHEvNjJ2cG12bGlUNkY1cUJPUStKTDFETGxEM3JzN0l3SDZ4ckY0?=
 =?utf-8?B?dEY0cHdxd2VKd29acHErYkNFWE5maUIzd0lLbXhjTjlGc256ZWR1eW5ob2VB?=
 =?utf-8?B?K2MzNU90M0FTaXZxb2UzUUNwUUZrUi8zYkJ4MjM5eU5xYWhXdTFZR21YNGl2?=
 =?utf-8?B?di9od3lmMWhLbkx5QVl3YUdtUlloV21wbEc5dE02dUhhLzhaWC8rWEZTTmJa?=
 =?utf-8?B?bDdDS1Z2WlNLMUdGclZjM1NVekdtMzQybjE5aDBMLytaTnNPY0NjWDZrbmU1?=
 =?utf-8?B?S0d3WEI0VkJmaW56d1d0c1RUa3V3Vk1xSFpFVlB1VkNyS2xuVUdhSERwcnpa?=
 =?utf-8?B?ZGxYQldUaStjZFgyL3lJc2l2clViTG82anIrMHBCR2lZQmpTUXo2ekNWZTVK?=
 =?utf-8?B?QWE4VHZXOUpxNlpBWHBjZHRyTDNWR0ZMa21aZW44UE9SZTVMN2hQSHJmaHpM?=
 =?utf-8?B?TjVTL1VSUlhTK01KTjBhcUVSUHZvL1l2cXAyUUovdG5TZUZRUmhEOFcranE3?=
 =?utf-8?B?WmtSKytROVF2UzgvUGJScnZKbW5Xa3A5OWs1ek5ZNzNmZmxCd21MOS9hbzNw?=
 =?utf-8?B?aWxUTnRJZU1COUdhcFZITlpKS0V5Ym9GbXJwemsrMUloamowbWJIOENlVFBv?=
 =?utf-8?B?U0RrMENyRGZaSFBadlJEUDdsOFdaQTBVdDJVZnBjdHIvVnpBb2JyZW8vUUlN?=
 =?utf-8?B?M0FGL3g1Y0laYURPQkdkM3dSckNkSnJVWmNwejFUalQwRlJZVk14V2VibFhl?=
 =?utf-8?B?M0IrQVBSTm5WVWdBN3ZvS2Q1WVBhVTJmVUl1Nk9FSnFBcm9TRDRSaEFtMEtR?=
 =?utf-8?B?dkVlMm5ScXI3YVF2Z0ZEazdKVUpqKy9JWkxBZDc1S3F5NHRWUUJ0cGtFdWhE?=
 =?utf-8?B?bTJBVEcwTys3Z3gvK3RXeUJVbU5xRnNCS2d5UVI2d0dsQUNkb2Jwemw1Zlhi?=
 =?utf-8?B?NG5zZVV6K0laalZDTS9xeHFDQklWTlpZeHB5Tks3YXhyRFJ3dVRFSEk2Mjla?=
 =?utf-8?B?R2VTUTNDRnRLSnByakFnUDVWZjExekJ4V0UxZlJreHpTdDMwM3B4cUUwSFAw?=
 =?utf-8?Q?hg01URj39EYvh?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7584.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7442
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:308::6];domain=DB9PR08MB7584.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 14c3fc49-cef2-4de1-8a85-08dd47ace302
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|1800799024|376014|82310400026|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlVSSUN1Y0dWamliay9nQ3RVY0YwNGpZUlZOTGI0K2p4STk5TkU1MTY5U0I1?=
 =?utf-8?B?akhkbm80VXFLU3R6UFdVVmtyK1RqcFQwcFp4U0hpWDd5OVRZNERwNmZQSGt6?=
 =?utf-8?B?dU0yVWROYTg0N2c0UEtUMkVka2lERjYxWml3UTVSekJmOVN2SWRJT3loZlY0?=
 =?utf-8?B?dFlVUk5TdDlBcmg1bUVUQVdpcmJRckYxcE1kY3FlYjhlSnEwcUlxWFRWYnp2?=
 =?utf-8?B?cnloWGlHOUpiZk1uWTk0Wm1DUld5RVR2cExCd3p6VzgxbmVvRnJ1SEtOeWNF?=
 =?utf-8?B?L3NBemdoNkxqOWg2aFhTODd0c1dzWHlLaVpIeGtpTFFBUm42cmlqOEl6MnNU?=
 =?utf-8?B?R2duRFBUejV5YzRyaDFWREN5RWJXV2JUQ1RNQmJLOU5KVW1DUVhtZWkxd3BQ?=
 =?utf-8?B?WVlmcjltUVl6QjZEVWZYVnFKUGJVc05CUVdROUlTL2QrTEowSHFaYWhrQWtP?=
 =?utf-8?B?SEswNGUvdC94T1FjK2dVODFKMjBwWTRTOHFZdHV4bDF2QmM2QStWemRrbTRn?=
 =?utf-8?B?alJUbExscml6MGc4VHZsczNTLytYRG5iMm9TeUhEQy8wUHlneW10aXdTcEVV?=
 =?utf-8?B?UnZhRlBoVXBIWXdGMmsxeUlMZ09uSFdyMnppR1Q5TlZ4L1c4Y2lHTzJRRUpH?=
 =?utf-8?B?NnFmT3lQb1plTjNlMTQ3cVJpSHRYblpDWnViWHRQOVk0NitUWDhNYUtOK2JK?=
 =?utf-8?B?Qmhnem0vaEdIQU5oMmdGbTMxQld0dnhRYmxvUnUycUZzTTl0bGk2M3VIaUFi?=
 =?utf-8?B?aE1KMWtNU29WbUhFWFVPT0wxcmdlU0VJM0hHd29NeEFKb0Z3bm4raXVtQ2sr?=
 =?utf-8?B?QlM5bHF4K3dodjFheXBjays5UjZDU2NkdzlaejgzM1R1cnI1azZOZ1RZK0cz?=
 =?utf-8?B?QkQ4WUFwU2xUWWdrRk9EMmo5NlRaeEJKQWxtSW02T0JUZ1BuckgxSVFURUZF?=
 =?utf-8?B?eW1KdlpqVDlzWkFtRExkdXdZRW5rYjQyZS9qaUQzaENDSEYrV0g0ODcvcWdQ?=
 =?utf-8?B?Y2c3MllaNHh3VjhUdmVaOHIwY3EzcCtwTERNR2J5VUQ2eGdXaFdVMjdwUnMw?=
 =?utf-8?B?cXF1ZVNtTWFaZ3F4bHYwRnp1NU1Jc0tyN0pMckpNMFZ1dEExOGlhVW9CbnV5?=
 =?utf-8?B?TFNCa05KMGg0djlnMUw4eVRpNEVWdEFPSkpQZkk3T1hETFNhMnNFcEZPd3ZZ?=
 =?utf-8?B?d29icjRTdWh6TmNvamhxcmE2WDU5aWpKaDJNWi9VVkp3MGxBbzJTa091Mk1j?=
 =?utf-8?B?Z2RId3ZOSnFPWWlrRGpHVDRra1BXc3RzbGEwQ1hoV1kzS1J6NTFyVmE1dDg0?=
 =?utf-8?B?d0VTRnpyVFFrZkRDcmE0WVJWWGlkT3R1WFVsVyt0a0lhZDYxRTNRdW9ING5E?=
 =?utf-8?B?Z01tb2xIRlZobUhKZ3Y5MzBUaDZxcXJuVkFUcW9HcHJURWpkaHJDMCs1MnRM?=
 =?utf-8?B?RXdSam5oQ211S2dYUHNUS0hDQ2VUUjZQamMra1VSZlJ0bG5DY0NTUFBpYXd6?=
 =?utf-8?B?dTV0NlMxSFRxaDhJMnlEQ2Y1SVA4R2dJT2s2OStFcUIwbnJvWFQvL1gvY0Rj?=
 =?utf-8?B?NXZ1TkpycTNlSHpldnVUaHdMYjlEU2xDR3FKQjhId2hsUTVqelR2VlArdE8z?=
 =?utf-8?B?NnF0bUdKS243amhnS1EvaGtVWVFmYkE4a1YzcWpxdDlTbXJCV1BCTURHcDZt?=
 =?utf-8?B?TmpMeG5Mcmx2VytSQ3hzK3lFTGZiRnNlc1NycTk2K0x0a2l2RXBFdm9mazYy?=
 =?utf-8?B?S0t1RVh1d2NXSkJXY1RDcHl6VDE0blZQZjFybXFDZjJFUm9Vc2l4RjBnU29C?=
 =?utf-8?B?WDZrMFpKRzJ4bjdiaFBrbUFwejJPbktad2d4cDl1TDdrQWtmc1RsNTFFRVlz?=
 =?utf-8?B?ZFJ6TUVOMVBmNWVlM0tqNlJKL24zSTUvQXIwTXFoOEZWV2N2ZjBleEZSR3V0?=
 =?utf-8?B?c3NPd2NHNjg4ZjlKeXRwd3RId1NUelNqVWlGNmJuNHRzOGl3VlR1WnBYNzkz?=
 =?utf-8?Q?CkHs0n4SKnwpIW0VmsUjzrS96LO2hE=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(82310400026)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 19:23:35.8381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fdaf4f7-d8df-43ef-a23e-08dd47aceafc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5719
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_112342_949615_4FEECA1E 
X-CRM114-Status: GOOD (  12.76  )
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

On 1/22/25 16:47, James Clark wrote:
> 
> 
> On 06/01/2025 12:01 pm, mark.barnett@arm.com wrote:
>> From: Mark Barnett <mark.barnett@arm.com>
>>
>> This patch introduces the concept of an alternating sample rate to perf
>> core and provides the necessary basic changes in the tools to activate
>> that option.
>>
> 
> [...]
> 
>> Changes since v1:
>>   - Rebased onto perf-tools-next, as per request from Ian Rogers.
>>   - Removed unnecessary code that truncated period_left to 0 and 
>> restarted
>>     the PMU.
>>   - Renamed variables to use the shorter 'alt_period' instead of
>>     'alterantive_period'.
>>   - Added patch #5 that addresses an issue in the x86 and PowerPC 
>> drivers that
>>     caused the opposite period to be reported in the sample record.
> 
> It sounds like it would be better if patch 5 comes first otherwise the 
> feature is introduced as broken.
> 
> 

Thanks, James. I'll re-order them with the next submission.

Mark

