Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F6AF513F1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 11:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvgdDRnPaCU3jPQfShgt8g6z5iEMJF4jBGKxV6udZtU=; b=jUt4QupQWZz6hDikqp2AeIdqQm
	MmvhHbQsy/mobNQmhYqzIm3TB//Z5QOBVWBL7mpT/1WxXJ2Tj1cqOgbjUMXqXyBawwhl5XrHSWDhq
	At0AM9CkquEUo3jujvlFw6+O8trxJVQMpNKRXsiSctBSTaWNJLNv7YfYQ0EvcNIUYPQkgg6jt89cL
	0do6o1n2r7Yb/KTmd7a47K1RTqywmACdrGMDEJwnx502Q0P24Cfjr+N74FeaCq6D8Nto2K+Yazisy
	4vhLEB4hwMCLOhAqDoCfdWzV57Tq44u4J3w9vD6IV33B8NTd96CxeVO97m+4zIsMdq/Tk5r6t01YX
	5lBV0snw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzCXN-00000005uDt-2x8N;
	Sun, 08 Mar 2026 11:43:09 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzCXJ-00000005uAU-2ISA;
	Sun, 08 Mar 2026 11:43:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VwmYKl8z9ihk0wkZtYsE0NfL2BoKXQHHUPrQqwEZPFkHOUR1wDtdSf6dKJSuUxjUVUZ9n/hRGSZIk8htpzzqLtUC4dX6bDa7S47Lt1SR1rKdYgJOSg4UDiIrqN6OSOLhg46cSTRiIbutUnsJLrO0D1Vxzo4dMbyoafqt+eD5PufPnOGPRL1EQuOa153hRAoRaKNtaEv5CFjsC21gBOqJvl1AHJx1lBURL4QRutPdPu8zcv8ACwhUtXx7voC24la7uieWHZnIwkoWHH4GhsI7n23yD3lOJK1nCAT8PLL4nGm1aeE/UXJ3tCr30WOA96FZrU9GQgBVId5h2sUfu0MR6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvgdDRnPaCU3jPQfShgt8g6z5iEMJF4jBGKxV6udZtU=;
 b=VLjJ0QGeCu4CTQvv4xOwkkeKIIDURwEoHwr+qDBaJEXTbgbKnr+MPbJWBfqG7EBD92FEZOS/HTOtI79KcY9v8Y5CmrYu9AA9U7astKwkEPqlp++Pmcn3PJoRoBhzGd/dXzOUaKriGk6+sybbddjdqHrHBKj59lo3o3xt7QORKaQ06VfIx3wTFHg9G2rOPQl8ZMP80b2Ddi0TaWI6TB4UU5O9zPYhk9sPNF+JQ3R2m/55whNSq/LfEcYuU4z9XIaeKpXRJ5taUYNE7RvscUhyqKqCY+JuxsIptigj8/wkMqARnRp3rMfH3sWJRjeh8TCniRZi/d3qH/Qy6psfTR9utg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvgdDRnPaCU3jPQfShgt8g6z5iEMJF4jBGKxV6udZtU=;
 b=Ho/j5S5e8GYQc6V8K7KCEY+xJJjX2HntXCzNSEA/tQCVPqsfHUlxWcE1vfgyzWN1mldccrfNphTkKyowrE4hHtFA2e4KXPolyl+VDB4e1I0jFu5pRLuhAOKPa9sR6OHBm1rRv+w6N6V96SCxsHxNUE+UByla4Ygxf7P39d/I+mXsQ49C/XKLIn3jSk2gRW/5yJFjE5kixCul2nw6jg6Ab0bHDcjJDTk2/LV4cdf79lvah+D3KLJIbh9id9zoCWT+vihUI5gg2V7xErpTAsCH6Li78IePKWRqpJFTOgiZR6W3gMqzDlkoMRRRZ65zAL9s6OxxmyRmNP/ptnbeTglAhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by DB9PR04MB12426.eurprd04.prod.outlook.com (2603:10a6:10:614::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Sun, 8 Mar
 2026 11:42:56 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 11:42:57 +0000
From: vladimir.oltean@nxp.com
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Subject: [PATCH v2 phy-next 01/24] ata: add <linux/pm_runtime.h> where missing
Date: Sun,  8 Mar 2026 13:39:46 +0200
Message-ID: <20260308114009.2546587-2-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0030.eurprd03.prod.outlook.com
 (2603:10a6:803:118::19) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|DB9PR04MB12426:EE_
X-MS-Office365-Filtering-Correlation-Id: cd0ed0a0-cf8a-464d-1e14-08de7d07d7a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|19092799006|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: xBw8ttBZ7qoIxvbQeeAczjwpmmyPa7QhV5Y0V9S5gurt57ZM1SK6JGmaLNERIOsnTW+urzFGFGID/Qif7m8tPqJMq/xfJws8Ya2uRqZY8ftBujzUFKzuriCzSbKrDxJVkhl3pMUXVlYDbLjMZqZvXJSdmnYjoJ54kBuelYaYCPXOAwrFIW/qut8BN3BSK/eD9XYHPoAbn+HsQY30/TDZCI72RrUg9eI47r4VRusdv0UWaNhu6Ok9s9+/mdBlQ8/DaWaNgDKhtXFrGU9OXHrZ0FtyE7Mp9/mZuOSnW3bnrel/JhoASoR/oYuKYrj/HbJ82jH0zbSPujtItjl7MHQSdBP6tGq5vB3VyfB9rV174sCxMNAgKwhka9K1OHCDd614Z7lMoMnMqJBk333yJxNxXFNDbJxQg3kz5D9rDX0Y0IMRYwmYM1wmIIWq0yjClzPNYarDbkIXXlxr16M2z889rerBh1Wu69FaITMCgVGb4+kJcb13dlsMTc3+urILxQb15QLmZrXB1gmG/9bC/4feHF/RjjvNsDwXFkVDwDHHYS3Y9YAd1Aji39M8tca6j83cerLRRBTaBBD0SDmERV2VzM4giWY1gjZjokd9Cx4+gao8rtonnUWZH6RRG4u4twHja/GhSpBfTejSmBX7iDjTirY3PbEzbHLxuuXcfU44ji60RUr1nm5N7TDyPgTi+NyU+PsCeXhs3EhzrZkO/+jbJJ95oeXMoKr+DJ9QK4HQV7Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?++kASrjf195AQVhb4wDWqRdtQ1yXdqh+YIshtHs/6Xd5STm8comB1OYSLFka?=
 =?us-ascii?Q?7NrfAQ6zUTQbdMq2pzGhMjfSNb8Akk0cEZFqIPdQaMGUf/H2uMgJ0RhQqAO8?=
 =?us-ascii?Q?0dnChKKrIW+Bv2EB/X08i65juJYou5u3dX0lk7kOhfRAJ7FJErB+nQf8BR0C?=
 =?us-ascii?Q?YkUmTRaX0kwFdkldynAqigLYR5BKR/uXYEjk+ru5DJJ4jMob5s/hp+XJ3BC2?=
 =?us-ascii?Q?EIcg/8GAhPK799MKo9JFyAAaItKyF2g/QIeGVj5lD15x6mUEA1ZXl/ICWJRK?=
 =?us-ascii?Q?mE5JKCmcI55gx+OG7lDGr2xX5KGzi4Kf5kKSjtf0xUWRht9ml0FiMX21JrkL?=
 =?us-ascii?Q?eT2Z6IPIuMG5QIbpkwJRfmy2EtosWyds2SWn3m61sgSUvX5gDotsPcBgReSo?=
 =?us-ascii?Q?PK5nY+QMUffRy5yCl+soaWLahdPZqxYv4Je75mjfGGtYLgsR92DU0fXam14y?=
 =?us-ascii?Q?ZSdTonxZghINgPPya77yTnhK3FORr9xbibgob2ym5abFTW3CnQwGi3rBsLIh?=
 =?us-ascii?Q?DeHF6ApZTDzrYq8bzOufQfwo9yLyJQFUy0Ea56WIUkrygKPoEjcM4utEzAdp?=
 =?us-ascii?Q?m7hq9YRbC8Nr5Qz3KByQcoVUeuuZsFr6iH/tD6JAsFUJBQiSJSlsPbwAEp4Z?=
 =?us-ascii?Q?aoP9CMr4qgNIAylXbeYlap05qAYCDw575p7SKhOTe7pQmtk/iPgX6vr36Nnq?=
 =?us-ascii?Q?fCfFIpon5Bjzc7OIfg2KO6SkJhFevzo1bq+ilQj78KThCAaV0RY75uuE51le?=
 =?us-ascii?Q?QqesUwJBzDAmgXgQK7o+eV/cZ8SicLV3ToGxz1t19DvPBLAZVSh7KN30JBrj?=
 =?us-ascii?Q?HuBHKOD/B0/eApUe5/3H99pm3W+04y/Gxc+oge+xrREv4jDl6iizIlsCnBmP?=
 =?us-ascii?Q?CHh3cqBLFFATmORuXgxgEk2BYNWXtceB28qSp+QKBHHOC4U1Z7btrtZ5JxeS?=
 =?us-ascii?Q?OT7994VGPgs2YMd+ahhrv2JPER/L6TfAD/Z/L/aniM7NwMn+6vdIGq/LHiTQ?=
 =?us-ascii?Q?a1+tLRz2PBrQufahraWXgF6S15yxC/xFv+Ps9wvF6gLgTbiBIvTz4VlTI0ni?=
 =?us-ascii?Q?WddqQYo+PlvAr+txENhwVLlSgeDt2P8T8mm19x9gKfFCZTncYJYQjhJfkzuH?=
 =?us-ascii?Q?JbmdEOJT1ISBbysqEE94+JUn+WH4pIXsCIyg9ocFfGzJP5SgygF4Mjc0LRto?=
 =?us-ascii?Q?oxYTEX2UVKOf8y+lj2bCSPSHoDKZtkn5ExQqKnVgjsq+YyuvYRMpLJsV9RdP?=
 =?us-ascii?Q?MzuI/koSFY+n8eq8FoSfIv4mgScOqTqWir17fuAi+LNP8scUfU4arVRoTsTd?=
 =?us-ascii?Q?CK/Q6B8Zshhgm0YwSEvrH+We7tBWL0CNNMBshv4aSRN415H1JlexJHZBS4cY?=
 =?us-ascii?Q?tlFslymmvdT4awm+N6A5E3dzTUhfzwh46FHe6ZUIAr6gj4xgYkmTTk5QLgkH?=
 =?us-ascii?Q?P9VrBlrI69qlb4+B7RrGCHSfPqnarBZy7VrI5xhWHDCAXX8uFK6IZZMVo/at?=
 =?us-ascii?Q?Lv5E8rnD5HGivtA9wuHXnOB3bLFDiFmpuEEUriZM+Xy41v5udVRCwl6L/8qU?=
 =?us-ascii?Q?znu2yo9bZiEuW+vX7ok7k2RG6/uES+si8HPfV2yhpZTeQcI7eTXWHOpsTYih?=
 =?us-ascii?Q?iNGYlu79RezIWnCUwaeX20LWtMPbN/LhRumE1MlqUsyShrrv+62AmwmuTqnm?=
 =?us-ascii?Q?VtRtGAxokt8roOMM3KefSeE/gfS6zutM5nRvm43KoQh9VDIFtb8TZHPqFS4n?=
 =?us-ascii?Q?pPJ+qVumxC4tUB+pRPeCreR8OKXo0PcbWMJ8sPyYfQnxbEdrxZMoE413elHe?=
X-MS-Exchange-AntiSpam-MessageData-1: 7tTubeQkOOnL4awFGNhdsTx+kb9csx6+8nA=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0ed0a0-cf8a-464d-1e14-08de7d07d7a7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:42:57.2911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVk58JvL9xmWfj7itohiKcmX6qaYANeFUtQQOdVhfRcQFZTi9W0B22XWd3aH3p1S+YS9F5Pa3rlWSTwAVpYMrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB12426
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_044305_586663_5C8CA58D 
X-CRM114-Status: UNSURE (   9.93  )
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

It appears that libahci.c, ahci.c as well as the ahci_brcm, ahci_ceva
and ahci_qoriq drivers are using runtime PM operations without including
<linux/pm_runtime.h>. This header is somehow being indirectly provided
by <linux/phy/phy.h>, which would like to drop it (none of the functions
it exports need it).

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Acked-by: Damien Le Moal <dlemoal@kernel.org>
---
Cc: Damien Le Moal <dlemoal@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>

v1->v2: collect tag
---
 drivers/ata/ahci.c       | 1 +
 drivers/ata/ahci_brcm.c  | 1 +
 drivers/ata/ahci_ceva.c  | 1 +
 drivers/ata/ahci_qoriq.c | 1 +
 drivers/ata/libahci.c    | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
index 931d0081169b..aa3c4949c4ab 100644
--- a/drivers/ata/ahci.c
+++ b/drivers/ata/ahci.c
@@ -26,6 +26,7 @@
 #include <linux/device.h>
 #include <linux/dmi.h>
 #include <linux/gfp.h>
+#include <linux/pm_runtime.h>
 #include <scsi/scsi_host.h>
 #include <scsi/scsi_cmnd.h>
 #include <linux/libata.h>
diff --git a/drivers/ata/ahci_brcm.c b/drivers/ata/ahci_brcm.c
index 29be74fedcf0..48460e515722 100644
--- a/drivers/ata/ahci_brcm.c
+++ b/drivers/ata/ahci_brcm.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/string.h>
 
diff --git a/drivers/ata/ahci_ceva.c b/drivers/ata/ahci_ceva.c
index 2d6a08c23d6a..3938bf378341 100644
--- a/drivers/ata/ahci_ceva.c
+++ b/drivers/ata/ahci_ceva.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include "ahci.h"
 
diff --git a/drivers/ata/ahci_qoriq.c b/drivers/ata/ahci_qoriq.c
index 0dec1a17e5b1..409152bfefb6 100644
--- a/drivers/ata/ahci_qoriq.c
+++ b/drivers/ata/ahci_qoriq.c
@@ -14,6 +14,7 @@
 #include <linux/device.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/libata.h>
 #include "ahci.h"
 
diff --git a/drivers/ata/libahci.c b/drivers/ata/libahci.c
index c79abdfcd7a9..e0de4703a4f2 100644
--- a/drivers/ata/libahci.c
+++ b/drivers/ata/libahci.c
@@ -30,6 +30,7 @@
 #include <scsi/scsi_cmnd.h>
 #include <linux/libata.h>
 #include <linux/pci.h>
+#include <linux/pm_runtime.h>
 #include "ahci.h"
 #include "libata.h"
 
-- 
2.43.0


