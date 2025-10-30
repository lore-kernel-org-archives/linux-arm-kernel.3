Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28408CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQiJDPnbQT0AreR9PkjMbtGDTjJDICmALyTbkdmaZf0=; b=trUy3Moy6XtbKZTydZQjX8Y3n2
	cifCu4tDIKa+qaXNDSukxA5z2F06ex/raNGUpFnE8gr1bYXn+ojQ4AXE8qmaaY7mdmgRtZ85LWN9r
	sygYp1Blx+E96jguphXHJ9zNmsL6iGIXR646jgcl74vUGy9b0IlhNy7RNN/HZSmPf6X4xr52Pjctj
	vqbO6+2ElSAgZQcpZqrwyLu/gg7O811VNtQsKD44l2mh+S2xrc2I4jCL4cfCM3kuotR7Wl63flxXv
	/FBFRRbPVEN/S5D6NdJsrsbY41uXTDrT8O3BeBVg5isu8zRMSpmGpbDJHfJMPkwCVgPVOvvslZLcm
	RVsG7xxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOlI-00000003pZZ-37f5;
	Thu, 30 Oct 2025 09:16:04 +0000
Received: from mail-japaneastazon11023078.outbound.protection.outlook.com ([52.101.127.78] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOlF-00000003pZ4-1L3q;
	Thu, 30 Oct 2025 09:16:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQcbYM7l6+kSj2h6p8UKe68QvnLftde/V45sZDesCJm8PkZR3OiApmdpgdaTL868YIUZALXC5T1YTV4CPxDaBytlVQfYPuqFQke9euT1yPVQr0hpwWicMRhjigcs5AhYaNOKKEmalzQaRApqmsDA3pEp3OoVr6t4mrhtlWBz7czofKEirBwsxROvwbqrbvk9aqfAuXfOzYY3suX/lvePZj7agdr5weFzQhqOPMwvpl6auUek9LPXYqeNifohx54NaX/iIIdcH0sn0ReHpb5TNQX3dl2mAAgfFUK/KKNEBj9I1SQNwuqY968/ebDO3N9davDlSjxtiQ36h9s3wtdz2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQiJDPnbQT0AreR9PkjMbtGDTjJDICmALyTbkdmaZf0=;
 b=hKP52Dyw7JOWcIpuzV5EMgCBn9aKzyK33SR4pz0TtNQOZI2KlEStUTaglRbQPxjS10tf3AIyMKnsoHtHev/x7m67aguio4K2NMnZejNQdnMm2zhEVSjx/yRkwPn0D5sxLYhXfG6C6znkqCQesN8qlQdbHfjwiVgQ+CRCKWF9Pj7elrfGZ8PZUvzpAjKxv5TlUWRpIKq+0ys9riXeT3ODggUOBVu17wOqVeEHRCXwbrfl5U2yIh4riQ+mpux57fx0NOA73pcU+uaDGbHKzTQ3dzwcydFY/8CA5wmJBx0Jum4Ja1bnN5L8fVRL8WNvgFCOw6obsYWgBHGoWdwIqBql/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQiJDPnbQT0AreR9PkjMbtGDTjJDICmALyTbkdmaZf0=;
 b=Cr/eYB0e3CVmLRR42t9MgUwhZJCZHYbJnQI5dJaQsH3yxLmD84Rz6WV9OJpVlycrvZ7RN7vLPSLfZUrkKL7qa0C+5Ssh1//eAoQ46+XaMCez0B3Z0gAGTibBqFPPSKU7f98Bj6iVnCjcWhAcInYJys/0IpBT5KA54RzN6ya65f6lh+U2Yujqag18LoJ/Ywh84Aqk7DNhYUT9MvaOJFPGNPAaQ8jkTlG+tay5A0r1swy3Fa7uu17p5lY1hFvc71ogMFXNCr1ro40qRzbAnHW/lInAp34MzWcLBfyjJmX8HBa3oQligvIWJxyhf4JoX654o07Z4iRuIPNLdW47m6GyaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by KUZPR03MB9526.apcprd03.prod.outlook.com (2603:1096:d10:56::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 09:15:55 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 09:15:55 +0000
Message-ID: <4f245c6a-5a03-4321-bbf8-61249a7a550f@amlogic.com>
Date: Thu, 30 Oct 2025 17:15:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] clk: amlogic: Add handling for PLL lock failure
To: Jerome Brunet <jbrunet@baylibre.com>,
 Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 da@libre.computer
References: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
 <20251030-optimize_pll_driver-v2-3-37273f5b25ab@amlogic.com>
 <1jikfwzt5x.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1jikfwzt5x.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0197.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::8) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|KUZPR03MB9526:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a689233-76e4-4c30-79b2-08de1794ee03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkZ1ZFJMYjgxck84TzdBeldPb1ZZbmR2UnprNit4dlV4dTduSDZQMmE5TzNZ?=
 =?utf-8?B?RlhKYzJoQ3JaYWVPMTBQa1NDZTBya3J1dVlJOERPWE50eDJBVFpxRXlteXh4?=
 =?utf-8?B?VEcwOXBBck4xbnZmNExOdEhpclFCbElqd1d2aWRYOTRBTmI2T1JFV2Jzb3F2?=
 =?utf-8?B?U2NnT2JYVEVMQTdwajRSSkZtNWd6TGFSSDhLYkE3aTNvTEpDZ1dwdHRINjR4?=
 =?utf-8?B?WTdJRzVFSTdyK241cVFPMktJdFBRYVVYOGxvdTBSZXc0MmlmdTF5YjBGVXEv?=
 =?utf-8?B?emVKcHR6aHBleFp1ZUdnTFVoTVkyckFrRmVQQUVPU0dtV1ArZyt4VG8zWWNQ?=
 =?utf-8?B?cklZTW1UMUdrUVNPYSt6Wm16UGxLUmE4OUIwcERGRlREeVFYTW0yeGFRVUtZ?=
 =?utf-8?B?MnBmWVprdXcrMGtmUzVBSitqV05RNCtOU3lHNHF0c1RibVd0UERvL3UyOFRu?=
 =?utf-8?B?RmoyVUVqNHRzRy9qWnVhdStPOTRqdUZrRGFZTWRRZU82d3FHeHdMNXppSVp4?=
 =?utf-8?B?YnZxUER6ZVlTaFp3U0J6RzFvaC9tMXhsbUpCa25tN3ZnSEVsaUlkOGxsc3NC?=
 =?utf-8?B?YlV6NnZ3SWRtQmRRaWlBWlRIYjd1MW10cGZVYjEyS3BleUQwS2JSaTdHMEkr?=
 =?utf-8?B?TWVPQ1dxYlBYUWcxNVJZRDV1THRMT1FZWDR0UnR3dGVRUFYzYjdRVFJuMW5S?=
 =?utf-8?B?b09neGlXT1hrNVVWRDkwT0ZGN0trZU0yZUNYdDU0dng2dFdlSHZVQ1U5cjVh?=
 =?utf-8?B?UVlFODFyaFZHbU9ETlkrSGJiVFFDS0p1eEF4UnQ0M05CaTloUGFhOGxRTVE5?=
 =?utf-8?B?N0VuZTZ2cnBrOW5udzI5Y2tRbTdTdHJ5bWIvUGlPRy9scGZheTBtNCtpOWlP?=
 =?utf-8?B?Yk1OcURsVHcyMXZ4ZXJpSE1MMDVuRlRsaGFqNzA4RUlZZjNwa2xCcTJjWTAr?=
 =?utf-8?B?Mys4QVVaWkl2cDg1TjNSOTdoMmZyZ2J5Q0ZOcDVEd3JhRUhjaHhmNi9SWmUx?=
 =?utf-8?B?Q0xGTmZSMnZ6ZjFjZlh1TTFjWkVLcEdOVEwxWTVGVExTNEE3ejRHZzZZRjY1?=
 =?utf-8?B?TjhGazBCSUthbmpCVkF3aGtwRnRVeWFiOEUwSWdRSk1IajBFR1czNUFUVWJl?=
 =?utf-8?B?WlZsRlc3R21XSjRBL256d0o1clBGeENjSUF5aHhSa3B3ZUtRQURFQmpaMmE3?=
 =?utf-8?B?T3dUNlRFWCtIN2dyRFN5YVFBVXdEdlRDdU5Mbng5SWFEeWhNSWoxQ3dJbjNL?=
 =?utf-8?B?TUZ1TEVRUFAvMTdxWWprU0ZpSlNRU2g1Qld6c21hQjArR1hpSCt1eXRIb0Ny?=
 =?utf-8?B?dkpkT09RVnBiaDl4eUp4anRnN2krUnZQY3R4T1Q0YkZhemtVTE1STFZvb0h1?=
 =?utf-8?B?Nm1PR2M3SlFrRTFOU0YyNzZFY2tHMDhCdnlKejAxZklLaXZ1dzJkZDRidGEr?=
 =?utf-8?B?Tm5HUFJHZUNzM2VGVTlnWGZyNDlMUXR0ZTk0bGF3OGcxVElGVlVhQlRxNGkv?=
 =?utf-8?B?bmJhVXNrSU5KcjZnSzVlaTJIdVhteVlMZFhyZnp2RE1NSUFHTVk1WTJ6U1dk?=
 =?utf-8?B?SjJVWWFQNG9DcTN6Z3VkZTZnQm1JSzRhZFErbytNTDhRcHc1RHErOEs0Ty90?=
 =?utf-8?B?a1k0QVJvL2hjYWZheXhXRktnbFBST3cxLytvcFkvVWxvdi9kcnV3bjJNQkRr?=
 =?utf-8?B?SEk3b2h3RnRmVUliTnFZZ3kvS3dXbmllY2NubkQ5QVpsUFZieVpCU0dObHlu?=
 =?utf-8?B?aTN3cVNhUWxiVk5jbW1wbUUzTCtabk9XMStLVy9UZ0cxUGVKcFVvdGxMK291?=
 =?utf-8?B?dHJNTGs1WHZPOU9QdmZFMlFZbS9kSjBUUnFCNDVPR1hEQzRhUElBT1ovK2dN?=
 =?utf-8?B?Z2tkaDA5YTJJT1MwQkpBeHJQc28xbDBBZzRoS2xhUUNydmhNM010S0YxZyt2?=
 =?utf-8?Q?ufQBFCZdlBaAK/HxzPsbLyIHOgmex1dc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHpKRHYvdFNkQUZJNytQVHZSa01NUVh6MC9JUDgvRG9Wb1p0SHNNOXVUbDRs?=
 =?utf-8?B?ZXlVRUVUb2x0dWNrbDdFM2psMW1HOS96MWdVTE1GajRJM0tScmxWODQ2Rld0?=
 =?utf-8?B?WUw5RElhQ1RESUVXNklUSE5SRWRhTlZoMUpTbEowM1NrMVdrTWVGTzhSQ21q?=
 =?utf-8?B?dWVFU3h0NnVyZXlLL21GNTFLSG9tRGdudFBCcllMN1ZwQ3Y2amkyVmQ0Z3M3?=
 =?utf-8?B?a1pGenNwZU5VMmNURE5aM3NoRjc1R3lTUXNuUHUwYm1nN2daU3NzRXVReFlE?=
 =?utf-8?B?VUNwZUY5SnVkT2tJcHV4RGl5aW9rcXJhc2VhRW0xSVROUkp4VldMYW12ek1S?=
 =?utf-8?B?a1FnaURPRk02N3VURzJ3U1JCclNvVVd3RC9Tek9MKzBnUmxDSmdMVVBUZXBa?=
 =?utf-8?B?REhDaUdzNHRRd1l4dDcya3p1K0Fldkh6dGF5emxqeDlrNURwaFBIaUpQeUFK?=
 =?utf-8?B?aFZ5MFJldFo5bUI3UXJMZnhBUFJkaFJDRThjWjBFSE93YWYzNTJYYjQrN3FV?=
 =?utf-8?B?OG1RTUNwcE00SGIrSjN3VjJMcVZLREhYNEFxbDNScXMrd2ZXWWVURHdta2NG?=
 =?utf-8?B?eVhJN1BjSmo4WlExN0wyNXJVSldWK1g2R3hPVE9vSFlKSGk4bWtmVW50ZTJH?=
 =?utf-8?B?UzhqeW1hL21UdlNhVzhPY1hHRzhvUWVYN2J6aUR6UWRpV3NhZFk0NElFcUhv?=
 =?utf-8?B?N0ljbTlpZHkyb1FOS1JWd1YybHNhQ0wxV1pJZWRmQ2JIN01oQXBDVU1xMVBJ?=
 =?utf-8?B?NGlUeGdoRE5INjRubVE3Qm9wR1pXZW5CeXpOc3AzcXgrWWdkTVBYeEwxa05Z?=
 =?utf-8?B?VXpCbi9RYjU2NnVLcUEzbnJrM3Ftc0ovTDUreWxJRzZ0aHJvK0JuTERNWlc0?=
 =?utf-8?B?bjU3Nlpkc1BYWkhXeHF0MnRxbWJEb1MxQzAxYWllNS9rcWxPMy9DOFEwUDBl?=
 =?utf-8?B?RnNPUTNyT1liTUwvdWc3ODBFQlk1MVNOSjRlMVMwdUpseTR3TXczMmlpL0xI?=
 =?utf-8?B?WkZmcUovVlJOMkdRVlVkUEZtV2Z0VmJZNmszKzNKVlFPSGFlZC9UeDhsUzVx?=
 =?utf-8?B?TzF5ODFNK2ZVaG9lNWVBNzNkY05vVDR5MnF0SVQvbTVxZlhwWHJSUk4yU1B6?=
 =?utf-8?B?YUVFNGxZckJETEpsWkFvMzdTUVM4bkNmNGdEdENTYXliVzBEQ2Z0RGRZamZI?=
 =?utf-8?B?N09xb09IM0hjS01OUmlkUXpVRk5obTVNaVBsMzJ4YVc1aTN4VjdNd0lpOXRU?=
 =?utf-8?B?N3dUMDdMc0hnWVlzdmg1Vlc1MS8wM203TGR3bUxFY0Y0MHdCRG4wL3ZyL2dR?=
 =?utf-8?B?NE5nVkRURGlqUFhPRDZQQTJjbURUTXZHcjQwM3BpOThVazZtdGdoUVlhRENE?=
 =?utf-8?B?QStFT0R4UmxFU1k1THV6TnRGRE1SNkVxemhJTWF5Y3lyV1lPMGpqd3NiaTBh?=
 =?utf-8?B?ODA2WkNHbUx3QTNwS2ZEN1VrbUo5Rk9OaDloZzBqdnpYS0liZUpxRXlEa00z?=
 =?utf-8?B?cDNXTC9kUmNNOFFKWWRZTVA3UjB3N1dFMlBGLys0RDFuQ21XSXZ0Z0x5OGJD?=
 =?utf-8?B?dHc1YnUrYnhQM1E1c00xWERuTTJ6MjRqbWZPRmpQNnF4bHBvQjFMWGtCSGtx?=
 =?utf-8?B?MkZ1bWtVYmluK3VkREZLSkVBRmo2c2svU3FXUlN1eUg1YlhKR0J4eHBKSlhB?=
 =?utf-8?B?L010cFR5WHk3eXNzZzY1OUhvMlh5MlhUemlXMmFnM09CZm5LdXZoaFUrVFVq?=
 =?utf-8?B?VldsQmJzMElmVmp5d0MrcVg4S3FJZ3ZvSnphdDRLS095YXFwejJyUEZYNjFU?=
 =?utf-8?B?TWFNcUZ3RjNHa2U1VWZ2WmtjVFJKc282anJzanBSRmIwN1E2TmprWWVtQ3Mv?=
 =?utf-8?B?UnZtODBkTERRbTF2Q1VtTWNXT3ladXQxWFRvYkVObHZpTnFlclVCTTdjWFVW?=
 =?utf-8?B?SDh6enNSRE1QejN3dDJZUmVBV0Q0SzJybGhIVXlNY1pxUG5adldFd29WQWw2?=
 =?utf-8?B?c2duclpsV2JBdlN3T2llQldLaXBrWXhjUGY0SE0wSm1lcTJNZlNkMnllZTZF?=
 =?utf-8?B?MWNEQzFDaW1qMXEzbldhMFI3aUp4SS9GMytvSGZ2ZHJ5K2RReGFGUHlHKy9K?=
 =?utf-8?Q?bCPzp8HFT8IuX8h5bjqEGere3?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a689233-76e4-4c30-79b2-08de1794ee03
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 09:15:55.0552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ci0guYXqZ9Bvm0zCuF0I3dl6FjnSnGWMX8oY58oN366uY+uEzut3sWE27Pl3voCdx6EcsV0n932naP01FDLQJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9526
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_021601_367427_9FDD4E5A 
X-CRM114-Status: GOOD (  19.86  )
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

Hi Jerome,

On 10/30/2025 4:32 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> On Thu 30 Oct 2025 at 13:24, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
> 
>> From: Chuan Liu <chuan.liu@amlogic.com>
>>
>> If the PLL fails to lock, it should be disabled, This makes the logic
>> more complete, and also helps save unnecessary power consumption when
>> the PLL is malfunctioning.
>>
>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>> ---
>>   drivers/clk/meson/clk-pll.c | 41 +++++++++++++++++++++++------------------
>>   1 file changed, 23 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
>> index f81ebf6cc981..6c794adb8ccd 100644
>> --- a/drivers/clk/meson/clk-pll.c
>> +++ b/drivers/clk/meson/clk-pll.c
>> @@ -353,6 +353,23 @@ static int meson_clk_pcie_pll_enable(struct clk_hw *hw)
>>        return -EIO;
>>   }
>>
>> +static void meson_clk_pll_disable(struct clk_hw *hw)
>> +{
>> +     struct clk_regmap *clk = to_clk_regmap(hw);
>> +     struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
>> +
>> +     /* Put the pll is in reset */
>> +     if (MESON_PARM_APPLICABLE(&pll->rst))
>> +             meson_parm_write(clk->map, &pll->rst, 1);
>> +
>> +     /* Disable the pll */
>> +     meson_parm_write(clk->map, &pll->en, 0);
>> +
>> +     /* Disable PLL internal self-adaption current module */
>> +     if (MESON_PARM_APPLICABLE(&pll->current_en))
>> +             meson_parm_write(clk->map, &pll->current_en, 0);
>> +}
>> +
>>   static int meson_clk_pll_enable(struct clk_hw *hw)
>>   {
>>        struct clk_regmap *clk = to_clk_regmap(hw);
>> @@ -397,29 +414,17 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>>                meson_parm_write(clk->map, &pll->l_detect, 0);
>>        }
>>
>> -     if (meson_clk_pll_wait_lock(hw))
>> +     if (meson_clk_pll_wait_lock(hw)) {
>> +             /* disable PLL when PLL lock failed. */
>> +             meson_clk_pll_disable(hw);
>> +             pr_warn("%s: PLL lock failed!!!\n", clk_hw_get_name(hw));
>> +
> 
> This is something that's likely to spam, so pr_warn_once() (if you must warn)
> and I don't think 3 "!" are necessary to convey the message.
> 

In the next version, I'll remove the "!", and replace pr_warn to
pr_warn_once.

Some drivers that reference the clock may not check the function’s
return value (even though that's not ideal), so adding this warning
makes the issue more noticeable.

>>                return -EIO;
>> +     }
>>
>>        return 0;
>>   }
>>
>> -static void meson_clk_pll_disable(struct clk_hw *hw)
>> -{
>> -     struct clk_regmap *clk = to_clk_regmap(hw);
>> -     struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
>> -
>> -     /* Put the pll is in reset */
>> -     if (MESON_PARM_APPLICABLE(&pll->rst))
>> -             meson_parm_write(clk->map, &pll->rst, 1);
>> -
>> -     /* Disable the pll */
>> -     meson_parm_write(clk->map, &pll->en, 0);
>> -
>> -     /* Disable PLL internal self-adaption current module */
>> -     if (MESON_PARM_APPLICABLE(&pll->current_en))
>> -             meson_parm_write(clk->map, &pll->current_en, 0);
>> -}
>> -
>>   static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>>                                  unsigned long parent_rate)
>>   {
> 
> --
> Jerome


