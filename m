Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84882C56203
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 14:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEXFlyQG27eSEPY1h48cfVGC4MxiIzgFIRTU1cgI+Q4=; b=Sj2NBxjNgtmjDlqcyE6TjxgZot
	mrkRJyk2hRDSpaek4EZhpIpS+eiJHtRfdRSIFQi1TLVwKhDI8FIDUHaJkuJd1V/t+QrmdsN0iGaj4
	Ll10tPV9OiIH7fLeCsMOYnElkKzYsRCa7NwiJO4yM5Jl1TTputD46VfPZzj1LYoGo8DQ6OB4c5Cq9
	flMx7H6Pu3YP6Ceo47jEe8cqNa1en/oAgqLNEN4HGftl4CySnb0Cs2gp2aVbbzuZyBiw9Wh51kK6W
	Uqw5yCljsSvaYOcBDz9OoKp75NZuu/t/+7ELq46auNbxMhVc+Rdv7WoaXvZYlcHiMg6QGxMkfNyAy
	bd9R98nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRYQ-0000000EpdQ-3lbS;
	Fri, 20 Feb 2026 14:32:26 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRYM-0000000EpaC-3fx6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 14:32:25 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=u53F2sLxPFGCADoFL91I8MXjkXIZL5xHhmN8HUeLOK+NZTTX8Dfo8rjmRcdjq5ErdDJcPW8elZ061z4aKeNVrTxA3jJtsuRIrGsZJpRJYETY/td/F2AAlKnJiq3lSXYdTwRo9qt3hGT5gILmyk0lLuQE4nLuqnkM2p4tTotjwUPZnvl78iO0OogmjopMv4saKHVwxhTu8PBPZ64UHfYjynMmdjwiZUb8HRpNzS2r/3FLTKk1GXJoPLuGaetYm/OWRcVeBzjSA3RQj4FNrYTLtasY7YgjcPmTJU662Pjg+GEbdWztHt1qngP7VGh/0ENl7JX2Ev6MslSmVPM8bxW3eA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEXFlyQG27eSEPY1h48cfVGC4MxiIzgFIRTU1cgI+Q4=;
 b=llcILEjZBJUTHOiAA2wRRGdSiyCqO1KmB8vYZj6TA1iK+lMob4ZZ4QZ8G2g6rldRpgWvT9A5uQpPRFUekqVlmel/FU9IizdAwpvqOFCQ+H+wVlnO3CJ/birzAdb+1pCN7adXFyFrAu/73n2QIkfpn1vU3famkmYSst/FiO40Jt3wQOCovG8KaXcAx7X1wyy3wBipg1UEH4WsbeQuQDwG0dlTa+eoNStDb3efyMKM4L6E3y7a8+okOTPl9pVD+QVws+dWq6FstIK1bgWVljYwnfCUUyj2gvNfPajTVfqQZyt1vzj9R4zlnT7CtsLy4ekGVTOX1B+g/IyLHY81JeZq3g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEXFlyQG27eSEPY1h48cfVGC4MxiIzgFIRTU1cgI+Q4=;
 b=OB7O4fgQ2zCug0gVpV4FoWmILOgGhZgWArffIJxk+Re9vawR+LDH1hzkZJzZ3YoGEOt1Uuv7ocSXbiYrUeD8znRRzuScHl8L7yFg49JOnJXi/CrHHgdiE9ck2HimCH8JjILjKgVPeN9npwwvXuNKkF9pO+fu7Wgkp6SjD2AvT78=
Received: from PAZP264CA0145.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f9::14)
 by DB4PR08MB9191.eurprd08.prod.outlook.com (2603:10a6:10:3fc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 14:32:14 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:1f9:cafe::11) by PAZP264CA0145.outlook.office365.com
 (2603:10a6:102:1f9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Fri,
 20 Feb 2026 14:32:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.0 via
 Frontend Transport; Fri, 20 Feb 2026 14:32:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OYZjQbx/U1iDjt5tXZk7X3ZQb2ek6bt4Lqcuqo2AcH1TooBHIjEjgzmfay4gdL/Ln1MuMzem3QnQeHbVriqxMRQuPTY7UkFIgpQbNTHPvnkjIYShExOM73MBPTily8LWpy0Sloc7/9iavZZRYOtsbxj2dpj7s14eZ0ia4T41a4Q6HOd539LQnwXQUCWt6pKmggVYCeKz3Vycy1cUl2tl5xJtq1VRIm2XJFnLuXonL0jsFOlrPqIf+6K7fbpSPDD8aS1zOXAY9K3EcSrYOulop/PWMtGVCVc2JLZNSVPs7QLkhNeYQMnGHkkgMgeUKqF0oCuKJkC96otJbB9IrJ0jmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEXFlyQG27eSEPY1h48cfVGC4MxiIzgFIRTU1cgI+Q4=;
 b=a8X0nMRZUNrR17vuurcznUTooGJNzBl8ZIVSXJrzNG9fRfQJRGW1LG9lDASMRjnpEjrLhWoRiN55I0SvgYr8vTD2Y+FU3iqg27MFk4pi3LLTgstkp66HgXI6RDdCwTIgSEtkjpkARYF6b2XNKm+fpStk+9cXFa3XSLUIOn7OoeA9MqtkswLX0qJRWsxZ4CSgsvuhAPeJmEy8g57Vhhn2AKFvzpdKlraOBcPGoBDHafasP/eBHnxIS8bizKnZyCrBYGAg3C5j+2RYnQGuoF9itMHvxJm3PGtLlUzFg+rMuuif7Swl9V2FJ2WQlGZJCEIGzbLyxMlmWmZt0T/EXw0QYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEXFlyQG27eSEPY1h48cfVGC4MxiIzgFIRTU1cgI+Q4=;
 b=OB7O4fgQ2zCug0gVpV4FoWmILOgGhZgWArffIJxk+Re9vawR+LDH1hzkZJzZ3YoGEOt1Uuv7ocSXbiYrUeD8znRRzuScHl8L7yFg49JOnJXi/CrHHgdiE9ck2HimCH8JjILjKgVPeN9npwwvXuNKkF9pO+fu7Wgkp6SjD2AvT78=
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by VE1PR08MB5806.eurprd08.prod.outlook.com (2603:10a6:800:1b1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 14:31:11 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e%5]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 14:31:11 +0000
From: Mike Leach <Mike.Leach@arm.com>
To: Leo Yan <Leo.Yan@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, James
 Clark <james.clark@linaro.org>, Alexander Shishkin
	<alexander.shishkin@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
	Tingwei Zhang <quic_tingwei@quicinc.com>, Yingchao Deng
	<yingchao.deng@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
CC: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leo Yan <Leo.Yan@arm.com>, nd <nd@arm.com>
Subject: RE: [PATCH 7/8] coresight: cti: Remove hw_enabled flag
Thread-Topic: [PATCH 7/8] coresight: cti: Remove hw_enabled flag
Thread-Index: AQHcme4pEEMp3mXDJ02SuzOu1aMDobWLtprg
Date: Fri, 20 Feb 2026 14:31:11 +0000
Message-ID: <PAVPR08MB9674FF028BD91B6DDF5B035A8C68A@PAVPR08MB9674.eurprd08.prod.outlook.com>
References: <20260209-arm_coresight_cti_refactor_v1-v1-0-db71ab4d200b@arm.com>
 <20260209-arm_coresight_cti_refactor_v1-v1-7-db71ab4d200b@arm.com>
In-Reply-To: <20260209-arm_coresight_cti_refactor_v1-v1-7-db71ab4d200b@arm.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: PAVPR08MB9674:EE_|VE1PR08MB5806:EE_|AM4PEPF00025F95:EE_|DB4PR08MB9191:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ffd293a-e094-418b-15dd-08de708cd71b
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?dDJRU3ZUbWUxT2xxL256LzRUVzNPUG5yYWhCdEpSZ1lraHVmbXNJc2ZubjJz?=
 =?utf-8?B?NFZTSFBHeDl0S3JoTE1kRS91bVFZeDg1cVB3K1Q2MzdqS1hqZTZxWHpCYjVv?=
 =?utf-8?B?OS9PYnlvR05YSFZEanQ2UlVqVmZGMkt1ZTF2ZE1Ecnl4U1RTTTZmY2VQOVQv?=
 =?utf-8?B?ZHVKM0N2KzVVVjB2UVIvM2s0UTMvTkZmekRsc3pjemxUOUVRK2xyVXEyQVpJ?=
 =?utf-8?B?a29DV25IUWNHS0VmWU55SHhKZyt2WVlBYU9BUCtwVXhVbWl0OGV4ZVVlK1Jv?=
 =?utf-8?B?UXZkLzV3a2VnL3pJdHdaSGJzQnp4YmtVU1FiL0hEeDVtOWU0REsvSm9RdThX?=
 =?utf-8?B?dDNmZlNyODhEeXhERitwSDhESmhHYjJQZ0FnaGhTS2lhYVI0dVR6UEduYXYw?=
 =?utf-8?B?WG4yNWYrcml2YTFmVHRCSkw1aWFla3NzLzh6dHExZE8zbmQ4QXFyV2RXSjZN?=
 =?utf-8?B?WlBBcCtlb1VTUGtmbzhBZW5nZldMRXQ3aDNUNkx0M1ZzbjFvM1A3b2JhNjBC?=
 =?utf-8?B?OWpsY2FmRWJvQmdJTndDaStkc0xqZENTamNpcE1lQ3dUTEJZWFkvcFZkaEtN?=
 =?utf-8?B?bVZsMlNzVGRpdytWWVd0MVZzVDByVm1BbVprZ3RzTHYxRGtBejdFM1hMN0ZD?=
 =?utf-8?B?SUlZVUl3UmhTYm8wRDlNdXVnODE3c2xRSDlzdndhbDlvS09jdjBMQjJIS2t5?=
 =?utf-8?B?YjJTb1Awdzkra1IwVFVCOWp2cUV1WEYvVDIxVWRRNTlpSHJTK3c3SXZHcFh0?=
 =?utf-8?B?T1ZDZUZjN0hxTnRnaUJYWHE3TW5waldwRzRSOEdaMDFuSGhpa2lQM3FNa1BG?=
 =?utf-8?B?Y3l5RW80RDBPSUZhQWJudDMyakFzUnFYZzFEaUVzd05CQU51cmpqNW5XQ2pa?=
 =?utf-8?B?aHRMbHZaQ0ZCOWFVbUhoVENEc0taeGlHN1ptYjVsdmsyTUtDVVBud3BQOUFM?=
 =?utf-8?B?NzEwanJqcWZmUVBBZGx6ZWNNSGROdUZpTERrMm85aG9YbEIwZEtKNUNjYVMy?=
 =?utf-8?B?dkovSHNWR0NKaWJoQzBUd0ZTRmVKTWcvMzM0KzBDSTNyMzZFdEF5YWhHbG1R?=
 =?utf-8?B?RDJZYU1lR0czRmV0WEU5ZGtwZzNNVWg4SHVtdjBRbzE0Z3MwRFpkR29YTy9Y?=
 =?utf-8?B?Sk1aZGhJSXowNzNhcSs4ZkV3MXJkZU55a3p0UFN5VUs5eGR5NWtUS1BYT3Bw?=
 =?utf-8?B?ajZuNGhuUlE1V21KYlVUVElTR1cvS1lVZEJ6bFYxV1p6VXU5Zm9OWWV0bDRS?=
 =?utf-8?B?RWVtQWRIQi9oZFdxUEhWYXVMdDAxU2U3dHFDSEZpTkR2VDUxTjdaTHdmV2dT?=
 =?utf-8?B?VlhKYUJzTG8zSUlOV3RueEdqYXJnRXZTOGh1NjJIVDhzbitQWTE0TGNTeG02?=
 =?utf-8?B?ZTFZTWVaSndXeHQyOTZnK2NneHVoNHF3bXorUjBKL2ZqSm1ZNW1hNXNTRmc2?=
 =?utf-8?B?cXlYTmowdHhuY3FXMXZrMzVwYzZRODdkRTZJZ09tUTFTbkNmQ3gvUFd4R1kv?=
 =?utf-8?B?RHQxQXcxZVhDb0YvZWZqbjZ3ckJ6b3RxQk1vNEZNbzlKalA0ME5OaFNzaHFl?=
 =?utf-8?B?Zi9Eb0dMTUxSV3N1eGhMTzVhZTRXVFcyNktyRjI2L3R5Nno0d0tVQzgzZ0xq?=
 =?utf-8?B?WUxkSEVjQVlURGpLN1kxQmcwNHZOVVpRcXBBNkZwU2JUdXg5MS9EelRzQ0Ix?=
 =?utf-8?B?UzBKTVZ6YlZ6cks3eWZmSkNTQkRuMy9wSU9JUUk5ZWk0REVvakNudFR1Vm5U?=
 =?utf-8?B?R3laN3lXSTIxeVdzUnQzKzRFRTcyZXM1NmxUWFJEZHh2SFNNRmkzaS9FVEln?=
 =?utf-8?B?NXAwU1ZFaXdubVY0OUZ3Z1FSaHl1S3VYWFJXZGFDV0VzOFF5WE9aejlLOHgz?=
 =?utf-8?B?RlhXaEpQS0tScGIzUFV0ZjBCZ1NOZmtmeEtvSTY0WWlGdjJ5WTdjTDdROVdi?=
 =?utf-8?B?R1VYSmNhT3IzQkNwU09BYUQvZXNXZXlHTnlWTUh4UlZxU3FwZWI0WHZ0S0Qy?=
 =?utf-8?B?Qis4bHR3VXBOWmNFc0MrNzJUZkN6Yjhld1QrcmEwdTVxYzdsMjhMbGRwc0pi?=
 =?utf-8?B?ZUJtaXh2VmJ4WW4yaXNqank4OWlBZHZFZU9sems5YTJTSWI4b2doSnRQcG9v?=
 =?utf-8?B?QmI2Zm5tTDNCSXpoTEMvcFYrdkdEb0NnVkJiOVV4OFlOcTVIdUtHME9zNEd4?=
 =?utf-8?Q?w4y9lj+tyHNLioMwTJCWRow=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5806
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: cc711043-93bd-460f-2d00-08de708cb1c2
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|35042699022|36860700013|376014|7416014|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkVsZWlRQXQrNmhPZ1I4czNuNjk2bGxSSFhkQ2hWVFhsKzR2UFBaQ1F3bFE5?=
 =?utf-8?B?VDZmT3dLOXQzZ2FlZEtuYUFXc1hVbFdFb1FTN0gvYXMwZTQyWTd2Zm1kTU9o?=
 =?utf-8?B?TWJDejZacG9ZWUlVYmdFdXJURTZrZDJmMFlBT0NjUGprYWY0MGR1WnpKc1N0?=
 =?utf-8?B?ZU4xSE1SczlKYU5OeGVHRXc5eDZBSERDWnZWNnFBMU5ibDVxUUZiRHRSeitv?=
 =?utf-8?B?Q1duS0xYczVFbFl1SWJXZmZxREZ2cW5nWC8rQ3A0N05VekdkYXlDTHNHQkpC?=
 =?utf-8?B?SjFlN0VOUWVXTjJIS05UUTJFb0MyN2NwOXJ3VDVmNk5DVElKM283TERnL0Zs?=
 =?utf-8?B?c0dmZUF1Ly9VVE1WclgwcHZXMGV4cTU5dWxwTFdzeVV3MmR6ZDdXa3d2U2RD?=
 =?utf-8?B?SzE3bysvdGM4R3o1ODVvSS9PbjViUSs2aDZTczMreWo0alBOZ2xUdEFjYWk0?=
 =?utf-8?B?aWFsWDJ6Y0ZIYlhCeFd3blpEbEdrTUJKMmFnUGJ0UDV0T0hJS0ROWDNHcDVX?=
 =?utf-8?B?WFdUNnp6YW9pVU1Kd1FyeVB3ZmJkd09WZGxyVXUrQzJiUjNmL242U2VLNUlU?=
 =?utf-8?B?YktYZENZNlJQSENzTkU5Rys1MlowYVJmR3U4b3VmZEhjKzBVUjNtSEY2czlO?=
 =?utf-8?B?eDVqVkhYTzlkVXk1S1ZPc3NHSjNBWmpxNzN4VU9vTnJFMnVlV3V6MExWR2w0?=
 =?utf-8?B?TEtMbHZ6d2xlS1JRWkNNdnlUb1dWNVBpSm9oY1FKaW5vTWlGTmRKdHRLUnZy?=
 =?utf-8?B?dnIxTzJ6cC9yeXV5dWEycVh3akpvdVI2Z1Z3emhCOTNFNVNESFdOcEZGSUR6?=
 =?utf-8?B?bVpWbTJrOEY4bjJBM0dGUHI2bngwbXJocUQ5UDZ0TVZlYXZEcHoxOURzUlVs?=
 =?utf-8?B?eWh0dWVZSyt2anJsbDFQVzJVVis3eWk2eXNKNk9vL0M5ckxjaEtUU0lCbDZm?=
 =?utf-8?B?cHBFeUNYbzZKVXh6eFVBdGxCNGRiZ3RUU0xHUUhpcTJobEpkUHJjVE9PdlpN?=
 =?utf-8?B?Q2QxajM1NkFpTlgyQWVuYnBmTlFNcm83QU1vMkF4QXJkYm9xWlBXdVRkeGhj?=
 =?utf-8?B?MWhXbFZWemFoR0xQaVQwM3JHTFpnNHQ3N0xSaXNWbXNuVVY4cHhGMjRIbjVx?=
 =?utf-8?B?OWd5TUN1SEZibFNTb2NSYjM1RDV0RkFhQ0NLS2tKcjJCSlhSQklJZmlqbjF6?=
 =?utf-8?B?SE4xbDZHREkzRUJQQWNmWktKNlkydllaTmplbFphbzJEa092UXprc0ZQRWp5?=
 =?utf-8?B?OVJqWWMvVThoRWxUTjA2dFpyd09oTFB0ckJhYnd1T0JpV3o5eDEyMDgyam5K?=
 =?utf-8?B?dnNGWFYvTHhFT0Z0Z0VDNTJaRGpuKzlDWDE2ZlJNWExTaE5yOG5BeXphbzBv?=
 =?utf-8?B?WHpuQ3VKampEbVBEQnJZMFlsU3JsU0tDZVlIZ0VVYlFpRytzM2E1N3BFYlFq?=
 =?utf-8?B?UnNEazk2ZjNjV3lJQ3VwRVBEY0xrdmxDN0JyU2JpT0t2Zy92bmJBc2dUOUky?=
 =?utf-8?B?WFZvZTZXWHVVbFpxK0ZCNFFpK1A3M1dGQkxmWkpMaG9hN01Bemg4SkpyenF5?=
 =?utf-8?B?RjY3WUV4Yzdwc3VqNFNuTzBta01jbjhTMmNxZmdTMmxFRXVUN2hYNU55aHhY?=
 =?utf-8?B?bys3K1FZOGtFaEtVbytVUXMyWUVkQ0hSbXp3QXFYMVloWjVUQlVGMGh0ZkhL?=
 =?utf-8?B?cG5XcDgzL1hhbEppUHhwazJBZE80WjlndzkzMnplbm5uU3RuTURxT1o3djVM?=
 =?utf-8?B?OE92RVNtYXk2QUU1OWdsODk2SFBUWWQ1Y01jSVB3Uyt4L1c0R0toakd1UHE2?=
 =?utf-8?B?dTBsK2ZRUkhUMTl1TVZxOTZwcnpEeExyYkViaTA3aEpmZ1NmMXcvdkRTUlF4?=
 =?utf-8?B?Uzc2QnRQRkJuODFrYSs2d3kyZ09lU3BYdFdIcnE1ZmtxaTN1TGgxazRNbFI5?=
 =?utf-8?B?Z0s4YkJlcWRia0hERG96cmcyTytWMWVnMnRnNG1jUzNjRm01cGRXMCs4YUhG?=
 =?utf-8?B?dUNqdzhIZEUzVm4yM1hoeG1JWGxiOHRBSFB4a1JTN25xZmxzb3hVdkJCQW5K?=
 =?utf-8?B?MEsrVzJPNWhEWkptOXZoTGZ4YXJRbnloaGVvbGVLQ3k1K2F5WHdWKytPRXJF?=
 =?utf-8?B?SzdoWm9sbWhOcElqbE5LMEpMajY3SC9BNjVRS0VuQVJkY0l3czFuNjF4cStk?=
 =?utf-8?B?ZWpXT2xsUktoVzMwU0JUUVV2K3VLMVkrVml4Z2s4cHlDR1BKVnI0NFRGQUc5?=
 =?utf-8?B?dENBdkJMN00yeE9GRHVvMWZmaTFRPT0=?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(36860700013)(376014)(7416014)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: o82bE2SvbgqpjwztRmddOIr1grA2jo5TpAcNG1wKjfFRMCyC+VOMaxEYmQTQBxNz6vKrsOlXG4FQvJBGL6jnc6tbWVToRpsyHueQw9SZda3byLYWsqKa99GJMB68va3GClWj4ztiSyjqXZi4Ak0I3hjfi19THceI7p0G9kf7VfVIiLz5/+CDv29WFoThCye4xYwK7NhRb98SaDd6g5untTHDwgd0u42KLHiQORBhXP0p/LL6M5bc/JlH0dgJDRA+u1g3v0sUCzNKOgh2XFqX/EQ5xlBWXf7l+T0N9UHITlXgHXM7J6QcOTVYaY9gpF1EMIq/T8GgPpg0ciCGClaEfcsfKAVY0x7hjbXMSg6ANfFIkubOQWFdkQZXB9El27tK0EIn0zHfWWZbScJUzXBMxe1aZ247fbZ0mOEl0zwdHGncKikOPZQdihipVSuYNbL/
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 14:32:13.8876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffd293a-e094-418b-15dd-08de708cd71b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_063223_061744_896C46DB 
X-CRM114-Status: UNSURE (   5.94  )
X-CRM114-Notice: Please train this message.
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

SGkgTGVvLA0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGVvIFlh
biA8bGVvLnlhbkBhcm0uY29tPg0KPiBTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDksIDIwMjYgNjow
MSBQTQ0KPiBUbzogU3V6dWtpIFBvdWxvc2UgPFN1enVraS5Qb3Vsb3NlQGFybS5jb20+OyBNaWtl
IExlYWNoDQo+IDxNaWtlLkxlYWNoQGFybS5jb20+OyBKYW1lcyBDbGFyayA8amFtZXMuY2xhcmtA
bGluYXJvLm9yZz47IEFsZXhhbmRlcg0KPiBTaGlzaGtpbiA8YWxleGFuZGVyLnNoaXNoa2luQGxp
bnV4LmludGVsLmNvbT47IEdyZWcgS3JvYWgtSGFydG1hbg0KPiA8Z3JlZ2toQGxpbnV4Zm91bmRh
dGlvbi5vcmc+OyBNYXRoaWV1IFBvaXJpZXINCj4gPG1hdGhpZXUucG9pcmllckBsaW5hcm8ub3Jn
PjsgVGluZ3dlaSBaaGFuZyA8cXVpY190aW5nd2VpQHF1aWNpbmMuY29tPjsNCj4gWWluZ2NoYW8g
RGVuZyA8eWluZ2NoYW8uZGVuZ0Bvc3MucXVhbGNvbW0uY29tPjsgSmllIEdhbg0KPiA8amllLmdh
bkBvc3MucXVhbGNvbW0uY29tPg0KPiBDYzogY29yZXNpZ2h0QGxpc3RzLmxpbmFyby5vcmc7IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7IExlbyBZYW4gPExlby5ZYW5AYXJtLmNvbT4NCj4gU3ViamVjdDogW1BBVENI
IDcvOF0gY29yZXNpZ2h0OiBjdGk6IFJlbW92ZSBod19lbmFibGVkIGZsYWcNCj4gDQo+IFRoZSBl
bmFibGVfcmVxX2NvdW50IGZpZWxkIGFscmVhZHkgdHJhY2tzIHdoZXRoZXIgdGhlIENUSSBkZXZp
Y2UgaXMNCj4gZW5hYmxlZC4gIEEgbm9uLXplcm8gdmFsdWUgaW5kaWNhdGVzIHRoYXQgdGhlIGRl
dmljZSBpcyBhY3RpdmUsIHRoZQ0KPiBod19lbmFibGVkIGZsYWcgaXMgcmVkdW5kYW50IGlmIHNv
Lg0KPiANCg0KTWlub3Igbml0IC0gcmVtb3ZhbCBvZiB0aGlzIGZsYWcgYWN0dWFsbHkgc3RhcnRl
ZCBpbiB0aGUgcHJldmlvdXMgcGF0Y2guIElmIHJlc3Bpbm5pbmcgbWlnaHQgYmUgd29ydGggY29t
YmluaW5nIHRoaXMgYW5kIHRoZSBwcmV2aW91cyBvbmUuDQoNCj4gUmVtb3ZlIGh3X2VuYWJsZWQg
YW5kIHVwZGF0ZSBjdGlfaXNfYWN0aXZlKCkgdG8gY2hlY2sgZW5hYmxlX3JlcV9jb3VudC4NCj4g
UmVwbGFjZSBvcGVuLWNvZGVkIGVuYWJsZV9yZXFfY291bnQgY2hlY2tzIHdpdGggY3RpX2lzX2Fj
dGl2ZSgpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTGVvIFlhbiA8bGVvLnlhbkBhcm0uY29tPg0K
PiAtLS0NCj4gIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3RpLWNvcmUu
YyAgfCAxMSArKy0tLS0tLS0tLQ0KPiAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVz
aWdodC1jdGktc3lzZnMuYyB8ICAyICstDQo+ICBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQv
Y29yZXNpZ2h0LWN0aS5oICAgICAgIHwgIDQgKy0tLQ0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3RpLWNvcmUuYw0KPiBiL2RyaXZlcnMvaHd0
cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3RpLWNvcmUuYw0KPiBpbmRleA0KPiAzYjNiODUx
YTAxODg1MWE4NjU2ZWJhNjRlNjM4YzYxZjNkMDRiOTlmLi5hN2FjZWUyN2QwYWEyYzg0MjczM2YN
Cj4gNjJiN2ZmODhhNGMyOTZiNTFjYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9od3RyYWNpbmcv
Y29yZXNpZ2h0L2NvcmVzaWdodC1jdGktY29yZS5jDQo+ICsrKyBiL2RyaXZlcnMvaHd0cmFjaW5n
L2NvcmVzaWdodC9jb3Jlc2lnaHQtY3RpLWNvcmUuYw0KPiBAQCAtOTAsNyArOTAsNyBAQCBzdGF0
aWMgaW50IGN0aV9lbmFibGVfaHcoc3RydWN0IGN0aV9kcnZkYXRhICpkcnZkYXRhKQ0KPiAgCWd1
YXJkKHJhd19zcGlubG9ja19pcnFzYXZlKSgmZHJ2ZGF0YS0+c3BpbmxvY2spOw0KPiANCj4gIAkv
KiBubyBuZWVkIHRvIGRvIGFueXRoaW5nIGlmIGVuYWJsZWQgKi8NCj4gLQlpZiAoY29uZmlnLT5o
d19lbmFibGVkKQ0KPiArCWlmIChjdGlfaXNfYWN0aXZlKGNvbmZpZykpDQo+ICAJCWdvdG8gY3Rp
X3N0YXRlX3VuY2hhbmdlZDsNCj4gDQo+ICAJLyogY2xhaW0gdGhlIGRldmljZSAqLw0KPiBAQCAt
MTAwLDggKzEwMCw2IEBAIHN0YXRpYyBpbnQgY3RpX2VuYWJsZV9odyhzdHJ1Y3QgY3RpX2RydmRh
dGEgKmRydmRhdGEpDQo+IA0KPiAgCWN0aV93cml0ZV9hbGxfaHdfcmVncyhkcnZkYXRhKTsNCj4g
DQo+IC0JY29uZmlnLT5od19lbmFibGVkID0gdHJ1ZTsNCj4gLQ0KPiAgY3RpX3N0YXRlX3VuY2hh
bmdlZDoNCj4gIAlkcnZkYXRhLT5jb25maWcuZW5hYmxlX3JlcV9jb3VudCsrOw0KPiAgCXJldHVy
biAwOw0KPiBAQCAtMTE2LDIyICsxMTQsMTcgQEAgc3RhdGljIGludCBjdGlfZGlzYWJsZV9odyhz
dHJ1Y3QgY3RpX2RydmRhdGENCj4gKmRydmRhdGEpDQo+ICAJZ3VhcmQocmF3X3NwaW5sb2NrX2ly
cXNhdmUpKCZkcnZkYXRhLT5zcGlubG9jayk7DQo+IA0KPiAgCS8qIGRvbid0IGFsbG93IG5lZ2F0
aXZlIHJlZmNvdW50cywgcmV0dXJuIGFuIGVycm9yICovDQo+IC0JaWYgKCFkcnZkYXRhLT5jb25m
aWcuZW5hYmxlX3JlcV9jb3VudCkNCj4gKwlpZiAoIWN0aV9pc19hY3RpdmUoY29uZmlnKSkNCj4g
IAkJcmV0dXJuIC1FSU5WQUw7DQo+IA0KPiAgCS8qIGNoZWNrIHJlZmNvdW50IC0gZGlzYWJsZSBv
biAwICovDQo+ICAJaWYgKC0tZHJ2ZGF0YS0+Y29uZmlnLmVuYWJsZV9yZXFfY291bnQgPiAwKQ0K
PiAgCQlyZXR1cm4gMDsNCj4gDQo+IC0JLyogbm8gbmVlZCB0byBkbyBhbnl0aGluZyBpZiBkaXNh
YmxlZCAqLw0KPiAtCWlmICghY29uZmlnLT5od19lbmFibGVkKQ0KPiAtCQlyZXR1cm4gMDsNCj4g
LQ0KPiAgCUNTX1VOTE9DSyhkcnZkYXRhLT5iYXNlKTsNCj4gDQo+ICAJLyogZGlzYWJsZSBDVEkg
Ki8NCj4gIAl3cml0ZWxfcmVsYXhlZCgwLCBkcnZkYXRhLT5iYXNlICsgQ1RJQ09OVFJPTCk7DQo+
IC0JY29uZmlnLT5od19lbmFibGVkID0gZmFsc2U7DQo+IA0KPiAgCWNvcmVzaWdodF9kaXNjbGFp
bV9kZXZpY2VfdW5sb2NrZWQoY3NkZXYpOw0KPiAgCUNTX0xPQ0soZHJ2ZGF0YS0+YmFzZSk7DQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWN0aS1z
eXNmcy5jDQo+IGIvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGktc3lz
ZnMuYw0KPiBpbmRleA0KPiA5YWI1ODZhNWM5YTRmZDJhNjRjNTQyYWFhYWE2MjVlMjI5OWVkZDYy
Li45ZWY0NDk1NmViZGM3NzgxNzE3ZDcNCj4gNzNmYTAxNDE2NTk4OWRmMjA0OCAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGktc3lzZnMuYw0K
PiArKysgYi9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWN0aS1zeXNmcy5j
DQo+IEBAIC04NCw3ICs4NCw3IEBAIHN0YXRpYyBzc2l6ZV90IGVuYWJsZV9zaG93KHN0cnVjdCBk
ZXZpY2UgKmRldiwNCj4gIAlzdHJ1Y3QgY3RpX2RydmRhdGEgKmRydmRhdGEgPSBkZXZfZ2V0X2Ry
dmRhdGEoZGV2LT5wYXJlbnQpOw0KPiANCj4gIAlzY29wZWRfZ3VhcmQocmF3X3NwaW5sb2NrX2ly
cXNhdmUsICZkcnZkYXRhLT5zcGlubG9jaykNCj4gLQkJZW5hYmxlX3JlcSA9IGRydmRhdGEtPmNv
bmZpZy5lbmFibGVfcmVxX2NvdW50Ow0KPiArCQllbmFibGVfcmVxID0gY3RpX2lzX2FjdGl2ZSgm
ZHJ2ZGF0YS0+Y29uZmlnKTsNCj4gDQo+ICAJcmV0dXJuIHNwcmludGYoYnVmLCAiJWRcbiIsICEh
ZW5hYmxlX3JlcSk7DQo+ICB9DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3dHJhY2luZy9jb3Jl
c2lnaHQvY29yZXNpZ2h0LWN0aS5oDQo+IGIvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2Nv
cmVzaWdodC1jdGkuaA0KPiBpbmRleA0KPiBjODU4ODQ3YTViODAwMzZmYjQ4MTgwZmY3ZmJiZmU2
ODQwMjhjYjg5Li5mYmI0OGViNWIwYjZhNTcxMjM1ZDdmDQo+IGVjYjJjMTNmYzI5NGQ4YmE1MCAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGku
aA0KPiArKysgYi9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWN0aS5oDQo+
IEBAIC0xMjEsNyArMTIxLDYgQEAgc3RydWN0IGN0aV9kZXZpY2Ugew0KPiAgICogQG5yX2N0bV9j
aGFubmVsczogbnVtYmVyIG9mIGF2YWlsYWJsZSBDVE0gY2hhbm5lbHMgLSBmcm9tIElEIHJlZ2lz
dGVyLg0KPiAgICogQGFzaWNjdGxfaW1wbDogdHJ1ZSBpZiBhc2ljY3RsIGlzIGltcGxlbWVudGVk
Lg0KPiAgICogQGVuYWJsZV9yZXFfY291bnQ6IENUSSBpcyBlbmFibGVkIGFsb25nc2lkZSA+PTEg
YXNzb2NpYXRlZCBkZXZpY2VzLg0KPiAtICogQGh3X2VuYWJsZWQ6IHRydWUgaWYgaHcgaXMgY3Vy
cmVudGx5IGVuYWJsZWQuDQo+ICAgKiBAdHJpZ19pbl91c2U6IGJpdGZpZWxkIG9mIGluIHRyaWdn
ZXJzIHJlZ2lzdGVyZWQgYXMgaW4gdXNlLg0KPiAgICogQHRyaWdfb3V0X3VzZTogYml0ZmllbGQg
b2Ygb3V0IHRyaWdnZXJzIHJlZ2lzdGVyZWQgYXMgaW4gdXNlLg0KPiAgICogQHRyaWdfb3V0X2Zp
bHRlcjogYml0ZmllbGQgb2Ygb3V0IHRyaWdnZXJzIHRoYXQgYXJlIGJsb2NrZWQgaWYgZmlsdGVy
DQo+IEBAIC0xNDQsNyArMTQzLDYgQEAgc3RydWN0IGN0aV9jb25maWcgew0KPiANCj4gIAkvKiBj
dGkgZW5hYmxlIGNvbnRyb2wgKi8NCj4gIAlpbnQgZW5hYmxlX3JlcV9jb3VudDsNCj4gLQlib29s
IGh3X2VuYWJsZWQ7DQo+IA0KPiAgCS8qIHJlZ2lzdGVyZWQgdHJpZ2dlcnMgYW5kIGZpbHRlcmlu
ZyAqLw0KPiAgCXUzMiB0cmlnX2luX3VzZTsNCj4gQEAgLTIzOCw3ICsyMzYsNyBAQCBjb25zdCBj
aGFyICpjdGlfcGxhdF9nZXRfbm9kZV9uYW1lKHN0cnVjdA0KPiBmd25vZGVfaGFuZGxlICpmd25v
ZGUpOw0KPiAgLyogQ2hlY2sgaWYgYSBjdGkgZGV2aWNlIGlzIGVuYWJsZWQgKi8NCj4gIHN0YXRp
YyBpbmxpbmUgYm9vbCBjdGlfaXNfYWN0aXZlKHN0cnVjdCBjdGlfY29uZmlnICpjZmcpDQo+ICB7
DQo+IC0JcmV0dXJuIGNmZy0+aHdfZW5hYmxlZDsNCj4gKwlyZXR1cm4gISFjZmctPmVuYWJsZV9y
ZXFfY291bnQ7DQo+ICB9DQo+IA0KPiAgI2VuZGlmICAvKiBfQ09SRVNJR0hUX0NPUkVTSUdIVF9D
VElfSCAqLw0KPiANCj4gLS0NCj4gMi4zNC4xDQoNClJldmlld2VkLWJ5OiBNaWtlIExlYWNoIDxt
aWtlLmxlYWNoQGFybS5jb20+DQoNCg==

