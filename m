Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28667C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 10:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1KAwRYMxSXwJjtaZ2JWOdlvPQRorvAQTimzhho/wsA=; b=sCsW6nyXRfUs2kXYm6yq9djjuf
	pUOGnwxehV9L+CKEdY3JkSzlLBtWOe6hJ5VTC8KxbS9XYMWZiseTwaHZZ6AQzot31znhxgCFAFYcw
	GF2bOVCfEUWoGHho7ItCFwGDh4UI+pp8CCtPHyMakOUcbaDO++Vd31jNVccF15CGNNvWSbvqO+x3f
	6pR8xtcxpHr4QVEZ124LostS3FRnqwkpsQ048VqQsY5sO7secweEh+8GQBaSlau0kIgz+go4u7ca2
	UrJZelHCV+QGESncBQlVzc1nKxfC5D+QszLMOj0tnpVFriqApLRNOuHV0QjiLBZLAqwg28A+02CQ+
	rYDR0s+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4aD-0000000CVt4-12qa;
	Wed, 30 Apr 2025 10:22:29 +0000
Received: from mail-northeuropeazlp170130004.outbound.protection.outlook.com ([2a01:111:f403:c200::4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3yL-0000000CPkv-1xFG;
	Wed, 30 Apr 2025 09:43:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZ2Aa5Cd3K67glzWX0nyRmFjxGbnvGBvO+BpGMTf92LfEYjVDsX6+XFTxOfPs0LZm1GNpI9S8yeG9jyeTD3T5JWXfZso3OIA1AsJ1xHJIZDtyGI3EB6vm75/7Q9q1iWvhGJ5SE6aar8TzIiG+xI2CAmiT/NlRmKlx0k1AV6ngOVx/6NyYZjvd1F4QNHuX2RbK75qwX+XF2mLRFXlf1VTUX1nyvv8XiVAjmvtUIjQR0vzZZ1X8WixTGIxufE2fo3fj5Bf7XghaUwJn9OzJ/r/RFtmcelAfFUNfP3k+LjHm8MBFXjZOfem4EWwY7k/LuJNSQ9VrLojoXZx2RhhCLo29A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1KAwRYMxSXwJjtaZ2JWOdlvPQRorvAQTimzhho/wsA=;
 b=DJ9lMlf59Eb/7nw9eOFQiEcw7nm1Tse2ppyA9c/2nMVFojmY6XAehk7ZUTTQI2HO7nHnm86yg2hpSmKvtMB4I5HXecIFQU/4IYQBTj2wKC/xfU7w9IMqHK5Wi4ksCKUYXNuYSI+zts/aGvk8exs5xhX7H0lQPOASU1Cd6AMl99mM+4VTDjWcQ7wQHk/zeUdzrNQHfQ4BHdtFgctZX3a67tuOY1GuynBvxeRORwgmQDBphHOZvvTzTqfB4MG6+F41ijXEsXuyOC/CiWbvr1xCG+aJqDad7Q41qZPaNMYM+CwyYk2ZNZap7671GwxbN13Q0Y2viessApMjhWLFBy0NUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1KAwRYMxSXwJjtaZ2JWOdlvPQRorvAQTimzhho/wsA=;
 b=h7+Uxy9i70ePWMZZA8rWj2gR9giMbOtPgjK3C2W1uzHJ/5xsoqUled+WUr8wLEks66TF5Vfl9cGY97MA7UntN4+QSD2kVs2lCkRMO2VEgEU2rpSKYuYU6S0yPgHdqYFUPBPnSA3C1JemBUEvdITs8JpErkDE4gojggltyft7XwDbOMESWK+uCoYt+4nWUAPtRTUYa+5FfHM0jfC7D9eefNAyjK9aX+GlzFTFZy0hYGYYQc79afJ1+QLejgvxI5q0ghKAfciVQcx7BOykQijbWn9n5vKDW9ufpW42A5bsBQrLHvtt78BFANyJ5z6/TlC2zcwlcCaij5khfKD9sW3vig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VE1PR04MB7246.eurprd04.prod.outlook.com (2603:10a6:800:1ae::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.25; Wed, 30 Apr
 2025 09:43:15 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 09:43:15 +0000
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
Subject: [PATCH v3 2/4] dt-bindings: phy: imx8mq-usb: add imx95 tuning support
Date: Wed, 30 Apr 2025 17:45:00 +0800
Message-Id: <20250430094502.2723983-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430094502.2723983-1-xu.yang_2@nxp.com>
References: <20250430094502.2723983-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:3:18::27) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VE1PR04MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e2b7c8-a040-4be2-6e12-08dd87cb6e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wHuTv7jsT0VMh/Q2yXmsIgV4uhjDjmdYzrBaRvd6DcrDoBltn7fcjnD1O9kC?=
 =?us-ascii?Q?LIT9qAVwyPxPEjv8nveiqfWM3LQNsvyxYAS8obgXnH7YECiKrGx3kK0S6B0D?=
 =?us-ascii?Q?3Hrg8Ae6072QGYgpmX6crdY7rXGLukC1QFUMmqsm3JzJnm0j8YWWLEURhb3Q?=
 =?us-ascii?Q?7TAVZDA7FyxUUvgO5rWju3nSHTKj7ODBz4L/GtefRP4b7Vf2H9R06wth/E6j?=
 =?us-ascii?Q?7m7xyh/A1Q3TYI5n6+QTlPdpSvkOj3ZN4BAXLBlX5adXBDmZmQFOuvrStAYW?=
 =?us-ascii?Q?Z6o+yPCIMwWIwwR5XvuyHNTa+siMkASyTkJsxp2Cl+twRp50f9D2d9pByJ5r?=
 =?us-ascii?Q?1B/vjFQTzfGsn4O5DJlkF2/FVv2Giavt8iIOvDM06NQU5bqV1k2H1Dy5NkxS?=
 =?us-ascii?Q?uV2dhDRmFLe/SFlo+nEYLrMVe6FrnrveaixAKeUkqiy+0uXSTJmnTwxh/Y99?=
 =?us-ascii?Q?kbeGEpz/35EoeE1pOI2bWC5tAZEzDLLqHimu1yczLcqj2Xq+sxx/hvDe1dPc?=
 =?us-ascii?Q?l+8vyW9+T5q4xAqJkVvZ///ARUY4wBMpEB6ARPallrjmT/UPfYKIP0PmHht0?=
 =?us-ascii?Q?YB8yc4RbJH6Sdw00YxqCbvIXOMnpIHrsMt5oC/azSEH+p3AqqXqe3OzzAnpz?=
 =?us-ascii?Q?hID7jXnpdn9N6+QkHofvBlXVYnePiHFB6xXddPTF+VOiqLnXrEaWg17n566M?=
 =?us-ascii?Q?noyPzvuMUEk2Zn24cD+I8TCggq+nOrQzr0ksb/lDdCaoe5F8GHsUnl530d7L?=
 =?us-ascii?Q?wMsi2v4Jbo9B/KkL00YU/I9MVTt30dSOXiiivH2cBkQBohZZdzSFESZ8gpba?=
 =?us-ascii?Q?VMXYfGyk1/scRaLrAjaA2EaKlsG8FM/GCdfmYzksviOA5/XizV6A6i8sWyh2?=
 =?us-ascii?Q?aHtOBxHqcUxjG0E3UAIEElll/L8N8vYACb6WpgXvl7m204V6lidQAykK17ZR?=
 =?us-ascii?Q?yEXFKJCF6CwwVd3PXx/SIALU4A+kGEnXtjd9CE20H43K+Jj/M3gTSU9sJf95?=
 =?us-ascii?Q?SjV9XDW4qzHbUgkmeqn/VB+0Lm2CRbn97kcxwbZpwU8A37A52tGJGVcZtkIH?=
 =?us-ascii?Q?mS0vAxINRg6+tux7RbJuNDSj2QrWScbPMzYZf5z+FKhrGKnIekYYTcN+EvX3?=
 =?us-ascii?Q?k/cd+yPPzHd25I5bPl8Jz7WKh5PZi7wvIMG71jU4b12BdINpO1SXLPip5uVc?=
 =?us-ascii?Q?q3mB9mtJrY6WNr44TDJe8rjBBcM21JdtQrYcyIq4pfBskqpSIXUSDJSMqcw8?=
 =?us-ascii?Q?bX7nd6ZQVOglqiEVrZdODyHgnkJsfqZXkI1YFxOTkjn8IF/ex5u0ZrLM30ln?=
 =?us-ascii?Q?3czObF8j1/prif7OgBi4ssovzyoZeKoAUO9tMgIJxnFDf1bVENLsJSrmYzK9?=
 =?us-ascii?Q?s/ZXfKmk2Nl0LbneHwzElEFA4wt9ig66++YmXZMfLjUAEMQoz4XD2npv/wj8?=
 =?us-ascii?Q?kI8LTkmALePQ9drmuHlqQfEvaSb/9Ct/xfvUxJUA1b39c2jyHdPakQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8+FUCfnNEb8WSndrZwYRH7bRDberGnyJIITUVuK6dlfJInHM1rmfmeqTgSpv?=
 =?us-ascii?Q?/QbNrRTBLNiQE70aYUtozIdafA7LOW5v3IrSs1ynpaYRzMh67L0D07vb+HhB?=
 =?us-ascii?Q?n29wzFXmEAVNJQteqPVWslXyVywHG5x48C4/fGi73fMeTlYYa3lZ19XPVx1u?=
 =?us-ascii?Q?sXo0MkE8S3/qTLlcT7Nfcy/tsw8VWAchL7Lf7yrVKGtQdT2CgRZzIorU5s+n?=
 =?us-ascii?Q?L2dOOnF8aSdur8Dg1nTTWiDFFZSZjd3a2XHpJ+FD0Oqy6ZSh/QSbPckZ7R1v?=
 =?us-ascii?Q?lFfvaRvqgUZdY+zEc1MBacJ5iYdN4O1LIc1tmupOlGmccW5Z/e3ZaUBtrJkM?=
 =?us-ascii?Q?OyxF7DzkAFZLfE+moY7wSm0mLHCpi/ZQAgSPn5ISUQr6rtZIQtrFDJpNtCXW?=
 =?us-ascii?Q?FnOv5QC+yH1oWFDQcGTw3IAn0mDIDcWUpU7Z1YwBZJBpcJ8WkNInOMbKQlRX?=
 =?us-ascii?Q?D2wYmG5KNlfh9hZyMVMtuKrygvB7xgTSmR9g4sKl3uNc8MeYqAF7XtEOGig7?=
 =?us-ascii?Q?xzOe7rtxEcEtbGNkaiWZ5aEOAXXMfsZLXMTB/g6A2Ws0STWUJ6c2ti3KAhbT?=
 =?us-ascii?Q?rdn/zhefyZBuUj/qkn9jtKxUs/iiVXPrXE1BGtDGzsG5NCapIrhhXFIvrZql?=
 =?us-ascii?Q?pXGnVhpHPnLdLVrhP4sCLiNqlJ6azef6i4ROE2OQ6+gsRHltWXr2jPVYINRm?=
 =?us-ascii?Q?BjsWyNDIjSN8Z8Vyo3HNHZBYBYhBEnUh1lHVZcxC1Mq2stjyiQXiLRBHjsx8?=
 =?us-ascii?Q?e33iEG21w0m6l9u0gWZ9IL53celMdcFgZbSJ+TZC/E08iZGgWwQQtnRoAujD?=
 =?us-ascii?Q?b/35V/6xdmR/EKq7+z6LFh0oouHMPGlK4dFp8DlOuX9NPGnTa+K8OU6pYEz1?=
 =?us-ascii?Q?SFqlccjJgFSMeu0bqNXlEW53SgT61WjKPzUlnWZ01eUrEwvNU97rCGn7s4yC?=
 =?us-ascii?Q?LNCep2vaWqwfvcGcYchfSOBxa1sLfCM4BrfF7w95XS7m8k5qm9zcxnkZ5cI7?=
 =?us-ascii?Q?CagqH9Br/I0qYfJu/UO9FU4LbYHkwjTKfzd+Lao3b+ktWwDJ9LK5UdGLJypk?=
 =?us-ascii?Q?vvMnAMg5EIvnWGRZG6Cft7chiiLzy8kj70Vy0e+ch0xY+z3AZPqhkHQxRDyP?=
 =?us-ascii?Q?mCcQjA0sO1thwRNLlS1Hks05tbwVzNKXa2YMceTwTWiQLTq7qYndNI5ILAXf?=
 =?us-ascii?Q?D4XAMG2EyBhbjTCRKjAJGfnelivWePM/+wftre0RaeTuNhbfLRRzkQnM360c?=
 =?us-ascii?Q?mlA5ue8yk3U9WznUCY0OANJUelaFhyJjGXTRG+72YGKyC5ZMnZRC6F9Qgu/5?=
 =?us-ascii?Q?y3L0PhhENn4lZssvHs0SJZnAi5CjpBtixd8va4FFj5DWeEsOKXLyfooH3mlU?=
 =?us-ascii?Q?K+NkU8OuXsDSehw641LVkJYNT1gBG/XNn1Zq74ZACOVviZrrLmFjku7ZTK6W?=
 =?us-ascii?Q?yajvh78JMYye4BTWibYlXkRjKozFDZlmBXiE7cv0Kr0w0zRiLZm7wj0yGi+7?=
 =?us-ascii?Q?8SSHtSFiXWnVqmpXO7FkbNhMZRHYGZcuIGDiOiNSOmD0xPRvZ3z1j/tSH7SQ?=
 =?us-ascii?Q?ECUeaL+lPwEU14G+Xxiquwv5cY9HTIw5qWpveByB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e2b7c8-a040-4be2-6e12-08dd87cb6e40
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 09:43:15.6292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hHka9QmlM58vdjCt7FJsyPZosUSCWTXBe1OLyK8zmEcsRsXcOqPduOfKPzM70GRzYDFmz+j/wKCIOShvyUUIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7246
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_024321_510186_9A02C5C9 
X-CRM114-Status: GOOD (  10.26  )
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

The parameter value of below 3 properties are USB PHY specific. i.MX8MP
and i.MX95 USB PHY has different meanings. This will enlarge parameters
value and add constraints for them.

 - fsl,phy-tx-vref-tune-percent
 - fsl,phy-tx-rise-tune-percent
 - fsl,phy-comp-dis-tune-percent

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - keep original unchanged
 - enlarge value for some properties of i.MX95
Changes in v2:
 - keep widest constraints
---
 .../bindings/phy/fsl,imx8mq-usb-phy.yaml      | 34 +++++++++++++++++--
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
index c468207eb951..22dd91591a09 100644
--- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
@@ -43,15 +43,15 @@ properties:
   fsl,phy-tx-vref-tune-percent:
     description:
       Tunes the HS DC level relative to the nominal level
-    minimum: 94
+    minimum: 90
     maximum: 124
 
   fsl,phy-tx-rise-tune-percent:
     description:
       Adjusts the rise/fall time duration of the HS waveform relative to
       its nominal value
-    minimum: 97
-    maximum: 103
+    minimum: 90
+    maximum: 120
 
   fsl,phy-tx-preemp-amp-tune-microamp:
     description:
@@ -111,6 +111,34 @@ allOf:
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
+          minimum: 94
+        fsl,phy-tx-rise-tune-percent:
+          minimum: 97
+          maximum: 103
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
+          maximum: 108
+        fsl,phy-comp-dis-tune-percent:
+          minimum: 94
+          maximum: 104
+
   - if:
       required:
         - orientation-switch
-- 
2.34.1


