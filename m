Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74473CD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 01:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SadSiZlve6Pfa/DYVsrF8AKVPCeNHW1KS4sT5uw2xQI=; b=Z+oWulf/9KcrB6mE3ESo41XXcH
	4cg05aDGKNV3s6Ggi50RtJVJ1yQSKCTNHLiouUwQ4BbicxCjrz/+v3OIkaPnb2fCuqNp6TImbLS1n
	TqDypnDQqHmqOAMd4kuJYr6V977W30pu7FgHJjOLSPv385bSPtbGcwbditRLpzBU0lYVrciEMZgVe
	BE21LKcjJjdTrBSjp/81ypbOtTICzY8KUU//CL0bJgsFhcxayr7tV1DEZbvR+3+Ps0Jz1SFnhznl7
	H+nt+ChLOlj7+p2lbqNNgeiarW8aSUTOmgb3sqJNM6N8CktYYzlDziM8a1Hv2N1SGnGiC2SWPejg6
	XIcXxnBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVJdL-0000000HXMi-0aYY;
	Fri, 05 Jun 2026 01:46:03 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVJdH-0000000HXIt-2wd5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 01:46:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZ2I+BvhjYE5hIwwp6VHAQaOiarttojGBW0hZrcbBYxhcV/O7qwwtZaILZpINezI80NoD0QRG8XYRLz+55Bs9JAnBsLIKOhaXHh7uFRUIpEyqEvX4/6x0ohM0NY9UotUIr5grj4UQbliUlHdjeLa6tvT67KOZQlN9KYqcIJ6iqLqiGPaDV7DPUl1iMxEYHsOo50oW2HxXBXlxk9SNhotfKfcK9yr3SpAJ0OQ8ULDMCLK1zfQlQc4QqiwOiIwKTiYEM+w5DlUf/nt3VROgncjEWi5qCEBkihyaYMsfdFo3uJjJOXcdKCvw3AR8aOHMW86hncVG0Ftq0TzOn744mGgVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SadSiZlve6Pfa/DYVsrF8AKVPCeNHW1KS4sT5uw2xQI=;
 b=Y3ur5XbXiSqX1EIgJ6+89MwolPwdxaVh0kBsdK6ZcFekBxXZRSGjnviolgw0iNiOyq3wI5wA8OIzcwCmUP0Zxj2TC1sTmLCmtsz/JKgsGfPfeNz2wHgBopkVaEG1kJijc6htCCRKOI++iIhvZidSAW72e/G/u7e5+jc+ExXLD222yKA1K+XaLsnTREZOh2inbJAXTdEoumDf5jDPSsGjYhFn3kkyd3RCqp36NCnj2rzYNsIRFIKwlWN2EL5UqgztJKD1X6whFw26fEmU7JoJuil2bUXY/Hh8Ejyw05ScenldRXy6DjktSCv1JuwYYqpsRinDcVyiSf9OPCdasCN/og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SadSiZlve6Pfa/DYVsrF8AKVPCeNHW1KS4sT5uw2xQI=;
 b=mDFpb+o56cULAIEMAiQuANeYzQoTmOeeTH/oqvfMZukYfkqXvfEjY15yO9UHdmDY19bEc1YxK8m1KDakf1CvKOaIVakAYs/3QI0OFxcHp+l+jQaKc3V/1UvDx6+jGJbjo7du/WMu5o1gJiSAf2YXilTZogRS+qAT8l0e8P1r92mKtZtBd03SDlBy6ysPMiw+v5a+dzSBnVBHBmPdGe4rb8oJNVEyxdWxLFx9KR8EMrF0jWa95qqXhLq5EVrLIbTxtiy/6+WRIyXf7qhC3UqTSm1JtO+EFPjRaeL7Iki2IxM/svBciv6/3fuuqgnUs+77CjumGykXxCbf1knWlejUfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22)
 by PAXPR04MB9375.eurprd04.prod.outlook.com (2603:10a6:102:2b3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 01:45:55 +0000
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74]) by VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74%3]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 01:45:55 +0000
From: wei.fang@oss.nxp.com
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	chleroy@kernel.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	linux@armlinux.org.uk
Cc: wei.fang@nxp.com,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 net-next 9/9] net: dsa: netc: implement dynamic FDB entry ageing
Date: Fri,  5 Jun 2026 09:48:08 +0800
Message-Id: <20260605014808.686024-10-wei.fang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605014808.686024-1-wei.fang@oss.nxp.com>
References: <20260605014808.686024-1-wei.fang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0003.APCP153.PROD.OUTLOOK.COM (2603:1096::13) To
 VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:EE_|PAXPR04MB9375:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a0f395f-3035-4555-fba9-08dec2a42efd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|1800799024|376014|366016|921020|3023799007|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 24jboa+j62lgm1eT9ctIUBWv5HM2Z0Jhd7WM7Wm08QYBt9xbHokLuXYiEf6XYQ0e+Io7vm+g6MSIN8L6YquG2FbB4RR3SvseG7XAbJ14CGDX4w/PDqYHkwjqNr7cZaxGyRBmemjIuEMGYlfVdfKxBeHqJ45E0+1aQ3erWCiG73L7yQcLtwLUC7T+wEYKalnyxMYhaFCa+Tt0okP+ANi2dmrbPn57GbJzhe00WIpmIUqdG4003TUDkv/mY1vGpy0Hghz/JpFFPGlDATC9hEitgT7CmDQkkUK+cI6ifMKJhjWbIifUFFqj3ghuAfTu6RBeX0k3/n9QWUDJW03Yg5ldthweePj07EPnFBtxk+ESrWu3+huzEBwWJzoEkk3fzLN1uFePCmXTprygz4EGF5u+UkZ4fw7uzNqtaCFkYg/NkBvFPNshPUDPPwDbRQI9VTHZlZbQ9Jmfh6O49RvrphfQRGOQ9o1rhEjiRi+Iwkma4JSWThyWcu/1fSoHRTQCmFKXDARrT991k2RwBMXTeE+pY45nNee/ApSFKKYWQnw0s+KgM6wz3EHNSdAWy+a8ICFEIEVJ3SDd6aIh/e/k/F7XTGvQDL/ungonSXfEzERt1WC1GgsXSqh58uW/8BZRVBVi+7Hgq0bjTwxYSYHoKdQrIC4sfVHshkkprOQPD796n4U2tAOrSyesqZrFg8mo3m8yGoPk43YstoJizLg5ep3t0md1BalDKi/RESjfrw3JM7I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7216.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(1800799024)(376014)(366016)(921020)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OwtE061b69JhjMdw4jzhX6o/EgeHVfkFbmwqbRUQk1DrD9P+z5KM4mGNbckh?=
 =?us-ascii?Q?n9A2DqRRhuA7Oncxap1jci57lWCW4Zk/w8+xYdBcmwqhbRpcA3FVmIDlsVbg?=
 =?us-ascii?Q?Rom66MoxVaUE6Xi9WOzqGlkoFojE6aUxmfdyORPaKGIrOINLi67Kk06Ypyxx?=
 =?us-ascii?Q?decNCBi0VzUO7hl4rwH9kwH2YDOKAtiY2N1WrMOELNbgphNwFeAemAqtgyoR?=
 =?us-ascii?Q?VS6qVhaa38uVOeGj5wRVUwWAP7tsR3/ApioRX2Ou1ApzKmm9PfRVOKzr7VEi?=
 =?us-ascii?Q?mr5jb9fAfUQ3TME/sUYdtxYimKhP6HuQZJP2jRcSIGCS1QpNsBRWw/Aj5cL3?=
 =?us-ascii?Q?A6c7K9yf46LwmhNtJIpQuByQEKqkbS6xBRgYp3UThGICgIKN/bwImcM1W1hL?=
 =?us-ascii?Q?p1/MONsaDjwPyq6EpYpcgYwvkGxDqz0UpgtcOWpI048q0p7hzRMGGLDN20Ht?=
 =?us-ascii?Q?RJkg5G7LnGf5xuHexQOGMg97AgurSM2ukXek19Y/Na64GsbWDiq1vTESK9U3?=
 =?us-ascii?Q?vAWSPkdRa2z4yk+LuDTDiCIii3f9mPwuudAKvrolzHqXQ7WqBIvoZnXDF7wP?=
 =?us-ascii?Q?nCyJtcTReTLYRGyo5e952WpsuGUBFHtIOUvbMF4RJnaY+nIZA9ZWjGaduVcj?=
 =?us-ascii?Q?eJI58g8gYOnIBoYdetFUCoGLtZoQ6XGg6A5VeSghx5fx6wKf9HidyFqTjarW?=
 =?us-ascii?Q?rtwKeVtMG6GDrDPiyLb0xZAdG0dV4cMUeJDqxOF/IKAGH3RPwxqUjxzRwrZx?=
 =?us-ascii?Q?cEbS8XuJZ4zMvob/84P4BEaT1T9Y6794B9MpV+SJ5073JOod/Om+5riOLJJg?=
 =?us-ascii?Q?I4EzTm3n6av0Gwd4phO+IuXfL5uVc2B3DNcTb5qqR/3Ltp8poFJMUhYqRM1G?=
 =?us-ascii?Q?CcmU/Tc/O6/Kc2YgScNVH/5cps3hNiNR36ooh6Y+LY1YXL1/qNVfGkzI/ESl?=
 =?us-ascii?Q?PkM0goRgEWN/17RpckUEq+/JCi7eVMgpu80Uxp2/i+9K7MP49yQfKs0F61QF?=
 =?us-ascii?Q?e8XdlmQRzL4hqN9zW8wP11fd8zFHhqmE9WrCpYeitoB/S2U+wL6Teoy//Tfq?=
 =?us-ascii?Q?wdadWaAVIDpkKgJTYi85/Kmajupc5FZSUl2zV/k3mYKAmrcICwBkhKJZFUEJ?=
 =?us-ascii?Q?Xe4k5KNq4poId9d01bCxh0JTAXJk0ECWYH9KToV2arwgGl7rW20PweuZt7kY?=
 =?us-ascii?Q?1uVeNTBPUgyYxyDKGjEc7JCdnuqlGj7P8X110X3it8ZWkiA4c+vA2DFWS5E4?=
 =?us-ascii?Q?qBnyVjF7qhP8zVQgrXejzN6q4/uDAozz0roZf8bkiEWCrgjl6uANjmx+EAun?=
 =?us-ascii?Q?kXXmliOVxsfKujK62oPMBpVrwWS0I4dQ73bFdCl0TRSk294p1B8fbTTy1wV/?=
 =?us-ascii?Q?oCnRECAEgoL+hwuueFzGjldqor1mVnnPTjKEv4G1zxRUqGhbKCuv+mpT4ppx?=
 =?us-ascii?Q?t1HPllBsmHUIcUGYHltx81n+ggxxbt/jKbE4SdxnoKVZ3ZbgSFHn6MvZ6tTD?=
 =?us-ascii?Q?TQgHviQv5AXsv414bTUiVfLNNyHGr0yCveOLUrjqiHvfQijwBnJDHtAJh/mU?=
 =?us-ascii?Q?70loh3uT2Rk7aLgRx419sNRCsHOvYURt4p+YxQ6iorQL6fNaxavebHTUSRyl?=
 =?us-ascii?Q?4RggRH+btjGT07pCx6w4pN0xYORIqUr8dlowWx+6+H4hdiCuNyQDztdhANZl?=
 =?us-ascii?Q?1vyR3g1BrVVV0/cxlXizTYIKpsfmkXh1vk06WzUjkEaaY74czygpdiakwS2s?=
 =?us-ascii?Q?uGXSaqQyIljymWY/TAP+AFVqlxNyqTYt8QJbC8bKfw0oO3RhfR0k?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0f395f-3035-4555-fba9-08dec2a42efd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7216.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 01:45:55.3692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MyZCP5N/pJJFnt2gyGakmVYSP/ZyfjWpbPg4vlHtfiMIE2mCdFbgSdb2SDrKbha9+rpIO1Zuzgs9nr46x1+8b6TO/M2WAHWoElGMSH9AkadqHEqvXjWoylb8oA040VIY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9375
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_184600_964680_B6C64A81 
X-CRM114-Status: GOOD (  17.01  )
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

From: Wei Fang <wei.fang@nxp.com>

The NETC switch does not age out dynamic FDB entries automatically.
Without software management, stale entries persist after topology
changes and cause incorrect forwarding.

Add a delayed work that periodically removes entries that have not been
refreshed within the specified cycles. The effective ageing time is:

  ageing_time = fdbt_ageing_delay * 100

Default values are 3s interval and 100 cycles (300s total), matching
the IEEE 802.1Q default ageing time. The work starts when the first
port joins a bridge (tracked via br_cnt) and is cancelled when the
last port leaves. All FDB operations are serialized under fdbt_lock.

Implement .set_ageing_time() to allow the bridge layer to reconfigure
ageing parameters on demand.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/dsa/netc/netc_main.c   | 67 ++++++++++++++++++++++++++++++
 drivers/net/dsa/netc/netc_switch.h |  7 ++++
 2 files changed, 74 insertions(+)

diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc_main.c
index b61152c16e7b..a8e036a7046c 100644
--- a/drivers/net/dsa/netc/netc_main.c
+++ b/drivers/net/dsa/netc/netc_main.c
@@ -447,6 +447,25 @@ static void netc_free_ntmp_user(struct netc_switch *priv)
 	netc_free_ntmp_bitmaps(priv);
 }
 
+static void netc_clean_fdbt_ageing_entries(struct work_struct *work)
+{
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct netc_switch *priv;
+
+	priv = container_of(dwork, struct netc_switch, fdbt_ageing_work);
+
+	/* Update the activity element in FDB table */
+	mutex_lock(&priv->fdbt_lock);
+	ntmp_fdbt_update_activity_element(&priv->ntmp);
+	/* Delete the ageing entries after the activity element is updated */
+	ntmp_fdbt_delete_ageing_entries(&priv->ntmp, NETC_FDBT_AGEING_THRESH);
+	mutex_unlock(&priv->fdbt_lock);
+
+	if (atomic_read(&priv->br_cnt))
+		schedule_delayed_work(&priv->fdbt_ageing_work,
+				      READ_ONCE(priv->fdbt_ageing_delay));
+}
+
 static void netc_switch_dos_default_config(struct netc_switch *priv)
 {
 	struct netc_switch_regs *regs = &priv->regs;
@@ -872,6 +891,10 @@ static int netc_setup(struct dsa_switch *ds)
 
 	INIT_HLIST_HEAD(&priv->fdb_list);
 	mutex_init(&priv->fdbt_lock);
+	priv->fdbt_ageing_delay = NETC_FDBT_AGEING_DELAY;
+	atomic_set(&priv->br_cnt, 0);
+	INIT_DELAYED_WORK(&priv->fdbt_ageing_work,
+			  netc_clean_fdbt_ageing_entries);
 	INIT_HLIST_HEAD(&priv->vlan_list);
 	mutex_init(&priv->vft_lock);
 
@@ -936,6 +959,7 @@ static void netc_teardown(struct dsa_switch *ds)
 {
 	struct netc_switch *priv = ds->priv;
 
+	disable_delayed_work_sync(&priv->fdbt_ageing_work);
 	netc_destroy_all_lists(priv);
 	netc_free_host_flood_rules(priv);
 	netc_free_ntmp_user(priv);
@@ -1961,6 +1985,7 @@ static int netc_port_bridge_join(struct dsa_switch *ds, int port,
 				 struct netlink_ext_ack *extack)
 {
 	struct netc_port *np = NETC_PORT(ds, port);
+	struct netc_switch *priv = ds->priv;
 	u16 vlan_unaware_pvid;
 	int err;
 
@@ -1988,6 +2013,10 @@ static int netc_port_bridge_join(struct dsa_switch *ds, int port,
 out:
 	netc_port_remove_host_flood(np, np->host_flood);
 
+	if (atomic_inc_return(&priv->br_cnt) == 1)
+		schedule_delayed_work(&priv->fdbt_ageing_work,
+				      READ_ONCE(priv->fdbt_ageing_delay));
+
 	return 0;
 
 disable_mlo:
@@ -2014,6 +2043,7 @@ static void netc_port_bridge_leave(struct dsa_switch *ds, int port,
 {
 	struct netc_port *np = NETC_PORT(ds, port);
 	struct net_device *ndev = np->dp->user;
+	struct netc_switch *priv = ds->priv;
 	u16 vlan_unaware_pvid;
 	bool mc, uc;
 
@@ -2021,6 +2051,9 @@ static void netc_port_bridge_leave(struct dsa_switch *ds, int port,
 	netc_port_set_pvid(np, NETC_STANDALONE_PVID);
 	np->pvid = NETC_STANDALONE_PVID;
 
+	if (atomic_dec_and_test(&priv->br_cnt))
+		cancel_delayed_work_sync(&priv->fdbt_ageing_work);
+
 	netc_port_remove_dynamic_entries(np);
 	uc = ndev->flags & IFF_PROMISC;
 	mc = ndev->flags & (IFF_PROMISC | IFF_ALLMULTI);
@@ -2041,6 +2074,37 @@ static void netc_port_bridge_leave(struct dsa_switch *ds, int port,
 	netc_port_del_vlan_entry(np, vlan_unaware_pvid);
 }
 
+static int netc_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
+{
+	struct netc_switch *priv = ds->priv;
+	unsigned long delay_jiffies;
+
+	/* The dynamic FDB entry is deleted when its activity counter reaches
+	 * NETC_FDBT_AGEING_THRESH (100). Each delayed_work tick increments
+	 * the counter by 1 if the entry is inactive.
+	 *
+	 * Therefore:
+	 *   msecs (ms)    = NETC_FDBT_AGEING_THRESH * delay_ms (ms)
+	 *   delay_ms      = msecs / NETC_FDBT_AGEING_THRESH
+	 *   delay_jiffies = (delay_ms / 1000) * HZ
+	 *                 = (msecs * HZ) / (1000 * NETC_FDBT_AGEING_THRESH)
+	 *
+	 * Use DIV_ROUND_CLOSEST_ULL to perform a single nearest-jiffy
+	 * rounding, avoiding the two-step rounding error of the intermediate
+	 * delay_ms approach.
+	 *   Maximum error = +/-0.5 jiffy * 100 = +/-50000/HZ ms.
+	 */
+	delay_jiffies = DIV_ROUND_CLOSEST_ULL((u64)msecs * HZ,
+					      1000 * NETC_FDBT_AGEING_THRESH);
+	WRITE_ONCE(priv->fdbt_ageing_delay, delay_jiffies);
+
+	if (atomic_read(&priv->br_cnt))
+		mod_delayed_work(system_percpu_wq, &priv->fdbt_ageing_work,
+				 READ_ONCE(priv->fdbt_ageing_delay));
+
+	return 0;
+}
+
 static void netc_port_fast_age(struct dsa_switch *ds, int port)
 {
 	struct netc_port *np = NETC_PORT(ds, port);
@@ -2332,6 +2396,7 @@ static const struct dsa_switch_ops netc_switch_ops = {
 	.port_vlan_del			= netc_port_vlan_del,
 	.port_bridge_join		= netc_port_bridge_join,
 	.port_bridge_leave		= netc_port_bridge_leave,
+	.set_ageing_time		= netc_set_ageing_time,
 	.port_fast_age			= netc_port_fast_age,
 	.get_pause_stats		= netc_port_get_pause_stats,
 	.get_rmon_stats			= netc_port_get_rmon_stats,
@@ -2381,6 +2446,8 @@ static int netc_switch_probe(struct pci_dev *pdev,
 	ds->phylink_mac_ops = &netc_phylink_mac_ops;
 	ds->fdb_isolation = true;
 	ds->max_num_bridges = priv->info->num_ports - 1;
+	ds->ageing_time_min = 1000;
+	ds->ageing_time_max = U32_MAX;
 	ds->priv = priv;
 	priv->ds = ds;
 
diff --git a/drivers/net/dsa/netc/netc_switch.h b/drivers/net/dsa/netc/netc_switch.h
index 982c8d3a3fbf..305f2a92e2f9 100644
--- a/drivers/net/dsa/netc/netc_switch.h
+++ b/drivers/net/dsa/netc/netc_switch.h
@@ -50,6 +50,9 @@
 /* PAUSE refresh threshold: send refresh when timer reaches this value */
 #define NETC_PAUSE_THRESH		0x7FFF
 
+#define NETC_FDBT_AGEING_DELAY		(3 * HZ)
+#define NETC_FDBT_AGEING_THRESH		100
+
 struct netc_switch;
 
 struct netc_switch_info {
@@ -124,6 +127,10 @@ struct netc_switch {
 	struct ntmp_user ntmp;
 	struct hlist_head fdb_list;
 	struct mutex fdbt_lock; /* FDB table lock */
+	struct delayed_work fdbt_ageing_work;
+	/* (fdbt_ageing_delay * NETC_FDBT_AGEING_THRESH) is ageing time */
+	unsigned long fdbt_ageing_delay;
+	atomic_t br_cnt;
 	struct hlist_head vlan_list;
 	struct mutex vft_lock; /* VLAN filter table lock */
 
-- 
2.34.1


