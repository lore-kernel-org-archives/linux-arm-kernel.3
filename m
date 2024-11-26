Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17306D3B986
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 11:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IpcKct8OJzusN1EL82Y/RppxVKKKSW/aLqK+JUEnURs=; b=j3m4zgtkRSDqMv+XUvHtNRbAEY
	x5hUmJ95EUEzJvVTU2J1Kc0X+Tjnm4r1/V7O4SuA5+DrK5qX05FPq/uB5KsWRn7YpL0QwGfUcsRxX
	/u7SBfOqad/SabIql++ZcswlLoFEeLBtzxYbjioUxmIP6KknugIrzS8ESg/K1r0Beg1vhmRMIIBJe
	tcOs3Rzqba5B34wyWruFMwxibrNn4MQN2HhuDEgz7T3wFbz9Egd853ebR/R6NeSDQOVrGByYiyRd4
	jCJG35kkRs3fv+nqdsYT+9pfqPQwyr9k4T10FYrdDdBpk7l3Xxa/eJAwz/y9bHb4Q0pBa3WvQsjGb
	DWa0SRaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFu4E-0000000ASO8-3thT;
	Tue, 26 Nov 2024 11:49:18 +0000
Received: from mail-vi1eur05on20620.outbound.protection.outlook.com ([2a01:111:f403:2613::620] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFtzd-0000000ARVT-0wCR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 11:44:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOzYXV+KRqUhTGhgul2H9cu9Y5GK60NlY3NvaNmYO9dNa//x8xIA/l3T+2u5EIkZR8jnbGPeX586mjsPD8iNWfoi6YwiKSyskVcBJkCwoH2fTq/7Rf6NWD2YVAiX7HXp5PGFNEtaEGuZ2J1wvJTdlieMgfYphIipJpOh1+oWVW9DC1eeGU9tTc9wCU2I4ub/ixa3Vq4Wd8HSFQxvuewuVTUpNIBshZ9oOBIa7pijYhrzsm4iDIVBofdJU5mYnKHuTFfSxET86/2/Pz08Dxk1pmLIDU8qFCEqYHzePVtuRriu5X57cp4rlCPhB0CKk727WyA7pWQcLoWVxqWJiaZTiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IpcKct8OJzusN1EL82Y/RppxVKKKSW/aLqK+JUEnURs=;
 b=jsCt2lAfPO51z6pF/psp8YB6zKNLJ18cs3MoFKO9f0s91nWe/2QXzgpPcWecB5Cj4ovmIodgfwVw37tlqEBdvkpxF8JaqAINSOWteRz+WQPUjYkCAob0sAY5mfs0w9Xd3KEz9gxb+/p+9BybVsnCanvhUuD+UJ2mumI21NJjQ/vhAJEY46AGNJjJy50QmLbu+1MAD52TRCqtuQv281haWr3G7NM9WCwz23f00De4SS+gCRldhnD7g/+H1yhOQCLsRe6h4s5f2jFbGyBblV28qC7JzW69ldNY6aJHp7uL52mZ5DRyh+BaBYaf+9CM/4I7BQGwopt8+4OLfYcF53TouQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpcKct8OJzusN1EL82Y/RppxVKKKSW/aLqK+JUEnURs=;
 b=eCYJc62lxvjyERk+zV+zXwpe42f9+W04va+pDdF+q2KQlxuFX7+TYlVj7uXTHHqqnMFgpzB7C9F16E0p/KST1hnerhAKSHA9T4Ur8JaAigRKDHmOcydky/aUw1x/gGco6Mk2a8jBmCwYBGMOxPnUoOx0OJUef70AZkPWrPdJYoN7k+nkchBeVqVuAEenSL6x6uz9bYwbBsXznpwpV8gpFIslpMD1+daceeEv7jaWy1BymWPlT+0IEygcoTr1Gp0WUrpo4vASaEPp7PxUUAXUuYV2ERZre0Wlg8+WvKy+b5rc29dj/QmA86esC1O9v1dnYzRQijbzQZVgL1rFjmj3AQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PR3PR04MB7339.eurprd04.prod.outlook.com (2603:10a6:102:8b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 11:44:29 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 11:44:29 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v5 3/4] arm64: defconfig: add S32G RTC module support
Date: Tue, 26 Nov 2024 13:44:13 +0200
Message-ID: <20241126114414.419469-5-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126114414.419469-1-ciprianmarian.costea@oss.nxp.com>
References: <20241126114414.419469-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0271.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::12) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PR3PR04MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c881a3-03ec-4b27-f6e5-08dd0e0faf8f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0Jxb3d5eTJLSUhZcEF2R3hMekdBUTgyQXlQYVdOditPV1RxTWdDK3hpZm5r?=
 =?utf-8?B?UnV1eHlQQzM5dnFsaUZ5UmhzcThneXdjdlFKcS9PTHNPVGQ0N1BZYjJZdmFO?=
 =?utf-8?B?cndWMzUxVkYvUWtQd2wzbWtUVGlZcEJ1VmxOYzdxVy9Ha0krVTZQZ25Ibkli?=
 =?utf-8?B?dStyb2VJd3M4dzJ1blJRVUdHNlcwZ2N4c3ViTnpGMmU5SXVwVTRhVGpBdGxS?=
 =?utf-8?B?blhnbnNUVHVVelNqSlMrT1h2L0hYQ1dkQ1VJU3hzVHlRV1U0LzNLblRMWlUx?=
 =?utf-8?B?RmR3c3BLbnJHVDZrU1lxQThwWHVkTW5Uek1SN2dMWFFjVlgyRVYycVhqZEpU?=
 =?utf-8?B?T1NJeUFqVmdaNTZlQkJwSldXMzRHVE0wYXFha1dFeE9ReFh5eDBpdWxkT1gx?=
 =?utf-8?B?SzQ0U2lIRG5TMEcyVi9TUG5rQjNUQnp4V1FHSk5pVUcrbGN4S3pVSWRHQStS?=
 =?utf-8?B?c3djRWRlK3k5akI1ZlVPUzdxdHplTERZNUlSaE5FU3hmcU1Ebmd1b2Zlczl4?=
 =?utf-8?B?Uys5dDRzb2VDd0UrTmJFRzF3UjFvOVV0bnFWK2dKRklnZ3VJcFRHQ2hZb29T?=
 =?utf-8?B?UFlZd3BVOWhTUWRhLzIyTUh6R2RYbzIwajg0T3l4eGRKRnAzZE9ZTjI1OUpn?=
 =?utf-8?B?bVRtRWVJeDdTYTF4czVuQ1JZeGU5VlZqN3o1N1FSa0JIQysvblVnTVlYejNZ?=
 =?utf-8?B?ZHBJamtLU2taMlJqL0FhVURNYnRaaWVkOCtlUFg1SVNkRWtacFpLN3JrTHJX?=
 =?utf-8?B?WmdBSkhRNG0rTW5VT1FWVVBGZE9sY25sVTRTVnFJazVvbWJROHhNT2E5TFF4?=
 =?utf-8?B?QWlUdUZtdWF2NllIUmZkb1BrRXd0eEhBNXp6T1N3Q3JCWkhCQmlTS3RtMVBk?=
 =?utf-8?B?NHpRczI0VXhzTW5wVlhmb0pIb0JwYUgxRnBMbWd0dHNGS0F1ZW5uOHg3am9D?=
 =?utf-8?B?b2lRZ1c5eDQvS2ttVitpcjBGVjIzK1ArTG1jQmNyOE1PdElVRUpjMHJOQjRX?=
 =?utf-8?B?QTAxR2c1UFdnRFhVTUZJMGxJZFMvU1RxSnZJWUZtYmVyVldEMXhKWDFkcEVE?=
 =?utf-8?B?UjhWSEs4M01jY3E0b1l4UXBMQktJRFA5NW9PWkp0ZzZPVHlTSEU4YUpFQmIr?=
 =?utf-8?B?dCtPNlk1QWhnbzFaMUg3dFpPNHdGYlppOUNGQXIyV2FTL0FkUm1vb0JjVlhN?=
 =?utf-8?B?UFQ1REVVS0srTzc5Nzc4NmNwQ1htUnJIVTQxb2N2eGxnc2crOWREWWlUSUxE?=
 =?utf-8?B?UnljSkJsTGYxMEc0UDBqZHFFS1hkcytVZFlSSUlFemdZTWI1ZmZFRFR4dWZ1?=
 =?utf-8?B?QzdhTVBoWEcwQWhBZ2Z1S1JXVUNDL215S1ZCL3V2elp6dkVTOTNqQzd2T3Fy?=
 =?utf-8?B?Z1RZcXRza0QvRFZWOHcwbElaakliSWQ5cmxyY3JRYVhVSE1NV05rcGhveVZL?=
 =?utf-8?B?cW1JTSszTFBNRGZ0dGRFYjFHVms1QU1tdEtobnFDcDlCTTNBeS8rK3N3UzNN?=
 =?utf-8?B?cEtwc3JFNDJ3Y1Z2eG5DMUpnVGdzK1RoV2YzYlpXSVNFNGwxeGpKcGNieFhI?=
 =?utf-8?B?SkhOMEExZE1JV0IrYTJUNW1DN2dMd1dOcE1qUTQ4d1loUlZtRzM0bWVYeWxi?=
 =?utf-8?B?KzlDNnhKV2hnbGRDZVJIbjBDOWg3cnRkNE0xM01tYS9SOUtDTUpobHBxSGtU?=
 =?utf-8?B?ZlBheGpzaGdkVjlwT2pCVk9mQW5OQUZ3eWMxWElnWnEzV0hWU3ovQk0wc0k0?=
 =?utf-8?B?dWVrYzRoNUttNllYR3lsVjhlVXQxNVV3U3o0WjlGVVFnU05FWTVCMG1pVWVl?=
 =?utf-8?B?dUE0NnNOcHhkTUQvZ1lYdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2F2TWFFQzlmYWExZzdhcjlSTkt3aUROSmR2RitzQ3J0bjJYL2JHdnRMVW9T?=
 =?utf-8?B?RFRaNzUwdVVkOWNwaHRUTjl1V3huSlh1TS9hVmNaajBaeXREK0JRbjIvWldS?=
 =?utf-8?B?NjJGUXova1l2ZXRIWmxkbDc1ZEpQKzZHNUxjSzRyYTRGSjZ6aFEvWU1pSysy?=
 =?utf-8?B?eEZCM3dieDZYMm4yaUhiT1djR1BBdmpCQm82NGpDbHZLZUQyaVVWcUtPSnJD?=
 =?utf-8?B?U2dZT2hyaTMzd2FPVDc4TDZvVTRsMHNvNnAvaTIzOXpEbVcrZVpNNzluZy9S?=
 =?utf-8?B?M1dXdmJKamVRZlRDOEVLeDVwQ1A3cHpNNzQvZDBib3hnVk9udm5WNDl1cTdX?=
 =?utf-8?B?TnZOZHdQTTh5RUQzMUxZUXdSRlRrbDByMm9uakZibHBqK3JTUkhmQ0pDS05Q?=
 =?utf-8?B?dkM1VzEyZWZKd0tJbU1ieFUzcXB6KzJKTVZuamF5Tnd6YXprNktjVDRSYjJD?=
 =?utf-8?B?ZlJUWWVZMHNLUHIzdHhjcGtSalhESVlWeTdpM3F3clNzMldTT3o2ZmVHejBo?=
 =?utf-8?B?NlYzdlNzV3hvK2E2WDJHSmFJamRVTXMveXUxL0RldGxnZ0FVSW5UTUorbk1Z?=
 =?utf-8?B?bGptdjgxUFZIVkRUcS9XdmN0Z1FiV2hwNm5qVC9aSUxOUFM3MWRKZE5mcUlC?=
 =?utf-8?B?Z3hVMjc2NlYrYWM2bTJmbVorOG1MaEhEcDhCYVJEMWRVdGdvQXg3RERKK2Mz?=
 =?utf-8?B?RGo2NHdiRU5SUGNNYXU3L2NJNDBIYlVsQ0hlZUhNQURWT1ZjaVlEWUJtYkRV?=
 =?utf-8?B?REhBQVRmS0ZPTlFqN3U4OHNzVzVFc1I1RTdJT2psamZyeW4ra0UwZ2g4L0ZO?=
 =?utf-8?B?RjZ0L1ZobmdoYXNXTTh3SE1SSEVCblFiK2wvY1BWK0hoYnFzQ082eEt3dUU1?=
 =?utf-8?B?S0RrZ1phaERUbHpnSG1CV29ZNDFhcjduVzBXdSt5SkF6eEZrN3NsWmNkOXpU?=
 =?utf-8?B?ZmtmQjNXTFVIeEhCNkJPVlRzYlFlY0JBMmZOM1RIdzlIUUVGdTBvRUJ3Ulpp?=
 =?utf-8?B?Qms5MXZqZnlRM0hzR2piVzVQTVRSaFZRdno5VUc2MjM0Tmd5dUdseE82WnpZ?=
 =?utf-8?B?bytSOU5Ia1VDSUpTcUptRHN5OC80UjNlN1o3L0lRTTVKeis3L2Jzb3dHc3RK?=
 =?utf-8?B?YmxDUWYva0JxSTlXNlkxN2szTVlkSkdza2ZraG9uZlpkNWNKWEJDdUMycUlt?=
 =?utf-8?B?TDN1ZnJBWVlXL2RvencyeGNqWWIzemo5dDJQVzhJaGoxbi9VSDZkQ20zMDhu?=
 =?utf-8?B?cnhzV0h3UytSUzRzSERPQUN5bU1CU3c5aVRtRlpSbW1QWnpXZXNMRXpia21k?=
 =?utf-8?B?YzdKandtUVZFL0JWWkNBUFl0WWQ2RWMzVTJPTURnekJNOEdVdzE3dEdBcWxk?=
 =?utf-8?B?ekFWclFWVnliTWtkc0VtTG0xSGdyL0s5TkNNSlBqZGdDOGVOQW9DUk44Vk1W?=
 =?utf-8?B?U25PL29ScUw4SnZQN25lTmtyZUlTUFNOYXliWUZsMTI2eXptTUl2ZnArY2lC?=
 =?utf-8?B?T1hoYXNVTHcxbUk4bEs2em5rUDlrNStCRkVjK0VUaXFLcGlmL2V5U0lRb21S?=
 =?utf-8?B?R3dPL2V6Y2l3blJlS3FadlpGODZ1UmlCVDQzbXR0dXZBZW0xRUtZemlacFNS?=
 =?utf-8?B?QlJrWVRPN253SmJCS0RaZ3ZsLzNzTmhKZ2lvTHlxMGU2WXFFcS9wUjRYS2lw?=
 =?utf-8?B?bVVhTHJNc0IxMi9xWG95Q1M5UlN5ZU1nOFR3VE1YS1A3S1ZSNkNFaFB6SzJt?=
 =?utf-8?B?L1ZGV1lpb0JZVnIrTUJWRGJLV3J5dHFBYUpha1c1ak1sMUkxZEE0V1RtVzhM?=
 =?utf-8?B?L0FOaGhiMDRjcnY2dTE1ai9RMjdNSTF0dGFlU0hkdVFQQXlLdXdoRkN1YU1K?=
 =?utf-8?B?dVNab3BNSUtKcEVBb05PeFFFWkc3T0JTRUFpTWFtSjQ5dXFoWmQ1Z0lzNFg2?=
 =?utf-8?B?V2MzTHRNTTQ5K1UxM3Z5dW1NdEpNUG52S0F0NjZhTGJNVVBGZmhCNmpUQmdp?=
 =?utf-8?B?NVN1WUM0Wi90UXRsQ2pOMXBzVEQzQ1JXYXpBc3dyVCtNL2UrdDJtR0ltMkVv?=
 =?utf-8?B?Z3ZHalZVRVVDUGhYb21yZXd0ekRFL1dibnZqbktOZ2Q0RjBXK2NyTHFCOW14?=
 =?utf-8?B?K2xYUVZKckk0bG1oMmVmdDVGcmJvV2xBK2U4TG9DV1dhb0F0ZEI5YVJ4WW1H?=
 =?utf-8?B?bGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c881a3-03ec-4b27-f6e5-08dd0e0faf8f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 11:44:29.0790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HL8JqmW8gnImqJV6ER5jRGCPmHl8M7hHhQFzHWNMm8FTgAr+n7i4GcgwMzWpXz7sa7VN/PdA1X9UG7/Usvde6yrC8a0uTYgquDB2i1KiO1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7339
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_034433_261449_59F5EBFE 
X-CRM114-Status: UNSURE (   9.50  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

The RTC hardware module present on S32G based SoCs tracks clock time
during system suspend and it is used as a wakeup source on S32G2/S32G3
architecture.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5fdbfea7a5b2..584cef78c984 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1209,6 +1209,7 @@ CONFIG_RTC_DRV_DA9063=m
 CONFIG_RTC_DRV_EFI=y
 CONFIG_RTC_DRV_CROS_EC=y
 CONFIG_RTC_DRV_FSL_FTM_ALARM=m
+CONFIG_RTC_DRV_S32G=m
 CONFIG_RTC_DRV_S3C=y
 CONFIG_RTC_DRV_PL031=y
 CONFIG_RTC_DRV_SUN6I=y
-- 
2.45.2


