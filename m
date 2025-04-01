Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3591FC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 21:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMd0+6TQ0HAounDFKWwpeTpPzDShxdLl2+NwJri+XiQ=; b=Efj3iVBLQzGUXXOtXz0SyuLrmW
	28KAYIcoSTKOnVKY5ps5EFbF2uBkOSB6TGkSF/svYGEhhZFChQ2GPEqs/YNLas24oRgsft0599mH+
	NuwLQJ0PKEowcMWf/hzQyB7xcMuuQk3fl0EHURLKMvPLH5/UOarR6ZF2G8LsuhYYFvuNX5L+DklfW
	NVaT3toV8hjRoCOYQDDQhAFbAAIldlHPhb93gaaCi9TLIrYX4wCNvO3+lO1v10DesAtHKHG+pUqHQ
	vzLlaweJtJWBoZ7bEHP6tD7rEpQJdfStM55RQX4WXkXxpqZyXwQBc0DjbHnupL/Kpow48HaWGRc8m
	DiSG6pgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzjII-00000004SmZ-3hGt;
	Tue, 01 Apr 2025 21:37:14 +0000
Received: from mail-db8eur05on2060f.outbound.protection.outlook.com ([2a01:111:f403:2614::60f] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzjGW-00000004Sj7-1Rmt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 21:35:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wECTGH12y8m6ZbApyUjQP0GWrTYYgX+U9joMRjGlOdfXRxBTVZTeJhQg9NlCzFQRqZUfRgJBZT3lwNpywJVDtkb0uf0+I8xI4xQ7Ngf0m5ePU3hBWMMGRIPGcz4skMZAwGq1b7rrmk2gWDVudBcfWnX8mJaq3FUt1lj+msrvpU/f3uBhFxvC+iylappvRN+ojMqqvP6XxcJ/copIPtqkshNEn2HQFOnYL4iNv2fMsV1+bTsCm6WYUgQtpB2czByOIoQ+Fq6mQdb4daLIMFWZX9gSYs7Senp0q7Hudy7QS9DnxRpy7mVanACvYkqzgppUaWuJfJ89nNB3e17EfnprVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMd0+6TQ0HAounDFKWwpeTpPzDShxdLl2+NwJri+XiQ=;
 b=ZWP3ydMPaJVvFjdUg6ClgUvg7xNzPTqxMoWGziPDZd1z1uEWwJIvQKrX4bE0iUEjEukwRdtgbKE9QRuzYL+Lebz+yRJ30vW0zSxOkQtzG5ZdwmK+ndZoB6bwle5w6ZhkrR5B/Ouo9V8+QkIwnUP1TY+eSKHy0vC9AB9YkN3Spj/4b8pg1w9N7XVJjpENRsOdelrTWt57kzyuiiCiAAPqbgfXpd1Qlo6G3hblNFwGfAX5VJBYTjTsLQFEJcDbTlaKWPpBRTO9Z/Nj7svUbjZ7Ou0o5jW02UWEQXjJPL30fMFKeT5i6UmVZzzNASjuES9PkGRvg224CMDOijfutjHhEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMd0+6TQ0HAounDFKWwpeTpPzDShxdLl2+NwJri+XiQ=;
 b=JGVDkgamGdKtMikfqotNKsPnVMcI2Db1ukq24el61OxmE7qRRSesSA72wgqIZDl5vH7mwQ+G9lMfSp9V33zxjYwcKlGI5ZONNPBYrfXlZLHKgeX9F1cSjSPjgKkb/x/5JvrtKfIdO8A4oKyuYlxXP3bcADn037Jhd9herbyxopHk+PNMZrTS9KnbSszslhQpudNJWP5TiRIBqf5kl7rU8JBNQaRNNiB0hiusXBT+cuN5hqLyCqUQbtLulb2ZrAacwlng+gT5Jl1QWN59NAaSgdT4PbCkyG8vxIWRYDSH9Lyi5EF1biWp/4lBHLhn1g5sB/uFz2OfjIDmQFjru0Sosg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB9908.eurprd04.prod.outlook.com (2603:10a6:800:1d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 21:20:17 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 21:20:16 +0000
Date: Tue, 1 Apr 2025 17:20:11 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/6] arm64: dts: imx8mp: add aipstz master ID
 definitions
Message-ID: <Z+xYix1gbvP1HSNG@lizhi-Precision-Tower-5810>
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
 <20250401154404.45932-6-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401154404.45932-6-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: FR4P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB9908:EE_
X-MS-Office365-Filtering-Correlation-Id: 246e9f10-e5bd-4372-a7bf-08dd7162ff71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|1800799024|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ufc4EYPvotxQcsszfMpRe7VeCj9kpYPUxYvFRicakkuMhDRZhWVYOale3VnL?=
 =?us-ascii?Q?gwTlmu1xL3IWfrn6BcKW0bL7jqGHVhihlojrf8jiAHXN05seRK4BpNfi1C2E?=
 =?us-ascii?Q?vkiNX/7GcT44Vd7CNaVuyyhxofmjXcjqcrdHIlHRBVyeTHcZ5fnhDX6krORm?=
 =?us-ascii?Q?Urbq8asbxufbUnU9Ngi69Hn6zP0e96secYYzZ4SxpkRWg8MT9nZvnhwTxdyN?=
 =?us-ascii?Q?mIU61BCFtbdsJ3QTSV2P1DaiURYrKYKoSVjXrod6ZGSH71czLKvoAU/GoqfD?=
 =?us-ascii?Q?CVvGYcn5VY92K4Z/ZAYQDsY7JmH9lNrgZWFIrZY/Rl/v1vq2iOTuxDuKScav?=
 =?us-ascii?Q?A9eU4aAr9x+qiV3JxoZN4Brnpsq5Ysjh/k5o8N9NhB8CJSovc7h6l52FRKgw?=
 =?us-ascii?Q?54CFPb+tj7cJuDLuwCCr2uaOSmZ9r/GQPmswobHOTJIejw0/F3NqT9a05WUR?=
 =?us-ascii?Q?Fqv+lf22gB3VEmVOZUzsQqZwLOBfWnugQS96m+HB0zLY7DvVtJvuC+gGQZk/?=
 =?us-ascii?Q?qVZTHihGSyiWxDuhk3w8F4kb+IdHff7ntOBtC5MCrr+O9GvwXIQqZDBwLDrj?=
 =?us-ascii?Q?OVh+nFrkQvMD4MgmMpElKHrSy5rfRk9zkd/gTyCxsPs2H0H37Xb0gfhSrhkp?=
 =?us-ascii?Q?RU2cEK5/10coyiNIHk4aA+50YFLhv8nXVY4QQ6Mlw5wN91upYPROV+rJkTpC?=
 =?us-ascii?Q?RAk7O9KHuoH3QXyDYnJKg2FrJ+TS4YjOF5uuFTC8HVjKS9wDhhymkKh2+WA5?=
 =?us-ascii?Q?mUDOaK/lPxU519fRjrLFQW8eVXnCaTdLlJt+1MI5nkbKHz87R2VL+IQVxKWP?=
 =?us-ascii?Q?LOvYmVR/pszJFt58WHdJK+SVv9blk3Mncm4JJwEMmjGE4HyEspLoj1mBL1gZ?=
 =?us-ascii?Q?fLzdTb3aAtVBWZMVHhA+S6tzCO6VoiHTNFPlidogrdZMXMloPCMxjCRzoMjb?=
 =?us-ascii?Q?HcyFVT4Lz1C0E56qcuYM/IRMZ/T+Lqph8+aeR62US1lFscrbTt0bibkkXTFn?=
 =?us-ascii?Q?AD5mNnH5UAdctzjH1X3FDpp732AUTuxYkqz51gZ6Pn3OcslOIT+PqCz3H4Jr?=
 =?us-ascii?Q?QZbcMQT3UL2M+vYlxpK05kOCvZQzMZsiwlo6wjAclKVqSt6boImmd0d5UAKZ?=
 =?us-ascii?Q?lFcTQ6FQk8pRnHBzZLwZZrf+QfFjijxwVDDuymJViXqcy5SWdUoP/scyTBHd?=
 =?us-ascii?Q?pSsFbHNA97kPYz1ihYoblMI42lSiUP/sKbP2yETZ3mmOf9zToJIduIb20sB9?=
 =?us-ascii?Q?xwgeinFQIGaGmbyuBzeAKutVlC1ycjxYCRw3IljnnDsJyiFFHhQjdjcm8ALm?=
 =?us-ascii?Q?+Iqjkz5hjj5E81097dtfcXhNUuwVJW2ZKegBVVGPkSUiW5MXgEi5rVMGemdt?=
 =?us-ascii?Q?g2gIw0HX9rp9M25acV796xUn9HetR/Rh7zMOaYrzhiNrYed3oXTCUm06fvn0?=
 =?us-ascii?Q?OGCxt2aFTei/PkXGKOpfIH5dl5uooNRn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I3jwJD56b+X0XYUernABKjUr3AWB0wPg2iVUH8Mo/XnpjBCLCSvqnfS/kj9w?=
 =?us-ascii?Q?LowksFb14pKBSiM/rwCbRWvGT7ZqCo/5hAHifTeQmGCjVhrWlUMpbsXUvQBf?=
 =?us-ascii?Q?waBabYmKG3QGHkmz+QGgZKsfhVkYd8SUKgHHaMbVxeyZe1O4KYhcvY0Q+Qiv?=
 =?us-ascii?Q?UYNI4IijGAkjt/QCb0QEwF1OaENDhziArIXsVqMMCv4Eik/GJ3WdJllAyUob?=
 =?us-ascii?Q?bqBRKVLgHuLsSztedLXy3yVw2i8dc3FjPMiRTyK2mTWXKGs0MIZ+2PzCQOkt?=
 =?us-ascii?Q?JuGnbHwFyQlPaOIeoDaTP91GSCgoyOaFHeWAJW/QIZTnO+a0za4kTDnBDolg?=
 =?us-ascii?Q?p5kml6Hl/nioTew3m5LjkLXMwyuHWxNesRz3QnOooLst9JKNnPF9e3nY5jLZ?=
 =?us-ascii?Q?OUhBgymSXA7WeWKQdF31a6FdBsfxi1MTlPh/tUOFSEhfsnLu1TFwGwtFqHiv?=
 =?us-ascii?Q?tGi4PE++vIaNvpgH9o/2BRxY1f8AAFzQVs/YtOr1ooIpRDsDN4B2Tk6HiOVi?=
 =?us-ascii?Q?iDvnjy7PQt+smZTHAVL2nwfebg6e9WUO7ewOoCCGo6sWUZThqLsLejOA5chH?=
 =?us-ascii?Q?11fPyM/aKO/HC+hL+JpZg6FkEZZ605g5DRU1uOb9N2ho3aT7wEwXZDAnEWC6?=
 =?us-ascii?Q?Em+EvRSR1ZDOGtKpTAiCJcLcvQmIKm6QzO3Ablo6/d9O33vDZLSDdfR0+TiU?=
 =?us-ascii?Q?8rnBtI+BOapnA9NIwnBzox9AsA/qCTsymoDbLvYkJX0A/Hs8ZCLtN2yw9eLZ?=
 =?us-ascii?Q?yjEn9EZZR4oZPImJS+qlwATIQyAyfSkDYB1UNG9dzs09Hh0caKM+TEsQEARP?=
 =?us-ascii?Q?1S2Iq/ZBvgDTgAF+rsVQP+qcmWqghG1o7b1NkpkMWTlGf+B9fPDq/irF7XZc?=
 =?us-ascii?Q?ecSphPbEM+vyAkzlA2GTGIvZnyPQMMOpYTJcCeR6+S8tUK0LiTsKdZvaVeQC?=
 =?us-ascii?Q?aEkkTpeuk8jMaSsPcyk+ffApjzj0Pj77+zJWC3Mm2FR9NGJmtRLu3FICG8PB?=
 =?us-ascii?Q?ZaJvGkbQVkvCi9CmXgXdDMl0Nzkn24HfInk5LVVRW6bdcC9feE8WTZIpANov?=
 =?us-ascii?Q?sTkNUZnWR//hRHx2co6eEkCncu1OxwnfNWgK+KlNLpqXNOUXzDMB4eiapAJl?=
 =?us-ascii?Q?evc0u03E58x1OI5/lXnr8uwei38PHqeh3NYot+s1aJgE4QJdM2gUoI5ceUbW?=
 =?us-ascii?Q?aM7HZmpX9uqycftexSX9PQfZ9IIx9YOuMcHATqZpJvUEXte4pZ/iD4VLtXAs?=
 =?us-ascii?Q?k1aYSPek9wtBhyTMyfnjzDrhRB8Tdf2hs/T49sVylqy2QcjpbmUEvy++X/BN?=
 =?us-ascii?Q?ET807L9bqHrq8RiJ72yGv6baM8uQY2P2QfWpzZPI/j+eNu1MzhkmA5XnJRH7?=
 =?us-ascii?Q?V64A1Dz6K/16nyLxd+A7Pu7U9faTGUsF/CmUZPmhrbqwAcDlhu+aYTJnYuGt?=
 =?us-ascii?Q?e4aD8gupTYZEFgzpIDeuKInHAneaQNFcaXq8kqWSNnElJNNGNV9R7k5RGkol?=
 =?us-ascii?Q?B+FrGH7pYdfYqC6M+UiS949e/zmBUX7aegvMaH7IxdNPQ3+hVxl63t6t/9EH?=
 =?us-ascii?Q?w1z2kg+lDB8pAnWl8b4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 246e9f10-e5bd-4372-a7bf-08dd7162ff71
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 21:20:16.4309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PmR2/GPijYR385BmJCzAg4NIfd6/ZlWokUB0u+eCVks9fktj02eXpvNVw892OeW0thEVemAKnpDS/OVWSvRvPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9908
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_143524_390694_957D077E 
X-CRM114-Status: GOOD (  18.76  )
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

On Tue, Apr 01, 2025 at 11:44:03AM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add header file with master ID definitions for i.MX8MP's AIPSTZ.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 25 +++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  1 +
>  2 files changed, 26 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
> new file mode 100644
> index 000000000000..23725cdef23b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#ifndef __IMX8MP_AIPSTZ_H
> +#define __IMX8MP_AIPSTZ_H
> +
> +#include <dt-bindings/bus/imx-aipstz.h>
> +
> +/* master ID definitions */
> +#define IMX8MP_AIPSTZ_EDMA 0 /* AUDIOMIX EDMA */
> +#define IMX8MP_AIPSTZ_CA53 1 /* Cortex-A53 cluster */
> +#define IMX8MP_AIPSTZ_SDMA2 3 /* AUDIOMIX SDMA2 */
> +#define IMX8MP_AIPSTZ_SDMA3 3 /* AUDIOMIX SDMA3 */
> +#define IMX8MP_AIPSTZ_HIFI4 5 /* HIFI4 DSP */
> +#define IMX8MP_AIPSTZ_CM7 6 /* Cortex-M7 */
> +
> +/* helper macros */
> +#define IMX8MP_AIPSTZ_HIFI4_T_RW_PL				\
> +	IMX_AIPSTZ_MASTER					\
> +	IMX8MP_AIPSTZ_HIFI4					\
> +	(IMX_AIPSTZ_MPL | IMX_AIPSTZ_MTW | IMX_AIPSTZ_MTR)
> +
> +#endif /* __IMX8MP_AIPSTZ_H */
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index aa7940c65f2d..ebbc99f9ceba 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/thermal/thermal.h>
>
> +#include "imx8mp-aipstz.h"
>  #include "imx8mp-pinfunc.h"
>
>  / {
> --
> 2.34.1
>

