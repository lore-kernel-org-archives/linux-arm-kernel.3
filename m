Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EB5D58CDF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 06:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHz9v9K9Ofbaily1wy7mKbCK1D9rxfOcsTvNbsPGbcU=; b=PHmO8L40oD8HSIMzoOtaj4Ti45
	LfxgKrX71ivCC9y8Kz5cVVMReIELL0M+czuEVKQPIYuFM97zX5+J6Ko9Kqc86cvdc3soantVWz/4Z
	W5+kyHKQFbddj6u3jCV2n9baWUKuVTM6wIp6HTcgu73vNGKitKE/JK3H24J16Dyg7blezyRsD/z2R
	6EjCx6zGwZGZsPr6UENZxP4MuQ6sCcFbX4fTzNPlO7w0I/QL9EA9dUnel2Up2bxX2Uku8jVlwPpTT
	KruX5wmsATpmWXEhouFw/CDYdmLc5vDLAKh3l+UAfTqI7D5T+1GLUjcDhZ2FkoEm+7s75eLlTkr0R
	RK75hBDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4YRV-0000000G5aB-324O;
	Mon, 23 Mar 2026 06:07:13 +0000
Received: from mail-swedencentralazon11013045.outbound.protection.outlook.com ([52.101.83.45] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4YRT-0000000G5Xg-1iRy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 06:07:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8PhvL4LdwwG/0BPyuMq42PciWs+7Is8KSYYl1KPssXj1B1riFlOUQyOcLQvzvGfOOwNsusCHRWUauSuRokOgT3MFW2jJZcXIhIWzS+aav8E6SJJROggVYUOhJbCYuQXxZO8xE25uboS/Eir4qiORQn/rQYfYXveeWzz1B+XYl76cqhegdmEb24BDmGJ9eTErgEKg0akMEfc/szjXUBiFpeEwc59veSFxUwMR5rurF2ya8YNqjtjVNv32pSM+l2WuicW64hh6IRG0YNI0omFQz/vMlfrGqljy8qyNtLeeuhxKcJcTrgug/O+uL7L+coMa31jr7S9mCXAxUgRENAGaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHz9v9K9Ofbaily1wy7mKbCK1D9rxfOcsTvNbsPGbcU=;
 b=ebkb1NoQ+/0dGFbJYDsMH4JbUEyA+zLxRP7oCvPWQqfGmeG65PDFb8PeawgYxSJCoSonZRo4WO3EsqgDFY5SysXMBy9sHAK6FgOzNXyZ4amUQGMDwi9o0shygcOsBwKGBVAwBRg2sv1kGsB+0cnfPMVqtCxPlHz4VHFHHQZm0M72Ngp9X/QQahe+kY2UDy+WO0ecMrDFstzL9BMNz4cw0/swGu2D9xzuVe14wjjasH+YTjM1+y3wes4pwobMnysUAEHYWYkK0zG05qCWIAH9lbkD8dmaqzXZ1CqgBpiVtNLHHNIF2rAcybjOWWpwI1Ib3bh5hdWJdeQ+avKSQVeEAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHz9v9K9Ofbaily1wy7mKbCK1D9rxfOcsTvNbsPGbcU=;
 b=kEJG9YlD1KszpDfqZ1zTtUd9jhWKPJPQix/AJvvSp8OhaF8BS/ndlYhFCS8odv0hMe60q/8M33yf9CKQJl4YU/IGfEX/jLs14VHM+W9XmE7ydmVKUomPAO1HNdfNe00JbKDWjgN+MQtreD+MR4qyTPUv3jmw+W4sbc1keMw8zpamU91tBcA+zimuxJW4Ue70FueDp3ObXAjAv9eI2CR2KEoTUXDrR4zlBA5r/rtGJE/4MHBQvOwyzX0p40sjG//9ZPlxO5i6qE7FCiU+/BhMBOVG/fItilzPtQtloX4pzKfHx30lHxkMr+o+Rc2mOyvee2DxdUraY+el38Hx3+Y6jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com (2603:10a6:20b:40a::14)
 by PAXPR04MB8911.eurprd04.prod.outlook.com (2603:10a6:102:20e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 06:06:39 +0000
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::dc5a:b0aa:4a1b:c55e]) by AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::dc5a:b0aa:4a1b:c55e%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 06:07:03 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	f.fainelli@gmail.com,
	frank.li@nxp.com,
	chleroy@kernel.org,
	horms@kernel.org,
	linux@armlinux.org.uk,
	andrew@lunn.ch
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH v2 net-next 08/14] net: enetc: add multiple command BD rings support
Date: Mon, 23 Mar 2026 14:07:46 +0800
Message-Id: <20260323060752.1157031-9-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323060752.1157031-1-wei.fang@nxp.com>
References: <20260323060752.1157031-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::17) To AM9PR04MB8505.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8505:EE_|PAXPR04MB8911:EE_
X-MS-Office365-Filtering-Correlation-Id: 65acdd11-4823-4e04-9522-08de88a2677c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|921020|38350700014|22082099003|20052099010|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 99hFLW5cAjGIAsqd3nVrLcnOUQcTJ6QCD/krsmmOde3iIh9sRMxDKC9Yagd9oRp/bdlHuD/cLMcWbBvQx33rzyF395eYc3GAA9mb7VJn8zyqhRx9Px78p3k+nKhAFnOWRlAG9tRc6CJqBJxL+w/lmmR+L3FXbiWwbOOR+PKJldUCqgmDbXqoUbURfGtzvkWHGxxKVRqpLegQtRl9XfiOrGSccWa0hMInsWQhjCWh6O+1xnnGYCgf4T309D8eN1snP/FJYVSguT6Fqjh7pG3JwysmOi3b8e/4ht2hkLu2/BWkA1VJcQT00F+5OvAazRLMxjrBR2pLtLQX5uqxdQNH22TQrWRkYBEmnje+hKmmsoXBZMDObwoz5uhln643uYwv8D1LNO9TbrH48l7yBoM5qkjJ6odAz/Ws8RqOlbg6baD69Fz0sE4pXzPX8w3fOqSI1aZG78b9mtZGNXYOQmlrJF5BTmmi6sE6HFzTZzY+EQbhux3MO9n7DQw7sjVNgPSaf6Qs+XxNXqTuNmfpVJHRAUfpUcPVIniXJLwHeMTFmMt76MO5pQW1Nlj+77Fcf1wEMLsbanhFKWqJQY6zdn6enqoKDuo5OauA6dXmqeXL2u3l1d0ClWigXN0uzTW3WYRBzKT9Ynhstd461W1bx5hZF3D5/NCzBllg0uYOO3ioCs5AtN2RwO7XZQ0wP8dqU1Tm06rMDh+jpUiy/ITl3YVbCARQZeSJ1YyD/7uMWbgcGW1uqDOYuYXSf8J8o2NV0F67ZBdYSsYVIroJ+z4EKf2QmEDvptmWUSCGp30v9o8TSSdsOVgLZr7BM3P2tsllOJp/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(921020)(38350700014)(22082099003)(20052099010)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g8jQa+vZaSpDeUv3mIaYtQsa90kqIpkdwtO4/ETcXOMdPQD9vQqbUIXayWyf?=
 =?us-ascii?Q?m/ETAciiSw239PnBjW9TLkJ4ULDP4Dg7sqfMlbp7dfiystrBIgTd0LZtcWKB?=
 =?us-ascii?Q?dHEsUv/m7zXS2owuOJuhZu+nDXKLsJ2fuzF5pVlOcTYPwEtvuSmiEvPbURZk?=
 =?us-ascii?Q?cnM9IbbHZAqCYJxgP9bhW/xm1oapxmf0/hQDgYVF3hmzD1XyBaZk0dovOl46?=
 =?us-ascii?Q?mWYk+d0q9x0mcdwGrhVMgVR9AvMALbZ+PleHqawKa8yz/3iEu2PDDnUBk5Iq?=
 =?us-ascii?Q?K0Q8LS2Uz2fwBRIZ04N5Jqqn8+TdRHROeS2CR4gf6m6M8t2FJzV1JA4Z64yO?=
 =?us-ascii?Q?mDz5L7L0QlGapxR0Fpn8VToG+J/qxBl6HqETzFv6EUFME/isPaLGtbS2yzE5?=
 =?us-ascii?Q?aj+ZsQWiCj/mTJbeQPara4hrXezM3qZRsEKmHsZ7zJnWrXsAJ/lD2kRICK5I?=
 =?us-ascii?Q?/4QWHFWdQwST1x6cOh4Wwiyr8jw9lRaPPPiXrJU6Ok3fNnlB2Lyrl6pR3mTG?=
 =?us-ascii?Q?CzdpYAvoWwCZNepen0Aint8MytWhPZq/TUxaaKL9DMsi3AhRJ0wd4OWS+/gd?=
 =?us-ascii?Q?87DM1lfvhcospEjFnPM1cO6MNSMkOX4ciJo5NI00VG6qq7NS2bvMecA1WcN8?=
 =?us-ascii?Q?DG7iYD4bAYF15vqIZZnTG6rUWjCSmbeGPP0nwDnOmd5w4RTj/WlVj+uCzfaF?=
 =?us-ascii?Q?xHTmUAFRxkZmZEHfifx/iDVEprud06WQKNFaecr2NpVvz6VagiPyEc5+f+XS?=
 =?us-ascii?Q?XZz7TCqJA7Saveo8gMrH8I2xRn0ZhBjr8mxl94MacCKKBm4bLPw5/hCZMB73?=
 =?us-ascii?Q?K0VMRYaBN/Suox/9UNMDm4RMc1aMuAGaY/8FwLzTYR7sJQ9AJ7Jgj6g0Zgcd?=
 =?us-ascii?Q?VU/MG5q9lMkeeRUInh1h3jPGTb7Ghu9X/z6qxCMIMzklOjM8Dkrv28+Bj4yX?=
 =?us-ascii?Q?SLC2bAaMTO5lAmAMPz0BwG7q/bZKjQjT7qL1DiXO9SADK/Uz68BXuPWdC/4q?=
 =?us-ascii?Q?dgBShn+AUg3o1IuVf01CFr08OhcT+rBoyBu5kQpHRMW0ecNE363uTZ0yUKMt?=
 =?us-ascii?Q?cp1YreO8OdGm9AHXEeF3VeeNnFb59lFqcbj5vCmNdjRZGVe+rZ5Og0j/Br7M?=
 =?us-ascii?Q?ajcgnGqPCf4Xz5LmHRYnjWERDwjwQ29PYDxfH6cG6sCpkkhl90aEonSqFe1J?=
 =?us-ascii?Q?M+58ZkH27RG0NmQ/BBi0FDA531N0zUVS1l4MFZvkbvS6nJUpWBog/j3NIYIX?=
 =?us-ascii?Q?2CSLPqXR8XqLCAUIKceQbwN7R2M+nSpkNNTct6zUg6wOHT4P6rwfW9rZHk7n?=
 =?us-ascii?Q?J0luBZM1OOKa2uoT53KKozB5hrkIEaOc0Cp+XFpiVInPVrlF81ZLu/YLtdAd?=
 =?us-ascii?Q?RYtmoxwWAVvSjOFwhZVz7/2qyO1n6/kTLMhB04MxGWT9ldblRwYPcJwE9icr?=
 =?us-ascii?Q?y+HYTDVEgYBuedXSQBr6GiAYTzYewJtde1WLSXh7lK6kfIPWY+wBU/UEJXyz?=
 =?us-ascii?Q?JTiecAV38Ui9jivUt+g4ICUbFGWYesJMEt8xzOKSJuPkfv8dnPXgWnC3caf0?=
 =?us-ascii?Q?0KOSgNPiusVZU+ryLGIyw+5w2gkcPmkH8VOoboyMYoCMDG5OGqFE8pQXFgxU?=
 =?us-ascii?Q?rY/lDhntPDcexCDbT613DzGPNhzv7C9NTsMuGpfA83tAwwc5d0fGrQ4s9h3I?=
 =?us-ascii?Q?Mzb6KHlPnVxN0iSRa+Dhh/zuLwEDf6QFRA1EuIO7pmTFy51C?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65acdd11-4823-4e04-9522-08de88a2677c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 06:07:03.7098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w8YptfcHJddzsgARD66lJiLodKaqceC0fLvSoDzUjsH0obnBSRfXKLXcz2A5mc1P8Gp4GnjP+ficQFu5/1FxHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8911
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_230711_464076_7C838907 
X-CRM114-Status: GOOD (  17.33  )
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

All the tables of NETC switch are managed through the command BD ring,
but unlike ENETC, the switch has two command BD rings, if the current
ring is busy, the switch driver can switch to another ring to manage
the table. Currently, the NTMP driver does not support multiple rings.
Therefore, netc_select_cbdr() is added to select a appropriate ring to
execute the command for the switch.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/ntmp.c | 27 ++++++++++++++++++---
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c b/drivers/net/ethernet/freescale/enetc/ntmp.c
index 9fc3422137fc..fe3185199c40 100644
--- a/drivers/net/ethernet/freescale/enetc/ntmp.c
+++ b/drivers/net/ethernet/freescale/enetc/ntmp.c
@@ -117,6 +117,25 @@ static void ntmp_clean_cbdr(struct netc_cbdr *cbdr)
 	cbdr->next_to_clean = i;
 }
 
+static struct netc_cbdr *netc_select_cbdr(struct ntmp_user *user)
+{
+	int cpu, i;
+
+	for (i = 0; i < user->cbdr_num; i++) {
+		if (spin_is_locked(&user->ring[i].ring_lock))
+			continue;
+
+		return &user->ring[i];
+	}
+
+	/* If all the command BDRs are busy now, we select
+	 * one of them, but need to wait for a while to use.
+	 */
+	cpu = raw_smp_processor_id();
+
+	return &user->ring[cpu % user->cbdr_num];
+}
+
 static int netc_xmit_ntmp_cmd(struct ntmp_user *user, union netc_cbd *cbd)
 {
 	union netc_cbd *cur_cbd;
@@ -125,10 +144,10 @@ static int netc_xmit_ntmp_cmd(struct ntmp_user *user, union netc_cbd *cbd)
 	u16 status;
 	u32 val;
 
-	/* Currently only i.MX95 ENETC is supported, and it only has one
-	 * command BD ring
-	 */
-	cbdr = &user->ring[0];
+	if (user->cbdr_num == 1)
+		cbdr = &user->ring[0];
+	else
+		cbdr = netc_select_cbdr(user);
 
 	spin_lock_bh(&cbdr->ring_lock);
 
-- 
2.34.1


