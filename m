Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D091CE8D52
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOJU3VOtGAzhChZ7v+99KC9NNXTQ5V30jT6AdkpDsMk=; b=MxlP+QpoIvxjkZKBt6olB6Tuwh
	WWizOXjKSYcdTb4lJSLXzS5ZNVVd6kcJ45EOEjrhOjDZhYpsl4v7QwERWu7hSpvFKsjA0rlWrOsdk
	FnMtWtXerPjiimsgFws2i+7vpyLsemxtkGEjtd7tzNzzejpesgGPWGDdLCxNiDmv/38ugdb2LkSCD
	udZU+mqsfGSOY+lShEPBNVvTLKgfuxSbPur5jUM5/mPBotAzq+ne9cQEcOTBlWzo9SZrIM7jwshW/
	Po9E2FoDheBTKfWBGAPpY3gsAAub9voBXOUKqtUayjvr8ySX0v/SeVGVKpZ/WqAZA10/ZaoefrNs3
	vCsVSUyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwwX-0000000ClH7-42dN;
	Fri, 14 Nov 2025 16:46:37 +0000
Received: from mail-francesouthazon11011006.outbound.protection.outlook.com ([40.107.130.6] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwwV-0000000ClGi-0ahv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 16:46:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VehI85TosKcoXkV+H0iU9sEY+HPU6Jtvf0K1GzMPh8MH1N0X2fpZPMJgiio4Vv7/YLO/LyAQ6X0RjOUQ6ytnbNTwo2dj0NbmUaudnT1siyKrBMj4oUgURhmbmJ7j/uRMqDkZU42kSeMYq4kr74lkr0gVuRI/k20tWhGXxFtDbZzZP0kiqCHaoyblTFC5PWnUb9RCef7mAa2oojeRs3Txz7xVOhgMVg0zxGObfUPqUUlQ9mejunU7LZXve1nFnHXq7UoG/uaBM/9XDtHlLzUIu93xqJ8bM7qfSbpyKpuOlQTSoGfouI3O+e9KjdZoaI+riV3botM5rQn+Eo40/sw6RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOJU3VOtGAzhChZ7v+99KC9NNXTQ5V30jT6AdkpDsMk=;
 b=IHd+CmhYEvSz2HH3Qofs7FLgKQBQYHdRoyXKv34Dgula+XzrDB8WoKREkel0LvN2FHi89oeMh0LqkVy0X/ymrrXG3ggJBdzoi7Y6qDsZNT7rywzHct24fbqZ8rKOlVSeLnJajVuytxuBYiTZbTm9RrQAeIOeXNTIQ6cvZ7rToodk9shLP2S+5NPd7GTWjjByYHliQgESY8k+k7zr7yqqB9ErwbnALxS5rpNvNK9opxqfECMoh8VYUex1R30wlC9qTlAmmvC+PywHharKQkm5W8prxrwrEm3wcXioPdnUucf1rn1+GI8UwouSoMV9QNz+KUiZ78Cs1WKA+AbmsSiyzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOJU3VOtGAzhChZ7v+99KC9NNXTQ5V30jT6AdkpDsMk=;
 b=k9G2YoikDVAWJQmPN6UPGGmg67zx963qWu0CeIuFWrbo5u0g8S7BblLWvOEZb/IkmLWh2YtBUyFFQhmLqTjC+L3kPvnByeamky3gIdZNGolTx6FgJNzdg/j9hcTZiV+/wMuR6dZCdTd0LqnjfX7zndW+AcI44NPPh8A3cDe9U8njUI+5QefV9IJvImSy/dmhEQTHpVEMDkcgSGeYN2KORNVKhsvb95ajcUWx1JmhdLNll6+d9NmDgMl2n7yNetVFpXPcDdq1CQrUm4MfYBJVSLN6odt93HSs000GeavsrK9DePfdeg8Mw64kXaq9rec8+a21SyqdjRneue2mYcOPbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8903.eurprd04.prod.outlook.com (2603:10a6:10:2e2::9)
 by FRWPR04MB11101.eurprd04.prod.outlook.com (2603:10a6:d10:171::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 16:46:28 +0000
Received: from DU2PR04MB8903.eurprd04.prod.outlook.com
 ([fe80::e980:b84e:13f6:1384]) by DU2PR04MB8903.eurprd04.prod.outlook.com
 ([fe80::e980:b84e:13f6:1384%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 16:46:28 +0000
Message-ID: <d2b3c620-7a6c-4674-b385-a343ad73fa65@nxp.com>
Date: Fri, 14 Nov 2025 18:46:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: SOF: imx9: use SCMI API for LM management
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251114143503.2139-1-laurentiumihalcea111@gmail.com>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <20251114143503.2139-1-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0059.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::26) To DU2PR04MB8903.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8903:EE_|FRWPR04MB11101:EE_
X-MS-Office365-Filtering-Correlation-Id: 50d1cc9c-418a-4efc-e5b0-08de239d5b27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|19092799006|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVJuVGs4NVc3VXlsbngrUHhLOThZRy9qNlBIWGp3aHU1cXBhOFExUGpBSVVv?=
 =?utf-8?B?RjZuL2RwRWlEN3ZEaDk2N240OEUxTU5vclpmRG85Wnl0ek5SalgycG1lTi9p?=
 =?utf-8?B?ejI5RmZvSFlzeFBJczdQMTZnT3lyUUdNOXBMc0tZN2dWbmFacnNRemlnOUVO?=
 =?utf-8?B?eFdGcHR0ZHVDZWJrVS9tM2s0eFZFcmN1ZFlhRCtGeHVnMjB1a0FIWFBrVUVN?=
 =?utf-8?B?NUx1a2hRNTc5SnJ1Um5ZeFNtM0Z2VXZtOVhCcDFGY2hlcE1KYmQ1WGV0Yjd2?=
 =?utf-8?B?QWNSV2N4ZnNONFRGTm9HcGdrUTRGSlFicGQ1YmlmL3IxNkdhMHcvQ3hMTStK?=
 =?utf-8?B?aFVtaHJ2RFlSRWphSVNCZVZjem0vcjZmV1BUMkg0cWcxL3hZUm5rcjNMWDZ6?=
 =?utf-8?B?SWJlTWhlRE1BeUV0VjdXMU5YcnFvRkV5NlhYMFJVRXJyQmNpNkRjM3VMMXFi?=
 =?utf-8?B?cm11Wk9zdVdwN2NHVlNCTFQvTFEvbkswTzh2enRXZGE1UUNwenlQMzlZZGc2?=
 =?utf-8?B?QUZ5MTdDN2EwaWpSOFQ5NWtTRkhGazIwR3EvOUZiQmEwUVhmWCt4RUhMN0p3?=
 =?utf-8?B?RitxSHFvTU1SeEg3eFNvRXlSQnBFNVdjVm4ycFJYYXhWSEgvMlc5RzJjRm9H?=
 =?utf-8?B?SWZxbE43YVVpbUpyYmNIL0RzMWRUM2NKcld5WGxnSjhNMWl6ZHlseGJXT2k2?=
 =?utf-8?B?RTl1SmE0T1ltQk1rTTNuRThNNERHczZWenhJSVBNbVltSGRNRlQxK2p0Wm5I?=
 =?utf-8?B?OFpsa0NQK2tQVTdHY0loU1o1eXBBVEJVK09QOHltWGJtT2NzVnVBbU9jQkt6?=
 =?utf-8?B?aU92S1pYd045Q2lJcWRDTExSVG5DLzQzbVNOYjZqZU1USmpKVWhoa1Y3YXFw?=
 =?utf-8?B?TnMvVHh4enR5TURXK3ByQlpIUUQ5akZReGZGdjZDVi96ZWJGbWZQN3ZncTYz?=
 =?utf-8?B?aXRjcVc2akFMQm5VTUdGdXZiUytjT081dmVSTWlDSnY3L01MRnZyKys1dEc4?=
 =?utf-8?B?WUwyVUhtYXFGYnhJeGk2UEZvRG5iNXlVQlp3RFlJSzFSOC9CSklOWWhHeGh1?=
 =?utf-8?B?T3ptU2lhRERZYnl2c3JxODEvYlhXZ014WktjRXJhSHdkWm1yOGtrM05RL1lW?=
 =?utf-8?B?NFYzMCtRZDVCR25xZTJnZ3dIajdheVdZY0d0ZEhtTzlTNW9YdVF6dGF2SHNr?=
 =?utf-8?B?YlNGZzc3VmlvMzhtM1RQT1ovQlpLdXBXWkpIcFZyL0dPTG9JcW50Y1hGRGxL?=
 =?utf-8?B?VHNMd1lha0t4NWhOWGM4RkVwUzJlL1lsYUJoV0VGQzZndzNuQkNkUE9FOXhI?=
 =?utf-8?B?cEJ1YkFtMUM4Vk9HcXlnUHlzL2ltN3J1UXpHWVZrdCtnTVJ5VUNtclc0bXVN?=
 =?utf-8?B?L2F4NTh1Vjl2OStpNmVIVTc2NmU3UWFpK0FWQTlTWkFjY3NGbk52YmRGQnlV?=
 =?utf-8?B?RlNBdU55dTRjN1hZUldCYUVqUVhkUDB4QU0xUGtQR0VZa2d4dVM4TmJQNFp6?=
 =?utf-8?B?STdPeFJCeEQ3UWV2UWU2cTBWTlMzUkZxWlF2ZWJUYW5qK1MrU1RhcVpOV3hj?=
 =?utf-8?B?M0FMajE2TlkxaG1xZVRHeVlMUlVuT1p5d0FSR1l6VGFGMExaaC9IaFN1Wk9i?=
 =?utf-8?B?VmluNy9EQVJGaGhhSVg2ejRvMVg2L2tjYXA5Y2hvOUs2V05tUmtoTy8zRStU?=
 =?utf-8?B?Q3V5QXVYZ3U3ckdBbHNlUkRsNjkyY0VHcVN5UytidmdUc0R2Z1c3NHczc3Nj?=
 =?utf-8?B?anZzS0M4eGFBaEJrRVVuVXRGUzdmMlIzMUt0NUFINUxrSXhFVHM5OHJQK2Nn?=
 =?utf-8?B?NDZpdEFBdjU4UnNjTnFMdlNYNmRxcXAydFM1SnNPSEFKelo4T0dIdFd0Ymc3?=
 =?utf-8?B?VmxzU3BYRFI0QzRoNFZvRU1Bc0VXa2xKWGh1NDJjamUwQXl6TCtYYzhnVCs0?=
 =?utf-8?B?aDkveGJSR3RJMnI0eDFwMVFlMDd6bVF6RHFxVHdPRGlhWUlWRldhWTZZSzZo?=
 =?utf-8?B?b3p2aUs3NlJBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8903.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZncrVEpwVUxBQmdycGpqSW1VTjI4bzhFTTUwMFRlU2k4WnpZYjlKbk1SRVlP?=
 =?utf-8?B?cjJ1UDdpVUJRT3Q5UlFnUDIyRHFtYWpKMnJTQisreTZjVi9lWDVlWWRpVFll?=
 =?utf-8?B?LzgvQ0dpRU5uUXpyY21EejhxcFA4L0YxRFNTN2pKOVZJVk9adjVhSUxhelhK?=
 =?utf-8?B?SHF3ZlVYaVlTcWtaNDZpYVBwK01wSExVOVpITy9SY3NMM1NTZFBSRWQyVTFn?=
 =?utf-8?B?ZEVxZk5ueVpvamJ0Um52OGhSSkdvWTl4TjJuVnhpZ3AramhNaWhRUE93VWNp?=
 =?utf-8?B?Q3A0cG5veURSSzlUc0haWm5XYmhkanRoOXhOTVVqSi9Rcnh5UjdhQldVV0J3?=
 =?utf-8?B?SDl4ZjJ6ZCtaOGxtSkNmcDJWTm9TNG9ZRGE4NlV5eEV5T3pFV3VoZmhYTk95?=
 =?utf-8?B?N2orZUtJMkgxL2JTRytkUlpDcVhxYjNaeWFLMGZBVXRXUnZwS1BRUlhkR01F?=
 =?utf-8?B?Nm1SUHEzQXRFR2FvNFcvYi9xSEtyZnAvZUhaV0ExUThSOUd6Z2Z6OWp3d2RL?=
 =?utf-8?B?RWhjcy9OeldHUHBDV2pUaFZGTjZoelFWbHcvYWtBQk9SV3BBcVBpY083N3hx?=
 =?utf-8?B?c1I3TjFGdWtLNTNnSHRMN2V1U29idkgyQTNUd0RuNTF6RUluMFhrM3lEdFVm?=
 =?utf-8?B?WWR5ODUyc01PRGtLWDR5Q0VjK2dpVmYwY2E0Z2l5eFhNSEN3R0Z4aVJES1Zu?=
 =?utf-8?B?MEZYQjhDVXY3UjlLczQ0c2tGS3A3VEp1UE1MR1pRYzZuSWsxaWIweWtwOG9m?=
 =?utf-8?B?VVZPQVJUYlpSRVV6aVN4bHZDYmVQbkdDVS8vNTZpT2JTWWhkb0RmcEdhOVBv?=
 =?utf-8?B?azJJVmhlUHNIYWd5ZkV5UEd4eEVaZk9veWVWY2ZDRzQ2S2F0ZmdhcUk5SU8z?=
 =?utf-8?B?ZUdTWGx1UVJQMGhGeE9ZUDF1NStsM01kcHNaU2lNTzVOYmhUeW0yWkJhQ0F3?=
 =?utf-8?B?L2pBbVNyU0pQZ29wbUdjTEhHeGFqNnBWTFhvSU5TdGlXTHVrVEU3dmdZLzhC?=
 =?utf-8?B?anRGM0ZTcmFSUStVdW10NVRhdXJ0WlBGK2ZGNHpFRU9XSDJHWlkwSVZ5Nkxs?=
 =?utf-8?B?UDdkVTlWaWM0bXQ4bTdXTE9rdmVwT0pYbUUxNUkzaUJqcEh0MS83Q2JUd21E?=
 =?utf-8?B?cnR1K3VmTmxyenRuQVZjQnByZ2YxUk1RK0tvbVByMklnVHFlV210RGdicUV2?=
 =?utf-8?B?QXg1TDlSQ2lqbEpqV0dlZUlJZnZXM0JhV0NSRjJuN2ZiNDFTR2luMzg5QlFK?=
 =?utf-8?B?dFVaQk5vSEl5cElLdkwrOXZDUy80VzhsVjFUNkVGT2hWL1pJdHo1SmNuVlZX?=
 =?utf-8?B?SjFHaFplUmpSUUthNnFNRVMwMUt6Snp5aUY1QzFGeFhjTGk0TzJDRjZpWE51?=
 =?utf-8?B?dThuNzY4T21YZ3V2clRRL2lad0ZRamF4TTJYZlZBdlV1UWRWdGZPL09PV0I3?=
 =?utf-8?B?V0NHS2R1WUVsa0ZGVzJKK3FXZG96aW02QzZidDh3VUlDYjQ3cXBGd3VxclRa?=
 =?utf-8?B?aThzOVVmSUxkN3hEUzBxY3REbWkwcVNUR1oxR1pEK0JtQndZdDFlK3NHVGEy?=
 =?utf-8?B?VTdMZGN3NjVKdXNHQ3hoTDdRRHM2VXJrajNaK1B2c0h4YkxjblZ0ZTN2QkNU?=
 =?utf-8?B?OWNKMFN0WnFuVmRYV1RKMEsvSWFwOXBNUjNJY0lZazlKYnN5Mmp3SElhU0dV?=
 =?utf-8?B?UjNUN2RjUlViUUlqRHBqbm1nRGNNekZUVkRHZk5USllteEg5eG1HVHpaaE1w?=
 =?utf-8?B?WmREWnh1MFJlOCtndi9adE1vWEtINmJtZWl2QmtENSsvVU1ua2s1aDk3R01V?=
 =?utf-8?B?bTVGbnJUVkgxMGxpNVRMekxZam81emJtY1UvL0NsSm5yaFEyTzlRVUlnOWl1?=
 =?utf-8?B?cUt1L0RRTlJmWEhHT1hiS1ZObStoMjUrNmtkSVFXekViRjBhbk54QkRFT2N2?=
 =?utf-8?B?dU1IQmJYd0RwTm85S050bEkxb2kxUDBoS0xxaUhrQk9yVlBZTmcvZzkzd3JU?=
 =?utf-8?B?ZDRpclZuL0FrZVh3MjBHbzd1a0FUcEVYRWp5b1o0MkRCTy81eDhEY3dkVjNL?=
 =?utf-8?B?Wk1OdTBCWUtjUHNuR3JwVTBUU0VMZG8rSExVbkU0TjduM3dKRjBScEVHYVR3?=
 =?utf-8?B?aXNVcWJaY3ZCaXJYenEzZTV2OTRuYy9QWVFEcm1RU0pzN1crVHg1eW1DdDho?=
 =?utf-8?B?ckE9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d1cc9c-418a-4efc-e5b0-08de239d5b27
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8903.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:46:28.2193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFRCqCR0hcUaUVHkH5Y8BathPV3FkBrWJgbMMvkkIqkz5lCBwxTWTrtndMk/hjwr3HrHZYtIlFWQMKQw+v/60Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_084635_188956_6D9AEEAB 
X-CRM114-Status: GOOD (  23.14  )
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

On 11/14/2025 4:35 PM, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Linux supports NXP's LMM SCMI protocol so switch to using the appropriate
> API. The SIPs were intended to act as placeholders until the support for
> said protocol was upstreamed.
> 
> The underlying CPU protocol command from IMX_SIP_SRC_M_RESET_ADDR_SET is
> replaced by a LMM protocol command with the same effect (i.e. setting the
> boot address) since using the CPU protocol would require additional
> permissions (which TF-A already had). Apart from this, the SIPs are
> replaced by their equivalent Linux LMM commands.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Thanks,
Iulia

> ---
> Changes in v2:
> 
> * add dependency on CONFIG_IMX_SCMI_LMM_DRV.
> * link to v1: https://lore.kernel.org/lkml/20251112144124.680-1-laurentiumihalcea111@gmail.com/
> 
>   sound/soc/sof/imx/Kconfig |  1 +
>   sound/soc/sof/imx/imx9.c  | 36 ++++++++----------------------------
>   2 files changed, 9 insertions(+), 28 deletions(-)
> 
> diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
> index 327e2df94a58..09d88ce5b9e6 100644
> --- a/sound/soc/sof/imx/Kconfig
> +++ b/sound/soc/sof/imx/Kconfig
> @@ -35,6 +35,7 @@ config SND_SOC_SOF_IMX8
>   config SND_SOC_SOF_IMX9
>   	tristate "SOF support for i.MX9"
>   	depends on IMX_DSP
> +	depends on IMX_SCMI_LMM_DRV
>   	select SND_SOC_SOF_IMX_COMMON
>   	help
>   	  This adds support for Sound Open Firmware for NXP i.MX9 platforms.
> diff --git a/sound/soc/sof/imx/imx9.c b/sound/soc/sof/imx/imx9.c
> index 853155d5990a..e56e8a1c8022 100644
> --- a/sound/soc/sof/imx/imx9.c
> +++ b/sound/soc/sof/imx/imx9.c
> @@ -3,19 +3,11 @@
>    * Copyright 2025 NXP
>    */
>   
> -#include <linux/arm-smccc.h>
> +#include <linux/firmware/imx/sm.h>
>   
>   #include "imx-common.h"
>   
> -#define IMX_SIP_SRC 0xC2000005
> -#define IMX_SIP_SRC_M_RESET_ADDR_SET 0x03
> -
> -#define IMX95_CPU_VEC_FLAGS_BOOT BIT(29)
> -
> -#define IMX_SIP_LMM 0xC200000F
> -#define IMX_SIP_LMM_BOOT 0x0
> -#define IMX_SIP_LMM_SHUTDOWN 0x1
> -
> +#define IMX95_M7_CPU_ID 0x1
>   #define IMX95_M7_LM_ID 0x1
>   
>   static struct snd_soc_dai_driver imx95_dai[] = {
> @@ -38,7 +30,6 @@ static int imx95_ops_init(struct snd_sof_dev *sdev)
>   
>   static int imx95_chip_probe(struct snd_sof_dev *sdev)
>   {
> -	struct arm_smccc_res smc_res;
>   	struct platform_device *pdev;
>   	struct resource *res;
>   
> @@ -49,31 +40,20 @@ static int imx95_chip_probe(struct snd_sof_dev *sdev)
>   		return dev_err_probe(sdev->dev, -ENODEV,
>   				     "failed to fetch SRAM region\n");
>   
> -	/* set core boot reset address */
> -	arm_smccc_smc(IMX_SIP_SRC, IMX_SIP_SRC_M_RESET_ADDR_SET, res->start,
> -		      IMX95_CPU_VEC_FLAGS_BOOT, 0, 0, 0, 0, &smc_res);
> -
> -	return smc_res.a0;
> +	return scmi_imx_lmm_reset_vector_set(IMX95_M7_LM_ID, IMX95_M7_CPU_ID,
> +					     0, res->start);
>   }
>   
>   static int imx95_core_kick(struct snd_sof_dev *sdev)
>   {
> -	struct arm_smccc_res smc_res;
> -
> -	arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_BOOT,
> -		      IMX95_M7_LM_ID, 0, 0, 0, 0, 0, &smc_res);
> -
> -	return smc_res.a0;
> +	return scmi_imx_lmm_operation(IMX95_M7_LM_ID, SCMI_IMX_LMM_BOOT, 0);
>   }
>   
>   static int imx95_core_shutdown(struct snd_sof_dev *sdev)
>   {
> -	struct arm_smccc_res smc_res;
> -
> -	arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_SHUTDOWN,
> -		      IMX95_M7_LM_ID, 0, 0, 0, 0, 0, &smc_res);
> -
> -	return smc_res.a0;
> +	return scmi_imx_lmm_operation(IMX95_M7_LM_ID,
> +				      SCMI_IMX_LMM_SHUTDOWN,
> +				      SCMI_IMX_LMM_OP_FORCEFUL);
>   }
>   
>   static const struct imx_chip_ops imx95_chip_ops = {


