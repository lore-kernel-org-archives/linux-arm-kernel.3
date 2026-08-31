Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13AAC61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 08:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijgdjC7bleh4kzyI3/36HTlGRXBtrgfjXmuoYQinttE=; b=eZ4K3XpI+ANPSwjTbXDkvFCSbH
	ao2vZDnbE24Y3NPQzmF5OJsODWoHmLiZzloC8M6qAAYLr9t/gCpAjXY95qagyxUEfYSCWwgG8IkvB
	1Kn0tUZI4VcXhSPnUshMQYprJWyVW4gOlU9qC+yvVaT0094BNvBXljF+yLdC5MCdcGPJ6JLY6Yxq9
	DR1wyJG3ZV+0eC4j/aLsse6VvKey/2uU3jcqlVCuwzRHsGZpe9oPdJQMNgGY1Bynyd8GUNLuMP+S5
	ok+/Flke/B9NU64YNkDLDll1tN9G84CST5vGU1UR6C6XetizPJrwJvKPaAxqd1LdTonLEFJTwuwjW
	OZyJ/QjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xFH-00000008pT2-0HP3;
	Mon, 31 Aug 2026 08:19:59 +0000
Received: from mail-northeuropeazon11010031.outbound.protection.outlook.com ([52.101.84.31] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xFB-00000008pQ6-2UtM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 08:19:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tv+lbUtORKz8vkk2pKztZjJiHcie/ZW26pPY8/dxn164wtlg3TE+w/KSKy8gtq0ixICIWQesTfibULh7fTyVcYUN28liWbJN7z404aaKGQzcOucoClKCB28YwcSZjdMUOGegarq+LgYGDWmx8vx9hLofWbm0TTbnTZ2X/FdhIxv85OimCEUL5/vqmxlDZ1E+99O4l4dhabsGkqezVCB+Iy+vYIpEdp8QjtfEAEa63Ne1ePWVc7fLpnn1W3AZJ+ltIO9xXr2VeJ9eztIF1HckdFxRJLbx0zB/HMd0T/ODcIj7oDGnpeKIkxh84scFsWSr646nahLtPF1+z6klh7Reog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijgdjC7bleh4kzyI3/36HTlGRXBtrgfjXmuoYQinttE=;
 b=eCio4qNHGKEcmD5NpqsujSI3FciS0ttx6fst4unuGpOgyvUkg/MrlFkX10tX6zpttUAraH9gv0eA86G7ow8ukjfFK4PkthLbswLc1LpIyzQUupSI0TXDLjylKWVwD9rd4KWLkp0q0afqiTLU68kWdj8JGZjr40Wdahcb5YyTfZp2Qtj8i3FO9PuX0knyLykcjxSKVzsQn6E5OkD9xsxXe393X5LdE31oqfODimQ4klOhFZSgyHUnFyJuhssjOjEzrSLHfVKqo6UwSS61mPdltRTjztyjgFbI3tYAE+lYJ++S+72ss9MSIHt4x9VR1DuRFbN6Ud1dYLSPg2kpVElpLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijgdjC7bleh4kzyI3/36HTlGRXBtrgfjXmuoYQinttE=;
 b=TDpIOGQwDjEvlBQXjVvD9/8LRpWJ61cOWqHIZsmha68+E8Q2LrfO4Uj99C/4PC2wdkwZhn85MK0bl8XGpgpSjijycTtO2QGaC1FXXBHSmn+MJXIhi+IR56HGu/Ie7KIpOpeRmtlJsnQubtlvo8tvJT+c2+HJwmf+HvaKrT51/q3M5FuEx/VKolt0wRSYs4TNiupFNDAQfvSQa+6im0hlbGGGwlkJ+sGjyd1AgwqUDm4gjE1TDuDgKMF1jEjRU4mujZ4kqjA/zig+E1uInGtKKYWO5KGE5jCIzyJ/oW9o9wxFZkyNxEldljuKl0DAEza3KP2ZvWnFFNYxkUCR6x7x6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 08:19:49 +0000
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74]) by VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74%3]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 08:19:49 +0000
From: wei.fang@oss.nxp.com
To: xiaoning.wang@nxp.com,
	andrew@lunn.ch,
	olteanv@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	richardcochran@gmail.com
Cc: wei.fang@nxp.com,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 net-next 3/8] ptp: netc: export netc_timer_get_current_time() for cross-driver use
Date: Mon, 31 Aug 2026 16:23:30 +0800
Message-Id: <20260831082335.1184605-4-wei.fang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831082335.1184605-1-wei.fang@oss.nxp.com>
References: <20260831082335.1184605-1-wei.fang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0102.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::6) To VE1PR04MB7216.eurprd04.prod.outlook.com
 (2603:10a6:800:1b0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:EE_|AM9PR04MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: a0b5df19-7449-4e7c-f550-08df0738a01c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|19092799006|366016|23010399003|376014|18002099003|22082099003|11063799006|6133799003|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info: 1OXf2T/Am0QuGtiQlLZPbQ7CxGAb+xZ4YzOiBSMbu8dqAxzhSwwTLUQDwkkHst0quIgdI9bzJ1jCfApOKVXMXipMxqVGnFN7elRVm79If+wlugBvcQbYkGX8f2S2hnGKcRVek6YBnPjsilXq3mjJx2AuPb1haDSf6K3np1MO6eFA7LQ/U/kbW6zBU1J2yOIQxYfWF/YCRgjMDP+6QIq+rTKM4EdKN2L+Jri1OXY5GmAp4NRI8dkJ8qakvoA9lsaUDeO1ZujgCSIT8BZO4Zmo8MXkYo3ML5qJQb49yJpgDb0fowCe2NWIGR9KdSdSspOZGkeLf6/Dc7NS6ZG/UGMrkex7+KB6lkJnxvrYoL6aYoqUimqHbMfXc/6B/omt4tce97Ip3vH/ux+p3KTUW1Z/ftz2X/uMZyAvLxh7MiF12dCy05mFaeJipXwECC2K8QXXw3Z1/s/ETl6CFKYDg+6TFIFDFTsrEoJERcsHTtfP6rRvtBzK+z5zek2YzTe7F6JqQboLW1CCFnvZ9e1pC63vv2HXqP2MvpVjxUtQqmd/0h/oetAi3vsqcMkMSN7Pcl/whqe172JjEdMyxWtqCR9wuVdnbKGAn+Pi7OOrx7yP7+wDNSbYJHkt7FQlQcRgHXZXxIZKh25o0Kgs6c/foYgYCzD3rIhkYkJpFyCaNksNWYZfg147zJzorWosr9Ei/XWE+UhEwSv+8qadkQaWn/XtDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7216.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(19092799006)(366016)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(6133799003)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dPPUT55oeocYAAA+5OLaFTRbvAgDrmkcVO079rWO9KAcLqvr1/edBreKSHYs?=
 =?us-ascii?Q?rP2FXqfquVgPwzvNbdzppWBtRCJRr1L9RO4p0qnBOx+N51x0JPc9EVd3yaMp?=
 =?us-ascii?Q?/Rn8q+anRxWniT76U5rHS+6f5OLEGtdzc2YPI+GCnPyDSXq46hYbrCNriO7Z?=
 =?us-ascii?Q?bFfh1ViTiGkdD9zbaNGZaipDP2G/d/0E9VwrQ9d4XMh0EoG6GyhQ3DwcgFW+?=
 =?us-ascii?Q?nXhFxQJW4oIe+j4KAKUcM/XXwB+7HA5S1JJtUXR+VxQfv0YnwQyFfR1mxKA0?=
 =?us-ascii?Q?VjevHyiNwMSs5Kh9kZ5rDrKYHCJMU1oTC6Sid2MS7yw1OJueSYLGwikpg+lm?=
 =?us-ascii?Q?uKzXy/irmCu0HrhbOtaoRqimH51GTKlz0ST/lve68WMWiPZJltBtDvwhgcq8?=
 =?us-ascii?Q?j+P/fP2s2DRxUiOIz4QvFxXC3TeyEWtGpXcO5dwiuc45V7DxCM2VWJRCLh1k?=
 =?us-ascii?Q?VvfhH+V9gCjNVlfSEz6nXqGmSwWFydst2VC4mgHu1qR2UyLU0YBySYNmmbk0?=
 =?us-ascii?Q?Tjj08uWMqrEx3Eo3CeCBR+y7a1KnVbbf9dxWXvufpSztf5c2GrX6RdrvrpqZ?=
 =?us-ascii?Q?kgdgAt13SDMLUq9l/BJFLKREE6RtPSWWOQmJyKLfuSVKbR+xF5NoBMKvIi4j?=
 =?us-ascii?Q?UYfdH0HPr4xPaa6tLlgVgMzdZWZnWZMZfR+R0+2bvbxKhCdiqKNA0WypT61W?=
 =?us-ascii?Q?sGzNMDBEOTEeJce3jBUJuVP0/+uM27l6WdcgqxuHRxxGkTaO+oXjEZHbKNQO?=
 =?us-ascii?Q?YxMQ0n9fmzdKEw+VwiTXHQtDMrzHfOwfGjDM4yxpcEtchHjAVaZunwu8W73X?=
 =?us-ascii?Q?eco3uUmkDC5NbDoBEAshozh0PCCyaoi1gWb5JVTLKey9+yhTNK6LW0cX0QaP?=
 =?us-ascii?Q?O/FfbMmfLwJ3/hmFJtKWlZo60av8QmqiUeJi1cCzZv90/tboxAaP6L2qyd9l?=
 =?us-ascii?Q?LAzOi56meuk2Fb/bk7B2x8vP5LLBqi0R40dY/iYVu7qBqgG/gj0MEO/uxDH+?=
 =?us-ascii?Q?qwtbRy6/UWJZzfJBLpilePqVs2h7usQTMOXkXE0ep3d2PxT4FdOFZUuDRspL?=
 =?us-ascii?Q?gg6tKAzDjkcoEJmdmyruZXPsTwgHZDmSXpx+7KOdpRXLIfUJnG/76ITrXOue?=
 =?us-ascii?Q?dlyehPEiiZUT/47L04SMUMcWnsdVSkN35KqNkqf9tBR3RMwLRI2KeoATiT5L?=
 =?us-ascii?Q?ZBoJkhiUBSwZzJR2PPTQhBX6HvcvPLNekEl/d3qIV0SUkqD6JCahVGE7Mn2s?=
 =?us-ascii?Q?4I5Df20tor86Tvt7YlMUwY7JtJauDxexZ4arcXpc5+ce/PS/kppAm+FBytju?=
 =?us-ascii?Q?BjY83nR6QZIqEBbMnJwslNOt/Z1zJ4yftX3vTRWveFtx5lFN4nl4nauQFUNC?=
 =?us-ascii?Q?dPMl+0tEhOW4u26bgV0qI32cqgsNvrbtk3DEOwQ3TGblQUUuwlgKN2t8gncW?=
 =?us-ascii?Q?bo6vxI94gB6frc9msrJ5N17DtfwqvuFBudwsIqBrzkHf/KGsratjqr0KtkV5?=
 =?us-ascii?Q?SMxqFH55v0Yy2Qfdws+Nbc4Cd4Di/Qq/dtNpxHfAc0khfL5CKLZlwRHg9vgC?=
 =?us-ascii?Q?zCed26+Cyugo6veqJPxERFOVkabUj4stkMXuAUHlI8nlCZtl9cSgEe77rV0x?=
 =?us-ascii?Q?EVVo4FoI6RhUC/nqwJztHb5MElWKOAg43+lfA0H1aLEGE2nJGIM9Z3YhHs8v?=
 =?us-ascii?Q?HV9ifjDoQYe3xCBwn+6J2xwwvQcfEmPJfrKB7npwcrXaa41nIltYYOHufsxW?=
 =?us-ascii?Q?2qKWFm2NjmudzIgTMxa7sijQX+YKDYcjaKjTM9xKK2NnZaafSfSo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b5df19-7449-4e7c-f550-08df0738a01c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7216.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 08:19:49.7099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zy8setQXnEUOGzGy4/Wf1beJJ1GvT5KOfnJGkWgYA2YsVdCEedXsL6YeOg2bVEwW5RlrRxzvw/Gd4/54xZNGPpZGtlxN4S6+Qmk6fdk+Hc4NMPQ5FYiM/pkXjK7K5VHe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_011953_649912_2B5329E2 
X-CRM114-Status: GOOD (  20.55  )
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

From: Wei Fang <wei.fang@nxp.com>

The NETC Switch does not have its own time registers and must obtain
the current PTP time from the NETC Timer bound to it. Since the two
are separate PCIe functions with independent drivers, add
netc_timer_get_current_time() to the Timer driver and export it via
EXPORT_SYMBOL_GPL().

The function takes the Timer's pci_dev pointer, acquires the per-device
spinlock to protect against concurrent register access, and reads
TMR_CUR_TIME via netc_timer_cur_time_read(). It returns an error if the
Timer driver has not yet probed or has already been removed, allowing
the caller to handle the unavailable case gracefully.

Hold the device lock around pci_get_drvdata() and the register read to
serialize against concurrent driver unbind. The remove() callback runs
under the same device lock, so this guarantees that priv and the MMIO
mapping remain valid for the entire duration of the read.

Move spin_lock_init() from netc_timer_probe() to netc_timer_pci_probe(),
before pci_set_drvdata(), so that the spinlock is fully initialized
before the driver data becomes visible to other drivers.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/ptp/ptp_netc.c          | 52 ++++++++++++++++++++++++++++++++-
 include/linux/fsl/netc_global.h | 10 +++++++
 2 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
index aa9be8e2a630..854a206b6c5b 100644
--- a/drivers/ptp/ptp_netc.c
+++ b/drivers/ptp/ptp_netc.c
@@ -798,6 +798,7 @@ static int netc_timer_pci_probe(struct pci_dev *pdev)
 		goto release_mem_regions;
 	}
 
+	spin_lock_init(&priv->lock);
 	pci_set_drvdata(pdev, priv);
 
 	return 0;
@@ -968,7 +969,6 @@ static int netc_timer_probe(struct pci_dev *pdev,
 	priv->caps = netc_timer_ptp_caps;
 	priv->oclk_prsc = NETC_TMR_DEFAULT_PRSC;
 	priv->pps_channel = NETC_TMR_INVALID_CHANNEL;
-	spin_lock_init(&priv->lock);
 	snprintf(priv->irq_name, sizeof(priv->irq_name), "ptp-netc %s",
 		 pci_name(pdev));
 
@@ -1021,5 +1021,55 @@ static struct pci_driver netc_timer_driver = {
 };
 module_pci_driver(netc_timer_driver);
 
+/**
+ * netc_timer_get_current_time - read the current PTP time from the NETC Timer
+ * @pdev: PCI device of the NETC Timer
+ * @ns: The current PTP clock time in nanoseconds, returned to the caller
+ *
+ * Reads the 64-bit current time register (TMR_CUR_TIME) from the NETC Timer
+ * device associated with @pdev. Returns an error if the Timer driver has not
+ * yet probed or has already been removed.
+ *
+ * Context: Process context only. Acquires the device mutex via device_lock(),
+ *          which may sleep. Must not be called from atomic context, softirq,
+ *          BH, or while holding a spinlock.
+ *
+ * Return: 0 on success, otherwise a negative error code.
+ */
+int netc_timer_get_current_time(struct pci_dev *pdev, u64 *ns)
+{
+	struct device *dev = &pdev->dev;
+	struct netc_timer *priv;
+	unsigned long flags;
+	int err = 0;
+
+	/* Serialize against driver unbind: the remove() callback runs under
+	 * the device lock, so holding it here ensures that priv remains valid
+	 * for the entire duration of the register read.
+	 */
+	device_lock(dev);
+
+	if (pci_dev_driver(pdev) != &netc_timer_driver) {
+		err = -EINVAL;
+		goto unlock_device;
+	}
+
+	priv = pci_get_drvdata(pdev);
+	if (!priv) {
+		err = -ENOMEM;
+		goto unlock_device;
+	}
+
+	spin_lock_irqsave(&priv->lock, flags);
+	*ns = netc_timer_cur_time_read(priv);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+unlock_device:
+	device_unlock(dev);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(netc_timer_get_current_time);
+
 MODULE_DESCRIPTION("NXP NETC Timer PTP Driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/include/linux/fsl/netc_global.h b/include/linux/fsl/netc_global.h
index 5b8ff528d369..d4a26c17f99a 100644
--- a/include/linux/fsl/netc_global.h
+++ b/include/linux/fsl/netc_global.h
@@ -6,6 +6,7 @@
 
 #include <linux/io.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/pci.h>
 
 static inline u32 netc_read(void __iomem *reg)
 {
@@ -22,4 +23,13 @@ static inline u64 netc_read64(void __iomem *reg)
 	return ioread64(reg);
 }
 
+#if IS_REACHABLE(CONFIG_PTP_NETC_V4_TIMER)
+int netc_timer_get_current_time(struct pci_dev *pdev, u64 *ns);
+#else
+static inline int netc_timer_get_current_time(struct pci_dev *pdev, u64 *ns)
+{
+	return -ENODEV;
+}
+#endif
+
 #endif
-- 
2.34.1


