Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D98EA3F2B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 08:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/D36z6oIJPtL3sDxmUF10tZTwbyoUzCyLdEvJuwwSPQ=; b=NrSTy3Lp9q6mivDQtQNTsCHFOE
	sr9SrN/GfZkLzxaQMPdTkP5fncpusPBvu3hYL1JdjVjt8oKUZSLBN7Hg4aDpU7JLLXuP71fjqQz4l
	wsEdifk1sBHzIdgqfk/rltth6ehJabJ8L2jsX+AHiPsaxkZVLuWrIiu8bL4mx8VQbwMJ5KFpsGxoR
	h3nnBnMppxWCSQ9ra6Y6ayxK2glUeLpKnSG88rMbJb3hQcKXXWHgSgp+WEmbq6+VhXG/BG9vYx+qi
	C3CAIYWzL3zYzpl/Az5hRX6fVJoJdkgQNKPl3KREtC+GERL4cmLm4aYKgFHV++b4tizxGCLerJ+et
	QiuXvpPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpjYo-0000000GiWd-07Oy;
	Tue, 10 Feb 2026 08:57:30 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpjYl-0000000GiVf-0gSM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 08:57:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VFzaGVD+BQTHzNrrS8INBK39HJFDbFnwbcdz7p1hgBKm1FCX1i5TMbsZUAe5KXMfzk96BiFiZyvN1GaHLhljIx73BftWNKiEhQ2kWx77SfdCdZpuQip8ehk0a0mpSOm6QF/3bLKATe/eibO+dJIy5OtsHvjf0uRgG7bCTMbr5JowKLhJacdBCgJdi46+aeVusPxXwwI9wY3rPnYa7MXE7mvMHEuR/VWmsKO10F0+ghfwi83QmxiVf/0UUZ2t0+/GcpHLq+YA9LfkEhMNAtZWIT9KMNiz4WleLb2zBbHEKxtZ/4AtsAC8lLVhzviZ2Jws0d69ysPbN2SS3zI7ibEUcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/D36z6oIJPtL3sDxmUF10tZTwbyoUzCyLdEvJuwwSPQ=;
 b=qEGnowb7GW3/8h063mERtWLzSocrcejBVU7rgKNzDphV0baaf7TU+3mzOkJYprkCk7wmjpRNRleBNXiBtjAkJ+rkxVFIqBQ5i6T+5LMxevJ2tHXeMBcd+fGpTIkXjHm2JKum3zp78glbwAE/1AwXfpA47l8wIM/ukYvoIrJoQ+IV0boIepDYwa5uzJ/XyNqdq8axFrX2/H+W3/QuLYBPUfR4XMZ6eJAVv37EG71gJzNz0E2e0C6GoJLZUQU0qzGfYCf1xpGrNRFneZpN6TzmXzGQeoSIz49BkGcdo2iAQmBXB1gACS7tB2Q1JjfX0ZdY0JY1p2z1GScUsyPUQkQSpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by TYUPR06MB6123.apcprd06.prod.outlook.com (2603:1096:400:352::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 08:57:20 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::f320:58f6:4dc6:b908]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::f320:58f6:4dc6:b908%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 08:57:20 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, Peter Chen <peter.chen@cixtech.com>,
	"unicorn_wang@outlook.com" <unicorn_wang@outlook.com>, "inochiama@gmail.com"
	<inochiama@gmail.com>, "alchark@gmail.com" <alchark@gmail.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: =?gb2312?B?u9i4tDogu9i4tDogW1BBVENIIHY4IDEvM10gZHQtYmluZGluZ3M6IHNvYzog?=
 =?gb2312?Q?cix:_document_the_simple-mfd_syscon_on_Sky1_SoC?=
Thread-Topic: =?gb2312?B?u9i4tDogW1BBVENIIHY4IDEvM10gZHQtYmluZGluZ3M6IHNvYzogY2l4OiBk?=
 =?gb2312?Q?ocument_the_simple-mfd_syscon_on_Sky1_SoC?=
Thread-Index: AQHcmacxJy5eA4tDnkefPVMOiCJO7rV6PK4AgADu0yCAAGAkgIAAAwmw
Date: Tue, 10 Feb 2026 08:57:20 +0000
Message-ID: <PUZPR06MB58873885549190391D4A7690EF62A@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20260209093344.2013693-1-gary.yang@cixtech.com>
 <20260209093344.2013693-2-gary.yang@cixtech.com>
 <4a26d89a-95ca-4888-aaea-876b9612d006@kernel.org>
 <PUZPR06MB5887D218A0A69676ED2FEBDFEF62A@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <2c7ebaf4-5f0c-4712-bf7b-d5b2fa6e5366@kernel.org>
In-Reply-To: <2c7ebaf4-5f0c-4712-bf7b-d5b2fa6e5366@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|TYUPR06MB6123:EE_
x-ms-office365-filtering-correlation-id: f1d4cf8c-0c62-4674-a1c8-08de68826674
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?gb2312?B?aWNoZUNyREIyTUlrYzk1NEIrZFZMMUlxVk93WHpvamRIcnZyUFh3eDJNN0Z4?=
 =?gb2312?B?dkp0ODBPb0hLZjRYdzJHeVgrUHozSGNTRHB3VDc2dm9kVVBpMU1zcEFDUkpq?=
 =?gb2312?B?TWh3cUlmRUo2OWFweVl5L2tmY09vM200azB2bVlpNEgwWGhpdlh1QkpPem9x?=
 =?gb2312?B?VUt1eVRIdmN6clVVems3QVhvUW9UUmZwTEJHRXp4Q0pyenpFS05jUjg4Titn?=
 =?gb2312?B?Q1pRL0d3M1ZNVU8zUFZpUDFmYXQwTlZxaVlISHZUcG9xcllxTXFwQmNyWS81?=
 =?gb2312?B?N1ZLemVnSytSc3JGOHVkTHVyNzAybkFFQXpCd2N6aVhvVVp3VzgwS2hFY01K?=
 =?gb2312?B?SGxaMXBRcEhqcjdpN1J5eEljaHQwV2xWMmdNaXpuUmQ4WDJVdlZlSDIxa3dz?=
 =?gb2312?B?ZkxLbnpvRkRhNkU1R0pEbnZvckNvK0NScCthV3VvV1ZaNUd5bThra21kV3Fv?=
 =?gb2312?B?REZ3L0k4SVpLNjhyRUJRZW5YRGU4Y2xheGtPK3JUYk91NnhHZGVDSUhsT3h3?=
 =?gb2312?B?YkN6SjlTR0YrS2JOdk5mdDk4NXZOSkttZ0ZjTnNScTZSMmNaM3A5WmVwSXQr?=
 =?gb2312?B?Wjd3T1krVGN1bzVPd2grOFlxdE9RdnVocEFmSS9xeTgzZTZRaDZ1QlVCcHVG?=
 =?gb2312?B?dTEzWWdhOUEvUzF6TmtDNHJBbW12N2VsenRqeW93WU5SL3ZqUXpsdTVHS2la?=
 =?gb2312?B?bDVTZjlsNnQ3MnorcmIrZjFLcjZjbGlsMVhnMnpFaWxmWHk0c2N1YjRqNktF?=
 =?gb2312?B?b014V1hGY3ZHY05EaGRVQSs1SEJBRFBCbnhXdjdLazR3ZU5qOFZySUlMVmhv?=
 =?gb2312?B?dVZHeFpSUHYvNzVWTi9TSllPSHJaZU5nVzJ3cHFUV3YyUWpEUWFMQ050dHVO?=
 =?gb2312?B?M0pKbWFpSDJIWXJlK0hMeERmMzdab3ZCYVNBMzdvYWVCZ0hBSE0wakVhcFBv?=
 =?gb2312?B?V0k1NUgrQnZ4VVY3V0JIbGtVYVpLeldUVFkxMHhyaTZKZjJxYjhFYVNBb2N0?=
 =?gb2312?B?K2N5NlVkcWpUTnJoUUhtVGY2WnFUWGNsR0FTMWNNZjlITUk0T0FLRk96Umts?=
 =?gb2312?B?SXpzcWFBdVNKc1BiZkZTeHZsSS8vWVhhMElMVnRWNHVBRFdPSzl2QktaZ2tl?=
 =?gb2312?B?eWRqc3M3RGVrWDM1MXlMUDFwZldQeElUbjRRVEFvY09FTXF5NW90di9SWlQr?=
 =?gb2312?B?N3pCWjk4SHBPTHRnNDlJRjN3ckhXRW9Id0p4NnpvUVNNRFVHZXBYTDFxRFZU?=
 =?gb2312?B?S1M3a1o5UXhHYjVJWFkrSURIS2M2L09Bd1FPNENCQkxXTm5CclZQVWlHS0E4?=
 =?gb2312?B?L0IrT1hkZmRQYmFLWGNROC84c0hPeXVTQUJJWlZLZElZYU9DTVdsemg0NjBE?=
 =?gb2312?B?RGlxZExVUWJ6a3hUcVAxR3A1UjdDT0RrTXhLWCtycSsraStNcjBnM1RHOFht?=
 =?gb2312?B?YmVOOWEvNUFOTEQ0TWdwYjdUOVBlUVIwbVRmM1U0QVRGSjRCUW12UHlpWE1y?=
 =?gb2312?B?azZBOXI1V1E5MkJIV08wNnh1MS9TYzV0OXBTcFU5U1lXZzVFdSs3eCtyMW0v?=
 =?gb2312?B?OER1dTk1OE1XbkxEK09WOUdHRlNGb0FFQ0ZUVThmZjhaU0Y4YXJMOXdQcWt4?=
 =?gb2312?B?M2c1eVRZc2swdFRKa0ZNalZDNTMrVXZkdmtzQlZXaDRKenYrR3cxUndjM2cv?=
 =?gb2312?B?Q3d0eE0zNzFSbGxmRE44YTBLQXNXS05tamJkeWxaSDErS1F5SmJIVTZmTm1y?=
 =?gb2312?B?b3lRMGhUaFRHbjFkeGVNTW9Nb0lwT0dwVmk2SGwvT2VqYzYrbWdNKzVScDFn?=
 =?gb2312?B?eTc0dG52LzZ1bnlZOEVqMHBOTFdjM1liZ0ZyVnJrUlRLTlAwWUhhQVhoZVBB?=
 =?gb2312?B?dFVrTnc2aEc1RGpkVlNMSGtXRk5SZ2o3dE0yTnJndDVEZjEyWTE3TkpmZTBC?=
 =?gb2312?B?QW5OU0I2dngwNHEvSW14cjFYUkVSaUtXNklqNnRwQWhLT2ExNjNyMjFCdXFm?=
 =?gb2312?B?NktuVTJweVc1TFV0bThxS1NwZDdKOVNKeUk2K0JFQXJON1E4MFF1eS9OeXVq?=
 =?gb2312?B?b0o3UVk5b1d1RWFMWS9xY2JzWldhYVIySmIxdTFRV3RIK3RWR0xueTdxUlZz?=
 =?gb2312?B?VmR2ajJQNE5EUERHQXdVVEVhZll2L0NBaVBKaUE1SzV5bUQvSUdiZHYxVlpW?=
 =?gb2312?Q?GFxowazp6FO2wizz3Nu88OU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?bVJWZG1jSDRZaG9wUnFIVjNxUXhpSFdaUHNVbTlyRndKcFVMNmhhZ2ZuNndy?=
 =?gb2312?B?N0NpT1dmQm90MlZzdWpEeUVrSUFwVjcrSy8yOGl4VGt6RlhmU3BFajJIajht?=
 =?gb2312?B?cll1K1NWeG5PYTNJUzhXaE5tczMvNXpZUDRuU0VWa01zdlZMNnB2UmZSNFZE?=
 =?gb2312?B?aDFDaEtzcWMrWFY5M3R1TmpRaVFUaVkrSDk2b2lQYlZxbUtFWkdZQlVwbGc3?=
 =?gb2312?B?NWYrQ05IUi90Y1p5ZDh0dzRCZTJ0ZXhkMHM2U292TWphYXB0MDlXbGcya2pt?=
 =?gb2312?B?WGt6cGNPdndJbVY2SWdMWDJDcUdCNGR1TThBTEVsckNZSXpCU2VNUnViWjJz?=
 =?gb2312?B?aEUzckhXOGxYYkFxeXVXeFNKVlBYa2tIc2F2ellzQmw1WStTNmV5N1k0a1pM?=
 =?gb2312?B?ZDhpTHZ4K1A2RmMvMW9wVm9aNjZRckpKa2w2VzE4Z2R4bkQxZmU0dlZVZjg0?=
 =?gb2312?B?UFpBM1FjT1pDTFpvSzhqTmNVZWs4SHBWRngvVG92SXBxbzBJRGI0TlE3bXpY?=
 =?gb2312?B?cFFIOGQxS1lndTJUbVJ0V25icnlFdGdMbXdCTmZCcGFEQS9VaUFKUW04cHVR?=
 =?gb2312?B?S2lOc3Q2eFhjdXI2UHFFWW9xUXdHdFZOejVZMitBY3VkbVFZUGZZa2ZsaDMz?=
 =?gb2312?B?SUZaNURPZWRjZ3g5bGdXbVhNaG95QVk5dEl6N1NsRnpkS2ZJWnVMZjJlNmF1?=
 =?gb2312?B?T0NMZEpBbVRUd1ovWmZycmZzRGh2ZW1vZ2NNUUwrdW1ITXBTZXYycW1kU1VS?=
 =?gb2312?B?djV6c3NobTh1d2R0WlU2NlUzOGJ0bjdHWmlmT3BFMi9DMmxSWEJGR3lDM1Rw?=
 =?gb2312?B?QjJnSURmSHdKV2ZPZStRK2tQeFB1QTZpTlIzeFdCWGgxK1Z0RjgySU5WMjdC?=
 =?gb2312?B?V1ZrM2FVZTg1bSsyZWpjb0o3N2xLZGNmbHJOR2liWHJHR0FQeXBvQW1oSkNK?=
 =?gb2312?B?ajJSUEQxTXo2SENiZW1CU1RMQ0hxdGViNlVjZUM2UlkxbWh0ZW9OajNZWXp4?=
 =?gb2312?B?aDNqdVYzMjI4QmxPcHpIdVBLMXpUcEhEem03cGJjS1RrQkRJU3VwU0Z1cWxq?=
 =?gb2312?B?NkZjbFVKZThMWXJUaHNqZ1d5a0d2dDNEL25jdGFhR0NMTE9SUEF5ZnNBSWdp?=
 =?gb2312?B?NGtGcjUrUHpGeTIzU1d3eXgwakJUU2RiRnkwU01LSENONWNuTXJWT0xCcWcx?=
 =?gb2312?B?eGo2dDRWUERVVW9yeFUzc2k2bVlWaEtGZjVCbnFBSDY1K3htVllibWpnVzl6?=
 =?gb2312?B?M09sVlNXSVhaY2RXYStpcHdNcmIyZUlBUkF2ZEVKWEo5U21oZ0RSZy9OU3BM?=
 =?gb2312?B?ZTE4a0x0dTdyQXBCSlFUK0J3YWtEK0R2ZGNzcEpFTTJDZjhiRnQxcWJOTUY5?=
 =?gb2312?B?RmltK3BWZStnRnpIc3BWcGNZZW83WWFIMUtsV1JFeTQ2WktVcVZma1ZXTC9Y?=
 =?gb2312?B?UU9VaFY0NnV1Mk90MGtvK2tscmp2c2ZDYWNkeTIxNmFrVVphUGhlMkVrZmJZ?=
 =?gb2312?B?dDVnTE9TOUl0MW1uRVNIRWRKODI3SmtsZUJRWmQ1bXB2aVJYdVVrZzFJQ3hS?=
 =?gb2312?B?RjZTWXByR0FUQSt5dDNNem5nRkRhTGl2RDFqVUZUK3R3M0E0UzZyWTB3L1cz?=
 =?gb2312?B?RDRYdDdiaFlqTG1LUjNneWJSWEhhVVQ2SlhLUkNxV1JwTnVCMlpnU2tFSHNZ?=
 =?gb2312?B?M2VnRVZtSy9BRlNEQ0w0OUxZUFBySGpvMWJqNkYxZDNoZUxLK2Jwd0Joc2hK?=
 =?gb2312?B?dk9mcFNPa1FPeWVIMlNwYU82WXAweis5V0hUM0pEbEJ1MjV6VzRxVFVZNUtt?=
 =?gb2312?B?akVpYnczWnFXY0ttTy9kcEFiRW4waUswUFJQS0YvN2I1Yll5bk5JbkRkZmJh?=
 =?gb2312?B?UDJqQytNcC8zYTF3UHIvOXBwR1Z3bUtFRm9pU25xOG1jTVJGazYvN2h3OUpi?=
 =?gb2312?B?KzhNTW93NWdvRHEvSWorY2REZFdTdFVPU3Y1dDY1R3JrODRGelFMeTEwNU9W?=
 =?gb2312?B?Z1F2Y3UyWENzMTFVUDdiUGlNbVpuWERLZjZsck1UcStwU09lM09LQXBjTjJi?=
 =?gb2312?B?MTZpMDZiNmt1SnFaK2VTZGpVTm1IR01mcXlIUzRXOG1zQ0NybSsrdkVrY2sw?=
 =?gb2312?B?VUhFOWZMNjlOQUhtQWlNQkhmRFhHaDQxcjVMQ3ZpK3RxNVE3dzJLemU2S3BK?=
 =?gb2312?B?Tk92QlBuMk1CQkdJT0lpQzdMcVFNYnBQdlpZSDcyeXZaR0VRS055enE0b1VJ?=
 =?gb2312?B?T2dUb2UwQm1jSnBRa25oWnN5UWhKeFFBd3FMOUJJb1lPVmkyZnYyamJIdElo?=
 =?gb2312?B?Zi9JbXREbFpOZURiTldBY1BpYmcvb2gzaFlzK3dJSG1GaVhMZnRrZz09?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d4cf8c-0c62-4674-a1c8-08de68826674
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 08:57:20.5937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IfaDiswGT5ciYa/5PpeoIz5CoZF2TsZLYUnWY2vwLfqDTqEhFfMZ9eBRTCBL69m9YZHxOHSktuijUoKG5N/B0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_005727_208129_C61D7353 
X-CRM114-Status: GOOD (  21.38  )
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

SGkgS3J6eXN6dG9mOg0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMNCg0KPiBFWFRFUk5BTCBF
TUFJTA0KPiANCj4gT24gMTAvMDIvMjAyNiAwNDozNywgR2FyeSBZYW5nIHdyb3RlOg0KPiA+Pj4g
K2V4YW1wbGVzOg0KPiA+Pj4gKyAgLSB8DQo+ID4+PiArICAgIHN5c2NvbkAxNjAwMDAwMCB7DQo+
ID4+PiArICAgICAgY29tcGF0aWJsZSA9ICJjaXgsc2t5MS1zNS1zeXN0ZW0tY29udHJvbCIsICJz
eXNjb24iOw0KPiA+Pj4gKyAgICAgIHJlZyA9IDwweDE2MDAwMDAwIDB4MTAwMD47DQo+ID4+PiAr
ICAgICAgI3Jlc2V0LWNlbGxzID0gPDE+Ow0KPiA+Pj4gKyAgICB9Ow0KPiA+Pj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvY2l4LHNreTEtcnN0LWZjaC5oDQo+ID4+PiBi
L2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvY2l4LHNreTEtcnN0LWZjaC5oDQo+ID4+DQo+ID4+
IEZpbGVuYW1lIG11c3QgbWF0Y2ggY29tcGF0aWJsZS4NCj4gPj4NCj4gPj4gSSBhbSBwcmV0dHkg
c3VyZSBJIGdhdmUgc3VjaCBmZWVkYmFjayB0byBDaXggYmVmb3JlLi4uLg0KPiA+Pg0KPiA+DQo+
ID4gWWVzLCBZb3UncmUgcmlnaHQuIEkgcmVtZW1iZXIgaXQuIEJ1dCBwbGVhc2UgYWxsb3cgdXMg
dG8gZXhwbGFpbiBpdC4NCj4gPiBUaGlzIGhlYWRlciBmaWxlIGNvbnRhaW5zIG1hbnkgbWFjcm9z
IGZvciByZXNldCBzaWduYWxzLiBXZSBpbnRlbmQgdG8gdXNlDQo+IHN5c2NvbiBhcyBhIGNvbW1v
biBtb2R1bGUuDQo+ID4gU28gaXQgaXMgbm90IG9ubHkgcmVzZXQgY29udHJvbGxlciwgaXQgY2Fu
IGFsc28gYmUgdXNlZCBieSBvdGhlcg0KPiA+IG1vZHVsZXMgaW4gZnV0aGVyLiBJZiB0aGUgZmls
ZSBuYW1lZCBieSBzeXNjb24sIE1heWJlIG1ha2UgY29uZnVzZS4gQWxsDQo+IHJpZ2h0Pw0KPiAN
Cj4gUmVhbGx5PyBIb3c/DQo+IA0KPiBOb3QgYWJsZSB0byBmaW5kIHRoZSBoZWFkZXIgYmVjYXVz
ZSBpdCBpcyByYW5kb21seSBuYW1lZCB3b3VsZCBjb25mdXNlIG1vcmUuDQo+IFlvdSBkb24ndCBn
ZXQgZXhjZXB0aW9ucyBmcm9tIHRoZSBydWxlcy4gTXVsdGlwbGUgcGVvcGxlIGJlZm9yZSBhbHNv
IGFza2VkIGZvcg0KPiBzb21lIHNwZWNpYWwgbmFtaW5nIGZvciB3aGF0ZXZlciByZWFzb25zLiBJ
dCdzIHRoZSBsYXN0IHRpbWUgSSBhbSBhc2tpbmcgeW91IG9mDQo+IGl0LiBSZWFkIHRoZSBkb2Nz
IGFuZCBmb2xsb3cgaXQgYW5kIHdlIHJlYWxseSBkbyBub3QgY2FyZSB3aGF0IGludGVybmFsbHkg
eW91DQo+IHdhbnQsIGJlY2F1c2UgeW91IGFyZSBjb250cmlidXRpbmcgdG8gR0VORVJJQyBrZXJu
ZWwgc28geW91IG11c3QgZm9sbG93DQo+IGNvbW1vbiBhbmQgZ2VuZXJpYyBydWxlcy4NCj4gDQoN
ClNvcnJ5LCB3ZSBkb24ndCBjaGFsbGVuZ2UgdGhpcyBydWxlLiBXZSBzdHVkeSBhcmNoL3Jpc2N2
L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLmR0c2kuDQpJbiB0aGlzIGZpbGUsIHN5c2NvbiBpcyB1c2Vk
IGFzIGNsb2NrIGNvbnRyb2xsZXIgYW5kIHJlc2V0IGNvbnRyb2xsZXIuIFRoZSByZXNldCBJRCBp
cyBkZWZpbmVkDQppbiBmaWxlIG5hbWVkIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svc3BhY2Vt
aXQsazEtc3lzY29uLmguIEkgc2VlIHdoYXQgeW91IHNhaWQuDQpXZSB3aWxsIHJlbmFtZSB0aGlz
IGZpbGUgdG8gY2l4LHNreTEtc3lzdGVtLWNvbnRyb2wuaC4gQWxsIHJpZ2h0Pw0KDQpCZXN0IFJl
Z2FyZHMNCkdhcnkNCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==

