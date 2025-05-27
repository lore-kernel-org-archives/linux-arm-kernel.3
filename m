Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B85AC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 01:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+hSoPujqR2toonZR4+X0REpWkYjttlIo/q8wFVWp6w=; b=jBGMYkbZ8FuUE8ocgK5syqEEcI
	NX916cKE4m2llHiwR4++84DLNdA0kLSKRXuwSInoLDcIN7TDX/OV9Vx87Vp81zPWV5s1xdicrTGVS
	IM1uXiGQMfaHCYLC4um4FqBKY8jRh6rA5e+SOVjMvYBY1YKCIGg8eNYOJVPIUNtTBZRkHTzlYMTEf
	oYVoiD24z8a8Rqvo6wxTfp1SIyKG73CeOE+B7apBWr0GBdIsVX5cRGS2bHIZjAMjeFYRmmemgneWZ
	JDs3iR4Z1Mqgo0WbTD2dIO4B+Aq5lg/RJxx5OFXJKDJF76y2jrXZJv911vGrVxxeDmIl9CIswELw0
	ZgDzMZ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJjR0-00000009jJb-33nK;
	Tue, 27 May 2025 01:48:54 +0000
Received: from mail-dbaeur03on20604.outbound.protection.outlook.com ([2a01:111:f403:260d::604] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJjOt-00000009jDR-2iaF;
	Tue, 27 May 2025 01:46:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCk9UEsZepgFprQTXi01RQ+dmal8umglamN9ZD6+420rkZIKxg78yxTXrq83OcE3hPEV27zBXPy/hRxvsve+JLAgxiLUJF6mM0knr5OD2JK5vLJb081n59JAwe7PrmNUVB72DaHTTjOGLFFNY9qbwluUOyrdfawBvn3nqZqGkWojygmEKHxPy0JVE6vMBbPFNOhU6HA6f5fLu0u6ct7h7reJAXJBkbEkXUevdE6FfphLTJESqfI5GaY5eMnZj1pb4aXVY3znGCSX+BkIEf5rfdI6wyeNl2+tmry+CwuUps0gwdnfvr4NX3kTgBX4GZ/REcQJocRzW4cD98Chc5sGVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+hSoPujqR2toonZR4+X0REpWkYjttlIo/q8wFVWp6w=;
 b=R8viHV/EiybUo1GM8/H7gDUeNqsGVLavnGxL8OLBsxQaYckinZe1yl7qepnT22L2heoMuZwSGWXOsx7FQsSmEEuqydz8ecNVlnFIL7whMtfY+WJmo8FkikcXFcdm1dwviBwI9xH9VWJCnKk/NTLT4HjVQwJMyLd1CWo6n6OWi4kBgEIM+p+cMCngWuj8XpZdm33y0IdjGuFVRMj0fC0atZONxgJNKanxafJ6bL57mDS3ho75YCzbffoyT6sXZzbMws407z6iYU5k16bOzfJnjh3BojJeWJpEDwIwI7dfki2TwuofZfK3aLuRG6xhBKO/rjU2bwQOijYptB9kOeCulA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+hSoPujqR2toonZR4+X0REpWkYjttlIo/q8wFVWp6w=;
 b=oUAG9zLd5JZhB3XuFFsBEUm96nQ1CPQ91qmjUNhOhwuAoewToSX/QTDLy5pzF4+usE+dqfdPHSVVchv6BMc4BVSUF0dVtGxlx6KRaJ1xjox+K/wsB21dBt12mxUQh4uj39cSEv205pHpbE3ntfODWGYncx5Bj4d1FHUW7S5VcgsbUfIHrzxYF5Zy7JcRfszss0XxRZinOM50Il6oElHTH7qFQJWXhTN6rOifuymNxbWKe8Cd4DwX8/E3X7kcq8Hjmvw8Iz9CwMPlkit2+vvlPGDwNf61BdmEUvtzQy02Bf7VQgmwFw+JP0/72tzU25XDL8NUwUmBdtcjCvWomoLPDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8782.eurprd04.prod.outlook.com (2603:10a6:102:20d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 27 May
 2025 01:46:40 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 01:46:40 +0000
Message-ID: <f11206e5-4c59-411e-bb91-2d50befbe930@nxp.com>
Date: Tue, 27 May 2025 09:48:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/22] drm/bridge: imx8qxp-pixel-combiner: convert to
 devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-18-b8bc1f16d7aa@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-18-b8bc1f16d7aa@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:4:186::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: 943ac38b-7450-4aee-fea4-08dd9cc05366
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N20vL2I4ZU1MWTFheExlMFVZR3l0TkZxeEtaR2syOXVxZ2tZM0doMUhLMER1?=
 =?utf-8?B?b09rVW1BZ010VVdZSG9uRHpOSlBiY2VjczExTkx1aUgvL3REQTN1bkM2Qkd2?=
 =?utf-8?B?V2dIanJPNTJSMWZhaFhsRFEraXR1dHBWV0p0OFlXZGNkSUhGY081VE8yOHVC?=
 =?utf-8?B?K2RZTkFWQzc0WHBKRW9QRjFIb3BacGhSdzVLSGQwVWoxSDVmWFZxM3pIRVl0?=
 =?utf-8?B?UHloQ3BJL0xDblJBNFFGTzUwOXZxandrZ1dDRERWU3ZNc3dDME01T3h4c1E3?=
 =?utf-8?B?MGVQc0hJL1doUFJVUC9nTzJWWFVUTUxYOTlDNEV5WktRaTVWVjF0UysxbFVD?=
 =?utf-8?B?T2FDbTZIZDc0eVlQNGN1NnBZdDJPYlU1MkNHKzljNDlVeXY5c1B2TlJNL1JP?=
 =?utf-8?B?U24wYzNwQXo1bC80WURsMFFKTDI2dnVhdm9lYmY0YXRUY1hUNnIyMEZoN1Rp?=
 =?utf-8?B?WS9ha3hTQ01DalJWVkVBQzVaTkxQVjZMN3hHRHU5cSs1M0VWUVNBLzZhNUlF?=
 =?utf-8?B?a2RaUkxnRE1rYllXTkdNemNocUpaZ1J4L2tBRnpKVFZLb0RHekovdGV5eFg2?=
 =?utf-8?B?Y3NvaGRCNGYwdGtVejQrdVVGbE5Tc2tLTGtSQk95YUZVVUdIc3IwemVCSEVz?=
 =?utf-8?B?a0JNclpKaG9zYWdJUDhIdDBiVHdVWExNQWZSUjRFeTNybmIyMWQ4ZVA0Y2hE?=
 =?utf-8?B?anhLNnJucnJMNm1nRlJJbnc5L29vWHY0T0F3V21MZDMyR09ncnlqdHF1V2dG?=
 =?utf-8?B?cnR3azNwV0tzYVVxSjVwMzhTOERjWXZjRWJySFJVWG9GbkdZYWpBc2hGRmU5?=
 =?utf-8?B?WmtDdTgwdzZkMVpYYzg0WUIzUDZmekg0Y203UzJ4MmhyenRlS2FBeWJOTWZD?=
 =?utf-8?B?ZWdBb1dUYkNFRFJGYXVGTlIzQ0JGR0s1eFNtWWJxOHVDZ0VFbTFjZUhhc3hE?=
 =?utf-8?B?ODBTaG1ueFpFRDVFVEI2TTFMVmhJWS9uRGJQaU1oY2JNdG9EY09Bbm1XdVk0?=
 =?utf-8?B?SHVDaWJtbm82OXgyZmxkU2VzR3FxdXowUk5BWk5WTUVCOTdDT21nT3pCVjFa?=
 =?utf-8?B?UCt5OGpyZEREMS9rb01wc0E0bHcxbUdCZWZpeEZXTVF3QlJnUWh2Z0pkOUxt?=
 =?utf-8?B?a3NXQXBvSDhrakY5aTNSeWx5NmZtbzkxSUxTdUErN2lLWnZTRWI3QUNMYjhG?=
 =?utf-8?B?QXhiV0Z1cWozZVI4KzJIc1B1VGdTcWF0RUFOaW1KemJ5Z1JDcTdaQ2pmZnF1?=
 =?utf-8?B?QXBPbnhZdHluRTNpUU1NckdBTWNQSlg2RnpwbWkvSTh2MjJrVU9IcGZtUXJr?=
 =?utf-8?B?WEZsaGxITlh4L25WS0hhMGJTUDBjVDJMMlRUWDJRQzEzTmlpdjZSRXl5M1JG?=
 =?utf-8?B?eDhTc2JSOHp2NVN1aFV1MlpJVTNuL2pnM1NWbWY5Vk5ET1hDYXZZN1A1UEZV?=
 =?utf-8?B?b2tvUXc3aFp1MWppSkNnYUR4M2NpNlZDS0hsN1FTUmxjbzYzWlJsVkdDMWU4?=
 =?utf-8?B?b0YrZTFmYjQzQWM3WWs2aCtCeHZYRzJ6Q291cUxwQUdtT2dlMGxBODZ5RzJQ?=
 =?utf-8?B?Z09MNU9nc0xQSVZNSTlaRVNwdHlOaWdTWW1pMkhIRStwcTVqQmRIVmhvSlBT?=
 =?utf-8?B?NFZIeUoxdDM0TmE3eWNKT0VVK3E3Vyt0dkt3QkRzUWJNTzU3RzV1dlVITi9o?=
 =?utf-8?B?K1Z1YVo2cGwxZ2xPOC85NTNxSC8vdEdCZ3dYRFhkejhBMFU5OWhEWGdNcEVY?=
 =?utf-8?B?bVU1UUxORVExdUtIOGwrdkM2ckdIU1ZwWnJxVGZuZUF2U2dRUmx2STFSV21B?=
 =?utf-8?B?QlkwQVV4bmcrMkx0N3N3ZCsvSlpJS0xlOW1CcXp5WHlzb1V5ckhTamgzRXZ1?=
 =?utf-8?B?bWN4MlhrT091ZkhvdEovNWNaQXZFZHpPajh6NE5BTVlabVNOaytueE5peW8y?=
 =?utf-8?B?em9aYkR4VVlqMDVJaFc4dWdyanhDSkdOc25aNk9kUC81WGQ2WmtUcVBZUXZU?=
 =?utf-8?B?N0dEMGlCK01RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3QzZ2M0TGNRcU9KVEgrN0hkMW50L3Jrb3hKS1c2OFU3Nm1wNlRkRll4TFE5?=
 =?utf-8?B?NHBsWkRiWTBlT2FTMFgyQkdnR3A3a2s5ZXhKcFMxWFZWU0QxdmRyQW5WTmFq?=
 =?utf-8?B?VzRCWThXVm11UXpMSE9lTkZiQ2NQYmx4L2dyMVBjbTdOUnJUdndJTmZwaEZW?=
 =?utf-8?B?SlZkampUem5kZDRNSTVxOExwSHFyckJHcEFwVFF2TGJRZ04wbVBJWW5PT3RM?=
 =?utf-8?B?TUVlRFVSQUhMcytLQTBDQW9IMmEwbEJxa1htTXA2a2ZNb2RpMmFEc1JYd1U0?=
 =?utf-8?B?aHFmOTgwVk5zTG9yZFpROHlFTUlzcThkcEUySGdpZ2FjTGJKdlBiejE5VnZ4?=
 =?utf-8?B?MzR5VzVmSGZuTksyZTNjTUFEVW1URithK2grYnV3UE1wL3NZR0dTTjJNU0xE?=
 =?utf-8?B?Umo5SmpySDNXQVZXMjNxWmNFblBNREJmMElMVlRGZ081dlRWd1doTTBUYzM0?=
 =?utf-8?B?a0NueUtIdVJPQTJtWlhPK2pZVHBudFk2Vnh5ZWNPMDV4WDlBbnBaU3FqTXNL?=
 =?utf-8?B?c2Q4blJwRlFDcm1CQlMrdVhWMDNsb1NuNE04ZG1Obm1PREhYSGN0TmNXb1JT?=
 =?utf-8?B?MWcrbE01Y2RBd2NwcFQ3Y3prQUN2TTlZWEd2QjdYWFVEaXh5YlhNdFEyWFhp?=
 =?utf-8?B?ZTl5ck9DcmtiSEd1dTk2c2o5ZzI1YVJqMnU3bzYzK0huY084eVFXYjNvaFIr?=
 =?utf-8?B?NzBOOWJwQUc0cXpFbkNGaitTREluTTBvNnFPOEFRVHRHLzNvclVlTFdSQ2k0?=
 =?utf-8?B?dDUxeWlUSXN4ZTFYVmFteW1EVGZ2TUFhSE1GVmJkQjZVNWQrQnRQTlhsZjRQ?=
 =?utf-8?B?Zys3UHdqRFI2ME9pYXFSYVpIZUxOZkN4TGdDK05iTXFQaGJZR3VkQU1idTM4?=
 =?utf-8?B?VHoxZGRwSk9OVUlSdHoyVFZNN0hJVnZSOXBiOStjaEVWRkZuS3J0Rmxxb3B6?=
 =?utf-8?B?aEphTkoxcFhZNFBMUHMrZmpURXBaVHRYYUk1NGVkZldGWDlHclFnTklsa1pR?=
 =?utf-8?B?bUdvaVR4eUN2NjdCZzF4VDBDdExhRDMvb1dKYy9ndE9hZ1djQXFuZmJwdEdC?=
 =?utf-8?B?ZnlpdzltT2d4MlQwOXhhWXk0YkpieG1nc0c2c2plL1laNE1qUm12UDBwaGxq?=
 =?utf-8?B?K3lESTQ0YVR1WDltN2FxSzE2eU5jc1NadnJGQVBYRkpscng3dWZkVlNxcGcv?=
 =?utf-8?B?VGFvRGY0akk5SGRCWGFrZ0FXcGpuNnZWMG5nZzBSVG44MkV6R0d5SEJDNGo1?=
 =?utf-8?B?eTAveWswM3Ewb1RFeW1JWjhhZ0g0TVJLY1NVU1RnUDVnUVlnZUhVV3orWVA3?=
 =?utf-8?B?enI4ZElFdzBCRkMzSDJqSm96V3hJbjJXTEZrMjdhT2pzTXpBc3dRcWlVRDhx?=
 =?utf-8?B?VldsdDdOZDkwc1BLOFQ4N0g4ejdOUUtpZDhvK0VCdGxmWXpDeFZDSXJMM200?=
 =?utf-8?B?WDVHbVowVnd6YUEvV0VsOUJaK0VnVWV1VnNQa3VmQy9OWTJwUEJjWlRlR0xx?=
 =?utf-8?B?SHNDcjhBL0t5ZzhsSW5mRHNIcUczd0tVMmtZMzkzb2ZyWVF6VE04NzBncDU3?=
 =?utf-8?B?YjZnUzFaT3JlMElWNzF1UllhdmJqODZyY1QybkVaR2MrNy9HbWFGL1BJZzZ6?=
 =?utf-8?B?bjFrZGpzVVNaQW44ZzVSV3IvU3FIcm1Wb0Z3UUJabFBMdWFMQ1QwT3QzWVFN?=
 =?utf-8?B?ZUVMYXlQRnlXQWk1NEFEdFpxNHR0S29iKzd5ejFXcGNNLzByREtJdjJDUnJ6?=
 =?utf-8?B?K1hkdTl0OTZWTnFOQjRhUUtzL2c2ZU5CYXJ6ckFlN0dYQkNVeXFTamNxRnQz?=
 =?utf-8?B?cUZpdDNQa3I5R2w1N3ZlZ1dFbm5waW9SVjNpMkJ5MXZEWEZZTVhGT0VpYTRU?=
 =?utf-8?B?OUoyaG5GR2FvMTlHMFVqQXdBUUFwUjM2TUcvb0o4NEVPT3lwdnR1Z0lqdEY1?=
 =?utf-8?B?Rjc3RnJOSkdvU3hxV1hSekkycHJTdzUyU1hlVjI5S0pGV043d2o3QnB3aXZ2?=
 =?utf-8?B?eGdqN0RyREN1UkRvQWZ1RGd3NTJvc3R3Z2lLd3JycDJDS0Ixdy82ZlNPeVBH?=
 =?utf-8?B?bFFCNTNxalNCM1pkTDFiZCtKWXNBZFFQNWxMKy9yY3dvQjFhWUZ3d0pmY2dU?=
 =?utf-8?Q?UyyqqrTrpBMq4FGriPec39wLg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 943ac38b-7450-4aee-fea4-08dd9cc05366
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 01:46:40.5242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYS0P5cixG48xB+iuXeKB/k6S9OBz5/3z2cfGbO3jrPemcNwejo9LGXIVtg0B3fDi5AhzSqEGmr16349JkEcQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8782
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_184643_703944_D2A85FF5 
X-CRM114-Status: GOOD (  13.00  )
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

On 05/09/2025, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> This driver embeds an array of channels in the main struct, and each
> channel embeds a drm_bridge. This prevents dynamic, refcount-based
> deallocation of the bridges.
> 
> To make the new, dynamic bridge allocation possible:
> 
>  * change the array of channels into an array of channel pointers
>  * allocate each channel using devm_drm_bridge_alloc()
>  * adapt the code wherever using the channels
>  * remove the is_available flag, now "ch != NULL" is equivalent
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Liu Ying <victor.liu@nxp.com>
> 
> Changes in v3:
> - fix NULL pointer deref in .remove and remove is_available bool
> 
> Changes in v2: none
> ---
>  .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    | 27 +++++++++++-----------
>  1 file changed, 14 insertions(+), 13 deletions(-)

Reviewed-by: Liu Ying <victor.liu@nxp.com>

