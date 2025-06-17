Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E26FC71159
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 00:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oKCr/hCKpECBFaI957TNqaba7Elnn59r1s47kUF4IW0=; b=dyyM6WKOjyRjt7MIthF6bOB1ZN
	fiJidTB4vhtmAoAUWTYATju8eZ8usZpd56NMj/rbEiEUx0xot6CSEU3+gBFUfNVEVRPmAGaZV+t6v
	eJgs39UH9FCg+kSqy89D2oIXFgktyzrfJOuXfinsZMVVqOaFHhJCXvtlMeuLQHi3AZEs8chSeK0Iy
	YxkUbfFDKkLikdwlAe02LFsDIM9PvQxYoB90FoNNlHPHt7TsuBzKQrVP/K+3JmTMZPVokgm+Qav9S
	rHeVx1bxFPJWR9E3yN4qBrFwIe35bRGOnUpeO1CNlQ0R5LyH6V1AyQH6jir8/AAmEWxU0VXkbgueY
	YBjCuqUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJsi-00000005rbA-35L9;
	Tue, 17 Jun 2025 00:08:52 +0000
Received: from mail-japanwestazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c406::1] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJqH-00000005rUz-3qJO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 00:06:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7wkn4L51dT4ORP1UDreDGIk+HSIlQ+Pz7Q2yU+AVQtG2G1pRFiw5WaLZqQJBODZXAan4AOjW2YYPr/+F3VCLUGHiultuv2wDWTDTrLy8muMXu/dI9PhMqaoSr/9h8XV47JnaFzrUe7uudvlK6QLIVff8UItHJOHTbuUpeK9Gb23LYPRxusfWSLhxiVsk/14DVcr+hHFn8O7SMyYmphIwaoomNqMAV1/1ARApQv9Ygw/Dv98mCmxMZ3X08964ih2L5u0hPDgwWXDhx41UXO+U6I6Jt3SjEiuLylcfuFPAKb/KnB+TnNZjWkCkL/LDvDtgCwR4V5nUei2jscFWXZNqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKCr/hCKpECBFaI957TNqaba7Elnn59r1s47kUF4IW0=;
 b=VzeGE8FQO7mqFd5t8m2++o0uDK9p2k7xCFH9CEG4zV5ppTnKS2IEUHmaLU0zd6fKhWcGQGIvyAqvzGXZmHS6fTy6p1NAZH50gfmxc2eWNkm91kj2ofLyAUdfu3TMyuBdNUAe+haQYYzD80xJgcXIeb268wFwYzBXI8jgQzwh/HJ/pzP26bOLUlvcR/EniRW1s1/W9Rj0/zSeRY2ehTniXOE036gdpprF+WNuvWvt8L+GPYipuR8Y7OmgV0GjByVTNjKZpus+FbEmPMHqSzcqiPxy3CoZzM1UUn0rzAV9kmWnl4BqLEfmRsCtErWE4+cYVmgdbi+GndEdl9mfWW9Ojg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKCr/hCKpECBFaI957TNqaba7Elnn59r1s47kUF4IW0=;
 b=WoFHkIhW+lRzPZM+Fe3dT2WAIyjaLudUjK0mRvDZtj/KdEh39Q/W2T/m7KfBJm5Q1I1yBjduOvt5MOtOrsG687j1b+gJ3MvcWQnXgngwpsZzsvtAQwtTvnpRkyjzHg/EFjORWgXL29ulv/5g5ju+kAb4RVvYjoLe8HYw5gr0xRI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6804.jpnprd01.prod.outlook.com
 (2603:1096:400:b3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 00:05:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 00:05:51 +0000
Message-ID: <87tt4fnsf4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm: mm: l2x0: use string choices helper
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Jun 2025 00:05:51 +0000
X-ClientProxiedBy: TYCP286CA0203.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a62b0ab-0275-4569-f156-08ddad32b8cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uL3bRhRg6FVfhTttuFcXwyBN4aZs1UrKH0DWUez0/WoXh9nLx1e1iAhC8+On?=
 =?us-ascii?Q?U0vU9aDxfqTVjb8rTs5io1UD4wfGHPV/zPuv96d9WVLg637COpCBAilDfIDg?=
 =?us-ascii?Q?1o2ZXBbp3G65F/NjaBLnIVIGa/ff6Z1oQVptmVs8HOLjOIrqwKSzgdWxVfyS?=
 =?us-ascii?Q?32k9/1vmECA8hqsIwtfdx9lgE/4EgyGwpGXRQy2QdC1895xzAKmzN4ApfXgJ?=
 =?us-ascii?Q?oZuYiWGMumZKmynamkJ7Qxm+mIskQkSojcFzM9xk++9WK43hSj6buHPpXIcU?=
 =?us-ascii?Q?j619SonX5abDZJkO06eFa3XrZGbWAwGNBPpxXh5Aml+HnfE4p0U9ZBwjdV68?=
 =?us-ascii?Q?ICiGnRP+cGqg8Ao9uZgH9xDUxSUdd799N3j01g0WViXKF3/saRF0zAt7QnrK?=
 =?us-ascii?Q?rPApeeTqEvRUS4g48eUOes7TZxE3a4rnMck76WNQSKXMKXnmJyJqjKw3fJpm?=
 =?us-ascii?Q?l2PDFEmBm6aGVljJjMuHiRY1PBhHCvTMtiXbWzW5e/jujILPNHUNcoAWGBDp?=
 =?us-ascii?Q?yI21awlLaL7l2ELTlAQSegL5gJPU+NQs5jGjlBgjE71/WOGA3R2+K0/XfWE9?=
 =?us-ascii?Q?ih/tBV/0OW9cUnFj0X1jySlaGJ3aZ30+Th0iZBRVCDmXSHRQPuep3wZR/otQ?=
 =?us-ascii?Q?8Xg9ctAZ21n+oler8tXv3+bE3DG1PYNYDJJa0CwB+xtX8wX5fM2uRbwyl16m?=
 =?us-ascii?Q?A0+2k5g6ALpkTXVRyAG83oHPf6LPalxBxVuhQIQSDDFq1jtvOJn9aLWiK4QJ?=
 =?us-ascii?Q?Aaev2MMHCnanLgBTN8y9b8GXi8r66dSgsCLP/TREtsTxkqEzzx0Lm6ESKzTe?=
 =?us-ascii?Q?je8llpodBexCwaKIyxH7x3I7ondJusdhntFVQUOkSOokppLr2Byisocs1Jdp?=
 =?us-ascii?Q?51gCHacD2iuXJFcpcqeOOs7FPX7bArTp4lE4rBVluxVSbh8cGGziRDSlrTmI?=
 =?us-ascii?Q?KC9ExL3nVMiZaseJxdFbbRAbCbDE+UN49G0B03Ipr873i7AQmtkFNUVTF9SM?=
 =?us-ascii?Q?Fet20T4qoVF+TpPdXj3+2zZn0XvIqbErBwhjSY9TR+FtJbgXhwaKGwO8BYSi?=
 =?us-ascii?Q?46KTdtcwtgI7xyt12QOTi61v1Fly5zVEqqo3c0mF2hUpOhxUPqRtWeAwTi1h?=
 =?us-ascii?Q?xytHQlu878uqfQPkTuzFipd5LOOM5yDbxJxket+SMZAAB3UztNRNmGjXq59s?=
 =?us-ascii?Q?A40RnvmLvW9ly+hQRsIhm7cL8+u+9ktxJZXnfALDgYweG/SnNk2dsKG3QnI7?=
 =?us-ascii?Q?VfwA7Pe1DjzVql8TQmRGntF/ykb8gtAP8H5KMzFkkUjauujzbJm2YVjch83U?=
 =?us-ascii?Q?+NkqXi9ucbNR1gAGjH2XMHOD05yg+CcYKYV10aTqT4B+Wskq79NUH0mFl75a?=
 =?us-ascii?Q?liVhQ7P3WFQDKQ0CJI+un79DNmJ1m36OTaeYSFCV1+9Aj/DOQOJcNYtvTUNL?=
 =?us-ascii?Q?FDIWJxPNYdU4SaKQCFcWoKe+fXKMnT0Ia44s5M19DoIGGZvi/uqlVA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5prPOZTKNMHMibwrAKCiHeg+8XmXQLwzUU3J1F38AF/udiLr8WRJtwNfc94O?=
 =?us-ascii?Q?B3gRLrTls2F9pewVWJVbxhQU095JzkiT60C+DT+WkYVDNvc62EBy7sP/oyoj?=
 =?us-ascii?Q?mVnnVWVRurNsR3jHgI/2X0xiGEATX9aUWs/7p1PKjoUTSDbTZ1QTOHwd6TaI?=
 =?us-ascii?Q?h+eTpu6F4umLteNBnFHcdyzFXEa/rn/rUA/QT/ALXn6IWiu/XdfFdvZf0FD7?=
 =?us-ascii?Q?/X8ICnuXGJKzlw0dv9e6x16NMoEmjZBeHiaGHO0saV/I6FQ1jh6xPKsgmKXY?=
 =?us-ascii?Q?nmGAuwdc2C/BMmzijOqVyZc41kWw5eGvX+f5N/AAB7T2ykoNyBPPXQD4uHTx?=
 =?us-ascii?Q?RjzVas8EthjpPE+BPM0NXQksPfWnPHfHnnldJU/UhtBfTPtkY32j1/MaCO93?=
 =?us-ascii?Q?XsYHXHDbrptwgwLmnhQvZCQJv/mNKGwK1Nz6z4mMdc8rlNpTYpXtkePI7xM1?=
 =?us-ascii?Q?yLcSfcp8MKB3OZLPeD8VL1K+N9Uft3K1mTIGax5dVSu4r9YB8TTeY/SFCgfx?=
 =?us-ascii?Q?IfhVUboEqmlADAEOoBo3pOqk631DQRbynXjM07+W0rOdQXMQDHe78d5yfwbz?=
 =?us-ascii?Q?6K7MA26xasablVVKTuyu/sPce6/usl36fNs5ncPp2ax4tP22pdPioicv85H/?=
 =?us-ascii?Q?OzMVOEsAyi2d9Se2kDw5kX/95QIbF1t7Bo54XfbTDzwmNUZssw4O0y/5ZlWD?=
 =?us-ascii?Q?WqyZmz3S0xVmI7UgkQXRiyyor8G+m0TpXva+AOWZ5+nsbzf7/eN1I/ymSlw4?=
 =?us-ascii?Q?XlxIJNA9hHO8dtiMk+kSzDpXYtbbCSiCRAG8bB959c0/hTStpIelwJgGFMXc?=
 =?us-ascii?Q?WDiGE0+uIf3cVXgC2r+AZNVVcs0ASfkoJX/E/v564dOvwLFK3AhH3kZYhFJ/?=
 =?us-ascii?Q?wZGV9+sBawZWs9WuoMSlC/DhOZNVX1D9E/vDVsAEWd60zy5SQ0bPZqAjtwC8?=
 =?us-ascii?Q?fgOsf4hCpKtVLAT2nTqt1kOuxYRRdsEmxENLTqx9y2sBKEKebxcpyuPDtUWP?=
 =?us-ascii?Q?c/0RFeq1ioCOGLNqh+4SO/9Ldvz3HjT1wOSxFGiYcCmn4G78HsOvLVtGpEjL?=
 =?us-ascii?Q?5hoYBkkXAtQzEKcboxXZjZ2uRoih5SsQQgNRARc5Vvr4oYPzy/CSZ9Xlv4zx?=
 =?us-ascii?Q?SgISZw68J1AWvBA/HoaP8SRdYxSLUZvs6JgTvkXIH0B6l4oc1vM2Ky/b3o8U?=
 =?us-ascii?Q?hh/bgboQO4CTGhateTIFCvF4h1Lu/2TuWHZ2DBglwR4v1VaUrSXZl0xZcHtS?=
 =?us-ascii?Q?cqxlULHpwosTAlED2vM/1GkJqTZ/9zr3AYDjxRMpdIsnLy7Q1LZ16JNJMOIH?=
 =?us-ascii?Q?iRrtD80RmiPk17+lkfAdRL+pFyvxvcpi4MmZtcIeZdA38Ebl4vByKaX/2JBr?=
 =?us-ascii?Q?KuBuTQG0WC3fU2BE/W6iTBTDbwXhZXwrWXfmLRZAub2TKoxKWfrdyCaTZJzI?=
 =?us-ascii?Q?5ZKYAAXZCp9TDklqQGc4eQmlcPKs493vDJ1jEfNgODoeHBqg6aO1TvlvvscO?=
 =?us-ascii?Q?WCcCjGaahHJXlz2VBmEcBLBAbDpxByNo69PAZ84wkS3g4Sa4B9p08KVGL0nf?=
 =?us-ascii?Q?Gj0acJYRe8NR/EdcEEcYYsz67XTSTOuMQpVqhCDOFZUZ5CNMayX1xGHlYJe9?=
 =?us-ascii?Q?6OryEQ+G4jnqqs8s9d2EqnU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a62b0ab-0275-4569-f156-08ddad32b8cf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 00:05:51.9303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTzlcgidHhw/DkXZrQevjWANOZlzsA8IFSUw7/+t2o72u7PSbmnqyOIlkvpgUcJksRAs0ZZE0cAYdmmUy45lLczICEmlGhDVCdpXfwXnCQcPwRtbKklfHSl8/VXtGYAP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6804
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_170622_191605_074ED5A4 
X-CRM114-Status: UNSURE (   8.63  )
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

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
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


