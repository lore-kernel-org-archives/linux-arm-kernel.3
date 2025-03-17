Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2CCC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 14:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVGYg1Op/a0GV1T1ULU8Vge6xxXF/AbXXXgUYScOq7Y=; b=cG3j+RsZrxBHwZqQ8iaAmaYAqc
	YS+sBelQvOQfIgW+ALNPjZ1n3P+yyIUY3eAkyAdWZ+Zr6GUaFlfMNsxYciUUO+rPI6tEDbNlnN+7l
	/Th6CRPh3Dpdl1jtjOA5tm9dWRvKb65dDWeVXga5Jev6zQkPurtG0Vtt2QF39Qs70/RhfIYiZLq1B
	6HN8l8LceXq34BTtyhQUBMmWuBPtAHVutKH+c09G9NmNjQ/GMFlV/Ksh3S1IFXJDUNu17vrGiMiBp
	qk2C1/jCBr4mK0oRmvRnSI4wvV85e2GT5l2eQlPh2vmQhFXmGreGGGku2g+gUEgNfwxJ1K+F0B8Ax
	bBV8fyBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBq0-000000032OL-2Rzy;
	Mon, 17 Mar 2025 14:53:08 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBlt-000000031no-0Q3U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 14:48:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ko3NYBx8nBpmS7T5HuVlLf5AZBt4TotUvRrBH/Fwf3id07+SuF2XFkduszx+sVXDJkfEeOFaNOZHwa3Kz7BzNtpIekaPW7oM+PmlA03wggJOJsXR97aFPWegWHi7dVIRO+LYcrTjHPLY/6Ri8UNnkRoc9C35ue95SZHN7dN80k0EUTJdd681jhei3mmH1/shHwGX8iHz8KtmSKySykOTSEuqdlSOmlSz5W1LKRxPC8utLXzpk5jUko9k579bAm9UPKMRAAFyfpNRnD8ui8vxT+YxssHg5Gi3C70dmOP4L4TLLd5c2CMd9duj2qXUIpIP+furJ9fVSGAuX+GDcORYUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVGYg1Op/a0GV1T1ULU8Vge6xxXF/AbXXXgUYScOq7Y=;
 b=YdP0wXHa2wSKoR8EoZq5vb5WEV9FP/0dwSgn+EGBPJU/JNFwmUog6pJ48W7DxD1r9DYmWZkC7zwZnyxMR8bfjNb4Mh1MymSqjIoooPD9ymXPtkFZwnrtKAgUufgWBBgs3OeEKsNZTLeCPVT8bxFrBALM++WtiIz3MZ3CFR55vlVIwj0tRVDB34+YO+XZogN8Q2G9HR6CPHrWXs4lVSgHt8YZaryOt7sT6+kUoJh608PqBcoUZK+BJ8XnjR75GL0U+oB+U/MM2rTuUeZ6cNIi/ixmkGWkJoex3LasmbbiDya3CX2S0ECEGbI+2dptDH975oj4A6AZtN0PVRaOP5FGKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVGYg1Op/a0GV1T1ULU8Vge6xxXF/AbXXXgUYScOq7Y=;
 b=frIrh6lKhP4TZB5kf09uLACvolm337YGmfksz9OF3ZSyDUI8wS33gc5IlXccX5ypl5HarSqbS9hZma/bu4TwOlSiBDrNuNzto4/8kRyJVhXK8xz9W/idioScdjj1Ie4e4glj66vnkYtd79Q1baaTPnDubiSmjfdSLz8wq1o1hVccZNT77rjP+ND6edBD+NHRJne1KWbTZG4OsnZR9Vgetpfip8OUpxuHHgl1ZwAwB6RgHqK6ZcFA9Aoj7pjq+pMYzuVTRPI4ddnyH+eQiZNBbzfcGcIKwMeOH+zWBbMNlSdi1CFSJliFlnX9BwQhOXKf8cEt2vwfS8GaBcTrH3g8Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DU0PR04MB9635.eurprd04.prod.outlook.com (2603:10a6:10:31f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 14:48:46 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 14:48:46 +0000
Date: Mon, 17 Mar 2025 16:48:43 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 net-next 05/14] net: enetc: add debugfs interface to
 dump MAC filter
Message-ID: <20250317144843.wp432pgodn4vjejf@skbuf>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-6-wei.fang@nxp.com>
 <20250311053830.1516523-6-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311053830.1516523-6-wei.fang@nxp.com>
 <20250311053830.1516523-6-wei.fang@nxp.com>
X-ClientProxiedBy: VI1PR0102CA0088.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::29) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DU0PR04MB9635:EE_
X-MS-Office365-Filtering-Correlation-Id: 37714767-1403-469d-be59-08dd6562d21b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BzEUanxrLUGrWqmpA64U09MV85u2Tb5bAsHOdKnpPpUF6dzMP3uH649r44Tk?=
 =?us-ascii?Q?SI7CThM0+uBM7JdvJ0rQE/9lPHtON1ZHfOdXeb+2Rwa60k2t1RVOAIm4UfnX?=
 =?us-ascii?Q?HsU39xS1hgEYK69Jle/+NMln56APR3jRv3Hn30jk184sdERN+SpZTsj+d1/w?=
 =?us-ascii?Q?T+zFKXDgZcQ2cDAlNatsrXQhp2dk0XnP9k0w+ryHU7gB3haIKfdOzus6aosn?=
 =?us-ascii?Q?NF29ma7t5EoAgWr3jNzAQ+EjbAKMjFhVqz3STXHwx5t9Qh3Q/3bPqCxJLSKI?=
 =?us-ascii?Q?GOcTyhtE5/FmpetuWpXEkOGOdytoApLP3ggnmOyzJnjgLwplRNrd7CG1t7Yw?=
 =?us-ascii?Q?HqpvscPA0rCX8TmB3fma+qqoRMELDgP5b4iNvFAIAjDtBofpl+Lvu0HrGcBz?=
 =?us-ascii?Q?FhAoDtXGwG4AJVYSlQjpaAPIKrMgfM9ZRz5nUuzUr0XP7ejdewlMrcP/IyLU?=
 =?us-ascii?Q?MN4mMAUTVU40ExVS7GPbMRg6QwIzVx6x13B77KtWBBeZ3Ytadh1lNWMbIn2f?=
 =?us-ascii?Q?TrjJ2hJb6PQtEvsw+yrxBh1cIsN79Fwg+dlbHJpbnKXUUHzYOgbZsN7u+2cO?=
 =?us-ascii?Q?IxkRVqrjqnDbY3mkNcxoY/hTXA621AHpASG2xtNlTzbQrxyIiNzho96ni0Nz?=
 =?us-ascii?Q?2cj/ZhVl5YvegCEV4DSqsWDHbh7H/hR5eds1s0Q/j1Ys2gaj4ToPkxkvuHxo?=
 =?us-ascii?Q?FkekCWMjkIALotfO3q+bUUvzwp1BGeTwrNh1S1IpVTPMY51TnOLJ6HPQQTPw?=
 =?us-ascii?Q?T7IZG+QmwFNgdYfszny+IsyR5JrEXlgVi+ZIvwlsyUPTLnIyXsX+oVfhvuWp?=
 =?us-ascii?Q?XPgeGg6EiPJZssMMw8hWlnKW/prUFmDBAOrDEuJa6CS7qzX1O8xxJ2CAQByV?=
 =?us-ascii?Q?/SA/UTOAdYa0N60p/gvzv6Xux4iMS+x7Dgpz757PSvVXKy7ISEDQJ8P1DaBm?=
 =?us-ascii?Q?b1WQQn8OxH6Xl1Dt9s2NPciFIXjoDzwHnFdrH4rYFkMkkcm6Lv/LaycXFByi?=
 =?us-ascii?Q?4y8DvrOR/BwTYokR2lGODxD+J4c7FTYWFEJwzfJZRMkS2MitlinSCJZ2/mK5?=
 =?us-ascii?Q?SI80o25m7xmGoEs8FtjTWOmWHeH8VufEqqT3eyOMM9E787V1TUg/6+AyAoel?=
 =?us-ascii?Q?aYQjBKkZxyqnsjvaHJ951kDHljhEmnvrH2xjuyL9S8UEzhH1jIK8B6fPBZ7l?=
 =?us-ascii?Q?iCvRUU1ihxDMVefUB6dtgKktpRoEU80jdJ3Y41/YV5V9UoJFaSvJ9b1Hv79O?=
 =?us-ascii?Q?iJMU7JNPhmAqFZ6UlhAzt9SbjUdqYJVCzlqV6UUM5gt8rfLIPXN6fQTwTHLJ?=
 =?us-ascii?Q?FJKLiVLu01+i52NSqXKhHMXtpAz3oqop0DKOA3Vb8fgIqeb0BrwyPSXUgdLv?=
 =?us-ascii?Q?lx5uaupKrWA7sfA2YEm4MisRHMxr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rM+cOxyWFoDcAOl4dGtYJMkzo0hN28khplRPdxpy+WU4+VoqbAkHTsCyWZwg?=
 =?us-ascii?Q?pMj1eX7eXzOfpZtL5jGHCpPfPAKgW5IIIUdw4ULiR0IIjTK9K5aWdwN/hgRa?=
 =?us-ascii?Q?o5PvbilFdBQNHx5b1RsgjZX6TgluTh+R1f05wftYFMTkmIl5q5NnyR6Gthtu?=
 =?us-ascii?Q?VUd+FKp46FU4zzTrVRUtDTc1g1q8GttnD2wwpqCz7V/HPTSaR259Ih54tdBd?=
 =?us-ascii?Q?QhxPHt5xVEP4eMM+8OTNBbkGjgxD1tdnrteE/W+b2x0j/pj7L2PGKCBXHYf7?=
 =?us-ascii?Q?pGqSxuFMLO4f0mGb10us6gR0PGbSB/axzOj+z0xX0ClLSahcJj2yGSacWLrR?=
 =?us-ascii?Q?dc7tJlhO31X+Hjzcpn2HXgUd8LfbUUt++TMeBXNnIgO5fEJ0qSN5tdnt/TFE?=
 =?us-ascii?Q?uo7bL+zSS81e8LP3zX7K/A4WuU3JM32J69f22iyxMIZnHgUCV24Hog0OnPK+?=
 =?us-ascii?Q?C95Sr6AidkHRWNA9b6dIQwGil5ghvBcKbZctPNE6h1I+uRaX6GM1bMX3FZNO?=
 =?us-ascii?Q?YcHbTHt2BRtc91YCmLHheOz78CJewSm5wszawhVnixGZcC4hTCWkEC04foiI?=
 =?us-ascii?Q?P7Lx6/gPJ5O7RMiJHcqqszBv+iVJH5NHhnDxTPttzqhMiecfN47Ua3kJvaMV?=
 =?us-ascii?Q?XpaVC5Nn3UpbfC24/ZwPLhcV7wN/x9FJHp1P4IZLC3Ad878HFI8ybOxAU8jY?=
 =?us-ascii?Q?OG7AhVjgrjviDwYCGhtTDzo2M0wU9qXiCsKMLmMbjJH5m3iyr2PpMYd3LvR6?=
 =?us-ascii?Q?TfzQ2qitISH85Kqt/rRaUUgeTGnFfjXIz7Vc3bkh0x9eLmUYK655nQYxr6D8?=
 =?us-ascii?Q?qAgHHUbdoq2qjfMCXHlQ6S7NXItwJbGU4yXtwxSqY7jsj38xWlu/SY5Pg5+u?=
 =?us-ascii?Q?GCbuZgLOo/MvgyubqtgNsCLr+pv1e2OgFyCl0BOPi6QFRF10alz92/z/qx0V?=
 =?us-ascii?Q?S71RuyRyVHzQW71Hg3dJuxvrXERqZ32jqYbY0uUu6MBBQnM/L6nowTDmtj9W?=
 =?us-ascii?Q?2ynQ7f2ulMmxRWFNz2CUnSXbqsJYNd/dPhY3xIRhjIdXNg6STyZntSu541MS?=
 =?us-ascii?Q?gKfzNxRZVfCEhEtj//cNNHYxJblNeZ6F1v5waWBYtoyW9WvSJMi4I1sHjG1B?=
 =?us-ascii?Q?/h5AszFGbbUvYVV9vv4dcGNh8Dcz7xo82yNE4PO51velvRKRGYZewfFwgR/9?=
 =?us-ascii?Q?mOxQ4j6759LO0fFIsnf38jOWEV3YbY5oT2z5bG2BHZgNv6JTlDS4mchURM0F?=
 =?us-ascii?Q?SwwV4FfB98pjHEJr54++bfQw1Gal7mqKQp5gp4iLeoK4iTXmzzGChH9nvU6U?=
 =?us-ascii?Q?eF1GHonqmJKV4FtgRK/mJ4iCgJRbfbM4cd3dl2mDmdRSrAUZnXN54xoCV0Id?=
 =?us-ascii?Q?XqUeFqZCbyIVCZf9eUgAnC5jDuL4EsMeVMLVuVh+Fe35B7EL7M67j2Uf3Pzu?=
 =?us-ascii?Q?ImgC0bEOSICzFuwCHRb4q5hz/rCDQA3iBaqOYnwUsJS+Dr6sBtuc7TO1UX46?=
 =?us-ascii?Q?bpbJZaQNfMVWMQQ1MP//zj6TbtcmWloF9vBxMu79Xcfk09//c1fvVwYV82wM?=
 =?us-ascii?Q?fs4ccuzjlrQ+cdTTtd9M4taeRRtI/mdhHoO30rr9nh2+Ip2De19mbtChvFF3?=
 =?us-ascii?Q?ew=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37714767-1403-469d-be59-08dd6562d21b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 14:48:46.4312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGPteDPfowMybgEd8UFakXdOlIcjbI2NoKotwB8FAXAEBiaAInwog9jE7LQXIM495VcobxQggUijBy13oWC67w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9635
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_074853_153706_AA0BA1C1 
X-CRM114-Status: GOOD (  17.53  )
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

On Tue, Mar 11, 2025 at 01:38:21PM +0800, Wei Fang wrote:
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
> new file mode 100644
> index 000000000000..3a660c80344a
> --- /dev/null
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
> @@ -0,0 +1,93 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/* Copyright 2025 NXP */
> +
> +#include <linux/device.h>
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
> +
> +#include "enetc_pf.h"
> +#include "enetc4_debugfs.h"
> +
> +#define is_en(x)	(x) ? "Enabled" : "Disabled"

str_enabled_disabled()

> +
> +static void enetc_show_si_mac_hash_filter(struct seq_file *s, int i)
> +{
> +	struct enetc_si *si = s->private;
> +	struct enetc_hw *hw = &si->hw;
> +	u32 hash_h, hash_l;
> +
> +	hash_l = enetc_port_rd(hw, ENETC4_PSIUMHFR0(i));
> +	hash_h = enetc_port_rd(hw, ENETC4_PSIUMHFR1(i));
> +	seq_printf(s, "SI %d unicast MAC hash filter: 0x%08x%08x\n",
> +		   i, hash_h, hash_l);

Maybe the ":" separator between the high and low 32 bits is clearer than "x".

> +
> +	hash_l = enetc_port_rd(hw, ENETC4_PSIMMHFR0(i));
> +	hash_h = enetc_port_rd(hw, ENETC4_PSIMMHFR1(i));
> +	seq_printf(s, "SI %d multicast MAC hash filter: 0x%08x%08x\n",
> +		   i, hash_h, hash_l);
> +}
> +
> +static int enetc_mac_filter_show(struct seq_file *s, void *data)
> +{
> +	struct maft_entry_data maft_data;
> +	struct enetc_si *si = s->private;
> +	struct enetc_hw *hw = &si->hw;
> +	struct maft_keye_data *keye;
> +	struct enetc_pf *pf;
> +	int i, err, num_si;
> +	u32 val;
> +
> +	pf = enetc_si_priv(si);
> +	num_si = pf->caps.num_vsi + 1;
> +
> +	val = enetc_port_rd(hw, ENETC4_PSIPMMR);
> +	for (i = 0; i < num_si; i++) {
> +		seq_printf(s, "SI %d Unicast Promiscuous mode: %s\n",
> +			   i, is_en(PSIPMMR_SI_MAC_UP(i) & val));
> +		seq_printf(s, "SI %d Multicast Promiscuous mode: %s\n",
> +			   i, is_en(PSIPMMR_SI_MAC_MP(i) & val));
> +	}
> +
> +	/* MAC hash filter table */
> +	for (i = 0; i < num_si; i++)
> +		enetc_show_si_mac_hash_filter(s, i);
> +
> +	if (!pf->num_mfe)
> +		return 0;
> +
> +	/* MAC address filter table */
> +	seq_puts(s, "Show MAC address filter table\n");

The word "show" seems superfluous.

> +	for (i = 0; i < pf->num_mfe; i++) {
> +		memset(&maft_data, 0, sizeof(maft_data));
> +		err = ntmp_maft_query_entry(&si->ntmp.cbdrs, i, &maft_data);
> +		if (err)
> +			return err;
> +
> +		keye = &maft_data.keye;
> +		seq_printf(s, "Entry %d, MAC: %pM, SI bitmap: 0x%04x\n", i,
> +			   keye->mac_addr, le16_to_cpu(maft_data.cfge.si_bitmap));
> +	}
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(enetc_mac_filter);

