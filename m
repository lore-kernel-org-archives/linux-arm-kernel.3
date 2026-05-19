Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA05FCD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 11:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HY9Qp6olJ8r9QlSVW8oAZlvOR2SqJus3qzj1J8TRYmg=; b=EW/smGddKAoa8XyU9YHzDUEgUF
	8cn/0l/2nvxP7MLCVGZNlP2HIN2zA9rVNM6drLKNHJxulyHKPJI5ilZAhoOtnnob94L7EPGZRcQOs
	gom4KlrsqaoyrzRHf65EuCx4Jun6tuw976JEwMf05/QYz/shj1KXOJTArnb3tGyvhhl6qxsqLG6kG
	J54rdB54lEsZI9GfoUvAcqNRbP7CCPM0yZta7z/9tAfqlKiZUm8b6gPCecOyODNHVxlBSyiTIjiJf
	d4ZKx03XOC8ZX93t0i5uPzEHW1rPizwt8H7GWTaDAGct2R+D1NI3dLhDT8n3rfAoiOK6xIY70bN5H
	aFIM53Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIOZ-00000001HTd-34Hs;
	Tue, 19 May 2026 11:13:55 +0000
Received: from mail-northeuropeazon11011030.outbound.protection.outlook.com ([52.101.65.30] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIOU-00000001HPT-2U02
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 11:13:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3kcPssitj372sGDMB+/SREeFX4LC3p6FyjxSoRZSvDc9dEfL12S7Xya+3gUYPVDmJ/c3cp08Dlc8tQdnkET8fu2vNZuZUEWTWlHEQbZT0iSJvGMWY/r6/8ZyVQpN0pdmSR5xDBU2cjsEri8Xh966oZ7tETkpu8eLT/P/33Er48HBcImxUgxURCN0ePW/bP84sjuPxkh7m/lrOGv6vGZX1eIeJ4jetV9/LMPp3RaXDPafxXJmESD46BLxhXZFkMcuns22zfkzo16w5kMEGj86AUt5S/xwh6TnqcU7Kt0GIFliC1xdZeSG+LC18FNNwLJI+En2EAi2negH1QgdiTIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HY9Qp6olJ8r9QlSVW8oAZlvOR2SqJus3qzj1J8TRYmg=;
 b=q7Bqxso0DTr/qZEmYpbxP8EdPkrBgBTsEb0++ZrxkTa5ceczbOsaID3JZeqL7TrhDLnKV4D7c9HNxOu/nlonj4Zve+yEnaCWYXTIEbu3ECOmF9l4yRD6psp+9g4iwOArQ4dyF2Nd6i3HC8oZv0uPeqhEZD3h59FjC7Bk+lgccqSYpC5CwWjNqKWCttiFe2C75FHwr0nc1Sf15hUEfIGHy1WCP2xMwHe8Soc2HrNiUCburkPTBj1sTi7qoJ1NJIXrPXyD6jxr2rqBTFN7Pi/j/0Cm0ecbTvIs8FC9+VP2UBR7sCD3e6g+h/kf2z36U5FN+aMgycXZbmVFSLiRQX/9Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HY9Qp6olJ8r9QlSVW8oAZlvOR2SqJus3qzj1J8TRYmg=;
 b=MIDjFPdPRWwei4JkAWRKD6Gh3wQaeL0oPGXHdDBMujMfZQNjHUgXyNO1LGB0qw40gKObRrbRSgK3n5zMod5TRwRCht0LPNiKGRz0JndDOE5WWQ+YEReYrv6y60xE1DdNFCE8VAQM5n4C6Kypwc+1TsVrWz+3KBegUP3vtygVITCXh6in26ICDaUH0iLkQ27lnnxhqwY/L/fJzURaBGVCpE2/yPhHKsTbDEjQbfTdwO1KBOG55g4e/FqMU6LpU1wbYCwFrNYwlPfoCZ5at9zUVRbaCXuWKhdWy1lnl/S14UslrNf2sZyFczotBFQET2atMCkUbWmTr8e81YPG26v4KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5765.eurprd04.prod.outlook.com (2603:10a6:20b:ae::26)
 by DB9PR04MB10009.eurprd04.prod.outlook.com (2603:10a6:10:4ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 11:13:48 +0000
Received: from AM6PR04MB5765.eurprd04.prod.outlook.com
 ([fe80::bc76:f507:9b83:9d69]) by AM6PR04MB5765.eurprd04.prod.outlook.com
 ([fe80::bc76:f507:9b83:9d69%5]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 11:13:48 +0000
From: Joy Zou <joy.zou@nxp.com>
Date: Tue, 19 May 2026 19:15:15 +0800
Subject: [PATCH 1/5] arm64: dts: imx91-9x9-qsb: remove unused property
 clock-frequency from mdio node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-b4-imx91-qsb-opt-v1-1-9b416d2dc224@nxp.com>
References: <20260519-b4-imx91-qsb-opt-v1-0-9b416d2dc224@nxp.com>
In-Reply-To: <20260519-b4-imx91-qsb-opt-v1-0-9b416d2dc224@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA5P287CA0352.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::16) To AM6PR04MB5765.eurprd04.prod.outlook.com
 (2603:10a6:20b:ae::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5765:EE_|DB9PR04MB10009:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf1c0cc-439f-41be-1b5e-08deb597b309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|7416014|52116014|1800799024|22082099003|18002099003|56012099003|11063799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: KnYS/eIz9318epbpM4srs/E4iDW+MeuGwrpCYbw08UmOmCFh0uVvtJl17tF5WZAN1eN5A3xfBC3M8ODkMU1QqXnb+8UtExipLO74jMVIpVXC/aVP6sbDr2O6AlnnbJty6GV/pc7vQmuR8U0ObDWj2YQJ0ME9gLwzM3C9dYSCdwZlgvbRBD83xpmNssdbOvcS2G59bdD34tFNFG46qaIU3M4nJPPuf+rCQR1m67uROHNtFBytjpQKhepI7Caqwx6pG5vVRouw6xx/h+TGjkmi2hOr1GbV+KtlpTsSJ4nZ6Zgq44FyEJvTpOb2CYn0+6tyAyLoGvvO/QP7EfCDbhdshYMclIBBHPESI9fpCFykFGU0g1SqpSpdd/aW2dNEWh0y7+VeYsTDbyqJA/idWBklrc4zu0aMhTatV9CTaPmoJxVPLP0doOhh2meGqnDs7pIcMW/bdX2mNn9zGIxS/QfzfabYpqZCIeaVAWSL3eMoP1qeEu6Qfd9wZYNv3J3yJeg4Q+BE4F1ElZ979/nodcueMTSRMI16ady92Nau0u5nmxFSw6VENyEznNcasrfuASVMBCPF33HkbnBsK/44Yu1Vb2kQgSIrC17k+PFeXxNLFV4bncw5dFaTRJqX2MBN2LCBjeBgsnVYGAqtETH1pFRZarBMeLlJUqlcA/kUQjCb1IDUlt6ULeFOfSOKSipnq+aszhkc2aJyCTGe/idLIxo2SDc358ptt999oKSpby8J5bIKETnF59y1sg7mb4fZE4+E6pFkrUE+xOMle3ZHQqm5Zw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5765.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(52116014)(1800799024)(22082099003)(18002099003)(56012099003)(11063799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NklBdkF1N245cHdaeHN3anh4aVZicVQ1aHJsQ0xXM250NWJiMjNNc3J4bWZl?=
 =?utf-8?B?ZXFQWEhXVDRKT3dZK085Ry90VnFUTmFtUGFKZDdnNTJTaHpDYkZvOC9UTmFx?=
 =?utf-8?B?RTlaTjJMc3JkV1B0UnAvNlEwZ0xtUVgyajNDUW5kN044ZE9oanFGckVWbWdu?=
 =?utf-8?B?MHFxT1dtK1hTY0RkVDI1bHpzMDgwNDBvTThpSU9OOXJEUWpYREpSOEJ1OE5w?=
 =?utf-8?B?dUxpLzRBZExDNUJjN3N0bEUvRzN3UWZsU2RlUkZmK0xKai9Hc1gwRnE3bWtU?=
 =?utf-8?B?aCtHS0lQbGlEL1BLa1cyNytkY0FuU3BMY251dWg1eGphMHgrRHZod0VwL3d5?=
 =?utf-8?B?RVZySTFwSWk5d2xFUnh3bExLdUZ5b3p3UHJCdTRSRmZIbFNnbmcycTNTZ3lX?=
 =?utf-8?B?UFZ5Zk9RSE9nU0VSOWhINlNWL1dpeERTSmhoQmFkOENCT0lobmdwQ0d3VEtT?=
 =?utf-8?B?eis1c2RRcmRxekdDY002TWVlVGtPRm9SSmp4N2lvemhuQVAvWDNvdWl3aWtU?=
 =?utf-8?B?NTVGWklKc2lFQ3pEVGROZUJSa0ZTZTVhRnZRTlphTERGMU9jdU9rLzdsd0Z1?=
 =?utf-8?B?UnZ4a2hRaERWTlJvU3F0Z3RSVVNIOCtQbERRZTFrbDBlVE8xYUd6OVIzZnMr?=
 =?utf-8?B?MnVteXdEWmc5ZjRVclZZRXE0YWk4OVlmbkcwYk1VVmowQ1p3eC9EKzBLRWsr?=
 =?utf-8?B?akdQNzk2TklYSjFrNXF2dWRJcURlbXNlMXd6eWFzV0VGNEwrWWlScURQVzdO?=
 =?utf-8?B?Y1VMLzVBeUZoQjFHZERUSkhxTFVBTG1FR0N4dEJYdlFkRGFobzliQUYyZ0p1?=
 =?utf-8?B?SHgybDJpNlJaV1ByT2pxSlB3eEFTSE1tbnVaR2szb3pFOFA3K0NxbUsvYVlD?=
 =?utf-8?B?TXJvd2tqVjFuMVIvaDB0YktRdXcxclNrL0xHUjZkbG0zOFF6UVh0eTQ2a1ZY?=
 =?utf-8?B?OWhlTzF4TWFSdDdBRktuTEFYc0RLTHM1L01iTE4vN3pGTXlXS3lvWWlGSDkv?=
 =?utf-8?B?MlUrSFlpU0o3SVhBTHg3a01ScGx0VlgxRFZHOTRaMnovU3BLaEw2MlJEaEZk?=
 =?utf-8?B?Rm5WQjZuUjJ4YWI5MDludFY0Zk9RK3JzMXNwU3owRTd5YlRKRjRmM3Zta3Rw?=
 =?utf-8?B?eGZpRDNoOXdiUlhVemZXaGpOckcxV254MEx5WE10NEt2aW5QWVNXdjYwK2No?=
 =?utf-8?B?OVVMRmNoUncvT05OM1FhTkNyb1AvcU0yRVY5UWJTZVVMcnNkMHZwekw5RVBs?=
 =?utf-8?B?ckJQTnY0WGhsaEpTTjhicFJNVFI2bzJTTWhDSENFZCtNSUVRZ3VkWVNqa3ZN?=
 =?utf-8?B?TE9vaHdiVHFzKzZLbUkxYjFxZ1hoS2NxQ3hHMU5aWWl1ZUZZQTVJOWRNWW1w?=
 =?utf-8?B?NjRIWlJGR0Q4ek0yeS9WYXJudy9zSkxPajZqMUZMYXVpZWVlR1R4MzNuUldx?=
 =?utf-8?B?UXh1N3BCL1FRTGExOVZ1UHdiaE5hc3FBOFNLSFRBWGJPaDdic3RwMFM2M2pX?=
 =?utf-8?B?V3Q0WWkrOFJqRldiMDFZU3pDcUxMaWdSQm45clVHOG5hMEFFanVKdVBZb0Vk?=
 =?utf-8?B?ODl5Rjl0T3Rsc3g5dkRCNVlIQkNHV1IvbHNmdUJ6NzZtbEY4RXJJZmZNQ2hh?=
 =?utf-8?B?VVBsZVFwZHdiV2N3MmltVEVyaXZ1UG9xUXZWeldqZ3drSWxXOGIySnpqcGdJ?=
 =?utf-8?B?c3cxTDZsUXB4bCt4ckdLQnp3SmJ0QkpobW1lMVBwNDZ3Mit6bkIvS0JsN3lT?=
 =?utf-8?B?MjE5YU5lZEhLUmtPUlNCTkFWcEgwbDhjeXh5bk01K1NTV25EUzFQV2hKY3dU?=
 =?utf-8?B?TEpqT2xyYlhWMXJhWWM2VFpxZkRQYXJ4ZEhvSDhqcXJFTnVoNWlXaU1kUjNp?=
 =?utf-8?B?L0pOTXlBNnlBODVBNFNTZEpJY0Q5T0tpaWljcFJlazRaejlkMmhSOHUwTmhu?=
 =?utf-8?B?dk9ON0lKc3pmQVBIeFNJa2FnbHBMNmVkMVZaQ1hkTElWM0Q4SHBob2VYVEVv?=
 =?utf-8?B?THBUdUl3cGwxTkg5c2lTd1FUZW9LVUswTkkrUWxXM2pzSHhvM0puSjlpMXho?=
 =?utf-8?B?K0xoaVNHVU5QNzE0alhKM2tDMWFHWlo4ZklCVWhXZUcveW5Rdkw2REZwOUo0?=
 =?utf-8?B?cUo0SFNJakFrZlFpK3BqdnZNbmcrQ1djeGFsZjFUWVN2VWdhRFQ0YUdkN0J1?=
 =?utf-8?B?aHlSeVRkS09XMTZCaHNMV3Zodk1LbUNwQ1Y3bW9XWlVXV1BIeGQrMklkV2FB?=
 =?utf-8?B?N1phTk8zNmZPbEkrOVYzZDZBcU40K1U0SGt2dlk5VHI3cDVaN0NDRWo0emxV?=
 =?utf-8?Q?53i+RuHUgQ+PFHdez7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf1c0cc-439f-41be-1b5e-08deb597b309
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5765.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 11:13:48.2633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SXDMg/yeTaTr/5XOQtEq7+gxVfaMiNoKiXyfatOe1h2upnnB/CpcuOstzMShkgGj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_041350_634277_3FBDABC8 
X-CRM114-Status: GOOD (  11.64  )
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

The clock-frequency property is not implemented. Remove it to clean up the
device tree.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
index 1239bbf579da44ab3f4be2dc566c53a1e5db6c05..9cbfe57be2d3c37208611dfba5acd428f0b58c3e 100644
--- a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
@@ -79,7 +79,6 @@ mdio {
 		compatible = "snps,dwmac-mdio";
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clock-frequency = <5000000>;
 
 		ethphy1: ethernet-phy@1 {
 			compatible = "ethernet-phy-ieee802.3-c22";

-- 
2.37.1


