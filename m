Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD78C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 00:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+j8e+qbtGF96n3kM+EZnCJXp2Iqmd6gAKd6YQ0BLigQ=; b=AEM0Inu4E53JX1BS3jUJfpWBie
	jIGDgqQxKHtI2vGrxHAkuMdE7CsG9WPTOYXonyxUERP3SFKaWtXXugKy6efziVYSsY9y8j5YY4IuH
	/LNwSTdxErIpHvCNo+RKqewAFzUHYYTXLNSOMmyRvrWqGEOPZrk1FRlt7OhMTbiTNUa7E+TkWaXih
	xJextrF+t6pnwj35KqY7nqzTtEWuDyYlR3MociC/PsXsUfKYqAIZ0W0WnzFAeXGZ9kcNPRK+R3P35
	5bpNOAwZyDF+n9Cnlu0L9T89tZs+rrvor6CWINlc0PeR9CGsaNo6UVujjZIBo4EmWiT92XMNjoXB3
	pgFbU/Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRK4s-00000005slb-0GhP;
	Tue, 17 Jun 2025 00:21:26 +0000
Received: from mail-japanwestazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c407::1] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJrP-00000005rXc-3lKU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 00:07:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RY7lajT7gMLF5lAFotklMDZ/TDIpNF/7kCW/Lc3P6wOYvbQ4Up39b2aWSnHVJJRCtwxCuTak4qvAtUE5KgtN0Mika1yBrp5/FfKzqE0P/JEuW7dnFvwK8/gmr4+WQH5IbXhBJiIQyNIptdNkzG6vDDZ3+6+kV85h+pCqIIzmzeiItGr5Whl0ajc/PFNZ8vhxvMIGKWrS6NY7UoFjoOJQwxr8WYMb/4MSfY80G4FN42flZ9R2MkY1hEOPCVcdN2GrNA5w1F1yXWbaTLVqRY9RieBG2LG+oigOd8M6NZCs67714V7aEX8/4BmWCLZmjc/rJDDlGNQg2vjvIuoHk2qhXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+j8e+qbtGF96n3kM+EZnCJXp2Iqmd6gAKd6YQ0BLigQ=;
 b=oGB8xs06vlgrlihaN28tM07sgpvk8+SnPc7MXdhfDLrt08ZOaIv8KWzg+Zpze/zXQ92vTZ3nA1VY3RkalB36jaP9gLm/z0h/9f2cl58MKtdVnv6XELDcTVRC22xYWQSJM5uS0/adGmbUAc5tRoDRVprhYg78D/ge4DcrZeMfCe5cPYsU6Z/JqMsW30CwXJ7fm+CwTEvU7WfJdaoevvtn65BUShXUkuTmB0ewRcpfQYtC2mSYCT0STEu5cFweZfEzcSLsYuGb4lhePFxPxzyCLhMHVj8Gb+NMX+5SEuztj8jaQ5wGVv2YNxwxgW/01ZTM/yNXQgK6TUWiF9s0lILzwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+j8e+qbtGF96n3kM+EZnCJXp2Iqmd6gAKd6YQ0BLigQ=;
 b=K2N9xsKeSF2CJ/JfVSUXFz/IdUQZfiW1Tog/instUGX3MhajGPU+i58dCkJWhSl0L62BgYd7SdZRGP7gT2ZpuakoFRfB075txbo++/bKhyCB3BLJy+aBdKA3bqpvX523tWc2OKbxhxuAB/jqjkppfKhOlQrD44/ZLbZqwFcImFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6804.jpnprd01.prod.outlook.com
 (2603:1096:400:b3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 00:07:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 00:07:26 +0000
Message-ID: <87msa7nsch.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm: orion: use string choices helper
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Jun 2025 00:07:26 +0000
X-ClientProxiedBy: TYCP286CA0280.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 4317efd6-cc90-4350-3b65-08ddad32f155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vJWIccOTggKlcG04ZcqmlAOA/99+9PiRvjOqIhYbSkWerDyA7ncT0v99ZYhD?=
 =?us-ascii?Q?tbj4zwxoqvFj2GlG2tj0Np3DMiOn0Xd9XmXI2hPZfRjtm+EeV83xOmhEORhY?=
 =?us-ascii?Q?6qx7r3o251sWpDZL+C9NUab9hdeO6+7iCg1+rHLcBDXrQ1yps0O7sWuzzBA8?=
 =?us-ascii?Q?nsO2NCA1y35IG1plEhYMvxfIJm9gs36o5x4k6Qebwh3IZ+k5AcuF+Ww3Fwea?=
 =?us-ascii?Q?bvDntu+8KIGhPGKV9UsZr1BuYm/fSE6xCyg9Pn7x40rZBNeQUicFsBaRr5j4?=
 =?us-ascii?Q?s0NJCU8MLKPoj2HVAWNAacXflHxpLQtVQ2+gsQf1dOcpFG26/zwsIEOvSmTg?=
 =?us-ascii?Q?FlaOUGrZLu4M7j++1Emitin7R5s5984rQUjT7hGxrBd1A9an3b2gKPhJJPXJ?=
 =?us-ascii?Q?YCgbxpWEf0B40TAE0MRNDO/Ag19IXTulRcQ3WinvR8VWjiv1s41kkQTc8kkg?=
 =?us-ascii?Q?hJAClsdg8zi8ImAEpooOXLzbpomNXnH+iMjR5VOt8kCCETW4bWYo8LKNSies?=
 =?us-ascii?Q?tcDBZTSiR4H/UHTh75vU38EXXQ+TUD97Ufyrhrw7TP0Ox1ZAm2T/UIKjLY05?=
 =?us-ascii?Q?VE0kjwKdapwOmNHs38WaxWw1VAfWFOc42SueqCi+mEjCoq6u3rI0t3tgcntd?=
 =?us-ascii?Q?ojm4gaWCVJxkHe74W1jaUX6XVqQuKGYBRfUi1ap3I+THuI0zAeXabZW8zwaB?=
 =?us-ascii?Q?REk/auOYuB0ibf1xIrTyIsa7TVXQIkn147XK+l19gQzM2B3s32P7LGCyTlF3?=
 =?us-ascii?Q?vjAKCvfYpyCIdV3wHMg4wOrP5UFnmhrMvh5xCC/UwlKnsPB/+KDxcPM2PhVf?=
 =?us-ascii?Q?Z8IuYbN+dQqMTfCZS+PdD1PcJs4QtXHlqLRNGWJ41Fp3z9FLsyL8mHNKes5L?=
 =?us-ascii?Q?RjlCW9h4/0lpJYJFvGtknXr3JKJTVbYP4b9ldi3tCdZqOFDYXT0T/CjpkW7l?=
 =?us-ascii?Q?LPjuqWoMvjrhXgGiGvWJ4PIRWgYuNv2pvjI/FvmJ7xI+Hj3nGmeIdN4n01Gi?=
 =?us-ascii?Q?QMyJzfnkb7vxgaFG11UZP6Elj0LqIpRMy8U4xX4phqzkvjze+Tt8qKxbJPun?=
 =?us-ascii?Q?dwrVZvuCLUJG6Y8CDpBXOlprphd1EUO773mJvsxxvYGopOEIChpotZfTG7PK?=
 =?us-ascii?Q?oG1iUuXzfikTEfUgmqtEYu8kdT8L6NbmyZHkVGTgClTUFOA/KlC1uaKqSXsd?=
 =?us-ascii?Q?tuXCNFuxoyzTPPtN1C0wpzHcquWaIa3cn0hvxgSmNEqbudIrLy1t7jEOMNK8?=
 =?us-ascii?Q?kqA5LHVxPr+TpTjnbyvopSd4f3QUkLBdNIlzIFGi4n5P3DtBdwAiujZ/Md3W?=
 =?us-ascii?Q?aVsgZRADj6/QjY9Dxx6F/vramkOaLtAxe/nenmqwiYF2tZDzDAjFeyGDzkqO?=
 =?us-ascii?Q?vioDwkTJ8ilTRi2SRLdEJGRbB1oPQvvqP3G6d6SA2G/hr9r/J1uIemu19mPr?=
 =?us-ascii?Q?RSwzpgb98s4paTejK152X/Gc/UJi2eH5ggakZcf52XkUV3sQzsazVQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vRJF7nV8WwA4KvdTVCzTNNlTAw10R3L4jtq+FJhw5TfC0iO5uBAYDR9O6I9h?=
 =?us-ascii?Q?vclfxzSacGv4qxY0wso8ED9x0Ldd5eqRulDJkkrmeXR4hJYSiGfaW0+JQpaw?=
 =?us-ascii?Q?ymc6dTi1g9oCwjm9y1lpdhHx0O0CMIosKcGmfGANjLJ+cAXqo04+scJNw8A1?=
 =?us-ascii?Q?LaqV6SeZeIzgxPWcoKFFuR7XnmY5UPmggt7Uozn+w0InXzM2kOPo7suEKC0i?=
 =?us-ascii?Q?I87qBge5+yFCVBQkD2/3a5+ijOc6r47FZ6xA1N+OWnBZreXbLc3nlGPIjSAI?=
 =?us-ascii?Q?78BU9dGylIaEn7B/39KG4q6vb6baMXr5vsvGg7tS3CM5H7phqnoFPsFWkuUn?=
 =?us-ascii?Q?WJ4m6VuqWbpou8/2dJGTTUmf4eehh0q7jj6gq1/iWZUYbKDRp7xnTGyIr3p+?=
 =?us-ascii?Q?5IJXeUvn3ZgpRQt6Rc1Za4gtKzuyek5dOc2UqOHONXSb0c2oxg23fE7HFJMp?=
 =?us-ascii?Q?L3kTm7u+iCTKVHfU1PtfDVImxcG3078+qdASYKaokVoYqOhHrHl77ioHpc2Q?=
 =?us-ascii?Q?xYN4WgiyxmoahfwHRprZvmapWOw5naUzpKXFFblLVb7RxH9jPcJ5ALsMchml?=
 =?us-ascii?Q?Z8O1SfiwpVjpOzHOszln3gdD2e2Wfv6JElrMwaI5fauV8czo6b0D2eiDusBd?=
 =?us-ascii?Q?MjpP5ETqKcW/MF5R1EOjZ2mmJu7wUxuGoyhDG4V3RDaw4pshhR+WQ6dLgfW2?=
 =?us-ascii?Q?46fGKFNvT8u8HxoIAMHn8Pplku9Nw4SaXWS0yOMpwczr1H6L3rOAzCvRMXGO?=
 =?us-ascii?Q?ILRoAYWzGR1zqlHYWt/sZl/oyy1rxEE0EeIwPRX9PNjzEd1e26nZyW1CnzsQ?=
 =?us-ascii?Q?d6a9XQv3NXTTvQJe532bL355OzXcxi1A17RTGa99kwFqpHeA5Ja/za8O4k5s?=
 =?us-ascii?Q?ir2VC+BOjzrUtJUx2T1IOXF2HP17Fsh6CZD7Kz1flPbaowA6itYq9DTyijcz?=
 =?us-ascii?Q?YC/BqtV/gnSPktNcx3nMRkr3+mafbv+LpRUQ1WHN+9NfDaSBB4eTKgb0lCPf?=
 =?us-ascii?Q?TfQwzGV0pgg3swHtn3wYB3rnqfmKX0n6AesEmDO3YRrH5OuqTM88EQsWB9dm?=
 =?us-ascii?Q?PXnDK5LHUuBuSQtgENZNtmXT7jyxHUdH5OTOwr0aYEXD9I5TOjYGk4ONYM7m?=
 =?us-ascii?Q?4cmx2KcU5Xcta9+BJlt1zMF84snqSUekwuBRI0B19qTFDzu98ynK1xhxvM7u?=
 =?us-ascii?Q?6ktpbFZIv3u96WN6QUJmDqHWA+obE6c/gDnaZwZDaB0ciAteTecmjwQzwLEt?=
 =?us-ascii?Q?OciiWw7IUKejy5/jhMExgQoGl5alN4vyhViNxzstZhFdAXsVbcm+mEFs55iY?=
 =?us-ascii?Q?PVNU0Ec811of3LcsMjC3xqC4yjwUX5aZlxqH33bn+Va6XFE81U1jMyKxRtmy?=
 =?us-ascii?Q?kG/4jG2TA8xlXxckJ906seUS430xd1axP3fLaMeBMzmWu8tPSm6Tk0vljQ3g?=
 =?us-ascii?Q?qhifDATJW7Sx6oKT7PHDqDjXnz064NIALqKc+t4UPiXIEHr4PBjWc3R42TNV?=
 =?us-ascii?Q?Gx7mLj/v8ur2YlMk7s6X2wEnKpHwHSQVEeGRy1M/544WJYJb/SMzhuEQfgis?=
 =?us-ascii?Q?uccFoU7ZjXYFonzdDSvBSkulZ3Kmj3cOud2ASehWHNB+SXSVE7m2ffi3qaTM?=
 =?us-ascii?Q?zXOnlTg7B6yJ11bcHeY9RYQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4317efd6-cc90-4350-3b65-08ddad32f155
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 00:07:26.6776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJ86aVYYkT0qZYos0bCOW3qWXpSl7yIL5DBFliyZ2IEQ9FjkpVQKHuRonQOhLnfmArXbkxkLuA2jYGarjN+bA4EEMyIddysO6/CgFkpwV3n8viM/nwhYFeiWtW6IhNpZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6804
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_170731_938298_D0B429A4 
X-CRM114-Status: UNSURE (   8.11  )
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
 arch/arm/plat-orion/gpio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/plat-orion/gpio.c b/arch/arm/plat-orion/gpio.c
index ca1bd764cfa5..6f09f65e3d95 100644
--- a/arch/arm/plat-orion/gpio.c
+++ b/arch/arm/plat-orion/gpio.c
@@ -468,14 +468,14 @@ static void orion_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 
 		if (is_out) {
 			seq_printf(s, " out %s %s\n",
-				   out & msk ? "hi" : "lo",
+				   str_hi_lo(out & msk),
 				   blink & msk ? "(blink )" : "");
 			continue;
 		}
 
 		seq_printf(s, " in  %s (act %s) - IRQ",
-			   (data_in ^ in_pol) & msk  ? "hi" : "lo",
-			   in_pol & msk ? "lo" : "hi");
+			   str_hi_lo((data_in ^ in_pol) & msk),
+			   str_lo_hi(in_pol & msk));
 		if (!((edg_msk | lvl_msk) & msk)) {
 			seq_puts(s, " disabled\n");
 			continue;
-- 
2.43.0


