Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F084FC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 02:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:From:To:Message-ID:Reply-To:Cc:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G0P/RBklAFJHan+O66Q+dJ3B3by6UWeorp5yTNy7DZk=; b=UQFZxDbVut+OgeUwXhFPukoyE4
	SgU2Rz9r63Qn5BqrTkKPfJy1aazKy3SlyXTCXv33JxMn9hfhJ1iQvQGgAUNWy3ouaWgVAYPzoPQXS
	rpS/S9f3oRECuBg6nv0PDR4FDcQnHueigal5PHWAQMSSEgJ+cXeWPlUjRMLK7nIw174131wDXVUbY
	7vlHv1ezuLal6BiyMJIHLMj/HeSMTcrTaHvN6OVI3/jIzlJVGTleEAEkX3lneNqSUcX6Ah0Dr2ezc
	s2uUrPgPS9JyF4S5nr+SO8Yg/m6o/tMVYfrYGlc/71m/0z8K6nUVu0rRMwHvH1TZPhIUxFh0wOJYG
	wIZVFz6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucaWF-0000000BW0K-1KOh;
	Fri, 18 Jul 2025 02:08:15 +0000
Received: from mail-japaneastazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c405::2] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucaGj-0000000BUB7-2lhs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 01:52:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LoJZ3AmUXe3TjDgQAjMXK3Q/fhCIfOLNtRWUwwN+08qZ5FBvdO1ZC7vDru6hCY8/KEUAUe4GZtTVw2tf3nhTJ1jUYb2JzX3wXkodBjoT8jQeHkAqlgHlssFEfmNA4G4r7wGZ8RwRb/4hu8K5uCdJVrCWjOd4F5PuetnT0jQVFkV1xOeexvG5fn2sUYbpH247Gvj2fZYmyfKya/9P4iizuJb2dJ1L6MdsXgOzfMHzOOB5WgxMM447pBL4Lmfx2UYJCM8IkiFSvzS5PJ0PekcEjJ8Dg7vy8eppd9AmN+UWlU8Qfo/+MVEcDVBMMhWezYa4nejSQ/zh6nn8X/PWSY0gbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0P/RBklAFJHan+O66Q+dJ3B3by6UWeorp5yTNy7DZk=;
 b=dgJ3SO8uVTH6Qbg+q6YFg0GgDO9kRx8nyczaIE53J4RZnaj75tbnAYyjEzf4j6Nk21+aqColrWCAJVscKqwkeo2QDR+6PR+NClyuDdQn2PbDvoMWt1D8TL1M89IOT+IDFGAftoGynxqWxrKwFcT0eRgr3siJ9ixZNNzK5Ubr7vMK6dJQMJej+9XCyYRMSXEsy5j8Tzz5PaO38wDuY/e4PwUuR8Cn7UMih7D5C02wq1oUai+rqTACEId/wTtMHvE0TPRF7kgyMGGvshuoCQBpyYLjf36Bxi+QJ2SikBDjjASb97qr7MLsMrJDUde3oQqFAb6n4yBziHg8V6zbDIUVrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0P/RBklAFJHan+O66Q+dJ3B3by6UWeorp5yTNy7DZk=;
 b=Ix54YLWt/QQMRTmwYaeL48PdWWhBuLaJGCUYPo3mafzTOTo3Ze1rsLfjIZrPlySiO6v8iyiHmD8lyLNRETJBQYN5Ptu6SLKY03hIwt0uHaiNJYzFHmbs0SrHevJ/esU9l7nt8UaeANu8Bz9YuhoXcSXHQ6T2S9biFGNIwwTUdUs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12514.jpnprd01.prod.outlook.com
 (2603:1096:405:1aa::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 01:52:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 01:52:11 +0000
Message-ID: <87h5za5kqc.wl-kuninori.morimoto.gx@renesas.com>
To: rmk+kernel@armlinux.org.uk, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [resend][PATCH v2] arm: kernel: bios32: use string choices helper
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 18 Jul 2025 01:52:11 +0000
X-ClientProxiedBy: TYCPR01CA0134.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12514:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d3234f9-fa67-4161-c301-08ddc59db678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FWMXnFizLXrk3fWqHdFD3JLexnqNgh8lKDxxG20HfyBy6u7WwghkbeKZbRc2?=
 =?us-ascii?Q?WchmK0pelUviUKbu3lZ2o9dFwGjMdz3Vk6SUF1FCrjAvGn9B6eTl5GZ2//Fd?=
 =?us-ascii?Q?iWknt3a/wR/RbGvHEJpFy4lsLltqUgtPEadKzUnwsJFoFL4/nUFppFL0ZKUM?=
 =?us-ascii?Q?h05R4YrbWYORwQkqp/VuY3bMpzoXjmA+Ce8cOlkudmilSEb29foMGICtz7E/?=
 =?us-ascii?Q?ZuUQDzQfUksFn7nGfkZacjxRtpOxZjlHz1e1Pka/j32b6MZKybYxvJVIXZuE?=
 =?us-ascii?Q?Di7XdMzoZCjGCpsajP86RSROLHuZNUl3qm4le7MMl8QPXgthoOAPZzD4V7dB?=
 =?us-ascii?Q?iLibCgmRHVDl/52SYKhneglT3J11KOAS5xE0kt4ahId5ECghpbS3zUqnAAGE?=
 =?us-ascii?Q?txpP27XLssFF6bp8+pRhpUBrF9XJdAGUf3fTWWVSoA1wihX7JPvysN5NdSgr?=
 =?us-ascii?Q?tayLxI/5EF3jOvDL7DFsK7Z/HRhmpLfuwkq6cIHc3ZsS7PldW4Cjr9KTMXhB?=
 =?us-ascii?Q?dPmYenOPrPU+GDRbkc6pKhjR3KKrKBUvKq+FnyYNX+h7W+aRWApY6PKQY9+c?=
 =?us-ascii?Q?sPgJn7u5mYHLgNVHtr4XQqpHP2QWk/KaA37c72C+0/IyhgRn4SgavoKdMKKb?=
 =?us-ascii?Q?gpjv1twvXT1i6aPf4eEBdEEBQGIprVsPhIwjaey6Dvs2VGvH5/8SVekd2/CU?=
 =?us-ascii?Q?g5xrSvQixYd9RLJRG6eD4HEycWPQa0SV4x4Zlq4cSY41H957ON3pTudga3Z1?=
 =?us-ascii?Q?vBFj5ZhIVqT9jvrQIFqIMRb8SQDgbw8rceVqcgBlQfmRM28noGtNWlq0fyob?=
 =?us-ascii?Q?MSHfW6CJqW7yC4Umd3RAQTTB1w8w6B4IkxbzDuaEMCxtThnajVCn75Nf12R8?=
 =?us-ascii?Q?v4zSEE96w3sraOYEQSwi8/rElUUr0ZRCSA5dpPwYCfS8GTNoq6zE4QWKQaW2?=
 =?us-ascii?Q?JlHaP7pOSfhyGrGmuSaZwWfE9SyA2pSYyaQlXlHUYt/fn4SApezg5x2tJqyw?=
 =?us-ascii?Q?BSjPDaBnAPt7sfWS6AlwvASZnzX+4BE1NeDzDVVv9YwgoC5w0EVTptoPbIXD?=
 =?us-ascii?Q?yb6V3+iKfpDbIrmiaB9l0gfx3r23nMqshePLcjipYyq928Njdc59cH4tqMR1?=
 =?us-ascii?Q?WAScXtlyDvbp4lopcYqYjllClhW1eDljFXwyD6ZXtTia/5gvQTL1Usi71RF+?=
 =?us-ascii?Q?Rh6IEKuJTqeKo4AG94r/s/UZ8tBkVOb44qdgnhD/4kLtI3ikOzGrhOAmCcmt?=
 =?us-ascii?Q?ACLp+CBnWOvvr2Ow3A/40eZrrXjEwDP7xQziKcMBkh2UxJDmW2/KQxlEDyJD?=
 =?us-ascii?Q?cJ17TFc5ZvZSXLksorQVW0Swz7W9g6S+DtHy3Tb7d56Z+GrnVcdS+QhM59Fm?=
 =?us-ascii?Q?vEQaoJ0c9C3AlSODO7RsUYAbWX07V9ckEpJT2njAB6D7tVBNuOTEk3KkVNTw?=
 =?us-ascii?Q?geDyLbdAH+q/xUMhM6/75KXFoYT7P1E2ZKJBw1bhQvQhQZslYlY3sw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3FaLDYcJKQZa8gubAvozcuNFxLZles8m2SICUU2Qzo0+/PWk9hAPahXQ6vUQ?=
 =?us-ascii?Q?0oU3teOf/boGubNO5ihtTJ8mxICKPAZ05FEoHOk0u+Ifi+S8O8ICo64anAe/?=
 =?us-ascii?Q?QQL38RC+W7W3MCboD0RAtCVya7zcgBlWC+unGtN0EtvSetykOWYy6S9Yum7m?=
 =?us-ascii?Q?Odhjw9ijSYHQDazUNmkfaZqzX3onwqOuC/QOitwJ369TVmgw36G7GdjmDzT0?=
 =?us-ascii?Q?aoKEjYP7rpIFN8d5J8gP3je8WFHuRAzmzF8n4ENxAugHXj0P/VZ92ILHRI3b?=
 =?us-ascii?Q?GWeo30rbNoSgPCrdu/OruEBGZrSK/K4w1bun4dqQAOpunMlnJasdirT9q9sR?=
 =?us-ascii?Q?XPD3kEEfsWUp+Ozf5HDQSJPYHTIG0g0eWChFQAdM6Q3d2yZPvjAHtbc2HBdB?=
 =?us-ascii?Q?XLmVn0Jt5aJcTG7bRorvHfUYkSYOgvUykvxrO97KadfAA/9spL+JaDpKSp7j?=
 =?us-ascii?Q?sk6veBbCbFMXS0Fb26eT149KsGEyk6dRHQdf73NIn9d9uVfrsiQFB+Z1pQgG?=
 =?us-ascii?Q?Uu3fbN59SN8Xc4Wwn/YMC6tIGeiRe9B9wUrIyCQ8v7uVFNmjbJMm6su0peWg?=
 =?us-ascii?Q?xooOEtHulF8H3tW9bBi+b09obtJiZx4nXhSW9wV+LNlUWJQNOBgHEEQ57Tio?=
 =?us-ascii?Q?kvWy+snyRHmrkriGaKbmT0ldIgWovrzq3PuAL0VkHiHq10dH/Sz/AmBg55Fg?=
 =?us-ascii?Q?8qbEBcvO6UVOXJM/+js4s0xGBJcHS86o+n9Lu0PbeVNWbpc1VgOoWOKvds4i?=
 =?us-ascii?Q?//VRYidhYay0vl35/gFlodrs+4cJoQFaLV8h6cHiz8p4Atfbn8XhkHKkrCFI?=
 =?us-ascii?Q?rYQYMt8BjN7shwSGJ2SSmd3iHya/27AV72wO1kObrkfRmvCMdakiIeq3xOGL?=
 =?us-ascii?Q?y4egDgfGinJ4dboBf9HZK8vQt/gakAuF1OeuggEpzmBVXIT6oL031jhPtukx?=
 =?us-ascii?Q?NcOfEbub4Qcnft4UGb+4vBUSSlrgY6MWEEImaacLgFX4cv+QwjCi0NI/XS9O?=
 =?us-ascii?Q?6KCn30YX6isHgFeY6pXvskYDACnKtPXnoB/fKEQZBGx5RJMhhj81c5BZe9+o?=
 =?us-ascii?Q?T8lqUbX7RenFwpc5R5wF+Cl1HiRTrwYMUw+PfGMyBKwtOwdo0X6ik6s3sShb?=
 =?us-ascii?Q?0dHkWckCzDHYcNv7mCRcIlsmvxZX5kYTS9KGPBxECXMBcrFVDDP4nUIa8WZA?=
 =?us-ascii?Q?00nOORQx1D1fRwyYamTQ8dY/rRODDNVyVUYL0Lf5Jy62Sgp2hubV4dZmEcQw?=
 =?us-ascii?Q?Nwat4/fEwAb4Q0Ojm0Nd7bRz1y5VRGQkgDw8rnN25E7rLax4npnLxvbJaLph?=
 =?us-ascii?Q?lMMucVgkPqE7LvzJpVxUa7RcGkbN+l4NjHKsVI11PfiQj88xCs8GwAuce9G1?=
 =?us-ascii?Q?9lKJAW/aTQjxbaWpbIe0TxI9qmNwPB/7P3TmptQ9zvuzBwYyOxIXD0s9bftq?=
 =?us-ascii?Q?2QWYYbJp9cyYNsKTYsDe89c7eEcojG1tsr4/jPo5UcOcUg8fxbrhezK1dXOx?=
 =?us-ascii?Q?eelT67/xzwBEPP81XWIzocKs8X3C5UstFAxesLI0az99MZhPwFJicJoidjFs?=
 =?us-ascii?Q?XlDjzApFGrtc0GSn5cps33qfx6z+BhhNfD5AE3KSaHMerWqF9b+MLza9OAwX?=
 =?us-ascii?Q?872WUBf88SEYbagKzflCJ9s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d3234f9-fa67-4161-c301-08ddc59db678
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 01:52:11.9100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +k61U9fEDx17TmXj6S+X1OgcBHgORpKcRhUIUo4MplMJRc14lgK1pVefq+SlDl5JMUebZcQaBdVbnwevATGkjAV38MilXmXbb04NhDJgPRALtm/DOn5FB14oF7zOs3uW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12514
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_185213_699676_A3BB4850 
X-CRM114-Status: UNSURE (   9.67  )
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

We can use string choices helper, let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm/kernel/bios32.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/kernel/bios32.c b/arch/arm/kernel/bios32.c
index d334c7fb672b..b5793e8fbdc1 100644
--- a/arch/arm/kernel/bios32.c
+++ b/arch/arm/kernel/bios32.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/init.h>
 #include <linux/io.h>
 
@@ -337,8 +338,8 @@ void pcibios_fixup_bus(struct pci_bus *bus)
 	/*
 	 * Report what we did for this bus
 	 */
-	pr_info("PCI: bus%d: Fast back to back transfers %sabled\n",
-		bus->number, (features & PCI_COMMAND_FAST_BACK) ? "en" : "dis");
+	pr_info("PCI: bus%d: Fast back to back transfers %s\n",
+		bus->number, str_enabled_disabled(features & PCI_COMMAND_FAST_BACK));
 }
 EXPORT_SYMBOL(pcibios_fixup_bus);
 
-- 
2.43.0


