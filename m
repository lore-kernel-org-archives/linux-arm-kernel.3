Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D4FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 15:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DX/OW0Lp1gRtZhhH+wij+01ncznazuZGsxSvAwGCNj8=; b=Bv4id3IFeFXyDEOThfxs3C4DlM
	Mvt7RvWO1O/HqGlCZAeJNXBW183aj9hqtZ6ald8SgNfL5ykyJcXarA4SApdEeKrxLOKO88lVx9Vnk
	Et3gGn6HngFiF7VagS12Z1FrS1wjPvy6LQBSS5GfYDG+viLT5GmNBU924ughxRYYxXMeTjchCn6fP
	gcu0Badnqsh1wKTtj1n29SbAkyxKeEcX/uTpOKnMlRpiZyYoC2ky3D3crNdxqlWSsmZFJPwrHP17G
	r6XNqbIH5veTL+wmydR6z48/8Ow6gATyBkIkGrzJnesDh55ohtmMfOZfGdJMSWz5cOU4ypPN3nawi
	YhVulWIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weE2N-0000000F5lT-3u9j;
	Mon, 29 Jun 2026 15:36:43 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weE2K-0000000F5ju-2XY2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 15:36:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUJXHnqPtL3kHlKB/98xFglkBsqcJMF/4samdOKXDMdYmhwjSXW8ytFwplgpR8ClWbdjgYjeTQmz7YIzc2K3+Rw0q2Xk23Jk7GlGuBHj25XzWo7S5JeLo3eFj3fO/rUoRfxqj3IWNuejHvAkhnouegitqtEj3u23bqM9V+KPjd8KzJml2sxKqmOkdyCCNTMzytS7Gfba5m6r28u3ciGY+7ezWbLNSl+yGOKCIHTZ+3F58+B3+NxOjZmoMHmvI1dwhvkEJplqZwpBTDihQGKvuNWItyBMnrz8AKTCDrtVB2z2nUXjz7ek5Hr7nWPUTAupNuxevabVlaygdSpDDi5XTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DX/OW0Lp1gRtZhhH+wij+01ncznazuZGsxSvAwGCNj8=;
 b=tD44R63ER5H9iRdlaceGQ9bwY+nfqlHTGpNfMKG9WsPW83dbZW3elrXQLl0c84fGWyGiCwINBZIiMKL8jqPqZvJ5Qk+SZMiFLwib7U5yKXdIqoxLWchtcM4D57+GsZF77VxKCOC8SbL/L9vDExBrUBeiOd5eKB+5rJUxTI6i+l6bHjCEadpQySXCcYNskrZlZ5EcYUj88h/4vpzBoD05rYyTtvVurjSwVuzNIVa0eddNEW4pkEbfpvQHTMJONvF9VLMYWwBsdF7uhk1H5+YF56o1esKIOlGAdiSQYPhSUsdXa0zCiH/X8CK2Vuls47tiwvmzvfjBfL1KEHPTbbQiuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DX/OW0Lp1gRtZhhH+wij+01ncznazuZGsxSvAwGCNj8=;
 b=L7dPqVXv0THIB7BnucfhyP9b3Qqzl+Rovti/t2aDxjjrZBtXR6R8ywST9tQoPOqW+on/i22cInjWi5GwgeHj2gmb1QhWp1+FvTAMxnsAddEwXV24+zDveP6W7G6MA9KcSMKGGq8E6XXoOt5BWPakK8B6mCkibRjjUVjdlxjxxjau6wGZXZbTSpdoDZviHDRwR1HZmAhECGzzgQ2EYdSaClOdhs/mumaN2v8GoVLxH+dVIn1I38wrCwJYZ0xXMkddl0nG+7QRvkHXwxfGWmFhtL3sfyfy/ppNqwfyktmOnzo3w+5GYeiqWnvRuvN0rw4/jDEQlkkQICP8jXeRNF7PSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11959.eurprd04.prod.outlook.com (2603:10a6:150:2f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 15:36:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 15:36:35 +0000
From: Frank.Li@oss.nxp.com
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jacky Bai <ping.bai@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Alice Guo <alice.guo@nxp.com>
Subject: Re: (subset) [PATCH v6 0/4] Update the thermal support for imx93
Date: Mon, 29 Jun 2026 11:36:28 -0400
Message-ID: <178274737645.2243401.17591646089582925590.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430-imx93_tmu-v6-0-485459d7b54f@nxp.com>
References: <20260430-imx93_tmu-v6-0-485459d7b54f@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0210.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11959:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e85f2f2-48f0-485b-1f36-08ded5f433c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|23010399003|6133799003|22082099003|11063799006|56012099006|18002099003|921020;
X-Microsoft-Antispam-Message-Info: Z8GFa+68yuqlAC79Lk9eablHJcaoLUhzy7CYQ8fgyM+XQBbOZTHYHZv8bodF81r5IYT2TwF8+4Q5tGn35MH5rbsUcDPCgbpOc5fS4mS/sSkWOW1jSQi+LGOEtCNrWK5NhNHIaKMkG2BV+T0l3M4DuVJ4cMsRD1lMZ2F9pXXfo4E7zdM20+UvaUlEko7gfw572OYW57NTSYeu9yAf6w+f6hfmdyfzGgziMP6Sn5kCF+rccM+XsbrvM8DZ0Xc7tb1TVBv5+jXKQoqkibdWuwp7I3GEpKNknr6rdYs0PZ51/OXs7XC2Xx93wZMr/JVkmrKbZ4VSMWazhabTiWOlQEDUgsGyOFrphE3dLxNVv6JLQd3jOUbbAh0+4CqEsgdNCqbFJ/2iiK2ooZFz57QnihMKxuWUdasLudsYm1EjRWGTgG9lGdvvP1J0Ve12Pa5NIThZm2yBsCnhDkTnK1gaTpM3iLNja/nsvW03UjqnbywiaJaHrKJkLwTwh6td+b0a2602sC8PMU0ap/BWMNRrRX4euAomtc6p7xB5I+L08gASjFux1nvvXwaFvMUG0fSJRbxFRhvazb2qzbopEAOu30IlWqm3z0zeMigtYd5ScoEXVSOTTLemK48r0cqZCFS7FOhWQ6Dqe/EnIOF1wswz1e6pU3UEL863/Gx/Ga+AZlmngdsZvXlxEnV6xssdqDF3NUmE+cZsZoy8XxPGPthvM1UDAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(23010399003)(6133799003)(22082099003)(11063799006)(56012099006)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0NKRVRHNWx3b1ZmNmxRTG9RWDYzejZMaWdEdmJoZnNPd0FQdHVBcThrSjNO?=
 =?utf-8?B?UjBqSEp1VmxqQ1ovTVFWVzVUNjVpWkxRM1pEMGpIekZaRzAyalFybWcyVkJF?=
 =?utf-8?B?MXptV0RrMXVPcU95bm9BMnFKd2ZsTnNaSW5aNm9lS1BkREh5c0VlRTl0ZXd3?=
 =?utf-8?B?MUlPaURsMDVxcXJ2WEJHUEFCdWcrTmk4KzBEeVFrUHlJM0pqR1lUMzRQZTlp?=
 =?utf-8?B?R0NMQ3JvQTVtRThuakRLZU01d0daTlluSFhKQk40cEhUM1kyNHcwVEdYYzJU?=
 =?utf-8?B?Z1pkdE5la1ZlK2tPcE9PUGl2NDFuWkVXd3l0ZDlaY3BQN0F5VmZxRW9CTE52?=
 =?utf-8?B?REhxb0hLMTRLbXFENU1DSEwySVFtUVJKaFJhYWJ5Q05NbXhjZ1lJS096UEZv?=
 =?utf-8?B?QTVQNE1yam9SenV3OVdzMWFTN2lnVXVlWmpqYW80Uk1LMGtBUHoycGRnRnFP?=
 =?utf-8?B?cjN3aTRndkRXa1R6Q3JwV0UremN0d3VjbTFIUytwWVNLM3BRamszeUlmS1JP?=
 =?utf-8?B?R1pkYytMNFQzcmY5ZXpPWFphdWN2TXM2L1Zlb29sbmNSZ0I1SzJlOEJhUFkv?=
 =?utf-8?B?b0xkT2lmNDZLTVdUbFhKT2NpTnMrVGVrZEVBa0pjUkE0Z25LSStuQWhRRERs?=
 =?utf-8?B?TjVXT2RKYUZJN1pvOFVteTRRUU5ScnFocnNwcHlEbWcwVVFuUS9Xb0tDUExN?=
 =?utf-8?B?d2VHYzgvYXk4cEMxanlHOEdnT1h2WEpTWXR2M2grejdXd0VaQUZLQ1VMRDBE?=
 =?utf-8?B?cnlIcjJBRG5zNHo0UGVha09pbzBtU2loRzBzZVNZanBuaFZpSVRHU01Cd1NP?=
 =?utf-8?B?Zk43MTE2WXRzZDN4eWp6eEYreks4bUp0Y1czM09aMDVDYkplbUdJam8zWW1l?=
 =?utf-8?B?ZGM1YXFGY1dTMlFWOWZMYUR2dnVPVkZxejBCWXNLVmcvQ0VSWHp0UUFjRVNu?=
 =?utf-8?B?am5oRjV6VDhESW9Gb1VKeHIzWlNXVmlGcE5BK0oxdWZFOEUxL3cxaXY1KytJ?=
 =?utf-8?B?aXdYWDdpQm1IQWsvclozS20waWZFTVorNGR1Z0tXUnE5R3VXbCtFdjZCajBE?=
 =?utf-8?B?b1J4U1NrZmduRVdaT2JvSjhoOCs3b1BURnhxMHJkdGxXNWExWWtWekhmMFh2?=
 =?utf-8?B?MVZLT0dEQnhYd1BYVE9FdlVCbXI0Rms2aU5MRmRtWHR1RmJ2YU1XS0NJaW9m?=
 =?utf-8?B?U2kwZzJlQ1JoUlNFMGVkL0tmckdVYkVFR243bC9VbUxCV1JvTzBkRXdLZUd6?=
 =?utf-8?B?ektNV05Na2lHTFNDUDVYRmxlSGFsekJrVC9IajdyeEhqSE9WMFJ6OHdSMDlL?=
 =?utf-8?B?MEJpUnNQRWlFdXAwMW5oR3J6ZFl4VHlCN3U5UzlWcXJpRTJCKzdHUkZUdDhD?=
 =?utf-8?B?S0Y4eTdpQkYwUkJmRUF4SzROeUVsS1l1VVppcFdZVU1tZmN4Vm13WllJSW41?=
 =?utf-8?B?N0dId0FEN3UvZGdEbUNDenhOdjd3RkFWWW9LQkppeGU2SW1qK0puUWV2TWdk?=
 =?utf-8?B?QllTaktnY0ZOb3pEY3A5VE9WSE9ZOE9NZ1RsSDI2WmUzcWN4K3M4aDN4UXZm?=
 =?utf-8?B?UTNTZFp0RWRRT05ETFBISS85VjJXTm1KNHozeVZJNHJ1WERYQ2k5YS95emVn?=
 =?utf-8?B?SGVQckVRYTYyMGxhTHo1eWJBSE9rTnpLTVNPeEtqcTh3RS9oSjBxd1Jub0wr?=
 =?utf-8?B?b2hNcE0rcjBPOERCaEpodnYwbWxqQnVHV2hWOEF1SDFUNzdlc0VYaEQxYnNW?=
 =?utf-8?B?Smg5VGNsbnc5V21LdmxhT3pReTlXU0svcVFHditBdFpabFl0QnAzMFJqcmsw?=
 =?utf-8?B?QkpLNVEyR3JrRlYyTXZONDBvQTArNHZFQTdqZkRydW9aUXoxVndzakV5NzA3?=
 =?utf-8?B?QUFzeEZJMnU5Ti9JblY5ZEpESExIQTJQZUhVclQ2U3AwN2hnN0VHRk5CWFEz?=
 =?utf-8?B?Tklob1Q5bytZVW50S2UzNE5jelRRUGMrQTE5T3RKUlpVc0lyd212L3pncXNS?=
 =?utf-8?B?TUQ1NkdGbnp1VnVIQitKeVpOZjdsTGdGZEtzcjhVYTdzeGw2ZUF1OUNFaWs3?=
 =?utf-8?B?RnVzSXZ0dFdyZTRTUEVTZUw0VWYwdG5ZZGxJSTBXdXQwYkZTb1pkV1BHNVdJ?=
 =?utf-8?B?Y1dWL2ZsaHFCVU9wRTBPNVpUY1doUVVuN1puaWNnemtPbFR1ZEpXbVUvSGp6?=
 =?utf-8?B?aFpKTnZpQm5sZDJOV2s2MjdiSU43SVlaTVdjVHBZSVFmcGNWVkpIT1pVV2Ir?=
 =?utf-8?B?Y1ZtRzNtUWxuNkNQSkN3WlBJVnlxTDhEYVZTQmhzQ2hDWnpCZ0JFVUNuZjhK?=
 =?utf-8?B?dmdCMnErT2x2K1FVQWYvdDJwZEpjVWVvQm9vSC9zVDdBZGpka3FOb1J6UlRO?=
 =?utf-8?Q?BBketWy11xCEJ5WsKPv53UnldYQNml5GHZJ1f?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e85f2f2-48f0-485b-1f36-08ded5f433c5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:36:35.2086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fPzOHOYzG8pxxKcOqFTheOuG3mHBfTNpM8ORytuZ+TknMOgiT2nct+uDJa80vkQUNj5E1eDn/2ZwaP5Tm+GB+54yo17u5HnVPWiHF7MxwI4JSNNzIFy/NB3bjxUQH/tH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11959
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_083640_672682_880BBC0D 
X-CRM114-Status: UNSURE (   8.62  )
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

From: Frank Li <Frank.Li@nxp.com>


On Thu, 30 Apr 2026 10:53:29 +0800, Jacky Bai wrote:
> The TMU (Thermal Monitoring Unit) on the i.MX93 requires specific
> configurations and workarounds that differ from previous implementations.
> So, using the 'fsl,qoriq-tmu' compatible string is not appropriate.
> To address this, a dedicated compatible string and corresponding driver
> changes need to be introduced to properly support the i.MX93 TMU.
> 
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: imx93: update the tmu compatible string
      commit: d911a33fa8e9fd4c691bc8429180fe1885bc3f2f

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

