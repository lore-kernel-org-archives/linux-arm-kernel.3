Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E87BCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 18:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5IwsHFBZEPo5hYHE/8bLXOBz1ObiAh3u9nS+SZv3tk=; b=kJC1aoZVfWwT6JT5YhmSYCaCaP
	NaOqIaNSStevT9LGxycBwhYIoAsBbkyon9dzJvj3h5glK7M2vR2qywHGXXsZPpsQwy0E272eZVbBl
	a/bhZ/XwAoCNd/9GcpKgclUxU+XoVbormlbTfmmtwhHfUfFm9d+NfOZfKMWBvrNQdVwh3g9Im9CRg
	uU/fxeoqCZuOjzcF19QAvgd2MZgJe912+je+8dqg5DrXq9+ZZzl8km3ZaOzvfstx/83zE0BcwpBpR
	hQ3Rxldx/usbl4yww+m6vW5pTXgcCdKPLcPGgKGQXthmRb3dSZaUgXPWVCU8kB0M24KFk/uKhwkaM
	BoBACCqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzgHs-00000003pGT-1ND4;
	Fri, 19 Sep 2025 18:56:52 +0000
Received: from mail-germanynorthazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c20b::1] helo=BEUP281CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzgHp-00000003pFJ-2iXK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 18:56:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVDq84H55MZq4jr+7PgLTup4u9UhfDVApYKFpeHOI6B9YJ6bOa2zRakrHZrASocn9ijnNm0pqO2Tc5CG24Bdw9iUYec9VssYVQDZjjU63oUDarvFrkac9iKQMyk+kSqYqB4XtRFmEoDvOvm9SacS+JPKZ108kUMH9XgLsFab/YJZQxtZ6OlcairAS7sZ0miXhMXG7uaQFNMG0S8KbRrzPj1z8WdGpEfjYAhqZYuhU3G6m1iJlFBageDYvqJy/ErbH2bAA0zRFhnSlCZK97oCrYMvQsdXc73ehdDSBXLsTFZp9iwJ50NONKuvhq+XUxWKWdyo6dI5kPISBu72kv7yBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5IwsHFBZEPo5hYHE/8bLXOBz1ObiAh3u9nS+SZv3tk=;
 b=sGidu6vXxbU5/pOOXOkoWFtmw/mRTWq/NWKygfZP7WInItHyF7Mb4dFpvYJPE1X61gylZAOwToQLLqSxCGG7VYZhtjuka2t/4zFaE/dVJdOTR9VqctYq+1mP8o8KhyTiBFZwssY1BzPGP/VgnOZz9HGfa8/Yrjpvo/uKBcWvFy/L4E+BRLk2ByqQMuV+3FPGJzdcpcp33hwKnPZ7/Rj41aOlpnUV9KTjQa6qmCgHCZ13KYEOPsVGhsjJkBci02MXY5Inc3BftzBQbpHQtIq4m7ZmxWzKmqyfACd2wbmd4m5V9YmxCEydvjuIoJ0vDyVj+DdTEncEMDWXVfEeiOzExg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siewert.io; dmarc=pass action=none header.from=siewert.io;
 dkim=pass header.d=siewert.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siewert.io;
Received: from FR2PPF7274BE471.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d18:2::4f)
 by BE1PPF39BB4A911.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b18::62d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 18:56:37 +0000
Received: from FR2PPF7274BE471.DEUP281.PROD.OUTLOOK.COM
 ([fe80::fc7d:1a08:950f:3971]) by FR2PPF7274BE471.DEUP281.PROD.OUTLOOK.COM
 ([fe80::fc7d:1a08:950f:3971%7]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 18:56:37 +0000
From: Tan Siewert <tan@siewert.io>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Tan Siewert <tan@siewert.io>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: add ASRock X470D4U BMC
Date: Fri, 19 Sep 2025 20:56:17 +0200
Message-ID: <20250919185621.6647-2-tan@siewert.io>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250919185621.6647-1-tan@siewert.io>
References: <20250919185621.6647-1-tan@siewert.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BE1P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::17) To FR2PPF7274BE471.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d18:2::4f)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR2PPF7274BE471:EE_|BE1PPF39BB4A911:EE_
X-MS-Office365-Filtering-Correlation-Id: e12afc67-e0ca-46e2-f552-08ddf7ae42a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IrFGcPQeq43HW5w4gt3kM0NiIhMbHVE0kiFkqFWTLcT/3LBn8NC4XjHaSnw8?=
 =?us-ascii?Q?Dy294MoGlDG3plc2Dr9IdGoz2GQ7OAhJ5D+l59zSPHXwcpD+g0TZ9YJiI0fD?=
 =?us-ascii?Q?s+FcJV7/Cezjx1yZvBUk/7ubL3oWzrnhtigTwdSBD6FfjnA7hYr8IZcQoriS?=
 =?us-ascii?Q?D0iQzOEo/lnnDyqJ0nbs9MWJBm8me2G+gL0/8vzK20LnetQUFSnRNTTVLYxZ?=
 =?us-ascii?Q?U8kYnl8YAJ6qve4a1ph3HrLOjKuoWndL/7GHHc7iiKe0mYGBlMkjr2EfrWC3?=
 =?us-ascii?Q?hlS6z89gzpJHT4irGiqEmHil2mA0/mz9LSrqTfIxZoc2RwNFSSP9OBUWboJp?=
 =?us-ascii?Q?rVsA+uSEKBi2gWTR+J7q6U9erPwlIHJSOHogNV84UVHB41IK5jizrKYNR3CX?=
 =?us-ascii?Q?NJ9FVXAO8cvdFFbQc9+k1bh1H5Yi73BBeLAAN6dqtlUIFFLXgmic7cLDGNlT?=
 =?us-ascii?Q?tuaEcJ5gy+3uEBL39Ge+5TuiiReaptr7yW4sKzttVW9l0DkOqGq1YH2TJu2q?=
 =?us-ascii?Q?rvRgQJAQ8zejcXEYm+jev53jXtCQHdIQAWyV0pzn4ZBDlsxJH8Q0cRcbCjTD?=
 =?us-ascii?Q?2R0PTC72/FvwNpP7shXYaQiUr28AA+IJ24IVH9FZWsP0w1MB/5PDEfPPgJm1?=
 =?us-ascii?Q?w+6v9kp6MQzUzr5n80kdTqLBK/bTe3iOOUKcB8c9MtHYllaVntJO7Nvkkz8V?=
 =?us-ascii?Q?1ki83KAmhiTwOMUDzDc5EiIPMEYqD5OBZBxlGT6VOwrbv8+Qw9aev1kGD2Xf?=
 =?us-ascii?Q?DSFWU7gcOdiQBRoywlIp6cSmmWs+PyB3vW+m4Z8Us1vQefro/sGl7uBkMXzF?=
 =?us-ascii?Q?NJaHGsIESuZ01/eRP4HXx0LGsss1hch765r+29s/2rlDhJjSjimhs+76gcyu?=
 =?us-ascii?Q?+uny67iHD3wYeApH/X6mY0Z/DljsJYs2NLbEjLHyXDoO1OwfYws2nhTaij0g?=
 =?us-ascii?Q?FBCP/eP+vvUQoGSP1clp0Fa0+DGM9Y7RNkBLOyLM0KSYPd0P+Oci+uIYh7Rw?=
 =?us-ascii?Q?8OHQqgQ9eUzfDvqI/g1o7WIuANb8T8r9A1Ql25MBtibBexSG5XhfZvt4goV0?=
 =?us-ascii?Q?/4ygQl1RJ+6q2n0hjYMEJ1saLLwGENEI/p20uO7t20Hn6L6rdEd38fu63Idk?=
 =?us-ascii?Q?H1BrC+8FiN0HGRiS3FFIU9rkr6478CE7I/M1gUDc/fHnjTS4kuEbsufKRABg?=
 =?us-ascii?Q?U38pqAyk/BWudsj8yiKxEa133BnforCdOGTZjHVXvP0zJN7uN6yOdiOfaA35?=
 =?us-ascii?Q?T/5bQ3X4CWVwFv7E3cAa4BN6C4e59+iQ8WLs/FJBE8L56xN8772JZX3+L9dd?=
 =?us-ascii?Q?4xiv/CwwF0BTqJ9LAAWg7vJj9kQDQ/naflMlRpx0Cgh7flNH7aJQGPAaisEJ?=
 =?us-ascii?Q?S8jNZ9rqUERT9yYWkAkeuqrJgtTDRAeIou0nDDRauNTDQmcarpweBTRSytrw?=
 =?us-ascii?Q?7n1QMV/juU0KTgb1Ffq19P9xDlhrCHGuZ9NTmF8sWr0evrkAkBoXBA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR2PPF7274BE471.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DFDOkDJ2qtij+RzaTAUxa52lC5JgDuxmUKqAVht2b8lTwXyKxjle6UARX7Ce?=
 =?us-ascii?Q?6IZhWk9V5SgNPQXEkANykW1PBTBAJL56fIGm9Awpex/Jkkbn4q6SqFBbQuQQ?=
 =?us-ascii?Q?E9hgnv2DjWqSMvOMWUqmuYRlkXf/NRfQmh1s2xO9quZdBPFZy89CDv7Xiw5P?=
 =?us-ascii?Q?/iqWHUR68v050go/kTF9kMyckpi3xA0+2j7GbA2iGONVxU2SRz7VBBHu7L/2?=
 =?us-ascii?Q?9LYSjcDabB1JgWRvNVicm5RCLgSQB7vIZF9iZZqwqRiPoz1jllUTzdGj2ufT?=
 =?us-ascii?Q?Hl098STRZ/29qKNyoqf64SsAKpbKgmDRzQj/DgB4qA6fVEaCTTb0nhpmR0Dl?=
 =?us-ascii?Q?4zdjP4frtMPZuHdRxfot6iKv8SUUebL6Bi9J0tZSgUXz6F0gtjeoUss+rGZe?=
 =?us-ascii?Q?/PhQc3AYT5rwvYdZreIfpF0+NZGlSbEHFjWdK9PIUkMCenGr3JHx4HU8qUNQ?=
 =?us-ascii?Q?VyPfZnIOzETg1VI0FLM0aOLUgrPqan2OpSyq40zuMyaspMExFw24X5NFuQuC?=
 =?us-ascii?Q?BtPfdA6yECrTIF9+3EzCcUe46vdsv/YQmPg+cqVCPRKKbQ5Al0klQ5jShN9c?=
 =?us-ascii?Q?UXTu/QaXahTGxELB/S2LGbysueTqgc7CGocMm/j4nRw+pK2JdQWmkjohwSzN?=
 =?us-ascii?Q?zhdAd9fQ6bjFoUba3sI+Rrg5UgBQ8qluK3rksicadnIzMS1AVDASWCBran3u?=
 =?us-ascii?Q?yD8oFl+8u/IeCjOYfdWrpzWjjs6IVwc6hGzXbOkw27eEx4zRQmzX/G9waYO5?=
 =?us-ascii?Q?FJENluDQ9z6v13PnhTG2YmeRqhHpKhC4Jv+XkXoUfVKixhiSUpJznulEBsF2?=
 =?us-ascii?Q?gFpHLHnRMUCBweoZxOkyr3R6j/BGpRue/xYK+4iNBV9xIm+sevEgkS3qgw3U?=
 =?us-ascii?Q?2OqmGtpFdOO+AHy4IWLQwXWQPzhLa5oDSPM+WZJBrwCAV6QkDBWiAVqIFkcd?=
 =?us-ascii?Q?ixzBK6L+tlVkmQxxoSZK5vIe+skqr7la8pTdCC/wWskYtcslqJNkBmZyyRjD?=
 =?us-ascii?Q?qKwFc+Ely5+wysA/6ifty59KmkOVYhdqKMlZJyitVtW474+QUGp60gDpr75I?=
 =?us-ascii?Q?hsH6Ti0zAyWS62Vefr0pvpV0HrKZ8Y++ifo8ICjIFTPHCkLv5mOCFvzEumCk?=
 =?us-ascii?Q?JcfN96pnR8L4nQs+aqrN5pRSrpfH7hHDzK5UU0ZZ42xeQqnT8MRRL9+Ym4H6?=
 =?us-ascii?Q?+6YsGimu9EAIMBaOWlqHGM959Eh7f/F/MX++md4Vyx8Tt2mtAy3LTZJE8llu?=
 =?us-ascii?Q?lx4PK+iOv+XovpdZFc4FbylNmPqHR1UXd0OJT5bSg7/HVIYancD/RJLFDIhJ?=
 =?us-ascii?Q?U39G9qSSUtT8BLn60ohzThcAReEhrIwas3XE5+n2fsQh0zL7GtrkPrd8fkXf?=
 =?us-ascii?Q?L+jwQXYBFNlP6xSE/xIRVPHNxJOKd2qQMtNmTPszTTXo4ooV/1j0T0qouVTV?=
 =?us-ascii?Q?TqoiHoHfVzCmA2fJ5CSXDjRcNlybf4/3MjjopsrJEDdRUFmEReCOY5GdJSQW?=
 =?us-ascii?Q?eLTIfYLCOcZTNl7DEaYh6gxaqeAABjbIJ7rrXSNNTb9sauBaYd2vQ/pQHoFl?=
 =?us-ascii?Q?I3tuzQiXsMPKXNbBLe8=3D?=
X-OriginatorOrg: siewert.io
X-MS-Exchange-CrossTenant-Network-Message-Id: e12afc67-e0ca-46e2-f552-08ddf7ae42a1
X-MS-Exchange-CrossTenant-AuthSource: FR2PPF7274BE471.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 18:56:37.1976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e8b4abbe-444b-4835-b8fd-87ac97451a7e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTr4CPBzb+IMKgae4Conn1o2FP4Wk++G/bciJ7Xggc8Lfex80xdwLLc5vovV1tbD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1PPF39BB4A911
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_115649_688693_23F3E610 
X-CRM114-Status: UNSURE (   8.21  )
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

Document ASRock's X470D4U BMC board compatible.

Signed-off-by: Tan Siewert <tan@siewert.io>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 456dbf7b5ec8..dc0fa22db5f7 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -38,6 +38,7 @@ properties:
               - asrock,e3c256d4i-bmc
               - asrock,romed8hm3-bmc
               - asrock,spc621d8hm3-bmc
+              - asrock,x470d4u-bmc
               - asrock,x570d4u-bmc
               - bytedance,g220a-bmc
               - facebook,cmm-bmc
-- 
2.50.1


