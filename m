Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601DAE7718D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 07:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuWTqFAywmtnUuYv7lQ2NMnpuX1vQ0m6HPH2pCbZv/E=; b=VFfEbotQaNGAlDxLanNBpUXRXC
	3vTwwFOwgrx463fpR4585sSrIQLKOAhTnOhVERoXddQq0O/BDIYDr5NyB/n3ImNOPeKXB+bEKv5r8
	FKRhV3EobC0dp5a9b3A+oKDzKgUvi0FnQ8neSsdcdFZQ8Xdu7DgWJ1tHG/7m6YEgxtvR1tSKNwIe3
	8IpAwnoYC4P93fEul3eUz6BeQdKSqyAVYNXbcL98GDVAN+LneoSMKh251V0HHujy3jxThlSMYQxqx
	aDvRQ9zWYMHoWNc7WdFP+twTUqv8ph6UVRs9wdXECi4apuy4/1WOgdkAQAGe8GoKvb2YrRDk9hVci
	DGwsqhQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQieA-0000000FQEu-1cu8;
	Thu, 26 Dec 2024 07:51:06 +0000
Received: from mail-tyzapc01on2072f.outbound.protection.outlook.com ([2a01:111:f403:2011::72f] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQicx-0000000FQ4W-19DG;
	Thu, 26 Dec 2024 07:49:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qwv8iqJ8K4UE1dFE09pfoUMVu42hO5ySSIRtM0eff5fmWLVzHGAOfAV2oIxd/dSVxdQOcNFU1p4VrUgDfLG+GHIjYlQgoa1LzmGv1BMe+Z9TOK/bG/1M4xrgKkFm14s2tTAL7SUwOmpwZ4iUj+tXWUx8Frn7BQ/1lQD7NdUQulQtEo/uNkxfZipt7vWcPS5I8VpfR8NbyHC6iRdGOsuZXjl77xJkwTJvY0EMBUw0vU6IzWfIlM8hSVY5LBSMlHy9X/KDvB3diJ+YiK8fSjHNalBwkW0JV1XMyV/6f08lldL6FrU73G39FAr9UME2feAtqh0OTEbwcmi5rUsd/QmhGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZuWTqFAywmtnUuYv7lQ2NMnpuX1vQ0m6HPH2pCbZv/E=;
 b=faJIQRNa61it1ew+QoR8sTkwDazHOJLkfooVQwQq/u/7LfVvemcehLKGC2HOHR1LWp0Mo4qHgDb6/Yhc7W79y1/LlM4+RIY+jTFEW9XlXsKuJJ5JWN0lEB2XyUC2RTtk7PAIXiwZeOBzazo072Wt0R1zl+79QodWv+O/2pCmYuQ5sauz63XplRPSaJxM71+mNqcMPUpMbuGz4B+NlkXQ3JWlw3JDB851MkU4CI9C1AX3f3K6YHa60jN3rqhIFtub0JS2x0kHzmcvDRYlzz7TGXjns7CvabGhdWXCgL5BGEMcgIspRCOh/g8uY4278h80apSq9lUejIOdHLgd82mzjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuWTqFAywmtnUuYv7lQ2NMnpuX1vQ0m6HPH2pCbZv/E=;
 b=pHYVO+e3ltjAfHodjtfCxsRfQLcW3sC3v873pt7wX7k/VuPlk2+0cZr9Is9W6M6G4LoUdl3hKALEuZC7MN5UGwMHlLjSAEwEgWQKVP73MczYiiVTQtQQmG4+LWYZao5FAd7AF96Uu2/n63Hj7lXtZK93cjv6XsjD8+u9l9MTLvOwM/TLSW8JKvFIR0zVg8aTBe5cfXaaLzfpMVGihEkAH9lUKd6wYXTx1iREpJQlEhJ1SR6EW7/HnB0C1CC6EEc3XcRIXOjrS2uQ/jGsRQYfVdYGha/wd2VN4nByGIohAnG7jhdCBABa7X8xECJjOFQWP0IARBzmBviXxNWAs2mEpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEZPR03MB7403.apcprd03.prod.outlook.com (2603:1096:101:12d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Thu, 26 Dec
 2024 07:49:32 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%7]) with mapi id 15.20.8293.000; Thu, 26 Dec 2024
 07:49:31 +0000
Message-ID: <cd67acd0-2595-496d-a725-6c3e509492aa@amlogic.com>
Date: Thu, 26 Dec 2024 15:49:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/3] pinctrl: Add driver support for Amlogic SoCs
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
 <20241211-amlogic-pinctrl-v1-2-410727335119@amlogic.com>
 <CACRpkdbuj-_sPpdfcyg3_QNtzt9r7n-0HBGBKgy-rKUMhvGo4w@mail.gmail.com>
 <23899c54-14ad-4724-9336-2df6fb485fd6@amlogic.com>
 <CACRpkdZn75ks4Gc7rm8jzkKM6y0JeQmUF3qmbJA+O+cEA9r--Q@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CACRpkdZn75ks4Gc7rm8jzkKM6y0JeQmUF3qmbJA+O+cEA9r--Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0166.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::17) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEZPR03MB7403:EE_
X-MS-Office365-Filtering-Correlation-Id: 10c2afc9-b507-41db-0370-08dd2581d554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVFnSzlmS0EvY0tjSU96K1FZZSsrV0QyZkl3SzJ6SVF3Z1RBbmxORUx1bTYx?=
 =?utf-8?B?allud2o1ZTFrYUpKKzJHRkpKODV3ZW1KNVZmMis5ZlZrMENuUXB5OHF0WCtZ?=
 =?utf-8?B?Kyt1bnVxSFNycWN4WldmK1FxenhtVDFjdU5JSUVrWmFDN3B6WlBSc1AwY0RS?=
 =?utf-8?B?UHpUUFBwSTBNbGg1MXNFekpkYlBIa2pwYTA2TlI5dVAvbnNMK2k1Z1dNaU5C?=
 =?utf-8?B?L0dOWmVLV0Y4ZzZybXhXS3VwbFh4Z2VLZTRjVkNyc1p5OHNsMXVRN3VGOUxF?=
 =?utf-8?B?WTROMUFwV2l4bkNtcGZHS051MDY4TE5UcjNvU20yZ1NwV1l3VUlMdnhWZWhS?=
 =?utf-8?B?QmJEWkpybmV1cUxINVlWdS9GczFPMEJDQ3l0Q2tmSk1YUWk4bEVvV2x2bU9U?=
 =?utf-8?B?SmVPZFhNNUlqQnRMcVBFUmJaOHErM1oybSs4RUFoc0l1OHZYMlp0YWRmc3NB?=
 =?utf-8?B?UzJOeUpnUUhFSEl6amtGVGJRK3VFanM5d1p4ZXBsdE5RUE9TUzVrcHJvZzRp?=
 =?utf-8?B?RGFhajJrWXZJeU50QWtlSG5EZlpkalNISXkwWnBZVW5kYnZNYjdiQ2IxOXMz?=
 =?utf-8?B?dFZwZWxGd1lDS3BHS3pvMUZPWGNXRTcwMHV5Zmw2N1BERU9teFl5bU5DTDZR?=
 =?utf-8?B?RWlPY2VlVkZPdk1KL2dEc2NJenA4cmdMWTJHQkc0b05adjdoc3VNUFN5Yk9G?=
 =?utf-8?B?SW1tUW9yMExjQTBJVFlpTmtna29wQWpXOGY1TElOZ2Y3YjBGaEc1YmtxZEpO?=
 =?utf-8?B?Wlo5dEhCdXRuZmVVVGk0WHhxQ0NUdU1mZzJhYk9xQ0hMRFVad0pwTlVYNGkw?=
 =?utf-8?B?MUJyYXdnRjNlSmhvakxqL0U3Yk51Q1BWa1hEVnhlVE8xN3JDS3kyVnZ5enk3?=
 =?utf-8?B?d1N0TmVDMkpCV1pKMEE1RERWSlNhVFdtU1lFREI1QmlSODh6ZldZeEkvYVNI?=
 =?utf-8?B?OUVUTUlySnZVanc5ZDBDUjFZaDY5Zkd6NUJITDdaMytjTXYwc1FMb0dXSVQ4?=
 =?utf-8?B?MVBnTTBrMFhBTUlEc2hZYWtYR29wK05FdUNSTktHcnlVWkxiT29hR3dIYVFl?=
 =?utf-8?B?YTMwM1JzMzYwRks5QmlCTjJhQ2lMaWVTanh3cGtNa1o5WkJLNnZjQktKYTJE?=
 =?utf-8?B?eDdzYVo3aGtUL2p1Z0FoMVkzb2h2QitML2FXVUNwb282VTYyWnV2enJ5K3BL?=
 =?utf-8?B?cXVtUzdhSjlRTDFhcG1ndHljQzZReisvaXA2cjZhQi9FVW82MWFEc1ZJWjU1?=
 =?utf-8?B?SWpUNUVpaG9oMTdHZGpjMXFVUHlzTmF3a0hrdkR2WGFEZ3JZQ0J6U3BndHJT?=
 =?utf-8?B?SFZTVzFPMzFtTklWNythK0pFa251T1VKQm5QcmRqYTZZajRoL2hPS0h1SFdE?=
 =?utf-8?B?QmJ5ZU1GOHpVMzNLMUpoQnlLRTZZVUlWMTljQU56RkhMb1hlN2pDUmMwK3Jo?=
 =?utf-8?B?TDN3bTd3K3poMUtVbjlZRzBEWlRQMzRQdU41NHVrcFZ6QXlXSWdvaERnZC9J?=
 =?utf-8?B?VU15SGdqNDU4OU12SExKekVqNmVESU90Z3pGQ3lnVnFPUTFlY3c1a2N1dVhk?=
 =?utf-8?B?Q3lNZ3d2THlKMmwzeURDR0RmVGZaT3IxL1NySTFhMWdnUGl5VXVVLzZtOG5y?=
 =?utf-8?B?RzNuUWI3aVhVL2dyQWV6ajBoaTNicEliS3UwckdPUFdTK0laUGZnK3M1cVlT?=
 =?utf-8?B?aGFaVUllcjFTWU8zNUxLbVRZYll5K3VoWkF2V20xWTNoOXdPNXhuUm02QzNw?=
 =?utf-8?B?MFpZdTZPdGIvVm1ZWHNFb0FBaU51alZoMFI3dE0raytIaVJ6MHlvTXIvTk9K?=
 =?utf-8?B?aWZGWWpHMW9aZktOSEQ0TkJqRUQ4ZUJNNk4va3ptZ2Y2NjZpUEZ5bzVpVXVW?=
 =?utf-8?Q?OT7wgHD4mtR8W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmtYSnpXZzRsa29uVmVZdXZuZ2NEaDhYZlU0TU9ZTzZnVVRxckxUQmpySVg4?=
 =?utf-8?B?N290RGN1NmR1N2JyZkV2NXJvQlJNWUxsQ24zVE9Vdld1bXVGZjJpMWRyeGlH?=
 =?utf-8?B?QlllN1FaWmF5Snd5UFhWclZCUnh3RDF0eWdUZktxMnJhZkRhME1qdFFpNCtP?=
 =?utf-8?B?MGNiay82NkVLbWxxY1JqZDc0TFp3eXFtandDbVQxNC9ITWowTDJxb3V2dm93?=
 =?utf-8?B?N3RSelBJMlBhdHJxYkZXbUhYZWRYTHBxcVkwV1RYb1hhRytOWXloVjF3cTZW?=
 =?utf-8?B?aGl0TWhkaWUwRHhvbFRvZVNvZzJuT2p1WVZRVGpveGFoWjRuYk9Oakd2dnNw?=
 =?utf-8?B?OURuRHRNREp3eHVMTjJ1NldocWFCTWNsdDZPYnYvdEZqS01tVk9peEJUZjFv?=
 =?utf-8?B?bmxwTk5OZWZ5T3V0RkdDd1N3dGlGeWtza2dyaXp4MzZnM3pUUEg3MHNHQVZy?=
 =?utf-8?B?K0N2Y2dscFpZWmxVTXhSTlZuT05QeDZiMzNTREt1Y1ZoM205dFNpcnQvTXEw?=
 =?utf-8?B?cE9NT3p3U0FDVWNtV3RVTEd6bEVwUXNmWVFxaFBDK05DbHRaekFlYWVreWpE?=
 =?utf-8?B?dGJDRC9EaHJEbHdIQ3NETmVYcTJPcjJseFo4Q0RBOG5GS3dJVGJja2d1T0E0?=
 =?utf-8?B?YW40TGUwdFBxVFFqN3l0ZC9LekN5RkF4c3dDNGpNaFpiRkl0WDZpeGpDc1Rs?=
 =?utf-8?B?ekpkWHV4T3ExNEdtSUlabmpJbFI3V0lQdmV2bjVNMkVBemVtZzU3aUppTWdT?=
 =?utf-8?B?YVpoU3pRMXJ5VVF6YXNHbGUzU1R6bjlybGhVRndsdmtJSGRJMWdCWWxZQVYw?=
 =?utf-8?B?cENkYU5DdGNFeUN1aFp0NEFtcURPN2dTMW90NVhpUktWWVJCaHBlbmlJVVdE?=
 =?utf-8?B?L1VtUTduZVNMNE1ybS84WFBkNDhjRWtWOGp1ZDdISjQ4dElPck1ucnQzOGJw?=
 =?utf-8?B?WjY1TDkwWFd2RjVJUXZpOHpPNVBSR1ZVTEoxek1aaTV0dnRIeCt4SS83azhi?=
 =?utf-8?B?RnErN21XY29Kek9mZmM4L05FK1R6azZPSWpqS05ZRURuZFVCN3VGbjcyNWUw?=
 =?utf-8?B?MWszRFI2VGU5ZFlsOG5kWFhBRzhuRzluTXNzdHdaODFFRkg5amdrOFJjUmV6?=
 =?utf-8?B?S2JPY3JYR21BK1J0K1l6d0JlMEpaVUJYakxVNDRiUThjbCtSVjlKdlVoYTRo?=
 =?utf-8?B?cklXSVV6UTB0d2VOeGNsZUxkbWJ5bStvVGNnVTZ6WncvblM5QkJYTXBrUkNp?=
 =?utf-8?B?UVY4UUQ4M21zV1dVU3d5bmNJWG9WWjRmRFY3c2tSV2pBblJmaDR1RHQ3dmtx?=
 =?utf-8?B?VFViWjNqejJVZi9ZR1lBSjhRVGsraHNhbWZNNWRQQ1YvKzluWG1tQkFuMUhM?=
 =?utf-8?B?TUNRWkhrRzV4Snl6OXZYOE94MzBRbmM1VG1Ld0FuM2VucVRRTEZKWU5oMGtp?=
 =?utf-8?B?WE5rQjdkUitDUFZQNmxPTGJTeHNBWUkwNUJ0QTFQem9VOU84SjNMNnFhMmY4?=
 =?utf-8?B?TEY2R0ZRcTRjWEhCNXV0OEZ2MHpqdWRaNXJLbkExV2lGaTBxNlM0eUoxbTBR?=
 =?utf-8?B?UUUzZGp3a1M3ME0yMUxFcnRqNGJoR25HalNnU2hSQ0kvMzJDSDdYczJocThL?=
 =?utf-8?B?NVRQbWlndXdLcWI5MCtHbW5EM3JDYnV1OEFVMnNDVERPdVNZaUdhNkdrbXNF?=
 =?utf-8?B?WHRLQ0xUekpXTE9UTGVhajZPZU4wRkZsSUFyM1FzSjdiVFBDbFFzOXlYelRT?=
 =?utf-8?B?MUNDTnVEcTF1T3RReXl4Q2paQ2xsM1JmdXlaZ0dYMFFxK2tsMGREWjl6RmJv?=
 =?utf-8?B?NUVYTEM4QkJra1kyVlZ1WFNsS0tsYlFXVDZEckllUFpoaFpRcnZwT1NoN000?=
 =?utf-8?B?K2l1S1N1K3JrSXhJaW5uRklacGtTMjBVUVJYS0V5YlZrNDlHQTh6VnFZOU1O?=
 =?utf-8?B?TjRXcVgxNnFVSm5kRitnVWE2TFRoU0sxMkZkUWhkMktkTUNUWkxDSEVac2xp?=
 =?utf-8?B?SldnMUo2MXpoSEdkSDA2dGlud05OQUJUK1JuQWUwNnFNdkg5cVpseDUzT1Zt?=
 =?utf-8?B?TXVielBJWGVidVREZU9TVnlUakFkMVFqUzBHVHhjOVFJL0ZKV0RlRzhHaFN4?=
 =?utf-8?B?bDRjYldoa1gvempYaGY5WldtZnZmNkhHdXg2SC9DMG51Rit2UnV0WUdtaVli?=
 =?utf-8?B?RGc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c2afc9-b507-41db-0370-08dd2581d554
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2024 07:49:31.7998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tA/L9sUdhUAwQXJUz0XcYWXoOVItkcCp2uTgBlUqk6ajcbbT/2Xh5qQu0I1+I6nVnZBvuaHZwdmvkLQihULf1cTXjyqp1GnuSjvhSTYbLt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7403
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_234951_320290_4DCF7EB2 
X-CRM114-Status: GOOD (  26.66  )
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

Hi Linus,
    Thanks for your reply.

On 2024/12/22 17:08, Linus Walleij wrote:
> [ EXTERNAL EMAIL ]
> 
> Hi Xianwei!
> 
> On Wed, Dec 18, 2024 at 10:37 AM Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:
> 
>> [Me]
>>> In any way I recommend:
>>>
>>> - Renaming drivers/pinctrl/sunxi to drivers/pinctrl/amlogic
>>>     so we keep this sorted by actual vendor, sunxi is apparently
>>>     yours (AMlogic:s) isn't it?
>>>
>>
>> It isn't. Sunxi is Allwinner SoCs.
> 
> My apologies. I mixed it up completely. :(
> 
> What do you think of the idea of a separate drivers/pinctrl/amlogic directory
> though? I think there are already quite a few amlogic SoCs that need
> to be supported and more will come.
> 

 From the existing specifications of several subsequent chips, the 
support for the new chip does not require additional files, and there 
may be a little difference for special bank in the future chip, which 
can be solved by private architecture.

>>>> +       ret = pinconf_generic_parse_dt_config(np, info->pctl, &grp->configs,
>>>> +                                             &grp->num_configs);
>>>
>>> But can't you just move this code around? grp->num_configs give the
>>> number of configs, so why do you have to go and look up pinmux
>>> above, can't you just use grp->num_configs instead of of_pins
>>> and npins above?
>>>
>> They are different.
>> The of_pins(grp->npins) specifies the mux values for pin-mux register
>> and pin index in pinctrl. It can include multiple pins in groups.
>>
>> The grp->configs and grp->num_configs specify the configuration
>> information for all pins of this groups(such as bias-pull-up,
>> drive-strength-microamp)
>>
>> uart-d-pins2{
>>          pinmux= <AML_PINMUX(AMLOGIC_GPIO_T, 7, AF2)>,
>>                  <AML_PINMUX(AMLOGIC_GPIO_T, 8, AF2)>,
>>                  <AML_PINMUX(AMLOGIC_GPIO_T, 9, AF2)>,
>>                  <AML_PINMUX(AMLOGIC_GPIO_T, 10, AF2)>;
>>          bias-pull-up;
>>          drive-strength-microamp = <4000>;
>> };
> 
> OK I get it ... I think. It's nice that you combine muxing and pin config
> into the same node like this, it's very readable.
> 
> Think about if you even want to add generic helpers for this in
> the generic code.
> 

I will try to add API for pinmux property to pinconf-generic.c.

>>>> +static void aml_pctl_dt_child_count(struct aml_pinctrl *info,
>>>> +                                   struct device_node *np)
>>>> +{
>>>> +       struct device_node *child;
>>>> +
>>>> +       for_each_child_of_node(np, child) {
>>>> +               if (of_property_read_bool(child, "gpio-controller")) {
>>>> +                       info->nbanks++;
>>>> +               } else {
>>>> +                       info->nfunctions++;
>>>> +                       info->ngroups += of_get_child_count(child);
>>>> +               }
>>>> +       }
>>>> +}
>>>
>>> This looks like a weird dependency between gpio chips and
>>> pins that I don't quite understand. Some comments and
>>> references to the bindings will be needed so it is clear
>>> what is going on.
>>>
>>
>> A pinctrl device contains two types of nodes. The one named GPIO bank
>> which includes "gpio-controller" property. The other one named function
>> which includes one or more pin groups.
>> The pin group include pinmux property(pin index in pinctrl dev,and mux
>> vlaue in mux reg) and pin configuration properties.
> 
> OK I  guess the binding patch explains why you need several
> separate gpio controller "bank" nodes instead of just the base
> node being one for all of the pins (which is the most
> common). In a way I like it because it often helps to divide
> up GPIOs by bank.
> 
> Yours,
> Linus Walleij

