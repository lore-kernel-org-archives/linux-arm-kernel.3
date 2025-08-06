Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7924DC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 00:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:From:Cc:To:Message-ID:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rxyu8Esb0LmaAJVTd2APbyyLbKxXDsu3GltuxV3kosA=; b=SoOuVPZR1zKbeG0+/Lx3u5KW7U
	xdnez/zEyLamJ6bj0AgUUDpy2DwwUEjPKFHpvI5q0llEqiHS4kD9FxF/Cmr5B2O1l+tFjW8vOs6qa
	X5QXdCOFQPxC6YXNnlvA4U90e1yFbvzCw/aXBb2yPe6l3Rnw75HV8EiZMXd8R1i2z9gyfIwXo9PaH
	13WxpuOTPWtsNx/J3NeUGPHUOqtyjTbaw2P9Em8UB8mDGjeZmhwleq+7VFv+s5mEhpirpO96xrLRi
	nUlBo4O8N+KRqG/7oC7FawXscWZJL4viSyf0h85NZWaPcrKUogbjOGE4puuc2oIn005qIjIk6jpis
	kSSURIlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujoW5-0000000GvAA-1WGT;
	Thu, 07 Aug 2025 00:29:57 +0000
Received: from mail-japaneastazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c405::2] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujnQv-0000000GoUh-1SNS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 23:20:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDyb2X0LB9wSNp2b6xPZ5fKLSNyWpHWXg427FVi/ywEndx3niEGN1wLnWZU16bVAEOUkB5JNJNMut2Wd7qZUoCujbZLbJa3HdEL85EvFKvgGsZ2KFNLD1elHka+arjaMkhjAl/tuH6quLTRkhvtEvKGoFedkjt4eS7fDF4RucwY6Ep0jb/DpuAMbcS1yE0bop9RXfTkzfLh3G9vT+Atpij7LxcBUMgo8aQ7wNmeDYvqrlTiz/uhoDL7p0xKu9f4QfkWiYaVNb1AYHCFXpbjbsF4tnWHtMXCAn1sMDYsbh5h+jimgfd9FQRsx6aTdxeEfOQtMZGuzacg3vT5Ee+UvQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rxyu8Esb0LmaAJVTd2APbyyLbKxXDsu3GltuxV3kosA=;
 b=aUVSr6Z/lrZI8pGCAG3FyPk5QCBKaXeMkJCPn7x0Rm1Djcj9Tx2niSrO9AUXgj1gWSvmOYTSA9Jc0FnH/wm64Xmx793r2F3iSdtHEwSS/YYuMqAdHvH+au3z4Z1AA89SCao+ruSmGmK6Zg3Kly4S5P5yJvi8/kiQxSiM2hLO47pGdJ1N7lHQSsXgButqYeDs0+s/g2U/BfAGO+z2L+sEf/wvVbccxDe5mxRh4oGfwdLDbuK1TyJLM+sD+E9HOYaF3o7pYq/mQObIqkQkydkttMFPQRn1j6z65asxgr1EZ7xRccJgaaBqDoRvHdcqzU8oMvOIqTADdWyEiiQDjYXE1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rxyu8Esb0LmaAJVTd2APbyyLbKxXDsu3GltuxV3kosA=;
 b=crZG9KYqHPdT97XZUaP03wTFEEksD/ZrR3NqBYCWV+k6Y2/B0bCpijkFKzmcW6ix039L3mJ79yngaBogX2jTi06VgJf1ZgU4rXhwv3pfsxDja6zRgXoEuR6FZqDNr0I/LLf+XnyaKvo9joyEyE84Blb0Av45Osay6bdTh8SVn+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB6910.jpnprd01.prod.outlook.com
 (2603:1096:400:d3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Wed, 6 Aug
 2025 23:20:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 23:20:18 +0000
Message-ID: <874iukdolp.wl-kuninori.morimoto.gx@renesas.com>
To: Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
Cc: patches@armlinux.org.uk
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RESEND][PATCH] arm: mm: l2x0: use string choices helper
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 6 Aug 2025 23:20:18 +0000
X-ClientProxiedBy: TYCP286CA0112.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB6910:EE_
X-MS-Office365-Filtering-Correlation-Id: ebd1f4e9-fb35-4eda-011e-08ddd53fcead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/Am/Sw6s/recA+6oUkbURqfLM/O2i5WwEPxCRyLgjbr+TnNZxpHWJO1Z5JxQ?=
 =?us-ascii?Q?LBgedeA1CydTgFpCyu5YP1Au/44uLi7q0OvIN2l3JPexjKE+zyTs9OxWXE6d?=
 =?us-ascii?Q?cZ5NDL+GH6fr6N6zza6M+PVk8VyetWDhPNVekQ2tmFM+KwRYlXSNuxSCKswK?=
 =?us-ascii?Q?G8dksLh3Tuvtyr6IDvuR3IR9mxH+BfNefygYT0z1kZ4T8dpV7vQ30XZMfHbq?=
 =?us-ascii?Q?F9P7jWKYep4us/d3XFOx4u3vLZ7QEG4ey5wpmMwwPwTSXk9x4tFkYpWjGQ+K?=
 =?us-ascii?Q?xTU7n3fvdAA53L7tOyJX3M3Zczj1/YLOBuZ6D14xU1qJOaaJIQkI7GEkGL1G?=
 =?us-ascii?Q?ZSPXVvkCMaP7t5Kcqa2JLU2DbLGdjIxoehhAKrnFOTdH852RYv9+zN4oFmEW?=
 =?us-ascii?Q?qRv5wvoeGbYKvCofyHKZ/TQP7378SDpIxXrBYlS/KG5Npi180bYPf0Ro0Uh4?=
 =?us-ascii?Q?ycZvS3rpqopE+KCILA4bh1jOq54SKoRrEjY31+Up5kE16R972KxIpBnEuK8H?=
 =?us-ascii?Q?nq0/E8cf8x9BpUJx1hs042nAdcPXOHzG3iPHUjweELENMMh29fbivnBzCl/c?=
 =?us-ascii?Q?JNyjFtNwqJf7jqkKurxDm2Z613OJtmQ2y7E69+Pty7R3AiFK//NLmIrCK56K?=
 =?us-ascii?Q?+r7f972+23ep5xfxjO55NG+gUtIMYm+cWdCIwbe0xmMZgmKQklFjEPRoolif?=
 =?us-ascii?Q?Sd1A7NZki15sBtNWoGE9n52ipXjHLxh3+4PS64nuR/Oo0giy9etCSH8LKLh2?=
 =?us-ascii?Q?s84x7VtT4pLdJZxk76Vlcrjg1ca3hCxKsZP3MxcxVbIseD1X4JEbjlOyin/y?=
 =?us-ascii?Q?WKs8ORdKX/X/UrgeP/eN/tH3dJYi+WFYg9hpavq7BpAL6qPpJZI726mPwSnI?=
 =?us-ascii?Q?6XD8sYDbnRoZYnPIKAdvjkawwqrYBDP/8ZJcICojQX988ccNK6pztFvc5bkS?=
 =?us-ascii?Q?JpLoSf8EKqz8RwhjKXAGPGKeirJ0MLmD9yemHW6OkwfGVNJO9lT9glXE22mD?=
 =?us-ascii?Q?5oO9qO1Q6d8KCkoy46+DanaB0l93kimZFs1w1XVpGVqP4P+wnictQrRG6zMk?=
 =?us-ascii?Q?s8kEGLxpRdG1uHbEWezfAjX9uEzRfjiNfjdvbuFd+xIRTJD4f71MJpY4983S?=
 =?us-ascii?Q?BwC59V/lAr25j8NuxhdIWa2ULdq3EHWR1ckWn8CZryK4CkD6pEGSLqygv1Tr?=
 =?us-ascii?Q?MPnpc0P8ywj372l25CrFbDXe0rIgmfLWW83I3no1Q0CgTi2P8bmoFAp/Z8J0?=
 =?us-ascii?Q?c3JjcYaxlNrmqrX4bjPsqBQxDleK6C8gTc2LwpkmRbz6xwkT6SZTW7NjENeC?=
 =?us-ascii?Q?yQLx9sNgMdFPNPtUCCqNcvtGShxZ4YlIn8sgpi0m4YrfsqCOHGIpzyB9Seet?=
 =?us-ascii?Q?M4pnJKYZ9rRXgWnx6Xk51T3JBitkuKx2mUXUu6PUfNOS5gRsbo7BZS7G/Y5X?=
 =?us-ascii?Q?NEwK2a1wR8mQ/WCJtkaeBUWC5TwbZIX9NB91xcWqHXszHp5Yw5J0Og=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TCb5+OZV2tIUbm+sj5WkFSBwsAZbAG1zgZalAmnBV7ErWqodYk/pLhFocsFT?=
 =?us-ascii?Q?5iR9a9Q7zSozGugkeBmybGg0MnwAuMn2nNyeUEFR4eFgnClO6eJG3XMaTUbT?=
 =?us-ascii?Q?HvJ333d5cvmY4uDiUdhroEPaipT3dBprAdZoTVOXzuCa68Y9pKwVpAmLL+yo?=
 =?us-ascii?Q?7up03fq6CTAyQqN/u0E3c4ik+0RnnXgoL/FXf4dYyOrNDlm3wnrQtnwg/D13?=
 =?us-ascii?Q?gsVYmZdZqGf49JHZuvoqoyaxVBSUnhXEG5IjvuLX+sBO8M60I4sXfzRziHi8?=
 =?us-ascii?Q?OCILRje1t3swn4x8P3CyXF6dOey1Ik0/VpbvBBOw3l6U3qFLjMxu2dLPNvXI?=
 =?us-ascii?Q?hWF7yhfZWINh0gfN3paxDDqg0oEZQxLCIJCnkVbyxU4xf4UCr61WPRbOCHbC?=
 =?us-ascii?Q?r85Dzd1G/Ua4CXedI1LKJ71KacJSYTWeJ5kaP8VCeRHRmGeVL0Ai1rBe8juP?=
 =?us-ascii?Q?kaj3EzoWdI2VBZjN1NUP3/MD10iBN16gRXF2fj9ZfWYAZkg2DtgJTaidFZ7B?=
 =?us-ascii?Q?Y4zBED+AXOVhO1MnIogcD2n3kXcYStjrDKzqCIimH95kX7pRplOSJsOKZnLs?=
 =?us-ascii?Q?hOUfrA1S7jLuClACIf9q9aZmjAckJQ+TsdgYBcNMffCTju00nlWUSwpT7lmc?=
 =?us-ascii?Q?l0XRlDRFtqHZiVfN95Fgm44ghgEIWZ9utaqAuOU3rrTbAz/eIAHrB8jSMGoG?=
 =?us-ascii?Q?AJdTj6lHfw2BVdjFFx5gm4IWujuWxyS5WpPWlRxYESzT3Kfdr49zn4JMKMc1?=
 =?us-ascii?Q?6pUCXHHIPeFFAGseqzQDwZv0DtfaHIaCoatdR96rqSZKYVjwoyrFhgESCZIq?=
 =?us-ascii?Q?3SStcJgPrl08D8afq7aScw6qyo4UJbQVlyF+JzJDENzirp/8uWEUbD7yWw3d?=
 =?us-ascii?Q?nLJ7KYhzXvCXNjYOjQqku2/9uvWbC1rVbuqbjwBXGhrnlgcjKLyMklYJdI54?=
 =?us-ascii?Q?XCF6vsPZmz10+BbBCI1piTAou/bIqEWYa/jNrThmx+8Ig/Wq4FwNeHyKXqn3?=
 =?us-ascii?Q?u78A7ONjm2/xDYG2i/+uJSz1BLUx1RPGKBP2m0NKQ/3/nPY45LthpEkI7exe?=
 =?us-ascii?Q?7Yj5D7mJlfZfnYtEe+xLB9tLhRg7TVROtujpnj/1nnKFmaysatI/ZMge7AiZ?=
 =?us-ascii?Q?9+K+zBlkFjUpQ16EEkemJIUAhpMTgCDCdrP/RN4TAi0Cy9/FVlVqhN8SLkTa?=
 =?us-ascii?Q?pI5gwCd4/8SAyGbue5Wbe9vmAD5x+0Q6soNr2mXaLuM+dABk1xTUbR/YfRKt?=
 =?us-ascii?Q?PbmftjYixKqFymPQcjwVraFpEzfWDn3P72Kx442uquQxVH5lrCWCR+rsFmvw?=
 =?us-ascii?Q?Mz+NSa7WYFrtQ0RD9GsN1jAAnKPAwSIqBbfqVJN3FZWgrRwO8+QbQwpvozrn?=
 =?us-ascii?Q?9t6ud+Hvp384CGwxd+5NUYTHJnsvkAAZm/UD65awxzml/KVhdfw6PDLaoNLX?=
 =?us-ascii?Q?lwCDcOygNiF70/OdptsSzXgRJS618hUkGcLIY3QKcmb/0VhS4hKiGHABx/pp?=
 =?us-ascii?Q?lAZEYakMq8ewnNEmYCMAP5W1kR2xXH473FnmtArnLIEwoWdvFoCxq/V9i/w9?=
 =?us-ascii?Q?zYNezwAkovpJ8KXEyNSp7mdqTdnwn+3q9SWdqHF+TthviPrWE4CT3YCyiGxm?=
 =?us-ascii?Q?ilu9Jm5CpPSzwoErz0xKsdY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd1f4e9-fb35-4eda-011e-08ddd53fcead
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 23:20:18.5319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5HKmRPQy68MMQatPhF8uJj95eB7wq4RxzcdpV5zW4NbztAQrDydwOCoJSPeKLMiqquT7RBvbO/2enYPRpt496B1ZFQ8sPOMPT0f3UcZmRRN81hRrX109zLGNqQ9/ioPz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6910
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_162033_617143_622B1F87 
X-CRM114-Status: UNSURE (   9.39  )
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

It updates format

-	..."%sabled", ...? "en" : "dis",
+	..."%s",      ...  str_enabled_disabled(...)
	      ^^^^^

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
KernelVersion: v6.17

 arch/arm/mm/cache-l2x0.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 43d91bfd2360..470867160076 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/string_choices.h>
 
 #include <asm/cacheflush.h>
 #include <asm/cp15.h>
@@ -667,9 +668,9 @@ static void __init l2c310_enable(void __iomem *base, unsigned num_lock)
 		u32 power_ctrl;
 
 		power_ctrl = readl_relaxed(base + L310_POWER_CTRL);
-		pr_info("L2C-310 dynamic clock gating %sabled, standby mode %sabled\n",
-			power_ctrl & L310_DYNAMIC_CLK_GATING_EN ? "en" : "dis",
-			power_ctrl & L310_STNDBY_MODE_EN ? "en" : "dis");
+		pr_info("L2C-310 dynamic clock gating %s, standby mode %s\n",
+			str_enabled_disabled(power_ctrl & L310_DYNAMIC_CLK_GATING_EN),
+			str_enabled_disabled(power_ctrl & L310_STNDBY_MODE_EN));
 	}
 
 	if (aux & L310_AUX_CTRL_FULL_LINE_ZERO)
-- 
2.43.0


