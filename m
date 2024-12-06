Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A91E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 11:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VoKBVXSQTxlJmPDvP3gyKy9wmOuwqhNnsYKMhwfRkNM=; b=jCwSdmhLjmTXGqIBblgqRr7xis
	6WixEbqN5Jjzy9RxbcFtsO6xXyGKwRZTgM1MQ8S2B14pQxpmBvwtMh2a5Kgbnlubt0rd9cwksgCfU
	rYtoU5rtZy4rSqlEUfmDO0nOcXeHGmwFH1So9i1PWB0Cdg+YpRlId+fH3Zxqyhu9/NAUTjtqibUMI
	y8xYj/Vn+0qAzQgSx76zauAcrl0FSOMltpTeQhYk70Wjea/zut6EpmgQ3zaLkeUM8BYQHQPGQhHVv
	YXA+D+Z7gntd+ZVk5zmYad4H6wZ43u04ylqzGnIAwV1P7ZQ0JSg+V/qRlFWY8nfDEoKMWFclgZ6Ax
	4jIbRb+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWXG-00000001SlW-14Ot;
	Fri, 06 Dec 2024 11:30:14 +0000
Received: from mail-db8eur05on2060d.outbound.protection.outlook.com ([2a01:111:f403:2614::60d] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWVF-00000001SPG-0g2X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 11:28:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fU620jGyuVzc9bBP1Xi1ny+dQ22J4yP38gh8D8yAa1ZmGABYcWj01H903zIjOeefdwYdak4eNhvenCOuFdsoX6xUQc/8zl9MG/dfn4WrGn9UiTy3WHNrA8Hz6SJfM9ayfl+0URPtlLyW1HEj4M7Lf+mcUxBD2qYYhc9/9lGe3C2sLA61azccyAhy3Nhh4e6u/UXIghAS5C1CXlWBOx5Kx+gDZqInA+4JicRwPPWuQWdvGRCIlVJzrZSfTeriLeHVQ1YIfm5bd0a7lx/v8zDhfa3BhJbXx5PmlI0eSrqrnF9f+tRf7CuRVq4R/XF5PuZn6djqMn9tssjLWX2ykZ+wFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoKBVXSQTxlJmPDvP3gyKy9wmOuwqhNnsYKMhwfRkNM=;
 b=K7nO5TqCcPjK6al7oG3cnfOGlKTiTTygpjLOLfkxeT0cIid0vUtQ4rY2oZ/FupVpOp0a35Wdv6oKAkdU0OMh/B6yHwnPYOTvis6tDaJK4Yj4hHdV9rjv3vGaxl3Zrjqx+cN1rsorRJ8VuIxPtFUrGjYzbX26j9apbYs/gf2z4v+VQM4TQIE1yjiLlBtd7NrqFQbyEW8xjmiU/t/DUFnKeMVw3Hg1cEBVW9U8u0ay+fUx7saTaFVwzjSqynRREPccWE575wQTeAQSHiZ8fAQZB+POOFKfeXm6M4sHnTlvCBEzoXl8d1bi54u9bFSNvdNc1jqeXsqpYvi5R58MUWUaVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoKBVXSQTxlJmPDvP3gyKy9wmOuwqhNnsYKMhwfRkNM=;
 b=UowEzd4a1V5mohTtTbn07Yz2w4SHoh77uw2Nb+7lYCJubVzcS+hnZfw3bxclqQ1N00OCtNKuonbbqHYKqMZuk8NDiypVD5eC8OKb/p2yr4CJsghFS2zMNi5HNHsxtprKyL3hDimGCCtUOzfAPP4rZHgIIws/OmpdTMaTn/qPSzsxvYMPzQZb/K3InteZ7SOWq8r7Z8B+yORWXMgb4FoXba+09+Z7opbeqofJUfXkb+ZHwF/brekNMB9auiF/D5M2SwEPMeiobQrnMWCG1EgadpctLnoCSgcugQMC4w6F9ZFC1cIQJ2wm8JqPSRhNiX8z7yY2ITvCRUgIZnN14s7H4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8223.eurprd04.prod.outlook.com (2603:10a6:102:1c9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Fri, 6 Dec
 2024 11:28:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 11:28:01 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: ulf.hansson@linaro.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-pm@vger.kernel.org,
	aford173@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 2/2] pmdomain: gpcv2: Suppress bind attrs
Date: Fri,  6 Dec 2024 19:27:31 +0800
Message-Id: <20241206112731.98244-2-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241206112731.98244-1-peng.fan@oss.nxp.com>
References: <20241206112731.98244-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:196::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8223:EE_
X-MS-Office365-Filtering-Correlation-Id: 13b1a3af-8410-4627-466a-08dd15e90b25
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dv3OajVm7ThVSgCChaFLIhhBa308g2/NocnMIrx2pApSf/2jQLSdCM9FsD9p?=
 =?us-ascii?Q?Gx6DqGjHGNBoeMBBdLNdO4O8XqJLlsCbDkVXkk0S4q470bUsj4fRdOJHSM5j?=
 =?us-ascii?Q?7a7N05VtTHiQ1ypaopFngoc52n8xkGk0dJ3Dh3XU/CUBciWFA2t9RqTuytqV?=
 =?us-ascii?Q?AMjGRFZSuFZxgFRzmj2El222oEDMs4jjGLVPAukWebyImOwWfuurVBJcDiyZ?=
 =?us-ascii?Q?lxa2a3PewMynEJQfXcORUzIfdiFBZbUyuu9he/O2R3lW1MMA9iOe1AiMBcgu?=
 =?us-ascii?Q?OXavBLRkYC08dMsniMXoK9n7IEQ7jHkvdfPHIJ+sTNaPBH+3awhr14qOTrj/?=
 =?us-ascii?Q?N8DakCwZd8McnMymM1mLuRZPgE+wJowyZT5x5jQ6zCZDl8mU0e98/H86IN6Q?=
 =?us-ascii?Q?eWAhzFuNwJm1iXlhV9LaEYkJaRBfzaKmaOExvXelQl3Qr2u5mXJGbEgu3bM9?=
 =?us-ascii?Q?6xZY7BmSSs+Lb19kRR0tPhJ5sc6sXlzdRITiQ2zpGZf6m1kqAXFejHl9AcHy?=
 =?us-ascii?Q?HrFxpHloc3zJfGcfhRwFQyQY3rZKgvVW1YricNvDfPc84X6h+isflZru6D/t?=
 =?us-ascii?Q?tIIWoh9U+no8pYaclsEXxoC7/9sOZ1wIffuxj0KvsedD1f2TPT1hT29DAOzA?=
 =?us-ascii?Q?F7JSs5tjH0qOPcoJEE386iYXyxD3GNfTgm+qPynSb+m8Th99PElUce2Tl0QK?=
 =?us-ascii?Q?BUI11aOlgGfsNLMG6ZIsxMNJyQ5KnfQ8+zUxtoZnaxtxNk3LRqSEZtKdecIB?=
 =?us-ascii?Q?O40kwSLf32mBkkeDeo2zDPpwg86tIdZmtp1gVAqHS+8vE42E9nUdhFO1NVoT?=
 =?us-ascii?Q?zfRMQnzaPNHEE27ULH8tNyxunP7y6P4XazbNWI0+ClaO3NNKEDe9Qnkc6pml?=
 =?us-ascii?Q?gU40bxPLMVO4jhM+HpzZvslD2Md3QklHfvdvk48qmfvLfOKYPRTMdziR/CtY?=
 =?us-ascii?Q?CFU0Utl2NiB1LYFjrvpyNYMOTFgDgDP4wk0LH7eaon9x5BnF8wcJgGvYwhYm?=
 =?us-ascii?Q?RNRFA0jmQ7MdR2t0g0rquTid6WArBHyF8x4yNJL1Pwaxh07+7SR+XOoG8fV8?=
 =?us-ascii?Q?1J62dOt8wFrftQ+wprnsiWvtkragIdQwoOBl/++A4gr2dIWeCNhjkeIno2M7?=
 =?us-ascii?Q?+Uw7hxgszzpjFzj36Hiu+kw1Np8dphqoDsrlf40GrPHxFNlgB5bdRN5YhETI?=
 =?us-ascii?Q?lxMlYx7VaQPdsPtVGB43ghIex5zo4L1lQy2TFncYJ6t1x22OA/elxwoRJsKy?=
 =?us-ascii?Q?rG2EYczezHaByovNZ5UPP0PG4hjD5DAuVNx9BC6/uCcLCtUUgQIuQynrWjdO?=
 =?us-ascii?Q?tbp0G6DNpy4AhhfD3ARDXup+RbX+8CYJJSj7uObkjQy4TuodV5AuLtCWEv6n?=
 =?us-ascii?Q?YqaWO9f7MbG2gH65b/Nu6wtNecvtlrWAlnyGxmdrNWCoe1dyWA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wePJJ6n/xKUR8bFs7ezbg51sogjdypBf25vBD68EQ+46UwXzoy2LYl/dPPX1?=
 =?us-ascii?Q?ga6esIClMNjeHfOq8lU7zJwQ+of0hwCF4vAY196CCnU0RljRaUxb6SSmdzHl?=
 =?us-ascii?Q?loL+2dUWBVChKewG27OFipJ/UbkpSL8VScRZXBaqUkVOl7QYSUKS4yNeOeKO?=
 =?us-ascii?Q?n7DK+zBwwr8C7u6FwrA3LHEILP5mVYHngNi24RicuV/0F63J//SJSMpuSz5Z?=
 =?us-ascii?Q?0HOVtygqsIPJqFRdOfsYr6V6sKnYSkeb23hSOJsx6p/1xhZTpGVLawhO44Nm?=
 =?us-ascii?Q?TYRDcuHRwu0miaWUQtMGOFAYkmbNZ3CEFuLDkXv4Ku9THxhzgckRv7Jx4Ds2?=
 =?us-ascii?Q?xXKA99rGMYHpJ/iZfwa3ShBwCIF7yX0T04XM2Euw42uuFQzqbypNQWaUwWkS?=
 =?us-ascii?Q?bhd1SkRNcMjbtAmgJ3zXVPZx1U2ajlmd5Gwa9Inz3Q5VVON6S7crqtQgs5Yw?=
 =?us-ascii?Q?FmvCncOKg5IX6ZP7WQR51y+vfK1DYUHUViRBsIRTvB8zlrJdXjCjb9D63cVS?=
 =?us-ascii?Q?/9HfTrZQe+bcJrJkA5U/4sZzAQ2PXmOJHHHxNaQwLJLaO7/aM4AMFt0Q0t7c?=
 =?us-ascii?Q?1rMti98ko45bFgellY4cH9ipsHhs0vtz1dI7WnH6kBwvX/Ecc6f6QgSN5Ena?=
 =?us-ascii?Q?+rNPrapEmrUWKtJaKMbPdRk/6peOS3vupykHwHscdeEUWc/JteGwrYoDm8hK?=
 =?us-ascii?Q?UNLmF+IoqyLdAOhXMRgbmZ3Iwn8S2boqYhAm6vOKbnBnja5VRQ3nqn9yonSV?=
 =?us-ascii?Q?UDYSfBqpBzANep6SHFCfN4D7S3Oj+WeZoRBlhRybIBfqoeccEcQxpqvpK2xv?=
 =?us-ascii?Q?9KKNPK/zEIZGDWh/s/dwkzYqiqW+6z3MoMc5qHG/28oXjKH0ywNM5ZKMuTH7?=
 =?us-ascii?Q?YLZhkkrkqlvfLnsJ1NSHWmglPmHo1U8bz3y0d/jzuhxi7vaVEpVg3kt6jaHv?=
 =?us-ascii?Q?yqVFhPAVnxqqfh3ojvYaRxun2Aq3Q+1lv0U+ug0U3HnzrG0W+5ArI0Zgx+5m?=
 =?us-ascii?Q?gGa7zAUOrOaHQZrBoEYSq8rE52WiP/Z5Lvo11hwJzpWwgCtEghteEKZ3cDLw?=
 =?us-ascii?Q?nhelNafinhjLq2UQihLr+2B3pOuWNzA/6kjw56u3EzPp/a99f0v9CAF4DPh5?=
 =?us-ascii?Q?W0dR34WGUl5gxU6NjAFlKyB6osIK1Y1tdZ8wvtS2orIDUda8/8Rpqnr6J49N?=
 =?us-ascii?Q?vW4gloGTnrsGT5bup57P3u/R1S8aSYeyhegrY7ssh6shxtWGz+Jiuxl6THwA?=
 =?us-ascii?Q?MAgaQfgYPLNjUXHyz40eDKtwlNjda0jfgznC04WrPmp1UJOPxNIdpBCL1w4C?=
 =?us-ascii?Q?1VMi8lWdAj43p0XJl6K6HXKgorwguhri7PdBWIddFE/ZU6uFrwPorSGuQrOi?=
 =?us-ascii?Q?+1N5gvKmcsCqam4DX/VM8Vm4/geSaFypkmwibKG5jRlCZbvh+uBvLEBC+G4N?=
 =?us-ascii?Q?32/wWG1EBN+l2ReuGIGa+ypZATPxZcToBZHCfJ/Udk7MDiijYx/NpQV08Euq?=
 =?us-ascii?Q?8K7xajee3Z7AQSp0XlRUnsjIO3WeUNiA4fVFzhXcJmLMjv3cZnuWumUMO8o5?=
 =?us-ascii?Q?SHdZ/pRz3mtPx/QXGhHIY78S/vux5jDv6zs750rP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b1a3af-8410-4627-466a-08dd15e90b25
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 11:28:01.8041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G5mHVhLHSMIRs9cEoh4rGrqYkBJkEpmK+a6Cg8gB6+RmQjFSNP4W0b9WR3QySUCxDZO7qxzynjp+Q0spv8wqKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_032809_199411_21599ABD 
X-CRM114-Status: GOOD (  10.65  )
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

From: Peng Fan <peng.fan@nxp.com>

The gpcv2 drivers on imx8m series are registered as platform
devices and this opens the possibility of reloading the driver
at runtime.

But this doesn't actually work. There are some hardware sequence
dependecy between blk ctrl and gpc, also power domains are used
by other peripherals, so fix this by explicitly suppressing bind
attrs.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pmdomain/imx/gpcv2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index e67ecf99ef84..4db4d666f5bf 100644
--- a/drivers/pmdomain/imx/gpcv2.c
+++ b/drivers/pmdomain/imx/gpcv2.c
@@ -1437,6 +1437,7 @@ static struct platform_driver imx_pgc_domain_driver = {
 	.driver = {
 		.name = "imx-pgc",
 		.pm = &imx_pgc_domain_pm_ops,
+		.suppress_bind_attrs = true,
 	},
 	.probe    = imx_pgc_domain_probe,
 	.remove = imx_pgc_domain_remove,
@@ -1549,6 +1550,7 @@ static struct platform_driver imx_gpc_driver = {
 	.driver = {
 		.name = "imx-gpcv2",
 		.of_match_table = imx_gpcv2_dt_ids,
+		.suppress_bind_attrs = true,
 	},
 	.probe = imx_gpcv2_probe,
 };
-- 
2.37.1


