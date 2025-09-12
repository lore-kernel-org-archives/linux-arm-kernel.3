Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15D5CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VuzkyNZKkR3meXdDRDwpWYxxojRdzJ/W83NSFihGMXo=; b=3/FV2XL80xlZfaz9dEWWP5CmpO
	mULS3+SbHsQV9NFhu3HyKquPB4YVRtjydgp6FD0zuEeo7kIIxlezfVPeuUXZ1/ZdsPhSB+24Mb3Pg
	NRpxsvgdoqID1jVnCdUk3rxer0FH996SkbfHjirXH5vyGXp3PHpunFoPtixg3/Clrr/2rkPZuk7x/
	VPk1qjMr8On4DIYnQ+ieOdK1lpTDm/QjMSu26LdroKLNB1V1CmscsMm1y2sFyN0XPWab63xaO+U5F
	B45jsaKitKZekV44RIIZKlYmMcx//RyOJegpcuQxUdJ93l1uRvs0+jGGkoPiR01jf/CuOHr1cDZAx
	lgnVxIPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4uf-00000009xKl-1cUV;
	Fri, 12 Sep 2025 14:38:09 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4uc-00000009xJJ-2wtA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:38:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWkSSIBWUTaxzsDih2wtKUobXYFJpz8bYkSEUAMNyv6ZW9zVKoA3GoUT6dC9fbqdBLa5qCOkw9RIBI4IsaPdZFtpnp1Y01KRxKPaFXSjGvuhk/l8YX/e4GbpAKDQrrzsewRQXUE/DvkY0B2Q23mN1jXQbrl4WAH21yK5ABTGGsKxoRYIOBM7339zig1TJLbArWO4gWx4otORXbaxnZJ/BSKrcN+OypZAVAZwviA/VZbpR2I7a487BKe3S1glJBWaWp1NM+7N40OLryoHa05fFhmUf45pCpI+Cz0uQM2IE20qt/4PTspKodov5J1LYK9QsI/a2pFurncV8R/np/Ip/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuzkyNZKkR3meXdDRDwpWYxxojRdzJ/W83NSFihGMXo=;
 b=a5GXQL5+iYw+fZxWTR2H68bFCx4mVmHGK1roEK+glH1Bcxfl1edDCgPg5z0goq23NItITucScaQbOrFLU/9VJMtOG8sabv/jlWVVaEJ7sc/VwHDU/AYdXsNWMbwVAsyjiH3AJo19p7k5bqeJDvmpIrY2KIQtX3U84dYXgJq7QQ9MuZ5pVgLwfoCO2WR0fJjf6nZ9MrFhyFOxgrRFErmVrVkIwWy7exWvAwRlLvsBJfIznArWY+kOPawiP537a9OEU+k9jUfE1T1dzjaej4OcS8VACB5QR7uHaclWuavmvzlVHW2dXvXPuivkL5cO+1WV5s7wckCg7w9XYTXDLhLVGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuzkyNZKkR3meXdDRDwpWYxxojRdzJ/W83NSFihGMXo=;
 b=foXdZDKpqsnboktdfyP8y7kygXWj6JSlmBOuKR4/NBidFO08ns8tVlWOn3UxmS8ID56ccLgVHvwiZollPVlwVGOi7SEI8FsYjMyA/rwe5ZRvxXH6bp9hfqzwooIBGK6/PzsUPOncmEZl92xZ7Ph6WCdRahG6TocW8AsYJXG7FbPyJyDTbz9Ap7/5xbgpvldn8Ay/K5d9NDYEImkyIQtBHgAP3P47yTP3ptL0fDBwGURZhMelRMPgTdqfYsdggqIXzC+QmfL4r1xZR9rP1j4rqwztNpBGSYNe9slnmJ1ciREQfYi4FV+VCE0GmOosaJ8AHAeO7RtZ3SNEJzKo4g+ctw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GV1PR04MB10243.eurprd04.prod.outlook.com (2603:10a6:150:17d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.17; Fri, 12 Sep
 2025 14:37:52 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9115.015; Fri, 12 Sep 2025
 14:37:52 +0000
Date: Fri, 12 Sep 2025 10:37:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] remoteproc: imx_rproc: Clean up after ops
 introduction
Message-ID: <aMQwOI29hSRVsFD0@lizhi-Precision-Tower-5810>
References: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
 <20250910-imx-rproc-cleanup-v2-6-10386685b8a9@nxp.com>
 <aMGe/gwmFqjoFszg@lizhi-Precision-Tower-5810>
 <PAXPR04MB8459CABA152B6C1C122B35F28809A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250912061120.GA27864@nxa18884-linux.ap.freescale.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912061120.GA27864@nxa18884-linux.ap.freescale.net>
X-ClientProxiedBy: SJ0PR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:a03:333::12) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GV1PR04MB10243:EE_
X-MS-Office365-Filtering-Correlation-Id: 86dca44a-8b21-44d7-2b7d-08ddf209f456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|366016|376014|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pS+AzE0tgexzVnse+Ruw1IbQ8OE/WM4cbISpKjPJq7OZAjZK+LyZJDfIBrGj?=
 =?us-ascii?Q?V/oXHm1K1h4voEKM6gojzlbuCTWXb17WUkC0xbvCdkIokYMCVChl8uytfUTL?=
 =?us-ascii?Q?0GXC/mX/+Qa7tEL5Os3Ps3p7I9v9lo2vfL0OhZPyMJ4/1qNyjfNz7SwMA6m8?=
 =?us-ascii?Q?hCyv6qGGRLADKqBgyNtHR+abBKcugPnvj4m0ApmRYvM8XKmfVZie5EeaP72x?=
 =?us-ascii?Q?/0C+rEtTgBdKhOV3uU0oqSAHjpb0TxkFFkijLyclYzrRylLK3siuLumI92m7?=
 =?us-ascii?Q?w0YBPqH3gLqUy8KSXGu7hSy50hKtFAdqkMULqpYtDIV5QkR6IHWT14221KJ4?=
 =?us-ascii?Q?zKOjKXYe3UL+6tUdHHvOtvhqcteTJZBaRuFu3icT5vMKqYZjGPgitum6AraQ?=
 =?us-ascii?Q?0we9cays5oAHbZQv76mKksaxYgYxVI3/01EktUvjwx0IsOOdHN5hFNNl/0eO?=
 =?us-ascii?Q?7NlTm91pOrqPGMeXPjTDHkMjvxGjwrZKtQ7TE/Jz+BfBFnVicfcpTxSNUi5L?=
 =?us-ascii?Q?nIh5KDleOVJP0aRPDRhunA72IUBh8y894/Yqw9oVaU+N5sc7owjixpaPzH2y?=
 =?us-ascii?Q?ExGdIGq6201/N+QDVUcqO2pP6WG8ZXz8DXbzzqmpBALdxfXDUFix7aHi0/r1?=
 =?us-ascii?Q?TxcnIdtiWsWBJ1beGlWOC+Gp6+fzN5baA5lyzOlklC8oyDbslHYWzRJKvrqY?=
 =?us-ascii?Q?bdRFtuU2ixBetyVNkwx2+GeDUwjSf19n28cQcoNJlFRecbXmBe2CaZKqXxl6?=
 =?us-ascii?Q?ooYXEEBcvIIOK1bnzgBkD1GvQO0ABNCZqfklfBzJY9aWPVTw1Gp3od7Ctxvk?=
 =?us-ascii?Q?GG3/F4l2v5OgFeen2J5QB7cNiZRjdbUiC0xDa6hzxTWbp2DGWtuc6z5gc0Un?=
 =?us-ascii?Q?mWpOkvzQZB53ZDbQ3x5CYVnh5ftH+IRt1RYclgBZwu5x4lubWkLixuhcjGVP?=
 =?us-ascii?Q?xE4zA4DFpEKVSi5hUi8YBN15Fiv8CIhrUdQMA0xMHfKepKr03IphtDoUAe4N?=
 =?us-ascii?Q?h9glYRPonHLc51tpuJrAHpEkQZYMtlqtdFuiStEjtMCBHDV975gmoyFA8EMI?=
 =?us-ascii?Q?W3kK6GMGc6l5j82E+wLIhee2PbkTde3xAyTr1f2Ccm6vMCC4H0HkqsJw6VGO?=
 =?us-ascii?Q?KLhD2FKxlWEoIBLM9uvYREu3nlZ28rggppALaHczir5qgF8K0Z94LYSSmpbG?=
 =?us-ascii?Q?EtW/IIE2IsYGbwROKSepbtdPTKSOjLe5ClTpo7k+2z65VoT7Y1P+bzXCbm5V?=
 =?us-ascii?Q?bb/N6it+/jKEyz2o9yeG9Xt0SynpnGT63a7nX+XHJIg5GEmeQCMcJczFG92v?=
 =?us-ascii?Q?n2ykdj7OM4GDEWlRRSoxUOrcerYhqE0QVljkeTexa4u/XgIdrG2EV1bmHlLn?=
 =?us-ascii?Q?f9FqxcSAZoGvUAV4nZE4E0xe6g9ZRWJA1JiQxtc9wcr/wNytKqYwJ43nGjgm?=
 =?us-ascii?Q?jrwNez+NDg0ZR6ccJMF72YBl11taIcJDRHESi3ipmjuj2QYRMxODKV8JHFKl?=
 =?us-ascii?Q?F5Kohd+ID5EYh30=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7416014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YqqEZ7ChfpTUAPja3/NYXbXQvlg8tcZIXK1r+7maavoa0CLPDxCd06A3v9aM?=
 =?us-ascii?Q?itCPWF4tdjMRg4S0qH4a/Gxsj4W5bLHtQiw21QteaBquwJGqvS+4ABIFRCiB?=
 =?us-ascii?Q?YMb/mfForo2Gld5Rgkab9MZrZHCM6Cq9MjMk/XgO2Hri6tAw3sUSv8q4bPkz?=
 =?us-ascii?Q?KwuG5yk/c9tRLV5vz/drjNAScO654wNM6vfAJTntwf+HOpeUdJHXE73O3sAU?=
 =?us-ascii?Q?sbBCrR22ojdZkZ+YTwOm7R8PIo6XG4SRSbnrsBY+AUVEDajjm+Spr725xIiX?=
 =?us-ascii?Q?bznRpdTX4GKmiCSFYU7mIeWxPlxIb9Czzk7Hj5L/QCGz9EhraZ6j1EhuDR0u?=
 =?us-ascii?Q?pAUnl/Laa5Q+90xvJHfSenKYIY4AAwAxyCH8CCjYswC3be7zr0q7e8n2jDvA?=
 =?us-ascii?Q?UufiJf7InLpBA47E6SnpOtLvwNzl9mRZqggZuut8wmGnosJxztWiHjQux60i?=
 =?us-ascii?Q?Ut22j4vkeAvc8ihn2eTXmQthTDGWVmjIllhSre2lbKwn/J1W6QuG22KPsz10?=
 =?us-ascii?Q?nGnkooiBDEKXVWi/JNkSlLzTqxtbngugd4BUpCNu/2Sk0qdE5N2ZUmZ7wmg/?=
 =?us-ascii?Q?yTlR16PHOnorEzwEISuqW9eyKqFEvqUomwcFIinmXM9EL27QTS0rvknLKlVo?=
 =?us-ascii?Q?VUDue7dWl4BHQdrToC8zJdO5jCVli7fMUQSZpXhX40cHhsa4+5QimWBG/ZOy?=
 =?us-ascii?Q?h6AVQxlHY6WUNQt+PL9HW9PFZ9rErLqNeX6FOUIfo4p4sGm4sYDPZHrO13J5?=
 =?us-ascii?Q?aJ/+xa8OAbx1nhRgc9uJO4nul7lEQzEFO3UyD+gXS0iD6Fs0kYstBdIYJwiu?=
 =?us-ascii?Q?TjVJJUcKs3NEr3stz7Xclwoc1s7wVuUVoWyrP3H7AKTqUBP7b5IHMWcg2n7A?=
 =?us-ascii?Q?+crizpGnI7vXcIR5cvhkOBPpIHDZXjX4IKcrW2my40d63wubGjV/v7HA8S8f?=
 =?us-ascii?Q?thVmjC0pmSKKFSbviiUZE1kanoGwC7M38dbbvEEOxypy9DkPX7TWscrDGHBY?=
 =?us-ascii?Q?Vv5WXY2/3YbwHKDiAU/jwxNjtXDfuLfYSuxUB4hFK84D39HruUEjzCzKZutG?=
 =?us-ascii?Q?M2sZKKyYo6iQCPuPN/HMhGI68v3+6Xw92LH5eOdqdYaofRtE+mGSW+W8Pm6q?=
 =?us-ascii?Q?jShXUL8Xmt2ZV6wuY5nBm4iB7hOuZ5rlrivxI6tUp8mnWi+owEzD09Trj/03?=
 =?us-ascii?Q?uIgQJIoK56F7DYIyW+O9sifLAb7a8bJbSqydPf3ie/cmZf6BYdTb73bGXNo+?=
 =?us-ascii?Q?6qELy+1bO6pnaNOeFWnq2j504BbQmQhoxOrdgSfOlhg8cdgeZFdO2J703ein?=
 =?us-ascii?Q?4vP0NTwlO4AN+wV479RRz3arI7JscvfOOuprrDH5XBYXhzNsjRb+s3he1xpl?=
 =?us-ascii?Q?nJ/ickvLawOGaAMvNaU7UMesM9UPzF/oDqM6Nc2dXdWFNp3YA2xQNvQ/gAUi?=
 =?us-ascii?Q?wgd5wmscLH/ZXk0VpFaGD5EHrME3eqCnmibKH4jJR8/eK+46FZvN4TdyXOy0?=
 =?us-ascii?Q?axls6ZQjHqzsc2+LCY0j8OgIOzhyrHsJI8JAl9TkOaJSFMdIXeTe/dtmKRc+?=
 =?us-ascii?Q?EaDBUoL4uAaqZeSf1cP5+cAq0nxH8Rpw0PTN7zod?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86dca44a-8b21-44d7-2b7d-08ddf209f456
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 14:37:52.5310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NR1JxnCjX3PBj+/P2p4X5c5v/npuxjavskEW39BvKQjqtxUsqsHKH8YBWNUNtrMv752giQqxVfQx58oBHFxNGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10243
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_073806_743021_0E82DBFB 
X-CRM114-Status: GOOD (  23.93  )
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

On Fri, Sep 12, 2025 at 02:11:20PM +0800, Peng Fan wrote:
> On Thu, Sep 11, 2025 at 01:13:59AM +0000, Peng Fan wrote:
> >Hi Frank,
> >>
> >> Can you remove 'method' in data struct also?
> >
> >The method is used in other places and other purpose, imx_rproc_detach
> >imx_rproc_put_scu, imx_rproc_remove, it is also referred
> >imx_dsp_rproc.c.
> >
> >Could we keep it for now?
>
> The method could not be removed from the data structure, because it is also
> used in imx_dsp_rproc.c.

Okay! It is already much better than before.

Frank

>
> I have a few more patches to do further cleanup, but that would make
> the patchset a bit larger. I would like to see Mathieu's view.
>
> Mathieu,
>
> Do you expect me to add more patches in V3 to cleanup other parts or
> we could keep the patchset size as it is, with further cleanup in
> a standalone new patchset?
>
> Thanks,
> Peng.
>
>
> >
> >Thanks,
> >Peng.
> >
> >>
> >> Frank
> >> > -	case IMX_RPROC_NONE:
> >> > +	/*
> >> > +	 * To i.MX{7,8} ULP, Linux is under control of RTOS, no need
> >> > +	 * dcfg->ops or dcfg->ops->detect_mode, it is state
> >> RPROC_DETACHED.
> >> > +	 */
> >> > +	if (!dcfg->ops || !dcfg->ops->detect_mode) {
> >> >  		priv->rproc->state = RPROC_DETACHED;
> >> >  		return 0;
> >> > -	default:
> >> > -		break;
> >> >  	}
> >> >
> >> > -	return 0;
> >> > +	return dcfg->ops->detect_mode(priv->rproc);
> >> >  }
> >> >
> >> >  static int imx_rproc_clk_enable(struct imx_rproc *priv)
> >> >
> >> > --
> >> > 2.37.1
> >> >

