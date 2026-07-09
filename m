Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63927C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 22:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Content-Type:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MmrIDeE3TLAsvpvq1g9U34OR3k3amq5SmnXIiAN7Q/Q=; b=GHGSTXj+q1EKMx0fu7do2qYweI
	OnaiWeEKqVx9faYxbJmL+bkhimX6G4TpjEPo5SMvpKFEOELQLv7O774bn7eP7lFUpZBoEAIdhkZg3
	Z/7WCAKYDsP3pVGwP1Gh17XRxyLxG0DKnr2EIPn9jCGqcjH+bAJdRXtoCY6CDT96E8lQ13S3XUCrX
	S3bQPwyeXF2X+pl1VlSOr3qhgHjuxTJJqEvwFMYDMwwJirU+V4BpgKqsJ0A7rdCx5vk9LNnIlk3GY
	kTBmrWWuDeQvDruIm7wrA/WHaTUZkfg0Z+S8Zyd3aWgT+zlpDeIFTzB6e+tfkYbeuG4nJfuuuekP/
	xlI3U69A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whxhi-00000003pUL-3fmd;
	Thu, 09 Jul 2026 22:58:50 +0000
Received: from mail-japanwestazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c407::1] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whxhf-00000003pTt-3Fa0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 22:58:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uumqejKUB/N3uT8TCF7JgbcvSfSWtWpe/IRtQK6BvJ5cGbbDJK2MhaIHVqRtWJoiXxb3YXqOrbRKmVEetR+LimaDitiT8D2tB1s9DwONn+z9R7Ts+alLQAKeUH2KjHJVizDfHzMQ2pVHVIgfhViPztwSwKZF3JIVS24M5dLHmE2zEbol9AIddGDCn2zhkwCWotTUWDm5KXPM5sH2KebzxUMxmXWgp39auHLTuqUuOIrQzI4G+XKN0A9gQFtbQdsZ2lHqd9CnwEFWamBC3mKXCtnuYq8lp4sK4c/OVWiPrA3Ls4LwF+bGBgHW10M/lWf3psXBMXM3WBDVAdf7UxUahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmrIDeE3TLAsvpvq1g9U34OR3k3amq5SmnXIiAN7Q/Q=;
 b=yD98q3WUQdXwjSn4gfZvUiGTzV73HdzMQKBbLzJvNLNfXjtLwp7z+pRioCIN5wnFu0ce50NHdGGw6Ez6DufFLBvjV5v0zxNlADodx4q/IPiPSVi7i79oynzP2XhMto2IA0Stxu/cbJXLwnGY9B1lnyjQtGHTdYblRpz+cVr0oy2ZdGhaQYEdjwrYLDyRKCgpBMSYmp7Gc6lwgYC8UwHrHmRCzU6/MqYbJxFIX3D6X94XhSnUhtPJnu3yGgyYHsnS3tTdx0UmbQTupnW4v/aXX8SkH+BdMOqdc6Qllc+Fpq7ZhWnBnUEOuE/2qqAW1GZdg2sM+XgUdwrZMHfJpSBpDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmrIDeE3TLAsvpvq1g9U34OR3k3amq5SmnXIiAN7Q/Q=;
 b=GSYpSIQgFJf3dOVWTd0DS5m2o3aS7teeNieitbDAz+zPeDsxS/UkFsOvC1B1xli3QNmrmMRXg3DkF1WyTH1toOChpgMYTvNzo4tStU1qv+C89HgNEglXWLJ27UouoE21LW29xm1jY7Lh1b8dCR+xuAyo05xoNGTWDq4ldxGu6uQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB10932.jpnprd01.prod.outlook.com (2603:1096:400:393::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Thu, 9 Jul
 2026 22:58:28 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.016; Thu, 9 Jul 2026
 22:58:28 +0000
Message-ID: <87tsq7ojn0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Huy Bui <huy.bui.wm@renesas.com>,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marek.vasut@mailbox.org>
Subject: Re: [PATCH] soc: renesas: r8a78000: Drop duplicate "default ARCH_RENESAS"
In-Reply-To: <64de6e95719a6dec7412cf7e917a42749e738b99.1783593775.git.geert+renesas@glider.be>
References: <64de6e95719a6dec7412cf7e917a42749e738b99.1783593775.git.geert+renesas@glider.be>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 9 Jul 2026 22:58:27 +0000
X-ClientProxiedBy: TY4P286CA0072.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB10932:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e853b1e-874c-4059-2477-08dede0d96ad
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|4133799003|38350700014;
X-Microsoft-Antispam-Message-Info: QYqdCJ01qIp973PH9s1jA7t+CPn2r7pF1iONPmjUy1jkoFZ/Co6RnYyC5yodK82qRq86FYF5ROA0z1w/yVbKzxd8aHoVA5+AKwtmMLH9JHdXvfN1ObCGgKuqTXbjD8005NMGpU6T1Ce2DOMQSvJVpkgV3GOGRcPY0DINM7vVybWtQAgAd0hNP2FZZDwhg7+wAa9OBQoqMsQuLhBD9RfvvGr3LNpNusFfZI6KjH0fOjxJ6RVE/CxwWhPNWQQxylX2uFCvj4G2ZGVCeDipng+fUhIwmMx2IndsTkoEcrPPcYLcLHxJno/8F7NVbIDYjqW/e9IwQDttuKV2i8GHfIvgUjRmP1KZbwQ6iabo7CJ6U497wgwzZh1zBsC3ETqlQLb1cudrpfbGI8y3AHFEcYVXq+GCkgUrblk16DzKE7Jh2caL1bSFTFalo5HahRTnasxpdoA/JrAurab57f0lgZaXQJZ28vRWeBKDTdFqOyhYbZ8EKgjewW4SGwg37t4YsKdC2uvIKk7574W9xyoYJ5k1YnasFZ3LRh+NTWm+6ZgghwiEmfbA4lq4cLAC3iQ/zmn4rKDtGfIpg3CbqJA4BuDPNNazQyT2Klh0HoQIVDaQmaYIPqbdR3fAmBg6pImahilMwMmdUNpLznR5VKpr7+fh3jcEhLK1XCfJnLjh/vi6WgOR51TOswEyppBUPGSzc7mRczoBm1yggXNK2XZJkOVeFyAvJ9gGyhDi8NTY/NDfhGQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(4133799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MWiQH1mlsYmfATR7sROR7uu8xv/IowrpKHEkZnLT1kFyro4oz8NnsDU+Z7nQ?=
 =?us-ascii?Q?2dfgsjrvMdjeEBCNYI6yGvh5DeqA9B1Nh52EmK0hXDeAiR91pc+iG50hhwpm?=
 =?us-ascii?Q?RungXO8KiduGc3xtNf42p+MdF/jPUYWWDqHQUCCEZ2zE3gvoPCjaJwPtuE/m?=
 =?us-ascii?Q?ZXrkw1DR93PmBAl/lc4SHe0AZnsgAUsIS2a5JHMIMwU3qrZRu3uVKvKmzRDj?=
 =?us-ascii?Q?ipVcZ81FawwidHGQjH5XTxTfvOPvcWtFqjNI+aXq6CX/J3UVqO6c56/JWCS5?=
 =?us-ascii?Q?zX2px5oCHv2yPyZhW3e3b0wl/DHtLc6QMYyQra+A20JYznl7jhZnLOKW/Q9H?=
 =?us-ascii?Q?Xv8qDardvXL7hwWH34SkdjwHOvg5OuBqUpA2FLCTNtsvEmLzLehDwSoe0YJ2?=
 =?us-ascii?Q?pLTJFrpdnoYQdVJBJVGhGzx3rGMwtFDlA9QID5oiP903zMGdq+sEyh9raEmY?=
 =?us-ascii?Q?OB3u56xWo2KI2vBPPT6a2s43KwU4oqBqIVZpcfMIjnNnJBVBErG85niJK3m6?=
 =?us-ascii?Q?f4mekdhCnpwf0JHFcosWQl4jUD2KUyn/NdxnN8zXoJnyohsTtGjSPl0mIjHZ?=
 =?us-ascii?Q?4FvK4qDcwDqaAB3EIWoEaN2xU3gwV8K0so6ANhdBXqfdpzr1szf3d9yPUXiL?=
 =?us-ascii?Q?o8XgC1yKjvAexLh4An3doOxphKlwOI0afbUR4zXgHfszgFRVXXpNA5E5F3bo?=
 =?us-ascii?Q?zN2gaDAzDMLMwrKBKDJdpTZTRnM3zB43JVcywOKy9NZSSsNgHdQxzn9HFt60?=
 =?us-ascii?Q?AUA29nAx2o5IQSvye9VBK5K8eG9R3/bBjd6u2n9XcRzgp/bwC15j4YoVZyGu?=
 =?us-ascii?Q?Yn4a6uclGO9aRvWAqavGUnZYNaE3LcUolvOd9qTVHA9kthyFhsO10UoNxGgo?=
 =?us-ascii?Q?hjZcWyrVzTgSv9woxa827rqvGQ+h5q1xmEus0ei0W1Qw/Y8ro7qdMeTvohm2?=
 =?us-ascii?Q?Q8SclNc7881HRK+Z0H1nLBiM3NBmylHcs6lOlFS+s0Mk27mW3oDgW/0/sm+L?=
 =?us-ascii?Q?3FRqb05xqu+U1kNy7pavKHWSUKw+Tp1IsS3Efh0GpD15SC+mcXtV37MsRKof?=
 =?us-ascii?Q?pfnD1MS63RsC69bjGyOnz5y1vEzy/+qgyQBoS3j2RgvQiXbW3/LuAfjzF8GQ?=
 =?us-ascii?Q?XD7bMvA/uaR0QzeuK0MBpJjMQRe98sAaD8it6IP9C+eFmXVDZOwd+WrGZlpP?=
 =?us-ascii?Q?ThYn0w3+CR4fXpstKttLQl+2IqMRloDMzllj+0Eh9cRD1/6ybPIXvuRgSUPj?=
 =?us-ascii?Q?0d2Nwl2HbvOj8GPHEnhxR19V6OxzO5vDoj1uMC3aLzduMkEOcVhgfqjIOpyh?=
 =?us-ascii?Q?fAYRobgk8aIxJ0CfXp/d/kIvGH4g2aWCow2pNCoDsxuIuGnf/O37PmV3RVoh?=
 =?us-ascii?Q?XO9kvfgvwK5eOdJ7o6dZfBSfjHZ/Ze6xMepy6NaaGHS6kiHQcO7aDDfS2kuh?=
 =?us-ascii?Q?aSE2E3+k/92rLwNx6HOf/SmmMkxVPWBnVta/dqYgf87AgRbeI+paLQn0ddML?=
 =?us-ascii?Q?2QdeEEFFB9PxzgYdKgNiDBvy/GgfrhP6BqRI0e1Q+FGiIs/3c9FaPkQ1GZLs?=
 =?us-ascii?Q?uPgdSW2BvRdNOVaq8JijahxdY48q+qLh4B2K7LMSimVqJH2CivTleUaft+fa?=
 =?us-ascii?Q?cKtG9TdlYk8qFDTRB+lAzDYjWqT8cyqMZHuDpPZGfJy0WTMyVExa2oPTfdaM?=
 =?us-ascii?Q?k9cw3xc+t1igudiauDjhT2EDFyBYe0RKo7XasZJYKqmr9n9cek7J8nEMVhcO?=
 =?us-ascii?Q?Y9kMnM2APrhjeikHnnPMm9ImwvirFco=3D?=
Content-Transfer-Encoding: 7bit
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e853b1e-874c-4059-2477-08dede0d96ad
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 22:58:27.9202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJcD1tGRHqZu4j/p0XYQwPIx+qGKXQCPoP/0X4hTC5fpqU7H3c8H4PWQWM9CpuSdcSHX8piLXxrn1hZPNCGjArNQSJXqUBQCCnbCLu/rnM4PT/5qyUwkDu0SOGMejXFu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10932
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_155847_835963_86E787CF 
X-CRM114-Status: UNSURE (   6.41  )
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


Hi

> The Kconfig entry for ARCH_R8A78000 contains both "default y if
> ARCH_RENESAS" and "default ARCH_RENESAS", which are sort-of duplicates.
> 
> Drop the latter, to restore consistency with the other ARM64 entries.
> 
> Fixes: 5284d0b09d1bdc69 ("soc: renesas: Identify R-Car X5H")
> Reported-by: Marek Vasut <marek.vasut@mailbox.org>
> Closes: https://lore.kernel.org/a069d50d-030d-4189-ae9d-37f989829da4@mailbox.org
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

