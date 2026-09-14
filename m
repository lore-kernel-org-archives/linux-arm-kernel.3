Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67ED6C982C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 14:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+5uMsala+PLgl/+5VDMoT0/bxs8epZ5j74reflCqoI=; b=ddY7ZBOwszubNZ2olwsx/cQuuC
	foOppb67PVs+jrFFf8zdGgxFuiw9ylWy4TiSpU6uBIWsilSza8sk1Cce4yKyd/yCIz2iKFVyjdU4u
	MP9BwM80gMVcnDdOqkSNiQQIiAH/SlrXMr1cblue7T/CRbdhPFXW6HzXvhxQyIyljTkp6cYNexXwj
	aNPPoQ8V6Ads9GArqKEmq7kG0mNTAZCyxFyYMv3Y4snU3CkiFpAtR6u0WgYjWhTbUoCrcHlv/F2po
	kwvOoL/pDRAv0HvXZFOAVAsXemoP6LXffLyBqjhoKlXJHvyscAp+1Qvaiy0tSCiSJWY5oZq/kF3PA
	k5K6NiAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67WR-00000003xcG-1bJZ;
	Mon, 14 Sep 2026 14:19:03 +0000
Received: from mail-francecentralazon11013002.outbound.protection.outlook.com ([40.107.162.2] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67WO-00000003xbH-1jVB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 14:19:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+e0gDQaThSypsAGDC4Jo3I3OqDeAgYk1od0JGBI7qD5aVYIlWHKZYkGuUA7kJ9tOk/cxqRIlwMDwFmuC0o1kmb4kUHMAXBAVUmFNaLUSr1bewwu0xl8tCJUij9N7EmI8yKUQuiXIik0+rhFlrpxfX633MeJRTwQniUKk3T8+tV19opP6SLJf11fxXMWNtJhuXM6Kwu6N2zBsBqsW0xwdSfrgmq3tVpos0FTKXf8Dc6BzGY9cYDm06wX3V3OPYj5w3y30gWTbz5OpTErmn2RAkYUuqFcVGY/Wi3MvyTgqYzg58VWupf8xRomAH1+N5UF/bDfykqVvW89pN37GMh6XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtXbtNl2fyOBLKQutEG4d2uI/0S2D6FkNBaodQmdeTw=;
 b=BaHci/u9cx7BD8bBj/B63g+4ZNbJXlPmdWW24RKBolWfr2mI0xT9YUlbYi6ALsMHxVpHxYT9rgC9K9+TR3xCtkylsJAj5945zzssQzp5P+CDyP8DUly4wzK6P5t1GHUzYH5lteXqwAe0cdycnwrEjur3yNhCO7v1Qqh7XUBG0FLFci3Pi+c7l47kL4i4y/1JATmYuzS4bb8IKth7p5/6bwIZI0ToIic/KZ2mGGYa8UgmidctV/Vcku8tMbTWEskTb/gODuhv9R8/ChapK4sY5A8TlmPR6aKe2xTOKy+pm62e65Q+kD3eQ+2xS3aAxXVxtVhd1yxQD4O/g8AIPkjQ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtXbtNl2fyOBLKQutEG4d2uI/0S2D6FkNBaodQmdeTw=;
 b=wc2c5ab2cOxFBe7lL2TU5DVJdTlKTRuXSphij2aJx/9aEgitJ8xQe0GgurfkvbpKyv76YmZmu8FXSTbJN8Gfqu5NEN/nm3Rjo7cgBq06OEpQaQpno3IU916lktoBsFmm6vwDuJCZjKvfHboQp2IVjQhrEtpvtB+qp9+C8kLxDPG62xb98QxFuU+6JpiboWF2L4QJtKIFPntqV1RtOWRhKzA61mpBpgtknhdpFetUMpQogaDFPdhhXn8WCLkMqGpB0p4NpzGx3Q7RYkgSqgvn8dgBEigML49CRnXn81uJZSl/alXuib7Jt22uyeJEa8sVwOnPK1qd57/htgRRD9fsgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MI9PR04MB244341.eurprd04.prod.outlook.com (2603:10a6:290:bb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 14:18:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 14:18:54 +0000
Date: Mon, 14 Sep 2026 09:18:42 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	=?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v4 01/10] dmaengine: Move enum dma_slave_buswidth to a
 new header
Message-ID: <aqgCQvRw9fns__0d@SMW015318>
References: <20260911-dmaengine-support-wider-dma-masks-v4-0-72b8fd4cc78e@analog.com>
 <20260911-dmaengine-support-wider-dma-masks-v4-1-72b8fd4cc78e@analog.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-dmaengine-support-wider-dma-masks-v4-1-72b8fd4cc78e@analog.com>
X-ClientProxiedBy: CY5PR15CA0185.namprd15.prod.outlook.com
 (2603:10b6:930:81::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MI9PR04MB244341:EE_
X-MS-Office365-Filtering-Correlation-Id: a2802730-9b02-4117-d5c2-08df126b1b5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|23010399003|1800799024|366016|6133799003|10067099003|4143699003|56012099006|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: KF/7c3HE+bl+eu1WoiBN5xpi9IV/xfgv4rEiVMpLDD7PN/PqNWCDYXtkZM+7NfOITQBz3UFJb+gSyXC9QMGjJ6UI2dWoRd0MCvxorwRK8uwacbJumq9A0TLfv1dIiElYu5x2M1tQO8JzfTQJlJ6KGT5FzES3cAy/GlFZPkS62yRuCWe2BMXZ/jR3bQvnKYjDKInBvvSVCj/D/thAXtlwLRFwE5fzpA7vIV0QSRJXOka54qWqRh6d/oungEwClyZrab0YFsf3ONgyR0aBtLU5wkC4sOeTUK2twVm06RX1/1FOXMAqJtZGnt+kuG3dEheZc7HecPzGVmm4E6ltNgoQbqi19dDtvrAJV/rzdhFmzbO1uBey52vxY8F3DMH7Z35xqtOyVQWCelW1PZeGA8c6aR3T6kHlDzdZfkom7zNyavvTFHx8iJmW/BbcRO04fm4fEwKcHNICpadovOeNlxgfTINlgKAJUpuogx2SJPhEV9VKgw6Z+871UIqp3/TLijM5EYyfr06luVPRFzPxEj0K8l5mtV7VrNdpKRBAiyIXmY5E9X/TwJs1/ymDM9CwmrSD1tC0tW1XAoVWCWvjgmEvItqgVZjwFEKQ4F9k8wnocpJ1+Xn42qUF4LGhz0syMu6Ar1/3AU92XivzuV41+4xBA25eMu34bIysSU6W1C/nP8M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(4143699003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dhnpDbflRgKw4EkMHxuYcQj7oOLf8W7hanreRBmg/kXzTiQhXRddzJ+HMX?=
 =?iso-8859-1?Q?ZnKS1ASe+L8JHldtTbvGNaJ/QI459ZaQWjLzSvvBbyNTLj1FA5F/LCisYw?=
 =?iso-8859-1?Q?cnFYJY58JfaM7PvKUs0nyK0YZCNL2VlD1MF00v6PETyWslIn6/6/ffWsSH?=
 =?iso-8859-1?Q?bbM/WFmMQNtrOgtT+7N0MGR2vvjrwyAdmU1J+CvhIlr1AgIQDyakCtrrSq?=
 =?iso-8859-1?Q?wrP9DtfpnZtXE8ik5cruXboAw03orBBSUOh1vkTxs/KxQWWMcxY3JeQ0WM?=
 =?iso-8859-1?Q?V0ER2SCFrzFgwJxapD65vsD+GXEdfiEzwgVgp9+hVtyXpZDFr7XDHi92QF?=
 =?iso-8859-1?Q?rvM2HLD3oSD5DMkY0aeXtX486l+QU1BGDM//OfU4noOBHgM+vIenV65kRo?=
 =?iso-8859-1?Q?uto+41tbgEWUSsCj5QHElWlPIYRFMxMnCukFslikBx6dQdYkGGobATLpo2?=
 =?iso-8859-1?Q?VOtK8yGD3lROYlM92QMnx3P16UHkQYI/QOvAe0PZGhFwsHEQ6VnqL3s+3m?=
 =?iso-8859-1?Q?L1IvR0YPNqxkPRUQHVF4RJuia3t3JI9ACce8VsHP7DTTknGVjrXAmxzUMD?=
 =?iso-8859-1?Q?/K4FdtNuzZ7bvMV77+WvEAr3Lcpkbfx80AgXRJ7XRWt5YVlocotCxdE52V?=
 =?iso-8859-1?Q?BL1maAfPzFLvNA6BS++ZXItvB7wgMIP3j6dZLc3HASLYoVAVTYA2lLqxRW?=
 =?iso-8859-1?Q?+esjm3qr5uwTX/S0fSSN2HE7FhZ68MKvSod2xgy7G/aTZ3i/N+9UI/p59W?=
 =?iso-8859-1?Q?Qami0SdFSojpt8qBqznZEw7H7xF0qdL0zrrcRc/U1JLXaweEKuOD7djL7J?=
 =?iso-8859-1?Q?JdZwfZCPbcT8eXU21it9YCZvuFu5KB6wFdSYb8VctnlDbuznPLfSAXbOfs?=
 =?iso-8859-1?Q?XZRO7eolaH+UJZZGSLeJWiKX7Ts2QHac3JOn9IxUcaCBVPyLPRMsEHTrCc?=
 =?iso-8859-1?Q?5va8VwYDDkdfGqcNHDwspad480BTJjY6Z1UsXhG5qaIcXrVe5UbsW2AoGy?=
 =?iso-8859-1?Q?PHtK8wUyiYUKKMq8Xn63FecWqVIZ/AyZldqONnqW9OlLI3cV39fiFdF9DK?=
 =?iso-8859-1?Q?ALOkMCPqFDIAghi6XRoy1jHVoj4++HWLsrZAFZtQgK2KSCsgEkkid7lMdM?=
 =?iso-8859-1?Q?8ETQlziUwtJ7bRmT742RdRg3QaNDP8V4g0DMqXbvx+ZI0Ru9NF2S29YwCu?=
 =?iso-8859-1?Q?rIdV9MVt3HsQnRfypJjdUOr8YsiUuZdpyyVBtO/OoJfhEmn1vArIkEVWs7?=
 =?iso-8859-1?Q?07IV7enQRgflEGDETau112nRFntaIhSCSeRwDV7Dd1WP1JuZXH1J5bifVC?=
 =?iso-8859-1?Q?cTni58RF37YGVzv4Iu30Pv6d5AO2+KgGE/dLLlLUHc4401PcJM735oIKch?=
 =?iso-8859-1?Q?xDuKOaw5hxROYYrV2i5PkxMEbfbra9kbwtCk8fsNF4QRpzAcCznAPrHsir?=
 =?iso-8859-1?Q?zXs+c278cNxdXN6x7NjdWdY3aSZUrOpD0EJyTXaiJMpZKsm6IxrwkJtl3Z?=
 =?iso-8859-1?Q?isXAeacCtKoDOgDpAcK9ejHAxO4JiwlZupGKjal+7IK5rU1117Npsic/A5?=
 =?iso-8859-1?Q?duTghu0gQGaVugoVxBmLCkyXuaAgNmkPQVJW7dhBcyiCRkgQSKDCshRw3n?=
 =?iso-8859-1?Q?Oo0UZiEYLacqSi3DsYhCnf4fF2F1ld/PH4O6qTDNjyrbp6vMAcLbTo78PD?=
 =?iso-8859-1?Q?lzBz8FjXpNd7laYsZYY1RqCocHnV6Ct5QGiKxO6OYl6GE8vJ1gOJhwZgEA?=
 =?iso-8859-1?Q?jmcODPviKMzH3wmLqmQpciRJADBMBuvK9rXj5ZZzzOqk5sbxpAul0/jKEH?=
 =?iso-8859-1?Q?7kVPULcV0I43e8rtzahoMbrUSjSihu6bsYaVo9OWHIc34kcg+Pt9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2802730-9b02-4117-d5c2-08df126b1b5d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 14:18:54.3195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zfbPcoQhSKWPEBd3lzqUi+WWghFyNRjtzwV8qGbCOF+0T4x4l1oG0fx8o+uAhxyCU2fP3kGaChVabIyhEeKsxwS303c/Lb3qcVU3irsJ1u8RcoeAdKAxz8/53/lRnbs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB244341
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_071900_465394_C750BE14 
X-CRM114-Status: GOOD (  27.94  )
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

On Fri, Sep 11, 2026 at 06:25:36PM +0100, Nuno Sá wrote:
> In preparation for the bitmap based bus width capabilities, move
> enum dma_slave_buswidth out of linux/dmaengine.h into a new
> include/linux/dma/engine/types.h.
>
> linux/dmaengine.h is included nearly everywhere, so growing it with the
> new interface would make every one of its users pay for it. Keeping the
> basic types in a separate header lets the new interface live next to it
> without that cost. linux/dmaengine.h includes the new header, so its
> users are unaffected.
>
> While at it, add the missing kernel-doc for the enum members. The block
> already opened with /**, so kernel-doc expected every member to be
> described and warned about each one of them. Describe the UNDEFINED case
> in particular, as its meaning depends on where the value is used.
>
> No functional change intended.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> ---
>  include/linux/dma/engine/types.h | 41 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/dmaengine.h        | 20 +++-----------------

I think it is good to split dmengine consumer and provider header files to
hidden dmaengine's detail.

suggest name
	dma/engine.h

so we can start move more API to this files.

after all user include this consumer header file,  old
include/linux/dmaengine.h rename to include/linux/dmaengine-provider.h,
which only include by dmaengine drivers.

Frank

>  2 files changed, 44 insertions(+), 17 deletions(-)
>
> diff --git a/include/linux/dma/engine/types.h b/include/linux/dma/engine/types.h
> new file mode 100644
> index 000000000000..2e8a266e42ef
> --- /dev/null
> +++ b/include/linux/dma/engine/types.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Basic types shared by the DMA engine interfaces.
> + */
> +#ifndef LINUX_DMA_ENGINE_TYPES_H
> +#define LINUX_DMA_ENGINE_TYPES_H
> +
> +#include <linux/types.h>
> +
> +/**
> + * enum dma_slave_buswidth - defines bus width of the DMA slave
> + * device, source or target buses
> + * @DMA_SLAVE_BUSWIDTH_UNDEFINED: no bus width specified. In a
> + *	&struct dma_slave_config it lets the controller pick a width, typically
> + *	derived from the transfer itself. In a bus width mask it is a width a
> + *	controller genuinely accepts, meaning it imposes no constraint of its
> + *	own.
> + * @DMA_SLAVE_BUSWIDTH_1_BYTE: 1 byte wide bus
> + * @DMA_SLAVE_BUSWIDTH_2_BYTES: 2 bytes wide bus
> + * @DMA_SLAVE_BUSWIDTH_3_BYTES: 3 bytes wide bus
> + * @DMA_SLAVE_BUSWIDTH_4_BYTES: 4 bytes wide bus
> + * @DMA_SLAVE_BUSWIDTH_8_BYTES: 8 bytes wide bus
> + * @DMA_SLAVE_BUSWIDTH_16_BYTES: 16 bytes wide bus
> + * @DMA_SLAVE_BUSWIDTH_32_BYTES: 32 bytes wide bus
> + * @DMA_SLAVE_BUSWIDTH_64_BYTES: 64 bytes wide bus
> + * @DMA_SLAVE_BUSWIDTH_128_BYTES: 128 bytes wide bus
> + */
> +enum dma_slave_buswidth {
> +	DMA_SLAVE_BUSWIDTH_UNDEFINED = 0,
> +	DMA_SLAVE_BUSWIDTH_1_BYTE = 1,
> +	DMA_SLAVE_BUSWIDTH_2_BYTES = 2,
> +	DMA_SLAVE_BUSWIDTH_3_BYTES = 3,
> +	DMA_SLAVE_BUSWIDTH_4_BYTES = 4,
> +	DMA_SLAVE_BUSWIDTH_8_BYTES = 8,
> +	DMA_SLAVE_BUSWIDTH_16_BYTES = 16,
> +	DMA_SLAVE_BUSWIDTH_32_BYTES = 32,
> +	DMA_SLAVE_BUSWIDTH_64_BYTES = 64,
> +	DMA_SLAVE_BUSWIDTH_128_BYTES = 128,
> +};
> +
> +#endif /* LINUX_DMA_ENGINE_TYPES_H */
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index fe33a20abc61..573e5ea34707 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -12,6 +12,9 @@
>  #include <linux/scatterlist.h>
>  #include <linux/bitmap.h>
>  #include <linux/types.h>
> +
> +#include <linux/dma/engine/types.h>
> +
>  #include <asm/page.h>
>
>  /**
> @@ -384,23 +387,6 @@ struct dma_chan_dev {
>  	bool chan_dma_dev;
>  };
>
> -/**
> - * enum dma_slave_buswidth - defines bus width of the DMA slave
> - * device, source or target buses
> - */
> -enum dma_slave_buswidth {
> -	DMA_SLAVE_BUSWIDTH_UNDEFINED = 0,
> -	DMA_SLAVE_BUSWIDTH_1_BYTE = 1,
> -	DMA_SLAVE_BUSWIDTH_2_BYTES = 2,
> -	DMA_SLAVE_BUSWIDTH_3_BYTES = 3,
> -	DMA_SLAVE_BUSWIDTH_4_BYTES = 4,
> -	DMA_SLAVE_BUSWIDTH_8_BYTES = 8,
> -	DMA_SLAVE_BUSWIDTH_16_BYTES = 16,
> -	DMA_SLAVE_BUSWIDTH_32_BYTES = 32,
> -	DMA_SLAVE_BUSWIDTH_64_BYTES = 64,
> -	DMA_SLAVE_BUSWIDTH_128_BYTES = 128,
> -};
> -
>  /**
>   * struct dma_slave_config - dma slave channel runtime config
>   * @direction: whether the data shall go in or out on this slave
>
> --
> 2.55.0
>

