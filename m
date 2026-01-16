Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35037D47CD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 11:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHp2ytyJ9SQ8FFx9gNxxEPLVRCqePhgtoKW2dGadEEk=; b=c3xyH41Q1ITPPHF/rps6NiTTWR
	CNSiMM+Ew6jdFmgC6xgpvKG4O99a6JD/Ypj9n9Rh0/rl3jgIqat8H6GauG9bJPGcN/VmbWe+1ihej
	mvomnIbuz+C+4ubMDJW4Uvo51LqPfOL0dIGEbOmN5jXn+qyga+pjW3Hup2yvI6gPmQ4XBEGIuLtc5
	a0Rm/JkerPGtJ2FGohLepXDoqfn4pKpqNjlyqC42kkdMow5btrt7f/s+Fb8c3w3itsVzIqzk6B9Nn
	zvgw5LK2Z6k/kH/RrY7AHO/fnY8Hoy6p3v1rGMBPZUeLm0CXRNT4PxRnEAnZcrxzQodvKOJOIEOwA
	zbR5sJ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghwh-0000000E2uZ-1FQw;
	Fri, 16 Jan 2026 11:24:51 +0000
Received: from mail-northeuropeazon11011003.outbound.protection.outlook.com ([52.101.65.3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghwf-0000000E2tv-2wcU;
	Fri, 16 Jan 2026 11:24:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acIQFH8ioh0uaedDnY0UmEu4aHpjnZCYAvSPh226/GeNb6N7kormC7c+TsRXrsLXX6aC52NZ/2DAcd12moKV7oym8lCGCxWj/EIfPAedGaBCBnV9M8TzNeCwoPMj9ujZr9QvG8r1bCdRSWdXRzwTTRksIGMVetOkau+bS8EzCIXI+qYADWWUZw6REgbduFrJmxzHd26t/LWH12YZDtfsiDdh7eSJAFTLlJ5KSSH5walbZG5KlDsAw0Lt4bqn7WAoXiih+BSTqpp6TaDltP6aoNhPPtyksy9b02sfwGjcgm8ze7eiHIBNiCE4RQZQXr7mgHyT3yFlJC6LyLCsNxxJZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHp2ytyJ9SQ8FFx9gNxxEPLVRCqePhgtoKW2dGadEEk=;
 b=A3XsDnDX0bH7Qc+V9dnKaIH7UZ6gJqFRYjFx8H3E6+s5hIkGUy/W2apC5YQCG4oAJ20dFWmmbWlyYu0kLZ1UjJScWrLR6w52tuVZvd3MzF+Ghe1hiFoSmitWXhHaJOLb3v+mXTIVrLAX4L6fGzCRmE3zUGuFdpOoJT8AK2ZJP+LZTtLRMIkdZR2J738j3V3jmFAgRUIpTYUbSZHZbvrllhjmgt+VZkaB1nvXsQGYiJbYNOBfjhUOvEQ2JSlXK7j9jPkEe7gRh62UFoDmCV0gi1pLl1hJCMXsNGa+ugb2y6mgDghk32rsRT0toJ282ChWMshlDFO8RxayPxtcYSHZXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHp2ytyJ9SQ8FFx9gNxxEPLVRCqePhgtoKW2dGadEEk=;
 b=Cxd+umikAkTRBBZYW2MLNVTBTDOkJkBezpa/kYA8V6yyvGnO9Ldbb4e3EnMUoo/dPa+rEVJhh2jC4qyCIKfrLopiv11WyAOE1XlapSsh3P4aTl76y+VBtjV72yygKpGm1y0UPg4hG8WvVvZ9w7CtqAG9tdIL2IHIxBtGYI5ktuk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB11667.eurprd04.prod.outlook.com (2603:10a6:150:2c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 11:24:44 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 11:24:44 +0000
Message-ID: <880303f0-8f09-406f-8e77-142a0ce15a67@cherry.de>
Date: Fri, 16 Jan 2026 12:24:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] arm64: dts: rockchip: Enable pwm1 on
 rk3368-lion-haikou
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20260114230707.4175162-1-heiko@sntech.de>
 <20260114230707.4175162-5-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260114230707.4175162-5-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0243.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::11) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB11667:EE_
X-MS-Office365-Filtering-Correlation-Id: f644fdfd-2090-4cae-51f0-08de54f1d92b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elFJWUUvSG9VVmp3N3JMSC9lZmErQm9waU9nOU1xN0RDSHBzNXBld0lodEpF?=
 =?utf-8?B?OTlmZVhKQjVxK1hpWGtTdzBTSHZQL3NuQzA0dmdSbHlscmNMVWFabHhyL1hG?=
 =?utf-8?B?VEpydnNJVU1VdmZGejhoK3JOM3dlMzBVNFhvVTRsNlZ2U0k5MVg3VDdkQ3hN?=
 =?utf-8?B?cWk0dTgxaGxIOWdLVVd5Z1FFVGhIdWhMQUtHQ0hCYnJBVkxBMm1Xcy93bUJj?=
 =?utf-8?B?a3pFSm9rYm5OOFByeWVmWUlXWDUzdm8vaVZJUENDdWZIVnFwMXEwUjZIdkI5?=
 =?utf-8?B?RS92SlBZOWVPS3ZkcEZ5U21WeXR0S0U0aHBmYnEyUWM3bTJYTWZjMHFYaWZD?=
 =?utf-8?B?VzhmZnQvRXpNWTNLMi9KYUJZSC9TL1JxaFo4Z3BiRlc0K3oyS2s1Wkxjb1U1?=
 =?utf-8?B?K3Y4dXl2eFBuaUhRYS9Pa2ZFZGFkYWJEckZ3a01iOVpwVDVFN24yRkRtQXZF?=
 =?utf-8?B?cTdiYzdPNTVITTBaeC9zcDU4THl4cXYxS3JENnRQK3FqOXdndGZVMTVGOS9I?=
 =?utf-8?B?RUNxb01JUVVrbmlNd3pFZUJTWVB4dmIrTkdjaGNwakRWMEFzaFJQSnI2Ukdw?=
 =?utf-8?B?M1V5YmFMT3pUNmdjVkRkVTA3aWFyZ3JrOXZnWEh1MTVGL0FGZWZWakRSMllF?=
 =?utf-8?B?U0NROXFYYVIxZUo0eHc1LzBUUlp1bFNneURWY0dxbE9WVk82TnZqNWlLSEI5?=
 =?utf-8?B?RVZrbm1saEFnM2p5cnpiWWJ5ZTJ0OUdOZHN3UktYRWV6cnp6eWF5dlQ4eXVW?=
 =?utf-8?B?bzhlajV4R0tUZWttSFNtb1RLZkVld2dxb212YlZyTW9QdWMva3d6RTV3bHFn?=
 =?utf-8?B?WWk4VUJMNXdIQkRIVUF2emVqME1VNFB6cklTVmRsZ256YW9wU2hHR0tId2tC?=
 =?utf-8?B?WktKZDBCSWpoay85aGdla2ZOT2NuQWRaQURrUW1SK2gvMVdmUUFjejR2U1FM?=
 =?utf-8?B?ZmdibEdmc3RGMGFQRXpMQlN1Z01kaVV2bmlOcXdRQUpIbWM2T1kwSHlLckJ5?=
 =?utf-8?B?eXVXY2pFSXFBYTBuRW52M093L0NscVQvSTBDMWd0U1B1eFdUeUxqa1hhTkgx?=
 =?utf-8?B?TmM2WGRXWnp2aHZGS0NNV2g3TWVyakZiWVRvcHBaRFhsZ0dXRmNmNnppZ2NO?=
 =?utf-8?B?TXp0REwrUTZyM2JZeStYMEM3V3A2TjZPVXFFUEpENEpMb2JNNjNCYXVoRC9U?=
 =?utf-8?B?NVhZbVl5V1lOMEUxRkRxVGU3WjhXWE1nWTdwa0xwZHkzSU1FM21SZm1td3Yx?=
 =?utf-8?B?VGxVNzIzRnpLdmdIVnlwMVo5UkQ2bGpES09FdHpTZ0lRazhhZXByNE5UMHJk?=
 =?utf-8?B?cTN6YzZzbzlWbDE5WFMwa2hXSmRReWlmUGh1UnZmYjdZNmw1bmxHN1E0bS9r?=
 =?utf-8?B?Q0t0WjVKakkzKzlVejRoN0xmYmZjRmtCMTNNcW5FdHpQd2czRW8wdlhmZmY1?=
 =?utf-8?B?ZnFnTXJBMlI2TXovaHNtdDgxMjM3UWRlQndYWU9xWEp5Yk1UUkZ1bGE0WVNK?=
 =?utf-8?B?d2g2Mk8yNUQxMEY5M3VvenJhNGFzWm9MT2R4WE4wOVJUd2VycEtoeWNqek1Y?=
 =?utf-8?B?RC8zanJWd1hMaGVpc3R6cVJtSGpYZGdDbEovWjF6MFBTbW4waTNSTWxBWmI2?=
 =?utf-8?B?K1FKMThRd3ZZbGNIMThSVDlCdjhDY0NxZ2c3MzlOWENQamcxMndhNWd5V1hj?=
 =?utf-8?B?U01rbmRxbktuNDQ2NElNdmxvYlpsSVcyNTJ5NlhzdzlLRG83NmJJQ0VLWFVS?=
 =?utf-8?B?dTdXNmFCWmdSMUJBMkw3ZTB1RDl4TXBWVjJ2Zm4xaUl5M081UkRDRnE2eEh1?=
 =?utf-8?B?NDBNWFZSZGplc3ExT0V5WFJTWnpqeXE2V3FYRi92RldXVTQxa2NyT2RtRjZl?=
 =?utf-8?B?SzlvaFVoWnVObTRkbjRlVzhmZkRHY2JOM3o3ZVNFVFA5VG1XZHJiVWNXMTJV?=
 =?utf-8?B?Q0RjRVBhVEt0MzFzR29sbTN4TXBndjlUbjNibENsOFpRUGVGdC9hSStaRUdi?=
 =?utf-8?B?Z2NrMmVwVDlsTFVOU2lEQ2srTTYraG02RU4wTS9tVUpIY2FQNGZ0VmR6WnpU?=
 =?utf-8?B?V2d0L2dJQlRXMXJBVmJnbzNnRUswd3VLZmo5bGs3QUo2T1A3byszeXVuNjlp?=
 =?utf-8?Q?dqh0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlBqUEluYzhKNHRYMjhvRlk5UUNUNnBZQU1vcUpBd1AxKzFDb2plTTZNbUQw?=
 =?utf-8?B?TXNJd25USkFmNnZvZXpzdkRNWVRyV3JPTW1acXdkZDk0RUJaUUs3K0xKZ2JW?=
 =?utf-8?B?S0NLcTNuUS9xWHFkVkVpY3pjWFdTcmdWSzhpeFoxUXVEbEcyeUFrYm5EanhD?=
 =?utf-8?B?azhFcTV2d3N5ZU82MG1jbDlmVit5bXpIVXVIRStsM3JuL3Y2ZGlNRDBYSVFs?=
 =?utf-8?B?cEVmTG5TZktwWmkyaGdVUk1iUm9LZmxScHplL0VkT09BUkU4OHR6WTlIa1Bk?=
 =?utf-8?B?Q1RpRUdjUHZBRXBFRHVzYTIxRXlvYTJRd0k4ZU96SU5rMUM3U0VOaFBQbmdN?=
 =?utf-8?B?ZzZPZmpaUG8xbjZlRy9SVS9wVDJNYUQvYmxyTVJreVZpUGc4OUM3bHdVdmlI?=
 =?utf-8?B?dWxxODNHVW54SVhYVTRQdlVuS0YyZ0hBQjgraUxlZFVMWkttaysyVXd3NEFW?=
 =?utf-8?B?Y1hWc0VzSXMvL0UzZi9PcDdXM0szdXVmM0lMQlNtSUlZNFFzN1JDNEpFNDdR?=
 =?utf-8?B?WGl4d0dCN2pBellqTlFYWkZiaXZIMC9FZkZpWkd1U2FFUmw1NC8vVlcvZCti?=
 =?utf-8?B?R1NNUFcvWXgyRzJRdHNJVm5OaEJHQllMMXZmU0NqMG1yRGpKQXNBRC9qb0ZN?=
 =?utf-8?B?UmhnalBnTWF2V2NiMXZUQjRKM013TlBYMHc0Sm12MFRKbU01WGlITXBXc2F6?=
 =?utf-8?B?QTRUK1F6T05ZazdmYWdldnV5a1pCb2VDU2tFLzdqQkdycncvTTR3OW9qbCtj?=
 =?utf-8?B?Zm95RnFzWGRhcFBzaThXeG83VjFweDg3NFpWdUZ5RFFkL21ONUhPWjh3UW9Q?=
 =?utf-8?B?aWpodkpuNmVYQ3lpLzBKeXIzTThxM0IwZ2J1UE1OMnFtUVZXZjJFS1pwZUdU?=
 =?utf-8?B?VHVGL2U2dnhjdWlqNzhreGMwWXpxQWxzQXp6Nk0vR1BPSzRxYWtWY1JNeTNI?=
 =?utf-8?B?ZVVIOXJLQkVvTzQyNFZuM2pldDlrYi91R3BIdms2dDNPYS9wOUIrTFdlRTI1?=
 =?utf-8?B?aHEzbVVLMGtmOFZHNWZ6dkxjWXhpUklGeWRIM0xaRG1BTWdZa3FJQno1RDRi?=
 =?utf-8?B?SlJ6VTJzVVVOUWhGUWdPUVY1enVEa3YrUThDNTNTTDRPU1hobnlHMlJmaHF1?=
 =?utf-8?B?SUl1YUN3RVJNNVY1aFdWb3ZyVEE0dmlWQ3VMNEtrdHVWTmlNNlJiYU5tLzhX?=
 =?utf-8?B?V01zUWlxS0RvL0ZINTlCQmFDSzJrd09ZSFpEQ1hZdE1VWFVSWFJhOFJnTFl5?=
 =?utf-8?B?M2V2RmZsNFJ0MjVsMmo1UERvblpyZktZUnh3cWhVNVRyUGVjK3VxeG52cTlX?=
 =?utf-8?B?cnJZOFNtZmJuZERTT1NnOVBUaTRRZlZwSzA2Y1FWWE9yOEF6VHBVckFUeVBS?=
 =?utf-8?B?SjVBTU8rc2w1cDRXNXp3ajBWUUFvcENHSXJwK0hKemlmZkdKZ3JnTlVLMDBr?=
 =?utf-8?B?QUtlcTRrTW44VGhERXhubzJKL05wd1ZORzhXQkcxcGNvVjcyZG1aK25VbFdz?=
 =?utf-8?B?VlRnZ2FVcFgvRWhTN29nZ3lRbmhRQ1Vhb1pWOXEzSTl0aE15aU1ZeDJyeDhC?=
 =?utf-8?B?UWgwU0VWTDBPQTRoWnZJdUlrNTB1NnNGbSszc0tWMlhUbHF3QUJrWnNwYVNW?=
 =?utf-8?B?Q3orQVFTbnVXVWFBM2ZpK3dHem5ZQkFibnl4L0JoSTVjTTIvUXBGWVg4TkU2?=
 =?utf-8?B?eXhtUEd6bjZhc01OQmcvbnNXWlBQV1E1Zk0raitNd20zTzh3azhvTEdHRDlP?=
 =?utf-8?B?YmNXOVVxM3JJbmlmMm80YlBZTVQxN1B1REtHVlFSNGh6d3pteUZxZk5sZEM2?=
 =?utf-8?B?OEpJSWJRUzBnUGJqVkN3TitpWWV1cWlNenhmS3dhQ0xDQVJWWFRsSjBCTXJH?=
 =?utf-8?B?ZDhIVWJKNEI2WVpxRXFrcjFzMHk5UXJiaXpacnZMZk0rWm1BdjlBWG15dTJM?=
 =?utf-8?B?U1BhNURlZ3oyMnBTOWsvOU5keTBrN0RjY0JvcXRkR2d4ai8xT0JlWlUwSWdu?=
 =?utf-8?B?UWUxVk5yZGtkRzNmSzRWT05jUlZ3STJQZm5JWitBL2hkd0VwNnJIamU2M1Ra?=
 =?utf-8?B?OHowVkNzcm1KNzFZWFhkYTQwdXVsVkRHYjNDTjNQSmhxTm9haEpIblZ5amIw?=
 =?utf-8?B?cG5xcXJiYUlObzhFMlRCc2RDMTNZOEJ5bm1SYXhiSC9ENFROcFNqalpzemp3?=
 =?utf-8?B?WUthSTNXU0NyNUR0eHNObCtQaHltSkRSZTh2NE1zTjFEU1ZNdlVOYVN2dXBp?=
 =?utf-8?B?TmwyVlFnWFcxdGRNakRISTVCTnpadjllekJ4TFJTdzJ5dTRVbTlRRGxsdlIz?=
 =?utf-8?B?T0xWSy95VDlWK3F2cmNUNm5BUS9tYVhUY0N3V2ZWS2RSb1ZpMWdjN09CV295?=
 =?utf-8?Q?OWgFMifQ3HyRUCYdyqBmbiHwopQAviOEHoGLP?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f644fdfd-2090-4cae-51f0-08de54f1d92b
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:24:44.1837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qG7IJrDs7kzr88sjsPR3zF+tbeeKkDyb+lt73xTUqpBkc5edn6M5TDbW+ZeVMFkho81bzyLJol8JB7IiQa+x3jUVltM4AcMYuOrXaIMDjA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_032449_752093_BF14E613 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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

Hi Heiko,

On 1/15/26 12:07 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> The pwm1 is exposed as BLT_CTRL signal on the MISC I/O pin header of the
> haikou baseboard and the Qseven  standard specifies this signal is only
> for PWM (either for a panel backlight or generic PWM).
> 
> So enable it in the Haikou baseboard for Lion.
> 
> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

