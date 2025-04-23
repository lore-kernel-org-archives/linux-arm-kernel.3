Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B04C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HUWrtpB40JJQ6xH8/nyvSKxQdeXIFtr+S+EHiKE/QiA=; b=dZHkBkSOS84CemE0I51crJSqFu
	YVDtYdgdtnWxxrfdCUcjDEg67ekFtxu8CvafyskozCiapIiHl9QKY4sVYkU1FydiyS4++gCZPbBTH
	acTeMJD6WkvfXIV5C6grib5CrKxP/1TDiZSReBMZyTivuC/T35bovNSRUbtO/LnDIjBbJoZz4jt6m
	g73+fKleOVGTNwxZpWQ5A0cosHog++kvzIyDCrFN3Fs63YbjxysnBtzOuN0hBecHWMCbatdAnJWMw
	UtkXupUGLb6NGWIZGRvYjJLu/Y86xJTe5lZ6zd7usrlXU60KYMBbiCR0rXPr1Sb0xx2Q5V9UP5D9Y
	7gGpzRzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Zn3-0000000AX5B-3PrD;
	Wed, 23 Apr 2025 13:05:25 +0000
Received: from mail-db8eur05on2062a.outbound.protection.outlook.com ([2a01:111:f403:2614::62a] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Web-0000000A28f-1DjT;
	Wed, 23 Apr 2025 09:44:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZB7ALFsDICNfK7czmLY7mi0CGRKtJ6yioRe+jfTS8x7k8TnZBdWU/Jp5SphzzPQ221lVZ/qn+Qix02NRCTjYN6l3PW+0lMhBHQf/qiLAmm07o1pkBD8iODMr2qBiSD6aFN+Gl+z+bd5sibBfznxg5IqvrAusvZUnvBnlP3dsadqI2IwTN4lbo87i1XpL3yAgbXlSYam1UMynt3pdHFYcvvQDgxoaN5R0TBk44Ib1rVFtPieFxN+uNrKRj1R65phety40dH0fn5O0vjEQmEYOe2da0kOydHmDJ64KAVHns1ekPT6vLSnI5bBUQ/71cauC3Am2i7xwLhtokf52I57bmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUWrtpB40JJQ6xH8/nyvSKxQdeXIFtr+S+EHiKE/QiA=;
 b=FdPC1Va4xrVTD2ich4y24+Izm89q3BsR8PrNRvi2ZOxQUhW2EjrsEfHrgWHjGQXmM5B6CcU5kTSAq8KD4Dxk0oWEkx1NKOWApoUcnXHmPVjRxyD/QFxUI1kjwoKtjH70gtF9qh3awGyur3+Pe2FXkmvHBvnsZdrXhcolaUlicaxoqTmVu19L18WjKoE1op7PbjfAVDCb7sAyAXNGoHAHKOAOra8FQonu1QzXtd9GHB5fakYl+2dbc9bFFsJcqFmlGytWXKBrK6mTQ2uAoEOFQPHuLO9hC7rd8804j7oA2dslyI6TuHc/JQjdqe5gUtusuKYvZaorcat1wFBkOw5OjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUWrtpB40JJQ6xH8/nyvSKxQdeXIFtr+S+EHiKE/QiA=;
 b=eKxD+kL0h8BSegLug6SSg4N2g7KCjJ1WUR/Xbq0lZs+DwKQJnPTaJtxfwYsUSkUiJVnlsuQxNc92dyp2/kO+8wQlJPoEQBBoDszTsmk6kVttDTE54+kXEG/FJ4ne6gwGFyG5SxvPAdDWRJmyRtLKRfR4KFH6UxmQ5/8EQXa0B+DnSEgfmyjPlmn1Rg2waQnL+0RZnDBwUSfY8LX/x7i5yaTyZZGzhr0i77vYflFQvyvjgJ1jRPBUUWoZoQjmAC4igHEfHpzShCfGIDjkQV3Lzn4e/zz8vHCKYq4L2fVGwTaUYXXHdmToeRhWqIXpCOzkqinzc/plrAP147eu/6z3Pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PR3PR04MB7338.eurprd04.prod.outlook.com (2603:10a6:102:80::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Wed, 23 Apr
 2025 09:44:20 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8655.031; Wed, 23 Apr 2025
 09:44:20 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: jun.li@nxp.com,
	alexander.stein@ew.tq-group.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: phy: imx8mq-usb: improve some tuning properties
Date: Wed, 23 Apr 2025 17:46:06 +0800
Message-Id: <20250423094607.1029429-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0204.apcprd04.prod.outlook.com
 (2603:1096:4:187::16) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PR3PR04MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc71249-dd2e-4e94-2652-08dd824b6bc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0F4w+2yBX65kDM4LhGqkWTmAClv5HdeTPn6CfzBBwjOER4TxWR3kYgj0lBS6?=
 =?us-ascii?Q?Z1YTkFcUiVxyvVgD0aVR8oPGnlbVeQB/c0OM82OLQ+e20BLAl1qeCZwCpeWe?=
 =?us-ascii?Q?NWpU8FaJ/7Pj2R27VbLRoTYtOLI5TJcnCTVz6mY0ti4aRcF4scs2uN5T42co?=
 =?us-ascii?Q?kfSgKDk3co2oMp4zd5x6/Pg0sBbyv76isdzlvQJHbjw1EuO/4/YjbRLI4uEs?=
 =?us-ascii?Q?IkGkfLqUBBOAm0tb1SkNXBJV8SnpzYNUxfVJ/KkNK/LFHC8enLWrqi9Kon2h?=
 =?us-ascii?Q?WIleqa1UG1DVBwmRPReWkABy+9txj4rim2T/ByZBvYtaQoiSuahVZUreHwp9?=
 =?us-ascii?Q?TFmpYtC+O7yBVtLQfww4aQQ99mJ8w6dU3yvR2H498AhVRNnVsX5F4pOQEhk2?=
 =?us-ascii?Q?Jbo7Hi1bTb3X2Mq1XujbMd8aFsv4PxNhuj5yYQZMHvnhN6ATe88Ugn7IayXJ?=
 =?us-ascii?Q?4C/CB5azXrLqsRD8r/GqP5SlU974N02dI708Q5/jkCnczMVZE/owpaJkvmbZ?=
 =?us-ascii?Q?zDUB78mzje/WY/+GsKzKfrpUS3iABQ0CVQbrTN6vPwmDLNynepVumvikoEFQ?=
 =?us-ascii?Q?jLBJRMbuQfXdPhL1RiUTHPhJgmtcvbUMddoQ19ZFv/mqk9WI3I7cucikv81+?=
 =?us-ascii?Q?N0XyLk0M+7by2VLoCYM7aBxu5IfX0QHYQXyZV5CtBVpRN64vN2Ywlnr/Ips/?=
 =?us-ascii?Q?zSSwvXXpvk59I2ydphkoYZxBBrOYmUM3PcFbPJ7/vrpXr1RSM7exay6mHljw?=
 =?us-ascii?Q?m14munvHESUpMMfoRzAWJfFcOPwKaJf3kk9APO/Zaber+unmapeahYKFpmqC?=
 =?us-ascii?Q?BH4KMOFtFCn4wAi39ZKHCnw2pNL1fQoS/QspUiPxJ5NV7NNt9TzxEzJV0Wu3?=
 =?us-ascii?Q?ZEPV6Bf6JqCXgzJrpqKZPL8sBS5umFMvSPsNnYyvf29rzqtreXpQA7Gi0LLS?=
 =?us-ascii?Q?XcVg3AfMoY4CFNbIslrE8v8jPSEstRdRaTc+q0tXYRw7/D5/NgPblG6g4LRy?=
 =?us-ascii?Q?XXnkZcx2lXp5yjwkyMgFxZeDSO2ihUGaJArR2nXCM8yQxaRsBQ4WgGMwowMk?=
 =?us-ascii?Q?YQqsLMR4++78JpAE7qHQBzyIw2BHARwdbwx/ZO8XP27JfBpAIzXYnM/2FXa/?=
 =?us-ascii?Q?pcYsnaPHiOThE1G4A2QwVMbPelgsQwYZeRQ+XI/6FeZo9wl8qBhMAMyoM+k+?=
 =?us-ascii?Q?ZcMU9imTvAHqEVyWSeo4kiXlEVsmtGpfRfjJAKLWaF4niuL8lfTeSoznYcen?=
 =?us-ascii?Q?hmw1MzUOCWThLEttf22zOoBmmbfhk3+qH4cU1EdVe951vFx7yVnJ65PFPRNb?=
 =?us-ascii?Q?YJWffsTLOOFfqHm4MS8LAmz01bOziYuqc+vEkY7ZMFo7Nf+DInjyMD4ZjOHb?=
 =?us-ascii?Q?aPnMmoQNxFGntsDSWWc+KwPPfMa1RaOY2TRY4HkLmIGQhI7zAw70JiFw0v7F?=
 =?us-ascii?Q?6yEus9obqpbiiQ4cbFoGPXc+3sPSxhXb043/bgXiAiH6GnZvqVrvMQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6suKaTl27Mh5x0bWhBnhUZYkWyr/cv6fLCjaS5wTdrH5nhmeLAQpbhT4UXMG?=
 =?us-ascii?Q?yjp85Er7yS3hbr1rK/SmLOz+C0XfRP6YUeAcgyXhhM96o26acxrLswK6j34P?=
 =?us-ascii?Q?DjLDoirXxDARIWkOiefb9xnkdO5IaFwikvptod68QEvKvZBggebW5OCNcrOg?=
 =?us-ascii?Q?Arr8pJ0YkqP3iercYSrPvZouBTjQDW+Hliko1ghqV9wkMxNLKN0YpuTdR+Ii?=
 =?us-ascii?Q?wucMekSsH6TR5ukZMHp1JgbxCrtYDMN1Wpw1nMfx1x24F8ZhuEVv5eZ+euIk?=
 =?us-ascii?Q?v4XOZunqlB71uG/r1J5M+8lF14ZeZn9Oot3wm3jK7ZByXijl+ibTuwx9lLhu?=
 =?us-ascii?Q?Tn6WMQwn+GCF2Umd/Hq3E+302hL7EcnBmwwOosQiVxCWK5U65q4491cadhLa?=
 =?us-ascii?Q?9KRXvpBmpLXQHo9pLgsxTh5pqQiClAPU2723dBXLTiUgzp1KePLmGRAqzhNf?=
 =?us-ascii?Q?3TO7jH3VCmW0sBOxViUYUYpzRe0O0mCvuF7Sg8LbJvvVUdjzy8/BRfzetzI8?=
 =?us-ascii?Q?ylK1CKwdIeBBKYC4hrh+Pd1NZU74BRGRpcx0sBDVtFRWQ+jlB28UFKZl+pn/?=
 =?us-ascii?Q?70qmEM50S7HMefqIDYlyXNP1JyCTfFTYBw3juhWpizy9xyYuKw8LOO1vFBYN?=
 =?us-ascii?Q?lVh0TlHkxTPgnoviQAiUf6UlIh3PHcFfKks/C5t93k8llnF6i0CdrOqN6czV?=
 =?us-ascii?Q?49CGAXKjywalOt67g+eg3qycaZgofCfRspc2chBzpN4Ayz3xyOQuTJH9Q1DA?=
 =?us-ascii?Q?I2WXcoUjB9qT+kXbbdkjEeM5anWGs9eF1Ncz3VUGY/RLMvE1Xn8F3vAu8J1W?=
 =?us-ascii?Q?J+fl7iUYyjfTxBPPg5vV7Jhyc4kA2EnUwHnfqLB/mMrGSginuEBTgrwvOhxi?=
 =?us-ascii?Q?5WoA/dR4FGkO3A/ydItGwpHT+xKYrInx8ppI1vp5/odEV1YsIvDPsnr23gAi?=
 =?us-ascii?Q?efdy7DKzgmuWGgdPs/szVOnEKEs91eL7w/bGZrUxEp54KJucPJ8s1wMlb4kW?=
 =?us-ascii?Q?FIufRelQP+wtoNlLtI+GNfbO1+/bv2dYAJt/oy7JtiW3do4KCap3cLKe5oOF?=
 =?us-ascii?Q?wt1iwWHJ1xB15tr8m+j+RchA94LK2GEKO0dH0S1nAtOJraFr9exEmlHIESrc?=
 =?us-ascii?Q?0tqaK2N9Hhrxx4GGZY4OD9lkDdxfWLgzMDZQ+rZPgboZowJJOMW0tbHdppe6?=
 =?us-ascii?Q?6kPlF75plPwLO7BIxAs3F5AMd07I0m2/9ckBngypPEq4llaRDLzfKCELf1f1?=
 =?us-ascii?Q?WKBeaUdv0adkw89UtGKij/CcD8Nor0HmHmqImO3J+sMx0jTC+PuJYPxC6bDU?=
 =?us-ascii?Q?NxDEmZ4ME8jOEpvb5/+snPd5+TtgjyHwfM+jsgLMWLX4Hfgce29BKqALVWCZ?=
 =?us-ascii?Q?egcVZ9i3wmJl2UOW/bjEVFiyL0jYAkBedapgbo7UOSE1PiIO2NL+U4CibqDf?=
 =?us-ascii?Q?n6AjwKD09jHbgbJodbfbxtH6tkm/lI+bIFMVPgdZP3kTWZGD20ctYzGGhULz?=
 =?us-ascii?Q?GzpTkgE7CB4soEK1DfHnzBz3QMHivwR9cRRzfCVf0CpOpu5LotvVQSGWOz+P?=
 =?us-ascii?Q?BMfnQEJ8D6PKCu10uPYTc2Zj7sL/PMeLjgSamPLW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc71249-dd2e-4e94-2652-08dd824b6bc2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 09:44:20.2027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SA0x6iOTZ8GOg0JpBq5kR54bJjcfI/rgRCDvYCM+csNsPJpWAL+6kQKLQzjlN3/XlAgqERWqR4+QgkAaIbc3HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7338
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_024429_334458_692A1225 
X-CRM114-Status: GOOD (  13.22  )
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

Commit b2e75563dc39 ("dt-bindings: phy: imx8mq-usb: add phy tuning
properties") add many tuning properties, but some parameter value doesn't
match the register description. It made some changes based on the original
value: add offset to a negative number so turn it to a non-negative number.
However, this conversion bring many pain when some properties need to be
improved.

Because device-tree supports negative parameter number, this will improve
some propertie's parameter.

Mainly include below properties:
 - fsl,phy-tx-vref-tune-percent
 - fsl,phy-tx-rise-tune-percent
 - fsl,phy-comp-dis-tune-percent

The parameter value of above 3 properties are USB PHY specific. i.MX8MP
and i.MX95 USB PHY has different meanings. So this add restrictions for
them.

 - fsl,phy-tx-vboost-level-microvolt

For this property, the parameter value is wrong in register description.
This will correct it according to true value.

For detailed info, please refer to i.MX8MP and i.MX95 latest reference
manual.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 .../bindings/phy/fsl,imx8mq-usb-phy.yaml      | 43 +++++++++++++++----
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
index daee0c0fc915..b09e3dab4c59 100644
--- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
@@ -43,15 +43,11 @@ properties:
   fsl,phy-tx-vref-tune-percent:
     description:
       Tunes the HS DC level relative to the nominal level
-    minimum: 94
-    maximum: 124
 
   fsl,phy-tx-rise-tune-percent:
     description:
       Adjusts the rise/fall time duration of the HS waveform relative to
       its nominal value
-    minimum: 97
-    maximum: 103
 
   fsl,phy-tx-preemp-amp-tune-microamp:
     description:
@@ -63,15 +59,12 @@ properties:
   fsl,phy-tx-vboost-level-microvolt:
     description:
       Adjust the boosted transmit launch pk-pk differential amplitude
-    minimum: 880
-    maximum: 1120
+    enum: [844, 1008, 1156]
 
   fsl,phy-comp-dis-tune-percent:
     description:
       Adjust the voltage level used to detect a disconnect event at the host
       relative to the nominal value
-    minimum: 91
-    maximum: 115
 
   fsl,phy-pcs-tx-deemph-3p5db-attenuation-db:
     description:
@@ -112,6 +105,40 @@ allOf:
         reg:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - fsl,imx8mq-usb-phy
+            - fsl,imx8mp-usb-phy
+    then:
+      properties:
+        fsl,phy-tx-vref-tune-percent:
+          minimum: -6
+          maximum: 24
+        fsl,phy-tx-rise-tune-percent:
+          enum: [-3, -1, 0, 3]
+        fsl,phy-comp-dis-tune-percent:
+          enum: [-9, -6, -3, 0, 4, 7, 11, 15]
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx95-usb-phy
+    then:
+      properties:
+        fsl,phy-tx-vref-tune-percent:
+          description: 100x the original
+          minimum: -1000
+          maximum: 875
+        fsl,phy-tx-rise-tune-percent:
+          enum: [-10, 0, 15, 20]
+        fsl,phy-comp-dis-tune-percent:
+          description: 10x the original
+          enum: [-60, -45, -30, -15, 0, 15, 30, 45]
+
   - if:
       required:
         - orientation-switch
-- 
2.34.1


