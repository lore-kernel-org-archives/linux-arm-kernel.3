Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94088C88E59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 16:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vo1iUfq8fAGc4cAtbqSOHX5idKCUY6sNEISnoEDPgRM=; b=ZvH8j3jw2ZGLTXEywtcI3u2hR+
	INaFtSkD+1PYOKS7dIfASgEkz5NIQHwX/BxDaXI0+v7m7YXwX1Rx7NlGMXwMSWN0xNyVu7NYmUF3H
	9UYLO8aNleIObvZ0dwwsh13FpchB9KBt3DNvtoJQ1lFjRJcXlv3gN0F74eWavY8Z6MJgg3/09huHY
	uJ0uGame7WiFfYcdiZTLnxOMHQUySG9sOaec3pFTqSSmpQHZv4p4ewC+8tog1SWqVWm567VRhsH3q
	1GbL3vt+Jaxc5bgfsoPcq6M5BdRZtR1CGZB4vDZ5BP8XwYH5gH3TDp2U0Duc8m6BCzMh1GQxBZdeB
	SmAhBK7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5QP3-000000010Zj-1l4c;
	Sat, 12 Sep 2026 16:16:33 +0000
Received: from mail-norwayeastazon11013023.outbound.protection.outlook.com ([40.107.159.23] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5QOz-000000010Wq-0zkI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 16:16:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xR6YlSKkSkzdbmn59fHcCCxo4g8QbLsm88fwmIwoLg8vE+BsFgt6crqc3xxLM4rS+abKZqUUwQsSFL/pcxzQS+/e+PTX9A/bDi8QRvSntY/E8OUeS+L0+6WwNdbZ5q3CEyp+8x3Ecx+1z9/YyfY9uRAqLxm28HLi3DA7iO4dxC2jXaeNbCOUEfNF7Uk9ug/WiwHlCTJRsSIEVOGQdS00VrL+3vefDrTJwHIJMkmbUHwatDiOSYj7cyNKXYkQ7qt4IaVXIG0J0o7z5T1H5EoiNIcmE7ry/gWMdcFyCxox2DWUfZe8hTFdrK7i1NB6Yyt7JoSh+yFck640U1F3KMeMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vo1iUfq8fAGc4cAtbqSOHX5idKCUY6sNEISnoEDPgRM=;
 b=MEjl+5ZpgSavLDd3UeuAuVQyRuAQcS6gejoXuFNoEtIKS4OCzVY2wn1LDNO79fbTfgScbo/n4SP9Qx0+42tICfd53syMyZlEjZYdJ1YtYUI3Ptfp46SF9dMNiIVbQx/UvfEaKmsgRuPVfUNEIluO7qzHP85NaV2cMYgT20YVADzC+J7+UzZWg4UWNaK4zc9r5QrBBNKNEqlGNosG7D17EK2sEB+9V+1IeOErf7hilIVZ0R8qCv5aFzUxKblRWtcXZbwv7F9ZH6MmF0h8ULyfHYNOlzmU6cFPl7Kzylv9U6Xt64RbyvZXRFEnSNhvvy9z9co37pBwOqjKMiLQItgI9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vo1iUfq8fAGc4cAtbqSOHX5idKCUY6sNEISnoEDPgRM=;
 b=NkoFbzey7P4hKvIV2URTc2zCR2C5ormCK8p+xqIYbw3AbMYdp5i5J2EpLLnnwOORrvdA8+6/o6b/vFhkhvL/PdWotKGUuZUoZlK4nyMPVHQz8tlQIYtLUTAAkA5XgeiY7KR9/1MHHLhgNVyI71yOCKor+TD8HCC5kd2Eni7E7mqlA5BF6YZL94BQNRsgsXJV2gL2VOIlSssQG9dsScnjTZBYY++qs+d1T1Ue17R/ymXXsj0afe6+5w17ATVebLW77Bbt1V7wIygeeJmnqtdCSthuUpsFv511qcfEMHGgdgHxTmUW+U+4uEgwstU0p4g57U5CqCmi/WZ3N69wnZWomA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by DU2PR04MB8871.eurprd04.prod.outlook.com (2603:10a6:10:2e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 16:16:23 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 16:16:23 +0000
From: vladimir.oltean@nxp.com
To: linux-pci@vger.kernel.org
Cc: Aksh Garg <a-garg7@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Manikandan K Pillai <mpillai@cadence.com>,
	Felix Gu <ustc.gu@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] PCI: dra7xx: Remove device links to PHY
Date: Sat, 12 Sep 2026 19:14:39 +0300
Message-ID: <20260912161440.1032188-3-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912161440.1032188-1-vladimir.oltean@nxp.com>
References: <20260912161440.1032188-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BE1P281CA0459.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::9) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|DU2PR04MB8871:EE_
X-MS-Office365-Filtering-Correlation-Id: fa20adb5-00c0-49f3-9179-08df10e92ff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|19092799006|366016|23010399003|376014|1800799024|7416014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: COjZNqBnyLpMt4aD6PAY5geU6O1QsUocitp/P8KIdtCj1DrJkTfLiCExhAX/2o3wv+EBEBbOiEpy3IddNLDIeMeWTAbptllHOrnS7bkcwY8JC94L4+OEr+hkkVwKo17TkTv0Ui/6oJgMAXZL3S4nWU4Sp/0MYokrG8NWV5jW4uHQLTm6vwhgSghiRM8719HkhO9wFT831dP4BYHXZGGJgK5fBlleM8ZdMbnbPJrNHKlRy/Lxxq507lGBJRRtgmwHVsfpJ1uPtu1cLiaMbKwypNFS47+Vg76NEZ6rDgl2ZbhvPnAzfqutGFVCsmzaR3r9mqhN/1JO4FfH8xbmSRmKqesGzrgTJ00m9yF9X2PLPOc3LTaQUhE1vAAgOsJhu9O4CVsCs9+7L2tqN4It/zeDAh6f0PMFrmrDOXl6TFHtGh4er5wLq8uKtw2tsDqhzeOqmuXy4bxRLxyN0GNPLfXYNlBlOGymVCRxpKD0E4SbgOFFubgWHEanKp+NFdt1htoJwaY2xzK/0xj/PoC5stnpDunaKj453n/OsUXjyV0kw/PkoCU5+LC7/IFa8XnYPfy5myvbqqKNADDe/ILNTuIDcuhSZcqJepFfSOqLjeC+swAl9kpNehinj2HSFRgcLF06NoLd/RO1B5uyN9Xo5Q70VNqbyHm2DK8ctWNhAC2jirg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(19092799006)(366016)(23010399003)(376014)(1800799024)(7416014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d5YYvqO8B5ldIElyk8Zz/vJBJvFnzFxERTh/Vz5BIkvUBk/ruj3853jukXLr?=
 =?us-ascii?Q?6+0RVNd3XpDCRG3Ir9lRuKEeZoKDg8H9HEgeTLh8CTW8HRk61mHJy7gwvmjq?=
 =?us-ascii?Q?INOoACqS9IGwueb08xsX5CcCULT1e2fr5swdz93nJa6yrGdD0Un19ZcthbCk?=
 =?us-ascii?Q?k6Xc0+ImwYqdwePkNReNdUHhKk3c13cZQb8e3flQl6PZdy2va/LjWc+eAHQH?=
 =?us-ascii?Q?bL05mPwNLHxJ5axuAMOwPLWVBCg6o/renHL3bB0KEC0J+XbcKTfsL6IY4lmg?=
 =?us-ascii?Q?XXEj5UjyqzdFAZEpc+SDOEPI0G+rFK7L8V5GdjQ/S7Jbsk7YkpeVmo5SVsbJ?=
 =?us-ascii?Q?Fy9Bh4Gdu9GKutFzTBiySj1l4iMD8Oug7hMXhMKjIRBQ0eyj50i6H7cwEWjW?=
 =?us-ascii?Q?sXTTHVsgQIFHgov6vOa/dimc4kX10ykGSrQY7vciQSgmDBg8ANXhp46sqv8h?=
 =?us-ascii?Q?CC5QC/1GLN+Hbb9nTLidBHDGKXeL8QgOnqqaoIKgAWa473TOcEEw58/gWKg6?=
 =?us-ascii?Q?fNP2D0se2NVXKVDyehvNZcOU+O6IIzS1Z41/hjMySaPt5z0MP+zXsCTa976D?=
 =?us-ascii?Q?3vGHya6rdIItB/f/1SdliAsJnDH62eKF7GqyXnGyBfGy8BSLLBQMzurrCMk2?=
 =?us-ascii?Q?F/czwZVIYyP2NRjaN0wc+z1W7IHHEK3KNKAtnCrDbA9ERp/SXHhPm4SAS1Qv?=
 =?us-ascii?Q?5LHlHl/l34Xr/3GK2YEl8/3V/e88uWqdf00OXgZC9/d0O28jlMNzcn08S/3+?=
 =?us-ascii?Q?7n5lQkRfRWDlQYAbXzc6P2lTNvRn12wwRvwhT9J7Vnd5mwyWNl29r/1pPy1U?=
 =?us-ascii?Q?/e9g3xMwihXQJQ3ReAtkneurnymYNAqvKbKen+OKe2mbXnkAVyS2L17iwebd?=
 =?us-ascii?Q?IqnL2ISVyCINBtpx+MX1fM63U0NIuxjYjLa+1XsFHTva4SEC7EGxI+DxnTFI?=
 =?us-ascii?Q?o2C03i/nw+YCeoarUWSL5ik6ypqXwbaODGmKszS5f9vGoi3pjS6BIfSLb2DG?=
 =?us-ascii?Q?JvLfc7b6Htrwue7Wvw3OtweH/1JQ12ILMPwBcPbeSniFlhMBvohg65pD4SQS?=
 =?us-ascii?Q?Cm7erzxStCA7Mo2nFl6hUdcQejrGqDPHEmn457ZXDliEmB1a9ftD+iVxrbls?=
 =?us-ascii?Q?+q4GgSB8efWc2jMpp9zfH/JWjIO3EktKUX4VSkdJqgnFymq0DUUTkG61k0cc?=
 =?us-ascii?Q?Ym0vZzb7YqwYgRP1dZwjKsnFcuduPs3NdCTl8fJ+xByqXf7zFvtnfgHivRNG?=
 =?us-ascii?Q?gKC619fl2mQJJVEiiRD9fG1tgi7NIPMKZR2ttnUuuX12nJ+YXrGzgpYhMV9E?=
 =?us-ascii?Q?iQClzvXIy+xFPBTue4Ru0s2pheXCuJzcHyCb9EFbtXy6z2XMhIjgNDHZv63w?=
 =?us-ascii?Q?uSrh0jhPO0YWR10Z0i2WWMJVE9P9xJ5rS0czBNdNhm0QmOZrkHXTTzRDMNYP?=
 =?us-ascii?Q?/0wD+sUdRqk4Z2mzBAZOTI9czOvGrR3JKb8eoVceCS1rkJR7UCMjgXp4R4e0?=
 =?us-ascii?Q?XTD2nDpVT/nmSe0PQlFPjMhTeLfwNaRj8zT5a2hDDTGdr+QcY4cohb9mD9qp?=
 =?us-ascii?Q?bFaZbFWKX6eD5Y2oktUYlTKN91QFFPxavnTxBckFsZaHCMAh1MSdDD6iBPO8?=
 =?us-ascii?Q?UzdzRIV6SQKec4FkSVnuFtcl4uzK9gqg3MnQkvFB/+885MegzzXEpAO9TG2u?=
 =?us-ascii?Q?v84YkvcK2fcQ/lABqhW76JmTrGMwhLbt/Rev4tRweEIlKdtcnEHNsUG8sSIo?=
 =?us-ascii?Q?J5aNAiwVn3rT/6+lXia3tBF4atkbqYJolHSlCLfawCH3QdEJoUWn6189dDJk?=
X-MS-Exchange-AntiSpam-MessageData-1: GpLn3TAMyG7QIbMRdIa+yhTvPoH96bG25os=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa20adb5-00c0-49f3-9179-08df10e92ff1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 16:16:22.9866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qR/WPluZ9hMHoH0o/lBv03j/DUbtDUk8rAW+QSEKEQRk+9bAPKAOnJc3eGjWGYfZE55leDfnPGBObskLk6tLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8871
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_091629_279940_E559A656 
X-CRM114-Status: GOOD (  12.42  )
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

This is a full revert of commit 7a4db656a635 ("PCI: dra7xx: Create
functional dependency between PCIe and PHY").

The trouble with this is that a PHY consumer driver dereferences fields
from struct phy, which will become no longer possible.

Since commit 987351e1ea77 ("phy: core: Add consumer device link
support") from 2019, the PHY core also adds a device link to order
PHY provider and consumer suspend/resume operations. The reverted
functionality is from 2017, and is redundant with the PHY core now.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/pci/controller/dwc/pci-dra7xx.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 6ae5b27e27b3..6c9e88177600 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -9,7 +9,6 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -680,7 +679,6 @@ static int dra7xx_pcie_probe(struct platform_device *pdev)
 	int i;
 	int phy_count;
 	struct phy **phy;
-	struct device_link **link;
 	void __iomem *base;
 	struct dw_pcie *pci;
 	struct dra7xx_pcie *dra7xx;
@@ -728,10 +726,6 @@ static int dra7xx_pcie_probe(struct platform_device *pdev)
 	if (!phy)
 		return -ENOMEM;
 
-	link = devm_kcalloc(dev, phy_count, sizeof(*link), GFP_KERNEL);
-	if (!link)
-		return -ENOMEM;
-
 	dra7xx->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(dra7xx->clk))
 		return dev_err_probe(dev, PTR_ERR(dra7xx->clk),
@@ -746,12 +740,6 @@ static int dra7xx_pcie_probe(struct platform_device *pdev)
 		phy[i] = devm_phy_get(dev, name);
 		if (IS_ERR(phy[i]))
 			return PTR_ERR(phy[i]);
-
-		link[i] = device_link_add(dev, &phy[i]->dev, DL_FLAG_STATELESS);
-		if (!link[i]) {
-			ret = -EINVAL;
-			goto err_link;
-		}
 	}
 
 	dra7xx->base = base;
@@ -853,10 +841,6 @@ static int dra7xx_pcie_probe(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 	dra7xx_pcie_disable_phy(dra7xx);
 
-err_link:
-	while (--i >= 0)
-		device_link_del(link[i]);
-
 	return ret;
 }
 
-- 
2.43.0


