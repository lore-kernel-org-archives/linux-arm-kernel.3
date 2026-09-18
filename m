Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16714C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 04:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5yLK3al05yvnLvVe8Lu5Dq6ZTTFWVA+HwO77DFGd98=; b=DJ+icOURDNqPlksztZhS3p++sv
	xEMUfMpe4ggHuViMqtKyAN+w/GdiIe2aiWW52O0kvZ+zZuY+ZtjFAg0SzhC1nM4Y8VmII0y1aDBib
	QaaDI9j63qpG/r0jdMUAsKs+x7e8tzphZ1iXqxWneiNkTw/FrmNvi/qF+ehb0yl6OSS2DMeJr4bhr
	nDPqQHyW+pwd8PfG+kFq2ZIv/S12RC04iwEp4/iTtQGZOewSsxWOJgu7k/hNLbQ0i/uQLOzmeyNfQ
	44RcYh1f9Z7GkAlrb4EMoqiUgYvW21Mb8lksHPzcbsiTlpN3/gWX8aAOFOPiHfoXoBxI3SvxmHjOd
	zYwUgqXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Qad-0000000DTek-3N3h;
	Fri, 18 Sep 2026 04:52:47 +0000
Received: from mail-centralusazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d107::] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Qab-0000000DTdn-31xx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 04:52:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RTk/51MAHd0vy28XYLXRhur9AIdJrpfH0xUHCXIHx/PKd2uUZS0Zy89W4Bt+Bwab8hnNLyF9I21p548M4SwbE+lzSWhH31wyMUTSadBYxwiATZDpKonTttBCEMzoVKuPd7eqP2RpAAqhgYE9uxdUXnyEtxRqo86+pKDliL11ffKznzPdSCy2skn/6qkWnkXCdo9dzEqzWqO2fSD+Y+q2y1JoDPl9bLO8wLDhJOCC1J3NiursB9O7ddmWolMrgqxxw6yr+qxSkjal47/+9VdDQtoP02/3NMH3OWT14Re+Fq+AW9PiMC/CuETmOUSd2u8raXnf03j4HusFrggDF9wy8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5yLK3al05yvnLvVe8Lu5Dq6ZTTFWVA+HwO77DFGd98=;
 b=sPcZZ6pett/491sYDLuRu7rYMJsw2Wel3XVJISBF1gKli90fqx9XSCsePFLcJ3HooPve5mWY8oOG3DtY244rNiZjn/oO6gqoK7qXSfsDWpndnO/siCMoCBRQ/CpZ4efXse/+9PFNex+Pwa+sV88PlrodW31/MkC0utE07X+LKl5j61/jOgZBHX3BFfMLL8aqxSB9mt+FcKd+s0fd2CG/QZQDkC4rybrJe8AQGxKfF9PeCt8GuBjdrlamyikFianb10zTOE0S6vu8/Lh+X5nW42B3OaqPoA4OfZP6YFDtXfj+Nm0MKh1Y9oihb2fPK70J0lvMAUBOlIosmbbEMHtiFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5yLK3al05yvnLvVe8Lu5Dq6ZTTFWVA+HwO77DFGd98=;
 b=Sf9k2DJ6aD3/LEdFLmMfldbY8WI5y0vWTHw3NYR3PKfvllcwgJOUq6wGHZTKDPXf6i6C/UrTHtqrqOPyjpqcij4WfgexQturYaMllbkLLtKpBEugH8aLo1b2pkwC7/Xt2Jcxt0rF3/PsE2pBDAbIA4YRLQtgj1S8dFqKz3uQ5Ytaa83Iupx0sPCABr7daZn+XyTXB6mtf/1lk4Cp5uAekoBdUvu5w0Vfc+E8xDPW2q0XSntdfsO3EiJKUf/YarfBIa/PYLZdl99jjXZ6tNI63XS2/w/ArQO+0XnqV2cWKvaoRl5ODQtmKAWKZC4gy06CpPkv2ZQaNY3InXsynyB2lQ==
Received: from SJ2PR11MB8401.namprd11.prod.outlook.com (2603:10b6:a03:539::19)
 by PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Fri, 18 Sep
 2026 04:51:28 +0000
Received: from SJ2PR11MB8401.namprd11.prod.outlook.com
 ([fe80::ccc8:68f:2e82:ab65]) by SJ2PR11MB8401.namprd11.prod.outlook.com
 ([fe80::ccc8:68f:2e82:ab65%5]) with mapi id 15.21.0406.014; Fri, 18 Sep 2026
 04:51:28 +0000
From: Thomas Karpiniec <tom.karpiniec@outlook.com>
To: netdev@vger.kernel.org
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Coia Prant <coiaprant@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/3] net: stmmac: propagate platform mac_finish errors
Date: Fri, 18 Sep 2026 14:50:54 +1000
Message-ID: <SJ2PR11MB8401FFBBECB8FBBA9C002134E4872@SJ2PR11MB8401.namprd11.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <SJ2PR11MB8401F5C3A075DE2A0013E063E4872@SJ2PR11MB8401.namprd11.prod.outlook.com>
References: <SJ2PR11MB8401F5C3A075DE2A0013E063E4872@SJ2PR11MB8401.namprd11.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MEWP282CA0188.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:1d6::16) To SJ2PR11MB8401.namprd11.prod.outlook.com
 (2603:10b6:a03:539::19)
X-Microsoft-Original-Message-ID: <20260918045056.4294-2-tom.karpiniec@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8401:EE_|PH7PR11MB7145:EE_
X-MS-Office365-Filtering-Correlation-Id: 3050ee16-f240-4a0b-d888-08df15407fe2
X-Microsoft-Antispam: BCL:0;ARA:14566002|23021999003|5072599009|15080799012|25010399006|51005399006|8060799015|19110799012|24021099003|41001999006|37011999003|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m5CxLy+LgwY5khw4lYCVYV53vXj7eZMjMb5pqr7FzllW45wznDI+9jKjr1Ta?=
 =?us-ascii?Q?+PPKxSpyxGZUpNiKpw/SW1PTPWvqWe++4Bp07ZYizHhCBU2CwBTdZ2xKLFf2?=
 =?us-ascii?Q?eR2xUjANIitIotiEazORN9BJuwktDTTCYrKnoyOYRbRVgZS/NhoLeZ9y4jE7?=
 =?us-ascii?Q?qDgamdIEBDwqJBvSzLWsE5i+gRZmZdDNgANO8X4heI5vq02YZHGLnw0ddLMd?=
 =?us-ascii?Q?7+b53LnZksGj5HPxPsGnlvjX4Wcn7sQ4J7yWXaPYCJbhRoOin30kBJo6xc7F?=
 =?us-ascii?Q?pY9eqLzq/LK++xj0yrfi3sUGTPmhNl3tHZbN1XtjicyNJ75ZxVA1uhUbjerd?=
 =?us-ascii?Q?uNhts1AJYYZikyzxJc/6Mfq0AW64cJ36rvnNXAe1HkPXNXFhUjg4ibd6N7jP?=
 =?us-ascii?Q?o1H9HlWStN/yaNgM1Lt7Zz8j9HO8Amod4n/kRLfK1jnnFNZZI2ihTslmNVoj?=
 =?us-ascii?Q?upiOATLL5c/2zsFatBxXSjQOIBDPy2nOQIkLdoDyLdfOx37FYv0Pk8mUXvIl?=
 =?us-ascii?Q?JXNijMMjUcC9KXDmALnWiTb4q2xgWj8syu7SY4b4480b2ar5nd0qECyFt2qa?=
 =?us-ascii?Q?5C3chiN8Yxj21vB+aatWCQViJK0gX3VUNPRkSF0wZAjfRdx0q6B/v/YGdCwQ?=
 =?us-ascii?Q?YQ/SZNDZKYtbuBc2Ol7u8nuN5RuT+Nj9RlM2EAvBqx1wxJA91B3QnMUfbpVZ?=
 =?us-ascii?Q?5uaXifw2wqKyHuz9QAnpwC8WyXKZuv6WmMttMJg8soofq0cSs9AJxpp9qu47?=
 =?us-ascii?Q?abrZ1gUzywFyajyJikcgbd0FGdB5R67C//Hmxs3kDmm8aJAEiWhnn29FYFMG?=
 =?us-ascii?Q?rJlLoDBUtIH8EKAw/qgWe1UdOxYZFPkYa4S78eUWEI72RtluXmZ5Oi/srZ/b?=
 =?us-ascii?Q?1UgLCdmS7I3cbOAub8qThPnbk5uKpwu1Ktg1pZGoTCgOlfXGWmz3Z0yacSuD?=
 =?us-ascii?Q?Ph1n/dw7ltgqoiEZV099qlLt9Hih8M9Bt8Mf4IMnqw/n5R+a6RNU4qF8wGY/?=
 =?us-ascii?Q?qBQ4?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DpHCSZgGq7Jl2u4YnEcYOoZbHXTx/xXgFGJhFtCPpXrxDdF8MmzbfeimVDy8?=
 =?us-ascii?Q?2RzTa4NmJx8F2YoLvSOjeLkVeNeiAOH6rVIKKwQZX3gDCKFVd6P4y+RGRJGg?=
 =?us-ascii?Q?MnxVbGDbhMcJRyqqj0gL9TUhCxacNaOrkH1vKGLLOZ8UCReBNHxV+w36wZp8?=
 =?us-ascii?Q?LofiNImW0WTrW1VtI7uBAtUR6n0LpnaRaEiR5ZL/E06lgrCn980nZ8QezshD?=
 =?us-ascii?Q?HemDEQRm8P7s7Qp0y2B2zdW9IkVnMLpzFBDnfRvNXwUtURY6kOL6tmiwUlDR?=
 =?us-ascii?Q?40B9Bjngjy4AKIx3G0rFhD553tmvJfGHWHBbE6qgLJLQuKv2peO5kAegRP2y?=
 =?us-ascii?Q?EMrHQwyHohroD344gtOyeKGXZD+Z14S+4KBFeUkSbDC6r8YmBo40XRghlm6S?=
 =?us-ascii?Q?TCNAIR8gA8xz8CE/s2kTSFrZBDUuOmnp0xbFMCoui/sFa/sF1OnLYc2AS2M8?=
 =?us-ascii?Q?f3y7CFHxBJcff/4d7ytsQpsv0rv/2F2VqjjfYyYu/6Mjej/ILhDQRF5nkBee?=
 =?us-ascii?Q?UfH8NmDGxVZazBwrXEAp0edO938sxYlnZ2x4qaz3UiFWosEt4CzH0eeHZBfq?=
 =?us-ascii?Q?tTqBT1FmcygpbVegmOeQqWc8nv8PVMjcZBpWAmjoLlgeZ2dDgZvP/vv4Ghvm?=
 =?us-ascii?Q?BxBJurfJS+ShUJrzGJEpu3OvvIiolH8Whz08X+ebyhRcwEQFTGCGFsHbN1uY?=
 =?us-ascii?Q?F+k0EKBntASky4QvwUoQZqyqV2O6Tl3ao0dUWAua4bIuE8jwtfiYYYuj3oG5?=
 =?us-ascii?Q?lOtVid3OiVKOBdbN+ETlpJGd+Q2INWTMxXEXs2mnO8OI72r3kqPXvXCfgc0Z?=
 =?us-ascii?Q?37vboU1nYOrlRbcDvDwq3v0hhpkPfmDHEAWut95pylaggIxsYwUND0HCzmGx?=
 =?us-ascii?Q?PtFgeFHoDa3Bz9Oy6QAgm+2ltxHLVX+PJ5c4gv/St7+Zd7zOYl9y4Hxejmm0?=
 =?us-ascii?Q?mbvidWxRMZLi9QBPZqtzZg6LVdubn6AFnU6t7nw1RcVjWYbFNY5NzrZ5rbGc?=
 =?us-ascii?Q?cXVlW5s8+kcxsnz+zWWUOmc57Uk4rP0lm65eNv2APC1EsrH3U8gPTo/3QU4a?=
 =?us-ascii?Q?50KLqOVMMo//zbFDnJ80o0aZuOi+4BxUHRBkH75LL+z5Nbe7TiJBsg1SjgrR?=
 =?us-ascii?Q?uQsHUaJB5mEz65FtWrVgYjvFmyGBUjZeP/QOD+LxDv2zzW+UWE1B6DJ2AvCW?=
 =?us-ascii?Q?pEV1FF/R0DRszt255t9BuL/m7ndw6ZGXrJybw9MCi5Oz1WGKjN5okG2n7IDK?=
 =?us-ascii?Q?Fg3C33W0HH4FrTaXqtxyKVQUsEolL4zDFziasqCoZ1fyn9/wXZ+qeScZTbG8?=
 =?us-ascii?Q?BF2e21E6LnBqWDc0AOt47xhqorfLH9bgwO37BRbiSb0iHEc+ElR4AeBME8Sd?=
 =?us-ascii?Q?qUWhMRhoD+QZ4IbRiaOLp+w1JGeNVrZNO5UPtMuhDJFLx4M6mgDiJzy+zyHU?=
 =?us-ascii?Q?AW33esvM/Up+5sAKcpuER2Zg6KOJWE9R?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3050ee16-f240-4a0b-d888-08df15407fe2
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 04:51:28.1580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_215245_764425_3DCA3A09 
X-CRM114-Status: GOOD (  13.15  )
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

From: Thomas Karpiniec <tom@wendy.sh>

stmmac_mac_finish() discards the platform callback's return value and
always reports success to phylink. For example, the Qualcomm ETHQOS
callback can return an error from phy_set_mode_ext() if SerDes
configuration fails. Phylink then treats the interface as successfully
configured and can report carrier even though the SerDes is not ready.

Return the platform callback's result so that phylink can report the
failure and keep the link down until a subsequent configuration succeeds.
Keep returning zero when no platform callback is installed.

Fixes: e654cfc718d4 ("net: stmmac: configure SerDes on mac_finish")
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse
Signed-off-by: Thomas Karpiniec <tom@wendy.sh>
Acked-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1fb5f804ea23..1350e92943ac 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1048,8 +1048,8 @@ static int stmmac_mac_finish(struct phylink_config *config, unsigned int mode,
 	struct stmmac_priv *priv = netdev_priv(ndev);
 
 	if (priv->plat->mac_finish)
-		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode,
-				       interface);
+		return priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode,
+					     interface);
 
 	return 0;
 }
-- 
2.54.0 (Apple Git-157)


