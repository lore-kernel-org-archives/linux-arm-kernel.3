Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9971CEACFC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 23:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=; b=HGlCc1pfeTmRTgZf5CRTtWJwOh
	50akukgmG7lLyJoBOPcxnSaG8Vno4jo6D44h0smP+/WuFAM+RyIC3kmNMAu3oUE4eJGflBv8WtqQ8
	S8hoI3ynSmWIipfpcPS2l2JDx0ctQhoMhke1BsFLz8n0NoFibAhqT5lxe+k2xjTGg6t4vs2SCVCu/
	Xm52dQwORUGq+qgp03fmAkDTQn4UTAlJuFUV2RcTNKMU485PhEVRPMt8xOcMH1P+o2lnDfV+OG6Jm
	AQ7ZGW0npbJGJ6wdYOpXxxPC4c+eVOULmDAXuCyXlgZmLh6blH5li5ZB7ZDIKKDM0bCBM9me2p7cL
	AYeHzFZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK3Jg-0000000DDdf-3EOp;
	Fri, 14 Nov 2025 23:34:56 +0000
Received: from mail-northeuropeazon11022103.outbound.protection.outlook.com ([52.101.66.103] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK3Jd-0000000DDZ3-00Hd;
	Fri, 14 Nov 2025 23:34:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEhtHdNivcC8JKcntVsXWuqMjjSIcA/hDE0inuzhK6tUNpTpBz+/2zcY9OffSMXWuYS1ZS0SJZB4HTbXERveCi6975tzdmdhVHmR8Hz91+oxW1rEGwZlSkJDaHjxqDpVaWkb40bDaVE2C1jFTsy3f4zsTh1z7Uo5kNNMHX6Zd0dUX53fi6t5ywltPYWIkboiA1GVORyuxPdW0AuvSFJym6L0wFBfRzm48pFTJvI/WxC0+cCLQE45VGvCwItay+viYVIUBVnV+LXXpoY783ZhUzz9aaKk0CYmlUcoAJP9iBG0CsSIe4V5FXs6qAgxHEPJ4EDP9ZT8Ck5JbClr7xdEJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=;
 b=CvcmG2p13ifqvdaq7K/VGCvE1l1e+UTb9gzZkyCKGJgZpPXSq6yHZQ49LH9e9hJoQSxHJXFlg831NnBdjnNLfmJ+o02AYoK7sZNYfwXhdBy5aszTH3YzNZ7o9eL9GC9fpqqR46995RgyWnIqb/tYXJHd9+o/CNGgZwE+qiuH3f577Ul8F4+rtyOysjVJQOOzd5HxAXm2HMq/gKDT5D6yNoFjujQI1T2v0I3URFs+e7vGxhvjKzI+e3V7MunjencN+6hkTzB7jXcZLsosWSC2tKb7Dcuo8InwgBc0+6KJhr64Y98k1Qw2dZDrd1hd3jY9SsfXqTC/4cdAwAKN71bE8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=;
 b=aEO0ZS9ESFgX4L+VUAt1drrkFa9aW3qL952IoRRwbhrZJWDLceiLxQW3j40wROjaR7dny+wxjHdm+0hKWnSGq03O6ObulvOD5GLjRgXj+b9hwJM42eoxIswPguJvyCXhnqC/N/TWFNjiBIu4RTxs1yCb117hRmA9HJfBiqJGmt36RED3taAS+8jnuSHOGhGqztlglRMT/ipUl36jzDDqs19Hu0i0j4xLndD83IZI9puujyzvMu6deW5PWQk5YV0IF25nOCUIX4WlOKTHbWOhjR2VzDPEN7M0GjPhSgv4DT4QHdWCCYZRq67eqQYvfLFQwg/eiDbe+Xpro93DjBOEGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PA6PR08MB10739.eurprd08.prod.outlook.com (2603:10a6:102:3d8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 23:34:45 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 23:34:45 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH 3/3] arm: dts: airoha: en7523: add SNAND node
Date: Sat, 15 Nov 2025 02:34:31 +0300
Message-ID: <20251114233431.1920015-4-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114233431.1920015-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251114233431.1920015-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0902CA0054.eurprd09.prod.outlook.com
 (2603:10a6:7:15::43) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PA6PR08MB10739:EE_
X-MS-Office365-Filtering-Correlation-Id: 0397a3ce-8921-4474-980a-08de23d66489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i+hUC00MfbfkDgEYo1bNSd9On2vk93gyHHkmAmCnKwrJ8DufusbZ509OFtto?=
 =?us-ascii?Q?ATiQNsQGUm7uHlV9iW98gS46AzJRfQIqFD23qoFZuHVvnrGStW03NcmA8K5c?=
 =?us-ascii?Q?5GrVFyjmZS2JSOrMHRiQ+802IW9LkiHWWcI6IaAI/l++EoO9aFbSamk6u/E/?=
 =?us-ascii?Q?awNTAhvX9rrVt9fxDaBQVAP4vzIs4bTsBkPsjlGwMw3d90SAG0RxJXR3Pza1?=
 =?us-ascii?Q?kxlA9g4vf1mEt3AugUNn0RWr0KL2tZ3+Npm4ZHewNPNWp7t2aCM2LYe9UHK3?=
 =?us-ascii?Q?2OEhvzkGjcDBIcj60CzhMtHTAm06/U8H1qkTyTMgGaIZKARefV8s4E07Hk51?=
 =?us-ascii?Q?Z+3B/gwHfs+lANrYVMHppyWwYRuG0/f/dTWdlNsEv0cnp9mGZ4a//UcKeman?=
 =?us-ascii?Q?FSM/vne5XZZB6zq2hf12mAm3T7jsX5Up2NaLM3DzA5+xaHOANvf0Dyw7nSrP?=
 =?us-ascii?Q?LoNxwbdNwSDYTZEVctjwPyfv46GHF5ejy3HGgEPSCSOGCXqvJ0m6r4gQSedZ?=
 =?us-ascii?Q?9CtiZT2MqkV64rsbTL8mMqVpQjTdY/TuE1Dz9OwtPCfMfEBUZmr/Ti0xEMGv?=
 =?us-ascii?Q?zYqK9DH1SXx86IgljmztKep/0NdQCl1C+xAlrMcctxQ3tiU4ck6Wt1/GevQB?=
 =?us-ascii?Q?Pt73usu3YWvO3okZLUQxRks7nMuW8J+9JUmyua4iojd9RVeF5GABl/qZdz9W?=
 =?us-ascii?Q?pQflE+Gxe9QW2H5ynko+nNPtH+LA1oiCGLaN8dKGCq22KleE/2vmFONaR2xn?=
 =?us-ascii?Q?h+M/xVRBh+WyM4bv9y5fbT97oHY7uAV6b7dhP/reHo9XHKFRmK/L6IQbh4fV?=
 =?us-ascii?Q?oRG7esiJt9u68fMzG57TsFWraKoy5mz7w5q7UttBLgxjUGFL+5IGBxwM3wGd?=
 =?us-ascii?Q?PcSBW7LDG6MlR+8n5hABckDgsP5hUsTD5d+2eUCn5tCaoDMcEzW/K2bmHrTy?=
 =?us-ascii?Q?LDV7RiAaVCZb5XKPPP/+PafshRXL25B73aKcjqKY4vGmdM08vTX2ZRGxyH7L?=
 =?us-ascii?Q?lZOD5cko+3st5wXf1ou8jGJKRIjKFXUAwIYMFARTHOWYlrTStYDekENOemzD?=
 =?us-ascii?Q?EZa2RnXaN8a3I58gEenjeFrIIUe0vkrNRzOl+ckn3pW9Iw2gq0MlGduYB8nL?=
 =?us-ascii?Q?HlFFSD/XKvWu1/M43mVG1RUPTloFhnlXWE/ZQJX90Qe0iRY+hr2fslbIxkmd?=
 =?us-ascii?Q?8NhwgQw3CKOMgmBYQ1GqwljbfHpa1c/mSf54cSdVE/3odN/jxxbNPbZlk3HL?=
 =?us-ascii?Q?b0AY65expItmGN8x3gTvyQ2xl36enf+qSlcfALgEDRFZxr+lCOuqn3d8ih99?=
 =?us-ascii?Q?x9FoQkjtxfLxCcbUU9oVcMTx572rJSJSbHKtupoi/mNn58oH6q/UtK3OuE35?=
 =?us-ascii?Q?0mkBh89ThAjlS/zw/GncPg0jC/XRgDoCIddu4CqHgsYTqoy97V0FsQR/e5x2?=
 =?us-ascii?Q?MsRJAXugHCJ4lTDafZuhhKajVSwfIZe1GoMeW9wQMTyCtrHZhGwJqM5OtDdt?=
 =?us-ascii?Q?WvWeCxkt9ISOd5jGMOtg/l2u9pJC3jDBKAhjc0ceE9+AOTEKkQXdgPxovg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PzebK1DPMkkQBU2GC7/ZTf9ITA+uXkGy32okJMrBjNwpm5pt3s1unljdwa8Z?=
 =?us-ascii?Q?E6cRfNbkPs5Ikcoo4IyfSES1aTRM0ToCCiqCfQg4d0H+/d9jnGjNQeLFSPqo?=
 =?us-ascii?Q?TiahgkHNCz5xuKm0TjpTntMBuGkqZZRodkL2DpbgSnCxAU5BTp/oPo2mtGfE?=
 =?us-ascii?Q?FkdOjJJpdD0KowULW6VajPt5oe55njRw/t/V7uPamzOMAnU9cv1DrlIXLDoh?=
 =?us-ascii?Q?nh8venLHwXVvLiDhUabXZLNE7OLEFD52KDTuDFSOJxnjqi+morbnK2qIeTKY?=
 =?us-ascii?Q?0UaEgVwWyRligLr6+NlfCOlCaMzBcCkBElQkfebOJsSh25DbFHNDIz+YDIWu?=
 =?us-ascii?Q?50JcpitlHsWRRFzriLnMJe4AwHdVboZF0SIOsP/zS2cRG/5rVJDo8bgwAzYA?=
 =?us-ascii?Q?J/M3JPVkXuqJtAR/NnXXAS7iJT/Y+O2uaxJgPPot578HnfSPpqn915zwvn6O?=
 =?us-ascii?Q?S9/G7GTcoJPeff0V73+iVoWsvDYpCWlOnpxJw66eVptH9dGsLi48lXfuWXDA?=
 =?us-ascii?Q?UphFrbOT9iYXBvOZo+F5YdOtxh45HpRH/XovzrW6Y2otB3Ri+w8di7BfxNBl?=
 =?us-ascii?Q?AcoDmXUvMl/iA5G8VKjoycwbpOnOxIFR52TZULhaCsbp+v/TKMSleB+2ogDc?=
 =?us-ascii?Q?XVzDRR66MDi1NNyynYRW7+hn6Ge+9WqwwKMhgS3tQ+MKBDpVtfpFFnFQtZlD?=
 =?us-ascii?Q?Uq9ljPlTv6btJeKCHJ+JSa9gFWOLI+5AA1DPsupyl4yM0LCo6hVQL7IViODh?=
 =?us-ascii?Q?1/TAmV7UAMxNJBe1jdk+xhKaD+86MhDSsU+etYxMGWwpZotsfjwVxuv0R3sN?=
 =?us-ascii?Q?LxfM+m7uQ23WDhkJqpRVeAWKcMw/PDXC3lY9MpcqF4KNrxkCNKqB7w/Rxw6X?=
 =?us-ascii?Q?lszxXug4QUwLH3QMapSiMQYGQr8a8uVUdGEjJHCPsWvvdxVpYmlnaYBjeH6T?=
 =?us-ascii?Q?PvNOC4O/yntVj/II5PNkCGwbnYjqyz2SZSPJ2E7eROBueTz2S3mEi/Uze7os?=
 =?us-ascii?Q?6RTKFD9dbkq7y0YwkZbND5aKN3AUjqH18Ho3981MmONTzjTl899/Eo9CHjmG?=
 =?us-ascii?Q?AYNa+T3+InSbQOFTL3jg+tXUPQTLC5kWcT+GeZx978wUUJcDinZrsNTsGxtd?=
 =?us-ascii?Q?JBf3p0mLaa5P9keD3W4Efi6IkCFH9zk2rNkLCnAneTdGgubKZOldpCeH1cc7?=
 =?us-ascii?Q?odAl9DQWkV8cFGV8r9IG2DQ2sJq4oCWBaX6nuolNQOYDS5+vqLWxAVF7MVZt?=
 =?us-ascii?Q?FAGE4PQsiLgJB9IUr0957N2yybkt83UKVj0IsZ7AVGTaQxitReimIds6zm2r?=
 =?us-ascii?Q?eHzC+XLO29ceiM4sg27+ht471qVXhSB5NrYpdQLAI1HQEQ5UaSBxhpsRC4qG?=
 =?us-ascii?Q?vFADSFtZKiaNHPnrDfZkGwzDRx23aHeBCpQpnlrUuj+4806liWj61vZYVBT7?=
 =?us-ascii?Q?9HEHj3C7+jJM8xk8OzQomhUTmLD7CtRRveqF7R3T0BR/6FHbvKfKpXPNxPnZ?=
 =?us-ascii?Q?tHLokSi+UyMqVpp6R7xMK1d+zRdaHDrVskKog/D0Vw/weCCYFLU+lSWvRHSv?=
 =?us-ascii?Q?e6tqtnK/aM4lWPLvuulnGtxXCwbz062oyZs5je05FZpji2DWeay/qZQ9KVus?=
 =?us-ascii?Q?l1kkHzmA+7VlwoBlZ6TV3ug=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0397a3ce-8921-4474-980a-08de23d66489
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 23:34:45.2228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uwf6Z06tU1I2YZ6JdZaZ8pva+430SloFDioWAPCAA07mF44cYDzXFlci1DBLOvoT4V+CYB9vvuBxnNrf317m1y8opRKM2FqJQ8WmbyJlM5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10739
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_153453_039521_11E493C3 
X-CRM114-Status: UNSURE (   8.66  )
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

Add SNAND node to enable support of attached SPI-NAND on the EN7523 SoC.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm/boot/dts/airoha/en7523.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/airoha/en7523.dtsi b/arch/arm/boot/dts/airoha/en7523.dtsi
index b523a868c4ad..31191b8d1430 100644
--- a/arch/arm/boot/dts/airoha/en7523.dtsi
+++ b/arch/arm/boot/dts/airoha/en7523.dtsi
@@ -203,4 +203,24 @@ pcie_intc1: interrupt-controller {
 			#interrupt-cells = <1>;
 		};
 	};
+
+	spi_ctrl: spi@1fa10000 {
+		compatible = "airoha,en7523-snand", "airoha,en7581-snand";
+		reg = <0x1fa10000 0x140>,
+		      <0x1fa11000 0x160>;
+
+		clocks = <&scu EN7523_CLK_SPI>;
+		clock-names = "spi";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		nand: nand@0 {
+			compatible = "spi-nand";
+			reg = <0>;
+			spi-max-frequency = <50000000>;
+			spi-tx-bus-width = <1>;
+			spi-rx-bus-width = <2>;
+		};
+	};
 };
-- 
2.51.0


