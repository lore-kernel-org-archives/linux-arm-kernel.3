Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4E4CAC5BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 09:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0InCHjc6DCLmA+cOFiqRqiSKsXgkIavVYoGBu6TNt6g=; b=VtQ06ZU3+Vu6+u4r5ZHk4AXBOh
	TWdDbrKdQV96Mr1PI+0Ig9NhGq0ZUcynIopNlTFaDq6inRt1pWV+tKKYRXofzWhM/MX7947WfZoYx
	/UR+Gh78p9FsQleKapsXDM88TBoESrDZ0gg09mB2560w2miHIAFJzVtQWmvDa+b1yI/9Tsm/7ZDE4
	UEY/urVYMDnau8Zb7HM+OBxAh9HwlmhcILOLPScIxlaUYFlYoo6FGRXcGZH0UTrQnnb3HCZokogM0
	Z4jXv9lYDT+UftHbDNWmbieTyVjDTEPBoI0LSPjbY2XHEUe8pBpgCc2IIivFDN1IlSKgacyf1c75o
	bR9kqtGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v39tN-00000001spZ-3QFi;
	Mon, 29 Sep 2025 09:09:57 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v39tL-00000001soq-12un;
	Mon, 29 Sep 2025 09:09:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sf1H8W4mTZH4Xb0adWZ4cwzikn9cayjZxS5TL/9lOwHs1ObqYfWblSjYHel6uX21aIpS8m3F2TDRNz0MsrCkWzgyxXo/x5F0NoiwSXSM9eW9v0lgohLS3evwTxf6eZ7uKzd1SrJB1jZ/nhKFsHpTUdhOU4lrYZFEGE/vMy1O6XuomcOxI+VtYWYX77OQHzWvCiNf/rReHond18AhDEROmLDxxLNpjO5dHGGW9k0WRW1njreMY2lAyC4cTYduge3NLGi9gjeCQZkSggoyONHqJ+wED9CTyZY1CKxHaIT5VAe+64hHiIU5Y1lVxrpr8tAlyjs2TT3db9GWjiWY5urAFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0InCHjc6DCLmA+cOFiqRqiSKsXgkIavVYoGBu6TNt6g=;
 b=Q2+7Fhwdeb/nLv5L5O+/bvG04T5CHTfWDUB63HXxL5tdEXwT0gYcUHpeTTAPG2ScAZ/t77fvXMM9PPsFNz8moog8E6OXRUswO29Ib6RVAmKCMsYWpkU46NYohirMcFGTe5hnqXwZQWtVQhUAMTAfRf6Hn/l4zatDnrRFDiZAK83y9eLRf04tsQdL2iUcr6FzpT/5RrFYDvAzCSKJfp2fS7+5YOoLU15KzDcExE12aUB/OZOaBXWvVe49hXzcknTm9vOV9gwJ66EpHmkeJgoxNonJ1J0DP9tFDu9NewfIrJTcL90TUzUKeFDWByz303SO8n0Rc6xHcPkZBfzUjXfTMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0InCHjc6DCLmA+cOFiqRqiSKsXgkIavVYoGBu6TNt6g=;
 b=Nqhn0eJ6iwmfmTrD+AN3xYgXCCrTzosXV9OE//dQT2r9y4r4ZB1tO+SdO2cxpF+U1ccF5mGUXE+aSteVW/gwOaJ852//09JUsdXEvNqEZLIyLjJC4h2w1DjBYZYhshZiOmmw+nqeUDtxAUtUIozWKli8l1EHbqaC18EBNdLEmq4dkkRa1FaIDnTnfqfKVteaM6RY2xjxwNsv5waD8IC7aY3j/s2oAFUvqh3mRWhZco8VtajSGgt1YXjk3h6HGBAGUrk1b1oxtOy5nt98qzv6F5aa/kVQVZ8d3rV1JtavQB4iprmDfZX7x6URWwu4mbv/k7QJ9BnDM72qvqVRy8/uBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AMDPR04MB11619.eurprd04.prod.outlook.com (2603:10a6:20b:71c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 09:09:32 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 09:09:32 +0000
Message-ID: <6db3337a-ba59-4901-b0e2-2b0b93c8a4e7@nxp.com>
Date: Mon, 29 Sep 2025 17:10:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] drm/bridge: ite-it6263: handle unsupported
 InfoFrames
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
 <20250928-limit-infoframes-2-v2-3-6f8f5fd04214@oss.qualcomm.com>
 <a7f0ced8-d704-4a59-bcc7-e0bd4db113fd@nxp.com>
 <y3sndmfnwtljkbrssyycg6scjujt4kkjfo3gjclo3suzvqdahl@bdrdzmiolcb4>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <y3sndmfnwtljkbrssyycg6scjujt4kkjfo3gjclo3suzvqdahl@bdrdzmiolcb4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:195::11) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AMDPR04MB11619:EE_
X-MS-Office365-Filtering-Correlation-Id: d17baee8-8563-4800-dd9f-08ddff37e736
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWdIVy93a3VuWkRVWGlSSC9OcGQyMjBIR1NJZnpzaUtueElaeURLNU5IVmJp?=
 =?utf-8?B?bFpwMmtoeGtwZ0dnQkxCcGg2RU9lM3Nicnlpc3JDNEJtemNZNGI1bmNnMGU0?=
 =?utf-8?B?TjV5UXBNTVdaZHF0cnVtc05NVVFDOCtYVkhKMlRNRGFURWl3UzRaaGZLZzEw?=
 =?utf-8?B?Z1JVV3IwQUlIZ2FBT1pBUm43UitvNjBWYnpzUWpiSDJoWGorZy9INVRVQXBD?=
 =?utf-8?B?YVBDYlNIQU1YL3pCNXliZUlQQW0wQW9wU0tGOGIzSXBSSGFSUTVKOGZncnFL?=
 =?utf-8?B?TU5PTUQ3dkNsZGZtWTIzbk04NXRQQkVjUkRRUnNFdFVycFk5SmVhellqWnYr?=
 =?utf-8?B?UVpEM2crT3RSM0xGM2FoMzkwTmc2dEpuSTByeEFUSWJLL2tRcVdkYndUTFBL?=
 =?utf-8?B?MDdMU2NCRDN1Y0Y1SzFFdFVBMVY1TGhBZWkwYzNacWU4RzdvWDZ5a09iVDBY?=
 =?utf-8?B?WWtUd3ZzRTkyNWhFK3o5VXFETS9UdE13eWFaYU1PN1lRcGtjVnNOTmJ0TjIw?=
 =?utf-8?B?Y3ZNcStka3g0Z0tTMmM0UUhpejZVeGlzZlE5d1FWeHBpNlNKMEZNYkFVZ3h4?=
 =?utf-8?B?WWtzUnpQT0g1eE9weVZ0YzFNVGhodUhqQW1nYmhGWFZQV3N4U0V1aGtSUVJX?=
 =?utf-8?B?Ni9uSHFlaXgyd0pKbGpsajBtMVJWWnBHaFM3Mm13dGxpd1B2Zjh4ZktJNFBD?=
 =?utf-8?B?OTAyaUZpa3Nxb3VRc04yWjFtL2NHUVdJOFVtdFhwdk5IOGxXbEVOamd0UjFB?=
 =?utf-8?B?dExreWxPbjBUT0pDRWxIem0wK3VFaFJibVF6cDIyWUdlY3hHNnY1WjlkUGdi?=
 =?utf-8?B?NHFOU3lqMWdvTHZldFZjcnM2QTEvbWtOZ00rMzhIRkZIR2RjUktsR2tYUklH?=
 =?utf-8?B?bFIxQVF1d0xxcytJdmxsVHk2dXZmOGpTZFR6eVNHeldXc1YzZzBHZmordHFr?=
 =?utf-8?B?dDBXRkxxU1ZjR3d3L0lPMTA4M2o2M2RiWXhZcS9pdWEzR1lyUmEzUkIxNGxR?=
 =?utf-8?B?RGllTGo1aHIxYkJTd1JiQ3RFWTU4K1lNdjB3WkxhYVZxRkRpTHprMVJLTTBk?=
 =?utf-8?B?N0FMVSsweXFncWpqRUlnUmxDcHVHMW5NL1FNeURqemFiWU04QXBiT1l3UWJu?=
 =?utf-8?B?Q0MxM2l2djBxN3B0ZXdDdUU5SG54c0x1YTZFeGIvb25RZkFaTEhwTXBuNjk0?=
 =?utf-8?B?RmI3M1JMRHAyaHUrY29YYlJ4S2xyVDQyTExnaVNNek5Kbjk2Q0p2QnkxU3dQ?=
 =?utf-8?B?dXZJV2hkY2RkaVFMMk8wOXZ1ZGhqMmJVQmRnTDBVTDNaVnZIV3pmZmZLcGZC?=
 =?utf-8?B?cERiWlAvMTUvUjRIK1RvajgreU5EbUY3NU11MlJaYzVUL1VGWWVuVDdJWVBY?=
 =?utf-8?B?eFdQZy9JUFByd1grMmtWVXpSc3JCTEhSYnhzQ0dYRjNRUFNHZWhHbDFzTm9O?=
 =?utf-8?B?TzFTOGdtOUNQdk91dk05T1gxZ3lQc3liRkZzSDFEQmJQb2NETTlGM3VmUytu?=
 =?utf-8?B?NnV3T2dMRTZsNU5CbWN2Z3dBMjhucm4zbVpKSG54Q1BZODNGNmE5cndxZHdT?=
 =?utf-8?B?eitNMU80TVU2eEsyYW5pZlB5N3VIcWtkU0ZoUzJCdnhDNWQ3clpjMlJqWDlN?=
 =?utf-8?B?aWlnUXBjaHpLdEhYU1U5T0p1eUVGZGVkMHVoMVV3T2o3WFlIYTRJT2ZOL2sw?=
 =?utf-8?B?dm1Ca1RrMTJONUZtMllZSTFUelpHZEJpT3VqYzNFODd2dlZwOFMwSndteDJW?=
 =?utf-8?B?VnF5Rm1EajB0K05qQ3R1VkRUYW55NTB1VHNERG44WWd5SnMrZExmaHErbEZ1?=
 =?utf-8?B?MDMvZWhvaUJrd25Tc1hUTjhBZVQvUUlMY1ZWVm9YZnJGVDQ2WXhIM1VTQ1Vu?=
 =?utf-8?B?K1cxeVE3TFREaVhMZFNuYWNnd3lneE4veDNKSjJERnFmY0xMaW9waTJubmhi?=
 =?utf-8?Q?szVweb957cpLT+iET9AijP5XASVi73ok?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akxvbjdpd1RKeUV3RS83aUZTNko0SVFnYTJxQ2Rld1l3ODhYOG1WMk0yd2lU?=
 =?utf-8?B?ZkRZUFZBVnIyZG1mNUNjQWtHSFQvYS9SMjlwRG9XcGd1OTh3SEFucVhEU1ZH?=
 =?utf-8?B?Z3NYNzRuSkpza2c0MWhpTVJRMG5YL0x6cXZkbkRkbGtzOFFEeWQ1YVJtSUFR?=
 =?utf-8?B?ZDJ3K0Fqclo1OWVJM3FIQytNT21MZ2NaZ05yek9rd2loaC91dVV5NGNjZGJM?=
 =?utf-8?B?UnFaV0t4VVZ0UkdoMWVxRGZvOVBqU1lScklBbk9DQmk2Sy92VHlHU1hMQkxp?=
 =?utf-8?B?RlpLZHFUL1FxOE00Ny9vaXU4RjVNb042bkgvcmkrVGFkYVZwSnA5RlUzV1B0?=
 =?utf-8?B?MGswTC9ocUVXVDQwU1VXTGJkTGVhSHlTZ3lsemVZQmsyb2JMZm1COWdVbHV5?=
 =?utf-8?B?YzZ2cFBRNzVBSkg1TmVCdkk5L0ZscUxObmJ3N2JnemZWMm5QMlkwQmZNdGdI?=
 =?utf-8?B?VUkyZlpsK091T0VJUnRDZ3ZiZVhOTFdKcDJ3V1g2SkN4Y05IbnFGcWdrTUlF?=
 =?utf-8?B?ZjBqdmtHb1VoQmFHVlZaL2EwS3RXbzgxL2dzTHBRcU5IVXU2Nk41alBQNVdB?=
 =?utf-8?B?SkZQbmkxbTNZZHV4MkswVnp5V2Z6bldzSWp2RUJZT005QkZnVjkxN21LRy8w?=
 =?utf-8?B?dDRnUGVZMnpydmRMK3ZkQ2VPaDlxcGJtTzV1N09XRDRkWWNMbUU2UG9HV2dD?=
 =?utf-8?B?RENEYzdlYXNtdGpmZ3pnTUNIcEcvaFlCOGxDbmhNakhxTm04S1R2M1ZVRFRF?=
 =?utf-8?B?WDFWc3V1THFXMDVndFZZYWhYbFpnYkFBdU9sMEZSYUFCQzQ0RHdKVU1kTVRX?=
 =?utf-8?B?OXBZK1A3OWZzbEFGdjQ4alA2TkVlUUpvVnYyRnh6R1cxT005d3RsamMvQStC?=
 =?utf-8?B?ektlazk1N0RaMGw0TFJkZFRUWm8xQWY3eWMyNHE1Nlc3dmVQb0wyNTd5RDFN?=
 =?utf-8?B?dmUzejJXWmRnZnFQQ2VTVnloMVlrZ2pKRjc2MG9mK2lWNHJ5Qm91bXRGNEN4?=
 =?utf-8?B?dUpJRjZ4ZjZveW12Uk5KYWlXU2E5ZDhOQVJTSVkrWFZPTHNzRkFpWjdoalBV?=
 =?utf-8?B?eFdIeDJCbkV0VFZ6OTFTTENGVEV5N2ZaRzN5NlRiVVY5ZlJvWGs0aUpvaXpX?=
 =?utf-8?B?ZjRSVDdVeFh0WkpWUHZvREl1a1FoSGFvL1J0SG5TTjk3NmtsTGl1YjBFQ0xZ?=
 =?utf-8?B?bmpGUzVIMURFdzhZUE1UVkl0K25uUHRqK1FOKzNzeU0zdEI1ZElVbnBrTFF3?=
 =?utf-8?B?eTJkbGNINXVwWkY4ZjN0QWxuZ0ZwMUZQR2VYQnlpeEd1YkQwM0IveHdtVlpu?=
 =?utf-8?B?ZHlrclgvT1ArQWFucWxTOXNMTUgyZWJBdmtOMDVEVit3UGNGOTNtVGp2QU1k?=
 =?utf-8?B?YkkraWpXdkNKR3dwVFRtdnNkcUJYa2dVMXE0UjQxMEFVTzhqWmt0ejl1MmlV?=
 =?utf-8?B?TnlFcHR3MmlvYnR4enRMSkRjMGo0bW9sOEI0SFVPVEdnRWpLNkcxL1BaQW5i?=
 =?utf-8?B?cFI0Y0hFZUZTNHN5WlE1SVEwTytRL0hhZFNOWjhjNElFeVJ4NVRXelFiTGNh?=
 =?utf-8?B?d09CUERBTE0xSCtveThvUk02MkV3dFhnaVBzVFFsU0wzS0hmTHhmemxkZENX?=
 =?utf-8?B?SXNRMks2ejU1WFN5WnFrSURxcWFDeVJ1TktkeEtlaTkyNm9oZzFDdGc0eUhp?=
 =?utf-8?B?Y3FWNzI5UWdNZHl3eTdOanNLZ0pYQ0VUNjNHYWVDMHdJMGg2WjZEM1hEU3d6?=
 =?utf-8?B?QTdRTW4xdXpKMG1VTHpnUEdNMnlBRmNmTG4rRnBqNTNRaDBzUHdPc0ZmNkFZ?=
 =?utf-8?B?eEh0SXVjVmFsd2Y5V1hnN0U1bnhnMDdVanZRK0FqUUJzRDdIZjliTW5aUlVs?=
 =?utf-8?B?TzlROXovOCt6VHltNHV6cnJ3L0NKWWhyVXo4Ny9NQXpkWTVtNDljbVloN0dz?=
 =?utf-8?B?ZDJLUXFLK2h1TFdETG1WQUhDaEhvVjlxemtBZ1dPWndOWnVwbmxkSG1EeEdo?=
 =?utf-8?B?ZDg1UWNSdm1PSzFEMittOVhRTlhTNnVvYUJqT0lvUUdlQ1VKVVg4elZRaTU1?=
 =?utf-8?B?YitSZ3F6b010Q0dIREtib3ZQTUJramdEcWNZQkVOMlB2dDlVbjlNbmQ4QjZa?=
 =?utf-8?Q?6FFarZ6A3n+gd3KWlwTF3spN8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d17baee8-8563-4800-dd9f-08ddff37e736
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 09:09:32.7228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3KDVx5mDAGIM0+ukB7ZLNXK734aI38z+pL3j8BlWiR5nlo8FMsez1y299d6NtuEQ2y2MnYtItgYUnlWOE4Alw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11619
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_020955_436606_EA79CF12 
X-CRM114-Status: GOOD (  24.26  )
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

On 09/29/2025, Dmitry Baryshkov wrote:
> On Mon, Sep 29, 2025 at 03:56:31PM +0800, Liu Ying wrote:
>> On 09/28/2025, Dmitry Baryshkov wrote:
>>> Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
>>> return -EOPNOTSUPP for unsupported InfoFrames and make sure that
>>> atomic_check() callback doesn't allow unsupported InfoFrames to be
>>> enabled.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  drivers/gpu/drm/bridge/ite-it6263.c | 27 +++++++++++++++++++++++++--
>>>  1 file changed, 25 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
>>> index 2eb8fba7016cbf0dcb19aec4ca8849f1fffaa64c..cf3d76d748dde51e93b2b19cc2cbe023ca2629b8 100644
>>> --- a/drivers/gpu/drm/bridge/ite-it6263.c
>>> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
>>> @@ -26,6 +26,7 @@
>>>  #include <drm/drm_crtc.h>
>>>  #include <drm/drm_edid.h>
>>>  #include <drm/drm_of.h>
>>> +#include <drm/drm_print.h>
>>>  #include <drm/drm_probe_helper.h>
>>>  
>>>  /* -----------------------------------------------------------------------------
>>> @@ -772,7 +773,7 @@ static int it6263_hdmi_clear_infoframe(struct drm_bridge *bridge,
>>>  		regmap_write(it->hdmi_regmap, HDMI_REG_PKT_NULL_CTRL, 0);
>>>  		break;
>>>  	default:
>>> -		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
>>> +		return -EOPNOTSUPP;
>>>  	}
>>>  
>>>  	return 0;
>>> @@ -812,13 +813,35 @@ static int it6263_hdmi_write_infoframe(struct drm_bridge *bridge,
>>>  			     ENABLE_PKT | REPEAT_PKT);
>>>  		break;
>>>  	default:
>>> -		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
>>> +		return -EOPNOTSUPP;
>>>  	}
>>>  
>>>  	return 0;
>>>  }
>>>  
>>> +static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
>>> +				      struct drm_bridge_state *bridge_state,
>>> +				      struct drm_crtc_state *crtc_state,
>>> +				      struct drm_connector_state *conn_state)
>>> +{
>>> +	/* not supported by the driver */
>>> +	conn_state->hdmi.infoframes.spd.set = false;
>>> +
>>> +	/* should not happen, audio support not enabled */
>>> +	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
>>> +			     conn_state->connector->hdmi.infoframes.audio.set))
>>
>> Maybe use drm_err_once() instead to provide the reason for the warning in
>> a string?
> 
> I can change all of them to drm_err_once(), sure.

With those changed,
Acked-by: Liu Ying <victor.liu@nxp.com>

> 
>>
>>> +		return -EOPNOTSUPP;
>>
>> As this check could return error, it should be moved before
>> 'conn_state->hdmi.infoframes.spd.set = false;' to gain a little performance.
> 
> I'd say, it would be negligible.

Fine, up to you :)

> 
>>
>>> +
>>> +	/* should not happen, HDR support not enabled */
>>> +	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
>>> +			     conn_state->hdmi.infoframes.hdr_drm.set))
>>> +		return -EOPNOTSUPP;
>>
>> I don't think IT6263 chip supports DRM infoframe.  The drm_WARN_ON_ONCE()
>> call could make driver readers think that DRM infoframe could be enabled
>> in the future as audio infoframe has the same warning and IT6263 chip does
>> support audio infoframe.  So, maybe:
>>
>> /* IT6263 chip doesn't support DRM infoframe. */
>> conn_state->hdmi.infoframes.hdr_drm.set = false;
> 
> I'd rather not do that. My point here was that the driver can not end up
> in the state where this frame is enabled, because it can only happen if
> the driver sets max_bpc (which it doesn't). Likewise Audio InfoFrame can
> not get enabled because the driver doesn't call into audio functions. On
> the contrary, SPD frame (or HDMI in several other drivers) can be
> enabled by the framework, so we silently turn then off here.

Ditto.

> 
>>
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>  static const struct drm_bridge_funcs it6263_bridge_funcs = {
>>> +	.atomic_check = it6263_bridge_atomic_check,
>>>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>>>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>>>  	.atomic_reset = drm_atomic_helper_bridge_reset,
>>>
>>
>>
>> -- 
>> Regards,
>> Liu Ying
> 


-- 
Regards,
Liu Ying

