Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF02DC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 23:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:From:To:Message-ID:Reply-To:Cc:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vqB0smo4uzHiiknnoSSemuw4uX8p2HpqxdYcuPElwGk=; b=Z34+588zUCbfhOtN4zFgUrOHVR
	AH0M5/gCSSiBCqtzYoK5kc481/HuvxECUiJrcjzflz+P0SN0IZxff0KDlwr8g0uONyosViEe/J9ln
	+CnjAlM3KgE0M6CefHbzZXx6M96lh3VYE7uSKvHCVnih/XiQ0HQ5KLJBJMIgBhFvAhQHBArWlz0j1
	4TvXFIJDh2LHxbis7tjAnstXmjhpEK5SLV1jD0ESwclkB7tsMBE2UNyUmXPTY8NmDayhK3OSsNJOZ
	EFXcdR/vxVq+sxiiYknp8s+3Hn+e/0HJPmzoQX/B901IHUmtNfT80+ZjSqyVrttNjMoF4WQsk7edB
	UrP+/R5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRg9Q-00000008edb-3wy2;
	Tue, 17 Jun 2025 23:55:36 +0000
Received: from mail-japaneastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c405::1] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfyW-00000008diG-2xdA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 23:44:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cm/dKvlmo/unKevYO4Q5Ys1OD8jv1SN0Pvk7+w6aYGb5m8WikE9XJWfXz1OFf7Vvp8kuj/iIypW+8E4AcRBMeolMbBvcwLLGsdcG/RHcxFdD7yZJJUu2sy8qn1XqdXOxJi3oChiCtebmmKm8safvwxRf6MaEAtBt5bu4sdWmZxKCp4UthDUNlMMyc1Hhe0LrzP6tggP030fgAGmUouMDw5R/kpMckGhzwYA5bCiitP2SZGXcHPqNBVL2y/C/5Zfvo0rG21bnopi3XDqx6S1Bh9Rp01vc+atQkQTxVwudr+belIpfjm+AeklxLY564+A0PSxFOebfP0I8GgK1Mf3jLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqB0smo4uzHiiknnoSSemuw4uX8p2HpqxdYcuPElwGk=;
 b=p6K7uDolSOta5/o2Ym4CMEpxSij0K3xY9zRXacIw/U6fnfnFZzRCJ0nHvVIV8ED7Ng6seBRn70LTUVDtYzLv9yyWlA/lI+IgVzrzXRhEEhcjWTW+StF4gQZR+R1ys8wduL0p7iYixG4KhoL9HyC4oaFCMVGmeMRX8AKwGw9RpK0IpyE8mLmoxNIFpSTwLmdeRId6fTSKDn/2XleF4/jp4SL5uqPma0ieqrGrcXZsf2cvSI9kHMKgaoet6q2ZWt0szLBQfyneQWFLarG1e63H/r2pmjZLkiCQlbkIKMfUhMHZfB7TxRIZFdOYDRj2dHgIzwBWf88oqbu9ZVXD+ozPeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqB0smo4uzHiiknnoSSemuw4uX8p2HpqxdYcuPElwGk=;
 b=VBhTFoCh6HV7l2aZguarQqUM/Skxf6w3HjIRS0eIVJWdGZoRhQlel6Sn0W7ZTAAxgOJRHetwaWAAfHHGGPD/syYNu2q5LYgOdOJyCWwJjbx2WXr637CExZNM8eIuAtXU6VkDr8OeB5nnj+OwWMrkQyQcYa2GC2mTomAbIOuKk4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5991.jpnprd01.prod.outlook.com
 (2603:1096:604:d0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 23:44:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8857.016; Tue, 17 Jun 2025
 23:44:15 +0000
Message-ID: <87wm9alyr5.wl-kuninori.morimoto.gx@renesas.com>
To: Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] arm: kernel: bios32: use string choices helper
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Jun 2025 23:44:14 +0000
X-ClientProxiedBy: TYCP301CA0079.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5991:EE_
X-MS-Office365-Filtering-Correlation-Id: 5af3f6e7-c69a-4293-e369-08ddadf8de43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?krJdXTcmB+yslXi6MjmKRZWyqr0YEK2ADwzy7U2Y6yLssGx0hbGu0zZuqLa9?=
 =?us-ascii?Q?UNQO+CFNhQpHS1z9MiA8rwmrdeAoofiqCVqRilVCy6YOCl/Xynjh49KTKxbw?=
 =?us-ascii?Q?e2dihXX/HaYV4cI9qMJIkLm69pda81eDQzSPM3JOZs9+zKaFaRvBwZEHilHl?=
 =?us-ascii?Q?/gMdSJOBLCjGwnmeOayNwi8etp6Ooq2LnzEikJ6eTp79xCUODw2FwsRa7F5t?=
 =?us-ascii?Q?nCUjDVGKQZFf2K0fWqrquNb17V2CbVk54DHGiZXbpLY+BvEhFsKbFQylrvEH?=
 =?us-ascii?Q?G9xikVTikdnN1igJZ0J5HVSgShskyZECtIEpVf+XBsBmKzyZs4EUUEKBOvs4?=
 =?us-ascii?Q?u28zNoW8s/uce/Mz3bc2vkN5km8DcjCwWmWBsGNhn6Qs8g80BWNP2XLYY2Jp?=
 =?us-ascii?Q?QMo0/k8EvS2Nr4iq+4kMyz3siQ072ZZSA7b1qc74WuDliZGFVXTOLpgVLga8?=
 =?us-ascii?Q?tY7oSPQseATmMUg7VZXVCWKkmUKHrVISND+MW6xyxrCUvpm8ouPonbEd4EOV?=
 =?us-ascii?Q?3tFUvZRDBw/qm3wVf3VlMXPr6IXzyZWdYqpZEbBRVz2SBZmuR5CDEHWF9U65?=
 =?us-ascii?Q?ufr4tWxctVL8Yguv3Hdsx0Fbdc3OjCV+P/arIfev3nYDHV58ihmYAPPPg5Qj?=
 =?us-ascii?Q?JMe+FF/4bv77epGOGA5ALPW+3kGvqUkVtiJcqzrGK2LDQzqfOnzora6fg9ip?=
 =?us-ascii?Q?uCiHCLfioUVWa6i/dKjuw6hk6Q+PemzRFl9beTIE6+kLDm2DE2XWKJ7RvCnn?=
 =?us-ascii?Q?wYVI914XjVAZCbNW/dTY4PAg61Znyw9IEvUxjDd09dq/cz0NJ7WiFImmHh48?=
 =?us-ascii?Q?3+sOicBQxojKMytg42hbUw+KAYliykwyQaBOwDW7HeoJnFH3vx+xg4GLMKpU?=
 =?us-ascii?Q?dK0Fqd8czC/ffeKOeAtXanyRuptlvc2x7WM8qZLnBb5kGYV//oh+V4vfgxL/?=
 =?us-ascii?Q?SWRZ1Jahyu/7z5As5mhjB+aKdd26Wv1gruF6W3dMLNZW4r2DUGiHhAfaWjd1?=
 =?us-ascii?Q?mLYgEZKQgysb71MMDHz1chNQOhecgViljztv8VzKEQZ5DvMxg//eK1xbjbM6?=
 =?us-ascii?Q?V7UwlchGkeueR7/AbTi2WmEnk4pTHP7PbldMbIWj91xomA3iJ2vam5VXOgZ5?=
 =?us-ascii?Q?IXpNPkrF2DwC7wUO3n9zKjHzMhWnnW/10W+Vwg/6+T9K/T50uE8P7HK+FsLX?=
 =?us-ascii?Q?4ZT/8F6/1ZTR3X3uKxA1sMXCsyC8hbkKMBq9WyI0pLeeXoMhnDeTj0Gobaho?=
 =?us-ascii?Q?B0pDcVWYGaenzd9tjp/Z7XuOZd6D8cgGUO6RYPfQooFi9VycS4FWU+XBZJy1?=
 =?us-ascii?Q?WBv3flcS+tSI/BWnjvTUaJxxbeT+oqCVVCAK+xXwas9DUIGmwO94jc6LTj7E?=
 =?us-ascii?Q?9YWulcKkQoI4uEG0onthD3oV6dgB44Uy59EGkduSjVMnwcrkh0MRmLtgRB4f?=
 =?us-ascii?Q?tpWChYbkdm+OBePSxT+j1Qhu0h5gNsS2SQ/pMiZEsWODJD1eI81PZA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KCzxRpCNq3MPATzrde5C87WZ+bTeR9lVkBaJP/TCj9jm64nrWgt7JIPwfq45?=
 =?us-ascii?Q?xCryiYFJf5VIFhuW5Y0DqECBliqNbwxqqwRfLr7nQ3ZU1otYZbpn7Cvna/YX?=
 =?us-ascii?Q?mm+fMUAfhHf1qDq5QLa3VV0MjB47wtNytGNWKDu07Op4gxLZQlroep3q5ZG3?=
 =?us-ascii?Q?LNz5uLy6Hi/2vnurTc12Mn27ROQ9S5DyubM3y4JRP1zgLAZMFWHe9RSq6Dey?=
 =?us-ascii?Q?Pqk9p72rZwkDZec2pucfyOk9n2c6P9MVUNylG4RrqjihcjOxIJIyT9dtfH0P?=
 =?us-ascii?Q?lnZiJMSTdEhYSPwxlOTL1Iqrs8WJDzMddgHqQbfSwOxBuRgUO4/vyH7vduEl?=
 =?us-ascii?Q?foHkCHe8GfcOgnMUMLHeAk166OaZqM05BDC2WpSQoGmE1IeRwlOGHNMXpZyX?=
 =?us-ascii?Q?8h+mYUXnXi9WDuyl/LBhcl0EXWZwfIk7c8gYT25F4aZXqFOPXevroYrhh3L/?=
 =?us-ascii?Q?+dZBYLt5hgmGxb2JBV2VpyzwfDeMbHpA/lDfLdAO6QSBuCkZ2zt4dLel6Iat?=
 =?us-ascii?Q?AoTjQm9evlpNc4Bb2e8DGgT/kxVTgvA1gdZL2ONj5JbmUl3Kbr53UT2FEoEh?=
 =?us-ascii?Q?kaiAzkMzilNxuCgkOGVSAa1HdKfOMrqgP1+9v0x9ryRUOyt3Z6eJCE7uahUi?=
 =?us-ascii?Q?AZdwP6GVBTEPWo3myenZpelt7qqRGXUSEaB4hbU4jcKx14AoPEL0aMtkesqz?=
 =?us-ascii?Q?AhIE6oAWPnYWcgrZ2Y55rNFje2JJHsP3GhKNWkMBDnEYeZ79agFEliWb+UVj?=
 =?us-ascii?Q?mG1m8wDc43ht/lLjNc1VJl88AZrkXzyeJVuKwm+H8/OricWMZ1QLOU405QpJ?=
 =?us-ascii?Q?DuOf068g3vhPeRVgBRLEivSWH1XO3bWAlL3gGw8tMYQoeyw24X7EHBVaIU0L?=
 =?us-ascii?Q?zHzYgzfdD7j8iQAYYvoFG4wK4IM8DpVUGksiKM6fUwVlg9Jxm9kmg1G2gpY4?=
 =?us-ascii?Q?aPKPYoUm6K99eu03vvE7ucl6oQKQ8Sv5+mfuq+pq/pTMvesVSuRG8WoKwjFU?=
 =?us-ascii?Q?8tuB99G1euQqX0Stm0NEDgHmJ7N/zx6B4gG300oIvQtYgIK043zBbo+Jm5z6?=
 =?us-ascii?Q?wiNyzKV8CA8PjRTWJirv3ZYDA4gsB2sBp/ajoQFE++OpTA4eCclOZfeMthdn?=
 =?us-ascii?Q?KHj5wxX19Sc1m75XG77QJKRGY9oxl8OWcXWSCFsN8angbYJi6bTkzsID6Bfm?=
 =?us-ascii?Q?D9ddGDMimQLm6LWb/KaPXnMJmRSM6f97k5lmnxsMfhn9xuEXx4vzUQZ5gUqr?=
 =?us-ascii?Q?sBwgOwfdkEhWqEo/jp5XgHp4raGbmXS9pVOsEJY2/LD1QSkGa1pvN3szjinV?=
 =?us-ascii?Q?WDys6JmHlpU2ZzrQ4Mh3J/rgZeYjditrPpcGov6PUVS1hA2421uPl1eE9HVn?=
 =?us-ascii?Q?ZzZ/w9y7aZiZYO/kEyfcsd4kEvtijI9Wmi4G85EJr6IrD5eDJccwz9X2ABx7?=
 =?us-ascii?Q?RspH6pY9o80oa/qcnbY5TD2EIvDiAiqRLIC6oqM+NafqgskSB/Qfhw6pnl94?=
 =?us-ascii?Q?FkPKoYqFJPpmZacNs7O9EnWetpffy+GrHDae4X1R5O6kKS2w52+lHleMp44a?=
 =?us-ascii?Q?Es3EHdIsBmW6AbJ0s5uJ2wQTVRMXOpAgrK7Q35fmHswte8WASvadstA8oZ0C?=
 =?us-ascii?Q?jOg5GA0oSjiB/zLn7Z04eZ8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af3f6e7-c69a-4293-e369-08ddadf8de43
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 23:44:15.0375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9blZ4PEHxiVETxOZye9/X7TUwGiKVKZsyvzXLMFjoi7K4SXepSBgKky4oEoPfrUWdfpKfAk4ITxJw+zmy/kim3fkQkEmwSDEPqXjyRxoX/Tcf3BRtpv7cguQ9ZUMK+G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5991
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_164420_745443_9F28C742 
X-CRM114-Status: GOOD (  10.15  )
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
v1 -> v2
	- add commit message
	- tidyup include position

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


