Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1DFC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 05:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ou4aWAdvorSSAq+Uj7Mk2G+bWCedytmyMt6cVuceMM8=; b=tX/XLHu9vwaZ2suLlIdV/X5y4+
	9Je2r5X2VzVPyaqgTAsvzrZvIpk6XESTOKO5OqA+tm9D66FAifbmvvXISW1edSvKtReVnjNkUGof2
	1SUnrxaSJyfYhiY25YMrELgLSSZny0TItsoP9U+I6eanozbmlJ/X1ouh4lJv1+/eUGSCFSyDqsF+V
	M4pGX3HKJ+Py17S6z/s4Vnwq6HXesnpNylcVrEYtcZ4cF/JenbqQzwIAzf+J1JPvrfpP2qL31jfMN
	Inr06ju+Yhy2TcYIljFHnTtE6HrRwW49hvQmnxEO4rbAc3q6FtBM4hKxuzm7mO9tbCVyXaDX3JJQA
	NNazuIFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtJFk-0000000DIAG-3hBz;
	Fri, 20 Feb 2026 05:40:36 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtJFg-0000000DI65-2hWF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 05:40:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EtveFcnP7h+AnlrtgmQHbea4UM8whRB0IaB9Gg1l8SEFjzzq3JJGMy0V0B/pbV91gtPVSK43V4RYj11xrmabBQogI/yDL//pDgwNtGxDqgtf2siX3yAd9TEssRqbS6zTWvTPcv8PaenInOUvz/UyTwzCbRaHdAecRFBq8YHlr5rThXxBR2ybA44a8P0KFWFO6AhicxqONHnQAuclfwn9MxKKGFIKs/a7bIuI1Ri1mK52h333gNGr2Xq9yMfi5YLmy6JiF/EZwqrKuZN7L1WXjMl1G52gtilPlfcGvXUsua/KkXM7klqCIXwcaQyJY3zeUiMVJaO2tl23U+XIvjXcWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ou4aWAdvorSSAq+Uj7Mk2G+bWCedytmyMt6cVuceMM8=;
 b=UVsQOe4gQczGmx8zSQljqpXLJKoaUVKeJiAppSArEphzqlBVu86ugl8IBLzikKSWakkburDUxTMXDz7/wpmAyywKW3sw89+WWakmkdEMXdnnRroXgdyBT5V518rsFBgKQqh45FHHK1XC9A6faL5aC1BSFNEX26y+I1mdcE8HxoFlHa92qWGEH9M4LAL25BT9Xs9OUGNELFQXMEV7c7IpxLPk/JOb34/dXZ9q6bTF6f9cj+RuQq84C1IeKCvDpCTOPxeXyaytjKV9/PkbBhvoFKsUjNrFTQDIi1vCQEyvecrAeX5YzDU8+2OMfvpa9cKNnZa9yhPpj4BS4qEqCXdrDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ou4aWAdvorSSAq+Uj7Mk2G+bWCedytmyMt6cVuceMM8=;
 b=OUIZVCe48Be1vj2HhMlJGhjqn7AvABPcmr0G+qMUvFWRuTFqjb5d1WkHTB1ypCLY9H0oongwaowfFyk+eMfwb+9yrE45E+80FAY2lFBOGNnVHd2zcnpCVEwEZ2K/VCSgCg+3rn7IcD136D/cON5vKO0lG/YeZLrfvTzvGR2p3XQ=
Received: from PH1PEPF000132F3.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::38)
 by MN0PR12MB5761.namprd12.prod.outlook.com (2603:10b6:208:374::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 20 Feb
 2026 05:40:18 +0000
Received: from SJ1PEPF000023D5.namprd21.prod.outlook.com
 (2a01:111:f403:c902::13) by PH1PEPF000132F3.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Fri,
 20 Feb 2026 05:40:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D5.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Fri, 20 Feb 2026 05:40:17 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 19 Feb
 2026 23:40:10 -0600
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 19 Feb 2026 23:40:07 -0600
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>, Andy Shevchenko
	<andy@kernel.org>, Michal Simek <michal.simek@amd.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<saikrishna12468@gmail.com>, <git@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>
Subject: [PATCH 3/5] iio: adc: xilinx-xadc: Replace module macro with custom init/exit functions
Date: Fri, 20 Feb 2026 11:09:39 +0530
Message-ID: <20260220053941.611415-4-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260220053941.611415-1-sai.krishna.potthuri@amd.com>
References: <20260220053941.611415-1-sai.krishna.potthuri@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D5:EE_|MN0PR12MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a7a7c5-1657-473c-fbba-08de70428755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kt863EgiBTfwf5WmRce7o9VIW5F/l+A7HQtZRtamcIr9Q1rbz8ACCPhJgD8s?=
 =?us-ascii?Q?R7iVfDrtxovmlVGF1wVxQk7uCc3MfE76KI7+v3T1SUzYwLdFy6c0eMJizzGv?=
 =?us-ascii?Q?Pw5T0S/XQv20HaSJSEXsN2rtkDRdmeRD5kwTWNq/CLzIIsONwTD0y4EngTYM?=
 =?us-ascii?Q?e5eYeZAokaFx+JSHYvT6mvW1D33+LiF5TjTDvKaxPeCo+HtmdUI8yhezaE8X?=
 =?us-ascii?Q?WyMwKCbycwKO59BkIP+5sEAuZnoWK1b9WMUB+SehPskgLu8V7HYVxEXTHJXO?=
 =?us-ascii?Q?jaY4b3ttG2FaFR4J4El/26aHkaZfCfdj0BuCOtKvCcL/2OUwDxFXTuyMOwwK?=
 =?us-ascii?Q?AhyK37qYxbnlxatlKSeqENpBcbpiML+b/lOdBt4m8gTRXpXfGpltB1BlFnUk?=
 =?us-ascii?Q?VTA6ZcNvM9QciK3E8rx+qyOeuxkw/aoZcaaiJFDXqFhS76tQpE+o+U6V/9x+?=
 =?us-ascii?Q?UlnSJg65ojuYEjdbkekfP5fvX8HKpysBHGKjNCjX92wPm/SFSbry73ccb7MH?=
 =?us-ascii?Q?e4I5LdYTsyyGTxmFlGt7Yke61+diNqrI5ifEevLPh+Dip046Frh50mNZuyjE?=
 =?us-ascii?Q?9K2rOxASfDCi8uPmn38yFpqF5324mzMzRsgtIJNeMNKi7aS/jfD751YQRgiO?=
 =?us-ascii?Q?NY010/sSu7brrkiZLxddlScKX+2qQX0sfENXG4Be0z6OqQP5ujEUNEXeeRL0?=
 =?us-ascii?Q?tLjkf5rSXUKrqegaWN4jlOqOAnelJSI3bjQUrJSKNOqyNeLH+z3bFgxuWyYW?=
 =?us-ascii?Q?13VjWsvqC0RVOnfSn66WJZ1jRNrb7CK9aQS1+9b7vJd95fjBELtSiKfew4ht?=
 =?us-ascii?Q?sxeRTlowtGnPOlOMOVUahGZjozyO64iWnOIxPstCmAO+2kUIxccJwnlTBujd?=
 =?us-ascii?Q?HuFE2ucXczMnL3+6x7NLq1oR6gwAztGHcZO5o10aFdiKumwlUpIXiNAmBxxd?=
 =?us-ascii?Q?9uqJ0oni32MO1n/NjT17sgKS8TuP8EgicmC87jGota7tg3Gc0Qyar3ZtghoX?=
 =?us-ascii?Q?2kEgAs0ipUvdksBsokKpK83hJjj2KrRruwXkR2/FoSpOJsRvLjknqqKOJIn4?=
 =?us-ascii?Q?SnAtwuyzwy2w/dFPrfY8Vazd4M7KIiAX+oj9U84xpAC392LaWnWm5vQx1HN/?=
 =?us-ascii?Q?Shm2Bfl9J4RiecgrXxjigACLOAZWlK9hN/5sRWl+6W6DaGmBreYjViXayp9j?=
 =?us-ascii?Q?WIZi0EqZkvt5iHLaeX9P2Sa0ZxWPUqIzuCGg0yippFlkbgMt7BpGgynJq5EC?=
 =?us-ascii?Q?I2/DnfcMeOnTkw9sAKLOkYKzPFzE6yWWxZrW0UJXsqLmrKyhKTDFigjVZtCw?=
 =?us-ascii?Q?At3twk5kYDeyl3JdL/6efEvEcQyslLNvE+0XuZeduayUT5sLvb3zyA//WR6A?=
 =?us-ascii?Q?+XUubNx4XKuAwPK0OH16xlaSesC5a7CtR93mgnzimEBTveGDfWJK8NiOOxAz?=
 =?us-ascii?Q?Y4wn8bpv890Ls0L4f7x1qFWA346PuPqYlEXgQvM0z7BK8oZA0JpBbiJyO5ro?=
 =?us-ascii?Q?MG4GaU/PSkCEz6MrzmL81peqA6bnWa2Bxaa9WT4F27USZ/C/gjOZa7FBawRP?=
 =?us-ascii?Q?inTnfjNWS5B6aXDgyMSll+ngRw+JJC2z/BLA+kKvo4x/zR02XWpS/YWPeo5G?=
 =?us-ascii?Q?GklKXcOUVi2Z6lgddZziYzremkdf2rAIYe4f/4blH/rlSl+8oNlMoUMTffzi?=
 =?us-ascii?Q?/5VgJA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jfULuyL8ydEIXf6VVLux9lQU3Q4oqfaTOgQLrfObZQfU3asmAjGKaqL/ZP4K0lZ3aM7fA11IjByaD6XlsQdhqfaocUHDjs1YCmAdC7Ifm8E/AMBovZsOaeR6EW99w4Wt5JkDaD8I1cc6dkZlCi4OrVFIfSVxBp9YalNJRpI+cGkdhPfttYi87iRICaw/xq4AKLqfrlZfJTzp/Y0tb0CiLozIAIf7N702+3EYZy5LdGb81GSlxYDE4ntbKg4hZW6+aJyHTgQKwkNc+ZXMC2XTHbwRrVyuJe/+tAvVQvxANH6kejZXGiVxxdZ5sahSyeRCrJGuQ95wzDmBxN63iw04S1nO53UZlwkHGmyOrSpCMEeZdXPMLdQGC80vggr3ssAWMvQLBXURY7szlDHAOrtukcNHjfa8zqqG/KLhIZ438AZK6/U0xf/sSoxOG2vYPw7M
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 05:40:17.3207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a7a7c5-1657-473c-fbba-08de70428755
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D5.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5761
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_214032_691210_13B2BAC3 
X-CRM114-Status: GOOD (  10.76  )
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

Replace module_platform_driver() macro with custom init and exit functions
to prepare for supporting multiple bus interfaces (platform + I2C).

Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
---
 drivers/iio/adc/xilinx-xadc-core.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
index ee58b4a80f34..4ddc962e4926 100644
--- a/drivers/iio/adc/xilinx-xadc-core.c
+++ b/drivers/iio/adc/xilinx-xadc-core.c
@@ -1476,7 +1476,18 @@ static struct platform_driver xadc_driver = {
 		.of_match_table = xadc_of_match_table,
 	},
 };
-module_platform_driver(xadc_driver);
+
+static int __init xadc_init(void)
+{
+	return platform_driver_register(&xadc_driver);
+}
+module_init(xadc_init);
+
+static void __exit xadc_exit(void)
+{
+	platform_driver_unregister(&xadc_driver);
+}
+module_exit(xadc_exit);
 
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
-- 
2.25.1


