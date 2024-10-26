Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26EBD10BE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 09:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lC3Prtefwqu3GALnMyzAl6bT9nFE4z17kD9iHSr/b7U=; b=n21sWcIlUx0ngWTZ+/Mc9OVQjm
	F6IXbG5qITOzkkaFryqwjg6dhGR/2pXXHmCu4BP6hnJ0Y3lRef3DXZG3DGcw8nLOWi8f1QmfaFDsz
	Ym29icpLbNB9zstl1w2xteZmL5Uo4ZGyGj5qTSIaNJ4lMLH+QDTqp5YI1LDHCSYnUsqqTUs3smFrC
	Eiau3ryr6lUILikGJgQfDFQxc2/UqtD1PdkiDo6Xl8587HCxVY/63polNdwlV6TT2ps3htFAfQVyi
	cA2FYcfJ6B2okyClfZa86TDESsAa/7Fdax7UNuSkKnaVQM4IpHQPMVJ3bedeGL2sAHBScRGlNEPKe
	D0kBeZRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4cpl-00000006HEu-3Bqc;
	Sat, 26 Oct 2024 09:11:46 +0000
Received: from mail-psaapc01on20726.outbound.protection.outlook.com ([2a01:111:f403:200e::726] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4co9-00000006Gx4-1Gdb;
	Sat, 26 Oct 2024 09:10:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jF7kd59iZKLFlkPVt1VWmk2x1pxKlsQ6is2GizSQLRTlvF6yfQYz/aGllfHtpcySz9H8YtS9C+is0PeQoeLGLy+q7c+yaLdaaRDIWA9ElCSsNS6t+neGYiYo0EXMn/Xo4wErFFJC43tpV867yBjXTXDZXtnO7tDxZiLN+n2TgdA/TOQJ2Yn/MeZ0qUkvGJZp6rUTuH7r5XLLfJ6UOgMxy9BovaEbdg0tMBDueh9vJay76vAA+Kd/YV1KptWUBjh+1RAZyjRH/xkV24yxXmiGLxBf+8bCG6F3R2F9Dfrw1i+cgYgceSp5SLGi530pqeyxs7e+RyWIz3Cn+lQM0LLUjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lC3Prtefwqu3GALnMyzAl6bT9nFE4z17kD9iHSr/b7U=;
 b=BmGI8oJFCuz2Sj9DGr70njwd5Yyji6AsLoSuey40WisBYD1QqDy5W19bv6eySgW/SZj30xDB52Z0v0hE2ORSQM3fxP0ieDNM4cDHOEC1Z6O2QCcMRqRUv0KTIsQqTOPsC2POPrzvuIx5o1exda9BD8wNQcmEa8S8DrUxKrTpDO9EDrx9Ee0GYEuz8UCbuWnIE0U+9uZ6Skiy4GBRgguddB+raqqpF+tmp0zu6PBLlLVnqCjQtnYaN/eCb3bwqzvktRLqooNWgGAC/4fbEzoQIZ9fLE2A8VEzh3n80HFCVUaEKbeR6WkUKZaZFnCu7qnAn3R8kN1GLMgcYmy1MDOo1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fibocom.com; dmarc=pass action=none header.from=fibocom.com;
 dkim=pass header.d=fibocom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fibocomcorp.onmicrosoft.com; s=selector1-fibocomcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lC3Prtefwqu3GALnMyzAl6bT9nFE4z17kD9iHSr/b7U=;
 b=uoY8lkYQVK6rCkznLj4pZPX5X9BnFnUMQISMJuWNOlO+lggbqpWieXDaLx9mbVXW5stIxTUvYkBCOunr8mnc6Arj+nNgNdnvpTDrCMHS+mGASnEXdn2+Si76jDufXeGS2AegQJHPivBu/Pswp0vaZ81dNrz3Aep8AXHMMg7woPw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fibocom.com;
Received: from TY0PR02MB5766.apcprd02.prod.outlook.com (2603:1096:400:1b5::6)
 by SEZPR02MB5864.apcprd02.prod.outlook.com (2603:1096:101:73::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Sat, 26 Oct
 2024 09:09:42 +0000
Received: from TY0PR02MB5766.apcprd02.prod.outlook.com
 ([fe80::f53d:47b:3b04:9a8b]) by TY0PR02MB5766.apcprd02.prod.outlook.com
 ([fe80::f53d:47b:3b04:9a8b%4]) with mapi id 15.20.8093.018; Sat, 26 Oct 2024
 09:09:42 +0000
From: Jinjian Song <jinjian.song@fibocom.com>
To: chandrashekar.devegowda@intel.com,
	chiranjeevi.rapolu@linux.intel.com,
	haijun.liu@mediatek.com,
	m.chetan.kumar@linux.intel.com,
	ricardo.martinez@linux.intel.com,
	loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	matthias.bgg@gmail.com,
	corbet@lwn.net,
	linux-mediatek@lists.infradead.org,
	helgaas@kernel.org,
	danielwinkler@google.com,
	korneld@google.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jinjian Song <jinjian.song@fibocom.com>
Subject: [net-next v7 0/2] net: wwan: t7xx: Add t7xx debug port
Date: Sat, 26 Oct 2024 17:09:19 +0800
Message-Id: <20241026090921.8008-1-jinjian.song@fibocom.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0186.apcprd04.prod.outlook.com
 (2603:1096:4:14::24) To TY0PR02MB5766.apcprd02.prod.outlook.com
 (2603:1096:400:1b5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR02MB5766:EE_|SEZPR02MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: bcbf2b85-6f80-4753-9975-08dcf59ded2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EfusXeaHVghQQw6S2YIx1cZwnS94B4txKqThuGmZpv9f+1PmpdKQG04d+s+z?=
 =?us-ascii?Q?VO3KM5xE4eH6LPxcMCMPpodNTvxdf5k1ZC6Fz17kX2LhR1qGF6phhdQ9kLTG?=
 =?us-ascii?Q?z6kP/urRzkVhpCcuRiupglZwfQ3ncF2NfQ1P4P9V/eNrqdhynkC2+ckZOHZP?=
 =?us-ascii?Q?aCqFQiohAhQYZs7kW+/r1lzlz/O3a73ofsexZEEvgkU59lV/q6WZukFGXJmc?=
 =?us-ascii?Q?N2eKnttKdFHZOi/DGhxUf8DDypIZP2sYpwgd2G65Jdc3yOmrLxGHV3pbfUjq?=
 =?us-ascii?Q?uUxtQUJ1A6vBWgwAfIKcNjXnlALKRgSkromhEJwSZKwTRZ1LSiT8zrKuNFTV?=
 =?us-ascii?Q?7cmfkf+hIJ2NcMbV596LPZCineNU4jrxyWdpHDgdBtN5Ore3mPTLWYRqUB3A?=
 =?us-ascii?Q?CNgzsIrUWzl3c/A6Da24Mgexzn5vGdCb+q0dGsV8SepNZ5foNolYBAjz8fxC?=
 =?us-ascii?Q?OY7JzdTvJ9l+BKggsISEOotyFMxRhBN/VZKkcb019bs6szwt9SF3l8Iztk0n?=
 =?us-ascii?Q?VgLAmOA8OP+FyCW2dqVMpYFaGwIjw0wXnxTZNAbVAdJDAKTqP0q5nF9jGhVH?=
 =?us-ascii?Q?qTyay3eJTnGixCwPPsHlW8DtjMlSFtOHoqPeyoDsoi6HEGFLARE2oxMaQsOm?=
 =?us-ascii?Q?vc6x6WONZ9ia9Tgo2Er9uGNzBgOAaqQOSDBsam2xCzrtEG9IuRZw/o7KhuEX?=
 =?us-ascii?Q?az0THLxrhJRlHo5AlMMAlj7PjCZCmGhhfMj9xD5Zh9b3HyPFgRdZor0NlFQD?=
 =?us-ascii?Q?lUaIjfqAJrfjwhbl4cgqiR8BDyFzN3depTWyvRccjE+7Qgeu527Qx/IUHbjh?=
 =?us-ascii?Q?Bhtb0os8cCnBwDaUJDkJiyjSOauVEooL1d3SYtphKKJ7cv20Me9QMALw//jM?=
 =?us-ascii?Q?dWfv/eBdRl+q3YGiyUhdy48ADeXJHQgIPjfqMadE7bnhQwmjCPa6BTxlzqAF?=
 =?us-ascii?Q?tZE7mvm3PwUX9o/rAS/t4xOx0v7y3V9l3beUIENjItjxP4Y22u23MTDcKElR?=
 =?us-ascii?Q?JlDl4TktEhGV5bVrLg3qNEEwRq0E11le3PsX9jU/1OYOT3xcBTU1ZCRE3j0C?=
 =?us-ascii?Q?vgUFJHWOBygdM99JtNXj3i+nhfN8a1YLqgl4JI4iQRtE17Mp5GgXOLJbPO4s?=
 =?us-ascii?Q?wDQFePvlRrqIjI5Z6Qm5W6BlZVFB8ODLmkI3pZ4KEBmg+CT1PHnjnpM5C6Sg?=
 =?us-ascii?Q?Sb+PisrM3z7gR6r9eiiJ+KsUhLxM2OKCoeZ5Y4ZknnBDeRPMjXeoygwyy9Es?=
 =?us-ascii?Q?ZUt2vnIklv3fP8ZoYGFeS4Ce45NSkMqajLA8QshVILOy+snV8PAYDDnJCXQm?=
 =?us-ascii?Q?X27/PGJaMZAYF5JixO9XcQwH/5/jyuByj1iJtg28fnpONpW5TbDuYpTWxlXt?=
 =?us-ascii?Q?l9Nycj35eAQgu5KEz/l8bSKoiTRT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR02MB5766.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BbUDO8WDyzWQ7dlc5O3EgMo3xH4GoqtoeyyU1u603SBbY1VCoQMD8UNgrf4j?=
 =?us-ascii?Q?1bwOJR7uoDaQJ1DivCs8iHstUfcEPCIZttYhQR1HqWi/MBDw09G+qDCJmDiq?=
 =?us-ascii?Q?ptkzuMElwm9HHk2zdJk3jO6ICzrxfpNZAEBplAjGrkT4jhK02QUkWPDvykq1?=
 =?us-ascii?Q?umie8kiAwtwyEG3RxTdli7zMSbqv4qH/Ng4Tls2Z/cz6wdNLZwNGHRcjcpiF?=
 =?us-ascii?Q?10ob6kMEDVej+RVFPjCsWDukLVdDHOIWVzz5oW4U2p7ZkGnxpPsPokf/ere1?=
 =?us-ascii?Q?9wGJnWC7vS4JAsoIuiZHcZgvDzAlmFKb2Go9w0SzeaOcpaG7QgzTDlHb81K4?=
 =?us-ascii?Q?LIVY3pDvxMRM8cXRvaP4W4PCEsJGns4zFbWkVDdPbh2wAKmHqu0K8CUqzaDD?=
 =?us-ascii?Q?Ufat31Wg6LM5PkIK8WaVzQu0UYmiS1aEvMUmoDJideS0FcpNBLKoaz6Ay7b+?=
 =?us-ascii?Q?LBInMPdmDrUwMkeRmXjMEn9URGwCu6srsJz394FVbZ3poFZRORyKX/GlnFyQ?=
 =?us-ascii?Q?lcmOH7iYa+4njqdVxu1P4N/UAH/G0iS1r9H4Eu0xr72wWoOI06PuQgx9JLqw?=
 =?us-ascii?Q?H+89P5Xo1OgfG9qXhegtzwylqJBTaBXQLHDj6eADpqcZ+CtWBJWkEFKDjll0?=
 =?us-ascii?Q?XhgkvuiULW0zGlMZf2F1OGo3ddsib7KdA1afJSIT+k6tXNKohOjSXQ977p7J?=
 =?us-ascii?Q?l+jkRQ+CuGg17eneifrJjkq7aomxZmMRYYHgds9OKBZ9At+QETvGbGpR5r3q?=
 =?us-ascii?Q?zL98GO2pv3e4pVGTEfeaFEJ9ICG9xf4sIVHGU/qWtwO5mr6E8R8qPwVA3uPI?=
 =?us-ascii?Q?jkTc3ojJQIIsZu6xN0pYxU4PhtNhGDWZjRUiPCDGfm+SXhN9yheftgn1vEec?=
 =?us-ascii?Q?Q98z7N3oolya8nbWeCv4vL6QTG6EmyzAKpZ8/GORetYT6V7wGJRqv+xgTiap?=
 =?us-ascii?Q?DMETnv2iHpuKG2N3xHCr6Fx8nkqScd25vAKfeS/K/4E072b+zdKRHBOZKcIX?=
 =?us-ascii?Q?fVsBj6T8yVbsV2c0rxmSjU6jXMx/XrzrEpwzAcYdNyvBL1FJ9ij/Ti0GQyN/?=
 =?us-ascii?Q?JX1qqjL4wj6vGe5x0FILGcwDRnFBZ0yq6em3PkSVigpr7+WsAace4issmxwP?=
 =?us-ascii?Q?wxIExWIqtIaWP/dKdCKNdaOyQPpoE3XRaK8ec9B+O0g7o+P8oT2xAfwG4pNt?=
 =?us-ascii?Q?QXGu5J7GlC+Ywxvwi5ijtVb8ixuXdxoAvomkwyjh7TGJNzet2V+pf10Psqgs?=
 =?us-ascii?Q?5wvvZPNOxdx96wN4EKRJ8sBxI+93h9kgaypdKOuMhltigHXitc7td+/it1JU?=
 =?us-ascii?Q?PjldHyfAbb4+KjRWa5CMQjkghTJtKOWsqGWYxlIKwoOS/nTXx9VMf8PGT5xE?=
 =?us-ascii?Q?ATU7Y2u+8YCqcmOBmAnTK+A+yKTeVToXhUxJlHZ6peItNaq6saSkFji1yPYG?=
 =?us-ascii?Q?jYUxkHHrBmYqkPCMQbtpW0nyHPZtAWLq4PWwH5lnhwpCSeMWBuRJcCgryWvJ?=
 =?us-ascii?Q?yUyKgJ2ytzJ5DzCggzzokDt9Fc+fz/kfDawlQZnXhd/bYtLRziTh1Loh34JG?=
 =?us-ascii?Q?dHrz5tikbKqDqB/cvaptcg1EoQdrpQChBUhw/vHMREo8Wvzc/vCNlk61Op/B?=
 =?us-ascii?Q?5A=3D=3D?=
X-OriginatorOrg: fibocom.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbf2b85-6f80-4753-9975-08dcf59ded2d
X-MS-Exchange-CrossTenant-AuthSource: TY0PR02MB5766.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2024 09:09:42.1947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 889bfe61-8c21-436b-bc07-3908050c8236
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7EP5ZlgWDoFWX2vWMmWVjjblGLTFn5qy6ZOyWgyOj1IcBEo+giJdmlhTzrotOysYJCgfaxB9otYjmGM+Sf10FPURW3b3gmhcF5Du7XXc9Wk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB5864
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_021005_351602_8644B1D4 
X-CRM114-Status: UNSURE (   6.78  )
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

Add support for t7xx WWAN device to debug by ADB (Android Debug Bridge)
port and MTK MIPCi (Modem Information Process Center) port.

Application can use ADB (Android Debug Bridge) port to implement
functions (shell, pull, push ...) by ADB protocol commands.

Application can use MIPC (Modem Information Process Center) port
to debug antenna tuner or noise profiling through this MTK modem
diagnostic interface.

Jinjian Song (2):
  wwan: core: Add WWAN ADB and MIPC port type
  net: wwan: t7xx: Add debug port

 .../networking/device_drivers/wwan/t7xx.rst   | 64 +++++++++++++++---
 drivers/net/wwan/t7xx/t7xx_pci.c              | 67 +++++++++++++++++--
 drivers/net/wwan/t7xx/t7xx_pci.h              |  7 ++
 drivers/net/wwan/t7xx/t7xx_port.h             |  3 +
 drivers/net/wwan/t7xx/t7xx_port_proxy.c       | 44 +++++++++++-
 drivers/net/wwan/t7xx/t7xx_port_proxy.h       |  1 +
 drivers/net/wwan/t7xx/t7xx_port_wwan.c        |  8 ++-
 drivers/net/wwan/wwan_core.c                  |  8 +++
 include/linux/wwan.h                          |  4 ++
 9 files changed, 188 insertions(+), 18 deletions(-)

-- 
2.34.1


