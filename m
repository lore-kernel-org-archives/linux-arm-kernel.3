Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABA0EC1423
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 10:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Icj71/VK5Dj4zopWTZsMofjaXkyYoMpwSXnNn6ELPAM=; b=gSIi0vV5ra7nArFgO61xX0Eaxl
	nV1kCXppaFBNn7agxeGoTxLpCzXI9xu1Wtbob9OHz/gnLgOaLvs+TUGvRMVxpDMz/OcZlvSjj00JS
	WY3j2neeqfZJzXQgefS0g3dSfIfHsUJO3XIOOqyTnjKinFGEnH4gTPtSOjoMoYO3SWsJ0iqxB+0+H
	Na8GOxB4bGNCSOsUZ8wGjj4FkCaj2YCJpymn0oo5LQ0/GmC3X0/mJSitCiOvughKkXUEBwIpzxwSJ
	Fq/tq/3hw96MeCWLyV92XF+vzddKjZ4YDPhBEt+u/fFqVCHlqTBg/phDbl9MiZp23b31I5pg8pNSe
	inIJWW0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxNIm-0000000Ezfj-1ubi;
	Tue, 03 Mar 2026 10:48:32 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxNIi-0000000EzbZ-3c16
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 10:48:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jil3qVTWwVzpWXMma9MIO6q0kZX98jAXeOyp/TuvH8xJXCD0bE11R3eQsaclZ1Id8WwBikDAneCVl5QwfA0pok4aIkNDrezJZCTC8YOjhCEsx0FTQi222aOkg9ZLexgUPTlFajrK9U6q2UOumpCrwYnQ+yVtDgA2NJBXghXP8PyUt0RbMQre4oG3r5M2UylRfnN8tUdTAwVnrgnwgpU8LERODFeeNlWHKOFK+XaPAzqQi4uu6dBlembpOYKvK9H4aH7d/X6iL9BaiF01rdIy45rDjsaCGTV6OmQ0pR/RlcqwvYHNSAMDZvIjTpsoJQrSyUugIKKQbLuyCtBe5s6W3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Icj71/VK5Dj4zopWTZsMofjaXkyYoMpwSXnNn6ELPAM=;
 b=HdTUmLXyO8Rn0orZVL9COYJJFXk5GKwUraAAe5VkNiIWEe4+ofUutJqDKdpuNgaeCt8wPCxgSu9uTJdooS5aWbF95V+1DFe5SSlowofzUB5DmOdnm9RXRS9Pkrt96QMlpBDFS8sb2mFyGcRZ5cqXpKqOhEGkLtbUJeYFQWRK4oyZf4f1NwASFBh9ctHYke3sglEYLCL1kGz7ShKAArJ8opiXR2XJhb5amrOptWEkCY/pf7ivCDW26TXkBS9TqiOuU83RV86dvekNY4OPFlU0v7nLM85rcLhyEsZnr7JU1mcN2m1jwwStpg7OX2YMM1kInQudaUD7kzXHGZS4cxtz6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Icj71/VK5Dj4zopWTZsMofjaXkyYoMpwSXnNn6ELPAM=;
 b=Ptq4Q0v3z4hbGLaLkTOicqH7/nVyB/KsZMBuBdLX1gJYuFdwAgPj9m04VA+Ffs5eYkqZLvSZ6Naez3++z4u8834A0ikyXMyx+B8zDoyD0iqg3uJ++JDbuLP4DIm011hhrLBwX2X74IU91bcLtQ3qgn2EoibxISJqoIOGO9pdTR7AxsoE5rwZIzDHYQ0pqtnvRkz+GTHtRG4Z6aANK/D2MqncjXi40PNBdKhwN/WiWVy8n1VVU/MmnqGWrpDkZErJU6utAuUDlrjbqtj64qtZtzlVg0L64lazRCgVphyIHCgmGmu9Gha9cU4W3q8TptQfRObSx72x/RLQzf3nYY7Vlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com (2603:10a6:10:2d6::21)
 by DU4PR04MB11926.eurprd04.prod.outlook.com (2603:10a6:10:628::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 10:48:24 +0000
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754]) by DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754%6]) with mapi id 15.20.9654.015; Tue, 3 Mar 2026
 10:48:24 +0000
From: ziniu.wang_1@nxp.com
To: adrian.hunter@intel.com,
	ulf.hansson@linaro.org,
	haibo.chen@nxp.com
Cc: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-mmc@vger.kernel.org,
	s32@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] mmc: sdhci-pltfm: remove duplicate DTS property parsing
Date: Tue,  3 Mar 2026 18:50:06 +0800
Message-Id: <20260303105006.989339-5-ziniu.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303105006.989339-1-ziniu.wang_1@nxp.com>
References: <20260303105006.989339-1-ziniu.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR0302CA0033.eurprd03.prod.outlook.com
 (2603:10a6:205:2::46) To DU2PR04MB8567.eurprd04.prod.outlook.com
 (2603:10a6:10:2d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8567:EE_|DU4PR04MB11926:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b9fdb37-be4b-4940-5fb7-08de791264b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: SgqrFVLV7TQDVWHdaj3TbBNIf7/Wc2mqV2+IkxPC1EvQwxvzsRmzC9QSL2KBxKqfiX9PKTo5vortDOlpp0e8VNTJjMmZ5Z0JLO2lXRt64BZ8RcgeZ1q+3zvcmjTkIiPHIB4f/SUPiIGpzZeMRiAeLuL7DqG7bHOU4eQwhyEZm8q2JGhaN28CpZNFWgSsXl9bJvmHdDP4JqfG/G9QiZPOs5NYa9gvpxXk7ceW+NDSX4ljCwHRZD5S7tbyKWYGDtbvf8/w3w7Y1x7InpigClb0W0upNo1eEBFR7PRzk+rr/eg/S/JJzKmvRO80wCXupeNZngBbMoVl59RrInAJ/R7h7e4YUc81pRMJLFUUy1JOHXG497q0ZO9AL++LnXgrSJAUKzUJM//BnBvhwuaNw1TSapkstoHfG3ZluPwWiruLCGFMG7+3jv/VXeqlLEVin9nwcZFDvvS1G5jRfJr2ZUHN0HK5r8fZGWpgsqLNWJaUE5blE2MGT8sNuXP3ZjqEelbpkmavKPmF4C9C6cYhQi29s+bRbrg0NZA26lRxkyDm3GgUBERdpLP+IvDpEx6XNxnScXgqOjbd/XeUcFUzGO0wM4Xp882j7St/NgeGLjZw1LCqVVY9W3xDLqUyrWU6aky6i66eygxgt9oiGj25cqoinl6Wzvuu8J2O4+KPMX1YfGm2nH7Xo9wcGmcjKZr6SBdVIz2JVSzpAjoxyGolzpQfftCEDhZentBY0q0YF1tjnnjmtryC3HDaLs1JfbOKWOromim6P/Dj2HBStZ1P0wBKY5kXhCO8JZyIVI5RaL3nbg0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8567.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hkyKUMnYl54FPxF8Qn97i/ugBmjOwhINL4l0/nxwrXjZZaE2jMyXLq98a4Z6?=
 =?us-ascii?Q?47DA+GSRJUh0kV8CRas0AJYN5ZMbx/WC+Qe9TVqOCMZpsXjQ2pVp5RZ3d5t2?=
 =?us-ascii?Q?DRTF/Tsr9ku6wnaK6cfiAxDm4HfthibD3BsYGZDqiO7rnGRXqIMMn/kzzcVV?=
 =?us-ascii?Q?90XhDoY4hKPX9IeMkEQZN7XfFRDOjAvMJW+IphMT3Lta2IzPUr9KIT1xuKXV?=
 =?us-ascii?Q?Y6l5lpSdUaKqh3fdSX4g/PZdfG1imPASNvBFypUJcmbPFX2eqMlGV453nLZJ?=
 =?us-ascii?Q?FgquKmHmSBORkzVltrLv3dYI+wHt7IVDIPz0j//tECUp4+Dz+Az1AgqZ9D/q?=
 =?us-ascii?Q?bZ0SZw6bGB2QMalExjb3Zj77hROokwGTPsuaZ6Q0P4Q37EgiLvJcvZfQWC0O?=
 =?us-ascii?Q?Dbz61ztKLxmjaiDLUS/nRPSZCjh1DOqXbn/zuUiVwLQ+SBk9nzUZs56QmWI1?=
 =?us-ascii?Q?XLjJdlNrrHyADCBgqCK5y/KXK8ce/Qoy3KXir3Bu6DvqE30Ssm7hbzDgSBHF?=
 =?us-ascii?Q?LzCbQv7vi360iK7SNYLxNVxMCeJ4rKibLv0aNg0ixsQ5WDk1dNIIrOZdPVKR?=
 =?us-ascii?Q?59SC68sJeQvf9hvInLsHsXFLj0UyFSOZib6ocWZIKAWd2CqDDhXvtiAhFlDa?=
 =?us-ascii?Q?qKSxKvt2fHhCe2oJrlU6BtDf60o8zYZPGqgedqDEAtbGqeLjusTUT5rARUbt?=
 =?us-ascii?Q?ns9Jh3F7y4Tp7XKm7htcSS+CH3qgaomyUvKHnmSNca7n5SD6fJo7IuUOIoiQ?=
 =?us-ascii?Q?zUtzxYCLnmvmGdEi+AKxc/bIcQxZbtg0VaKRyA8TPwcV8GrTD2Tz2+5+7xV3?=
 =?us-ascii?Q?ls9LOGkn3CTX/fVxgcRp9s04KK670Z4iylJMuLsNxqqSl1O//qrtJqPyYbQD?=
 =?us-ascii?Q?dRaxpYe0yCrsYLLofU6s4NvYJv8m+/I3X3UpPBbOEtJh98Xf9EwaN7lDv9UZ?=
 =?us-ascii?Q?1pHMDq2gWN1AqnjbsiEIQa+mvyd8eHzoILxueUKArynWOIl4vP48FHZrnSmG?=
 =?us-ascii?Q?HJJoxa+JD6P/VbLy0v7T5VFfRx7I2f+x6U0V6z8H2RdXkHOLeZ+YP2krMW2s?=
 =?us-ascii?Q?vk0gHVlXGI77HtsP/2QNT+Zfo1wolrbFsf7W+jdme0iHP0NhUyoV77ts1P9Q?=
 =?us-ascii?Q?KxpgpsVM+f8Atb5gUXBPXE+f6aRbuG7JtTipkjaOPsAowuR7oQXgnwkQ4HHK?=
 =?us-ascii?Q?pkab9TJpBlsEkVtU8z7tj27tPEuKe5ZhOsYmjjBDQ985qu15gcUPUQEG51uq?=
 =?us-ascii?Q?vstNKNviskYnHkngUBPp4EPfC4ueNQEPqnbHK5sV4HsO6scWVINN+75qCVoK?=
 =?us-ascii?Q?JG96DmQf5NJBsZFbDhYKU4cc4jd1AAD4I+TznNXxLewyfARVkO6RiVdNdjkf?=
 =?us-ascii?Q?CXa5yiMC9trF2gR6MXei8bWRkbeOIZfojRhSJoLdDohw7sPm/r5GYDGWIBAp?=
 =?us-ascii?Q?G2hIDojie61oyLkA5RYT4/MPFIHTLFO/FgHGTvG45YGPq8A1x0sjqHQEwX1o?=
 =?us-ascii?Q?9QWL3ls2C18RC3PGumhoxj00kJdOJucQWG3fS38oCLnsBRm/O+NR9d7J90ZU?=
 =?us-ascii?Q?yc+jT9MI1u/3470PWJDUdcTapzHi//iULyCqKosGaW6Vz5pNkG+zJW3FApHj?=
 =?us-ascii?Q?2r+HCF1YIrSwb9HlUXI1JTlhzVvOVF2AOfjL6sW5tRskemSXKup9RVomPgDI?=
 =?us-ascii?Q?xU+GlN8gR8ECyeUXDGZoxQNvT2v57vPO18f7rw8rruMrZE383j/trPo9lrC2?=
 =?us-ascii?Q?ktoFw4Zrgg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b9fdb37-be4b-4940-5fb7-08de791264b4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8567.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 10:48:24.2519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3u2pVnqGyl7OokvmS3oTt+FRhZ7TQumrwV9+nH8dixZWnxYEuM4lByImKPKLJtT3dNQF9LMSO+UARotvS8Hbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11926
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_024828_897044_4CE76515 
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

From: Luke Wang <ziniu.wang_1@nxp.com>

The "keep-power-in-suspend", "wakeup-source" and "enable-sdio-wakeup"
properties are already parsed in mmc_of_parse(). All sdhci drivers that
call sdhci_get_property() also call mmc_of_parse(). The only exception
is sdhci-of-hlwd, which does not call mmc_of_parse(), but its devicetree
does not use these properties anyway.

Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
---
 drivers/mmc/host/sdhci-pltfm.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/mmc/host/sdhci-pltfm.c b/drivers/mmc/host/sdhci-pltfm.c
index d4fb60c1ef69..933fafe0a0ef 100644
--- a/drivers/mmc/host/sdhci-pltfm.c
+++ b/drivers/mmc/host/sdhci-pltfm.c
@@ -95,13 +95,6 @@ void sdhci_get_property(struct platform_device *pdev)
 	sdhci_get_compatibility(pdev);
 
 	device_property_read_u32(dev, "clock-frequency", &pltfm_host->clock);
-
-	if (device_property_present(dev, "keep-power-in-suspend"))
-		host->mmc->pm_caps |= MMC_PM_KEEP_POWER;
-
-	if (device_property_read_bool(dev, "wakeup-source") ||
-	    device_property_read_bool(dev, "enable-sdio-wakeup")) /* legacy */
-		host->mmc->pm_caps |= MMC_PM_WAKE_SDIO_IRQ;
 }
 EXPORT_SYMBOL_GPL(sdhci_get_property);
 
-- 
2.34.1


