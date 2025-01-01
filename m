Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E55E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jan 2025 12:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1XVO3e10iCLvQ3RoXlwjzoQeZnV6u1ELWJeh+YKnPw=; b=ky2UkRgpPuSVrtx9Ho7jw2ifli
	JunX/LELgqUrtBbBfrac+6VSQ8ICBeBFjJfOZ8Cz06XHXEYokY6dtJQIIK2jw3oA7jLOFocqsDwkD
	D49xvtVneUuHRzCDTsB/JwQf5eCx7i4pNeXYp1sSkTWYCFet6aQ+woKzs0U2NytPxRaZQMGhWmrkc
	XPeqPN2N1LBp+BUc87R6bH+1qVsTBFvyJAEwEHp4GDx66dwavAAanrv9XxBJgwuFUjQhJ/5xPcXc5
	FbybXiB+3app8A37DiCLyGVD3KMm8RBRyLya+tEY0yavts2AZnDbYO+dqnEw2BDgP1hzg910gx1hE
	deQA2eoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSxpP-00000008c0m-3Ub0;
	Wed, 01 Jan 2025 12:27:59 +0000
Received: from mail-db5eur02on20700.outbound.protection.outlook.com ([2a01:111:f403:2608::700] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSxoC-00000008bv0-0MJI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jan 2025 12:26:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/16xYdosx1CbT16KCTwyEhPRa/AUuhEhWf9ehmZmxGKhtb2lu9lS0qkQRU10xUoh4FgcFw4anwPJUaZ55IzsNq5w4Q2CursCgbHo1r+6MeZ+zNbJcmjiCaK6dAQYL2AquaIF2dDpbJlapHTf0EQvJzatDsTv6rQJQWynxdeqcZbuhVnlL8XkMYgnLYaDDidxhRgbm4PP0jI5W1/8nx2kVQXZqkgr4EuzPZWCrS3ZH4RUDFRO+c40vehlEqbwwmSpb6ce35Z+N6V5LBXl2oNM9ALHMrpSzMI+i+hPHyLnyICvkN79mGf40tGn3FbcK/ci31YC2NwhrgOtDVuHT8DBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1XVO3e10iCLvQ3RoXlwjzoQeZnV6u1ELWJeh+YKnPw=;
 b=ArtxNjJSzn7HPcGbOGQeZojJiMyDviHesCW3ZwZ+aEVPFd3mskgxbKqWVnGOChLrQAIB0HDpGWioucw0YzUPwCtgm9L7hVAnEEbMCzuYhwN6ueTVrSCz1FRGbJln3anNVNZa1Jb+jHTjrYrTvImL9aSO6NLyY34djCsjFWdMJ/4EsXmPcif0LHvSO880Bn4ZCV/R9tSnYNUoy2iSJkihlhUSyqJEG9axrOmIf+E5rrHuejwLlmRrHOkDprbgY2LxCOj+/o2Ucc6wlYwbBzhTCj0fTyT3474tXJpG/WFZPQ4vctyXGKHVzhxTgicK4yRhrpn3Gh4ZdG2hH4Dwi3Rd2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1XVO3e10iCLvQ3RoXlwjzoQeZnV6u1ELWJeh+YKnPw=;
 b=jDGaIx2VeAC92/aelFHaO+F2up0uON+pQ2dJSNP/UkWG0j+4FZXANQU+8PfcxSpCgDF9WPWPGk+LI3Lyu0z7I+MHR+QFcB1qWS5OXJBrrDCtZ5GWsmxMlguMjCsE7oQ3OzVE2QKG1NXVPRj5CHV9XLx6KbyNWEdJjOp22GspceE=
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::17)
 by DB9PR04MB9844.eurprd04.prod.outlook.com (2603:10a6:10:4c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Wed, 1 Jan
 2025 12:26:30 +0000
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529]) by AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529%4]) with mapi id 15.20.8314.011; Wed, 1 Jan 2025
 12:26:30 +0000
From: Josua Mayer <josua@solid-run.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am642-hummingboard-t: convert overlay
 to board dts
Thread-Topic: [PATCH] arm64: dts: ti: k3-am642-hummingboard-t: convert overlay
 to board dts
Thread-Index: AQHbLGBE4Oj6TeCKV0+veZ0PVk2MEbKzKEoAgAA2oYCATtkYgA==
Date: Wed, 1 Jan 2025 12:26:29 +0000
Message-ID: <add9ec8c-0515-4563-9108-f40e165352d3@solid-run.com>
References: <20241101-am64-hb-fix-overlay-v1-1-080b98b057b6@solid-run.com>
 <32c1f44c-6bc7-4722-9f73-743ea15cdcbd@solid-run.com>
 <CAMuHMdVZB1iiM5K1VWch5HrohRz+HYu2z1KBXDh2e01TTPgOWQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVZB1iiM5K1VWch5HrohRz+HYu2z1KBXDh2e01TTPgOWQ@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB7586:EE_|DB9PR04MB9844:EE_
x-ms-office365-filtering-correlation-id: 6ac7c2c3-1b92-4fd2-7838-08dd2a5f851d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dnhHbmJiamNNb3NKZ3NUNFk5QlNCUm9hK3VoRlVOQkc0MXNVY0RJMzFMdis3?=
 =?utf-8?B?Um9ubExuZlp1MytaZTIrWUdtMmluSHJMVUwxaEhtS0tjSkhvdkw0Zmo1dGNx?=
 =?utf-8?B?eDV0QXdHMHk0ZE90WFlSZzJxVlV0SnRQYTZPSVhDelliK2h3UjlidnZvWUp6?=
 =?utf-8?B?dnI3U0VPbHFPUDd3dEdHSCtMTGFtUmdxNTFlem5LdnZ0Z25jYmRRbzZveU9J?=
 =?utf-8?B?ckJmcnBicVVVQmYvY05TZEFTRGYxZk5HMkZ0bjZlNmZlc0YzY01BbzQ4aGJk?=
 =?utf-8?B?SEJ0T2NIOWNnTjJ1WTRQV2xjaEcvMEk1YjNYdjFsN3Z0SkVSUWN5WlZ0bnkw?=
 =?utf-8?B?VzZqT0oyQityT3RpZk9FbklQUnRBaUg0TXZzSWRFNktGSVJ1clhEd2NRWnlo?=
 =?utf-8?B?Mk9PbXY5bDhFQmdzdnE2T2Y5aDYwZDRONGdCNERjc2kzZEFmaHRabHNkYndp?=
 =?utf-8?B?dzZ3a2lmcTlMZEp5eHMzWFhKaUtUaG1wMkNpWVJwZzVEbkNGWTZOQlA0Rk5m?=
 =?utf-8?B?OUVoWkVJYlVQU3l1M1NZZFFiT1hUR3dkbFhQUjVwNGIrcjhBVEM2U1dsUFdY?=
 =?utf-8?B?V1VOUnBIdURTQzFMVnhZWFlGcXhEL3k3ekVZVmtWbjVxUUI5UDZ1V2FpWC9G?=
 =?utf-8?B?MEJDY1VsMmoyMFNHUVpneVFOYk54MmtsalBFc1kvYVZRZHBIZDZHekxUQVJB?=
 =?utf-8?B?clo3MW9ETXp2U2h5Z1NXN2NlRzB4TzFaaHprVEZxMDVlOVVDNWt0Wmh5SS9K?=
 =?utf-8?B?OGJOV3NCRXJSL2kxYUtyb2g1cnhMcW5md1dPWUFUZmhuM2k2bHZhMUlwMHVI?=
 =?utf-8?B?N1hkajFTYnFRbjNzNXdIaE80dFhIcitVSzJjT25VTFgyUTJiQWZOaHNVNkV6?=
 =?utf-8?B?cXJ1THpRTSttRnowYmE1bEdMNVJ1Z0JoZEZMeEMxZlB2ZlZXSTF0cjlCTEJu?=
 =?utf-8?B?SStZVjdodEFBeUZDUFdpcU95M2Z1Z0QrdVpnMzdPb3A4WnI4eGxZb2l2Vjdr?=
 =?utf-8?B?RU1ES04yeWVMcUR0Vlk5dW9nNnZoY25LZzdFanNXYVJhZnFNVHZMSFNPSngz?=
 =?utf-8?B?dWdNV2d3NzRwZHlxRW9McDZRS1FMUW1VdVdNanpjOTMxcVpqU1dPYTgxQVFD?=
 =?utf-8?B?SmNYQWxZV2VLSVVRSDBycTVldlRzZWRIL21BZCtEek9HTTlNNHJtK0hEKy8y?=
 =?utf-8?B?cEtZdGFhcUVQYldwWlAxVllybHFJOXdSczJjRFFXeHZlUjVReVhFaGRBbmMw?=
 =?utf-8?B?SUhGOE4zYXdJU3RqZWRSL0w3NTQrMEhvTGtoTXFJQmhpem9oSmQ1QTU4TFJG?=
 =?utf-8?B?QWhuMTJ6NEpKVmpsR0dvaVE0alo1ckd1blZGZ2xVU2FNNGNHQXRYUkoxZTF0?=
 =?utf-8?B?Z08wUFhGUDhrT2hlcDRVNkxVV0k4VVVFMjVlaTVTaHdvVjIwZThCQytJTnI0?=
 =?utf-8?B?cUJxL242cDJ5TnhJb296UlM0aUxlMzdSOGpYZ2NPU3J2TVBCRUdtR2lCaUpH?=
 =?utf-8?B?Sk5yTmtkbHdlSU41YlhBZ25DajE0QzFNRGNIOVE0ZW1ML3dUQWc1bHRmZzk3?=
 =?utf-8?B?TjdhWUttb1N1NnFicWNxeVdJS0xBY3VFa3BHS3FtRXBYZElTVGlWZEVhdHRj?=
 =?utf-8?B?UTU2NVQ3NVY3OFR4MEZSUXZEcVJ4WWVLSUtVTjdQekxLbTNGTm04cUUxemNj?=
 =?utf-8?B?VStybTFrRE1zODVxQVg5aDJ5T2lKYTVUR2I1KzdjRjNnUEpvd2lFbGlRK3A0?=
 =?utf-8?B?NGtENFM5VEljcUpxNHFMRXoxVHpNRllwajVacVRkZ0RxTW5vS05meUpSTmh5?=
 =?utf-8?B?L2JkUEpWZ3B3RGlENUtqSjJQRHlwSjVXOFdWcml3R2hxNzNuNGo3TE54TXNN?=
 =?utf-8?B?djVwMmp1WTN1Vk9Vdk1iYjlNeTlGVEZvVVBOQW01Y25JMG1LSjJ3QnhDcHhJ?=
 =?utf-8?Q?zyRIEEvVv413dyzwygNTpiy3CyBJyK9Z?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB7586.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3hhTnh3NjY4VWpaUGhQU1ZaY0ppODNXVkFidTlhM3QyRWRkYWlidFVBOWlE?=
 =?utf-8?B?MGFyWjZTSWduQlNBSWpwZ1loYWsvaVhMQVVrYWFjR2ZCNkRrdlAzRTNOVmtR?=
 =?utf-8?B?WUR2K2lSZXp5MitMd0NBbUt0SWZRTVBsVUpZNmliT1JiamdnQkFRbzBqTlE0?=
 =?utf-8?B?NnY5T0tNSEVLUnNGVEZVc1ZwM01VN3BGaDdPbkhxQzNpMll5NlNXcWcyZkFw?=
 =?utf-8?B?bjFjZW44cktMSXZsMnNGTnQ0dStQTWNWZHk5NTZYNXM4Rmo3aEg0SWZXRGFY?=
 =?utf-8?B?NTFrVGxMTThTQldvcXpDcWZaZlJZTWs0bEd3eHJyUFBMSTM4NVBQWmhBZlh0?=
 =?utf-8?B?aldBbWZwdXRLdjJ1c1JZYjQ0a1BmT2YwSnpGM0hTOW1xOEtqNWY5YTFZZnBq?=
 =?utf-8?B?TlRmeWRTVlREUHgxK0VibSs3Q1FwUTQwY0V5Tm45UFpZbGwwNHhSdzFRL2x4?=
 =?utf-8?B?K0NkOFNlZENTa0F0bG9BdEd0VGdUbVVzM2xtQXZwNnMwZXp2NVdUUjJzMThJ?=
 =?utf-8?B?ck9vdTBmUVVHQi9tOEJpUGVEU01WVDkrRjhjSzZwMC9iNGdOa2E2aUdrQkdP?=
 =?utf-8?B?YjNWakxHb28yd3Jld3o0L1N2VTZHWVFsWmdmaUpsWERIT2RrU3pRbDNtbHBp?=
 =?utf-8?B?RVNXYzluQnRrc2R4U0c2TVBSUmovN0NQNGdQTkF1MXdLcjRLNTJnYXlYekVy?=
 =?utf-8?B?WWxaQVR6U3pTZ0QwZng2N3NZRXFCY1p0L3ROc2tRaXoyRThLMko4N0JnNzBT?=
 =?utf-8?B?STE0cUcrMlB3VTVLQjF3KzJMTUlnNi9YV0VTbGJhNXMxOHVSMjVqNENNTzBw?=
 =?utf-8?B?dnk5ekxlS0x1bW91VERvYWo1TlpoRUp4Qk41OE82d1hSR3lsTi9MczVuOEZD?=
 =?utf-8?B?emR4NVl3OVI3QVVqalY5djkvL2hPN2dLMXZGTUU3UlZvRXB6UXkraTJuZU4v?=
 =?utf-8?B?UkFrenByMzVZYlJ2ZkJDK28zNllCaEVpYkVPRWM4ckVweUxQU2hoUG5nU3Ur?=
 =?utf-8?B?ZGRsNHYyWDNCakVVc3FyVHhjUmhXQnQrUXhwbHR5QTZVcEFKalAyOENwb0Nn?=
 =?utf-8?B?SkUxZ3U1MjJGL0k3S0hDUnQ2SXpYYmVWYk1rUDZ5WUFhbWRXaTRFNytCWnpB?=
 =?utf-8?B?Zk9ibVdBeGs3bjZOZjNXNXpMcWRlQy9HSXJEMEdPREs3VVZhb0d4N2pySkt2?=
 =?utf-8?B?RnNhdEZGVmZUOVJmaDRJWWRJdStZOWRpUzJQMy8rb3RBdFdyR2dON1JqeGpt?=
 =?utf-8?B?R3M3L21ReHlzTDhXS0E1NGFINVRyUU9MZzBKbHVqUkIvTTN4Mmk5Q0ZHdEVx?=
 =?utf-8?B?aE9DcXRFTGZHZGdTV0JaZFoyS2FSSjRoaGVRbjRrK3JTS3EvNmF3V3h2YWU5?=
 =?utf-8?B?cXhTQ2hIY0t2SVRoZlYzSTBtQVJqd2tlOWlMNjd4Q1BlWEdseHZpZko0TXZ4?=
 =?utf-8?B?emhsNFU0azNBQU9Zc2UyakNjT1ZHYWpkMnBMTGtoMFBmdmlZTHp1bHBoRGVx?=
 =?utf-8?B?cWJEb1FZK3ViaFhaK2VRd1pIbHROdTVtTTdKRE1NL1ZOVHNaMUcyUzJKZm1B?=
 =?utf-8?B?Z3R0Z1ZyeFFWOFNiR2Mrby9WVXB6U255VVNTNlp6ZmphRTJpK1ZLUzRUU3Ny?=
 =?utf-8?B?NGdEZEJ3OHdFelYyZDRQSUhBUkZVVkVPekJGdm14WmJnMnBhc3dyb2M0bmZ5?=
 =?utf-8?B?VHNOTUo1RDhicElvUUNNaW9BVEF6MXljSUJPckZYNE4xaVd1MlRkR2R1OFUx?=
 =?utf-8?B?ekNLZzhqWVVSdk1zQXlsdE5RTzZ3ZFcxZm44cVJCVUdVelA1dmhBU2FEbTFY?=
 =?utf-8?B?WmpicnpPNmQxVStqRzJBK3hBVGJVOG9hNTAybFE0NzJhRVNOQmVPRnRqQmEz?=
 =?utf-8?B?ZE5ZN2dUQU9VQkdMKzVhaitWN0ZtZkpIWS9YVEExdUdxa0l3YWNHZlRyN0Q2?=
 =?utf-8?B?R3ViTzM2U29HaStPdWp3TzR6RU5RTlFPVEljS3Y2UitxTmUwU21ZZDhSMmNH?=
 =?utf-8?B?ZU56NWx4QUxYaHQ2OFNYMHFrd2NRYnZnb3pqaHRBMjJ3UThvMWttMXlnYVRa?=
 =?utf-8?B?aXlXdVdxR0c1YnFoL3ZRZzlMc1A2cUFGQjRqRW5WUnpub0hwZzNnZjNvTG40?=
 =?utf-8?Q?pjpQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2036D21856E5E94EA60D99DFF9CD71B3@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB7586.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac7c2c3-1b92-4fd2-7838-08dd2a5f851d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jan 2025 12:26:29.9510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ii0V0oBm0KHx69FO/eqYEJ9W+ctpgC/NKB1J2ow2nCgXihyj0QdD2oS9XfFDr9sFoG0NWRIZoeiXSv9AdcYAKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9844
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_042644_135866_B3DAAF60 
X-CRM114-Status: GOOD (  18.52  )
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

QW0gMTIuMTEuMjQgdW0gMDk6MjEgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46DQo+IEhpIEpv
c3VhLA0KPg0KPiBPbiBUdWUsIE5vdiAxMiwgMjAyNCBhdCA2OjA14oCvQU0gSm9zdWEgTWF5ZXIg
PGpvc3VhQHNvbGlkLXJ1bi5jb20+IHdyb3RlOg0KPj4gQW0gMDEuMTEuMjQgdW0gMTU6MTYgc2No
cmllYiBKb3N1YSBNYXllcjoNCj4+PiBTb2xpZFJ1biBIdW1taW5nQm9hcmQtVCBoYXMgdHdvIG9w
dGlvbnMgZm9yIE0uMiBjb25uZWN0b3IsIHN1cHBvcnRpbmcNCj4+PiBlaXRoZXIgUENJLUUgb3Ig
VVNCLTMuMSBHZW4gMSAtIGRlcGVuZGluZyBvbiBjb25maWd1cmF0aW9uIG9mIGEgbXV4DQo+Pj4g
b24gdGhlIHNlcmRlcyBsYW5lLg0KPj4+IFRoZSByZXF1aXJlZCBjb25maWd1cmF0aW9ucyBpbiBk
ZXZpY2UtdHJlZSB3ZXJlIG1vZGVsZWQgYXMgb3ZlcmxheXMuDQo+Pj4NCj4+PiBUaGUgVVNCLTMu
MSBvdmVybGF5IHVzZXMgL2RlbGV0ZS1wcm9wZXJ0eS8gdG8gdW5zZXQgYSBib29sZWFuIHByb3Bl
cnR5DQo+Pj4gb24gdGhlIHVzYiBjb250cm9sbGVyIGxpbWl0aW5nIGl0IHRvIFVTQi0yLjAgYnkg
ZGVmYXVsdC4NCj4+PiBPdmVybGF5cyBjYW4gbm90IGRlbGV0ZSBhIHByb3BlcnR5IGZyb20gdGhl
IGJhc2UgZHRiLCB0aGVyZWZvcmUgdGhpcw0KPj4+IG92ZXJsYXkgaXMgYXQgdGhpcyB0aW1lIHVz
ZWxlc3MuDQo+Pj4NCj4+PiBDb252ZXJ0IGJvdGggb3ZlcmxheXMgaW50byBmdWxsIGR0cyBieSBp
bmNsdWRpbmcgdGhlIGJhc2UgYm9hcmQgZHRzLg0KPj4+IFdoaWxlIHRoZSBwY2llIG92ZXJsYXkg
d2FzIGZ1bmN0aW9uYWwsIGJvdGggYXJlIGNvbnZlcnRlZCBmb3IgYQ0KPj4+IGNvbnNpc3RlbnQg
dXNlciBleHBlcmllbmNlIHdoZW4gc2VsZWN0aW5nIGJldHdlZW4gdGhlIHR3byBtdXR1YWxseQ0K
Pj4+IGV4Y2x1c2l2ZSBjb25maWd1cmF0aW9ucy4NCj4+Pg0KPj4+IFJlcG9ydGVkLWJ5OiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPj4+IENsb3NlczogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZGV2aWNldHJlZS9DQU11SE1kWFRncFRuSjlVN2VnQzJY
akZYWE5aNXVpWTFPK1d4TmQ2TFBKVzVSczVLVHdAbWFpbC5nbWFpbC5jb20NCj4+PiBGaXhlczog
YmJlZjQyMDg0Y2MxICgiYXJtNjQ6IGR0czogdGk6IGh1bW1pbmdib2FyZC10OiBhZGQgb3Zlcmxh
eXMgZm9yIG0uMiBwY2ktZSBhbmQgdXNiLTMiKQ0KPj4+IFNpZ25lZC1vZmYtYnk6IEpvc3VhIE1h
eWVyIDxqb3N1YUBzb2xpZC1ydW4uY29tPg0KPj4+IC0tLQ0KPj4+ICAgYXJjaC9hcm02NC9ib290
L2R0cy90aS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0IC0tLS0NCj4+
PiAgIC4uLmdib2FyZC10LXBjaWUuZHRzbyA9PiBrMy1hbTY0Mi1odW1taW5nYm9hcmQtdC1wY2ll
LmR0c30gfCAxNCArKysrKysrKy0tLS0tLQ0KPj4+ICAgLi4uZ2JvYXJkLXQtdXNiMy5kdHNvID0+
IGszLWFtNjQyLWh1bW1pbmdib2FyZC10LXVzYjMuZHRzfSB8IDEzICsrKysrKysrLS0tLS0NCj4+
PiAgIDMgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQo+
Pj4NCj4+IFBsZWFzZSBob2xkIG9mZiBvbiB0aGlzIHBhdGNoIGZvciB0aGUgbW9tZW50LA0KPj4g
VGhhbmtzIHRvIHNvbWUgY29tbWVudHMgZnJvbSBHZWVydCBJIHdpc2ggdG8gc3VibWl0IGFuIGFs
dGVybmF0aXZlDQo+PiBzb2x1dGlvbiB2aWEgc2VwYXJhdGUgcGF0Y2gtc2V0LCBmb3IgZnVydGhl
ciBkaXNjdXNzaW9uLg0KPiBBcyB5b3Ugc3RhdGUgaW4gdGhlIG90aGVyIHBhdGNoIHNldCAgIkkg
ZG8gbm90IGNvbnNpZGVyIGl0IHJlYWR5IGZvcg0KPiBjdXJyZW50IG1lcmdlIHdpbmRvdyIsICBp
dCBtYXkgYmUgd29ydGh3aGlsZSB0byBub3QgaG9sZCBvZmY/DQo+IEl0IGNhbiBhbHdheXMgYmUg
cmV2ZXJ0ZWQgd2hlbmlmIHRoZSBhbHRlcm5hdGl2ZSBzb2x1dGlvbiBpcyBhY2NlcHRlZC4NCkl0
IHNlZW1zIHRoYXQgdGhlIGNvcnJlY3Qgc29sdXRpb24gY2FuIG5vdCBiZSBpbXBsZW1lbnRlZCBi
ZWNhdXNlDQpjb25mdXNpb24gYmV0d2VlbiBwcm9wZXJ0eSBwcmVzZW5jZSBhbmQgYm9vbGVhbiB2
YWx1ZXMgaXMgbm93ICJBQkkiLg0KDQpUaGUgbmV4dCBiZXN0IHNvbHV0aW9uIGludm9sdmVzIGNo
YW5nZXMgdG8gZGV2aWNlLXRyZWUgY29tcGlsZXIgYW5kIHRodXMgYXJlIGxvbmctdGVybS4NCkhl
bmNlIEkgbm93IHN1Z2dlc3QgdG8gdGFrZSB0aGlzIHdvcmthcm91bmQuDQoNCkkgd2lsbCByZWJh
c2UgaXQgb24gdjYuMTMtcmMxIGFuZCBzdWJtaXQgbmV3IHZlcnNpb24uDQoNCj4NCj4gR3J7b2V0
amUsZWV0aW5nfXMsDQo+DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+DQo=

