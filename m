Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE08C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qNCpejyUwJ1gSkDZ4ocMPt0EsR15JftjxfVXuvNpcnA=; b=bt3YPrI8icnjLAazFEOzsXDy6C
	ZPxWfj252uYt4D56WiGPkV/AgfQi7732i+yh1jai8hdIi3XqbRcr5jAfAUp1MOK3f6wvyJaosc1mh
	vbiQPNQOuSx34MaI4fxcZCIPbh0KwQxq+jOLGEb8iKFXyXyzeXuy9mDr/E5GF7xNfgCSa67LGYfYl
	nVhq6jhh90HbBaMzLeJcjwooczh59DCOHiLzunFvi7l1BbE4+Xt/d2o53X97yPr3m39Q2g8Im2mdM
	08f4DIjWQntciCPwDqirzcW7svBLBnmIPlzGe1URCp8gS66wqnR4dm4rqn3aRsuR+nPWRdTxIpeWM
	2iqXSiVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepaM-00000000vGQ-1w9r;
	Wed, 01 Jul 2026 07:42:18 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepaJ-00000000vFn-1KRU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 07:42:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvQxZlfgtmFiaDSb92kYdkNtFxDt392zdiNz34NRTHn2cDTCpBRD9QB77CbTwTsiyPNYzUN0wYNkerPTO1l/xrexjfqxGyXRqFJA+oBb1ZpLBez5V0U9yp1qLvD0Q6uJKtK8uyUIOJ8/2O4waWx5KviKOia8GsZ3pC9QdBCWsYvZ98si/OH7S/QO/iVq/tbfrF+9CqokEAHYcYb5/w7WNoz3Lb6aoh0CW3W4vZB6t0GgEl1ZHGJPTEZ/7Xbwc6QOYmqR3pKy4h25mokYYUzj6xoQzbZCiSMnIC2D4tP3DzhY1V2W7HCAzQLsq11K4ThWIcLwbpreb58XeO8nYHXc5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNCpejyUwJ1gSkDZ4ocMPt0EsR15JftjxfVXuvNpcnA=;
 b=N5GteyOP62rOzIHFsQsM5liO4H8/jQKmfDpbfrCRXOr3veOFHoGjkE8z4ju6Sf5fGa9YalrSEznJgQMf+Q11zSQ3wNVCRwUxDXm99e4A4R4WKUUAzi/xuqvfTr8VvU3TDLiJ5B7y7Wy6XYl/Hb4n9OPB6MIz9BPf15ab2ugnhCBdyPsFWNJX5GTrmcfaTFk8TyjI1eRepmL+aWBN5d+OKePeG6+H40dEFkhoTLgTIH3KgdZoju2exDpDuNSSUzRbC90rmukZDMscGoTNkNBrXUFVXpjB3ufDNGvdfcBfu7h51iHtwOl7+dmqfYJbzSrQ2982PAWOMYh/JQ4cUJxofw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNCpejyUwJ1gSkDZ4ocMPt0EsR15JftjxfVXuvNpcnA=;
 b=mJ1BN8Wr567Ct9We8TvDLKxkDzLIFSORZSjMdS56BdfcIZyVsmFX9v+YMdQeOXVFHOOclJhXiYDYbC1klS2Q5bTafXyQGxU1bFqyi5EnqmUnGCS6xOICC3lav7yOG4lowfoW54+ONuq8CBvECiTjCvoG933Pbe8+CB13CQyqGXd48NrtEaXrGktvh/cn9THnJtLZuOhtEO250MGZxXCvL1toRg6NncNgPCWxkdbwDbfQAzOMtCOojht1kuWnlw7uTk82jCGwRpVnVxNSV+99L1qRJxj7p5trilzgpYHNLHRko1ef1LAFkaBhsqyUcV3MCXJiZLYMBtNbamOYlQ2sWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by GVXPR04MB11668.eurprd04.prod.outlook.com
 (2603:10a6:150:2c0::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Wed, 1 Jul
 2026 07:42:09 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 07:42:09 +0000
Date: Wed, 1 Jul 2026 10:42:05 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, vladimir.oltean@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] arm64: dts: describe the Lynx 10G and 28G SerDes
 blocks for Layerscape SoCs
Message-ID: <py5e5y5y4ouxqb2vyreduwnxgbnlhigcfrpicecojsaytpnkvp@pnij4jyzo65s>
References: <20260630110459.516364-1-ioana.ciornei@nxp.com>
 <akQlJlYaZkaZI_jh@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akQlJlYaZkaZI_jh@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: AS4P190CA0003.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::8) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|GVXPR04MB11668:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ed8513-86a2-45c0-4b4e-08ded7444199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|1800799024|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 4bROU9u+q24VztqSljdYP03yXu4BjESwbKqC/2a3pZaQR3uh+Vl7Cqkqr0j9YlU5tv0PykSngYTQJnnnnFoBFIwfm2DPx1QFCgy4etlz4XgKoblgRCu6t5dQB5X4S/e6sIOlEc2RPSxLHPKbGbHhqj1QyPn5HjNwIeVrrQjEQotSCmbnWEc+CiQdJEyM024O8R+c7DfzNr0xS/kT+juT8PADloj/fx1eAgrfsGun8DpVRl0UCBoDJdPWsnsAeBl9HdFyMGn19Ofq3TF9/IdSJxBdSuYBOktQHFhLp4+kgyRV0R+FBRjHOapzEu/cnXoG+mlbb/58mlxe3fF9AOrvaaA+XJCSDTh4gASv26+hFfG2hNqsXQirQjc0N8mTs/o8tZrDEVt4zkkwdYowVD75PdpS68TTGlL/UpmvDNo6mBQl53siIH6K5bys3DUw/NjaRx5t4Lznr6BPOxNWgYcAgM6gxulIfFTt9RngvVbXjW4iTS8qc5TEjIIHGyCLmU0VCQuVG6NZdtEO1tmps1Ag+HQza/xtKhip5rqB7jH2hiN44pLrlZoj80DzfzdoAaibjhE75UeDtvYWkmKlw8Rj/7PRRhlMO14ICmJGK1KLuqwu/Xp5wUe/K57Ffgn6KP/3VjbdU+VhfBZlZGG+O4hm2yPETDWSxj/ivxn4UpjEXy8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7zGpbc0p9Dtq6OaMTamWWm372OcGScVFOToUGuNMpa+ttlzewgqJayBbcRvb?=
 =?us-ascii?Q?fVoWSqr55OEpHIgnhiaoD2esA+OsnbHZ701CWdYwxnLqT7XRBWtI/vjNRm2r?=
 =?us-ascii?Q?RLj0QCjzIIgqYhOeNeLJAUi5xh74d83n0KHxyx8D1mfqw61OZPx7Epnc4JDy?=
 =?us-ascii?Q?1uAL67afNQDnGreWyq7hB9S/kwhIMBP7OJE2aqVyW94wF5ZymlUghPdlhLRr?=
 =?us-ascii?Q?o6jOzncgBYBLSSis3imAl0ZdTiBK9bq2InGfnz10oh3Ia3NmgJSSHMyIuZGF?=
 =?us-ascii?Q?45VmWtpmT7j2ylc4j/Wnm3D87vENXf06wXbJkO6vB0k8Nq1Zwn4eACdee+5I?=
 =?us-ascii?Q?wcbVMM54ytdwkrZd7qe03rABowRNsGlxJ1Jtf/1pPhDlslIHxZdmpoXQvP3e?=
 =?us-ascii?Q?6g5gtNwe4UML8cMvocCH2aQ6iTcxecZpX4h63PHeKy2XjrKKtm8yR+q6zFm1?=
 =?us-ascii?Q?WJaDHvNZ5pvpf4kn+T1GV0f/zPbdquJkiZmkuMG3OHbgH9m2rYCEpyZXm6/x?=
 =?us-ascii?Q?k3xT1VMGtpdwf9GDiusC867CQdkLS1w+W3BP9I1JsTV1LRMSl3Hlispjqh/H?=
 =?us-ascii?Q?3LKRhaF6e3+ynotPXqLn+WrXWwduBgtCNHqbxNPQbRjAKyjqe6WP1jBDHIAa?=
 =?us-ascii?Q?ksVJNeeVLjUN3UNKD4buIFtJ5vWG1XoJ0yZvYuF2Fe2d2ramOBFpabO4DY/3?=
 =?us-ascii?Q?Yz5gWdQp8UKwiQY2J9JIcE+CRF4QxgSJjvCjMgR4VWrXHmYhDS5sNKZHFvyP?=
 =?us-ascii?Q?t9xONLrg0/tS23mda/7YYInggjO7CuVY9Dv2qNt9XMGG0/DOzHS78c8NIvO7?=
 =?us-ascii?Q?s/7NxPGCrdLMctMM5J/h4xI/tt7Mfo9kBqksEhkWL+vIsh3CAIdu5aVDwodA?=
 =?us-ascii?Q?FAj3tDuuAujrkBjdeKTXQUCP7t1na47vbFXLwTLk9Csnl/yWwNbM1so5zi6B?=
 =?us-ascii?Q?gV8O14iKfJDzkKOJNrUNNQSKipy781JkILzlWENtZSGjv9dbHEFAzF6idra6?=
 =?us-ascii?Q?fhwTw77iptGrctIk3brvWv0ff3gpeBH2J0MFgXXghQz8Qn+wn28DMcV0ic85?=
 =?us-ascii?Q?3nKND5o9rztNSQFt8Rxi6A5mh82Z+ouTgJN3V/0yVEYoc69h79nF87HntBLs?=
 =?us-ascii?Q?qTZS3bS2AKqUIriRtAwE6nHH8ymKx4o6nonDLQuzKIXhC7GrOK45N2Gh2d7C?=
 =?us-ascii?Q?iBJ5ravxdlHYZtvGj4LZjsqAn/3fbqp8xxMGnYCY2rD5E/3jCfqFecW3oBn+?=
 =?us-ascii?Q?opdLgTR9Y6TEAwjyuuA3JE4SoEb43usGTrR3ThTeWI67XxjwwpQ3XBplrg+C?=
 =?us-ascii?Q?iQxrURmvXAq+uetE8v93DM3mPbsfbJtb0DuH03tWh1P/U61wstKrLtrT2etD?=
 =?us-ascii?Q?RcMJ8OD14TR+Xoq+NFM4hLTLlObbhxtag+8dJ3rLd3y8kDmWu4m9O6fsSEGB?=
 =?us-ascii?Q?J86/YyRbw6GBk71VwpO8s/PU6bFGPhqXc4L8Y8LQqM51UV+QQjX5DwApIh4G?=
 =?us-ascii?Q?hPTEnNFnWjK0eVBTXZ5XUzQ58i/M+c6Fvv//5TCesW5WypjyOqNrdL8fy6tf?=
 =?us-ascii?Q?M0hhOsUCWqz+UcGLYe7A7xAbFPwo42hRf1o7MaIvkAF5mOfvYKiGWHLpzCrL?=
 =?us-ascii?Q?mIFxW11Qo3IJ/avODxLDLwYgn5pFjW8nmzDX6AgWHHg5e8+4aDOLn/2QFWc2?=
 =?us-ascii?Q?jcvZWL7TA54CxqBus+E7m3v8EBcpbVmqCQPcVGz5q3PSbP7UbAx0RA0scAWd?=
 =?us-ascii?Q?6nRczu18Ng=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ed8513-86a2-45c0-4b4e-08ded7444199
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 07:42:09.3327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJmH0bQxE9hhbVn7MUU8r0mrqjPs+OXF88h1xbrGzCGG2KyrgKQs1E4Zn7C8m3mfk+E8jxTAhBxH0+appzUK/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11668
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_004215_372473_BAEDEEFF 
X-CRM114-Status: GOOD (  14.42  )
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

On Tue, Jun 30, 2026 at 04:20:54PM -0400, Frank Li wrote:
> On Tue, Jun 30, 2026 at 02:04:54PM +0300, Ioana Ciornei wrote:
> > This patch set adds the device tree nodes for the Lynx10G SerDes blocks
> > found on the LS1028A, LS1046A, LS1088A and LS2088A SoCs.
> >
> > The first patch also transitions the LX2160A SoC dtsi to use the
> > device-specific Lynx28G SerDes compatible.
> >
> 
> Next time please cc imx@lists.linux.dev, otherwise, patchwork can't see
> this patch.

Ok, sure. Will send shortly a v2 integrating some changes generated by
the sashiko review.

Thanks!

