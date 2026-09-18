Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CA0C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 07:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+s8BkOyNSHuRie2fC01Wy19tDVhaca9HVahGR1s/5k=; b=geRiKr6r7nnqVfp6V4GuKuej/Z
	uNRRx4s8WRp56xq7/7UUA7L4dtsAuuau3DxZiWl8Z400McQgFHgpyYEbr9avVZF9JSkadtABgY7ev
	edKA2xnxFBY7IlPAFgwi2Alohm5iaWszt1X3IoaXC1iqUWe+PRBB0kaqxtAKhCvTNLFz3AkLDAG84
	o02hUblTpaQls5ZYivprqKlzY4WWJ9PY6XNhoxuLJw8pWm/d+1bIcgfPf5pC4yzi86mpSG9LXajyO
	r5H7S/ToeXHD/jLk1SdWAiJkhaOlXDCHqlnAbQinaNOZe5VsiR3RrOHi3T9ldABe/jzeU4xU6dzgN
	Zb0719dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Sxy-0000000DgbE-3S5T;
	Fri, 18 Sep 2026 07:25:02 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Sxv-0000000DgZV-3LlB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 07:25:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVStdHt8mldZcl9DOZ/mN8ZsiUugf/v77pJ7ZuVQCy+FmpC1uLVLimypF2abYF42sbYrUWUlGxbbrDbLwNeOP2n1NXock/1z1iNU07CkuM1Sk3w5VrdH9TGiQ+grl7oz+YNlBint0QSV2cDyQ5RGezzMzfwFcxteeAL9Mwj1VywhTG99CP2IQcrMX7Lm4MUIV2+favjPx+RbJcG18sfZbisYyo23RhVC+tH2HIBTmJROw/WIGefhGUykXKWLNMLBveYnPUAyxkY03ixzgopaoBwnCs/gDhhGolUSyiAlfz8W/31xRanSCnL1YJF89WSwRIUfYF4NJKZJqj7GOh+zwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+s8BkOyNSHuRie2fC01Wy19tDVhaca9HVahGR1s/5k=;
 b=Dq7ecoI4gZYd4xtQPSZSm/15fhuiAcCvvtQsPjiJLt0b7pi+jJS9ksForhNuH5ZNE2g0BoppXQkOMV5RtXNPll+/C1qHZozNEDndgRyDRxKcd5+pHe5duVZb1KU+Hm1m2QeNLEcoBHZhx5u4xXbVSsG/FPioYaOMYzygiOl6OCH8YWg7sqlM5Y2G34pv2hyQS00hYsZm1eo3erWxYEq2ZHY+YTqMsWJFvlw0yv4B5aLNYo/TAa7kFLY44L9SzmfRQ/JMfWi1v/e69x+JbleaQITjNogwRF8ezFltsG5It4ZMZ/YfRLnZ6ZBfdvioHZsOpJ19JklU2XUm3INak8IXFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+s8BkOyNSHuRie2fC01Wy19tDVhaca9HVahGR1s/5k=;
 b=lEYTJcnLrMHUB2TBblTbHIgoX8ecunizFe4eM5K+26rabwPu8ZKMm40kZWFBSCH5T1lI82jCIWDHYrTHNsRCxDmxPHQhypFfLVJrKXnovn7JDCC+wuNCAlerb84vXnguC6byP4Q8xHPF1R+lQQrpSAbrcGvdZM6i13IleHmRuhuoJSV0behBvAYMKRHnnC+8OQiTIU+aXx94EgovVHKDH/Ou1mBtocIIWVmC9xj3JgjXszOh47mwfGdE4pNW5I7U+McXTYjfVOArIabsQ7UW4j9sG/gsdPjRm4/AsPv5YHwLm2OkNWkqTjDCwu1OK16lgMJRjsNp2FdtrgNiDtr9PA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22)
 by AS8PR04MB7541.eurprd04.prod.outlook.com (2603:10a6:20b:29a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Fri, 18 Sep
 2026 07:24:55 +0000
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74]) by VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74%3]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 07:24:55 +0000
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
	richardcochran@gmail.com,
	linusw@kernel.org,
	linux@armlinux.org.uk
Cc: wei.fang@nxp.com,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 net-next 2/8] ptp: netc: remove unnecessary pcie_flr() call in probe
Date: Fri, 18 Sep 2026 15:28:46 +0800
Message-Id: <20260918072852.501420-3-wei.fang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918072852.501420-1-wei.fang@oss.nxp.com>
References: <20260918072852.501420-1-wei.fang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0235.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::17) To VE1PR04MB7216.eurprd04.prod.outlook.com
 (2603:10a6:800:1b0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:EE_|AS8PR04MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 971232e2-f93a-4f3e-cf7f-08df1555f016
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|7416014|376014|1800799024|366016|921020|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: C6KnJcRiW+aZhzqdYYY+/SIxDXuGxR1BGJYpKXCx6rIF07zB1YFzGC2Ow3WK5HwufMYV52D86gXZinNRpG4zYjytycMEDNMzPt6QbZIPspfheaZvEHZYm99fgOJF0FPpTs5eCktdCK/GSaWh2LoKcOBFjaS8gb+0NKHcePcyx4j1QjW3wvwumkKjTwIiMMk4UIt6X6+j2kPzK6sWTKPQXpri+DshrjhS49VGpco4qGGL0lSag+xQ5iAXyaZhIvC+E0S2MaPVs01jGxIWl1FURCaisqPjrbi5Mc6r7Gl69ZJXw5Sxl2wlD6KM7eADUTh/xsYGyfJ9+emNkaWfTI9bTJDkHCdWBIbRR7nxLZPUnZ3T+LMR5MZAyUc97Wf4GmueDkaG7VysFp+jJhObUIwFMDWREvtdfhrmM5sGELJMCaPW8K9pMI7XgtN9P5QV4Hz58HmNdwhn23tGavEEken3nvb6y90wGGarl6IjpOTLL0Kl29bGL3bqw2tf1Xttc+J2NPD2vGBgFX2QE+BQMlY4MyHawmYHCLQ00PdvfEcUgbAwTQwar+pbcEpK0BdaslG6kjh0ZccbXWIWy13U32XWpypjNUpK5HFzV8ZeSZkHwSOvyB/BKAMoQXeYFB25kwntCPSBGHB31o8N4hwWFmDu1HcQ6CkGw8zMTB5ueHT87PHzIIgMbepPyU5M9ZLrhYAkunXBJEzFGiRLGw8GGYuBOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7216.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(376014)(1800799024)(366016)(921020)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MuOwfIwZ+YPUEs9pKYkLLGjvK7u4H5QHrVTe3ZykAO0VW6B3Kw4/Fe4HL6HZ?=
 =?us-ascii?Q?BkDO4dtZ8OdD4z+TtQyuKNNIQ3BCy3UbA58BakcL24EfbUouKhqR1JEdpaGX?=
 =?us-ascii?Q?7lq/r3AI20ahyvWE13mpibM2+vbL0/FcC7pX+FAr3XmCdDjCQPCGEmNZGhla?=
 =?us-ascii?Q?YLCOCtpsmRBTM4Mv7freWHI1NhQXy0Ay0EGHY4GwIuutqLvR17cTh7pU+HrT?=
 =?us-ascii?Q?BO1atskpkClcMKOSzn/RRWZppBggAoxBO4D2PmTsPycA+ataYY3ZNQDyuBFd?=
 =?us-ascii?Q?cbgkQZaQX9gzuH3hv0DzMa1oTe/3Vxd8wS6OmwcdKlgzq2rdx1YFyz2k622c?=
 =?us-ascii?Q?0ShIFEbxspSXxm3RTBEQMjk5br3b8RUrQ5z44MXJsTR8JqfEJXB9JQGGVF5V?=
 =?us-ascii?Q?dnLaYjqKEMjfpTDczpge7/TFYPofKbQiF5YwxTjl+nyMbhmGHMRu6bG4KyAn?=
 =?us-ascii?Q?TQB73Uvo0utH8s1yS/B7XvO/xtTfGz60ZzfH4rnhBwpnfu24Cjdipq0AdPTF?=
 =?us-ascii?Q?HqErF9IKUNNJqORRzvj5p6M5PXHtgTO9N/bykLw2e3wXQWQpWwYOzD/8fUgH?=
 =?us-ascii?Q?7SZjrUDcp42XkjBsPg6wpoWlMoEy3vKk++0Bw5GWTv1pGFnsWPwdGkIEGRgr?=
 =?us-ascii?Q?I8NE7Bn3LRhA4Qi8fLt7t2DIJ1cz0bG2NrkP5fZm+ynDpjUaezGcNgEtTQ4l?=
 =?us-ascii?Q?n11g/SKjeubSe7OXbiWdyUG55dBcFuMixtRB3Sn/XjcEAPDmOQhMc8mtEqGN?=
 =?us-ascii?Q?kJHv1CQ57m3y4ZcslIulm96LVJWXLSXsCTzvMB95VEzgFSKEzaaeXFJeY87W?=
 =?us-ascii?Q?B5bN+9npbJloQEo7Igb9k5TjUo2TQKSla4qn41CeXQL8l76GxmI4XxOneZ9Q?=
 =?us-ascii?Q?9DDVs9jZbpIBvkkdK45uev+5UKbXiabfqJ9LNYKYVi2SCEAYMHZXKc9uyUfH?=
 =?us-ascii?Q?m4u9VQ2LeDPVVw/gwLZvPWhk4fLk6KJIGfmsVlh+JAP9/VbUV+Hlc29URmfg?=
 =?us-ascii?Q?MXVR2RtTL/FUyic03GFUnZOKKLQnjIvQ6fbeVGDFBxP0kmHje8yQqPK4dHEC?=
 =?us-ascii?Q?6cagFT1JL70LM3/zMQrUgI7HRr6DZ9BNXuVvd3ds1Ml9+zOQjUA++ikQjA7T?=
 =?us-ascii?Q?hzbw6F0jGZyjIFJk/OJa2JiEks0TIE/FGe7klQzFz/EZWomekt4zNyQUbyjH?=
 =?us-ascii?Q?lccMP4De2Tlk8PIqzmSh+UjfumI8h1nm0tTZvdlyJZdWUV5ZtK2D2FkXaYBs?=
 =?us-ascii?Q?SEoonRIpaNqHDWsymd173knlXJkBrev3KLXdwJvDdV+8prWsF5jeV/SZ6hTR?=
 =?us-ascii?Q?BSeje5DQAXBZnoH38iZxIMJTUIM+t2BKL89qLRNW61pf5/bLIZPa89f8RH5a?=
 =?us-ascii?Q?FmDzC7VwZ8+rSDg4AW5wZR4cNzPzhqfsg0DvV3nTrAguSjYESaQzQYNbmVVe?=
 =?us-ascii?Q?C83uBPBu5cyw/PoX5BN+ZZsa4yJ2rHvSMikTGnN23isIAIn2/apqVjIj2a8g?=
 =?us-ascii?Q?LeB4adlXkCMzJtVMhJjkfqKJU92NQ0r6R1pMIsGABKrAYO2NuW4LrSom1Q5P?=
 =?us-ascii?Q?noidf7Q3SCtBdM3zWFDjBpp7HPkWO8tImN4RMI3lff53HYGcAVbtZuwT8RGL?=
 =?us-ascii?Q?lqFC5SAcE8Oyads6Gfm8cTM2Tz9aePldiOJSjyiv6LDPwdGidZiobSwg7O9a?=
 =?us-ascii?Q?5w18lL0c8HlMJ3YGMuznZ5paAbszjm9OcQtPZKNpRAJrWheAu4h894Lejo5K?=
 =?us-ascii?Q?lXyyH2yFyVuZDBxdcB21xbn+9fXwTgVNmMtw9LPyhPIGTrIQYyBY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 971232e2-f93a-4f3e-cf7f-08df1555f016
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7216.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 07:24:55.6888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GlxsO+B8Oto/QKM/X1HRYeWFpjU6Oa+Gcx8im1+4BiN0OFXMyDRkNdiljN8lJXJL2FdKYXoLQJvJVT27YPMd82pUttnHYWWzm3o6QiDFSoNt/guqmqaLTq5Mr/ppccWl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7541
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_002459_841681_698FEF3C 
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

From: Wei Fang <wei.fang@nxp.com>

According to the NETC reference manual, function level reset is not
applicable to the timer as a supporting function. Remove the pcie_flr()
call from netc_timer_pci_probe() as it has no effect.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/ptp/ptp_netc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
index 376b3b0d1a38..aa9be8e2a630 100644
--- a/drivers/ptp/ptp_netc.c
+++ b/drivers/ptp/ptp_netc.c
@@ -777,7 +777,6 @@ static int netc_timer_pci_probe(struct pci_dev *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	pcie_flr(pdev);
 	err = pci_enable_device_mem(pdev);
 	if (err)
 		return dev_err_probe(dev, err, "Failed to enable device\n");
-- 
2.34.1


