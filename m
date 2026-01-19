Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530B8D29C3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DyA8N8JlI85E26pi0nhpA9ePNKa9jLWnueySKnd84Sg=; b=S2sO08xkhnaryI0n3ZDL2nAH1q
	m8zULYbXDRhf5W5EuPJfElTjCHFjSJGzN0KUApDWumfZAVvovTtDGP9HL3QDdlAoPT6lY4K0OTw0y
	NHcYMyPfKDybqvMw0coV0ZaR8X1aXmTe4RrpjfoodAcjplvL0S8lAuNMuOktuFqmBxcU/aIuNQTTm
	9swaAXAUElCbzOFk2NHIdVL01x2/BBIDMrih7O1SCepufb5Ms0uQpdVczOrdWsRdYScuSH+1lbQOl
	fGUR+yTw4GqMElMLCgIPtlIzXhnBt15MrJT5Hl/XrMDfJbhjj64Oftuf+vdJGkbDtvw1X9Be8NdTG
	5iQ+sXZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs1b-00000002SWO-1DXI;
	Mon, 19 Jan 2026 16:22:43 +0000
Received: from mail-westeuropeazon11011025.outbound.protection.outlook.com ([52.101.70.25] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs1X-00000002SVH-3fyK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 16:22:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IsWHzq6XZXWzJpdGwi9kx5oEof/CD5isHl4xjiPxRQR7Q2LSx/EX/zZEpISGeFWU5f/vKD6dJCAV3Rqnz5TsTAyRZh2zPDULad683ZiPCnlDvZwxN6h9Z+8wMBCwsU+OCOFiNDCEgw8z2m+C/jPEaZ/HzYjECn7XiOxKkYojkLuH6B40i2V0qzJm6/32hZT8xbvoHLyuz9SMsuks7vPb65krD5sJ6MjqDWPkp27XNBXlLlw6SYD1RZyx8n9gn7prNdXy0OwSd7FqCAaYYn3lJmegBb9QWeg4UVVKFesbN/X8h5+YnqDOW3L5iphgq5FVZ3JQ0RVOVWphZ30MKmz9jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyA8N8JlI85E26pi0nhpA9ePNKa9jLWnueySKnd84Sg=;
 b=rvitkpkyrn8PgpwVchwXQAg4/ch/sNZ06EVVnhWCjodSfltmKjFVBEM5X8olZvUSAWVX9Csxsa5RhG1ij7835MekWy6BBwsJ9modT3k5bJNg5RZBo1w08qveztmydgOxTh8hBmlDfuohZ4xUDNNFzxPCXWyw6egPHYS3UMIlLt/f0ZcASHC+luHmA3SMg7DXTlwO3TsCReKgOQ32PQEIZ73z+KDZ1xVQir9jkccxs23JaztMIbANiNG8ORFtZYU3jh8ffUk0XO4HRRAbCUw1mC+HaoyRnXkeVIQIyXtoMdlgo39ItDf/pSqRL15v8SXSuQD/WvAlUtTqg4m2Yuwsag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyA8N8JlI85E26pi0nhpA9ePNKa9jLWnueySKnd84Sg=;
 b=GWxqwxu5Dj8RVqL4LhgOlv4+nTcOydfC7VzLQnE2W7Jpa6xPZU2QPIr7nROqKkV1PvkcFFqkanqvWs7whUaKVyVzum/pdSTS0cIbjRVq1KyGEAYAePu30/p2l27/8wJhbghIJhlYbt1nbTELv3lVzGt8eJasCvMzRHYMo9swKWs86ksvsHYv4Ec5eO3369jdtHUpNE69F+ZWKpgJA4Mndp23A4cxWQ6+H3Wwd23T7cCfwMf5MTgymskGoIyoVD+vVJZybDZeR7RAcgkhpO7PRd1PQCDHJFwzDq/pUJCMY0pmgHNJOclvlsRNH2sSkrUaJBkuNOxH7pImTUbUFeBhnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PRASPRMB0004.eurprd04.prod.outlook.com (2603:10a6:102:29b::6)
 by AM9PR04MB8400.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Mon, 19 Jan
 2026 16:22:34 +0000
Received: from PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd]) by PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd%4]) with mapi id 15.20.9520.009; Mon, 19 Jan 2026
 16:22:34 +0000
Date: Mon, 19 Jan 2026 11:22:24 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: hongxing.zhu@nxp.com, l.stach@pengutronix.de, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] PCI: imx6: Add support for parsing the reset
 property in new Root Port binding
Message-ID: <aW5aQK2z92tBxIIV@lizhi-Precision-Tower-5810>
References: <20260119100235.1173839-1-sherry.sun@nxp.com>
 <20260119100235.1173839-3-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119100235.1173839-3-sherry.sun@nxp.com>
X-ClientProxiedBy: BY3PR10CA0027.namprd10.prod.outlook.com
 (2603:10b6:a03:255::32) To PRASPRMB0004.eurprd04.prod.outlook.com
 (2603:10a6:102:29b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PRASPRMB0004:EE_|AM9PR04MB8400:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eb64903-2797-40ff-3d02-08de5776f3be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KyntMoFMA/ZO6Jvxd5Tf7LECUOmQXfzUxfHhmjFLGrj0/vAD0bv82CkZEHkx?=
 =?us-ascii?Q?Unv/9++UL3Ft5YDO0HGcprcWPDQZ59cY8ghVVR6BrZ5NWoIkI6yAy6kKUxJl?=
 =?us-ascii?Q?bF/gAHl+YpRmVJbCElf3MCtdv/cf2vkZm/YTtCpj6uq1sQHjeA81ylv4iODe?=
 =?us-ascii?Q?A2x1DdeCJHhRkw8go14Ecq03wryPaWjVPVuA7ReDfxSZBzofFm/cIaw5/NcI?=
 =?us-ascii?Q?8/+2w6F7zE2ZHF8UvODNYCq83wws2HxDH+OC/tlfBJ4PjL1lgdZ0oiuRx4WW?=
 =?us-ascii?Q?R4uSTjic+tkGLz/KRgh/9OGrA9QxTtphyCItx3dhWjBnd46+MXH4p+32Qv3z?=
 =?us-ascii?Q?3FWQIvUcBFhT7GdkkxB4y8+kKhrpS6vhCXg8bU4wWVl4KyyqQ3s6hPEPfVk1?=
 =?us-ascii?Q?RatZvZO0A+T0LQa7lbbT8JaTPVSSSwRubH+xyEla8xP1tjdqvzREgM2/u5jp?=
 =?us-ascii?Q?2EEn2tI+Df05HG7fM+IMDFgRMYYSoFqHOZ/F3YMfmbXbaatCrW6lK/GpolAG?=
 =?us-ascii?Q?qThsdl5H4kT21v085YI/RmHJDUqYQXQ1bY7xpy8EunFRa0mNxLsJG4iGpWYq?=
 =?us-ascii?Q?dcdzJXcExoOUevkEAGlhajASVyzgwtmZY0wNPzPaCKMGGPyFZjK1Wwst7pBc?=
 =?us-ascii?Q?Sz1lDBI0oklX06XjTmaR4My15nJqHzAqho57IyeS/oGTgDwOc1kb3DQk/HaE?=
 =?us-ascii?Q?KgKJBmQWsK9MtY7bUBmhsshCH9Uk/Og/lCW0F2A1Dp9ssqYTh5bLWhAR5VKc?=
 =?us-ascii?Q?9SYuyb+HbbP2l6YUxP6NLEXKiI1XCn1lH2TOL9TBx27iunSWCmrm1kfAR3aM?=
 =?us-ascii?Q?IcLB/h28rx6oidrSJd7x4fEMBwuynrhEyxLFTUDRU+sJbVbFHIwaWyuSopyZ?=
 =?us-ascii?Q?KzANFA3nV5K7PA1IzRVYYCnYbGduMjgHiempNSbtmzr4C3iIDY+6pUiOxvWH?=
 =?us-ascii?Q?bhJCbyN+vsWwwdsUnXDI1bOUIfOhUypRMyVTYCWNLrdzM9Rih669yr+++BDE?=
 =?us-ascii?Q?2L2ZLAB1N4lE4LSOFMcce/3HrNJhEtInYoVXcpm4k5A57iWzt9lapQlTbtzW?=
 =?us-ascii?Q?8PzcMyj016AyJuvBMEsGSDbYVZ9KtK3Jenz2OPbtWcGMcIqOZjVw422VApjq?=
 =?us-ascii?Q?nc8QzPpqPoeehNPJrQyw6mVkyzVvq7hdo66/CR2aK9qbv0ajdnFvyzV9MZX3?=
 =?us-ascii?Q?XTHzjkgAI1dNYD2GBelAqnHNHtKD4LxJ5pRU2TQ6okU3GIj4vVRv7AxIhGBS?=
 =?us-ascii?Q?PcfNJp+ssoNdh+FSDRQ37ft5B83zAb77qg8aPUAPEvNZ0RzMuhlry5qtZ84X?=
 =?us-ascii?Q?+ZoBeuegPZ0/NLE7ENgFmFF9AneadBVk/W7Bx+uYxEQw3Msjb+OQ8ziSXRD5?=
 =?us-ascii?Q?kxy76XrzsSAWrKvXf9ouicq3NYDiDHNGWjTe8FuwK7RezNM2BObbenntVLw1?=
 =?us-ascii?Q?camktbg+Cm4C8PzqXzutKJII35A7hjY3pAf39iEpFRwRtzuTXJwdXkwd3b3K?=
 =?us-ascii?Q?GMipn54jXZdOABF+4P1xNXZ/NMT7LOmRSbI9tdZ/nzN0YNbdpmCGx1umfGra?=
 =?us-ascii?Q?494NA0euEWHmWXQQTsKo8Y+VbYuPsd2++Lih/h0HfelR2PFvn72QxMp30tu7?=
 =?us-ascii?Q?eCwFdlDWTAY/HYchgi5JgQk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PRASPRMB0004.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YCqWqoCusfown09RCs3cp3zDcgn0TRiLHywaIDwPzBcT2jQeIW2nv8HZqeB3?=
 =?us-ascii?Q?84S3WnDbxLmT8TZlR1L/G0skDSHJf6GuIdS9jwTOVGJnssKoOJ39ZGVyfxmI?=
 =?us-ascii?Q?UuR9qUIZQAnBXnOEmIA2Y/usmlGSDLP1OJ6ifplv7ci/oRTtvYGGbHqjA7Ko?=
 =?us-ascii?Q?E6sbEl26k9qVjZ0UFIGz4KkHbfVUjL++uMk5lYRami3K0cej2ednNYon+5Wx?=
 =?us-ascii?Q?N8bgH9Ug++yuyyd7b6I0heBKgA0Vng6ZLA9Oz5noegNHOjY8opof3Ly8OsXk?=
 =?us-ascii?Q?sKou8IViTorwbfVm0HOB6z0QpRELMA7goDUkNfkiyS1o1a0w5ypfjtzJa4Ig?=
 =?us-ascii?Q?HcJu4jYgtnFXoek9yMrZQxN5yuM0hFWHToIDAmOT/l58YJFKwxgtwDRQyGiq?=
 =?us-ascii?Q?jKNQ5vmrjT+wuOzm3ZWDRFQK/53Ck7ykLa5Po3+I07dqfxo7dA0fSSmQjExx?=
 =?us-ascii?Q?+PFA6MeXDQf+b9bW9VIg7us0o7Q3t9IX8KmwIe9Z6ApPxoXvDEovxM4TN77B?=
 =?us-ascii?Q?djQqmv8fKloy72c/k1VvEDYC7eQEVvIjlGLYvPKYwNBhTIffpgE/3hwhyVWu?=
 =?us-ascii?Q?S1J06KnG3Lev+xdg08TjfP022GA/rnByreGIw0mofmgyiRxdB/gEXlyYUUWC?=
 =?us-ascii?Q?TQLOkNZFV/TQzht+xNMV/j27R+k5cOjbpMqeILRTIqPHAwM4DScHgZ3L1DIo?=
 =?us-ascii?Q?O2yamGcOBZ+MUmpJ+0sw1SZoUd9s6ruyTI9euanE1avUT5MhnM2ZJTkW0oxG?=
 =?us-ascii?Q?d0bHzWyRD2jpJscygavQGtIZp2y+3Vo/KE2EMN552y0AnbzFPCY+m+5KO21h?=
 =?us-ascii?Q?x99HRFXB4oFUBteWkNujdgLACx4t5Ap0jyofoWdNZKVgcd9Mvm2zDChcJmL4?=
 =?us-ascii?Q?utK3QaDis+LW97DRlikZDHm/73Acb3O3PXX+BJ4fQqNXsNsD/nPB0E8eCIuC?=
 =?us-ascii?Q?SR48XLd+7c01gc0BjQu2kAP9/14y0qGYO7dMPQrjJ/xJGA441B17bV8eBHEm?=
 =?us-ascii?Q?z019ugrzKXGiRXPog0vHRk2Dj2knrRKHlfHa6SSKxwiShjKVGlZNVNNkNe1p?=
 =?us-ascii?Q?9XXjckBcf7eeRWSyEngNTCfM6O3Ks+WVd4KNNoIj2Q3la5yFelmpBvCO+eaj?=
 =?us-ascii?Q?Qb+Qm7pFCp0HS1j+add1M0/UsJS+dTqOzJvJt22TbAK2wwRq6CT1vgzUNkcr?=
 =?us-ascii?Q?tgan2SFA/F0gAm7d7XXHyxJNjG4HMiFlRlL1NuoncwRwLBsDxneCg17VWfDO?=
 =?us-ascii?Q?5kuUD3sPlU4RkPa/66S6Yt6ZjlZNLkhQLpCRojiqtTZuZFVgk5+Spvkvo7uO?=
 =?us-ascii?Q?aALDRrKNmWdaXCJ8tUSx6+pZ1YpKDRhFGNcT0OSUiU3iTCW5f1EH5spcgGR4?=
 =?us-ascii?Q?XuG0OfZkOVt2L1lrnWSomqJZDFGzrPG49zV5EkDFvXcYwLlQmhyJGTE+kZpA?=
 =?us-ascii?Q?SLugqyQpFDkbfUIPwKqnBkNbKp92TizWqRHTTDNgw9XlLhj3WIJB3lPILAcC?=
 =?us-ascii?Q?JLHcZNYu+FddcqK0av/wxCkpS0Cfu/ibAjxX2MkLk3jU4KLQ6mqqC7BOQzRk?=
 =?us-ascii?Q?hrKBJwj8k7v9ZYL2LSGuWToKbekgq4R2LQIBcYqAuTM9nSMiRnG4ZY2H5Etl?=
 =?us-ascii?Q?j8JNe9D+ZwY15fGSklOxpFFmMtH/WSt5GpViR1BWUqQdRszzk0L3/IaqyzsT?=
 =?us-ascii?Q?UvgKHXim9l7jW3ghPSY3mzd3obhu0H0Cy57uSpoKR3ZmHOdUcBHcV7Ma14z0?=
 =?us-ascii?Q?7dvwAibm7Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb64903-2797-40ff-3d02-08de5776f3be
X-MS-Exchange-CrossTenant-AuthSource: PRASPRMB0004.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 16:22:34.1822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qsy69vzxxymbad2kvjAonRsPyAWMeqV6J96sHVXf0Ege0jgN02pTseZCxmeouo+VBM1eKLKumSG6xZV6j0XZmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8400
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_082239_916878_468EE333 
X-CRM114-Status: GOOD (  28.13  )
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

On Mon, Jan 19, 2026 at 06:02:27PM +0800, Sherry Sun wrote:
> DT binding allows specifying 'reset' property in both host bridge and
> Root Port nodes, but specifying in the host bridge node is marked as
> deprecated. So add support for parsing the new binding that uses
> 'reset-gpios' property for PERST#.
>
> To maintain DT backwards compatibility, fallback to the legacy method of
> parsing the host bridge node if the reset property is not present in the
> Root Port node.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 128 +++++++++++++++++++++++---
>  1 file changed, 114 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 1d8677d7de04..0592b24071bc 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -147,10 +147,15 @@ struct imx_lut_data {
>  	u32 data2;
>  };
>
> +
> +static int imx_pcie_parse_ports(struct imx_pcie *pcie)
> +{
> +	struct device *dev = pcie->pci->dev;
> +	struct imx_pcie_port *port, *tmp;
> +	int ret = -ENOENT;
> +
> +	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
> +		if (!of_node_is_type(of_port, "pci"))
> +			continue;
> +		ret = imx_pcie_parse_port(pcie, of_port);
> +		if (ret)
> +			goto err_port_del;
> +	}
> +
> +	return ret;
> +
> +err_port_del:
> +	list_for_each_entry_safe(port, tmp, &pcie->ports, list)
> +		list_del(&port->list);

you can call helper imx_pcie_delete_ports()

Frank
> +
> +	return ret;
> +}
> +
> +static int imx_pcie_parse_legacy_binding(struct imx_pcie *pcie)
> +{
> +	struct device *dev = pcie->pci->dev;
> +	struct imx_pcie_port *port;
> +	struct gpio_desc *reset;
> +
> +	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(reset))
> +		return PTR_ERR(reset);
> +
> +	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return -ENOMEM;
> +
> +	port->reset = reset;
> +	INIT_LIST_HEAD(&port->list);
> +	list_add_tail(&port->list, &pcie->ports);
> +
> +	return 0;
> +}
> +
> +static void imx_pcie_delete_ports(void *data)
> +{
> +	struct imx_pcie *pcie = data;
> +	struct imx_pcie_port *port, *tmp;
> +
> +	list_for_each_entry_safe(port, tmp, &pcie->ports, list)
> +		list_del(&port->list);
> +}
> +
>  static int imx_pcie_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1656,6 +1742,8 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	if (!pci)
>  		return -ENOMEM;
>
> +	INIT_LIST_HEAD(&imx_pcie->ports);
> +
>  	pci->dev = dev;
>  	pci->ops = &dw_pcie_ops;
>
> @@ -1684,12 +1772,24 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  			return PTR_ERR(imx_pcie->phy_base);
>  	}
>
> -	/* Fetch GPIOs */
> -	imx_pcie->reset_gpiod = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> -	if (IS_ERR(imx_pcie->reset_gpiod))
> -		return dev_err_probe(dev, PTR_ERR(imx_pcie->reset_gpiod),
> -				     "unable to get reset gpio\n");
> -	gpiod_set_consumer_name(imx_pcie->reset_gpiod, "PCIe reset");
> +	ret = imx_pcie_parse_ports(imx_pcie);
> +	if (ret) {
> +		if (ret != -ENOENT)
> +			return dev_err_probe(dev, ret, "Failed to parse Root Port: %d\n", ret);
> +
> +		/*
> +		 * In the case of properties not populated in Root Port node,
> +		 * fallback to the legacy method of parsing the Host Bridge
> +		 * node. This is to maintain DT backwards compatibility.
> +		 */
> +		ret = imx_pcie_parse_legacy_binding(imx_pcie);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Unable to get reset gpio: %d\n", ret);
> +	}
> +
> +	ret = devm_add_action_or_reset(dev, imx_pcie_delete_ports, imx_pcie);
> +	if (ret)
> +		return ret;
>
>  	/* Fetch clocks */
>  	imx_pcie->num_clks = devm_clk_bulk_get_all(dev, &imx_pcie->clks);
> --
> 2.37.1
>

