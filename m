Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AE8CA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 11:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mD2mQRwXZhIsH0fDQfnWzUu97HXkwkTFxuZH1iLSoro=; b=cAMg60PYq0dbF/anZogjzzRUp+
	RPetFCyuLTJio6K68KiNpGHFHYCBsUx74au0wgCRpP9OIMaGdRKWpxkKUtxklawHadc7V8Dv6awIu
	B4AAP4JJzVKl47og6ZclVWHFuD5sobhqars4tW3dF1bKlIBcTda3OuZZ6sSltLSLbDBdS/NDMF6VZ
	wFzBOZ55Q9rnLixYEAtJTVea/ukoA29b+cRQ+GVoJmPaiuERVBn0UyMQgB+40INYaCzwXLY/wSAxr
	2xyBC8OfkJPyzML65kjLxOMCPwF76lrk2SIQUU0/WqUYlLAaHkS7UM7OoObzitezoxeKguvWPCkLR
	Vd5My1KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFrov-00000008x9r-07aU;
	Sun, 11 Oct 2026 11:34:25 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFros-00000008x9U-2tmG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 11:34:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPvVLnftsBbzxOlGwf1xondFmE0MiF/YMpEgybtV3FC6LJmh9QaV85l5VFUSM4HYrwHZZSwmdOYFuUj4lpaNkDCTPq7rfBndUdiDTwpOfvu90MoI6IQFs9oPjCxhcM45NwQkskAxy2JfvQ2o43AsxH2LpxFQchBfmrVXqhayKFx7q62meGbIsaGO43LjdYkiENDPh5k+h6p8URbaNzpqEqCEd8003dYuNpkEXvtytx1fYYhEKv/OS3QaZErPP9uduYXWNS3pT/fR8r7n8NTJlU9AycWynI0BzRcPcqX4EaFTepx/+Ssw9EH8O7P8RtCf4ITNx0NX1Ibf2WrZPqwiuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mD2mQRwXZhIsH0fDQfnWzUu97HXkwkTFxuZH1iLSoro=;
 b=l66otVeenGu8f2vVnaZdJvDKxTYUkURKZ46DNEueLPJiheWuPWgVC+MHTZhza5LLtMQULeGWFfRvxuht8jjJrRXHWnwex0E9qXhFYlKNSt10mWLOLHbkqOcd8u6OC+ypr5zgr2Uxr68gWl83WgQj8g0ApWdOjkdNvmUFDApP5EXJF92mlX6j757Jd3fo0BBMMGxP8B7PSJ3ejaBEhrc3MddtCkMhDYioqb+mGQ9pItOyuYC2hePNoYOub1gXA7seiB8h3U9nFv/aC3tFWawwceqNbGSE3bK22PND7e2BzrowGVaJQmu2IF7Ze3UNony2E5aOlCF0yvtbYbDgVibxWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mD2mQRwXZhIsH0fDQfnWzUu97HXkwkTFxuZH1iLSoro=;
 b=Q5JJ89Isj0oSbIu3y/xPTb9LoRKZeiyVKVR3gg16aXARqzgEkGzCCNTHpCIgfYeDtXfh6qAsIhATTYNibXDZNY7P+rzHkwuzbUkb9/vlBgf+uQDZ+0VzZa6z0p3Uwep66N1OPrtBkHwyeqTw9nhqzF+Q68WaaVtrs4qpGkrd4rULyZKY+xqJFzYAqBWQos+EcaP0uTxxGNX4a7x40Uzcp9B7gbZQOTgRYSvOoQ6onwh45xZk1RDPLB7rV+appLfoREqCNonsN1PnZuvYfUFRpcv5ZtrpF+wJb9xJfCGfLuKj+C3Q/tQPszG2HVHj9Su8fg9CroHe88iJupTPFaIr1w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM9PR04MB8453.eurprd04.prod.outlook.com (2603:10a6:20b:410::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 11:34:17 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.019; Sun, 11 Oct 2026
 11:34:17 +0000
Date: Sun, 11 Oct 2026 19:38:51 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v5 09/13] gpio: mxc: use cleanup guard for
 pm_runtime_get_noresume() balance
Message-ID: <ast1Sz1g94LiIygZ@shlinux89>
References: <20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com>
 <20261010-gpio-mxc-cleanup-v5-9-1e59e6ddfa00@nxp.com>
 <ask3n3aMR9Un-e6p@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ask3n3aMR9Un-e6p@SMW015318>
X-ClientProxiedBy: SG2PR01CA0188.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM9PR04MB8453:EE_
X-MS-Office365-Filtering-Correlation-Id: 140ddb30-bf61-4fef-13ee-08df278b959f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|19092799006|23010399003|56012099006|11063799006|4143699003|261009223027099003|261009221227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: fOep5Ecwxt0XOK+uzqnDfD1v2ccJKf3XOadZm9X4NP/o82QO8+iFAVjt6idIBoEe2P7fcWp759x+WMhJyayvFYh9jhGhLKz7dNrTRo9vO12OAeKUNl/4RObNHTjRiGLKka3cKroudMqqIwL8zxFcTUP3oFGsIap3yzlA/M4+y+4FFtRtg03pbnVNltXYd13d0F0BgaIQIRcpXrNhsJGNubB9A96jqW2Zip069qKP2/4c7StadvjQBRgJjD7H9sq7QjqsWeSRPtCHzrw/2wOGD9f1fVn3LRjhXBW3xbiWKe/Wc+yXHe3YbD5by5USJ8c4+2QcRu/2BeR4suFkt+D+wTosoEgGXabh9Cf5D5eUdP0vSOpr1huJGKQmXHXUP7xJ4h5DpHpw5xfMzIuXOBtg6GTq7MXNhwa3XTEYRB6eixSHLFY84fVE5LEc5sL6RPErXzmP93G6GDI85R3jTo1EmEzD3iADBqSs5wekuWsibIzuhziGHKw+ZmetIVrya3SNoTjtu8o8y1xB8FoZTBnhant918qJm1tnzUUhE0mIeAdzipQ2LwxUl7W/IZWzk3hW1zjpfrmjCYQaKKHHU+m8QD9Afl6NebuK9pJcC5r3zR1ZUUuQPAEg4uJzm6Dqzp48SgeX0vxgz+MhGdTaddDgJxFs/M3sghF2h8MceMePEOk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(19092799006)(23010399003)(56012099006)(11063799006)(4143699003)(261009223027099003)(261009221227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wzUohgLcZmlNYL7sKIh/bP8qOe54iFXRpAvFkrSM8VxVR7fYMyZ81y+nBtgD?=
 =?us-ascii?Q?9l/X6tK8SB5wXh1e1SLhRdTiLuXr9Qg+Do0rFUzOXUJf4Pa0RiwgEMbb4moa?=
 =?us-ascii?Q?9Se3fEXDGJoyYmNVmkgjfFUsY8G5pDCkYzqofzYx/5obWWJkzPQxMishQjks?=
 =?us-ascii?Q?FQAnFtDTEeAmFXZJkZ4uXvYcngBbn4MsPtgolA9Rkyn8D7XAJi0pUlr03jXZ?=
 =?us-ascii?Q?Dkq33go9/79kpKOpGvzWSXy0bgDqOWLYMbSYdAZNIZ4rYNs9V30wOE0/F/lK?=
 =?us-ascii?Q?yvv8yNwjDeZDR/ZZEV9+JodWWI0hSTTRgqdJ+mrCbGXFUaa3tMQhDKNHTjW0?=
 =?us-ascii?Q?x2jeB6+UaVCjOM+UA5/RrWiRqLNLkgY/bPK/L8YvzjaXMjsSfEVxZwv3djMi?=
 =?us-ascii?Q?XH1zMr5Z3i38V59He3cwPvq+6CY8bYt2mCSPbNvw9dBFOoYFyNxkYFDV65/R?=
 =?us-ascii?Q?9AKPYeGx9pW5yjmrTPf5VatNF8uEO/mitT7b564UYSTkXIOtslTfSLwnkrER?=
 =?us-ascii?Q?dQgzvy6FqyYcae+JqhLeXgS2JwrjCYfz6OpsS3ukP247r58oY4ei6d2f0iv2?=
 =?us-ascii?Q?d5qSZOvT9KNdVbO0ZLfXLUD3iToyZMtY6EmHy0jnPQb/5g2fZh/rFStszJit?=
 =?us-ascii?Q?o0iKCNwN15WAor+cM8LbrcN8jnDrlpG/oQVYr1vrJSElhMAA0qVaWv5nYJhv?=
 =?us-ascii?Q?K+GPg3wqctIZRDRomwuSCBxPbTwb77cqo6LzBR8iM1mLTI+xYPMrapiL0oOs?=
 =?us-ascii?Q?jww6mzErkvTgnUuWm/xSxhmSOWSzuDPd6UpUD4LlJRJrvKu0Emld/N+WpHyY?=
 =?us-ascii?Q?XBVOlL2sDvmkypUd6DtlOuRb6K3LzmEiLxVGpjCld52sFGddIRxXVtvyskHg?=
 =?us-ascii?Q?oFP671+reC1xQbeqKXNfvdu7kOMpv+PnVtAaIyJjimGIRxq57d6d70QIDwlN?=
 =?us-ascii?Q?yuhkTIDw5FsaGcvIgOUsNdaS5GbHvmxZ9GTcK+TSUpEU1K+9dvp3iUWqAaj4?=
 =?us-ascii?Q?T+RjTEu16u9J4JVp9CUSxVMSKb4uiQN2ot2zM1J5z6UXbHwcjcPE93yI2MCL?=
 =?us-ascii?Q?nhGfAkk7leu16Fe++mcCbhsk2nvTQPOIiPDpLmaUHd8066RcczTmrxNrLTLy?=
 =?us-ascii?Q?cNoGs+R/BpptBg1T3GTE5rU5EReXKkg3HoEzpE/Xg+IPD2Cj9WIEbcjX3iSs?=
 =?us-ascii?Q?xdzIrYcZRU/YuzBYkcrD2oxg3DwW+pQJULXudHihpTBZTv3Km0iDlFSB0kPk?=
 =?us-ascii?Q?pB4yhRuJdp3aHQWE41GgYGKjrD4TPirRawX+bh+h1GgcZo9jCMAR92maWD4n?=
 =?us-ascii?Q?xVzN9gFKUcdKX+qMnII4U9Qhiamnvfl/r5ZvlrQRWbB39BelLF55tBMpTmdp?=
 =?us-ascii?Q?HEFCM7V3wx2XgXhwx1J9/IYX7UbYO8Ce1HVS6Q0DmY0QtO3I+tokEoxnEcmb?=
 =?us-ascii?Q?35MxnEMnougsowkHfrIppDiOcyH0IrT0pUPiBLkWFSLSqadPNcEupqsfcr0D?=
 =?us-ascii?Q?2wBoccQwDZWJjkNxmh4onvenPNL0wzI7Nd40Ztp+gEl9UdwDPVAc9dReM/y4?=
 =?us-ascii?Q?cmcY+cFdxnlgVuEbeDqZ9QpVSaoszeLJZ3HLIPqnqQL0VS8qoEm9GbpfP/jC?=
 =?us-ascii?Q?381WQHAdKCkOhFlUCDmVrotq5sq/F7juDHH3WAfyKrY4jJYiCINxq697h49m?=
 =?us-ascii?Q?enBmEzUj1sKvCTJCO83VaapWMfFr4Qd0HBxRuMN9Go0bBPslhV9/Biw1dnvv?=
 =?us-ascii?Q?pDXi4iZVN/CuBq5wYVYYsZNgk0bqJrzx8G/TVomqpQqTK3kqFkoR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 140ddb30-bf61-4fef-13ee-08df278b959f
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 11:34:17.5769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ul/zP12IkReik9mZsPqqg72n0VXIuEbYvUJXPSnfRwe+Bll3ZZAxFnTH/jBmNc4y32w8NDX2CWxYeFJUdjq0r/h5qXnPm4VAdl470TlJDLU6TWnYPT0/gIlOSpQQsNIN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8453
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_043422_738995_DDF8D81D 
X-CRM114-Status: GOOD (  18.32  )
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

On Fri, Oct 09, 2026 at 01:51:11PM -0500, Frank Li wrote:
>On Sat, Oct 10, 2026 at 02:05:30AM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> pm_runtime_get_noresume() in probe must be balanced by
>> pm_runtime_put_noidle() on error paths, or pm_runtime_put_autosuspend()
>> on success. devm_pm_runtime_get_noresume() cannot be used here because
>> its devres action (pm_runtime_put_noidle()) would fire on unbind in
>> addition to the success-path pm_runtime_put_autosuspend(), causing a
>> usage counter underflow.
>>
>> Use a __free guard to automatically call pm_runtime_put_noidle() on
>> error paths, and disarm it with no_free_ptr() before the success-path
>> pm_runtime_put_autosuspend().
>>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  drivers/gpio/gpio-mxc.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
>> index 5ae9cdee6424..3d5a6566d3f4 100644
>> --- a/drivers/gpio/gpio-mxc.c
>> +++ b/drivers/gpio/gpio-mxc.c
>> @@ -445,6 +445,8 @@ static void mxc_update_irq_chained_handler(struct mxc_gpio_port *port, bool enab
>>  	}
>>  }
>>
>> +DEFINE_FREE(pm_runtime_put_noidle, struct device *, if (_T) pm_runtime_put_noidle(_T))
>> +
>
>This change need put into common runtime_pm.h and like pm maintainer to
>review it. Other system may use it, like DMA engine, CSI, ...
>
>And if someone add to common file later, it will cause build error.

I agree it would be useful there, but that needs a separate patch with
linux-pm@ review. I would keep it local for this series to avoid the
cross-subsystem dependency, and it can be moved to pm_runtime.h as a
follow-up.

Thanks
Peng

>
>>  static int mxc_gpio_probe(struct platform_device *pdev)
>>  {
>>  	struct gpio_generic_chip_config config = { };
>> @@ -486,6 +488,9 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>>  		return PTR_ERR(port->clk);
>>
>>  	pm_runtime_get_noresume(dev);
>> +
>> +	struct device *pm_guard __free(pm_runtime_put_noidle) = dev;
>> +
>>  	pm_runtime_set_active(dev);
>>  	pm_runtime_enable(dev);
>>
>> @@ -556,6 +561,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>>  	mxc_update_irq_chained_handler(port, true);
>>
>>  	platform_set_drvdata(pdev, port);
>> +
>> +	pm_guard = no_free_ptr(pm_guard);
>
>use retain_and_null_ptr();
>
>Frank
>
>>  	pm_runtime_put_autosuspend(dev);
>>
>>  	return 0;
>> @@ -564,7 +571,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>>  	irq_domain_remove(port->domain);
>>  out_bgio:
>>  	pm_runtime_disable(dev);
>> -	pm_runtime_put_noidle(dev);
>>  	dev_info(dev, "%s failed with errno %d\n", __func__, err);
>>  	return err;
>>  }
>>
>> --
>> 2.51.0
>>
>>
>

