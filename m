Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A469D39418
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 12:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1iN4ghA/j2Q0LVDr/jaJG1fnxy28CZRsg28y1YR0EMs=; b=XesNFkoYxDtjZ/imy9JFgkPvP7
	JJ2l6IBqXCrp2fvJ2wBWkeJjfmSiBeBnb9Anu3g3A4X1E/3V6Yxq1b8SoO+iwyEQF3axUn+n4Zgoq
	VaKOjrFiI1jE1FN900VvrblgVIDrdc45rEWjBM2efblLrLSbPy0sHSZbuFbUE2iS/cFBuhcOCByyn
	yxEm4sYYb6YMIZSs3h+fT4z5hE4dkIHSzQhbiNtiIk9iOXwvPNGa+X5pAEhMSnGl1XTCR0J/sSTkb
	ZRghV2c2Fc2JNaNNLyhPBnUAbplzg7nGG8iW8jRC8aYUNwrU4DJajoQ0Q988mq6pBvDhIQK0KrPz3
	2k571t1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Gs7-0000000HYv7-3ZZw;
	Thu, 02 Apr 2026 12:10:03 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Gs5-0000000HYrx-2Zxl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 12:10:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NR//ddo/j80G0tMRqzFp9s4V5YCT4yknney7aLuP/EowmRiYhQwsdUvZo22FfmCxfa1qbHrFwB1u+qINNPcu68fE4AIP/1rul7IGuKG3y2buG9FGHRA1etK8+DKe0x0ps5Q0oUzSwTVSYu+IrHm47muAyKWpCRRt/OSZZeoNSUTO/FDiYeVaJiuiOS4sp9+fgnzOrHcItapKmfqZ2q3ZlembTQKa6iFK5r5HOYDSFFNqh5YuXtFgw+pDTN2VlV5sChsSuGDfgNaycNJOF7zP9ZNYpV+VkHlJQSmyNQSgm8oO9A2WlOqDbNrN8QmRTzsz9fga8i/eIdTncDW8vLRzPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1iN4ghA/j2Q0LVDr/jaJG1fnxy28CZRsg28y1YR0EMs=;
 b=JhCoF6A5bWomwM0CBFx9ZxXFrCCrGO35TI4NO2iQ/PBCkWOMjYHk7NwJCNFQ3VlCC5N1B1stWKzHZCJ9aNbFRWTyrxaNKjqWWBPh5BoK67+D3VSGDOoUSljJ3UOzI2ZCXKqpiZ1QAqMn9EHdVEIfXciH9qpObwEhuwL4/8G+jl+L/KKWGILPbDhgr1cGO0/wsuocJD4qpD+zLoettvQOgU2DyV7DbKoV8IOFtBOfUEYJA+hNngFLyqfdH9+lgSNlS6exKQkl6d6TvzySb786bZs32TO7yQecm9dM4QqCqkf9eJ4DNl1ETMDRXJBdBcsRs8rHX8L3Tx4fC0GUcsrvCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iN4ghA/j2Q0LVDr/jaJG1fnxy28CZRsg28y1YR0EMs=;
 b=GVun3WnUKrQ1BtdeLR1vBCNZWF/cy1XpydC8kv7UwoUnUegkAOgkkX6FKgEkqDJQKrkq+86oIr4zpqdVINaoQ3YbLQXDKZdp+eAoOR/PEFbHe6nH6e7GozEIBgR9pXlMwG+ifodCUyvYwVCd8n0jplquF4U6/Rhd8E9bpswy9TkCelBLUdAFD3u9ByYL+oRCstV1ksBy1xcMTHsM+9nf6kmY3ENVnoCeyea2zdLteFTUB5ckwvqAHxfh8awlyKddttn9X6hCbmrvn+Bhx/3hWYk6Khn1eyhp7NG/mEMVOQNvaBUoM4a4lzY54IXD2xVqzngXQ7cL8UYxLxF1f0grEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by AM8PR04MB7457.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 12:09:54 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%5]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 12:09:54 +0000
From: florin.leotescu@oss.nxp.com
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com,
	viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	festevam@gmail.com,
	Florin Leotescu <florin.leotescu@nxp.com>
Subject: [PATCH v6 2/3] dt-bindings: hwmon: emc2305: Add fan-shutdown-percent property
Date: Thu,  2 Apr 2026 15:25:13 +0300
Message-Id: <20260402122514.1811737-3-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402122514.1811737-1-florin.leotescu@oss.nxp.com>
References: <20260402122514.1811737-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0312.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::19) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|AM8PR04MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cef181e-f794-494b-910d-08de90b0bfea
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: l+MqBbZMhhdWfKkL0gYyJPN7vLAbjcCG+G7bGiJi644vFZ23rEwkm9MZpynJDhgK7cFgqJrCs3FGVWDV2rSzKJb3hw5YJ7JOnnC+ckFx9RzgclqrxghrxPAJwc6M5G3sp5uTpxCExnYCwhKI+wQp9HjE0Jy+xwOiH+W5r7ugVbeczzBRVNd7ODkYyJsym/E6abI5HJZ7+5/EOY+l7KdXSM113vSuFvZUGDFPpQuxesFHFfB6o8hRNUecVs2wcLJ38vr3MRb3Mx3XuscCyV3TzFmr+TUTVpgQSot4g3GR8i4d9u8Zdyrt4JNuPO4ASQToDz/oZSwF5ipgcDeX3Wk58Qa18CamaqrxGwCE+FHdLz5OwqCVfc/ctW67KiZvJMY7eDJXnjIuKzwF19BhDq9eQco35mmGQaLWVB0q12nqpy2gfDKYa6Z8gzx0NuHwMlxxIyky+JG1TYrVqf4nQNvfRfh44EXd62U7XC55ICmWmqg96CiAQN3m+GSZlVUupYD2+oyvlXls4H594qRvc0E6YharOrW97K3wFhXkBMrOsiT9ae8WDKoat+pv5t+Wzyrk4uucaVu4ZT2gF8bK3u1Kqkyq7KDQs3e7p5dHN5YbgdjuhO3KuAYHSWoU/guyYdo4bHJDx+ww/YqFUw0jhoefDBvcDccIvrcfRrRFfePKthPuUcPEuRlrV88JIL/cRXWrtn7iYWr2yArqXyq8wzngjmGUZBPvtQY0hY/II6wAkWI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?W1heGlYnRXDMAomOgAM6dD384snKbF868RsfaMwllvMfd3q9hB9dp6eSoa?=
 =?iso-8859-1?Q?S6CHX9zYnSnvnfQSqZ6m990DjL2ZOwtzvn3Q7TgwDhpcp10tsmnPo+w8ez?=
 =?iso-8859-1?Q?cVj/8gfTXrwAIqd1qaSDOSB9hHVbPDSVEE0z0A16OYL+KqPoMQ372JWPRz?=
 =?iso-8859-1?Q?oN7GjZoYZmtcPC2rpcgNRUbASQnG101pGXbuicMAECwR6DOkkv1oeD52Ey?=
 =?iso-8859-1?Q?KAr3pxKbN+Nb1xUGbP5Jr9Yraet5cFDLfkjZOswGUDgC56ghzwBXvpY02J?=
 =?iso-8859-1?Q?kHkLaMh0mXjsjlX3ctHAx0HAvzSAK3EMS5NitGAj+ob8VWH7RDwsUGVpkj?=
 =?iso-8859-1?Q?mgRNsqZghZX8ZUlqDfcAXEeVZg6VHke2QqlgEtlbKPakI/B6cOfjaMIUjs?=
 =?iso-8859-1?Q?9v7dEJip1JE23SS2hLy5hBgjUWGIqT5RN2I2J169zXn5NBvDFPiqDbVnpL?=
 =?iso-8859-1?Q?B4Q/1qlM+yF2dz9gF1rM9sVqQSPKgKE9hI25UzMtOVXv35yFbNFwUjbTA8?=
 =?iso-8859-1?Q?s/25uR4SNww92CTgu9kba91RJrVE80HcWIDPjTl8WIEp8MAy80E2VaHbku?=
 =?iso-8859-1?Q?oaYNkYikdAkftCuw0UcDNegjI7hredL5Ok8ElXH2p7Ot5CldYPR9M1VoTX?=
 =?iso-8859-1?Q?H4rj4PohkXn1V7TjAztnb6Hm2kzPIXf+SnMYPe/A3ENM6loglfPY4u02pS?=
 =?iso-8859-1?Q?vWh0yj7aCsTVrJV+IiA1qs1aSZ8IyX8mHtXEEkJYMMwWZygxc53KVeRAGl?=
 =?iso-8859-1?Q?9pvBSLzeDvoJr/6O/yA9VcvKQrZ1Ud+uDK8/m7OrhIxEg+MArsW8XQI1mF?=
 =?iso-8859-1?Q?KIrJkX05++MJ1AyWdjEBd/0pcv+ZqmdP6qrpcYWPu5NxWsWlNNH2AqPQ2R?=
 =?iso-8859-1?Q?tyVQObDNZlAAcQ/jOUlAni4poKZ/Q/6ajBP7V2arybzHF/i9Qp2mtwHzoS?=
 =?iso-8859-1?Q?vEWyMXbW7smbCnwGYqHlvBOb/oxw0We0yrP1Q4btxXFogwAan4oMnsyBnX?=
 =?iso-8859-1?Q?Hj5IV+QXdqWEqx/ghGpecVSiee4VX4w1Ti6GhZdz5OmHXF7x+CcCJ8VVHM?=
 =?iso-8859-1?Q?vXTibWsO5yHeP/53zK0CuRIG5e43toQSfvjgB7apKXiEWWM3ZHzhJVitVw?=
 =?iso-8859-1?Q?kSfhh1Q6CxrTdygIGYgoUuxv2M4L/IsjBnzy6qb9oLRPidXFqVCO4pUQPt?=
 =?iso-8859-1?Q?bFRni7oYwSSV+z//Z8mgHfS31Z0Vm1xln3pYHdknoQEm+zuIbiFapRtGUB?=
 =?iso-8859-1?Q?Pmu+HpnvFdBBW8dlIQS0BiNWe7S2FlJTu8mIQehXQsZVfJHMN/Sj9M8yJk?=
 =?iso-8859-1?Q?cpbPgZV+hvsW5gZorvZ6SqJAFG9DD64GHjZCktjXD+r9bNnX892e9x8fTb?=
 =?iso-8859-1?Q?eOjeZSedqw4f8pArBTdRvrhRG8v0r0oddW+OSn1IkuF5/49itUEqn91mG2?=
 =?iso-8859-1?Q?7MxJJrQgXhAC9RcIp6S9msAvZwujwixZ+EA/hCcK9lTb5ehR56QrZBrlP8?=
 =?iso-8859-1?Q?Gj2KwCUlIkBZozZwnagHDGwl04lwqd1cZ5kcqWF+0TIhq2UQp+1QtzWb05?=
 =?iso-8859-1?Q?ClQBnP/bx65hBHk4Kxli73GfKBdwsaWVkj/vardWSiDowOorO8MBCAmE4I?=
 =?iso-8859-1?Q?V2969XfsjrXXqYTCx8XAKDsAw9ITkR8HxV6yTzoprwqvlnMTEk/GdVwTCh?=
 =?iso-8859-1?Q?S8eE9EhHnGclO8ZExv0d2Fj7hSU1d0PmtCHD6Ye5iwvOhNXghYPozO9AAb?=
 =?iso-8859-1?Q?hKSnVG06YvrIXMlA3sGgHtt8EcV49oUYidus9snQG0Px4HW+wlJVDCXlI/?=
 =?iso-8859-1?Q?ZQTJumR5sg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cef181e-f794-494b-910d-08de90b0bfea
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 12:09:54.3468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0DPOKZd3bXw8VthK0ll6JY8AxLTrkTzKDBSttguBYGTGFEcqVrPk43JiCxnyWC/HPT4SqscpOxae0zaov5fb0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7457
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_051001_662243_64B0D0DD 
X-CRM114-Status: UNSURE (   9.80  )
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

From: Florin Leotescu <florin.leotescu@nxp.com>

The EMC2305 fan controller supports multiple independent PWM fan
outputs. Some systems require fans to enter a defined safe state
during system shutdown or reboot handoff, until firmware or the next
boot stage reconfigures the controller.

Add an optional "fan-shutdown-percent" property to fan child nodes
allowing the PWM duty cycle applied during shutdown to be configured
per fan output.

Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
---
 .../devicetree/bindings/hwmon/microchip,emc2305.yaml      | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
index d3f06ebc19fa..8c2548539d7f 100644
--- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
+++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
@@ -54,6 +54,12 @@ patternProperties:
           The fan number used to determine the associated PWM channel.
         maxItems: 1
 
+      fan-shutdown-percent:
+        description:
+          PWM duty cycle in percent applied to the fan during shutdown.
+        minimum: 0
+        maximum: 100
+
     required:
       - reg
 
@@ -80,12 +86,14 @@ examples:
             fan@0 {
                 reg = <0x0>;
                 pwms = <&fan_controller 26000 PWM_POLARITY_INVERTED 1>;
+                fan-shutdown-percent = <100>;
                 #cooling-cells = <2>;
             };
 
             fan@1 {
                 reg = <0x1>;
                 pwms = <&fan_controller 26000 0 1>;
+                fan-shutdown-percent = <50>;
                 #cooling-cells = <2>;
             };
 
-- 
2.34.1


