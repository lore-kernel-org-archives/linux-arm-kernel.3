Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B754C4453D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 02:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zrsmfTxWv4l/8hpUClIn6GYjOKWv68sanfDgI0s/IfU=; b=z4EUXRCgAh4KYaSDThraz/aLeX
	ctyE3ALsv+Opj0xoFbqhpSosJxhDbKQRvhc9o2d1htAd1GVWwAcHgETe/h61lTu957tItvkBkB1uI
	Y0R4P+MYeU4nL4O7N7MddgZjTwaKYcjVdFcUo7l7sZ9p8QzzG0X5um0zw7dmi/9RsSXPlurOc5aRm
	TUhFb03v8ko9QdTHksGzYMzoo8QK/3OWXU6WCp9qpXoiKHQmH7Cfj/rFR2tla/o2AUyRDscGfTQzr
	/yIvMvrT/05MAWyDeUbwJmAw/ExhAOZCCAsCxUTqGA/qZ8X8faWhx4rLLgj9/vvz7V//AwS41Cj4H
	IV7CPAog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjBq-0000000DEGS-1htj;
	Thu, 23 Jul 2026 02:29:38 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjBn-0000000DEG6-39GX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 02:29:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4FHj5PMSgNn74AassaQC+kzBnE/sKH8pPxnjfuZZVIgUiFLCMjjoMXhBfTQJSWRupgNtE4P9xHqiH+eipSC981koGW73G9TgNXuZ35xi7fnvM1j8l6ShPRdrqvr38/HyZon3QvHJ4GnDJ9hudyva6ju73l89sMKJmQbtCPPILfPA2HH6bH/pL6o/3icZXSaH6hN8Ow6pHzkLvn44Yjpg2c6lIJR6HmosarplzCCcLEEeLzhm7RwOy7p86UH+8lVDvFxxVFBOODjQxMnq5rivdIiu/sPhd1BuauIBNwtaQiFjgtS47VQXIf0LuXFc1j7xlZG4Fh6KQyl++B2i2rIKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrsmfTxWv4l/8hpUClIn6GYjOKWv68sanfDgI0s/IfU=;
 b=jNPRWn23tX185/8TfHHR/h9zbgdg84ZLOH3p2Qv9dqyw86WBtFGmGV03PCX+Oq8xIAWOTfb9idMPtRxQ4x6ZnNw6ABz7LBMe4xJmueebNOuGkgFnpttV3kKNWYNS3DhTS+FfZjfYkPIZ6zH0+Qtlbi6sZVb55U+fjs5t+hsc7OlyRQb1817H6oz4r7r6Berss9AniCDACzEub9JDPHWXf4i0GFx0ZJjON+RljTmckZhLoaD+bQwoX+LY1txs1xIyBsrOH7m7SqaxUntFeGM1rXn6hfFutMIzB4s7NOoVGsltpzQm8L2FUOsUvqP1TX/2AgicHdRbXCi9yCsK88JPew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrsmfTxWv4l/8hpUClIn6GYjOKWv68sanfDgI0s/IfU=;
 b=HNypcDxprlpgUyeESoj4nEZkIV732+JvdO/Ry/yVrSbnKuRP6N5yFUdVWwUufOeTzHGxPEVHh7e3C11sTTQ/NrsaUaIJCFJCNZ96fdq7tKzIEdsliEIX4GD7HNfmosl6wfjvGHWAJa6Efepkj8wkwJqIdpUHd/CMwhk+IpEwW273Ee/PFj8yGa0KtMdVPnWy1kglL+GX1v22xaCyw4a6J4jPhsJgXq7l0+XIL3JiP240CX4R7hI5paen5+7xo5dOk5OJWzz8rbZy9Wq50TRgzp1FtjSF4jlzMIgpiV9OQZ6UcpvzhunBWPQJ0ipZLWhNHUQHYPZSJA9OEtm+qVd5Pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SEYPR06MB5865.apcprd06.prod.outlook.com (2603:1096:101:c7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Thu, 23 Jul
 2026 02:29:11 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 02:29:11 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Michal Simek <michal.simek@amd.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
	Pan Chuang <panchuang@vivo.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] soc: xilinx: Remove redundant dev_err()
Date: Thu, 23 Jul 2026 10:28:54 +0800
Message-Id: <20260723022857.627844-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0023.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::19) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SEYPR06MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: 902484fd-921d-49d7-746c-08dee8622e00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|52116014|376014|1800799024|366016|6133799003|10067099003|11063799006|56012099006|38350700014|18002099003;
X-Microsoft-Antispam-Message-Info: 1HfN0GkziazdPJPMPosi48EAC9n9+IbYp17sBMsgpMEKOMzji19h5msNj4Ve9t/0C24vH6kyQGDXPMIWaN0NnWMWMZSNj2BWvSnjnTI7oYPfdBeD2LE9kbN7BfFAHXBTLDfEqLZwRIPV9A2ezE1nSTs5d6+bPO7WhfGr86MrKngD/7sdAk/UJSjDPpqPD6Pv+8soer9mGG70XOXj/mMCfuLElN8Zm8wYRmXJ13kEy77E82ElLa3nahBbt4CnKid0MTTadb0Y3Cv3P0++NSdHh9dumJQxLGUvuTeoX+Sbnxy9l8r+h1nxlrmuMBC8e3i3yVuMBTR2pnPkJek9jCRi0Aj3PRw77tl0I5nqSYCAEl8QmQcVrukhMN062TrhAIB0t5dBw/9nNQBg1JvXHd9fwpxfq0bUOyOVHUeRbdovCK296KLwukNUUhczrES6UPjflydrwkg4WGDZRQyeUMkRZo/AS+u6B7/TTA/RXoDti6o1kWntTZV5Yhku3jLnfVL5JodvG+inQKS6d9VNHbulrUdVKuVzwYdj5h+o2KR42ZkyUMuUSSBWSi6aBFbb9SbOnteHkohT+PTXIt96iTFfifUwVpxbFKQIc5Uniyg5PG28yDqs7PhUNGtx7ZZnmSmCDay1W6kigbsZwx5jB75ej/CLDrGgKlWpwHYaHf/Y5ZrZxOtuB7TxicP18aEGHD69XMf0Ehc9YyN0KDRtVVwFsGKZv8c9zWo6m9RMUDvUDjI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(1800799024)(366016)(6133799003)(10067099003)(11063799006)(56012099006)(38350700014)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4z9cEOvvMWvJ7r2as1lNAVNsBcvN5NXB70JtypFS9vSNL8ntK8PkkIujZgj0?=
 =?us-ascii?Q?R3kGOe+WZRnSu33HRnvLBG+v9enPsCTVDtnc+jZmk7+rMN1C3X3fyjwNzQlw?=
 =?us-ascii?Q?5oziCqLsB3uEyUxQNXdoW3VNZZCS33ZrN1lrjgYlS3PxL2ByaOx2D7xoQJdU?=
 =?us-ascii?Q?8QLCPBGSTZVpOwVuZEhkHloxwq5hN93HxwKJcvQmQDQUITSR5eBhm5hmNsCX?=
 =?us-ascii?Q?O+zBQCRh6Ex52PdbseZDOxcd9Lh2UXEkhmValb9KvH2fskoY0R8JRPi9mWeh?=
 =?us-ascii?Q?/G5DJInt3BtvW2Ny7eZdoQOoUTNCSU7mHPIHozElufVnnjuTjs8Vf6bLS6JQ?=
 =?us-ascii?Q?qHomDZaUYaKlpZYi1xvnFIFHcLCbZop3tV9pAguaSKnPZeiULbjGCrdYwG/t?=
 =?us-ascii?Q?Crpi9uVrgVAoTO8p9lQp9ACyrMkZB4K9VFsWonjC336kmkugDGKw9rk6wQ7/?=
 =?us-ascii?Q?UoJDWFsA0QrdVChtRRwnfMB6ZZHuHh79nM4OCfGFrJdpDWZMbnSp8oQu1w9n?=
 =?us-ascii?Q?igXhaCYOqFQ5HyPyuumDLkx3hNOiO75QLap6moavIKxQUJs39uS/u2zAXgy6?=
 =?us-ascii?Q?5gjGf0km4rEsO1eW25wcS7hpO4icGwWZBo3tLDCe8Oo09OrhvOgTJGvvRBKN?=
 =?us-ascii?Q?DmBLlLPN5F1058C3kg62vRD9PMh4w9r99S8V9+veIF9wY+vdQaJHKOkK0wJX?=
 =?us-ascii?Q?F6pEp9CCm/VkJoY047Igi832sKKkVw2H+a7s2giGn2rdQZPx7N0MYAoZei1K?=
 =?us-ascii?Q?olaVw1K4ZLBCK4y5Xc5Av45Fj/KPkOD9ITPt/tbjavM1S1CuCVPsz2Tp9H7p?=
 =?us-ascii?Q?Ksot+xHohzVTTw82BbgEwtK5I/EwF8IKP2MovKvXbaLeMV3e9WafyHP7Gpfu?=
 =?us-ascii?Q?aJF3JlEWa/lGInRzDgWIIGSuKPmvBblT/K4CcaifInfSNYWRZ011fJ+5S4fQ?=
 =?us-ascii?Q?YQecyH8PzThp1iOcWLGkZqNbZ70c00SWV8mZTRFho1PFwONx2rqfBbEqV+1c?=
 =?us-ascii?Q?4fxshC9/lWuC4sYz+hYwCXfyX4baWX+IKZJcbKr1epE62gvweaGgAXgcMHt1?=
 =?us-ascii?Q?lv354od/cHhOGM5dCYQjRHUQE+MCS/cmVXfVD0zl8wLUIY+SpRsyW9vtDBqr?=
 =?us-ascii?Q?C7en2c4fiXuCFN1IFIBuL1/FlzEZDZ2JlFOU8PZ3I9lKyZAGAIGWU69S7d/Q?=
 =?us-ascii?Q?eMtPIuNCGKtcqoN/m66fSSpGjcnjmQW5mKcYHMGhSLmse3KQ1r4PgdsKiDQd?=
 =?us-ascii?Q?Wu+M2clB1Na5SmIZ0UPec7N8KhmW6s6JsRZjpFmUZQKVKaQGUJ+k0a92Zz9C?=
 =?us-ascii?Q?6iytECZmVruePSdJ7h0adqvObg9BtNLZyeAh97aSBhaH3mhbTpgmDxbP960y?=
 =?us-ascii?Q?pMlRWbnATvGdOLrWZjGslHuB1sEVW/lumvdeTCQvz03ajnllSG0ifHH5Uiwv?=
 =?us-ascii?Q?U1yINTEjbhVoNgEMs23gaL+zJlO/GZalrm1Rd26op6DRwaXSIG5pFqpuX9v4?=
 =?us-ascii?Q?Vlfqb2kNI2N8z+IcLzPzAl7c8BQVpgSyAByILVJId7bSaN883qfaDKlwlb33?=
 =?us-ascii?Q?zkA6CTlk7JjAeWebstSzIVH1xbXNP6pVLZ6Os4ZO0lvLrc0U5/RsISK2JXAK?=
 =?us-ascii?Q?kOojZysSe3vh7F7PNPoGhUcleYZv7yfkjTJ/f/sObnqFt3H5ll7ZCK0srAr1?=
 =?us-ascii?Q?SnpLjtitdvPnuaXSOpOz30DJPo0QvfvuXwf35jyQMdEcnsrncoOvnUcfdyVk?=
 =?us-ascii?Q?HYsvL4ykMg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 902484fd-921d-49d7-746c-08dee8622e00
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 02:29:11.2438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tOplE4Acd2iFmbnhIIVtWzqruvfs5ms8nTQbmMrAY9Q4eDgc3ASqvwyH0eKpqo+nrV5IGiP+1Tme7jMyj0UiZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5865
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_192935_808055_CE454785 
X-CRM114-Status: UNSURE (   9.13  )
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
devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Acked-by: Michal Simek <michal.simek@amd.com>
---
 drivers/soc/xilinx/zynqmp_power.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
index 370e61ac47d8..54c796afb89e 100644
--- a/drivers/soc/xilinx/zynqmp_power.c
+++ b/drivers/soc/xilinx/zynqmp_power.c
@@ -368,11 +368,8 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
 						IRQF_NO_SUSPEND | IRQF_ONESHOT,
 						dev_name(&pdev->dev),
 						&pdev->dev);
-		if (ret) {
-			dev_err(&pdev->dev, "devm_request_threaded_irq '%d' failed with %d\n",
-				irq, ret);
+		if (ret)
 			return ret;
-		}
 	} else {
 		dev_err(&pdev->dev, "Required property not found in DT node\n");
 		return -ENOENT;
-- 
2.34.1


