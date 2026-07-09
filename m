Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66221C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrzN8TD5BJROFjQZ3kreDCVGLrpFvl4LkH0QdjSNQV4=; b=elmlXPXwCsHFM/XnrAj+EQYSwy
	OQsTNplZYtPOpLg41uLG7ZQZ1Br9OBQNUdZN37OmhI9JcgcTVnSYuoego9g0iVOWFBlsm+y7WxRYp
	4xgGZ95RlA3+epsoeeeXCk9H+eWsaQbL5Ki/c1D5crgGkxw+56PwBr2BTdctpawZPvmbYjjXCBaGa
	cRIB5LnxvVBwpyAADjIIrZnkxDrmI0dh27FhMsfgGjtAXp0nwA4ib7g243LPVIJAvhlJnz/DxMF2n
	Q3LwdwA9xgZoY3DsoTOU2p/vvm0pkBCtuyws5iAGcvHTLxbWMVOD1deCSz3BHZwEk+3YrpyWJbu5V
	AuRkPQ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlle-00000001uOg-45rH;
	Thu, 09 Jul 2026 10:14:06 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whllc-00000001uMH-1yQ1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 10:14:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5OQeT/un9r68RUBX8bGsxzfkzxWMA4pp8oHikfmzWWIQoTNp8VCyJ2WhNFRd9jamslkssIh8NE5ZIYwaI21jT0fGCxXUULer6ys5oPSeZDjOmzBaRt8AaPbUv0to7JoH5pCnO8ktRqwF5tdtZ4HvDmNnMpiOspLXjqJm//spmu+xSwu6oSalF+XFWyqmsAIWfY/IqfyfJ6UG3Xdtd4v9a0jsrBYKFkaPc6xSiu0YX9DSO22vyscvrqhXp8NoFG/EfSX6Bul+1iPdV09nFmKzuNo3IgD34vAF/HfcZyBxGEnwv+Am9aerFKTZjV4oqw8QrdAWpSNq1jLc9Fwee0Q+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrzN8TD5BJROFjQZ3kreDCVGLrpFvl4LkH0QdjSNQV4=;
 b=ZptmsPyFLwcITpGiTYR27LTaxv9DUKhq7x/W/o3fzbGOg2hSgUR9q5EsrJGfRUMg149Esy5UqRQ5b3HmtJck7skj5UTuCJIkqSSgZOh7U1Kzo08/Hm73ulLiTLyz8a/6tP1kuaP3zQ2a661sJvlx+QkDVO/SubjDQfMtQIQMiKMWMXGQrXizjvVcb41/fosdeqjamLb2ZUEh31o0e9tYkxwRSIg5jSEQv4+tKc7g6WF0D4TU+hUD1lJmfMJ1TQx00Q4yFGQCpG9H6r/GOawlZ/UugoYiq49KS9Jer54kcF7pjfMV2bLm5yHUfYjc4Yqq0IdLl9E8LBx/Psz2/uL1EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrzN8TD5BJROFjQZ3kreDCVGLrpFvl4LkH0QdjSNQV4=;
 b=qNDnyleVd4xUWIbIubwdEGrZ9h34yvLrQy+gvvkMtMXvS85xitTe6CZMBRbDHtV1Vgm84bNcLSOnFJx7XkYXUs5uY0W8PxBFeyjqkAjIxrmsaIUVWBYYOEapKbPjhiXXhHhWOAXhamT97hChOFvkfFQDMJ20aOKtWsZROuURP2PjLjzUmhrGYFmPeyARuXUlxPUU3DAsIM9f1DJ4D1dzUWGAEujvMa9fSzCvUYRIzH6K7Dbk0tooygFJkeZ9J8RNh+l3f82NizG60TrQ4Ft9WCxFJnmtRP/PbDzg8zkagRS8hK0vKo69NMiIR4PTx+SxLKi+oJ5lb5I9OZSsI8I4jQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7)
 by AS5PR04MB9854.eurprd04.prod.outlook.com (2603:10a6:20b:673::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 9 Jul
 2026 10:13:57 +0000
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be]) by VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 10:13:57 +0000
From: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	amitkumar.karwar@nxp.com,
	neeraj.sanjaykale@nxp.com,
	marcel@holtmann.org,
	luiz.dentz@gmail.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	brgl@kernel.org
Cc: imx@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	sherry.sun@nxp.com
Subject: [PATCH V5 3/4] Bluetooth: btnxpuart: Add M.2 Bluetooth device support using pwrseq
Date: Thu,  9 Jul 2026 18:15:54 +0800
Message-ID: <20260709101555.3034853-4-sherry.sun@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260709101555.3034853-1-sherry.sun@oss.nxp.com>
References: <20260709101555.3034853-1-sherry.sun@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:295::13) To VI2PR04MB11276.eurprd04.prod.outlook.com
 (2603:10a6:800:296::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11276:EE_|AS5PR04MB9854:EE_
X-MS-Office365-Filtering-Correlation-Id: b619d6ad-432c-467c-089e-08dedda2c94a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|19092799006|23010399003|56012099006|11063799006|18002099003|22082099003|6133799003|921020;
X-Microsoft-Antispam-Message-Info: v6m/S0SoCZuDvRoUAtZ0y22t/BLDBAHs0DMh+GBJCxT3A7MQRcvS5PCHHCtmDUvfbjfIX3wbkLQF3bc9wKQX4LdWOHOoBQHoaYBLQpnmFEo6FcA5R+/sqv5EzJhvaoG6In5DP7xuBd3D9NukLBOy8S3lqF/Cx/sSY/qOTjpH3JYyH+hjsyubQOwdX/luq6WFUnTuN/NhcoE3n4qkTn+Z0Fw1I9ryaSkXIgbee3/z9ximpy4BK1JH7US2oYrsSCZZM1jaNIuyiEaodrDgvf08KAC00uOjUklTQBIvHOaJQm+PY06B2C0FrSfbVcwbuSZ4sySxZ4PAbq/bovPQ74ov2k7zqq6TKo3lmRaNPqNpkoHeiqH0FfMGGhOkThc7UNc+yOKNscMoajGn0jQyUF9popDzP3NK7b28GfvXeZfL5T+MsujUHDRBslL7Sg5F/AFDGvSSj6F9RbsyGxZdXq+EcuStYg9cABzjQObrUXGy+g84VOO1xTax8d94OQmk+L4JVPFU+Jvo2oVnpxDyJdpxv8+e/yClCDpAgCfWO27TJ9tHwL5RVD9ujmoGZLTUnWQXVpLz7ein1l1yT8uZbBWOzBJH+iTS0zItKxxr5DV+l98QF12QOMuIGOpctlASod3ZG6eVn9Tw352SvrSYjqUEhW44ODJZgLorDBAXIJFy6c2pGnefJAlX+hBWJiPPw651dXBNLyByzzdOy2QeJoISWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11276.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(19092799006)(23010399003)(56012099006)(11063799006)(18002099003)(22082099003)(6133799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KDQEshDLQVQ6/Z38D8guh1WjK3DRclSsV5Y2dVngSSW1Wvv8Y9NGrURtpVLz?=
 =?us-ascii?Q?1FUCU8MWaHzEFzNuNsWDyJRaRhMepcQYiGF6DwH4K5FbTDP/gpCTgXeZe6PT?=
 =?us-ascii?Q?2cmcsAphXopQuCdTnn5ep9HfYFTU0/dgch8383iIOV++wlF39H7xlRoGjVSe?=
 =?us-ascii?Q?l+BbQG5Tx072Od1HV6LP4HdZPj+L2gs9YmvEpwo74ibDJC3trzsKpCDZGEqd?=
 =?us-ascii?Q?uD8jC4TfIyRqqcXKFLwiYyZyO5+FGw2JdpIH2SLM7YnO2YJPMwGX72f5Ec4q?=
 =?us-ascii?Q?waAJM6ILJp0jzOZQsUrUo442Y8iNU7E4RMBTiai4xeG6D7tebhCZ4PlAzSHt?=
 =?us-ascii?Q?RTaL7tKbpIieDtPDlNNWem9RpAV5ebDWQCfxFoRSTzHPkaqJaYOTkcVhCOvM?=
 =?us-ascii?Q?j8Og4ERyRubv7/2c5zBMwf/xhVnRp63jyV2aEJ+dbCcK/9Yskn6fl7LWFcYm?=
 =?us-ascii?Q?83+LvoOvATsrC8brF1XgGzDo1OWcXhAfmPQqxusVWsVyR15MxvJY9g4ZiN/F?=
 =?us-ascii?Q?xYlpyzGLrYz9yeNH/mjAYvBSKlYqs8m6wFZBcS7HJXYeP7HK9sYwQKPNopme?=
 =?us-ascii?Q?X3QLPu8Pykqc9O+jaF1aIIzM+EPeToLqfuIEzMkqbd/sJWaCsf1xmS/fs51q?=
 =?us-ascii?Q?FjpoQsgcoRKPVblb1vjqde/d61ZzDhcL8WzmTVIGDi0WRvBe/Z0f+vLvADzF?=
 =?us-ascii?Q?UyrS5K7fG9Q/ksl35iI4781++L5ij1rOUBR/rANPvpdUjXUU/gLk1eSZJrNf?=
 =?us-ascii?Q?KLJOs4mElUVoo4rOozcW0gXkYwEgcUw589lzUnq0B3z5/M2aGPVaCvu+wWWZ?=
 =?us-ascii?Q?w1+ocMUjuKP13U4jvPykTfqz7vi3t+1o6fJQxtxpSNpODa45Amrpl6R0ier5?=
 =?us-ascii?Q?dONo3vzRsmUnIrmPqIHESTYw7VeyU91VdeJ3KjkOY0hfH5pAsRU9xLr98OJP?=
 =?us-ascii?Q?OVdgxi0nMGCt2EOOKNLis5TfqoehEmsjj/Y5kbOlzZn9Ou5PevXUs4wTT2ar?=
 =?us-ascii?Q?Z4xzc2CRc8biYYyVwclJygBncdNzwhbx5dsd6f1FdQjvc4CHhMepHSWYCl+5?=
 =?us-ascii?Q?SkocJvUevkmvvOgwMt2ZWqt8xPN9m+sfy1E/XYkfkGUi5fiPnme8jnyp18oH?=
 =?us-ascii?Q?UiVUev3965Jb53Gc/kOG/tpD9ZzWk6BAHyP21Sp9H0LsL0VnBnHslwCGoz+P?=
 =?us-ascii?Q?IUy2HkM2d3iAnan3eY3sZFlo/y6dNGWAB17x/KpoQjS8vAU6ibLvTvYi/pTf?=
 =?us-ascii?Q?HOPVwIAQ5WzMDCr6TJbMVF30nYcUeoQcTLFKQWiPgefwnCfx937ssGIuTOdA?=
 =?us-ascii?Q?puTOmbHpWMIHSvEuqKVrOXK08BhADMqKJ4ld6pT593hjqZOwUK6rkJdE8pOr?=
 =?us-ascii?Q?+BrxMdoeV6y0qTo0xX+d+56cftzXkzMYhLQWeCXFLI33c4MYqQE6d5TP03b3?=
 =?us-ascii?Q?jtjQyvsrfbY1ZfIi6G3SxaD/OdgTEv7d7zOqySYEcSBQtHhIiTqpxMhUMVK/?=
 =?us-ascii?Q?pvvCMdHmya/opvY5r8n82eetnrcDYa+DeEITb7fexxTxAYRkl0mdftF4eWjC?=
 =?us-ascii?Q?MoVc1xzJBtQIjAvWDJEE+/JXARv7KIHCIrOU6hefO1pLkNkZJ6sGZLUEdpRh?=
 =?us-ascii?Q?aHm1wPpSHZ1+71QfM75L6T2s6Z7qZwl0L9DwZC95mnpkE7FYrXX0HAn2ujEE?=
 =?us-ascii?Q?1r7CwCstWiox4NUBRvmFn+PVi5wpgZk+q6GOG/kszJTwTYrrKrKnqXm0qU+0?=
 =?us-ascii?Q?mpAoqRNoV73JWKlK5ePqU9hmjBu6XKe5Y/F3vUSKUgGrkD+NuX3W?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b619d6ad-432c-467c-089e-08dedda2c94a
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11276.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 10:13:56.8887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oifRsLCG7RMEbh2Q656t4oHNJhNmuOsEjkkS4hWJvg8AUg/9ThOIh+qsCIyJWfoi6LgkuIApQZ6j4d1RgwnAiiOBsWb+rs422oFzv2o3Z1zfWSqxRJ1d60Aq3rBgV/HP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9854
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_031404_511619_B98BA6D4 
X-CRM114-Status: GOOD (  18.20  )
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

From: Sherry Sun <sherry.sun@nxp.com>

Power supply to the M.2 Bluetooth device attached to the host using M.2
connector is controlled using the 'uart' pwrseq device. So add support
for getting the pwrseq device if the OF graph link is present.

Once obtained, pwrseq_power_on() is called to power up the M.2 Bluetooth
card. The power sequencer descriptor is obtained via devm_pwrseq_get()
with the UART controller device (serdev->ctrl->dev), since the OF graph
link is defined on the UART controller node.

The devm cleanup of the pwrseq descriptor is tied to the UART controller
device, not the serdev child device, so it does not fire when the serdev
probe fails and nxp_serdev_remove(), an explicit pwrseq_power_off() call
is added in probe error path and nxp_serdev_remove() to ensure the power
reference stay balanced.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Hi Frank and Bartosz, this V5 patch adds an explicit pwrseq_power_off()
call in both probe error path and nxp_serdev_remove() to properly handle
power references. I'm keeping your Reviewed-by tag. I can remove it if you
think it's inappropriate.
---
 drivers/bluetooth/btnxpuart.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.c
index 0bb300eef157..68f84c324113 100644
--- a/drivers/bluetooth/btnxpuart.c
+++ b/drivers/bluetooth/btnxpuart.c
@@ -9,6 +9,8 @@
 
 #include <linux/serdev.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/skbuff.h>
 #include <linux/unaligned.h>
 #include <linux/firmware.h>
@@ -211,6 +213,7 @@ struct btnxpuart_dev {
 
 	struct ps_data psdata;
 	struct btnxpuart_data *nxp_data;
+	struct pwrseq_desc *pwrseq;
 	struct reset_control *pdn;
 	struct hci_uart hu;
 };
@@ -1872,11 +1875,26 @@ static int nxp_serdev_probe(struct serdev_device *serdev)
 		return err;
 	}
 
+	if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
+		struct pwrseq_desc *pwrseq;
+
+		pwrseq = devm_pwrseq_get(&serdev->ctrl->dev, "uart");
+		if (IS_ERR(pwrseq))
+			return dev_err_probe(&serdev->dev, PTR_ERR(pwrseq),
+					     "failed to get pwrseq\n");
+
+		nxpdev->pwrseq = pwrseq;
+		err = pwrseq_power_on(pwrseq);
+		if (err)
+			return err;
+	}
+
 	/* Initialize and register HCI device */
 	hdev = hci_alloc_dev();
 	if (!hdev) {
 		dev_err(&serdev->dev, "Can't allocate HCI device\n");
-		return -ENOMEM;
+		err = -ENOMEM;
+		goto err_pwrseq_power_off;
 	}
 
 	reset_control_deassert(nxpdev->pdn);
@@ -1907,13 +1925,16 @@ static int nxp_serdev_probe(struct serdev_device *serdev)
 	if (bacmp(&ba, BDADDR_ANY))
 		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
 
-	if (hci_register_dev(hdev) < 0) {
+	err = hci_register_dev(hdev);
+	if (err < 0) {
 		dev_err(&serdev->dev, "Can't register HCI device\n");
 		goto probe_fail;
 	}
 
-	if (ps_setup(hdev))
+	if (ps_setup(hdev)) {
+		err = -ENODEV;
 		goto probe_fail_unregister;
+	}
 
 	hci_devcd_register(hdev, nxp_coredump, nxp_coredump_hdr,
 			   nxp_coredump_notify);
@@ -1925,7 +1946,10 @@ static int nxp_serdev_probe(struct serdev_device *serdev)
 probe_fail:
 	reset_control_assert(nxpdev->pdn);
 	hci_free_dev(hdev);
-	return -ENODEV;
+err_pwrseq_power_off:
+	if (nxpdev->pwrseq)
+		pwrseq_power_off(nxpdev->pwrseq);
+	return err;
 }
 
 static void nxp_serdev_remove(struct serdev_device *serdev)
@@ -1952,6 +1976,8 @@ static void nxp_serdev_remove(struct serdev_device *serdev)
 	ps_cleanup(nxpdev);
 	hci_unregister_dev(hdev);
 	reset_control_assert(nxpdev->pdn);
+	if (nxpdev->pwrseq)
+		pwrseq_power_off(nxpdev->pwrseq);
 	hci_free_dev(hdev);
 }
 
-- 
2.50.1


