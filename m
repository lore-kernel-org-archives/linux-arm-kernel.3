Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C538C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 19:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSyry5i8PcIf5uM/c9HTNI/7knCX3mv5C54O05curLY=; b=qsEmOdOi3ChTLfEcEaKbX6ytQF
	k2B8fZQjoN6M3o0AprC3EAdExh5h9jvK664WestQg0FuyvZvCBBqq7tGC3zRK99iQnDhrcZpAOFti
	eRKfPL4YRqEmTaOk+w0oKh9adK+4NQk6NKDrX4EBw91WeWEhtavlZlYBelJf6AmDByWb8qI+2EF2d
	5JnFpgKtZABVxlY8MhIr7KDyOiICK+6x9BErnCkMwdRc+miYt986HS1UDgPw/wXfse+EGAyIgaQFB
	T/rRuMwkX1St0FZgZwXlbmJsLlvvDV+sFEIKHNuOxzKMjycvxXsjTqnGBM97RLqEZUpN4AqfE/F7w
	FmVxqqeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfksf-00000004NU9-0lwT;
	Wed, 05 Feb 2025 19:16:13 +0000
Received: from mail-vi1eur05on20619.outbound.protection.outlook.com ([2a01:111:f403:2613::619] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfino-000000042uE-0d7F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 17:03:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pu03NpcfIXwkaZT3D2+i0zGKi7UyDbnk1uMcKjGzzzDw5mr/pgl446QUKwPm/K5HtMHCvR0sM0M5ASAkbiLMVxbB7sFmzrUy2+rMg1QZjsSXcw31P0y4hQdE+YtsV+6/RbvMVgNkqlu/zRhF1/ijyCDWf6d74zyVBpGkk6OO2larvtkXfLRA1EcdADoKmHNJqVxFncpmR4ucALn7NPtxba5xOUbHnAIBHnZ9yadim/iL7XEldq2Fbxr0zK37zrwc/sK3a8+8kyZ8Xr3tOwiX1GM2KjRfOvRp/Md1ju0+0racHO/MsROhu2s2/fWYrlXGU2itCd6gv/MwR/Uusgc1hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQM7WnAm5om52SKag9mXWP2q2YngqVZ5W9sCENwBrKM=;
 b=kSDias6qrcK8Xul5N5F5grtbdHl6k67wavhm+laSQUlNIyqr7fq8fwNfJF1ZCQ8bWi5jTqOcqsM+9Wgi48+h4VQcvLHw/7GBe5r4jNA4soxCkXd/Be9fBw1JFEE2uvEvHua0sdfvF/NSW6ErZhvD8Zyo9G9A9QK5M9dF91MhPHuxVUDBI1lk3SihI8MEcey8TUZ/eqnfD8T/Lb4arW0ij7IwRoM7k/3G+U+xnU3tSMY6zEZ6KbTq10ZV+3QhNp7nInh7afkrNlYQeTztZzjP4rQXr8dN037oMQevH3ll94NP2Nu2wWWfe+wcBcE7N+R8m68u+HGotKmDfYg370dGpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQM7WnAm5om52SKag9mXWP2q2YngqVZ5W9sCENwBrKM=;
 b=X6cJ/bUhJHp2uSQGDiNnbpLrxtYsTNOJiKTV7/j8VjW18Rq+Aq2dhPIIklDsp8Aws1LMXkUvSDpLOz+Vn2YIFh+MUeHk9+fHv8QXXWDyxHDU6mu6f2fVIoCaGndTFblyWYjBIcXdLsCfn8VQ+tU+wkteVElmuv3H38zwlwOzHTRMgItZFdizCLdBmgxtsmpVd4uYozUbW58kXjh7e2iSo/oDbX/LiUZhwGbaRtwPYTqUNUSG4KpaK2mbfJhW3qt00MCoTG9sRQzK5mjy4E316kxmjCa7VbLSVyFf0vWwfpzgvtJnsHgUyd6PiQFGaFJPdm9DHefIJkMuTD/ClwR7zQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PR3PR04MB7483.eurprd04.prod.outlook.com (2603:10a6:102:86::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 17:02:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 17:02:59 +0000
Date: Wed, 5 Feb 2025 12:02:52 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] nvmem: imx-ocotp: Support accessing controller for
 i.MX8M Nano
Message-ID: <Z6OZvB7Fgg8tbQRr@lizhi-Precision-Tower-5810>
References: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
 <4961006.GXAFRqVoOG@steina-w>
 <Z5z0/382k8MkcZpP@lizhi-Precision-Tower-5810>
 <6396921.lOV4Wx5bFT@steina-w>
 <Z6OVKqy+bRLNa4GY@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6OVKqy+bRLNa4GY@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SJ0PR03CA0342.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PR3PR04MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: e0cca259-08ac-486a-7b37-08dd4606f1ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?pCl9v//GORFYogIzWPB2RwwlGvv4Tp6qQN4hcGqbfwwaS7drAcKAaiM/Fv?=
 =?iso-8859-1?Q?vwRSV+T2fPW+Xt5R4YLMoQgQqWrciuU+PTqsYYa/lq2emZek+uVDs+YFxy?=
 =?iso-8859-1?Q?WuFIh1PGt75uDX4dd4/4rpbXJIlKukm1sgsos1Hjtw0JIbgDDpTwg5Q9Yl?=
 =?iso-8859-1?Q?cqsCP2b//tqhbCjMCPrn23v+p/FNevx/hz5MvAPt8M6kvGEOVCdwJ6NNEO?=
 =?iso-8859-1?Q?qTPTRAkc0gleOwelIk0pybqcCsiwXLtX/xIiXc935FEpCc53Gu7kHivg+4?=
 =?iso-8859-1?Q?kqzhj1qC8KZ/HC1tAzyGZNR1v2j4sTYFeMuV5EM//ogZe77rZBOqe0zIht?=
 =?iso-8859-1?Q?U0wlX5JeRYFJLnzkER4ogF4mhl1L9Ody0/elpJmkTWQPowHZMCNUNYS/F9?=
 =?iso-8859-1?Q?7uDXflGZXqdmYGDP9tfZsfDz/DI4D8qhHcpap3Wk7llXVGDO03IjLVkMEN?=
 =?iso-8859-1?Q?siJWAGufTDqHDupCLO+QGHsRowKFooL6Dw2bsi72oJrpLS3bcA9ugL/l8g?=
 =?iso-8859-1?Q?DN/6YoHFK2gVBdrSjiHDpk50Sh6O9euTHRtmehIVM9/LLxGHgugeTccygt?=
 =?iso-8859-1?Q?Wxrj0MCfU9wdkvwWYte8MH371c5oMN69OJwD8D5zfdC3pdIug8XDXdtXOS?=
 =?iso-8859-1?Q?PaUqUol4vIvOvbL8QaD3SpLU1ntyCi7dToQbTRjYN5dmmjS3SuuW/zWWfs?=
 =?iso-8859-1?Q?+xA1303VTiifueKQwI4ru2LHe3WcWfY1TPy3ZeterESAftG+MouvokowUQ?=
 =?iso-8859-1?Q?yCefABlfh9wMfHMeTKtgyn+1y6CCfeHANABJinj1spEfeaOINONUiKB2KT?=
 =?iso-8859-1?Q?0GtaiU8xh5xU3vdng9FApB5sO39DAFgP3VrnooBnRjdkWEYj23xG0jcIt0?=
 =?iso-8859-1?Q?fLcl/AO5jwRJ/nzAYzrz/iOFAkij8jrZFy8aMKpBzN+PK1UFcKbeRusWth?=
 =?iso-8859-1?Q?TObU3c27/Z0uW8NLis9jF89HSf6QEhinQef5pqIo2LbFqcASbqGfFshB3/?=
 =?iso-8859-1?Q?X8eGza5jGeIzDMH491nmbf9OCp7jbbcWE383v6oPUvfH44jj1IlPZncUXc?=
 =?iso-8859-1?Q?HSZMLHtFPvL3tZyTyac9u8XP0YtCyqlRfSTnE7g1G7RTrY0FlFRwFpxEye?=
 =?iso-8859-1?Q?ENgDYF+P/Dy9XmqAkWsBxorNSjNcwFY0jG6tQu125hCvMPP5qU8wbI8+kd?=
 =?iso-8859-1?Q?gbA5WsSvvOhgjSWxs5JUXdZG+Tuf72PsswLgvF2PFsXl8qz2gPMP+jfvUo?=
 =?iso-8859-1?Q?B3mbtV+kbzKp+hlgu9qddBEiIq2RatY/74513aaeggYlDuM87xI57EiioO?=
 =?iso-8859-1?Q?YL+AepEVh8nCpobvp9Pk1FubY+adkW+W5D00GJ7y75DWd+r0FqeZrA/KsY?=
 =?iso-8859-1?Q?lLLr6tGna1lY/qNlCOQhsxoRNVCgUZ46BALJpSEOexOYs2oxpoajKJrlLO?=
 =?iso-8859-1?Q?75VPF0hYdW6tFx6E?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5EtSaz2pppol7jFP1p5bRe3ynpAAKV99yq4r/TUMpsDuEGSSNK2GvEEXpJ?=
 =?iso-8859-1?Q?cMwS2WhZpG+sayMrj+7DAXxC32bYgIBs+NKgqyIhal/2QPociqyHhjTA1m?=
 =?iso-8859-1?Q?HYeY8pK0iTkIj7rxQvhQzNe+VFFTevHwjh0/ZLnWLHjqMxl6e3Rshq4coQ?=
 =?iso-8859-1?Q?F29BhojssN0ndpxK1WIwNQ2wjnz08z8bcSYYPNhyIIC6sPwSewJEu6S4sH?=
 =?iso-8859-1?Q?lSOOuy2dyhYzawavqxP2YQTr0qLyhz8tVWWFsYPuQF1vi+WCBRnVWervwf?=
 =?iso-8859-1?Q?RAHFAJlLo1sB8bMv9cl57pp7nG1alBD47i55ctWF4fg0UNFLTBWPURAnE+?=
 =?iso-8859-1?Q?3Sz4XXSuCqh0oSYkkexsoXxn15lMFjcCXsVWk0sqP/hSHf6Oca0nRvNzic?=
 =?iso-8859-1?Q?2HOY7mipgUdyjksCcU4Al2jX5bnSBt6ZNHkSBKdXTqQ7g1Siz79T8/19jd?=
 =?iso-8859-1?Q?cCsm5nYqd/QBLrYwX9X4LFTmWs0PnIBWYAV+/PXgV25qIxf/wsanFRnIpt?=
 =?iso-8859-1?Q?sLoT9bVity2dpy642mu+Mujsge/1WekMR2dbT9XEOZLHkRPzNuw3rRgUKT?=
 =?iso-8859-1?Q?6LArbkysbuePSL6mIEmr9o72DcBnj7xErUIOlyeqdNtq8WZc95jaOjKfJf?=
 =?iso-8859-1?Q?jNBjHPqdgm5A1uYijUfjiPziZqiKIaQYEVGycnx64WbVG6f+DqUOVq9YXS?=
 =?iso-8859-1?Q?0CGT4g3ZOPN1DNyCMGahzT8wYg/xzrNu2Z8VFD4TLxYyfdpKZdridlT3uH?=
 =?iso-8859-1?Q?Gzz+010u/Ey4kddS2Loq+QnQv1oxVpb3SISBq6za24J6kTw0SQs/6TO+37?=
 =?iso-8859-1?Q?56MjfnajHmI6TW4Kx7+zbC3AqgYBfyeM6o5FYSDWpL9hSzGpxs+rjVN59J?=
 =?iso-8859-1?Q?rSWk8f/aZNswX9vPhqWJRVK0EG4WNeIAgEDPwPFwQh+iBQKpzsAwsaIUy9?=
 =?iso-8859-1?Q?0glLQF4dMesWvsYklKrCA3bX/VEf1xc57qOMJLz1OHeKa1cPnXEfFFqlyt?=
 =?iso-8859-1?Q?yItJLadL55rf8vB4FZ07zDbC3WEkdE8S7Wz/j12viPF83PH+d2D2AONHe6?=
 =?iso-8859-1?Q?I8HBsjVXXKvZfZxhm6mwkN2cNIi8JN9lJS03UnN2V7kyAbHngqtXiYVFjK?=
 =?iso-8859-1?Q?r7uGUwje+dkL3n8HzzVd4KwxLdV5BezYmsYhRVbyWFpVamBoTcAzF1JYmu?=
 =?iso-8859-1?Q?uCMkfJaMuoV1jXGewJ07PUaOrTmsif7M7Q0bP68/oVndxpoeWoQmixr0J3?=
 =?iso-8859-1?Q?JVyxtu05WUHugGVUZiMasfx00QjTAnH8LegLu9L3UjVxMn7YGs6iMmJoGY?=
 =?iso-8859-1?Q?KBmR44y5a0CuqmPkSWcW+1v/I3/WP65ECW3NNWjy7+JnqDj4DaIf/UD4KH?=
 =?iso-8859-1?Q?yz3WeCcqjI8wmXr6+3WRA8P0pwMQBC26F3vY71BqpCchMRkLgnP9sZY1Wj?=
 =?iso-8859-1?Q?wW2dV2i3M3HvJtnezhdMIMEedoDrv1DaYZzADZUTQocGX24xMP18EihEnH?=
 =?iso-8859-1?Q?/7odxa0kfblFWdmH1vJ+O+fEmz8O1xI+BFOBq8+HgYbmK+TGcPdyO206Fe?=
 =?iso-8859-1?Q?xb5EPI4RRSmJlw0lbjLBApmewrbi7bl0mmRF0N0CCZ17gnBu6dC1/y1F/S?=
 =?iso-8859-1?Q?zg6QbEV2aT6sEVFRg/Zq5cLl8lXYvwlvVA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0cca259-08ac-486a-7b37-08dd4606f1ac
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 17:02:59.6176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJplRDvzOYzhHSBzYpL+53e0ewhX+Pa11iTqx0p2qI3b4OQv8dUY9pUP7orjnSbLTUcBvlnoAJhJjqgvALHoqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7483
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_090304_192225_BE390A11 
X-CRM114-Status: GOOD (  28.79  )
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

On Wed, Feb 05, 2025 at 11:43:22AM -0500, Frank Li wrote:
> On Wed, Feb 05, 2025 at 07:51:23AM +0100, Alexander Stein wrote:
> > Am Freitag, 31. Januar 2025, 17:06:23 CET schrieb Frank Li:
> > > On Fri, Jan 31, 2025 at 02:54:06PM +0100, Alexander Stein wrote:
> > > > Hi,
> > > >
> > > > Am Donnerstag, 30. Januar 2025, 17:42:32 CET schrieb Frank Li:
> > > > > On Thu, Jan 30, 2025 at 02:01:00PM +0100, Alexander Stein wrote:
> > > > > > i.MX8M OCOTP supports a specific peripheral or function being fused
> > > > > > which means disabled, so
> > > > > >  - Introduce disable_fuse for a list of possible fused peripherals.
> > > > > >  - Iterate all nodes to check accessing permission. If not
> > > > > >    allowed to be accessed, detach the node
> > > > > >
> > > > > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > > > ---
> > > > > >  drivers/nvmem/Kconfig     |   3 ++
> > > > > >  drivers/nvmem/imx-ocotp.c | 105 +++++++++++++++++++++++++++++++++++++-
> > > > > >  2 files changed, 107 insertions(+), 1 deletion(-)
> > > > > >
> ...
> > > > multiples fuses for disables. This is an excerpt from imx8mp WIP
> > > > > struct disable_fuse imx8mp_disable_fuse[] = {
> > > > > 	[IMX8MP_OCOTP_CAN_DISABLE]		= { .fuse_addr = 16, .mask = BIT(28) },
> > > > > 	[IMX8MP_OCOTP_CAN_FD_DISABLE]		= { .fuse_addr = 16, .mask = BIT(29) },
> > > > > 	[IMX8MP_OCOTP_VPU_VC8000E_DISABLE]	= { .fuse_addr = 16, .mask = BIT(30) },
> > > > > 	[IMX8MP_OCOTP_IMG_ISP1_DISABLE]		= { .fuse_addr = 20, .mask = BIT(0) },
> > > > > 	[IMX8MP_OCOTP_IMG_ISP2_DISABLE]		= { .fuse_addr = 20, .mask = BIT(1) },
> > > > > 	[IMX8MP_OCOTP_IMG_DEWARP_DISABLE]	= { .fuse_addr = 20, .mask = BIT(2) },
> > > > > };
> > > >
> > > > Notice the fuse_addr of 16 and 20.
> > >
> > > Yes, I am not sure if it good idea to encode fuse_addr to IMX8MP_OCOTP_CAN_DISABLE
> > >
> > > like
> > >
> > > #define IMX8MP_OCOTP_CAN_DISABLE  16 << 16 | BIT(28)
> > >
> > > So dt-bindings/nvmem/fsl,imx8mn-ocotp.h can be moved to dts directory.
> >
> > Mh, I personally don't like encoding offsets into bits. How about using
> > > '#access-controller-cells = <2>'
> > and using the defines like this
> > > #define IMX8MP_OCOTP_CAN_DISABLE  16 0x10000000
>
> I think it is good. better told peng fan to align this!

It'd better use bit offset directly. such as

#define IMX8MP_OCOTP_CAN_DISABLE  16 28

So binding doc easy to limit it to 0..31.

Frank

>
> Frank
>
> >
> > DT stays the same:
> > > access-controllers = <&ocotp IMX8MP_OCOTP_CAN_DISABLE>;
> >
> > Note: It seems BIT(x) is not usable in DT.
> >
> > Best regards,
> > Alexander
> > --
> > TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> > Amtsgericht München, HRB 105018
> > Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> > http://www.tq-group.com/
> >
> >

