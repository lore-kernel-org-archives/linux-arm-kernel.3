Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B10CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 07:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbj7KMFOecHJ2qDwJCN87Tph+T0NsVu1XNu/Fp76H+s=; b=ZPlH6iy8hgwdulZm4HPUf37rjJ
	KlzIjpbCXVOETR3/I6yorxC7BCw0CUkHqJQ1feJgcGhhuulYWrUG/DzDL57luY8/KyCpNp2u9TpG3
	54TlA/meOGI7mlk1H3u3rXX7e4p9gvBo+0MHVRW/1LwWoIqvkwm0mgoulPVy63CjolxNqglZdR0mp
	K0OSRHdXmn1/aToMJhHQMcBAhNyHnTRdpfk5PTfywYXbbgUN8sDdvpDtFhPJDtEIj7YcNWdegbKVC
	Wyhv0LDiqhHbNq3mWOZHX8ZQU5IueNVkaql49I2QTyhQ3Ta1I76aomrfSfFpny/M/UkfnoqUBdzbF
	cjlZGJIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1JrS-0000000FjJB-1uLB;
	Wed, 24 Sep 2025 07:24:22 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1JrQ-0000000FjH4-1veh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 07:24:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQvDfZnL8x0fH5bYZT9mjgeqkc1gBr/wzl9ABp4nWKESWZx0oDvxNi9keRewap5mvAFUj/anSyF4MIHwcpIYohv1WBL6+FtKM1m1yX5sGRYopucihjQ+zdVT3K42i6EtD1zkgFs3pIzoRfKMp+7bK4IsyLySpb8oD+oX5Ahqap8AzyZ9kfCb73stYD3uksbiX49F59s+rHXshifzI9W5AdjVOmWmR7dLGKrtg8Y0iLYtKCDSY2/h32sqIhCwLLFr/bgmqDjM+BVEhg3HYeJGB5COOjbnS525+zqa7KSZCRhzq45hLUpthfP0ZStMl0Q4mPUQ4arde78RA0TySSZhJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbj7KMFOecHJ2qDwJCN87Tph+T0NsVu1XNu/Fp76H+s=;
 b=CAeEdyf13r5oGK9UhNrRY/EFV4ok+JoiOSPxA/IlwswqSKTe5sF8sf1rccS61jsATo+8N2QWXNw8AMoZFPTtpAjWLhK//4vfp/g8akireLZn46B6Xrr15IGDgSDZvqMNe2tJRcAwpzOJs9PO90/ocYVs3yi6bcCLuynNn8YSpVEHXlelPVwKRM7CIe2UITTmObOJ1D4Rv3QI3n4lPt34GikU0gUlIEgm1CUiDSOa7m4d6DBDB9I4WcOl7cygC4qROcOH+uwVsNSmtaTJSdfLv9gtxIfm/eNcRbaCpWjeamHthZYP+UkrRzYyIYngVw6Qc6lUeoa4I494F4l2oihkeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbj7KMFOecHJ2qDwJCN87Tph+T0NsVu1XNu/Fp76H+s=;
 b=CligES47uGwR3g9ZwhZGzNc3RM1gyQBabiBC9ksQbnHodoi9ck+7PnevOQ1I2ZA5+xUvAB73vgtgbfzdZJ5mnwFLveMQmlmDHOBk2D/eocYiYr3VIUWAiewhYUq4YTbYMCt3RsBMf6flh5f8iD1dbBm7lZOAUrrLQLULxs2g+SVKc6n328gRT7BMzvJ1wiois3sFEd3DngVicbTCqHUmGcDyrnLgWY3lD+iXQVd1B4dFPbFUa4WnpwObnsmqUDpJtBzWU1Qma+Iu0Hh1GfO+VlIV99ubYHja85+InZikgTlbQT9+9Twc5LokzwWK08FVqpcqZ7GEiYIuHrs/yQ/X4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by PAXPR04MB8271.eurprd04.prod.outlook.com (2603:10a6:102:1ca::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 07:24:12 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 07:24:12 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	jingoohan1@gmail.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	stable@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v6 4/4] PCI: dwc: Don't return error when wait for link up in dw_pcie_resume_noirq()
Date: Wed, 24 Sep 2025 15:23:24 +0800
Message-Id: <20250924072324.3046687-5-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250924072324.3046687-1-hongxing.zhu@nxp.com>
References: <20250924072324.3046687-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::12) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|PAXPR04MB8271:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fa8be6a-da01-4281-4515-08ddfb3b5bfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YFus7Z3q7kv3DgusTzJEkXdQXH/sz6ke20+E5T6oKPbbFmK6NdIAnuAiMgRm?=
 =?us-ascii?Q?mmv0DP4rQ0QRqFd9uQS0lyZY+tBex1e9x2VR5OzoXaeut2QInLs0fgLIZRbI?=
 =?us-ascii?Q?qnUv04/Fh8qvWYrW6Kwlc8R1BuJqXSeQMpPsCl9jWaIE51QB/N5lsm4i9+h2?=
 =?us-ascii?Q?yKvPEiHbK5XmYyy+J4dli3zXg7jNaSrV2WuZRvHjPNFvmaPhTYa4x7wjJ+PP?=
 =?us-ascii?Q?L7wM8bUxIabR67OT0bPTFhf6X0Km9xLYPl8jqK6Ay4d+mg7YqI4mi0GU8RJR?=
 =?us-ascii?Q?3OIPgU0qPEvFuZgN+KkB1sywQ+o37mJyJIibyQVzMGfOGiuL55ZWALxiEH8j?=
 =?us-ascii?Q?/bVDPUgqwT+WzZj6WaQgXtuc3Mf00rDxULWMevLbRjixQqjimc/170GQHbz4?=
 =?us-ascii?Q?uPR+sM/IZd/omJ5v7xvPXcVvCXKjjH3NUT1zYlcR5QTcfFkZY+Fhx4jplG7/?=
 =?us-ascii?Q?5W9QPV1yvHMxdiLE2zE81HBDHLsy54SvJGYFESrbBgK7kiO98j2ShTSK7TMb?=
 =?us-ascii?Q?K4Zz+Dl13GuLhL4zahCmIEg1DnWE5I4asY5relp6oco/xN4ZIjKxwYeiDAiH?=
 =?us-ascii?Q?uyTdQ0Zg8yzYaCYH6PilDhGPfB0onO3B2wAXsCrNqT46wapxzXz7MbuD3RWc?=
 =?us-ascii?Q?i45proV4uhwYHJ0VyJwIVKr4N9qyrKBpmNuRjU17tr9EzOPLpLgFK/funoQk?=
 =?us-ascii?Q?mkq2jeMo/XFkTjSe2S+eKOeUIpMY0L46mGq+0/TmskoCN0MhgPpYI3xMVvok?=
 =?us-ascii?Q?KdFzmKfuARKkH8zAy8XGzNCQKT0NwiidVxdoRtC72ETFsPUDGT0Vipougdy3?=
 =?us-ascii?Q?7Z8P4/L5SI3JVT8SAUdquV2CEzZpe68ojbsYSqqmNXKDN0iWvEkgflRQK6d1?=
 =?us-ascii?Q?PrVQPFBMp76MNF+EB7nwkWMeD8zmvGw+0JDuFqN6pdZDshpAkwHb5WrU+gxd?=
 =?us-ascii?Q?3CZlBmuGT1y9qHqcN2wYgtNN9SQJp302rKw86h1PSs/5p4VuUlN8JDvUUoh1?=
 =?us-ascii?Q?lKHEnpJ0vO3Ff3k6CYovE5lcjXCIlU5zaK0B4NLsQsqcBYBeW0Zfz8mj8K7E?=
 =?us-ascii?Q?gyfQz7t3LrVCl0qv+VtwPTk0fQfDDOvnmwASEh0B29R4I1hmqDFElgLMXFv4?=
 =?us-ascii?Q?FpArumRtknJKslZ/nI2BLWgHv6RDB/FE8LtKvePK14ZqCOryc7wrTZL6eFKL?=
 =?us-ascii?Q?jKHi2im2A/LTX9Yfoi8EOOTbffJsgx5lH1OyujhWhszkzAYds9YzwVutUV3U?=
 =?us-ascii?Q?F/Qgq8KohLUKN+MLIWdIvqdPiXtFWzgCa+AdHpiX6qbQ9oHd5kESL50iCRcX?=
 =?us-ascii?Q?s54jNvVkGe+eP0VWiflW44pGtKazubkRlN0vA2tgxkH/rzxiLkDSoSmbcptW?=
 =?us-ascii?Q?T8Za1MQ7Glbjy+j4nSg6GWChCVD6FZ8q+KuRrvSYoaIkKwuH1FwjM1DZ2huA?=
 =?us-ascii?Q?J/PeIrW328WBnlV4wugNnx2OjpajaO4sugYQdS9nWpOEKKr4nnw+C8NJFI/T?=
 =?us-ascii?Q?rX2tHByY/o2Gzr0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VK8Bwi4y8oZ5GYOfL63j2GiYI7e6L21VqKTUYjOr2VXbxtfGz9G8Bp4vpdvs?=
 =?us-ascii?Q?sBC7AoMq0UaKhf/PO0YZmAYSKsNN5zUoQR3jm6+FGhofYzl++u2I1JFszBNj?=
 =?us-ascii?Q?UP8VfB/4rQiOz4d+J4f3FaqfzP7kOijkOCSipTacvsjh2SU2/Z3l1e90XVkD?=
 =?us-ascii?Q?WWB9P2nZ01nfeFsUKBwEmSAJNe+oRnIXwFSh0OwzUsCds+vLBIZCbsdhtsB+?=
 =?us-ascii?Q?NPTj4PPwJKz5jNGVFld0c3Hli7nW48v1638+4vUZPxMNRuJRp4DCxdKBXO5e?=
 =?us-ascii?Q?KGjhkgVPnNZ20/8ajv3hMrayqPTN49kWFs8mrPvid8v5ZpLCuD2JvZ7MAb6m?=
 =?us-ascii?Q?q9lCRDQ3WpuYtllXGpfM1vg/jOdAwLj8JWQloEUTcJ0ZOKCtt+f8vPvps7dz?=
 =?us-ascii?Q?N9qI8RcWI70mr52LHwdCQHeSph5p7wxJqeMLmjWlwiuVXnt0wK9wRL+SWrfq?=
 =?us-ascii?Q?+YuAa9e3nYh7dxhjh02TyaTOCUjNGilaSm0xuDo9JujMnE0A/7MIWpzBAVF3?=
 =?us-ascii?Q?s3PR8IIniFEZa4X9V/8jiaoAhAvE6VJeE9N4TCDuguOrq25zkmwK/qtXIfIs?=
 =?us-ascii?Q?NPVdVGDlzj5OjcSESgfynqsoVvkRYiZeA9YD+N3j3NccLwq2hazRDKD85hRl?=
 =?us-ascii?Q?EA/Stb6goQVo2gRhCJS2umhhRV79Q5Kgg+caMn9cBgbGZvjqsKt4zSNoFIfo?=
 =?us-ascii?Q?o2zYb9PoBOSBYyd1kAcoGkjJyI5vUcVsNHxByPXTFKFHCyVMXUfl+t0c85Eh?=
 =?us-ascii?Q?YeKJTzZvGxzjWi+CZmi4qhDvPGMov35AY9vcgFcLckQHf+vmp9J/BRVyiBWn?=
 =?us-ascii?Q?1V9p5tkQyoQQ83s09sA4JdK2KiAXhmO08LTW3WxXVbrXWRjVA2sy9WaraFcW?=
 =?us-ascii?Q?wskD5xn6Cn9xHTSMuekSjaE1wawIq7EUJr0zMxv31fOI2ccRmW6nJnfvJh32?=
 =?us-ascii?Q?3Qztr3u/8a/qDpbQvdqBtnYSe7SwExntcCQhFQ3xLbAubPgsPsNN463JSZ4c?=
 =?us-ascii?Q?MUwTZXYH3YhCIKVLjQnbWqk8USuavzwcOWGH3fFvTs62QeN4zND2dPJLlYOx?=
 =?us-ascii?Q?LCenZuuoNmM+8T4hpWXqbSM7hYPO94SZ+5Arx3f3wCN8HPUc1Q9nOVlCqOYG?=
 =?us-ascii?Q?0lIqfgnBqOwoc/2jhh8gUl8QVaYpzFB4ISWS2qeQjRHKqwoRLNeX2yfJFHfZ?=
 =?us-ascii?Q?Z0EIrgue+xRp817q29Y6kIEN9BYssculX0RP7IMv7HgriKUbe4pwseVNasIw?=
 =?us-ascii?Q?mcORgOozL+BCczN0zjWKbqslsvslZGQScUP+/xcbBmb+ge5yn2iZ5VMTEDKE?=
 =?us-ascii?Q?hy8kJrGivXwsZcVAycoIsUPN94HXUROquNBk0tJbK3zAseSDoPipmhdeN4cp?=
 =?us-ascii?Q?QhEHKzj+kTNTRlo78G/HTqb6okOEHZeeW0FpZJSYEHJWY8FuSl3/iBe0lO/E?=
 =?us-ascii?Q?2t0sY58LsRG06NDd5n6QKbdJ+YXWBESRHwrsske/y7BlNzf5KVKjjff0YJNS?=
 =?us-ascii?Q?LF5MAg82YupvFk4y7KMt/T/he2LNtY/fSWB9z2j4Sq7rbPK7sUqLsnra83JQ?=
 =?us-ascii?Q?HZyIJ/0CL9cTz8PlUotdeQ8oXxxWHmJ6k546aBXN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa8be6a-da01-4281-4515-08ddfb3b5bfb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 07:24:12.6781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FEVHPRTxnnhFYQQODp4jUo+weiZ83yf40Mk+Xi3rGtztUnRQKkappe1sO92GGHRKIiBjE7pzmMw+LNZp2ZzLhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8271
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_002420_504094_3E7C4C5E 
X-CRM114-Status: GOOD (  13.15  )
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

When waiting for the PCIe link to come up, both link up and link down
are valid results depending on the device state.

Since the link may come up later and to get rid of the following
mis-reported PM errors. Do not return an -ETIMEDOUT error, as the
outcome has already been reported in dw_pcie_wait_for_link().

PM error logs introduced by the -ETIMEDOUT error return.
imx6q-pcie 33800000.pcie: Phy link never came up
imx6q-pcie 33800000.pcie: PM: dpm_run_callback(): genpd_resume_noirq returns -110
imx6q-pcie 33800000.pcie: PM: failed to resume noirq: error -110

Cc: stable@vger.kernel.org
Fixes: 4774faf854f5 ("PCI: dwc: Implement generic suspend/resume functionality")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index b303a74b0fd7..c4386be38a07 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -1084,10 +1084,9 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
 	if (ret)
 		return ret;
 
-	ret = dw_pcie_wait_for_link(pci);
-	if (ret)
-		return ret;
+	/* Ignore errors, the link may come up later */
+	dw_pcie_wait_for_link(pci);
 
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(dw_pcie_resume_noirq);
-- 
2.37.1


