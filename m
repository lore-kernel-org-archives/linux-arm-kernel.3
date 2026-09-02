Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5F0C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 15:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cpSy4W6ubT1BJ7n17/mDNVVuwny9N3hYIGH4KEstKOY=; b=nffW696RuhknQskMTsM9+V4mtZ
	/cJS01t8BtxuW88br5IAMadT0/Ku2jRFczOO93HqjPW5rGVXvNnL9EOx3HqZWk45Uepizk2Xrk/WR
	R6msVZR+/dqqJPWI4BncBukQcY7l3ZBOH7B2zvMyl9PJYCuo92SMIwpnrRcdTapGHGwujY13UNGBD
	8I/oPsA+a/sRN68xUvuMLF+ErPngx11/Dpxw/KfWOnwC3puVRnKfAUy9M+7/lppfolmzGeuN3CL/g
	oM1KAOUwI8BLnqVfPCHM5ksBEzPtLGbfGQYnKnqDr8bG3cVhzq+jRI69r+dwdlZAg0rjZ5sYe/cMF
	ved4VbMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mwF-0000000F5ng-0fcu;
	Wed, 02 Sep 2026 15:31:47 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mwC-0000000F5n2-1YPQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 15:31:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QyIPAqC/MCJcus2uKgvNoPltZvDsm2LViqLVEQfsi4CovQNLVJWiOsNt7ZDSA/YiSsyvMilxkN+I2Ve+caCQOt6/JwhmTpMheoIABT42X/II9oiXHXOZEnE8AupVVvXJwaOE/w0iSwe2Lo73mYIMVTfMU+wcUYciqNaWxkfQZSgHLF0XIRf7GmgritI7GtY26K60Sa+r67vlVH4UavaZ1FANhh7cEwSo+usnlhOQrqvj6XXUvIMZl3RvGZ25BhZXlKQBjWqKip6W+tUB7gOwXU2gkpHVmA7B0TOcYvGRyEKZDFuDJIYraFh0MTM9Sc0SHGXW3VISZDi+Xv52ybaDBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpSy4W6ubT1BJ7n17/mDNVVuwny9N3hYIGH4KEstKOY=;
 b=Aak1ELXNFTW/GCdktqwZF/5qc2IkrxhiOTl3kiT+uA+KygvElXjY3rK8kQXhWSEOziyfgN86nt15XtH6OXJJoX1aDTZ3iPauvFMxXxo0lCKBpvpG8gOKd/UdVPTCCnPEv5QwD7m5J+lVG+jTXGnWFTzq9pa9a3ldth3vJpvEF9ev2BgU/bPpBv+pPwXEXfGxuCVPLIAPBuVqPo9brrkTqh3GgWqGfVjwmX8w/WX9RE39r9Jku2j/Pj5cN3SyL3bH1gY/fmZjNgYatrxPJHtpP54FDW9MHSH9F1Y823UtSA8AS3IDgHsJcMSQ1k/0iL9sDIX7Idk2pgCkZPDgnlqaBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpSy4W6ubT1BJ7n17/mDNVVuwny9N3hYIGH4KEstKOY=;
 b=sUMhYcAEZROniZiPoTrFUh6IWsc62R/+eQdKzNZKmp5gHf+IGcnHEPRmffvu2UA6x51ueMQjTM2cILl17S9FYWDrcI0bE0Mp5cXl5WpuSyb/xaGWwEV0fe+XjOloS1Gl6Oc9pHcjjUWIOhKZvIruABqm+OeCGmb4mBUCPwhD6n2C/juToiy8CCgDFFNKncKzpeOV7Ow3qZr7kKWvUoez1qGvg3g0X/6b9RAiDZviHk5x69zbiDqlrPCdZbcBPuOZ4rEHJsM8zJ9fT6yu3rm83fn4DeqbNgIOncoa5ju+fJ5x4bXuTpPZtl+jGx8NBhpBPCKBBs/TF6KVQxqwlLkqzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS5PR04MB9769.eurprd04.prod.outlook.com (2603:10a6:20b:679::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 15:31:40 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 15:31:40 +0000
Date: Wed, 2 Sep 2026 11:31:33 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 20/34] dmaengine: xilinx-dpdma: kill vchan BH on remove
Message-ID: <aphBVete4tlzsRDJ@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <7185ee59e7bc0451f9ebb19178d3f76edee65658.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7185ee59e7bc0451f9ebb19178d3f76edee65658.1786384169.git.allen.lkml@gmail.com>
X-ClientProxiedBy: CY5PR19CA0021.namprd19.prod.outlook.com
 (2603:10b6:930:15::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS5PR04MB9769:EE_
X-MS-Office365-Filtering-Correlation-Id: 22bbd188-d147-4a1c-3c7f-08df09074921
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|1800799024|7416014|23010399003|366016|4143699003|11063799006|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: cUYccp+bJ4UnagvhtqiqaG5b+Vut5c7fXE80izeTKEkbiD8Dk70/aFakIoI0n7grf/9l6FX3m9iqV2CMF26FIt5gf9YEAt0bFh88eN3RLy9rkNc0XAplQYNIbndDAzriG30CZMVMh5ikkKec5gLOLHNvZ8Htg+MIC7V36QVhtaW19fNznnns21+/9gek8lJz+BW8pJVpwLPl6OsQlvvI4WEwKNPgyclc90EN/2LdivgyNsqgynL/aXA5Qvh3ilh3Vgn5khaVJ4rh7FJU1rtTM3e9sjm5XkmiEoyOdXLCvKqxSHe0rFOD6bqDFvfvsMfA+qdVEnuf4dl2GILi+4b5IRblkkvS9Z6BpwnmFpXY9ZfyHzTCNaczwC3tUCxgIRXq1B8qqVRUAuw0S7lnCQWExFQ0oNbERPibSzEvRM7oJgtbJJRr3cW/7xWSerz2YQH3OgatncQVdyd8JDK+4QhXW8B/zbP2dUllo3B9dshZhJspSSl2ZCj3ks51CaRluiOXQEGz6egeQ7iDuZDqdaAgpaFimSzEKtYg9+M/gJ0GHRAgA8s0LRZHjXRaJI5QwBWPgTJqHwdAjqhmVHVnwARIC6ipQdbEo5NBfm94AenjuNcf96AOW4ld4i2e++I/q/QICXuJHoVUPDwRVmxgqPL4/nXS0Hv2EBBPIRjCOnlFsK0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(7416014)(23010399003)(366016)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YxHfZkCFeW3gSpMwOS0YMrlqoR8K3zfD2+NFtVUb0sfslB9mBcvASQEDTXft?=
 =?us-ascii?Q?snXuPLVvNd9cWHQjcXKT1ujQoVTCdUXagls1Zuos7SpH2jU49kpP8dnHhh57?=
 =?us-ascii?Q?ne3mMatPCORDwnHWS34dcRehu5zYnfVJGGF01jSc1wqNGGJcB8rDao8C0lol?=
 =?us-ascii?Q?ZHUQBTEQkMPgI053hPlzQV3HV3yh4mxc09RW4wh9mwite1zcFvanSod5KAEX?=
 =?us-ascii?Q?sW2NjRHRpJ1W8fkMAQ+jhmbfjTD+Z9t+4lHvV7A/us5RXiqI+zb2I1BDulkA?=
 =?us-ascii?Q?IZkmXq7lxA2kZ1Km/zk4OyrIWflAQeTHlys5YkxclOC9YQRNi265Hb5NRTXo?=
 =?us-ascii?Q?oQZxnuhLcC3rK9baCwE/+CelJF1/thpfCzTpV36iEzSEZBcTj/m9ReAejFsC?=
 =?us-ascii?Q?zmq0FNXwV0CQb2Opy0uk/P6RD1f8xsVEnv6u9sZOnarI2heJaSYBpQCWF3vo?=
 =?us-ascii?Q?GD905Q5hmNAfsQnaDInE+3riwkOZroPD6nyjEjYQbuqRz5K96jQUIN2Ul923?=
 =?us-ascii?Q?BRmKTiHHTnPP6rxZ07RqVe2hJigC6fsmhDWLbh2zMif0D5euS0FLLIQrIKls?=
 =?us-ascii?Q?5lLzZ59XZ6x2xAaQCyFiQoEeD16PQ4+FYatcF0Z9BXIfKyLteCwtvHLYGMD7?=
 =?us-ascii?Q?tpOzDHC53woN8CyJQxprXxJiAczkMDFcG1apJF1gLY7nXLAFwTUI8EASCooD?=
 =?us-ascii?Q?kJqKN8FnFcjHAjdeLInZYhcQi8jVWtVgtlQzJK1pHowdkQn+EUgfV+mw2w18?=
 =?us-ascii?Q?cIMxEpPBlOkqLZ8IgY34deNy1vpPOdgZIDs1+iSLniQamQx0/iP6Vt5j59xD?=
 =?us-ascii?Q?g/xsynODloQpurjddF7aRRRVLzlefNuLggRRhfQu9v/odhh4tXvlEQFZ1JuW?=
 =?us-ascii?Q?TuEP+dDsKBCKif9akeISpMHPsknIh+NgG28rv8BiVraF8MCMDW2Bsz79Pzzj?=
 =?us-ascii?Q?Xc8HYcbH0YvXOiDWxh4qvine9yGco6RgJAB7MzIavtBPBqDOPpvaI0a+8E6s?=
 =?us-ascii?Q?8PeIglCQX0Xk61NgILHA/qmva9dcWXw36398kVa9BeBRw9aX/l/3yO0uxoUu?=
 =?us-ascii?Q?Uki0ZHyUupOJho7VQlCu4KcnHsBcgw4jmvCvJ0OeNyZfbxGrGkdfvNZMC/4z?=
 =?us-ascii?Q?2JvHyrnuBCqx0Lo4c1skjxX+do8WMtQhHPNViz4+Y5VELq83Cg8P1w3AiEp3?=
 =?us-ascii?Q?PON3EBQot2Kxos3qKRea8DH9JDEVRZMp6FsEMkbasilt8SMJGm8VSf9L2tNH?=
 =?us-ascii?Q?VKCmZZ4f7HZFms6a/UORZHUuC4Jg62QYblO53QrA1dDuS050nipwabZX9hmk?=
 =?us-ascii?Q?GjVAQoDBlt730aU/MinLZF8ELV1RWlKf0STVlC44Gnx3dh+09CBOJ03nQPd/?=
 =?us-ascii?Q?F4O9OZ0G6ehAUGgdK2mL8chxdAx+jpF4Z4dmW3w8goj/qfbQio7EaBnZIQyE?=
 =?us-ascii?Q?BD6AtguGFVTGVTX/Hzs8v/217f25KpmDByqJ6GI8Dq0krne9CekIbcRUxWKg?=
 =?us-ascii?Q?B+ikJqI6u1fXf5B4gPH989vhGVSE+lsE9F+h4tC+fR3kMWc6TIyJHMs/HYta?=
 =?us-ascii?Q?cDZMUlwXwKrEQRu75UOoItb7mIoN1ltGc6dw8ytv9dsA2FxGlPjpDIxk+nbo?=
 =?us-ascii?Q?ALJKajhbEfeRmXSjMZOMBEpTkW7NFFb0KVavL4fwMrflR/gvd9hP13MgaoU0?=
 =?us-ascii?Q?m/S2Te6My7PQg26ehnG5RL9R4dZeKUtL8wnfR0kBwJdqgcHraVYtPPlh9Fd+?=
 =?us-ascii?Q?YYzShnsAdjaURU5Bv+bc7Jd3IYFQkmEJgVZhBDj6aQgMjL7pw/an?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22bbd188-d147-4a1c-3c7f-08df09074921
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:31:40.7916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tqXNt/8S8S3fkXP6Lz4/4Uydm1o9A76MmuEIiPRxqe599c26Ck/+IlcdK+U4S7O54i276TJbYMG2NR+l3OqpKZFsDnMMXkL8fRo8IHcwq5cOnF7d1XjWPZUDRySpa5CJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9769
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_083144_433429_34E2005A 
X-CRM114-Status: GOOD (  13.60  )
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

On Mon, Aug 10, 2026 at 11:09:21AM -0700, Allen Pais wrote:
> virt-dma now dispatches completion callbacks through per-channel BH
> work. Cancel that work when removing a channel, while retaining the
> driver's separate error-handling tasklet.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/xilinx/xilinx_dpdma.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
> index d9a3542c4531..7e147ea11368 100644
> --- a/drivers/dma/xilinx/xilinx_dpdma.c
> +++ b/drivers/dma/xilinx/xilinx_dpdma.c
> @@ -1685,6 +1685,7 @@ static void xilinx_dpdma_chan_remove(struct xilinx_dpdma_chan *chan)
>  		return;
>
>  	tasklet_kill(&chan->err_task);
> +	dmaengine_kill_bh(&chan->vchan.chan);
>  	list_del(&chan->vchan.chan.device_node);
>  }
>
> --
> 2.43.0
>

