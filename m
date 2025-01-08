Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB50E77197
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 03:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TsbO4wf2vlJ0I5qOQYj2WyQSbUXynGsiA2eW4zj1Sjo=; b=06BqdStOFY3VinnAbAbdxKH8ec
	iO6eL+4UDTzgN46QkIXXZ96AUpwOvIA7tkQ1rswu4Hx/0Ro0lGf8HTkd0BYSGJWqIncNoFS8s58NF
	s8cjmZVjYrJFFBRYo17LmXSxSgxYQi7hHOP/Wq+RaKHidVoTQ1sScZUUKC+YxWpM4Di/XoSdk+3iS
	PwnaAUScR9esB8zfBJR84Y9cLAPAkfHf2d6kY9t/qoTz6v5NOIbA5Ep498s9/t3SlSrsK2PNWDz/2
	as/rVSYBKdSrAe9j3AaQOJ7wlMXgHifj8ICqAHZdHa/s3mtPz57ofFINfJKyesXyQKM3c6d6YOMEh
	XmOd16ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVMWc-00000006zTg-2mbs;
	Wed, 08 Jan 2025 03:14:30 +0000
Received: from mail-am0eur02on20606.outbound.protection.outlook.com ([2a01:111:f403:2606::606] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVMVN-00000006zJP-0e40
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 03:13:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnEiqAk5ynQ3brzwTAubeez2YwMU9S71dxJn4zxJtE8Nuf6660uJB6mjDWEL0UgGFROnfQQPv2wHRUEs0AD9jiJJgHC4ds4b+RbjtsjbUTEnU2cic+7MchVCKHZOGsPXb/R/U+QshdeBVmDP9dyPcmHkqczZvpTN5obaZ//KWaJ2YDFXeLumKV29jvhcAZDvXR9fpicCPGarr6LXwfUTXHqq3lrwz7A4nR3TSwJhPnxiEMCjHMfVf5dgvLkKCs5Ao0rSE9+8RFxiahhCdNPXKSfW7JrCic1XoRsYjSJ58NIq5T8g6gy3R4gsJzyoEbmndxBpfdsj02xcmrVRkmfzXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsbO4wf2vlJ0I5qOQYj2WyQSbUXynGsiA2eW4zj1Sjo=;
 b=jd/8nzJHfSc08T9XoNaH8c6T1hqVXdxpDNzkO1jm+LjdEr5JLhqRxqchx3a1G+BDFmWhH2TRhSQ7/ujziSt6PCFEaD99D9vb6qBO19Fv22hBrmL8JyeM4abZhEwOBCSS30lcHjhGavnqsN+v2fVeF+fR5n1ad4F0cdn5xjt0MtmZFsys/G7AJOge/XqPlbq7g0gQI5DtQhsNXwY2PrlCU/laLBgWPqIUMpzgxNaIFAvKtgjv4Tiloz4fRMypAHFH8ecXwzicE0WHcw7iGlCwJeFdugaxt+W1QknnJTpmB8FjRRD7XvwgaVq49SjdHQwM2j15FrZ/eEvuK69Yg6Mo7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TsbO4wf2vlJ0I5qOQYj2WyQSbUXynGsiA2eW4zj1Sjo=;
 b=K5SvnLdOaQFVUc8kD5V1fwmS5G315k1P99lutRKY9630ZbSnz9AIY1mh7pgEDqAj9Kc8Am9LvNiWl7bRy2MCL1QB5stEHSaZrbRFlv+gKfbizNXS8+lcDanARHkU7TED94OhBx/rcVc9tnSksOtzhFfwyC9hbpm9QlVpbhKn4p72K/DemHhhFyfREhu7XIfTg1RABHhv++pwwlklijJgiHJyrOIHvVYNI9mmihBppV41cbsDcdXI/Djv5+KxLYkWLgMRY+QOvuCEKK1cWqrVL6Bzu4u+rg9Z6/EqgkyNuQ03oee1BfXD1at/uRHOhK3frsoEYtuv06xaR5zH0CQnIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB11041.eurprd04.prod.outlook.com (2603:10a6:150:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 03:13:03 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8314.018; Wed, 8 Jan 2025
 03:13:02 +0000
Message-ID: <b3499ec5-c751-4809-82de-9d937fe47c6b@nxp.com>
Date: Wed, 8 Jan 2025 11:13:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] dev_err_probe usage for imx8qxp DPU pipeline
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:3:17::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB11041:EE_
X-MS-Office365-Filtering-Correlation-Id: 050b81fe-671b-400e-fbbd-08dd2f925c6b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T29VamVpTTc1ZFVlREVEQU5zcU1XY0EzN3lSQzFFUnIwVmhKc0ZHWUFmSElj?=
 =?utf-8?B?c0JvbjJWZFFmU1RiTFVic2dIUTZEOVRQOWp2dVhYSVFONDhIalliaHpYRUZU?=
 =?utf-8?B?THhJNzNtZUZ2TG9PZjFhbVBER2Mra24rVk0yUU92cnhxUFhhd0swdFZqSTM1?=
 =?utf-8?B?VUpLR29hcUtrYXNGUDcveTdQbTRjT296OTFHaUlVTFNuYVlRdnU2QjZ4UGJv?=
 =?utf-8?B?a3pSRmt1dk9TNlE3ZkhFQlpXOXFRbW9oaC9yUk5WbU1MK0RwNlhRVWlMcHhS?=
 =?utf-8?B?OUZRSmZyOVN0YzNYTXBQQ2RRR0xFWXBBcm1ZbDBENlNrVFVlckQxcStKWmVV?=
 =?utf-8?B?RTU2SEJNNm9kaVE4eE9lRkdpcXZKdERGcEgydWJpSWp0OWFWUGxCQkJia3V4?=
 =?utf-8?B?WFVIQkE4aXZiMmExMURyeXozeWdvYnl4aDFPSXc1dXZyS29qdnlsRk5iVFNM?=
 =?utf-8?B?YjVwamRaK0gzTTNreURNY09mSFp0bW5vUXJxdzMrZzRncW9zTmJ0REdzZENo?=
 =?utf-8?B?dk5DRE5EeXhhSGVuUHZ3STVXS2VtVk9sS2I1OVBzWWRaSk5DTk5yK21zQTgx?=
 =?utf-8?B?Y1ZjVWx0WDFpWGtrRm9wRnhlTUlVdUlVRkN6SGthbm5TdHpuN0UzSFRMb0RU?=
 =?utf-8?B?WXF4bnNBVm43Y1JiUlFpVERlNUM4bCtXR1BXa0lBUWE1dXduSXpmNkZ1SjZU?=
 =?utf-8?B?SHFUR21IeWYzbHExTWhtdlJWelQ1WENiSjFnNUdPMWIzajBhSTRrRytySE1a?=
 =?utf-8?B?bnlBRzIvdnZCNjFoQTBxSE45WUVZR0VLNjBEUmpxeitDM21Ga3pIcTVHcWhi?=
 =?utf-8?B?cWJ1MHRlckVjdG9SYWF1NERoaEJidjcvYmRsTVlWM3Z4TVFjZzF6eDUweHV3?=
 =?utf-8?B?VWNzMkVsdHcvT0NxUzYxZFlxT1ZsU1BSUHd5bG9mdkdYMTIyUHg5Q3JnRE9G?=
 =?utf-8?B?Y21TdGFLdWpQQzhCNW9JYzVlTWhQam1ZQytYckNGRHdLQ0x1aGRhNUdJbGpY?=
 =?utf-8?B?L090Q1NrSUxzTjZXaUF4N3dtNm93Q3hHblBzaTNMblZidXFhTHdQS3BZRFd4?=
 =?utf-8?B?cUhxYnB3YjlrYUh2eGQ3ejMwUHFwTFhzL1ovV2RRaDhOeXBUckprcU1KWlR4?=
 =?utf-8?B?NEt4U1VzZ0NsWmxDVjNOM0pyUjJnQSt3M2dqOFFmNkgxQ1lNRUNWQzI3K0JP?=
 =?utf-8?B?NWE0RlRVcEpVbzk5ZHVEaE9IeUdTTDZWTk9USjk0aWluNjQzNkhjU2h1WGsr?=
 =?utf-8?B?SWpPNHdiRVNUbXlGc2JNMHY0K3lZZHllSEVkVklxSE1CMGxPWk15Z0lGZWxB?=
 =?utf-8?B?azBkQm0zZHRieFlwanFmSnJ5emJWa3JVcUMwb012Uy80cUlHdGJSa0Jtb3VG?=
 =?utf-8?B?TlBhM3VRUy9aeWdabUdqVEk1L0NEYjdkVStNTFJzelg5Zy81NHp1UkJtS212?=
 =?utf-8?B?K3dnODRsY2E3Wm5nbmlkeUZTSmNydHhsaW9URkdoeHlwL0Z0OHVKcmREb3Jj?=
 =?utf-8?B?KzRScXVDQitTWEJjN28xWmgxVVRuL3Bnc3hDMnNqWmxZUUVub1U2UU9vYnYz?=
 =?utf-8?B?eUJqMm5nejlQZk1YTEJUM08rTERvR0UweDZVUm5ZUEM0ZnU1dlpXelczL2Nr?=
 =?utf-8?B?OGVRL0gwNkxPa3hZOWl0UHN4OTlDTkhubUxrYk1LT0g2elRmQ25uQ2dkc2FB?=
 =?utf-8?B?akRhVmtxOW43d1pUeVQ5YzJjeW16dWc5dnZ4SmRIKzNiMGVZMjBZdHNDVXNl?=
 =?utf-8?B?N2lWR0M1ZWxYK1JqWTZwR3RUV3B5dXJMUEhpeFFvU2U1VG1rMVBEcmFRNUda?=
 =?utf-8?B?WGFEL000aFIwUytLUHllbmhZR2tHUG9qckZUZkc4RlB6RERkdDY5NXNMeUFa?=
 =?utf-8?B?a01wY2ZVckFxc1NaTzBLZDVlVFIxNzRIV2ozdXZySVVBMmJhVGtxaVhNWW0y?=
 =?utf-8?Q?BQOId3Mu520=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Smp1TkdzMS9UL0MzUTFibm9iazVnK0dwbXFWQVlvdDNBZWtHcHc4NFNNUzhp?=
 =?utf-8?B?VkJrU2h4b2RmQXJKOWtBUWVzdEpKenlyWE9SajhJazdWWlhaN1F4TG9mT2lG?=
 =?utf-8?B?TldTVnFhckpiWlRxNUVxWEpUS2ZRYWpCNjlqNmZuY2h3bFBXVjNXdUx6aWlT?=
 =?utf-8?B?bUU4aG83OFh6TVM1S1lBZmJPaHplL3V2M0hPdExISWoxTy9HaE12RVkwNmk5?=
 =?utf-8?B?bFEvbFVlc1drd3hSSlN6azBVUlBlUnUzeWZVUW00a0E4OGdNUHRrNUlxdDZk?=
 =?utf-8?B?cWhWKzVnUlF3Q2pHQnpJVlVIV2RDVHczMmEvYXc0ZGtTeWRSS1U4VS9mdmJN?=
 =?utf-8?B?VWhsVW4ySUFYVG56QlQ4TnVOSnFXM01kYXZyUkFDRkxQcTVEMmhjRlR0NVp1?=
 =?utf-8?B?aUo4TGNDSWRvYW5MaVZ0WWxKOG9lU29oSXFjYmdSQXJYcmZydnBiYnVCNVoz?=
 =?utf-8?B?eDYwMnpHbGpuNVVjV1E0MXZkd0FpTGpkVmJpQ25JQUxIRWFZNWEvcTFQZTUw?=
 =?utf-8?B?Ympsb0hOMHc3emdQR1lucE8rZ3hwS2dGenhaWGFoK09NQWN5OUY4UUtLSSs2?=
 =?utf-8?B?VHlwZ0lXMWZ6aktPMHBUY05nMlgyTG9kSEg0MG0wMnhySWthTVlJYUFyRkwy?=
 =?utf-8?B?ZGxQWm1XMXZkNVBqM0NOWCs3WjNQS21nTWdZK1B2a0hMdmFRUEJNeXpUMWk3?=
 =?utf-8?B?NlE3VlhTa3puaVU0UVhkSFBRSERaUlFhaHRhZkxoTjZBZkk5d0twLzJRN05q?=
 =?utf-8?B?c0grb2JkaE9CMXlhR01sTjBJVmhHa3ZZTFhVWU9pekxRMWhIWmtTK0lMTFBL?=
 =?utf-8?B?VkZyc0dRZjloc09WVm9nMW5EWVgvQjFvNnYxV0xubTFaUzJMVGdyTEdjeHp5?=
 =?utf-8?B?eU9aNnhzVDc3UGljK1FKV211Z0lIcHNHeThkUHFoejhaRVhpN2hVRUNGa0Rl?=
 =?utf-8?B?ek1IOXZMSkZ1TjRiaFRqaVV2T3Y1dGN0SmNKUWFWQlBPaUUrbXFhMXlPTnhz?=
 =?utf-8?B?N2VXSHNQeERuUzI1TzlxeGN0VGk0SGF0bXhzODFSOFJLZGtvZzdPV2xzelZn?=
 =?utf-8?B?MHBzdnFKNmNPVXFVQ2pvNmxWSUk2RlRjVUdXRlozLyszTm5vR3RzbFllSFRD?=
 =?utf-8?B?RENlL2pvd0JkamQxUUVXYlJCODJVNHhxbGN6eUx4Y1lPSzZ2SkpWbUtZTjFM?=
 =?utf-8?B?NDhuYlEzZmZiNFRiTkFXUGFMQ2ZQZnczcnRGV2FFOGtIeWhZN2xLMHlFbjFx?=
 =?utf-8?B?VjFIUFNVUGRHVmdVZGMzZ21mbzdiRVVNVWhPejZGQjg3dHZqc2FDaG9RVXdF?=
 =?utf-8?B?OVkvVHZzOWtzK01wYUdCd0wvemNOZDk0UUgrc01zVU1QVE5aZm8yRFNvN25B?=
 =?utf-8?B?ZzVyRitqN3VRV0NFSm9qRGJmN3ViQnloa1RZbXYxajE2U2pwbzA5enJvNU15?=
 =?utf-8?B?bE53UndVZ0tFMWYwTFhpZEcxeWgwOURJUUh6MTVzd05NVG1LRVgrdUVWTXgr?=
 =?utf-8?B?K1NXdVU5aVl6QVpsNVNZZWpLSXZaZWo3SWZvUGR4dkY1cVhiMnJ5MVE1dU5W?=
 =?utf-8?B?MWd6dXZDVkxnQmt1c0dJVEIwbzVxbXZCd1NDU0ZqbWdLUGVDVm44OHBGazNR?=
 =?utf-8?B?TC9JREpEMjYrd01qUVNJWHRrT3ZKT0cyZHpadVlleWZtQW1OMGJ5U1N0WUZa?=
 =?utf-8?B?aUx2RUFCWm5hQmdFazdFRlVPRi9XSjdubGdodUZIb0lHTFNuU2xvUjhwMWFQ?=
 =?utf-8?B?YnNZTFFZNFQ2WDJ2QTYyL3NVVTBnVGVjRTducVE0Tkl6eklSZmk3N0xoSjJL?=
 =?utf-8?B?OVBRbGFVNlI2c0xhQVl3djdHWitDSkZscnBLaHp2MDB5WmdveUVNYlZoMERU?=
 =?utf-8?B?VXhzdTEvY0I3OHgzVG1VSkhBeGlTcDhHTVA0dkNWWlUxZzM5QVlLVmpaN3NT?=
 =?utf-8?B?N09mQ0kxVy9Tcks4alVpVlo2c3dnVldnVmFqQkhOSGdDQVpTMENxK0VCa0Fx?=
 =?utf-8?B?MHBIZjlZdlh0ek9rMll2MStVbTJhZmR1RHZRblZiTkoyeVlXeXJIdFI3Nk1T?=
 =?utf-8?B?VW9BQkFTOHVaVlBlbGFyNzhtbkVBdEtMOURLYXNVQmliSG8wYkhGM0w5R283?=
 =?utf-8?Q?UYti5rZhZMJwivaX7Dwol3/1r?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 050b81fe-671b-400e-fbbd-08dd2f925c6b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 03:13:02.1831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2UcPOSbuywctFtCDiJgUGSKg6DIbdx1tMbmeE7DsYDLqmizdq4e7i/aSml2V9KdCe8tfOVQwzTyEfiYEBoDbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_191313_451892_806E0008 
X-CRM114-Status: GOOD (  13.96  )
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

On 01/07/2025, Alexander Stein wrote:
> Hi everyone,

Hi Alexander,

> 
> this is a v2 of an old series still in my queue.
> 
> Changes in v2:
> * Rebase to next-20250107
> * Remove 'imx' prefix for commit subject in patch 2 & 3
> 
> Best regards,
> Alexander
> 
> Alexander Stein (4):
>   drm/bridge: imx8qxp-pxl2dpi: Use dev_err_probe
>   drm/bridge: imx8qxp-ldb: Use dev_err_probe
>   drm/bridge: imx-ldb-helper: Use dev_err_probe
>   drm/bridge: imx8qxp-pixel-link: Use dev_err_probe

i.MX8QXP Pixel Combiner is also in the pipeline, so imx8qxp-pixel-combiner.c
needs to be changed.

To achieve consistent log upon probe deferral, i.MX8QM LDB bridge driver
imx8qm-ldb.c needs to be changed too, but it can be done with a separate patch.

> 
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c   | 13 ++-----
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c      | 37 ++++++-------------
>  .../gpu/drm/bridge/imx/imx8qxp-pixel-link.c   | 19 +++-------
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c  | 26 ++++---------
>  4 files changed, 29 insertions(+), 66 deletions(-)
> 

-- 
Regards,
Liu Ying

