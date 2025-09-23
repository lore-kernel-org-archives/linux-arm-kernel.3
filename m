Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6B4CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 19:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQe1rgtZYXW7oLjzx/3Vmlrv8gA1QDTkZiStoIUHzyQ=; b=vq0jrbxZcHSmGHdRyhUItjz5Jo
	FDoy2tEScBlYiiTYoqTxdWpB+xvz7zTb1evQBmyNI+2WSDwn8ggPavcwrsLcCsN8EmRXqv+lpiVkW
	g/X5Bg7cQ1Zh35s+xVXv/hQVPvuIWtpWfYrWhgWFeX37EfHluODY3RkAgpcST1O+YravxoURUI0zY
	W5Lc1lH6utDOw+sgV1mOr7ruLSaSN7O7MMJAMC/IfZljKqTp1667m1lLdEsY1e8e4+xUurQNNVJHp
	Q/YVciFUXci0y1zVsorgfhqXbgQ8+he2pzKrZECzCde/AeMa71z9ciNqtxq88hJKeCnhl/sox8Pv+
	wLyi1p1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18fz-0000000EfPh-1DUG;
	Tue, 23 Sep 2025 19:27:47 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18fw-0000000EfP8-2oLg;
	Tue, 23 Sep 2025 19:27:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOMEqISsw4vxGMbtDSt9ii2Gy7DjG598hkETLSp+jC03Jk6t4f0JaL2GtPC1/EFUGChPlrIyyky2MqwdsfndFLnFGegHCo62gfUo7Qdf5bC4WbudsfmG0+9rbL6QZK++g4cNdSrEQQEWa1eNJgi66xsutkz4x7wAS95PZvybkcnrGneDNc/5ti8/yyBzKQGmxeIxrETvoMarKx66Z7aVEjT40/rqXpApZYyGUMQZcDBzxpA103fQd+x8V3fw19zSOx6wPE2S6dx8KNSD91k1gJO6DvpGDBkU6oiWFbSz3o/FZOSe5XDnt/LgXl5kYcc334ZfO0n3/7IeyimeQrPkHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQe1rgtZYXW7oLjzx/3Vmlrv8gA1QDTkZiStoIUHzyQ=;
 b=aTAaxk/b0eACtXkjH3xc0PLQIc9cL+1Gd6j+wbgSuD4jKdGvHkovibmU38ibXEl57wCMl6PMo2dnyMI+Ukf5egH1mv2bvEcySVppV4d1QzMOp4831lvxw6KBnuU/mP9VsZZlD2u30HfDjFKTzSv3aJ2rEtTU7AyBc7LOpG1EKVi/O8JQQtethF6IoloAhIn+NISh4relznz6jH3OxLEjR0Ern9oYXa4QIrkKp1mjA1xtaJiM2nzFzpjh509I1OHR+LBg72cJGytNR3Qe3AVw1MllMz/hD3iCetaurH6YbBWkDlhQLLGt6YBszHSz0PmNEN2G1ksJxuntikv8ns/Fhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQe1rgtZYXW7oLjzx/3Vmlrv8gA1QDTkZiStoIUHzyQ=;
 b=RQ575tQkSC8txhGz5T8/OlB4hoR/2ey7gwJGl31cKZOdQjMBwbK1ZbuSo0LJqwZ0TQptEhJIUqE/b34T2v7Vgof3QMaO7weaazZTZSOTaB4MKDQgJC/mAiKpj6P0QCrCCYQoRxnDAg2qkM2tUPHWDOJx74hyIC+ogbxo2qKsyt4RcYN0BmD36agsnHVeYTN3AROb5hrpq3M/27amfGCJdzmqV6KY5qL1NUNVW1nFzB6AESUjgtDwWA8mpxJ/YFhF0G1mvGq4BdyLIZH3MmdTJCkg5Sc/a86CRXp8B/8NH39Hm+FsVQVCiqKTjLq8/WnT9WRcXgRersl7ZnPWbT3xjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by PAXPR04MB8491.eurprd04.prod.outlook.com (2603:10a6:102:1df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 19:27:39 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 19:27:39 +0000
Date: Tue, 23 Sep 2025 15:27:32 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: vkoul@kernel.org, kishon@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: freescale: Initialize priv->lock
Message-ID: <aNL0pDdQ4HfQH0ZF@lizhi-Precision-Tower-5810>
References: <20250923141611.1295395-1-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923141611.1295395-1-xiaolei.wang@windriver.com>
X-ClientProxiedBy: PH7P221CA0043.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::31) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|PAXPR04MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ac4b3b-6632-494d-22fd-08ddfad74214
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|7416014|52116014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?flOuP9JZ+kxBkZPbcTcRs2+xhGacgZAVmp4wwfYhNvcQcOXYv1v30eonBIBN?=
 =?us-ascii?Q?m4oCn0xzbqqBUc8cCkba4YQr6BVdXikdkab8+qcvmqnODXFqsQQjdno3nciO?=
 =?us-ascii?Q?NQR9dNCBcfJ+Ah8VO3h1QDkWpCr/Yu7m01eDPSEH0ax0BGazS1OL1JvsjSb/?=
 =?us-ascii?Q?L8OOXmr2pbOSZo5ibcLCNGSIkS6l9ZnmILOAyRpv/ST9Slab7r5LyYLRhQTK?=
 =?us-ascii?Q?B2Zrpb0NaeEQld11B8YAU2A2rkcHZha08ywyh+efiY4gM6hzF1ONZfPRDEjA?=
 =?us-ascii?Q?FFEqpNw7n5n1p3W7zWsgMI7Dtg1fr4xMw3aJ1ocG3KjsjE7p4uFgibPtilsj?=
 =?us-ascii?Q?lR28c/toWdgRY7ZaeWLfe1M0vpx5ga184/2cuynHsh8FsXS8MDf2wjTMlzpN?=
 =?us-ascii?Q?JGQPK1kkNxZ/2cs+0agUtGgRXaRY0oVrVgOtupP9i2+SPtGlUzYdr4hsCIxS?=
 =?us-ascii?Q?y1/4heeiMPL1jfliEQCPuDvyetbHBZEz2jqdSxYDGwsm2ElCm6okqfAV773v?=
 =?us-ascii?Q?hdWfmd/NQlgoYVGXctQtaOAjNmekoz8+X0cAI77g1oVCHTFj3GzXPqP5WAcq?=
 =?us-ascii?Q?pzG7Iwv3FuKl1NJmqlFoqLk6qHonr1ytVw0JL4NiVIucnqMYswgz9NvfK54S?=
 =?us-ascii?Q?5Zi0LEHTtySg5/rsoDBdTXvSUBYAMwbJYUz9knbdKYixw9XHLytYfRoSiuA0?=
 =?us-ascii?Q?lB0LfkbVkd9G9Oq68cQfy5mcCpNBdeXC6ENzuEfZ9vKAU6R0nmBdS581V6cQ?=
 =?us-ascii?Q?rkpXX08JS0gqNhUQ7iTOU3ITmaEiI7JPnIqLNOtWj7VW/u0+R99SXodM4LC2?=
 =?us-ascii?Q?7ZXEWHMYeIFsqdGXpyMHEstCFSWPHSmqeRxmGMbQNmz1XkNZKWRlLSGOH8W/?=
 =?us-ascii?Q?Y0eSmH4I2ONKAxX3ao3OFX8siZKIl6+gHzTfLCjCwzjeL6C0MChtcN/jj/G3?=
 =?us-ascii?Q?ZUTooEuqlG/oiDVyTw8pL7cfg57O4tzf7aHYcAxr/4WK8sHWyY/M26M9HeNl?=
 =?us-ascii?Q?iPqYq/rpOZx45s3QYP5Bl7Uqe3R1HZM6ORxEp/dfUnXKTbK1fGoDkhdX3np8?=
 =?us-ascii?Q?l2cb5+LJIKaJJSp1aiS/TaN2snjSw4xWG4aIfCpUSZ43Idl9UZ0at//VmGXS?=
 =?us-ascii?Q?3/XOxjXVc82f887HdILmcWSFL5Bqgtuzkeb0ygo3UkqXbSuJBL01ot9cxJc2?=
 =?us-ascii?Q?Hg/0hmhkcrkn3Qjb0DBBd5vk1tvzXBJNlNMSHbuh415RW5wVzDv8D90iyAND?=
 =?us-ascii?Q?v47E2JaVrRnkzkM+b4gAuQTKfFVs4vLWB/7HJpGXcWwI62chdDekz1s+werj?=
 =?us-ascii?Q?zD5A9oot5sdwabde34RQ65hDK5U/8zWI8ZEAKDAWuOYn0Uxt9vjn+/1+j0ZY?=
 =?us-ascii?Q?/9llORkREf5fQEVNtjzenDR/c8EQkVfbFBF18aV6BZT/6jnqM+UyHqTv5auG?=
 =?us-ascii?Q?NF1t8iK2dmc7DWpAXAPVf1dix5KXmma+92qcWUw4k66Zk8EHure9aw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(52116014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ed+Nf8/HUOdI9J8x8ZdmD9fjY6YVxVB5di5FbfsPKFJYePxnwQzQZ2Zoquy5?=
 =?us-ascii?Q?UxQXFGtCPhBA6TRZxESWGelYoCHtoTzswd+ONDAsaWZZKzFrIEOtUz1b/Fak?=
 =?us-ascii?Q?ejtP/P6ugnqyNmIOTNioxM+pGtv5gJVFxmgUkJgE4UeAjbjUKAQ//Nhf7ydb?=
 =?us-ascii?Q?gxSIs65galICb00APGaLMWbd8dlAdyZeutzv4hka3b27rzPxjOp8C7Dtb63K?=
 =?us-ascii?Q?8Q4LQjRiMs1xrnRf8l9/Xkls6MV2SFq42/yFcuucT3z8u7bQR6S7TXNMB4bf?=
 =?us-ascii?Q?tvPz+0XOwhRC5HWEKC8Qoqv5b0/BY5Ef2wHuQ9aos4kfNMvZTIcVvKx9yOWn?=
 =?us-ascii?Q?DxuqzDTz/nxKHM6NWwoxZFTMzEBHeANvrBax81YcvbKsct99a2mvZPkALh0X?=
 =?us-ascii?Q?e4N3OXuhFhkBQmu0vX1DhQOuBtdGMSte0FU+XdS3pyQB6IdZnoHa1Gttacei?=
 =?us-ascii?Q?afTvM+awDANLkHs6FSrihWrxaLXrJpXuWmziorZ2CQ46vHJe0ukdYOjkH9gg?=
 =?us-ascii?Q?crMUHW5NovXPeUCaS+x1iQHFxWHCCj1WKjJ0JW3g9vZtPq7Vrx5oWMUkFVUX?=
 =?us-ascii?Q?Q1WkgY1iIkf23IiKIUoS8M+2zny+JxQUCAIQhrvqW4FR8GfAOdvlgLhG0Zdu?=
 =?us-ascii?Q?IbrNcjpfj1QHMfCONsL4EpzCXb/BXD1g7TxXW19u4oGJIZa4Zv5bCc2wttnA?=
 =?us-ascii?Q?1jid5Ka+jP92AwfzujtyhYmKQeGGDp8jNB7HGP1N6cQOCMdnKPKQrSLgswoT?=
 =?us-ascii?Q?aLDI5SNdmOpD295CgOMpTUGryfzTftEFQcgRit3DAortZrDjm5BE0mPi12hN?=
 =?us-ascii?Q?kWEw2NaSl+v3VHxx9Afd9fGFzm+TjUSnGwa/0BL9BXcmQp2kjbNhJTy+IGFi?=
 =?us-ascii?Q?HJU6yvFDgUgL8DrFtTB9NrCb5EbENi5lOwRaHCy2ArPTvZJiZXTJXaw+kTCE?=
 =?us-ascii?Q?FGloUNf5pGct8mIY7cTVC+3+taL/e/EnYqNhFTDiuRc2awyuLllhbtJvc2Zn?=
 =?us-ascii?Q?JdeFS46tZFcERB07wy/YUPwgCBATbnyEhRJ+3+d/Rf0xHsptJ9kxYq4dV/jv?=
 =?us-ascii?Q?FfWxroqHihLL6E22ZlMxa38+YN5WXyBBg1Fh7BablyHaHXHvpjNqICsEopY8?=
 =?us-ascii?Q?ThEBh+lAYLi5Ize3cZ9AoESgX4jjIwT0daIuMGduzL1uy2MzguMqJrdRp5wC?=
 =?us-ascii?Q?V+90U5TK1CVtTXFhkTULHZipuphO+b9J1+SJz8Shkze63zk3lr82F26wHUDe?=
 =?us-ascii?Q?LWHYzVBRh589iTqxXtChUv8PoJ3Fyj4AR6MmHGFnpy6+WVCKDOURA9y95dPO?=
 =?us-ascii?Q?Zwvmfzb3zHhlrrkVit9mn6tyzf9HuvtwwkLKAkT7UuMLJO/8C7eJ6kdxaXbD?=
 =?us-ascii?Q?G2EB9PL7wx9No3NkuMO/C3QNM2QFi1x3cKofybYIaKkUDdcwjlbzD66OI3Z+?=
 =?us-ascii?Q?jHbuigCuVDDMZpZLKJA5+9MHdRAJ9BeIcprX4PS/Y7pT6iURafNhNjKFvjMc?=
 =?us-ascii?Q?O0KH3BIJv2kOF46lR612R1gGIdl3aG7fJfQ7pLGjR7odP+MMjcLV4/pRHYOE?=
 =?us-ascii?Q?LTud15LBE/p26sYXLuSEmhH3B9rxmZEwxA6uKEBa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ac4b3b-6632-494d-22fd-08ddfad74214
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 19:27:39.2949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aRe6gJMT1FFdiNg1kzPIeDzJ5mhgBaQx4qXf0RRYNlM3lfjGL1YgPeplRgnF0AN+fCWfEzjH3QBALBB0z7v3Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8491
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_122744_713358_D2E8ABF8 
X-CRM114-Status: GOOD (  15.82  )
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

On Tue, Sep 23, 2025 at 10:16:11PM +0800, Xiaolei Wang wrote:
> Initialize priv->lock to fix the following warning.
>
> WARNING: CPU: 0 PID: 12 at kernel/locking/mutex.c:577 __mutex_lock+0x70c/0x8b8
>  Modules linked in:
>  Hardware name: Freescale i.MX8QM MEK (DT)
>  Call trace:
>   __mutex_lock+0x70c/0x8b8 (P)
>   mutex_lock_nested+0x24/0x30
>   imx_hsio_power_on+0x4c/0x764
>   phy_power_on+0x7c/0x12c
>   imx_pcie_host_init+0x1d0/0x4d4
>   dw_pcie_host_init+0x188/0x4b0
>   imx_pcie_probe+0x324/0x6f4
>   platform_probe+0x5c/0x98
>   really_probe+0xbc/0x29c
>   __driver_probe_device+0x78/0x12c
>   driver_probe_device+0xd8/0x160
>   __device_attach_driver+0xb8/0x138
>   bus_for_each_drv+0x84/0xe4
>   __device_attach_async_helper+0xb8/0xdc
>   async_run_entry_fn+0x34/0xe0
>   process_one_work+0x220/0x694
>   worker_thread+0x1c0/0x36c
>   kthread+0x14c/0x224
>
> Fixes: 82c56b6dd24f ("phy: freescale: imx8qm-hsio: Add i.MX8QM HSIO PHY driver support")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>  drivers/phy/freescale/phy-fsl-imx8qm-hsio.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> index 5dca93cd325c..9453ab98e475 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> @@ -545,6 +545,7 @@ static int imx_hsio_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	priv->dev = &pdev->dev;
>  	priv->drvdata = of_device_get_match_data(dev);
> +	mutex_init(&priv->lock);

use devm_mutex_init()

Frank
>
>  	/* Get HSIO configuration mode */
>  	if (of_property_read_string(np, "fsl,hsio-cfg", &priv->hsio_cfg))
> --
> 2.43.0
>

