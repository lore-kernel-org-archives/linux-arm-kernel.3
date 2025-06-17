Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C518C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 23:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:From:To:Message-ID:Reply-To:Cc:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ENYija67nYKzF88wY+ApFyoB6lh9ldm/03zlH0/EzHw=; b=DgB4BXzRRI6bv4X2FhVyZrLePx
	FyfJmCXe/60NaqofH/coreuwo8rysLE6mTK8Xjbq1o4KFvFrfMhtjLvWV68oAL5VQcauYFqeRplb/
	ogQNRGAaSAEiU28U8Da7TgC913AU5ILB19tvwSb0qIFH3LBWUJeilhqLd7Rx8jvHg5Ivi3fw++S7e
	w5gZSOxvMnMIGdtyWO+K//w5YY+YK1ZXzG/GLoDqW1aoYPXbvJWmMvH4Ju/DCGzLZFFNEqAqiL3YV
	NIl0x2hhKpP5CZzw359ZjTL/z93AAcPjbT8BsT8deYsWWNwpQzZPd6bSFBtX3w951AaEbo3CVpZUg
	2fgacOPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfyW-00000008diZ-42bg;
	Tue, 17 Jun 2025 23:44:20 +0000
Received: from mail-japanwestazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c406::1] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfuP-00000008dQv-3yeb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 23:40:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHNuwu8ElYWi6RAM2sktLK5NRxSWIdfHuXpwFuRgZWESclNN1Dwc976cYsNtk7JLmNKkbtuFxWKjAeATKB6d0O3bwIw3CyNCfugAtSYuzWf0N1GWGpSDkL6M3wpGOA845Z/vXyweVmoN/KPJvpdQE0PnsUD5ioWbo50iVP8a/RQsWS5NbK/W7gH0yUko2tI1CSYl2IM07QiC7on/UlTuUP+YhSHd5rmu9Ks4CLYgsUPTUvl02O6+pMEVYSfphwSLe1INFpdh2OZ7/KzhFMLIUeBtquP0W8oRQ1Olm7I/hTgmpNa/0buRBZKBsrc7RT987JUEe9sFk4JwWSqIPXpEWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENYija67nYKzF88wY+ApFyoB6lh9ldm/03zlH0/EzHw=;
 b=FHqRe8QtW66ehepeRLUSiGlqv0qiX5qhZttAJxaJvJRyHrGnbzd+2E/dJ3MzDIkGGwtKqHJVz1ZD+UZtZ5Fld90V1tF3PltUgvoqFrtVKTUL6NMn98Bm2XE+wSW3w1Xi1BISjn01YuV+3kn9IiA3BwbPR0biRn5CP8RMJi2QTUeUKC6du+tQkJmDcQ2+yryPanxCbpeTxqAahkqVsrvvo1bxx9IRwUD5NzzDFKPEMGKeVKJdZ9b67ovpAktqe0M6b9a9SBu7IAV1Bct/0c0Vj48J63CxbJ/BmKtf86jMzcGoTYz65PudbO80g3uXcKLXI4s1y9wQ+h+9TA8rOqFFBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENYija67nYKzF88wY+ApFyoB6lh9ldm/03zlH0/EzHw=;
 b=GN9ENg3YmoJXyyDCvgaepdGgyOiJaDQvZicHl5X9BPyj5ntICw88ZEsjRiWMtIbwkaEWbOrKlDK/GVaYdacyUfAE/aykVND37usWjRLP/NdqUkHcf+aaOW5lnndLwakpaR1ZAA7dQ6+DW3rfkeYvsvnn1+YXUv6ejQod6r+VwNs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB13401.jpnprd01.prod.outlook.com
 (2603:1096:405:1c2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 23:40:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8857.016; Tue, 17 Jun 2025
 23:40:01 +0000
Message-ID: <874iwendin.wl-kuninori.morimoto.gx@renesas.com>
To: Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] arm: mm: fault: use string choices helper
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Jun 2025 23:40:01 +0000
X-ClientProxiedBy: TYCP286CA0268.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB13401:EE_
X-MS-Office365-Filtering-Correlation-Id: 38e96945-e5f3-4be9-4e8f-08ddadf846fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+w7NIY+SsXlv96oP2xWtVySFaiGC2vGea3ZUR5kLTYemVswMY+LaLW6sBiVw?=
 =?us-ascii?Q?7SGmQKE/L8zMakUpTsJDW0Ffsmb6jB3g+X5CJhT7mUfLSt8fBSTEQAoX2By0?=
 =?us-ascii?Q?Qu4zn3efQglLbUWU52/jZw8RrRK7IdqKQe18hlz6icOOPWgUQ1Oj9588Yoj4?=
 =?us-ascii?Q?rTz/i3/T9+Tvx4OJuEXPzeTZjrkNEmWJ84exdzfemuvJHUY8wHcIIblRwnqM?=
 =?us-ascii?Q?+Uoo6zwQ6VzpJshtSHd3SmPnJPU7HVui2/I6kW18tllUsBpUEbVcO5/0BNXY?=
 =?us-ascii?Q?UdjOp/af0FiDwwrmCC5J19usJrJcRkhIreT/IlEETjD82UClyVmuDZc/Xfwg?=
 =?us-ascii?Q?4sgQvwkMyZdbcq2AWo1Z8Xu9w6SBIZGgpKuQuUyGhRxa0w7mTja1TZhrPUTK?=
 =?us-ascii?Q?b0knL7huUEdQ+fozrXytAHu+27hjsoQWyfLJbmIiU19Wr6Ok0c96XHggXOaR?=
 =?us-ascii?Q?gpqa+MpOTzAKrVx76n2yl06PRLvzam/qQx4zsaN1K6h0Zvl8O9hZsAYzQA8d?=
 =?us-ascii?Q?MmG6Ws03YsNVWu3yfwvqA3R/LRY/QMCnAGeFYmrFZ2ELyDW3N0m0swQv/p2O?=
 =?us-ascii?Q?XNpA6K8riWgDae6dsLcoYWpyHokcasBF5kH22hwItOxg0EvVEqJKiofyJ6bP?=
 =?us-ascii?Q?WQz5LbfhRz037L43cBzWkcBFFvoOtY8iMfkRFtsE0YRbgEZ3/C0Mkajb62aq?=
 =?us-ascii?Q?F2p6OzuZerzh03E+p75dGGowmO7a46qARL0aHrGu9x9qQMj61lva6Er2amh+?=
 =?us-ascii?Q?2QhswvQNCMZ2Fss4bCn4NXtPXwG2nLOYNKZLGdcf5kMS/dVgoBL8XGDTeSP0?=
 =?us-ascii?Q?n7f0BP1zPBcyXVC2oM/Fnur8Bwf7AK3hq7SCbMKZ3zvYI3PCkc/Xyr/Iedbm?=
 =?us-ascii?Q?YBhFss1/+ZO0lMs7Sw36qf7iIptk30Td+UDTOL1yjG9Jkzj438efmCdUMtif?=
 =?us-ascii?Q?InukLBVhDDtpw45X+RvBq1ly/rSCBupVvcJzjl/UtB39ZEGH7Gfgcb3ai1b1?=
 =?us-ascii?Q?O8SYPl8YnsNZGACAGganCkJW6xaLid5/LOlYAvPKS/me8llAWjnaDKGKlcNo?=
 =?us-ascii?Q?P5FhAUTHpGhGhKXZ66Q9m/C/Z0dAnYxgtGnYRQ0RuG4Mk80Rn7JJhG6+uidQ?=
 =?us-ascii?Q?KR90Wiv1IiZB6hhq1MBmswd1fsND8c7rXg8oaO2XXvqLGjbWBbbzinmdvumn?=
 =?us-ascii?Q?kAgtbHKR9OvDd5EXeUyGwu7dFZdx375uQNbvlQ1GPZt4LLIMhNJvFUeOhqAo?=
 =?us-ascii?Q?ueV0AtoMEIaMjxOe0hlRlKIvIiq9XLeUGsj40O8NXkn9Ii0Pi0bm58L1i+hp?=
 =?us-ascii?Q?t4wk7RaDyKnBRBM5Wbt10Aui8iFX2Hhpl9I86m6VioOjy6oC69zwwCOd4+K+?=
 =?us-ascii?Q?DZNjee8HgEqCJNa5NUd38GcanI8kf56ffkVd+A9AUttOTDEdZY8wAdWUcsjW?=
 =?us-ascii?Q?/UOuJYurqo2XKGSm8lqF4NURQvCxHovYNBJGsjaPOE6c37oJ/2ZTqQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xhh5YAcsghdqadOx+AKe+Gsun1Uproj1/035EDF84s7AHmrZSWaMOp/mhrXW?=
 =?us-ascii?Q?Rxl3T3QsgIXa/g5XfbHWEaa6vl3qGC78bwNv4r5Gr/B4phjFC7P3VzBYOrNV?=
 =?us-ascii?Q?BN3bkMAeSZyZPnEIuqYYT1lqMK5YTcQJS8InDfB1rgsDnD2FkTTf7jxarGfk?=
 =?us-ascii?Q?C3U3ZKcyoOBz4C4d0jbZTz0XUlAjvF/gQT25Fn8y2z1ebcv0ETXejdVI/Z/+?=
 =?us-ascii?Q?C5zBB7q8M05LEdH0bM6dh3/cNlG2Y30s9aqJu6SWZn25rsDs6u6LY7ObaDY+?=
 =?us-ascii?Q?fhxJE5DOzG4vp/Eol3rxG46kxdo0Zo9ka/26NI9vgAVS0oXDtr6A8PyGvsR6?=
 =?us-ascii?Q?xH/k9hrxFEaw0sm86vqQS8y1Kw7uZZOc1u8l1PsG9UmypO50Fg505NfbQYEX?=
 =?us-ascii?Q?+92VFOBqnDyhIKHpx6i+hgef1etsym7y51XT/bkD93SEK76JXz62tkbDKwZl?=
 =?us-ascii?Q?4FiDul4ByAvcN5RkP8NRUabxdj/ivht4hEkn5gqJDUZ+Q+Yo7Bq22dyRsOJJ?=
 =?us-ascii?Q?3pbjPwq4nZAITHYOnAkOoCVbNjmctrNzSlGZps2EPjM8RAzNAslbj4jiDOtk?=
 =?us-ascii?Q?ZOm8YvgGnSEe82r/M/TvWMkp+MfosvhL/bRLEP06w2HYVb/NpZArd/2PnOH0?=
 =?us-ascii?Q?BMtrJQWq3FTKJg6/uKP2/dC11r6RlWP6sfbsRhCLQItebAk5u1yawnySnYhV?=
 =?us-ascii?Q?vJIYeumr6LHw20NKygmMOB8ZORmcQpRqE6q/AQVzgMzDqL/012JWyxX2E3OL?=
 =?us-ascii?Q?wnrNz103m+NWC+bVXVFLIUpPHC3Sc1ilYS+DZM/MygaeDKQsTRZ6AjCPPRfn?=
 =?us-ascii?Q?NFUGzPAGja8tuPVlAAwBpSpGkJyMAkZZE9AOrEjsDzUdwrZcifj7DdW8XRlE?=
 =?us-ascii?Q?bXp0SN6FeV7u1qjsj7qT6lmBpGLqXaREOv0vGvCYFIMbNc+sJYIpRDJo+kS5?=
 =?us-ascii?Q?umBaz1KFTGxVPkN2xsWqfCiSKnFIkjOPacQ6cYCxOTS27fXMoJu5D6KgRPwZ?=
 =?us-ascii?Q?YO6tIQSWGatjGUj9sQz0hIrZ+bXWBLYXedePuAiw4oWvuiiGYm4EJETxYv0f?=
 =?us-ascii?Q?8mxPj3EYzDyaOANND+aQKLeICe/xcPeDX/ZtWFsap1Ix+bRuiEl8u/8VPlh6?=
 =?us-ascii?Q?g/txx+svFtVzopZSZa0S4GqiMcqfl9dzT9Hu2d4t/ulmBNyeo3Bkgoi/Vhfn?=
 =?us-ascii?Q?O1/Y3tTYpOpu82GEHScn1dgUL2SmT/ETbLTkjosRvW5q4icABNsEDdoOiFOH?=
 =?us-ascii?Q?ovpgHYg92G7HFLn6F1BXKdnUxFsxDzzVEvb765kJ6e7Ged1Bais/ezbjOaKd?=
 =?us-ascii?Q?06Y7w46/1J6boWBDJRmu41pPc/vN73sMkfZlPRPMpTHudYEt1E4ufQo8H5E3?=
 =?us-ascii?Q?GKPuKkyHpZvui0/6HJrSIC2FdgvZgwMRkOjLLk6SgHUZf5i+G2yZbvZChrF2?=
 =?us-ascii?Q?HC0huyvNIMMgfFjRXXraOO2GnBWgh8867B45VPgE5WbIfSpIilEHhYKlvE81?=
 =?us-ascii?Q?9khlIYwnV2L5ZK74Gv07Qtkm8dnI/5my+mg3iNJN45cQcB0wpyHqcFJwxUJn?=
 =?us-ascii?Q?thfG9DLFnguP7K/M2J18wqc0PtD8f1SHJ4/kUFGBlS3igmA68vOj7pmJNgjC?=
 =?us-ascii?Q?nw5+/4H+3ugn5Rs2o95d4EE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e96945-e5f3-4be9-4e8f-08ddadf846fb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 23:40:01.2275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ScHT5l+383JGf3jlTfZ8VF8+xHJo0ZAb2rPehaeYOSTfhfO7BLDb0aUG1FGKQ1HXZLe0BbZKqr9x1LUDvTs9xhSgTqQaIn8k8V+T5TIOygiGickIB2hFqqnH0iJfKBTR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13401
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_164006_000631_0085B9D8 
X-CRM114-Status: UNSURE (   9.01  )
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
It makes one line code.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- add commit message
	- makes it 1 line

 arch/arm/mm/fault.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index ab01b51de559..825054b21e0a 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -135,8 +135,7 @@ static void die_kernel_fault(const char *msg, struct mm_struct *mm,
 	bust_spinlocks(1);
 	pr_alert("8<--- cut here ---\n");
 	pr_alert("Unable to handle kernel %s at virtual address %08lx when %s\n",
-		 msg, addr, fsr & FSR_LNX_PF ? "execute" :
-		 fsr & FSR_WRITE ? "write" : "read");
+		 msg, addr, fsr & FSR_LNX_PF ? "execute" : str_write_read(fsr & FSR_WRITE));
 
 	show_pte(KERN_ALERT, mm, addr);
 	die("Oops", regs, fsr);
-- 
2.43.0


