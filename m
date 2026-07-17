Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07623C44520
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 12:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glJJmp8pI5KvMl0ix2IpOE9clbEPyYS2LWpiIVB908U=; b=5Cz1g43GOj5jpOQi+kGJy/hhFX
	4rTuxnCvkIO1zNPFEkLVb7awxgS2Z6IrO9XfCFvbpaI6lBQVDSs2xqWGM8nmlDU7QJMP2sut5ektS
	FT2jfmVltYi8HrHWg7uTHqB5X/wEvc8IWALVi3b6JNpQcdr7zKfeOTdW1beuGFshG06b2pQdniqwc
	WpL1VbYd4qvmnivk4dSK/IL4f7cE7s/gYtbvuPuPC24xlJvoC+T9OaeomezxAz0wVfnnFSWFgE0yC
	zdeNzDYWhCQIwUrEXK8NiaN8rwtGD264lngcUeYPIMnbZQyJw2pZleWdlUa6rYyg1BlMFNLTcfJ4+
	ka+sk+hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhLr-00000002EPe-1mwi;
	Fri, 17 Jul 2026 12:07:35 +0000
Received: from mail-northeuropeazon11012038.outbound.protection.outlook.com ([52.101.66.38] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhLW-00000002E4y-0sCP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 12:07:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wP5Fj66wqq0881rPmIcdqPHIb7vov7o+b8ZOrvJyXMF71ryQ6se9IuXMtLHP7h/cbQrZLX5VmHBj5AbAIJoOjgpZvYzGOs7XsETLY4zuOlufCRb0Apuuh8Xz6PwQjND8ww2jp1VsvtIFU0sx7QrEREieSBbqLDFfr68tdRLB9GEAwY7pmmjFz+fRkmwTqbSkggQsM64rczUUNcXj0BegfLmUhHkd1SBrbywfqu6o353SAQ02u5yym59yPhTwWC4BhLqhxqOMNo/2l9TiXcExmB85QvmiEukdjT9b72LeKXdeMrljVOYRV84rSoX8ORedmsoh1HOF8LCv+zB+mgaE/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glJJmp8pI5KvMl0ix2IpOE9clbEPyYS2LWpiIVB908U=;
 b=cKSoszP86UEgruTdhlvquJNo297ll6uIk1nCfx9h/Q1ADBsIF8zqcVFGErz3wdyRaVoJQzKrGwgwBzTWgcoGNGQ83A9W4Pg4/0hAx8aAcG/l6s71929ZNX17eF2IDCIa3nWIUs0sD+EkGBqZ8KbIp0UURpQ0qnFt9lSSzwW8jip5X+FO/4sWEMg49bqLlwaqlOcVwcriunnjYpgBK5rS25dWJo8KoquOCvqUUp4QGdEWAEP0Nrh4093nnkW85oTtN9jHDnERtOEjBJ5YRxmEhlrfDZolC6iI/NYrh7JJcC71Bm6Fi/8Ho4Kx4jCOrdlB8xJidCqnCoi0j8GzUaUQPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glJJmp8pI5KvMl0ix2IpOE9clbEPyYS2LWpiIVB908U=;
 b=V9lBmIQrJQpvSZvPsPw+N2zwTnoIj9IiWlEHqYZDIbz3eYuStFD9sLlawmbs/0FNPNZ/eqI3ReLKV2W4Qyrlyw8ej0tWADk68yzhw1Izij/KZlDBfalg7oKniyTue9CwYCwbTdKYDtH2h8ldQzLbXHV3ckDNMLcQEbwqu+656ss9hV1OKdNlG24hw1Bwq/SqKofaUgTmpngbFOfvI9lWtqmgo/AJtt/QEgHZ+iBRbmpnDrlBfJnhYO0yABN3L25t94gzKfS8tyNfPiB5JuKfdS3MHGafeVTk4WJPhnocxlgMF0eVGoUjZcwHwYv7mjM36IM8PieMkHN+jRwSwvDk0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by GV2PR04MB11863.eurprd04.prod.outlook.com
 (2603:10a6:150:2f9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Fri, 17 Jul
 2026 12:07:08 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 12:07:08 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux@ew.tq-group.com
Subject: [PATCH v3 09/11] arm64: dts: ls1046a: describe the Lynx 10G SerDes blocks
Date: Fri, 17 Jul 2026 15:06:33 +0300
Message-Id: <20260717120635.2118610-10-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
References: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::6) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|GV2PR04MB11863:EE_
X-MS-Office365-Filtering-Correlation-Id: 08fb8ab4-d75d-4de6-5be6-08dee3fbecae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|1800799024|23010399003|366016|10067099003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: BbpZ42wGG3RmRZfNFH2UvFyEbw5a7f9pqnZF0q3LY+8V2dcLVRJpSctSzxki560ud588Of0eErbunVr4kJG1IuAjPe7Y8sqL6ne5Ppr00kLpXhgMyLYHEhG1AVPEAdD/VuoKo4p8TVclTzZVJBgvjyR0tdfJW1sJjtxDJU6FsaUa6txqWAu9n3ahdyryQsnGzhuBFJ0Xve70xZg62j5V0sn0NCGKtE5ahLQI1eLUvyjzVWrGSS4HSvtax3DfQbwER1rmt0mHmNQXoDzSjJjtRrLk+JVLOw9X0VR3oeeTPo47iSePjCZsA7CznGgu0qtRQO3gy1WpgbjICRoP/dL8XFPoGQkQzyONc/sc6jXUdEs0HQyIyTfOSY//nI7Y4RxwJfGo4QowwoQ672yKLkUX3YdCGZehMs4rwqmwW7RZ/Y/RaELas5LfOI66C5XNGpFSkNsFAu2njFvwA6EthgQWfIvIX7u7qJcEcBzBvbfqyDFm1LUIkVKXoHAF+hPUbbRrO3AGHjd89Pyy+1g05XQ10E7wyPVXFL0iN4RWxhU2WOjNp7ZdsW1KDJxwJRD3ga3GLH0zI+nxLj2UuY5MtOwYQ1v+t+D2yUTd/3nJwkyvTZUDHhBGW6gSKTiNLpi/EuE8DHOMeIn9lrk5iHTuLNBtl+mVOPZEbe6gDHMGtiJa4i8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4hAiKIlFkfS2FBDKEgwg82l0fiR+EGtxsxd4rmaUpLdZFqg1NLbc+m4ryq4k?=
 =?us-ascii?Q?2nT5vrRxNThGvfHF11f90wxjT8Iqa++IdEab1ahF1E6ATZg79ctfVN11Akxe?=
 =?us-ascii?Q?J3g1WyNiQEeSXa2LAPX/mYVdF+IQPB7C7sFN37b7m6ob+TXUGO+11dERG73o?=
 =?us-ascii?Q?+mLnB33i5YWr92EUnDSljyWKIYgzDQTVhHBjE1HGublCCKu82xn9S9Bhq+CC?=
 =?us-ascii?Q?WXRlcNwPB92Lh7iP5t0YAWObhcl+LHC6ZgryOx2ZaARfd2nhpg2p2ObzqKGu?=
 =?us-ascii?Q?VPOeJCf3GIzqy9VHmi91uCUwG415GeHxCgOINywTTHb0dSfPK9Af2QZ7uJzk?=
 =?us-ascii?Q?Ro2erwWA8Vi6qQcHT/7QQK2GgXTp4vZ50IU337IOfy56FDOVrxWgY0VASMQt?=
 =?us-ascii?Q?W4ficyIfDM3NCMrnbm1lQwlaOM/Da4qC2fofl4MPIMWp7tUpsXRQ7VFQ00Wy?=
 =?us-ascii?Q?2enKMW2cEcv+E8IuMxtWRwQCwNJn6keF7b1HGnwjqLYK1meFSKPXotxJdTB7?=
 =?us-ascii?Q?WNjXFdYHziZu6TuzAlOScmurA8Mwqr37EKMpnd8rxKdKsF/5/bbUeBgj3IjH?=
 =?us-ascii?Q?1LM+iPzKhQ/e0QiHni/1aU05I8PdDze9dpAkuY0pK/F8maLXXT3ryouGn8U0?=
 =?us-ascii?Q?shJ1xZPIsd4J/51arZYqMOozUc1yCFeHmAJcD1sxMYRRv6DNYx2AoZWYE1uv?=
 =?us-ascii?Q?ozZdOg/zBQIlSnHdtThmfC8PhEWiJ6IczgnRB/eF3CMFS+uZru7crT59pVCQ?=
 =?us-ascii?Q?M1jxqnBRLkGTjT51TQgjTxueZeE06RuVIvBL3rdFYbg/fx7Dg4CYbm6m8/d/?=
 =?us-ascii?Q?0TqPrFDpeoREHr1A2wanJ4QNxjXx4w1dQYrVkPJf54gK1xZMvPffFdLzYs+P?=
 =?us-ascii?Q?4x2/jHDDhI3NC62ObBNyXNZ61V+KUuXi3bSKuJ0KdQ4oItANUinF4yQA9hGe?=
 =?us-ascii?Q?RUn0FHEM/hWbKsRebQVluvvnzhwcjbw/11q4WhXC+Xb2TZfwUrrwrzzS5vLY?=
 =?us-ascii?Q?NlyyDN0XA2FXmV5lDni2TgjyqSjmY7sqZTAiQeK3ZAnh82Oivm1fNhkO3S1z?=
 =?us-ascii?Q?8m5asVvyySgEx8Rg9yE0EcONCVWcll3ZdHbb78JcTh+C8SWD569hnnRGyFuu?=
 =?us-ascii?Q?fAQaWBAgtcGIGg7A+lm8fEUYxDx2POuoC7GImHLt0PaSrgYl0saKHbtNB8/Q?=
 =?us-ascii?Q?DorWCbDcpxxacHU3JnyJ0p3AeByH90Ao/+1rsmY8TtL6ScPlMEwqYwgaiqHZ?=
 =?us-ascii?Q?3GLlG2ibp14AhzCltq3IElV/ylfilDzCQP/ipYIbd5EXyybAmhu8IAUqzMbZ?=
 =?us-ascii?Q?ZleRYUuliRUa6D6ki7bemiYhZEg17DmLXoXOQYqG7PSXD6wCxZ5fpLGAGNWL?=
 =?us-ascii?Q?9BtjVCO1uBAG7AhhJtKbvYFsGp14HWXO4PtZKaCa5RgFwuK4eo4c4gmi0VHx?=
 =?us-ascii?Q?HoL/uItN9IWR9mdCWKXe9S4r+Ut2ZneH+Xlyd4wrN9tpGn/gfY/cUZnwNZRE?=
 =?us-ascii?Q?ahqGmb+q6rINTsLQTMFG/WEIiU0P6bYPPxJsqSFm/14LQiI90yECq5jnL2Qw?=
 =?us-ascii?Q?F1cZdUWxUm+tyHMRjwLrWQJqD5tbQDTaxX6fpcDtTUYni3oZK34jU8sec8aG?=
 =?us-ascii?Q?+dTx/0jS9Ob7Dh5bEEE3YzJMrH8XMdhfDSm58OFUZM7sJDGl2RH8NiMQo9Gz?=
 =?us-ascii?Q?AZW+O3y3YdeUUyzIhepZ7kGrUo6GMGx+IGsWVO8b2vH+Ld9OCq9ud/F1wcrU?=
 =?us-ascii?Q?Cs8gCEbqKg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08fb8ab4-d75d-4de6-5be6-08dee3fbecae
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 12:07:08.1939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehTydpRvXjf0CKZGfnLoo1svq+XK0A//jyp5fcqAIHpXgi+eHF1jI2Uk1Jm+BaOF4dGFvLjS9kuBdS5jrhlgdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_050714_257513_D35ACFC4 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

From: Vladimir Oltean <vladimir.oltean@nxp.com>

Describe the two Lynx 10G SerDes blocks and their associated lanes found
on the LS1046A SoC. The nodes are left disabled at the SoC level; board
DTs will be expected to enable them once the consumer Ethernet nodes
appear.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v3:
- None

Changes in v2:
- Change the size of the region to 0x2000
---
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 6fefe837f434..270a97711a69 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -424,6 +424,66 @@ sfp: efuse@1e80000 {
 			clock-names = "sfp";
 		};
 
+		serdes1: phy@1ea0000 {
+			compatible = "fsl,ls1046a-serdes1";
+			reg = <0x00 0x1ea0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			big-endian;
+			status = "disabled";
+
+			serdes1_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+		};
+
+		serdes2: phy@1eb0000 {
+			compatible = "fsl,ls1046a-serdes2";
+			reg = <0x00 0x1eb0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			big-endian;
+			status = "disabled";
+
+			serdes2_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+		};
+
 		dcfg: dcfg@1ee0000 {
 			compatible = "fsl,ls1046a-dcfg", "syscon";
 			reg = <0x0 0x1ee0000 0x0 0x1000>;
-- 
2.25.1


