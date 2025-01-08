Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B815FE77197
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 03:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EgcU2n+umiWmUshYYFG/XUuuD8F19PC/O9zBeqVaXTE=; b=3DIMBhRB5e9/P3kuSerVhO570G
	FVL1WDuskOGCOyQE1DEKkI/fSu9kxfqYrWrhH6Q/zDN4nhEJ9M147YuEfl4s4jZ5EjZfIfpTYk9fj
	vmAmysdF2u0oTJDZt64IguVm4bYZHrTfGq4I950JN5a80iA1DGW5sdXSeplGNpftGJHQR9ZsKfdwx
	boWBIMbjCvL4H/qwl0YavKVipqOGwx0wUK+Kk1MilIWPktYbTc3NGqtw9chSqvNUlr9w3w6iIeFB9
	muKT7TpWjZJelye77Nk85CXPqrcAeXct+X+UAweqmMeswVDvNcjLyxUm7jDBAyVj0LFTenlKAJ2PA
	KLilwvBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVMx7-000000073It-3mDV;
	Wed, 08 Jan 2025 03:41:53 +0000
Received: from mail-am6eur05on20629.outbound.protection.outlook.com ([2a01:111:f403:2612::629] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVMvt-0000000738g-3MX8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 03:40:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWGNZ5+jdv9elJmlC3uSJtK/9AefXS0lcfHtF0oLwX5Z113NBgSJ8rW2HzVWd2QgN+SC58dlkg4aatxj+br+5nIYZrEu5ZkfoIbqc94S8FIS09u6ZCTSuddvSr2G+Zv54ZsujQubH8LldKzYU+oAwoMYBdiOW0HIKTxPeN8gW78DTalMftY76lzd+bYKoFiwqC1U5C1oGUNjxSgApjwecIAtQgrZJnMfEY6LMkPoqHJEFEQlpDXZB2/HHY1E5Zbbhv7jUnfhtcFad5P7n1erviHENJBqByYy8BpVU2PHJf9omUhAsmBEPWti0jYPvy+hnJGNSOAvSGVTnyFNmx+KCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgcU2n+umiWmUshYYFG/XUuuD8F19PC/O9zBeqVaXTE=;
 b=ZSkOExa326WnKl1dHnI/vltN9paWX5qH1QyRmt+6KEAmjjoDxip9UyCryHh1OFOFc3B9Ij4dLtNNNO0/IKzNKQOaPoepAXv/wZD38iScKr3D0t7lJ8IH7x8UoaXYn/YQCCR5CPsBw3MJZ7N3QWE6QV6Xtvm+T6gqleyG3lDLPNBjO6V4YD7TnT0KPrV7sAdODVw/hT++Rl/dcPEECp1mH0U8yfRwQorU5CL1DEOVM0lkiG9IRbvulFVWgKsD6CerNiaDv8yfz08rsbF55LbTPYByq/5SLXpvXrOKKsadxSJ/IO/A5u9la5QaRopFSr3GxAJV0k1s6R0WKo21I7CKuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgcU2n+umiWmUshYYFG/XUuuD8F19PC/O9zBeqVaXTE=;
 b=iajMCAEOHu/L64VjnCNbIvsoLVWc6vHJZztb5D34gEv5HVejZTzfErV3ubRN+aw3thrnbOJSBqly0mO3IUrv0Cu6aK3P3lnGflXx8YNqhYfgQieRodhM4+7jU0xh+X7iq2IB2c2U5SLtvuWM2s+lmbp9zBAHAOeA0TRp3eHjTSpyuhxHHA/HcQKAEthHMz6LlTH74+OFMgV7cPqRWjJexI0TNmXYf3lENM4FhQYDHzCjrFikP1hwmRoVAGrakHKLh7wJ5L4dJCvqJG4enVYVgSrPlAFjccLonDXDdTrMbhOfDBSW3eEabBzyMMMLPSmB4veMHtHww0wWvsgRMx4Zlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS1PR04MB9700.eurprd04.prod.outlook.com (2603:10a6:20b:473::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Wed, 8 Jan
 2025 03:40:29 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8314.018; Wed, 8 Jan 2025
 03:40:23 +0000
Message-ID: <9a0cf93f-394c-40a5-89d3-bdf4f8d26b9b@nxp.com>
Date: Wed, 8 Jan 2025 11:41:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/bridge: imx8qxp-pixel-link: Use dev_err_probe
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
 <20250107143900.988567-5-alexander.stein@ew.tq-group.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250107143900.988567-5-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS1PR04MB9700:EE_
X-MS-Office365-Filtering-Correlation-Id: b739fae7-24f7-4cb1-d3ee-08dd2f962e7d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3g5Vmc4bHlOWndCZ2g3NThCem9IYXVZVnpwZXBDV3BXakNROFAvMktQNW82?=
 =?utf-8?B?ZE5oV0hMS0pCMkdDWDUzSWF5Nk03ZkN5REFDMUtCUnp0MmJnOHFDNUdsbnYz?=
 =?utf-8?B?OVluV3hJVEZOSVVHTW1pMmZ3NVJlKzRWWGVZak0xZmdsSHIyYTdnTkljQ0lB?=
 =?utf-8?B?Y2k0Y3VHSXh0QUhhaDhJWTdEMU9kSndUbTQyUDJGVHdGbWc4bzZVd3VmWSto?=
 =?utf-8?B?Lzc0c3BqbnlKK2dGQys5Z3NFZ3RudTFSVE1SUm1vMXlhYlA1VzRLT2gwVDVu?=
 =?utf-8?B?ZGRyT1NkQlVNK1RiZUx0cTNGR3k0R0VEeUZIR2RtUXYwN3NRQ3d2d0t6WUtx?=
 =?utf-8?B?NWhoOWhST3ZCcm5iUDRJWkNOZm82bDJLOVVrQ0EyQTFyaTU2QmlXUHBFR0xN?=
 =?utf-8?B?ZmRFS0V3NG1XdW1HNW12NWZmRmx4QjJqaUNyRUhSM3Z6cFVNNkpwRkp1cXRE?=
 =?utf-8?B?Tko0M0EyN3grZkZxTXlWbU1xLzZ0czdJcGdvY3d5RUZ6WThpeWd5ZDQzUUtp?=
 =?utf-8?B?MnIwQlZtemxsYXdqQWZHQnVyU201Z0hVQm9UMTVWMU42cWZ5MVpFOHpOMWV5?=
 =?utf-8?B?MUhra1hieVhENVNHeGliRzVQOW1adURzR2NPckRDK3dMdUNYaWhRUlRBSDJl?=
 =?utf-8?B?QTQxdzVBdlUybi9jZ0tOVi9JYVV2OVJwY09xTzZBdjkxVFFTOCtwUGpDWUlU?=
 =?utf-8?B?ZG44akNaNVZpSUIralRLWk9RWlNKcEN6RHVmd0Q2S2JsUDZvN0RNZXMrUHJZ?=
 =?utf-8?B?ejVwVkZOaXpWbnc3bzNMajRXeEw4Wjgrd1MyYm81dFNZdGk4Q2V6SXY5d3pP?=
 =?utf-8?B?VFFOZHhzcEVwTjZ2QVZFK2V5bEVWL3hDRllleldka1VhTkgyT1pWbFBWaURi?=
 =?utf-8?B?SzRjMkh5c21hZVdQNUlqOFNTSnhoZVRTWXBIa0ovY1VYVjRqQWJPNW5oOGdy?=
 =?utf-8?B?TXZGaVVLY3pPaDRub01YRzNSSUJjTXZjZjVvV2taOXpnS0tvbjUremJocWV1?=
 =?utf-8?B?WjdQTW5QWnV3R0QwemRPY1lpT0tWVUJaSHJ1U0h5NmxMREVNdk9DdlNFMENh?=
 =?utf-8?B?c3hBejBIZG9Ua3hZQXhtWFV1VWtoUWFVOUFxdnVxb0tFTEkzcEhkNmZ5WEo3?=
 =?utf-8?B?N3NVYXRlUVVKZ3hxL2N6TzRtbGx0Tkx6Z09jd3hITG1GTmJVaHhQUmFoYzdL?=
 =?utf-8?B?N3NSVmYzakZCa0xHM2FaWUI1U291bjVad1E3NFhpOXNDbjVWRDV0dGc2U2ls?=
 =?utf-8?B?SEFvelA1dkJRY0djT0JNYWFTQWNhY1VMTzlrWitHWWgva2c5dEdzTU0yYUwz?=
 =?utf-8?B?Q1pEZGJTbmNLSjlMZS9IUFR1eTZMR2hKaitxd2F2MXJaUjJLTCs4V0VFckpW?=
 =?utf-8?B?YTlkZzB4RW1PZGhodjgzN0o0S0MwQnB6YTlEclJGdHpSa2VRamNmNmpJWVlR?=
 =?utf-8?B?dDAva0lScVBWbkg0UnlySENGdVNCaUh5cGZpTW1YblM3b0JnSDVJUEM4Ykxm?=
 =?utf-8?B?VWt5RzN6WE53U0Jodm9jNjNxR3o4eVo2NmxTcFJHVndZdlFtaGI5MUR6L0FR?=
 =?utf-8?B?REFzT0FGVzAzOVdaTzExREkrZVdZalhzbGNPUWYxSHNCN0hJVmx4RS9CWDdW?=
 =?utf-8?B?QzBQMHhCYnVkaURzRzErQ05OMEF4NUxUNjBFbndObHE4ZzVyYXBRbFlqU2lU?=
 =?utf-8?B?NHRQY0ttakZYWXFQaktwYm1wZkZjSm9PdUlxRUdHeEZCZG9UV1JZSGZtUWZm?=
 =?utf-8?B?Mk4xVFdsdlV6YUlscjZSU2tYNU1rbW51ZnduangrNlhleHpNdDZVRWdjbXF5?=
 =?utf-8?B?Q1AvdThIQUR1aTVKd0pTZVVjdUdtM0p0YjZCYUdXajJBdTVpQlNVa0xBZXhT?=
 =?utf-8?B?RWJrbyt0VGg5MkR4N1NTanIzcFdvclpXYlRCYlhQRVFJS1ArbFJsdVR1Qyty?=
 =?utf-8?Q?SozgCGZlCzE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1ZwUkowZ1RHSE5EdHdGbSs1KzR5OW9DQkszVkRQVnFpbTE0cHpwUTBodVZk?=
 =?utf-8?B?M2VKOVNpSm1teUJEYVg5OEtDb042SUpqUGFONVNqcFF0TTdoUmFFOEFrcVdj?=
 =?utf-8?B?M2NyVDJhVDFYZVhNdnd4OEdkZThWYjdIbnZzOEdsTGtnTzQ4UDlqUXJKdEN0?=
 =?utf-8?B?Vk8yYi9sUkVXQlp2OTlVd010Qks0MDRVOSt2VnN2TE1WQnpmNVZOMHRqbStS?=
 =?utf-8?B?cTlvdFZYWGlld01ya1dGZmcrbWR6eHlncGIwYlN4YkNWSjNwVFlnUjYwb25u?=
 =?utf-8?B?cit1QUJSOEtXelVkRG52YUZhRVMxeUM3ak8rNGFpMmpaR1NWK3ZxbWx1b1Vr?=
 =?utf-8?B?MlB0YnkrN0ZvcTZwQ2lDVjNaSUs4N2FETkl1eHI0TW1BZmwxdENlUEVHUW16?=
 =?utf-8?B?aGt0OTgxenFyTXNtQjFEOUlTUTA1enVpeXEwdDRWM1l4MWtueEluS01rbDd4?=
 =?utf-8?B?QitIQndqTkhwaHBSM2lCU2RabFl3ZnVuaVpJbWFMYnJheFpZTy9YdHp1TFl5?=
 =?utf-8?B?TlV0VEhNQUQ4OWwycVdnRjZIdkI2bGs5aTRGbklDU0w1RzVsSWJtYkxHTThp?=
 =?utf-8?B?R0ZiUWwvZ2xKZjY5Y1lraG4vWXZNdXkxRHhydXExTnhGdmZGTndBLzVYZ2JL?=
 =?utf-8?B?WXBvWmpyVkhvY2JuRWtESTV4b3EwaFJ1SEhMMUcyVTRFVkdaczYwc0s2ekV6?=
 =?utf-8?B?NjNlVUR2U093OGcwNlZKcSt3dytYek4vREFHMDFYUVZyZDFoTFpLWDJhWVYr?=
 =?utf-8?B?MVZvU0Z1WlNFZFVLYkFBemdTZmVyVnZwcDc0eG5uc2V1TkpiT1ZhZTRQSVZm?=
 =?utf-8?B?OVJSZTUwKy84VStDc0xSaHN3KytKNXg1bFJiaWZKZzdSZ2FXeG9hZVREd1ZB?=
 =?utf-8?B?NFVEQXRNVDM1ZXM1QTZ1M1QxOTFGSVhWSEFwNzB5ODJSa3N2Q05nNEpEbzA4?=
 =?utf-8?B?UmovZjJqVERuM2pEcDgzRXlLMVB6anM4b2xYSTJ4Z2pkN2RJK0g1M3RiN0tW?=
 =?utf-8?B?TGRkM3dITzB3Wk14TmI1Q0ZxQVZRTkNhbGt0QWVPa05VY3ZTS0t6V2RmVzdC?=
 =?utf-8?B?UklJMnhyQ1ZPUGo4Rlc4Sm9STHJzREpPVURxbzBRU1RZYkFaZ2c3R0FpZENq?=
 =?utf-8?B?UHpQQzd2Qlk4enZTRmNuc2FTdkg3YlEvYTJadndUWHVHYUI0bXAxTTQ3aUo3?=
 =?utf-8?B?SGNjeUpZcE5IckNTOUEwNzhFOEM1RXhoWHNhQW9XOFBFZ1B3S0ZvTkV3cVVM?=
 =?utf-8?B?L2p2S1p0SzQ3UW1RRU92Mzd6eHZqbnFHN2FkUWhNOG92VEhxYmR4UlRpQnQ3?=
 =?utf-8?B?VXBxandyVDRoVys4QnJ2alB4YzY4OWMyZXNzcWRYYmtVdVJnYlpoTHNQN0dT?=
 =?utf-8?B?aXF5Y0wvc1c4QUhhak9RVGxoUHNKN1FJMmpwSWpkV1R2VlFjdmFnQVJMMHpw?=
 =?utf-8?B?SEpMNkcyUUFpRHovaXpiSitrVnZiL2hSdFpTOUQ0R01qa3N0V2xYby9nTmlX?=
 =?utf-8?B?SXBXMnp0SFBFaWFNazhNVjFrRTdGY2hQUHJFbUs0cDBkM1NyVGc2dHNQNkoz?=
 =?utf-8?B?L01SNWdhZUJjRVhKblVvbHdYRWVaWlFqMVJ2b3pqc0x3bnFORld3RGNlNnJ1?=
 =?utf-8?B?alFOeWVrM25oMmRhNVFUOUYvTGJ1ZWE3eWRQMllFaXp0OUdoZ0hJcit4ZHp4?=
 =?utf-8?B?N3pkRTRnVDlEclhxbFZ0MEMwMkk4M1FBSGdFc0tGa3hPR2RmRi9CVzc0MWVC?=
 =?utf-8?B?dnYyNTBFcnVOdzQxVExXaDhyK2hSNW10b0hCdnBWVllsS3RjclMyYTB4Uk1l?=
 =?utf-8?B?ZmpBdStZS2gzQ0xGZk43S2xZSk5TbmpSQ2JuY1R2bkx2Um1KSVU1VHUzckZw?=
 =?utf-8?B?d09SWXcwb2cvcmRhMnFBVk8vWUIrbG4vK1E3aUJFRzFQVUI4TlNvMGx4cnMv?=
 =?utf-8?B?VHFveCtkUHZIaGJTQml5Nzd5aUZ2THhrc1dBNVlaR1NEaFhXUjMxemlINEVN?=
 =?utf-8?B?OW5jVytuVnVwSkZlc0lsMjV2dU1jbVFuL3RWVzFPYmNKcGkzVm10MkprWmQy?=
 =?utf-8?B?bEMreTUzTWladjNkVlRzY1NXcWtBVEtnbXg2allJa2g2SEJldDdsSUVrNzE0?=
 =?utf-8?Q?PH49oqsJ0sbSpmNHcmAC+5EvW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b739fae7-24f7-4cb1-d3ee-08dd2f962e7d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 03:40:23.2077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMLHDZuKq71grB6MntynzytGZl42pxFX5lDfJPpoYA9nHNQJCbMGqZKguso3qCvYHsKHEA8DXy/7PDLR+Rg09w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_194037_846192_9C0505D2 
X-CRM114-Status: UNSURE (   9.13  )
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

On 01/07/2025, Alexander Stein wrote:
> This simplifies the code and gives additional information upon deferral.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../gpu/drm/bridge/imx/imx8qxp-pixel-link.c   | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)

Reviewed-by: Liu Ying <victor.liu@nxp.com>

