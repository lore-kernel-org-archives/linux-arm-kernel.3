Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA470C83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 03:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:To:From:Message-ID:Reply-To:Cc:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vqB0smo4uzHiiknnoSSemuw4uX8p2HpqxdYcuPElwGk=; b=zUr2JAzUaUToak027KfJdHbDUN
	K4NfzC41VFAhHRKCUyan0FdNt5LeSFJjRCpGPLOfqBQlenLpermYER+j6frlEEdTHmlrf+ID4UAhN
	5m+uqfuGBfw4Up8G04Gx1E3uhNwCXf+NBtq5JI0krtBR00lGsj+7JAlUwo8XHWfiPCusHLM28wcoq
	Zgh7yNaaNGP4Sup+U0p9e7iTkWixtK1Vjh3dDw/aPB8O7FmF9CdZ4rZE8rSbZul8k2gkCJHzZ7/yz
	dkwDA7MwcW6ZxfuuoCxzM90hsQsj2hQ7C+4h0uRe/mawlExovuRTUT+Y2M3S47BUAoWNiChFhTAsE
	b4MmXiZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWlp-0000000D89Z-3hhP;
	Fri, 04 Jul 2025 03:07:25 +0000
Received: from mail-japanwestazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c406::1] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWSm-0000000D6Js-3Cuo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 02:47:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZrRvubr2lfF8c7A+KEpkxHp7wmdfU/ZHu40PpHng0U1iFQw/0meSPYJUbzdQhjR+HykbAVs+nHxWPnBgXMpjdrO/8Q+I7Crhckrx9mQOR8TdNjux5poSLOI1nSmI/fXkxXcgSI4B0sPl6Sw/vZBEpoi5rVuJQ3c2JnULst6NRrWUk72SE9QQFjhNTILy93FzMaMkzxCKwNiJRFMdZC4eVMMmdERDR1KR4g47eVSjfh+877xzRO9n2E2oLNu/ZoNNKxV4DhsMNL8xrJuPfNVVgaw2oHfekDPdAHX9h0BT/8EJLJcm2mX7W6Jax0XNbCJZm+GkwuDbdTGCYOANwCJcKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqB0smo4uzHiiknnoSSemuw4uX8p2HpqxdYcuPElwGk=;
 b=NInvNzxufFC3HpFCY4eOhljbRITNLvB3mRAAwValJmp5nvCr17CiWiz37V7hTG6m5JUOxvN8kHrAM7TgVI7J4be+YmBlNsvy6w6kEwLgZhGI9PI7+6w86RWKgAmFPDkEbrtY9oraW1opMivpGOw1w4RDo7i9B6Rk8Q2GLrOu5Ij/NCJ5M2ZolCKletJh221NitVTMcRN8fGrs2yI8aUllepic7vSOygpU30pIaUYeypED7RENgyzUzaFoHLdNSOJEuaoGF9dxNynBvc56ImCs6ZJLSbeq7WDt0a1EcZkpEmx5/oiGxxWkKBZ0cmMcZoKMir3dF2jf0eQe+NzZ3jDWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqB0smo4uzHiiknnoSSemuw4uX8p2HpqxdYcuPElwGk=;
 b=QcVQDjoOGuW8FXwuH4afgnl4dp09qWJBgsul0NQBi7uSmnZhwUN9mdeku29R0H98J90CzVyUdtM5Cl9/QmxUgKUm/3fE7lxRjQvkAZk+bzDxMF8y45P6Ahzyk8UjnnoL1kjRQHjSrlSeSCAuH0G4g0uPzzQyvk8wsrR7+oWRVsg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11834.jpnprd01.prod.outlook.com
 (2603:1096:400:389::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 02:47:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Fri, 4 Jul 2025
 02:47:40 +0000
Message-ID: <875xg8u0xf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 resend] arm: kernel: bios32: use string choices helper
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 4 Jul 2025 02:47:40 +0000
X-ClientProxiedBy: TY2PR06CA0007.apcprd06.prod.outlook.com
 (2603:1096:404:42::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11834:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b045ccf-d049-49af-056d-08ddbaa524af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/6J9pkmoxCvmsLuiQLPXUwg1MeAbt7lb+M4YliOMuskMEoT9eSpVZTCYVFAG?=
 =?us-ascii?Q?ASWXfieyxqmU1PI9jnyU8Tmo6Rg61f74+5KTBmq7ZaY8JPea81Y6iEl9Fdix?=
 =?us-ascii?Q?N0FqDj3MITvoku6lT7vS1FoAHaQOkv6VRUsiBDV5+nIU1/wIBQpjR0BPDM9B?=
 =?us-ascii?Q?cfMFhVvBM0KhxP1COFPeBx0DLE3mgsmJ+wYYh5A2+l4HhlLoWetY6UWXFeF8?=
 =?us-ascii?Q?n/ZAJBx5Lby5fXDeInQ3qaSofRsjWKDfkTNufuWCPXzEuB86hZIvyC3XVo8w?=
 =?us-ascii?Q?Gs28Oldjnb9+bsYTQZ5bFgGu8xg4HreKSJZsQmLkv0QsD+jEPtXAOjqBy/Jf?=
 =?us-ascii?Q?ngnTcgo9HTOdAikKLymXnQJbDakzQdRW02BdJxEFEQYEAvp8uGdEA9rayZGp?=
 =?us-ascii?Q?YG8+hlJ64VlnSe5ZfJb9ic9wrF22uJfDH41OQlj/a6xnnb2oNvilvdg79S1K?=
 =?us-ascii?Q?aJ/k4Rqvrq0TNLWZge8triKyL3aF8ZNILzH6kjBdIyAsphk/IxbRdfAJKVL1?=
 =?us-ascii?Q?zM+DCOx5cnwERzQ79pl1yEGKnyU69FPQBGQeOJWF1gbQA2r8QC/wpoVaMmG6?=
 =?us-ascii?Q?GnarbT6jVVYls5rMa4YicM/LZA8GUkUxuzVfgCapDcUrLaUHfSAK/8mKuTqq?=
 =?us-ascii?Q?8d39wB56mO+LFFfhbFxqiVe0MMMJX9K8TFgSM9X2wWKD9oWXbCsykTtcDYxQ?=
 =?us-ascii?Q?u2T/P3vvf5HHc8G9VsxUMXilp+nYOa4tCwcsDz+5+rfeAX/+0hMC9mbZo1lH?=
 =?us-ascii?Q?KCfqrCjIHnBDG9urSsrdRePSWo06sYtSZ+8rlytd5XxUHVgg0HKTQMJ9RDHz?=
 =?us-ascii?Q?mEcIYA+COA2IWurQRAQasT5kAeCs5VKv/mYwizOnw/CIFfhLfPNijiXr4Sml?=
 =?us-ascii?Q?bNTAb3ZHTJQ8yz48WSsL9l7aqP/VNC5yRy87p6ruFFTg1FvN92rneRZZG55G?=
 =?us-ascii?Q?uWvHy9AY5QJSPXX7tEcdMUbdtnokWlN2SnagTHlUHceFGGQuAv6VpZgGJ8QS?=
 =?us-ascii?Q?swG/UNE1IVBzAJ1EI9S7EegUiAzJJANUwEEl9QV8mwjsSKRZZdeMe87KKVK+?=
 =?us-ascii?Q?aMr2uCxr2hENBNCm4gcso2xfKT2Q6qUZoIy6KdhgMQT3B39PYrRskaM9GrPZ?=
 =?us-ascii?Q?VJ+9IJFMc9bqQ5D5YxNQ5APQOrMtLbRNY/HpNK11gnPOhjp7fIh/AvsAXnGV?=
 =?us-ascii?Q?KIsx6lLS8n4pZmV7H6HBBo2gJKNFjqAKxpZZokWXY2k+dc6ZLnpcFv1erN9k?=
 =?us-ascii?Q?o/QOp3u/5LPkUC8xUvik1tW6LbnmxjamA3zggGnMyDXzmK1Q0fAlplWV9MbL?=
 =?us-ascii?Q?ta9eNxOF85H2untQOrJtpcVL3A87gbAO8jWQ/vsFzTbxKOtcnawiKB3rSzv0?=
 =?us-ascii?Q?2/mjoZvyoH2D63ing5b/2mCOLWQ06yWihgNvG16nLPR5/4z6uEJoNHySlQwu?=
 =?us-ascii?Q?6FXkP+CXb2gMGn238kFPDrVSy+TgFx+PlZGvSb+nf+uMWfAfpl1NiQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vT1yz7Lbp+orZ2U2rOhU3eGpTbXx3ADZ+wBZ6TolguatxiyMw/V/yv1kbnDG?=
 =?us-ascii?Q?oGdydCf2bjMplCN1JD6Teo8SpK+cWqYKWwjJsTKhKYqjmLSyh7zh+VfZEHJ7?=
 =?us-ascii?Q?/JaTCXr2mjG94ZKIPB1XgEr263TPGDS+BIbl6EWyNKDygL5nvdN3grssLaxm?=
 =?us-ascii?Q?YHNbB4juudZachussIkyPNgSSYKxu1uAHo8bUIFtMO8Uxp/iH3ryZSfeI1wJ?=
 =?us-ascii?Q?q12WVxzJ5N7T1gd78sqdyHgOIhc+vasptmQr+RNiH9IlKdkEI8Xi89TMGhXh?=
 =?us-ascii?Q?ji1DbZOMTZv0vcJNtbJXBnJ8WDcw4ij6epUDyVw44TkkLUXyNMZWLwZR22Fg?=
 =?us-ascii?Q?4xzePWdcSNGpPO15ZbEUDU/wl5EHCRCcao0kRsgYA35tRUIc7pqo/2ppJQto?=
 =?us-ascii?Q?YMwO7toZVOg4LWGyPpZcGdvtsaq0bxkg4CAnXVQkci3vM0UVC6i5fjMWis3N?=
 =?us-ascii?Q?cTJQJyWDfJE0xT9FN26KvegJRYBo5T3CDOAcW8NPPi39Xq9klTYf0ciGRn2k?=
 =?us-ascii?Q?h4r2guOZsHdoZQ2hGtsUbI3Afa6Q7B+tlYBbY8JqYENHscH18DCJjWJWG+4/?=
 =?us-ascii?Q?CMQJxXT/j80hFvxKok8pHZ+0AZ52lSWTAsVfph+3uoN6/c44qRL7eWYehDka?=
 =?us-ascii?Q?YsWi+HR4Uln2QV/uhktuAmP3H727/gmvgzWs17K+NjZx9V9qbAaAr5BZIF/I?=
 =?us-ascii?Q?b0F8cQ9RxDPCNLOzrV1huPyyNGzWqRUBNFXS8Ip+xIJjSAJYx1qKzBimj4qz?=
 =?us-ascii?Q?P0KDZZgQ8JWWB337oAxNwkaRwgrmYjbmtby+zzZYaYaiMp24wLWmjxdUH1ix?=
 =?us-ascii?Q?TVQ7NwaYs+joUk6d2fpeIMoTN146u52cHZgO1/ADUsRFiNGuiEsrHGA3wwxU?=
 =?us-ascii?Q?RukTMOcy6uomxK+x/kKlo/pgSwkZ370uatgCCjcHcgKQbGP+Omdwjp25hd5F?=
 =?us-ascii?Q?HXkwA/LPdG34HiOO23IT0EtVEzOclWYAhLWORATGBUZ7UWSF/xMW9lHm9yy6?=
 =?us-ascii?Q?F8EaYfaqLp5iABeekl2PIbNhTYvBKAFRc5fccS3cwSwUJVJIQ5FO/7osO21o?=
 =?us-ascii?Q?ku1ZIcNnxioK/aX7h0IB6uRS5F1LAAyseZO9G0LYFnDL36dkpG7t/Lr/FARw?=
 =?us-ascii?Q?KEBlND6MDHJ6J/IYzFQ9tl/kP76p2SM9zgdtFrobvA65+91hNPdhHzlepA60?=
 =?us-ascii?Q?tY7utjg8LWlDo92oRaNg9H0V8pr43xt0VxEFtq0anoyqhW4IQkhpBCz/J+yB?=
 =?us-ascii?Q?ZyUoUNOdMI+c/wwsHwkOgLy8d54oY4LZShyB/KzOGKWSIAZQL6Mq0q8RqTel?=
 =?us-ascii?Q?hAR1d70jOEgJWfCfglfWxmFAxrAe5Pe1rhA1BkVIZn3a8fPuQ/exkudK+qpc?=
 =?us-ascii?Q?lUNwOugwW0DQkLncNH6tb0p5MOIkBISZwZIOzvBfq1q+OW4RhaGUx3OwgKWU?=
 =?us-ascii?Q?hpFBJcovxOocsB9iUB5jRlYLcq7qX8zpk3O+ZQzzS3h6iikVq+RGmsq1J0nl?=
 =?us-ascii?Q?laF3dW9qGwiBUd1zTVt4ZcijBfp3ZgYetbvqQrs3VoUcJEk09HZSjNODvfJM?=
 =?us-ascii?Q?ZTHghwJhlKZlkeUDRToCesw2/FpQtczBrh3/5jrBX521Yel6lF98sedkwZGw?=
 =?us-ascii?Q?2lXmDHsGLS3jL8Hah3KpU18=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b045ccf-d049-49af-056d-08ddbaa524af
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 02:47:40.5496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3ahbn4ZujeghXR/44n5YeimOfjd/2atB4u6hJCzTXISHtpU4MKZp5QoNk+AkLGn4mECxi73zlErFqk0Ps91Ov7xPC6DoAVWllYBFW1I+AMXkx/R5dE9MuuY25NE/TxD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11834
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_194744_804746_7DAF8AA4 
X-CRM114-Status: GOOD (  11.41  )
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


