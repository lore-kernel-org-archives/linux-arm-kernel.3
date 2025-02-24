Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E899EC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xc/79Hra7H8KbZAc0MoiCV1Nc6lxNvY9xMK+PKyP1ag=; b=0szEzpG7jZp0UVKX2/xn4LGYVa
	04MABya5+AqXwiPi4PuT1n3+sHkJAZUPdp6BHZJ3hMp0pFcpCPAU9Q/4QwdyPxCP4PBFXoO5Fm7jM
	l6+nTS/WNfU6IDYIRXkT6xIcWzdkA07VKwXYli66khlbdnd/K2qDfOuYvv4d4L4+UNumXrcuqQHID
	r6ZFkgMO4PYag6nAOQbJEhHWZqs7bzOC2wpITKVCSCjLM4ZpWRe+TMIkOT9+0NgB+izJFUzps7pyX
	M7qtyGHmBNXUXylKilXJ+UOjCPbj5gonQ8kHsM1CwSE2Itta6E5C5IRbEcKMcVZNEko6YYoVxegUj
	xo8/FV6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdEG-0000000EoUs-2XJ3;
	Mon, 24 Feb 2025 18:30:56 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmd3V-0000000EmIK-3AEG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:19:51 +0000
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OCSjEE014690;
	Mon, 24 Feb 2025 10:19:42 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 450nash7y2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 10:19:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JizQKOrOJ50d6NcbsG4+/xvqaJGBYCf2mDwOkwx1nyKOVHSwMC8UeIMPrfkF6CAD1fEshOx66iAx+KaI/COkifPOmTJyJtq8yUBLD1cbuC89gBn6HmTNd4j2ngR3xnb6S7BOyE5TWHN1fmnQngKh7QZ8P34Bm6SItrwwn4Y8f7DerSHVj8ZvSGawXQtlQ2xPin42PLREAtDdhHjN21Ashac34lJTD8pK7UzX0mkDKoNMbrAAeiYhKc91kLXq0kqbncNsQKKtLTQA2VIW7m+n7RWfS43HPZEOot7+lO4G0+f/HrKIttKgP1n7ujtRrXeKyxjebAXwUe5SZwBn9XWGpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gn8prhmiNre6XPUkTePEPa6SFjugJ9IYSFUpDba2Yus=;
 b=ZAP3j8UC39pN25A7jgYH8xgpc+q5lqQctyemF+NRh237H4cNlk3/bpN4H7pyVOGiC571mpMXvDeI6KVS4MNW0o24Cc9NtirLHqUGdJE/J5RJFW8sgznFt5vjcSbKthkX7oHMgdkE1KSpKl6gwg0SBkmpp8ADdVLcibmMsGJMAkFYZdNdEckAAiohV1fVxobF8IYCKWzSvlLen+TTEdGcbevmXQsY3zeRGXYmoYjOBlpWAGEiIZU4B+Lk3fZkMQ6/DhblmewSwwmF9VtHqKN4teLHVyJGjjhTRQZlnxShfR9HlQvTmLRK5zcOe31dv/V7h2almAky+gN7DB++629q0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gn8prhmiNre6XPUkTePEPa6SFjugJ9IYSFUpDba2Yus=;
 b=GJ4jdm9qhI2/igj1PblB/PSZzwJlep/J9qaHpr4APlJDVGaiEKKTJ8o94o8Byjpaq62352qjGWDs5cd+I3A8xmad3t8i+Ic4diREkUxGJygRkVUqRsG+drQdxTdxHjmSAw/BY3dN3rqBg8WwVK52kxhcKC3jM6mwLV0BUkV820Y=
Received: from BY3PR18MB4673.namprd18.prod.outlook.com (2603:10b6:a03:3c4::20)
 by MN2PR18MB3653.namprd18.prod.outlook.com (2603:10b6:208:26b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 18:19:32 +0000
Received: from BY3PR18MB4673.namprd18.prod.outlook.com
 ([fe80::fbd6:a3a:9635:98b5]) by BY3PR18MB4673.namprd18.prod.outlook.com
 ([fe80::fbd6:a3a:9635:98b5%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 18:19:32 +0000
From: Wilson Ding <dingwei@marvell.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "andrew@lunn.ch" <andrew@lunn.ch>,
        "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        Sanghoon Lee <salee@marvell.com>,
        Geethasowjanya Akula <gakula@marvell.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: reset: Add Armada8K reset controller
Thread-Topic: [PATCH v2 1/4] dt-bindings: reset: Add Armada8K reset controller
Thread-Index: AQHbhuimo4fJX8wsPU+mNUrf2ArHYg==
Date: Mon, 24 Feb 2025 18:19:32 +0000
Message-ID: <BY3PR18MB467373E86423BA4615D6FF0FA7C02@BY3PR18MB4673.namprd18.prod.outlook.com>
References: <20250220232527.882888-1-dingwei@marvell.com>
 <20250220232527.882888-2-dingwei@marvell.com>
 <20250221-icy-flounder-of-potency-ee1a05@krzk-bin>
 <20250221234041.GA387671-robh@kernel.org>
 <BY3PR18MB4673F55565B70458E1F3F9A6A7C62@BY3PR18MB4673.namprd18.prod.outlook.com>
 <a8ad3469-f170-4af0-abaf-d34c60e4df52@kernel.org>
In-Reply-To: <a8ad3469-f170-4af0-abaf-d34c60e4df52@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4673:EE_|MN2PR18MB3653:EE_
x-ms-office365-filtering-correlation-id: f8760b0a-d599-43fc-e65e-08dd54ffc90d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QWUwSU03cFkxbG53Rzd4eVR0amU2V3FtWFZVcm40VDVhK2ZLSitqVHMyQVdh?=
 =?utf-8?B?UlJoTTY1VDViMzk2VFBwc1hUM3hpUTNLN083UWpNTkg5UDYrUWsxc3d0aU1h?=
 =?utf-8?B?cWNiOVdUQnFsdEhzQkVvUGdwV0ZYNlIwL3M4TUxRUXM0c3dPcU5YQnFqSlpi?=
 =?utf-8?B?K2QyMGwwSVYxTDY3Qk9OM0RLWkNodEQ1TUw2bENnQ3JBckNtbjlUaUFOU0Zj?=
 =?utf-8?B?amVEVTZiL0kzcFNjeGdkMmR1ZUJ3SUlzWE9NdXpqK0xNNTFQdTlpUlNlT1hS?=
 =?utf-8?B?V2R5cWYzb3Y5UFBDcElVd2F4bHpZa3BhNEpldHZRRHpmdDhXS1V6VHkvSDBp?=
 =?utf-8?B?QkRrMnJzR1NoRENxUDB5aDJHZ09ucVY2ZDlodnBCYzRFUmMvQTZ1ekQ2cXpO?=
 =?utf-8?B?OFNNR3FuUjRLSFhXQ3Z2Q21wYTk0dmJ4S3pPQkRpai9PYUF5UUk3NjVYT1dr?=
 =?utf-8?B?djFGSEFFbXpxbnc2M1NoVjhnT0NGMSt4ZmhxQTV4cUFNVzhTWmJ6c0luamtp?=
 =?utf-8?B?d0JYaHFBenhvdjJFS3M4NDl2VTNBblFGQy9ER3V6U1F3K2lCeXZzRFhjeUh1?=
 =?utf-8?B?a1JDNXFjNEh2QklEYVdZcnEvQ1dCdWl1amZML0l1Qk5Iam1qcW55bmFydTBW?=
 =?utf-8?B?VHpwTCtwWHFvY0hPclg3UWhleTY4elRwVUZwRzF5a2IvTkp3dnhIS3p0dWkz?=
 =?utf-8?B?UHJ1L2Z4SkFLc2huTkpvMUpZT2lNc2djOXkrbmV6UkZncTB2bnlBWSt3YTU3?=
 =?utf-8?B?bnZvY05yVTA0K2M3dndST0lrUjhWMzNhYlVBUitjSGRNbUxsYVNyVDVWUUZr?=
 =?utf-8?B?YUxEeDNMK1JOdkx5cjM2ZHdhZTBpTWdBUVBaWGxRdzRGcStDOHAzUVpFcHhY?=
 =?utf-8?B?bWNtQWNoV1UzK0JKMy9mUXRWOWo5MFh1d3hySkN3dDZCOVNzUGptSnplRmNV?=
 =?utf-8?B?TVdDZWtiSjBVbnFRY2l0ejJ2eEpSbitrWG1DZDdtVW9PNXFvNG4yTFpIRExI?=
 =?utf-8?B?c2pNakgxRHpEVHlaS0JPZ1hnZ0JVaUFTTkZ5SHN3K01TM2MwOTV2M2dUVWsx?=
 =?utf-8?B?eExjbGgvQzk0dGNCZGkxcXVGc3pmZjBSNENBZWZjc0tlOEt2M0M0R0VSU1Jm?=
 =?utf-8?B?Zk4vV1VpU0VESDZiaVhraS95SmtjWVl1L2xTV0Z5WW1aNzlCU0RmRGhTSnFl?=
 =?utf-8?B?ajU5dzVqK2RyVGlaM3g4YjJoUDBHcEd5SFphcUFlQVpyazMrTFZCTVI5QmJQ?=
 =?utf-8?B?dHRrdktWcVVBL2xpai9LTkFzNzFaUDArU2RTeHFmdTgveFVQTjF6LzJuMGNj?=
 =?utf-8?B?MXpSbGJxTiswc1FobEJ2U2s5KzBhYmM4TVRMaGNuT0g5UXFvVWdhSHNhbmlK?=
 =?utf-8?B?aEdCd0c4QTVwNDFmcFdkMk9taCtKWmFDSU5mL0w3NjFvSkVZVlcwcFN3VzVu?=
 =?utf-8?B?UiswK2tPNHhLdTQ2TGVkQWhiTHcwZHdUWDgyQWFaRWVnTmUzVVVnMGN4QnVL?=
 =?utf-8?B?eTdEVzZwbGgxbnNnYWlDUGdncDVYRkZQa3hLY0RFRm5EaW5KWGp4MEhHTzc2?=
 =?utf-8?B?LzBCVXg5U09ESC94TWNYMkV2TStzRHZpMkZqd1F2LzZ1UEswNmhTODUyYmJi?=
 =?utf-8?B?SVYyYktpbm9Xb1c2R1UycEFDNUdyOEp1OGwwaWJKb09JTVBGMFJuTVB1dlg0?=
 =?utf-8?B?OFFiNXUvR2NyM2VhQUFza2NVSzNMM1ZjNGRvRVdrTk9LVHk0ckdvc1loREpw?=
 =?utf-8?B?RGFjWHdrOXlmd2V1dFVDa3h4d3lVRUgvVklVWGxyTWR2WndqUUdBK0pneUl4?=
 =?utf-8?B?Rk1RRWhETHJjNUFSRjdyQU0wc2pHZE01MDNvbjM3UjQ1TkIrS2gzZ3BscERm?=
 =?utf-8?B?REU2ajlyZW1vV05EckxWZnhUNFI3UitYYVdhWVdwbXVsZVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4673.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3FqN2Z3Y2FsR2NZME12RDdCaWNGTTQvcnhLa3VRWStIWG02MFMvckRSVjBk?=
 =?utf-8?B?c0F1QmQvcXlFeFJjcHJHeGtOUzdZNTFJRHdCdW5mNUVmdE5yUU9YUzNVa3dR?=
 =?utf-8?B?RmovQ1pudHYxcnpwTHk0N0V0NGEvR2RJMndIUWZRVHZna2k4Y1VvSWFhajA3?=
 =?utf-8?B?RWdtQ3FpbjZqblkzVlEvNkRSMzQzK1IzMlFWZmoyZ3YrakdmUzI0V0hXTElu?=
 =?utf-8?B?cDc4VW5uTGE2Mm1GRUVKd0EzSVlVTkNaTHo2Q28rOTkwL3BwNkxBdEE2VG1x?=
 =?utf-8?B?R2N5R01WSFZwdG9kQW1tVkozTUtwNno1NWxZZk5iZnZZNW1nYVBsRU1ZZnBB?=
 =?utf-8?B?R0V5N3J4SDdpVlF6TGhFM3RyUVA2S2N2YjJmZDRZVmdHaVI5bGVnditRVjl2?=
 =?utf-8?B?TWptcERlWjlRR2czWngzdk5FMHdzU0svay9Vbi9nMngrR2VQWTR1WG82TzRV?=
 =?utf-8?B?bGhqbGdib2dTckpmRmpTT2liRUx6NFEyNldTeWMyNlJRc3BuM29sWEJDRWsx?=
 =?utf-8?B?ay9obk04MkFlYS96MVVBdU5Gc01XeWgvSktEQzRTOXVPYk8rcC9PTGZZdHZP?=
 =?utf-8?B?RnFJMVVteDlWN0xraU5YUEVFY2dhRDdoRVc2ZUlwMjhhS1dqdGhkcWR3dHY3?=
 =?utf-8?B?VjRSalZaOVlHUlFNdUN2bVdHbTh3Z1c1RERXdFB0eTZjbkhMRHFFUXY0M2tx?=
 =?utf-8?B?U1NtVFNMYmRwUUpjYXNzTlFpd2E2cG5VR2hqZUE3Vmg3aWYzNGxUU0hpbFpN?=
 =?utf-8?B?SWgwNGpFZ01xME9JVlhtTEMxK3BJR29uTXF1dWFWSitUekpBK29jNDNBVWFk?=
 =?utf-8?B?WUJkMGtGSjJza3N5MGdKQmxnSjBweFRwOEJET05LdzZTZU5WVk42UHZzUytB?=
 =?utf-8?B?RkRmVFhmZGpQbGR2QVJKZVVMM2czbVZ4a3NKN2FTSi9qUmpmaHNEVGJNM2NG?=
 =?utf-8?B?UzQ3a0JaeUdwRzZQWng4YWZvQXQ0aW1uTWVHWDNWSGxvNWFIblF1RVlySnhZ?=
 =?utf-8?B?RWwyaFJ6dkJOUWlsejRnRE1SS0tORWZVLzhBN3d1SE9xY3A0NDBOdW5mY2lC?=
 =?utf-8?B?Tjh2cGVxTU9Hc1JqM2xoRGI1S2NnTTBINVkwZUJGMEJCZ2gxQThOTjhpRUVU?=
 =?utf-8?B?WnJlaFMvNmZBLzM2aEZwN0VaYVRmLy9oTnZicld1T0ZXc1hoalFJeHQweUNs?=
 =?utf-8?B?OGw2d0lkb3BONXQ1cmdmRUhzY0x2NTVlT2R6NTRRZm5STU1wc2dBT1NFakJX?=
 =?utf-8?B?b2s3OGQvbHFiOUhvVUlzUnZ3SzJYYmFKemtjK3FvampxRDNjcUZadnJYbkV2?=
 =?utf-8?B?NHl0S2RMd2E3ZE9md0luMlVvSGpaRDRLN2p1SGc3RmxDbm1rdjNXUTJaR0R3?=
 =?utf-8?B?anlYYjA0RWt1UUtxQnlZU2hPakQ5TkZFNllDTzhaaHgwL001TjIvVTcxTkhu?=
 =?utf-8?B?VGc1MkZSa0N0Nzd5dElBOEhZNjR5K2dIZFgvZ0h5VHM2dzdNK2Zua25IeFlG?=
 =?utf-8?B?VmtUemh1NHJiTStqaFF2UFBDUlpLVXAyeGJkKzYwNjI1V3QrNFdZNnJMallV?=
 =?utf-8?B?SXpja2Rzb2dhdDZ2LzBiQVo5d09GTWg0MjFkbzR2RU9CZWM4dUZZK0hsVkxx?=
 =?utf-8?B?Vjg5aExiS25PR2hRbkEvS05SVm5wODg3OGxENWpJZnZJeVc1YzF3bENMbDVh?=
 =?utf-8?B?K1MrYlJHRjcrT3NJQzlIREY2bTJ3cER4VkZtSEgvUDVDUHpVVWZjT2V1QnJk?=
 =?utf-8?B?OEJvS2RPQjRJdDBKNjRoVDV2ZUtYZGRieHI3T1hHQkNnTVRXdHRxMXBqUzZQ?=
 =?utf-8?B?d282YWEwczF6OENNK3M1czFITmtrbHlEd3F5SytrWW9rOXY4cW00TU9GaDVW?=
 =?utf-8?B?Z1p2bkk1REViYmpjeXVoYzgzUmFFNWk3ZEozZFhWcGQ3eXpzK2ozM3cwK3hp?=
 =?utf-8?B?eDM2czNaZnlZeUlwSDNEUlFmejBlQUhIanFLZlVYenoxemNxYmswNzNZZitt?=
 =?utf-8?B?TTdTNlAvOVAvOHZoTTFHTm9XVFRtZ0NWQzh1cHF0TWowVitnSVlUbVFjQkoz?=
 =?utf-8?B?QkNrdjZxdVpsVEhReFZoTlJMeGVXYVA1eXN4M3c1aEM1YU42dm84bVBOTm9Y?=
 =?utf-8?Q?O67TyzKwjXn9YIdw2+kpmeu3R?=
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4673.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8760b0a-d599-43fc-e65e-08dd54ffc90d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 18:19:32.2665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YrqO4oYM3ZJIc+5udCfKlNjGhESMRnNPan+k6YoRJACRDuL3Kw5Uit+YsPbbgupUWvEsIq7xwM9ccKj2ofWHIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3653
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 1upSbIrHoLuDAxdd2nJnRUSTBeUVt8q5
X-Proofpoint-GUID: 1upSbIrHoLuDAxdd2nJnRUSTBeUVt8q5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_09,2025-02-24_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_101949_913783_98030CF1 
X-CRM114-Status: GOOD (  25.40  )
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



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Sunday, February 23, 2025 12:49 AM
> To: Wilson Ding <dingwei@marvell.com>; Rob Herring <robh@kernel.org>
> Cc: linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; andrew@lunn.ch; gregory.clement@bootlin.com;
> sebastian.hesselbarth@gmail.com; krzk+dt@kernel.org; conor+dt@kernel.org;
> p.zabel@pengutronix.de; Sanghoon Lee <salee@marvell.com>;
> Geethasowjanya Akula <gakula@marvell.com>
> Subject: [EXTERNAL] Re: [PATCH v2 1/4] dt-bindings: reset: Add Armada8K
> reset controller
>=20
> On 22/02/2025 21:=E2=80=8A57, Wilson Ding wrote: >>>> + offset: >>>> + $r=
ef:
> /schemas/types.=E2=80=8Ayaml#/definitions/uint32 >>>> + description: Offs=
et in the
> register map for the gpio registers >>>> + (in bytes)
>=20
> On 22/02/2025 21:57, Wilson Ding wrote:
>=20
> >>>> +  offset:
> >>>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>>> +    description: Offset in the register map for the gpio registers
> >>>> + (in bytes)
> >>>
> >>> That's neither correct nor needed. Your device knows ofsset based on
> >>> the compatible.
> >>
> >> Or use 'reg'.
> >>
> >> But really, just add #reset-cells to the parent node. There's no need
> >> for a child node here. The parent needs a specific compatible though.
> >>
> >
> > I am not inventing the 'offset' property. I just tried to follow the
> > other existing sub-nodes under the same parent node
> > (system-controller). The mvebu-gpio driver also uses 'offset' instead
> > of 'reg' for the syscon device (see below). But it
>=20
>=20
> You never answered why do you need offset and why it cannot work without.
>=20

I see. You're right. I don't have to use 'offset'. The reason I choose 'off=
set' over
'reg' is that the Armada's GPIO driver use it. And I thought what was accep=
ted
would be easier to be accepted again. I will change it in next version.

> > seems also not correct from your point of view. Now, I am a bit
> > confused what should be the right scheme for the Armada's
> > system-controller, including GPIO and Reset controller. And
> > dt_binding_check complains "system-controller@
> > 440000:  compatible: ['syscon', 'simple-mfd'] is too short". Can you
> > point me any  reference for me to fix these issues.
>=20
> See all other syscon devices. 'git grep simple-mfd' or for syscon
>=20
>=20
> >
> > CP110_LABEL(syscon0): system-controller@440000 {
> > 	compatible =3D "syscon", "simple-mfd";
> > 	reg =3D <0x440000 0x1000>;
>=20
>=20
> Best regards,
> Krzysztof

