Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FFCCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 13:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZhraHnFtkdn1zU0XbkHRa2q7CHeVY8o0rqEoNEHNdMw=; b=2HnQFbGvZpSYJX9p9Df4KEt9Ev
	lu6s2nnTGJou/SYJ4od/m4zC4F4xf+jIC6BN1T73GkpjPJvWLKu7uOb495Yk6jYWd8oe73n5q4GmY
	0F5fcZRmH7nZa6NaZwvJSclCMTi+UPfdQyM34D5gGouRTk3VcCyuWPZz3g53hZkcaDIzR8mEsCcxn
	dGz4l+x3O5P7hguEFj3nYewXRHM9M5tYc49VoFDCZQEXPBzdngKNPGoYU+iBoq4qWDdd2WcM2n1tX
	Yaats8YmkSWBKXKbBgLr1stU/EHUdVmIbtRzmFQq/o/nTgmTB2hpjDQjb8JiPu/XNmtQWkMQlrFJt
	eKnl2JWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upoiQ-00000004or9-32nO;
	Sat, 23 Aug 2025 13:55:30 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upofn-00000004ogH-1M9x
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 13:52:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5pVPAFluDJAonWmQv51I+mYzQwv8hjVRogVg0CZxyV5XFoWjCRwGX6zaV9O8mZql/H8sZo8rPPtrczECNwFYLN0yBAScyfKnZa9SjndP9JhsRyq9sSL9XAjMFJFHOG5Pau7vdhN7F9sbxttxO8dtwjAxdnU7rOhoJ46sHTYsBdwxQx7fIm5FxPcvv6fCf7DIp+V5+deCEDPvR4MBO6QZiKRd8CoQHeHQqdJohG2TqAR+7dbe2GQcVNT01czKhkcABMwPoFL4h+i6JzXKECuFGF7yiAQLsn3pLw1BhM2HJtZBDYnqfaTAsGw5aFgOKmGTQFeHGzjoczDUuErLpVzpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhraHnFtkdn1zU0XbkHRa2q7CHeVY8o0rqEoNEHNdMw=;
 b=bJndXF7913eE0Xk6A1f4/LZN2xCy/jgReXmt+kYT4uix1HU3+M674Oy67R31TUXkwjBM0bs42X4XyyiMpr75rpBeoUotyHN7pQrF6Mp3BL3yPpd2/NMH7HqsVyzQPswY/kfy5yD+8chjaS6EYWZa0tDChupoJl/CQ9oV+6oTNjUvew+sU5OWB5LDwOWrYig1OzW7kfkXEo4nK4qLHWMrNy9CKwrVbapi03in0GEyYWTEDOn4B2hbOhtO9Zww8ShQgewWmb1/BiAjzli6u8yIESDrN551VmIF15lmhppH6aLX1xelfg2yH9b5h41ETL9RQtMGWMFE1dl4GMQ3vot70w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhraHnFtkdn1zU0XbkHRa2q7CHeVY8o0rqEoNEHNdMw=;
 b=aLCntzaduxpa965sYf/ipQm9vGxYUTVA7pAHrrYpQNq32Z3vKLiBhZxA5oMAOtjuTAjAXlR4piSGsfmSOK1O2hrDqkgxwfQcS2kE0iRFbkezMdsaRI+Abm45r0hlnt8HmIkk4pXt0KvPQQR6vsIGWqwsP96piPQVSxmwfS/TfSB1SyOe2G2x8Fxcp0YGNe6pE0FuPe6/2DR/nnMFwolTzvm9lCvDPaPlVmNljsNc7I3P9+2r3xI87nevqXZe5bfei9p3LNAf+UDHDmlgIxE6e0fYZJvsjvfLV31HD3uVqE/B4G3hbkxAxeZFxb7HjXs8rb3NbXPxRxT5h4lYx9Qe9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by AS4PR08MB7904.eurprd08.prod.outlook.com (2603:10a6:20b:51f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Sat, 23 Aug
 2025 13:52:39 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.9031.018; Sat, 23 Aug 2025
 13:52:39 +0000
Message-ID: <ec390d37-0c25-4a2a-b62c-4c4be621b271@iopsys.eu>
Date: Sat, 23 Aug 2025 16:52:37 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/13] spi: airoha: return an error for continuous mode
 dirmap creation cases
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ray Liu <ray.liu@airoha.com>, Mark Brown <broonie@kernel.org>,
 Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>
References: <aKgSY7bOrC8-qZE3@lore-rh-laptop>
 <20250823001626.3641935-1-mikhail.kshevetskiy@iopsys.eu>
 <20250823001626.3641935-2-mikhail.kshevetskiy@iopsys.eu>
 <aKl2Awfe4CIV2O44@lore-rh-laptop>
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Content-Language: en-US, ru-RU
In-Reply-To: <aKl2Awfe4CIV2O44@lore-rh-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GVX0EPF0001A05B.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::496) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|AS4PR08MB7904:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e80fcf1-6e93-45ed-3a27-08dde24c52bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFlFOUZPaDEzaFhtZnZaM2lLblRWYWc1SmJNMk0wQXRjSWh4Rmp4Ykh0Sktv?=
 =?utf-8?B?bDRqYnNoZWtwSnE0Z001S0NCZ28yWFdFOFZBWE54TDdxaTIraml3N3RmMkhX?=
 =?utf-8?B?dWs4bFlxRlV4Y2tYSDFxTU5IcEQrLzV3YjhaMU1hVGlMUlk1SjFjTENqYmQ4?=
 =?utf-8?B?NE9CcVZ3cWNWaC9JcW53Wit6L0M4OGNZdG40ZHl0UHRFbXJySGwyQjhsVGxj?=
 =?utf-8?B?TzZjMnVKenp1RnZDUk55blNpNS9PL28xZ0d0SVJmTVlXRmpCb1A3amJvaHVl?=
 =?utf-8?B?cTRtL3JRRDd1UFliVHF0RldBdmJBVEZNdjdKeFQrWEdseUx5cG5aamVQUzhP?=
 =?utf-8?B?VUpwWkNyQkE3Zlc1VjFxaWFZV0RSZy9aWHV1djFGalRaSzJ1b2Y2T1lzUCtH?=
 =?utf-8?B?U1lwQlFYMlJLVUhZZ0dvTHdUcjNaUkcwYzZCMG91aE1wRFpXYWlEVWJmRWdE?=
 =?utf-8?B?cFBBZFBYSjB6WkNCakRZVGI5TDZGT2F6VTVseHZDaXo1Q3Rldk14ZG9xVmJ2?=
 =?utf-8?B?Znp1TVcvYlFIbFIrZ1hvblpOQWswOEpaNEVzTVVESzd3eDlLUnM0cW81NEtC?=
 =?utf-8?B?aVM0RUxqNFBZYVExdGs0dWo2dXRtNnB6S0ZaT01uYW5lS2ZGR0t2bWFNTFli?=
 =?utf-8?B?Zk43UDVLSmw3Yy9NU280T0FZOGNpOUR0UTZpaUd0NjhHSHhoSFVEOEtpcnZI?=
 =?utf-8?B?N1BRb1UxOE5Mc21kQ0x4N2NPRmtQaFZlVGRmZUhTNXYveDQrVlF5aWl3TUhv?=
 =?utf-8?B?c0xIOGthaGJTaHJQdjBUaGxxNlF4OHkva25tZjB1TlJxR0xGbjZDV2VDMHlu?=
 =?utf-8?B?S3YvUThxUVZUc3RSYWFIaytvdGgrMWhVODRnalhXVFR0UTFBRXpGNzZWZFRq?=
 =?utf-8?B?eFhocUlpcW9CWUNGRmFYK3lWMVkzeDNQSE55a29mTWZqdkRyQVRvcmcxNTV2?=
 =?utf-8?B?K3V4RnBZUnRkdmVNWEN5MlRqenZNc3Y2VEpRRlNsNWwwMHh2dHcwMmFwVEwx?=
 =?utf-8?B?Yk1haUxTUy9Ga0RUd0RqZGkrbmpvcTJoejVYRkNoU0VicEVLdEdDWENXRklk?=
 =?utf-8?B?dldua1pZZVV0K0Z4bDR4cHJKMlVHL3pGaWF4VWpMTWRSWStJR2plVm1tZGZC?=
 =?utf-8?B?TFg5ZzBhbGE5SU1ZeFcvRkl1cXQydlQ3UEdTYlZoWUlCYmNnMkxYVDUwR0t0?=
 =?utf-8?B?Z2pvbGdrcHd1cGRBblpJZnRyQ1NDK3dDL25tMW9XZFg0TzlELzRVRjRna1Q3?=
 =?utf-8?B?R0ZVZzl5NVFZVitqRmRIRzM5akxFajV4R2ptQUFCYXJkZkpRV3JTN2l1T01X?=
 =?utf-8?B?amYxMnRqSVl3ZmNKOVRJTHFYSkJoMXhBakQzOFV3K2htZjdncEY3TXgvbitw?=
 =?utf-8?B?czdNWnFLemliMXJPdEt1QnBCbitldWpHQ3haQVhsV1lTOXp6RDUycURHY1A5?=
 =?utf-8?B?OFlmdkYxTnlwU1hzenM4NHdDcnAyclJTeDluSng5TkpkeFpkSGFtT0IzcGVU?=
 =?utf-8?B?RFlweWFvQVlDaEhtNVN0Z3ROL3ZzYjRSYUtFam1wcG5mM013NlpBRDNZdFVF?=
 =?utf-8?B?dUdBMjB4UCtocS9wL3UvOGFWT3FhZDdTQzQ1K3VWajZjSHpWQWQyaGh3YlpY?=
 =?utf-8?B?bk1SdUJ5V2hUVXN1RnlCS1NuZzlWMU45UE5jSW9vY2JGbTE4U3kzYVdNOXg2?=
 =?utf-8?B?RTdNd1k1ZlhFeWMvb0tqMFB3RkVOWWZGdTh6ZDRKVnRESXRuWWRSMlB5dldX?=
 =?utf-8?B?L2xEd3hqZVBLMGYvcVQ4TTRqYTRTaG5LbGd6UEFhaU9KR2lSWmQvcTR0R0Js?=
 =?utf-8?B?aTI2bVdIV2JDK2Z6MUJFbEZTTHJ1OTg5SGVBays0RVlhbjUxYUJkZVBYNStl?=
 =?utf-8?B?SWh0bmdpdGllR2NPM0NzZ3RMMUwrajRRQXB4TFNhQWFwZkk2eEdjY3VvTHUw?=
 =?utf-8?Q?52j3U3dlk+o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXR0d2NQUWRNeFlmODlDWFoyNmFYQmJFYVBIc05KUmw2dlV6Mks0L1BXbjgr?=
 =?utf-8?B?c2U0MEl2Q3plOEdjUE0zdURrUWxWWVlGWmdoRWFncGk0cHJxWTFhN0Y1TTJk?=
 =?utf-8?B?bk9UOW1sdlJiOE1LZFEwMEJsNVpKSnVMb0NPNXVOd2JFYlk1Smc0LzdkRitQ?=
 =?utf-8?B?NjdidzI3QnNXamVGQm1oRW9ad2prQ0d4NDZtcUhVV04ranN3VktFdnNuOHJP?=
 =?utf-8?B?dkV1YmdzenVqcG1idnVjZnB0T3A4dUxITjR3N09Fcm51RGIvcUkzTWwyUlNo?=
 =?utf-8?B?ckt5d3NhSGJkR2RpSENtcHRENXltb0s4VmN2ZytyNkhjL3ZkNVEvSXdtbmFF?=
 =?utf-8?B?b2UwSnU3bi9kbVZ0bkpNZDRERm81UnlUQUhYTStYaGF1enVPNGU4OFp2eUtM?=
 =?utf-8?B?UUtXdnpleEdET1lwZWRvOEJMNTZhU3IvOGRjZ2JUU2hTS3JMOGZJTXkzSDVo?=
 =?utf-8?B?ak40MkZRdU02WEIrS0lwNnI4YjVOdlRHT2dDQmYzNmtic2I3T2ZWaDgwZ3Fs?=
 =?utf-8?B?YkdYWVE0R21aZlFVS1Rvdjd0WUVtZVhnQmM2dXRDUUJUSk9YektEOVVEOXR3?=
 =?utf-8?B?dktaUjhobU1RdkF1NFlWTzBUbCtLeDdCL3dKNXRCd01uaUdhOWZuM2xHRFcz?=
 =?utf-8?B?SGROSTM2U2J4em9aVkhRR1Z4SDRMbC94QVlZWkx0YlgzQUlzTUdCSHd4ZXkx?=
 =?utf-8?B?VjFsM0VzZHBGbHViUmxrQ3BTZzYvRG54N3J0YmRmQ2VFd3pkcVBHNFROQnZn?=
 =?utf-8?B?cWMxQStqOFVmUGtxeFl5N2FSNzBtZHlrMFpnMmp5WDg3S3o0M0V3RlN4Y3Vh?=
 =?utf-8?B?Ni9xaTNncERUR2F3bVE3STdtSlpvRHVxSjZKaEFGazJkNU50ZFUra0JoNGU5?=
 =?utf-8?B?bk5RRE5DbEJRU3lKTGtpMDRRVXMrMDJ0bFcwb2pteGNLeGVtZHljSXpTWllo?=
 =?utf-8?B?Tis2UnJtQ0E3SzhHMzZ0NWdFTjVGMWV0TW9XTUhSS3Z0OW9mNXNLc3lRbjM2?=
 =?utf-8?B?NzdoRms2QjBPYkVTdjVDN094akw2cXNnRWhCVlJLS3JWSDNkOWZocHF2Z2Mr?=
 =?utf-8?B?dDEyUzVlOFZVSkZkeW9HNlI0ais2QjRIZEJLNXFVNzg0ZnNBR0pnSnVIZGlH?=
 =?utf-8?B?Q0NTdkcweElGYm1ZeEJYZE1tYU9GcnJhTXNLeHFSOUZYU215VzRKcE9ycUZw?=
 =?utf-8?B?RVFOT1dpaHhaM0JXcEc4WWdqbEdmN3RMKzYxZVpBL05aOVFycHhKRnVJenJk?=
 =?utf-8?B?UVVPaWVRc0ZzbXlORFp0cmRDTzRUdjJOcDE5RUlxR0VpN1kvYno0d2cvQWhB?=
 =?utf-8?B?cUFCQTI1YnBZa3JrUGczWXI0d3ZEYjhmUVFhejk3WE42L211UkZTbGo4d01U?=
 =?utf-8?B?UExrYmIydDI5amhVVFdtaWNuSG9sSSttdU44aEtVcnd4RmpUK0p0WFI4U0Qz?=
 =?utf-8?B?MzNMSUErNW9FbHN1OHFYZjdYTURQRTczd1JPODBTMGxrcDN5czNNdWIvSjhp?=
 =?utf-8?B?NGRBazhnUk1ZOHFTSm52Nm0zaXprVS82ckovVEtNamcvVDlIQk8xUHB2Y2hL?=
 =?utf-8?B?SXRDYnMvRUNFSXd5Vk5ORDBaaVZlakRWSTNDNWwwSWpNZWFXVFpaWnEzMHpp?=
 =?utf-8?B?dEY2d2lHbVhlZm1UQ3ZXUHFyVEtZME9TSFE5V3UyMnFaOGhiRWtXRVVDbWlU?=
 =?utf-8?B?T2xRQjhDLzd0Mnkzam5WUGdLbUgxb3hiUDhMNGxnVWN1SHBrSkFHSnNBdFBy?=
 =?utf-8?B?MXBBT0lSY3NSa0xjUjlRZXI1OXlmdXpnRW5ndWFCclRWbkN3d0liWFl4aXAr?=
 =?utf-8?B?ZHNscmtEWU5ORW1JT0czM1FvQ3Q5RVl2YUk3U0k1TFVKenRaTkpOWE9VQnpl?=
 =?utf-8?B?OXJJM0pWaTV1Slh6UEtCQzljWm1PeTJyS3JIa0FLeUZtMXFyaHhZQVlSL2R3?=
 =?utf-8?B?UG14SjBkRnJDMCtUUDUrSTl6aGRJSWVsSzFFNDBmdmJsNVkwcWhGZytOZCty?=
 =?utf-8?B?bVBtd3BkYThRN3c2ckFDcEtmdXB0UFpxeHFXb1dydXRzN3MrM2p0My9nbjIy?=
 =?utf-8?B?YXZtWHZlNkkvd0VCQi9LTDcvR0Q4NmJocnM5YXR6OTE5ZzdaSXJhUExFT0lG?=
 =?utf-8?B?cnJpRW1IM2VYZnBBWnJuM1d4ci8yNEQ2dHlKMjVYQTRRbWtsRk5HVU5HVnhC?=
 =?utf-8?Q?5Kpbw87Vjq5l1ZG3pfLQAu0=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e80fcf1-6e93-45ed-3a27-08dde24c52bf
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2025 13:52:39.1349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qkiNzJ9oixYOcP3WNR10SmHYGhm2P0m/35gpJiFNNCtLsSYH6i14VUXF6i6g1AF+DOMo1R/CdT4yxDevKvfS5fo/GLBnZ7/u/Ef+/RviyAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7904
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_065247_686584_22299D67 
X-CRM114-Status: GOOD (  15.73  )
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


On 23.08.2025 11:04, Lorenzo Bianconi wrote:
>> This driver can accelerate single page operations only, thus
>> continuous reading mode should not be used.
>>
>> Continuous reading will use sizes up to the size of one erase block.
>> This size is much larger than the size of single flash page. Use this
>> difference to identify continuous reading and return an error.
>>
>> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
>> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> I guess here we need to add the proper Fixes tag:

Airoha spi driver was introduced in linux-6.10. Continuous reading mode
was introduced later in linux-6.12 (see: commit
631cfdd0520d19b7f4fc13b834fd9c8b46c6dbac). Continuous mode needs to be
agreed with spi controller driver because some spi drivers (like airoha
one) does not support it.

 So I don't know what should be specified in Fixes tag.

Mikhail

> Fixes: a403997c12019 ("spi: airoha: add SPI-NAND Flash controller driver")
>
>> ---
>>  drivers/spi/spi-airoha-snfi.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
>> index dbe640986825..043a03cd90a1 100644
>> --- a/drivers/spi/spi-airoha-snfi.c
>> +++ b/drivers/spi/spi-airoha-snfi.c
>> @@ -618,6 +618,10 @@ static int airoha_snand_dirmap_create(struct spi_mem_dirmap_desc *desc)
>>  	if (desc->info.offset + desc->info.length > U32_MAX)
>>  		return -EINVAL;
>>  
>> +	/* continuous reading is not supported */
>> +	if (desc->info.length > SPI_NAND_CACHE_SIZE)
>> +		return -E2BIG;
>> +
>>  	if (!airoha_snand_supports_op(desc->mem, &desc->info.op_tmpl))
>>  		return -EOPNOTSUPP;
>>  
>> -- 
>> 2.50.1
>>

