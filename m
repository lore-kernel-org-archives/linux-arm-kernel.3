Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA08C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 18:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AAOSh5axxPk1MBvECcnYeGeeK/VQNx6d+iqJIWBJmTc=; b=vPrkzCZgNo2jP/BDqzmces1xbR
	RdK5WoOoLsFxKjXCapvqb9iLNx916Rpr840TS/7VvafublqRA3BsUrbtV1iU4oMUk9ilIS5WVMXpD
	sVcFjjzww38B/PQMnKJfiZQxBRmN+FMcZRCgLIXOAl83PmagSrtqHlvprOJhKKYCJz+18j6AMjDYm
	DXmO68xjRyiyBu9Zsy2q0bNVlXL+H4xUaJkQWfwTrzFBMHr0UsxzEkirRjuvPm1RE6k8T/nDhoNvg
	GxOYB6ez40WX2OISkv8N8hzRhfkCMR2kzEmY/R1oYL5pL/k5Ng7R5sdfWBGOZO/tTwcDelIzDk2pA
	/0swBOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6vY8-00000004sre-3enz;
	Mon, 21 Apr 2025 18:07:20 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6vWH-00000004siL-1SC9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 18:05:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Un+NK6bzTKY5UQgC9hiTxiAoBVuh9PZHRjYvaVa9wXyWWJUcU7Kf2TgX1fbaABwySM7ycuY+ecMvXYuZOvewPmGGIs4EfwS0X/qMRvro6iOKQi9ogAcOrBVA34iLX+SEoq54JudQxfwvN/MCsLAfWx9AtGI79DO9dp8vMXaz0lFKdwFx0vyBsVgFq2Sao9tG/ikC3vo8eLdxV1bGjrwJwBwZXiITe7RVTkit+olDerzozqeBR4kpOykcUILmK6FSb+ai2BDye7pDDsO3tfzMD4xK03MsUQi95+8LUdCgfhFDnljQOk2REm2MVO2Nc8J4VDa6u9ZlqvC4NHpvb32XBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAOSh5axxPk1MBvECcnYeGeeK/VQNx6d+iqJIWBJmTc=;
 b=wkizSnYBCthcHu3ZQ0q73FXFnRam0ZMF/vPl0ZJi3XosfXt98A5vMVaTLzEbbCf/EeVixWTKOj7JE9S6TlkWtvFY+AHXO60h3KQGU7N8Ym+zoa43PEX0ecneKV8aSdmzhLYlMESljk53cXH/gjYXt14TU8vNAYyeEXL0XuRuhYuuylHwUx/7xOZM53eU8Ipowo24sd2mEqQ3SQ9mGeCGvDgB1hTtWzHuQRiRQzvN40nWAU3hTMPznN5zm+qh5+y+NfXhgp3qrmVqcP3A2Mn3xkglOkHUh0M1Lse5lEMuXFz69J1UTnyuZ5IFDe1mzmMeScbv4TqZG6i12CjDiB8Lfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAOSh5axxPk1MBvECcnYeGeeK/VQNx6d+iqJIWBJmTc=;
 b=fjDHturEQH/c5czGYnex73lC3HmN5lz0tcUh6/3Ul7Obp6so1WcN2ZkRfubO+qamsWr5zAkIJXjfjf3fIFODXS1wPC78I+jtPxAR9TG8aTcCfwV8seQtdXGnVXaP2NS17nZJ8cx/Y+j4tSqRZNnQT4pVOJJHGgBmhvsSlCqcMq8uEDi8pIS/9RkDPHVWnXLgwryJa1xQsmVQb75OEK5jNEAH3YrsydeWMXlSR6EaSkVsIu/3JWmbY4jy6xyLh+NDqGFf5tABG1/QVxPuGD/s8+Ht5QWkDivtxeNxe2yIj8sBAVDU4XoYMkMqhy/BJ0X1TIJ3QmiYheRRiHTmRsyPsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB9856.eurprd04.prod.outlook.com (2603:10a6:20b:678::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 18:05:22 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8655.025; Mon, 21 Apr 2025
 18:05:21 +0000
Date: Mon, 21 Apr 2025 14:05:14 -0400
From: Frank Li <Frank.li@nxp.com>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Yongchao Jia <jyc0019@gmail.com>
Subject: Re: [PATCH 1/2] i2c: imx: use guard to take spinlock
Message-ID: <aAaI2gCLTh+5YfJ8@lizhi-Precision-Tower-5810>
References: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
 <20250421-i2c-imx-update-v1-1-1137f1f353d5@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-i2c-imx-update-v1-1-1137f1f353d5@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0196.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB9856:EE_
X-MS-Office365-Filtering-Correlation-Id: 847da3e4-4b32-4eab-759e-08dd80ff1531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PtNCrcJprN/fjGhwj1KXiV1jpDa9u+tuU1r8VGld+k0BAMw/M99zVwc5IwQu?=
 =?us-ascii?Q?wrE+SfXPLmS9duYIxw5INIp5dhSD3dCgXzkvAjqV08TlO25RV18kycnSdILO?=
 =?us-ascii?Q?ksPwUoYqK+US2ZQMqaiHeVA/HyzJrPQCisP1uym5aGZcvTRkMrJJ6ZWU/NBP?=
 =?us-ascii?Q?ZPW/tAPIqTBjIxNWPMdF05auP3FXrWtfblvlfMEtGwh4+2R86k5bSXkegimJ?=
 =?us-ascii?Q?gxt7TFY0y5hj+jablKQLXWHquLk9wlnkU4ve6AAjdokiolYvSQpl36Qi0123?=
 =?us-ascii?Q?M13kB8DsJF8LPYFfzifemJZOMmoetr6htB/shVMeyCtEALCwtbxekPfIIR/2?=
 =?us-ascii?Q?DfnHTatpvvCMm9ZRImHTdqwRXywPUiOFUCKTHVuoLkY93zy8LYJYrl2rBG9X?=
 =?us-ascii?Q?6YpFwrcX98U0UAW/VHXq/RC0t/T48U33tfKr+9jlSG81Bv+/ViGlgYmy/kG8?=
 =?us-ascii?Q?EtBRXoRE1FqaHnpM8QsxVyD4LATydrU6C5ZEYnLdHyDSgpBfC6pAtYzjiLbg?=
 =?us-ascii?Q?pYswj8Q3SvrDyCtjaBJ0c9KTF/GQAsB7kWXCsHIqh1b0xQMUdw9zG4GJdn4W?=
 =?us-ascii?Q?Igag3k7tMoWwJg5DiRfpt1NDo4Qz08woQqm744hJ52QBXbijuK0qTykzwCcI?=
 =?us-ascii?Q?t7OhJ8MskTmSR2Q1PuL9c/qph0/eyLXfe9m7DLB9HtrLazu5cfLhex71ESPx?=
 =?us-ascii?Q?bKuKSjweHvpiMx+6Bl4wtgytGWukZ+K08+6X880rTHapfsEwgx9IccVXqhmK?=
 =?us-ascii?Q?JrwPbUNKPveiV0amRFtTiLNoLd7YMQJZYyCcbBUa+LKDAC0FaeAEsddNghiy?=
 =?us-ascii?Q?5TyPwIwIhNpK6A15lGsu5AWjQWMTrJ+aAcMXnChU3yx6e3YCia76NW+ulArn?=
 =?us-ascii?Q?kfzOSTOLUvue1wdoGMJXLLBAfRogMKnEfK8/4C2ab8KYiDCUBw1LL+ToWft/?=
 =?us-ascii?Q?beLtgjPTh2CghsvghJABN3Atw4xsAgLp/Df41nzmBo/JwuIpKL3M0vbV8RJ5?=
 =?us-ascii?Q?5TI8EI7kJ9XRSdQ1YmAo1P51+GLG56W6gVdHz8QarkCRGi97n4cTmOiHL/mZ?=
 =?us-ascii?Q?1vjSeYf5lr4ydN5q7XOQXghWrmiiDxzWIWnwdf+JqxVi5hQ72Cm0ppNrx9+5?=
 =?us-ascii?Q?JwHAdc2776GHqOATSXoPPgJhy/RStL60yYpm5X/mFA45UUgzbKCIklKtvm1d?=
 =?us-ascii?Q?pEjviJaX5gTPUBbZluiGPjyEWCj7xJj2y0ioBpoOy0I9tfqn/Nc+MMfyh4Xl?=
 =?us-ascii?Q?Zwx4RKQVE0H+O3YH1QB8LiIoeQ/bU0zBtMljIe0ITO3K8jH/ehhJRZzXynsY?=
 =?us-ascii?Q?jiwSw3voDTjhpNue+TtfTTM23Ffg7w9zaZv7rdQsX+mVGfQsqbU3wprg+/G9?=
 =?us-ascii?Q?rHIIGANRYvIlpU80cvbwPV9fclDj5x9NGo0B8HRLYeF7PyjO4jNuM1CmIuv3?=
 =?us-ascii?Q?emi6RfIzU01orsuQVBWWITxtpsvEg+yd/zfXo6IET2wgWGHVBKryNA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rE3FNa0ILOhGjl8fRYKXjjcjharenonKrEW/cvbQ3Rpz3i8zGy6GawQSn8w0?=
 =?us-ascii?Q?h+affGfXcWh94xcq+SNt1nc4B+aa2xfQI/SppuDoCEaJyHTAomPwORNyjshM?=
 =?us-ascii?Q?bJtRAHPMlaMbqDJdl8l7Vd8d/O9wgncPIxCx2EMdWY+CAuqtz9ZI+QXBSwI5?=
 =?us-ascii?Q?425SHnJZ8Xt2Aftq7ns7Q3ZW/gc0cxt9WMG/NGcPSljfXRj+Z4MOGeoxwfmD?=
 =?us-ascii?Q?YPd+dfWEOtSssZiyc0UZ9ZiMbxXoFAWaHEvdblA+QhNL/4ivKZeyUVOEtiiR?=
 =?us-ascii?Q?wrJeuSqmpQgvrAukRx0EEUica7quWBCzlT2+n68Y4yXRraGK5ODAm0fgXf4H?=
 =?us-ascii?Q?lhGXECN+24/ZbWfmYGQJaG/P17FNN1xV5W7zDvt5vCjO0LIIE9+xkeCIMKWz?=
 =?us-ascii?Q?2QUzsVHkBTYbtrm2NQvcQj9VorrIlxcY6NxTf9XKOpeAoZERmOdBQDaitYey?=
 =?us-ascii?Q?dyYSPk241F/KGDNahGtdndnDsysxgKe5zwv+pkB67Zj49VwHtj2T0DDUqWSY?=
 =?us-ascii?Q?gqfkhUVNJEQSdGyg4/dJnUMi1Dyw3lwF0BbvosS5GHYPqA8Qcq5ATDWSanKY?=
 =?us-ascii?Q?J8UIOXJ91Jvtboy8WujezNzEROn8uSOn5Xhdt6KjOFQX3DvYSxgeVsG4bKH9?=
 =?us-ascii?Q?s+8KBCGzEcR1UC5H/i8rKPvxo8j1Ui53CTCCOqSjKlGtmuWuvtUjfO5KIqw9?=
 =?us-ascii?Q?7FcIuwXvWL1tu78XOSevWIMDhJQOrKK3dYgYacw15/geT+eyhGjAjd87uzxC?=
 =?us-ascii?Q?f+dDWkHKShiBjD3s2caE+h0GCSOMywCEpKgKnQZ9F8rMgni60ymu69Y2pjbx?=
 =?us-ascii?Q?oV2Ixb79x03lQ/rgZiSLPOQn5aUpw/IQWJr+fOMQ15ZDM/69HuK+pt9zlsgb?=
 =?us-ascii?Q?BTtAOLGj6aPSdkR+baMqkS+o8XpHNfRwE7tR8BX3A5xuy/5k/Q+ym56FK98G?=
 =?us-ascii?Q?rS5qdhNttG3x6VDuQd4kII9BvDbGqFM3m1Vq4Ib6A/O0+v7HAkQiwWftw84i?=
 =?us-ascii?Q?ntfp6mqTzQLjHcS/INz2BypZc8FnqbDRK3BGAXNnBEhByueamhhK6CxdSaul?=
 =?us-ascii?Q?TQ4eRbwyZgA6MVqqQHJGCGYixE/pmzn3f0or2jKjUMQJBYk6xjZil4tdJGNY?=
 =?us-ascii?Q?T7nf3aiIisIFXmo+nnpZwkYDqRgCotaMXRPEY0fFdPL3fjOhExF3iNz9fRLl?=
 =?us-ascii?Q?c6bYFrIV/7CFybe4RtsqRq+NzjU5N5bj6HoMlfc73khGmoO9mBpQdPyM2Ho9?=
 =?us-ascii?Q?wqAPMWwDot8B74UXJ09gVOf+W2RqbausiELet/YhDgtjXDKt6MfTNDiYgebI?=
 =?us-ascii?Q?b0jGdPYKOQrkOmNdDUGpzGXLxqOu93DmDYeRBmPx/oLScWP41SiGJk7venSo?=
 =?us-ascii?Q?FDdQ8w85lSBcNk3AwAqcuFwCSAco5+seooT9DllL197eOdO5tIFaVjcZDnc+?=
 =?us-ascii?Q?nrKAOuV/mtwFqzHoQqWO3z0ho/LKkTAC33n8jcOJLvKL8LoKDdB3R7+mEqpc?=
 =?us-ascii?Q?VavCWCU/lE6ZlsIggAZc9fy3L3vqQ/NJbWlvL05VImKgP/m2opqvVlYBYpv2?=
 =?us-ascii?Q?pm/JkNyw1vSX9cgmaQ+cD/PtDzOpR2Nm+hgmskXa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 847da3e4-4b32-4eab-759e-08dd80ff1531
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 18:05:21.8822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: poOVAKjqJBPV7NxMu6/mFGQ1TX5vqucTcyCPoY9jKoFz/g5PYleU4jSwVbFABx9sSrMIiSiSXgFuss4DcWz85Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9856
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_110525_384556_B813365C 
X-CRM114-Status: GOOD (  18.49  )
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

On Mon, Apr 21, 2025 at 01:36:38PM +0800, Troy Mitchell wrote:
> Use guard to automatically release the lock after going out of scope
> instead of calling it manually.
>
> Co-developed-by: Yongchao Jia <jyc0019@gmail.com>
> Signed-off-by: Yongchao Jia <jyc0019@gmail.com>
> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i2c/busses/i2c-imx.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 9e5d454d8318..cb96a57df4a0 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -23,6 +23,7 @@
>
>  #include <linux/acpi.h>
>  #include <linux/clk.h>
> +#include <linux/cleanup.h>
>  #include <linux/completion.h>
>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>
> @@ -891,13 +892,13 @@ static enum hrtimer_restart i2c_imx_slave_timeout(struct hrtimer *t)
>  	struct imx_i2c_struct *i2c_imx = container_of(t, struct imx_i2c_struct,
>  						      slave_timer);
>  	unsigned int ctl, status;
> -	unsigned long flags;
>
> -	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
> +	guard(spinlock_irqsave)(&i2c_imx->slave_lock);
> +
>  	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
>  	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>  	i2c_imx_slave_handle(i2c_imx, status, ctl);
> -	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
> +
>  	return HRTIMER_NORESTART;
>  }
>
> @@ -1125,30 +1126,27 @@ static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
>  {
>  	struct imx_i2c_struct *i2c_imx = dev_id;
>  	unsigned int ctl, status;
> -	unsigned long flags;
>
> -	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
> +	guard(spinlock_irqsave)(&i2c_imx->slave_lock);
> +
>  	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
>  	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>
>  	if (status & I2SR_IIF) {
>  		i2c_imx_clear_irq(i2c_imx, I2SR_IIF);
> +
>  		if (i2c_imx->slave) {
>  			if (!(ctl & I2CR_MSTA)) {
>  				irqreturn_t ret;
>
> -				ret = i2c_imx_slave_handle(i2c_imx,
> -							   status, ctl);
> -				spin_unlock_irqrestore(&i2c_imx->slave_lock,
> -						       flags);
> -				return ret;
> +				return i2c_imx_slave_handle(i2c_imx,
> +							    status, ctl);
>  			}
>  			i2c_imx_slave_finish_op(i2c_imx);
>  		}
> -		spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
> +
>  		return i2c_imx_master_isr(i2c_imx, status);
>  	}
> -	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
>
>  	return IRQ_NONE;
>  }
>
> --
> 2.34.1
>

