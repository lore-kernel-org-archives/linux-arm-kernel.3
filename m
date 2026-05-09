Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CE8CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 10:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7iUxzA7ktTCITJobp9DaEeCKrOBsWWT1OufM/o8XuEc=; b=A8/vOVImFPydVACv/6C+lf9aG1
	gmXx7BScwLlZliw9kiJ4kMDdbtvDixbKailS08F7TLDHWFmn5o6GpXiFU45egqaIBovDhLbxWZXxO
	focW1e5q+Jha/uNJkH0DSJKSPWv+RP76rOD5XgGevOsLjud9w/D5L24WBVP+D8tohU4dlhFyb/5Q8
	b9/c1aB8OHSwlnGZYSbK9Rl2//wGmNm2Q0VcX2lBUUEp7oFNTO7lvQi1Lg9iTSm6Tv/+XUS7Qn7Xo
	id7KV1atpWNq71+G4Nq/SrcQByttunWdDadqXrvDwxl/fPQAjm96N+csLnWvdDEN0BrsOj+bMfbcN
	moHBNbog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLevP-00000008lPN-2p0W;
	Sat, 09 May 2026 10:28:47 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLevN-00000008lMa-04eo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 10:28:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rY/qGhQzjmyAad3a/vHqCHhMZI0+5MFHTBlxlT48F7BiEputGdrCjux3X2gXHA/F+lc8Ys/zpK6V6jXhKwlmZi141jeF6VIv1eohA2/HzHxsLoZ0HRoltfXok8QoOpRVTgWpwrhJuxZUMdUCaK4BFiGu+sySQnZ3Yag5jqXBUnkasCBfzzDAlk+kbq3GSityiyAVW7TLx1zUq86T4XrQ0xycAabciaNMUqgnq61IRtd6a4X0ZI0TpcOWWmGfu7AycITGR1DnIBcOJg0fiqFVkPqXA6lu+A7LZntl+CZs9SZjybQgJW1w3Mm+0XtqaidPvBo+NunMXD3669FBl49aNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iUxzA7ktTCITJobp9DaEeCKrOBsWWT1OufM/o8XuEc=;
 b=MSwrS1DyMvYMC2QetkqLGuK1uGnEdIPP0TYyzyFR0Xc/j1dxZCNgg/P9UlAWtLGjvDNI+Iehz6UWN0tmXQotkzUraeYZOT1zRWhont/9MayvsbcTFdMbdMOk2bFaaiXslcy4Nv3b6Q2zWjaBPZ4a+MgHH2gMyXQmvFFY7QKNXFgA3JXZdBtix06gOwMlVhcYh8zhSb0IaEDPLEi8eWlPfNmMqzXINeZtoAvPqGbWT6rx+2E3vpL6PhiyZy/rnwkjwhcqtHP2uSddKOHcKGhixqrDY5hhYHcb/uWrUOrefIKMZid4rt56B3a+hao77tF0bUwB5JZpSB3HniRzcxBoeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iUxzA7ktTCITJobp9DaEeCKrOBsWWT1OufM/o8XuEc=;
 b=JRSlnTTGuQoZSiD+UbaksbLKdPv8qXaRRWOJxs1eexBc31mr3urc/jEgo/Kpc2zhie74AkTws+0UmxDAwfV3JjYWj4YCRM3/hl0bSv5TktDlHDsQ2n402Yuz9/5Wl+GoNTlizacJlYLthplsb/Z9TFwntLjS58zWWMvxhLI8Nm09GNjR+neSqi1ZCH3ntZ/ZDkG4tcgcNu71TgtRaymNWLmdn6F2hQWZRtHI/3JvWSIyBk2I2PQ3QVJ3VVEXhCz925X3oJnZou+6if/eozfrwPVn6ObF+ZEee7hEecr/aL1uxYV4EaLmThYfBAWL2eSyYUCFhDNZSXBLybRWL2gKJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by DU4PR04MB10385.eurprd04.prod.outlook.com (2603:10a6:10:56d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Sat, 9 May
 2026 10:28:36 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9891.019; Sat, 9 May 2026
 10:28:36 +0000
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
	maxime.chevallier@bootlin.com,
	andrew@lunn.ch,
	olteanv@gmail.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH v6 net-next 08/15] net: enetc: add multiple command BD rings support
Date: Sat,  9 May 2026 18:29:47 +0800
Message-Id: <20260509102954.4116624-9-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260509102954.4116624-1-wei.fang@nxp.com>
References: <20260509102954.4116624-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To DBBPR04MB7500.eurprd04.prod.outlook.com
 (2603:10a6:10:1f4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7500:EE_|DU4PR04MB10385:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f69b657-42cf-43d0-1f76-08deadb5bab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|19092799006|18002099003|22082099003|921020|20052099010|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info: 0ch+rshsED1o66TqaeOcLPW2hT+5J1EU53q7080Vut1D/q3L/dPdfABUtVHj2B4pQxL3yjHe4BDK+famgwCNpPr7WvD7nz46sh1o5gbfh/91UyeeoczwqH8wfmGjyoFAyX4uTac3gEhXSUwchINl/T2oU7wrjowtCRh5CDGhNZlEFezT1tPkKkk7AXdkJn0JErSB260FRoD+4NBphZJdyu8Je21/+aJIkEE3eu5sSgO92GSfo1UzWKtyZLe81SYRcKpELZGCiHo2ahL5KQFZwiG8xiTSkb1wqPJertRPUf2kGn592Tp2KpLpi4OTPNlq7LPAGJoy0BQ9xxpB2/ea5OAaJw1wk72P2b29dF/j+MZbAKmrudkdE+rBMDndRNM4S5jDursmGWR5SbVHMVD7OXP9Wtya+JWjt7yOaElBVStZrxHV1IwBX4JXcmT8icI/fS1YpzyxjxTeGCfA4GbEJiRKWQSkoOeyc0NA//eGbfQShJTKdwp47P3ka9aQCRMvFMf4fch5TdZq5kfc3XQO6r0oXg4zI9P+L+gE+SCkPK1sKFrG04K2j3wl58pqeEbGn+69K+qyhDBQnDUwsY9GVEEBejFUIvCbvLpFG16FLO6f7Oj3yRw+sv69Wq98xlUIsI2ha2M4ukb2cfF8629nqOqHcENWzijPnJdBn/qWpiB3vsj+Z0ZyyFFKJmz8xT/X0g2L/HqqwXjNzKBor0ExcPE+L4v3GrR4eFutv198dFpIqemuvcXSSzfUKAn5CHYvXwTzGXmibm7HvIs542Ogjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(19092799006)(18002099003)(22082099003)(921020)(20052099010)(38350700014)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0efswHrBMg4bbaO8/UHo7g265dNC6S4qpaMSP1D+GI0Sd6zQiEi2bT8ACGFo?=
 =?us-ascii?Q?G0mH7gmeHHTpNLUSx3C1Y5vwCw1yZQdjUXUsVUXyd3zgUc2hltfDB7+QHWHa?=
 =?us-ascii?Q?RLASWy3Ez/1GdvQzT6F+krTDG89gmKT4pjfu8rTsi2FDRC6OQTVQbgyLDVWc?=
 =?us-ascii?Q?lhu6qRtLRWTsgod1neCR2LkFX1wip5Sxww6O0aO/bRc0sqa+eDJdLdEB9QkG?=
 =?us-ascii?Q?gRVL9yPdfV03XVi4L4azNbpFme4d0ENEwqigfykr1UXaAi5KizoLZRxJK2yh?=
 =?us-ascii?Q?wZem2Lo5QP4q6a+PEWvKvcuMbFa8eT97dVh0oxKYh3T+34uIAX6c3ZgYddns?=
 =?us-ascii?Q?LJXz/y7oyTGM0vrcRM6hVLgutFVhlyTdry4U1XyeezkNF6LovM3AjLH9l8KK?=
 =?us-ascii?Q?W9Gc+0DrIf0q9koSXYK70yH1BQGfSuMN1nLOLvQmV93yQD4ySosu7lcmWwww?=
 =?us-ascii?Q?ND3mavlLYI4bqtzikrsMqYMsv3jRTg1yVTkz1n+7Gj3SmN0au4Uhak0fTEE7?=
 =?us-ascii?Q?3ho1fem3fNLSj8oOY/ayb2EE47N3SJ/QwclCPzveLbCH6A/h1E3Akp3apIZq?=
 =?us-ascii?Q?SgfvvNKuKXEbCED3KvCNPnZJckIzgj7y4T9lvHZX+rQLXDJ8e7DNFBZRgK01?=
 =?us-ascii?Q?r9nyhag6Arw+fyfdur0MXEoPkZqWcpIYkEvTkXcvklEd/njtIFS1zjBBvDRY?=
 =?us-ascii?Q?bJKHABwLxFP4zx6uzQ/xI/yaof5VK2ugR7nClvo3mo6Gpoeps7TSMPR8e6Nv?=
 =?us-ascii?Q?FG8eV8lifmFf+eRMSwnLqicBJOCRYf/m4TLXCIX+kJb+M5PCPEEO7BDFZ8aD?=
 =?us-ascii?Q?OqeI4S1XIdz11D8zJgRbil/mW+UGIryGIJixIib7dlNDuJNan1TRjEdJFRdL?=
 =?us-ascii?Q?lVvK5UUrywswGA0e4mjn5s51NG10yVgmEXkJDnvlmvj4PqHauX7HOBIgBLxA?=
 =?us-ascii?Q?EDCuXs/Qc0CdA+IRgjcp/HuWuHkVzjJb7ePvdQh4BD59KRj2f6LmzxYaoUyG?=
 =?us-ascii?Q?alfT7FRDBCBFbKDa2JiAvgdw/nlQQRSe/FBQQ+52vTjm/8gVHK4G9Fr1CeQV?=
 =?us-ascii?Q?sUX2g078z8nJlCn3C/++SmIn3jV+uDaxosiRHmABDVBJih8uCbMcHwyb0gLL?=
 =?us-ascii?Q?pkeCVhq3MaytTSV2M5wRrq2HBykA8G00Oq69SvvHLDvMPU26QTIymS0q4llS?=
 =?us-ascii?Q?OgfrWaIji+2YYBv5joM3y2Qom8tu4pp/ocNWTH/i43a0X4vxjoWFKldOOoBJ?=
 =?us-ascii?Q?y5XolXrIjPnRgSF/ko+VEvzsE6RVY47rRpCIrCp7TrjzZ/VdJwd9UDKPVoZo?=
 =?us-ascii?Q?fFFx67puY6Z5binzio0lY9HVsHI/BDGpknD+gFv6HSswGWo06R6lz2qkw6gl?=
 =?us-ascii?Q?rkr6Q15194q6Rp8VQDqoiIZxbIuXVc4DmdGv5wk/xLlSbuT9ODZfqmN/vyrS?=
 =?us-ascii?Q?qdgV34raNfd0GK5jYmzjQgnTBk7TRrStPZToEjCP+kZkfOSJjx7GlOC6ewhk?=
 =?us-ascii?Q?2V6+3WEhWS+T/nWKfoOTGnD9/2qrfVPdANrSto408PvmurQQWBzkj8dSfasp?=
 =?us-ascii?Q?aEhV4vmOdpshjVZA7tbNNWDWZV/93KShUO8YypR0DnizmMvgWFTGwZKzHZYj?=
 =?us-ascii?Q?BQ/7akR87SUjYLU3Crmt0t5bK2erHYc69bpyXU9wxTn5FeqLNk7soLWozWFR?=
 =?us-ascii?Q?EpjVH83/VKKBJfWJ8SHt+ir1oIcffLDk8L6kgxid4tLHpAG+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f69b657-42cf-43d0-1f76-08deadb5bab3
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7500.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 10:28:36.7755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YeDiyzUT3TZkVCvzr7/oR3XM9aCQGD/y2mixnCxFWhQM4vQixVFnR3QpwD/UrreEUi2n8GGCcLg9dnCISjUPkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10385
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_032845_076198_30D66639 
X-CRM114-Status: GOOD (  16.22  )
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
Therefore, update ntmp_select_and_lock_cbdr() to select a appropriate
ring to execute the command for the switch.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/ntmp.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c b/drivers/net/ethernet/freescale/enetc/ntmp.c
index c62c6a9d7bfa..c491046fe80f 100644
--- a/drivers/net/ethernet/freescale/enetc/ntmp.c
+++ b/drivers/net/ethernet/freescale/enetc/ntmp.c
@@ -146,11 +146,16 @@ static void ntmp_clean_cbdr(struct netc_cbdr *cbdr)
 static void ntmp_select_and_lock_cbdr(struct ntmp_user *user,
 				      struct netc_cbdr **cbdr)
 {
-	/* Currently only ENETC is supported, and it has only one command
-	 * BD ring.
-	 */
-	*cbdr = &user->ring[0];
+	for (int i = 0; i < user->cbdr_num; i++) {
+		*cbdr = &user->ring[i];
+		if (mutex_trylock(&(*cbdr)->ring_lock))
+			return;
+	}
 
+	/* If all command BD rings are locked, we need to select one of
+	 * them and wait for it.
+	 */
+	*cbdr = &user->ring[raw_smp_processor_id() % user->cbdr_num];
 	mutex_lock(&(*cbdr)->ring_lock);
 }
 
-- 
2.34.1


