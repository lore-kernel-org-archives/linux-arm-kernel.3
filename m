Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78C7C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 14:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23t+I/bzARZLIviDYzQ6V/+fl+F8XkQv7IGr0rx6INg=; b=C4Wr38aOMyBkr/xy8KvKCurqye
	fF9KqHU9IHJuAZcgFOOds9+IHk3Z/5PKVyM0LHLAtri88jUAyNW7/Ym7h6CYkWXIq3dJBjMbE1flf
	36Z0UxclWUrRokOJeBUZexMX+gP/S0QqKaACA+zpVKRM0/9Y4UrTdFyR6HvkQRaolA87xycoAc9R4
	dM+cajumwLLPpMrIOB1W8Q6iWEFuWWA6NQQ2I5epAoIIW5Y+iLDfA4lgKNOXT4DfB9clsjyEowATE
	BqU25EBgDye22amPVIi2q3brTjFszAv4sJrny0etSClZVlih8jQW+8wYW9LbgKnnhwL3t21a1NdTo
	Qk4D7EdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjER-0000000BUIL-2Kwg;
	Thu, 13 Mar 2025 14:08:19 +0000
Received: from mail-vi1eur02on2061c.outbound.protection.outlook.com ([2a01:111:f403:2607::61c] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjCn-0000000BU9m-11XX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 14:06:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Knkj0MdcAVBPtMcjRwkhE+AbeY6R+GmW5ixH33ukK4FV2mkouZqNluaDAI83wqN1DuxuDhJa1NlPsMrw8iKFwzJ7RwxlGcaYpat4CMMPmr8Kh9CZKuKRGKMlgTV4lGN4sYDe7qdZID1C979obWMjC0DUF/lIEpa7nJVCg3y6DPzeSk6+iWJQ/EfsmvZoqEgK0cs+Kh+37uartXQByD+ddRqULIj8pbD3O0mF3vbpLnLQbqXP5VnLhBjWmde77kmAuGIkfLRwfw2z1aEvZpb27RzKMJGH3vF7m60nH42U5pzZ6AZq+PCSCDLXBgtuoSpnM+pZjUXks8bDL+DxfsAvIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23t+I/bzARZLIviDYzQ6V/+fl+F8XkQv7IGr0rx6INg=;
 b=YWu73rVXk/D9x6nNOIQBVx0WxyohU4idUhbTBrQWUOrVFLl1tiLU4y/4ZRzRDp1FNMs7N4WDf/trpGP2BA2eGtzkiKxXciG1ep2uQQkTnIawsOGDFBL90rF5cQpbwnea+WDqd3iOrMjCblhjm102b9R3hVsZ107XVH2MeC40ZzCoycuwieb4c5AoUHnH5wJG8M0wC+8uah+YZ8T8bhcoMQxIDSjGMcaWHKpuSnSx5rnahaklOocM272ttG1+8t0Qp1u0ky9am0VN07lasPTNYXT9wXDRv856qqbvVN/HsLsFvenjXZ/3gvBSuiLcCZD/AZLD76UzdqatCgvF+rQ2QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23t+I/bzARZLIviDYzQ6V/+fl+F8XkQv7IGr0rx6INg=;
 b=BNm1lL4WC+Nur5SGS8ZvB0LbUwIxluRsVV7JDb2iwOXNWBQgVCgSFBcj2+9gI/wDDnfddBeCtU8q6ZfbKm/YJvBazbF2ebwGkzuzmkrX529CHu9fA4fnEjX2embLTqa/edOC24Ouxk6sXZFpgfwF6yNTyf32qR+A+MfYSxilFviVObNgl0P2qTwjELZ5wVl5o3OpKp27KIMH1jZBx5ZaKNdSfUbHnOpeL3MQanDvjXml4Fb1/uX/CwxkL8LhWx2fn/X7lUyl8mair/KHgE4aAy6/1n/nDFbPHrXh7IUAaHQGnmo+02Rwih64vd5Hz+4z3FR9GEDdOTuvj5u9OhRZSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DB9PR04MB8410.eurprd04.prod.outlook.com (2603:10a6:10:24b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 13:50:44 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 13:50:44 +0000
Date: Thu, 13 Mar 2025 15:50:41 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 net-next 00/14] Add more feautues for ENETC v4 - round
 2
Message-ID: <20250313135041.uex3gvhpbmnh4hmp@skbuf>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311053830.1516523-1-wei.fang@nxp.com>
X-ClientProxiedBy: VI1PR04CA0107.eurprd04.prod.outlook.com
 (2603:10a6:803:64::42) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DB9PR04MB8410:EE_
X-MS-Office365-Filtering-Correlation-Id: d654df22-843f-47ec-57ee-08dd62360cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ceIzM99DPrTOqxwhpwW6f3cKWgejdAkWkV9nw/beBhGW1K5zATHt+GumYzu6?=
 =?us-ascii?Q?4eD+LakjHTq2zpweJYwSCYrZgfnTW0rj+7bTzsIOei3DeS88rFGW3oZLpsvn?=
 =?us-ascii?Q?ciK1gf8Kt7z4edoPy1PdlR9EHw3Hh4OiurrMQ9mrrmEUxP1ewBUHES6Xg2b0?=
 =?us-ascii?Q?mS1g9doIsMhSqaCoNEjbLV/VY87GxvW0WX7H1uOmWJGTkd+FoLFNKqISJY3j?=
 =?us-ascii?Q?VBHHj8RDTNJl3+0XQORa1RwRtBdNoW8sbjK8IUhIIxrevSbTsellD1fXpw/q?=
 =?us-ascii?Q?8yqcb3CvP2svGQKvaaxdW2cZATy7PZw+VkNUNeFUdW9Un6hNy6p97BKHmO+R?=
 =?us-ascii?Q?JOb7dJ7HuYBPxP53It4Hy7xtOIqyv0WbqaZAO/28drRq7gn+1TvK3xfWxWKq?=
 =?us-ascii?Q?kkVZD3JqE34jttnwFF91zte2b2X5uiP5ehwiZtF27yNNgWdIm8ML9TCEulsa?=
 =?us-ascii?Q?3MhWGE3pgdajphxKpRyc0O390d5Uu4dbaM7cWCvx48+hrGJFrfgRRHzYcLSI?=
 =?us-ascii?Q?yrxdysYHTiELWOWOGqnOF9HwUH+GMYo85WBJ+oV9zLYnreXUbaPd3xfxvJqk?=
 =?us-ascii?Q?Czfjt70xNjfzyyDIxnzkapNxqww2ErJRa2OOA7C4J4e8y8rL6yH98O9XGMPx?=
 =?us-ascii?Q?LOAe4imW11dK/Y/LCzkCINp/uDmNZ62FVfXMhw0PU0b72jsspLGc8r6Otx6f?=
 =?us-ascii?Q?2fpZeVxO/3+5NvT/D/7wpQMZKYAhmws/zuPfVq2Nlx4LZlWWEzK0PFJSITSY?=
 =?us-ascii?Q?l9YeB6j6qtYNJmQ1pQmKoIAndoewwo0e/A1+17WepY4mGgW0SgdvUk8zpNew?=
 =?us-ascii?Q?Dq8ns9sDX6vbmfJVH947vtiT4F6oXLwRmCUxvPGIhuIhGtrd2lWySXi2tNsi?=
 =?us-ascii?Q?6o11OgFw8Q4MAc6TsQkuoIISCMRv2tm0s732pIeE0vyWYBdlxS4xciQdCdS+?=
 =?us-ascii?Q?V1k0dzSgNFklaIApOkipRGK0eC7TOsUWQNLAFHaHgKZHfupAO5gyl6iJtfUg?=
 =?us-ascii?Q?yxXj/GW2oXPLa7X/SZgexWlvAHXbPMHwA8EbarhZ0ETPCys9oXWXHl0dvYtS?=
 =?us-ascii?Q?qDErtlINNYpnzv9KuaSzDeth5FDCPiaCGIv+tANckQf5mfyq1W08TLOlJqYW?=
 =?us-ascii?Q?sZ0tC64txLceP1hIxwwtgt+yDv1Q/tMp/fDcFBEMgRkjDEDZ+rw0iUAqxj0q?=
 =?us-ascii?Q?cC8Y5Z/T7l4Y/CkgkGuEjieX2q5sfrUKKvPWUpisF1Cr0ijsJvRAohrv1Jgv?=
 =?us-ascii?Q?uL+KSWluKHzz8ohe7pQiNOjLLYXm84+lYDnPMMS9nT9R72tQP3uHNYbX0y0z?=
 =?us-ascii?Q?/CI/Rz0QTSH95fjzeI89v9WkVqByOlg4y5r+74YQDs+BPrEdW9ml8nLcX6Xb?=
 =?us-ascii?Q?swSM3uI7LHoSR/0dLzstr0X6RHIr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gi9A2m8AkDzQru1jLa395VlWE5aib62quaY1qsK2WiEbHXF2KiJ654gd/QbO?=
 =?us-ascii?Q?fPyFShR0S7qQJhEmXTJwCzWBVIK4eqlV93L0iBvPtzAxN5v3Xd8RiQzXbZ3A?=
 =?us-ascii?Q?4o3urAXSuhPJe7gJADk+xI0pbXB8nyE9GPW93QJpmz1kl3f2f2Zfuigg0Aec?=
 =?us-ascii?Q?heHKFdrEe0tymAfgGUdJTCy1Y9wNqACZp61jlbLez0fgvrvzuIfyrOZNhV7a?=
 =?us-ascii?Q?wNHumudUFrV1Hyydmp+8jR/2YxJ05DLX5x363Gc7kmQpsUfk0i9c2DckbtN1?=
 =?us-ascii?Q?zBY3SYpwhSnP2Kr/Etsa9B/Q+bx/PwUMY5umgv7sjTYth6cbmIJSXW6RIghY?=
 =?us-ascii?Q?H6v7e/usmJzxxvUN6GtZRlpL9jBO08/vq+6wruuJJxGaPZxJTPQne2GXxMFa?=
 =?us-ascii?Q?OOJa/s5vhtE+3+isRxAwoQ/5mmVoPvC13yr7D3sQvDYzgjCuBtZ5og6fWnSk?=
 =?us-ascii?Q?cp7/b8KYtZVAmJ69fpzMdkndhBrc/QLk2p3FNZsbBpXbImQ99P4X1SPm54Hr?=
 =?us-ascii?Q?Tb8R91tXM9p7JAunth5WxOkJKDjPhJMPoG1GbEfue3JGo/FZZM3KYIXJIpPU?=
 =?us-ascii?Q?zQowEjzC7kdKGwvim2R1YYPA4unJm+fCEiZ6bQYT+lcX4pXKovbOjyxhagy5?=
 =?us-ascii?Q?Hz/gJZx2oZKh/KFmWzWXltN+5/ag+ftdyCWrRdE5UmNJJ3bDOCeNwC04C6qn?=
 =?us-ascii?Q?lCnPhWfihLffEwmIau+fjL0YoBYolC5Hgmf7fE7F2pg77dXFKqsJtl+v+amc?=
 =?us-ascii?Q?/VE814iZYze1kxD4pPgOKayHysnbSxp3P75c+/MRTxxbVO+osFF0PL2vnoau?=
 =?us-ascii?Q?Vq8yjLJZ+66RDMYzyWEOC5zbNVJl/g5B9R4LyH14PcKiVc1xHX+n13vQZWj8?=
 =?us-ascii?Q?DawPg6qCw1h1l214xjUsCRcTyk9diouY2zR/BRAFqMnSUhGIXy7TmCm6aUO/?=
 =?us-ascii?Q?Z5+4EAkW6PwFld82XtIGAs71vCxTnj9Tum3FZnsusy8hPwji36uOsJRdM9fH?=
 =?us-ascii?Q?HKH6g28hCgFJFt+Tpzr+qfYE1UHlOL7FYsjnXRAXkJzc2c+5t5/AxJK+KNQj?=
 =?us-ascii?Q?xqBMstrUZPy2YnycHaWFcbN+c+JSZaQbNRYIFAVkkhUv4OhiivjJUmbQIvEj?=
 =?us-ascii?Q?JKDxvB8Isnysot/AGtMrzX08Oscx7bTDfWlVcfa5ZWJlbkiBnYI9ou5o0jo7?=
 =?us-ascii?Q?CuPBsO9Z5/k58im6EVhI3A6oqYOBgEOekC+ltuZNYtLuDHZkTEKDPKncrEUR?=
 =?us-ascii?Q?WhLak4x3lqKJw4k6uEs7T/XM4tZk12/IV3tt8SnzV/78vZaVUxCy571hYopr?=
 =?us-ascii?Q?Nlm3Qvltk9IgnBGZ1hOLE8eW2cpLkKxv4tF4dpe7mnLZno1U3k5K5YlfWZeW?=
 =?us-ascii?Q?1g83bYKKSweccolFENC7XGKuzeBK83de5C7OiVDe0+6v9lZeS21LSUkEC732?=
 =?us-ascii?Q?kssIBOxF5+H3SgmHpU/IbKPGIc/cwDfsA6o+cihftEwUKp021DE1JzTzrOfv?=
 =?us-ascii?Q?7D3P8Qd5XB9hP3paCZRxOmcg+U8eOaw1lisU1AmokXCqjPdNaIMDT/ToRqhm?=
 =?us-ascii?Q?hBh9Ij8mL7onZWopYYpHRgzp5caE8POZ/Q4UgAtdehClDc1cp9Y9ggX6X//a?=
 =?us-ascii?Q?pQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d654df22-843f-47ec-57ee-08dd62360cea
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 13:50:44.2566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: muijKUDpSFKizFId8QX8xcvs8JXQVsF3euOek2w66CrX9ckthbnfff6cql0Jw0wmNTb+WnD/Edzqu0AEuJ3UvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8410
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_070637_279513_F300B389 
X-CRM114-Status: GOOD (  12.81  )
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

On Tue, Mar 11, 2025 at 01:38:16PM +0800, Wei Fang wrote:
> This patch set adds the following features.
> 1. Compared with ENETC v1, the formats of tables and command BD of ENETC
> v4 have changed significantly, and the two are not compatible. Therefore,
> in order to support the NETC Table Management Protocol (NTMP) v2.0, we
> introduced the netc-lib driver and added support for MAC address filter
> table and RSS table.
> 2. Add MAC filter and VLAN filter support for i.MX95 ENETC PF.
> 3. Add RSS support for i.MX95 ENETC PF.
> 4. Add loopback support for i.MX95 ENETC PF.

Can you please fix the "feautues" typo in the cover letter title? It
will get used for the merge commit.

