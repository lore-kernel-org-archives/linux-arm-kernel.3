Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E660BCFC28F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 16:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=690h8i8BNFTMFtMHbBMEu4o5PZEpynWfCUJR0rBJm9Y=; b=Sf3egdeMaq/5MdZzP5a/1tk0tO
	5oeYHV3Oe+0EsvVDohYGKPRwSFgc6lLYEWrSpLfTWSVqUWRuYRp91CgviuOVr3wutfi9aFhv6Dhdv
	AT1uWloV6SoqbJjL5wtL/4D+sC7sYaIG3Gc/6/OLNNp9PaYfT+yqz7AdYOKSZ8yeAjEFAP79XhLOO
	A1A/N+tmAgAzBK+KCZ9Afe/NSSoAVMkuUhcbFPEov0jru92QZkCuRs7QYjUZt2n+jWxju6y11o1Jz
	Qn401ahwYcyAvXyzTNwOAzOOrIch9IQP3860GdDgJtjhVBYNpzQSzol1pCFlzlI6Us0fmI8u6lNKW
	lk1lhpvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTgK-00000008gMX-2Wdz;
	Fri, 21 Nov 2025 16:08:20 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTgI-00000008gLh-0gHv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 16:08:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDmsCohIcxr7U5L510fsA1x5BioFbhL5miDRocl3J6zeokuxe1ymHozNaZ63k4G/5Gi8pXj2Ui6ysqDyyqmJWCvQLEGpNCytts2g1EeClnoaDK4qTlUl9JRiEe8Q9dIz7Q7YUEu+rxCXxFMvrrqq3bH0Qr4tx58roNxTJI0uYDfOQZKS5IvTefrZwI5+5yTEVWRQ/pc5B4KKcIYmQ6mAjPCdzXY6JPLjqEnAAaXXCPd4zLwa9PdxOH58AavZQe+C3Y87t5J+Bm3+yJIvOv/n5ag9RElp45pS3VU4WU1tAiEUUOykiMsDumkEDinXH0QQxFYCRgEVsxzdHVQ9jNsGGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=690h8i8BNFTMFtMHbBMEu4o5PZEpynWfCUJR0rBJm9Y=;
 b=EjMEN7Ei1eKCaqMLzFG41YGH0T0o9aP/SxOZ2D49LfuZbU2lL+p8jjqiT34/IxJUXzFwzbukZLTfnBZ4k1aFQ6uPnm6A5gE/YmAyFPa6J7BK3w8yjJaBCOyGwtaPLmWu2DB7Zh7Au27gsGO312Yw1DKOKWXUUdpu8AhmIvPmKPY5NL1AE7Xh2zdgR8b6HokeYoslM+bHUD9FZ8LSqgwsEWj+xBjPnWM1iYidjfGVKyxQfYysgyKUf7FYoHAvvylLFr+wMziFtq99tahGSkgzvTeUNo6xCecDBXgaUQdAKRMQlf5p3BMf0foTxQG42jZUInaf2Brqh3T8ArNWU7Jcnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=690h8i8BNFTMFtMHbBMEu4o5PZEpynWfCUJR0rBJm9Y=;
 b=OfarOnAFRK0cJ5RTn+xM5bCLKzKNeH2mkIWcQDjbsbAiv0WP2hllLFYzGcuLvVJ8yFK0rX8nvH2GGvKbpJKs/jdBJ601Ey8f4TUhWafDUMZJ+vpi1obx4D3j8Qkq0GRKdw8T6dkWM+jZfAoRExQCeJ6yKip0RDmpfzcwAm19gby4b3Lt4xT5n4L55WwAEuna1UxJXpw0GQHQ8eZFCCiyHwrP0ujYrWMFqZK2z4ezcJuBW0NiE1nY1z875V6vLOij/xbV0UkHu7eCMc1yF3XiXDnpJ4kcPb4ZuHHReKwn9Pa8L6AkMk055CwC2g7x/NV5jT7ToxfKx3nF9UJaMu936w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DB9PR04MB8090.eurprd04.prod.outlook.com (2603:10a6:10:240::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 16:08:13 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 16:08:13 +0000
Date: Fri, 21 Nov 2025 11:08:04 -0500
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
	benjamin.gaignard@collabora.com, p.zabel@pengutronix.de,
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
	ulf.hansson@linaro.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	l.stach@pengutronix.de, peng.fan@nxp.com, eagle.zhou@nxp.com,
	imx@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] media: verisilicon: Avoid G2 bus error while
 decoding H.264 and HEVC
Message-ID: <aSCOZCJ2rSw7LAvE@lizhi-Precision-Tower-5810>
References: <20251121081911.1682-1-ming.qian@oss.nxp.com>
 <20251121081911.1682-2-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121081911.1682-2-ming.qian@oss.nxp.com>
X-ClientProxiedBy: PH0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::11) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DB9PR04MB8090:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ff90ac0-8d03-45c5-4e9c-08de29182c1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bw/F4ok8iiO1zHDYOUS1zv5qqjjupa+QkBytw+jERtkRa1BoPewDOGRwqPTr?=
 =?us-ascii?Q?0H6F+il3YixJcWUjQh+mtWTPMWVYSiJP22HQBDPPWGf5WmF6jr0uiHmcpx7Z?=
 =?us-ascii?Q?86auMAYHtzvK1/odJJoGq3rDea08+sKjYGSlliMtVZhN9zXbZFbuXCmiO8YF?=
 =?us-ascii?Q?9TyvNaFRuEXjBOG1AnFLjVXMRO3P8QflepvoBsEjEqE+Qct8EeeV5P2AAnFT?=
 =?us-ascii?Q?3O9mNedk9RZtI3vkJQPyA5yHv9M+RoNTvwmNBbdw8YGsMmzDkNJxmiXlvAQH?=
 =?us-ascii?Q?Lk3FA4oocgU8AdIRUKv3tur9HB1zdvoBghn/Fvn4+5eigNXXRlJOQMECyqko?=
 =?us-ascii?Q?NW/+ikumlxt8JOj+qC27l2tgTmyPhE+cgP6CjWmiCJ/qcEIKvSm+mWWJN1L6?=
 =?us-ascii?Q?NfzPB48Jw1Vez/ez17IaYG4VX7wLXLGcxM2oBHwWqhVQeWWxJdsYGdYuVW+5?=
 =?us-ascii?Q?1lF+FanLKHPyilW77EqYVctmSnrx8I9TaS03y/U9xPvATbVtAmrJEY3w2WM9?=
 =?us-ascii?Q?u+pwanfEW2WYCzdQTtk5VjxoQT02kX84o1+owBRwvn5XQdyz55Stefl5s2lu?=
 =?us-ascii?Q?SNYrOwgGiQ8Cq5oKf3BAYHCkozfeJb/QUl/E3feKgted4AQx1CDZpSGpKMN0?=
 =?us-ascii?Q?Kta5A+3XzRh84YjIm5D0adheIK1Y/5LT8rA3ElGRr0VjpaGGab1rDuFLXykb?=
 =?us-ascii?Q?EgLGZQK3Wm8+Yr12+pJo1DAZqfmf8z+9CvHJ2KtIqU6Cf98OiYbfdeWZQOWt?=
 =?us-ascii?Q?QkLxRV/QVsYnHJHHkc7We1M5aqm6nlPqzMQEcPkhwWYCjmcbVoBwY0svMSXG?=
 =?us-ascii?Q?h/Ta+vPp3beUBtanxMW0hnPuTYxG2KFF3BUDy+6PuJ/2KiV43ilmQOzLXye1?=
 =?us-ascii?Q?9Ss4/Ijo8Rhm0zxFe3zEyIw9AhgLlbuAGJw71QFahiT6ZfvaqWZacpdky4xh?=
 =?us-ascii?Q?g2XwdXlNiTTYclqvY8vt2qE+hIS+tB6+6OdTd6rof4aJ47DcMSFkhKL4Kf8D?=
 =?us-ascii?Q?cb58EE6dryYBfWBn4gJqB3F1WFMbIyk1Amsu87TiF7Fd8rrfuHoiKfJKknvP?=
 =?us-ascii?Q?NrpUi3o3uoj562NhevfO56V4T2lib7ioWrOHeIaUkB2W1iiZDvcY1FLTdxH9?=
 =?us-ascii?Q?CC+czffrdjw6K2bij935A6TKsmXDneIiHCk1Or9v+/W/rZ9Mw6MlpWBgvbDx?=
 =?us-ascii?Q?CnkB70bK62PnxhUIx/hxVLhk9cL2R//kjeFcLGd3qbxm9xQn7MFuRBMzbCGA?=
 =?us-ascii?Q?V6D7urWgrSFBHebYZ/EIoMjEa0NvkC/JExGZY2gYh/t2NbsxKzQZUYhyphsr?=
 =?us-ascii?Q?copvGfEADUBT/G6415SwKZhcK12EEPrJdaC6iRcQyHGp8rFBhtSLI5DYDkTn?=
 =?us-ascii?Q?qO2XPXdOuZgQ59J8JYuEBJQ6tZYTiEd1n55H495DA21iW2bkqN5VPjLuDKGu?=
 =?us-ascii?Q?4uyAyI21nXUcGIIHXdH1kOSQQ1Y/MrDt91E5vf0y/WicZm0lhlSW/Nk9sM70?=
 =?us-ascii?Q?C07C+d+ypuztBcZT+AqNqqOVKFw+kFRLN9SR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+U4/zSPyt6iWlkUg0SQAXE1qaXKoH+tNJr8onzhsIJh0zKiJtHaH/1PUPFLG?=
 =?us-ascii?Q?PSR0Tg8ShHSsq1635X8WLGzTIIa0ZnjjuzCLF2C1PcaJlHREw/nX7YwWnVMw?=
 =?us-ascii?Q?QTdH4kEq5igIx+R1978w57KeUaYU/hzT6ICGp2I1fmEQNjK+oojAEdEDtUU2?=
 =?us-ascii?Q?7L4PAXAChh3Y2FZEeBJ6qz2Toq+1CStyDO6mpgrRn0LehTq6tvdNCFyI8Lvh?=
 =?us-ascii?Q?UdxnQFSLqGINteiSvuYZ27fAJyCROnzEHWLyvsc9151hmLi+D5qqryVbspg2?=
 =?us-ascii?Q?Nc7N6XdhBem1wP6BnVy1A5WdrY0K0LA/qSlOXhYp+yTI+KaD2dIXXJDIR9K8?=
 =?us-ascii?Q?tz4j1KsZzCFyKZ9t/QHayDGbbQMu9HS1KZqxISbhtqg4xnN0iCPxhrMPTp0m?=
 =?us-ascii?Q?JLxI374+/YElH7JZSlMXnC+iiR0NTASuyBgrlhyIXwyzB2FH0dpGsI2vJoX/?=
 =?us-ascii?Q?9khN/mdoFie3wTuDxO+mD+LN0/ZDsB7iIaa1qE96u5eypW+23GXM7jogKWkX?=
 =?us-ascii?Q?8F6fSGfJZw2ltvypdZaPeSlI0csjtjM5rkspQtcT2sY/53gK6deIhSNo5m8z?=
 =?us-ascii?Q?6N44I2wkdXaPkZ+/ps8z/f1mT3wtpyhymJdCEuXRYSkydnT3B0hqfMMt53uG?=
 =?us-ascii?Q?SWg66y/y7dbCmbCC3AiAmx15Wwf1SX4LePoHW44hjmhHWVHsG/srXVFnPFEp?=
 =?us-ascii?Q?Rbl0U67PjBg9MjyWrOMA8+c1UzfOzVsKac+RiYj1VLbFNydeRQhLeNZXum7w?=
 =?us-ascii?Q?8bcNsp6mB+D9g8tXRLwMbiQZzsuaqnfayOs0Zrz2uldnmecTNEioSH5nBpOn?=
 =?us-ascii?Q?kG+i5drbdEP21dOX0WGBqNQGi3gE/aL348NIOGHj2zPRpKTRgYA8+WdH9qPd?=
 =?us-ascii?Q?ShFsBzY76wxFxecDmKhy4PubpgKiw4iNb2cbPn1PpAfOey6m/RjMWTV2BuUA?=
 =?us-ascii?Q?hzOnYbwkYLO/gIA96MICm+vmzXgZsoghVnKMxBGK8a/D6xDvehABnAYBr1ra?=
 =?us-ascii?Q?rCyNYj7M0t81NP+pPKowv0DyCqJXBTOHk+44enpT/Vw2+dqwNjh6P/+R6nah?=
 =?us-ascii?Q?vxLlVIlczIJxXdH4m03HTwT6zq9c9EIznka478FZTaWW0/ji/QgKTa99uIo6?=
 =?us-ascii?Q?HfIS4r9KqpbNnvpnddXwhaAWhRox4IhmueRCbPb4BAHp7keRagrrRPBYJ6ED?=
 =?us-ascii?Q?asFZY1kxMwOaTgoZ3I8RtuBiukeFZsrr9Ad0wTd99MeomHgIsMIkQyhXB9iJ?=
 =?us-ascii?Q?oS+sn8WKsRpbNgYFzQ90uqQA9g6V6Z8YC41sQFGK1oALJ8GHq0J9TVW/Sd1/?=
 =?us-ascii?Q?mt2zB8LzMM4w54fsIBAbSyCUD4Q2I4TzrI5QJeP9X/TcXgpMR0D7g0qBxXrC?=
 =?us-ascii?Q?byjncwv+MeU+lcbW2kUlcrznNPt2tzeOdhLox0Dv4yQVinpB7BefcukD5tZi?=
 =?us-ascii?Q?A52SEbzt7a4w2wMkgK28WzsPbILgLghcYnHLt1fDLu1AFtLB3qAP8HSMw+Fb?=
 =?us-ascii?Q?4D6EW/jVTAw017oXpUvWbjl/QYimwEGbsbm1svmtgVwLmSIveZaIld8fEcOE?=
 =?us-ascii?Q?Kt0fmol+pBL8x02CN8pGBqbWv9BvkU1Zzjvzk/G0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff90ac0-8d03-45c5-4e9c-08de29182c1f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 16:08:13.1683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9LZq9/RknXhg2IYVDqIQvTdF1o248+WS8tKF1224dUEmoJVJ7C2Ab/U3cumOMvAoSyvJGdbCRIMegr4E1XVww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_080818_209020_464EEFE2 
X-CRM114-Status: GOOD (  21.02  )
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

On Fri, Nov 21, 2025 at 04:19:09PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> For the i.MX8MQ platform, there is a hardware limitation: the g1 VPU and
> g2 VPU cannot decode simultaneously; otherwise, it will cause below bus
> error and produce corrupted pictures, even led to system hang.
>
> [  110.527986] hantro-vpu 38310000.video-codec: frame decode timed out.
> [  110.583517] hantro-vpu 38310000.video-codec: bus error detected.
>
> Therefore, it is necessary to ensure that g1 and g2 operate alternately.
> Then this allows for successful multi-instance decoding of H.264 and HEVC.
>
> Fixes: cb5dd5a0fa518 ("media: hantro: Introduce G2/HEVC decoder")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
>  drivers/media/platform/verisilicon/hantro.h   |  1 +
>  .../media/platform/verisilicon/hantro_drv.c   | 26 +++++++++++++++++++
>  .../media/platform/verisilicon/imx8m_vpu_hw.c |  4 +++
>  3 files changed, 31 insertions(+)
>
...
>  #include <linux/workqueue.h>
> +#include <linux/iopoll.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-mem2mem.h>
>  #include <media/videobuf2-core.h>
> @@ -93,6 +94,9 @@ static void hantro_job_finish(struct hantro_dev *vpu,
>
>  	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
>
> +	if (vpu->variant->shared_resource)
> +		atomic_cmpxchg(vpu->variant->shared_resource, 0, 1);
> +
>  	hantro_job_finish_no_pm(vpu, ctx, result);
>  }
>
> @@ -166,12 +170,34 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
>  			      msecs_to_jiffies(2000));
>  }
>
> +static int hantro_wait_shared_resource(struct hantro_dev *vpu)
> +{
> +	u32 data;
> +	int ret;
> +
> +	if (!vpu->variant->shared_resource)
> +		return 0;
> +
> +	ret = read_poll_timeout(atomic_cmpxchg, data, data, 10, 300 * NSEC_PER_MSEC, false,
> +				vpu->variant->shared_resource, 1, 0);
> +	if (ret) {
> +		dev_err(vpu->dev, "Failed to wait shared resource\n");
> +		return -EINVAL;
> +	}

why not use a mutex?

mutex() lock here, unlock at hantro_job_finish(), if second instance
run to here, mutex() will block thread, until previous hantro_job_finish()
finish.

Frank
> +
> +	return 0;
> +}
> +
>  static void device_run(void *priv)
>  {
>  	struct hantro_ctx *ctx = priv;
>  	struct vb2_v4l2_buffer *src, *dst;
>  	int ret;
>
> +	ret = hantro_wait_shared_resource(ctx->dev);
> +	if (ret < 0)
> +		goto err_cancel_job;
> +
>  	src = hantro_get_src_buf(ctx);
>  	dst = hantro_get_dst_buf(ctx);
...

>
> --
> 2.34.1
>

