Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F6FD2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 11:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f1TkiExK66mtQehVF8hLJJ37Uf/4BwVRxZboNDyjlr8=; b=rxL6ShNuccf8up0s0mt1ayU7Su
	kIQy5N87vfwPWwfgmYm6bDZS/LWiYx8Epgi3a1bz+DS7QNX1BgRBlW7ODKAfKb7JQihvjFGiiyN9Q
	Z+NucdVErrm7nmrhOeQXkR1LuSRjyimDxbjd0CiB5K28OD5L9tY7ZD6vLMRH3s+EWRWWyldwEXggn
	OjO8MKP7t+9C3a1fIHuC6ErAhNRW/syIBiGa+PYM+E3xMfutEDEjlnlRVsmPESp4CzeJtlDT+Pxmm
	cpo7R5Y3obKpkFA+ivfFQeEzxpdWcU3gdRKeZtJlOsm6vViWVavStLcKcEwxYLSR49dIlBfF+OaR8
	R9BWW5Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9jw-00000003hAc-1Hsq;
	Tue, 20 Jan 2026 11:17:40 +0000
Received: from mail-westeuropeazon11010026.outbound.protection.outlook.com ([52.101.69.26] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9jo-00000003h8H-3UZ6;
	Tue, 20 Jan 2026 11:17:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BIOhxmS5Lb/ALepbFzu0kVwFhQQ/tGb7+MXMQoDYaFoFXs01VZbW2BA7j5DPE0jy/e7yfySQiTuJIbKocZwccEreFkwK0LrDTQVmahOa+xiKsCxMzN3VacDnTnsSmbluRx3w852owK87pKRvryYaTDMuBnPqMXsu+BOIkpPIUv/93nlsN9HILUOCdltEPIteGCWhOJMGXIZ70zWR8IZDcJpvy6WOcrh3fQnKEa+FnYzA0nQRBmf91YPPE/506LwcPVw1zklStqa5/eCEyssUTWt3MWK8fMsyvDgmShDzGwRRB3QOM8RGPN4c4Qx2bQURYc9+ERGgrxnh2WIo1ktYJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1TkiExK66mtQehVF8hLJJ37Uf/4BwVRxZboNDyjlr8=;
 b=yRlJiMt8hwuRYcg1OTTfU11Q68+Qi3ze1d8+R68d0xxWyA14mIVOwMtyS2aAjDgaLuEol5qzm8nIpzTLxtjd7fOcIQFzebNF88CFfC6jOVPBfmdlhMLxinchto0JmWXT+aJ0I3yu470s1FqWNJUFv5K5w62ai1VsjxbwMcLT9SxutglEt5ekR2nWqKZ+wS+Q8N/TEm+0bI/FJpQz3JbaO+u4rahfr8fxJXmqBOsG7578g0EnR3FmR+++0tmeLjzr+9H9X0mBhgZmTqHitzcsCo3ux6yW25E0z4VhLzIN0oDcP2BI10AD6m3LMHSx5boiVqUCXBoyG34R9Ms88UlnHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1TkiExK66mtQehVF8hLJJ37Uf/4BwVRxZboNDyjlr8=;
 b=cz7GfzfeWYrNUOYk3Xlre5xsptqJZ9rHcvYWnQXo6mufIG8EFTjenaakLwnOZC6dvJQIprinjw4tMH65EC7uUGGkrUhVaBCPpFGlJb8PElGTKUzfNTig4/EUgmacEolOxRaVTxxF8+lQhheffW6PUCvKZvwNNqv+WhKlP6qKkP+ES99g0/uHaWna35aJ4qkHJrRodfz5xWp/+r9+O7uv2fCHI23dOcyQhCnJjzrzgpd3McceWMsvoolQQNpM4kB2hjuLO6jJfL6jP4HVr0nJi5PekUANxPyxqwCapGaq7pbhYrBnsmetmnnIuuNrOm4G4F4LaiXu1W7vFsvXaUSJeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB10378.eurprd04.prod.outlook.com (2603:10a6:150:1d4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:17:28 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Tue, 20 Jan 2026
 11:17:28 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	shawnguo@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	jun.li@nxp.com,
	Frank.Li@nxp.com
Cc: linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: fsl-imx8mq-usb: disable bind/unbind platform driver feature
Date: Tue, 20 Jan 2026 19:17:12 +0800
Message-Id: <20260120111712.3159782-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0159.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV1PR04MB10378:EE_
X-MS-Office365-Filtering-Correlation-Id: 1059cb2b-5996-4558-a89a-08de58157ef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Cr7MrBb5zH9iwlJjeGaQT4VpNZ1FOMZ3BcopOAzQNoR+aalz5M8tQzRYKqFy?=
 =?us-ascii?Q?CNIbmccpwhQG3ZItH3uycAlAWRi638Bk93tdYXJlWWHd+eGbbdYY9O2QFgFz?=
 =?us-ascii?Q?CWawNyaS0bZMOORqrMAQFGlJpM7Er9VI/m1NHaROuQN5nuAr+zUorhZZuDY1?=
 =?us-ascii?Q?Ec59J9S1OkoNE8VhNzpySveMy4jMS9X4p7gSXtM4bVDwWzAukUFjgagIJbFr?=
 =?us-ascii?Q?dHavkfEl0YFmlOfBX1exDK/P91GcNJo6EV/hoEUmNPAFEGVuUMMId6O+rjB+?=
 =?us-ascii?Q?6/2H6/PTVQHOuN+L1b8SDko4yG250HRumiJEuE8Gsr9YZXQtlzg1Xn3JaplP?=
 =?us-ascii?Q?Xl8VAHS4q7RjnIpWbJh/I/skPLiP8Rjgc3ioivnmfUe65GvmiVQornfg7C4x?=
 =?us-ascii?Q?jBwtO3QOX3cPGObqXaU5L0INqUIu4E/gIGJ/2HCJXMWDMYBlTrF/YbFefUAr?=
 =?us-ascii?Q?zlAkCVYi9RUfgEM5X0R8W8ZoydbOnLcRxb8KHpNC69OGs+hbLrXAWyaCvbCc?=
 =?us-ascii?Q?MOvonGBU6S2B6DBpXMJrACUWf43eljpHj175jjn2+kgAYivOW/lUyTKsN5sV?=
 =?us-ascii?Q?ub2dINQ5tg3jPSifHloOfr++14vJA4t38T0wOAIdP8fR4yj9rDx7njpAP5im?=
 =?us-ascii?Q?5DXMxmWsP9PMdXExi8tPa7sKY95lrgTRg9CB7AcT4lX51WafnttAsYY2R8p2?=
 =?us-ascii?Q?652d+1CtRiGIUzeO7b36wEfDMsIKIIM8E4cG2rEUppWtF0pvJWo71RrIlmmW?=
 =?us-ascii?Q?adoWdygg0LTCKgPR1h0cmVaNQqjXwTFJ6sSiBkTKx9fHa15tUzgwDuAwHzy9?=
 =?us-ascii?Q?yxoZt0WRe8hmFmvxwVHj4AVK8QjNknQETRaH4hzHATZ6az9dtiOzOFqe2xmK?=
 =?us-ascii?Q?kfrSWdw+VzlNvy+/s8nLLLbT7VIguTEb5Zc8BhYGiw+ZfMU9f0KD9lQtL2Kp?=
 =?us-ascii?Q?wTDJGCGksjrtbe1eugegzHj6BcAH1S1/3x2ajQhCl5ow237hwPUuuKvvk7gx?=
 =?us-ascii?Q?LpUKh0t2IqLD23rJ0LfCj4c/+1O7dTnt8SUidrp4lP3Ebv6l40tBwJkp5avq?=
 =?us-ascii?Q?wOpS93J0kEEE5sn91Kv48mHUQLUjYDGKuwEW9GZa4Y6yCY6iaTKe4Yoy5fJC?=
 =?us-ascii?Q?9m7rY3SzZKHeSCc++aeXv7SbaxKfkbcBCuq/on66YONNGJCjSJcmOGRBKWPT?=
 =?us-ascii?Q?+Kk806pCrrHG/7b8Arg2HYDFJXXyX83lGI0ml4nBiC0kM4xBtrACtiLHU7eJ?=
 =?us-ascii?Q?rZITAhZ52u5RIzboHzE9EUznwBBdm+OwinqYmQCXVIfQH5f4g1/HjuDizTG2?=
 =?us-ascii?Q?OiW3wdlugzWRUwoNgchn3cth3El/dCNI6oRow4ye/xKic2Wn+GKk/0mp830g?=
 =?us-ascii?Q?YnBSt0gALZf9/o0SAfPrzudzBPKd9M+/zu1NwRjon19U8oIySd4z0ozmKh5q?=
 =?us-ascii?Q?OlrIDBtUSLtn2teTtENuaJb9jw7ShZzzNrBgqwlBlbDSBAGJa2rrAt9BiQts?=
 =?us-ascii?Q?1eGcH2J5A31RpXacYG2R/oRKWDV+VkgBCGUA+qkcAJnKqaei9DzojrFDe7RA?=
 =?us-ascii?Q?3cTY9Yeju7AdAZxq/8njQ4b/oEF7TTeDxHh6Od/MJMUdITOoadrSLXDluZK5?=
 =?us-ascii?Q?koBjxl1CCrSOjjhHGQA/1Lk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R6WqNqkzunePi5ZRWeyjfYvzBDKb0LKJAxNc1BrTNypErb+AdmrQmHZwAkeZ?=
 =?us-ascii?Q?d2nl3kGcze+7b7NeHoTbFwx+Lt+BquhST6IsjIGVUh1xWgqLA9Sc751LcIkD?=
 =?us-ascii?Q?ADVVQGrsz5lvUEJn+YHQVcr/ww9Q8UbTaJOPc+vH2SmwzHl14qJ+T/YVmD1s?=
 =?us-ascii?Q?mULcl8CxSSZoxPtY+ELANo6SjHiRHj7lE3vMDZCsCR7VVrkLsluwMyJ2LhbA?=
 =?us-ascii?Q?/Qdysta/vK6NXWTEa1fNgxDN3TjcaeFeHY7VYcINUXVmOc0tQD2ymckb+GFl?=
 =?us-ascii?Q?4JHk2MsZbo28LRs46hDXz0WtfVWu+Dywr5UrLCDwpxc9wKMzXA5xvIhIxk/h?=
 =?us-ascii?Q?9EzVnTTJ4eXQJtWr60PDcf9UgnfOBZEoNQqBNs5Ts+gKIhxulRxV1NQaqm1i?=
 =?us-ascii?Q?qYrGCfb9i9nNm5sV1RrmkVBLqaIyO6d6heAqsSKKf8RV6Ba9aVNGIBDVpEya?=
 =?us-ascii?Q?ZIjlm335XlaRBquS6m2gzLGOQ6hv7Jep7xIFWxBTEmjz6iG21V7T+EeryRg7?=
 =?us-ascii?Q?a5V4H1jFMUFBKHzqNXpxYdWMvJeOy3fW3I3hqA1/J+SVfuugQjt7QTBOzJ01?=
 =?us-ascii?Q?ksSX2DpnO6MyC7BC7hrPNWz04JkyY8ZDAI+F1PCDAbCfbqXwrCEbksXLntxm?=
 =?us-ascii?Q?62VoDTb8y7vPR45mbMqdQKVQBHaKhLIriJhoqC6l+xdYvlc34Uj5JMu70qMT?=
 =?us-ascii?Q?n1JfhYPdLd8jxj/8AnUHdf08YH0qqmBfigMKtthvTfdOBx1qMAWvOKDgt8Wn?=
 =?us-ascii?Q?c9xYztmoOfP2CoXe/7SoTHlEqeufRVGYEBAumLRj9gnrjMKYeXA+k9ELghHv?=
 =?us-ascii?Q?aWJcs/HZ1jR7JikpiEGHbCrcIK7Y1IwgadX6mYzypxe9Ld9vj6i1tM/SaMDt?=
 =?us-ascii?Q?pP1d3QeI/QNsPDmHwxZhNVWtF6LhBSURCU/ZAsr7Gfth90XgLYstjgu42/hx?=
 =?us-ascii?Q?naFJwB1DKMyfzL3c/ZfrGnky06RSvVqrr247S3zYcozNWAEMEA0mGT4XxIIo?=
 =?us-ascii?Q?bb13vXpDekunLa1uu4ng2dBHjzkrjgW4sjZplrT9OuczYCVd6e3QwFAJmx4X?=
 =?us-ascii?Q?7O9Ac+PaQlxDWuOnGpnRSXsLGtmlU7RbGS0wdBIlZ6TtUL67BEjF/IUp/U5w?=
 =?us-ascii?Q?Uxtg89gRQlHvoqEVbAdOk2YAaUoy9QgG6RkWCen/9WWdCcvUYuJZnBFcn+4k?=
 =?us-ascii?Q?kmx4z6bCeZ5/X5mV0d5AGZw0Rg8PsB3DA1ER7FFURXO1PxUYx1GnCk8h2sNU?=
 =?us-ascii?Q?T42HZJZAKarJq2K3OawHW5mQjfgvSpo6aU67Qq7qsWAQvlZhPvkrN34SDb/o?=
 =?us-ascii?Q?qfkUee8+4djWqKHH8EE2YXVfAJnBj6Cln7v/GyxmzsZcK2NAHzXcKmVv2mmn?=
 =?us-ascii?Q?UWgz6tb4orRpHY83LGWgsjqDrj6Dhq5z2p4/FVQTbITM94p2ufKhwyLWrrEn?=
 =?us-ascii?Q?uW5DhTir7OSkaHlTLcDEohA6fkE2wlmh3fQ5b7HtSGfiDX7CPPcYsPhFivPh?=
 =?us-ascii?Q?MizLF+32Byw5byjil+bc5ezrh1a5+/bi9Ee4S54oozD0ySSgyNNTFv0lqYkR?=
 =?us-ascii?Q?hdWf5ul6SHj+9avy8PDwg8rzblsrh+m9tfdRql7OqEillS5T2mZaYCyhCxb8?=
 =?us-ascii?Q?UdciCFv41yRN7rKOTg12xCvE+itEBH2w2OIEQi9QsUNpzjZElNKW9ztnOes0?=
 =?us-ascii?Q?3VOikeN9F/JpCpax0xVt2poY+tA9kT/QNrlCARGUvgmB1C7yZQ/rwgF5em75?=
 =?us-ascii?Q?vYofJ61afw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1059cb2b-5996-4558-a89a-08de58157ef3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:17:28.4523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZHPs+Gl37vDys2TVB9XbAkFP4aE9hibJORybygQTsyWYQldT0boi1GfFlafSyxmB67xSC+qkaIdxGFSS+pR5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10378
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_031732_888189_1ED89220 
X-CRM114-Status: GOOD (  10.44  )
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

Disabling PHYs in runtime usually causes the client with external abort
exception or similar issue due to lack of API to notify clients about PHY
removal. This patch removes the possibility to unbind i.MX PHY drivers in
runtime.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 028c4c9dea40..abfa6ac3ae3f 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -837,6 +837,7 @@ static struct platform_driver imx8mq_usb_phy_driver = {
 	.driver = {
 		.name	= "imx8mq-usb-phy",
 		.of_match_table	= imx8mq_usb_phy_of_match,
+		.suppress_bind_attrs = true,
 	}
 };
 module_platform_driver(imx8mq_usb_phy_driver);
-- 
2.34.1


