Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978E5CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 19:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9AFiCKxCRI+YE87/bTWaCD8QqrDiIqN9rCk7Q1U8HYs=; b=cpHt7leEAddA6RaeubCGYFlb41
	fXxg/6ok73ZMMmewfBg9HaAGev8Q/2yNoCYuiN6nhOuU6VV6BxRNUNti6L7hgeswptsWsv0UMKJbi
	E80BC/2o5UtgJFaCnMVQ+U/uSmgvtzhwwvoh7u2/F6e1LAk+PBvLH+3uQRpYiYOWYWr6ATHmyqyRu
	5VG7Y87HJ9d8ddJco4I3YZx0K+tvSFsinNl2bC8zPr9khCUTaWujGj8djzo/LQmeElLgzfo32Ez0f
	R/AyofYiw4A5VQOghHAtovjuJLwhh5ry6hFM0IJ1KzR5kyTZr/uPIkDAcCMAVFWSm+SXYlXZjtcvl
	SfrQgcCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waIDe-00000001jnZ-2DIi;
	Thu, 18 Jun 2026 19:16:06 +0000
Received: from mail-northeuropeazon11010011.outbound.protection.outlook.com ([52.101.84.11] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waIDb-00000001jnB-2yzb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 19:16:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scG7daZVrFt7HA5YESQAWIT5LwXh8n9j67eFLgacoMkt/X5f/Og+fVmgPO3FsB0sRFoXNCVVqAmEK5YTYIZxx1m+feYtNbtb2Ez2Dndb5XVR7rtBEqCOftBqkrejePudzcICL+4X0DkbDyshcdzqVAvakeZcTC05RbLt+mRNzDqG/4O9uDz/C8hf7yNAExUi8OwusuoV/EWC3jI0/+1eHQOt9k98iqumxmUKKHhPbLlHy4CNDIyJAz8a4Vx3g4H9AYlBY4TmzeTUCSuwcAnOQplvHP1TgocwPKKPBdBHoBjQm8qgG61+MIcL8+sgqmS7EYka8XWky6u7gqnnrt1BUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AFiCKxCRI+YE87/bTWaCD8QqrDiIqN9rCk7Q1U8HYs=;
 b=KqmsyXC+3HMX24chZqFKQNeMO9XW/gBt5qBTvaM7KM6XIAY+6uMSx4T5M9ON+QGCMRE9f+reEyy//NpIjiHvsIuDFM58YAmAo/Ft25YgbotQ+V8v3N1RU5mL/bmAI5UKbZyyikSkoy7qEWqzAHrVqAsIuAUBcChFs04AkktMrcMTW+p/Pmr80CFBB4NnKRS6eh+jIJ8HCBkCDacRwCpjYXalpFMd+o/bgxEuviLusJljNU2aZCo+QBl8b5U65S4JItV4TCKLVEedbW7yfHVqtnHDJVOZKRsBfx9TXWtO0de0Zid873ybGY23ECXahVPYJlPS55fO0wMlyO8fc5+kcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AFiCKxCRI+YE87/bTWaCD8QqrDiIqN9rCk7Q1U8HYs=;
 b=uYscytR8/XiUSh253gh7xpKZRvO4jL0s9p7azw2A07EAABkKl56cRMtAHsEp/sYybRf5SVYzEj60CKVU9AmZPwPDSX9MmlMmDLPp6EXLMPZ+as2kP0dlhPM0tLYhg2wv1ZBQtF2tGmwBK0oemTQMvy1yBnuTATHrx709Y4hZ903YgPR727lI85Og2rmglP9PXTizTXlz2POM6Hgj3aZWWe2eG7E1HeHRKYh6yKAfrNSCuJ1YqAwBhou4UwRGYqLJ1cZLPDCfRVvbYdnZKdiZmVZOnKLAgp5TPCb8JCskvHyboUPkMtuqiwov1kGSUvg6vnJbPaW22EoNf8IMV/CKXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PR3PR04MB7372.eurprd04.prod.outlook.com (2603:10a6:102:80::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 19:15:58 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Thu, 18 Jun 2026
 19:15:57 +0000
Date: Thu, 18 Jun 2026 14:15:45 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, michal.simek@amd.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jay.buddhabhatti@amd.com, harini.katakam@amd.com,
	m.tretter@pengutronix.de, radhey.shyam.pandey@amd.com,
	abin.joseph@amd.com, kees@kernel.org, sakari.ailus@linux.intel.com,
	git@amd.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 3/3] dmaengine: zynqmp_dma: Guard IRQ handler against
 spurious interrupts
Message-ID: <ajRD4VyUiU83YPdJ@SMW015318>
References: <20260618071056.2024286-1-nagendra.golla@amd.com>
 <20260618071056.2024286-4-nagendra.golla@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618071056.2024286-4-nagendra.golla@amd.com>
X-ClientProxiedBy: PH8P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PR3PR04MB7372:EE_
X-MS-Office365-Filtering-Correlation-Id: 278edd87-0ccb-4252-3ba8-08decd6e06a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|19092799006|56012099006|11063799006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: 4bbCAwxJgX8kBrPGLikZ1DWDgvb/De5mbgWsAr2KwoCBv78DPhM7Rc8AZQj8nyLc8YjBjnCluLJhcvV+/maFQSIIkNPj3fWOgE0ITZneo/377LY61+8ROk2gCi3SRhJKy0GfLR9DjGBzt2T94fppkn+O8A0EfDY59vlkO0E4VzFC1eG2dUUzd4EIqgOnd6nhsVSuhW9vk7vvW5jK7EroTkqeBsPJfya4KD3Vj6ok/EQoDFZVDRBm0hw4A2db02PwDmn0w1OJJ3dCuE7olSlXhq8MBs2sZm76mKXGIiTgTjSlZ+jEj5ye7cYBk0UoCGq4mGIAUCeUWkOZa75lMW9Ld6+QJ9XSG5TLhjTYZD0KqMQ5qxUgF4ADIelYjiIq9j+5lzhp58+BfhkF5KcsnrJIAlxUmOjP7S0I6Ui7qSsWbcSQ0kO9aEOXzh+GmRmyT62f9kN3Nv4EsqLP18ptsftFfms31n6pOxSntVEm2Qmw0AxWbbphvwpfVB/k8OMXux1APUac2ZNqfDb2uTRZ3PdMMCbGpmcSoiigEdWYJuVJ9YakkJahLTHzQj+M0XUUzJHsPkN2dGSXvARiYkxxoh0ni2g4SDQSNGjcaco35sAdTuh7jmyngmsf+bvtSFy/axNUBTXeNDHhpNRVhnZJXTozVS4mqWsbMhnEPQUmWWAYw2/Y53jDIplEngc+rOivzXFj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(19092799006)(56012099006)(11063799006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g5E+UfgskJIkHzh/gHyhT9751xTTcf5J7lHJH9fdyjSnNDP6LrfzO4z6C3jt?=
 =?us-ascii?Q?IWaZ/z37gh8KnhNigfZ9qYExXVzV246Ckb9g+cc6xsSO4FwZD5ah/zMUzbgZ?=
 =?us-ascii?Q?z43T+D4TElbD1196ZVJyw31VeqPLbMq+8ipFsoWJDMiV1bWjTGP3zAZs1LQv?=
 =?us-ascii?Q?HWWz1YPqggogXAQSt7KIU+6Bmu+sPZphkeFnvAbX5OeqkfFtLHSOo6tRZnXB?=
 =?us-ascii?Q?XGHalGcGIVb76sHrmytxaJs6mvxMOfjJFhAddwTwtwTXQkq2RELnDWZHPU0n?=
 =?us-ascii?Q?NswK58PIaU4ZDpAvpQthbByWWoG34t2BfDqWZTamZBi+GdPEyclIpGzwQJub?=
 =?us-ascii?Q?2SnBB+9AXENenJnKjcGGKbSSoYP5UACymCW1pfHbALpmt1i24THa60aZj8Vz?=
 =?us-ascii?Q?bvDLNzhsWh53atPciuuhFzlKJxtKPtCUD72CvYHzqCzakfVbzeOXVrw54lMt?=
 =?us-ascii?Q?PKXFMpiJYJ/AwtcaXjIAjAHEHEb+/x1KfIT7tW1u2IdNWD+Dj9UtxmcTHbsO?=
 =?us-ascii?Q?J6FgPllSBXg7SJAV+DIuS9REBb99qbheQ5V4tRlImX/AcVks0rT3RTeJUZ9g?=
 =?us-ascii?Q?uhMC1rCFnuh8r1QB+szjzlMqjY0cHGxj2F2ymmz2BY7QZZW/BGnVm5u26tlv?=
 =?us-ascii?Q?xrEf1jsI2tCcFYrpAZ+brH9HWFiEEfF9oyFBgFox12bPhP2dCP3VzruFk6k2?=
 =?us-ascii?Q?dDu15NpUfMn4KKZvy5VprqDPjpdLXd6HPVA4LpXf2bqliVKBxPYIPawaxQup?=
 =?us-ascii?Q?DgpEC1rwoJYVSGgPgds/mzcZbebfzDg494w9GC0FrHZj5gtbUKJPBCI3ywzI?=
 =?us-ascii?Q?Uss0KK5iB6xj3H0LGBFrKO0Xbx/0ezcvZ0u85Y44THeT0/i9KpnoN6HFjiVq?=
 =?us-ascii?Q?uyRSRIf6rA6QivvzeH+OxTiTKG3SpgLDZogUmOyD4WdOLIXjiHpKoTf04NGt?=
 =?us-ascii?Q?KsHZlH+oWEZ8bJdBVb0ea47+pMBzOVXwp1OZy8bx/AVmxeJdIWvcllrIoVqI?=
 =?us-ascii?Q?J4xpNG0sxtCYSpey4cSGpypxJi+TH61C9h+qc94koA3NARwd17Ati3bEtKN3?=
 =?us-ascii?Q?QLpoh9e1sp1ytYHHG9rsZuKAAmfcxN6f+O8W2HX5kRo+f6OWyabE6gkbM574?=
 =?us-ascii?Q?hAoHWxCm9QpcYXByOyLYsDoyQh2dJVkVAE8zg414n+tAE4GH2ic9jngeuuvO?=
 =?us-ascii?Q?gyGOZhlBibqj2NPgYDEBdjKTBZmzx0MFK0W36G72kVh+LiMWrP+soZp868bZ?=
 =?us-ascii?Q?dw/khR/vFO2RbO0AiVJWaip21irFTlhpogTx5qXUqL+NgzToKvq06mR+lVjc?=
 =?us-ascii?Q?FQkwXHb0IUtR8r1W6MBFs3/0qTacD62EWOWfdl9GobR1j58Vxp5MRRJaec1k?=
 =?us-ascii?Q?8ldH7uOaLa0dm1KiZOjPS8F4fhpVWUkPNiFawXImE6eqPadfB/nGzD87S06l?=
 =?us-ascii?Q?cATPEIn6eb0x67kh0TalNMY9dzbw1u/DzBp2QEMo3YwPmRtaSige2CeaL9lF?=
 =?us-ascii?Q?kLTAxzSG7LlSnycN6y8n53gcvfjLv1G65FrNooaSBhor1m3na+F+svOGOgvD?=
 =?us-ascii?Q?RrqtkMAy8oyJH7QpZHcE0WeaXBIfvQ1QVzMMGNYGXyxVMv9e88walBu3ZrCr?=
 =?us-ascii?Q?Rt7r/lM+cPaLwFJFLoFBGASk39SBspIFTDlMZjSTLW3HgO3Pc4cjpd0Wsi/l?=
 =?us-ascii?Q?4WULp6I7AHL2fkGiwgBrVnrecK6EBDkoat7OMFem2i1TFw95L51sXMz2UzPQ?=
 =?us-ascii?Q?sX0jwWog6Zn0bwFH6w2vDe/62A/u73bD39eGHNJan+lvzMDGvfCu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 278edd87-0ccb-4252-3ba8-08decd6e06a4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 19:15:57.8140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: raGxWMi+gM8b4eVlukZRBSLH44rtRU+Ie8Oa6Hu6a2shCPNyjhjfG4SSulE+yNGlc66qn0YzUEu2disZF1UIhrqgPvNPIOlGKQvYI2UXsaOxda2PD1WPMFX55KVKfNKC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7372
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_121604_084350_AADB0C9C 
X-CRM114-Status: GOOD (  22.95  )
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

On Thu, Jun 18, 2026 at 12:40:56PM +0530, Golla Nagendra wrote:
> [You don't often get email from nagendra.golla@amd.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Add pm_runtime_get_if_active() check in zynqmp_dma_irq_handler() to
> safely handle spurious interrupts that may arrive while the device is
> runtime-suspended. Without this guard, a spurious interrupt could cause
> the handler to access hardware registers (ISR, IMR) with clocks gated,
> potentially leading to a synchronous external abort and kernel crash.
>
> When the device is not runtime-active, pm_runtime_get_if_active()
> returns false without incrementing the usage counter, and the handler
> returns IRQ_NONE immediately. When the device is active, it increments
> the usage counter to prevent a concurrent runtime suspend during
> register access, and pm_runtime_put() releases the reference afterward.
>
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---
>  drivers/dma/xilinx/zynqmp_dma.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
> index a9dfec3c0ca3..ce9163138be7 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -730,6 +730,9 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
>         u32 isr, imr, status;
>         irqreturn_t ret = IRQ_NONE;
>
> +       if (pm_runtime_get_if_active(chan->dev) <= 0)
> +               return IRQ_NONE;
> +

Can you add AQUIRE macro in include/linux/pm_runtime.h
so here can use PM_RUNTIME_ACQUIRE_IF_ACITVE

Other person can get benefit for auto clean up especially if there are some
difference return path.

Frank

>         isr = readl(chan->regs + ZYNQMP_DMA_ISR);
>         imr = readl(chan->regs + ZYNQMP_DMA_IMR);
>         status = isr & ~imr;
> @@ -756,6 +759,8 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
>                 ret = IRQ_HANDLED;
>         }
>
> +       pm_runtime_put(chan->dev);
> +
>         return ret;
>  }
>
> --
> 2.34.1
>

