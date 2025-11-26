Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE468D0EE29
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 06:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BV7i+djCh4JGtQO+lyPGnmvKSfTZ9gyZy29yBz5rOKI=; b=GjwqJXreELTRWAgWQQwTn9rNsA
	hA+1kL1NChajSbnTJoIlLLjft2LIDS08N9ptC6bA1EGch62jiwyQOZWT2vac31PO8Xz5TNjnf+6TW
	Ac9O9Wd/MzCOVX0aQ8M8PzOf3SRpvZImJYgowEU5k7BfRJrhMACQVf5X8wsx9lTgEMcSBQpMKU3pb
	ALgqY+kVGFuYDPJM7UohECIy2AvgejY0C97wM1vhA3QOXt/1ofOtCFGWf1CGTj/wSGnYsx5jSlFQp
	d3aHQKxyAp/XEBl9tJ3FStljp70bSzKaFaBgCsXzhHAmd1ACoIfBextPLbqfFvrvmXRQ/k3xtGFPq
	NvNqXjCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO8iF-0000000EQNX-2aYA;
	Wed, 26 Nov 2025 06:09:11 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO8iC-0000000EQMb-2Vbe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 06:09:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8DGgLpXUtOaRy37F/El1j/nwMRs5ydBS9ZVTariHIJ3lUFToVnGA8aLYnWNWb6vFGvwLYO67egZ8zcKCG7qZLgWtvI6Mvta2qaYRtbYrYjpKeT00jMoAsJJ3II8oH+/opiCP8scJML+K6gJ7Gek7ouLsiyF9RnkdgehV0KtjMADclHw8MNXrA5xm/BL1iNHnDUEeRHjrOChd6C/emMWV8q5DkPZEvGYRYQWn9RxDTJyrO1hT55hFWpDWfbulixDczXB9186C3pUOYAKRWjpJrc9/HEJsl8ze9QyXlSQl3iaBDQKiV5zpb0vQKK9EGPWjKow4sWErnlyOgaru9fy+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BV7i+djCh4JGtQO+lyPGnmvKSfTZ9gyZy29yBz5rOKI=;
 b=LC+YoW5uDNU+Er/hza+Avtl0soOt52BntwB72aH8dCUOH8odjfcfIBzmfrxhZbH4qG81ZiZRRqTQBECJXwcezZEvHhfdEmtPE3uD4Y70nejVLoDBm6gT/qAzKh8MWwpvWhna87EatSzszf2LcNwXh/M4ekf9Jro/+Ng8LxaNxLNAb5ciyyMD1Uo4gOhwS1Clpg08DFuPZB0LPBght5ugE2mVHGfQraXd/uTFMGmvfGcUn2F6dLPd/CgbM0/zZddFeBmNPW1eageOOAN8x1o4qeuzm8eaOe4+yvXL1OqZ2+RE4bDUUyhcqnMD20DzPplJMCDXx/NKth2LHGHxsE/1fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BV7i+djCh4JGtQO+lyPGnmvKSfTZ9gyZy29yBz5rOKI=;
 b=b7QAn1DQ1UInmJznPCOrOc31o+ARxhy9vpUc8xJI62G7CZm/uq2wYjEJlIIz3uY/ggayy0vIrUzwHlnVao4kZl3inlYNt/ttTx0xgXLRSZ456M987f/tUz6sK4hl2tTT+yTN521f2sytLGtTJt0zs0Uh4pQJK7yIdMk/+vK+LdTAJSNe+NHSWapcJ39YA/BeBPqUQ1YWZZGLPVW57Sn9N7EyrzEHRQ5JOY/7rkrWnbCxNxMfycouhnuNbpIGy1WhWbtyljCliTlcdYtRgH+YvUB2r69VPD/Gax0qHb7uRwYgVVzeyKgXsVwRz3BbEAIJX06AqP/XDDYb26ZeGi5Q1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM6PR03MB5371.namprd03.prod.outlook.com (2603:10b6:5:24c::21)
 by IA3PR03MB8384.namprd03.prod.outlook.com (2603:10b6:208:543::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 06:09:03 +0000
Received: from DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076]) by DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076%4]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 06:09:03 +0000
Message-ID: <371c8505-25fc-425e-bd44-38e2f3a09b8b@altera.com>
Date: Wed, 26 Nov 2025 11:38:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: dwmac: Disable flushing frames on
 Rx Buffer Unavailable
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Matthew Gerlach <matthew.gerlach@altera.com>
References: <20251126-a10_ext_fix-v1-1-d163507f646f@altera.com>
 <aSY_xIYWfv9YAv6Q@shell.armlinux.org.uk>
Content-Language: en-US
From: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
In-Reply-To: <aSY_xIYWfv9YAv6Q@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0190.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::14) To DM6PR03MB5371.namprd03.prod.outlook.com
 (2603:10b6:5:24c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5371:EE_|IA3PR03MB8384:EE_
X-MS-Office365-Filtering-Correlation-Id: fac0edb2-657f-4a0d-cf33-08de2cb24c8b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2d0ZTFsMUh1S3gva0ZGRktkT1dzbUZGNDJVQ2UvVk9kNlQyM1JVbzhPYVBr?=
 =?utf-8?B?NlltWXJqYWY4UEJlS2FzRmtiQlpKSzBpUGpTVDZNKzZEM3ZpTUtSQStUR3k5?=
 =?utf-8?B?OEJORXoramNPc29vbHUwUFlVWnZPRGtTUlBoazJuVVJnMTVXV3NqdEllaGtI?=
 =?utf-8?B?VGtaT2hQaUVWZlVQWDcwR1gzakR6elJtUmtoWUdHcFRVeHlMUS9FbVh0blQw?=
 =?utf-8?B?MW9vZUt1ODB3bEdleXQxSmR4VUtiOUJaNjNKclZSZkNJN2pmOHVHN0wwSWFC?=
 =?utf-8?B?RDNmb2tGSmJvY1FqbEFTeURhRFJNM083RHpFbDE5TXdkaGlUUXBtR29LSTUy?=
 =?utf-8?B?WWN5cmZxc29BUVV4eS82M3NoUVBKdTkvenB5Um9yaEplNXpiRE5SUVlPRzJp?=
 =?utf-8?B?WFRnYitqY3VRbFFaQUVIQmg0RHMxcDVYbnprRys1UlZLTDlCRVhPUFdwZGJu?=
 =?utf-8?B?b2ppOVpFRU9UQU4yUFUzNFZFQVp0ZUpkMjhhRHdKREtCSEE1eVVTN1dYNHVF?=
 =?utf-8?B?VkdaQ0NqNlM3UHRnWWpZM2puSWR2WmR2L2RNZEpBWHFaUHJNNk1ET3FKQ0Zp?=
 =?utf-8?B?TEd3dzFOaGprenpUdncxOTZ6VzUrZ09tVmVDWHlsUWpwc21aT3M1OVIySnlX?=
 =?utf-8?B?ODNoNFVlcXArT0VUenVnYzE5djcxb3NCb29QVFM2SkVyNTVrRXZoT214VTZh?=
 =?utf-8?B?RzBHajFBT1ZOZTUyeFI5TERqV2JacXo2OXdPYzc1MVkvZ2dsWk1KUEZpQzRM?=
 =?utf-8?B?WW91QXVMcWVmRHN0ZXczandlQjVTK1JpcHcwRlFVUFJHZmdvR20wSDZZU1o5?=
 =?utf-8?B?ZXNRT0FxcHkwQ2UwNkRqbnI0S1RaS2FISDI2SVZEQTU4c2RuRUhBcmY4cE13?=
 =?utf-8?B?aVRKRUI1cyt4S0wyNTlvR2ZFWHp4eExvOG9KZzd4cHRyZXRkQXljaW1hMzE0?=
 =?utf-8?B?bWJPaFR3T3FmRGdYNmxuZm5nbXBuRkJuREh3aGNCd2ltcmhXQmMwMk5VRWRk?=
 =?utf-8?B?YTIvTXg2NTJVbkdHbzNMNi9DZE4wSC9aNFhadXJldC95WUtPRGErbzIzcDB4?=
 =?utf-8?B?K0hzeDlmQ0hKNWxaTmFCWGJMVWlBVEcvTXNqYUlkRHN4TFNIb0NhQXdRWld1?=
 =?utf-8?B?TEF1MDd2Z3VMOXdRYVphYVZTaU5NeXpWdHhTSm5UZ0NjaFBhdTdVN1JNWEhO?=
 =?utf-8?B?WWJjWXpEN09aVFk2N0JrWUc1MDdCWGtGMVFyVDdWNytQaFZqVXZxMXpFbitQ?=
 =?utf-8?B?dHdveHFhZkZDdEQzVHFMRFFVZkhNMnRSL2lZU0pDbndLNGVpdEVnbHk4OSt2?=
 =?utf-8?B?NUx4c3N5ekFzNXB5RDRjYjNSaXcwVUJQRUtrUmZSVDEzYkF1UFhyS1MwbFRN?=
 =?utf-8?B?N1VVYWN3ZDJNWkliYllHYTJTVkg3cDJUNEphRTd4eHZndXJrYkd4dkxsL3hF?=
 =?utf-8?B?b0g0eG53enhLaGd5a0tWQ1ljcm54Z21BOVg3VG1td0ZFcEYrS3Q4TmJQdjQ2?=
 =?utf-8?B?RDdHT3BZSXBoZkhQZEhPSlRiVlN2MHNQeVlxTjBoNkxPQ2JwUmlQaGlkWmw4?=
 =?utf-8?B?NitwekJZZk5qRGRoUjRrMnMwVVB1OUhTcHIxclVYZVlQQ1pKZCtoTHpIczlv?=
 =?utf-8?B?QkZ2dFU4cVlSYTFyS1pMZGc4ZzhtWFcyYjRkYjMxUTEwSU9mVWFub3A2NG5i?=
 =?utf-8?B?Vzl1dTFGUnNlcVRMOWtxSlh3YWFKYmd0Um9VTmhhQk54NTl0dFBiNmRkck9F?=
 =?utf-8?B?WjBiZGhsOC92dC93TlVoZTA5Znk0aE9FelcvK2c0b09QWmNOQlU1KzJYQnZS?=
 =?utf-8?B?bWcxb3VJVmVMMkYvQVhGVG9jVG5zc1NrU3dZSlJxa1IzeTdFcCszWkZHZWJu?=
 =?utf-8?B?M09OZGx1WXZPTWZzRUJ5OS9WRG12TXFGKzlyTHNSd1VIbXAwYnRlaStIWTJN?=
 =?utf-8?Q?RoNCWYxahbgYvXXNOcX3WvwsLrAwBziu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5371.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWhHQTlOVWl2anY3TXRMTzVGd0hDck5Vcy9iMDdLNHFpNXZLVGVsVHZ2Q2Vs?=
 =?utf-8?B?NGhvcktUT2NZWW9nUEN0NEFiamdOaVVuZHJkNzNJZE5YdzZhV09YWGNMa290?=
 =?utf-8?B?SVNSa3lEL1Z3aFRmWWlSN3FVVnp0UWg1c0EzMTlIQXNoeExqSlRCWTNKdUUw?=
 =?utf-8?B?OEtxeFNPa1JsY3hOUjdvc0l1U2NrNGJLa24rOUREKzVaRmN0Tmp6VENzeUVn?=
 =?utf-8?B?cXFrWkR3RW9MUlBqVC9qY2ZGNTFldW5aM01WOEN5aEdkU21oV2xZd2l5YUlR?=
 =?utf-8?B?RnJwK1Fzd2xCakNtTkp2RmRRZVBGMG1LRHRqRE14blpoY1hGa2xIWEYyK2U0?=
 =?utf-8?B?aWYxZW5qdFhuUnRlbU1RRGIvQkNRbnZ0UWFZK0MwbDlqNmtiOWVPTEhIVGcv?=
 =?utf-8?B?aHc2NFlmcjQ3cmNtcXNjajFFWkx0Y1lveStTNFRRM2R5VXFaWlQ4SW9UaDlB?=
 =?utf-8?B?QUlFNS9DY1h4SkVXR3lJNkxEK05kdUJ0NEttZER5cFlLOTZoWXoyb3hJTEFL?=
 =?utf-8?B?c3FSVWFnUzZvRU8zVU1NaENidEpXTVJyaGYzVDNTeE9OM09oU1J4UVpIdy80?=
 =?utf-8?B?TS81Ykx1ZFBwNlhYMXpOMDBkd2ZHZEp0Yjk1NnJEUlNYQ0h1UFg3M0pqdWox?=
 =?utf-8?B?aEhZRFVPK2VRMnVSOFJ6cmZleDArNHFNcHhnUDZYbzBqOEY0bEkwdkxaZXNn?=
 =?utf-8?B?S3dQS0ExNWpTcVVLanlWNVJCcDY2TjlQcnhoWjM5QVAvZm56c2M0QjA5dFVZ?=
 =?utf-8?B?WkdvWDhISC9aVXBES2xkNm5nK0Erb3owak5DQU8yekgrelBBS2ZOV1c4TnNk?=
 =?utf-8?B?dDNvYTh4OUdKWXllSHN0Qkh2WVF6cnZFbnQxN1d3VDdEVFJVY3M4NGRHS0tI?=
 =?utf-8?B?bHoremFtSHlXT1p1RVpKK2JHYnh5clhKVnlLRXVRazZNbFhNa2NWVnZpRkZh?=
 =?utf-8?B?SzNMcTY2WlU3cUVHamRnM0dXMnZXNVdkeUlGeDNYN2hRUGNlWnZYQkl3c2I4?=
 =?utf-8?B?QnE4cWhvNHNwcFRQM3ZvUVE3TjJ0cXB2M3VlbHlXb3BubmpTT1pIdDRzcXVw?=
 =?utf-8?B?bmNXU0psZERpUnFSNDJYd2NDRzMwWForL2RvWUNOb1BDWDFUY1Y0eUIrcUxq?=
 =?utf-8?B?TEc2SEVqQzRZcGt3aXR2QWV0U2ROclY5Z0krSWNNbEdiUC9vT2xDVmhDNFdO?=
 =?utf-8?B?eXU2YjJvVjhQdzNWQ1ZaeHU2UEhXaWo2MUhJd0lNdlRvbFVvYkM4M2NSS1dz?=
 =?utf-8?B?ZW5JOEFoTS90Qmw4MjNuaWN1d1RzVE5BTEtDUG8yMkdkREZmN1RlYjNtbUlK?=
 =?utf-8?B?azFIVjJoRkZsMnRvOC9lTHhaZk1XWHRSR1B1U3FSUFlqS2JaeW1FQ0I0TFVV?=
 =?utf-8?B?Q3JjTnJEMUF4aUVhNlR1SHBVS2R5eU90d2cwQnpDNlUvU1g2R2tFNEJsN1FN?=
 =?utf-8?B?Vm02ai9SOW8za2kxRi9keEJLbW1qeVBIUnpET1FXaEFGbWY5ZmZISVFCRkpu?=
 =?utf-8?B?aW9vZzVoWTAzNDFNS0tkcFowQ2QyOGxmYmRZZVJMNGtHZm5HVStuSHVWc2VW?=
 =?utf-8?B?YWI3ZHJyNTRFaWt2eHF5akNzU1JWajg5d25HQUtPNWRudm1QcEZxaTJ0Q2lw?=
 =?utf-8?B?bWgrclFsNkdxZTBzbDlUTndzOFQvbVpleGhyUTFKck9xQWFQZDJyVm5mN0VZ?=
 =?utf-8?B?dHJNc2ZWaFhabU1WOW5PekVBQ0h4V0VoR0wrbFozZEx4OHpJUXN2a3FpdWI0?=
 =?utf-8?B?Q0JIcGhvaCtKMzE0ZlFNbndSUEplOE9mVXhMblpnUTFuQnB2QVRXbFFnamRl?=
 =?utf-8?B?VFp6bmNVcUh2azJKUkFtTi80MWRRdkVibXZURktJZzZLUkw1Z3NKS1N0MHBY?=
 =?utf-8?B?dXZzZFI5bTZudCs5RHF5cTlLb0F2ZitvTytNSFAzNUQvT2VNMkQwSXlpa3E2?=
 =?utf-8?B?RkQyOGEvMGZxcVo5UlhBMjRqenJuN3o4SGpKQnhMSzM2ZGZaTmphaEhmSUoy?=
 =?utf-8?B?MzVYNDB3NHNML2tuenZZOWNXNWxoNWNiZW1CYXNjeHFOQmZMOVI1cGpmYTF2?=
 =?utf-8?B?TEZFeG5DRVlJdWFqQVJkWUc3aXIxVmdtWE9KUEF4TllPSmxscWp5MVFaWXZL?=
 =?utf-8?B?K3MzaEJrelNleVpBVXpRZStyREUyQVRpYmpMWW9BSGhVWlVsZXJtcGtsUjZB?=
 =?utf-8?B?UGc9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fac0edb2-657f-4a0d-cf33-08de2cb24c8b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5371.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 06:09:03.6426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E0v82g8F3NLYXCh3VIBeIY0MZz8L8cSp/GnxclszdmQipeQYbey2u1zeMOvLAx+v6TUI1jIWWfKAtCVHpVka44gaPUffZhlqZ/IS8BX5w8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8384
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_220908_667681_29E91926 
X-CRM114-Status: GOOD (  17.43  )
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

Hi Russell,

On 11/26/2025 5:16 AM, Russell King (Oracle) wrote:
> On Wed, Nov 26, 2025 at 12:37:12AM +0800, Rohan G Thomas via B4 Relay wrote:
>> From: Rohan G Thomas <rohan.g.thomas@altera.com>
>>
>> In Store and Forward mode, flushing frames when the receive buffer is
>> unavailable, can cause the MTL Rx FIFO to go out of sync. This results
>> in buffering of a few frames in the FIFO without triggering Rx DMA
>> from transferring the data to the system memory until another packet
>> is received. Once the issue happens, for a ping request, the packet is
>> forwarded to the system memory only after we receive another packet
>> and hece we observe a latency equivalent to the ping interval.
>>
>> 64 bytes from 192.168.2.100: seq=1 ttl=64 time=1000.344 ms
>>
>> Also, we can observe constant gmacgrp_debug register value of
>> 0x00000120, which indicates "Reading frame data".
>>
>> The issue is not reproducible after disabling frame flushing when Rx
>> buffer is unavailable. But in that case, the Rx DMA enters a suspend
>> state due to buffer unavailability. To resume operation, software
>> must write to the receive_poll_demand register after adding new
>> descriptors, which reactivates the Rx DMA.
> 
> 
> This seems like a sensible writeup, which all seems to make sense,
> even though the databook I have seems vague on the effect of the
> DFF bit.
> 
>> This issue is observed in the socfpga platforms which has dwmac1000 IP
>> like Arria 10, Cyclone V and Agilex 7. Issue is reproducible after
>> running iperf3 server at the DUT for UDP lower packet sizes.
>>
>> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
>> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> 
> Given the above, that Maxime has also tested it which shows a net
> benefit, and I've looked through this, even though I can't positively
> say it's correct due to the databook vagueness:
> 
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Thanks!
> 

Thanks for reviewing the patch.

Best Regards,
Rohan


