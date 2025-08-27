Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED50DCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 21:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M8ehvwIvODCd9Q6ADCnPYxbUZm4GJ66FuV4mvvRZBLA=; b=rKlx49NHJhCXIlLW8LqQYf80oN
	6SCieJLMuiyPqvSNySkW9jrUPeiP7/q/LsrhrDAGM62FWhF+gUTThI9Vyn/pIQs7MYmpC7d4JsH2C
	NulbhuTkKfhaH77oVXNZMjYEntZwApshspOLpDsQ4Iy3VrUKFR3wAD1L29N6tQmpCAze27uSBDZxx
	S6IIvPSHg7KKritmafXZEantEnQ1RQkcyWODlUdIjH9A6e8/s5zAr2Cyoz/cRf8QjmtTpfmLbX9MT
	WBQBNEK4riN2enAecY+8yqrKKzERWrkg0jm+bdwmi4NOZ2CnRvFpkiyAI156l3IkU5VPS8Wjk0zgV
	+5ph1V2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urNgU-0000000GsAS-3tD4;
	Wed, 27 Aug 2025 21:27:58 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urNdm-0000000Grx8-3bSR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 21:25:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEh9JJKsbo19186sAKoo4/XT6uSZE4u39Bc9foyy50uMjMjt0uqpa8tfrDLFgfr40+GwoDdceDi/4fqFCC+gGN2UzjYPvbvBg2zDzuh/z2Z/RYntuoVeBY/ZF2x34wOADJdzI8QJmyTaQMizYHNNz11WaHSKJYAEH/BDv9oAxQi0lcTm8Jn9ZuDu44rhNKrTRKlqQmqmudo+A59ecZq/6dIKYxbvkgaiqUYu1PXj1ro5E6eHYf05k33oNg0ihKUzxrm7pkLIXh95Myx8MikvrcoyMOdOt4FpqX1gpr9GG3vEd9a6FiTncnIH31t9gHyYVae3SsEkwquBO1h6KmQIfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8ehvwIvODCd9Q6ADCnPYxbUZm4GJ66FuV4mvvRZBLA=;
 b=qDhfb6niXkAx1Fc+JFiOsqa2QQtwS6Hl9br75B1BlWzhxftLAeWq5/BcDNggDfv8639APisx+EA7jRPCI2Dcss91pusftr08RYKOkMz5Rlt43zclIWdA+s9FRSOQhOgCNsH/avo9kjl6PuZQZunpoiNujxFTLIVkGvvxhU2ovkpVqA/z14yts1ndZVBAUIGLZhhOA+1z+aM1kGght5ADAH3uetKqzC2UbHg+1hul6oQ6gptiqFUhrMt2karX72Z5DNKlwk2jFkTWkKNRrrjFFJaIATXPFy3lVirzDToE7o9jrejSfiZn8dKHTgzyRx7ajULj1viJauBrf0HhOPcoeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8ehvwIvODCd9Q6ADCnPYxbUZm4GJ66FuV4mvvRZBLA=;
 b=gQakyR29Q2r4297T0GxnEiqSjnhm0IvskddTZUVc2qDx/1ZPl9J45klB41Dt/oQqQ0eHpIXvsOmRgV8/KG4w9imVegT+FAIMa4+rRY7TEWF9/OkwxKg98c4ba2g8SoYq0dirN9TTLQZRCEzAMIOEyiZjKrCbKRiJI1V+jjgmX1LiEjaVB2VzjVnKqH6VEUMGRhGT7X7/8Mcf/I6nk729rdl3jobBrKJT6fKIN3bNeQWWbg49eA8EsvjU5CfAPklJlrEdtcJ4kr4Mik+b1sVic+b0fkk/AOzNB6oFYUiy80ovAdf4vP4O7j2DKgJnXzkqvySfiMtzGgFVWjSMznfCKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB9470.eurprd04.prod.outlook.com (2603:10a6:102:2b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.11; Wed, 27 Aug
 2025 21:25:01 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9073.009; Wed, 27 Aug 2025
 21:25:01 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"A.s. Dong" <aisheng.dong@nxp.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: fsl: fsl,imx7ulp-smc1: Allow clocks and clock-names
Date: Wed, 27 Aug 2025 17:24:45 -0400
Message-Id: <20250827212446.94571-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0108.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::23) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB9470:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a1ee92e-3d58-4d1b-3a42-08dde5b02e75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ycqyNa+4ZkD7+NX3SpXcrlEcS3wPPfqDmvXHXjqwiN2Y5r7foPvITEP8NvpB?=
 =?us-ascii?Q?8Oiq5BZu/FDce2wRA9UZGdtsQrGggqaAnfn5xzllxCCPPP5u22P8Lu7gQc3j?=
 =?us-ascii?Q?q+ZO2oZftaZAvTXN7AA2UOe3avp5VOmWr5pYEB1PnAaEZDyyrQPqRC+R/fhh?=
 =?us-ascii?Q?GbZ1TZzZKcL72GaAKRKJyIOYPzttoy5wY21WazNHkb6GUKV+1ne1lZvFPYn2?=
 =?us-ascii?Q?OsOmWLNjRwQ4yloF0zklza2sBLGoRwuMPIrx7WztdPFgmw8dlsuzwJK7b6eW?=
 =?us-ascii?Q?D046B6nLblsvtTzUJWkeCoh3hLFhFz2gU8s+VZp9AeDNQPHbsG4cyQAL5oh6?=
 =?us-ascii?Q?pMDuKlSb/LYvkFqO0NU8r6G8axW/JDz07ctevBIG1A1hWGf51C4jvMn6ccd4?=
 =?us-ascii?Q?Ie2XoIfTCPkOde0jOfYcjsYZw7uMFg9DWL0GksvNO33FuZccAFlGO7YnTtyG?=
 =?us-ascii?Q?SfXuc4eFbiz32W/nl9YReFkIKZKhgfXgqrKjjmOyIOVsQzmsimeyysajVIro?=
 =?us-ascii?Q?JJIdKPvGMr5wjn7fzB1+4d5BmldTK/XDzp5rV+JNGo7wOB6etqOT9HfKVNVB?=
 =?us-ascii?Q?sxEuGuZD311M3k5opJVr1zTWuju/c8Bllid86rrm8sto/KMj1nF8pcwEHBUe?=
 =?us-ascii?Q?cCaV4mCWRJub0NvFY4dC4etbRyYjeu9kiShn3Ohwxf0zzSEyzbJdyH6neAli?=
 =?us-ascii?Q?pj6tt6i6dReT59JwHRY9nvoFvQbyU74a4EVc45EN1HORRu0sSY2/6wTIaJAP?=
 =?us-ascii?Q?reTa9kUPJUxj3D+w0GfhM8Is82uRD8SJQvN+Z0dfFUBEjWlQcAzUN/n0tDMQ?=
 =?us-ascii?Q?3J+mgVa409/oRgKsKH8a19lYdBXDvjDErWfwSFdFV8BvhF6CxS5QpIZKOnIt?=
 =?us-ascii?Q?vKa0+brSJ9Ia8CUkYlTueBJplalrn5+haClo54OTVuiKOGN8tQH4d08D7cBX?=
 =?us-ascii?Q?ziWZxvYSOqtIW9/u92sZv1WaK+eoIRH+c8/FU+/kl+dFOc8FaVMjIVs3mnNS?=
 =?us-ascii?Q?Oz4cU03DVhCPMA/J/E4m83fiwkksdS7GiBPjMENelj3KveXurbfxUQ0RlEmB?=
 =?us-ascii?Q?r7RNdKtMW4wfE8FpoLTFwX2+Vhceh8LAODtfgDVv18Vy73zHYmW7SWWN9ubE?=
 =?us-ascii?Q?obnII+cPfE04HxU8YG9eBdo02tDOAj5nwLAgJ0DQX7qUFb8V+lWz0rfMY24L?=
 =?us-ascii?Q?by1OMEXjBCiwYkW34CryMbp7rjjb8edwtBajGIgsJnGwGiNmYeQFxFGK4oNj?=
 =?us-ascii?Q?9yFOkbMZfBPRkWb1qqFMnkGzqgAWebj888QulVYa76vyCAPOJ5VAryv9ohFU?=
 =?us-ascii?Q?RoFSsrW6sJOvfbzBZSSU177RTpnF7VL3ApRL0c+UYTne77gAXWWHKg2Qv3hX?=
 =?us-ascii?Q?40QNhKx0oMlvBOcSAgjtWlMUcH0Dw+h1sb6kFHDfHizmqfQz+5JeFfcmk8Zm?=
 =?us-ascii?Q?+PHcTDD1w36fk0tTb6QWpf9jZdByHZ4J?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vDIkK+AOdmUthj9XCe3SzAsGgriLmFY2v0H8lEGzqr+bQ9CDGqjtkhMlotQ0?=
 =?us-ascii?Q?IdUZKqknxmtO+Vm5tk9JaFZ6nuPMO96Sq7T91UzWm8MCV5ahCeam3WZHETD8?=
 =?us-ascii?Q?a5+420mJZXdAO90PH/O7NH17UHFSx8u7qGTzovK0uefoe1pvnBUstgr/niUa?=
 =?us-ascii?Q?L0gQ8YVe3HEqsUrNA+7Gn2Ddhnk3n4+5PDHbsrZgmjqZ++ZGwv/42WSrHOYn?=
 =?us-ascii?Q?ay2ifSbEIeBOzeLxJD2eTQ4w4Yg31C0E7CwDE8jB/+WuRXbs9vRZPxMJrQB2?=
 =?us-ascii?Q?8XrkIlrsooLFl2xXaKzZqdqNrNE7i1fpMVedJ/rUHG+doSW7Y78HJ9sVqGPk?=
 =?us-ascii?Q?WAhx1o4txAdrdE2HqvfxXXnu/sZu8tGIl5Zbd15uEstxOgNuUK4A4m+pFqb1?=
 =?us-ascii?Q?wAsMTBLRk7XjWBDj+4cuQUBvICQmWL/uWVISfggOu/OlXArYcL9CGwds37zc?=
 =?us-ascii?Q?yFUYN2jv6/Zl0ZwF8Y1HmLig0JDYRAcC2eZ3NfVOJJxQN/j4xjIkq0NjcWfE?=
 =?us-ascii?Q?BMA5+/hdphYb4Q6GDCRmtjva9ng3nETXx9QZoCT6CUmSuWPhIllc3yQAvWVJ?=
 =?us-ascii?Q?8LYQ7ubPx6YghdzGP0NTlnFY0VE3LF0KpifH5iFq1+3yCi+Ku2PZFiU2lQkm?=
 =?us-ascii?Q?BKlGWipL+rUn2aAT3nOwyu0mJoDC2+zkztm5NLuqdJUnRAcppwH/bYSymIhX?=
 =?us-ascii?Q?tI2xNiOf9279PngKcctE6tWGuBp0PZhxp45lHHVv99LgrTAvB9bUIv7l19QX?=
 =?us-ascii?Q?zz/57ZpURbW/0nn6Kj+rs1BL6rkp7AMb0hLH5WxX8NL6qOBe0rJIgBjzSQUW?=
 =?us-ascii?Q?uinpIBiZ/UEQ+qk9oMsYiz1tMr8BcTm075tv63Fv4uCaT3W4ezsDmSxK0UzV?=
 =?us-ascii?Q?DhlAu7P+LXGhxdS+gZ1rl0EBOmBVp+8BH4kosT+ZiXpX90Ioo5yGt1f3QD+4?=
 =?us-ascii?Q?nCT3cEq9jHcg/j3BQapKj4naEVFfoHxhC+RSuJW7254BXTT0GlztdaRpPY+K?=
 =?us-ascii?Q?ngFsuHkqqcL3CFqa4JxKVSZXLsOVpsm2Orj/wDnj0VxvKvoIIEsPIhVxafaQ?=
 =?us-ascii?Q?Gh24zSdiA0tcW+xpTtFOb0Tc1xbTtJk4LXdt7lEqF1cWXq2HaA3du6N7ew69?=
 =?us-ascii?Q?vUdVo1IEyWwaDUeCN+kr/NrF154fWUylseIFJk9SE23xkSqNs/xyCJS+7KQc?=
 =?us-ascii?Q?ldUun1anoc2IigdxB5wULp1fWdlezvofqpSWGO8zhxmfuUIup56vCBAwOWqO?=
 =?us-ascii?Q?Ig7VNghWb5VU+UE0ssanP444Lk7Elg+XsPIedKZCGkkPPoyrjpp9GOVFbhUE?=
 =?us-ascii?Q?GEVKUtvEnNsd4U4rJ4N/36yZ+j4ZPB/CKixf5V2BJ77LziNgwPqbgGuVaJ+k?=
 =?us-ascii?Q?38MZyhPnbcBsZiN27IwLjEBlqqqElO0KQhW2Vkfts39RXVj4bx9W3DErI6vh?=
 =?us-ascii?Q?QZSy5wqIumLWDv67SK5rgsd7TkrIyWCpQvK7D+2Lp1+ComKb1qBDq4kRAQYW?=
 =?us-ascii?Q?vI4YnXRORBGpMkxKdOryuMVPJWkqp3U4QSKLbIZe5HHYaSpRGc46kmRIVhAZ?=
 =?us-ascii?Q?qkwuwk/RD0BBiwIn4fEZKRyemuPQQ0oCin1EPsm6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1ee92e-3d58-4d1b-3a42-08dde5b02e75
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 21:25:01.6590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJioOgRZ1ELH4zvtlHX0nRO8FsdA0B8dZ0ZobzGaiIRoiTjDZYBxmA3CTH5IFIXHJqqKAhf0P5G0uoRFp3WmYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9470
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_142510_902071_428218A6 
X-CRM114-Status: UNSURE (   9.31  )
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

Allow clocks and clock-names to match existed dts file.

'hsrun_divcore' should be 'hsrun-divcore'. But use '_' to keep old dts back
compatible.

Fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx7ulp-com.dtb: clock-controller@40410000 (fsl,imx7ulp-smc1): '#clock-cells', 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/freescale/fsl,imx7ulp-pm.yaml#

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.yaml b/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.yaml
index 3b26040f8f182..9d377e193c123 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.yaml
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.yaml
@@ -28,6 +28,14 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: divcore
+      - const: hsrun_divcore
+
 required:
   - compatible
   - reg
-- 
2.34.1


