Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2D4C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 10:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KDz3HeknDFueVE/gFz9XubgZPk7w7L1fm9ia+CxMcko=; b=RWpbfILDmFle1XV0ugPojnEdBf
	uCnVRImuyGbJaVfqJHCp5sMuBGbsxeqFFHREnac+X8srpFIQNSXbTGocQZQn/XOolXb5IX+FEnS6F
	XCbg+yuiXoYDBL+dCIElKMNdiSwYCri+h60nwpqqbvpeLhZybKhBOsYHAJfK+LHdcNz0Nkpal52f1
	E8HAfgkKfzBHovJSgQbIAnPfonQD8AzSoizTwvrDMWrOh26VPa762Kb4pnGQJT6VnwE7HdnvVC4qO
	itw3cQyWoAiPHTS7+XhLTzc517nvuwEmrWIvoYTHYrBzLvJUXhEXLKQXH8GfYxaYYyhY1abg73F6B
	3cgS8vWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BIG-00000006qbv-0oDD;
	Tue, 22 Apr 2025 10:56:00 +0000
Received: from mail-switzerlandnorthazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c213::5] helo=ZR1P278CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AAs-00000006bU1-2yMl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 09:44:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTCsjgXzUP7Bgj2nH2NhpEbMPoqVimSP9MrvwoJY9AZeCJe2n/OP6ancWETbSKh0Ro7V7DSIFSxXd6O5Ih+ADcLMNRMgxovbD9bYsoCJaTDjHCXM4UDqbGS7zYmrC3mVpSS31HH7RHDi+4DKCFzWQfzpxb6VKuY9FSFYfidpfAO9t9wdLfQRdMS/nCzWTzjh0HjqwHWrNyNOaReEr71ESocI5RKWnvs96tusAwLS+1QEjKfKHKV8Bymo7Nm33zccJjocGb8Pk3VyG2CmcmjDNfUFO5mN0wGM1sMXy5L4SZTrppqYAqvtnlu0H/2LHNd0dfhAcdKLtvLhEWRDI802Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDz3HeknDFueVE/gFz9XubgZPk7w7L1fm9ia+CxMcko=;
 b=un42Y80C2TY0nsIs1EH9yj/HqXu/dPY3Vhxr619C7J9LcdUH+CXc/WDT9KciSHmDfmDYtjhEVlYGQ1glEiAe8Fq1UFDtp6gE4XBC/hVpf1BgEMbZ7SESg8I06gS6zyl+Psdme7nIs7vJGcOCdJ9KLduIGmXWrcb3l98ZYwFk6tp4e2vwsYCLp99fpVd6UsGy+7mnunu2vLfeP+QKQbuTGqpLTPnBes80ccPIsTWLBtVKvuuNI9c7xzS23Ci5oNAPMVy3M0PMBHod4nn4M5x3+qOqFDaSH1BOoLoOhHDAE/BYyZAEwB5zCh0toPKbcZzdv9X4e6HgGfhRGVz/AdV5yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=impulsing.ch; dmarc=pass action=none header.from=impulsing.ch;
 dkim=pass header.d=impulsing.ch; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=impulsing.ch;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDz3HeknDFueVE/gFz9XubgZPk7w7L1fm9ia+CxMcko=;
 b=q/Ck/dEtmLXjypCfNkoN8x1fmYcQBNUzSG7PDTJPLePwK8aXAlGxEn8ASOnstpi5nWMOqzMWjXaZna7z3Idu8RXtNCf6Co60+O0taQO1bVo3rarRBO8OZmJSuB4PHcgCzm4AmOOSlqSexCgjwN235cGNfxn8YvnDvT8GqgKweFgZ8jaUqpfG3c5Bpkd91Mv5GLX9km/kCgLtgNyi3KFtkYQ+o0P5NhXefDBYE21vRMAkf6HK0rPRbtHdRnZ1pmPCjtf0EW8/RX5BhobVDptJ+XyR8ILlCtWx3SuhQwXXOM7d+N7/yHmqKCavKG5RZD0lsCXtPJp3K6rn1hAEtJxpXA==
Received: from ZR0P278MB1349.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:82::5) by
 GV0P278MB0880.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:53::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.22; Tue, 22 Apr 2025 09:44:09 +0000
Received: from ZR0P278MB1349.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88bd:d9b1:9ef:4507]) by ZR0P278MB1349.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88bd:d9b1:9ef:4507%5]) with mapi id 15.20.8678.020; Tue, 22 Apr 2025
 09:44:08 +0000
From: Philippe Schenker <philippe.schenker@impulsing.ch>
To: Francesco Dolcini <francesco@dolcini.it>
CC: Wojciech Dubowik <Wojciech.Dubowik@mt.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mm-verdin: Link reg_nvcc_sd to usdhc2
Thread-Topic: [PATCH] arm64: dts: imx8mm-verdin: Link reg_nvcc_sd to usdhc2
Thread-Index: AQHbr4rJglPuIdtT1kad8qqeZ9uUnbOn0zQAgAeGHQCAAAw4AIAAEY2A
Date: Tue, 22 Apr 2025 09:44:08 +0000
Message-ID: <aa9f5a902ebcc355541bbad8f1fa4f42662b22be.camel@impulsing.ch>
References: <20250417112012.785420-1-Wojciech.Dubowik@mt.com>
	 <20250417130342.GA18817@francesco-nb>
	 <95107ed358b735cbe9e5a1af20a2d6db74c5ed64.camel@impulsing.ch>
	 <aAdWLFS2UYciaJc8@gaggiata.pivistrello.it>
In-Reply-To: <aAdWLFS2UYciaJc8@gaggiata.pivistrello.it>
Accept-Language: de-CH, de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=impulsing.ch;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR0P278MB1349:EE_|GV0P278MB0880:EE_
x-ms-office365-filtering-correlation-id: 10f136d7-2250-4813-c631-08dd81823ab5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|4053099003;
x-microsoft-antispam-message-info: =?utf-8?B?K2ZyZW93dHdFVXdQYUZKdHV4ZGg2dlBrMkJ2TjZFbUtLaHVhL1pTNThmVWxM?=
 =?utf-8?B?bGppN01DeW1vd1dSR1BIeWpxU2EwMldONWFYKzJRWDI2bytOVjA1MlpqeWdY?=
 =?utf-8?B?NWY2RTlpcldNNnh0Q1hBdjlTLy83a2gyUGFCY3d3VkU0a2lYenhOSmFiN2pv?=
 =?utf-8?B?RGkxVWJEK2JXZUJjajhuQjlSRXF0emJrOXpsL01wei9OZDU5Y2E3cTJjREYv?=
 =?utf-8?B?aWxvMmtBUTF2U1I5a3BFc3BVZ3Y0YjE1UE9peHdXc0dWV1Z5Yy9ScE1XVktL?=
 =?utf-8?B?V3NMS1VXUExKaHNiWUZ1NVkrSVg0d1orMVk3VVFrWmlkN0gwb3FxV0Y0aWgy?=
 =?utf-8?B?MkhWaVB4UTJTVU85RzViZkJDaG5wMVVHL2xCakxLTFNQeVFwVVF5c1RwbDc4?=
 =?utf-8?B?ckFBU2dwMk9GTFQzN292M2VTemh3eEsxa3FpLzZQQ2lJeEl6Q0p1KzMxbjZs?=
 =?utf-8?B?SnAzUFJpMlNHWmNlVXdydXpPNmNreVRRUzFDdVhxb3BPaGtmemIwenRMYWlp?=
 =?utf-8?B?czJZRW9jZ0l3bU5neS9Ld1EreUllc3NDMzRBQktDYzdaWkdsWEZvdnY5YUFj?=
 =?utf-8?B?RGFkYW5pdk5ZQWgwRUNIT3Y3L0kzVzBrTTNYay91emI2d1pxejdBeTRCQlMx?=
 =?utf-8?B?eHV2NzFoMG5IdFo4WDlZRGdzR2wvckI4eUZrNXhhSUZwNGRpb0x5Y0hxUm9P?=
 =?utf-8?B?YmZMUjN1SWQ4SmRvOERlT2tLMlFBcXhTc1FsMS94dW51TTAwbDNrVzhMY0FS?=
 =?utf-8?B?WjMyZnNKLzNsd3I0YUtRWGdkQXU0ME55K0JpWHRyTW9EQ0NQUGgxeFpCYzBY?=
 =?utf-8?B?ekVGVHp6VytnaW5iMmRMV3laOU92dGJrTkZIMnlTTmpRZUpJTUVzU2xMUUo5?=
 =?utf-8?B?SVJrOWwzTk10b0RXdEtFMk1DWVdaWFgycmwvcTRGOGZaVXE2NzR2ajVsVld3?=
 =?utf-8?B?WkEraGt1a2doekFTRFpKSzBwamVOSERKUnJWTVZDOW9DM0xjTE1qZEhlUFEw?=
 =?utf-8?B?dXpCWkl2SnBVaUEyRWFIcUJHZmk4Y3VnODRJMDkrM0dVSm5iWk5sT1d2YjdU?=
 =?utf-8?B?bFMvTjFJK2FvZTdKUjZONkw0QkU5ZkptaGNPL1M3RG5WMGwwL21LRDVDRjE5?=
 =?utf-8?B?ajdIdS9TbCtKeDk5OWNQNk5FWnV6L3k0aExkYnUrUWlreFlIZlp2c2VlQTlt?=
 =?utf-8?B?ZFJqSTdycjBZT1RSUDdscFVIOXQvekpueDRPOWJ0eElqUHYrb09zWEI0WitD?=
 =?utf-8?B?UCtSTit6L3ZyVmFCOW9ydkhBTHBiQjM0UEVPZzFIaXpPcHZPVVl0bTRISlFM?=
 =?utf-8?B?enJSWVBqTTRUTk02ZjJJVVBCNWh3NjMyK2hvcHFMU0FiaWs0a3J6TzAxU2Nj?=
 =?utf-8?B?RCtwbFRSOTdKSytOWWh6RnMyamhpelRJVXJFWjBqcFVQYk0xSFZSekJ3SnVC?=
 =?utf-8?B?cVVUS3VYVHVQemFONllzTlM1Y3JYb1AyYVpxRUxrUGVYeHRpQXJ5MC9GdlUy?=
 =?utf-8?B?TEduNVdKaXl5alhVN3I2QTZFc2REU0hkZHYzdktOOE9mR0ZoaldEbDVONmFx?=
 =?utf-8?B?azA2YmhpK2p5QW9pY1RzWVp5ZmZhWlJYSnpwNVA4c1BBOU1LZ25wYzBmMFEy?=
 =?utf-8?B?NFN5ZGJHTVJLOTlIY0RlUVFDeUhTeldaWnFlWDNSZmN1a0dUeXNqQm10QkhD?=
 =?utf-8?B?R0pjVExyWFVUOE9lcHJGT1NvTEdSSWNWb082VjRJTUI0cGVaMjlYVjEvWVAy?=
 =?utf-8?B?OVpXeWlNanZyNVNzcDk2MjFTOEJEQzhEQ0tkUDVXa2lXR0x3eE5YTjdaVnJ1?=
 =?utf-8?B?eW9UdDcwNjdtMzdQOGR1c21BS01jaTlEcGF3WnlSMUVvR1A1V1NkNHVhUTY3?=
 =?utf-8?B?K1B6VEdiclhhUEdvZWFka1VmUUlJbnlvdnJXTG85eld4L3I4dXBUZzJYdVNu?=
 =?utf-8?B?WitVQjA2T21DWVdaV2pUOTYwRTVIdXhCMVlnSDN1WHk4a3pSdkYzQjFKRDZR?=
 =?utf-8?Q?WvUp8dxeyevNqjbVaRPxvk+DyMTAn0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB1349.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(4053099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LzAyb2V1ejBqU0tPVktFWlptaTFDQ3E4Yi8vbGZqVWp4aWdLT2lKMjNKaUpQ?=
 =?utf-8?B?Rkd3SnYxaWxGWVBOYjFySjNka2pSK3hiUnVWS0hUMkUrQ3Jvd0ZtcDdWNVlp?=
 =?utf-8?B?bWtSbTNaUk5KMjlBVmk0VHJlNnZldDJ5bWdyb08vYU9RK1ZwUkkrMkJqWE1a?=
 =?utf-8?B?ZUIzRkROS3lyT2R3Rm1jYlRrYTJ3U2Q2bVhQYWMvYzdEbHdyTGkxcVpZWFdO?=
 =?utf-8?B?OVVQWGdhU1RhRERybWdwZFB1SHdqcnhNMHVBZ0krZHdYaTBSeUNXV2tJL1ph?=
 =?utf-8?B?WVI3NDdESEFCSStWQ2JpaDNZZ3BCbTQ0UFhabFMxZmFpME9sTnJwMVE5cG1a?=
 =?utf-8?B?L091U3NmZlBJdUVOU2JZZk8wY2t0MGluRk1yRUh6MHl0TTJpS0hpZXU2dUdr?=
 =?utf-8?B?aTZOTFRWOGRxbUlpOWZoMUVhTllKSGRTZjRya2swQWszaVBNaHBVV1NDUG1E?=
 =?utf-8?B?T3VBQkxkb1VxYVNtRmR5Q0ZleVlPMkFJaDdON2hlM1Fxd1BXbE9tN1pybXND?=
 =?utf-8?B?b3NYYlJKcklUTm9GKzRQeG1tWGNabm1zR2FCcjhWcG5PcWNTWUpyS1QrRkpC?=
 =?utf-8?B?UDl1V2ZWc0RuWW0yQVFGcmJ0WGE1U0w4SlQ2TG1KSjFSdVgxa01kMEl4WlNj?=
 =?utf-8?B?WXV3c1VOR3U1dGhveTE4c204QUhRdmdDVjRGVk5lYVd5YjVlSzRmOHpTblph?=
 =?utf-8?B?V2JvTkgxR00rMXA4UHN5Q0dHcUFZZGVSZm1TZWFjQlRNd05TZWxZZmF5dDNw?=
 =?utf-8?B?VkxSUXg4Qkk5SGQ4NnR6QXB1RlorWkNWNnQ1Wlh0bko4NitsaEtiaXNuOWZz?=
 =?utf-8?B?c25wTkRsdndTcU1uMFNua0xZUWNUU09USkc3RXNpUGl0WmttaWphOGdFZGZ1?=
 =?utf-8?B?SGhJVGJab3VrWUR4UGVpNGVxbzlOR2VTZ3BSMlYzd2dEN2ltaUNKM0JrTDVt?=
 =?utf-8?B?SWFDeS85aDNHUVhVd2hIY3ZTSWFveXFzREpLTVQxMkNjN1U5VWljOUdFZWQ1?=
 =?utf-8?B?ZnYzN2R3YVl5VlRGVEV1MEJzWUpBY0hidWdFWmthZGYrc2FiMkdLSGdzVWFj?=
 =?utf-8?B?SlFLTGFGd214OXJ3NFJ5aXB4SXFZTkxQM2hoZ3UxQXRhNCtVRnlDU0dzNmtT?=
 =?utf-8?B?TCtxOUR3bFZyRlpLU1h2TDBFSzFOU0NsRTJyYk4xaFVnLytralZLNVc3YUxl?=
 =?utf-8?B?V0J2alBIWFNpdVorMnBJb1RXbGdkOStUQUViSStZTS9qTzJpa3BqRy8rNjk2?=
 =?utf-8?B?c3djLzJBRU92RXkvS0Q2WWdDemtjZjNBT3d1bks2OWMxbGYwRTlBb2dGb0Jk?=
 =?utf-8?B?VHkySHRETnN1dkJIVTI3YmJOaStGVVFWdGIxQkxOeDFKMXE4dVNUNlUwQ1FX?=
 =?utf-8?B?d2xVTG1QVmlyL0FRVVkrdkxmaXRiQXNvVjl6NWhaMmU2d09pa2ZXUThvaUF0?=
 =?utf-8?B?Um93cllKOWthZGk1b2l6a0F5T0czU2lnSW91MmdCdDJqR2srM2o3WkJYN2w2?=
 =?utf-8?B?ZWFhbG1mQVdrUFBCVzRRbWxORUlEZkVQWitKMURlSDcyWnhhUXZueTlVN2FU?=
 =?utf-8?B?YTc0MUpoVEVYQkxRRExVT3FKY3RYZFNweURqbWl3MHlWZStUb3hkcHIrK1VM?=
 =?utf-8?B?bkQvaTB0S0ZmeUpLWStyOWZud2hOZHBrUlpjcGV3eXJ0RlhIRGVUL21Wa1Rx?=
 =?utf-8?B?ZmZBZGs2aUEycVNUeEpmVDdBQXN6U253d2Q5ajRUdnRiYi8rMFFKWWFlMW0w?=
 =?utf-8?B?alhHNUNSQVBWa3o4Mmk4YVUzcHJ3aUUzbHRoSk4yWGVIZitRNkNNWU44OFQz?=
 =?utf-8?B?bTJCS3RJK3IyWjhKckRNRGYyYk9vUnRmdUFZSFNuTFFNT2l3ZHA5OVZERmJ2?=
 =?utf-8?B?SlRXc1lCZUlzMktIUUlqcEtUVGFscU1EVE55R0JHSEpXb3lHMDhtd1lleC9k?=
 =?utf-8?B?YmgzTDgwYy9wb0pQTEgvV2lIV0QvZVJnUjZYYnNyUituWkZ3TDF5em00d2t5?=
 =?utf-8?B?WmVXR3V6TDh2cE9sYklwcXVRWm1SOE5sSlRIWGZzYnpUUk1yUXNVYWdIN3Mx?=
 =?utf-8?B?MTk4UUw4TlRxY05oQ0NOTkNzVG90cDY2cGtmNTFaQTNhNXZkRHBwN1BtVEFI?=
 =?utf-8?B?UDdvT2pPOHFScHNybE93a2NHMVBxZlZGWmJsVWJpeFRIczhyNDRZbGtmSkpy?=
 =?utf-8?B?N0E9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-aEL7PYEr/BuolIrjLikP"
MIME-Version: 1.0
X-OriginatorOrg: impulsing.ch
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB1349.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f136d7-2250-4813-c631-08dd81823ab5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 09:44:08.6665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 86709429-7470-4d0c-bd3c-b912eebdee40
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aggBiri5BWflKsZv90eHzMd5unUVccTlx6//fBKngRFTv3Lc/OBbYliuftbLjw5bhXCG7z5JtdhMsZJldN28umbw/FqGHYEYeN2v3wCGRGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0880
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_024418_751663_9C395B2D 
X-CRM114-Status: GOOD (  27.05  )
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

--=-aEL7PYEr/BuolIrjLikP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2025-04-22 at 10:41 +0200, Francesco Dolcini wrote:
> On Tue, Apr 22, 2025 at 07:57:32AM +0000, Philippe Schenker wrote:
> > Hi Francesco,
> Hey Philippe!
>=20
> > Not sure this causes any side-effects maybe you guys want to
> > investigate further about this.
>=20
> Yes, we did, the correct implementation would be the one I linked
> in the previous email.

Interesting, thanks for your further explanation. I do understand now.
The implementation with your SMARC module indeed looks much cleaner and
is better to understand what happens.

Please let me know if you wish to remove the vqmmc linkage on i.MX 8MP
-> I would need to test for side effects on my side. Please use the old
mail for it as I already hijacked this one enough :-).

https://lore.kernel.org/all/20240109121627.223017-1-dev@pschenker.ch/

>=20
> > I needed it due to the strange requirements I had (described in
> > commit
> > message).=C2=A0 From my point of view it is correct to link the vqmmc-
> > supply so
> > the voltage can be set also to something different than the default
> > fusing
> > values.
>=20
> It does not really work fine, because you have this IO driven by the
> SDHCI
> core that is going to affect the PMIC behavior at the same time as
> the I2C
> communication. And even if you remove it from the pinctrl, it's the
> default
> out-of-reset function, so you would have to override it and set this
> pin as
> GPIO even when not used (this would work, of course).
>=20
>=20
> My request is to fix it in a slighlty different way that matches with
> the way
> the HW was designed.
>=20

--=-aEL7PYEr/BuolIrjLikP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNATURE-----=0A=
=0A=
iQHTBAABCAA9FiEEPaCxfVqqNYSPnRhRjRDjR2hoXxoFAmgHZOUfHHBoaWxpcHBl=0A=
LnNjaGVua2VyQGltcHVsc2luZy5jaAAKCRCNEONHaGhfGj2iC/wJ8IQzFiDmOnt9=0A=
uerV3PVTM/d6+XyIYCulW0MeVOT/Xuto0wmRpmM10yZLL9SL1FzNaxqZ0XX4Hjbb=0A=
zipK2rrgGo+eac0ke9iEwiyZ8A5wImD/1GAeVSew2IRTW6MQwS3piUoq5vSS+tuc=0A=
4bRsvIZ5dDy9+EphEoK0We9LsCbvKZ67A+STTD/vmhm86WR87vKLCs1UfmPVZNNl=0A=
oXxMoLH0IT64sunu5OA0YhNvnn6upIYJUHZ75RrldI7bFpEmmpdyOaUrkCjO4lcq=0A=
1UcHO8dyZgaDyCns4UQuPG2pXXJJr0bU0lz/99EslCJ8914vCfrq6RG6BhAkUNgS=0A=
tWDIGScURjvkRLOJVpbqJrn4iMgzh7RkW1h8pLBUOlIMZfXpHn133HO+kqZBdPrk=0A=
M6+Jw7sCM8s8SvsSVICchSXbbnp3teVItoG5M6FyYFHnk61com1qdlArfEWMuIDJ=0A=
p2dcUsNUER6kgoeodIFotQzx6pF4DB1Pd78vtc4AezngoestFRA=3D=0A=
=3DqeSf=0A=
-----END PGP SIGNATURE-----=0A=

--=-aEL7PYEr/BuolIrjLikP--

