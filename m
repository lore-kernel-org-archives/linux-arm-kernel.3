Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D3DC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 23:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:To:From:Message-ID:Reply-To:Cc:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u93Fz7qAULiwd41xIJu7c3FHb+yrl70RtUhHAIM76ko=; b=aXwDdri4H5xQHE1YkMzVzM89Oi
	5Ds4JO5U+qEXp7elC8BV94lKysQFK5MRT0V/jFjCRvXZvXqTwYkCIVfhICCT/4dEbsgds3vE1eByZ
	8Lm8ea7QLfdV1JccSc2dsFB4tbp/7gEWr9jiUT/ior94k56LJbIwKwrGs7PX6nT8OcfjCig+ms50K
	qlThHl+kstl/mj+OY24rEg/22a2zNAnxOXuyIpIBx6OPJGM3VV6UQ7Hd+2gGKl9QHuNpGUIYzHHxI
	WZlkJ5S/pNhZQ/bVLf6xTjDVvCSmxF2NLpjdJaKTAFOgbPimxgQTrYfs+VQuQGxgVdGgQHpvdxagZ
	sqoaN+1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS1pU-0000000BXwC-03sj;
	Wed, 18 Jun 2025 23:04:28 +0000
Received: from mail-japaneastazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c405::2] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS1nG-0000000BXs1-3Ucj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 23:02:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6JkuLfhx+uIuXZGJiydPm3xwWNiakQoZK/u9XxR4jp2sZKa00yVoQy3/ZMu8nzioBCp3a46pos/Ce43vHuF5CbVN/jDaITXJg3Og0wjbNeNYPSoHkKI2hn6fXd1m0of19FqTRykNzl3gTv7gJT4Y4ZBs7mGA5dFzwibWmSdoBdUSS+9OX3a1+tS7RcIXi8ILNFmJeSM6g0esc/Ukb/cl7grQ2Mpo9A6UTycLQ7+JCR56V2P8E2LEXJfN6VOz8hR9sWhiLp+wEs/cJEHBgSXrmU83pb7Jo55V1/syEL7FzOfb9Nj9sHjqIfZ7OJrAfdfM+3VaR8/oHwBAv301nH7/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u93Fz7qAULiwd41xIJu7c3FHb+yrl70RtUhHAIM76ko=;
 b=Lil5sdyVXdnNRfCXZZ651pmE5/qXTHq32WJu77rzWVg1UCi5MS6GKloRgsZifJE/d0hQ5142NveLSmwiOrBXWukVsTpNV2ZUMn9/C7MGa4iToX120mLjObLQicHTMYmYYuo54n0djfn9BoZENs03dPTaylvzf8rZkDsAKjxhuQW2zil6Ye+xvVdJP3eZ7uzmxmPoWlCV3JyyG3+794JvlPouD14nqudOSChu3NeJ5HW1KliMcymej+UyU24305joxkME+le4cXPN1y1cRZT5EIcJ7fAW93BTROBfVRDIf1Yen6ruWL4yLs2g+KiJ3aWAGQxmCRQ5F+0XbeNK8lYSjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u93Fz7qAULiwd41xIJu7c3FHb+yrl70RtUhHAIM76ko=;
 b=BrUnti7FeOS4oh7TMaB2r7N2V/+BYNznh7noVpw72FKes0B3qp5pzgKxczRcaXAtjxXUJR4vV/7XJd4h1ifGUzdKEAMBA6LxDyy1gdJyReO8ECxcGuy45IKxrJxsicyhX9XZDK2iWCQSQ6YajdfqwU8zU33A51kcucmiuVKycjM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11897.jpnprd01.prod.outlook.com
 (2603:1096:400:3e0::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 18 Jun
 2025 23:01:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 23:01:57 +0000
Message-ID: <87ikksmz6i.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3] arm: s3c: use string choices helper
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 18 Jun 2025 23:01:57 +0000
X-ClientProxiedBy: TYCP286CA0372.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11897:EE_
X-MS-Office365-Filtering-Correlation-Id: b0de8da7-8c3c-4548-1817-08ddaebc205f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6zSmtEt5FwGhEp9w5ViD5o0R6mkVuD9ydkxj+oGo50uj/XbwGLP/Dw8n9tEh?=
 =?us-ascii?Q?hVho71ftXVxG8v60b6LpRsT2t162Ny2RK+IUt4YH9d8hK/16MeTu/mgvUfAv?=
 =?us-ascii?Q?TwIvA0zOscgQNQLPXvz1f5g8H2/PIMmEyiRhl42xGbkvBsifDIQwgH2rlAEE?=
 =?us-ascii?Q?PEiGjuENSAigQw1kgJO5373pgdnZ/8DodPcAp1+leE/I82b0xLqQ9PAccFDY?=
 =?us-ascii?Q?vDh9NC1oUZU8qKY6qdU+2kmlZUssaSWtiIYhIQfwTXbXD1Dg8S92TtpSNwHU?=
 =?us-ascii?Q?CK/ghwYK+pcTqx6dFZoNh0CHPZkFhBkaNqeCuupE0QKOyGDOtCecLPx4jodT?=
 =?us-ascii?Q?uAbowEVBvwXmGRtuITunpC6gYCeB/0+eAhM44jD51VMCj/sIu8JHy/h3Wh9T?=
 =?us-ascii?Q?RVe0jLH6TmUqmG9yAKoOpCZbxAS5IW+QG8mfWM6jeQuGNr8p9D7M517k+n9w?=
 =?us-ascii?Q?wgKF/OpYfOzue9K58Y0guZjV/TQcSKnDc7TRZujNtreqUZm214ZAlftDdBgJ?=
 =?us-ascii?Q?DmO+OZZdlvq1d7R7e+kVhf7pIYDyzb1wMz2qRM4lm10nBbAdFhjZJ1etZK8G?=
 =?us-ascii?Q?vwnTeaf13iMdVxE6yznIqGenyqD52TUk+uj5R0QhGj5J7+yjDMjgNiOpVA7U?=
 =?us-ascii?Q?LeIcxUJDqVJA/8Jl9d1hhoVSpyT+BPklYm8Eed4JcGJs85UFYSTob1r1qEHu?=
 =?us-ascii?Q?iFjzkmGu4o6sYcaYed1GAZEmi45mksR9q9nISjxye173QC81/rCjFzMpc6pL?=
 =?us-ascii?Q?EnimbdCp4ZrGs1LVnDKa+yXoT7rhivwUi6qKxYyK0K84qNXhB/hO+JxiXyqg?=
 =?us-ascii?Q?cVZ44TVBTMRVGjW2Z3h7r5Y2NuqlBeh1QZz9zMc5NSqLdeuPqDbtZvbK59Zf?=
 =?us-ascii?Q?7XLv3GrXDoezhet6WFGWekZI0gzahxi5Z6Uh8slt2kcJPI8kHK7htGQ3V7sp?=
 =?us-ascii?Q?VIrAt60XAvQ80g9eGU1RBGNAOvFCbNBk1RoeRnNTsOJhPkVamKAHeQw/t7fv?=
 =?us-ascii?Q?txXXrbwUZWTjDp2a03CuExvJ5i2IqzSWu83F36dndbVm2xSRdjr9BiS5qbPB?=
 =?us-ascii?Q?t1jngc5MFT95gL/aFgvoOWJLLjoZeQceha8VJiITJ5MvPDFAKIaD0UphxzA5?=
 =?us-ascii?Q?FakPWKWkBt1NOUoZh3BJ2lsF7yIFNd7wHm5dniJVYScmqtBlQSE7R1afSJog?=
 =?us-ascii?Q?kWtkGgW0og/N7T2FuE/WmSIh6jqLv1hIBLO3holCMSey93qqgXlDutUaZr+F?=
 =?us-ascii?Q?KlTudFQPceRMGQV6j+L54ZcL37QXVGG8sSzIAatsiYBItuzgnlzUGej8x0WL?=
 =?us-ascii?Q?Q3Ryhy3s6jncjheQVT5TV7E9sf7jKw7qWRP6pg3/4xFlq4NOqcYFjPIw/gjt?=
 =?us-ascii?Q?xQ6pwttadVnToVdRzPbbb5a84FxjRVYfHyzLi5pi4G3lz7t278Mq3GvqDjiQ?=
 =?us-ascii?Q?olCiMVfqcNeJNLi/yzmrH1X2/oZmBbBBd7nSZw2JkMa8VIww9DRNiQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XTB6mL/PrKvaRWoDHvuA/syBxFze9SpPPtznhr9hvIqBqtYtgcxA8ytPR4h+?=
 =?us-ascii?Q?j8TLsqcFfrpaXFJ/DgqymVagRSJokK9vkuhD1vv0TLl3ADa7l53FPPUC+W11?=
 =?us-ascii?Q?LNcYg2bqs81/Z+O5zJW009AGfxEIPPDKTMUrDE1ecNQjgEVos4L3UGIZYIH2?=
 =?us-ascii?Q?VMTtty80r6Hf8Jdrvc33r+DqPahRPnjTLnzCJJ29FeisLSK5kcXJ7o2JBCOa?=
 =?us-ascii?Q?qvbiWhgbHkZGwZEaURHWFtoEVHxxcYOklPH87/TgxvubWSxy5zhM3iQAe/6k?=
 =?us-ascii?Q?fIf/poEafjtQNZh+4/XTMHEuwTD5v16kZhgenPeYAYUHUOoTmFfV5PWD5lg/?=
 =?us-ascii?Q?tWDJ6zqrbYHwOPbitpA4tr7wfAz4yqoPkBdmvl8229efrr7XgLgrp23y/7ha?=
 =?us-ascii?Q?HJtzFjupAZr7WIn3yo6AKcw/Wc06Nrf6WNhjz2bMK4PYoqYjnJdc4cEY+Hf7?=
 =?us-ascii?Q?7QzSNSEgNbuKFL4FLUsU6ia2qacoxJ4UbkVPnwbKJJ/VTK4jncyREYzTjVAu?=
 =?us-ascii?Q?+db1aCJBC31mCojLpP1/8VxlArQuUx8Y7PeXm82wepzFa+nyHqyv5teEyl/K?=
 =?us-ascii?Q?tX1l0PjUwzosVdVVvETohwAxeMowuR4IghhybF6CzePMbmsoi6VAj31sQ/oo?=
 =?us-ascii?Q?OH8z3q1QsVwijZnzxHh0AWwtCt3FjcnSQHe+RHz+BpVLgea6EuUd5DXIY/Sj?=
 =?us-ascii?Q?mw+r/NXWXCwlyo/8dXyBvWPOuJ2snltV0J9cRzhpqbjSh5OWDWe+au1z2oO8?=
 =?us-ascii?Q?n8FrQ0HzoODG2Ip/Ru11K6PUu+DWO5sxY4DxQdum0yfs6y5SThgKIf5ixwb3?=
 =?us-ascii?Q?GSQNX3fDNq/WZQ313H5AwEEcQICdPlc/T4jw/23Ha/2ek1+YMg7IkLcd1v5r?=
 =?us-ascii?Q?cdApBMMA3Iyps4vp9ZbTudM/Avm5SBm9arbuTJdUysU9nQzAG7VrhEWdQegy?=
 =?us-ascii?Q?vxrD4Yhnb0+dVahIkxJWD0/Z1LaOFWMb6Es9vDYzO52p/PPrEOYt8r+L+gy9?=
 =?us-ascii?Q?Knrhyq48bLmPynTbMF7JSNx+EZZrBOKP4Cg8VDNEVo2VCyiDb4qBsx7B94cm?=
 =?us-ascii?Q?T1C6ZvcL4VU0yXYroBuztgue8Eb0pjcn7AnGqkgk+6h7ZWESHwREof5MrCmk?=
 =?us-ascii?Q?Owvud6890m2UXH4nm+vEa3Upm+btGCin+BoUHIzV+E3iyfr1aEYXd79Bl1/Z?=
 =?us-ascii?Q?62sBVvrsASNGMZziOBpSIVKEyuaswvpZhGPATn0FsLxPMxh4AJZqNS+/1XBV?=
 =?us-ascii?Q?Q3ZbstioHyuO/djDwrAS8TtX7Y23pb4aYd7WcRJCA2S2sRgj6nlODpCyl5mN?=
 =?us-ascii?Q?8DfZZNlaO8bEnxw1ujVLDVJ6J/WRYPeKGwsGb/IS8akoxcYS7vg10sXIe2ks?=
 =?us-ascii?Q?x+xDDN6eBkaifkjEGUI7JvpwXIoN6vevJ9pbQBy4YwIkaLp9PsBefQi0DA1T?=
 =?us-ascii?Q?ILH7bbGDoNQa7PAx17OfIFYyT6dP+2DhzcjdxnXAovy9o60vfm9j9BTRuXfh?=
 =?us-ascii?Q?4uOkB+gHQxI0UL/uas8O4BssPFPbTR3FeCuIe9VBvHBXHMVPkY3/9amakl29?=
 =?us-ascii?Q?GCpjj80HTT1ok/KrtTdDYHrB6ZqEKuuu+minWt3lUBH8EdbYiDul08nmBlML?=
 =?us-ascii?Q?4yGw0iyL37Uz+jpAa/J9hgQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0de8da7-8c3c-4548-1817-08ddaebc205f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 23:01:57.7724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eNUN5dyJYYW/2xGGbndLsLj4nKybIP9010qITGHKQrVg8RyQF+pjAIPzk5jV3rStGOubIDIdsDpFZ4cjikjq+UImG3RnxZFBIx0uHxXLy0+wTekW6tqeDbDU49Zc3x4t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11897
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_160210_989691_CAFDE7F7 
X-CRM114-Status: UNSURE (   9.07  )
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

We can use string choices helper, let's use it.
It also tidyup printk(KERN_INFO, ...) to pr_info(...).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v2 -> v3
	- use pr_info()

v1 -> v2
	- add commit message

 arch/arm/mach-s3c/pm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c/pm.c b/arch/arm/mach-s3c/pm.c
index 5698cbceaf7a..e4c240699d14 100644
--- a/arch/arm/mach-s3c/pm.c
+++ b/arch/arm/mach-s3c/pm.c
@@ -46,8 +46,7 @@ int s3c_irqext_wake(struct irq_data *data, unsigned int state)
 	if (!(s3c_irqwake_eintallow & bit))
 		return -ENOENT;
 
-	printk(KERN_INFO "wake %s for irq %d\n",
-	       state ? "enabled" : "disabled", data->irq);
+	pr_info("wake %s for irq %d\n", str_enabled_disabled(state), data->irq);
 
 	if (!state)
 		s3c_irqwake_eintmask |= bit;
-- 
2.43.0


