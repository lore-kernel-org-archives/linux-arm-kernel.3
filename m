Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7A0C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 03:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:To:From:Message-ID:Reply-To:Cc:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QaujN/D6C+tunYJxlA7VzXphjCjAyi5TT+/UFtqce/U=; b=dZ+FgA26xMiTSSKVm5ebTReRFH
	VaOGxQ8Bql4WOBAU6+4C0suHkKrBq4jeFSMmJlak59JQVpCZ8/OJm9XmA8daE+kq+PBY2iNcHSFE0
	vHKSKQZ+rU1+G3u57v4IuGAof5iILzY/ce+dLxM0kVzzajA3VL0jxYq2fEU4u3PY7siXTJYONO+QW
	BPj12qnHAxK8Gqvt7Lf5iPlFbpKSAjqhU4h2LasxVFFQrNqS7F685PLawkyB8s91rTlwlW5CREaR4
	xiIAj2R1a19yahAARIa7spDtLXGTPJE+UMVdthgMeIfp2lHE7muixA0VLdJ7DqciEBv3dHlvEhxgm
	+HhyQaoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWep-0000000D7Y2-1xT3;
	Fri, 04 Jul 2025 03:00:11 +0000
Received: from mail-japanwestazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c406::1] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWSK-0000000D6Ge-0aTZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 02:47:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MX0DnDEtvAgqVxfYI3UUKrC4x1ymygVH6l1AOa5q7s3YRNlbHk0hWwdjJsf7A6uETgZC4GR6XRVSqBy2h6PtlXeJIE2hd85H3iqgjiytO/F7ikIGXA7Y2vKNUeX/3+1AeB1NxNjgf/Rkf515bzy2OBDsZ/kN+76zaMBsZpNjC5bbRr4Og/Una7PXt8zB97szmoTDV3/nZvwcZjxuzt4X9dpANXNpDX6j8w6kGMBSdx6CkJCtyQAhC1t6YMPnFtYP3i3Tbplzf5/0rvP7cfwwI/O1uaJH1AxMLFfCI6Zgn3S/x2RiLy9A3UDQxRvw/LAZU/BT6Zc3nrVhulblxlOsdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaujN/D6C+tunYJxlA7VzXphjCjAyi5TT+/UFtqce/U=;
 b=YWVFCPUxxh5dU+ci2/4q60bWh8V5l1SqxnoigNWeH4gF7nVt0ICiTx1KEH7+B+q0p3FAtlFFxarfKbVt+yVMpKNMuIx5jrUq1sWQbNgct7XPswWKLCH4ZblnTgHWwiUtMrnmBXiZdzvFzw2bFPZUA073GNu44Y2LNTxKCcrOzb4XkZ49Vzuw/qHYIzzfHljHrsOAubdknkHpZYPsx7/wFJMFB36sYku0EQe3dEvQ6LDU9r4zdWzCcMrwN/of4ePBHtJsvSenu5RySGtmI/I3/x7uheKnKy/fI8opNHhRkauDtG69BCG/IIHSHm432e1nv8tKzuBN8/5njdoqZqGTuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaujN/D6C+tunYJxlA7VzXphjCjAyi5TT+/UFtqce/U=;
 b=PMehq0Wk23ff9vX3Lk+AvzFnd+48oNK+hE+pC9ocFKZ7YCZFb7z5GISOOfLmtccKe0eVi10n1PxdSai9g9fG7XfQjfsmH88elVt1jOLvSwYHVHyxEh3n1pz0R62CM+b7kG90zKH015h7YnbOdhkzbla773V8SxL7zvxADtgO5Uw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12880.jpnprd01.prod.outlook.com
 (2603:1096:604:340::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 02:47:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Fri, 4 Jul 2025
 02:47:10 +0000
Message-ID: <87a55ku0y9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, Tony Lindgren <tony@atomide.com>, linux-arm-kernel@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 resend] arm: omap1: use string choices helper
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 4 Jul 2025 02:47:10 +0000
X-ClientProxiedBy: TYCP286CA0137.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12880:EE_
X-MS-Office365-Filtering-Correlation-Id: fcdf247d-c9f3-4eb6-2b54-08ddbaa512e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OMmhAQBG6q54uEfVSiEUdxHIQib9XTp+35DRJWBhCVFSCdYcHjesdmOPMJQh?=
 =?us-ascii?Q?3PkZntDuWYkQR93m54WLKwOvh7j4K5CA5eIf4LEEFn2IF9WOndK15CJUAkbK?=
 =?us-ascii?Q?ayL30Yfu9kLP1QUg1N8JDmNVBgOtSq51qDIHJaQMCdohsOXmDS156RTXjoAV?=
 =?us-ascii?Q?StpvZi2Vc6azuzPO5T6+HcIgQYqV/b6wcqA53rAQ5jFXdFkUW1hC/AxykOvN?=
 =?us-ascii?Q?Lw18ZZMNTZ30HuUEk86OWZ8a5CIyVkJL+z7v50glN7RciWJGUKtq2UJkrHOz?=
 =?us-ascii?Q?bpq8FA5fgOhYXMaeq8L7HW8/RbzORhaKIYqcFHnNy1wUQFpAzfAk4M4RExSb?=
 =?us-ascii?Q?gy6rqaC2ADzxlnGmrHILrXCg4k9B+/KwuIZkDGa8YTsvMDMI33T70E0gfW94?=
 =?us-ascii?Q?+AFmhwb0e1cV2tvup68X8U6gyYLIECLp3+vzZ8+uiFblBetN1H94/aCoL+Ab?=
 =?us-ascii?Q?4Qj9TPj3LqpYglmgP99XYq6A3VSQ7YH7IMskQe4qRDSsapjK4VSOLzkQCvPV?=
 =?us-ascii?Q?mZdbnIqfiF/gRb2k+Xc/b/EKbJide6G39WWY0G3psa3Z/0Z9D8Gh4FiojBl8?=
 =?us-ascii?Q?NE6BzQIuP20N4ZrIqlM4Fu4pNegvj9gGxTKPo6EXmHq5QrBq3g4kyb3e7DfL?=
 =?us-ascii?Q?o5dZvz2GfvJGzRqjn4nOWKzwtknbCaXw/Yw8KXPz5PXRkT9G/Zek8oFTWMXl?=
 =?us-ascii?Q?LPFTVwhpsfqXX8hNWmLyRAY+WC61OD7up15CrIB8tOe2ype/dxe34gLWqaih?=
 =?us-ascii?Q?ijNlvXCMhN6TuT8M6jvIjBuJSroH3wx0m77I9YvBsbym91l+mfSH27LOEPeL?=
 =?us-ascii?Q?HoDRM8jXre9kETxVX9VXpjXxexZZw6IWWEUynLiVj/ZisYmuHUyk7IdE8O9o?=
 =?us-ascii?Q?lKuoq4Euo3+HFVIjUJ9wu1SFq7rh3dEoUys/IcznIskncpxJiNMuDLGmUIsO?=
 =?us-ascii?Q?BbCqNBR/gcmP+HB0U0LIlJulsGfAE/z2uri+UMlAMeWm0EEIZHWGqm3cIZbr?=
 =?us-ascii?Q?GE01aM+HYgWz+FqLsZS0FI1jkvX1qrjadZ4uy+X+8aXmUxIlTcbhTsLlkJtK?=
 =?us-ascii?Q?fZCNgOzTzqgy2OaYcsqetEvCRjStLB27/BhE89G4NGHhDHD/7GA+B1KygXNF?=
 =?us-ascii?Q?rbHu4iqwSxUiiHoh5HlfDw02OPgSW/5TtJZ4cGtCwlsvfE7ODZJUeaDrGhCh?=
 =?us-ascii?Q?zITSfHDm2hliMPg8ATFqRVkWGmTeILRaRVGtuQI6oKquwfa9qhkq6LXG2X4V?=
 =?us-ascii?Q?Bur0ckuzzWIvh3nJATaZmTurow9HPVGTekJuL9zit2gPXnTRQNcWSqnO/1dc?=
 =?us-ascii?Q?SV3IHXXExemf1/b18FzOjedjgpKXLa7SZ7BYSGc60MW3+98qHdP6i/KkIOnU?=
 =?us-ascii?Q?bGcqWpGbLxsapxvkgEQ7zMEVxhyVjL4AljogONYlTq7FlYggZzGXJ3xW5evz?=
 =?us-ascii?Q?T8h5VE+1xKCtCT4ekPTsT9ycRu65ymdxta0QxNJNEXikGqSqacP08A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e45r5BzCGFGCRgjBCv6LR/ou92PFsjNBcbRsWuiXrYWSJ8583S+fJsrYJc6e?=
 =?us-ascii?Q?tXee87Wzn8xAAZp1rl/mAgPfmfwfcZ9iWrf/+9apGdEsdW0rq/TJGf8Y1hr8?=
 =?us-ascii?Q?Ijm3bQ0feEKkdLsbGoWs7+ZvNVOFendWlvfs7Uzn+tlmArv1hyWpxUQuCmBx?=
 =?us-ascii?Q?wDEkqe9D2VQCiYuuoURxaP48uCszdX7OJQgvwjdF4pF/JfdMy8qe0wtS0Rqi?=
 =?us-ascii?Q?3kg0jD4GhqliAxX4kG8aqMTuK7zkbpuSeWN4QetzEjoeA0iS04LVTcOn8bve?=
 =?us-ascii?Q?ZJYQGRM4wyWJ0VtKkX6z1qfYBl4DOFWTlPbyLVlBIdWE7+HFiKHZgKQ/IteC?=
 =?us-ascii?Q?NtsoS3h4Xd0EUMqwHptMHhBjkQEqAWWv1tkK8FrM09Z11QwFALdPx8PBE38z?=
 =?us-ascii?Q?Tvoh8V0sYG0xu/OJVo7cqf9f0APbqqyWWaoDkO/Z2KdnVyyN+blpuehqsX8K?=
 =?us-ascii?Q?Sq+j4QKDDJp9t1H4FajDU8ZSRgPS+g1Vp/X1WnX4/GZeWoOzj7dQIE0gIzEQ?=
 =?us-ascii?Q?JYfefxjOKnfAaFUJdLiKu5+ayPVCmVAx1qqv6mKT/nAmO9hlSb1AInTKrvkr?=
 =?us-ascii?Q?su8O0I5p/6GUE14W0YviA+oUuTNLLDcHzS1O9LeVlDYrKmx88Sc1ZCQlpCQS?=
 =?us-ascii?Q?yYqBB6q7JnaJe3rJ9QvBGE4nWGXlQHxiZ6pPVrS1vcyXPF90+R5Hw5fm5Fq+?=
 =?us-ascii?Q?CAT2wHQwCoorNRRFP2sjtrYGiTHUl+uQ04hmfoXuIFpbETrcVKfiXVW1vReF?=
 =?us-ascii?Q?C1ngZUN937ApfRYEdMey3By9A3Ijf539lTPuu5hlT0FJZ7DuwEW9NnGcbIuv?=
 =?us-ascii?Q?Q1GEJPxFVbo1TR3FszYsACrrMcg0TKCyTlLOEsDIf+iWDcVTwSPbGLgTb9xa?=
 =?us-ascii?Q?fuDVq3ycTg4BRHRDTH20US+qXCACu3+NJTYqC9q0KeLU7q/qauVcyvHvf6rd?=
 =?us-ascii?Q?SUpHHwLjcJKmEGkovGTR7muHQatklpKNnxIx/eV8d3iNQA/G9LMeh8MgXMqJ?=
 =?us-ascii?Q?Z5kp6eQJwM5VndE9vI8ISFMn3Nl/5i+hgHCjq/joYLnruFZj5rKXHpKPV3TU?=
 =?us-ascii?Q?DS5V+AlprkOz4ttUo40nTcaDgqhLei2MRTmCbW5KHZONW5xo+R4jzqjlPwgp?=
 =?us-ascii?Q?HCx81CQK7idPVGQPAMkemZitzIkAmLzeo+Eqtpg27uA3xfPxvWzVoJT4XDah?=
 =?us-ascii?Q?dmIy3y+pcZDyUp/Q5pAghX149AUwsQJiZ3CnoXLD9stVzcDPv5vfh4b11RZr?=
 =?us-ascii?Q?QgJbNOgT2sYSJaavSa1XQjpADA9aXwTbCkgxCpjV2/4jK3oKimM0YfSp7MgI?=
 =?us-ascii?Q?zuSAhA7gR2APuh4twK7qeSYr8Ol9rgy9P4iyTFgXk1vdDxiPNwySF8KiKplw?=
 =?us-ascii?Q?kBZSitLFWIk4FZodGRbrhIC3tj2Lm9AVIKKwQYXKGbKq0wwVMBSED214K6fZ?=
 =?us-ascii?Q?nfhh+78BYTthsRc9kjcL95eLBYCHw8GYszmYLt+kTWPIqEa3W3HG2vSVbkHc?=
 =?us-ascii?Q?RPz1+vGSfyEgGsrxIBWIpfP/m9rigPw2hQozSAKQeIYRFcJbSkfKg02wzlbU?=
 =?us-ascii?Q?cX7Ha7WWU0Si3g64qGBUoqSR1cXqRKMSDXgDHUnfeKv/0yqYa7Job1VhYYG7?=
 =?us-ascii?Q?+mUBCZjwHwL8HUiy4z0H2IU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcdf247d-c9f3-4eb6-2b54-08ddbaa512e4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 02:47:10.7517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0aiHj7M4/udlW3cHrNqVlK3S5ITCZuy0frK8Vahzif7kCxjnlpuRbJ019v9eCYfyCi4XOlbwLWpHyM3Ut3Mgs2hsVuAPmu/Qh5bOqBrf+fRJZCIaeJHv8CjTufWhv8V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12880
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_194716_178194_F2F5CF15 
X-CRM114-Status: GOOD (  11.24  )
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

-	..."%sabled", ...? "dis" : "en",
+	..."%s",      ...  str_disabled_enabled(...)
	      ^^^^^

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
v1 -> v2
	- add commit message
	- add Reviewed-by

 arch/arm/mach-omap1/board-ams-delta.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 0daf6c5b5c1c..2e1c235303e5 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -761,8 +761,8 @@ static void modem_pm(struct uart_port *port, unsigned int state, unsigned old)
 
 	if (ret)
 		dev_warn(port->dev,
-			 "ams_delta modem_pm: failed to %sable regulator: %d\n",
-			 state ? "dis" : "en", ret);
+			 "ams_delta modem_pm: failed to %s regulator: %d\n",
+			 str_disable_enable(state), ret);
 }
 
 static struct plat_serial8250_port ams_delta_modem_ports[] = {
-- 
2.43.0


