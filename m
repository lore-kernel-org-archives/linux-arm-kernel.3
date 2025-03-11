Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D413C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 06:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEsVbufs98qUs9KjW62gIIdn4YkSbcu1vV1lgjh+tRY=; b=2LBLkl0299wO4Qy3ZSvIoXyd28
	v6MN+KIbOmsxMlz+7y5iFfkQd2Rf20qWMzMBF/KXyKu5zUss9bNBLp1UVqJeQUvp7RseTzgVV24cH
	5rpc2H8xQq5z9lD1NWE2kVJ2r+2PMpGTlKqLa/WkHBIvq121Be4x3ZtRAtRInqrrvzcWLVXh/Y2Pt
	SH1pxU5ULcqLB6Bsg2nDyXnaTlvA4OqGIypS+ihqzZkbryhClQOwwbuPofWCSmciHlczqeyMfhP1F
	SH/JqB4isCW2m4cXuQz0GT7rKFyVaceeESg/NfEv2RUrWYLD9ubtgqmh3MKdknc9OEthwtSPvEJdS
	P69Ad71w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trsxa-00000004jvo-3xk3;
	Tue, 11 Mar 2025 06:19:26 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trsbv-00000004gmZ-20WM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 05:57:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z70PIjVO3y0KLg6SAISjd83SCZcf6KyJuAVQ5gCDjqCZox4KnksPD2sePgGNx2XnoSrJP3ShjlGKaYfo2kQejwALxEHpK6j8XUCoi1PFHh6J0L52jVzF2sq8T7iJSV3X9O1BMrwhv6dpEIEWm5vvWCabGakmFcXp8ouYCxp6mT73cm284kwmGQlEI18Jztit4H2XkzviMiN5OOJfbRlM7D5uGUtHW6A6KMvlsHs+lXfXXcEzixIFyWb2IoElDU+UUc/QhIp9pKbvovX0Oo1jNHLiMMerfgXmOl2cq/601u24AtAXJSLxJwTRX3ROnBA8uHRtBMcQwHwv1ZepEYSXNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEsVbufs98qUs9KjW62gIIdn4YkSbcu1vV1lgjh+tRY=;
 b=iQbnrWnW1BCcmBiHDcvpuKoJW4GRlhsTUKSd9as+ChprVVpTGgKxa4FvhdULb5DyShunFQpdLzwRs5zGxrvf1kn94zIVO55G2TLeVQM0z5T/wWsLT4cn4o+S1EOPdwSURQg4dnsHQeUMYMO9JbJVpdVKCWCcKMh/BrICGYFiMJtWTm6r1WIq1MCZIsIXqMKzhxfPOxGJBBCn39Ix+K7H2qFYqGtf0y+DM0wD5YueVHGWXqC55crodY7gFpDDAxeILgbJcplg6eIaU55OGhbVmIQtYG+hOZLHQY3eeyWOGpXvzFOJS5o7u209XY7yfSAoEk6k4ISNX6OAJ+uP1tchcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEsVbufs98qUs9KjW62gIIdn4YkSbcu1vV1lgjh+tRY=;
 b=mGM8gP/k3KlXWYxLpfo7iA9C/YuSKjSGMCOYn5M0V9+U2d8Hi3PLJ+nH3gCMsZOIs7uAwuTUzswOkb+5AoVpHca62ccOBItZ7N+2AH2BfQf8unA16/l5cdp9omtrfkSVpsx9TmoC8AHZYxy1ieOST47yEIOQqHUOghaMDozhfy/ZIq25BhiusXHfDOU6ZIMM58CDZyIO7G5P4jWQoBbvBYjWVdgUSf2kVEdjw+RC2MObliPkjWK/AX9T4SVbHJAGOk0/DaobBybXr9mqNS39BTXFHdoZonkg/eW/qSTFdlGHSw+iB2FOfFGZ8WhhffMh4a5E33SL/ehDnL88uhqSEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by GVXPR04MB10945.eurprd04.prod.outlook.com (2603:10a6:150:21e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 05:57:02 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 05:57:02 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 net-next 13/14] net: enetc: add loopback support for i.MX95 ENETC PF
Date: Tue, 11 Mar 2025 13:38:29 +0800
Message-Id: <20250311053830.1516523-14-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311053830.1516523-1-wei.fang@nxp.com>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::23)
 To PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|GVXPR04MB10945:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eba2a1c-ed12-4d6a-a3bb-08dd60618b27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?es4UQh6+onT1WvFMrf8fK7uxVh6hmVH0TCQ1i0zp+5FAAhHVwynHac/5ODVO?=
 =?us-ascii?Q?LLHmAo8oaNoj81BbLjlxARZOO48HN/pMkVzV0YZZyKbfEuhUwsh/TB9mJjRD?=
 =?us-ascii?Q?5td2lfRtjSit1Qua9UeywqbynlXwgCdKhYSrgLN+yfFDqPefMo6IrnIX6/Rf?=
 =?us-ascii?Q?ynDSZyiLRYEGh28EB35C+vepGc+R52Pm889/I0O1RBIbGtjtBYD7/pmXreiJ?=
 =?us-ascii?Q?6fFENFOi7tte6n2a0xeFvD/PoejRiq8Oe/D1YpmI06Xsnd6bGNMO+KOf8ojR?=
 =?us-ascii?Q?Nxz77d1Me/prQWB8i34sg1jVbvgkwhEdm5Tbc+pdJn5UmevWKhgzX8K8bOna?=
 =?us-ascii?Q?o6QAiOfbesa+Zf6bcwcmZeCyVVu/TCDgQnGjeJvAePAy4yeYzeJh4SgY0ZjI?=
 =?us-ascii?Q?Mx1m5ifxxhH/PgazFZS08l3U+Mi2jk3xIQRikpSkQpjnRegmqKnGKa5dF4s2?=
 =?us-ascii?Q?381w2IV7/B5yQNheEwcgeWkhxmKJmDwBv53NAjeH4KSea1MK0M7Kja533PRn?=
 =?us-ascii?Q?hv7EiG5Vm4B6YIhcnDItVqbxWF1+gzeEOKlKBJQQkJ2UDHCFIiXNJgDQ1FGX?=
 =?us-ascii?Q?Lgd8HPndxr7CpBevKpSqX1BNKHsc5x2zJ3WhJgtk7tzA3yHCkT4WgBhoqXRt?=
 =?us-ascii?Q?O049xP1kw754VkX5qlecEEmNySmZE/l2vU4tf6HBxSgncuTRTEehEshnv2MC?=
 =?us-ascii?Q?9BUIkVPKMdV4fIGntUDeg9LICLSWvEFKBZVSDQZsGKwYZGQhrsScoMegQ5eQ?=
 =?us-ascii?Q?ACyHPnqrF3w5ae8InMQ7zGD/u2nxul5v2lOqTOqCO6kSBO9kPpBNG/GEoBKh?=
 =?us-ascii?Q?NI14Fq9ltai4IhSN/qhwklwfznOZeRTrwvkgEz8BOTHQJtRFZLZrzkf1wl7X?=
 =?us-ascii?Q?hJ34H0Zikj9jThc85ErcMxBS7q+5MeUrpTLh7tSrymqqmGMy+7ofp4TFWnwH?=
 =?us-ascii?Q?nTTs58AFQn3UR9UIwJ8KhbZp4VDgTf+SWrlc9hBGJQ5NZfITi4Eem7XBl775?=
 =?us-ascii?Q?JVNvohi1hXs7XqWsjuYDM8871aVVU/7sGN5kx5vbKuMqWfSvdSKmltMHgfUF?=
 =?us-ascii?Q?WMUKuFdKoN2JYESaU3NeneQE05YY3Q5UlXQnaqhuAow5q4UXQI/kHNfgDga8?=
 =?us-ascii?Q?vi8c7pch2HXcLFV0FyHMcJGK6xlZ9CrvlGylHRPHfvgSBvxg3+zBQ46xPJpZ?=
 =?us-ascii?Q?9FWI7Ofpc6c+G9xzyxxN4YfoYWX+VXuPvzBIBqgH902Rj5I7kvu4EMqA2jFy?=
 =?us-ascii?Q?PAEfSqJU8reQ6AgW7kkxq4KQ8i1XVH0gnXjlYy8k5Cwg2tKlIqEuzDoMkjzY?=
 =?us-ascii?Q?ndxwqdi2GFZqOG2iYSaEKrPYYCNpJDWQ56K4skjZWBCwAx4mXazZBtUCU6Cv?=
 =?us-ascii?Q?wc66sjQGfP3n1EA053eO8fnDJfaej6FqMvxbN7Od0JrAX6jmo+LgjEMqAnGK?=
 =?us-ascii?Q?Nz+esoDYZUH+os5FVkWjSUwP0gUhwm9Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZhkxAS0GXCIEJACVDFhbyYuSibDuBHpgQMp5pCpqkHujC29GkLRyNfMJn271?=
 =?us-ascii?Q?iP1/QcdvtIO7Qk0/zAM4CinuExjziXCpr9x6FmVp2d8XnKsZWYcnrjbLsY0a?=
 =?us-ascii?Q?mZerkbEbGKk74z5HIW7OlsfsyktqfQh7vf3Pu9w+IJGSdPJP2q/HKTDTdldw?=
 =?us-ascii?Q?MWwZOBjmnIbPqJzhef4JXl7OUiKB7cr9u0yxkH5hsBpCJvTBiPbBBepQr98H?=
 =?us-ascii?Q?KxJCLpcXp4p0iqolwnsZOJiKqRDCalmNNRAVLhLa5Io4SGuAXwCt9WAXFny9?=
 =?us-ascii?Q?DxDf9rdKEwsmhBHAcYc3OwSdz37L4uzMeIrv7g3Cs2FAzTD7a66DSCE6HMMq?=
 =?us-ascii?Q?Ug3aIlaBzJZa+Bmh9SttG/e2JwrrN8RIGoEwRTiDYljMdoaTiXG/HJTNHimC?=
 =?us-ascii?Q?td8u2MTi+pF3kSfESGcElScOax6dLHurnG2cYrLpvgUF+PcgtVBRLiLKnN09?=
 =?us-ascii?Q?9W1vvPQAUkCdrFmx+2DWJ9cGLOSO8Z4n6kllQ84uT7wxHyADrLTu1eP/L1Lu?=
 =?us-ascii?Q?FJ/7Oz+iZdk2HLLygB0z7GjhBRtv/3eKy6G2ItZ3b2bHVxlC11QfCbp4sdIB?=
 =?us-ascii?Q?qo7UsRrpaGTnWhpjDTuo8/hYSzpSYnnbP5O8B6/VED62NVfwYI50/TCqvOyq?=
 =?us-ascii?Q?MYUtwsgnUrT1svxiwgDdrn8lFKO4QxH/93c7RWhNNJ5TfTyQ1w0YFOxKICbg?=
 =?us-ascii?Q?0toFoW19Oh75Gj/5bYABN1OXnvBrZTo/aYLBV+ZmI2GvhUbq/XtX58dZX1PV?=
 =?us-ascii?Q?vUSbJYVWf20P4wI1ck+MAtpHIyjq7O3fGdN5NfwLXW/bmG4ixnh76LJ+XsLX?=
 =?us-ascii?Q?DicICVHDEhbsx/DGdJT8ODzIlwwgOtij4yQ0MUQUdl9KgydSFrQ0DsBi+mRc?=
 =?us-ascii?Q?+J8ng4XQJv8a5MEnx7g73YrS4NpVsv2VtYOSNYzMrZPkcN+bK4vQjDx+bUB1?=
 =?us-ascii?Q?BnY8vmIb2wXVHHdkRQK0ys3LT5/hLcDTE/WLYvSWM3J0zlv5d7ZbB8kP5LmC?=
 =?us-ascii?Q?09r1coK4VlrAIDKcjYmYBd6FhdrVzdw4Ye8oTS20aBAuzgC2ZJqzz+j5UroB?=
 =?us-ascii?Q?sTAz37wbjbIqzog0XfshbM/0R85dIbaL7YQamY0TSP1k3Mk6bGZBJlOntD1D?=
 =?us-ascii?Q?pbUwV7Y9NckuijUTLPiBoZu4EeXGvrE4X79bGtBtiCjP9uapgicJ8tO70WmK?=
 =?us-ascii?Q?f+mOhrqfTqJoKWpH0LH2ySKnFLyzjRNiGJRan1oe2qrG5LNAxovgBk4veWCF?=
 =?us-ascii?Q?RMlJiVs9yKz38UFhJKj1xuYNRRMIl9E1xJUQLyal3DUkeIXpuUqrYuqDV4Fm?=
 =?us-ascii?Q?+JFWzemIVbq4JMJLBKfdABHivkEuL2TDTXQX6/WiWzzZ8cdJQ2WlBy0S+lwB?=
 =?us-ascii?Q?bqiFtkuSNwaQXXXCa2HNalafslV1dllQygy4FOMy5J4OMMZVj6FHch54JPN8?=
 =?us-ascii?Q?WF0yM9/69+KJZxx8lqA1EZJW65cMutWgxKMeNyG5C4joUMKFxsZvte4zzx1/?=
 =?us-ascii?Q?g/dWKcoUzse1eBQDtkm5y3sgripPvgL4vmUJNpjYt9CTHWGrMundcK1TbKrB?=
 =?us-ascii?Q?2pIJPC3SLXvx5LC/LcIFltkSrkgzBt3NIa5U+Rs7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eba2a1c-ed12-4d6a-a3bb-08dd60618b27
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 05:57:02.1232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +sF5XHUxuUZh239Law+CStzO5Qg9y3XwDFTZew0xs1hkZ0a89wQe3LqoKoue+9J/4sdqGOGTLcJh4XMi//KRQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10945
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_225703_519514_1B997567 
X-CRM114-Status: GOOD (  14.41  )
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

Add internal loopback support for i.MX95 ENETC PF, the default loopback
mode is MAC level loopback, the MAC Tx data is looped back onto the Rx.
The MAC interface runs at a fixed 1:8 ratio of NETC clock in MAC-level
loopback mode, with no dependency on Tx clock.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 .../net/ethernet/freescale/enetc/enetc4_pf.c   | 18 ++++++++++++++++++
 .../ethernet/freescale/enetc/enetc_pf_common.c |  4 +---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 4abbbbef00ff..c169900ccb4a 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -108,6 +108,21 @@ static void enetc4_pf_set_si_vlan_hash_filter(struct enetc_hw *hw,
 	enetc_port_wr(hw, ENETC4_PSIVHFR1(si), upper_32_bits(hash));
 }
 
+static void enetc4_pf_set_loopback(struct net_device *ndev, bool en)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_si *si = priv->si;
+	u32 val;
+
+	val = enetc_port_mac_rd(si, ENETC4_PM_CMD_CFG(0));
+	val = u32_replace_bits(val, en ? 1 : 0, PM_CMD_CFG_LOOP_EN);
+	/* Default to select MAC level loopback mode if loopback is enabled. */
+	val = u32_replace_bits(val, en ? LPBCK_MODE_MAC_LEVEL : 0,
+			       PM_CMD_CFG_LPBK_MODE);
+
+	enetc_port_mac_wr(si, ENETC4_PM_CMD_CFG(0), val);
+}
+
 static void enetc4_pf_destroy_mac_list(struct enetc_pf *pf)
 {
 	struct enetc_mac_list_entry *entry;
@@ -714,6 +729,9 @@ static int enetc4_pf_set_features(struct net_device *ndev,
 		enetc4_pf_set_si_vlan_promisc(hw, 0, promisc_en);
 	}
 
+	if (changed & NETIF_F_LOOPBACK)
+		enetc4_pf_set_loopback(ndev, !!(features & NETIF_F_LOOPBACK));
+
 	enetc_set_features(ndev, features);
 
 	return 0;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index 3f7ccc482301..0a2b8769a175 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -134,10 +134,8 @@ void enetc_pf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	}
 
 	/* TODO: currently, i.MX95 ENETC driver does not support advanced features */
-	if (!is_enetc_rev1(si)) {
-		ndev->hw_features &= ~NETIF_F_LOOPBACK;
+	if (!is_enetc_rev1(si))
 		goto end;
-	}
 
 	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 			     NETDEV_XDP_ACT_NDO_XMIT | NETDEV_XDP_ACT_RX_SG |
-- 
2.34.1


