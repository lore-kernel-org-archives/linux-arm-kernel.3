Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D701FCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 20:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ms7M9jxONd7FfxjQVHp0fG0/xnsUDgpNgiH6j9GNPtA=; b=nSyLMSKwF1uYAwIsvX+oBzm/Wi
	Z3fpoCmTD4qevTHOSf1lcuOUgfIqpybJB2Y0SO2bkptgMBEt5CgDaDefK33tS91K5RW+J3Nynpp/w
	y9y/mriyxsOW7VzaX1Yp5lc2nwDlK5MK9dR8eoVH8F3Sj24g+hhbTYQRlSPuKdZ3PXaaXh3fjtEhw
	Jp8DqDd+dR7s1Vrl+x7aloJB5Gza+S2oQZs9O5sE6PT3HgyE4UDtFYK9qDlvQUnLp1jhJTPV2mKkU
	ZzcaXtATcIxTAkGvaKmxT8iPM0mTG2JnarQ2hblOVp/9u3ya+ArpX1zZJtHIGWuOMg+zAWcK+afeX
	AZL5lGqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBI4E-00000001Zgv-2hVf;
	Mon, 28 Sep 2026 20:35:18 +0000
Received: from mail-japaneastazon11010031.outbound.protection.outlook.com ([52.101.229.31] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBI4A-00000001Zf0-2slV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 20:35:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDLHQJMAA0tjVRjNe+D81UJhD+imYcN2zpnXUoHl0JezzvIbrCsnFaFGCiaDczrYkGjepz6L1tuHNQ7tl86qe1SOVU6EvM8i+7ZbsQRiQjwrZHsFQrZClMwPh4hQpvJFC6lapO2dsFkMU9pcyG1mF+vB/0WbbMSGqCc15TQVlZYpeZYTCx0kx4aBrt4Yf2O5ED+dy0OMiEeOc5IFZc69js6+yntEeEjCVry+PnXpOca0pthTUv8wWm6hoxdrkh9peh1aEQVfk8G/+WHy1lTrrCzG0CYkhNJrGS+XHuJnIeKjz/uAHjInpInE1oPMxusxHQTv1GRgII90tMOJhaRolg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ms7M9jxONd7FfxjQVHp0fG0/xnsUDgpNgiH6j9GNPtA=;
 b=H/R7fywC2zsGxuHOwDokw0D4vMXilgOa4kL8SVQP0JT4u2lZJ4uGz4X+QmcIcTx/p/NKbfPfNjDdKQyMD215b3Igh4fJPyEqm7zxKmeGx28IUQcziER80g7RS1KYSaPDgV6oykmLladVAbhagW2P/E8wWF5mZtSDlGUYzBaKNCyYpNiyf5yykCVTrts/rAYHYCaqKgryb9CFIbL7zH5wiq782etjmG1plc3jmtMnkoRf8GcoVRVwK2+wbQWePYVZviL1x3XnHLyBoYaf7PkR2X+kLBE9xtORZmCVa0hzV5XWSC98hqzj4Hd5tIaXRN4ObuhQZL37+EXI/uWFfDP9hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ms7M9jxONd7FfxjQVHp0fG0/xnsUDgpNgiH6j9GNPtA=;
 b=SiDNJlmN6BdPv/2QQZOH92v21Qphh8qFghAVf3WS+dlUhKaixaM6TXhdz/u3NgK0VRMBD6AOUG2WMy1336SjQQg15lXGBDoc+e/buOUcVttx7GEY2tt29guWfW1IgB468cnFsdyo7jEpP2/j9n24XX4MK+X4jiXbrbcDdmCibKc=
Received: from OS7PR01CA0290.jpnprd01.prod.outlook.com (2603:1096:604:25a::15)
 by TY7PR01MB13577.jpnprd01.prod.outlook.com (2603:1096:405:1ee::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 20:34:51 +0000
Received: from OS1PEPF0000D215.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:25a:cafe::12) by OS7PR01CA0290.outlook.office365.com
 (2603:1096:604:25a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 20:34:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D215.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 20:34:50 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.32])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 4EBF1300026E;
	Tue, 29 Sep 2026 05:34:45 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: maxime.chevallier@bootlin.com,
	recv.jo@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	jun.ann.lai@intel.com,
	yi.fang.gan@intel.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net v6 0/5] net: stmmac: Fix double VLAN 802.1ad tag handling
Date: Mon, 28 Sep 2026 20:34:36 +0000
Message-ID: <20260928203441.34876-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D215:EE_|TY7PR01MB13577:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b3424c11-bcd2-4dbe-9802-08df1d9ff1e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|82310400026|7416014|376014|36860700016|13003099007|921020|6133799003|3023799007|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: /c5bNo4K3DhBY8+c3iumH/Gix9dAJ/p9+bsSa3X2KOZt2TpY/mNUos+rKtW4h82nygioRGVGsumzbK8QSvXvAFgxkPchhxtPSu5RlzXGqgljmG0IzDIXqblYYS+4h4qIZj7KTOKFJ94IByFj4R10Ugl+59om3H6GQTu+oIq7WOg3+ALCpyBTju99lxUg8AtjZOx5ksJGdD6cLWNwTvqTL5+6M6HJQEaGv0IneSO17Tzih2WP9NYKdMH8WJX90lK/HGEvGxGbjOELVD4qMUugaS+xpzcI4h36RA0B6gauW7qCcqICpArOxs3x9rGhLt2aEBHpyEVfg9Un/9YzXrUlU9oME+6Gf9I7Ac8tKuTaSL7MZapI5k2ZDYkN8lRQwQwqxHZN1RnMF+hMFSI8HUoHz0s6kySfdeTvSkoA3U+zTD12B3U6heUr3Nkul5N20zNmMXcL03b2ibY0itYkRrW3bFTyt19picw4yziXz+FQfWhxJER5q5kdSjqDyJc1Q0BShBvcLGF2rZPw3tMMUh4k31VZ0T8LGDOSuqaDAS4Ln0qTiEkcMHc/OLeT1+OZRlQR5amMykhiQkG6h4RJx3SnnS+Y/w7RZEklf3fjis/wQ8K7+CacJogBupcYukqH0TGMwIKHafQSWnWPjzWCtQw1L7KK4758X4VIiXoLG98Li6tj/zKPxUWrtJXEw/TtTHEfCXMJd29+UYxZJjXSfUdkDR2dNp2ht/iZ1OwAFYjt6Vc4ufDr1OExw/C2PtndrE/l
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(7416014)(376014)(36860700016)(13003099007)(921020)(6133799003)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mI33/IcbhclehTdiGaurKnMQxu7moJsZytCuh5Y9oLQYoOZ5NI+nYGAYUydJ6Pl9f/y4RMvGuph1sTGhj2vE4DvGnDrK0g81phRcKXffarXRljURb7gMnB97ZJxlL4siKdgLtYXNUgfgXKVnea7kZwVJL6i1J4bYTxLJHSJ/X1Roztn5Kp0h5MfgiHZ26jLsNLIMw7MUXAZm/6ktiGMBbVvWytjqW2Tf1TUft59WpLRk8dtkkTqFnqbfcPFrxJPoW3dkZUEa7hkIEqSV578ePnSRE5988ef8hI6nwGQc51RPfFqWItH4H1AZDCiAYFZ5khKbeVaNFzqaTxUktvBHJPu8lXpVv4qT/hL8Xy6lKznIRMYa1LNePTyHA8bPujwtT0MePkReZ0PfoofyGaRYP+rjHNuMazlNo2MkxAZ0hkDg/tABhB/zbcyTU0Tr+er8
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 20:34:50.4695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3424c11-bcd2-4dbe-9802-08df1d9ff1e6
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D215.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13577
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_133514_871300_CCE9C29E 
X-CRM114-Status: GOOD (  15.62  )
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

Currently, hardware VLAN stripping is broken for 802.1ad tags. vlan_rx_hw()
hardcodes ETH_P_8021Q when putting the hardware tag into the skb, rather
than using the actual protocol from the packet. Because of this, packets
that contain an 802.1ad outer tag are incorrectly passed up the stack as
having an 802.1Q tag.

This issue was observed on the Renesas RZ/V2H platform (which has a dwmac4
IP), when testing QinQ ping:

  # DUT
  ip link add link end0 name end0.100 type vlan proto 802.1ad id 100
  ip link add link end0.100 name end0.100.200 type vlan proto 802.1q id 200
  ip addr add 172.16.3.2/24 dev end0.100.200
  ip link set end0 up
  ip link set end0.100 up
  ip link set end0.100.200 up

  # Peer
  ip link add link eth0 name eth0.100 type vlan proto 802.1ad id 100
  ip link add link eth0.100 name eth0.100.200 type vlan proto 802.1q id 200
  ip addr add 172.16.3.1/24 dev eth0.100.200
  ip link set eth0 up
  ip link set eth0.100 up
  ip link set eth0.100.200 up
  ping 172.16.3.2
    -- FAIL --

Note that this series only fixes the issue on dwmac4. dwxgmac2 has the same
issue but I do not have access to hw to test on.

Since dwmac4 does not expose the tag type in the RDES3 descriptor, it
cannot support hardware S-Tag stripping correctly. This series
disables S-tag stripping for it, so the 802.1ad tags are left in
place and are handled by the software VLAN path.

v6:
- Rebased on latest net.

v5: https://lore.kernel.org/all/20260920153516.103461-1-ovidiu.panait.rb@renesas.com/
- Split out the selftest part and sent it separately for net-next:
  https://lore.kernel.org/all/20260918112529.96039-1-ovidiu.panait.rb@renesas.com/
- Dropped the S-VLAN rework patch and replaced it with a plain
  double -> svlan rename. Rebased the patches that depended on it.
- Added Reviewed-by tag from Maxime on patch 5/5.

v4: https://lore.kernel.org/all/20260908164309.59282-1-ovidiu.panait.rb@renesas.com/
- Reworked the S-VLAN patches based on Joseph's feedback: EDVLP is no
  longer toggled, the "double VLAN" naming was dropped from everywhere
  along with the is_double implementation, and ESVL/DOVLTC now
  follow the advertised NETIF_F_HW_VLAN_STAG_* features.
- Added a patch to stop advertising S-VLAN stripping when
  rx-vlan-offload is disabled.
- The VLAN selftest now also toggles rx-vlan-stag-hw-parse for the
  802.1ad variants.

Ovidiu Panait (5):
  net: stmmac: Remove VLAN perfect matching dead code
  net: stmmac: Stop toggling the EDVLP bit
  net: stmmac: Rename double VLAN references to svlan
  net: stmmac: Do not advertise S-VLAN stripping when it is disabled
  net: stmmac: Disable S-Tag processing on dwmac4

 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 60 ++++++++---------
 .../stmicro/stmmac/stmmac_selftests.c         | 30 ++++-----
 .../net/ethernet/stmicro/stmmac/stmmac_vlan.c | 65 +++++--------------
 5 files changed, 63 insertions(+), 96 deletions(-)

-- 
2.34.1


