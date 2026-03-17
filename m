Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E51FF6E9C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 23:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bJTDeoqx2r+6LGA0A2AbZ34/TiNtswHPakqgqJ61YE=; b=ePlSEXaXp5JbbUIIeKocsCAF7r
	H6kBfCJdzNHvcodocNSYJGtWu+VNZKxUQHhuaJ8HYj/IGtkS2ULYb0oX4Fbcd3ZdMmreYZvZZKX2v
	PLb5ZH0BK+LxRq+9G3jBDuIIxv0P2NyCIzTyrFH6PIPH/ZnTAjvhMCrW0AReTbXIvBxCenZN/Yiqh
	URGeGTS6uXt6yX9IM87eybVrW/WewSl7VD+HaVqDlZ6S5724mINiItSTy+YdUGbz8je5K5DZv3uF2
	Yakl1bU2mXj1vrq7ebfy1E+UDp3qD3TSvvLsTWoD59j2TfLe+kbMNXQX3niMEqlhbT5i27knsy3Ky
	J97BOXgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dUY-00000007NHs-2Qrl;
	Tue, 17 Mar 2026 23:06:26 +0000
Received: from mail-northeuropeazon11010027.outbound.protection.outlook.com ([52.101.84.27] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dTk-00000007MEC-2aHo;
	Tue, 17 Mar 2026 23:05:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YM1E20D/dj/+2jj2Rqt7EQ0E0+PcQwYAu1HR1RofTqo0WUk4It5W8UGgIr9iaPUs6uMO3jmFxgdDk7BXvXBl6Jq5OA/l+1aSPB+dwi9i7Z28zkg6pSReZ51kIQwX3pFsL6LNZxKHetSY/QOG2DV6I/YWk+RNiduE70oR8HxGR8r0QAFYM0EGgLlZVsvtYUDnWxwBRmIR799KM1a2Hxoff46shFmIIrFz/UHYUS5jSy5VxZyZpRdLG6YFzVXUkC52m78BLop/Yx9gyfF1tqd5OUTLyXd4cdMYhDK5G2MZr8V+o0q57IDOfI0NNajFUUlHvKlhrZC3t62pw4zPdyyHdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bJTDeoqx2r+6LGA0A2AbZ34/TiNtswHPakqgqJ61YE=;
 b=lh3NTMt4vBF49ijz9W6cPD8je3TJq02YoKNAbtJIcJOQr6yMa5ieUKyXQ8XsddMeea4Tf5JDZxLBPs8P3GcXCVTw6TQvp1en/pkdSOma6O0uT9wjF6lEji07oHsu2q3bC0HhnlA88w4c/w7yV4IRt1rv55vyESYf+7KBE12HLIdcgo9lZYRXHzS6brwevEdxLwc7YRn3nyvESsljh083h//7/KR6n/FEkk4pfQdFYaEIi0In7n7SC2s6A/pc43Bgyuw3jXh/7k7LAMAWRxfLpnKFHOZaPFVUekXtILasjkqusFkKg/qW+Adn+Wr4LDnL+VvvyMc50fhlNSYBwIAHlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bJTDeoqx2r+6LGA0A2AbZ34/TiNtswHPakqgqJ61YE=;
 b=NiwyGukVgVIzOcwCFVRY2ipE/knNp4J27f8ffLPRJosZ4XMXYxmqxJVzuiaw35Yl6ffmlWySThmfvDaNCFvESqU7ZRhxkwLGFT6H1W6X1lVS4OyfBZ7KnPbHyi104wVgFTJyA+JSQuMaGJIE29G/S1tNogVhKZfbxud9cfbTLp5tb/M8mDsUkyR3StPD9eTO6ACAuR1ejnMsI/oSX48S7FMM9cAO/u6fHrOtiwnq/3yubnKp9LTeDTowFxfqoyCn35ERwU9GklsbsOz9TfXmMP7P9L9jtbJy1y/CeVuDgLdjFs+23ubc2zp1Buz25zgxygfv+howflhUnR5v8xQc4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by VI1PR04MB7022.eurprd04.prod.outlook.com (2603:10a6:800:126::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 23:05:29 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 23:05:29 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v4 phy-next 09/24] ufs: exynos: stop poking into struct phy guts
Date: Wed, 18 Mar 2026 01:04:45 +0200
Message-ID: <20260317230500.2056077-10-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317230500.2056077-1-vladimir.oltean@nxp.com>
References: <20260317230500.2056077-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0102CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::29) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|VI1PR04MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: fc625275-68d0-492e-68c4-08de8479aeca
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|10070799003|7416014|376014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /yB9r4oovnzc1kx3G0wD7Tkap/WNSBxKwLJgTf3PljaWnWL+X3k51wGLyoHncvSN5hwyr2bC7lxUYLynUKkJ8VyFvH0hdVoGbhF8gP3VMJifSZTinjH5a1Upoi0Awk824um7IpY55DOyiR1hP4yOfv/nRq3ewBrwEfSbreXVUGRjJ1fMJ1R9iRHTFhuUsg8fjReVEbNGNZGJIQKepywhgJOoCb/mJIa+1AhECpaWRNyqp/+idH4CtfwDs9B1l5XKlgeo1xvIWTI082ZFEsFyhXnDGDFax/LNT74gDqU+sDQUBTWveB4fYpPWAdDHujILZMS92lvwjfKtqIdjju6byJFfELtyh8oVzkrHGGDrdtIzhLEccVUcF+bdtjDXOQ19dAxCnaWj8DkQqYuUoXjJgaiF7PtB+lbZ/YVu7Upz05guJixQaunn7BXYs97na56nTvgIxxVewngy6psvKR5Uto/a/joYV/6KcQ4yPb1Mm4MIk4lx7GMhhx1nh0jauY6+dLwSMQMWIaJFG6RTycGot0l2T7rkymAn8qYl74RkVjmNuEl9XYVR9pbvKyDABDhI9sDxiU+s3Hv6YvTvFotro4O0Cbj8ASp4CTjd8pLGLGjzkClXloVUqGHLfeDADPJcMJFdkHYeuIBfoRIbWnoMAXehbQRFe6bhKnLBwg9i+j23DdKbxm1Ep3tdVwlVlULzuLrOY/giMlHUDjmgE9BbahPibyR21XX/sTpYyzlm5hI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(10070799003)(7416014)(376014)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a1p0F/nO5nYF1v4LO+A4In2eZzSaH3iXhry1y7MLw6n2hc7PYHnSEgIGL6xl?=
 =?us-ascii?Q?xGGVKXuWjfjGUusvNhr6RGX3YowbmKQdi0aNdjM5sSwVBRvtnK1CWG+sTShi?=
 =?us-ascii?Q?/X1RwwFb8jPSYoYBZyPynFl6B0wfkzQ4pgHoxGGoZTUY6+V2zy7BgZlrWgRI?=
 =?us-ascii?Q?QCOugLHKURy64YXs7EviKya81YfFaNA02JxXIT5ll3jjZd2q+HijMeuXQhEw?=
 =?us-ascii?Q?FMWKX3vr0fzNWZ9iZoDDrMw6utrWRJi6Drxvm9HO8nOmXPNKYytHhQjJgZ4I?=
 =?us-ascii?Q?IDs8dtT4gBp/9mVw67AZGuQ/w9U4xmIhEFqODWMdYgoLMUzfLf16zGorJ/C7?=
 =?us-ascii?Q?ZojGNtx7ErYtSq1dPpTZ3GDqkx+ykTe/DdhjFimExeIBfHJqrlq1vIvAoaF2?=
 =?us-ascii?Q?rGnV/UWQbvb7rvIJXJtUh4aUTqxm+plGyXrCo/xItBpo/1MsBdGwIB3C+dcu?=
 =?us-ascii?Q?5Iqia5vx25twf967KTEpM96CoyydQHBBMgn/79bzx5ecbLzzinc7uioMe8qs?=
 =?us-ascii?Q?OH3Ohu8pX7k/i8Gw5WxBPYMH61aJRyaWMbJZduX2Hquj19k0TygIaDNC0oWM?=
 =?us-ascii?Q?+3+oFzusXjGVGcJxqepjOGzs0I82EjM8tQ/RXNAXwtFHQ+xfYht9nk0upmJ7?=
 =?us-ascii?Q?7T9xPD/IAVYZkanOBzqGlZ2atsXAhb70jxOwrSuSeazU2fJZPE66cK8QqNiW?=
 =?us-ascii?Q?6v4KxhiAubTqPXy59WI93XY/8RQt09ZW1rin4SY+kWmevyGVHCSFfmi6LNF6?=
 =?us-ascii?Q?9ghmeddCQshv+SyD8YNSo79ZQZiI3tUsPZHyGIVKqGtHMvZGm1JGvrdVZj5P?=
 =?us-ascii?Q?29zXjkV+vJXmtV66vapcDbd8B1s5XU+BydHQYngF3Mco37wCg8/aNN9hba+O?=
 =?us-ascii?Q?MCt5X/iLdQ4NljDyrdlmSzrixO+ZDAsCJusc6BHE7Lxb63eqQrRWgvHdJiy9?=
 =?us-ascii?Q?vgychfLD5JdmbnuEjOQQHLn9+4/d6FKA+5v0SPbFxkMn/KzAYJPLdXont7ab?=
 =?us-ascii?Q?bSwmaj+KKv+11edG0+gHGs+RHqwOeTbGOjX1pryqQulhaeggCQb6Ubt+Wri4?=
 =?us-ascii?Q?md1y/R9pcy8quAefo8SDs8yXp36o0i1ES/zH7BvrDa9UQYNFTtCThFj3HB62?=
 =?us-ascii?Q?+2puMG0EzjuBOba5SpZRVglJoLNbhcb3kv27oahgjuQPVCaC1/CE3Z0cSUv9?=
 =?us-ascii?Q?fJoS1DzxUmP9qI/CbUpglorn57rZzujj05fmpuw169Zpy0KHe5Wp+S5jLLly?=
 =?us-ascii?Q?9FwstT2MgQvHTk/O2Wx+c8BeDqk607RW48fORsoFYPSeSM1ed5CpdWXljV6F?=
 =?us-ascii?Q?vCZhd3WNh5xx9am5KKBU8jRzHEP2fedDUYO3tS4OxeglZ7ksOItjQjpCZISy?=
 =?us-ascii?Q?e+Q951YSrDPXjMFdW3/KbuNxv4hih3MbIUwLEdZtfPzJcPmbZuHaoQkNaXLg?=
 =?us-ascii?Q?iQPmFCJvcJllp6a6zqbnMgj98/h/eWDHTlZe2gDUqlxR7Z7OL9YZc2GDGxGJ?=
 =?us-ascii?Q?ZnVrTUs2Hir+5OlZ9AI11E8JtUMRRA8nLmKxUFiY/aNq45OOCLjm2yiwXql6?=
 =?us-ascii?Q?3ABeUf6PjCohGcHJs8/qaV6wSmcMrjNaQd0uytYqVPdd4tWIGzDd7do0HCSL?=
 =?us-ascii?Q?KSkdcmLu3E1KwYlQCIGfvOL29C2s+EnBBnhk5gWMBs4G751nUUvaiQ2iR1B8?=
 =?us-ascii?Q?VtepDs4MUQr4jtMmIkimnV6DdT0Srst+x+WKGlIxwDyj07XRIg9FZOS5By/W?=
 =?us-ascii?Q?xIxdYwWRImWvFKTrkkrzhQXHM6h7ANFyofXhFnt4Z6yOrsKmr6e8nP+XYSxd?=
X-MS-Exchange-AntiSpam-MessageData-1: s/wLtj9lh63lZv2y2otbjI5yYNelXvFMD2M=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc625275-68d0-492e-68c4-08de8479aeca
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 23:05:29.2900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5kEdmgdsjK7y1GDVvoDywjaKiy8JfU+Mtg15o8UnShsyoljDKytXgwAq+K4LRJV0Ww67kHEvTxmxP/ZRHfuAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_160536_661190_4E3EF31D 
X-CRM114-Status: GOOD (  19.25  )
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

The Exynos host controller driver is clearly a PHY consumer (gets the
ufs->phy using devm_phy_get()), but pokes into the guts of struct phy
to get the generic_phy->power_count.

The UFS core (specifically ufshcd_link_startup()) may call the variant
operation exynos_ufs_pre_link() -> exynos_ufs_phy_init() multiple times
if the link startup fails and needs to be retried.

However ufs-exynos shouldn't be doing what it's doing, i.e. looking at
the generic_phy->power_count, because in the general sense of the API, a
single Generic PHY may have multiple consumers. If ufs-exynos looks at
generic_phy->power_count, there's no guarantee that *ufs-exynos* is the
one who previously bumped that power count. So it may be powering down
the PHY on behalf of another consumer.

The correct way in which this should be handled is ufs-exynos should
*remember* whether it has initialized and powered up the PHY before, and
power it down during link retries. Not rely on the power_count (which,
btw, on the writer side is modified under &phy->mutex, but on the reader
side is accessed unlocked). This is a discouraged pattern even if here
it doesn't cause functional problems.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chanho Park <chanho61.park@samsung.com>

v3->v4: none
v2->v3:
- add Cc Chanho Park, author of commit 3d73b200f989 ("scsi: ufs:
  ufs-exynos: Change ufs phy control sequence")
v1->v2:
- add better ufs->phy_powered_on handling in exynos_ufs_exit(),
  exynos_ufs_suspend() and exynos_ufs_resume() which ensures we won't
  enter a phy->power_count underrun condition
---
 drivers/ufs/host/ufs-exynos.c | 24 ++++++++++++++++++++----
 drivers/ufs/host/ufs-exynos.h |  1 +
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 76fee3a79c77..274e53833571 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -963,9 +963,10 @@ static int exynos_ufs_phy_init(struct exynos_ufs *ufs)
 
 	phy_set_bus_width(generic_phy, ufs->avail_ln_rx);
 
-	if (generic_phy->power_count) {
+	if (ufs->phy_powered_on) {
 		phy_power_off(generic_phy);
 		phy_exit(generic_phy);
+		ufs->phy_powered_on = false;
 	}
 
 	ret = phy_init(generic_phy);
@@ -979,6 +980,8 @@ static int exynos_ufs_phy_init(struct exynos_ufs *ufs)
 	if (ret)
 		goto out_exit_phy;
 
+	ufs->phy_powered_on = true;
+
 	return 0;
 
 out_exit_phy:
@@ -1527,6 +1530,9 @@ static void exynos_ufs_exit(struct ufs_hba *hba)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
 
+	if (!ufs->phy_powered_on)
+		return;
+
 	phy_power_off(ufs->phy);
 	phy_exit(ufs->phy);
 }
@@ -1728,8 +1734,10 @@ static int exynos_ufs_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 	if (ufs->drv_data->suspend)
 		ufs->drv_data->suspend(ufs);
 
-	if (!ufshcd_is_link_active(hba))
+	if (!ufshcd_is_link_active(hba) && ufs->phy_powered_on) {
 		phy_power_off(ufs->phy);
+		ufs->phy_powered_on = false;
+	}
 
 	return 0;
 }
@@ -1737,9 +1745,17 @@ static int exynos_ufs_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 static int exynos_ufs_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
+	int err;
 
-	if (!ufshcd_is_link_active(hba))
-		phy_power_on(ufs->phy);
+	if (!ufshcd_is_link_active(hba) && !ufs->phy_powered_on) {
+		err = phy_power_on(ufs->phy);
+		if (err) {
+			dev_err(hba->dev, "Failed to power on PHY: %pe\n",
+				ERR_PTR(err));
+		} else {
+			ufs->phy_powered_on = true;
+		}
+	}
 
 	exynos_ufs_config_smu(ufs);
 	exynos_ufs_fmp_resume(hba);
diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
index abe7e472759e..683b9150e2ba 100644
--- a/drivers/ufs/host/ufs-exynos.h
+++ b/drivers/ufs/host/ufs-exynos.h
@@ -227,6 +227,7 @@ struct exynos_ufs {
 	int avail_ln_rx;
 	int avail_ln_tx;
 	int rx_sel_idx;
+	bool phy_powered_on;
 	struct ufs_pa_layer_attr dev_req_params;
 	struct ufs_phy_time_cfg t_cfg;
 	ktime_t entry_hibern8_t;
-- 
2.43.0


