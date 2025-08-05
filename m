Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F35C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 13:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eeedgtv1dC1bIV8UKXj1VzBZvA/o9YwGm9ukXI50YzQ=; b=k8nB8lN8zRzvHMVvmGqO9PrQHp
	OUVnaBnZj3kr3tCPHjjr6i8fJimvUEwmmZkCAtmMr2CGHZycu/Ueo6n/hM5IWuOgwWTss2N/fuive
	iM6FZHv+i+K/a39hyaCb0bUa9lKLcmvmi/fxc+2Si3BnRjoSfj63/I/wfCno6w5wNLr6byZxnNuDw
	EyqSITk1U919YqudgjXyEkmVhoaTGq3KVDdHzdX+DFypPZWcN8WBUYWDF3lhHiNCSFIe0ReSy6WVV
	qzevlbl2KvcG3f4lMmF4+JTV7amMd+eVJzNcalwFNBArAr381atD9vpSmGqmh/63BmYwLY7wpxA1O
	msBVJzZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHnV-0000000Cr2I-0G0M;
	Tue, 05 Aug 2025 13:33:45 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHXe-0000000Cogm-1rgx;
	Tue, 05 Aug 2025 13:17:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGIlYnvFY0WX6x0fBLKRLe07pUbmfyGIqtHykhswZ2lq6Eru/rE7wZahc+3HMR4Qx6ijLsC+Tgr6AS10vM3wEZB5nLiL3I/fj1k8yx56UC65qkfCVAtpyOmEv1g/Z33uFECxNbT3ZTtOWued2lC/TQuYLl0+y5UPvZ4/ab4j4RNHH74TpH0f5QbETqEz8ir5se2FE3hdo1ySC/alhcXstdQ4VrZCUVjdmXrAo1QakUVU6+fei2X3KzybF5Q55hhjfzKNNqCqQFIzNDpUqqQKwfvLN47QUq34eKZNr8o6dzcb0OJZonmVUnR+PevqlEFvylvPpSfAU6Lq+ExpReiHWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeedgtv1dC1bIV8UKXj1VzBZvA/o9YwGm9ukXI50YzQ=;
 b=nZlULF8jVRFCk0jlPvYOAqEhW+3w/RUDPbCU+CNTgLJ51LYZ++VW3gbavMSfgMH6owxSzAh6Ll/SVnDrUw0FgEZ4NHwXFbvIpc2I8Hb6isiiYk/p1Xo67LZf2om6E8Ig6GkF1dN2HNyBBUJTfCtS1okMqliEz58OeszB84x2uRDjL1yjh1+Pytr0E9xNrthrllJm/OvqRrJjN+6WV7Jb1ss8axOeVEGMyVodiZZfwplJBHuGx5PfLiAvRltxSy8ecYcyJcFmX8gCQPZlWdtQlKOliO5xqruoTveRXJRc6hH+1576zO4Kq7+gRftgti9fBeQR1L7U2f+b/tY2SWuStA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeedgtv1dC1bIV8UKXj1VzBZvA/o9YwGm9ukXI50YzQ=;
 b=HTdRk0OaKM9NbBuQI7y5ej57O98AqbwAGtnYg5phnGHvaGQQ8IjNVcDKelQAflUiGcoSck3ldqNnZAPtz3lglHOKJ+eX/GqVaV3jLem7cgfQ795stMldXqhUpKB5+1S1Et9AFhrtz7gbbJ5ogPGZTuNU8pkzR651LyZPibSqpUCL3TFlHOhJivRIwjy5912V3W2cONqNnHHEcqk9cwu0gWCCwgdSV0ba1Q+2axHQgLCOxzki2FZeQUWvXAr1m4RCj8WziRarBmGjWjWBMBGVtI/uwp3YDGGZUcUGmGNWL6XzpyvbbKFf1epLlE3gPw0TTMHA5HA7I56jZt+Pc0rsAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR0601MB5774.apcprd06.prod.outlook.com (2603:1096:820:b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.19; Tue, 5 Aug
 2025 13:17:10 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 13:17:10 +0000
Message-ID: <e3903e95-3659-4d68-86ef-0f3d6b2c8d90@vivo.com>
Date: Tue, 5 Aug 2025 21:17:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mediatek: vcodec: use = { } instead of memset()
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250803135514.118892-1-rongqianfeng@vivo.com>
 <9f0b868c-47f9-4c98-ac99-86bfbc6a432d@web.de>
From: Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <9f0b868c-47f9-4c98-ac99-86bfbc6a432d@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYAPR01CA0085.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::25) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR0601MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: d9c94d54-9d85-4520-c154-08ddd4226271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXdCQkE1YlQzdTdOdGJZYk1CQ3c5UWpvRG9weE9Fak16bmliRU1YdlQ2WFBV?=
 =?utf-8?B?aTQ1a3ZVc3FpYk1VMW5hR1J4bmx6eTRrckJZNXhYMTc4UmpjQ1AzNWZyRThN?=
 =?utf-8?B?LzQzSmxyeU5kTmszMi8wVm82RHFKbk5WWENRQ3U1Nm9VUzhzYk0xYjNpR2Jj?=
 =?utf-8?B?R3VmR2dYTzNiZk5vTGVxcWNPMHNZYnlvcEx2dDVLQ3lWZGxJMkdqRFB6akds?=
 =?utf-8?B?ZlZmVHFFckZSTG5pWk83YkdNK0xSY0tYa3B0enhDQXpKaDdzMEdtWjJHT3NL?=
 =?utf-8?B?ZmNtRzNONzgyaUxoSkFIVzlBTkpBU1lNYVlDTGN4RStJQjBZSzVEL09YVStN?=
 =?utf-8?B?b3hTSUY4U2J0bm42bEhmZjh1bXZ4MlRuM3BuYWJTY0JGZG1TVEtDQkxRVW1B?=
 =?utf-8?B?S0ljMThWV2RteTAzaXA3R0tuK2ZaN0NHTGZZclZpQ05qbTQ2VHVOYUg0SXJy?=
 =?utf-8?B?MGUyT1lnakdZQlVrWWhwcU9jT2FXdzVFRjN3emdWWFlwcFRDWXNmSVJqdjZW?=
 =?utf-8?B?WU1HMm5oVEh1Y3VpWWJNZFYyMTVMN2g2c1daT25zTEZqSUJXYS9ic3BrQVlv?=
 =?utf-8?B?YTRmSUUvanNTeldoY0hrTkdkYXYrZHpOYVozZXlidFNJcVd3WHpKVFU1SFZO?=
 =?utf-8?B?YkNNa1ZEbVdsUTBFU3FKdkpBSUlpQTl3QWRDeHp2MTc1ZTVESWk1aldrN2xp?=
 =?utf-8?B?dVBWYTZaNEdWc3RSN1UzcnlKbEpMelBaZm9ud01WblZZWGpBZDgrOGtYTHB4?=
 =?utf-8?B?bXFXWUN4SGRpMFBMTHkvVDlDemgyWnc3bWpWbnViaDJYYXhvUTdwME45UG1x?=
 =?utf-8?B?YXBqSUtBcUlycmEyWXFDVjRQRXk3TnRreENUVVZHWmZDNVVzQ0ZYYVYvT1h0?=
 =?utf-8?B?a3ZSdktmWkVqb283NzVQN3NiSzdzYzI2OEs2bDA1QkdjcDlmNk5USzFqbDFM?=
 =?utf-8?B?d01kQlFJRUlWZ3h3dURJeExhNzlpS0owYzdsclR2L3AxbUxjMzdYSHViQ0Yy?=
 =?utf-8?B?QVpDTzRSb1Y5R3hSbjhFeW5iVnE0RjM4aFlPMlgwTHcxK2lhbmRINFhkYjFi?=
 =?utf-8?B?MGZmcnV0NTBkNVZWcXF2Z21KSVdxSHFVUEhRRkxSTGltQmg2TkxBMDRPbjdl?=
 =?utf-8?B?M0lVSXNteE1nZVlXMk1ObFF2c1M4c1NKWFQ1SWh2cVZZdGZPaWpraExNNlcv?=
 =?utf-8?B?cTNyQzNTZFlCTVR3eVlNenhxVm5hNkVBWEM5MldsZWp1eis5UEV4aXdsbHZ4?=
 =?utf-8?B?SGlRbmFmZ1lSY1JhRmtseWo0VFRYcVpaaVg2c1I3R0lGdy9kVjVqN1hWRVFU?=
 =?utf-8?B?aE82czBucE84TCtNWmZzT0JYQlFZRDBoWUpLOFlKWW1EbHRhYmFpUG9qVjJt?=
 =?utf-8?B?NFI3QWdxZE9lTm5ad0hYb2FaZ1EzRklwWDcreklTWTdhcUxjUzNQSjkzNnN3?=
 =?utf-8?B?WDhDWEFuR3dSb2t3ZFpGQWVOYkxFNnRrMDlQU1FhQ3V4WTBycnpaeTFndzJV?=
 =?utf-8?B?TU03WXRndlNXdDZtV25zOVpycW9CdmdWYS91Y0xhY0VseDErbC9SNTFpbmpy?=
 =?utf-8?B?c1RjTUNJSGFVa1BuMHk5SWZTU0YrM3MwQzQ1N2pUTzFueUxCeks1c1cwN2d6?=
 =?utf-8?B?MXBCVTI5VzNPa1FUYVVva0lDTWg3RnZVVXhiaUJPaGgxRUFFc3Q2cXNML2Rs?=
 =?utf-8?B?bEdGMk0zNXVVQVdXazVFaFRqT3Nxbkl0RlpHZmZBUVE2ektVanQ4QlNWL1Za?=
 =?utf-8?B?cDdDQloxMzZLMzVObXdjWkhkUzBheU96NHBpMWJEUGJ5akVoNnUyTW9id0I4?=
 =?utf-8?B?ZzBCQ3ZkT0VoV29OWkQ2a0cxOXVsdDVDYWllZHByNGcvcStoMnVramc0aWFV?=
 =?utf-8?B?YTI2VlpDeVNQbHJ6NGlHckdGbzFZbVFHMmMweCtoOUw1Z2szU1pMOHBUWWh2?=
 =?utf-8?Q?k09DT8SCUDs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnZKN3Q2ZkNKQTZiR1hwYXl0U0FCSWkxeFA5cVgyVnFLVzBiRmZ6cXZmZzRB?=
 =?utf-8?B?azlzM1BJTldTeWVPbVUzMktacmo2bEZ2TnFtT2pRZG4zWnBRM0w1eE1ESytk?=
 =?utf-8?B?ZHU0ZlpUZ0prUnNBZnNLNnlpOGRMR0YwNGxnQTRTUG50QVhWZ3NpV1d4WGZy?=
 =?utf-8?B?MU02L0FjWjlmQWw1dlhBc1BFdlViZGNrT0l3UzBIU0xrSHUrTVYzWUsrUHND?=
 =?utf-8?B?RXR4MWV6L2M4bHR3U3RGVXQwZjhRUFcyNG9VUWVpMGRuZ29EemhNNEtqdmdP?=
 =?utf-8?B?TDg2RGYwQ0xMalEzZ01QZGZSR2tGSURQWElZNDNpTDdwdTE0dmdQNUQ2YmUx?=
 =?utf-8?B?WVF1MnFWR0s0UGM4c2Ntc3F6b3RaRGZQblVnYXlHQ01TRVVwOEV6Y2RSdTdO?=
 =?utf-8?B?MHRjOHd5TC9rWFpqTVo0U3hGcForWWxnZU9OTkdrQjdJbStvbUwwSys5ZWNz?=
 =?utf-8?B?NEVvSG9vZ1V1TzRRWUp2SlVrVCtSR0hUcUI3U01PbFNPWS9GNTNMRGtyYStK?=
 =?utf-8?B?V0ZOaDFjQ0hIU0N5TzhKOUUycG40VGpCM3RQMytnR0ZidFJxL21wdDlQY0dM?=
 =?utf-8?B?TkMvMFVuNXBXQUFuMmxOYzgrMTBBMmJFTTVOSC9SSGFBSklnMnZWUFJpeVdk?=
 =?utf-8?B?TTB0c29MazZGbGx0N3FZWGRLN1BndkFqR1RCTUZidEZtdjlDcUljZlg1Wi9U?=
 =?utf-8?B?VU9sS0R0bmgrWlM4Wk9nSldrcnNuSXhMUS9QWGttTS94SmU1aGpOTjN6NFor?=
 =?utf-8?B?eFFDN0VvWm9YdHllNVdKR0VHOVNoRTZ3eXB4c1lQRHVPNzAzdnQxN3ZZRFB1?=
 =?utf-8?B?VStRWENuVFVkbytzQkdQWU9hdXJ5cVFPWUd5NGVsR29DWFFWOWx5czZ3TVh6?=
 =?utf-8?B?KzUvZkhVWEdmejdJSHhDcTIrVUtnbm9JTTQ2SlFoVXFIQjZNNzEvbVR3RS9S?=
 =?utf-8?B?QllydkEzUGVSUGVRa0h3ZWFJTHhCNnJ5a0RJZStXRlJMdWkydVNReS9neVM1?=
 =?utf-8?B?T3dkTXdKV2ZqU2tqU2dPUzBhZFhwUEpHVDMyZVlHTSt2aGdIa2ovRWYyVExj?=
 =?utf-8?B?MlA2R0dEOXdJVTNmbEpWV25LcXUzNTZ3WFIxR3R6bFAzM2pGUm9YY0kvR0ha?=
 =?utf-8?B?dEwwSjBJZDUxaXIrMUF5TU84QktSdzc1QjRvdmJlQ3d3Y0RiMEJKWkdRTHdY?=
 =?utf-8?B?L0hGMGsxRENKNnYydi80RE9QMUZ1T0ZJcUNxU2hJakVVUXdkV3V1NXl2djNx?=
 =?utf-8?B?TExrdHlPMGtCV1BYOWc1aDJUczFyYjcrQkEwRGFQaGpLcDRtLzJRd1BGSUtk?=
 =?utf-8?B?U2JZSzd1MTB4SmdnWGxUd1ZMYWMyTVRVMEpoZlNkdE5YQjBlTG5qcGNaWkdY?=
 =?utf-8?B?M2ZGSFpoNkFCemU1am9tT1hSN2l0Vk9GRTJ6T29XRFN5Z05QVjNYSlVtSy95?=
 =?utf-8?B?ZmZqdHo0YWFSMzhKeU9pSmxNYk4xOVdJM1VBOWJ3S28vRTdNSjlUU0dKb3FO?=
 =?utf-8?B?MkRGRXViQ29qTHlOUU54eExWMDY5cHRUbHFLbHMyRWdIcFkzeVNYWlpYYS9x?=
 =?utf-8?B?L0x3cFBTckM4S0NKK2dzQ2VOdjU1OGpMN2FZR1B0VEFYWWx2QUhFQ05rNGVE?=
 =?utf-8?B?Si9ya0lRT1VPQkJNeWNYcU9razZKcnByMXdvNHlSdm9qb0lLaXJtY01zSUpa?=
 =?utf-8?B?NEtqTStkRnUwdk91d3cvb2JrQ3lPdnpyTThia2NUMzgvTzV5NTJnZTdIVUEy?=
 =?utf-8?B?OUxEWGxCN0ltNE1YVzhYay9pOFp6TU5sY1dLZjlVcjFrRytMd25IWDFlRWZO?=
 =?utf-8?B?Q1NyNGdCOXluSk1Fa2hqWTFadituK004MDdzeWVvSUtDaVlQMWp1b3I2SlRT?=
 =?utf-8?B?eWkxWStGZ3JOYkhVOWF0VTJVcTdRanNrVGRTQXNqOW1tOU5oQ2plTnFvVWpO?=
 =?utf-8?B?Q1VQNHcyOUloZDF0Ulo4bzgwQkxWbjJkWE5iMWdjazBZSTJFcjlBb2dBUi9P?=
 =?utf-8?B?M0QvdjdoRGRPWm8xS2dBSWJpT000VzZEcVFVRkZRUVBUMEN6SVcwR0tQM0Ni?=
 =?utf-8?B?bTFuZWRxZ3grYjVMRkhGMFlsaitydmRoR3dvOU1wWVhNbGphL1dnWjZFeEtO?=
 =?utf-8?Q?dgpT6iQbeSgv3kvI8NrVpa2MR?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c94d54-9d85-4520-c154-08ddd4226271
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 13:17:10.4014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1pZS4Yt2mOfhF/tyC6varRsvqUjeZrTZse1UM8s4ZokICrzQOqH+rLiBbrLY8oi8zKokGNdUHD6nJhcf9oscEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5774
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_061722_477960_7724AF7C 
X-CRM114-Status: UNSURE (   7.28  )
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


在 2025/8/5 21:06, Markus Elfring 写道:
> …
>> This patch converts …
> See also once more:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.16#n94
I don't think your point is a problem here. Please focus more on the code
itself. If you have better suggestions for the code in my patch, please
let me know.

Best regards,
Qianfeng

