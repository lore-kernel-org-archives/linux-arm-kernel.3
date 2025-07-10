Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C38FC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 08:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DikmKvJqrUQqovv3ikbr6+CyDlppVj9D7h5JMgNmfIw=; b=zLbFbsjx8pLCKRaDQaqVZ+13Jy
	v1LHzuhE2cw6MEwps//T4O8m5f5NXSc5swdSnpKjd1V3B8VIKYqGe4pcTTN23F3BkWdSueb1aKo8w
	4eWxjPFr6Rd8buj21hJYZs1rN9zhbA9PQC4VyU0vW7NnJmL51ZrsAfd05V5bquSZWLk8wLsvYuJpf
	4Z576FlyZKQRHIDerDZ123zWI3T4msWxnAh3oSVwR6/K88qgId9TgveuLe91mz9ymOszMQxha/Pwy
	i4r2kdvIy0OsWKOJasenJT31zNrpCK9wZZ6Qy3xlsN6wHUhbVADN2vM5pJEdsq/pw3HAf6qo9A+cj
	s1fVlpyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmCQ-0000000B60k-0LnF;
	Thu, 10 Jul 2025 08:00:10 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlT6-0000000AxoR-201D;
	Thu, 10 Jul 2025 07:13:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBOXBuV0IShlWabH/lvHzvAINhK1NJ8m245Y5apXkzI3mEH+TAV4aKbLBVYhyRCNTN0hcShRx66RnWj2d03pCJaU4R2r4amsrzXJwN6bYOMu2gQSn+nkniyCuOM7LmiAh94bMXqz2tbmfbkJfIOQSW80tsjnllpWPVimdKZhRlnaT/vyMSsCrf0bwqt80Y7aEqC5ZTicoWUt57cSr0iHyz4U+PmMC5oel35Z7FkWodZ9Tz4TQkBaKPn83WfuSlE+jLvBx9607hxLDOUUpMLiWX/Kci1J777Y8fyyMZ8Xb4P0mXqHaHn7BcLO0i7WGcj1+Q0wiIpBgzQU5HfHsIvFuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DikmKvJqrUQqovv3ikbr6+CyDlppVj9D7h5JMgNmfIw=;
 b=NM79jxP8db3nMoxifSp8s0mhtBEZIcV1g5/rV6r6hEbZgyEvLFv00gNZ9gUX4plKEZKMvkyjzOWlJ6bTcIkAl6C4KMUQi2hD3L3gSXKD7w8jqGBxl7fNyH541kHTcf4idWRRRp+0IS6k1BqAzzZblTxQcb8owVIMcDstBaeeDg1inUrMnBRSxRwgsNlISO83rjriAc+WqWjSvCjmsb5zQ/bN85d7QR9NssXye30U+ijwgcuWY/e6mVxKW+2ocCS2rYv8A/5rbaCmQ99wviwg02hyYuYha7BbzJ+Gux9LVT++BZc5n8W+ijOHlaaIQG1xoGYb3FVZPxsyUw0Nihe9PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DikmKvJqrUQqovv3ikbr6+CyDlppVj9D7h5JMgNmfIw=;
 b=y6mdwgVvTumXBN47osHehbd6R8ll17yASDmO4sfRmGTN5gYZ1U67uxZFvB/UA2kIBvNZgZFr1tQLWAEwX1xH2HPaTe9QmDb6/h9uGmUxdD4tasLnoSyBewv2UNv70wXcFgFm8SSIWTk0dSJzmtYCX4WxxSPipD2TPMXJnfmPNyDV0taG7l5u5S3MerrizRfDSoU0DmXTsnfrIuLUfexYu8MkYVECT5sJ6LOofw94rAyY8ZsgpyHfADjuL4C37E1xSXELa0kZSaTgS3BJT8iMfa4UFSMTOTITwi4uahWP21T5JAaVv0s2O0hsV0ND5h+Qc4slzWzXLvUFU80GwH5Pgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TYZPR03MB6817.apcprd03.prod.outlook.com (2603:1096:400:203::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Thu, 10 Jul
 2025 07:13:14 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%7]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 07:13:14 +0000
Message-ID: <c43294bf-cb50-4e85-97df-a0ef89c674f0@amlogic.com>
Date: Thu, 10 Jul 2025 15:13:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] media: amlogic-c3: Use v4l2-params for validation
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
 <20250708-extensible-parameters-validation-v1-7-9fc27c9c728c@ideasonboard.com>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <20250708-extensible-parameters-validation-v1-7-9fc27c9c728c@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0171.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::27) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TYZPR03MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb4b0ef-1c9f-42ee-31be-08ddbf813c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlR5Zk1Kb01mZG9iNnMzUjF5dFRPN2FjSEFHVmxkWTFRYzdEc0lSUFIyeW5k?=
 =?utf-8?B?aTBtaElLOFh2eWVLamNrWGk2bHhrakZ6ZHhUdUg1dWc4b2JzODVNVXFzNERt?=
 =?utf-8?B?eGgxdWQzQVpqZ0g0V0QvUXdaVVVmaFhSdkNWN0FrR1JDM0crWms0ZEFMR0Zz?=
 =?utf-8?B?RHVVZnJaNFRaZUNoOVpPQ0xIMFFCeSthRlF2TThhdDlxVzNGSHZIRDdOTEtn?=
 =?utf-8?B?OTUvTm1LYkcyRk9Id3kxeGIvMXRNajlDeHMvL0Zua0txdDVwT2dBckY3WkxN?=
 =?utf-8?B?dkNobGtEM0Z6aGhMNEdKZU9WQlJqNXdxQWMxQ2JoUUNDMTY5dmd0RzVPbGJ1?=
 =?utf-8?B?ZVFPbHNMSGM4aTYxdS9QSldKdzFmRFo1NndpcDRzZUFheDBEcjVnU25TbHlU?=
 =?utf-8?B?QWJ3LytETTZIb0NKampiRExhUWpjYkI4VUpGYng2cjB5bXQ2U2FYYjh6cU9Y?=
 =?utf-8?B?dEI4Qm5pOWcvSkZ2aXpyMEtYYVZRMEtZUFVaRkFxTEo5bHBxcnlsR3RBOWl0?=
 =?utf-8?B?bENmckxWUjNUamZLYUVaUDBSSmx0bUp0MzVNNS9GMUJXT3VMMlB4c09FaXdM?=
 =?utf-8?B?aTYxS053dmlhMlBHUndmWTk5b0VCejY4ZVphK1Y0NjAzQXkzYVpXOUVjeldy?=
 =?utf-8?B?cktyYTNnaUNXa2l1TjRvYnh1UGdDZlQ2NEY3Yk1LUXg4RmNaTHlsQmtXeXNN?=
 =?utf-8?B?WjAvUURpeDh1ZEo2QWRGbkpwSjVRRWZ1TTgweFVaYXJRTWhBNDVqa2Fibmc0?=
 =?utf-8?B?cmJwT0VaNXV6OWxTN0IzRnQxcDVyMUxzeTJIZ2I1b0U4ekx2YjA1TEFoZGxi?=
 =?utf-8?B?eXJqUmxzUEJ0NGVFdEJseGNwM0Rmc3F5c2hhNEluSXhwakFxU0hYcW8vaytF?=
 =?utf-8?B?UmdBdm40bTlsOUZscGtTNW1TbEJBbU1rTWVpWXV5Q2M3d3pveHZlUTVkc0pM?=
 =?utf-8?B?UzV1ekd4NDJ0QloxU0ZzQUxNdEo3eWxMK205dWJaMU4wTjB1eXBjSklxUEYw?=
 =?utf-8?B?VmNqb3JSMk91YWVMZnI2dGhqOFJUSHZmU011UUk5VG5zNGk1WEErYTJNTDdU?=
 =?utf-8?B?NHI4MmxRc3JTb1JWUncrNmtITVZVblU0cng1UkRGbjFwR1ZWWk9IYjlZNnVq?=
 =?utf-8?B?TmVqSXdhOXRTcXVza2ZzYmtXMU1wQ2o5K1hTQjRXZVd6L012VURUWjZNRExy?=
 =?utf-8?B?SzJhVEJQVkNDNi9BcmwrOW9WNTF5RDZlNFNGbVkzZkQycjhFQTR3R1J5RThX?=
 =?utf-8?B?ejkrTFNKc3ZDREJJV1o5Nm0ySUpSL2dxUTVmQVZ2VDNYMGF3VnVKNlBuMThx?=
 =?utf-8?B?L042VEdrL2dXZVp1bVVqY1lha1pyV2NmVk8wNytGYjJCcXpIQzMxMlkrNXFW?=
 =?utf-8?B?OHViUmlzYVJNVlpqcUo1ekRjNmhkWGgvWmNZOWR2Z3RseTBrN0wrekR1Q0Ey?=
 =?utf-8?B?UFN4dEJ0THNlbEl2Q1RmNWJLbHlGaVYzNFZycDA1MWlOdWZ5dDZmUjZBWFRN?=
 =?utf-8?B?S3F4VjZ1NWpkZzQ0Q0tmWThwcFZUREZzYllvWEQ5ekY3TDhUWlNFUEp6NVZL?=
 =?utf-8?B?QU5oNHZ4TVhJODZPK2JablJFRjhLNUlMZVpTaXBHVmdOc0FncDJnbmxqRXl0?=
 =?utf-8?B?MnYvNW9tVXZaTUxpTXJ2ZEJBYzRvTitYUUtnUFo4Umh1QU1rSkpGOFBqc2Rq?=
 =?utf-8?B?Z2plbExFRk9UbWhFVHcxeHZBMzhwTUFVbFQ5b3NnOWVUYThWeWdlbnAzWGd0?=
 =?utf-8?B?ZzBvT2dsODFVZXBOYkxUajRGdlBucXAwaUI2REpBMnUrbzJMUmVtdVBkdTFj?=
 =?utf-8?B?WDN1STA4MS9OWEordzgzU3k4TkNLTXpHR2QzMXJZczNieVYzVFNCbHpHT0JD?=
 =?utf-8?B?UFhCcGpPQ2ZuWVlrME84eDZLQ3hPOVpyb1cyNVFpcXRLcUNEa0FtVFQ4cm1T?=
 =?utf-8?Q?kGA1X1GZVV8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tk1OME8wWnl4SjVZalFqMURyakhyRi80cFl2dDFEMzgwTU5ZT3l0OHJZcFF3?=
 =?utf-8?B?am1jai92R01tRGthWTBVUEx6SkRiamJSZUNrb3BmajF1QnVhWlJadCtla1Nt?=
 =?utf-8?B?OGtyM1UyM3JvU0lEcVpBY2EveGN1Y1JHR2JDbktkOFhteHpLTCt5dWtRd0FS?=
 =?utf-8?B?WS9WREdIcHFOVWRNcVJSS0lpVVdsZEUzVnNCV3J2czhIb1FyN3Z3ZWg3cElI?=
 =?utf-8?B?R3dRTlE1bE1ORGRGV2hSU3Nid0dHU0czZGdLbEVMTFcyaW9vUkdkcTR0SmlS?=
 =?utf-8?B?Q21HRHkzNHJsTHRkYW1UZ0x2Zy9SMm1pOEIveDJvbFpoKzEzOGtNYzNFazhT?=
 =?utf-8?B?cnU0WXBrMUZGcHZaTnJqRkZCSlU5eUEzT09Jd0EvcjdrcXRMVldpcEpoUHRF?=
 =?utf-8?B?VmF3MDdEb29EK3gzekhBWE1vR0FQa1YrY1dwb0s0TENzZUlQT0xqbXFGSTlK?=
 =?utf-8?B?U3RrQU1mSmllZFJ1NzE4V3dpd1A4aGxzQVJ3QzRtdVRPbm1YUUg5TUNRWERB?=
 =?utf-8?B?cHlXYXl3V0NhL3VXamo1Vm95bCtKNlh5dVhCLytwY0VvSThjOGVFbkd3WFhK?=
 =?utf-8?B?K1VZZ1hLbERuWjhsMFZCMDVCZEt3S2pDZHZ5Q2J0Mnk3NXlvV3hjYnQvQ1FD?=
 =?utf-8?B?WlRMWU1DY0ZaTmFBK0lQQyswQUpGVlZqOFRYS1REKzUzalZsWVVrNnV0NEo1?=
 =?utf-8?B?VG5Kb3phL0dvbkE0SEVNNS82RzN1cVY4WkEvSU5YUjg5Tk5paEw2YWNZNHRX?=
 =?utf-8?B?TkhQcXduQWQxb3ptbGZ0ak1rb3dIbnNYLy83NkY3STVyeWQ5QW01V1RnMGEr?=
 =?utf-8?B?MlAwSVBUWjExTE10eUpFcFBXWGtTTHBHZmJlZFVkaytxSHpZSXJydTg0ek81?=
 =?utf-8?B?UGtJNWl5UXh5L3NvcDRvUXVrOThubnVWSUdRVS83NlN0U3ZDUDg1WmpRRlll?=
 =?utf-8?B?SjF4ZGprQWQ2a1FXNjFvT1UvNUZralFsQ2VSSG1Sd0phVUxtSUVNenBXWHYx?=
 =?utf-8?B?UnR3dWhDcS9zNit1ZU14UGtqVnhiTlhrd2FZSmNPZS83VDBEcmV3emc2NTZp?=
 =?utf-8?B?a2RtYzFtN0VEWnBENlFKeS9DemRacWdyRXc4OEhjTDBWWDE2bFFCN015U0ZU?=
 =?utf-8?B?a0drVWF4V0VGczF5V21pZVIwUWVJYmtrSlI4ME5hOXBtYW5oSkxyQ0ZHTnlB?=
 =?utf-8?B?Mk9Nb2NQR3V4V2FNdW90aW9vUnRHZTVQUXdKZmNsaDFSUXI4NVdLL1VhUVJh?=
 =?utf-8?B?dHRIMWNLWi84VzlwdlF6TXJtN2dWNEthb0t0QmhwSk9oMThRSk1ERVMvVFJh?=
 =?utf-8?B?NkVQZmY5QkRzYTZYc0M4a08yUTdEOUhKMHlpQnFRWGQzbTFZSTJQa3RSRG14?=
 =?utf-8?B?ZU1YTGlIaUZmODJSZlAwUW1ZQ3hUeEJDenBkbGcxZVpKM2MwOUVabSt2K1hp?=
 =?utf-8?B?OEVrOHJBNjhQdW5vQWRaNUdXMzNubmpuQVZOYXNmT3J4eHkrVUJUN1NteU1t?=
 =?utf-8?B?TmxqZHgrbDBCZmVQNFdEM3dCZjNKMndCREpMcGl0aFdBNFZ2QU16cUEwWWtk?=
 =?utf-8?B?UHZYaHNYWnorUlcxRW9pbmtiSVNJRGhiUWQ2OXViNmhaNFBMRWVoaXJNNTIv?=
 =?utf-8?B?WkYzTHNpK0R6NWErNVF3aU9iMXdCOW9aVGNIcStHUEFyaTNJKy9Ta2JEWmFD?=
 =?utf-8?B?MTJVOVhoOGZKY0E3R290a3R0VmFZa2ZlVFBXbGNCREdLSzM1dFVGMWlFaEV1?=
 =?utf-8?B?Ukh6SzVVVjVxVmx2UkdicnJVNnRxTERYbVVnTkJEMk91UGpJa2J6TjlFcFhJ?=
 =?utf-8?B?c245ZlNrMWhZaExHSVdJT0FDaEJrdWhNQnM1Ykpualpyd1NFL3NkaUVGckVp?=
 =?utf-8?B?OFlwaS9scmt3ZXYzYWFqRFc0N2hIZUVPY3lMa2lxeGEwNXVoT0xvM2FJYXlx?=
 =?utf-8?B?OFFhZjNBdHRhUVdUaktXQXhaZzhlL2RyQUFOYldpYVR6a1Jpckl5SSthWldX?=
 =?utf-8?B?UXB2dmtXWmtTdExDRTBqamFQNkZBdm12OWNua2R5dFhYNjBMc2ozYkdwTS90?=
 =?utf-8?B?UUhHTFNnekRrTlB4R0NQbHdoN0Y4eHJ4c2x6WVQ5R2dncDFPbVBYMG5NSDB0?=
 =?utf-8?Q?VPG1xEzhQRmQwSfW7fsulcSig?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb4b0ef-1c9f-42ee-31be-08ddbf813c42
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 07:13:14.5744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJYXssgd9dMYurErc2jOP8sbxecMQdR0IeLbYqrhK1EVksK1VRhffaA3ZRs7tDJ0RggCOexdE0VgIxZKJKApOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6817
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_001320_508201_BFD43288 
X-CRM114-Status: UNSURE (   9.75  )
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


On 2025/7/8 18:40, Jacopo Mondi wrote:
> [ EXTERNAL EMAIL ]
>
> Convert c3-ispa-params.c to use the new types fro block handlers
> defined in v4l2-params.h and use the new helpers from v4l2-params.c
> to remove boilerplate code from the driver.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>   .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 272 ++++++++-------------
>   1 file changed, 103 insertions(+), 169 deletions(-)


Reviewed-by: Keke Li <keke.li@amlogic.com>

Best regards,
Keke


