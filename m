Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA6DCD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+1JvY0GkuNSdzQpI1LgYm/GyUHpC9CoWXjvAvwVLj4=; b=Df25omEm/Na3Ydg+4TOtOZ0wOu
	iaExQXclCqIee6BTBu7aqrcottZiT4gHFRDlbdlT1Nj9J9jaLQVyvubNVN66BXEwmKs0PHVm8JTCl
	kKFTWTwyPWRzAN6V4P9okU6E30xH0QuvxoU7Mq5KLhI8mGx7T2bPzo0vOeBAMmY8iqCCymzvBYpi+
	ByxNfIoDR4E3J7VNOMdYT/08QXcU2fbuPdsB2MWv+FrG9Xy9PZM8rX/mtdA+Oq6pmX0DvsZg4kz+j
	I9g3fMkFcewRd7Qxx2nQairey2iXwn6MIZmHx+9TKqic6Ko48x4xmSaEuJDZvoZ+YhvYtgDWD6Xn+
	xg3A7udw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWt5W-00000005FRn-33lO;
	Tue, 09 Jun 2026 09:49:38 +0000
Received: from mail-norwayeastazon11013004.outbound.protection.outlook.com ([40.107.159.4] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWt5T-00000005FPk-0UBH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:49:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQcwYRFwPLWANQUOfr1lgL3QIzWykcXqM/H2WPAkxDJxHtaB2JvdVEKXL7K3OeJtIo4fLb06rr/2FHmye2vNUOPknnUSO4xOxeqURuPwk6AeLUtRVIKw28lEGWlYyry17J78NhK8Vwj2XZ+Lh1aokDY9s14nXYqM0AE5b5m8P/uf8ssyH6XNBqbwP4JXkB1mtWcO0UsKz/Vy1/LzFz2xeTh5UsWyHuWqxBo4n3v20AH/EkOCEUeyfnK0tfwv3QRp/pjdsZMxbeWvnkLQSYsP66wh4qXKfWiZ4EPTNI5QX0QKQ6DBaPAKWeCeCk2O484dT04g8OLcUIsdO3MigVfWGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+1JvY0GkuNSdzQpI1LgYm/GyUHpC9CoWXjvAvwVLj4=;
 b=UW/Bw7BlMNgje1zXFI6mu9AXmCbVAPL+tWhe0BQAoh4dQnURNtMx+D49ylXhFMfV9ankyHc+rdmzMc2gkYlmAVFjb3bI425xCTpWqijsivtmtOmI/YEgRKZjLFCuEBKkeogGLb1YUWf5dk8EZ7xUGxWtK9rppdZNB4L3DbOgf9vogq70rbCflHIshcyQOZSPRfRKfsNxlgSvarF3qLUa4t6BZ3TXiGFQBwgj82hY2ZzjsswNJ9Q7IiTwJk4EG1IfSbiTQ7OoW0MTbQmNjGaDfXyNKD1NwA/PYXk7VSDdq0MFGMJ0M4Q/okjezcoYa/+gBmm3ImmJ72cDtu6KUFQr/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+1JvY0GkuNSdzQpI1LgYm/GyUHpC9CoWXjvAvwVLj4=;
 b=c8XQa9u9AZNK6kLr/LiBakVVBjXeAOUQcmM/dJxhg6A7cLtV3kzeLtU4SHJ/GFSQqaLBuEo0OtapFCZK3WuBNUmasL2oRahyyYXRxMibUV3nBmgShOhnU4w0QKdpTN5hos/QXtDkTbzbei10RX7PMaodUUresu30bb4AoxTubNaAwzsHK0Eo/vpnmNODyEQNJ5U9FLpIF05TKY0f9Xu6aHfQRf8+p9udxmtj6jmJ1WbAUQb5S2XOWJlhxk4GlUdAwjtrd7B7WeHaG6yhsUf7nwzqnVXt8ObbmVan8jY49u3kLhYCzDONUZntBwzaa71juPt+5nGtIePaCdZV2QRv2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9466.eurprd04.prod.outlook.com (2603:10a6:10:35a::6)
 by DB9PR04MB9820.eurprd04.prod.outlook.com (2603:10a6:10:4c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 09:49:28 +0000
Received: from DU0PR04MB9466.eurprd04.prod.outlook.com
 ([fe80::326b:ef06:42b5:c83c]) by DU0PR04MB9466.eurprd04.prod.outlook.com
 ([fe80::326b:ef06:42b5:c83c%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 09:49:28 +0000
From: carlos.song@oss.nxp.com
To: aisheng.dong@nxp.com,
	andi.shyti@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Carlos Song <carlos.song@nxp.com>
Subject: [PATCH v4 1/2] i2c: imx-lpi2c: properly unwind resources on probe failure
Date: Tue,  9 Jun 2026 17:51:18 +0800
Message-ID: <20260609095119.924029-2-carlos.song@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609095119.924029-1-carlos.song@oss.nxp.com>
References: <20260609095119.924029-1-carlos.song@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::10) To DU0PR04MB9466.eurprd04.prod.outlook.com
 (2603:10a6:10:35a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9466:EE_|DB9PR04MB9820:EE_
X-MS-Office365-Filtering-Correlation-Id: b725487f-c8a5-4606-dc45-08dec60c65ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|18002099003|22082099003|6133799003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: odsW1uOyWIxOJAHu4UX6KIUsp3bNUgkLXV1xbdKtvA9nEQjMcQ77vyh2WvJA6d1lYF783ICBjqog//D7weWkZOepxMmCRMb588UUuGeOhcpWb+cBd/Si05kb/zbZRq4zMtEmklNrq4rtj/7tCd9rbZuiTS4Ly90ERwIdCFHc45Ij+1Y1KFRapi8p8uOM3t50Rcyy8XHpeOBUygITH2UV5uh2q/PGLxAEyqgfufEtish3yaLhutLjZjTM5s+2Sg4RROnqmmTybQILL/+wq82whGAe/tu293gPcgvw7m8izvPNPt7kt8U3C41dt7mAJEMtZKZNIxDPSV2YulQHgLvt2oldKxGXUR019nu1vYxH+mhN1sAb6bkovYO3B8noPRLDHlwuzmRg1Etp1zZHkbUG6GGqVfhSv0ylXYLDGD87mZOv7fQX6+Cq9K+4oCTMTVU2AeYryiHrExd87rA6VQcUD++2lKYO0+35KNsclym3mJDM8XAFDoaO9Yry0DGyUB4dnyUzoLeZwTiYmBfkVG5sdqKiUTa6P/2o6TRaZopwz9E9wVgFExL0EbLM2O9LhsIYW3Jhm/BJrzFkuMJWW4+oPJnJddcmFglLoKZygUoHJeF9qtQDpqBxJFIX0cF5C4+CDlS4hD4st6p/oU82k8Gr5R+5frnzCtxWFBDPx3va4LqfwsIhhkDGU+XfPYltMikg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9466.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(18002099003)(22082099003)(6133799003)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iG/Tfx/NCFAMMUW+ElSAOWU1QASzEI8x9RVL9yEZpHiGqFJtfSiKdcjNPabN?=
 =?us-ascii?Q?qGwjjNFX0tHlwShaZlLwIQ6lWTpg5TBQReUGtwNPBf1gB8u5lc/jJpN5sbkn?=
 =?us-ascii?Q?mvS3AUIQMTE+ELGtBC55vdSO33OVYqJb0zJ+qxKY64Gvc+TRp9YKdRfavOo6?=
 =?us-ascii?Q?msKlVUtt0nnyqReXWTxVWPWKTcLZNcuNw2kChefSw6bojaJh9PIyhJW1B3/p?=
 =?us-ascii?Q?oM2JEAdVdTiTXGyIBBeyI186JoBebRCuafe+dZkSDsw0g9AlS4ZSSzafzKz4?=
 =?us-ascii?Q?DGrsDr2NSV1SxytYjDe67Q900fXmMBW2paf5knd8zn2i/a1HVBKwNSqeLZsc?=
 =?us-ascii?Q?Rp1GvZmR/JHM6rPSpH9QcmcmaEFOh7R6Qemi0ZpMvUYE4PS4TD7dYy0Ukc3D?=
 =?us-ascii?Q?SUdau5Oc23lBbDL7OeBNJGnNl0aUmLwRR4YuDPKf6PutckN+Pex/ZV2/feMm?=
 =?us-ascii?Q?sytrb04shVLbqWu6v4gU87JdbgaoqTCxIsqOA1qos2FGzKIUs0nE610Dg0j0?=
 =?us-ascii?Q?jVriRIBDCGSfjg8x3KA2blwoOa1AM9owg0e7UfPfWjvpiL0rlXWDrKT430io?=
 =?us-ascii?Q?IdJuprNalwI7QniPXGnk3x2kkKnO3ZOSbxwt21trAGPN/IpD4V6YaFWgQS+G?=
 =?us-ascii?Q?LFooII3IZD0OMXmBmD0i1H4Geej9BqYhwSqC4Fv37LKPppXNiofBCAq+kKt1?=
 =?us-ascii?Q?v2kPHiudrk3OHRS5x6HAuj181RgWozhfQgqibsPFW5lmAvSWhhuHxcH05LOQ?=
 =?us-ascii?Q?oXZ0Mly0mgVt5T/DNLDL3ngUl55LAEzCctdy0GDxyYgCIyn5009agMe6v+4I?=
 =?us-ascii?Q?GFWJ4tSAB2KVKNdSFeK3ESHNz5lxUi9xXqomZTPAg/GDHqsFvZpybxfzXL+Y?=
 =?us-ascii?Q?eb1kLmIXIn/LBzdZ5EpxadJW/H8QYiHR2wMJcQgwxY7LgXZj6o+n+dIRuO2A?=
 =?us-ascii?Q?FcNCzSFtpv6W/IRO9khr0yIheHjMSP47JTkC94Lb1niuFbu5A56yZgpJjtls?=
 =?us-ascii?Q?SB4Grmam02a+iAASlR/A0bnT+1v2pqu2yUOdkx4FMOHzVaqNFCIUhITqmQ33?=
 =?us-ascii?Q?ydTp89Kuxqm9YyyOjbyHra1xA1AYQSqdJjpGSNj8tEIg7k62ttOJ12ZNHm6W?=
 =?us-ascii?Q?rIf45HeYMkw4nAAe63HXFmnSJ3Lbtrpz+RCwOOflD1776ZxnaAoVigruha1E?=
 =?us-ascii?Q?cBPMHXg8SKMJWtn8pCBxgMhQgcPU8a1FqlQPVVO1gcwqsIFjNaSWNxHGemQA?=
 =?us-ascii?Q?fRih6pimrKyyLZNRm+AWA2LJQGr/PgRU4AzzNlBGkCdjYGC7r2VpZbS1tcgX?=
 =?us-ascii?Q?poxns4bbS+fm/LWattzp2rq+qNE87MRVlpwdySoLKvAo6MO6uYI8vlKFGS6u?=
 =?us-ascii?Q?OMTe4NMQWfhhoUOfHTqJ9Cn8ER55hWWJSSsU+fKHeX4lUAn7hSGO9l/AFqL/?=
 =?us-ascii?Q?od3WPEyDqoxePH2NzxGrrC/8Zbn78SPqe6uOw0ncGvcxHwoB41uxXbLi+sEm?=
 =?us-ascii?Q?eJWNoLNyxZ084wcxIgKytDw2XHZ/+I1XnKuV88ZFfKOvdJ/9LDX+G7dRwfXb?=
 =?us-ascii?Q?qlCeSw8tlrRPiwQImU6W/c9171/oWT1rYqFsHTiC+Ccv1KT13Ces6xfyvIkm?=
 =?us-ascii?Q?OqOnE6yA6VYfdABwFJXShRHRcCBI5ddwemVYKsQknug5n2pF0wUF7iRj/iRa?=
 =?us-ascii?Q?gTG+z4YEW/6i+kAZc5IPOE+D5GqEQetOECT+QZtJu3Injl0peHTO9fErzP3f?=
 =?us-ascii?Q?UoM/L0gTxXG+jLG/bpB57cmPJdJVo5jnLpfYAoobfMNAr6+GkZ7Y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b725487f-c8a5-4606-dc45-08dec60c65ae
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9466.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 09:49:28.2710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SnYAFB4MWeGpmXDkPyUGKv9oOI8T61hygI0Iok09hs2whmSOND2IOGCgV5RA1xXHovxk0pmFziEYFrzvjS7D7nAiSJLsy6QrhBpxhuVdqE8bqWuMb2zplu973DmCR1S8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9820
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_024935_164938_43998AC5 
X-CRM114-Status: GOOD (  11.93  )
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

From: Carlos Song <carlos.song@nxp.com>

When probe fails after clk_bulk_prepare_enable() succeeds but before
runtime PM is initialized, the enabled clocks are never disabled.
Additionally, calling pm_runtime_put_sync() in the error path can
trigger the runtime suspend callback, which may attempt to disable
clocks that have not been fully set up, leading to potential issues
during error unwinding.

Introduce two new error labels: clk_disable to explicitly invoke
clk_bulk_disable_unprepare(), and free_irq to release the IRQ via
devm_free_irq(). Replace pm_runtime_put_sync() with the sequence of
pm_runtime_disable(), pm_runtime_set_suspended() and
pm_runtime_put_noidle() to bypass the runtime suspend callback during
error recovery. Update all goto targets so that each failure site
releases only the resources acquired up to that point.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index cd4da50c4dd9..fbb9c0b0a99c 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -1520,21 +1520,25 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 
 	ret = clk_bulk_prepare_enable(lpi2c_imx->num_clks, lpi2c_imx->clks);
 	if (ret)
-		return ret;
+		goto free_irq;
 
 	/*
 	 * Lock the parent clock rate to avoid getting parent clock upon
 	 * each transfer
 	 */
 	ret = devm_clk_rate_exclusive_get(&pdev->dev, lpi2c_imx->clks[0].clk);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "can't lock I2C peripheral clock rate\n");
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret,
+			      "can't lock I2C peripheral clock rate\n");
+		goto clk_disable;
+	}
 
 	lpi2c_imx->rate_per = clk_get_rate(lpi2c_imx->clks[0].clk);
-	if (!lpi2c_imx->rate_per)
-		return dev_err_probe(&pdev->dev, -EINVAL,
-				     "can't get I2C peripheral clock rate\n");
+	if (!lpi2c_imx->rate_per) {
+		ret = dev_err_probe(&pdev->dev, -EINVAL,
+				    "can't get I2C peripheral clock rate\n");
+		goto clk_disable;
+	}
 
 	if (lpi2c_imx->hwdata->need_prepare_unprepare_clk)
 		pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_LONG_TIMEOUT_MS);
@@ -1576,8 +1580,13 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 
 rpm_disable:
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
+clk_disable:
+	clk_bulk_disable_unprepare(lpi2c_imx->num_clks, lpi2c_imx->clks);
+free_irq:
+	devm_free_irq(&pdev->dev, lpi2c_imx->irq, lpi2c_imx);
 
 	return ret;
 }
-- 
2.43.0


