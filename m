Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDB8EA795C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 03:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQ8pCRlyOssYJDcEal/aAFP3eHnaP32fclbMGWsVlWc=; b=YNgmUSfSIDn80mltmOvrFzziqP
	Bsnd217/tMrTn6Ay3E/CNNw2aVIe3RlIVvPWwhTI6lWcMgy5NXet0e2fjSxDrVeH0wHrsg9ObVMt6
	Gt1IYuNJb6QZ//XI3Prgje21EfIgM5SqLtp/UbP60ZywzguulvLFP8kjIsfSbTbqZ5FFTw+DgqSci
	ECTxrEgiIukr9ukwVrC9DOjNdM3jaSIwKtM/EQ6caMJ5gU8OL6Fg8B4L/cpaIoEf38UfAnIl4wYy2
	+wqsem+5TeTp+ggW4Yrxy3P83jBqDt4CwfMU+9cBV0PpSFSjUi4iatcWnuYO1BNRU4dCCAnNo/NeJ
	vZxLJKSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnqAL-00000009NQG-41qJ;
	Thu, 05 Feb 2026 03:36:25 +0000
Received: from mail-southcentralusazon11021127.outbound.protection.outlook.com ([40.93.194.127] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnqAJ-00000009NPO-1DEC;
	Thu, 05 Feb 2026 03:36:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=safXLV3LSO9ZOAieHxE2HfsjSxFYs49OLGsjL4v8g3DAzyzewG3K+L7A4DMipzqUrNYiqgMoyowtAKqU6WgCt5QWm9349DUy1hN8uvN8cnLEzzzV64J3xIW9Pc2pzhLFcbrhUBVW2i9FiQLfYb+XdP+PzsoFE9OFOnOJuVc71daUf5a4q7WacChfTA/KeYtv0xfu17oWPnPWrQaz9r5r7gMp+cRx9D9h0kTIXK7g/kpBRoPFM/ry16NXqgANtinkQnHrvBntnQW4AyEzdG4da4bvP0oPBu28yUKz3hQzOLuiCVOR3QRLg7LbJREZePfaAZsiGV81phvonf7M+NM4hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQ8pCRlyOssYJDcEal/aAFP3eHnaP32fclbMGWsVlWc=;
 b=Emirm8ZSiGo+ZXJMO/9s/udRDian2dVDS3J2JNSyqFwaSdBJJUlxy9QcqSucnERsbMOBjztZCqpmtGPFb+LYw7htgrrB2jmuakalEErilZqHHMmqDat9RKSL+Afkp+CIvQPo31hK1csk7VXt9GwVQbaMaTNozdDr05GaYsV8X89HHORy/KzrAvj9C4hsBC13ON9zeV2AlTzWqf2CXF/CWbTFUbNm257DX0S2tc7imDIq3GOz3tYz2djMHNxOSj2KPPYDVgBFtN/HDMRVfsTDsRFKPFOfgjM+QPiMtGmj3qfpPNIHLVqB0e0PtmMQZzBW7uGLZ5LK6p95hwISS5+erQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQ8pCRlyOssYJDcEal/aAFP3eHnaP32fclbMGWsVlWc=;
 b=txuk2b9g2gkQhVXsCKjPmR7o3LD1RTJBeB5D9kyKcCk16nV8uZnS5sEJEqEEkcnW+10cRd/T+tA7FmBlaZmbfYhZbUfTdw4HAamy/eT8ClXcVsfmBhGfPqWBG/aRp5x11U9faDKQXOC79F0OoFuhE5k0wdHcp64KrUuR/pwcmfYXFQV0d3z6wMS1E27ritLqPzZuRjOAIrCP373SZTDLGQp73Z815T33QL8QFbsrG6ZtO9x107Q8SsiH4stDdvti02WYba46XvdQZdn6VX52WZcDrFr43TfPIgwEYI2/mdLpISmzGakv3nd4v6LTo3Ugqne9HNWrmrohqtKqhMI7Ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by SA3PR18MB5391.namprd18.prod.outlook.com (2603:10b6:806:2f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 03:36:19 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311%7]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 03:36:19 +0000
Message-ID: <c96d21ab-2a76-46ca-8392-6edde3b9ce2d@axiado.com>
Date: Thu, 5 Feb 2026 11:36:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] mmc: host: axiado: add AX3000 eMMC PHY support to
 sdhci-of-arasan
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: SriNavmani A <srinavmani@axiado.com>,
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter
 <adrian.hunter@intel.com>, Michal Simek <michal.simek@amd.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org
References: <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-0-5457d0ebcdb4@axiado.com>
 <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-6-5457d0ebcdb4@axiado.com>
 <20251223-optimal-ochre-kestrel-a8cb1c@quoll>
Content-Language: en-US
From: Tzu-Hao Wei <twei@axiado.com>
In-Reply-To: <20251223-optimal-ochre-kestrel-a8cb1c@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0019.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::13) To PH0PR18MB4558.namprd18.prod.outlook.com
 (2603:10b6:510:ac::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR18MB4558:EE_|SA3PR18MB5391:EE_
X-MS-Office365-Filtering-Correlation-Id: 8acbae7d-e538-44a2-ae10-08de6467b9a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|42112799006|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDNLYUpobHhGakd6ci8waWwzamZsemdFRTBhTW81V1dqeXl1eFdSTm5LTlo4?=
 =?utf-8?B?WC8zSmppQmNLYVlRemtYS3dCYWxVZEhJK0VxSDVhb1ZkditLWVVqL3NjT0RE?=
 =?utf-8?B?Sm9UTnVEQk9HdjY2d1k0bUNnTjFCVVBvVW1Jbjl2bFMxUDQ1OXNiUnVKMzAx?=
 =?utf-8?B?SWN5ODFQeGFJd3k1Zm9oWTYxVHNWZjcvNjkrRkZqTVo2b3AxMXRLZUNtSzNn?=
 =?utf-8?B?eG85TVpvd2hpdjhCSklFVUpuUEU5SU5IUzRHMllRWWEycElMNlVROXF4K1lF?=
 =?utf-8?B?UjRqTUJ6NXNCOWpqR3pXSmQ1M2NyRlIwTEpHYUVmQ1FqeHYyZ0ZzYmJNQmJV?=
 =?utf-8?B?SnVOQ0MwQ0ovd2ZFTjFjWFlEYStzRm5ydmtUSGJVK3pUT3VGTEg5SGhSTGs1?=
 =?utf-8?B?MWpVMmhINUdiZTZmSGxaeUcySzhoankwNmpGTnJuSWVQekRVa2hqdHJleSty?=
 =?utf-8?B?NTJWSjJDOHRyZVplSkM0a3dZbHZXeGhjdWlJaG9lMENwNlhHM093VkJpSkJW?=
 =?utf-8?B?ajlRc1M5TVJwNXZjTTNpZ3VVVHhmdDFOclh4Y1Rvb09vT3NtOU91VTlmSVdj?=
 =?utf-8?B?NFBJUkdybWtqayt0SWNpVW5wbkYwTkJKWW9IMThiYzNtSFJ3TG1nZHpBZUpT?=
 =?utf-8?B?WGVQSlVBWHBnSytncTFWOUdCWVVLeUJFT0R5QjQrQ25ZNjFLN09DNGVEZ3ZV?=
 =?utf-8?B?cDA2aUpnUzNGdXBzZGtVdTdIWGNWLzFmSmtCbWVpcmpCNERBaXFoYzQ4NGk0?=
 =?utf-8?B?cEs3SjI0dnc5NTgwSklDaUVTcUlQcDMvNk1RM3RnRnVLbXduQ1grY0xRblBJ?=
 =?utf-8?B?K0RsclBWdlJXdXRwbC9XdXZ2aVhUU2dZM2FGY3pVMG9FeloraHFLcktVMjZr?=
 =?utf-8?B?TmlkK2JqQjdZVHAwWjRsMllFSUhPNVNYa3BXN0xLeXgrK3M5OGh2Zm9pTUxt?=
 =?utf-8?B?NXd6eFRzdXM4NzgzY1Q5ZGxSQ0RoOTNHd1NPRW94cER6U0MyQjEyVWlYVms4?=
 =?utf-8?B?SkRncFo3V3RzKzZpWTFnNG92N3FJbW9QRWpUQ1AwaXdYbjYyZnVlVW1JR0hU?=
 =?utf-8?B?VWhMTmQxZ0tUcGwrNnZ4WEFCVnFQNFBGUFVUYXdsVDJLSzJ6U2pnL2EyWmVZ?=
 =?utf-8?B?a01ISldGRHBFekNzdDVLcENuSENCYWFGK0dOK1ZEVi83Ykw5bXp6REVFZEVt?=
 =?utf-8?B?MDZZZkJlTnp4Ym11bmp1YlRGWUxvYzUvS05WazBGeGlHRjduNzU2MTJVU1I1?=
 =?utf-8?B?Wmg2Q1lrS2tkL0FCV1EzdzRnV29xS2R1cTBZMC9RT0RuaWRYMk12d0hkY2RE?=
 =?utf-8?B?Q24zT0dIM1l4bCs3ZDNINVNyNUxkaU9mNHVjWjBPZ0t3Ym91Slh3bmZZUXZD?=
 =?utf-8?B?Ly8zcEppNmkxTFFXSTRDZUVxbncvcENYRDVwdVVCZUhzRS92ZE82Ni9kRTNa?=
 =?utf-8?B?QjVzUEF6MDFSZGUrZkdudUlZN2x5S0c1ZDI1Q1VPZmEwOEJHS0pkai9WaUtZ?=
 =?utf-8?B?WlpzVmpnbkZZTHVwRnNiRVoyVUhhL3dEam5oUFhNNEt5RzhkdjgzTnIvc295?=
 =?utf-8?B?d2hKb2tTSDV0N1hHbTlUcDR5RUtZSzJPc3hhUzVvS3E5WktnSVBXUEpmZ2FN?=
 =?utf-8?B?RkJnSE4vRmY5WE1VL1FqWHZLdUYybE1yQVMzbHJrK3VvMlBlVmk1czE0RW10?=
 =?utf-8?B?bVk0RHdxUG5sRSt3MjVLRXkzU0dMWWVYSWNWOVBFdlpqOXluQ2VCTTZDNnZP?=
 =?utf-8?B?dkpCNU8xT3Bwa05oTTZ5dk13Q0FERXRpbzFqTGVFNXBTWm85RU53NGozc1JN?=
 =?utf-8?B?R0VUdGpSSmpVZ1h3MU56dHFTdGVwakRIc2V2RWNxM0Q3b1IrQzkwZ3NtWEox?=
 =?utf-8?B?RU9Rb3VONVFpYy9aTjg0cEhva1BWSXBkOVhuS2d5ZnRRMCtaeDhxR01aVWZF?=
 =?utf-8?B?UUZRY2FiRmFTRnNsQWY1U3lOVmU2Y3lSY0VXUlIzbEkzTWJ3N1VjT3NDRHRW?=
 =?utf-8?B?TW1Na2pGOFhVRWpHUTRDY0l3VXdDWWpyMWNqT3JibWN5cGdJRDFCdnhVRWNO?=
 =?utf-8?B?OEh6alp1d2tPcExleDg2bDhwREg1bXJqRTlZbkJURktOS2doeHMrNldYRVIr?=
 =?utf-8?Q?Hg4Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(42112799006)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2h2T2YwdEFwY21GS0hOT0IwcW1ZcGd5MWpzSCtYM3ZibkpCcWU0R0FpNTBw?=
 =?utf-8?B?OEp0bWVva0gyV3dxSytJNjBDT1dpdUkzUmxyVEQrbnlNbklYTzNvV1hrajZn?=
 =?utf-8?B?RCtMaWFXZlpwditGYXJaOHVlbVp2T3M5UGE4M0lyL3JudXpHeUFOU0xyMEZB?=
 =?utf-8?B?OHAwRkxRVnBaOHJ5WElyN0xJY0ZxK05taTJ4anZsNEpHUlpNU0lLMkZYOWVK?=
 =?utf-8?B?eElhQ0RsejgvYTRYTGEwWldrRXJXcitNVWQ0YU5VaFNiR0VtT05pMmxuYnZ5?=
 =?utf-8?B?TXFVZ090b1lCNUVDQnpVc1hrVXc5UXdFc0hZZTVERHFoRUZWdEJpcHpreS9B?=
 =?utf-8?B?YkgyMUZmQ3pLWWZtclJKWmUyeXNRdnlGbC9tWmMzWG5LZVZFZlAyNmwxNi8v?=
 =?utf-8?B?MHpqak5QQmdRalJDUm9NNSs2OHlvQ1QxTnFRWW1la0dxR1hPbld2bFhqN3l5?=
 =?utf-8?B?Vy9QNjFmeFd1NXdqaTJwa2hWTDBkYk9xeXhIakNaWkl4S0R2S2pwOGdkVy92?=
 =?utf-8?B?Vzk3aVY1WmpVRkdzZnErWWtJSWlmQ084V3g2UVRvd3d2UnE5WjRsWFBPaDlw?=
 =?utf-8?B?RUFEUnJrbnVxUjh2eG5GSWRiZVZsaWJ1ams2bTd5V3dodkNLd2QvUGZibkoy?=
 =?utf-8?B?WkR3cmYvbXJXb21aOFlwbzY2NHUvSm9FemNyVzlKcnVWdVZFdE9tWE5lVXJ3?=
 =?utf-8?B?KzBRVGFxZ0xxWnE1dG1wVG1SZHpxVnRCVWNKbWQzTFVTWlRjdjEzUWZtOWNI?=
 =?utf-8?B?Q3M1NWJ5RnhHRm1kZlF0VTU3Z2pCanFYdUdzVzFaK3UvV3F5cU1oT093YUZJ?=
 =?utf-8?B?RGNuNlNRemtxbHJTd0oyN1FLVkJUNEEzMzNvUjQzSXM5WjVBckx5b3kwbldU?=
 =?utf-8?B?QUdOenl3ZzAzUENmLzZUU29ZUW9kdXpmSFBqWTRDYTZoNG5VWm1lbk5KVXh0?=
 =?utf-8?B?TGpKNTRyaVJhN2QvTUZtYTBEVnQ4cHIydTFUMXl4cVBrOFJQUHBRS0M2STdv?=
 =?utf-8?B?Umt0UHhiNEpzSlZaNUhyeC94cDhNdERpd2tyVTdLdEVGNzFmZjBsZ3NnZTVw?=
 =?utf-8?B?Yk1sUFBFTk41Sk12UXBlQlJMTUpncHZBL3lLSlZxT04rQktyTEpwSFFxWEFG?=
 =?utf-8?B?NEp6VUZ2Vk9BbHArWmdZcDhSUEk1SXJiNURRamM2UHNCV2dNYTg0WFVTZU9N?=
 =?utf-8?B?MHliY0MrOUNQejBKNHdHMkVudXQ5cUFENzRlSUZqOGMwdGVBWnZZdjdnK2Zj?=
 =?utf-8?B?Q1RUU2NreXRFM2hucjJxK09tWGdVTktIeDN0dW5HSWltcDl3MFpnZ29ER2hE?=
 =?utf-8?B?d0QrdjBwVzJ0ZWRKTkEzODVJd3VVcTJXQVF1V3ZKNjA4ZUx3TWNnQ2IzdTJs?=
 =?utf-8?B?UFFmNVNCc3NGQ3J6K1ZZU1I1QVV6dXo2a3grZ1RJRGdmSnBIVFpFcllGTEF5?=
 =?utf-8?B?UzZ4dlVJRWgycWNvU0wxbDcvUiticDd6U0YyZTBxc2M5azZMOFd4Y1pnNFVz?=
 =?utf-8?B?ekduR2xiME5DYXBRa0lmNHZ1a01XTnFmQ09tK0twTFM2cE1iQmFHcEp0Ym5R?=
 =?utf-8?B?WjBwNUlSVEFvY0dLWG1tSE9weDltdEMwQnQvcjE2WGZoRmpQL1FYY0dYbTNW?=
 =?utf-8?B?MU1YT3hmQmFMd044dXh1K0F4ak80Q0NROXU5d1ZCZzBnNGtHcWdsdVAyLzdk?=
 =?utf-8?B?YVpCMnROR0J5KzdBZ0tDZDVqZW53VHFDQkxML2c1amV3UW51Y1JHRkY4OGdY?=
 =?utf-8?B?T09TNnVJVHhKVkNnQXdjZjg5VXRoM0ZMN1QxSGs1ZStYR3QvRkFCSmpFQllT?=
 =?utf-8?B?cGY4VUs5aEdpdmpwVUJyUWZPOHMrb1M0clZNTU5zczAxV1RRblFQbkIrRFdz?=
 =?utf-8?B?UTlZeStJcWVmT0Roazd2TWIvQU9UZmxyYnRjRkM0aHd6MUp0MGg2Skx1TEFU?=
 =?utf-8?B?QkJROVFjZGEvUlpsSUhDd3FXV1Z6cWpsdnVkUFEzU3FkK0Fjc0FIWW5yYmJU?=
 =?utf-8?B?aWQrMkgrZDYzM1pkUWI1QnQ1QktZdmJRa0cvV1RxbHdqbkVMbXNZU2ExNjVu?=
 =?utf-8?B?YVg5SEM2SFBza1U4MkxmNFoyL2poaklvd1I2VDBhVHB3ZEtNRHJYSFh5TThz?=
 =?utf-8?B?YjRySUNOVlBwQ2NlUDdjcWJsZElUMHIwK04zVUw0NXFoU3JQamZySXZVWlh1?=
 =?utf-8?B?d1BVV2JudEsrUkF0RmhPaDV5TlN4UThMZEppbDhWL1hiT0VuMnNiYWZxQy8w?=
 =?utf-8?B?V09uR3R5ZmtFcVVJQXlxV2VyQ0ZnbWExTkhZeGhNQkQ5UklsdmRjMXE5MEJj?=
 =?utf-8?B?Ykd4NURyMWR5OWY0Z2c1b1lWVzB6bG4zMEU3bWpERFRydDZkSTdBUT09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8acbae7d-e538-44a2-ae10-08de6467b9a3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 03:36:19.4194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLDl76GNHRjn8qVU6izn/2jNulSbbOacLfKVPalZUXtFhdSjREln12rOJgpNdzDn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR18MB5391
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_193623_332363_FC97EA47 
X-CRM114-Status: GOOD (  10.25  )
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

On 12/23/2025 10:34 PM, Krzysztof Kozlowski wrote:
>> @@ -2019,15 +2023,17 @@ static int sdhci_arasan_probe(struct platform_device *pdev)
>>                       goto unreg_clk;
>>               }
>>
>> -             host->mmc_host_ops.hs400_enhanced_strobe =
>> +             if (!of_device_is_compatible(np, "axiado,ax3000-sdhci-5.1-emmc")) {
> 
> No, don't sprinkle compatibles all around. You should use driver match
> data for this.
> 
> Best regards,
> Krzysztof
> 
Thanks for suggestion. The new patch uses driver match data instead of sprinkling compatibles.

Best regards,
TH

