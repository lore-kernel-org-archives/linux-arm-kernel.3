Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CF3D10366
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 22:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2sNPsw12tSB2qB+l+MjP+83NVksC90a0cmpmE3AuQI=; b=JhbQNZBCkp+IBIgbeUFma0Lndb
	eUDwl/M288p93gAP500c/jL1c8lOl9lT7VJTgm+tFIhiOgUDFnOCZdanNshQciQI2R4zd+orbjjvL
	hK0VlWeTHNVI5/7EFRtRW/xlE13KdqTFC44noLCJ/CYSoO9ssU/5DZYrrkYxn0y9mAay4zvKV+kYN
	SIbL2tQTs/vat+agRWh96MIyxBbIuNIudkSSdqaIOYRlgwSHfnTfX5B7TI5TwrpRHEJyuCHy8c/gt
	RV9VhzK/o9CWHD2ZcnxSJtvjAmzyXB8zko3kKqCdDaggheJN2y3BUUTwT/Ei2Z9A6qjnD/br6cib5
	aLhVCSFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO1ut-0000000E1lN-2Veq;
	Tue, 25 Nov 2025 22:53:47 +0000
Received: from mail-swedencentralazon11023125.outbound.protection.outlook.com ([52.101.83.125] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO1uq-0000000E1kt-1vrn;
	Tue, 25 Nov 2025 22:53:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYrE/j0ssJcJKUsCGw5JRd0c+Am2A/c4ZproRttfblP8pnvUDJ+dVl17fGFThVMPcahWvHNaf9kbRt3AzQcIBiCPFKEoPgbfTV6rDAotDiMVEjwOPe09VLhIPAZFMVAtu6grLGbQyyv2jtwFZEY0NNeOoROU9QhaBIzG412qHCcWKsfe7XXdYaTu5AsXpz4WUCEepSPmmFAr5EVJidZGAsynsOtTfdwepY3pHqM9WBwP/OpvePzus86Rz5zV1m4EkeohOlFXopLHj3kecF7kSNXh4qfywDCOoyIOEPxCmhBbzECS1dIGO0OLaRXrem26TCRu6PVljus8luiPg9x9fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2sNPsw12tSB2qB+l+MjP+83NVksC90a0cmpmE3AuQI=;
 b=dLIXTJG7WPpn1u3kqOwLmraHkjKsAU6Sb/g2cY5LHaFCPdcgU9yRQu/JUfTrRC/edJllFn3eaqt6mBTEKz/5y+3cMMZg6oKI2107TRZoNEuXkSHYiFgsh2XULEwrSKLxoYsb7OBmd2mc0IzR/KEbS6yWouAhaqaooSZbb4DEL5YaDxS96E4o0cy6bJKuu4MggQyDN3yM3LtgIT8tvrxz5nvMfBUcKh/p48LUp2ShgitEGG4nKv3NKQO3INotz2EEoQw9yZaox1kGokxSRXKYIkntwYJFw6gFoWqtoarM4+dQPYOWd3AM3VcwW8sXzo8srnEk+V8579GyR0bY3fz1hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2sNPsw12tSB2qB+l+MjP+83NVksC90a0cmpmE3AuQI=;
 b=wTlUU+uuSuCzkNKrOnXi0hiZn2qIOn3xi5ZFOZqayBzXLV2R4QOqLzZP+o+wYsiMcuuSZP/BFIV8aoZBzDdBB6p41mI0oNkInaUmAQnj32czO2UQkouRX9xAM2QLvoXXnVf2f21D7RzzXp4WI7DlG3jboLqL+JFiT2Y5XVTHfstxUovUI315fNOR8w+fwLmlDKlUpQORRhxzuGVXdEkaXt1PrTiudDAnUGkmKStBbY/U1aemIOHXltSWkQYiOCr3jl0s6nePDZIDqhmMmpo/4f1He18wKvbfzwowBpTyCaM2sg3XTE1Lz3Z13qi/L4RGsksCX3csdwmgJCDr3RDeAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PR3PR08MB5865.eurprd08.prod.outlook.com (2603:10a6:102:92::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 22:53:38 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 22:53:38 +0000
Message-ID: <5634e1ef-f843-4a30-9d78-7058ed2fe869@iopsys.eu>
Date: Wed, 26 Nov 2025 01:53:36 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] spi: airoha-snfi: en7523: workaround flash
 damaging if UART_TXD was short to GND
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Andreas Gnau <andreas.gnau@iopsys.eu>
References: <20251125191635.1075027-1-mikhail.kshevetskiy@iopsys.eu>
 <20251125191635.1075027-2-mikhail.kshevetskiy@iopsys.eu>
 <aSYQgZR1YoVQkbxC@smile.fi.intel.com>
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Content-Language: en-US, ru-RU
In-Reply-To: <aSYQgZR1YoVQkbxC@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVZP280CA0070.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:270::8) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PR3PR08MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d56fd00-84f6-4338-30f9-08de2c7578c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REZsNjZ4VWxZNWJDeSt5eGNzOGxmNU8vZnlxc3JwTjc3WjlUVUNjSzhrTWhk?=
 =?utf-8?B?Nk5nQVJxNjFxcHFIWlhMZ3ovVnB3NTVuYzNmaW1XbFQvQy9LSjhzaFVnTFZQ?=
 =?utf-8?B?MGE2WTgvUUM2bUlTbjFkYWx6S0NyZXJsWWJMRnBocjFpUE00QWVLb3NJS3FZ?=
 =?utf-8?B?K0J0ZzM4TjVWSlFrR0NzNG4wem9hOHg4NDZHTlB4SE5yZWRBQlo5b1lkdGJ6?=
 =?utf-8?B?SGJkWVl6SS9BUjFRaDY0Znc2NkxONVErbTFranQzaTNrVGtDeDcvcnFtUVJD?=
 =?utf-8?B?aThjZDFjL09xaFJOK3ZXYjM5S0YreUNKSkszb2RmQ0dBbzNwS3ZjZURKLzNG?=
 =?utf-8?B?ZHNHcjFOUlRqODdWam5LeklxVThJT3FmT1h4cklFWnpncUNETHF2Qk96Tlk0?=
 =?utf-8?B?RzlQbXdSMXBtZzN5UmpSb05hd0tSQzdkTDdlMktKV042UzJuYVV2RUdXbFVC?=
 =?utf-8?B?ZENGV0VlMFhLSXY1ZG11VEpQWEY2cThuZWlyNzZ0MklLWlFRMExtRWV3bEVL?=
 =?utf-8?B?QXFtMG83MzI4cVlxVU9id3BSTjNNcnZtVFhrMkxoSkhKMTdJOHFwb0V2TmxY?=
 =?utf-8?B?ZGFuUTN1SUd4aXIwQk1MSlY2NTUrQTIybkZyZ1ZVSDhmUTlGRzNQQlpDR0Nz?=
 =?utf-8?B?UkxreTRESXgvd0xoVnVqM1hodjJEVnZUV0ZOaXljcGRWdEY4NmtpYzZDR1VN?=
 =?utf-8?B?WE9SNmhocGp1NEtjUnpDUmoxNVk4QUlsYWNNV3NQM2pTOUtRZ1FQeWpuMjNh?=
 =?utf-8?B?WWVrSWsyblBXekJ5bjFuZmN4cVY4OTRHUkdmMUc4elgxQVQwaGZzTE1PQzdF?=
 =?utf-8?B?dURiY1J0eWVCU3JuRmFscTVEQkU4Y0hyZTJtb2ZaTHhaT0x0N2ovS0ZQdnVs?=
 =?utf-8?B?ZVBHbEhsMDNIMlJha3JFak5YTVBFTmNWbU5UZXczR3lJS0sxaU0xWWhzYzRM?=
 =?utf-8?B?cWY3K1kyaGJrSkluMkdsQlRlZG56Yk5ob1V4dHlJN200ZlpWb0hMeHN3azhZ?=
 =?utf-8?B?aS9PM1BlYmVOaVh3U1NRay92bHFKRkZSdjlQR0ZsNGR4WVg0cUxVbTRtQjRE?=
 =?utf-8?B?bXRmUXg0RFhJVDQwdjBOR1VTYVRRYkZTV0Y4NUdtb2dWQzhOS0FpeWgyQWZs?=
 =?utf-8?B?bzhvSWhScDVUeUNIeTZoZWVzR0RtVERhWXowejRYS05VZEd5UTQ3YWJ5OXlC?=
 =?utf-8?B?T29ERVBCRjhhcHlsOEZDSmltczF0YVhNZWxvUExmVTRYcFQ4WW9CU2tjZlNG?=
 =?utf-8?B?ZkU2Q1htQWJ3SkdDRmRxMzZoZTNLdUdWaU1hTlYwNHJRR0JvRFlhWDNPYTV5?=
 =?utf-8?B?NXpuNEpzZGc4SHhJNTdGckw3NE0zcURUV3pWWkhTYXZKaFY5dFg1N2UyQmtK?=
 =?utf-8?B?K1dRY3I3UUVoSlo4RHZNZG0rOXo1Q1lJMmEwckNmMm8wakxvdkh5SXhGK1hC?=
 =?utf-8?B?L05UNGJjVnNYeTVZY2I2NmxDczhpeEdjVk80RXJ4aU1UOUFWeTZrVk9kZHdm?=
 =?utf-8?B?WHdhaW11TGhiREpVbkt1L2NSOVlNcXkwMGZvWC9QMlNIdFdFWXpEVmh0Ympo?=
 =?utf-8?B?VTFudXV1bnRocG4zU1VJa0MrQnBpd1NEblRnVDI0QnlxbmcwMUZSSytIMGIz?=
 =?utf-8?B?NmJGSm1Mb2d5Wm95MjhGTHhtZG5ndTl6azMyZkZrYzErQUF2d0h1bVVsTmxH?=
 =?utf-8?B?c3hRVFRKQWFldS9tZWQwaUp5bW55WE1hZWE5aE1qVmtkam9ic2tubzBlTzRQ?=
 =?utf-8?B?SGwvNENxMXBJVUZWYkcxenNFY1ZpSUwxekpaaktWdS9sNHA4amcyQlpSSStn?=
 =?utf-8?B?UGNkclpaWksvV21SeHlibmJoMGRFWllVUVA5VFdwamMrN0tkeTBKSTlFaVZN?=
 =?utf-8?B?a0ZFbGd2aXM2KzNwdDIxZzIzV010QkxtVUZ6WWtxVkRQZGhDMzRCSlptd2VI?=
 =?utf-8?Q?gGtQRXOjjD6jvS8gI07wToolr/8t5lLo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzJyU091MXA2emtsRVQ5clFFVUJEZW4zOGpHK2VhVEFGTUFjeFY3RTI3M0JK?=
 =?utf-8?B?dkpyc1NrVzV1Mmw2UFlUZWRwWW9vT1hhNnRhS0I4NEVKZDdlZFV1a3ZVTENV?=
 =?utf-8?B?VWZwY2FuUUY3UnpPalBBZmRPdFZQMVR1VThYR1ZwaitUdnJHcFJDam44YXRC?=
 =?utf-8?B?K2pxYW5JaWJTazNnRllSRERjNG56L3hnMmI2OTFKTm5NSDdzd3lyOEpyUWY3?=
 =?utf-8?B?YTU0eUxjd2ZJbml6VG5ldHlqMG9saHRib0tiV2d4T2M5L0RRMW9xVU56Z2t4?=
 =?utf-8?B?L0ZzeWFmMWhmTXRqdXFXaWVFQWN4dFdPOXM3S1Y1L1lDb3JxR3dZU25zNzFr?=
 =?utf-8?B?TDRpS0ZLZlVaYllyazNNWDdwU1E3bHdCc1NDS1cwTVdvQlZyTGt6WmtkT0hX?=
 =?utf-8?B?WkdtenlJOUFwVENOSmIycTBWZG5vd2FhVXk5OVJReWVFdkdmK3ZoT0JFbnY0?=
 =?utf-8?B?SC90cGd5V1AzdS9DZ1ZmSzMwY0RmdFFYRFVybFlDdlUwSllGb01wOHNub2dW?=
 =?utf-8?B?K3FZdE9JeGxTdWQyWHpVR3JCeUFZWGxiOGpWcmxCTkhya1h1OG9nenhaKzlT?=
 =?utf-8?B?SE1oM0V1N3RjbnRid0NRQVNwUjV2UEpuMmhIc2k4djNkSE1KMitWd1ZQYmZT?=
 =?utf-8?B?QUR4Qm5BaTJuUGNJZlJibm9BM24xZW5Qc29veHZSSGNOMkM1cEhmQnZTTnJ1?=
 =?utf-8?B?MkdMZVlING5pVlNEVjZwTktEb3ZocXNxZGhJL0tmZDFoTkVqamdnVGxYeDVV?=
 =?utf-8?B?bEU0UzNyQ1VHMzhvTU1JUzBNTDZjdjdDMGpjNUFvYU8wNkM1a1lURkpEM1c1?=
 =?utf-8?B?MFZHSlZDdmpvd2l3Z3U1WnhJNUU5bWx6dzJRQmZXdjk1N05jUE5WTmJJMU5m?=
 =?utf-8?B?THA0eHFjN200MW5wdU5US2Z6NU1WcDJrTzU1bUo0dDFNc2ErMldFUXh2a0Zk?=
 =?utf-8?B?QmpsWXl6YUJnZkhsZTQzRUpHQlNNZVllNkdWSExTYitwVkUxc2V4ZmJMN2xX?=
 =?utf-8?B?VWpQMEFRQTY0aDdOMnJBaCtiRDFOdlRweTIrSU84aVhKYkp6SWo2N0s1ZUFm?=
 =?utf-8?B?Ulc1VGNuWVRRT1RvVU1rTUNKSW1hUlpMV1VGS0RweUErRWR3L29XVTA5WDNs?=
 =?utf-8?B?V2laTkdlZEQyNmN3Q0E5RUxxbU9keU0vMUI5RVZwNnAySkdZNGpwbWYzRkdy?=
 =?utf-8?B?dGFNRk9OU29HdU1PbDVzUUVSL05xVlFjUU45K0FSbVBxc2lOTzZPZHNEQVBk?=
 =?utf-8?B?d1h5Y3dJTWJxVHNVcGRjUjh3Vk9OdEt2d1dIazFVWWxvOThDenVpMjdkZTMy?=
 =?utf-8?B?VysxeW1uQUtXU25WZTNsOVd3UXppS3dEV3BQR3FqQ3JmalExMzhoYTBHYS9W?=
 =?utf-8?B?ZytnWUJYa2MwWVc3bUw4M1BHSm5HNUlyZXJPOGxCM0RmUFVKbnJLQjliR1BO?=
 =?utf-8?B?WkxNRXdBaDhzTm8zTjNMWUJZbnFFM2VnVS9MSndiYVJ0UTJaa1kyenhoVFY4?=
 =?utf-8?B?TUd3STczalVMMWZSbGR3bkh1M09XWXlQYlllSmxqTktoUUJiOEZWeVBCQ0xw?=
 =?utf-8?B?N0hqalBuVHc5MlhKdVMzVnZiVXdjMEhDd0JRN0pWNE1hOU8zaGtHWEMyc0J5?=
 =?utf-8?B?QzkyT0xpTjNsekJWSTI5Q0VqY0p5VXB2VHJ0RWFMMHU1WWtOc0JUQ0ZJMFlx?=
 =?utf-8?B?dXBrbFh0Nkl0ZTBPdU1zREgvRDI0U3dRR1VoY2RSWGwxWnV1MUJONXl5Ykkx?=
 =?utf-8?B?VDQxRWpzRGk4aitiTTZSQU9MK0RCZUdpeW8yOFZDUm1iTE43QnVmd1BFWi9a?=
 =?utf-8?B?WGVZK0lDOEUyNkV5bHlBMlZwODZFYUVqZ2NKR2kwaGtOQk9UdUNTYjhwNVhH?=
 =?utf-8?B?Qmc5dlk0VXVxbGFFelVnNmxFclEwd3o5YmJxVzFnYjZPT2JKL210c3A4NVcr?=
 =?utf-8?B?K1hYbXV3VHRMbFBwcVN3NkNzbXpwbmxBbm5DUDlLdHFiay9zSkU4RWVONzEv?=
 =?utf-8?B?MlFzN1J1NU13TVNwQmxtMmdsZ04wQjJjNUUwaEhRZW14Wmx0Um00Nngwd3dV?=
 =?utf-8?B?ZFNlRlNJcldOdzUvcG1SeUNkL241SXRMeHp1M3FUY1BYUkREQkZPT2lxSGx5?=
 =?utf-8?B?ZExXYjhQeFM0YmFsMTRTa2t3cFVyeENiR0VFSldob0ViRGh4ZGpWenUzOTFw?=
 =?utf-8?Q?GUxo2UElFJEOB5ZGLjbrd3c=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d56fd00-84f6-4338-30f9-08de2c7578c7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 22:53:38.4504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KtwggIqFTLM7nLwQL1KGeGLvnuIRXIC7VmpxNmkEt4E0oNom6gXzz+9tpFCPW8tzCE1pl2qplZd6ODFPhBwfyeagxnyZ+kEVqj1XuCEKHsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5865
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_145345_015054_2A4D4471 
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


On 11/25/25 23:24, Andy Shevchenko wrote:
> On Tue, Nov 25, 2025 at 10:16:33PM +0300, Mikhail Kshevetskiy wrote:
>
> ...
>
>> +			dev_warn(dev, "Detected booting in RESERVED mode (UART_TXD was short to GND).\n");
>> +			dev_warn(dev, "This mode is known for incorrect DMA reading of some flashes.\n");
>> +			dev_warn(dev, "Usage of DMA for flash operations will be disabled to prevent data\n");
>> +			dev_warn(dev, "damage. Unplug your serial console and power cycle the board\n");
>> +			dev_warn(dev, "to boot with full performance.\n");
> One non-critical remark (for the future), the '\n' in the string literals when
> we print messages has two meanings:
>  - (obviously) new line
>  - (seems not so obvious for people) flush the line to the output device
>
> Due to the second property the messages might be interleaved with the other
> messages (assuming SMP machine actively doing and printing something), hence
> your messages might be split with other and imagine the user who gets in the
> middle of the text something like
>
> "Usage of DMA for flash operations will be disabled to prevent data"
>
> The first thought will be "what the heck does this mean?"
>
> TL;DR: place '\n' with a care in the messages to print not only here,
> but in general.

Thanks for the point. I know this '\n' issue, but you give me an idea
about making it better.

>

