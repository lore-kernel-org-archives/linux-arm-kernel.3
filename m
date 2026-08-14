Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E19BC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 17:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fw0ZA/v6wBuTOUqzKstmtcTtxkrllJZZJQGQjKvS4U=; b=C71FUCRfEcUMLuF5Fm2dNFfpIg
	WTt4f/XP4+l7UQ8su6RpJKE/nJrHerPyO8tER8LHeDy3Kb+gpvgmoMg+cvEhInJi+gOfquHR9q5Tr
	h5Q6q55XUm7TefZbc2RppVn8LY4Y1jJanXWTGLTwcEX+kvf7ueS7wYgwb7mHW+hdwZdRdPZVX+1J5
	vdUeoyR0Rh8VTjvnIdwUIr6QoFXuvi1XbxR5VNoEcctPp1EhGSXzECNFMg7yNcwln3LRRMa7XdiCI
	Wxutfw8n7ZNvezJNbrJalPhohVgmm6js491gfkm56UYvIJsdvNXRApLcMbCyJdEmgEDMKqosEXZyz
	lULOajMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvPf-00000002xa2-48lL;
	Fri, 14 Aug 2026 17:09:47 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvPe-00000002xZi-10K7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 17:09:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8dwB1aKGHnRnDkBYkZvcYGY4ROdUNIvynZxFJ7fXpaz44feKEyg9rfPXugwr8VN7v9tVmOaip+P33JWRJmukeyPfAm8z237xYuGY6iAHGeQnRRdvruNKy9XPEmZ1wdTjP9QNQ1dWkAMR2Lquc/FDYMee+np4i3UQNslebZzAnikauhP12drxJ4OepaqQXEKPqslkyS1Mao55s5KX9Cj/WwX+K2NnGNbBvIIYSeMLA9WUu5rhNFUXnDeRgzpSu6RzN4GfdVukefc9ID5u6agnj7vKuBvNGrks5+AQPrLNEqB8yK0jXftEZUxM7a8hQ7nRr0M6AACE4W9uCE+OA6dow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fw0ZA/v6wBuTOUqzKstmtcTtxkrllJZZJQGQjKvS4U=;
 b=JgDr32wijBmeBa0nmr+iagFiniujqg81tPI3LhkLPR0HqLzHA0xdlEDr2zVaZVDxxsOv57LVE5ANAT3StqQYBOqFAVVpSeGK3Hx7mclDVWu5IsyVRp8o2doxhpSFbTkbS1N8gchY3dO2Kp6S9vrfojYxz9i/REVZ1NZy31JM9/CTfEdprEtvTGGI9ZDUQh52nCs4Y890Vu7rq0CWyGKu+KmUlZOY61SnJwIaBT6UbTI9SzOMAXIF+pkyVYyCNafOsYnClBHS3uCjuipySNEigcJEzSH1ddpRyTDqCLwhm3UPe/WB8+33WUSaVjMlg0Tu1EroR8NSHQFHaCnZkHgq+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fw0ZA/v6wBuTOUqzKstmtcTtxkrllJZZJQGQjKvS4U=;
 b=tMZtS9sN5oDuBXmpIvp3Dkj645g4wiowc/WmIxX9ZdQlT3RWPtZL92cIIy4BmWwWo8M/j93Nw230BZMZ7RA8gYs7Hl+BPrKOyW3gkEE2j2Uj2BWPCVJKXCZthk2F5spEe6mVpoEdlKHNyBILXNW2OPmWfzNKp6JHUlSBRZRBfUnWHxa6CV8mf2OyjP/lYPzpU0+otkD06ejhy9SBN6JXjyYEeSt9NuKT/hAc4uQcOFKwhEVkmHLrp3u1Q/0VHIH0dQ36mMnZX80Dw4SLEe9Xwzg1AJxnR95iXkEC2l5AU9wmU+VRGSk59Dqvyh0uXGn8mFI4UwJXk1Q1keGIhqqbKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by GV2PR04MB11399.eurprd04.prod.outlook.com (2603:10a6:150:2b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 17:09:40 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 17:09:40 +0000
Date: Fri, 14 Aug 2026 12:09:33 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, michal.simek@amd.com,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH V2 2/8] dmaengine: zynqmp_dma: Free sw_desc_pool on
 desc_pool_v alloc failure
Message-ID: <an9LzWWTY97yfy8E@SMW015318>
References: <20260814045616.1661199-1-nagendra.golla@amd.com>
 <20260814045616.1661199-3-nagendra.golla@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814045616.1661199-3-nagendra.golla@amd.com>
X-ClientProxiedBy: SA1P222CA0055.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::7) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|GV2PR04MB11399:EE_
X-MS-Office365-Filtering-Correlation-Id: e56312b5-31e1-4fc2-2124-08defa26d40b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|11063799006|56012099006|10067099003|22082099003|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: 45GrjZ13gIZmttSvuNZFfXnmdI9JO57imQJs9hFVv0SNKH78dpNsxKSw4We2vIw8Xrjbf63QGjAwgunqmdDWlc3PyFmp9f3iK9bJQZIOaG5wPGMkTn0l9L9mzmtZWhpI+QhY8HZC1eRr8Sq+H4GkkAy3iptA55LM1sb9L3oRhWeUFgOfzhFgsoNUaBM3VGu99BXBVN6A4D6MFJy0klfadn0Aw5gsHFFwIrNnA9XigzmW7Vwc+eCPlgMAkc/dcrDIeYymcFFtwylcCdHK+DERtfRtmWr3rp11ybShs0GcHJwQCfWdOKDh5QEksxdt+8yPvPl9eL3XLl7GUtcvVMuWqZzX3AnGL+z7XV4SDQ8UWFElOs28QkCSm3SdsKP/tCXPSwF6A4g2STUzQeL86k7qLTg07dlcUtlu5pdVoLGOqzxModPUE6RUOXJ5F/Xm6C/7CDy5wwpaXUdog5nTztBBXMUitbk1CUIoBexuPGR+pmQaVMiUftD8caS6k385CUTKHLUriKZNGAvOnaIiCAFO/xFQi9UHd42GEiZInCIL9Y0FekekwuFhnUgNySZBZL02/gL7Xsyd0wJDm9XwbePtz/hnr1+a9rV6HM+Ymbr/Ouu6VIIHAyYpcC+0oEl7NXlmWuv7Lv5vdF/9VItOkkkP+XowgtobiEBGDEKncGEUvqs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N0kEdaj70s2e+UFGTVlgmT9PCcLNh6wgHGhFU8W7iVqO3jxJJxDiObgg9zAm?=
 =?us-ascii?Q?yW7Rzl1tGVis+r+8ENYc6/8l5ym7AvgSjkadWhCwtSpJbrKK3Q5wfpTH3CX1?=
 =?us-ascii?Q?oWZak9irEIeUcQWfJHI/zAehP+39n8draZkdeky8UcGIuaW9bDoSWpnAcA0j?=
 =?us-ascii?Q?4GitgFdnoh6pEekEXTI5PvIYYq8E7aMWv78qn3/bwb9tq+JnunZFD+c9MGAw?=
 =?us-ascii?Q?APjWb8zN+zLlFwKjXCLRLrSP00o/6qMqV+/AUeAGpCHVY9QANwMgiDEay6rU?=
 =?us-ascii?Q?nSSFRiErMneoHK3xFL6NxYiLm3+liRoyrN8u2UgQnGERbcosTg/hn3uLgYUZ?=
 =?us-ascii?Q?tCpy5qqnZr+89ourWY9UsZRe1FtLnNFyJjQce5oNcfozHewiXhM9zxnLp7Jw?=
 =?us-ascii?Q?TnbmWPqqAiQ6g1qrApcZdblVwHQR2sZF58chxE+WJRpf3vMYrj0KzbEbEC58?=
 =?us-ascii?Q?3HcQLznxeraExENfZV/C1KQg6ZzGavHBDURNMUDdCErVC9Fmz5yt8dmoqct3?=
 =?us-ascii?Q?dr6emYWHPr9+fSkHWd7Za4Ma+hnb1cByiPnbuTTlCmKj0RXsaYVJvk9OxEN4?=
 =?us-ascii?Q?NLdS8SaXWqDIFzSTnoROxN4n7nI7SDnv6UbtUZ4/qFMgWj2S/c7C9jz6fIje?=
 =?us-ascii?Q?Tf5IM6++9238XqR33BOcpFfP1DW2f+vlHbJz1ty61A+OvZxtt1w+5gBeqJRC?=
 =?us-ascii?Q?NYp/+FVwUMpXGwRNWLV+CaWk8bPeCmw+4AlE8DLL/N8/ChpyzCGeUXDvU0Qq?=
 =?us-ascii?Q?zt2Yr6hL7s4PrqhquhRESink4DKTobO+ryRicDv97FhfdbYnIkwW665/81kq?=
 =?us-ascii?Q?I4WFC/lIxwCLvLs59iqqxuXYWm768WnhJGxdcUDjtdjMM9sKzsGFrxftTGkb?=
 =?us-ascii?Q?AetsCPT4eXEiNRT+FTHMphvtv8jaevZcvGCX95iEoEUvtfaMHeNb82Cd/io/?=
 =?us-ascii?Q?BHO0nbLKVZlvfwZPQDpHnz4wslPMte6Gdaj2FFKSU/Hd9xV+gi7bdVRYEKfD?=
 =?us-ascii?Q?qNdcH6Q3u2FoJgKrjuvsAvaA2ElkWFxjv8KWUOtPG0r4TY54jeqH1jOmYAsw?=
 =?us-ascii?Q?hwBWm4noss7zCG6ByWWjJfU8ixwW+BnfxD/UbKYWKkKXb1jv51P2oGUoAAZb?=
 =?us-ascii?Q?Gti88ktIxZAsfrLtnXg8hyjfCt99Xv98Z2ZbcFde8nmMoeNkvtEXm3hZc6GE?=
 =?us-ascii?Q?Adn7/SAzPejnfPzIe/pzJKAED/beHhBEVS98jlF2i29l7Ym6QlSjf7cErPpJ?=
 =?us-ascii?Q?AqA3HiEIYdXVC6L7HE9kngzUdI0JVt/horD/RCzNfYfalToEMQyBIMDglzEB?=
 =?us-ascii?Q?o1PRowY6+4oT61cTrYHMlOrnj3bHtd8NibCmuZHZWHn41KduQ0U2nMcGLAc6?=
 =?us-ascii?Q?WvYTNfLPvFXqIWLv76hn0XkAExaY+dXIWn6hr7/1Ov+7QmHJxyPYCNXNO+le?=
 =?us-ascii?Q?FfmeJQK7w1CHK4/2xZ9PzWIacHiiBpjyKBYDlE8UxyEgz7gdV8Zi8JbjvYZm?=
 =?us-ascii?Q?Mguu3i7Hi9IXvgvH70ILwXjwVCrN0mEcZAp+v3Ow1/kcFLvCJS6uZ2vJdmg3?=
 =?us-ascii?Q?tR5oy/94iZ+cPxRkmvY0qE2aVW+Ue1C9YJpQPBNbJfrOT5iOBfAYFby3w1v+?=
 =?us-ascii?Q?UdV93IgvKQevk5XMQgy0HD7GyO5bxUEZTaKHR1DKt10XRBXuhshOzs6xeEQL?=
 =?us-ascii?Q?tWF44aDveLzLfiLT0430BqK0pfaXMLBVbJuPuZIaclfUwNbQJ6rjNwipFILd?=
 =?us-ascii?Q?5OwqjxLXhZaFL+LzS2LPg5fgA1q3tpU+qt3eAHNtLQTPfBX3BoI6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e56312b5-31e1-4fc2-2124-08defa26d40b
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 17:09:40.8550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZ2Jw9AZWb5HE5sO9z8fMv6MAMzg3QeSgMPKjZo0IRZ9hJ6JJngRQY6WFN2sYaUSMJauF667fLKLwZZD61dxwVVYVUgIDg+iy8gtH4V0JVzII13gQhZTiTgH7CCM/KEM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11399
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_100946_286475_A742B665 
X-CRM114-Status: GOOD (  20.15  )
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

On Fri, Aug 14, 2026 at 10:26:10AM +0530, Golla Nagendra wrote:
> In zynqmp_dma_alloc_chan_resources(), sw_desc_pool is allocated before
> desc_pool_v. If dma_alloc_coherent() for desc_pool_v fails, the function
> currently exits through the runtime PM rollback path but leaves the
> already allocated sw_desc_pool behind.
>
> Add a dedicated err_free_sw_desc_pool label for the desc_pool_v failure
> path, free sw_desc_pool there, then fall through to err_pm for
> pm_runtime_put_autosuspend().
>
> This keeps the error unwind symmetric and avoids leaking the software
> descriptor pool on coherent descriptor allocation failure.
>
> Fixes: b0cc417c1637 ("dmaengine: Add Xilinx zynqmp dma engine driver support")
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> changes in v2:
> - Split this cleanup from the previous combined alloc_chan_resources patch
> - Added err_free_sw_desc_pool label for desc_pool_v allocation failure,
>   freeing sw_desc_pool before falling through to err_pm
> - Updated commit description to match the exact cleanup path
> ---
>  drivers/dma/xilinx/zynqmp_dma.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
> index 9f1e69700dd0..b7c561280694 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -504,8 +504,10 @@ static int zynqmp_dma_alloc_chan_resources(struct dma_chan *dchan)
>  					       (2 * ZYNQMP_DMA_DESC_SIZE(chan) *
>  					       ZYNQMP_DMA_NUM_DESCS),
>  					       &chan->desc_pool_p, GFP_KERNEL);
> -	if (!chan->desc_pool_v)
> -		return -ENOMEM;
> +	if (!chan->desc_pool_v) {
> +		ret = -ENOMEM;
> +		goto err_free_sw_desc_pool;
> +	}
>
>  	for (i = 0; i < ZYNQMP_DMA_NUM_DESCS; i++) {
>  		desc = chan->sw_desc_pool + i;
> @@ -519,6 +521,9 @@ static int zynqmp_dma_alloc_chan_resources(struct dma_chan *dchan)
>
>  	return ZYNQMP_DMA_NUM_DESCS;
>
> +err_free_sw_desc_pool:
> +	kfree(chan->sw_desc_pool);
> +	chan->sw_desc_pool = NULL;
>  err_pm:
>  	pm_runtime_put_autosuspend(chan->dev);
>  	return ret;
> --
> 2.44.4
>

