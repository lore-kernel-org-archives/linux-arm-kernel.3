Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8DACD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 05:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBYk9fv4rza+p4Owffy5bzWC1ek/oXhKWV+mkgur1rU=; b=qk5LkaYduiBAHQZ7W9++etpDzz
	eifDdklarxlQ1iGzkMTAVsfUl2ZN90kV2quHz0pHRNErGtJ3R2XEPQ/3UYLPg8fnkK+tceVtOwwot
	rJ96o3OVNHNdMdbxj90OLiCNYaEXLp8OsxhzAtq+WLzt0ZA0ItnmbD4TTSUiMpgNR0TbFOxQTI+fa
	X25gRiUF9eQndq6GH8S5mPz3gNaT7vT9+VtGZ5xnN+fCKcmYrCquNYEH0FtakDOe5uT+wJLTAI1Ju
	2Tl3ix54Myr54p2H48G7mBFvxoVKwNzLcUCJU1xTSebmptxjv1qkENvRze8qthecqd5hzgijjjcxY
	VKnquUVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSrQ-00000002rRo-0tPi;
	Mon, 08 Jun 2026 05:49:20 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSrO-00000002rRD-2SrZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 05:49:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7eTkLsIzMma09bP0ZHBPt2ybTl2HMn8C8j/43rmi+qU6oR5hD7bBl7zb1Zw228JMXzCLX32amRRLBOr13Lf805kfodJoWYRbLmofyVssxY7hOV6x95ZMRBwm83mVrqJqQWaob6uRrbDCKiGSZ1+Nzwysd/OdvOqB4g4ARKB0JOagDBx1p4BeKtJOL59LXiTzO2RPIOLTM0cAfpckonvh/Kb7Pb3YQxY02at9sM4dIGP+UWrfstSXRqasgl1v1lDwqIwqfV5ViXhZ534EUFY/NX8/wA2LWPl38Iop3ES13euoX2l81rekKdxPXgNVr3LqV3ePoPrfqke1eChdcPqUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBYk9fv4rza+p4Owffy5bzWC1ek/oXhKWV+mkgur1rU=;
 b=HonPzWPmkJ8vcRug4o1L+cglbOBOH9+Bb7UaLXtPFOgkX6AB6D3v9Zedy5d8XWdBg8hFHMZDOfbIjKbfyv4OeohNwkVumUSPIKAU/CwzJcaZdJHT4ibjOcVaEp1WRgTgFYzNNMMhtbKvtsypGJbzxjjMmzkkMJ5Tf5rT6d7ZWn8fT4ZoqDb7S+KgztDrlDXgHRg1wyQgt0xwIKC5PK4SYhaRHsZWnu05nYd5cB8ShjeeNVXSTfc8kP9AWzxbb9cw40x4VpjaeKFKtTOAwUGFSZ919YrmpzaBR71ffWQZuFYNID9jVi021nZg9eQhsOrUa8rHE+JTQyOxnNRF/hJzqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBYk9fv4rza+p4Owffy5bzWC1ek/oXhKWV+mkgur1rU=;
 b=LObkUuZfc3DlcI6TbRLHXBcELaW7uBQuxvq3C5vU0J68rGu3YL0q6j9rxZ5XWe1APHLc3SMo3c7NNqN8B6yU+boCEWNzwGqowFhtBX5x0yLIMsx5bF6jY1Q6sFTSZQXpt68Lz/KOA/Ak1WMvigSJIY1TpS3ID1Bn9emJ4HaNqS6Ia7RCtQRA/Avo7nXcWPvAT5alWSyhT1hcQqAW2j2RwElcEoNe+ESnWHxiYiJ2Lr1ltvqElhG0HzP2SkqLJyOIGV3b/bR4KBuHF9eEEQqy8YbTlz1yXqi/7sMNOtSBlhRPYUZEq0reWyd5rQ6IpQ77HtDJgY3iDqsyG69zrtxfdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by VI1PR04MB10004.eurprd04.prod.outlook.com (2603:10a6:800:1d0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 05:49:10 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0092.010; Mon, 8 Jun 2026
 05:49:10 +0000
Date: Mon, 8 Jun 2026 13:52:16 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 9/9] remoteproc: imx_rproc: Invoke the callback
 directly
Message-ID: <aiZYkLyiX1cDOYrj@shlinux89>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
 <20260603-imx_mbox_rproc-v2-9-a0059dc3b69a@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-imx_mbox_rproc-v2-9-a0059dc3b69a@linutronix.de>
X-ClientProxiedBy: SI2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:194::15) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|VI1PR04MB10004:EE_
X-MS-Office365-Filtering-Correlation-Id: d5993084-17df-432b-9c23-08dec521a99c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|5023799004|11063799006|4143699003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0vGlXQ05dZNa7XAAi6h1N0rzWY1wXO15gewCnwU/2WaDtwWFNYv+C/Yw2i6IYlZVe3LkrsDGQ/GCk5nguFDOFDLnFaXvE/OqBirYUdwT7jCNHZ/S0fDpb67VmtsGzXjDtMznYOY3E8E2LOT2livAY8D2WpmFH/4jFVi+wsLw1U6rkCI01JvKXvTLb0cFixx+zT3s0C73QbKFh01Ed2cMhdJNJbkjV1OzZN7oxZxqSs9JTNBPC4uW0W1U1zDs9N1X5AicNe05jhE22qa18ivINfs7EJm+SIRkMMJhbW/chQNFi6oKu5A0eXDVHZfkgDmJ/mXLa2RMnkoJCPeRZ+Z8NuXJ8OqXIgglRHEG/oaCvBYadtBoD3s3GE6rg0sxIETKik4qg7n/550BYaq1Ju5Fm8wIL1+HvhWyEG1dyk23imAekLn/xnOEw5Mz72YCf7Q/Mn6+MsJvjpEfbVoYvCzQ9wypPDul5kVJhBK6TNtd+YzDMuTmNFhGigGYk2elsMzRXJcK6PrmXGUDFkIZFeIUWVhPoYZNq7i1mr+jeQbq8nDv+WaX9Z2caGO98Uj6fGXo9zi/5tirL89oyc8qLgSCRjgg9nyvSPPQryNGIEgo6JCKD2cg0aYeNiuua7j/5laO94vS+Brk51Lk7IxjrEStVmI6qBOIdhPawaE7M5sqGm1Pj+/zE3ydT0z3UCbmAAMJv2YGKGW6pvKvByBp5mS0x8Dhk7v5zhtJCsGLxfTxMT1KvFl2Cb97GccfkKsoeeYr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(5023799004)(11063799006)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O0jPiB7EzwlZtZPKRMuKFx27qb8ADnoL4HoyaRnGILYXOCCJNvAZkOGm1O5E?=
 =?us-ascii?Q?eIfY/g+CMsKjUQ3J+x+e05g0VR1b/dIT1or6k9Lnb6bjmhDcN0igPqsqe8as?=
 =?us-ascii?Q?Zeo+I9oCTNfZci1Az/nXpSf7D4B7j4pcMClaC3tIIZ2X7+hqRa86Y0cdRbbX?=
 =?us-ascii?Q?eXkaEbamVpf0umkkfJUgP5UUAcW5ki9vyefO+KU/9ZKP6G6p/59WHq1dzHE0?=
 =?us-ascii?Q?RU4NSTemkRimRmcZUd00hPHOC14HFyWYQmrEaC7JmfQPhbRVaeysVedIAXpl?=
 =?us-ascii?Q?n8yzKdAwZ49Eh12h0zgoI2tc/MR7D1ss/i/XqPA8AZGSCWTF2zFAl5Xizor9?=
 =?us-ascii?Q?5dbTUp9p1V7oRaKWqpp8moXr7ijgufyt/7OTWMBxrZLvYCbDsMgS+1BLd1h0?=
 =?us-ascii?Q?uBQid9H7Lz7joEG2KFe+k5iGE6Lz1q5IdyllfjS3aluFm7PpdFLTD9IGM7Rp?=
 =?us-ascii?Q?EJzzzafywBRGQlWqxmHvUAkDlzRqq94MM80WmANpnKdXR2aq5CFTF5Gna2jI?=
 =?us-ascii?Q?f3yqdNovg+pRspe5bFBu0ZmIg9aA0iBUbsU9ZgaGlOi/m0BdTWrDGxvv+Dmw?=
 =?us-ascii?Q?P3r0zI+1yCdfUixIycSMBZRnKaw1FBMLyOCqg4SzDOq7YpddI+aj/RjH2Juw?=
 =?us-ascii?Q?R4sQQ/6V+OIGZM9yI1AM9mnsarc6DF+3dPPJOC6Jjm3pxsb6WDQo5zhpDHPE?=
 =?us-ascii?Q?OUPneqhwa00LeJTRIjzqzQdJQftn0+GcoU4HQW2re65FPlNmfLslL0TWWRfI?=
 =?us-ascii?Q?WaFtQy1MTf0j8PzFkRFJfoqUaUu9NpB+gz1PN4bIU8ruGnzzYgxSsyrHUAtR?=
 =?us-ascii?Q?veXa4XFxt7K7qZMT8lxvT52PJlvtakWK8LPznSQf/k7QFe/93tKbuNKyGbBN?=
 =?us-ascii?Q?W36JE9Z3sdi/fXalW7olZMxO5sOzu1zlQugtNnAzXTZkjZvpzIgodS+oLYKy?=
 =?us-ascii?Q?vgwl84I8CBeRLweyvc2WZ4GpWvqRx6ibhnZ91ZPieNd3tbOBTv0xdYweMyfO?=
 =?us-ascii?Q?Bsjc+QIhQKGw32vtJHEyJEO84TXdFDp8IW4IauNzohbOSbjBRi83S0b8TGJz?=
 =?us-ascii?Q?1NXyXiP9WJUBU4xXUfD/+9OixFIdNeo2xV5A/MT0FqevZuEl6OA9LvEu6p5v?=
 =?us-ascii?Q?WGtBwIe60w/IPfTtN7hLnlF3VN8JWfoskamhK9MGmymqrbdnawR2qX9UC9l5?=
 =?us-ascii?Q?SwDPWj8HEgDv4Dj/oULUy94E37XGGTMEpugZFDaRONFDnRpIFy9bz10LA0lD?=
 =?us-ascii?Q?jS0BgSZFeaR2Hjl4zLS1IOjBLKit/PB3q+8+Ip277L1K3wtHR6idY/Ihca9i?=
 =?us-ascii?Q?zLUQe2eFQSroLfgKcDi17RZ9x2amkUGUbDEpHT16E23xdKiUa11qXzloaqVS?=
 =?us-ascii?Q?b2ewzDXqKXZxb0H60lI5Sclz2cAC3f+R6wVN2upbfo941VM+oGrL4XeajsOH?=
 =?us-ascii?Q?+91BdddjYW7rQNAZz/9jpva/a4k1E3FM2KSAS2GXHfOz3yCptjokSI69UsWk?=
 =?us-ascii?Q?Gj3lH7o03lGiNVSH86gO29n6YPbDbvb//r746vI57KDTZkP2EAkJEP/wghxH?=
 =?us-ascii?Q?narTgKvYpml7Ant2Z3f8P9BhL5pGrz7ZqfiEeH7OlcMBqamZPP50h2yvCLa1?=
 =?us-ascii?Q?IRG4h6lKHpYuKWeBsFkzT2cO5V9mxtsnbXgQu3x+uw5E188UoN7q/Y8w/jdW?=
 =?us-ascii?Q?xMmVzgBFGCQAlKoxE9343S6fEZ8QV2v9B91vVL3y5nCe3yo0QdhT5ZvyoxQ4?=
 =?us-ascii?Q?Gn23Ii88Xg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5993084-17df-432b-9c23-08dec521a99c
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 05:49:10.4383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h2et36h1w2aEfo4nqVT2SoVRYyDbS0vpHy6cU3bkSR5Vw350gLxtxANNtcCGkJRvltnnhIXxTmXwtwWSKej1zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_224918_630566_DE88AF5D 
X-CRM114-Status: UNSURE (   7.96  )
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

On Wed, Jun 03, 2026 at 03:05:12PM +0200, Sebastian Andrzej Siewior wrote:
>The imx-mailbox driver moved the callback invocation into the threaded
>IRQ handler. This means the callback is invoked in preemptible context
>and there is no need to schedule the kworker for the
>imx_rproc_notified_idr_cb() invocation.
>
>This was tested with the rpmsg-tty driver on imx93.
>
>Remove the workqueue handling and invoke the imx_rproc_notified_idr_cb()
>callback directly.
>
>Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

