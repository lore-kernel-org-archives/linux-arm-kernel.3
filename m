Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C492C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 15:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BU5cln4uCzmlm3+6SN7L/b9riimPO4ygYo9TC06yUZI=; b=BEZ3kMLadQb2q6sGWVWeYXTJ83
	BANILDyDNTb5IbKpwbtg3HLTj4I9oUDF0eZbZVdhVEwi64k6tpJuygWaPOjC455Y83HtjsiJNhWPR
	XgBM8A969OSwL/aLn8d4sCkXQ9mksrePFhQ3SIom/n+WLMUUIYbPvrcxp/lz7fbasF5YmTL9obK1O
	/3AzfLa0mPKqoxtMDq5IeYJKXp4GMITrgfI41k9Efug6cgOG4BT46N0MkUP1JTNoHv634T3amGvv9
	rgN0qDFzpj155NxkST8/4xbsw3H21GGxaTzGVNUJH7wGkAzKJlVu2J/neT1Ob1DhkqVwQc6Mc+ASq
	RH7BWcEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thsBV-00000004IKH-3WKi;
	Tue, 11 Feb 2025 15:28:25 +0000
Received: from mail-northeuropeazlp170130004.outbound.protection.outlook.com ([2a01:111:f403:c200::4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ths8n-00000004Hbx-1KVY;
	Tue, 11 Feb 2025 15:25:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCpOvw/z9HwADmy5RAdusJ7Uc0rDb5QYH5DbosSBVEGNqfTGxZnU/3lZtlfAFvFpPjKLkO3wNjKlQ/qbrUe+8XeAgp2I4njKgsXuKeGcq/7GFzTDzZK7P40/wjYlN0RiDh9oTnb4ThZyf/c0m3tb3323ncwQYCNWgD5OpLHlMGHExqp4qlYv7nmEOnLxxB+N7gX01oBtiXEF/Z38JoJZ1gMs/J1fFS4c0BZNsQAsXetJiRgb9GVw+dGE0IrofI1zuzqnUoy1+aSeHDf94JkMUc/AWaLNVV9D9vRVQtZSS7Xk/sBc0qSgLjtmNlX2O2BfEErklHqR+2gegvUjqPa98g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BU5cln4uCzmlm3+6SN7L/b9riimPO4ygYo9TC06yUZI=;
 b=qoj+n/hECLYCgiwGwVh0HdEwyMZR7XJ7jx3Wn3ffUmXs53Qh66WzgSCT+j+Nl0iPJ0VXIT1CYxPmP7AXnjfAflYO9SuLaFut+PjjkwJ8TGruhtSdkou7mEy3Fziu+SUBMDAg8ZC0oZipc2PHp7Wj5sT4xkYFQbbi62dABm6ctvI8z3FglyPwjKco84cfut4dRnDeJF7jtaXvQwmH3fxsRMs3I7dSYqlC4Fkx0ZvxdWkka0tk2oQ7bqDrnaM807s8o75OT6/b+CEor0MD174S/ZxsJCvUN/K3mUxtPaCI9RwhTCXByhkeua6jhodq62xxReRWHgMlBMj2J5M7DKt5xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BU5cln4uCzmlm3+6SN7L/b9riimPO4ygYo9TC06yUZI=;
 b=IvUmq+3qc/4FX07r5ORGd8PUGt6umZ1sJsJoGJ+BynzwL7VHkzlWn5qZ7GwSvm2xuwX+LDAJPbxBHmWWmPomGZvlLXJQeo0PKKh7iWfD2z15FefgPXEoMsZ75brLHBLVF+51Ro7LLJRc0mpppxAVoeYl77n3DV43+HyD+VT3qoYK7Mf6TBbN73tz4PO2b0TaMg+SYpQCLdNQhrQ/cUWGaokVxRhMHt69d1ITrfxk2QZaqdb0bTCajM0SG/q1evD+mh80LW+uAd25Nz9ThEo+0F495zx//othWx+oZmXm+/2Y2kDyPFNm+VrYoCpjn1tVwHtBQId+YFXzjYjrCBB7jQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10996.eurprd04.prod.outlook.com (2603:10a6:150:220::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 15:25:33 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Tue, 11 Feb 2025
 15:25:33 +0000
Date: Tue, 11 Feb 2025 10:25:23 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Robby Cai <robby.cai@nxp.com>,
	Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH v2 01/14] dt-bindings: phy: Add MIPI CSI PHY for i.MX8Q
Message-ID: <Z6tr414dKK56atDw@lizhi-Precision-Tower-5810>
References: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
 <20250205-8qxp_camera-v2-1-731a3edf2744@nxp.com>
 <20250206211808.GA24886@pendragon.ideasonboard.com>
 <Z6UuR9mHhQUdnBEc@lizhi-Precision-Tower-5810>
 <20250210211013.GC8531@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210211013.GC8531@pendragon.ideasonboard.com>
X-ClientProxiedBy: SJ0PR05CA0206.namprd05.prod.outlook.com
 (2603:10b6:a03:330::31) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10996:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f197396-5777-4e72-4590-08dd4ab0535f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QDK5ahCR5/oJoiepkDaWWNUuWHRzl8k37bqTdPNcqv6tJZA3kAcCB6E2RjmV?=
 =?us-ascii?Q?dnThc67T7LLlvKA4N0L238cAk9vacLcCojJhwTqCBkt1xwMHYOzWaby5UzYr?=
 =?us-ascii?Q?jM7r2gel8eSBoNEm21o3uhc20ideQT1jj8taTSwaVUpqd42yc3GDhGh59maf?=
 =?us-ascii?Q?o1NDyHjOyNTP/nbRXYkpbFWUMsmm+Xo0wApWQFVQ1g/spHBfqaob6JQ4Mfdk?=
 =?us-ascii?Q?8SNsNxSx7Hi2n40ivy53aPTmWhcBUldFnguh63QySTjvLQUsTsME+UlYEv+J?=
 =?us-ascii?Q?vkZx2k2t2tftxlw7sAUmusGXLNu14K8xwnoW+gMRqyH+lALRzb/NqIxq0apZ?=
 =?us-ascii?Q?tZR4r+joOxGWsSnWXbdePmWrtMwTHOpRN/4I07XKEm6All5Uhhczredu9KtF?=
 =?us-ascii?Q?fQipFnB6xbTuOOiJcplhPzyJRvMUmjIPqJu9CqeXMXeEo+LNr5aFWoIzS6MK?=
 =?us-ascii?Q?XsNwhn3A6DCjtHwg5069lemsT7Qe56S9bCMvmLrhAIHFOmBZRsviAfymf6Ed?=
 =?us-ascii?Q?sFD5e+SToddars44glygJ+TRMZJ3EYVdJ5G1AoKVj4hxThF2ey/y+JAnWW8i?=
 =?us-ascii?Q?ElFUgw+sleI6IftW83SXh94WEcYaLKKUxi3WCWI7rkkQ7y/kNRqYIFCTnTrq?=
 =?us-ascii?Q?qpGF6/5Dk1zLrtb68Yl6MEbwvq/RMiCCkEKwA0tb+JNH7hfxGqx64j7OKVOD?=
 =?us-ascii?Q?55xiJvlIXu7pyLxZeY3mdXfX07xFx9sEcCOprjPbPOg4olVtQn9mRzlgyCqd?=
 =?us-ascii?Q?oXLRkDlMLcuAKZHz3iXWq31cLOuP2jlxXbg46Tej/kZmpoVm+PYf+0HD34g6?=
 =?us-ascii?Q?7P4CHtYl5mdJhAzhw3yELkAWpgZRB344TapRM6WNdDhDNcMATGxFX98/mWQn?=
 =?us-ascii?Q?Br35e1n+O5mSRIRcuGahW0SeFV6xjtqwaBGQTxubZVVuu3wzZ8TFHGFs0jjh?=
 =?us-ascii?Q?6MX5zoQjDnliYLaE4HXx33Tu10Dn1aB0MWBPoN+U9juFpFLJTXM9tlFlJ7J8?=
 =?us-ascii?Q?r7+ZBBDsHEMYIj9CVZPXNi/XwaU1DRaLzGPwJmxjCE5YVSLafmFGUVPFsuaV?=
 =?us-ascii?Q?d2qpK3srEGS1yJ35s4yJjIZTceXA4+8LNGYNVfjFxoR85y9Vsf9VizWD9X+7?=
 =?us-ascii?Q?O8L+ZuIOc48yflpPCTZL06TYIL/wwZIBJoAE/nTzsj3uUevejEm+LkxznWLN?=
 =?us-ascii?Q?8XbqK3xGBpv0WpMtFpAT/Yyo3AcAqj5EIxX9SUr85y0vQVpLD7CF9YSzQ+l5?=
 =?us-ascii?Q?AUNDaxzjmMuUHgGSg1lvQdjEhvMg4LUC+wAuJG5Bf1gI0SpyXUOBQaylllf3?=
 =?us-ascii?Q?jkcqvLCweLqpDyWZW71mYFuDbfdKfUrxik79Ydybolpi6jdFSm05oQSxBAMw?=
 =?us-ascii?Q?u2sJGiLckZB0b83QdK5wCfu8XvLG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QC/GlhcNEWIvdiVZiEkQ5Gbihc4CFmXWsQuRJ6XqUJ0ZkVOx58muVETbW2UC?=
 =?us-ascii?Q?PtLmcVOhqMLx30ZpyaGjpp590XasyNRF00Zcmik84o47uyiJ/O34qNudRgTz?=
 =?us-ascii?Q?uol1Ym2mL+4MSns6W9BmMW1J1j4qwpzIsAyeKk4EJSORPkZOafHSVzH655Tq?=
 =?us-ascii?Q?wPpLIur+4LHLw/ckBJ+MdvkEjM8rOkZgkJ9VC7JMVZLdf6g2iN4vVyyMn8SR?=
 =?us-ascii?Q?FGVis4Wl0fWla2YXnvOVbSqB2tMt//E+FMd6Jjc4XjjUoid+h3pZeGOoeAWP?=
 =?us-ascii?Q?y3udGys5dzUky7XpAJB8KyXHAI/UD8YAr+zvKp5mPdrRwHfjYYItG/Te3+kE?=
 =?us-ascii?Q?wIR7D9vBwjRumZXJfTdwWPb6QhLQ8rUD1mRwwjDjrcRQ2+XXpTVOAprAre/n?=
 =?us-ascii?Q?IQelu3MwgdLbPMNsmGG/ruyWd1Joxr8ZNS3XDSLYUzljFyJk0IAUKFsAhadz?=
 =?us-ascii?Q?qyYoMC2Hnf5PrqgN/0Demr1YjYv77rw1YaZ3wXtKgt22ksjXUbfdR3N7R0kX?=
 =?us-ascii?Q?ddVndioYOHvVIKndKzwv1sxVRC1FQp8CSU9w5Q2l9AChQSfVsvNiFZAsYvKb?=
 =?us-ascii?Q?3oJ7a/WqO8DADiHZvg4F5h1lODhTsL/GqzBqNW7MPPwr5ZuQJUeYHRdp+hC2?=
 =?us-ascii?Q?nqft/OAcWliDnXuSjM9xA8Z09+6HUZfqHAIPN6QTOWKXMF8IxEcg5BP31A8A?=
 =?us-ascii?Q?S1ct/sZzyOJQbCwipr1hZRoWA3vGCaO3B/gRG2UrJOvo9mo7vEsVdpfhaMEk?=
 =?us-ascii?Q?CBdDxrt3PgtimnwIG57nlujNSK++ckX9BUGIYOtMLbHY2V8BuwbxceJm1oMH?=
 =?us-ascii?Q?kbqU+U2l4fbLGEzB/D7q8Db35zUoGxmwXWLo78Jw0xGGghUFhUQW6hURayT1?=
 =?us-ascii?Q?eww6kaW8+erCC8dHztY8FZfsdxjpL0leDczjOjDlXfPdSrRDM/64rnSE4TT5?=
 =?us-ascii?Q?YoPJllA+DL6uzlHhgoP0mqV2eRW8GJuaQPVfXqPyq3kixrt9zXT9Bpp0WDWO?=
 =?us-ascii?Q?BExGcH3mFKnUb/yU5C+ScjcZ7pMfy619ITRsVEGQWJR6B8p4z6Dn4eME3oV7?=
 =?us-ascii?Q?MTs+bo5A7TeAoJfHaxwwSxIM7SkWEDrTJrmDZcTxYWU2LdbNUBjsvyeALmc4?=
 =?us-ascii?Q?yWwBzMX7Q7KMhpjJS8mEavhtjfq/xQFKOxOHRyofsk2I70Qf8RnGL1JxwUSO?=
 =?us-ascii?Q?e/p0+F/9ka8HYK7BbmYoe+5TZNWkJHRUPnJcOF96xYIaSmyLHlbc72hibwJw?=
 =?us-ascii?Q?d5TSdZKZbt0lcp1+jB+1hHEoZnZqgIx1KS2CpI3kQCdwFZHvTEKlWDPsV0i0?=
 =?us-ascii?Q?WIb72S512FkIsRPWP7ntXqID/FEY+Qkc8Ru5jJ40m8EM+zu1x6upYLnxApPl?=
 =?us-ascii?Q?7Qn4180zIufpuEdoc3rt3RaztEcykNpJHyL8mpY4jsXYpYo+nbwc4Ehv+rl+?=
 =?us-ascii?Q?gJVqxAOiWOpE0nNhrd2sa2BpnCjft6bj7QY5c0Is+o2RtOa2q2Y4JeA2sXSL?=
 =?us-ascii?Q?iJJwaGOJn7CUXCoz636/E/WuJUgSvxN0e1DVedDqSpBk8QwMT2XkVfNHQt/9?=
 =?us-ascii?Q?TQHlsBsz4VwJsK43sYM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f197396-5777-4e72-4590-08dd4ab0535f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:25:33.1584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1XBvi8jVJ3SFxmn04spca9PtsnuJAaQzoLYz9Nfuc60Yfmr/c+gMJAr9suTErxmpqRbF2lsYkS/lrDSVDliclQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10996
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_072537_383855_BA24E1A2 
X-CRM114-Status: GOOD (  38.57  )
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

On Mon, Feb 10, 2025 at 11:10:13PM +0200, Laurent Pinchart wrote:
> On Thu, Feb 06, 2025 at 04:48:55PM -0500, Frank Li wrote:
> > On Thu, Feb 06, 2025 at 11:18:08PM +0200, Laurent Pinchart wrote:
> > > On Wed, Feb 05, 2025 at 12:18:10PM -0500, Frank Li wrote:
> > > > Add MIPI CSI phy binding doc for i.MX8QXP, i.MX8QM and i.MX8ULP.
> > >
> > > s/CSI/CSI-2/ in the subject line, here and below.
> > > s/phy/PHY/
> > >
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > > change from v1 to v2
> > > > - Add missed fsl,imx8qm-mipi-cphy, which failback to fsl,imx8qxp-mipi-cphy
> > > > - Move reg to required. Previous 8ulp use fsl,offset in downstream version.
> > > > which should be reg. So move it to required
> > > > ---
> > > >  .../bindings/phy/fsl,imx8qxp-mipi-cphy.yaml        | 57 ++++++++++++++++++++++
> > > >  1 file changed, 57 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml
> > > > new file mode 100644
> > > > index 0000000000000..7335b9262d0e7
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml
> > > > @@ -0,0 +1,57 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/phy/fsl,imx8qxp-mipi-cphy.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Freescale i.MX8 SoC MIPI CSI PHY
> > > > +
> > > > +maintainers:
> > > > +  - Frank Li <Frank.Li@nxp.com>
> > > > +
> > > > +properties:
> > > > +  "#phy-cells":
> > > > +    const: 0
> > > > +
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - enum:
> > > > +          - fsl,imx8qxp-mipi-cphy
> > > > +          - fsl,imx8ulp-mipi-cphy
> > > > +      - items:
> > > > +          - const: fsl,imx8qm-mipi-cphy
> > > > +          - const: fsl,imx8qxp-mipi-cphy
> > >
> > > Why are those called cphy when, as far as I can tell from the
> > > documentation, they are D-PHYs ? Does that stand for *C*SI PHY ?
> >
> > There are already have D-PHYS for MIPI display phy binding. cphy just means
> > for camera PHY.
>
> Ah OK. I would probably have gone for *-mipi-dphy-rx then, but I'm OK
> with the proposed "cphy". Explaining this in the description would be
> useful.
>
> > > I find
> > > it slightly confusing, but not so much that I'd ask for a change. It's
> > > just a name at the end of the day.
> > >
> > > Apart from that the binding looks fairly OK. Except maybe from the fact
> > > that this device is not a PHY :-( It has two PHY control registers, but
> > > the rest seems related to the glue logic at the output of the CSI-2
> > > receiver. I wonder if we should go the syscon route.
> >
> > Do you means use phandle to syscon node in csi-2 driver? Actually this
> > ways is not perferred by device tree team because it should be exported
> > as what actual function, such as PHY or RESET by use standard interface.
> >
> > We met similar case at other substream.
>
> I don't like syscon much either, but in this specific case I'm not sure
> what else we could do. This device really aggregates some control over
> the PHY and over the glue logic at the output of the CSI-2 controller.
> Modelling it as "just a PHY" will cause problem as soon as you'll want
> to configure the other parameters.

I think your comments is quite good and it's one hack. I check register
layout of csr at imx8qm/imx8qxp. It is dedicated for each csi2 moudule.
This glue layer should be second 'reg' resource, which direct control in
csi2's driver.

v3 should be simpler than this version.
https://lore.kernel.org/imx/20250210-8qxp_camera-v3-0-324f5105accc@nxp.com/T/#t

Frank

>
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  power-domains:
> > > > +    maxItems: 1
> > > > +
> > > > +required:
> > > > +  - "#phy-cells"
> > > > +  - compatible
> > > > +  - reg
> > > > +
> > > > +allOf:
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            enum:
> > > > +              - fsl,imx8qxp-mipi-cphy
> > > > +    then:
> > > > +      required:
> > > > +        - power-domains
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    phy@58221000 {
> > > > +            compatible = "fsl,imx8qxp-mipi-cphy";
> > > > +            reg = <0x58221000 0x10000>;
> > > > +            #phy-cells = <0>;
> > > > +            power-domains = <&pd 0>;
> > > > +    };
> > > > +
>
> --
> Regards,
>
> Laurent Pinchart

