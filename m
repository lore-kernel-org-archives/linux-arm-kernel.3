Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A167EC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 19:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94UVkWvwY0AiTboaqxocMlTTZJODzybpo3qo+qegR40=; b=C/FkI96zWYe9wP2Lo/22cCjn7i
	7f5tNVHDt7FVa0WbAEPZEXqUvWDyb98lYvrXCLi4myFujj0MhKjDHUFm/Ky4oEOpNGnjeCUNpiMHh
	mhQAl4jIZ/c9JSSdgsPQPX6bZ/QmoPBMZDJI6s23TvMydrHbhrLcsBfYC6oOKGEXtSipInU/JalpQ
	+7jm0HcOoJ+25XVmMm0LmEKqz/4HA8eFbMUib+34hGVhd/J6gIZHqakOEXsMJeIJRyLpggGep+prf
	n8+MNIBVU5mrzJVxHVnsLUtCWV2EOwzT4smMK5SF5GHHn0HkCteBzseuFbbiJwBVaKHGLlK3gxTdW
	dTaPuTsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNcOg-00000000r9r-1vJk;
	Fri, 06 Jun 2025 19:06:34 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNcKG-00000000qSm-1FIn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 19:02:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVmHHlcltIcugzFOdfPbvy/vPWELb42JvfoR+T4+quE3RwhgWo9qpN6ZoFaIaqSV6teeGUNjPvQr0/jzCiNT9VVVwK+GjdMQ2IPT/n3M/FRmUa+DzqPNfmAPws2jnspoJbv/Wgnp/8HXr5TuCHLkSbpwtfMbSY5MSnGJ+ZXNHAV/3o++XO8KOVdQiagOV+rXjxm1uO5EPkbarHsyXVh9idTxc9zGqqNoFMqt/z+475d/dFCa03bJ65/q2+NuqJI95YjC40VaAHmPp7Km8i6H6kFHrL3ojaClH4zR88p29v/0MiDxhJtWxSn518VC6S42QO+1ryaPSnqSlEM9XVvoSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94UVkWvwY0AiTboaqxocMlTTZJODzybpo3qo+qegR40=;
 b=zHRqs0Cc0DJE4XaXOdsQJlqlYEnAUeCPtWw46zZ4u2Dj138okFpiPSG+m0y/KIpVz35s0p6//FBxbn/Igd6KvFDGtlbmFgvwGOBwhfGCx+xoer1g6O0iVzysJz3iJCznaad+oAgq9P65cKNryzFXeHavzByluKUE5/aIrP9Yb/v1FmBJbXcJlaYhdpmIwoOt78czVtsFIq9PPI9icOWV1XdXfi9xQ4oijUZNpDjc+dZObagddaNg6s0h+b+nJN4TY1zHusNnzTM42rdyms0mtZQOEE6DfiCXpciCmpQskbIDWVV7Ai8kJwWFFVoU1h65niejh7JN1ldZastDSVKdzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94UVkWvwY0AiTboaqxocMlTTZJODzybpo3qo+qegR40=;
 b=GR0ix0SsHlP1T3RNhq+kVkxkSYy/UVf/Goq4nJnmbxl+ABBRHzZpDT55S4TrqOwqaFl0ejQhFL8H/hGgrF4v+Exr8ftrRCxIqXFssn0laYEacc1iFCuHpcAh6ILqjdUishm+OAZPLx6XSyQXzQZ4j76wRvV0/F9KDTsaGUeLYUbWeUVQttuVl6JCciJb01rg9iZmcHZ1qKv/sKfCe/Ul2v804fFchAEK+55VdYaLTgJYrK6t7YLweZeatFEHifZC+ZMWYcpd8Y8G1u8IjorsHJukPXOvAJFeBn2f2BhoGWyHimgZxlcjV4kCQbXwdAcaFL4UorPODjOW1Xi7iN1IHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7563.eurprd04.prod.outlook.com (2603:10a6:10:206::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 19:01:52 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Fri, 6 Jun 2025
 19:01:52 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 2/4] arm64: dts: imx95-evk: add USB3 PHY tuning properties
Date: Fri,  6 Jun 2025 15:00:42 -0400
Message-Id: <20250606190045.1438740-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606190045.1438740-1-Frank.Li@nxp.com>
References: <20250606190045.1438740-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a03:505::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bab507a-1fd0-40ec-3442-08dda52c98fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hOvmXhMOlwT+Ine+zAeYbMKdIpGYsmZr58as7LmDqgTb1tdrXUrZmtV4CqmH?=
 =?us-ascii?Q?JsBpguZjab3mU4OqzWnWdeBqlmCd9SvKMYpDeHtLO4tDMNPI4u1ckZb3hjQg?=
 =?us-ascii?Q?ykdDN3OJPB4dZu5ynkGNyWmIDdKs6iCILZAAi8Eg7HO52pbkZQU1hP95sptO?=
 =?us-ascii?Q?K3giOhygFe6XI9ji4wXlchT9Wnvqty33kePDHNMFyZyRXX/3omGFdS5KLg2J?=
 =?us-ascii?Q?T+GwOASKzh0uNuKWwiV7LMbXch5c9Q/FFqNJKwopgfpINJeD7K6NRsEc3J8W?=
 =?us-ascii?Q?EU8T+rSkPz6S7BhZJya84Q5CRj0x+cSANeluwFn25TnQgykgJXCpp1P2g3Ee?=
 =?us-ascii?Q?DZr8A+RyXZyYwUXNoTAs+ZyK1yn5wZZel/KQyfqMO1PaBPEhyygmeT0pZkQB?=
 =?us-ascii?Q?e9Ss6qujUMyBz6TwVt1p6YrShssLjV46j3TeT6CfRuuTZN338sBg7YhWuY/R?=
 =?us-ascii?Q?3VQMcK9HkXoFP7i48oHjEMnb/oTzfYi2dAPVNTAiuVkL7bS6HziQ+foKqcYN?=
 =?us-ascii?Q?Q4Wtc4pp2MMbKkI52T9DMSaPZzHdTJ07kNJOjLzlfnaG/A02JK7f2cAsHyRn?=
 =?us-ascii?Q?8x0d8b7PmmDE3HONiQZklOCHFdT4GggkIYqC704fRpq6cufp54ECzpvAqpBZ?=
 =?us-ascii?Q?tV7oVlRQsiwv52DJJc1FAgrHTrD0WxCtyTeyyDcaz0yWarloQkoGey74gnjq?=
 =?us-ascii?Q?eWDxVkg+xtj+2g9o+YZYQM1UTEJoQiIeK+4Tk2jKA+jYSWwTn0wkFYM1ER4G?=
 =?us-ascii?Q?RW2CqaUFM7lwEVMMvVGbhBBUD2p4HbQ5wny3AjQMBOJbJ5t+b9ScR21D2Y0c?=
 =?us-ascii?Q?K8bRqjjug1uqLu7qy1BZJxfd2uPdqvQNOZwRi391njHjRNHdqDhXiPED6P+E?=
 =?us-ascii?Q?525Tjp2C3krCoqULiqL+9N9dsGvYgHCnLzSHf339U58Ng1z4NtVfVVEbBJc8?=
 =?us-ascii?Q?Npv0OzSbomz3U+BIyOiuUS7AWg/svA67eNO0yfcVBp5zfTy653GdsAWeeWb1?=
 =?us-ascii?Q?M09gWejdeYLoL2EHRUwbU9NDcvvU7vTzYpoFVTPtwkm6MJplGQP25HBmTrKe?=
 =?us-ascii?Q?t/OY+6BrtDTrMTEK61xQ41wiglLRs7d6Cr9FnThWKIpYv2q20t/EFUICgf4w?=
 =?us-ascii?Q?K5BfLs9d1o6WzYuHPrQ2hQgS1FBrLiOmsdmKOylahgD35v8TqTdQvGmexcf4?=
 =?us-ascii?Q?/HOEqMNr3eL+FqKY2ljWq9ZoXdzeUxMKp0XHX5yVfrvp3cF2nVX/qbnoftM+?=
 =?us-ascii?Q?570Oe2HtCQKnS7Lip7/duVjIBGzq40Cun9TKFPX4kRrJ4aeSL/O1md0kjOQD?=
 =?us-ascii?Q?YCBolLAXX6xgPrg43AzFy0mv9hZm02hL8PetflFiSpw2TOjYG0sM1DJNRTD+?=
 =?us-ascii?Q?XILyqGLTS76tmeaUFzhPSzR/qY8Rq5YDq/QktM6F9y5Zm0yrb78DxLqwuAGY?=
 =?us-ascii?Q?/rPykfuT0a5euFfN2MnS/AVQVeR2YGcQDuUHpX3PoiDfeP8XXbYqDav3npS5?=
 =?us-ascii?Q?ZLb76Bs433CwMBU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9C7kcZg5QFdPnnW4ACENGMVS5CT4Wq5EoSo84jBNW733iby0U3jql3rFX51l?=
 =?us-ascii?Q?jjQ46dQAREaoY7gThSStqfe0OfErfcrGpruWiHwMCdDXIF9KTBfWktLwRNGT?=
 =?us-ascii?Q?It3bSHIPRZ1uP9FKnzgzp8u80Y6z5GKNWSji9vCh3gsxWUU10kFe3c+dOqsV?=
 =?us-ascii?Q?BJaufY8v3bmCjS6MKHy04c39Z+ejFGoYV4iiFlchn6q/i3MgTdpencrP3klJ?=
 =?us-ascii?Q?llSVs/WADtnqOaFz5zi9NyzQYqfV5K0KiHFNCKuTJ+Hqumb3n9wzYSOSfjGy?=
 =?us-ascii?Q?8qc+JNSSlziC6zq7QvQ1uO1W7Z8DYaDuXLDFuhBuLRzMWrW/+nMvWLDPmISB?=
 =?us-ascii?Q?DcOWz9c/tWuUczrGzxfB5cQ3D/a6We4qIKr4luRbrQKI5C4NCMk3GR7LU/9B?=
 =?us-ascii?Q?PJ2awLmB1DUi3xVsjJbUSfZ4cpHb+/1OvsXZSaW5cegrL+Eu8IM9C9jDc5du?=
 =?us-ascii?Q?qNXOH8UJk4QcTKzFRYCknFs56tzTW8D+eHr91AO/sfc/ypm0AmMOb6sPXMLL?=
 =?us-ascii?Q?HolUFhKZSScTmvAWtM7zn0UcOHl7skuPScVkbIgXEA0nFzopoPkb6RmuIirN?=
 =?us-ascii?Q?y9Lc3pgfE369+45P9nYqbW0wfhctJBsu5KCyTwyuSEpUuuMkpjfFCkruO1qe?=
 =?us-ascii?Q?h6LzBQl3ObmWo5p3D/963hBs8rqk1bbz6sfPvBlbjEXKhEDhYEpkNkyODfZt?=
 =?us-ascii?Q?AGxzjIX6TkN0X2OyyrPD1f66FNMlAO/fJSoR7j1PMxo1pZPhKDXJRfgX5rqz?=
 =?us-ascii?Q?J6nqXmeiUnn1s2zcBfuyoMhG1hAho7jnSivMZJHdMJ0ZMdFH+i1zjHUY1WlN?=
 =?us-ascii?Q?S8ExIZVK6Qx9ud8jyBpdFHa3rDEB8Kaxs/ciu8T5mqb8wiuz94dxi5TH/C0f?=
 =?us-ascii?Q?KaYYV2WR3eg8ENYyE2oJCU8Zvvb42CBVgbjZMKk11zwI09SFQxKemTkt9xzh?=
 =?us-ascii?Q?i40g0TemrQQeckyiq/Z/DQP12lx6ZAWI8UqHw1F2/gIdtb8KmnbO9ysEM8h3?=
 =?us-ascii?Q?ejam8EzF+RjLpU2JJe3ZusMw6vQFq/qzWDVarp0BR46Xy0axNhGE6yui4oML?=
 =?us-ascii?Q?RfBLHTHkGYdnNcn05p1st536Ka6YJk3+qp8gjkM1KC2HQYnErI6kVn5Hpuhb?=
 =?us-ascii?Q?obeTvdmeFkfwPbjptsE++oizBD63pFmpY2F+bWS9rVBDfXpZy5kWVNEFKKlZ?=
 =?us-ascii?Q?HmHUSIk82g9/sUJh58sViOu3Yg+8ap+VQQfZxaMfK2lNML9pcOeWIO/SAaDp?=
 =?us-ascii?Q?tuEpKVZhDw/WowMLAAyQ+RQd0adHF80htLNJWPDNLqAJf9FJNhPVelOipy1z?=
 =?us-ascii?Q?W8eX4rmxfkucVYOgED64NGdsdY+E+P1hbIby7iXPEzH5RCiA9zvwEyWahIBV?=
 =?us-ascii?Q?XtUPj76aiskMnILEGwJEMM+HQoNM7jOsjJitkfYehjiL/OQPxooJCiiYTGek?=
 =?us-ascii?Q?aaRDaj9FXggwqjPg8opspyQmoyY3Ah40p3zlwqTqiL/EtJ2b+SzObtH2EC4k?=
 =?us-ascii?Q?J/USAXZKZzEaqQQaJ6KYU6sUxLAWBG92AYqTmCVDopBJnJHgW9yJh0l9zIIr?=
 =?us-ascii?Q?bX+LhfsQ0vFQmlQYCvmDR81WcKHDQKr/7DlMySxL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bab507a-1fd0-40ec-3442-08dda52c98fe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 19:01:52.2382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gcyLfr3mxmpUxaqlCO2a8WrFkxaHW1HImjWOYfsNpx2h9E2O632qtQYisnlhV99swS9kUk8C9Cg2jw0CKcbZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7563
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_120200_337899_9111E79F 
X-CRM114-Status: GOOD (  10.98  )
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

From: Xu Yang <xu.yang_2@nxp.com>

Add USB3 PHY tuning properties for imx95-15x15-evk and imx95-19x19-evk
boards according to signal measurement results.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- none
---
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 3 +++
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index 6c47f4b47356a..e54f3b982127a 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -1070,7 +1070,10 @@ usb3_data_hs: endpoint {
 
 &usb3_phy {
 	orientation-switch;
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
 	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
 	status = "okay";
 
 	port {
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 5d85849e867fc..ea70ef4e85690 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -615,7 +615,10 @@ usb3_data_hs: endpoint {
 };
 
 &usb3_phy {
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
 	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
 	orientation-switch;
 	status = "okay";
 
-- 
2.34.1


