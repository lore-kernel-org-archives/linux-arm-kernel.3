Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA23EF06ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 02:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DnPDKZGG/ak18DAUcJoUs592xGPVfN2gFWoFBJTU6XI=; b=FmECmBy87IDqPtdz4Vp6UOtM1T
	oIOi6pEQEPR/rOfdl+yCmllx8ETuWsb1Vj8D1nD+yFRTqED4Yh7EH6bfKmIV0I/cME4mmlw7nCqcg
	1YcJzHDn+7I7SIjqbgbBnk9Tt11p9T963MO3rQoB3qlNnC7KBWUC5ouD2kc1qjzGsUY8i5S1ACUly
	cWDBESoVBUrf1a3mtZmwKjagh69hgtG9Kf7O2SfnO917A7MNyQ9PSnjFtx7ks6yt83mtdvBZH/JMR
	JpsxmZTIPXOAN07GYAx2b9ON2V+1TsuD1eCnDEwmD/qD/1W6h+w/8yY7I6T2AQuTviDBpvx6cHhRy
	ExCpkWeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpHAY-0000000Ein1-2hFj;
	Mon, 09 Feb 2026 02:38:34 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpHAV-0000000Eilu-0X3C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 02:38:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XIH0cajw4nOcJTl9KD6fNVuScWLv91d1rb2Pr4P0rXc57Hlmfi5C9QTsp0oCD2R4/llQRHtRulcZx2Y7h1dhd9895Y0LPCBCQ4+slI4vTPkuIObejN2vk/NqVH9zCUHdiIMkPMySB68kH5sXAEX40i7PxWDNGiGcrU86cUsBaJAlk6R57JZ78aBTg2lBFUfx+OJJAlWMb25KqwNBQpkLNDMG3ZxtzEV99QoqHb+e3BtXcimP6yQWy+IqGRJqBsJ0q026LrZkHzDf5MvVZox3NKWS9BcBD+roW0BaT9ko8BwQkTmBMamFjEjpqbJZAvD9kVHGAAQT4lMkrdx3AO5uUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnPDKZGG/ak18DAUcJoUs592xGPVfN2gFWoFBJTU6XI=;
 b=ESo3o9Lx0b8GPm2RxYB0JnsgrYad6xRZdwxhLvgfP/GMiWMqmOLeeW993aYzwr6A6L270F1Y1wbHqKeQJtdmyPCngiIvcXeu2lHj8uYNiYmUQ5vZbGhzMaCphj4x9ki0osxKTag7aZbl06ZLGxJ7zfCl8WAgOtYNY+WXpBhNCq7n5QrtRBtoKLAmerGxUCnGb3aAJZ1a8ewURv+R2SBot3Hlz/2Ma+yuuYbqXDUxoe7iUnvsx2jS66zvAIBDWDvthk+pcRv82B/1EDNRw2A9V+ZgIO7MMzNzQ3NUV4+InwCXpa9lsNXtd7GyVdXPlCUZfVoiBoeKWjDoBBaIqPczVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by TYUPR06MB5925.apcprd06.prod.outlook.com (2603:1096:400:354::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 02:38:18 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::f320:58f6:4dc6:b908]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::f320:58f6:4dc6:b908%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 02:38:18 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Peter Chen
	<peter.chen@cixtech.com>, "unicorn_wang@outlook.com"
	<unicorn_wang@outlook.com>, "inochiama@gmail.com" <inochiama@gmail.com>,
	"alchark@gmail.com" <alchark@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: =?utf-8?B?5Zue5aSNOiDlm57lpI06IOWbnuWkjTogW1BBVENIIHY3IDEvM10gZHQtYmlu?=
 =?utf-8?B?ZGluZ3M6IHNvYzogY2l4OiBkb2N1bWVudCB0aGUgc2ltcGxlLW1mZCBzeXNj?=
 =?utf-8?Q?on_on_Sky1_SoC?=
Thread-Topic: =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtQQVRDSCB2NyAxLzNdIGR0LWJpbmRpbmdzOiBz?=
 =?utf-8?B?b2M6IGNpeDogZG9jdW1lbnQgdGhlIHNpbXBsZS1tZmQgc3lzY29uIG9uIFNr?=
 =?utf-8?Q?y1_SoC?=
Thread-Index: AQHclXrrewrnwC3gtEqZNCvf3astaLVz1EwAgAAGp9CAAJ0TAIAAsp3wgAAYiwCABGnEoA==
Date: Mon, 9 Feb 2026 02:38:18 +0000
Message-ID: <PUZPR06MB58874435D76DB634D0A4A84DEF65A@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20260204020644.155094-1-gary.yang@cixtech.com>
 <20260204020644.155094-2-gary.yang@cixtech.com>
 <20260205-noisy-fabulous-bumblebee-e0cb32@quoll>
 <TYUPR06MB587652FD43724BE26B15975DEF99A@TYUPR06MB5876.apcprd06.prod.outlook.com>
 <f8ac62ad-5b04-4148-aee6-cd401a2143cd@kernel.org>
 <PUZPR06MB5887AA9C68D11448A3125E58EF66A@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <a7ea63b0-f787-49f2-8e31-d3849b6b0518@kernel.org>
In-Reply-To: <a7ea63b0-f787-49f2-8e31-d3849b6b0518@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|TYUPR06MB5925:EE_
x-ms-office365-filtering-correlation-id: b5b93df3-4d94-43c5-bee5-08de67844877
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?a1B3R1ZUMk5uNzFMUHhVZ2xjTFhJeVY2YjN5SjFWcS9vdlFlOGR1V0Z4YTNl?=
 =?utf-8?B?ZUV1TFoxVlV6MVQvMXpJUjVHZThUbW5wdGdsWXJYRGRkcGVRZEZwLzM5Wkxn?=
 =?utf-8?B?SndTbkhuUFEzdjdiN2YwdUNpZG5laUNFczUrMnRYdmQ3UXlTTUdZZjQzN01C?=
 =?utf-8?B?Z0lSMDA0emFLMnZ6cjMyRHh2MzFJRkc0NWVjMWc2VDJic1hXb2dUeXJtUGZT?=
 =?utf-8?B?N0thZDJRRnBZaDc2QnVROEVUOXVKMzVLaERDV09JbEh5c2p4L2dFQ0tRMFd3?=
 =?utf-8?B?cmtLb1IvVWpDdkNGYzZqM09BWHdKVFR1MFRDSVFON2VXVVBEYTMzZDIxSG51?=
 =?utf-8?B?ZTRPK1ZLODkvM0VqNlk1dHdvMGxHVjAvN1hPQnVNNDRCUXdqd0dTeHgrMzhB?=
 =?utf-8?B?Tlc0Q3Z4OG85NE9jcGlKMnRXelkvbDlrdTUrM0I5ZENZbktlbVJReGFFeXBJ?=
 =?utf-8?B?MVo4Skd0akhCRG1YU3R3ZW05NVh1U1VsQjA3bHNmaHBzLzlhTG5hY1Y1bVgx?=
 =?utf-8?B?L1E4eDdIUFVjbjhteFlYc2t2YklDQVNqSW1pV0dGcmFpMXdvUGdCN1J1L1Jz?=
 =?utf-8?B?amRYWUx1RGZwSm5qejZ5L0J6Q0lkaTFiUVBBWTFrRzY5bjVFbXpXVE54UzRM?=
 =?utf-8?B?OERUYnpCUE5YWElGaExIV2lLOEJhVUZ0NmVvZmZUd1lRd2ZLekloTkxHU0Uw?=
 =?utf-8?B?TDlXcmtnS2ZUc2VZQ1A2NHdSQVl5UzI5Q2N4ZWltbnlkRERWUTRhbkFPaGhu?=
 =?utf-8?B?eVRnQUtYN0gvekxFRTR2emRnVFNhVzFNc3oxenZvU0ZKai9yRjQ2aUV5Mzcy?=
 =?utf-8?B?TlM3OEdhU1JYN2k2a0ZRd25oWThKZmVEQmJMUklueVdUQ1JhelBTcGlrUFgx?=
 =?utf-8?B?VWYvLzQxY1pWTFREa1FCeXp1SnRIZHlJUUJrbDBSQW9tN28wczhSK0tWMy9K?=
 =?utf-8?B?Y2dOMnkyandNQ3EzZkx6ZDYvUWRGR3BUYmpBc0QzVHh3ODJ1VmlKT2czSHd6?=
 =?utf-8?B?MzNJZnhscUw2U3pMa2oxY0Uxc0lqN2wycXJqRUIyM2xWa1lhdllTMVhDWUcx?=
 =?utf-8?B?MVBXYnhuRHhsbjhES21zYnJ5aTVYZVpvaEdkOTVHYmlhM0dlbDF5ZzdURDNi?=
 =?utf-8?B?eGd3ck8wRENkUGxoeGYra3N1dER3akp6NjVWazRIWkdvY3hQNk94M0R6Q1pE?=
 =?utf-8?B?T0oyZ1NMOFBkdlBsY3k1aUVXRlE3NkZYemwycVpTMTkwM3VScWlobXJLNjRV?=
 =?utf-8?B?eDNvT0FOUm05NWRJYWVCcnNTdFcvWDJVNVZSajRnNGJmdzYrSVVMZ1ZEMXdl?=
 =?utf-8?B?VDc4RnlJdHlCcVcyYWF4ckxYcjlRK3doN2luK3VzYjVVeDdCLzdmODJ5UDhx?=
 =?utf-8?B?SUZrUXdteUN6Tnl3RWs5RGRkZlRzSER1WXMvaHowbS9Vc01MeWc1MytuTWM0?=
 =?utf-8?B?YlhVRXNWeUxqeDdHWHJVUWRVRUdTUEFROXg3TCtXdHU2dHVPbm1lWXhPNDNy?=
 =?utf-8?B?eTVJbTFUckRzSStNSWhRcllLU0NDK3Jyb3RlWjdqN2ROZS9QVkFURHdLcWw4?=
 =?utf-8?B?b1J5QVdWWHQyM3BYRkpmd3p2RU9VV2FNSUNJRjhtOFBVYTJTVXdQQWhLVnI4?=
 =?utf-8?B?dFVLbkp0QUE5MzJKbHZvWFdqVWxLLzJ4eWZTTi9ieDNUWWYvOVV2YSt3NHZu?=
 =?utf-8?B?V0JSVHZqZ2JzSVUzQW4yYVExVEM2WGJjRUIxRElFQjZhRGpxK1NlWEI2QkNs?=
 =?utf-8?B?dXNYSjhvUWFLYXF4U0c5bDQvcUFFODd4T1k2ZWoydk5PenB2RDVvVjhvbUMz?=
 =?utf-8?B?SEpEVGx5SFNKajRjbVNNWmNjaU5acWR0Tm11Rk5kQUNRTXRDWmZXVTkwbDVV?=
 =?utf-8?B?R0pjOTduM1ZPZ2xSSm5KenRsSk0xY2l6MWt4MHRuQklTSnRwY09GVXF2QnFy?=
 =?utf-8?B?YjBrc3NLcEY5UUxwNkprZlJZTk5CbTFSa0RBa1JFNVp6Z3Vpa2pmbzNqMlBz?=
 =?utf-8?B?R2NxVXlyVGo5ZFpqajNMWHhoODdCaUdnK3hmaGR0NW1MQmZQRlBLSGxaRnRT?=
 =?utf-8?B?RERKQkJvOVhiSXJZVnNhRlhsaEYwUWcwWVdLeUVZd3Q3Z2szT0dkY0thSUM2?=
 =?utf-8?B?VlhiQngrWVBoNVJIeEhqRXRhUmtJT24xdDM3Ri8rVElNZFdGTlJGRTM2NmJC?=
 =?utf-8?B?ZlE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2VlMDI3NFk0ZjZhWWorUUVyWjY2SkVOQXpFLzQxRjNZM2crYnNZTnNtdXQ2?=
 =?utf-8?B?OHJkWUpRMkprWDZZN2srMkMwRDVMYTVHR0FBZ0w5algrTVdCY0hCTkpLb0NJ?=
 =?utf-8?B?b1ZwMjZBRU9HZENrT3k2dmJpNmhFTUg0WUVyWC9sUWo4eGxxa1dzRUJBL1lQ?=
 =?utf-8?B?d3pVTVFlcU0wZWVCMjFzNWhsZ3huNG1CZHRpalZMWng1NTBrWGRSZFp3dTdk?=
 =?utf-8?B?WCtmUTB0YjZEVVZZZll3SkY4TmZ5ZTNuMHZHZ0hIU1NWSmNnOTR2NHBHZVNu?=
 =?utf-8?B?WGo0NjJMMUJjaGQ3eDY1WW9BTyt4WmhVYStTZFFueWQ3bzliYUpRSytrSEVR?=
 =?utf-8?B?dkI0UHpNMmdrQkJycUw1TEtpZzI3ZlM3S3dKMGV6emoraTRLNWRlckFuWXds?=
 =?utf-8?B?ejlGMWNETDFmcGZvbDBaZGwyQ0JJY2tSamJXeVdLYjRxc1FYVUtvS1Q3Q25h?=
 =?utf-8?B?L0x4SXJMYk4xVzVNOHNLT3dNemI2b3dHMUR6R1dzcFlkaU8xUFZUZHdCM2pW?=
 =?utf-8?B?N0p3QXhXTithdVU3RHoyY2NjdTRGUko1cXA1cW1WSU1PYkZBUDVEeDhleENI?=
 =?utf-8?B?dDFGQjRZSmI0aHJ1alhJNHlCTHFGa2ZQRm1XK1RTVkkxamk0aklKMkJtSEJ5?=
 =?utf-8?B?Um9aZktlakhmNllQQ3VvQldzc2tzTm10c3hoZnZIOTA0VXFET2pQNE5pMk9D?=
 =?utf-8?B?a0ZNUTQvdG5PMU4ramlpZzFLQzZXSXhxaDZIT0NMaW1LQ0Jlc2Z0a1hKM3Bm?=
 =?utf-8?B?KzlIQk1VeTZWd3lXT0lnVDdWV3h0d2VuNjk0cDlmUW5ENUNKTVBMdHYxUHpw?=
 =?utf-8?B?ZUN5YUZJOVA3VFAzOTZYSW5pZ2xZUVg4YVhIbkdTcVltbEtOWW9wbklvdkVy?=
 =?utf-8?B?S3RrM1lLbVNyTEJnQVorY1p1eldSTHZUMjF2ZlNDcjY2bUZzUEFnYU1lY0NX?=
 =?utf-8?B?Z0NRTFlvb3NlZWllMTR6SWRoclFQNUJtWnFocTVROFNlZXU4Sk5XbnVSUVNj?=
 =?utf-8?B?VnpINUZPck5UQ1hKL29Ub2d1a3BNbkdIZE85b3ZvWldmM3BKaHJzNzZWa1dq?=
 =?utf-8?B?UjdrRzNJd0hxSEhPZVhmeDY2aU4yOHJFTDFKay9QTXFFQjNNNkVKa2xpRGpJ?=
 =?utf-8?B?Q0FpYm9CZ2pObTVmU09vaWR2YnRWa3JWbDJNaDJtenRKSTR5R0JxUzkzTmJw?=
 =?utf-8?B?d3ByMEEydXhRaUp1eUhLWlk2NWNFTENTQWtVVFVReHQrMWpaSUI0RHlRazU3?=
 =?utf-8?B?SzdkZ01Qb0ZZN296K3hPU1NCZXptZ2hLVW5aMUY3eXY0cWdVTjRqeDk0SXpi?=
 =?utf-8?B?d1JCQVJIVEJmQXpGVEQzd1hrd0JRSGNFRXhUREJtV3h0eVkra0ZWT0Z2dFhS?=
 =?utf-8?B?ajFoa3VPdTNIVFZ3UTFVczAvMGlwdit1Vkd6TlVHZVJkYlhBZWpLVTdoRmQv?=
 =?utf-8?B?bmI3ak9iUDZzTEhYL0pXcTlqSm9TdEhmblh3eVV1L2c2d2tmaFpNa1k1K01q?=
 =?utf-8?B?ZlFiN21QaTEwVHRjUUNRcmtKL2wwRXFicWN1UFlIcWU1YVhDT212dVBJME9B?=
 =?utf-8?B?bDlHcUh0ZmpSZnJsdS85KytRUnNnWVpLeGxLOCtZSko5czhHUTdJZFBWbDhZ?=
 =?utf-8?B?S21CUlV6YnhnSUVzNkV4SlJ6aW1QeXFNamdkYTI0MXBwclRINS9QMmE1Mm1a?=
 =?utf-8?B?RjcxYk9UbW1zbUhlTzdyOW41bXd5SjlRSWFMS1lYVi9FSFRidXFhNE1tTDR0?=
 =?utf-8?B?aGprU0luczNRK3M4ZExoYWlwZVVEOXlISzl1TC9TczV2N2NSU01WaWNTTjVi?=
 =?utf-8?B?dFNqbXBHZmNGV0VXbDdXdkxBZnBtQTVlZko2RUp1eXJnN0NLZUFReFk4WHJl?=
 =?utf-8?B?V3p3dzVEbmEza2tRcnVybEN5ZUxUekdzdVcxeE5yZ1RYUHZpOERmUzVzUjY5?=
 =?utf-8?B?VnJ0dGFEK2VtQXlqYVYzQmJXeVBpamE5WlhvVG5qVE0wTFRzZVcxVGJaeHJJ?=
 =?utf-8?B?YlV0RnMrQlUvcU1IczlUU3hORVBsRENzTHNLYlQ1YVloRUlPNFlVOFVBQlZT?=
 =?utf-8?B?VHd6M0hicUtqRElYQ0lJVnE1a1YycHVwVkNONTZFMEQ1a0xHV0h6cVNzVDgy?=
 =?utf-8?B?REc3SisrVXhQTGJlYVQ3Mm9qUm1NUTZsTDgwYWVkV200bTRGU0FnL0VxY1ls?=
 =?utf-8?B?RWUyS0RYUHlIWjk3NmpSRFBaUGE5Rys4dlpJR3dYOGdyWE0vZWxHVVAvYmVt?=
 =?utf-8?B?dmQxSlVkV1BHNi9mTXBxQjJuN3JYdk8wR1V1dGEwNXA4UFo1ZkJjWEk0YmJu?=
 =?utf-8?B?ZHNTMDJpVUFkaVlFdmpaMUF5Z0pyRDJsd01RM1o0bnExWHZhbXRXZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b93df3-4d94-43c5-bee5-08de67844877
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2026 02:38:18.2083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5tudLDfY7scxM+HwsrdvF9Fs0MEUDJiMjdtkdTYhgheLLeSWOgTE3mpWPl+Sfca/aZ5N9LSSjRvznUH56P/xug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB5925
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_183831_168070_846030C1 
X-CRM114-Status: GOOD (  17.69  )
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

SGkgS3J6eXN6dG9mOg0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMNCg0KPiANCj4gRVhURVJO
QUwgRU1BSUwNCj4gDQo+IE9uIDA2LzAyLzIwMjYgMDY6NDIsIEdhcnkgWWFuZyB3cm90ZToNCj4g
Pj4+DQo+ID4+PiBUaGlzIHlhbWwgY29tZXMgZnJvbSBtaWNyb2NoaXAsbXBmcy1tc3MtdG9wLXN5
c3JlZy55YW1sIGFzIGNvbm9yJ3MNCj4gPj4gc3VnZ2VzdGlvbnMgb24gVjMuDQo+ID4+PiBNb3Jl
IGluZm86DQo+ID4+PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgt
YXJtLWtlcm5lbC9wYXRjaC8yMDI1MTEyNA0KPiA+Pj4gMDYgMzIzNS45NTIxMzYtMi1nYXJ5Lnlh
bmdAY2l4dGVjaC5jb20vDQo+ID4+DQo+ID4+IFBsZWFzZSBwb2ludCB0byBhIHNwZWNpZmljIG1l
c3NhZ2UsIG5vdCBlbnRpcmUgdGhyZWFkIG9mIDggdW50cmltbWVkIHJlcGxpZXMuDQo+ID4+DQo+
ID4NCj4gPiBQbGVhc2UgcGF5IGF0dGVudGlvbiB0byB0aGVzZSBiZWxvdzoNCj4gPg0KPiA+PiBU
aHJlZSwgSW4gY29ycmVzcG9uZGluZyBkcml2ZXIgZmlsZXMsIHdlIGNhbiBnZXQgdGhlIHJlZ21h
cCBwb2ludGVycyB2aWENCj4gc3lzY29uIEFQSS4NCj4gPj4gQWxsIHJpZ2h0PyBCeSB0aGUgd2F5
LCBIb3cgc2hvdWxkIHdlIGRlc2NyaWJlIHN5c2NvbiBpbiB5YW1sIGZpbGU/IEFyZSB0aGVyZQ0K
PiBzb21lIGZpbGVzIHVzZWQgdG8gcmVmZXI/DQo+ID4NCj4gPiBtaWNyb2NoaXAsbXBmcy1tc3Mt
dG9wLXN5c3JlZy55YW1sIGlzIG9uZSBJIHdyb3RlIHJlY2VudGx5LiBHb2luZyB0bw0KPiA+IHRo
ZQ0KPiANCj4gSSBkbyBub3QgdW5kZXJzdGFuZCB3aHkgeW91IGFyZSByZWZlcnJpbmcgdG8gdGhp
cyBleGFtcGxlLiBZb3UgZGlkIG5vdGhpbmcgbGlrZQ0KPiB0aGF0Lg0KPiANCj4gSWYgeW91IGZv
bGxvd2VkIHRoYXQgZXhhbXBsZSwgaXQgd291bGQgYmUgb2J2aW91c2x5IGZpbmUgYmVjYXVzZSBp
dCBpcyBjb3JyZWN0Lg0KPiBZb3UgZGlkIG5vdCBmb2xsb3cgdGhhdCBvbmUgLSB5b3UgaGF2ZSBu
byBjaGlsZHJlbiBoZXJlIC0gdGh1cyB5b3UganVzdCBwcm92ZW4NCj4gdGhhdCB5b3UgcmVjZWl2
ZWQgcmV2aWV3IHdoaWNoIHlvdSBqdXN0IGlnbm9yZWQuIFNvcnJ5LCB0aGF0J3Mgd2FzdGUgb2Yg
b3VyIHRpbWUuDQo+IElmIHlvdSBnbyB0aGF0IHdheSwgZG9uJ3QgYmUgc3VycHJpc2VkIHdlIGFy
ZSBncnVtcHkuIEhvdyBtYW55IGV4YW1wbGVzIHdlDQo+IG5lZWQgdG8gZ2l2ZSB5b3Ugd2hpY2gg
eW91IGNhbiBpZ25vcmUuLi4NCj4gDQoNCkknbSBzb3JyeS4gRnJvbSBzZWUgY29ub3IncyBhZHZp
Y2VzLCB3ZSBjYXJlZnVsbHkgcmVzZWFyY2ggdGhpcyBzY2hlbWUuIFdlIGFsbCByZWZlciB0byB0
aGlzIHNjaGVtZSBmcm9tIFY0Lg0KQWx0aG91Z2ggaXQgYmVjb21lcyBmYWlsdXJlLCB3ZSB0cnkg
b3VyIGJlc3QgdG8gZG8gaXQgZXZlcnkgdGltZS4gd2UgYXJlIGNsb3NlciB0byBzdWNjZXNzIHRo
YW4gYmVmb3JlLiBBbGwgcmlnaHQ/DQpwbGVhc2UgZ2l2ZSB1cyBtb3JlIHRpbWUgdG8gZ3JvdyB1
cC4gVGhhbmtzIGZvciB5b3VyIHVuZGVyc3RhbmRpbmdzLg0KDQpCZXN0IFJlZ2FyZHMNCkdhcnkN
Cg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==

