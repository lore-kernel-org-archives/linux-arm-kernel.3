Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D91C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 21:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQJrtmJuxubNECfcaaZ99CVTHphmIJSbLuiW0gXU+bY=; b=yWNXaQArjBlPzGNa6ZsbAaX3rA
	7FFIJeHW3giyB+rRTDPxiDn99WyETXUpdArB6IsLT4pE3DQqTvqSxA3SXoL6teSkpw1rEhNnDAYZn
	R+2FW4allA+3FNoY0q876xqGdzmutPayUT61rl3wWQM1bSOA8QaMA3X7r3Iz/n7ly2ERq17hrDMFi
	V86UfZQu8cYFj5NfYF/KFUZ28QDtjP6Oq1uTBsg/IxnpIs4kBFBpJJQZf7LVqxDkZe2BT4KBY6FNa
	nY3bHeH2k1NDjzJwQayIiQTkMCYuCZ21rZ2N6dMo5BDYSA3gyZiLLOCmRYPM7rfT8N/9YqunI8TWO
	yxcQwXLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjbY-0000000GePa-27Di;
	Fri, 20 Jun 2025 21:49:00 +0000
Received: from mail-bn7nam10on2072c.outbound.protection.outlook.com ([2a01:111:f403:2009::72c] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSj8V-0000000GbPl-0Suf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 21:19:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qBOsOXalyb/zf/s2lKYJjaunjB3XxDCUaghWiEMIxAVhhSh5MxyjtL+Z0ggdrf2S5lqwxY1JJeJXABKkDJ34u8Q5mEgvBvo06lDbAo0ruseUXL7eOfEi2o/Ur5Bv1srIOfRhXeF4ZgCB2jgpt2WfvzCNMghr56ohNPpz7KkfiRinsGAbGEPoN2zsg1w7HRecILuhcU8hciFozU5rTQA7vourN4YiXOGjXRb4K6CbsLGFxfsA+qqScQq3AN065H2C6cVcAs9BfvSX3eHMFtq0Gd04PMINIffYfcAjrJ59mAWYG09F9gMD9jwEiI6Y3LOyyDGx0B31jFU/9Ct6XvfhTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQJrtmJuxubNECfcaaZ99CVTHphmIJSbLuiW0gXU+bY=;
 b=Dzy4vAvNRXpnqraxyHZzZFxknaxfMfLtO/u2CQR8Puujc3xg9ir0t6m1dF4F7nGYJ+zbArT79saDnk2nW+uj4mdIUtujJ1mMvghshj7WbBbXGMdPNYIzWvgxIqlHAaKqJrtj+ObXOecIWu3NwsR1XqA6Zefc1S0AB1myEf1BOdqGbSSfIplIThA3gzOLobSaJ2IsmmO9aPn85APX422BLRQNmTa77YM9+2305ObuYzyFBdFrIfgmrFkcWmLKGtNQHkstMWpSWthiS78yjU2/7E3MlUPr26rpq/9rPcWhAOquWag332NKrRdpEJsz1olBBQtcdR6hIHQ2RVsQxdTCBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQJrtmJuxubNECfcaaZ99CVTHphmIJSbLuiW0gXU+bY=;
 b=uE4fE+VFlIFslymJZNIm6p7ME2tSL73KsfPBfHW7Kd1eXsRGOY6B6hnt6mR18PvU6pOUQsp12SiXI0dIDl96w5lgMUGfwXAPfKGDIluDTvLXTiBjTueUxeFppa4UF2TFiL9YjBcM+nuWQnWMFH6X+Kdjg0LVvYxZfU5cgKm1fiyYqkCJyA/SmOvQabW/ftwyukrlyHnttfo7guWad9bp5bI9pY3+HHaQ0I5exybr4QlvTxgiAcyg8/J2easYpKlD0RR7xL9Bmij8uKL1T2oaU8HuWVPeoHOJKQQSxerPL4cJjsFAM7IV4+ti3p0bRH6HCmZy1OegAu76arKf0pFh5Q==
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::c3d) by LV3PR18MB6289.namprd18.prod.outlook.com
 (2603:10b6:408:271::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 21:18:47 +0000
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d]) by IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d%5]) with mapi id 15.20.8769.031; Fri, 20 Jun 2025
 21:18:47 +0000
From: Harshit Shah <hshah@axiado.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>
Subject: Re: [PATCH v2 4/6] arm64: dts: axiado: Add initial support for AX3000
 SoC and eval board
Thread-Topic: [PATCH v2 4/6] arm64: dts: axiado: Add initial support for
 AX3000 SoC and eval board
Thread-Index: AQHb3neXHHei+il700ibF96CIekp1rQFTYkAgAXMHACAAHzYAIAA/mOA
Date: Fri, 20 Jun 2025 21:18:47 +0000
Message-ID: <bdc4408c-6fe4-48cd-bb40-3a17aed79cb6@axiado.com>
References: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com>
 <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-4-341502d38618@axiado.com>
 <6ef92d1a-39cc-409f-8ebe-d28ad2006988@kernel.org>
 <bfcde082-270f-4152-b474-7828beab7cb9@axiado.com>
 <9012cc61-b499-4213-9753-54cf4d24c822@kernel.org>
In-Reply-To: <9012cc61-b499-4213-9753-54cf4d24c822@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPFBEC4B1F8E:EE_|LV3PR18MB6289:EE_
x-ms-office365-filtering-correlation-id: f9402b84-0aaf-4ea3-e1e1-08ddb0400b98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OGJmOXVTNFZKbzBUbG5nWU50YjQyWlA4MWh1ZEZvVmxZazhKeVM4TVRScCtS?=
 =?utf-8?B?OWl4OGhyRjNpaElDQlBDT3puRHpJZ0R0SVd2RVJSb21SS0NZUVgvejkvQkk5?=
 =?utf-8?B?S0szb29CSlB0M285SXo2NDNjQ3Y4eFg4bE9CZlJyNTlPcU9mc1l6aG5EVUg3?=
 =?utf-8?B?MHZrVGxIVkdXSkpZdWpGR0VZTlE0cnhFT2JRWk0yZ2tUK1l4a1gxYVZkMHI4?=
 =?utf-8?B?R0l0bk5saE1Ub0I0STV3YWxaTmtObTd2RVJMVTgzNjlWNmVrcU5mekRJUlNu?=
 =?utf-8?B?b1JsdG8zcUF3R3JpTE9DQ1UvMS9YUEJoUEJFa09Eb1hvOE9UNGJUbXYwVENJ?=
 =?utf-8?B?WEdGS0N1a2R0bUpFZ0RRSjdZRDVMN0d0SnN2RllCYXU0YlJRNHVmN3ZEMEsr?=
 =?utf-8?B?N2pPa0JiZktWVFdBbSt4alpOVXZyNEw5d3pCOWhCVmxoeGkzRnhHV0VHbGIv?=
 =?utf-8?B?cUUzcmpIRnhVangzTTF1MXBoZTdZd3psYW9ROVBZTkoxM2JKVG1HWXlwY2hw?=
 =?utf-8?B?ekZ1TTAwejZhcWRuYWkrcEEvMmNIVUYzQ2toVTEzNVlRRHZnYVZuckUwcm5S?=
 =?utf-8?B?UCttcGhnS0FXMjlqSGF1bVQzN0NDaDFOV0UrSTJCVEx1elFveVZCUlNiWnF4?=
 =?utf-8?B?cytIRGNmcER6UFdwcWgxTjZudVpqNnRza1pEWGVVdnVVNkpwRUJCKytHaWFu?=
 =?utf-8?B?dmNieUdNcHA1Y1VmM0ZySjhudW9iRnd4MW1vbDhNYjBKMHRFb2Y5RElJY1JE?=
 =?utf-8?B?UVpkMjhHTWlmR3FTSUYyblhOcFRmaWd6dGZYSzZ1TmxEVGlFNmlTRGsxWnFs?=
 =?utf-8?B?L2VYWmpNNnYxZmZRSGFnUGlOK0d1TVRKdGlqdnNncSs4bW5RYUpSQ1RQRGFa?=
 =?utf-8?B?VmtlaGpmakFoSllRdUh0K2Q0NkpFYWpEQW5EdkJ3U2JkM3Z3WmVPQURZa2kv?=
 =?utf-8?B?dmQ3ZElYRkZORGNBNEllMEpTYVhKTmR3dENsaVcvR1V0akt0a0FDU2VmbU9k?=
 =?utf-8?B?dXcyTTI1ZmpVYTJxUy9ic2tGT1g4c0JIY3NBU1lYMks3MDZlWUppT1ZtdEMw?=
 =?utf-8?B?QmgrTWcwc1p4dHFIbGtGWVZ0SDM2UzFEYkpxaTg1bG16WEp2UTZROEFrWWZH?=
 =?utf-8?B?UEh0RytqbEd2UDZvWTlzTGJoSGVVNU5qY1NLRU1UQ2FwUmlIYUFEV3B0dXQr?=
 =?utf-8?B?VytOMytSZWlxWWovOGFVNElMd3U1NzB5Vys0b2prSXNXUFMvSjZBNFBkU2s5?=
 =?utf-8?B?dlRzbERUV2ZTMGJsb01zRDdRVnIvbGpEN2dnb1R4RWd4cTY0QUU2MmZsSlBM?=
 =?utf-8?B?YmRrWnRnL0I0TnI3Z3doR1N1ZGNOYU1kbXZhZmlrMCs0UTRaVDJvZHlaTGU1?=
 =?utf-8?B?Z21zQUI2dC9LdUx4T0tnY0dRNCtzRDEvb1gwdWtFa0hwQ2lVamFwQXovbTFW?=
 =?utf-8?B?cW0xNnRHVldkczF5SWI4alA2Vk5YT3cwQjZybmQ2TUgwSitna2l0L3hGTU0x?=
 =?utf-8?B?ZHV3M3RSV0ZYR3VSeXhMUG9NOWlyKy8rOXFDYzBsblIyVk1nQ0t1S0Fvek5h?=
 =?utf-8?B?UUJpd2xpRnB5N2ZCanNlTTVRUVV0WEJRZU5uVFprRFQ2OHZLSHh4UlNnRXkw?=
 =?utf-8?B?SGJBaG5TVUExbldwQjRvZllUbUZhMVNLT28ySzcyQ2x2VFNDRkVmVm41NnFY?=
 =?utf-8?B?WnZNa0t0WTBYMk5Fck9rY05nRVlobllZWVJ3OHRHVGVZT1lNL2t6S3dPRkhZ?=
 =?utf-8?B?elE3dWtLdHByZE9LNTB1UDI4d2RDZG43NU5DZEowZkNMcE5YYkFTajRZd3BN?=
 =?utf-8?B?bDI0ODZSN29NMkdwRyt3Q3VTVUNQR2lTeXA5U1J5dlFvdUd2Ni9XbFFWMjYv?=
 =?utf-8?B?NkNXN2Z0cC9XdElHaUVvN2VqNEMzMldCUVYwM280Q1dMTFJiRWlTdWZJeFk1?=
 =?utf-8?B?QU5Ic29LT000Wk9td0tTK2ZVdDV1bVJObStlSkhVOHZVT3JJNHRqUzJvSUFG?=
 =?utf-8?Q?+Wd+ZOTBKYn9OGPn7U8OIvWsKbQxgo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPFBEC4B1F8E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWdNZ3FPR0hTMW1WTmVUODRZTERTYWthR2VwMjhuWkQxOGticVZ3UHFhR1E4?=
 =?utf-8?B?M2ppbjZvd0dHMEQrSG1GUkdoQ0QrdEhLaTFieGhtS1NJQmFVOUV0Q3A0c0RB?=
 =?utf-8?B?ZkJkR3hzNzJKMWlBenBTcU1UYXdCS29OejRmazRjVXlNc3UzMjFBZG4zSzlS?=
 =?utf-8?B?K09tRUdpeEJKQTUyY3l3eFZUUnFVTDlSZGgzTU1HVU5VWkdUQk5GL2VtTUU5?=
 =?utf-8?B?NDMxQWJ3L0ozSVdkYWh0cjcybmNENGFESjNpWWdlUVZ0c09PYndBME5YVU81?=
 =?utf-8?B?dURnNmxUZTJFSU1mbnVDNWtUb1RHTlEyTm5mdkZaSDE3SG44MkpESEJvT0ww?=
 =?utf-8?B?NWVrb1B6Mzh6dzY2aEJxNXYyZGFZcmpBWXNoU3M2N2NFL1RBMjRjMTJHTHM1?=
 =?utf-8?B?ME1WRnBHVHpLUERiRU9nZ2RCL0ZVdDE3MmhjbmxMY1ZnYUhxUTNTOUdFUjdo?=
 =?utf-8?B?ZlRQeTZBcGs4T2FORG9QZmtMMEJOYlFLZVZYblIzUGVrNDY4UFoxZGgyQkV3?=
 =?utf-8?B?WG5kekpDejlyblFWY1V1YnM0UDV5eUo3OXBaTlgzdzlGczBMVW5VakRzcVZp?=
 =?utf-8?B?WWxQSHB1UDFFaFpzQTFaVnB4V0JYbjI1S2l6YWhGSURqNFB0UFh3c2U3WVhQ?=
 =?utf-8?B?RitjYlc1UFpQVytyTk00R2N5MEFCWHVKMHk0Q0E3QXdEQndXOEdpUnN1ZVVu?=
 =?utf-8?B?UGRZaGdKZ240ZUpxM1FhZFA1S1VuOXZHMGNCRjFaYkVMTXN5YThFT0loNjBo?=
 =?utf-8?B?eDBuTzNJTjVMVGZOSDh2ZHJTOUpESzkwelZiVWIwRzU3ZU5VK0pGM2lxWk9P?=
 =?utf-8?B?WGhyUERYb1pmZmFqUWZKcjlFR2U5QVl6RkZvNm82RzBwN0MxR3JaWHNrRDFq?=
 =?utf-8?B?U0VOMkp6blNHdVNBTVZucjNkOWFMRXlVdnBsQkVpME5HR1BDc1FEMkZzM29U?=
 =?utf-8?B?bEZ4YWppNmExdmRFZkxwVHgxRTlPUUJ1cnBoTlZVN2pOSmpUNDE5NHNHM25W?=
 =?utf-8?B?dEx6dGhoRVZDSGJWczJpZUNCTjF2TGkxbU4vQ1Z1MXZHLzBNMklwNFhqNGVJ?=
 =?utf-8?B?Smt1SUxYclV6YWt4eWVKSWUva3BYWi9qWjFzK1E3L0tzOGZwL2RMeGtZSXNZ?=
 =?utf-8?B?SE9ueGxweFB4VUd3QWsrVkJXbDFJV0E3Z0JXYTBQMGsvVFBwY3dYNjEydXI0?=
 =?utf-8?B?bGlQbFVMd0FaQXdaWC9UR3I5UDdNcDNxM2Z6VjBsVFZNaXJESTNNSGZoTU14?=
 =?utf-8?B?blVjeHc5dy9nYTVsQUlxaUhtZFdwQ29CMHVsbU15TEU2S3pjU1AwVzNvR2lD?=
 =?utf-8?B?d1NVa3BST1NrTGovUkd6STRXZ2phdXlLQXU4QXB4RGNCRno4bXM3VE5yM1Vy?=
 =?utf-8?B?cFlXcTlpYVhDcTRXVnNWbnZoZ0NYNkdURWQ3a3Myc1JLQUlMN0lRbVRDcFYv?=
 =?utf-8?B?RDFnd1M2Yk5lcXBtM0NoZUprb1FMLys3bEsxZzF5K2Npa1hRZXlSTmVJbWNW?=
 =?utf-8?B?eXZQREVqMkdNSlFIVExza3pJeVFHcEVXUlppTFBTdmFnKytsZDhoeFlCRnJj?=
 =?utf-8?B?WUk2Z0RSMGdpdVkyaHBrUTdYb0E0dkVsUHEwbnVJdlhVa3pSRVdhZ2tHZ2hm?=
 =?utf-8?B?T3lrRnVaODdzUzJ6K3p6ZVpDdDFkMXpQL2tGQW11MHBIOGVUdVBFZ3J4cGkw?=
 =?utf-8?B?OEpjcHplakdKSi8yclJpZ0FxdzlyYTBKMTl0Sy9meUp3VDRaWVA1ckVlem0x?=
 =?utf-8?B?NkhJcmp4WTUwODJZTmp0UVQrejQwVlpFNitTT3ZISjYxZnIzKzJlQW9PODlU?=
 =?utf-8?B?eldjYkNLT2ZRejI1QjhLTzV3a1doN2VoWmF6MHA0bjJTQXFLbFF6QVZEbDM0?=
 =?utf-8?B?cStJakVNU1c4ZE1uNndPeTAzWis1dzZRZFNQNXgvSzZ5eVI5R0lNWUFubXdr?=
 =?utf-8?B?ek9lbGNjZ3ZLM3M2T2Npam5EMTNmcnhEVHZYUWVrRFIwUEpzWUZ5YlhMVFVv?=
 =?utf-8?B?R1p0czAwam40aFBqNmgvYmo2ZzVOMVN0b21DdUdabVgzNHZqbXpNYktoNWtm?=
 =?utf-8?B?a1J3VUo4SFZIeitpdDZoUjh5Z3A5Q082TEt1Qnh2WDEwbVg5UGF3a1lMYUpi?=
 =?utf-8?Q?B/G0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <69500EFF73465A4689FEAF5ABC7B53CF@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9402b84-0aaf-4ea3-e1e1-08ddb0400b98
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 21:18:47.4923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eXQxWwk79Jovq+YYZJSazmqQZ39SSteSEW28mlF6qZfS6AFS9gFBEqAj7viBaNC9adMf0eqWuJwTbIMQmmOgDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR18MB6289
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_141859_162788_8A964B5F 
X-CRM114-Status: GOOD (  18.36  )
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

T24gNi8xOS8yMDI1IDExOjA4IFBNLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPj4+PiAr
DQo+Pj4+ICsgICAgICAgICAgICAgc3BpX2Nsazogc3BpX2NsayB7DQo+Pj4+ICsgICAgICAgICAg
ICAgICAgICAgICBjb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsNCj4+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICNjbG9jay1jZWxscyA9IDwwPjsNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
IGNsb2NrLWZyZXF1ZW5jeSA9IDwyNTAwMDAwMD47DQo+Pj4+ICsgICAgICAgICAgICAgfTsNCj4+
Pj4gKw0KPj4+PiArICAgICAgICAgICAgIGFwYl9wY2xrOiBhcGJfcGNsayB7DQo+Pj4gTm8gdW5k
ZXJzY29yZXMgaW4gbm9kZSBuYW1lcywgYnV0IGFsbCB0aGVzZSBsb29rIGluY29ycmVjdCAtIGRv
bid0IHlvdQ0KPj4+IGhhdmUgY2xvY2sgY29udHJvbGxlcj8NCj4+IE5vdGVkLCB3ZSB3aWxsIHJl
bW92ZSB0aGUgIl8iIGZyb20gdGhlIG5vZGVzLiBXZSBkbyBoYXZlIGNsb2NrDQo+PiBjb250cm9s
bGVyIGhvd2V2ZXIgdGhhdCBpcyBiZWluZyBhY2Nlc3NlZCBieSBvdGhlciBDUFUgYmVmb3JlIExp
bnV4IHdpbGwNCj4+IGNvbWUtdXAuDQo+IFdoYXQgZG9lcyBpdCBtZWFuPyBJcyB0aGUgY2xvY2sg
Y29udHJvbGxlciBub3QgYXZhaWxhYmxlIGF0IGFsbCBmb3INCj4gTGludXggb3IgYW55IG90aGVy
IE9TPw0KDQpBcG9sb2dpZXMgZm9yIHRoZSBjb25mdXNpb24uIFllcywgY2xvY2sgY29udHJvbGxl
ciBpcyBhdmFpbGFibGUgaG93ZXZlciANCml0IGlzIG9ubHkgYWNjZXNzaWJsZSBieSBhbm90aGVy
IENQVSB3aGljaCBib290cyB1cCBiZWZvcmUgTGludXggY29tZXMgdXAuDQoNClRoaXMgYW5vdGhl
ciBDUFUgaXMgc2V0dGluZyB1cCB0aGUgdmFyaW91cyBvdXRwdXQgY2xvY2tzICgmIFBMTHMpIGJl
Zm9yZSANCnRoZSBMaW51eCBjb21lcyB1cC4NCg0KU28sIHRoYXQncyB0aGUgcmVhc29uIGhhdmVu
IG5vdCBhZGRlZCB0aGUgY2xvY2sgY29udHJvbGxlciBpbiB0aGlzIERUUyANCmJ1dCBvbmx5IHdp
bGwgYWRkIGZpeGVkIGNsb2Nrcy4NCg0KPg0KPj4gU28sIHRoZSBwdXJwb3NlIG9mIHRoaXMgY2xv
Y2sgbm9kZXMgaXMgdG8gY2FsY3VsYXRlIHRoZSBmcmVxdWVuY2llcyBmb3INCj4+IG90aGVyIHBl
cmlwaGVyYWxzLiAoV2Ugd2lsbCB1cGRhdGUgdGhlIG5vZGVzIHdpdGggY2xvY2stPGZyZXE+KQ0K
PiBZb3UgZG8gbm90IGNhbGN1bGF0ZSBhbnkgZnJlcXVlbmNpZXMgaGVyZS4uLiBZb3UgY3JlYXRl
ZCBub2RlcyBmb3IgZml4ZWQNCj4gY2xvY2tzIGJ1dCBJIHF1ZXN0aW9uIGhlcmUgd2hldGhlciB0
aGVzZSBhcmUgZml4ZWQgY2xvY2tzLg0KPg0KPiBXaGVyZSBhcmUgdGhlc2UgY2xvY2tzIGxvY2F0
ZWQgZXhhY3RseT8NCg0KWWVzLCB0aG9zZSBjbG9ja3MgYXJlIGZpeGVkIGNsb2NrcywgYXMgaXQg
aXMgYmVpbmcgY29udHJvbGxlZCBieSBvdGhlciANCkNQVSBhbmQgY29taW5nIHRvIEE1MyBhcyBm
aXhlZCBjbG9ja3MuDQoNCkkgd2lsbCB0YWtlIGNhcmUgb2YgdGhlIGZvcm1hdMKgaW4gdGhlIG5l
eHQgcmV2aXNpb24uDQoNCj4NCj4NCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KDQo=

