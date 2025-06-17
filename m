Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D79C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 23:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:From:To:Message-ID:Reply-To:Cc:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KJlHJ28OHty+7K/P7duQBR5SZ8zYEK3c/hMCtdv773o=; b=BppAmAD64K8hdqq3eT+B9xJ6Ql
	zt6gI6K9XciXry8CZ9IkLG9+ZfQpKlk+5aKoQn9PE1zujJbSEPWVNlZB5julSRy8J4PbJ4k4eFjnL
	kl2otkOSewtxUzJrrwjD9ySZJSB3fj7WAoyXXa2q1x3XzlK4TH4DzS/Ova/kbMkb2CSZyRMzVXszh
	On3f4+iHdxz6dADVscAmz1bn8lWtZBOeIQhIsYRnRRKvjVm2bRaokmvRiy5hIa5futnZKUxyWLV//
	V2WkDNKeFbUYd77KnwResx7BhdBNs1+2HfdGKRptISxK421S+d+25T1HTMT7vYMGVJzHsZFFvvTlC
	4VUc1SGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfwM-00000008dVz-187m;
	Tue, 17 Jun 2025 23:42:06 +0000
Received: from mail-japaneastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c405::1] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfu8-00000008dPP-2TKZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 23:39:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nozqEn0VSfI52Tzz7bb4KQgu5VPqpetsyZt1S/gN4r1mXmUMCW8KFC0Ysrhae4zNK7HhdwGRNXaFjPNNcOQ3CAIGwZZ6GCY6au4sG8+lJQA2ja9Ue2Ud2asHms10CGmPw8g0ImA0peZrDG0/Oaq6AW/zrR/6Rdv+9Q++GDzu0ML1/b4yOMBQVv0i1cXsWCp/j3GVDk4kUAnJlouGKji18BcUfft64OB0Lt3IpN8QgF8Ya+ya8k3eCWy8Zi94tUqvQqY9ZSo/NNoBUaaZDIqzCl11sV9roTSJa3Yyioe6s0hps73gNlGs5uC3YadwLcHqPDStkffdj8dl3pZgxVrCQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJlHJ28OHty+7K/P7duQBR5SZ8zYEK3c/hMCtdv773o=;
 b=bJrh3+lGe02Gwe269ja/s9sGkxpupHUTfxTEnFMuNc6/NHXYUFJpNeq8Cwz3Jm3VvqJTku7r2nY00CZsG5K7jlZ6FstHdblYqiGQlggFYyFycBpg1Y3d8J53+WKF2cYKKRrFmY1yCwHgwcVBWWV2IspxZ+f+rf47fabpQcepdMo3qnccrsponTmhbgT/rfNVMLlBKV/wOgfVoaJguaef4jpim54nfl08JzcDYKlcJ0E8CmQcHqfGdDQ8iXm2mqFvHCFU4Zh6EWaHxllcpc9b5ohOtuDJaGnFB2Ee+3OKkW89aDc8okosQOFCYBjEkBRrmCaFRL8FxHM23fWAk9NT6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJlHJ28OHty+7K/P7duQBR5SZ8zYEK3c/hMCtdv773o=;
 b=MucGMpuGEn5EOx3mG3Iae5XkJXN6JpAsZ5emT6XTfb9NIsa9F2Jgof8ArxqboiWY8Uzfu1EucVx7tekCGmiv+Em9NTG3heYDwKrvsGhIg1EapWRczNCO85qq0W0y6NqHJtEbpOP2NI4oZxmYGhLn67emBAyflqVlXhmLr2WO/oc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB13401.jpnprd01.prod.outlook.com
 (2603:1096:405:1c2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 23:39:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8857.016; Tue, 17 Jun 2025
 23:39:41 +0000
Message-ID: <875xgundj7.wl-kuninori.morimoto.gx@renesas.com>
To: Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] arm: mm: l2x0: use string choices helper
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Jun 2025 23:39:40 +0000
X-ClientProxiedBy: TY2PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:404:56::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB13401:EE_
X-MS-Office365-Filtering-Correlation-Id: cf622518-16f2-48a9-76e3-08ddadf83ae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ym6YU6nX65IOwne06ecHlNZmBVLdmcrm9UwpbZ/pVMu2Yq5V87FgHpeKNxer?=
 =?us-ascii?Q?ltRUS8xyI1LDLAplzD7jQYd6kWVSPC5a97LUBLipNySacQz+yrh2vMwRjJad?=
 =?us-ascii?Q?GuSmrgAxRSrST50BqGeYJxAohXK5B+S9ufprwvkWqIB+f7ea4WAgHGWtSpve?=
 =?us-ascii?Q?NaAbJbd2PPwGv7YKIvsh3aUIvU1QZntIbs5Mumqg4e8I1WsqQWqejxM7JfgF?=
 =?us-ascii?Q?8FSoXycS6mLHLFusvQIdzS4NhpUjnALrJ/56tEB4RNAjWWbEd485QBthLpus?=
 =?us-ascii?Q?Z5d2rCaD7/odm3oRHsoUeNqDB7Z7iKNalxkIKnfIhYrjOUtbUbuQt2Uq7+ki?=
 =?us-ascii?Q?RBnWsI5I/YXpW5KlHCTinFyk3+jiPQ0Er5dMDKu218eP0u2y4WVazOgopsA7?=
 =?us-ascii?Q?vEl+eJq642dzzE0+utiN1h4gXZlDR/ZPHfjr0bnqSioV0vPnAqOaH0Iot08c?=
 =?us-ascii?Q?dCQgD1WJ2cfqKkcnqqUJviD9MZfbDTCeuHLMep8cA4Y6CvmEmIlD9B0KOl95?=
 =?us-ascii?Q?42vdNA+HDokRX8QRWynPHgOBwaNKaWkhxuWoodJgPw0HykJpgpiax9/PEcoK?=
 =?us-ascii?Q?PXMT550cm8Ukwcu0Yot1WefQ09cyyXUOAsRbD2yCaOWqFWENBMnMc4tzxlWF?=
 =?us-ascii?Q?PAqiIBlg8PLjDYvY8Wq5cTCEd8SADYmtTTDpCYoYEW0cZib8SA8YsAInMjqX?=
 =?us-ascii?Q?bOrW8L0M6/IQpQKx3h+/rrgzMv9HHGoWJhxf45uhpRALdO27z3E/xH+VnfYZ?=
 =?us-ascii?Q?kcOsfhAtvW9WXdIzWT/Yub7aMMltxnTCmdL0qsseonOKsJfYRVYg3zIp30Pk?=
 =?us-ascii?Q?eKRcUOjJmEa2M1E8WAtVmPsGNPfJ1+xiqpu9NMTzBcN9BLCep7JvG8vTB16A?=
 =?us-ascii?Q?tocuUUBcCHlB/nRPMT2V8H/14JBYcNWDPV1KYMQHFHrYwDftSWg5keV80XjL?=
 =?us-ascii?Q?U2AI0fpH9HBIFdsXFertXqzccu43Q0/F92PBWMhSUd0MpXqd0hR5YVHbsxMg?=
 =?us-ascii?Q?8YhIuyJhx+fWzJRDFkbP/KuhFnM/f35tQUhGBZKEXnlSFTsyqRmQ6N3gok42?=
 =?us-ascii?Q?vRIFFAI1w34WlFZVLSe9FKVIpF9ccoA1VfAr5osRpTSANFqYFOXeVQWwNMRu?=
 =?us-ascii?Q?IQSCMvgSTTAV0fMwEMPyI/HEx4+wXDOuSkMLszF0cK7+OmC6UyPTAaP+M0Gj?=
 =?us-ascii?Q?9rGIZa5Q8+quxJ7jKbWIz4UrdY59M8hR40W1Vdmxn5/7a25nZfgkuFv6XMMZ?=
 =?us-ascii?Q?Q7QIiE7zvo6pGAH/qvUsRtO4ENPDxnzVBxd6Dkrgv3wYMRzi/eVFq8l7Rooz?=
 =?us-ascii?Q?ITGqIZpsZHRitHWDq4BGmBppVCDhcHxaeWYhxf+qn0GvG5Fd+9p4hseSS+Tw?=
 =?us-ascii?Q?cPYd7oZtjCpdk6K+OegUq87rPjruZkbkfH+mXXebVEt1daV0ztxtfPnV9gT1?=
 =?us-ascii?Q?f1Yijuwm6G19EjRjuB97gJHasHCrXEvKJ98d77xKxqPfR24JZdEcIg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fv6+anB7PXsSK8Yxk5XuuENUDaY7lAKBhknMYHuwkorsBIheCh4MolfIDOXf?=
 =?us-ascii?Q?gSXg4z/qaW+oUbiouqPvXDBNhRpGPgyNGiYBhGqpCMk4sxv4CXfQbfsBrWr8?=
 =?us-ascii?Q?dmWppx0/MFDMS6Jk+xXzbKG0XbGrM3xvuP3wqGjf5XXUNLoN5JYDWeFwWvLU?=
 =?us-ascii?Q?uVCNV/ymgzIZI8uIJLM7ptaFsFiP8OAYiyQDnDERyfkyGscTGcPadC24Fkcr?=
 =?us-ascii?Q?uNlxq3PX3baM96yVPQ0vJTwEuXPe1K19SM2ihVY0GbYpczMK65jJz/aoppji?=
 =?us-ascii?Q?FFTfz0juYBjJMS/eT8+pIFDbGEdHPBGam2St5BNs4B0OQVKDg0VnvEEtP6wZ?=
 =?us-ascii?Q?eTBGk3zeIAqccpg7wpNs5NyRnvuXWUTpH7274LEVYgA2ZT/7sBRsLWichOL4?=
 =?us-ascii?Q?posITfbur9Sy18NFDLO5ZGKdzaen+ZWoe5n1ut9okQG6u4ftFcu1UQXW4xNR?=
 =?us-ascii?Q?FIdTk5OIbAmwUoDEUbnW3Bx+j4sveP4jwrTG3nSUR8kMCpTd9YmIi41jc41j?=
 =?us-ascii?Q?6P8ssP9fdZPMCpXOGmOVfsbA0aAlknXc8c9C8btXmYyDW3/rwkCSSLtSEFj/?=
 =?us-ascii?Q?0iUr4n88enUQfGjYamzs/Hb0zzngbPynJuxJqKnoPk1oWu/Xch0Frvrb2nwi?=
 =?us-ascii?Q?V2+AHmiyDZHSQu4XyVNL+6XZ+tglI2DhqnvWigsVv4NqFC0m+a9xFK12FWO7?=
 =?us-ascii?Q?JZcNK/j3Cr+xeHA1+mk4CbkZO71mE1eoKCH3FATbxCtu3jfw/k0XPwmQBQYC?=
 =?us-ascii?Q?WtNXl0JXxfJjlNGjRwR9hELpCA7xXlNsIMNWZSWE/t8GsCy6EVTuqukZxO4K?=
 =?us-ascii?Q?iN+sSn92rjW7JCXqZeQsLTU/AbdWc2QsCMy5RiOE59wzrLHZTPMu6aMKZfm8?=
 =?us-ascii?Q?z+SRROIl3d9gPiBrGe3JDvTjAr+Go72cr2ze0KnoKDRJsXK4pkwnd5sVM1pK?=
 =?us-ascii?Q?fJAlzSXnkmKTkHOHHXM+ju8ECBWLsxsQzybEtaypXNnT/vVJ+bbCfC8Oon6c?=
 =?us-ascii?Q?rBCtOq4UQmzlaXofpUbj3fFNX5DReYB/Su0ATD3UyTAOnMAHzRc/RlS8g/hD?=
 =?us-ascii?Q?DomR8o7jtDk18/jRtKWpaee7IgtRnPtZyMYkI8r2h/jVk4P3r2vp8Y5h4s54?=
 =?us-ascii?Q?s5bBAakd283iHbdKToFW55PrLY/Edy3XWcWAVQT/nbQtk/xGWaHlL6GGqtOl?=
 =?us-ascii?Q?cCYW6+adijCkk10npp+RrgWp/18AdN4rn/qMcU7eo73iqIDcL3LN4q1yzvM4?=
 =?us-ascii?Q?aaeCAw5xdrTr0n7n5kcoype6gWvvwd8QhuU2IC2reBIBPuz1pr2U8WGjCZ44?=
 =?us-ascii?Q?6FjvkJG0Ex4Hme/p331NbTAIowVV73UXXh4p7TMds/Zc0ZdosPcqHnzY2QTO?=
 =?us-ascii?Q?u+0JlvF3r9Ezj9tccaUuOmHG33ThfDKYTbkeOfnrdPIwwbJ51IQ7/aVrqjrQ?=
 =?us-ascii?Q?ARAJAKcC6yiqCLNw37y7jFitP1HRBiP0eIGC8o4Dsv2IKnZnR+T1wIqgrbyO?=
 =?us-ascii?Q?V1b+t+HW+9UFNBVYDu5BndvUI+oldElQugcJ6RXf+Y3xAIfDxgasyseXfdew?=
 =?us-ascii?Q?5ryIS5Q5kQWZcageI9ydhvU8femUmk4m0GQFHm743p2HYVYcquuWvgucb2qf?=
 =?us-ascii?Q?nu5tZsHr5a7Iz84AYnHLOR4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf622518-16f2-48a9-76e3-08ddadf83ae9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 23:39:40.9952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hb1CiK6ZbCkfTv4oGshu6wEp84+rXMzt5cILItFavthhq+xQOWlLPwpn7GIHM5wXXRLNSeUj6G0X0AJvfwgWRp2mk/M3Di12IIeSjorlOfcAgrVLcuEOfQNssgL0EGxb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13401
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_163948_878083_00D85811 
X-CRM114-Status: UNSURE (   9.41  )
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
v1 -> v2
	- add commit message

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


