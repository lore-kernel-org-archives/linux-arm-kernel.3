Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B86C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 11:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUtYo13ufqCYb+6W+084VIFx62FO22VirYDtd932lDM=; b=X6URPXcPi3SHhfuL8o/4OvQTL6
	v26l3+/WF6On70yF2h2RYpcyDmO44ELmDO4KiOWJ6ORxUyvY8Kn+XWJXS0Umf7eQp4s826TqRZI5H
	vEqa7tnwFQz6WM/4x6p10cc0jHAf+5oLD1p13z/RCgy5RMPJitQMnzg6Pr3Oz0wzTVFV1MZj7y0lu
	/QBYFwbr2pm692s9nhYa2sFm+/iHQ1wniWURTEMSsqzXXi8/ozOm5EVA7Kq3Vk55Rvj2UhHBfivlK
	R26vs4ietuypGSNjsJJYpc2DXMp5Lsu6mSx+gEZpqvy0i5PqedmoYL2H8ZQPlIqRF0ZqruBQFSnvW
	hwyp+zVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzCZp-00000005x9y-2rPa;
	Sun, 08 Mar 2026 11:45:41 +0000
Received: from mail-francesouthazon11011071.outbound.protection.outlook.com ([40.107.130.71] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzCXx-00000005uuF-109z;
	Sun, 08 Mar 2026 11:43:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XHewAoPMpNEa6AwYsFUTFu7VXfiYQgX4ENLUgASxQNE/SerwhVSm8R8fEWkhNaPiUI1SF1KO9zd140JBomhOY5Y75L/nB5AoL0YR3PQp4Drk9HZl+SM+BCafNyRFdM77QjlAQFWzlwoTsO9W5pxGnVOchO3RgkIIlAhDkA0Kcbxx7uHjnxYPpU5UzOP2m2IGj7t5tStDfrcu2wD4Evcnqe/0QIQwFXYb3YKxoSkU5BFZtDCJYcsf2cYVd4hfEn+yBzQ15WVmZpZOzhC/Vw/4r2uW0dqNvqVuJfE0O/cUeRLW+AE8ZHJjXewzGMwljoyz8h+t076jz4wKX+YhfJcJ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUtYo13ufqCYb+6W+084VIFx62FO22VirYDtd932lDM=;
 b=SPIrJuw12gu9KsuvvdBlRg7lph2xiWgmRVvF90bQMZSFd3kaOh2kBf52Ac3qrAUVNn3onlADnqTqIHSVSBhptGkhyFBJ+gfEYj4mmzOE3pYzsx64bmneyyAGjZCPq6/FlXMQSr64kEX/+/C+2hO/ZfVX3pONIaLTp5Tnxp+Dr8CzSrszp7ITKYS71Hm2CizuU9HQg5B2Crz2/mVvhKOiHNc01p7AqmtT7CDf0raIP8p5T21y6//drRyrLxYTeckQMetCcXQl75UscsyC4ZIhS82BrpgKO4eFNKAsfle8xXyawseMo+TWIM2u3RTccSSEfcy7rvnnz6MlCdpn8kb1cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUtYo13ufqCYb+6W+084VIFx62FO22VirYDtd932lDM=;
 b=cTG8qPejEAaXSBbVKWcnJZxcA0bzp31cGS5/WlNg5qZOuVA6O5bCHuno8TrkUAlbDcxPSIJqPS1wWF0fRrz2W8WX3g0Nb2CiRznO94rTaO4tbQN+/CUysm/tdBMACuoN9TirAjXxCjySTMczDrrRK1ObhQg7t+3DV43PnShTTtarrNWlb5HYvAEQja8HC3bwlgHUoS2V121V2ideAufMxRivTbm5HBXUfQqJ9C/xDQf4BfQWzbTPMU72qyegqIEq5T/WnWiiWENol32vgiSf9q0RZzOuiND01ej8WSFByVRLQGluLg5tduO4OiaS5Yd3L/g5hit2bP99OOWGOMf9tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM9PR04MB8211.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Sun, 8 Mar
 2026 11:43:31 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 11:43:31 +0000
From: vladimir.oltean@nxp.com
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
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Michael Dege <michael.dege@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [PATCH v2 phy-next 18/24] net: renesas: rswitch: include PHY provider header
Date: Sun,  8 Mar 2026 13:40:03 +0200
Message-ID: <20260308114009.2546587-19-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0256.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::23) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM9PR04MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 63ddd14f-b9ce-41dd-22f5-08de7d07ec0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|19092799006|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: SbMgLZtTDbRkV7pfGLk1H5CH/vjMLTEJpepwaIqgNJQUk7YdDp0vNtJWkxH/GsxhFg27/a1TEkgbhX/JdJSfJkKryHVPfEZqZQdx83NECjvuvSD1Lm/0zFBloT5oIopv4mowx4tdO+ka3hhwqyn3pEeb2XpVuuJGqxrfRyVeAZc3C+nZbDvd2VzbU235zzCPVoZLb3OBbpptao+Sh0j+b7LJvP0Z7uSvRQhy8zTfKdhl5qj9OAEyAIPyiMhMu+vwZd1b/kS5GmVMaIbUXfPBbUquBncarlshTbQjt9KHK0TErRX/QA/gb0V/H1aLWdxSSOr5nGp1Yh7bwCTGILtWfcXEkhlTN/E8zM04MyhbqeU3+Qdd/OIyICgA1pql1EQhrs6WGLhH9eAj/AVd/40c0glVAPwlh9Nei62fNu4TJZ7ELRcGO/jb584Ru5JA7RVF0uau28bN+ni5ED1GnwdPLq3E10x0le4+WEPJrEXK+o7FHr47OrsqcpaUMa22GR+r9PN/8npoQikw6kEMzo87PJJwV/PPPIZJ22CNezEE6m6Hbu2VM1wC+lWDULiUCpXvuFd3/aFfft7e0Uyy0C3QvyoV9gNLzNw8SBf8it3NaetpYYPF2p+IQH87AiYQRTXzjfsvIodKWmwnfi57qH+uTglh1LbwhuVuCRy8NCwrKwgElKUCAGzibWras89JIYS6FhGFFkBQikDaatl0WvuztyOxVDFzFdCGWtrPQn3UePY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(19092799006)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?opx5JCPul+/9tZ5yRFOYPodnNPkjQTEq+Ny0tEdXjW7I7skdOpJL8oArLNBh?=
 =?us-ascii?Q?13FIz2UFvkzgxOqLzIVsZvJVA3aUgPD50Wphqbs2lks4RVIRDRqXpdonjmPP?=
 =?us-ascii?Q?H8yC8VyDHdZdiep/zrsv/08QDPXRfjSiDJKfvzei+ZUaHtsjtc0NQQmsYa4X?=
 =?us-ascii?Q?IiLBbQxqL5FwRweVo381mkh09NHvooNil+uMcYN6O4Uo0376gyF4rXCE9DGP?=
 =?us-ascii?Q?aMtdcXW5g+qSKTCR5p9jgeVQPlerLzE0e4Sae40Wl6hp8xM4nZVRmFMFj2N1?=
 =?us-ascii?Q?uw9UA1KlKzYyMdli2lw0GKePZoddwWANg209nWAFzX+Fdq9/6XxZUiXtrBFZ?=
 =?us-ascii?Q?qm2+7+YeGvHNSNtyVnSP4Jg3MaEZdvveIK6QrnE6BF9/8zqq+G09rV+0y7ff?=
 =?us-ascii?Q?WoSEVkRVv7cfpbl8hmRv6oQg/XWNPNVi6rV1mceIGZbMAoAEbypQc3LU4rAn?=
 =?us-ascii?Q?0Bgehp0JBqMGnUqdYg+XLFcxKOqfO1YDDphxw3jkjclXHFeKuh2xGKFsjgEK?=
 =?us-ascii?Q?fxbkhflgkZ6WaPllOByaX9u9Rzw8fGvKwSHaqKNrCR6FKEpNCN/A9t6k3ToW?=
 =?us-ascii?Q?UUEGs/dYfFkilWUsV2SJ6BCgA+6o+yLuKttjY4CwhxYrC/Fls60oqegQaVcu?=
 =?us-ascii?Q?ALt99I5hBD21F/pbc1YCT1h61O2CCl8/XJ++nNHtHagtEGlnRUPkaDDDk8Vh?=
 =?us-ascii?Q?ZYUTcYm1E7eGdOrqO2BPSRuPT3LMzZGB70rO/m+kTRnFjsIH2rUuNhec0lQY?=
 =?us-ascii?Q?qUUf3uYISxg1jin+LMZukv9il756DYwNoUcEh3Edk4DTWkcB8Iu2WUtFS3JJ?=
 =?us-ascii?Q?q2jVXjIhqn7yDGWerSV0zqSXW8LUZWMdDgSyi4fauSc8o7z7FFk+X7Zi9oaD?=
 =?us-ascii?Q?sJ70rD+qwzPFn17zp3kxqXupG8UTch6PuEzAOfU4CpA8LVsuKgKXPFA72ZI0?=
 =?us-ascii?Q?6EUF4zFwoC18CFUUoInx6acnRaxb5lar+epeqeZaoo5QJlqKY2lLvpOIfuKK?=
 =?us-ascii?Q?RSsfGTukjZ+rPfyHrfRjdRpFLKYGuxtsqVe4ROT8AbJaZI9+sUpsbmWaSxwW?=
 =?us-ascii?Q?1r6zmm+YaC7LRga6cBbKLjsVbK7QqXOkkSMC790BgojI0bqM+C6uJiJksNxj?=
 =?us-ascii?Q?ALxqV9P27xUVExmTkV5lObxIq1MFFThtmYTtR58iqvj6dmDy6/6sst1TJ5cP?=
 =?us-ascii?Q?wVSbVLKXvYLi4nhPI275Sj8JP/cqn2r/exoTmoSy6++FowtaIBc3HPff0jMg?=
 =?us-ascii?Q?p+wM/WYfnftm55SyK05ku/YCXiOc8e4wyRmzVqnnYeraCqA1Z3W3HRubcRo0?=
 =?us-ascii?Q?yltPHWTCUUcay09nTuxS7rIsSoZnRryteltSx+Jncs5ErUkvjyRJDMyTALFr?=
 =?us-ascii?Q?q6gEsiWOSlna6cnaAyTotDWBMvwfaXk53MMnfSxK6SIat84PV2bcupTMoVud?=
 =?us-ascii?Q?nGdotUnRpLph2UJYdjpL9jAjg2+A1+C6ABe/VDfbTDffFVPrcfVgRatmYUG3?=
 =?us-ascii?Q?HTfDYwgWPjpkmI4fcL1+WZlZQi874zEAjvYgi5Yv9OX6dTIC099hEsIkZa8A?=
 =?us-ascii?Q?QPW7DYA6cQ+3mEKDMOhKy0jTmhubn4owhaJ1JGrcGqDjJ1PnacP3A7viGoHW?=
 =?us-ascii?Q?5nuEGzykVqKppnu6aeNeoFdGwXtGj/KTPq6PfSlndfmrmkyrTx0fcPcCq8Ia?=
 =?us-ascii?Q?0Kp9yTDNSdI6yQQztv/UxIJ7nrIqco8Ayff+6kyCSfeurd7MPaw21CKQUqlC?=
 =?us-ascii?Q?AwkhUi706KNOy/lU49dF2wmsmSRjJ1VZK+SdAb926G9m+LIEXSj5jDlltnPJ?=
X-MS-Exchange-AntiSpam-MessageData-1: FlS0/lfpsbA6/iId050nJW07WP0t7mZKR8Q=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ddd14f-b9ce-41dd-22f5-08de7d07ec0f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:43:31.3596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQMMDS9ALhA9NeNynj45bq4UB+2nt3bN8evnbbkY0opL3E6py21e4TNe1OlLsaP6cbt4pAU8IrFZxaKLSnm9qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_044345_511342_3D158F60 
X-CRM114-Status: GOOD (  17.49  )
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

As a PHY consumer driver, the Renesas rswitch dereferences internal
fields of struct phy, something which shouldn't be done, as that is
going to be made an opaque pointer.

It is quite clearly visible that the driver is tightly coupled with the
drivers/phy/renesas/r8a779f0-ether-serdes.c, which puts heavy pressure
on the Generic PHY subsystem.

This was discussed before here:
https://lore.kernel.org/linux-phy/20260211194541.cdmibrpfn6ej6e74@skbuf/

but to summarize, it is generally expected that when a Generic PHY
function is called, it takes effect immediately. When this doesn't
happen, the PHY provider driver must change its implementation rather
than the consumer be made to work around it. PHY providers which rely on
a hardcoded call sequence in the consumer are just lazy and wrong.

The most obvious example is commit 5cb630925b49 ("net: renesas: rswitch:
Add phy_power_{on,off}() calling"). Problem description:
- Ethernet PHYs may change phydev->interface. When this happens, the
  SerDes must learn of the new phydev->interface using phy_set_mode_ext().
- drivers/phy/renesas/r8a779f0-ether-serdes.c implements phy_set_mode_ext(),
  but this only caches the mode and submode into channel->phy_interface
  and applies this to hardware during phy_power_on().

The commit author decided to work around this at the consumer site, by
power cycling the PHY for the configuration to take effect.

This had a worse implication from an API perspective in subsequent
commit 053f13f67be6 ("rswitch: Fix imbalance phy_power_off() calling").
It was observed that phy_power_on() and phy_power_off() calls need to be
balanced, and so, the consumer decided to start looking at the struct
phy :: power_count (the technical reason why I'm making this change).

This is also wrong from an API perspective because
- a consumer should only care about its own vote on the PHY power state.
  If this is a multi-port submode like QSGMII, a single phy_power_off()
  call will not actually turn the PHY off (nor should it).
- the power_count is written under the &phy->mutex, but read unlocked
  here.

The rswitch and r8a779f0-ether-serdes drivers both need to be completely
rethought in terms of Generic PHY API call sequence. There is no quick
fix to apply. Just include the PHY provider API along with the consumer
one, to keep working as before when struct phy will be made an opaque
pointer to normal PHY consumers. But this is a bad offender (and it's
not even a provider) so add a FIXME.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Michael Dege <michael.dege@renesas.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

v1->v2: collect tag
---
 drivers/net/ethernet/renesas/rswitch_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 6fe964816322..132be5f15073 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -27,6 +27,7 @@
 #include <linux/spinlock.h>
 #include <linux/sys_soc.h>
 
+#include "../../../phy/phy-provider.h" /* FIXME */
 #include "rswitch.h"
 #include "rswitch_l2.h"
 
-- 
2.43.0


