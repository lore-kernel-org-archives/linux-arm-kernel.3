Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06A0EFCD9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHZ3ytcljGENjOgjR628cE1Gk7wTjOUg1nteGk30ggA=; b=Gs8qrgW04rfEDInimlzsDqlEd8
	sZcCoUBzuomLxIhmBvKdTyQV3hsN/0UEWt66o/6GFEQZAazP6H/we7dYFw2a3jYWhgtMva/YvMJ10
	ErkiX79nWiJYT7OS6KdzXvzNkL9QjWaxdaGMBB1OrazYreB1i3A45mWm3FMcIUW64MPkgIyxolBOk
	AoH6zrX0cGOiNWfSms7bmlMN31DRSwYc0sPw88Gp/rRzio7DgicdDZbGhoL/Cu80o836NYFx41gPQ
	g62IOI5ZYZwsh+4t/qST0uV/BK44pQRmmxMklpkP1cekOl3DIisW1HnwhO23eJUCRVhwsRM0IHNz1
	n57eD7cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztch-000000097WD-1O7c;
	Tue, 10 Mar 2026 09:43:31 +0000
Received: from mail-westeuropeazon11010004.outbound.protection.outlook.com ([52.101.69.4] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztcf-000000097VU-2FrS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:43:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzDXER/KewebiBd5wefcHSCSWHhxCVItU/cG10Lp0vFXNQgAtkRpmi4Fe0DdVRSd/JKgRMZc6zy444gz3En6wnb88+HKcRREJUvVXePz7RyaPDFoJHmRWJb0DpqDwLRLM7AINMsmfctovyt/RT0MJnY3fO5d3Z/hf7IFtROzlbvctC3pC2RtkntXloJXxZxJm2WL9DSjwVCx6ALRxM7S+c/y3InsqYkpUnaFxb6nW/L4i8/jrbyLcIO6Q6GKUi9Rb/Emg16/kNgngJqSnOqpxKUgIscG0s2dhCDv0Lsid9m4RwVp9wEmS0t/+vdTqtP+VB9vQy+sFdbCU8xG2sQvWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHZ3ytcljGENjOgjR628cE1Gk7wTjOUg1nteGk30ggA=;
 b=pXk58Q13tbjH0LPCsRy4Zm/MlmjFPc69oA678MNVNN2Rsxug2THfcwANeWhqISxG370FGSPZRwOn7reiCgEmWENy+uta19Y78rqmnm4CNQNbvdZN43MV61oEoLUzcq/MnmY8FZlzRIpFHJBlGVnhiNfnYmF1JJbK6OfxQrE9Gesx933K5nJdDS+2EbmgzPWbgYS8mgeBuPE5PWct5OUPIa+cmqSWzl6zy20XDKKyOSZ6JjhIiAL6DZE1Nfk9E5ghzh7dlzSBzsHbWIQXFrufCydmal10FChqiVNrNREZITTSdw0Hl9uK0hXYu4g5a7AcIk+u7nUHP/UlXdet7Y2HZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHZ3ytcljGENjOgjR628cE1Gk7wTjOUg1nteGk30ggA=;
 b=hV06SooDDQ+ThVtgovF/513f7XBBgQywQhuwSGxtJr7yCtabdKXGt9nFf6vQlmXkgG0Gn6axsX4NIXwJf7R0W+qzTkE9NEK2P1NqtE4iS4Y+SIyk03wNAbVq4fA3HcyW9Ba2jXSwli7pMKuUDZ97QB0lmcJGCWciLCA/IZcqU8M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PAXPR04MB8990.eurprd04.prod.outlook.com (2603:10a6:102:20d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Tue, 10 Mar
 2026 09:43:24 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9678.023; Tue, 10 Mar 2026
 09:43:24 +0000
Message-ID: <7d05cb19-8f47-4d86-86e3-e6fdd0c3637a@cherry.de>
Date: Tue, 10 Mar 2026 10:43:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: rockchip: rk3588: Allow VP2 the same sourcing
 options as other VPs
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com, sboyd@kernel.org, zhangqing@rock-chips.com,
 sebastian.reichel@collabora.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 andyshrk@163.com, macromorgan@hotmail.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20260304121426.1184680-1-heiko@sntech.de>
 <20260304121426.1184680-3-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260304121426.1184680-3-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::15) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PAXPR04MB8990:EE_
X-MS-Office365-Filtering-Correlation-Id: 826abcb2-ca99-4830-b316-08de7e897976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: 2L0b036mvPHNW/BNuRTewttLHDxf6tMJvmvEUmzEb/ntowCBUFed7BG+x76EL+7rgC/S3AEyQ1MoSdXiQuyNt69NKbRxhYXRimXVhj8s/Eq5fqxfWSfUH3WBx9L3aTOwB0cUQQfZFUR9OxJ6fENHxpbUXczT0fhe630m0I+NRLpFsU49CQnmNVkCXgF30VDxOYaBw76RifsNQotnK+RBotREZnBbkT/z8Vy77P0MiHWOyDJSZQoctp5SC80emKM9Ks3t3IPuRLybU8PX7H5VERgXtqXW3iRQGfoqQ6utGl6JcwEE80PL1GqGnanSEIIInoe5Rw5/2EhMPC8firrk26bsm3uEcON9/TH12KZnsQEfaZ6ma3aWmX772q4YOeTB3z8WaXrLyJ29KYUeIaA01x/1ctfDTZNJWe+mdyrNGwdRlU6hPx2P6n0JIa/nH/wbv/v30Dd8fNIYxv3m2141JihsiBoo/MpOiBDhagoIGYV4j9QIWJBAYO/BHFWVAy6eSA3kMKw35EBLeqGZJUW21U/WtPwuWfGN8pvMrtiQnYoh8LGwD6uveOl+giD4X00JPaoPr1cXeTwn+wj7bqg4eHh6h4xzpR4fdLYyzhWAepBtsEzpbXVVkxdX9dDQq+Qc5Au0AB3gmkNtiK+r2xRLUinxUCmfeQw7aHOOmTZdZkAmPb7gXBD8qD2cSeZB8I1Nl0Y5nvsM2sYP/xsqKjW46wJ2czNpjvyH3kb0xlzYZTM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTYxZU1PaWxXbmV1OUR2bnBsZ0d5TnVwT2xwdE9DS0Vpa2xLK1p0OU1TUnEx?=
 =?utf-8?B?eTJhOUtDUy9OaUcrZDRhWThFemlmVEMyYWhTSlpVNGNNd1lkOTZhdU91L3Jk?=
 =?utf-8?B?WDVnRmVwZllTZWVtaXlraCtVWUk4TnY2aXFJcHlPNHZ5S3dNV2FLRHBOVElt?=
 =?utf-8?B?dlI1REdDYjNJUXMwOTVjcWhUblVwMHdQOGd2SVRNNDEwN0toOGlwWnJ2OTRZ?=
 =?utf-8?B?a3NpcHhzVDRxOGVQbEE4bCt4T3lQOFJvUFdNdFhrTnhmeSticEFJTW9yV1Z2?=
 =?utf-8?B?eVQzaTg0eUFFR1Myd3RmbDN0WHF6VEtiZTczRVpySmhlRWlnMEJ0UmNMbVJm?=
 =?utf-8?B?WTJyaTE5RzRjSU9SWUZvbTNxOEF6ZDQ0NEsveHY4Z1hkM2dobmZ0YlpiNEFJ?=
 =?utf-8?B?bE1PTmhQWVprVzk4UGlEeFNtR2JDczhFMEQ2RStXaEM3VnYxT0hFYkdvWjFX?=
 =?utf-8?B?elhzanJaend4WXVjcE10MEFKRHQyZU9RWDVNYWFPZ3k2VkszTmUvTDdrdURo?=
 =?utf-8?B?TjdyN1pLMy9MdGo3Y0YzOFpraXhZVmdOenJHZDltNjkwMDVuRlA4NmkzZTJ4?=
 =?utf-8?B?Q0RrRTNJODQ2bDM5VisrYXZpYXhsMm1sRFUrbUtlOGVwR3RvTkozbXhZek1k?=
 =?utf-8?B?QlNGTEcyZkxadFZLK0ZDT3hiV3NYSXFXS3pBOGlNa1RORW8yK2dSdE15MVNs?=
 =?utf-8?B?UHpFa3ZnY2J0dVRtVDJZekR2ZEFHVzdjc2NYak1TaEFqZHNPaGdyUDFZcEhy?=
 =?utf-8?B?eVExWWxNZ3krcHVtcmlFTEp3cjkveGYrSm0ySS83ekxrZHR1cHlPb2xLMzJW?=
 =?utf-8?B?bHVRZ0hERGZ0d01HUzY1dWQ0YWlyQ3dLTXZlM2NRdStqV1RScCtLZkJaMkRX?=
 =?utf-8?B?a1N3SzBQRjZYTXF4dmVNeE9wNVNtSGoyQ05takxjUVBNMDVNOWpNWFA0NGJ4?=
 =?utf-8?B?L05kckpsTHVDekl0WWR4eURkOGhpS2dmMWZ1ZGRUS2hyYzg5N0RaS012U3cz?=
 =?utf-8?B?NmIwVWkyODJyOFNJekdBQkpsWXdJL0lGVEhlRWFzMDJjRG9tVEY2YnNJMlZC?=
 =?utf-8?B?alMwc2N2NFljbDM0MmlmSHBiNkhDQjVMNFNBTlBQR1E2RGdxbHZvalAxbTBj?=
 =?utf-8?B?bzdBYmlWMWVVL1p6MFpRcGZURTNOaWhBajNBYzVFWVlTQmZJdUxieFR6NGl3?=
 =?utf-8?B?dnEweHFLZWRiMUIzQ0V5c1UzbDhWNDhUdWMxZk5nV1JCc1JTOHJkMFJzYUV0?=
 =?utf-8?B?U29IbjF6d2lIeHJYakg5Yjd6dXNTYW1HRjlHUHFjUTliN21VRjM4eFFId0Fa?=
 =?utf-8?B?ZjFLdG1CNzFERExPQ1l5YlU0N2tzc1BzM3pobERoWmI3R0U5TzZSbm51bFRm?=
 =?utf-8?B?NlVnQ0ZKUHNEUWRUMkZQMWRQVHdrQjd4aldFVW1VQWlXT0dYOXFjdXUraTE4?=
 =?utf-8?B?aVBlRkJ0OFZQTWlRSFVvd1ZTWnZLMjlRWGorOHJFc0lKa21IVlU0aEZwc2lF?=
 =?utf-8?B?VTd6LytCaldUeTYyK095d2hrYkhTZFdkM29tZmZONjN3eHE1K2RHa0x0bHR1?=
 =?utf-8?B?YktPdjJWb01KSThQRmV0bS91MU1wb0dYZmN2TTYzVTJDN0NLOHFxNGJxNVhY?=
 =?utf-8?B?Rnh3Z2lGNUVQRnorRjV3ZE50OWpQOU93KzdsU3JkK0pvcjVUdlBUaFBGeHFH?=
 =?utf-8?B?RjF5d3lnNitmZ21VemMvcGNxbi8zK2poTU5qR3lBaVlPMVVRYnNJRXJqbG4v?=
 =?utf-8?B?amRaNGZKZmtnUzdPeFFnYUJYVmhqdlV2eDAycDl2NEZXQnVraWlyQk5Jb24y?=
 =?utf-8?B?eHZpbmZMUU9RK3RUMnNRdXoxVnI2Rld5NjZEZzhVK2k2UWVNZXJuYzdvcG10?=
 =?utf-8?B?dmR2eklPTGpZRDBScjQwVVA1WXNMcWlsOGtBOWJIZWxLSkM0NEN4QlNuSTBu?=
 =?utf-8?B?Y0orMldmUlczK0VEb2Z6ZDdwczBiUDA0YnZGM2Znc3VVQUxjL1k1a1FVUDVO?=
 =?utf-8?B?SFVhNjNWRjdkczJMR2RLU1QwUWVNdFl2bGp1V2xxREk0bUlTUUNvNEpmcmlm?=
 =?utf-8?B?LzNnV25hL21jMGwwQkxtTk1YNjRjNUxGWjdaeDlZcVVHV3Q4VzQreWZVZUJI?=
 =?utf-8?B?R24zQnFpV2d4V0tZZlBvdUgzZnlnVDJ3NjU2eTlQMGhRYmJaZ0dNT2N0VlZN?=
 =?utf-8?B?MURJMGFaWDlZbHNVSjJlUHZUcWJjZGhiQk5BT1JtVkkrOFY4U2p0ZVFxN0th?=
 =?utf-8?B?STFOR0FJR2g2Y01UMTM2Q3RMSmFFbEQ3bDJiS2xrK3RVM2hIS21sd0ZDTnZj?=
 =?utf-8?B?NnpVQXhyWm9QVSs4ZzM5OEt6dkQrZUxuK1QxQllIYURQWTIzb1pvUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 826abcb2-ca99-4830-b316-08de7e897976
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 09:43:24.7840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HItRJx2R47nj4ydbSjF0HN3NSBSpKtrZGBhyIUV8q0PrsRhyxmaCamSekryimH6SL/hQW+tQa2q0rQM7c9JkApI/bWaOGyRIeKXZeRK/lII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8990
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_024329_586638_2457D4B4 
X-CRM114-Status: UNSURE (   9.34  )
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

Hi Heiko,

On 3/4/26 1:14 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Right now dclk_vop2_src is not allowed to change its parent, while
> the other two dclks are allowed to do this.

nitpick: the src dclk of the other 2 VOPs (there are other clocks named 
dclk and the dclk_vopX actually all (except dclk_vop3) have 
set_rate_parent and set_rate_no_reparent).

> 
> All three VPs can drive non-static outputs (HDMI, DP, eDP) and even the
> eDP can also support full DP connections (though no DP+).
> 
> Therefore remove the CLK_SET_RATE_NO_REPARENT flag, to allow VP2 the same
> flexibility in aquiring its clock rate.
> 

nitpick: s/aquiring/acquiring/

> Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger w/ DP

Reviewed-by: Quentin Schulz <quentin.schuz@cherry.de>

Thanks!
Quentin

