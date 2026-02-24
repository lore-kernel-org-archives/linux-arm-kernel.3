Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74D3E9B24E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 11:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9U2uhS+Jj6xgnLzZZ5XfksjOwXHumywde/9+Az0HyUg=; b=1QrRZSQm5kUfrWGYzwjQQ9WqSS
	l0oAkg2DA51AHkYV/NvWd6CSYdTqyz3z90+od9trAeUn4ZmVVWEO5mZDvJZKCUtMAUfD0GZriGxlQ
	mTp1o0xEf6rWdg3OEaLFoVz3/Da/q+Mi8B1vOQNu0WwpwVSH+MWOtK4Gh7Wy2NWvCdcsiKFrTjuld
	0qsMaBEsmp9kNt4N7bktWvr1V9cA+5FH62qoLka5tE8MxFOorgrX9H28ktAXn2tgXP0YCi71MZVGW
	DHQjc0a98sWDC74FDFANn34jWM7WuRBt1TQmdq1bPsJaJyGpHvUOt7raZrnxFD5uj/UrMmdkR/Boc
	W1PpXGWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqQ4-00000001xWP-0PnL;
	Tue, 24 Feb 2026 11:17:36 +0000
Received: from mail-francesouthazon11011069.outbound.protection.outlook.com ([40.107.130.69] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqPz-00000001xVx-2uog
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 11:17:35 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=x2DCSGrdCk789rZgj7oFNAGCt9yxXGSLjYmF9DgdA9dbGbVJ8w5mmpSwU6Z2Orm57PgzoO7+gGn5C+vrrRNgQqchf40xELgDmCV8TeXIuI0wXX8LYR82fbLgS4bms4Zl+KMbtgi8nkURG5q4CRLk0QgkjXCLwjhHFjYA0LjW5hnHIaXE3EmLQ9v5BSFW3JWXcxoiALtn3Px7X1bCuuPei+f3KXZTXK6RQVEIt0IIvZwZjkZSjcCvTWs1AXg0ZvXeQ3GOM+xAUtALXWQ63jqR4AM48AU1KuO6BioPVL96BuhPiTT8J71LMWx7KEoro/D0B/OseMN4R/1gIZNlsGKjSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9U2uhS+Jj6xgnLzZZ5XfksjOwXHumywde/9+Az0HyUg=;
 b=JzxaplB1KV2OvHcTZcTpR9RIi9ufZwd1hsU4xkTZAoaH4z0kI5IvjsYVfKsPeOOLb6AVJ8u3D6YAPDAyhUEYTD7FZaT3gPiKc6vRFxOFQlew1g3ocq1CJ+/4CVy9lgQTVkrT84+iNjXaBec/qFJTtCnSVt5odCVqJiuyQ7p6onVpxWIP6q91S9MxCiO0p+bZDK71GANarCjgTCWmtJxD5PebkwYGcsCmF6PcR/Wz9haPg7VotJSXi/RlB6gWZn9vA0ilMCPEjYOvhFYGYZpMSkxVPtPIJh9bP/fO7ju0xbx4ziMFmso2StlNTNQTo729471/XSKURba7fF6BO43Dfg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9U2uhS+Jj6xgnLzZZ5XfksjOwXHumywde/9+Az0HyUg=;
 b=dithQZAqTTd7v8t0sEXle07Jzayllng9DY6+nQXSzBp/qqBriZJAxeaqvjZaIChdCSouo7138EkbrWPcLcT/+WbmAPn8W/dtRNPKKs5zUE2VAmjCXjzqRL02LXK8dxpe6+xnKGJEIWv6ArTGXDk/fuvOCEazhb2BbUVBYhqEik4=
Received: from AM6P192CA0032.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::45)
 by AS2PR08MB9426.eurprd08.prod.outlook.com (2603:10a6:20b:5ea::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 11:17:20 +0000
Received: from AMS0EPF00000198.eurprd05.prod.outlook.com
 (2603:10a6:209:83:cafe::b0) by AM6P192CA0032.outlook.office365.com
 (2603:10a6:209:83::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Tue,
 24 Feb 2026 11:17:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000198.mail.protection.outlook.com (10.167.16.244) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Tue, 24 Feb 2026 11:17:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LExdtRDwYuFQ6z+cEXN19PntM+SGF84f1HSlkWiK1XK0bOobVhKIfGdch8Ib7feccjNivq340YWThTacVGFQcgJSJssspp2TDyXn6HR//NBVVmaEuMd3T2MdvN7j/ioyrin8xyyH8Pcr1YK79rOCnbVAA3FcUWdOR++HK64+G0pH4qwBt1WSLvZH5V2z7sCLq86Y45o782TDqjxViln+XDzHGFPQHtkznwtxruimyAH+gk62V7KhPI3JO2erBdp44cwau1OK3U8po1SE2SG38q6IehnjKQIUE8yxA+wx/+Dohjs+CfWF9PQEEw91//OwCKpxRQxkZ2XJWqAEXIlC2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9U2uhS+Jj6xgnLzZZ5XfksjOwXHumywde/9+Az0HyUg=;
 b=DN+L3QKIq0YjZzje6wGhvadBjD9zyi4V6SXjXw9kSZLsiVmkvdk4uQo2brxjz9oBhY+KTLluPWdS3mJ5TueDA0WhgKW+EyZSEsbKWjO5ICjDXABbms5gbHcgvF4FrwmyNfcuQ6ukBlRWhgyZsMENmnyKYERyIWG7sM208ssxubQHVnJsS/09XKlomzQER909DrHpeFSR1D1d3cHYPX46dHEWr9Lyy3aEjEzU8mQDFnSsXsbizTefzff2Y8EvzTyxoRZGWIm85eU5qghvunmmRGOQR5sMXO/EQ8f6caIEPMGBsugY1AmWNBkqynsjdyWa999MhoruiOegsL3X6jlzCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9U2uhS+Jj6xgnLzZZ5XfksjOwXHumywde/9+Az0HyUg=;
 b=dithQZAqTTd7v8t0sEXle07Jzayllng9DY6+nQXSzBp/qqBriZJAxeaqvjZaIChdCSouo7138EkbrWPcLcT/+WbmAPn8W/dtRNPKKs5zUE2VAmjCXjzqRL02LXK8dxpe6+xnKGJEIWv6ArTGXDk/fuvOCEazhb2BbUVBYhqEik4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by DB9PR08MB6633.eurprd08.prod.outlook.com (2603:10a6:10:23d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 11:16:18 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 11:16:17 +0000
Message-ID: <dc00fe4d-22b5-468a-a7b1-452304fac12c@arm.com>
Date: Tue, 24 Feb 2026 11:16:16 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] coresight: Fix device registration and
 unregistration
To: Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Mao Jinlong <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260209-arm_coresight_refactor_dev_register-v4-0-62d6042f76f7@arm.com>
 <ad38ffc4-eb0b-4430-8d5e-898a2e66977b@arm.com>
 <20260224110659.GA4184494@e132581.arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260224110659.GA4184494@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0471.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::8) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU4PR08MB11769:EE_|DB9PR08MB6633:EE_|AMS0EPF00000198:EE_|AS2PR08MB9426:EE_
X-MS-Office365-Filtering-Correlation-Id: 08e79aec-947b-4869-ad86-08de739646d1
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Z0hobjVOOTcya0l2WDRpaVlhYVNkendydnpxdHN1THh6UVVHTXNaZG1aNms3?=
 =?utf-8?B?ZlloK1RqUERFVG1iaU1Ya0ZkekpieFhONHJsSTZQL0grQWQ3Q3J1VTVNb0R1?=
 =?utf-8?B?K2NPYzg5RjEvTGQzVDYrTFpuSEJEejF1YmVaSHgxRkl5QWxWRDdhb1h2djZk?=
 =?utf-8?B?Z2RCMTMrMCtKVU9VTytRWFBwRzZudExXOWVQUEF5a3liaFZQdGZ3czlaaTZi?=
 =?utf-8?B?RWtjVFV4NDNBM3JmaE5FeHQ2eWRKVmZQRkVDZVIxQUd6amZxZFFFWU44Vnh3?=
 =?utf-8?B?RGFGT3hHM0JtZXNJVzRNVzFpT3hJRzA4QTMyRS9Vbmp3S09OcTF1djdZTDVa?=
 =?utf-8?B?WlJLaVNTT2Ixckp2Tm5yVmFBU1hJcXloVnZNRXpvYXE3RFc4RUVHb2hJNlZ0?=
 =?utf-8?B?aVR4S3FCMTVDTFRsY1FKNjNlZmdmSWNZOUx3M3d3Mm1RTUJ2VEJickJveDlB?=
 =?utf-8?B?VndNY0pMYmJEb1lPQzUrd3ZnaDFEU254Q2w0aUxidW8rTnRKR0xCdCt2MTBY?=
 =?utf-8?B?cXpvdDFQK2FuaFR6c3plRTNwejlHNSt5ZGFMa3hwemVwZzlDemk5MWNEWkRJ?=
 =?utf-8?B?K1pnRmN0NEpRVzAzR3kwbmtqZ2pHazV2aUZaSjExY3pzUUQvZGVHSGpZM1Bp?=
 =?utf-8?B?azdtRUlnU3hPemJjWXBOTFlrY1p6RVBFNmZXS3lNNHZGQ0RxeG4xYmVVYzh0?=
 =?utf-8?B?aUxDVDA2SHovNG1HMGkvcm93M3hoMkgxbTNoWVh4V2NVZlZ1SjFKOVlGaDZE?=
 =?utf-8?B?dkFSQ1BHeGdCZGpPeWtBTk1QY1M1Nzg2MVZvWjBsSGpmTExuVENwcGdsbFFI?=
 =?utf-8?B?MC85eFUzTE43ai9Rc29FMGFtZFplSG5vZUZXVGJVWlo4UXNvMVMwZmhsdExU?=
 =?utf-8?B?Y0ZEeGszYUF3eVByamVkcldQa0l1Q2FOblVnV1NESnZJN0JLOUVrb05JV3Vn?=
 =?utf-8?B?cElpTzQzTHJjOWs5enA5bzJvSWg2UVpWUklPdWFybFFSMzIwbjl0bjMrOVhX?=
 =?utf-8?B?U3orSkZ5VEtjL3ZOSDFxVkw5b3pvUnpuZDNEZ1dzQlJCTWVVclNVOTJNci9F?=
 =?utf-8?B?NU02SXZRUEIzVlpFWnlUKzV4Umo5MGZtbU1LQ0FNVFkzdXAzYVlYRHNRSmx3?=
 =?utf-8?B?UnBOaDE1Q2h3MSt1L3VWRjg4VWFKcjAyeE1GZDZCV0p3bVIyK0I0U0ZIbGFj?=
 =?utf-8?B?ejF1cGE5Zmw5bnV3TmxHVXp5VTQ2L29vamFkSnBEbUsyK2xqQ0Vuc1IzZFh4?=
 =?utf-8?B?R1djK2V6SkxaOW9TdkZKcUpCbGRnZDY1anFLY1p0YVowMkc0TWNsd1ZoeXVq?=
 =?utf-8?B?Z0wrUkJ0bU52UzYyN3Z2Q2JKaWRGTkFTTUwza0dodnh5VmJMV0k0eXNLNEVk?=
 =?utf-8?B?NS9hT1NGSm9yWTg4ZFB5VVIzakNPT1M0SUJCNCtWYVJINEhOR1o3RzJiU1l2?=
 =?utf-8?B?YjYrb1p5b01uRXY0WnhtM1RRUjI0d0EwTGhZY29hOHJzU0hnZ3JEWnlXUzU2?=
 =?utf-8?B?ckQwSnluRFIwUnBpYzFnVjNZTEY2eUUvTlFRZW4zaGIvSUVZTEcvNU1GcmxM?=
 =?utf-8?B?ZW5MM2R3T1Ivc1VUOHFpQkVLVmtDYVpFa3lrYjdWek1FZW40SGx4bzFQU0l4?=
 =?utf-8?B?UlF2eWZiRkR1TjJ0S2FsczBPdWwwdmlSQzZJTW0rRnl5NDhISEp3TVhlMHR3?=
 =?utf-8?B?WVNkNHBxaUU1RVpGYWhXNGFNU0REWkFlZi9hVUFFbzBmQXlHMFQzay9pK2pJ?=
 =?utf-8?B?VnpqTEUrTjdmeFRwYTBnUUtEeENBUy9tYnZDSjQyQkJESXZYNkNYSmdGcmI1?=
 =?utf-8?B?ZE1TRnYyRktMNHVKUEZ4WCtlM2p3U0xHZFlDS3dtTUxhK3l1aUFmZkNCMU4v?=
 =?utf-8?B?cnZvVGs0Rm5MUWlpYU92d1JsckZ4T2x3T2tTMjJHVmZXc0o0VllyTDlvbUwy?=
 =?utf-8?B?bzBYSmV1T2NPV1NEckVVNkZNV09zcm10RTZ2WGU5SUdBQjRsQ2l3T2VRMFFI?=
 =?utf-8?B?bkdjbXNXSWZLc0IyZFZwQ0dWQ1M2MkNDNFVoa3RhVi9pSkhUNmcvVTJHR0FR?=
 =?utf-8?B?UWdkelhFdEh6eUJNVUEyWVE1WW5ObXNIVm5yVG5lOXdpenRUdHpaeE8vSm9S?=
 =?utf-8?Q?zEB99y6zVQ5jmcsJ34FDSL/bH?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11769.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6633
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e0e555bc-4410-441e-b84b-08de73962129
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|35042699022|36860700013|14060799003|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjZPYStOYjkzbEdZTnRyclRpYkZwbi9FT044U2s3Zzc1bUdaWURsd2xsWEFR?=
 =?utf-8?B?T1RidG5kZ1dLcVdESnoxRjdKRHNMYlE0QVAwREhLc2hReHZLMEZOQnpNVnlF?=
 =?utf-8?B?Ull4R2h0QzBEVTltc2ZiWG9WSk9HNW4yUnhnZWJQMXUvS1FhZit5SWlPUmRR?=
 =?utf-8?B?LzZRRVFrTlR5UmpNbjBwOVl4QlZ0QUl0WFNUbzMyQWdCalFjcWx3RG9CNzFC?=
 =?utf-8?B?SUJwMVYyeHlmbWtxSG5GRUVFdndaUFJKN0hnSHRRcmw1ZzMyL0Q2WHhNMlFs?=
 =?utf-8?B?L0J0V0hEVEQ2aXdXSC8xVzVKQ0M0cDg0eUFEZEM1QkZhcDVlR0NkSStXcXlz?=
 =?utf-8?B?OVR3OC9xQzZmWVFrKzRBRHJySW13NUdsVzFtREpuSnJUQk8rWndscDhFbkll?=
 =?utf-8?B?S1FQWElsNFZSZC9QUW4xTm9vMnhoRUs2S2dua0RnM3o5czNKL3JsN3Urc3ZO?=
 =?utf-8?B?WERSM0l5R3cvaXpSYUwwSmtrd0JWaEQ0N04xb25HZklWQytFVGJmQi9JR21u?=
 =?utf-8?B?TWxuUFczZEdVVXQ2cjY3UTRTdmF0aWllYVd1bVZNWW5Tb1VMdWhDTGJFdVRh?=
 =?utf-8?B?WldQODhRbUdnY3IzL1ExSnE4MmNjTUpzNHFKZE1jWnVabWdHZXNrT1JzZ0pI?=
 =?utf-8?B?T04vVnpsZGg5NFU1TitaTHBZYnpUOUlkbEtRZzFBOTg5NlBONHhHenYzeDBs?=
 =?utf-8?B?OER6dzBTQmcyWngvMjFPdlRDRFZ1NTBiZC9xUWRIUDZia2NYN1BMbUo1WWlZ?=
 =?utf-8?B?K2p5aGl6RnJpdS9XYmExeEtrbXlVeHdVRG9VVUlTQkx0THkvT1JRZlBKMG8r?=
 =?utf-8?B?NmllNisrcUFOYWZ1bkM4ckgxSGdZRVFRR0g1R0dyRkxTRGdLdVlISmRhdUpN?=
 =?utf-8?B?MC9TVWlyQ2hmTExsajFHTWdIMkQ1WnFLcWpUZ3NpN3JobkpZeU5zc3ROemQw?=
 =?utf-8?B?bDZaY1NWTTdDaG5tdUJmWG5Jcnh0RU9zcThUMldMdmFVdEpCS1VZUS9TYUN0?=
 =?utf-8?B?VnRnSUdYb3N3TEl5RDZ6QityNFRkV0VvaFZJUHFJY1FNR0h6Q2luOWVYV3pE?=
 =?utf-8?B?VXZHMXp1ak5IR1JhMEpaNS9iUHdRMUtpUGhyRUJJSGhJeDdaVURMbFZ5SnhR?=
 =?utf-8?B?K3RWVldYa2lEYWhLMFhWbUZwK0NGUUxMN0JUaHMydnR2RmI0akh5RE95MENl?=
 =?utf-8?B?Rm5JM0NKVUZhQWlITVljdXM5ekljRmZId3BBdFZpS3VVWVdPUmJTWU44aEl3?=
 =?utf-8?B?MjJ6Y3c5Vlc0UW9RUkEwNzhZVEhlZmJtRitkT1BZN2tTWGZaWmRwSzdxM2xL?=
 =?utf-8?B?RHk2YkpGQXIvalY5QjFIaFFvRGEvay9VZmdYamhKVFlVVit5elIrU2EzbXQ2?=
 =?utf-8?B?V1Y2dWJKMWl6THNrMW1SNHRzYnFvNS95cjZxNWVRblJxTVBkVEdBaUZSUkZa?=
 =?utf-8?B?YVBMK05CbGRXK2JXUFN6T1pRa1ZvNVdxTXg3L3krSlZqdTNYckZZcS9NWGR3?=
 =?utf-8?B?elN0bjNpdzVxUGtVU3drV1R5d2FNbnZhbWRYZzF2U3IwOEQ4ajFxZVRZSUsr?=
 =?utf-8?B?MS9FTW80NHB4OWlWSzRUWFRuVTlyTS9jUjVJcmZMekVDeW1lMjQyWU12WlFm?=
 =?utf-8?B?SklyamFqZWZBYTk4MHJPVTcyd2M4QnNialIvdHpSb3dSaVJtdFdnVHQrd3l5?=
 =?utf-8?B?MTBsZ0RBbkFrZVh2ZDYrMktvd0dtTmFCeXZjTzNCSFlSUE9OSU01bllJVHNq?=
 =?utf-8?B?NDBDZDh4ajRLN3U4WE42NlpSL3ZuMThQQ29kVHhwbk05em54MkhCT2hzc0Zz?=
 =?utf-8?B?NnRnUHliWVNLa3c5dnJkeFZLdkZMcnVtTDdmS2pPcmh0Z2YrbE05aUMvZGFy?=
 =?utf-8?B?d2tnTWhiajJNV2EzTjR4dzEwMVJhRDUwRFFCcHBRQjErdU1maG9xNG1KL2ln?=
 =?utf-8?B?OWxaUkt0VmwxNGlKYmlFd0dtSDFVQ3VTaEE1THloSnZVNFRYcFlYSVZjdW9W?=
 =?utf-8?B?azdxK2YyTER6cnZHa2tZK0Q0dUh0d2FZUTJsTlhTdlBsVGdBSStGUlA5N1BI?=
 =?utf-8?B?eDU0cWNQMFpzMSt2VlRsY0t0T2Y2bitqbjIzSDJwVVN6UmlUSW9lWFJFK29u?=
 =?utf-8?B?Vi8wVTdJTVRFb0tRMWh2ajYrcDk1ZzRvbW5vTTZ0ZWhuZUhzRWU3YTdNcGdM?=
 =?utf-8?B?azJnaUpkVzdmOVRxajVxcEVBRE9oN25Ea3A0U2h0ekJuYVBkZW54cVYyd2p0?=
 =?utf-8?B?MUpzaElCd2lzMFRnSXJ3bHBZVGtnPT0=?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(35042699022)(36860700013)(14060799003)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: znH2p0jXfcjL0+kBM+ErUsBpKZ/1L7Efx7r3ihfOyV/xikbvitpndbVV+aoKAavI+7QYxUUulywgPWJKh1tybYUVRDsRPQHJz8/4DVdUMoEjCRoc9S682/oYOYed7m8ubhd8BFtR79r+VpDgn7KGnTbymj77e2ghuMOm+F21nqMcKlRV+iUbiVxOGaQKvUV3NNfXjwihNIcgKMOhkWhvOFF3lIVolKilLBZgIQS9bkok6uiV4qSpQK3mfWMIxEpljuiGUIFrR5Pk7NrEz1z386IFaWCfbTVJihDdAsFlINNz0B/zX102OJjneMQpSJtUtPVnA+O0N8JNQqO/8XYn2Qo3TqtT64KnzMhiQ7S7cxySRUxE46jZdVaiZbRVAcjShp6qFq7huMvNWppIIVlxonr707NcpL/nTmqBXLhGoIN4mm/8POTZwpO2CQXP5XJE
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 11:17:20.2681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e79aec-947b-4869-ad86-08de739646d1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9426
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_031731_984044_D1FB4DA3 
X-CRM114-Status: GOOD (  10.14  )
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

On 24/02/2026 11:06, Leo Yan wrote:
> On Mon, Feb 23, 2026 at 01:28:03PM +0000, Suzuki K Poulose wrote:
> 
> [...]
> 
>> [  827.216924]  Possible unsafe locking scenario:
>> [  827.216924]
>> [  827.222849]        CPU0                    CPU1
>> [  827.227380]        ----                    ----
>> [  827.231912]   lock(coresight_mutex);
>> [  827.235491]                                lock(ect_mutex);
>> [  827.241073]                                lock(coresight_mutex);
>> [  827.247176]   lock(ect_mutex);
>> [  827.250233]
>> [  827.250233]  *** DEADLOCK ***
> 
> Thanks for the test, Suzuki.
> 
> I have sent a refactor patch to dismiss locking chain:
> https://lore.kernel.org/linux-arm-kernel/20260224-arm_coresight_refactor_cti_resource_release-v1-1-ff1b2bca9176@arm.com/T/#u
> 
> For recording, I enabled the following configs to reproduce the lockdep
> report:
> 

Thanks for the patch, I can confirm that it fixes the problem and is
indeed a good cleanup. Hacking the device release operation wasn't
really a good idea.

Cheers
Suzuki



>    CONFIG_LOCKUP_DETECTOR
>    CONFIG_PROVE_LOCKING
> 
> Thanks,
> Leo


