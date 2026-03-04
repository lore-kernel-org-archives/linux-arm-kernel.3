Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF50EFCE33
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 18:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NeSZu4GQR9/Hof4NuDOXv4/FExGVdZSKFnttoECtXNk=; b=P/MW1KZPS8fgQut/O8hbn7B2oK
	5PmuuVi0NL9O0Ws2foHjNreJbCy/M6y6AQZw/9P9AI8D6ybVWQ7m9nT84++XzZpAhMr5+j3vEusAY
	dzc+Woi4+LITv9uXaZhTV7BTgsYFOSsduNc3mqhP0awAvw8m1b2Gi7TdGbBxzW4GnnB+kdmIAU3Yq
	15GTg4Ru3FJt2FPghaQw5wNSXx5VHtSSHvANfOtkFlT6vn8IETdUcMkZEnn6r7e/AkvyRpEoa21gz
	fhaVqvVRTDEjqcx4mn4PNGylLrsFSjppfb9M2EP9pDToz7jsAtnFJ3XKEwEyxUy2RCRl+C4Xz9TiT
	Ew4uubjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqXX-00000000G3q-0498;
	Wed, 04 Mar 2026 18:01:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqWe-00000000Eha-0u0o;
	Wed, 04 Mar 2026 18:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NeSZu4GQR9/Hof4NuDOXv4/FExGVdZSKFnttoECtXNk=; b=mxfS2LifIewNtLPfvc9ocvzad9
	fALHxt3JvcCd0xteh7rLSH8ZSWrSDq9wvLPNjwIkhcV1yzgcbhevQyj0DUESY1yt4DuMM3xeeEhVY
	1sKOFGXPhIfdoOd2zDJcU4VHQNOyFEjRDUGNtNvme8iX6agj6/11ZLoG6uPvNvYrfD6swQvZXFoVN
	D+uJGWDVo1Vc7Qnjue5puf4arwNqjDKsOdfALz4DmaBFXveXSGXADfe6gX/eSboJnILbLYizv+b3z
	AWNd84D3bA4Gl3Hm5BZizo+UMKfrwx14QX3YbJOmAOATIKc2ssuPOP6V51BVqrmfCDkD2c/NYR4je
	twcBYhtg==;
Received: from mail-northeuropeazon11011005.outbound.protection.outlook.com ([52.101.65.5] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqWb-00000005H8M-1LVj;
	Wed, 04 Mar 2026 18:00:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0w/kJesZFkT9RZ5dwXt/WZOFm7dZU3JFsXQY+H5E9Pqr6TNkoIOK1kfJ0fIEspNHe7pIyOpFEJGGFX4bfJzWFDIx7H1GFD2kqAaD77TRuTAWbPEpcANvGRbkr93fbvIQQeGPdh2bFPYsjvCoHPgCkRbypVbDJLnLns/PXDl/NVqWcdXyPCbg2YJ51pDSW3fiSUYT7y86CDbl6FCOX+hdXpnN+eJ06oDNFH/OBr6A4ZRMqx4Mq2acLNmLdWNc3GUv6DECZCX+v89qu6yM48c7z8ZA8lY/qsRVWZfta22nnAp7vkPNb8h2T9Uta/udssVqd/ijmHcswA/LHKluqYMlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NeSZu4GQR9/Hof4NuDOXv4/FExGVdZSKFnttoECtXNk=;
 b=Va598wioovTm/P/Qx6fM9xDK8yJ1N7+1B7BnUQ1S3D0A+wrvVLGSO2tC4ZU58ZGNShmdwM/g8JmHXpKzuIA4hoWx9d4UT+kUq03/20f5O3LGhQ5ZQJIP8pLmj9qVajhLeOvZ+w4WWgqY/KVzTBgZ9M7m0kZmYQL+nCnY/dCrP56/JInQPMoOdQc6ZFNSpJ9NgCAwJd7lvQ4ajJ2DfE4T/4J6KpiAswQUJjfr0PS8REzreheXtyszonTUVcMD59F+ME8dyCQMlUkHw4WwLfqtfH+RzWB6Wi5aXCZx6Bw1w6FTsHRouyvRiF3JpYnd9Fc9oEQnHSsX6bYKIwhnup0OGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NeSZu4GQR9/Hof4NuDOXv4/FExGVdZSKFnttoECtXNk=;
 b=FmSTIzAdGVz9JCPGLBNiq/uWBS8ZfARGkSSeF1OrVa3kU750VPCrnxGFttWijvGiBXRmv+L2dF9uW3SHyqBncx4ef+8ywh9fxZnCnotb4pm1f0X16ZIb3NFBSiE3LHX5Oyb74yfvKArYFRqIWoeuaXDCAh1qfpO5wisek87rCLfDJf9lHFvYqVK+qnVncCStZbcbCswGKZjJqnHLMhofSdvstvOVVLdgUthGWtjBFHauP3hG61ap4x2PRdZRblx27NeNfWa+/gzUSn/dP8Y3nf8dMAK5pNXTB3dFwnWzPeO4JPsv8WMYN2ZGdl16LIxSODfcmxhcNfjKAzPkLS6flA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by GV1PR04MB10275.eurprd04.prod.outlook.com (2603:10a6:150:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 18:00:33 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:00:33 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
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
	Linus Walleij <linusw@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH phy-next 18/22] pinctrl: tegra-xusb: include PHY provider header
Date: Wed,  4 Mar 2026 19:57:31 +0200
Message-ID: <20260304175735.2660419-19-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::19) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|GV1PR04MB10275:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e5c92e-c3d4-4ca5-d1ad-08de7a17ee6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|10070799003|19092799006|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 03HIbIwJyLwgrVpjS8+mtY6I01aujBfJ5prDHFHML5lxOONsUICmPMvsNxoym5EU1OJzcHCW8NGMUK4Gyw8ktREPbY1DR9T8jKsos10MzkVQxdoCEUkosIqamj2O82pjQsaWcaaK+Gw2R8rHd5sqy4MYP8302+JZaEGL1aaEIvLCu8vC7O8xXYPkTGctnmpevX70AQz3Ma7qNaPEVpV+3AkQpVXOe8lsDxhrJCUuo9KvoWwANYy4leQDVkRlnOrOyrHNSYJobAygfuiwcxhxHxXXh7LitFqQGhlc60PCVS5ozDCrxype0PI2tKiUpxepAmIamPfBZgae/UqMoWuQzlXU//WgTOmo9W2/geo4moLHNp+R8JWmYmsm3EePtP7zpxyCBu1nBUswwgMstR0rrqNWKOK8Xt0Th+K0xZQHoEhzSk6/OLRpp0AYA0jzz6rV3/1OSN7k8efeDyxJZ7fDAJXmOaLqBLhaM8Cx+Y8uKX6QWuport9mnKWdemxXCrEP9GziR1DpC2ZpKPgxCAHop9grfOrRZ679cMHnllw31FwAldIlhBSjYaIx/S//E0kVvVgf8/RJw8uDInfltv1S28xKZFLCIUW/6Sh6aggr8oj5LHSn+jpjNtxyp7bLUF0e+KbICz/7oZMPbtLb+TM9ldWQchdgdPBqn0pHMzjHUmD30rGMfZb9cgiR0e71AGANZZrnsxCypuxuvbZOrD3anM6IvU1eppo0A0eQBhGy8G0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(10070799003)(19092799006)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CFZVBHvYBGfSGD22iAyp8qjs8wXNyKz/W0G7HsRPpifDWrMIFqwwT8Ccw+4H?=
 =?us-ascii?Q?T5lIvd9058DFj2yOOq2u8/TRCR6RXWA3sbFSO1+rkY0BZKF1aW/mYnp484Qt?=
 =?us-ascii?Q?Lr1i3cUaMkPqz6LCgcObRDoUC2ihNGAFxGA53t2uBPBeG4meBl2KeoU7TWeU?=
 =?us-ascii?Q?awcWeWZ88/0qhg6MMCgPpj8UQHR+PFkWhLU3zB724GR3I1vyUYw01mncXDiM?=
 =?us-ascii?Q?l/GAITqR/lzXYDZncxXAi+vc2fwoIrXfyAQtKTeFrZOV9Zz2FnweuQNsN7UT?=
 =?us-ascii?Q?+tylfcKlOLUPpbe2MYWGPd2887EwD8EqP95Zww3zkvOJy3pMrNv9bzZOB2Gr?=
 =?us-ascii?Q?LF8siy3JeK+GQOpwLA7ahWdBAY698QjJvqGecPZZJO6ftRHz7RH7v4x0g6ax?=
 =?us-ascii?Q?9IfMYCmqPXfUtuZfQrYToIgh9RJfTx054IE5G3BFrGh3ItXL3fdA9Qr765LV?=
 =?us-ascii?Q?5xFoluWjgsxtMugrUufdq5imyMsVm+iYvI9oUVKAnSYSfNBFJ2XTEKJlRS47?=
 =?us-ascii?Q?RIQvf0t+eR0C59LLM62wd7jCIfqVTQP1OmBpcVw4wTfGykXu5cYYIvGe1YL1?=
 =?us-ascii?Q?naowPUPze3R2O1p6kOAhgbudXxS/SJFnwe9bmlOs99Dw5ASkfja4QoyXyhI4?=
 =?us-ascii?Q?NsGDpd322+ZSwF5+V2ckwAbU82BXEy8gwQXrB6B6mmRFrxm0Fivo3V8ikx41?=
 =?us-ascii?Q?ULprncnLewYPM90yhQ8BpZHgoyd+llUipn0CWXNudLf15IM7CPq72wVITeoc?=
 =?us-ascii?Q?kh4UQw5yZeSH4xSmCiy9ncEkn9eV7begKcE4L4ZgFFqTx6ht20ULAgkCDbxq?=
 =?us-ascii?Q?iUmyYR9I50bySUxQlh4ZqXdPI/rOUUfC7n5M0B+YlUawC+61kqsY9ShHZcjH?=
 =?us-ascii?Q?+Pw6vlAa+IPfi2ZZC+Sk1Q/pfV8EdmvHA39ZLsWeDmqBHO+rfUOawv8v73e1?=
 =?us-ascii?Q?ITPFoE/L82kDw3XZCWHNDE3K76GI5zZK0TKU1JE+tYGO4XEAtBHW1dM1dQ/j?=
 =?us-ascii?Q?6F6R6tEcs3G9n+gw61b2zhIbuZ8zZazR8LdhjHZskj4Q0gTdicDJkmnxX4wL?=
 =?us-ascii?Q?O/bC/NE+2n2LaN0G8Dk/6sudmt/GyorA/ah1rPBVu0vMMHNVEwRbfi5hxef6?=
 =?us-ascii?Q?9ziqXL+fzLCu5TD4zgIAfRtnBuOxviWNpIGJlak8xOsWVQIt0B6Un42f4x6H?=
 =?us-ascii?Q?2GNknqKi8Uz9AWEla8qyElRYJ9IOAoCDLgavNNRMbq+O+1YY2G+j1RhXXBgl?=
 =?us-ascii?Q?/U6DtUsFSWxsROqfMkvwhuYhJpUVsRgAT6MG89sbLwF0FdiKMvIxwBB8dLoa?=
 =?us-ascii?Q?8/kvQIYyCOf6DFMls91uaPDmN5BXLazJVmY6/KKsicHvAiIIUF0lsIZmewaB?=
 =?us-ascii?Q?ttzHmy6gbOp6EUYs/8236kO7kgrktZ8tq0Bk5t8AVIGpdWXx4TAY3NmauRMB?=
 =?us-ascii?Q?eS0moTaDqabUXsMofYbRBd5vTJf3AjKguuX0NUucdttUbKV+bqShgiGpIbJ+?=
 =?us-ascii?Q?FMO+/ojV75GVYupkLIu6My0okCqXgqY3IShpQb6J8bKjVkbtXk66D9a3psIt?=
 =?us-ascii?Q?N+uagfrQXChlCUAe8e5vU1bfewlQle8JcpQwE9k9XVizrPuCEGIyRKM2Gq7h?=
 =?us-ascii?Q?vmCeBtl4mLjmg1ie7kZUsJdszQ0uctyEy3PaHwXNTi2XrtKcZtWghsIiEtY/?=
 =?us-ascii?Q?j0r0YQmMIgvWWX2ESEM/r2xKCODcEw0g06nK9h6sT0YmAvyYuMecB1D2yiXc?=
 =?us-ascii?Q?h6t27UY/hB58kqJBN8GprcJCqF6IUfqV26o8f9dBaZ1Lsd6dDZt56dRKgDBH?=
X-MS-Exchange-AntiSpam-MessageData-1: Dl0qpXTp8WrYUXDbLWiaQF+fnqcQURJibqU=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e5c92e-c3d4-4ca5-d1ad-08de7a17ee6d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 18:00:33.8453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfzF6s1hG9wym8IsbhfqadCGiqsJpnN6bEPqXq/cVwzmU4j1l4Zj/r+3CFsQdjfAdmvU3zzkoTGu3iN0+pMWKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10275
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_180045_440086_6164DE94 
X-CRM114-Status: GOOD (  12.61  )
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

The tegra-xusb pinctrl driver is also a PHY provider (calls
devm_phy_create() for PCIe and SATA). However, according to Vinod Koul,
having PHY provider drivers outside of drivers/phy/ is discouraged,
although it would be difficult for me to address a proper movement here.

Include the private provider API header from drivers/phy/, but leave a
FIXME in place. It will have to be moved, eventually.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: Linus Walleij <linusw@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index c6a51bb21215..6b609bf685c7 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -7,7 +7,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/seq_file.h>
@@ -19,6 +18,7 @@
 
 #include <dt-bindings/pinctrl/pinctrl-tegra-xusb.h>
 
+#include "../../phy/phy-provider.h" /* FIXME */
 #include "../core.h"
 #include "../pinctrl-utils.h"
 
-- 
2.43.0


