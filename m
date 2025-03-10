Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3812C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 16:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ACru2Fv/wc9B72VckRpeA0qj1sPWiHVQ32AE3+dcC4=; b=S9a7Z9epxN7X6acuh3vN62k/lT
	BQ0au/ZvcDdjbXLdSqzw99wHlxhXGqdlyeNJNMC5j5Mi4vimu2lOsQGoem+ghfF7FgsTl+nSrCZbS
	Y92u9dMiOwMsHYCD01Ofv4kYDiQVDlHJkeytZW7rJG7bbEsFDLbuP/Y5R3MlzNXWxtVa84XQGqpic
	G1RieGuWjIFojcNP+l55zcQomzbhlob4P8AQRXS1cQIUy7+VP4yVUNMH/jgVislcMdRQgATWz0IXo
	YFrio7vXwfvy9S+ZNYmi9hP12xmWzMBIGd3VFLNaUwD28lhVDyhVw8T3zfezZ9uiWDxwVOZQujuNi
	smHVm0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trgHi-00000003OEz-1NWC;
	Mon, 10 Mar 2025 16:47:22 +0000
Received: from mail-northeuropeazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trfzB-00000003Llz-3Mgh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 16:28:15 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qJYa2Nuw1eHiQkXdXix9YOIjqdiMxPJ3OGblMsL4bTuCf5xBVR0ciwr+nY46Jm/WDdffGfz5+zDVw9lq89ha+QzJWARiiKuehQ/XDFLzOiaKTwb4tKmmSvOcFL5MebvCtdmI/Nc2i0CSO1kg3jsNY/GVAWFmhD+/7NnliWVXgQPTsclVV7nRjKLivo8opLU1NDU/ifHWWWvkM1p1fBdB4UOEYj1JUqeVVW8X0FAhD/MESLpJXzzbz6gSzdvC47/NbRR2lAafjYlt5PQ5b29rAmiG1lg7qzjb+y6e35BWiVnBhPe9bqGxSpQFQn4CWMr+GtigzEqrOCr8mi8qfgphKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ACru2Fv/wc9B72VckRpeA0qj1sPWiHVQ32AE3+dcC4=;
 b=LACF2TKo7BxDZ7nVVO4V32DcjGETCTpQ5it2oylacAM9C+NcVcnKdKe6oTspQK2edQATjcu5UzhKZx6NfID/jV0MkJu8nQIVuy2YtOWYarRYwCHiExov0zGkzK2CG8vEAFAq2tbraXOZsFV+A0fTFmcfBCxAEyQWeHqzSqOoI3sb39gICf2USA8itznHkjMyjuMBfS5W8HQAxGdU5hL6lHMSTDIDIHBhgwo+ZdtdmvcN6rVD6xvGE970sUeeeSWybLmKxJKtWHXAnC6pY5EIDKPze2Zz1eyAWEv+VMgMHh7onF3jXEy4QtVFbrfSMyt8Yk5DXTiif66BH6AgGm42nA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ACru2Fv/wc9B72VckRpeA0qj1sPWiHVQ32AE3+dcC4=;
 b=rIsDiQL6s730IuaCRyzIrjlNRiVBcraUZbn0bszUTfqHzoDzvYdrsv4SZSd+wH2qc/LWm+aUCjiMYx+8vsUHzq0Qlq3phQFzjpljfl6mX3tc8Y8iGDNrNckJYZEpz0QMBq34xNkG1qZUIGDLLNIFGnxW/uQRkgsbVjgAJlh9gZQ=
Received: from AM0PR07CA0014.eurprd07.prod.outlook.com (2603:10a6:208:ac::27)
 by AS8PR08MB9388.eurprd08.prod.outlook.com (2603:10a6:20b:5ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 16:28:03 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:208:ac:cafe::96) by AM0PR07CA0014.outlook.office365.com
 (2603:10a6:208:ac::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20 via Frontend Transport; Mon,
 10 Mar 2025 16:28:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Mon, 10 Mar 2025 16:28:02 +0000
Received: ("Tessian outbound bc832f6acacf:v585"); Mon, 10 Mar 2025 16:28:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 43fedfe3853d5f5a
X-TessianGatewayMetadata: BR4u9AYK4DBuzZHOhTd9B2g+l9Bk+2+hCBALlANdJvnjsoqDy6C3Z6sIZEuJrDdTOJNoZTpzZ65Zl+4pVLpEN1v5YqkQRaUNfjmIbPWjQWlQLfpykEviaz7/IUO1wNWJRguzsmmSMO7RHmSlziC2VCiMswiyIpUkJ0+NgOKei84=
X-CR-MTA-TID: 64aa7808
Received: from L9e50b749c071.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 675D28DF-5710-48E6-ACF4-6228DF858684.1;
	Mon, 10 Mar 2025 16:27:51 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L9e50b749c071.3
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 10 Mar 2025 16:27:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3GummD7fbLmpo7uBvyWxvV/JV+MpS7teUcsatHFqdD+/W101H49dunexMFQ1sDNzx4jLksEwdcUQ0SjmWFbSL7if0kD0ADabH2v5/HBOid9GUoqZ/u2THSFJgvWJ1Kh7jj7j+08WibrFarmlUz3plPMkNHK39SeB8Fgu1gWEkASvFaT+twSG4Y83pOESoVN2tiNpe3H5ZPB7Cu54BGB/XB0+Q891fxTChfxoIRba00Pb1geUvpHbfa2toYskymiKZLvNurGQjiQddRt+sa/E5kZrqL/hD9e7mumu0rb6ETVo/IXQ3FrBBKB4AP/zpBhtJoo6AKeHBJUkV7Imj7NZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ACru2Fv/wc9B72VckRpeA0qj1sPWiHVQ32AE3+dcC4=;
 b=E1PeK3ntL6ffnPZxMN9dSdWPUQyCNlCbODxc8HLozpPwaEagkAmejRJUO/EtGv/89Uc5H0s/h/ke09PlFhNao59ARsNYyIhaBYp/NVSDa5vqFhqdzphoMC93sl6zYt2ciJv2Bm1qC+FbTsh1b2KWwxaAT3baplOYyLBrFGqYU1dDoklwr/LhPfjuuzMYqYX0sbvW19wqTzebQGuFWlWEOtrXYhCZuP6JEWTUzevWqvmn3pTeJrQEkhLsIErxBz709fxgxoPdEXDMCAou1ZYuqWd+FjifGyyQiWdR+9hh7a0RmVdVjdTCuig23YTOHyVsZqm41U0ter1545EaL1yfRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ACru2Fv/wc9B72VckRpeA0qj1sPWiHVQ32AE3+dcC4=;
 b=rIsDiQL6s730IuaCRyzIrjlNRiVBcraUZbn0bszUTfqHzoDzvYdrsv4SZSd+wH2qc/LWm+aUCjiMYx+8vsUHzq0Qlq3phQFzjpljfl6mX3tc8Y8iGDNrNckJYZEpz0QMBq34xNkG1qZUIGDLLNIFGnxW/uQRkgsbVjgAJlh9gZQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB7584.eurprd08.prod.outlook.com (2603:10a6:10:308::6)
 by PAVPR08MB9330.eurprd08.prod.outlook.com (2603:10a6:102:304::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 16:27:49 +0000
Received: from DB9PR08MB7584.eurprd08.prod.outlook.com
 ([fe80::5144:343:7017:bacb]) by DB9PR08MB7584.eurprd08.prod.outlook.com
 ([fe80::5144:343:7017:bacb%5]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 16:27:46 +0000
Message-ID: <73edda3b-7305-4903-8950-8528c94051b1@arm.com>
Date: Mon, 10 Mar 2025 16:27:44 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] perf: Allow adding fixed random jitter to the
 alternate sampling period
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 irogers@google.com, ben.gainey@arm.com, deepak.surti@arm.com,
 ak@linux.intel.com, will@kernel.org, james.clark@arm.com,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 adrian.hunter@intel.com, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250307202247.648633-1-mark.barnett@arm.com>
 <20250307202247.648633-4-mark.barnett@arm.com>
 <20250310124735.GR5880@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Mark Barnett <mark.barnett@arm.com>
In-Reply-To: <20250310124735.GR5880@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0298.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::15) To DB9PR08MB7584.eurprd08.prod.outlook.com
 (2603:10a6:10:308::6)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DB9PR08MB7584:EE_|PAVPR08MB9330:EE_|AMS1EPF00000044:EE_|AS8PR08MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d3c9121-a74c-422a-7a0a-08dd5ff0877e
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?bTg2TGxxL2N6d1hDK2dwWGRwUGF4bWFTUjlmaE1rTGR5a0dZbGNJd1M5QXd5?=
 =?utf-8?B?YW5KMDJYS1JvYmErZ0dKL21aT2F1bEcyRTJTR2Yrc3VtWTExam8ydStwcDVs?=
 =?utf-8?B?VE9ZWDRNMkRtSmNLbFlsWEV2YS9hYW9LSCt6V25WTEE3NUhjR1lFbmFYaU10?=
 =?utf-8?B?K1lyUElpc1pIeWx3MVc1VzRzWXM5ZUJwMStKNjU0T2FTRjZibDFsR3NCcnMv?=
 =?utf-8?B?MWgrUWl6bXdobURrMlB3UmIwRkpJc09RMVIxbjM4K3Q2SlhxTjRZZzlXUGlQ?=
 =?utf-8?B?QjlWTy96aFh6dkhEU3MzSlFIYUVGS0ZUNWZ0MzBhd3hOQTh1bGdXTTY4SThM?=
 =?utf-8?B?L0ZPeFp6REs1OTR3bnVFQzNJQVdWMVdMSTZRTnhWT2NIODRUTXVUTU5kTTdj?=
 =?utf-8?B?NEFBc2pOOVVLYk1vRTNHSGxRNUhXN3cxaDhGSVRpU3VUTVBWZ2t6YkxlVEZX?=
 =?utf-8?B?Z3ltN1lFckRxKy8xNXlYSk91aTl0bTlhUTNBVEo0Mm5FQXVlMjBLN1lOQzB3?=
 =?utf-8?B?Rnp2REpjSHo1MTlxcTF4SE1NVktKdnRkeTJXMUNOaklSVDFHbjBBcytFemh5?=
 =?utf-8?B?ZElVZjNKM01xNGhwQ3FuenlhNUo0bzJzbDdkMmNsNVFNQWdWYzZ0Q1ROdm8y?=
 =?utf-8?B?ZUw5Tm4rdm1jaW8yMXlGdGQwVFVYVU9LT2NXdjQzU2tZbXVMRDNQNVZvZGMr?=
 =?utf-8?B?UldRZWkzRkpnV1hTYXFub0lXTkpkR0xYMlIrUldEaEZmWlp2SldybFNSK1Rm?=
 =?utf-8?B?RmpqY0FTRGFudjJPWFVqY3JPUEtaZ2xsZXd1ckVRY0R0Zm9lb3krVHdNM3lS?=
 =?utf-8?B?N21XL2pubDRQUzN4ZVVIQWNUWGwwWEFaUzBMeHIrZUVFbDJBQ1QybW11elpI?=
 =?utf-8?B?Wjl1T1FoTW8yV1BpNFBBS0NtUHc1Uml5Z3Zqbm4vdGlNS1NEbCsrU2NvT3dy?=
 =?utf-8?B?TGNVTndhTDNlNzI4cGdxRE9zTlJBbmxvcTcvQTNSM0tOc29HODU3c3kzT2VT?=
 =?utf-8?B?QVkyMmlROThyR0x3WTJPRCttcGpUNWVqQ0RzREdJcXU3aE1FOVpKRkhkcm50?=
 =?utf-8?B?bWUzUnpZWTM0R3F1dDJVS21URG5ENWFUU1BQT1FpRk51ZHk5Nm10WitWbkox?=
 =?utf-8?B?S3N6ZUIxakdXZE5OazU5bmxnWHJUS1pqQjJWb3dBUnptMngxRDJ0MTFpUldZ?=
 =?utf-8?B?elVab0gvUGUvSEw0TEhGcXozVFlNNFluWTNIaExvcytHVDhxOWtxR1JHZVpK?=
 =?utf-8?B?b2pMb1Exc3ZkV242b3JXVmloUlNNMzRzMXdYQnVjR0UvM2FHVk1zNzEvTXZF?=
 =?utf-8?B?V1ZZK1pNeU54bzREQTNTMTdLOGJYK0RWU1g0RFJCbkMrL0tLWUw0WjBBRHB6?=
 =?utf-8?B?TDdoUGVCUWRhK0R3RVc0ZWhLMEJKSk9BRFA4QzJEVkN6VFRDUjdZdjZWUFAw?=
 =?utf-8?B?SmdaSElZOGZpbWIzWFZReG5udzlSdEpOYWIrUzBiZWZaYXdVK0ZtbGFaVXZJ?=
 =?utf-8?B?TmdrbEZhRVJWUzlERkdVdXJTLzBSRFovU0RTQlpjSUd2UWlaMzF5Y3BqbzQ5?=
 =?utf-8?B?L2E1QmdHbU9vMklCSmt3SHlVQ3F1Z3pGQU9BKzNSZ0lJT09RSjdGRGQ1L0xt?=
 =?utf-8?B?VFpIeElwUG9XU0NYNW1RUHprVkxaR3RqRkx2dVJJVGNFdW5oaDFPcEJXaTZG?=
 =?utf-8?B?UnkvRXdlWW1EUVNvOWp6d2FhdFBnTjlPb1BBdGtRMFBDTmtOck9iNTZzK0dQ?=
 =?utf-8?B?dzhPWXlZMzZaYkYyZDJzQUhRV2lBaFJMMk5HaytDOENvcGd6YWlKVWFOQjVr?=
 =?utf-8?B?NjgxaXFNUWFTdlJRNEpCUktWVXVyaFRqVEFPRHN5T3dOellGTy9iZHNscVZ6?=
 =?utf-8?Q?7X+qZF/f+Pgfb?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7584.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9330
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:308::6];domain=DB9PR08MB7584.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 737ace40-b140-4101-a2d5-08dd5ff07dcf
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|14060799003|36860700013|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djkzK1lLYmR3QVg5Mm5yZ0VRT3pFTU5iSnF6dUFJdXVVZGExUWsxM24wS3d1?=
 =?utf-8?B?djJ3SnB6RVFsTWZ3US94czd6VnM4NEl6YVNmM1BUaytkRlorbC84UWN6NnZN?=
 =?utf-8?B?TDk5NjRsVURwRGVPY1RZdDlkeGNTUEtzRXJncUpwd1l4MUp2NTJUSFd3QXR0?=
 =?utf-8?B?RWtDYzQyNDgrRWZCSDI0aTZnSS9NUlFKMkJ1eTE0NEptd0ZpVFI2ZFVJalhx?=
 =?utf-8?B?Wk5UZVNQVnZIVS9qRUMzSXJ6azFCcmNxY2VyVEp1aldDeWhONHF2bW1xOXF1?=
 =?utf-8?B?ZytkNGFBY2R2NHYyTi85UnJLZ3duWUFFYmRkVW1OOS9sTWVzM1ZML1pSdGly?=
 =?utf-8?B?a3NQV1ZFR2F5V1Y3U1k2Zmg1b20rWlU2UkdUOGQvSENtZnFwOVB3ZWRBY0Rj?=
 =?utf-8?B?MFlqNDhGVWFlK0NhL05QeEMxNEJaYXhkZFBZcjI2VDNKWWZlRGlCUXAvQlpJ?=
 =?utf-8?B?U2hrSjA1ZnN4TW5EOWtnZDd1ZmhJM2xobW5zWndlUmp2MWxyeXRCT2hoQ0Fq?=
 =?utf-8?B?MHNnRnZYQ3dsTUJXQzA4Tkw4L0cvZk1JcmxVWXNnQnMwWVU3VFVERDVnVDNS?=
 =?utf-8?B?cXhmZ0sxcjljd3FWZE1qSWVGc1JLNDFmZ0RvWElNZ1ByUUI2cklWUWNkeVdl?=
 =?utf-8?B?RlF1cHlNdS9qWjl3QWRKaTljblAzZjFmMnRuZjBOQmcwWFZlVXQzL1V6aXZG?=
 =?utf-8?B?ZHh3MExUTk5EWmQwTkt1ZnI2ckJyQWh2ZmhTTkUyVFBJNzE3R3hPYy81Vkdo?=
 =?utf-8?B?VXplVjlQdWxJUGxveWd0aDlZaG13SUU1cVk5eExlcWpRYlMvV0s1WWpITXB1?=
 =?utf-8?B?RXltT0pIL0orN2kyZ2p0UFp6YUtRNFQ1VzB0cWYyYkdzWDhYREtEeUhrWEti?=
 =?utf-8?B?bWY4QUxjd3AyeWZsK3dLaTZVaHQyS2ZjSEdDK2QrUEkrU1Nmd3AxVVNDR0Zl?=
 =?utf-8?B?UGlrUW5oeFpucTNVRnNYUElEbDltdFUzNDJ1T01lZE5qSG9OeXFBYUpTS1JF?=
 =?utf-8?B?K0xWUWFHYTM4Ly9GK3JkSVIzb0lkSXU5bExXM3ZMci9DMy9hOFg0b2FRc0l4?=
 =?utf-8?B?TzRjczkvVnRZQ29SOCt1M0RvdG00anlsSzBYazU3Z1BTZTlqMm1kNFJTVGNC?=
 =?utf-8?B?QXhIU1oxQUx2SUxnSDg5SWRtMFhQVjJBSHJBd1hkUWxvTjNmMVJ3MjhrVXBn?=
 =?utf-8?B?SWtsazc5elVHTVFrUHZLQmVwMGx0NjdQTG9KL2RkTVlKcENzSjRCSlV3Rk9p?=
 =?utf-8?B?RUh6eTUvc1g2TDR2SEYzTWZYUEZ6S2x4V0dKK3pMZ2l2RGorcFV3UThkUTAv?=
 =?utf-8?B?TjlVeWNDeEZkV1UvOGpSdVAvZHY2dDFtbDhMb2hiUjZ0b2t1SWNZVW9UNFJE?=
 =?utf-8?B?d1VPSHpUZlRtQS9tRUdQMFQzRVVHMnhweU1YOHpuRlZ6Q1d3bys4eElGb3Vs?=
 =?utf-8?B?TzlQaGpEMExOWDM0SWQ5Y3hOblpJc0dBK3pSeDEyRmMyZ080b1ozY2hzUWNi?=
 =?utf-8?B?S2pDMk93ekxjNEtUb1oyV1hoM081RmYyelVjeGIrV0hUNjNZN0pRZkNBTG5E?=
 =?utf-8?B?YW1nd3cwaVJMSFRpT1o2eFNvWUh2YXpuME5hdkJZeTVHZGdGQUNIRkJ4c01E?=
 =?utf-8?B?R2VzWFRDL2FDSCtsMEl1azNtUGtweEZpVlFybjNnbVdJRmFVQXEybzY1a1lD?=
 =?utf-8?B?RHQwMloxNEVnTlk2SlVDbFB1Q1dkSzNyMDA5TUZpNTdOY3VkbmZxRzI2bktr?=
 =?utf-8?B?UFN5ck5nTUIyR0FqVGVYNVRQcW1YelR2Y0g4OFdML2hPeFNYeHJFa0VKUDN0?=
 =?utf-8?B?Y3d6NVpIRlFHRThUWFJ3VGJuMXg3SStrSHlMc0dsZnBBMDBjKzFRQUxsNVNG?=
 =?utf-8?B?bmFuZ1o5dERGR2xlTmtZWWJ6ZitOYUQwcXpNVjZtZEhMakYvSFpYdEtpTFp6?=
 =?utf-8?B?ME5zMmVUYis1aWF0d0JVTG9rQS9pakd3NDhBSG9lUG5kZjdYcDlhVkZQR1k0?=
 =?utf-8?Q?LC4Phl4s1C+t2N0YBr2UnsnGx7zB40=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(14060799003)(36860700013)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 16:28:02.5855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d3c9121-a74c-422a-7a0a-08dd5ff0877e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9388
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_092814_050188_EF9D13DC 
X-CRM114-Status: GOOD (  11.39  )
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

On 3/10/25 12:47, Peter Zijlstra wrote:
> On Fri, Mar 07, 2025 at 08:22:45PM +0000, mark.barnett@arm.com wrote:
>> @@ -9922,7 +9923,10 @@ static int __perf_event_overflow(struct perf_event *event,
>>   	if (event->attr.alt_sample_period) {
>>   		bool using_alt = hwc->using_alt_sample_period;
>>   		u64 sample_period = (using_alt ? event->attr.sample_period
>> -					       : event->attr.alt_sample_period);
>> +					       : event->attr.alt_sample_period)
>> +				  + (event->attr.jitter_alt_period
>> +					? get_random_u32_below(2 << event->attr.jitter_alt_period)
>> +					: 0);
> 
> So, ... this here is NMI context, right? Have you looked at the guts of
> get_random_u32_below() ?
> 
> I would strongly suggest you go do so.
> 

Good catch. I think a pseudo-random generator would be fine here and it 
looks like the implementation of prandom is safe to use in an interrupt 
context. I can change to use that.

>>   
>>   		hwc->sample_period = sample_period;
>>   		hwc->using_alt_sample_period = !using_alt;


