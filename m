Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35868C44525
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 10:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5nTYn5DydJnT1vSxB4ZFr8dxNjhvum8jXttXPqXX/M=; b=ShICuznOF6kWRUIPche70q3z/+
	Yj47hkc2+hqC7w3R/fvsrfWG3H7nJ8xLqOA0AVXXgzQfWE6o2QUb58NupSAgwsybcd+nXvlyeRlV8
	rME2B086sdQl1Vcb5I+jsCytMQclWv3zxfzRXg32tpjePRPC8tcnY85l3NwmdPjKG4WTz8Nq9IyWV
	0K23NMSzLat7Y2xClt1vJaruFXWgHhIkWjK7HtLF+HA+G/OKX1qC8EyNwF3iTkXnZAK9JiutTPiHI
	/PrwyEyg/S7ZcVciWOhXXK+7q6ewtK6xDcRlczaSGX0N+7GwX0hEaqqEmvU7C1MUvUeRHgN6wj5yc
	4O0CqRQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlknD-00000006Oqu-0F66;
	Mon, 20 Jul 2026 10:00:11 +0000
Received: from mail-japaneastazon11012018.outbound.protection.outlook.com ([52.101.126.18] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkn7-00000006Omg-0A3k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 10:00:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JiBnedts/mnhFTj2FYeVcjJym9g649v4TXDw6bE8wh1K4usvWgZtyAa9eqFqBjkRUfFfadb6rxjb7Ri3Yit4x/+3OqHK9rvLyJe7a+RCG7OTDd0S1Ojsass4DY5079E3LR1ghfc0KycqHzzbtRCndwc+XZzCZq95Th+gvde7GO9VsX3+4XJzodvs+uRaWsviasO+XHwPy0te4S5GI0gDWRIeAfKpw2V8/X538hqYR7QBd5M8FTyE6IJGT1HdL3UBQ7SDqpoPrD3oWZYOrZekNUoRrXiy31XeAfMWRsa8MIcQovtkmp3tZ2OX5lqcOK7iZDPNgyj8jerYTGWW6UvfGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5nTYn5DydJnT1vSxB4ZFr8dxNjhvum8jXttXPqXX/M=;
 b=tH51fw3MFzX3+CDu5PGc8q0YYLAjWPMiGaxJciDGZJ9fabSffBkFtj3FG2dq4xaiM6G4rNDLeBmJJcjVubu8IjhlGQ8ERsSIpSo+PNWcVUBSqfpQoSLrg/yMda+Q8U5+yfWdtLaG1zLXEWDLyFZyiyfujw321w43e1XItqOLNAU0lZ065cRY/SEeI2H9Bubupn8AyfBSh7FojBaAPfBYcuqu1u+ZcuqF4Lr6VSfFzpX+Kyb9P6KpPKAV7U0b+g8RZ0Qte7DLr4TKP9Xoiq2QrehES4U+A4lIRfYk3lAlwkwwZhfb3Wr57GvLjpjIhVi/+A/3dFHOJqpvnzs9BH+X7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5nTYn5DydJnT1vSxB4ZFr8dxNjhvum8jXttXPqXX/M=;
 b=BiqcrOSAhzz5YjDetTn0AQgv1iIcYS2FQ137HdUWEzBMoMOSeCXC5M17M30OpLb6e0QIbj2IcIzeVHiZvb3rz/S/Jyotzt5xhswM61l1oXUiZkWvSHBBBdX3H3ltyWqU9bpG/weykmugDYMMxXXuEP7ETIleiVkjT52iuiLStqc7gtKFZVAEn1tQBuPZZOyWXO3LbTrYcfZDzzYSx/KdxZSbbaH2HkwBQy3wSpncQQPXHbb3aRRaJ+oplPIREXQECFQTFyux6gZYFRn/IyRRbfEmhG7VSlh67jRy2Rpc2Kx+1FsI+x3uiitPx2VaDMvMMutZnvqc1x+p+bri636WaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5828.apcprd06.prod.outlook.com (2603:1096:301:e8::11)
 by KU4PR06MB8458.apcprd06.prod.outlook.com (2603:1096:d10:7a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 09:59:38 +0000
Received: from PUZPR06MB5828.apcprd06.prod.outlook.com
 ([fe80::1d47:987a:ed97:769a]) by PUZPR06MB5828.apcprd06.prod.outlook.com
 ([fe80::1d47:987a:ed97:769a%4]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 09:59:37 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Roy Pledge <Roy.Pledge@nxp.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org (open list:DPAA2 DATAPATH I/O (DPIO) DRIVER),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 1/7] soc: fsl: dpio: Remove redundant dev_err()
Date: Mon, 20 Jul 2026 17:59:07 +0800
Message-Id: <20260720095920.542801-2-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720095920.542801-1-panchuang@vivo.com>
References: <20260720095920.542801-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::11) To PUZPR06MB5828.apcprd06.prod.outlook.com
 (2603:1096:301:e8::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5828:EE_|KU4PR06MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b40f138-b761-4b2b-e5a3-08dee6459bf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|52116014|376014|1800799024|56012099006|11063799006|10067099003|6133799003|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Bko6mvY0sdS3mdjBYMLNybTVvkXleW47FghJw77/YInCdSwmknpT6mLQXyoTluQJkAZDb634APzVkKpwqJNBW2QZ/PI887ku3fpYkNNCvjHDxMRNS6rR7WOYW+tm3wuYIxVGDBKmAUcrUtHsP9uk1CDxcbWTXaHvKPsRBEuGjC55T7JfNWvM37UYi3qyyee/OmWBNwpXuXfb7xO/3DKKPx3AItmsfWdNIZZdTouwAssLEWoYqHgLXhaMKZ/VloxH8JJHsF8VYCfGtCadkPbwftxbkpQ741TaffVyFPbOaSa6Uuz7BQ5enxf1OsfHEoMYeJx8W+qbrED06h7hZi+XoWxCXQylf/IyIxSXM/DtF01JYZfxUy8G/IcYcWQR0Kvb/usWNvoF3L39SYWM0RRoDBBti6C9gcYdoDxO1tBfckkgckU9Z9JFzX+cMgrObAwkrAreU1AGTF1GGPy1aLmbT1573ZX0ohXpzdUZ1xFMU41Ac4xRtDlep2U82+u3h+ht2081Dq9CvIdCvY5Sxy1XMYif2QEFMW7fVBQZCaJUl6XIxrlqN6Iztcyvm0urvR52lZNypLAx6o3Q6F3Ai6YqYr5X02isHHyIu53N8sWBHRmbuqn4aQeUvXB5w6QjTMEod0mJ4ljBerc/W519mIxOD1yp9yx9GHOdZuA5R63/tes7WoMikWJ7GXx4yJkYBaavTSWIKuo96YOuwzzpM9YFZXAegoOAqaw681LDabqLuus=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5828.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(52116014)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(6133799003)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tANS6epCChqkLeVZkD+25EYAAseYFC7pT3FFLtPFWxyVkNG82qbPUgIMJIWN?=
 =?us-ascii?Q?ymucwMe+K+n9Kr7k+DHX/bWG2Enafi81VNpRNpjZPUMrMVYVYLeyp8OKGqDI?=
 =?us-ascii?Q?xLCfkUQXvTXBabwokXpVubayMFAZibC6C76ALbHLqgKdtF3MWsOes191gFaZ?=
 =?us-ascii?Q?chQlj02V3mufFr5txuTKG0BUJ0Aa8z2Hlzb2gQbSf+vjnVEEOTQzPoiCQeys?=
 =?us-ascii?Q?Wfjf3/anNNE5qCuaOXVoI4CKm4mwMdfn20NHMWSQGJf7g4SDm4Tx3u2MvJ8n?=
 =?us-ascii?Q?Amk4efRCnAdmdEkFXYdeejFjPpYsO9KJq1sdo838sMIUJRydf2G9kPjApkQL?=
 =?us-ascii?Q?aNpArHNruhQhrsECGPzQS7AF2BXifuVdkfosFtFtDg6p0VPgJTlZBaTC6e1E?=
 =?us-ascii?Q?GiAFowcrGPTtlE66CWcgVRgPnnD5cuhF9kKx9VaZQke94Xg1uo7dhYto4jTB?=
 =?us-ascii?Q?EG/+KlGcCxX4EmJfr2kk2rHbTaHv52JMVMvVa/9FEZgd6G66ilqbLLCh17dr?=
 =?us-ascii?Q?hYWXRZvBwWzgMgx74JfXMueLb8CAtPL8FMdxzHXFjQrLdvvOETpSO/vv4Av6?=
 =?us-ascii?Q?K0Fu59RcOWaBsaPKuBQwxCQEY5bS2pTaPmG4aAZTHIOkhEs7pqFtu6znIK4C?=
 =?us-ascii?Q?r0BnqLvifpVmEmwdc/+xKtLsvHfCsUP8h2pcssrowlFZVOI8c2X74HZINxe/?=
 =?us-ascii?Q?yfu5kE0OVyWwZCWaDx9WbVfQPVH/xxA63rBhZNdwcgDSnLhQ6pFJRR3H94qn?=
 =?us-ascii?Q?QO+KD3SoxjvTNQ8KMILEfkp9KPfWYKsWF2Ujkijgy2IoW+ozWxtckGRsJFvh?=
 =?us-ascii?Q?e7YpKo0JAnMy9+RhqUQmm+bKwdcjkUbQUr2CxQEHWbdTx91WVyfxHyr1ezvw?=
 =?us-ascii?Q?/ANfZ2uWMcnlvMVKnY2ueZj3LWRuv+eVyLRYMGK/Sy+mlufmPzy6XWzOz/5M?=
 =?us-ascii?Q?XuTUorFNDQ/8rZyIvKuTaIPDPc3dOXZUxb3NZNkEuS8FioDBUidZN05c5ucv?=
 =?us-ascii?Q?X70aCKkVYXKW0W+08vcZ4tmW8h2bHT1EhkFQbkskTOV9yaTXJic36fTR2UbD?=
 =?us-ascii?Q?RuMqFdwQBdwjFnSFcXAgfmasUyc8wfTTAmEV6f71oypy1i1ltmFV4OxWrOnm?=
 =?us-ascii?Q?LXii+pSrRUyfBCoQjT0bXFz+iyf7wGHER1Ad4MgWveNQ5N0fHLjYrraT8T6l?=
 =?us-ascii?Q?REtv6+SE3PxgdP6Sm22B3q2aFXftwR4oeuG80fF1KrLMb0bEbIttYFpAf/sr?=
 =?us-ascii?Q?SHmmKGCacqNibvPjLr8Y22PWSxqUKH2nyPUecu7sZlEBvrIHI1DKGFKZi1R7?=
 =?us-ascii?Q?35p2drnqg68uTwWtS/FAzP8UZvcZpn87c7VJ342arRVz8i89lyHi9ODEaxrP?=
 =?us-ascii?Q?wu1xOpAl/Bz6m0bUEuVYocdKLxabqG2d3HekqMCmItbhGkAcKIbHpWJERSiG?=
 =?us-ascii?Q?47EUIxlQT548kUDnWRByNHz9g7nbH92xj7X0YSGaLWhaP2Nw8QPaW+EYITBy?=
 =?us-ascii?Q?31XYxAIPyf6H5LTWXgYYPnX+qM/PDNSbPcAWCv7Iyw4x4W4MrbtuH7lAXSRe?=
 =?us-ascii?Q?/ofxNWcsJwVQCRwlAR20R55E3hlpx45z0mVZeL7BeevHH66y0M2MGbGbooiv?=
 =?us-ascii?Q?Zk7MVDb0XxFv8qT54wlK4zLqhOxqn5YUFkeK1Uc1z8XGXUtvUAksbsEiDxwW?=
 =?us-ascii?Q?viUcPQYTYs2/QUDusATr0wXdaUcOMlNGVV8XtW7n1mx+d4KChStBzLdYsU07?=
 =?us-ascii?Q?L5g9ZwoL2A=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b40f138-b761-4b2b-e5a3-08dee6459bf5
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5828.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 09:59:37.9049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPnyTdBGrD5lVDJrPXOvKclb1Qzh4iVBHhVp/rhCo4XUIvnyU7wgy/pWebpYQczzBaoWyHvP2+xUNyZjHAcDPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU4PR06MB8458
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_030005_082313_AC39D335 
X-CRM114-Status: UNSURE (   9.10  )
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

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/soc/fsl/dpio/dpio-driver.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/soc/fsl/dpio/dpio-driver.c b/drivers/soc/fsl/dpio/dpio-driver.c
index 9e3fddd8f5a9..d5198ffc4455 100644
--- a/drivers/soc/fsl/dpio/dpio-driver.c
+++ b/drivers/soc/fsl/dpio/dpio-driver.c
@@ -102,12 +102,8 @@ static int register_dpio_irq_handlers(struct fsl_mc_device *dpio_dev, int cpu)
 				 0,
 				 dev_name(&dpio_dev->dev),
 				 &dpio_dev->dev);
-	if (error < 0) {
-		dev_err(&dpio_dev->dev,
-			"devm_request_irq() failed: %d\n",
-			error);
+	if (error < 0)
 		return error;
-	}
 
 	/* set the affinity hint */
 	if (irq_set_affinity_hint(irq->virq, cpumask_of(cpu)))
-- 
2.34.1


