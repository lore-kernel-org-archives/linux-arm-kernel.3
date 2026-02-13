Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F566EF48C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 04:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+95R0i2WWJfcfpWyEuMjB3sWKWRO4FvgEoPb2B9MyU=; b=anlZbBdHo6+NUMdJCJXBKejT+C
	XPtfit0/yvshQqMpOw9e/kQXVUdbp2luoIYOg54eo5fiCv3nfF4XpJPaswr0v6QMAjGbhiJT8h+HX
	gTpAn+KtujZm1SEclCrk02C9+J5af2SR4cr9QHq1/YeqYvlCckZpEMaAbXPOpwS2MROjBFQgBl93Y
	9crytNuOYhP9DNCfz1HmFOf10qvjKpGIHF2xJKOyomTcBjMYFqxQy9NrFfFcUmFExIPBmnQzlqTFM
	au6qhpeEw8tshcHmpoVtYvoeWqg1PfP7segCQD4xRpJcBf+S1j9L/CPRmog8ibCIIY0zYcC0VZ7D6
	6JWRsM1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqkTW-00000002wd2-3gXv;
	Fri, 13 Feb 2026 04:08:14 +0000
Received: from mail-swedencentralazon11013066.outbound.protection.outlook.com ([52.101.83.66] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqkTU-00000002wbG-1ZmH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 04:08:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4kHzhsI5QVJnC08uyNoHFaNU0M9jYd/4kNLuVN68cSD5SGAClmoPWoTSN5Fxaq4hsOIxdwTJ1v9MjA8O/vPUS38c6RGEL45zWr+tEFxZUzXnlnbaU+GD1h6wrjcZ6zvctRTQ3U0P2mNtR19A8l1nDTupQoTp6N9dUFVFZ+2HOmU9nPsXyUgCiKslOCHb544Kt4NTHBjs5NCxheyWtMV0DRpEsb90UataHbxrSinchyfxg1tOiL5sRonMgvITTlQ69uQvzu0J8k8JLBtsWeQs707TUdPXnfxAJiGR/GapB1r9RRa+bsX+F012wGo1jw7C0s4U9nLEape8TXuCicBew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+95R0i2WWJfcfpWyEuMjB3sWKWRO4FvgEoPb2B9MyU=;
 b=KNmU7wZZh8xLDSiAbApAfaKXNDLQOc+yIO218a6NpWCFRmuJGueOa3dXEU+o+DKgzOT/3V082WwnlyAHomsQ1E5ws92v9q6Jd/cTgpBa9sVkm469UqpzazMaGiOPnp0Fh/6aebHofgI492lUmkH6u5s3OQ/IT/HwR+JQaAB18bOEmI0Gcnm/rt+ZKNA/Bqau80dhYitowCnsHsuLqv3FAaqXnUfborn6Qcs8MT5sDbB3HFphNH5R9aa90afVm6hKBbkTcv3uHUldkYoSgPE2A9IbccBA9Hl+Piyc7S8/laoCMaXFWEmSnpzK9e4spA4eB1OPtFuXDnQgknixB6MBpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+95R0i2WWJfcfpWyEuMjB3sWKWRO4FvgEoPb2B9MyU=;
 b=eCCSP2gJFcDP+ZOnGid81Yv/9rdVXwBO2nAuLmyWzBA7x1HI5/PcSc4tR0jdQMHdHPXeWafaOe3JJ9MDLHAEfJVvPy0ynqReywi5sLsNJDNNZKjE6PmIQWNpdojD7jAVD/vMs+Lspk0YqZ4M7PYp6+035nZjLoVocfFcZ7H6Hm/LW8LsHuMvaEgFr6hon1FAMS1hjR2fdP519056v0wZ2KZRRwsEfFbsJdHYfMnIj4aJx/OiZIp2ziBbmby0wG129xNJxsevocGvwHL2lmaVfiUG96TTTtVsUEkMpurogNSxkHAknpqHdooBZpNbHoF4p1fTkIMEunzZKAw4TiEzkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DBBPR04MB7929.eurprd04.prod.outlook.com
 (2603:10a6:10:1ec::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 04:08:06 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 04:08:06 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	Frank.Li@nxp.com,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V5 03/12] PCI: dwc: Allow external allocation of pci_host_bridge
Date: Fri, 13 Feb 2026 12:08:43 +0800
Message-Id: <20260213040852.3340547-4-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260213040852.3340547-1-sherry.sun@nxp.com>
References: <20260213040852.3340547-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0206.apcprd06.prod.outlook.com
 (2603:1096:4:68::14) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|DBBPR04MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: f600322b-908e-42f5-049b-08de6ab57deb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|52116014|366016|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mExc/OC6eyX5QIX8/ot7XTuUcuKsBafiOnWBvez5trp2YgTzmWCKUIVTNd/O?=
 =?us-ascii?Q?vsAtMvW2RpeJZftxiprbDNHLjXb9wAX4qxYBSuY16BiUbaJ6kdc4jxUJm/i4?=
 =?us-ascii?Q?GczysHM+XP+M/dPDXkqlOdebk3kuvSyeIUdBnj8legM/WJnjN/2fi9BV4167?=
 =?us-ascii?Q?AoQYIv/ZX1eNN3CCCaFjPynAs+TFV8dVpgQVy0qfXHxBpg4DJcgeECAnyR7u?=
 =?us-ascii?Q?K+G+dognIprK+7a01Ao6FMusgZkQATrXwx+4RvhNBzjMyzPt22sIRJ27qLgw?=
 =?us-ascii?Q?+w5DGOFGe8fXUmDSeAaqMTiN/cWWkmx8wf3FoTIdZ/6FjopUh4HqOb5/I/e4?=
 =?us-ascii?Q?f60VLz9DXNMz8YkQjWsX5JKXyM6ZO/u53C42kkcsk0rxiKeZPCzThhGMosHS?=
 =?us-ascii?Q?0uaxlbi6yEoULFMGnseGJz5r9Zu3E6deIoZkIc5lS3Gs0geQODVYidZl33lk?=
 =?us-ascii?Q?xq9oRwMNM1otPo7FCWf0c/oeLpAw13VIEjaK5HcU2BkSJ3zrpYvdoQz3G6JN?=
 =?us-ascii?Q?EITGr05sBc41pfw+vbY8tcwAF3+CyXvttl5tJW+EeSIpaQku4VsYNB0CN3MC?=
 =?us-ascii?Q?sQOvmIWws84iYWbFMckDTzvNwXpiLE02ZLvjjv0vMTVmzHBSR7oNzjwQn7cv?=
 =?us-ascii?Q?Gtg6gu/kVydculSyN5BvKyXT9uEnPLuA1y/NJeUlbllY4J7cLZM526763emo?=
 =?us-ascii?Q?oyjTCnU8sCoR5AXOjNIZcDjQa0mcqTPjZ0fdaLfDpe4q1/OFKKQXRVBkb54a?=
 =?us-ascii?Q?Ukvd6RhYL4IKV1rXommpp7f1j9ReMQlvqAeQe4DVs+/N6MNTpPdfXXQeTI0t?=
 =?us-ascii?Q?dzfkKNMG+iWuCdf9pzt8tkHWhG/Pe3b+uImXgV7X8/glah+kiF/2lw9UR/Sk?=
 =?us-ascii?Q?BgwjrOsuetvzLxGD98D29490b0/SQPstmnPeBVJW940l0aTpFhntYFqc+6pd?=
 =?us-ascii?Q?Dat6KmAVPtu4ykvJAJSY2KoDD7H3gVxQ6tak/M1bQgTD3N9CFHrbkRP6Mk4n?=
 =?us-ascii?Q?OgQlZMnDhvPMcRGCysCP9+qLKyJmI/hm8QeLHtAHgblsmo0/MGK7jYcOGifO?=
 =?us-ascii?Q?q6w6bywAnCLiGscU5FmR7GuvvW+ixKz9/LUw+pfr9XKFPX6UMUpBwg8BFiVd?=
 =?us-ascii?Q?M5LNfuNf3drkN0DUgrkRMCch4+xcbQ8ve4A66sOaNDHYsn6/DZnwBI2tljcZ?=
 =?us-ascii?Q?MkJYk66sP5ngzXdLSOamGjqU+nGJBEZy9hBKdsvv1sKIMMUpydZJOc0du90G?=
 =?us-ascii?Q?/J1cy3Hl6Z0+9B04eKfh8peYGvCNw4uog5+WUa/VsQUckl+30AViBosOzMiv?=
 =?us-ascii?Q?9tkIv5uZZQGzxASyjccYEoTk9I8uUo1XCWuSXZx9hUqK8DegRQl5t8xiua7f?=
 =?us-ascii?Q?9FDzNIQcAA9l2i7Isj6+6w1vdorgtyjEfhgTV7lV3wCqF0R/orchN9T1hTkf?=
 =?us-ascii?Q?bNKK+7H4V+wg8HbinkZ6o+s8rjdRmJtbriJClZrdoxKxa5s1LkZFLWdr/8I8?=
 =?us-ascii?Q?eG2LPVWw6X9vEB+AJTAwHMVH4ErttuWBARSuftEyEsqGHJ4v5eRvF5GPiC0G?=
 =?us-ascii?Q?2K4qAO22XVEf5m2dJ+kE1MVj/M5CYBUwfssm0+Gka3MufbW802gkt+BYND38?=
 =?us-ascii?Q?rd6KGp+3uU/SDeOSu4b2RNsZOlJgU/jC8lEF1yz18+cr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(366016)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ge3nlijjMxYWhc2m7vnVRLMRmJmoeQyYlhVtL8od1/i0e3I6eogcphOZDK2e?=
 =?us-ascii?Q?+VwTxe/3xJ2s9167A4Rx+qU3UUHTlYWaOpfdJHU5JvoKCb47/V5SYSEdUTfq?=
 =?us-ascii?Q?GmpsO7ObIitxuE1GatHCNNNe7P982TJbLc1x+DUHfZos+u/54in6xFhdc4ws?=
 =?us-ascii?Q?2G9CdN2qRz0M7mPepvsqa7pYf1FH4fyy4obEjf0C5hR5ywPnfcySnuAXKdvN?=
 =?us-ascii?Q?Z+8fdcG6ZoKbto7gQlAttJab43sFeTzHdn1TiujiEtiCZ8Ak2Tjzf8EIvKGF?=
 =?us-ascii?Q?I5w+7mahoypBUzz1lb6W30cthGKwaB/AKDzMbHAhrfzGmllVM9yiBYo79f1l?=
 =?us-ascii?Q?1/KxBw6e7LeifcbsYTx39WCFX8/6CHxi/Cs7A8uotfWRp09XUgNb0Vu7e0x5?=
 =?us-ascii?Q?tRl3oh6QdHnBadcw8BjQf+6P6/dKU2U3y/w/Yzsz+n5oIYQ5Ax7NxUjVRqJG?=
 =?us-ascii?Q?6mawkM4iJHKalwjedciRl1K7Efs2YlLlPTW0SA3PfrAV+ABeWtGoaWg+KpRz?=
 =?us-ascii?Q?HKswur1k5XIDNeysWsQhiLNO4ATPJVy/DifUdJ7LNxRS7tI6RMIz/1MCuHvW?=
 =?us-ascii?Q?vGFsoYyT374WQPjsOeYza+F9UVsCLg8EFCoVK6dmRwz0ZPh/GppyVlliseUd?=
 =?us-ascii?Q?m+9zz2j7wM6LhLqZNnF5H4ron76u2iXJF+6axKA5SNZAB6NNWM7N2YH+OSP5?=
 =?us-ascii?Q?veWaW+tHfMW7as6E9B18d1hkBn51O20pUuho6BFZv2s0Jn+uYuAq7ea6bcon?=
 =?us-ascii?Q?Si3l1HCIh7hGC0mGUY19sfKp2iPvIq3hEYneMFIF8VKGo423a4VlshvFjWNc?=
 =?us-ascii?Q?Tp1l5suXGokjS79MPau8CboPqwELJ7im5qsbe0CTtr3dhYwjajwX67+Hrmzd?=
 =?us-ascii?Q?JupxFYMvywnIyp274wOyI8Km2chSG9/u1qUzUnXqKY3kGqWhRj6K7mTvlR6c?=
 =?us-ascii?Q?JO4juK1lThRybSE/ki6RlR8tQ8cieNbpr7oAZqo6TnnbkbeJc2t0vC8hSQxp?=
 =?us-ascii?Q?gsVES4AU7fNPlVvmcXiak83BHkrB3oisFA1QBFWyKnAONIrtKxdwDKODEskj?=
 =?us-ascii?Q?Ex8lcij524VYKmCIsERYdSdbaTdRJR/8y+DGUvbtqrDBELXJxu1QjNrjGhXR?=
 =?us-ascii?Q?I1tR6dbmVa/09zpRMZlGSLIV0DgTY6jePN3rTgmvqLFmM2eZME6VQn2A35tt?=
 =?us-ascii?Q?SExoK4yiyY/4AIXQQYD4eP7v09+qQEvT2Al/EVsS5XRGNt8vweSTNQe5/iMp?=
 =?us-ascii?Q?G130fuZi2aLCuyuYDxIuwQn+oA7S3QnBCR4EPTEPQipjnjmf5c9fb7wcRVsa?=
 =?us-ascii?Q?Az474LKwA4HKCMnrsVs8DNg1m6522/TW4GnZVdi1xFzweM99CGxTemg83+Zz?=
 =?us-ascii?Q?gE9jioBsVpGK+3Oq0QSH6zycEtbkLD4rD0g260vHiK6W3tylZnRIdy7Qbqoc?=
 =?us-ascii?Q?BtLwZEFJBiPWyPbPEfe2QVuGd3Va6Rm9Q5tkIlIbkeluavbJbGRxDCfOMaob?=
 =?us-ascii?Q?yslxRKHBwI4jgLggz7QO5wpL5PjTWOc3/SZ1OxlMjnBmSpz+CPK6DNoHXmmK?=
 =?us-ascii?Q?UmEMvZRRaJRcNzj0J5miba72BXjPFORvcBQY+oEhFl3bldf2UDOSYjO6pcCf?=
 =?us-ascii?Q?ZpQuEvmnhx6Ab21sx8FEZcbHqllUzPCpiCzw9GGyv7nVwtF4Ht8sbYffOEUw?=
 =?us-ascii?Q?5Wd6C3ZgGbti6Igw1485bvgtws3GJbNwvCL3CSRm+3sNNHJZktAnkgiukLDt?=
 =?us-ascii?Q?N/J8dtfJfg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f600322b-908e-42f5-049b-08de6ab57deb
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 04:08:06.8663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJ1+xaZVK0DyVVhEUMU532dQziZoVk9lPxkD0EyVL4cEsu3ZtuTD6XnvfnCKGvEd4KBoyF5xYmKqJ1alWiBJ9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7929
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_200812_418228_F1BA591D 
X-CRM114-Status: GOOD (  11.76  )
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

Currently, dw_pcie_host_init() always allocates a new pci_host_bridge
structure internally using devm_pci_alloc_host_bridge(). This prevents
drivers from pre-allocating the bridge structure when needed.

Modify dw_pcie_host_init() to check if pp->bridge is already set. If
set, use the pre-allocated bridge instead of allocating a new one. This
maintains backward compatibility with existing drivers that don't set
pp->bridge, while allowing new drivers to pre-allocate when needed.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 6ae6189e9b8a..c2de9830e1e9 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -575,11 +575,15 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 
 	raw_spin_lock_init(&pp->lock);
 
-	bridge = devm_pci_alloc_host_bridge(dev, 0);
-	if (!bridge)
-		return -ENOMEM;
+	if (!pp->bridge) {
+		bridge = devm_pci_alloc_host_bridge(dev, 0);
+		if (!bridge)
+			return -ENOMEM;
 
-	pp->bridge = bridge;
+		pp->bridge = bridge;
+	} else {
+		bridge = pp->bridge;
+	}
 
 	ret = dw_pcie_host_get_resources(pp);
 	if (ret)
-- 
2.37.1


