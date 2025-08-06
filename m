Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0864CC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 07:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L98w897Uddsx+6rSkLlxpur2QSYXDNDLcQYgUoyrKbg=; b=TMab+aDSBrpPxEcntVcthKX2oD
	a4QDH8i9cnbaTIAWJZcl6QNhhlBsbf8L4s1PRtrqRZbLlAyhVECxhQQMT/ciDyuN5nK6hnFNl8CrC
	WvXJAd2eQD7ye+/9s4LY7CFfgw7QWcAerMeIMf4a1X4CtEv7fD/KIzvQ8QEqe4te4HxzWw4Lh0MV5
	yEVVEN56D7l1Zy5JOqhMfH2oCZOtaikNj9cdg5p3mbsznQJoS/oTqf8FX2RMcMib4UmkhTzraIqG9
	Gdpbt226nNoQW1ORLm7NT+VTTQVmvjbU/LQ8og8GfIvURp3jvrTKZgQipengYF+NXPFDIg1Vn5QMC
	GZ6dtY9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZ05-0000000EZL0-1E2p;
	Wed, 06 Aug 2025 07:55:53 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujYxa-0000000EZ8S-1Mvk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 07:53:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2CCSWFVXAucFFN+4tz7MgnlIE2ZrYHlfpsnhgb39QkaS+kXLTIA+4DtppUrCrtiI9PbAGnxBcMgqVJ/GV7q3iRamVw+AC+Tt/TvZ6VLIEmRX/7GnRtTYleR1+2GokQaHmfdygf0uvr7X19zcNDb94+4qbFSP9E+ufPyx1IvRowKWvecQpAdcGMaua1kzne5vhUdCFHtMlsSLx1sQkUja5tQX05uFnxIbnCnwLGyPgsltQk2z7prSYfi6Bn4gQmldKqk15zEEh5cqAzVTVeX9CNCYzCsBEzxxla2QPkOLZYEPm+Ikw3JBZ1wiggn4A13gu1EYhS/40zhqW2+DwqwTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L98w897Uddsx+6rSkLlxpur2QSYXDNDLcQYgUoyrKbg=;
 b=SMn1hLzo3zI9idJ7C8YDNvOTVMHTre1PeHTrwJYfSL7++E7kS3oAzEAr1nrimBf3djkfCNzHpXZphpe6jeTyuOP8KMDRNXbUrx8ArVwooBgDhSsoDGgfydhvro4p1TKJ0EnuY5JY8zvT5cxMK13gHzWrubh9mUdNxH2JwBe9VtPvrJzadTWMsw9dFRMxuI9H48uu6pKVFqR03NFiNm1xAaoKhshSYJ6LUYhukCStBTBYXhEdxQFp5AIYYB06kXegEs7Y0hr6drWj4zZaD1S2jRNhJ2qtjckzOKc30VW68/zE8upK0txQOWYViwiFiO9jltRMMJKDDGMDH/wMqKQAgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L98w897Uddsx+6rSkLlxpur2QSYXDNDLcQYgUoyrKbg=;
 b=RpvNc+26XJ7IOc2mmPUKFMLxytk3jhxZnMhB59SZ918eF4lkYNLx4jXa2OtLgejS7QeLI/0TeR4wTRzLfJQ13s40fHeUguiBUw+NFvPGbcBzSPq4JWP3TYXPtfwZxZKTyRL78f8rBv8KVeUTFcfTKvsqa/TRjO/RMDeTHgHSYGsihbrnIZfRIwuXCCCwSZXyuU8eCt71vrUsDsvxF0k4c293CtmPU0lAVakOQKCI9ZpPLTKYGLtTiZjtdlSSdABBw2F/qqMnc1Wll/dMRr5xsT1TeXyPydgqBbMbuwTz+S9DUYfOZzK/vcB9nnPRKssYDxpChmjteembW9naImTIzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by OSMPR04MB11294.eurprd04.prod.outlook.com (2603:10a6:e10:93::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 07:53:13 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 07:53:12 +0000
Message-ID: <54095f77-89d1-4d91-ada3-e3c04ac49967@nxp.com>
Date: Wed, 6 Aug 2025 15:54:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] drm/bridge: imx: add driver for HDMI TX Parallel
 Audio Interface
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lumag@kernel.org, dianders@chromium.org, cristian.ciocaltea@collabora.com,
 luca.ceresoli@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <20250804104722.601440-6-shengjiu.wang@nxp.com>
 <fa455148-a071-4433-8c9c-26add3872604@nxp.com>
 <CAA+D8AN9Ay8jnSS=h3G_Kepc_5WYQRAUrWmtu5N056GsnvGrTA@mail.gmail.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <CAA+D8AN9Ay8jnSS=h3G_Kepc_5WYQRAUrWmtu5N056GsnvGrTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|OSMPR04MB11294:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a6f422-fb52-4481-5132-08ddd4be4aff
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2tzM1h1U3hNZWhWQXFQYkZERlpEYjZ4Zmpkd09JWE90d1FQWXdJQnFMdTRL?=
 =?utf-8?B?Y2RBMzNyZm1hV3hVV1ZPTmplbEl4Ni9Wa1JTTGFvUUhaNlViaXB6eTBvMzhQ?=
 =?utf-8?B?ZmNtMHVnK0FGVXpSUnZBNG92UnVHNWZIbUU1bUtiZ05wRDQyMGN2Y2JLRTd0?=
 =?utf-8?B?NjlzNE9hYU14ZTlLNTM4VVBBZWRueVk1VDg4VHF4dC9McE5XZy9FVVdvYWd3?=
 =?utf-8?B?M0xQYitTZTlpcW4xTWhHTXltN2VjNXZiN0JVMkR3MEZGOEg3ODZ3V2Q0cldU?=
 =?utf-8?B?dmp0d2UwOTFnVUk0LzBVQXgrcUVSVktqRXcxUHhDaTVlc0M3dkYxaWJxTkRJ?=
 =?utf-8?B?Z3U0b1ZxbVc1MTl4Z1NDUkc0c2dqQzlOTGczaGxkVlRzWUJVUzd0M2dOU2lZ?=
 =?utf-8?B?ZUpReWtPVlZ2cW9MUzhYVFJNVWpmWDgwRU9HNXRzQUYrWjNNeUYvSFByWnBX?=
 =?utf-8?B?UGsvYTNQaTRCbjFCamRqSG9BM0ROMnFFQWxIbFZUKzlENGZ1d0FjdnRwZTFl?=
 =?utf-8?B?aEdUSnBnT3oxOC9EVjFNSjZudGRueU9IcE5rM1hkZlJNTUNWMnlsQXl5SnRK?=
 =?utf-8?B?eWdwTXJFTzd6Myt6eFVjVWtnaWF0RjA1N1BoTm1GQy9pUExQbldNeU83U1NU?=
 =?utf-8?B?akV1SHg1NlM0aFV0WUxGVmQrSTJLd0Q3ZU8wdG81TTE2ak5QdC80OGdhNW1V?=
 =?utf-8?B?NW92QmNROWZveDJEcTNBMnpGdExRU0kwM01meEVMMlBiYTk4VEd3NEpyd2xO?=
 =?utf-8?B?T3hXRzgzOUdYZVU2aGQwL0p3NHRTWEM1STBueEZqRS9BSUZ3NFNXK1ZwVDhh?=
 =?utf-8?B?UVNqRnRxRGFQTy8vb2ZoK3VZZHY0QlNPVDg5VDgrNXRQdzZESWhIRm4zazRM?=
 =?utf-8?B?ZmdYTkJEbkx6eEtWVy9wbzU5Y2JuQ0ZrMlh1Qk92emtaMnV5QVMvaEs5d3BL?=
 =?utf-8?B?TWFnVkNsOUYrbjk4bHRySTlYVWFKbG9zSHpUbTJMaVVJb1UrUFJML0FsMjlB?=
 =?utf-8?B?OUVidUtpZ1lzNktSMkVyOGpLcnJoUUtZUkhmeTZmSFhjSjMwbGZYSTVzU1pC?=
 =?utf-8?B?bmdjZ0xaWnZSVkRqcFJHQ1lNekpvS1kzblEyaHFBd2l5d3ZlK0Y3MFdwTUs0?=
 =?utf-8?B?Sy9OblpIU2RlbkRHL0lWb0pmU3dOcG10TEpuVTMxU2UyYVlVbEpiQWtkSWcz?=
 =?utf-8?B?ejhwVmpIZXpPTnVMTlp0Z3JheW5rOFJzZndMNElFZTBFMG9nMTdXZ25kT1BW?=
 =?utf-8?B?b3RFSm10QjFDeVY0dGErTHY5Y09YUGgxcFh4Q0J0Z3lqRThMckFqajROSnNJ?=
 =?utf-8?B?TmhQQjdxcytTd09OUTliU3oreFZNdmd5UisxdEsram5PNHpJM1ljSG83enlN?=
 =?utf-8?B?VGZyb3V0eEZSbHc2SytSUjhIc0hvdDFqMHNELzQvUDFsK2ozMTJlNXYrQXZn?=
 =?utf-8?B?ZDFkdmZKTjNhdTYyYW9oRmx6LzRIOENFOWVDS2c2MlBSRzU4a1JLZXlPUnVw?=
 =?utf-8?B?dlMvNVFlMjhJM0VmdnZPV0VTdVlMczlPTUdnUFhOQjV1ZU1NRy9OeFBhTi8y?=
 =?utf-8?B?ZmMrUHVuemRBM3NSajc3R1ZBdjNpWUxDQy9KQVRER0ZqNCt4b3BKOWR0VG5l?=
 =?utf-8?B?SVJsZ3d6eHgrWVVHNjhOWko5d3FhT2ZEVkZnalRUMFJVNU1GeVkzSHRaekx1?=
 =?utf-8?B?ZUNnbTZZdjdJWnZTR01EelNqK3pObm5hbVl1QW9GZENZSWVONEtZMXJhcWhK?=
 =?utf-8?B?aFRUU1RCUFFPNis3VllsMmFiakJSbXRMUGtwM0lFdnZDakdjN2FSVm1KVXdv?=
 =?utf-8?B?MExzVFB6WEtWYURzNjlpYXg1WVRuQVhJU3pYaE9oRERGbXZKVTA5cHh2WHF4?=
 =?utf-8?B?V1ZieHlrOVJ1eXUrMDRWSjdWT1R5TCtiT3hadXAwbDVEWXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0FRTVNLNmdPeW1hN3NIRFNMUXhLVlhSdGk5VUhRTkIxUzRQMEFybE4vSDFt?=
 =?utf-8?B?V0xjdUNUT0NIZXNRT0xrd1ZMdUVTbFVCVFpCSkVPUFBUY0FKRWlOVDJPeEhK?=
 =?utf-8?B?R1dQc1B1NUJmR0l0dlhIaWtnQmkxdVZlSjdQcGFoLzZoc2lYNFNrQld1VG1s?=
 =?utf-8?B?d2hSOW9jNXhQOVR6TTNKR2ErejEzbDFBeWFHZnRUczlpdmtIRlRRaFUxdWhN?=
 =?utf-8?B?RXpKTWg1RDFEWDdYNCtKVEVNYzhLZTE2V2VwemQ2K2VQa3JwQnNSNVJxdndI?=
 =?utf-8?B?TDgyamcrSnNUc0FqdzExMElxY3JPb0J0VkwzQUdLdUJUV2YyeFJPVm9UUXBi?=
 =?utf-8?B?WU8rekxyNXIybStKdE9BMVdyL1dMSk9WV055aUFORTlQa2JuckFNNlY5eVVz?=
 =?utf-8?B?eVh4ckVGbXlNZmJsTmkwL0ZTWUVXd0lYRlZpbVFEbUJzdEtsdnkxTWppaWkx?=
 =?utf-8?B?SEV5bVBmN0RubGwyaHd6YXBlSmVFV0czK3A0SFRycWlwa20xYk1FcVRBSXln?=
 =?utf-8?B?SzdIMlRVanJGcTlyME9tekZwUEdBaE9RSGNKWjVwZmFOK3hPVjV6SzB3amxE?=
 =?utf-8?B?bXl5cmJvbUJFZjRYb2VaUGtadHVxemV1YndWQmlJWlR0OGlEQlhxak9iQXZ6?=
 =?utf-8?B?V0lCZ2t2NUltMHU3UFFidTFvQXdtTVhoQkpwTnpnbDVaYjhsTTZPQ21zMGVV?=
 =?utf-8?B?THlLUGdXRjJHclkyRy85blMwZktKTmZyMElxZTVtZnhJZE1IVFZ6bU84d2J6?=
 =?utf-8?B?U1VlbDFiUm1xUDdscld5Vk9CRmgzWXhJeGJTajVmMGxHUWpvd2tNNmZlYmZ3?=
 =?utf-8?B?UDZzNlJoNUlwdTVadUlwTTZMQUViSE9Ucm9ZMnpFaVFUT0R2ZEd0STRvcjFI?=
 =?utf-8?B?NnMrZ3lNVXIwald1SXVGU2EzcEpkclRUSTdzTGw4WUpMMkVVY2l2NndMQ1pQ?=
 =?utf-8?B?bGN6emNabHNOWWpTeUV3SzZwcVB6Q3J6M1VTUjYyQzBzWlhuZkxtaFcyTmQ2?=
 =?utf-8?B?QW1yTm0xcDU0OEJPajk0Y3Q3blhyZTk3MzBJbW1qanA2VjkrTngzN28yb0RD?=
 =?utf-8?B?c0lqU2c2dlJHTU5waEJWM3E0U3V2bjRtellMT3Z0NjNhRndVOVU0Z0VsUDRI?=
 =?utf-8?B?YzZockpIWW56QXdNYlpIbXhxQ3QwZjhwdW94Q0RMOTRmdGdweXBIR280QndQ?=
 =?utf-8?B?eWxydkZabm82QXJWTTcvMUplS2pFSStmU0x6T2pKN29FWVRkdlc3ckJUK1Q2?=
 =?utf-8?B?cno2NE52VzA3UW9PNk9Ba2JxNE8yUEViSjhLL2xabDk0Z1A3a2JtbjdFQlBO?=
 =?utf-8?B?Wkd2bFR2eHhHUE8wSVJRTXJIQjNaQmVVaFZJbm0wQnltWVkzN2FqdmxMQ0Y0?=
 =?utf-8?B?WVppYnpPK0wxWE8wZkw4REVjNWc3d0hpc0FvdEJESmVVWWNYL01rZGJoMW1a?=
 =?utf-8?B?bG9oRFdHeTBKR2grQUpPOStJb1NMa1NDT3RXTmx2NWx5R0NndTdoUkRDdm9r?=
 =?utf-8?B?R1VPb3hRbE1mLytTT3VjL0NFeDBWNVJWWWVrdmRPSytXZ080aHlmSWJsSEhE?=
 =?utf-8?B?eW5La3M1aEdRcnpFaklmNEJuMllzQlVTdnl6WlNHejBKMDVTNzkzUVpmQTFy?=
 =?utf-8?B?RWJPdHhBVkpWNThmSE5KSGIxQjlzOWdmUS9wejhSZ1h3T0lXVjlZR2ppQVE2?=
 =?utf-8?B?RmtGbkNBRnVyMjQyeVViblYvbVRUZlhTRGdGWlJtQ3dlOWdQSFQyakJMc2ZZ?=
 =?utf-8?B?My9PMW9MbDBoSTJ3WlFLUzJ2Ykd3TWZOaHpoWDEvYVVCZmk3ZEsxV0Nna1dC?=
 =?utf-8?B?UHBPbWRlazU3cXZWUGQwdm9xS3p0U0p2emJoaGcySmRaU0Y5Ump0S2dsMHFV?=
 =?utf-8?B?SWNnZmJxUHd5cExQRjYzRUpYNmF6ZHAyallnMDFqWUgxNUJIVXNSaExFbEVk?=
 =?utf-8?B?M3oxU3d2U1VFUUREVTlBb0J3UU1pbDZ3M2hHRFMwL0lFTEMraWZDNVpRVStm?=
 =?utf-8?B?WTF1cGwwbDFiMFE1QmFHbHRib1NNTEtidUhVZ0lvNmJSMEg5R3VIc0JDdVpT?=
 =?utf-8?B?ZUZtc0FyYXVGRStDcGdOYTcvTitsNzdBV2o1YXBwN3o3WEZrN2c3YU9wd1ZW?=
 =?utf-8?Q?5Cag1YM7c0TZyQmFHTeXGeJdB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a6f422-fb52-4481-5132-08ddd4be4aff
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 07:53:12.6970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YX1/xmvHVJ0SWQ3T6iKCW+Jq2qjKssUqWRMu5AtFmGqIe2tF7SEJvyXuDPtHqHi2soeN5GvKfuep1g6F99xuhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSMPR04MB11294
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_005318_376007_C236C57C 
X-CRM114-Status: GOOD (  13.15  )
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

On 08/06/2025, Shengjiu Wang wrote:
> On Tue, Aug 5, 2025 at 4:55 PM Liu Ying <victor.liu@nxp.com> wrote:
>>
>> On 08/04/2025, Shengjiu Wang wrote:

[...]

>>> +#define HTX_PAI_STAT                 0x0c
>>> +#define HTX_PAI_IRQ_NOMASK           0x10
>>> +#define HTX_PAI_IRQ_MASKED           0x14
>>> +#define HTX_PAI_IRQ_MASK             0x18
>>
>> The above 4 registers are not pratically used.  Drop.
> 
> They are used by regmap to make a full definition.

Yes, but they are not pratically used for interrupt support.
Once you add interrupt support in this driver, you may add these registers.

[...]

>>> +             /* PCM choose 24bit*/
>>> +             val = FIELD_PREP(D_SEL, width - 24);
>>
>> Why 'width - 24'?  Can it be expressed by a helper or macro?
> 
>                 /*
>                  * The allowed width are 24bit and 32bit, as they are
> supported by
>                  * aud2htx module.
>                  * for 24bit, D_SEL = 0, select all the bits.
>                  * for 32bit, D_SEL = 8, select the MSB.
>                  */
> will add such comments.

Fine for me(Not an audio guy though).

-- 
Regards,
Liu Ying

