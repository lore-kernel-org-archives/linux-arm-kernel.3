Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2D1F364C3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 21:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eaeh07yJuXm1Xjx6dt3uV4RlgVhCaMHEOoFuj2hE2/A=; b=rcCMyL7EkVvg43F0tpCDhybVf1
	YhoqHI/ciA5wiEzVA0wXOWsUk3ZpreGtzprm49e/+YRSEYcON9hfyWl16DTh7zhJRKvh7PVX7EiQR
	b6R88egp9Z+6++x0LyGJKr1i6Kiiy+TOOsIXrY+SDfg3c4yunfwZUknLxkDnpSWDJLO+2qoeNMTd7
	8nRnQKIh/4RflvtH6sSjHe0zNld9Upf/7czGVzQIeGgiAX02CaXkX+ZnVnDCwuCdfUYzUytDdqdE3
	J0M8+/4h5zFQrD4vWVoN0j4HkisdTe9bEk1VzZOg3H5/bFaZtJy/SObqtvCcFzqi+v2nsO/PDJ20Y
	Q6j/9VPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAxLU-0000000BG0Q-0JAY;
	Thu, 09 Apr 2026 21:55:28 +0000
Received: from mail-swedencentralazon11013067.outbound.protection.outlook.com ([52.101.83.67] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAxLR-0000000BG01-3ah7;
	Thu, 09 Apr 2026 21:55:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVQ+DNODucp0vn/kDX+biGgTTKy7u8NwGsZla5ZNGSVAul3EYLwjTYOjoJ3VxP0vhxXcKTqYtKQWCiVLDa8VfldYz9ELDatTc0F37+AIMQx4TSfgHariPUlROoH6KpN6EMx6yhd8/JfY0o5spOPiWwZhkHQPCbeZCmRGeOkaDTgWOgxqGEqShohM7Pwpv5XsPU1iVPB4e8njaNtEO260JH2HGgqLvwYpmFvwkGuFlkkAqCowrLvLihsofgORCq8Xbaupz67RhdCFfetp6QRrunUSzmcD3+gg3Gxez4ynVzAJnw/FgrnRAmjx4b2hKpoDzFG4B6hORgHNmf0krRWfEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eaeh07yJuXm1Xjx6dt3uV4RlgVhCaMHEOoFuj2hE2/A=;
 b=RABFkVnbcJtlty77Q+r77e0XvoN5cvQcCBn+W2Qfx+TFp16/DgoKDU/QXEmzwf95bS9bhZwgtcifPlBmzzHbcpI7Mo+g3mgApmxcga0b0Znn/O/K3eq1O5d4177FvlKciI0f9fRiPrvACGu5LC9F0XGA5E0kI3PA/BgJ07ANbbUc4HGLOruGKUKffnysl4JUFahgp9v/UrRhlQvE94rX/Vf8f5JFPwKpboTkqJp5xjqzImS+yEEWyJzqYGan9HtG7Mb2jvtRMGOq/7FormmotxR7ad3IHzB/a2yKMt2T0C1dnpteZb+VXP/gtIDBroJSTyWYtlwOEZgWQUGUhnNV1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eaeh07yJuXm1Xjx6dt3uV4RlgVhCaMHEOoFuj2hE2/A=;
 b=dkQWglMJVbGeK0ry059kaeX8Ka1CDL5k8upYZWzOzUpuEBeROE8IXFZkP3oGT+9gd4eDgU8Z65fYvv8i4+Mo5A5nbHuot43G5rHAORBDH8Dg66m4TK+IBrbS6yTSACZ6IU499WakRSCUYlo9hPAVSTz5NHC95kwE0QHMV96ADAAjEQmFK1AZRuJ+NpqWUTNLQ662/1EHIMG2NEKNjnbio8V9CiEAz7J24UkfSroTV9MFL3A10dZowpjACbESbbjZJUROFKFhNtRPBqlx+x7TUHxselW32wGu4qSdxcgAB5YvtdUqp7Y4oeYkjCYnso2pJa+QRLUJaepp22LEPnboSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AS8PR04MB8786.eurprd04.prod.outlook.com (2603:10a6:20b:42d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 21:55:13 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9769.017; Thu, 9 Apr 2026
 21:55:13 +0000
Date: Fri, 10 Apr 2026 00:55:09 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Alexander Couzens <lynxis@fe80.eu>,
	Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [RFC net PATCH v1] net: pcs: pcs-mtk-lynxi: fix bpi-r3 serdes
 configuration
Message-ID: <20260409215509.si2dy63seo4iaspa@skbuf>
References: <20260409133344.129620-1-linux@fw-web.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409133344.129620-1-linux@fw-web.de>
X-ClientProxiedBy: WA0P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::16) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AS8PR04MB8786:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c95891-602e-4d86-7783-08de9682ad94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|10070799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: T3hMU5IzKa99jRcnppVE1EV1uPwJllOLONyzULly9Grm69DMeWtkhuMDkDHxpM1iAsWEsVIybs7C4BwG1Vrsp8ZJ7FNr56FLVzAR2094qvhqjEFznoi7z+NKNy1aMIlMQLbAtK3aetj87hOjskWStRhJcKQeA2K9yYwgMb/lItryXudlsVCQudKgrifOfkMsGNv/NBXp2n5Rp3uL+WoQBBXoj25M8WQske/qeJLAth8oH401ogNNT9B7oEYzWw1S9W8Vs2D+c+vfK0JVq/U6hLXKSCZk6xoE3rs6AAKYWu+ZYsKY6tPvWROzmVeJBvA1Hchnp2FW6b3g5Og6vHznZKVyiq34gYHRBTcVlgEDwHvsJGLj/VJRrKPFfZ24WvD1WA8vA4WxZ1dNrIYFtDPIg56BQO2hJem6XSCmRACCMcM7eIgaBoAZRWNS5TzOHLqa+Tmb6/aTsmnXyFxjxbHgvLe19eZnLZWd6EjlfpqwNQgSPYbLTmf9o8Pq5q7Wnjxo43EWrdgX8dV2mIxbWTMDJpbIBlPwIOFGV+PLIHj+vZ4IQfNM1sCEqGqnfiF26IIO2U0CxUnsghBQIkILmiSiZP5rFhoU1/PTXRahby/UZ8uhNiDifsK3Rmft069jKRe7ZVkJCYszknn4mzEECktbVvEg5oVvehkLQHKeZd5DW8gqUQybnUcFkDBgABR4Z5rzS4AaqtSJJ7sBXRMytontY8ruyZjbdMfr124CeOVg7HQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(10070799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HG73DO5BnuBAhO1nV3tg9jUJIpkHdKIB410nIC8Jygt+52pk6LD5dSor7zXL?=
 =?us-ascii?Q?QnQA6ab9SsDdQvYGzAZbaNVEYi9cQONbNrLIpP0e2HgQrx06iWZ4fcvEHmsx?=
 =?us-ascii?Q?BGPCIkot/Nw78rb8FEM9NnjGyFnFekDS+5tRuM8bmkGCtG1fB+L3mdM6c0No?=
 =?us-ascii?Q?IX8VqHBPa3KeCV106JBjen/Rt0FGx6+0EyxhrTpgwYCj9eaD5VxHelqlu/wp?=
 =?us-ascii?Q?kSsmVlyWiFbhNadkTnaF+ufPShstWBqA3A5vogRxcXKAI2oP+yNLLzjQBIEU?=
 =?us-ascii?Q?r74xLJyB/Hm5p/ioNtddPV98Lyry54X/h6e2MMTdEZJLzen4mxGfmm9oAk5s?=
 =?us-ascii?Q?HAbU0sj+TxvhuiVvN46OCaXqk6Z70DqHdmw/oEMdbG/lizKr7TQB6e+zMrM2?=
 =?us-ascii?Q?2dTeyD6+foeBxEBgiFZPK8+UTiubWabT4qukF6RB8YdjzfRN7/+Os+lYyAcq?=
 =?us-ascii?Q?amqVDSmcGzu5UppRLOxK4lKSIHG+p8qTOTzitq+ETgE9JZkFUlpuhA77Eh0s?=
 =?us-ascii?Q?Ygx6dmxRYenWPI0Ka2ldWC1k4cy4WeCRvxul5IuSyxWM++TO42cKKHltDwR/?=
 =?us-ascii?Q?qUt6YdVvO7I3iEvYTJT6GwCQwmozjooTl9ZmprtXtHmBvNQD4JRcIYPMBjo0?=
 =?us-ascii?Q?lvkG5Ha+seJjI+ZcfV1XpP8UODsfGalYqbCLuu9mCDqBKuufLK4AgLRryYGf?=
 =?us-ascii?Q?UlBbOJHKFDt+jJ0slYTD+DEKRm+jhmiWAYlRMzCBtjgbyhX6qgeIXwrykQIY?=
 =?us-ascii?Q?Us/fnnPjgXsLY3g6/9YbW4pakkn8UEgnOdKPI6J+zBU/YWIMZ0s2VZmxtjP/?=
 =?us-ascii?Q?xKKPj7AU19DqxwASDJy5K6n4JOATKXTsZyM9suCiwqTvQIY9zF4mhyHJQrAc?=
 =?us-ascii?Q?4V0w+rj/OcyJUP/8C2PG23nwmkc4frv2uth5yMIs8KrQe7uaW8xp+XUWjLiy?=
 =?us-ascii?Q?6ZzgT7hHal0D1+FW/ECVApvmjBFaBcIveHiSHyOHjNHMWPnS1VvIrCfIvC+K?=
 =?us-ascii?Q?1bwguDBPknhVcDH4mG5oBQsEOcJNZTfZnbkVDvYyQD8zcPfPcY1l1r+jWqVG?=
 =?us-ascii?Q?7n0Px/yn//BGukJam6B5I1yw5KufgY8SsarRe0dOWd1VMC8Xn1l4iY6+kx5x?=
 =?us-ascii?Q?42j7zb/wPO9v4W8TjdI0ChWwzB9bXiaolhRo9nG9JwlkDwvumQP4bF5gvo/k?=
 =?us-ascii?Q?Q1BN6xO5loJTP/EhENN+eJNnFrnYIjuQ5HuwPqj3UO5zfML3RHP6ZZ5XD5CH?=
 =?us-ascii?Q?OiU6kO+1x1C0q5gvm+ASPohxfmhft9aB2TKwxm3NN7j4EJxjBc7LWg0fGTZg?=
 =?us-ascii?Q?ABmaBpD1WzKwaCkCVtsv7phxVOxQCb+bsdHiYau/xsySs89IGi5pPKi63CST?=
 =?us-ascii?Q?99xYpNrbuQTT5ktXCB2Ds5PA+LFIfIq8PjcKAZb9akizClE7mn1qxryuMDo0?=
 =?us-ascii?Q?cOUcg2vFaTTXPVRsgYnzzaZoxA9hRoeS595CHI/ZV9dLMeljsYVpTyVLVknR?=
 =?us-ascii?Q?40OQfju+YqR6sv9YYJW+2ZnFtwjB3pgTiELQlnBe4Pa1C8DG0gZabWol0/d4?=
 =?us-ascii?Q?3Zx/wm208YvDisNf14OfZf7heJw16UKlgZY4PwPf4j/96155wV5OllyiDK+p?=
 =?us-ascii?Q?+IFkDH7KbV2Hc1xfR0jWFTWwlV94Xwk5pbL74Q0kvl+znMkoz0cbRcuHCyj9?=
 =?us-ascii?Q?q3YeGZSR1j/VZB9BV6ha3l9F6LiHsOIUxdqiecPiJoUUFVYrCl/rThSVf7RX?=
 =?us-ascii?Q?3FEwSVZ6H9Pu6V+KBHCYMayHb6djlYnR3xCTne7RRUCkNW9Op9UmUIDxklGY?=
X-MS-Exchange-AntiSpam-MessageData-1: 7oMpV9dpqniYqOq/HrT0Q3qNefIgy/HctTo=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c95891-602e-4d86-7783-08de9682ad94
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 21:55:13.6754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bb7Um7vzGEMzRMJNQOARjuAYiIanQKBKDmpnqXD1cVbkk7JBicmlmgbEBxMSKvacGtpNJPq3Uup3sa7XJuqV4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8786
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_145525_899732_B6EDB889 
X-CRM114-Status: GOOD (  14.05  )
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

On Thu, Apr 09, 2026 at 03:33:42PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Commit 8871389da151 introduces common pcs dts properties which writes
> rx=normal,tx=normal polarity to register SGMSYS_QPHY_WRAP_CTRL of switch.
> This is initialized with tx-bit set and so change inverts polarity
> compared to before.
> 
> It looks like mt7531 has tx polarity inverted in hardware and set tx-bit
> by default to restore the normal polarity.
> 
> Till this patch the register write was only called when mediatek,pnswap
> property was set which cannot be done for switch because the fw-node param
> was always NULL from switch driver in the mtk_pcs_lynxi_create call.
> 
> Do not configure switch side like it's done before.
> 
> Fixes: 8871389da151 ("net: pcs: pcs-mtk-lynxi: deprecate "mediatek,pnswap"")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

