Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEF9C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZndBujw9OuRr+VzZyUrtRbIB9quR5dAV2UgB2rz4a48=; b=RbbOCRwBatO/8xUJ6r/OuuLrEN
	SDH4yJiaPrWvm6avwz3Va5nZXGr6zOWZiIb06V4PdF6MnbvubI5hyQ7OmbIUu+wMoSBBF2sMFCcRj
	pRqbiOfvGuHcScyau3BjE+qCOvCcmvByyEhlnk/5ZqFCPIVfs6CzYrScFFIQeZgqwNKOchd6ndvq/
	w0RJ2XfZJHIr1PiNdK1WEluJC+vNU66U/xRFBfE4W+OLPKTqgKV/ACzCybAN782KP+UYkZcmJcLpP
	PNbwJn6fKxaOCQhSi2vngCE9VZUzZB5hmsnouDAWC5HEna5ZfAklFOR2tGGDRDrRTigxDAv/xRz8v
	2v+djy2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOgd-00000003uwB-2iIP;
	Tue, 04 Mar 2025 09:35:39 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOcf-00000003ttN-0YEw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 09:31:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eP0y6XHd/BDjzNqfmBKS4Q78GCBzAwzxTT2BpaZlW8SeoXq8h9kN+vGtBh2uV4CgZgoncbTBGRHa4BigZUDj0kqrpofO45NQxmDp31i7qmwM6Zlonu39bGAhmwLv9+CMjE55qZ+9R+SduEBylZI4oz9g6x1EbQ5ua9OxO4WejslJimtHEhVl10EvIcitHRRHrKs9a8KsUze3jzHUyAqv5f0NG8lC4Nvgpm2hF4r6N4RDippRw+Lhx3gJwsrD9dAYUFEoXhanBC3ypTVW/uXXw6FJ5isEln04ptVp/3LZl5LE8nVfIkESYIcC19GfpDpnclS/I/goe9ckwSPQecM7/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZndBujw9OuRr+VzZyUrtRbIB9quR5dAV2UgB2rz4a48=;
 b=maetBmdz+fb3EzwKYYv5/zc/d2qjI50jPgKLSASUNN6Sy5tHH2dOWLKeFFiPYD3UzmmL/3SYo2GcngX7wyFYbsCOHwpWT3qVPBfQvsEaYQxfTKRtmXuql+XPqsc+lCOwNhpjipen+Au0KAxRxSLXN7BhTQxN+Gh4Ylj4Hg9WXZi6Z7L2ibOcsUhWVnuSnXeiNY/CJqRPa8vfvm742/gR/+aUs1QAuY38Q7Z8h0/fndL7uCgZh7Icjwb5RfNcGWuxLh4gpwL5TZJCfTcAjEph3KzeOHU9gKP5ehIErhc2LHZxV6VJx1WIkuOPwumIIOesXEOMjNgGILhIVYxuCtN0SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZndBujw9OuRr+VzZyUrtRbIB9quR5dAV2UgB2rz4a48=;
 b=igxwFelR9NC5qCEjNgHMNbZzdM/4xZViOJP/tBt4eaeLmjBRzKz0Cnvl6OzbXOGuTfZo7PFuIgqcnJJNTt7IaSeoWvbtkF6xkkqR4kNvIyupnskYwEbiU/vV5/1ijy86r+PaiRKOMAAYVdLz9i2jfOa8R/UTCAKyW1Wutk1yVJ7lKfsU2EXZ+krmEEb3juJNH+K3kvIpcpV+YuWZRZlGky5qp+XhQ9dghsXs+KgzVdmT1TLboPVMR5f2TLm0s7t9PKSwYQLinZOMzM2mqgWN8dvId+u++xO5TFkAMb6d51eBv9x83N/C9jFbO8IUMR21/+CBwtfHDhzz9h+4dqbkaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by GVXPR04MB10381.eurprd04.prod.outlook.com (2603:10a6:150:1e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Tue, 4 Mar
 2025 09:31:31 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 09:31:31 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	aisheng.dong@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com
Subject: [PATCH v2 2/4] dt-bindings: arm: fsl: add i.MX943 EVK board
Date: Tue,  4 Mar 2025 17:31:25 +0800
Message-Id: <20250304093127.1954549-3-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304093127.1954549-1-ping.bai@nxp.com>
References: <20250304093127.1954549-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:3:18::19) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|GVXPR04MB10381:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d376e69-4545-4661-9369-08dd5aff5907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ovylPr9evzuml63Qqs8/+RDb+CAmuDXXwbTPvoSdMUc+efckp5t2DiGD/c7K?=
 =?us-ascii?Q?3HGSR2KA0tjo/uNulD0gR5juqhlwMN+JW5gHbtX/fCk+lwDVdQZ8bdMr6nau?=
 =?us-ascii?Q?4Gj7UJyNxl25TkZMi2haKnVc7m8YLhzM/3AH4UiyKh44wWpddf2ApS+F6DY1?=
 =?us-ascii?Q?k29xlopBNyMDRMBb23mWCqqdI5vp1UuGrsUZmZR390234FnQDEoyhyFtCsPw?=
 =?us-ascii?Q?OTKOmS5lbkroKr3v32nPUD6/812usTggfQdz56FOl1ig2horBLXNQr/8NqF7?=
 =?us-ascii?Q?tDTFUfTLw+s/vHvxQFZxZcsnYw1cdWNzWgcvwfDcie0J6b0CjPz54JkMLMlv?=
 =?us-ascii?Q?mzVpMQ8R57Zd/oqsKD3udIR2jm9Y21oFiW+V4NowJ9YLeZSk9+/UCx8Y5TTj?=
 =?us-ascii?Q?LFTN2Iu6TpCZSjODklVlBzR3iFzJ+AxwDjHlL5m0Io4okmJOi3ayMH1QgUg5?=
 =?us-ascii?Q?3SAQMddRmzsWSorMcw6nIPSeV+7HGRdnvctu6B/N3OmGGtbnxJjSwFzyByjW?=
 =?us-ascii?Q?BZICpsGf/S++/6liMz/NmuhwcGMkP2Ok3LurhHh448ot4Phc+dGcKmQiebkr?=
 =?us-ascii?Q?sYqI5Kw7nZAoANcnQQZd0Ust0Adv6nnR3qIFw/olx4sqZ/Hz8F1+gumSZZVX?=
 =?us-ascii?Q?+ORJ2bhj8nGrwvfNEZXEZCWb0o25nzTdUtGSDni3KirRZ5Jeill7Qk2cHR3e?=
 =?us-ascii?Q?AxA2Mb7nHe/V3JbLL/i1q3mpu3w847Ppi2VaWzyImY6lznaJjXr+wu9+BsKB?=
 =?us-ascii?Q?VsOmFLym6Mh1Urzx/prj9USlPCEtEEDGJ+o7tU6oRlGnSIswVM3QusnfSMgN?=
 =?us-ascii?Q?rzCTFriAGORLpm6y9ADf6fFceguC/2JxdRqFewbnoVQC1GaeKwj3WjV7vuXb?=
 =?us-ascii?Q?LctlC2WbzoY0dW2PnwroDHaEB8rsXVdC8WKcRYX/le2kyDM6p/1heIQ5i4rx?=
 =?us-ascii?Q?fxPCvg4kbkoFtOCa+z7Q4ZIpq9pvSjSIfLkXwFUo19KyZYOqeU1TzPxnPb8J?=
 =?us-ascii?Q?mrx5FrppGbvPdhOOsvFKVG8a2KabbzS+H1wRhl7/tQs8vBiv4WR02fuvVe/Z?=
 =?us-ascii?Q?atySV9oxx7MIrkGCagRydtw9rRi/EdFfnJ0JsNlYST4pgUIAFERfojR6z7Y+?=
 =?us-ascii?Q?/t1DPe7wx9/t1ibiRaRCxkFb2wGNUIflONiIGWuU7lgZCSdvanfljWgb7dng?=
 =?us-ascii?Q?OgPepU8DxyJtQ6+MDFqTfJzA6VwGeAvycnQoA7u1fLhrXutuLO3Pl+dF7CkL?=
 =?us-ascii?Q?YN5Rykq7LBExGPNmJWPEkEcabWyEzbcyXCNOBJIr7gAJ4Yhbm3A6oAverFsJ?=
 =?us-ascii?Q?PcDXckTBnC7GERPIYbvQW2SeXxIiqLP6uQNJA8xNve6aSrZ7kgSSArR2dWCa?=
 =?us-ascii?Q?a1X9s1huKPt+NxarkHIjw/wc8+1Po1k6tAbXyALX+XeNUgYpYnTdcrQynp6c?=
 =?us-ascii?Q?ZThTGhMmbl8ZNgaU4IFdqQgLA2agRJ06?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hSRKjgMASYTERKtXDkNZKJGmLT8EoEaY9kUPUXsV3zyp4gpac2/IaSdLUZY9?=
 =?us-ascii?Q?58jnN1kYX32nbpnUq+yVY+EoL9Xi8fGB8mDF/3FVnAmrbVcRPWP8KbEeH8xv?=
 =?us-ascii?Q?vrLqohAKX90LOD62MUeYyOi4RRdMdX3/mC9yOkbZ0f4jk7xJEgNoQN0NLf/k?=
 =?us-ascii?Q?U5rDvfzmDSVJDaTL8dXRR1dCILO+8F7ckeurTno4x2HIgNWXOz5bxC2jMK7/?=
 =?us-ascii?Q?SSWht6jBXXlR+bmtoZLp86s/HsbIIWlNxwL2EP/YnveJ10/oer51w054QxNi?=
 =?us-ascii?Q?eQ95prH05AXQVsf3JCzjA+xedrjmw/0MjmCPBGUxLITVB3E5++vPSQZJX7Ge?=
 =?us-ascii?Q?Vyc/ynyxq/jH7mcQpCihHLWF0atsuoTkmNCHB8CXEkHaSQmOZ12Nf2KIJTEe?=
 =?us-ascii?Q?JgLQlnCq4eAC+pF6bPO/EcthYJuZRK2UIhCWXnie51kl0pC6iNvmJbQNLX6D?=
 =?us-ascii?Q?ANWbstw6wTy+8Gf+cwCfQ13EXTwdsXfp+styg+mWpUmSzzZLGjzNev21ZPHU?=
 =?us-ascii?Q?ETTG4oT1ZsjRZFT6QbNXBff+9wYVSfiNxyIxWnZvnl2a5ZnBizOdcIgUjeBV?=
 =?us-ascii?Q?FMX8xNzTw+8ZwOLapSvNExgfKuukvec6/p/oNwjZuu33Y1L2PCD3hqNvHhmR?=
 =?us-ascii?Q?bNNreZjvwXS0wgymAiN9BS3x61GB8r9+3BIvuduxgGwPtkxOsIFGQ0fsYrQl?=
 =?us-ascii?Q?QJA8E1xJma7RMoSNL1Wwddqt7pJdZ3AGlYW+nCt5CLoiidaMlKFGkP1QV+NE?=
 =?us-ascii?Q?I46PD4pVFsGEp66ar99UQP0zl7PD3Yu4JLg/Pf9Yvefw5qxISRRNNxTCQ0gL?=
 =?us-ascii?Q?yf8dLthO6kc76HOBupqXxqy8nPg0YCkTo8h4dyHIzR/qxupnokDTSczb+F15?=
 =?us-ascii?Q?9+haXTZ6vA7GBwfHUobIoQ5bbfdyecnNeKs+87rRJwhf5Q28aUKus9YZRaK0?=
 =?us-ascii?Q?vrq2W0ODHVt7L1zgDS200gAaInaxiuLiReG3kgSMysprTWxWtNXmdv4Lhwse?=
 =?us-ascii?Q?AqtPpmBZmew+PCR4aDh0JURa6sXHYTvFGX3IqTl7G3f9cAUCvR+vVOQ2RNbh?=
 =?us-ascii?Q?SpuxD7+vXEIet16dlbikQv9PsgxHI1hety5b8b2dE2TL1RVlpl2LDm1YFTSd?=
 =?us-ascii?Q?7VdWFPpAdRoOWQQGKwhIF8TwnzGKz7/iz1JFAh2Y7/yY+2S6J5sIxyna5Wn0?=
 =?us-ascii?Q?q2YicVN+ayi5cjT70NlLg7FDn6URMKWG/nojhl43h+qYzpOwt+mNmL5KWRQL?=
 =?us-ascii?Q?AF2thTLLeEhS7XATK76PySppvoaUM+TPdA+yTqfY/aiPpVfDlwzJGHKlthQ3?=
 =?us-ascii?Q?CpEHfostyh85SRAB5a3Xf6EnRYYxYjQ/LCL8Q5qz6DdGheAtprIjomPUDxvj?=
 =?us-ascii?Q?FeEe/WlaGZvP6bEnqqYPIIp/L2YS+Z/9bK6zXs7bmsxmSuSMrff5BkU6E7Pj?=
 =?us-ascii?Q?l3Hdt/BzGRd/2fnsjw9OO15rwXkocQUlYbZIaG1SZ2bpBeh1Q/asSEaDBtqo?=
 =?us-ascii?Q?a5VczJg4RvTNnZwtdCB+V1dvUsbiP1qGNIGX2BjBBTdR4Wg2VO6qYFVSi1cj?=
 =?us-ascii?Q?fWp8HvWG9Eg4iPsg76CQ/nwK9BIro+sdhWb9Sa99?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d376e69-4545-4661-9369-08dd5aff5907
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 09:31:31.7683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ze0PZYMhQ8KY4PknAIVHC9y+MKM7R9IHHszLguf1d+mq9fNtYCu1nS1mgFfDYPhBCqVn2LdxSpQT768eismwYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10381
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_013133_168577_931546D5 
X-CRM114-Status: UNSURE (   9.08  )
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

Add DT compatible string for NXP i.MX943 EVK board.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 - v2 changes:
  - newly added
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 371317554863..31c1d5e643d2 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1349,6 +1349,12 @@ properties:
               - fsl,imx93-14x14-evk       # i.MX93 14x14 EVK Board
           - const: fsl,imx93
 
+      - description: i.MX94 based Boards
+        items:
+          - enum:
+              - fsl,imx943-evk            # i.MX943 EVK Board
+          - const: fsl,imx94
+
       - description: i.MX95 based Boards
         items:
           - enum:
-- 
2.34.1


