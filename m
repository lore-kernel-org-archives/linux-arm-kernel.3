Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8828C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 10:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAFiq+IcaVjsCwE466dANBMynLCsi9sNek5qz+5MMFQ=; b=YCfRKpFfr+q2e0V/MqNZqv+H5x
	YIwY+zSSUkMnnXu65YeGlYrFG3aOa9qc/Oe4GCvMp+wTSbMsnDNUz0Gynq+yn4a1NQce5fOJaEv1O
	kgtbOk5DYtsMx3zJ2sb9gV6vx/E4L5rLDUXwjn57iree+OmYG21tKEW8By2jeKC9egeSjIDhlBQwC
	CS37yCih2hz5nWiCk9/+G1RW5SeQ2Fs52UK22VP1XB8AkSIcDL8hj+1W8njDBKeDZFbiZdUiCCoFX
	DxgmxIjUzTDA2lrbnUQR0FeeqD+7hDVd0L8QAfqaa2nRIU7GCIR0BGRXs2esM7aJ7P8t28245uvQE
	/3+KLwdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRT8K-00000006rNI-0h3B;
	Tue, 17 Jun 2025 10:01:36 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSmH-00000006mx4-15n2;
	Tue, 17 Jun 2025 09:38:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3Z45xj5F9pgiTgEMA49CqhsJ3aLsLsowQpcP5FpHUC8fXqEXRyul4l+faD1ErlHuCYGppTYz4TkruQNSYEKW5mNIP7tUIVDRF4go5Ml7AZ+jf5MxKP2brL0YEiUGD/ZBv3QFtLBeuOjE69e5Hy2iyRKhiS6Mc95YWfA53z5ut0JNhZGGWexpJ9nU+tZ79U0pc+Rob7TFsM7IM6yrOX1C+npoxqQTFWlu0fHYRY+QGsuFpovXmsQPIkrxvTgHSUzmSCpdHttXDbTl0ZMiwYNIJkrDYJZxHaUhVGvGt+ACtDrIXToao+eVEv8fhjTU3NGJ2+L0v/aVfo1L5/OY/9a8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAFiq+IcaVjsCwE466dANBMynLCsi9sNek5qz+5MMFQ=;
 b=yLFUhCbFy1QiaaplXxvpoXi2vBG8Dr5qDZaYP83D2Io3S1E/rZkZpBWooP2TqkvkKno9QMm/aUI8KKCY3Dr0n3rpgjVZgpTb/xHOxHY+yv2IbRZj6F2cZ8JQW2JfAe6XciKvxgeNJO++9rd1YWPQCz24h0zx9sdGBLrzftPit2sgW/PMZzNbE/GJJcZzLsbrMv56On08dMpjRNrdLE0fJv2alaNNX3r1l++cUKCXjdK1clLVKPkTMO4kKviBZ1F0mjNb2HpHyUHRYbrftdlCYXsLSd0KLknITZ6zDpLCuVfoI02gQUQxBVWsBzrO4UEiOeVS80I/bjkczMZxbJm+lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAFiq+IcaVjsCwE466dANBMynLCsi9sNek5qz+5MMFQ=;
 b=e0a/5ojXplhSkVVg9W8vV9GYBvCAhbPkoxQRe8MevefpnpFc9/SUnJAU+UVYp/+EKI49dwTp+qP619taGuMQf1B5PSF5hrbEkp4w0JtVyNLPVXKpSOyI8EYGeZiRv8r/oj8+BKs10VwdEj9kwtBetGA913nak6LFFCqoZHZIMpU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS4PR04MB9484.eurprd04.prod.outlook.com (2603:10a6:20b:4ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Tue, 17 Jun
 2025 09:38:35 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 09:38:35 +0000
Message-ID: <b079fc14-8692-4521-bd81-fe2fca713f2f@cherry.de>
Date: Tue, 17 Jun 2025 11:38:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: rk806: allow to customize PMIC
 reset mode
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Quentin Schulz <foss+kernel@0leil.net>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
 Daniel Semkowicz <dse@thaumatec.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250605-rk8xx-rst-fun-v2-0-143d190596dd@cherry.de>
 <20250605-rk8xx-rst-fun-v2-1-143d190596dd@cherry.de>
 <20250617-small-vivacious-labrador-7f0eb0@kuoka>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250617-small-vivacious-labrador-7f0eb0@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU6P191CA0005.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS4PR04MB9484:EE_
X-MS-Office365-Filtering-Correlation-Id: eb5f9890-82df-434e-2e83-08ddad82bb29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3BIOVF1VVBHRmo4MGp0YkM0WmlKN3ZZVVZvejlFMmRWWlhLS1JSWXI4KzZP?=
 =?utf-8?B?YzJwU2szSHpYR2Q1WXllZDJrcEhtcTM2U2lvRUZVa2RtMU9DRkNQSTk4eEd0?=
 =?utf-8?B?cWZaMEdsVXpyNWRacXJpbkpsZUo2aCtBUWZVa2EvVk0xL1pmSXZhY3BYZ0N6?=
 =?utf-8?B?MVVPM3c1OGQ4TzVKaXJZNnBUM05SemhvYjhCREJNc3dBTGljUExDYjlGQlJH?=
 =?utf-8?B?cjdOR0lOMlRwVFFVdFNyYTZWZkt3RWhGak42eS9xeUVqbmkveVEvcXVSMkt1?=
 =?utf-8?B?ejdCQjRxUUdwdTdEQWVKa0xHcmppdW9nbThnVk9NMGNsS1ZVb0ltVkI5d1F5?=
 =?utf-8?B?TkQ3QjhncmZLVzZ1c2hmWHU3VmVJbjU2RXpvTWRNNGRQQXl3bThIeHlSdFJu?=
 =?utf-8?B?OTdGa2Q1S3Y5ZFM3WllNUWZtUndEZW9BbjRCOU9EYU0rNVJXVDEyMzR3VFJs?=
 =?utf-8?B?SUtrNlZhbnZKZ3JtajhzTEZ4UHFoN2NaNWFxMFV5NUlWeVc2dHB6RlYybUo4?=
 =?utf-8?B?NzZRR2ZOeEN3TG1ZOEJWYnhxRyt2dlV5YnVmS2tOWHhzZGxQU05GcW85UktE?=
 =?utf-8?B?aHJ3aUhBSnQzeUdNbjk4NWwxakUxRGxSSDd4RXYrRE5NbFhBeEYxNzhrWi9S?=
 =?utf-8?B?Z29YaUZXLy85bmVpenZSRGVQcm5maTJNZmhwMU91WURoSU5GV2pUYzU1V3BW?=
 =?utf-8?B?NXJWNW1yVUpUWmlGS3I3eU1LNm5VeUxnZGlrWFd6ZURkM1BQTkJHUk9UbEJv?=
 =?utf-8?B?RnV0UEYvOVkwRmRSMmFRRThOSzFvY0JUeFdaejlNbWxTY3YyUFl3dEd0OWVh?=
 =?utf-8?B?TVpoeTlWUnNMTVFjUHJCRGE2d01JWUFZbnUyTFhEUXpJYkN2ckpVNVozQm1m?=
 =?utf-8?B?VURxU0lrblZzbGp6M28zMkhFUTNvWVpFVnJXaU5BWWZGZW9YYmhwUDl4K2lt?=
 =?utf-8?B?V3g2aHBla1lINlF5VWxpeGhtWm9FaHVzRFFjVjZhWENNSFNPQWpIamU5VlFT?=
 =?utf-8?B?TzdMMC9tVUFSTDVyRTN3Q0I4NFFCNWIvRm5jYkxYdjRYcWRWOUZHby9Kbis3?=
 =?utf-8?B?aXZTWkN3bTJORUpRSGR0WWhDdytnbStmRUZEckc1WlNhZFpMOTVQTEFEQ2Zn?=
 =?utf-8?B?R2JycVFkVDRneWFQVU1EUVpqcmQrcG5UZGpZZHprN01mMDByejBVNVROR2xp?=
 =?utf-8?B?R0F3MFNOeTViMDdOUFVRblNMeWNhRm95WllibHRyMFl0NGp2bXM0Z2JEMWpm?=
 =?utf-8?B?TWhBRTBueGRWcGtLanNGN01yamR2R2szMS8vMmZyRTFJZGRKVnk1emhBQTNG?=
 =?utf-8?B?aGR2WGZvMGplSkEyc1dhbEFFZEJFWjFjQnJJZm5YcGljcGRPVFl3STNkNkh6?=
 =?utf-8?B?MkhEenBwRmFmL3dIQ3NPVDFiTFpqbUFZbzVLWlA5cWpuOTdmQmlUMHBqQkti?=
 =?utf-8?B?K0JJaS9VSjcrOXk1RWdVV0dIQzlYWWlHUGJpeVNnZVBPczZJeFZ6M0gxNEJI?=
 =?utf-8?B?bmFaZDFkRnhOK0NFd2x4alRWM2xKZ2h5anpuYXhFaENIcEdLZmVpdGxsOE9t?=
 =?utf-8?B?aTlEZ21JKzROdE9Md0FxZzdyNlZaRVZ2SjRTL3RyV21zWkNoUmlGeG5jZXNZ?=
 =?utf-8?B?MmpNaUhaMTJXVjBNMk5jYS8wN0J4QTM5b0x2a3IrWWFBSDRORGM4dG1LMkxW?=
 =?utf-8?B?emZxNnVWc2dXV2V6WEczaExXK0VZNWYzRit3akJHaHFZVWdBaEgzMk5XN29P?=
 =?utf-8?B?RTcweHFNTVZhKzJJSWJQaG1HMitETGd0b0k0eVQ2eUVMZzRVM0Z2UkxWWDZJ?=
 =?utf-8?B?RzNMazlDSmsvTVp3ejQ2OXNhbW1xQWEvMmYrTU4zZWRNUlduajFnNzhmVGZH?=
 =?utf-8?B?ekZmYS9wMWNCb0RYVEFzejlSc2YvdHpTNHluYkwrdEtZUWcvY2ZyVUVvSHBD?=
 =?utf-8?Q?NlHlmvXu3GQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N09UemR6TmZ4QUVUUHdFdnAzalFZdmZxbjdsdkd4dmFhL3VjQXh2UkRQN21x?=
 =?utf-8?B?ZUh5MkxPTGl6cXRnRDZXYTQ3WWdVU2pBT2FvaHlJMjkxeEx2YUttUUVPRUQy?=
 =?utf-8?B?b2kwT0xEZjlweFRyeXVnN1BRSUdnbXg3bHJwclNTMUFVQzZ2UExtamhyNCtX?=
 =?utf-8?B?VS8rdDV6aGc2SmkvM2JaV2hkWmJOU1puRnZwQkpCWmJKeHByUjNmVjVZalpn?=
 =?utf-8?B?bnZoeEJ5V0YwZkFtMHR0ZnZHV2lMMTd3V1N6enBJTng5TGt2OEpLQ05TSGs5?=
 =?utf-8?B?VDRWbVA5cjQrelJZZitaWEZGTXdnSVQ3Q3B2TkNYelBuL1NiZkxTcFpXZjBl?=
 =?utf-8?B?c2hEU0dvMWRPTkhhaHZHK0RaejYyblFEbXZwSUpJTktvOTBDOXlQTE40RllC?=
 =?utf-8?B?RmlrbCtVQ3gxQXZoZ3g1WFE3MjNOZkJOZ3pQeWd1VFhjbFl2UUFuc2s5Vzh4?=
 =?utf-8?B?WGNFbUFYVXVVbS92R09BbEJuaVB4SjJNN3NpKzc5ZnMrV0tCclpIQ2NOdC9D?=
 =?utf-8?B?ZzJLQWNBWEllUkdaZWFkV3FYWHRaK1ZXdk4ydWE3Z1hLN21FYjJpb2NSZS93?=
 =?utf-8?B?eHhXYWViczdLTnhhVWMxalVyS3pZZDZ6UndkMUZpMUpuYTM2RnpEZDFUVlQ0?=
 =?utf-8?B?UjdRekFpd0VXL2IwMnpoMkZLVVFlNm0rZnBWQWN5ZXlqdlQ4TTF3S0NtT3Vn?=
 =?utf-8?B?R0M2VmxTSDVDNGJFYTVYdjVWMFRtVXFEVUtvKzFybkpIYS9JM09FMDJXOXpS?=
 =?utf-8?B?L1JVbEcyL2F3djliTWZKNHdzNldMWko3Y1QxSEFLWGpvVXJ6Q2pDdy9IaUdq?=
 =?utf-8?B?cU4zd3ZlN2pZbnlTcm1waWtPRnRHVGYxRlQ3ellRYnV5aGRHMHhkSkhraVVI?=
 =?utf-8?B?aEZJeUVVSVBPY3NtU1hqbStsbllKR2VPZFY5UGZkai9vNXRGbmpqamthTU5u?=
 =?utf-8?B?cFg0UFgyRWlXU3FzTk5MdmdxTTNxYlo0N2xRTUJ2L1psQXQxS0sxc2tCWjhE?=
 =?utf-8?B?NFRKN3pNZlNFWCs4VWp5bklsbDlvU0tyeE0wa1lmM1FodlhRZlJndXczTmda?=
 =?utf-8?B?TFJMVnpFVTBuRnRWN1NVUGNYdEsvcE9WN2UyWldPZXBDaGNFYjAwOWRTSVQ2?=
 =?utf-8?B?MG92NUhJSVFDVGZRSFhxcDlHaGVFTERIbWZEZWwya2lqc2RQV3NEejJRM2RB?=
 =?utf-8?B?Ym5tczVGWEE5MzUxVldRdlU5bmg1cVBoalJYS3RSVWZBVmx1dCs1UW1MNmpm?=
 =?utf-8?B?M0gzcGU2T1I2cWRGUGRzbFp3NHh1anZJQlNpWnR0YStONlMwWTRVNjViSmhr?=
 =?utf-8?B?TjkrL01uZERlZFBUUW8ra2RDWEUyTnM3YU0zMFVxbzRQM25ZRmdSbmFCQlk0?=
 =?utf-8?B?bXZNQkJaQm9PekJkeHV6UC93RVRuSHBOQ3hNcFZaVU5oNmFsaVgxa2FLOG1H?=
 =?utf-8?B?WmM0bGpGVHIrdk1sRTBVSER2Mnp1d09jSUNmYW5UVXMzazFreFRXekZaUE9Q?=
 =?utf-8?B?MTc1OW9tTERaM1BSUUIxTHBYVjZOY0FVLzdnNFlURFkwT0IwakMrT2FTUGE1?=
 =?utf-8?B?ak16dktnRG9yaXQ2WjIyMUtMUk1ZeXJNVUVzdFdXRllHUkJnbGxQeEpYanMv?=
 =?utf-8?B?eFZqcWN4VFZBT0N5bklRVEZ2WTZtNXdWRnJmeFhadElKVS8xK2FPOERiUGgx?=
 =?utf-8?B?RTVRaGpNaTgrV1FWVnVPTE10UmFqSFRFZE0wSGFacmsyVzFtcnNJdHY0V0Iz?=
 =?utf-8?B?Z2lDSnNvZXNFOTFWandDTXdpYlQyQnJxajA5d1l0MnJwZzAzbEFwVStmaGpt?=
 =?utf-8?B?d3RoelJNTEMxeFJJWCtxQmhpMGUvazdESEpFQ0xQNU9NeitmbTlwZWd0N1Yv?=
 =?utf-8?B?aHZWb25LRjdpVHIzR1NsbkoxT256NXRkSDU5bVBVRExsVWE4OHVRcEtPNDEw?=
 =?utf-8?B?WkNHK3h5L1lkb1pzTkpKZXVBcHljdXpkOS80R0Q4MUs4WXNtVFhLa3VtczZI?=
 =?utf-8?B?c0FGT1BaUEdtOGdqTEUyMmZNMjhiOXdVbzI2b2paVVdHWDNtdDRUK0drWmdB?=
 =?utf-8?B?Sm5yRFZXaTVkZG1uT3ZRVWlmcklUUTYxV0dwL2V5WW9TWG9TbUZsd1ZsMGwy?=
 =?utf-8?B?N0gxc2RsdTVlSnI5Sld1b0V6Q29kOTN1RFFOb2w5Vm5YVzZPeVlKUGZRWjBQ?=
 =?utf-8?B?dEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: eb5f9890-82df-434e-2e83-08ddad82bb29
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 09:38:35.6699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mtM8NkmESV08kgYkq6B6u6rdcVlc/MXgUa8wn1Bjy1ixvlcxRR9vqvlRul+cf4AGjbjoeJgX2FgzRwkOxcQJZswR+fjbucrSHdExG+0FG7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9484
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_023849_305212_48D7A1A6 
X-CRM114-Status: GOOD (  25.02  )
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

Hi Krzysztof,

On 6/17/25 10:08 AM, Krzysztof Kozlowski wrote:
> On Thu, Jun 05, 2025 at 05:41:06PM GMT, Quentin Schulz wrote:
>> +  rockchip,reset-mode:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [0, 1, 2]
>> +    description:
>> +      Mode to use when a reset of the PMIC is triggered.
>> +
>> +      The reset can be triggered either programmatically, via one of
>> +      the PWRCTRL pins (provided additional configuration) or
>> +      asserting RESETB pin low.
>> +
>> +      The following modes are supported (see also
>> +      include/dt-bindings/mfd/rockchip,rk8xx.h)
>> +
>> +      - 0 (RK806_RESTART) restart PMU,
>> +      - 1 (RK806_RESET) reset all power off reset registers and force
>> +        state to switch to ACTIVE mode,
>> +      - 2 (RK806_RESET_NOTIFY) same as RK806_RESET and also pull
>> +        RESETB pin down for 5ms,
>> +
>> +      For example, some hardware may require a full restart
>> +      (RK806_RESTART mode) in order to function properly as regulators
>> +      are shortly interrupted in this mode.
>> +
> 
> This is fine, although now points to missing restart-handler schema and
> maybe this should be once made common property. But that's just
> digression, nothing needed here.
> 
>>     vcc1-supply:
>>       description:
>>         The input supply for dcdc-reg1.
>> diff --git a/include/dt-bindings/mfd/rockchip,rk8xx.h b/include/dt-bindings/mfd/rockchip,rk8xx.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..f058ed1ca661185f79738a358aa2d4f04539c590
>> --- /dev/null
>> +++ b/include/dt-bindings/mfd/rockchip,rk8xx.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
>> +/*
>> + * Device Tree defines for Rockchip RK8xx PMICs
>> + *
>> + * Copyright 2025 Cherry Embedded Solutions GmbH
>> + *
>> + * Author: Quentin Schulz <quentin.schulz@cherry.de>
>> + */
>> +
>> +#ifndef _DT_BINDINGS_MFD_ROCKCHIP_RK8XX_H
>> +#define _DT_BINDINGS_MFD_ROCKCHIP_RK8XX_H
>> +
>> +#define RK806_RESTART		0
>> +#define RK806_RESET		1
>> +#define RK806_RESET_NOTIFY	2
> 
> I do not see how this is a binding. Where do you use this in the driver
> (to be a binding because otherwise you just add unused ABI)?
> 

Explained in the commit log of the driver patch:

"""
This adds the appropriate logic in the driver to parse the new
rockchip,reset-mode DT property to pass this information. It just
happens that the values in the binding match the values to write in the
bitfield so no mapping is necessary.
"""

I can add useless mapping in the driver if it's preferred. I had the 
impression that simply using a hardcoded value in the DT binding and 
then writing it to the register was not desired, so the constant is now 
here to make this less obscure from DT perspective though I'm still 
writing the value directly in the register. If hardcoded values are ok 
in the binding, then I can remove that header file.

Cheers,
Quentin

