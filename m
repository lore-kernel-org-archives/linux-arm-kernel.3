Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F19E8B383
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 02:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTveayKYBrDhG2r4smSi8264udr7UPUX+1YH0qORN5s=; b=eMBWI/IK2c3wPfzEh+K/RkHCjk
	QiHY94eZ4m+zG9LlaHswkme1UwxP2Bl8TTcTdZpgfm7HGCTDwxLv948kZx+q6DCJtTy4qUaLAEG11
	0zx8Q1rP1/1kXIie4jnyXXKB+BQqBedINPCwMV845NA9tRcQgIr7bCITYG4qvH22uWkc6QGmo5abG
	jWwT5qyESOWEE98H+J2jkwu5jy1R24fHgfy+djiBAsHqw8W2EtU0wv54hU70eX8lkMmMo4/xEdeX0
	XEHQOmO4TEDJcAK90+7DBeagt8AOKIG1oH0umVDDaenz3mNHYfcSt50nyIp3Opq1Yh3nyMkDKulNU
	7TQq3CRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSfl-00000007mUH-0wSV;
	Wed, 04 Feb 2026 02:31:17 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSfj-00000007mTH-0Xng
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 02:31:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HLPWWzQhGtiT78j5lnsv5l8QkGNk6jiB78HfUOgPIQq+srfV0I7ly7U7N9cWz1IFH9SfeIK06Wb4qK1/xyorDuenF1h6pRfDOXedB9Z9ISeOJkHb8WpKaL7P3vVvYWzgGaehkEylaQ8ljkTwo8/fH766wO4dBh+is2dn301LgonR+eZbrMeb/BuXZmzij5NIvNzxtiweTQr4JDIUhLSuxRgQIpqQggL8ujC/+sICZ5Otq4Ygv7ZKPCwjfM9TXYDqnwYejYwg13PGGr8tNlgWdwpcGp529vIam7sx7pWkeKzFQ/RxyCi3EW4lIUAmcOs9wjbB38ROQaku6ShAz74i6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTveayKYBrDhG2r4smSi8264udr7UPUX+1YH0qORN5s=;
 b=QfcDCVUxDOtM70+RcJ0qzxqC8/NwwBsIEioxAT5jA07yF77EAoCUMYLD9BJdTjnYtJvVZUc5HrCOjxs6nUZF/3s3fczERFVVzSmrh03ZSUMwgQ5D1o+RhMe7piHwAw7ETQhqJizkUKrlak7KGRnkUki6AgJbNcOGP6kFx74Vb9wPGejapznwTEVEux3VW572U6cmNmQbnVvsg58T5N4NwmmyxQQ5619hcErxG/ixZ6ID9eSpSin9Jz8OLedea6jtK6W1uhHY4iInd4KxoTucENXr1+ehQGmD9wHJIAKeg0jCBjqxag/gnmNx1pEc9IsXNFiM30GY4oYFeNLI6IYzUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTveayKYBrDhG2r4smSi8264udr7UPUX+1YH0qORN5s=;
 b=A7qbPKExKTAVXxvGWY9+0Ulw8FP1krv1RNuMfChuIf+syNV43F8v0JGH1b5uh0GEP1ABYl+4SrVdpEZzMT0jOR9/WvVNbo1Uukcg9ygGLKWmbEi87n1HMJg4oSxZhlwSb6I5ff7E1ZwnlA/m8io5i/6jZLMK+JKTCONSO8mgvBzENn/bLFfW1W3cd5eKrIxKvIjLFIgGrCXqh8Eo9/+HsVKJJ92uhz2Ds6ec6tMTxmLIwjbVPcbghtmF6t3h1T/XD8ND46XRwsJG5qNyeRyI/ejTWNSXk5a/jKP14zHRp+4fggja3UBRrE3i1Kp17FzECa71TJp4rlvkkNwjeXx2Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by GVXPR04MB10432.eurprd04.prod.outlook.com
 (2603:10a6:150:1e0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.14; Wed, 4 Feb
 2026 02:31:11 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 02:31:11 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] arm64: dts: imx8mp-evk: Enable pull select bit for PCIe regulator GPIO (M.2 W_DISABLE1)
Date: Wed,  4 Feb 2026 10:32:02 +0800
Message-Id: <20260204023204.2382433-2-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260204023204.2382433-1-sherry.sun@nxp.com>
References: <20260204023204.2382433-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:4:197::20) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|GVXPR04MB10432:EE_
X-MS-Office365-Filtering-Correlation-Id: e3401de5-970d-4395-a79c-08de6395761c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C4bXYvPDa3hH3y8pqj4dwf9WPaRXds0du7pUlR6rQM83oxIsdL4gnO+yjZFn?=
 =?us-ascii?Q?UZk5sZP8nRoUgiGhUzCDURC9Fbdsk32YtNvw9S8ymRzwRWyA81L66pMpUByt?=
 =?us-ascii?Q?ZQYYdRfv5TU9qdNdK0hOjkyqV4lRXYWwqZp6U8PWp55832AKq0cd4fWAy7HP?=
 =?us-ascii?Q?O0OHovAUYqEaxaDftQ26rrh49XS85/IDdRPSueZ+fKtMSWyeFfsyBQz7w75d?=
 =?us-ascii?Q?PiQtV2ZDaYFh43YrgsG5X8Az1kQhMfKzYiWtUDrrYJyI8AnWVvZOE7cQd5tF?=
 =?us-ascii?Q?o6LHtW5ahSu+YJJBAjTxa9Z/9ZmPaVHnpzOYa2OAeyOMjIsbr46YFzSgr/Um?=
 =?us-ascii?Q?805X2iGdj3AArzjYRtlAIovIDSTTxNJGnrr35+inWruXn/pM4KcH73UAyGn1?=
 =?us-ascii?Q?+xFLgg8NaP+K3Z/YnIEtgqoL/Yi7JfRD7ZtqIDOBD+Y7MGtI7VfxBFmdZt+W?=
 =?us-ascii?Q?tVEA0DpkYtIzfhM0Bg2WGGUb+AHkwDQvWmAwvQi7gNIDU2782fkfuRVx7uDL?=
 =?us-ascii?Q?dUQe+U+fxc5agquFOEC20poH8txHs1w1YHIUWa2b43dhAiRPDw3UyMc3cPlN?=
 =?us-ascii?Q?6PKV4/S/jeskGK8L0jhA05RbqUDP7w3q5Y0snNn8qk72I/Mm+APMt3Tpvu6b?=
 =?us-ascii?Q?LcS1P+da1FK/9dnetvPHucF38txgYvBzFxp+mq2emv+endh//knzwKT1/yIA?=
 =?us-ascii?Q?CjhoPKzFQfvhrrp2rvGEUlfrWyrNpJesAZJobjrs+ftkXmOAMsKHmB7PLfPo?=
 =?us-ascii?Q?S7MkS9iBkcWEbjH4cy5ZaLOFdxFdifKHRwwTbqv+XY13Pjrsgdz3oZQk2Gtg?=
 =?us-ascii?Q?h0/FaO4baLPjW3ERZhSDjzePAU1da4d/Lt+SE2+iUGug0PDtREDLmYM1gVNY?=
 =?us-ascii?Q?LOW/qvFS6tbMTUROvgB1nmNaPWmPVvY447dvWPWrlAKpBMLz7mbJCPIxC29s?=
 =?us-ascii?Q?nIwKdafYuSZ1hE8lG6gF7a7/xtJNNYhY4t6LKBKpzgXTiDbMQfywkNA3Daby?=
 =?us-ascii?Q?1e8F3cu/CrWsHyreIuV/JU6zfWEiplS3njot0FWZdDkPi/gtCrvXqW1WUXXr?=
 =?us-ascii?Q?yIsKGi3ptCy+p4lXlSRsXeLfhPtabqerFDZdPlubKSu0PWLDBTuUqbf1I4V4?=
 =?us-ascii?Q?IQMsdKcJTMYNmfI6SfyZF8hA+SGUlzmVCyoG44/0lGA9+MgpycW+rJ05sLGE?=
 =?us-ascii?Q?Px56JZJPJQeU6CLuzY5TWDQpZDUjle6wZDHsbKa5eEtOaWAgd3rzcX7qSdaZ?=
 =?us-ascii?Q?wPHHHX34qdRsqgI4InWCSqix2Z6QDgiKTaEXNGHC+pjUQGKOlvxKgq0/3KIp?=
 =?us-ascii?Q?U/ZfTRsuMzcEfhqMe6FYAVvl/H9AQMk9kVzvyv9QVdhA8P510wj0P97CsE7d?=
 =?us-ascii?Q?/NND1kkrQ1CnTz9499jZ6kZsBDdknlLVL29mXqCK4sIYAaQ7gR9xwFaAmW4+?=
 =?us-ascii?Q?+FUJJ68wXPa6sv8bcUmI46DeIjb7lhenSzvfEQkijJBYIYF6RY/a4NRdcXVx?=
 =?us-ascii?Q?Fl8OkXBs9q76Um+FHaU+jG3uImqOCj4zNkreYwHoNBt0Ay0gLuuwBEEo/lNF?=
 =?us-ascii?Q?KNl74AT3IokkXakH5EirtKi70Vw6T6W4d9wx2gzcKgmuP+LGtTpdJT4UXjHb?=
 =?us-ascii?Q?gWlHBeMv9KX4w6ii05Fg5Kc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ocaS6tBo6AKjCmqZMQdKLnUxVHsv3JM9wq/dRpgSrYaDArRLAUhc6/Mwe0eP?=
 =?us-ascii?Q?NYwvyEMKHOWKNWUVRwokyl/xouSr5cBGHhT4DlZB3uTmsQ4L7bnFQo5yAbvG?=
 =?us-ascii?Q?6GZX7kCeqZ0SG7VQQL6Wpk/RFBT/hEtRwsnfl+yhKT/Kj9kWmBP1I1Pn4LmG?=
 =?us-ascii?Q?X5SvSZGqacMNAp29NFpVjfWPmUEBb0cH1Wfa0IsevcXG5dZcyNgv8kbQYd0F?=
 =?us-ascii?Q?o3qfuTKdhs03XanKtj2H97MNLovTD4iNd2yaLUomGPFM6l3ObIkWpROYggz8?=
 =?us-ascii?Q?riQGZz1Entwd/1CO0+/bcZEmHkhU09QcUKcP2jtS1t93BQZ+9WrEeiPTgJYw?=
 =?us-ascii?Q?vxRUvAcZ+DzSoRZVcVvrNG744tLOoslc176f/bTa8tp/xlRFmaSRMSJQnwMz?=
 =?us-ascii?Q?bQuCKOumyPVywBupUiKfLpQpFGMbsPfM9tzJ2zdsSPVRczUZi2Gh9kM2WiqA?=
 =?us-ascii?Q?0lWxBJujgB9nMVZ2xJE3zcH0wvweydjKdtRIWxDhi7Ti7BV97gx0wHZC+LBw?=
 =?us-ascii?Q?XuXZvGkcGjjaEpEzmWpz/VRNQ0o7AIoProOQduPrDtbmdNcYWtZ9VsmV5lAR?=
 =?us-ascii?Q?RAuq1CSkegktpSNwZxY9wz5iCRLDOtqJkGwCYiRAIJpS2R6vfE+5nISLY+FO?=
 =?us-ascii?Q?pCNjTGwWQP4paHCqvSD424GQP84AQ9/5eXq5rMIzBX+BXH/0dV2E9WsVqvJG?=
 =?us-ascii?Q?AcNt4PqaxZF/2FKX7d1Wyr2P0oz1oZ/VNPER3fGj0muCD1765oKn4UhHks05?=
 =?us-ascii?Q?Kx6MC0tj4ywQVxJ/0sgEjIyO6LGE6mQsVhWWZcWIX31bXPehb9y4wSS/RYfe?=
 =?us-ascii?Q?oyJ74PtT2535nhOQVC/kUIS/EDyjtbBkTcR3pDfRUFNgjox/LUUcvxl07Pr8?=
 =?us-ascii?Q?4AA2OT/BxrbQm8f9g97lwYzegTLAY9JCTI2JumUB173v273PXSlB1LaQq7S4?=
 =?us-ascii?Q?OSbbNPjqURIbWMXVrlRhLY5IhEdyjdVrbXqj6BwAw2QxHP95mJjjAcN4XE+S?=
 =?us-ascii?Q?25MxS639gUJ9/AK/HJvI6d/XWa3JXub53P1EjdH9tEWXW+W3quQ33CafXRJb?=
 =?us-ascii?Q?lDw+l1iw/moZ0JFS7INiYAupduUKelmkqtvik+eQ4FCQ3w2xVxUCZEJS4zbH?=
 =?us-ascii?Q?yhHSdjkTuBzmC3mQxkTrgsX9PSeq0Q/Gbtt2fjMvaPSKyJkFAucrxVZ0ijTD?=
 =?us-ascii?Q?Ez5Vxf1AuH6lv0Nljk63tWnXKamFysMiu16YF9IxpLp/4bCl6y5SD92hFpkT?=
 =?us-ascii?Q?9BHO59/djIthO13+CtdnpyQIjXAUxuwKQeSZL1ou4lwvWxecXNYAl5uRkCNI?=
 =?us-ascii?Q?Db1BhrxUjRte3aLVl6rcfFvRC8bgJV0rcPY3quj2DuhBmz+vSSHHzWVjesrG?=
 =?us-ascii?Q?zhtGT0bWz59cq5YHx6kxaRQJ98dl003C/4B8+JF9blrXw+vLIwRBuNkeqWn7?=
 =?us-ascii?Q?HV7kF1ioq/3qitIxWuF0/PUU/ntYEpMESttBa3MzX5fiZQECxOQfFTK92f0u?=
 =?us-ascii?Q?qI+dZHYdGov3pa5tyIgKT9qRowZceA0xInKtjKnSUmb9k7Mp3H1dq2MM/noq?=
 =?us-ascii?Q?LaK6WDOPlxDfzuz3qimts99vztqFQoM+w0BuFmjhgGiv1tC8nMTkqjmXYN22?=
 =?us-ascii?Q?QzWmMCXFEQhlJ3qF0vRWCucT9Grq4BEQpVJ5HktdKd1Trz5YzebvRyRo3yrO?=
 =?us-ascii?Q?I/itU5oYBE9e8gHPzHGawPdBJb0Ahuy6Wkkebx0fJdl6QMA2GWWRLZ88TFuz?=
 =?us-ascii?Q?Bwux5ZvtuA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3401de5-970d-4395-a79c-08de6395761c
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 02:31:11.8824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: reeVQJ9RzV6N4NbPficuvjW9zcXkQaX06WFYoy1MIYlZph/5ccwpNKpw7W/1O/B0oQgc30IIolC7bzLGcQM+Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10432
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_183115_169301_8F76F098 
X-CRM114-Status: GOOD (  12.07  )
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

The current pin configuration for MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06
sets the weak pull-up but does not enable the pull select field.
Bit 8 in the IOMUX register must be set in order for the weak pull-up
to actually take effect.

Update the pinctrl setting from 0x40 to 0x140 to enable both the pull
select and the weak pull-up, ensuring the line behaves as expected.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 3f9b3fab8ac3..a1269c7a6cc2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -1069,7 +1069,7 @@ MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07	0x40
 
 	pinctrl_pcie0_reg: pcie0reggrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06	0x40
+			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06	0x140
 		>;
 	};
 
-- 
2.37.1


