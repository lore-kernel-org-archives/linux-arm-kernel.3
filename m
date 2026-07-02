Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6201C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 03:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBckIUPkLfR8cnEtlwmNwqsqpeI4bzf7/E9bl30V9K8=; b=GOFJcDX793Gn197pBSvv1oxf98
	+st+eYFLqsX59MDyyE4Q6vo2KudgArx80EGs5n5wai5jzewrMJbjitC+qj/Dwph/+fXMabU0iure8
	ife0ihcfk+qZBnt39tgfgz8aqzzOAuReYBtiOZpaaaS0A5zsIg4rOvcfBIzsaAbh8xrrpvOWz6Veh
	4paZuVgor5oaTnLFRNJCcxS/BJwecGTLGz4fHFx0o4wjmsvOHKjrT/cDGqx7VCD2D72jC3YGWog8t
	LHTFTthN5/Bb7YYatomSaTRlMOXbNqBZCsnu1sHpQYgd+rD/a5T8NMpumGtcg1OFZnxMNec5f/36H
	dhVlTLWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf83o-00000003Tq6-1rdv;
	Thu, 02 Jul 2026 03:25:56 +0000
Received: from mail-westeuropeazon11011068.outbound.protection.outlook.com ([52.101.70.68] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf83m-00000003TnC-1BAu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 03:25:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M8S+H620CYJjTN8zJiFQa6Cx4unZgV9WMM6/Zm3KJkP95mP9sVUD/LG/jCDkUuWqojXVv78g0ThoQOpc0911+aVggaglAYTRL7kVTS57bd6fw2X20TmcOntbMQ5wzKnwG1JhtLTSuiVZCHeqVG2iya/8oM6k3dB0Sxh/6p/RVxpUHIK0zfUji7PFafbkqBUEArELurdYbhR3Jy5elPSVuBJjF2UhMgIGEbzXi4lDseoqQqzKhKtnBXX+WGvNuAoSUVeU1JRq+iK1ZKhvCYn3VJwt8EbQuVODw7T86G2waCRpZaLCucA1oNoFI8R0UlZChe0RAnP3+BsMPxCMReaoxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBckIUPkLfR8cnEtlwmNwqsqpeI4bzf7/E9bl30V9K8=;
 b=TbJ6VwFHjd+XB2EvpfQOm5rKDZWHQxCXCM/3UV2UkXTs9QOPcN/F4iGfnZUlgqoDSL4J1igH9w7+psYQmokPh/6RM2Onvm2C6NoIYR1OHIPwR8tBzDCyaCkCeCLoQ+hhhDH9ztQhMlBb+gq2EPPQi3dHlGiylFriF5hyKyCBODJQmbDyv11x8y9Yo6NJy+KjspJaHuXaQ76k6ijE9jJlxZIchsRDuGTlu+iWTQWxQeBrIzElMtStBQ9jTf+SfkC8eKMd4iOaBNjJxBbfSdr4VRFozGik4/sUII2IMcJyPFRxE73u7o3VlSzrit+PZ0tfhKhISSqL8ur/y6QpeVGuzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBckIUPkLfR8cnEtlwmNwqsqpeI4bzf7/E9bl30V9K8=;
 b=DoWQb/CYk0r8AxVIYzXCgvLLPW2XnXbeQ8TZI5ZPpG/tATDNWaOCmpWm0t+KoFy0LYqQIrCdRye3QlJVkh0HJWC/kNorwEGzEeMfx8UFFByiLWz+H0ZPpCvOmpVOjtbqYNwseH8ik+/9WxGBgo4n+ASrtY4SP3t0/ff3pYh3AWRUZCQFt39x7JuKBipIj3+2P07a3I4Wdfjpn2C97RkFht9Wyo2sP2ftAmVsd37bEKXf+4PjWq8Rvht/XTFs+T7Fvge5s5lEIGNMDBOXFFpd+whpGmCap5Er6jBKtpHaqF+Z1g14IVPG9xSK4z9NVBQUfn8vntjUW6MMLxfPa48Y9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22)
 by GVXPR04MB10248.eurprd04.prod.outlook.com (2603:10a6:150:1c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 03:25:50 +0000
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74]) by VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74%3]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 03:25:50 +0000
From: wei.fang@oss.nxp.com
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux@armlinux.org.uk,
	wei.fang@nxp.com,
	chleroy@kernel.org
Cc: imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 net-next 06/14] net: enetc: simplify enetc4_set_port_speed()
Date: Thu,  2 Jul 2026 10:57:06 +0800
Message-Id: <20260702025714.456233-7-wei.fang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702025714.456233-1-wei.fang@oss.nxp.com>
References: <20260702025714.456233-1-wei.fang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0032.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::10) To VE1PR04MB7216.eurprd04.prod.outlook.com
 (2603:10a6:800:1b0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:EE_|GVXPR04MB10248:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e058c31-05a6-4173-3593-08ded7e99db7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|7416014|376014|1800799024|366016|921020|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Fpq82XZbZCcdx2RQyhCV8phw78taGn5Mrbd3sH67OFedoGd3rJIkNtJr6zI39ydmAuGGbcfRdp87qHatOVQ0R9xtpDMqOLv3Mp0dc4hK6G2flXAoEQ50/IsK0qKFQ4j+7uqmLotxow8rahkf3AsPMWMNT5bGM3l+onjjWg51mG9kr4QN0BLt1Tw8G8DKlcmm9V0lIMX5zdB/RYQr4+GbFPZYLloXDK+WONskef95vqy0NxTKphUS04Lw7wcBb95FlmTmkyvHt9d6EL5M5MhyPHBhKZwX/yHyFscFbtW+UthLjxouLl6oTQDzURTWVtDwtkSKner3vW3NBvRVhuJlTIP9948R0Tajc7mEYK55r9tL+au239a5+ccb9fXu9V3HMZaib0SiW6LuYjPhfU/xXBH2Usn0zeYoX0UC6oGa/y+bro+dSQckEi5/7q8LpJa8740wJ+p666tM2fHyQZvlnIbkxl9n9ipEPhPp48oZRb5lCze12gPFEBCuPSW7sXkoX3ZeUkbd1du5r5D+Vqq44UeVSyA1cSF2KG3ce1vKuP7WrKPjViXhLFxx+5phsNU5Y68TftlijUInAVGMxG6kdMC0u9te1GjkLwtYBCEFCqtAZN9vmJcyv4Vrb5jmx1opSuzywqdEI3/jvAgxoxeE4jUV/0dtOGRtkn6u5DcZIj9ZKG8c2LazDGsTEjcFqh1+r+XgT1ybI1xXpLCDnBDnuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7216.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(376014)(1800799024)(366016)(921020)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VwJ8Ietj0xPpj//M9bdnrJs+miKGVw+KBqHtUDmjGoUmAhK94Yyphn7lzwK5?=
 =?us-ascii?Q?FgHnugunA27pW7HD0shno5y3OoXu1vWjo8CtLT2hRa4xlxsyi1oPZj5C9p2q?=
 =?us-ascii?Q?++n7uYjEQBEumlYRsN6Do/qFWK75xu8rkRVDQ9ykv5pptA8/SNYcAbuCmsxR?=
 =?us-ascii?Q?cVAEUiIQUuJnRGSkGKDKz+g8Lrnw+bx408TQGRBTYBkIlbNAppDZ0mzDM0Cv?=
 =?us-ascii?Q?yPa3xMzgV73H5Rb1mazgkJHOvzwLld4+N1smBkZutSrJReMfc6Yw1Ao2EJLu?=
 =?us-ascii?Q?lSrihcHgWrV9G2G0BnGgvJUL8t9mUDk4cLHrFv7l/heOQv+cfk9K8o2eeKs/?=
 =?us-ascii?Q?N7NYgIXp3DfrLKePTpIZghKMbsONOBnhViaZG0z83FgWDd7w9l61ixQk2x6X?=
 =?us-ascii?Q?RcA+jceNky5PhLyJG8kS0lxdimYgTbzQ9Eqn62qC6/9lebx3foroqP297Gkc?=
 =?us-ascii?Q?cU9rIhZjADpMj4am5/x9tBLT/UG4MtSQBbEcLCSjcNoQ5Eum48+H30H/YpM4?=
 =?us-ascii?Q?QT5H5Aszwr0hppfTDd7kewYMpfMlMolG7gJaNsf0DE+ZJTihZDFLSxAjMv3i?=
 =?us-ascii?Q?ZvnLuuDQiseBGsJaDTgz8uC3lzGQOWa8he6Uf+yWPdJoW3rlubyQqVJfQLUb?=
 =?us-ascii?Q?zNXPAB+kyB/qBVUKq2PYnajnBmfsYsfSjQADkxIr1TcKRdDV22tUVr0JiNHT?=
 =?us-ascii?Q?/bMT7IraTYTk7TfeEJkLkBuPkyWF9GBDVvipEGSIi6JE4DnFuxw3/bBxacxK?=
 =?us-ascii?Q?E3I4/SI5PkY3v9yTgNWmLYWF3P1zUnW83p8DtscI3GyWuBzY/lJhJ6cZXjRF?=
 =?us-ascii?Q?jFmMY6H71ZegL4Z3ikMcu9Frx73N3GHDUmCd/m7CL3m39CcxBLPznEf0kzPv?=
 =?us-ascii?Q?ePTmxYyHnJF/tgfxWJFfkdeMAbPb7KyDyaBePy/RNqZ+kIK0eW49X1Ovl7ds?=
 =?us-ascii?Q?C59KOz+BKt8VgoJzCVR6L7OajLQ2sOGUKMScLFls1nNaB4UGiIIH3vP9W4Z/?=
 =?us-ascii?Q?H12s9vaIIHE75F/WCxhhC+ZN7giMD0nceUNRiL102CI7VZygF2UfFqbE8qIG?=
 =?us-ascii?Q?/AAbmy0l72sSBk17ceJlQaNYIPv8Fd+bqTrV0x4OiJ0jdejeFwAQ1SEXO7LM?=
 =?us-ascii?Q?q9WKqQdoPMjnOSm84559AethVP+RdVSABoAvlBVgrQmdsI+2E+6EaJ1g2J43?=
 =?us-ascii?Q?InM34jwQOF4u85Kb9ozyu97hrcfWA3jFoPfQ5Z2IR/kD0fvCdmyHYRWltdbd?=
 =?us-ascii?Q?xuiDz86mfgqWfpGKfnYMAsM2zhtd3a21KPdJulenfiDu31EoDP06ETU0QVoC?=
 =?us-ascii?Q?Fys/nn6/cm92OMmLrk3nL48/+LzE3m5NJdBBg9hn2kjU/asJYV7xh2cI12Sq?=
 =?us-ascii?Q?BJDw9laoWvGCarxWOvwMciDaXVSGuA0f2eA/z17Na3NT0m2WWocnQ17Vzl3Y?=
 =?us-ascii?Q?Pb8f05buEifrNr+1Mi2Xwtxi5doVVRui1VhlXd4jV/aVcmwkZaqo4WyZQ2xx?=
 =?us-ascii?Q?c/93C11R6zKL/Ss8Z5pUvNJr+AYki0XUEBphF6wTvau4fjIuNtelVLOPifFn?=
 =?us-ascii?Q?bkL+7Dw1co0W9ePFS5zUo/4jd5Waq2Dl80fJ6KAIM/RuZ0C6tV+Z8cHXoy+Y?=
 =?us-ascii?Q?Ijf5Pfl/FMOPyTy45AnwxGaxt3zyKufW396aREY9wac+BTiejreBlUOtVyfV?=
 =?us-ascii?Q?5iDtuVIPd5UZ9SjqllH9ldPX4bQdY6KQ1GItFcrDgUW5KXWizym52YZCfU/l?=
 =?us-ascii?Q?VbMMChNBilIt5u3bWEQ3vmuHXchS1WODgGYFAUJ+19Uph4v+AUdi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e058c31-05a6-4173-3593-08ded7e99db7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7216.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 03:25:50.7743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XT5xTv2MwcQ+VfEnPCl45bPMTYJJ0EyUlnt79B+3+qHe3NGHPMxLISQtGeitQ4J+SbvQ7awkR/m9WEWWnJb2D5c2sigTQ2+C9bdZyPfzOiHCrxaohKoHrAUS36HTz99E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10248
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_202554_400416_CA3C970D 
X-CRM114-Status: GOOD (  10.89  )
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

Since phylink only passes valid speed values to mac_link_up, the switch
statement with its default fallback to SPEED_10 is unnecessary. Replace
it with a direct call to PCR_PSPEED_VAL(). Also update PCR_PSPEED_VAL()
to use FIELD_PREP() for proper field masking instead of an open-coded
shift.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 .../net/ethernet/freescale/enetc/enetc4_hw.h  |  2 +-
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 19 +++----------------
 2 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
index 6a8f2ed56017..dea1fd0b8175 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
@@ -148,7 +148,7 @@
 #define  PCR_L2DOSE			BIT(4)
 #define  PCR_TIMER_CS			BIT(8)
 #define  PCR_PSPEED			GENMASK(29, 16)
-#define  PCR_PSPEED_VAL(speed)		(((speed) / 10 - 1) << 16)
+#define  PCR_PSPEED_VAL(s)		FIELD_PREP(PCR_PSPEED, ((s) / 10 - 1))
 
 /* Port MAC address register 0/1 */
 #define ENETC4_PMAR0			0x4020
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index b966637572a7..db7bad2c3cbd 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -631,23 +631,10 @@ static void enetc4_set_port_speed(struct enetc_ndev_priv *priv, int speed)
 	if (speed == old_speed)
 		return;
 
-	val = enetc_port_rd(&priv->si->hw, ENETC4_PCR);
-	val &= ~PCR_PSPEED;
-
-	switch (speed) {
-	case SPEED_100:
-	case SPEED_1000:
-	case SPEED_2500:
-	case SPEED_10000:
-		val |= (PCR_PSPEED & PCR_PSPEED_VAL(speed));
-		break;
-	case SPEED_10:
-	default:
-		val |= (PCR_PSPEED & PCR_PSPEED_VAL(SPEED_10));
-	}
-
-	priv->speed = speed;
+	val = enetc_port_rd(&priv->si->hw, ENETC4_PCR) & (~PCR_PSPEED);
+	val |= PCR_PSPEED_VAL(speed);
 	enetc_port_wr(&priv->si->hw, ENETC4_PCR, val);
+	priv->speed = speed;
 }
 
 static void enetc4_set_rgmii_mac(struct enetc_pf *pf, int speed, int duplex)
-- 
2.34.1


