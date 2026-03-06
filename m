Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995BDFCB61D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2LzxIp2q424U9poxyTaIojWjRzefZQfJ+XF7mvx+pY=; b=43rocZRk2AWEZBs/KNKQeO9jIu
	6/Ohh7kWxdPbJ/hlq6i3Ho/Fjh7/fT2hIFFh45cUpTiJArw002s+4+T+M595we2440Dq/sypUt2dC
	lQfFB3VOPK0XkjOXVO4bj2WNQFnYZg9R0v4O0f2EbEa0Te7KPK/845yhVWp1lf0U300vCxIfBENWf
	7WLwbWaepBP7OPwke3Hzv0JjdT+UdE5awgMRPwZUSOrcsZynzxFdjvvTE1gyLYl5/7chxvPpcRU2G
	IysDSyR4FIsPK4QVRxrMrKvX6rDGou0LIUKbDqWHN9K9XKDZ/33O+QK//UjZ+afk+eUTOErZgXRqy
	3q/bPRaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXdg-000000046pN-2sj3;
	Fri, 06 Mar 2026 16:02:56 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXde-000000046od-2Iop
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 16:02:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BrgqZiZIHMjOozJkJ5j1aOmBcR2IvQIxLPYbxWyJpHzHImY4w+jh7c0t9AlCuq29sE4NpLMZjKUFZeGGqGa+Y6+O5XRcoWrAI/nph5KQKgTSgDaMmGLwBVLPaIXhDjsw1EJZRbO0dVpz79BYXBtcnIHjfb6pHf0drciUrW+y6BWcrjG6Lm9VTKVuTxieE+7ma+K04eKM6oOUWRONoiT9pRTPd6Fi3P7JqqC91xyZbILP6oNUOpwBl7JtpPpmyNG5h/Ue8BT6xt9u1fbbPSzkWvHLCGEnLIsjU35Pl7/SXzkUgAiTB/73o/+kyOL0pVLXsPfsTqJ4+YqrYUq8oGfQ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2LzxIp2q424U9poxyTaIojWjRzefZQfJ+XF7mvx+pY=;
 b=edzXOt3y7tSvuZcm+V8DiY2Xy5cxlYatEHCtLxBSzOVk08oHViHsKeomedmZ4tgAIO9r0cr5bM7qKRxs+iE0qe08mao2P+6IARi/jLjvmlKZ0PhJRFN36TByYM65Vjn0hjygpqZLs3AGK1GYn9rfxZbqq29r9ohWpCiiW+aHg8WFrpxicjMEsvyO/0Jps5B+2Ms/Un9x222mcttRipU1eEUMEfp7ihmHPkst9uvVQxrG662oPA17NpFySi2+YEUJRz5DsmGJyypk6B03ge4qJHVr3Lf0ewrYv+QAkD/cRFgtsFzQ7QyojZay3xP/H3L2MaR2k7X1VEvjcm/R/DdLEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2LzxIp2q424U9poxyTaIojWjRzefZQfJ+XF7mvx+pY=;
 b=XqS2W7n8I5uCJJzBYYrH3A6jyg21AjDSDCsPXGl/VUq/s5hXaQwoChas9tzcRvGgUyftyJTJR0Z6mG0O2hGUP2bKDeGb5G69/r9RTBmtTLHgOxo6JMcTQ6Rts2kZ1/eARRhjdreBtpP4LWZuDWaUmQhnfNu6mBhxftWiPwxrA/a9TB4Kw5C+A7B4QD+brfFHGIgFtoanpndPWF0lsF32Izac2nDjHhq7W1MEUAr57oq1LqrMA0guX8+NNjm5aHzFAYo/19beroZOkHscA0nkwQJOemd4cqRsmBeQHcBuPWWUeW3oRbuB00FR/iq0MARvMDi9od7X2zfdg1ZdRK5bQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7678.eurprd04.prod.outlook.com (2603:10a6:102:ec::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 16:02:50 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Fri, 6 Mar 2026
 16:02:49 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Frieder Schrempf <frieder@fris.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 0/4] Kontron i.MX8MP OSM Devicetree Fixups
Date: Fri,  6 Mar 2026 11:02:30 -0500
Message-ID: <177281293090.267666.2279739168174022521.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220103636.9697-1-frieder@fris.de>
References: <20260220103636.9697-1-frieder@fris.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0181.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7678:EE_
X-MS-Office365-Filtering-Correlation-Id: e1bf4b38-8a86-4782-624c-08de7b99d0b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: E887sVfowvccK62vh8YIZs1F0LAWMHJNM8mJT1zW1Ebqy9v18tgJKYylqIY7vj6w/VnBNc+BQeQDwcrYUIMh6C3oihQ/HumykCkQ3tBS5bed4+NrRyd9BnnH9fVCxH7Wfh0axpWgLjMP9nNsl2wFVAUUSabKODgH28YruFfZbKxDwrb6M034JxX1rrVufZU/kz0bZWSYwu0jti6e4ypwBLZMdrGiZWJTpOqQNYBqmgG2S9nC9Zy7G+/WQ1Wan8VKb574DRfNcEVNBs4NqZEJW9CxTkXTzYjo1sLCZe9d2wAG+QBQee2i5KPDU9feJWBlcoAz8nV1yMqaioqVpCn1HraRgbFLHFAw67YLEoWA6uFjo/Bwn0F1/wo2vOKrmKLieHNbPAyc8elWbjz8Omyj4PJb/Z+0DQWJgW646OUtBOqLObjrR6PGJDyqFe9hB3sUaJ5xwtlBBBRraJhWPbu7VQRBWNjd+OYQPutobUTvRY4/ID+f3U2kWHS/XxieZZuBh+QkVVyV00FPNtHWOnZUstS0BPxYSkqIEqYDqh5HbYm/mTBvGXZNfw9vLFjQQQ9gcTiTuFdLYheP7gg7ZC1Ghk0vdCbE7UYV2FpqcBLVhEME4V+1sevRAgIwFJCUOES1Ni76Z9hoOViv9frXsdUXAJ+O4ZPjSUy5wjA3krFw+56Ffcw2u4Nc5CMy2qOZARxxM3LUPx1Tb3DL7tJjciB/Zez9DfuQDEtW7iI1hdsvj56I4b6FAd+brIBsrCPrTjwzcLGiDcG5be8VS67934mUcBPLbk8LAfN72m/rEBrOBjmqGtq5JUmCdzb15IUQmGFz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0x0NWFTcEs5YkdKOWMwWmlwQTRqbm53M1krbXU3dDE4Z0RNQ29HcVNOZ2Er?=
 =?utf-8?B?S0wxZXhzOG52Zys1RmVSVVZQdnptdE9zQm5lNVJ4cDVxVVdLNjVkM3pIeVZh?=
 =?utf-8?B?UFBqS3NaWDVpd2trR01hcW1BRjNGSTFiODRNamtFMGJ3Mk9pRVRnVWxSSVJw?=
 =?utf-8?B?MjdyY1RmWmFHaGo0ZUNmeHVqaUFaUFg3UEM2bUxsRGNYMWx5OWpNWW4zQzE1?=
 =?utf-8?B?S0xQTERHc2tsNGR4MXVBbFVrQnRZcVlhdzdnUzRKQXFwQ0gycEZ1VU4vem1m?=
 =?utf-8?B?MWdXekVlUU1jeXJucUpTUmZXd1RrWDVHMnQ3dSszRU5PVFFSVWJFcjhCTmZh?=
 =?utf-8?B?ZGhOU2R4K1lIOWNUak1TUk9oR2VUcGRUdGRLWjJPVGhOWE93M2RVQnZpWTNG?=
 =?utf-8?B?UEVvN0t0clgvaHpMNkpQMzVHaVVyYUdESWJpOExJL3hKRGczVHBRQTd6RHE0?=
 =?utf-8?B?bGtMOFIrbjNoYU13Tzd2SFgyNXdhaThFM2l0b1pyWWdTRWFBNmhHOW53bS9V?=
 =?utf-8?B?dVVFZmFaV24xTWR2MWFGNVIxQlJPNlk0Nk1tamc3WDdIV0NjSlE2VFVRUThR?=
 =?utf-8?B?UTB1R3BhTDh0WU1acjV0cHRMYkZsTm1uanoyMDJ3RkZUL21tbERrK1d5UWFV?=
 =?utf-8?B?YVZkQy9nK0tRUGhUL25IczlVUkpOZ1htWTdqdE9kWHFhZk9SR3JIdmtQdng2?=
 =?utf-8?B?ZkFQLzBlYnlYZCtyZng0T1EvT1krZE9UcHNvUUxBTmZ6SDI4KytHQWowNEVN?=
 =?utf-8?B?VjM0T3AvQ1EzR0MrT1hPNGRzaVRNbFlmckJSRXBlV0VsWndFb2NCOWN1TnNZ?=
 =?utf-8?B?eVF5cVBUdi9wZXp3MENmV1F6VWlvWFIvVEQ0ZFRLWG9ZckswaFp2a05XZnVw?=
 =?utf-8?B?NjVVU1I3UUxSK0I4ellhbkM2STY1SzVYRTBXanZ0OEVLNENCRjBqellEdXMr?=
 =?utf-8?B?N1RvdVdMQ080bUtQQkNtMytqcGZ1R0tEUGEzaEdBWFN3eitnUXFSdnRTU0k2?=
 =?utf-8?B?cE03bDF5STZUZ1JUSFpqZTJTVEtKTWZ3RGRIcVR5MXBtOGVxZDBOTEZlbzRD?=
 =?utf-8?B?U244NE1OZlp1aDlNUCt2WHpwSjVmMXE0bGc2dkZFZnc1YW82eTNTc1Z6allz?=
 =?utf-8?B?b2hMMVp0N2VOenVrSVBPdXNjVFlqeWlLekN4QldheW1Td3IydUx2bjlyQ0dh?=
 =?utf-8?B?OTBjd0RkYkVPUmNWQm9uOWl6VzJsTjd1ZkNnd2dhTUN4Y0FHeGxRVkZSbS9k?=
 =?utf-8?B?RUNESmNRS2Y3Tm90eDAvT1cxeHRRd0tVVXNWdE5lVzR2YXBaQmtmM09UY1BU?=
 =?utf-8?B?Q0hzVVdUL0RScGU1VzlNc1RBeXhpcDQ3eHVNeDA3ZXk4SGEvWk95NnppSlUr?=
 =?utf-8?B?ZVJ4aThXdmlWQmI3OS9YOGlaZCs0U0N1ZkhmSmVMRmtHbkJtaWt0VC9hWVZU?=
 =?utf-8?B?ems1MnRjTXVZcld0L2Zyd1M2OXJlcTZxT2dxcEQvaEhKRk1MMjFlYjhjVy9E?=
 =?utf-8?B?L0xnaUZKRjg2TlR0aWM2V0tIQ09Ka1dPaVFFTDkzOWIxTi9CWTB3Vk43eVNz?=
 =?utf-8?B?OWtSelR3WU9pSW5rVVZKZWFGK2xmU3VsYyt4dUFDd3hVTFE4TEh4KzlhL2JP?=
 =?utf-8?B?ZVlSWXpBSzJXNURFWnZtNmxhcnZYTG1ycVBSQTR3dE1qcHhaNkdIVkNCaVc3?=
 =?utf-8?B?c2NHZDFYZzJmVVFoNjl6OHA2K05kRE9uazZJcVVKejM5R2xESEJjQUpaSklB?=
 =?utf-8?B?UE9zdTBtQ3BpYWFkVlZ6Yk5yd0F5QXhiR3MvVDdCekNQK2tuZk11dnUyemFi?=
 =?utf-8?B?QThocEpNNDd2MXJTV3BuTWw4TkVpaTlmM2tPdlVNOXJmbW8xbWZXblFhUk9Z?=
 =?utf-8?B?QXJUYmFFMkRjSTBlQyt6V2c2b0JHZjBLM0o3V1RXem1KVFVQVlNwWXZseXJ1?=
 =?utf-8?B?KzBMaTJrQThOaVFFTzNGc3l3L3BwaWRFdWNPMWxFcWRqNVpvQ2tsSXUvOTdi?=
 =?utf-8?B?eDJWT24yT05KVVVKa3VabnFSZXRjcUVLYWhFOE94TWFrSjBQRkg5SXRuL2hJ?=
 =?utf-8?B?Yi9BS1R0WVFjN2NJT0dEbHRHVXZtVU9pUjN3Y2wyNzlocUJVNTZFNVhYVERP?=
 =?utf-8?B?WlpyTWpXOUN1c0dUNHpXcFMyWTViQ1ZXbGxPN2swVTFMZVQwY2NUS0wvQ1VI?=
 =?utf-8?B?cUFoUGw0dDkyclVrT0FqdlBSQndSLzl2ZG8ySnpXRlhHU2psdTJaamw1SUdk?=
 =?utf-8?B?eFR2dnpMSEhxaTJXVURIKzVYWUZyR3lGOHRZYWtJRGpydGVQQ1EzNU5abzZj?=
 =?utf-8?B?T2tTakFHUDM3L1QrV1JJeW0vazJtdUVnVXFld2FBMlZGT2lUVGlvZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1bf4b38-8a86-4782-624c-08de7b99d0b0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 16:02:49.8639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: caVIPxhCclDy0f4ERduQn2Yjg9bLmh7CA7OVhnl31c14ULMMnKjCt67tScwGIAp77GT+AgM2ehEzkuyaYFkWow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7678
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_080254_590084_3825C0C1 
X-CRM114-Status: GOOD (  10.59  )
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


On Fri, 20 Feb 2026 11:36:15 +0100, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> This contains three fixes and one cosmetic change for
> the Kontron i.MX8MP OSM devices.
> 
> Changes for v2:
> * Add Frank's R-b tags (thanks)
> * Enhance commit message of patch 2
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: imx8mp-kontron: Fix touch reset configuration on DL devices
      commit: ed35f6162eb43e5dc232b91e903e6a76ee5f5601
[2/4] arm64: dts: imx8mp-kontron: Drop vmmc-supply to fix SD card on SMARC eval carrier
      commit: 02ef82e09f96a0f5c996cdd4d62e66cb80df9f0f
[3/4] arm64: dts: imx8mp-kontron: Fix boot order for PMIC and RTC
      commit: 0ab1f5f3652424de16b464488c3d3db3d88b1bd5
[4/4] arm64: dts: imx8mp-kontron: Use GPIO/IRQ defines in DL devicetree
      commit: f7bbf27af999ed3f6568f0266e112eded96f225b

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

