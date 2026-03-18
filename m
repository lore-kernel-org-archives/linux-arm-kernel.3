Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771DFFCD0BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 06:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IcBE26oRN13Z1koAZGrMF0Xa6Z3GKMCnfUAz5eLY/4=; b=0EEfC8mNj8Pv/pAFMzUrqVLqOF
	YSWBKkzaqDacCwCwvsVlLa86TeLD4TEqDme66PIf3IdAwo/YOMvaqwLfrHGIQgWwcNSsCD7GbBbun
	DTnkQZZKviKk8uFyQtdikYhAeD8ILsNxJo0T10fJsBkHjaLAP8ONz9isEeTuhmrcwG2Tin0lq3qHX
	N9Iq25FnfWcLF6Sm7kUzHBqJ0w6zmSCW1iV19I69iyzJ+3fF2yxvmHec91A7hM5SpP2zbHDVExeD5
	DEQrTSE1+ROAbMDVC6B1d4U+FHDDLzD/8vOaTA7odFze6TJj87AcmT6pL1NR+gKyBAignMNsb12EI
	H3HdtnbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2kOK-00000007rHw-1sp9;
	Wed, 18 Mar 2026 06:28:28 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2kOI-00000007rGN-1rMp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 06:28:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pcREgcVc0oeKlGcEZ/a66hjcdMXsqGa4yiVg0vWehOJJ8dF4l9TAA9+cN8HDe+KpNTbVh0Hsn3Z7fzbZSQBtr19e9QTHn5Qdu/iQMXbiRaGWcN/aZM4ZhKo1pQRzqxpN+Z+tqG3bBt+0ucvj4OWAKv8BMHdE30ZBRNynli9JHoCechcqZv+eI/GoBdkAFQ/c9GHL+4m6SlrU3F11shbFeoVZ5IqMYHRH8+7JUXxUayH8085mHTO7Ff9CtnHjSMwDdeQorbF2nqaOY8kLRDgWkcdGoxPbeWORnLZoE0U1etmzCRnI5hLBAXXo3xnfbEcyQMUrrxcDYRn1ZXas7lQ/aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IcBE26oRN13Z1koAZGrMF0Xa6Z3GKMCnfUAz5eLY/4=;
 b=EiR1sg+OjxpyjLbhJN6UfDM9RTadkq9JMbCriKUde1B6kzGkZr1XNVA8Mh7lftM4Jry0+8IEBECgbBS0Xt8otOuGK9U/4w8TdXb+JWKgj+vD2iuWzG87tSeqRVPH8sGr/ijXUSrzEJV5c9EGox2vJtiXqdLbbn0lkZLbNjTWhxiX+ldO/jU62JIWJPVPLzEMk6+X8fQ5FD1C/ZnHzybzKMfZU/zy7ArAgEiEbShvq0muOwMwvlVkTNPv/bqb0eKCziOziWbVCQErQkwUG5Ih6jeLUKwbd9C5YjvbghKSWfoQoJOGk0PJXqC0Gadu/z5MtTozkwrQNGRUtfR3PaOYIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+IcBE26oRN13Z1koAZGrMF0Xa6Z3GKMCnfUAz5eLY/4=;
 b=WRLPkRRd3tGzSk1xiSIDcW7KGHcKwwDqsABMc+FdwRIL8IbFhSIzK6dEv1cih2tD1/x0cZF1e4u2eWA9RurWhCLPM/3fdvFfhSZEpj0vQcSa091LRMYu0KcQnxR2ApuALDnehotgRVmtjL+aq17TxHDCiyF2As6HFPHD3ueaJSwyYB6jZF0s/dS9mqZdwF3pSgRWhKpUpJqsrYKh231hYx1UcTTK2/tmCl64dNjm7CaVz9pefO4Os2dVICteSD9n4ERfRevZpZSyuiGVYFs4o0tc9/3L094+vkF6rATigrqIzncPlIFpI6Lsuj5eSFhRYsVMCA1EiS33n3Ekr85HVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PA1PR04MB11334.eurprd04.prod.outlook.com
 (2603:10a6:102:4f2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 06:28:19 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 06:28:21 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	Frank.Li@nxp.com,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V9 03/13] PCI: dwc: Parse Root Port nodes in dw_pcie_host_init()
Date: Wed, 18 Mar 2026 14:29:06 +0800
Message-Id: <20260318062916.2747472-4-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260318062916.2747472-1-sherry.sun@nxp.com>
References: <20260318062916.2747472-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PA1PR04MB11334:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e445e64-e7f9-4d54-55b9-08de84b78cf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|7416014|376014|1800799024|52116014|56012099003|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: ZaWaPICMrYJt1st0fH4In08AIHlIIK8yAHZe6yudJo1T/gCV8xxOqa8toyW+Ln+Rk13AbuPy7h/bhs8r3XRZGuzeA/YONgY3Fkl2AKmSSE7bu3IpJOdOiMf6tNh8EfdO48ijzSKkdbPPzO8YXw4Ao7d2XhfKlxgGLodE2jeuQCWYw8d8HxZZd+vjPAkoiMNPyCKME1XdZHkpftSA1aoWs6ZmIKi70BEly5ttSWrQ3ECPk51i8Nkc9BrrWHuSdYK3qippVU/w77MCg02iVVbNdx0waBpefpN095Fe1J6P7ACn8rZxz7K3nCbbnamu3FEIi+RgMlCafvQbC9YpqnbAtU6imBBEF9j/0jQO2E2FL83iOdl51VnpfaBk+ADpJSClAN0IyOgIeR+Z2VCQAZ0ntr+9ckL5gVrBfYZLJXTzgg/E4o8xAQb1j1TATISyA3u1nZdOm7XxXeWuozXyAdSmTyC3l1lbSH6K7nFDPOci8QYGAON887XcPO/9N61NJn7UCLTRA5Og0jBh8AInPPUAu5SduMuUq4mcPCwXUugUlIcYmIjPVRP4DvCgM39jYWxmD5hQS0kJP6GYGqGHDsbKHiv+J6lxsBsmy4xiawGLnzDnmE9wRjS/DJ0SICDwS0VaiREDNLiuh+bsB3eMqFqyN24emieb7U9kFRdDiknP8fX3/Bs8KNu+FAktLgxRQ7kVUz2stdrjv0K1doGZZm5AC8pBrl1XkTxqvnbrsuO6BpXrle4VD7uo9IwTlZ/bOCpluj8ObxQFVzW+itDVNcHNmnyjWaIM+ChZRdKuwJzUXjAYhrnFvwpW1qyNjnzOUUN9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(1800799024)(52116014)(56012099003)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zM/4C7k2gpvrlo5ouNzeP6hqnUkQWXnr63IdRk/0kwrD2WQefpxkE034n7Dv?=
 =?us-ascii?Q?h06N+2hXGCYguKOL4gOfClyH0SYURB1hai+99sGQ3lDkyE5B2rKG+4YoiFXu?=
 =?us-ascii?Q?NQ3RuTi90k7RrhKTwM+cd/UD/IzVrI3Fyy6OZuURmELkJjCkimXaBozrMUof?=
 =?us-ascii?Q?PacAINFvd+X6SzCSi05QMbtuCtXGYtNs8x/uUsYQzwFs2t5urQmxK8pKPTDD?=
 =?us-ascii?Q?2DjO4iggtDwN9YigodyThqHRqpWRhySqly6sW7f68JOBC76JqQTrxpiaBW/2?=
 =?us-ascii?Q?bgH4hZcBP1PgqIkQCMgStXuRV0IqFd3NvLkw6PvW61A4yGAniXMpn6tQ3qV5?=
 =?us-ascii?Q?FGaVYC9NnGi8Wksu1uEeaurwFNEKTuRMj6MnHavEFT3p7PyQkw7TZw0KElVC?=
 =?us-ascii?Q?zFYkj9SUeDQquyssnCYmgly3EmoiNx/j4dolPAaLq8sTvXIFxpVGU9YIPd4R?=
 =?us-ascii?Q?oI1q3XZWACXheUaYFb09JtTbX/hXNI5mPZyUroUxnDiSjd2Kjoun6N/fqXE3?=
 =?us-ascii?Q?HDe6wX/0lMzV05qqnBbl4pL+vWaLswAJd799EpjBF1ANnSA/jxLMhOGfspoF?=
 =?us-ascii?Q?6srQI+D+5duf3lbipqHI7s1auuxWVLlqJcg37cJxzamK2lNmhu1JCg87NMNj?=
 =?us-ascii?Q?hcsgDPK+iMA1b6Rd8ijTbT8Limh3rr89O37xAcVJo//Hy7WqRGYBivKFhqab?=
 =?us-ascii?Q?i9PyTCJMVA4nuyWdBppcr0RfPVUG1PYIyXUpYBtoZ1kPaMOYUVZw7RRpREyQ?=
 =?us-ascii?Q?mmJ4bNKbgYGJ6O46jrM2CG2U/tGrOR/ZWsyVvaTtjqbWClvzHaj7Oizbakt+?=
 =?us-ascii?Q?IYtzhmIXdiuHd9TK97jnBI973G3nitt1MhGe+uk1JBhV7m1+QAy24Lt2W79O?=
 =?us-ascii?Q?dzaI6N1qi2eykPyqagZJdIgbSQeqsRoAbK0481bVg3fJRDy8Po2rRXdiyNXw?=
 =?us-ascii?Q?rLP5OnMZ3IpLf9RrhwkAIXNczUZKAEOVXjdkhdZR3KcjBwlfZ/YbnMkX2MiL?=
 =?us-ascii?Q?qVhIOlthaurah4ycvcC8SSrFDt+6cHuDgEJhN0iO4wL3YA6EZTrpKJfXzGZq?=
 =?us-ascii?Q?YuZSgjgKC47mHG3T6VpjRVTpXV0pReZpZX66hW72tvjf98uYEHr3CSmkzg4Z?=
 =?us-ascii?Q?1NMkRIYuk5NWDuhdeiQvjDemXGfgLP0d78cpTWR1KqswOTWQ9IQUMGmcaCka?=
 =?us-ascii?Q?/uKpQwcqq9gfludC6SVQB5ROhHDLY/evRh0SAgxYRQx3GTa0YTR9viKQvLGi?=
 =?us-ascii?Q?sNtWWlllEbml3vzbQCbmu4W/ZdfJpBGxCILrSwwWEN7iwrARon7HLDaWFz3E?=
 =?us-ascii?Q?A9wuEcVwlwvi2eDAg4hweVfK24PG6upgi+TRbFPokWksITjbgg3U58DFkmsC?=
 =?us-ascii?Q?KPKnEFosjd4E8B3h4w3n+ZD3ErNp9brhT4wusZmPqMKiMaWy4ldnYYn9Ceop?=
 =?us-ascii?Q?zLvnrc/oBycgFMbzObqS1EozUyS2L+7Rphn2mLVBRFw/MJyJaUOxiytQZR21?=
 =?us-ascii?Q?H+/aYKPYTlbuwzwpikT/vnQxZg5ZatjVV2pht8e8LhKluEWHMvfzxqoAfhAh?=
 =?us-ascii?Q?Ojj92uarw8siYe4iQEUkTT58UyzWXBi7FtQJy5ezjowXxnamDOWEGZBFJa15?=
 =?us-ascii?Q?foBETojUmbMF+nMKSWOlJIo9iRh1/Zba50pb0OoJEDAq/v7RfduiYsWWrPwh?=
 =?us-ascii?Q?dQQNMewUEdLB8QrZDg15XH8CyrquPHpptGH/h8geLJDjh2vwTfLgvVDEkehb?=
 =?us-ascii?Q?4BqdI+W15Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e445e64-e7f9-4d54-55b9-08de84b78cf5
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 06:28:21.2607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDQOyeE8sOg4LM59gfAQbC/5FNyXRXW+shMYFdUGIugjZotTbHVuOmMTkxrZHSkFrMuCtkSOI+ZnqRE5dCXaZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11334
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_232826_482267_6D226894 
X-CRM114-Status: GOOD (  11.02  )
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

Add support for parsing Root Port child nodes in dw_pcie_host_init()
using pci_host_common_parse_ports(). This allows DWC-based drivers to
specify Root Port properties (like reset GPIOs) in individual Root Port
nodes rather than in the host bridge node.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index a74339982c24..9608f9fcd1b3 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 
 #include "../../pci.h"
+#include "../pci-host-common.h"
 #include "pcie-designware.h"
 
 static struct pci_ops dw_pcie_ops;
@@ -581,6 +582,13 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 
 	pp->bridge = bridge;
 
+	/* Parse Root Port nodes if present */
+	ret = pci_host_common_parse_ports(dev, bridge);
+	if (ret && ret != -ENOENT) {
+		dev_err(dev, "Failed to parse Root Port nodes: %d\n", ret);
+		return ret;
+	}
+
 	ret = dw_pcie_host_get_resources(pp);
 	if (ret)
 		return ret;
-- 
2.37.1


