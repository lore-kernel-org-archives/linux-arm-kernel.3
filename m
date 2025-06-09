Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832A1C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 08:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxH8nkj1Rz+G1cx5NPBEqnafd6wK7A8OWk3Q9AToeXg=; b=ZGlvCy3da+IEtjioGhVPCcSi7D
	3jDq2ksmD+ZUmdhyp81WQheQRb7Pm2sXmL+jLPNsxoc0Il2sKVXHgHbsynq5VMgrKoddTuQQhPsiv
	gCV8/n2Jys1GRAzl/hUjKeOJKX3N+4KJsbwDNDgiTV/zbYfJiayhML+JVh2PnyTLfCcUx91/jRk7j
	82ypJi+Y+Pv8pEnaWcmyD25DUYZgpllW+UI8nohdwg2AV+TuiN+iNyDL1UBCBdKTyNTq8SwhjxbaD
	lYx0nC675gilCXv8cuNYMgl1s8g4fZTr+CTuBDPpc5wQbrKv9l/QOzrSnWcARCXDLOOEMzXhG114V
	73efV6MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOXu3-00000003fMR-200t;
	Mon, 09 Jun 2025 08:30:47 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOXrv-00000003fCZ-3jt6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 08:28:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnsLGX2+j4JT3ulAqgGXbiceO4FXJMJxklpL/yNgg89MCVmXnFJK1Bw555KfEN5juKSaA7y/xjcZNo69RbILYfpGEQUD4Se/pK/DNaBSgKB88qdfilL562x1f0tRmV7ZvCHANCg2515u0Sm9CfA3hfriu2z/BoBsBrodMZg+YS6jmcmCO2zWjpa93Tv6J8g7cKvIplssFG7WG0n6Z7Ozr5TBBlhrzMutGzAVm80bQH2pkL5C9frTLl5KuNbVpWR3NOhnwsWzSv3yIdnTfWWU4JDL32zkFlCOOLR8s3jJXGMcgI8li5YqoxFYCnCOWUPMAAocCOcySyvolZ4lsC58IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxH8nkj1Rz+G1cx5NPBEqnafd6wK7A8OWk3Q9AToeXg=;
 b=oZPAuaLw+dKUsGu9nvVNyMKkSfsgsASI7jzUEC9rk4OMFjYW+wL7Zh7xV3jL1Fp8bXumFL/kSgcKo73CjJw+kHKVbY5pAF0djMZdn8t2gsfGgDr2lv10DWgQkV8c8+BEqPzOIPzxTYbwKnQkGK+TBK1rUXe93Lc+Bbai/zcS/0wOvI5ILmcwcW8mVhXU+QunutgPHrTjAJA4ajPE1Oqt4fxsCbk2846IVuWpGtqodZA/OYubODsC14igcyOMTX+QIV+wpIsrk25v+4xwZUbE8dYOi0HoSHlwbg6ZEFFgOCWwzJpgB/eB77JLi1ozoV9GGMdgjg1wMNYekVcjO7pTzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxH8nkj1Rz+G1cx5NPBEqnafd6wK7A8OWk3Q9AToeXg=;
 b=cVt9GWpc1FL7SAhWp3dfYo3RMM0h5buHYyeR+LHFKJ71NWpL3VSDcUrhJsHOex2vsp5/sPTYNUKfNKloFaKZYIq87axKl96Td6Tocr2F6Fp2IhlXvpa9Mv9c7o/s1KQ29bXT8PtcT/QghCQnp1N0xToFqgS4VG7Hrinbu1zDPSSSJe9n7U5ZQox6x9/mwOHJFRoJo6nDswfxItkPUYeGqvv4Fi1b0iNRo/4gigTi/Pe7R8Lnzo1lWBinoUPiMm4J5NVq5Ren58/rxnTOiwtSqePMNgpC6fQvfJ8yu/4C6gECK+Et9UNtHLzvYnnKkjU8ZubUkK0Dp4lOOGXz47w3oQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8037.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 08:28:31 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 08:28:31 +0000
Date: Mon, 9 Jun 2025 17:38:37 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 03/10] ARM: dts: imx6ul: support Engicam MicroGEA BMM
 board
Message-ID: <20250609093837.GB13113@nxa18884-linux>
References: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
 <20250607093342.2248695-4-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607093342.2248695-4-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2P153CA0002.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: e4470274-dbf1-4622-9301-08dda72f9dc6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FI+glytG8+IkBhc5Jg9D1pA73IyNUYoGR+O1ev/YtT8ecqg7StmVC3ieaqys?=
 =?us-ascii?Q?t3NEwtPm6UvKnBkgVKTnRsBPti6DSdBPOkl9TK3bLKHaUe2VB1525hb9Y+fe?=
 =?us-ascii?Q?33ZQrq5G2C+nsUIb1HaaRBIsXmJaC7EzuxsEbt+Mac+UXuQyzxQ2Hl1w18Ly?=
 =?us-ascii?Q?W3KoUTjstQCWDmh3DP/V1N8imDbbq9g3FH6yDDR4V2BJOjA/N4KQm6W5H7hb?=
 =?us-ascii?Q?+p7H18mQmdn3j0PLJeir8XCNhytpWRvW2wbvFw3eengobgkZvx10MnMpQJy8?=
 =?us-ascii?Q?QI7U60hEPNchbVUb6pbP3lsvXlGqLXEEURx8TWf5lZRAyoUcjsd0b9k/4R09?=
 =?us-ascii?Q?/mDGD3rkoyb5b6DqVFuQVrf9QeVKkJP55DJQ8DFoPjuSab8cyyCl9wtbjboJ?=
 =?us-ascii?Q?cRMmyt3/JjGwC9obmPkGv+Q+L2R4yQpyupZjzME/HCX1sUkEJmSAr4DHhMPQ?=
 =?us-ascii?Q?vmZ1H+eXcmCle27L9CH9PoL8e/xj4UCWpF9nCzR1HZblklI7mcXP0J+fO/Ze?=
 =?us-ascii?Q?Sw88dJDq1Knp9P4Heoc6eytW33UEpLFu9ZEk40Z/JUCSAnWT0JlRevzuQcTC?=
 =?us-ascii?Q?ROeYE+JNIXmrqm+R0FTTUNwrIKkEz0uaXZ6eko8CKWXUq77BWUjCnzXh2JfL?=
 =?us-ascii?Q?O7c/O/JutB4XIS3KUxs/ilToEkkge9754BCZcyVU4qEeJ6dO7NtrWwxtE448?=
 =?us-ascii?Q?1zWu2JjznK3IClijFreP1phJwSQCWzWIHmH4J5CV6XZMgB2B90iYIT4QRGEB?=
 =?us-ascii?Q?cSZR9iDLIUnFWxiT9MuIxleG1sHgRq+vAIMjy+UiTLtchKjpi+Hiwf0JlioK?=
 =?us-ascii?Q?lHdtF0eugUpKlHb2bcRpp5BDm0T/c5+MUd0HWQT8WdxHGf2EEbwF86csqtuy?=
 =?us-ascii?Q?05AKt2GcW/m8fymzSzrBeG95YBSQquz32Rj6Kl8ujND+4S1nPgRM8il7rTXg?=
 =?us-ascii?Q?qamWBtCBWr8+tiQbLbgDQ+5TYDwLMFHdRY15+9jhDVRzclGx01w/uscRwwbS?=
 =?us-ascii?Q?cGu4utOVAgiSO4XiqLifm0JRWkh4oj/L2/UfGYWg8+x5qim2JitcrqQJoNNp?=
 =?us-ascii?Q?b1G1zyNfSwk2tdgO4u6fAYQDgxQtEsjN8OywvaBxwMk0qHl58xTN9UW0P5lH?=
 =?us-ascii?Q?VDwetE3HxZlrA04IsjXTf/nKNaU0+ZBWbVYdNJAFWaCsj+Avl1eo0nF7/6Sx?=
 =?us-ascii?Q?H1hLM6UjFs1FJhNldfK1+hgi4PP0kS9BumlNJCyK3VD9ime1yQQdxd1v776G?=
 =?us-ascii?Q?G6fyY281SheF4EoY9P5PBvOuQnqhIdHf+YrkZE1NVe5KQnKLe6T+pIqjk6VA?=
 =?us-ascii?Q?vJqNY3jsKbSNs+DQhSX6mTPX0qoJS7R3cmGSvZVkR5nN/+0OIvt/1mLK3gBg?=
 =?us-ascii?Q?Yd+eXqrtJSUJgOW+StuDVfQ/UmSDorLuouUioJ/6hUr+1EEQKCiNigoId+zJ?=
 =?us-ascii?Q?M5l5+sCqbLxIoBXe4t6m8H1agOr6CS+JyAc1KADMnhC0y5w55sIX8w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O/5/Unp25/dN5aj4Ec8zR4YWuEafnbivilDoYY9jZA2IPpUrPeQ6BhhJQnbD?=
 =?us-ascii?Q?eK9K7DQPvnkTcw/VcwZETT0WkNwB7tfs/Al5xkl6+XmpahABhgfxU0nnw1TT?=
 =?us-ascii?Q?09EPy7HvMdkzJWbHQXmVqRtba2pT4xDFjYSvuNxfxDnmxzxRt8hvwfFABDuE?=
 =?us-ascii?Q?UwsUGOj6CS3JUpv1eSFzmgXp3Ztj2ULHE9bTMcX/4g9smwjdxWYU4mntkaUr?=
 =?us-ascii?Q?gE1BZQ+XaLJ3YQB5+hlLrdHCZ1l8yC26Po89wipPN25LOLaJWcG6unzIUsPK?=
 =?us-ascii?Q?a9yvuu8Iqgi2ZnyrYeucN+xQfazcBziX6367VbduTtuElGTgNkyuRe20XQ08?=
 =?us-ascii?Q?psIPLxqEm9JCulFbv939kI3oqwMIfHZ8qSxSWZSQZODwAQO03aqayrbBsY8v?=
 =?us-ascii?Q?ACkF+lm0Ry3MJBb52j0+v6Be3I24b1I6sucMKUlUEp3AQmdnGE8Bg4w3PQqk?=
 =?us-ascii?Q?sXE7ksqxIYBk6raOABA7gP1lv+ZUYh3cW4kGkb5nEsWm8wZXjMAHSK3B15u9?=
 =?us-ascii?Q?kO+MCsUhVrGNQ/+OtTY0mV7uqcgmqjxolu00gYu5LiqQJoEZFIa3//WAX2l7?=
 =?us-ascii?Q?jyB3EjHIPmN0NFFfPyC4SOWZZ7+vCWmYckbPTcdrMAUb1QZ/dzUUduofn5ts?=
 =?us-ascii?Q?B9mzVA/Zo9bZ/XJr2KVIg7mVD81Yd+gFwL8bQR9CTBzte6TrJ4HNqVdLQAKd?=
 =?us-ascii?Q?KtzHven+dwZuXmC+xtschHXP7oQalj8jvhKvCN4IInKUxie7VQ1ln2n9I33u?=
 =?us-ascii?Q?hpSVtGlPqoeK8e6Gq43wYTblEL9QL/PXFg1E/6lTpH7Xf3adFUlqeqsRyqWq?=
 =?us-ascii?Q?YsFM9+M8dPYkIHdIsNrXk50+Sj5Emhq4ozbYGn9PygLToPiMIW3jLnjugcRp?=
 =?us-ascii?Q?IYVv2c/DdMUn0tki8kOmtwH2MWJQwvIH9FghVS3XnbUdyi9ietAhMs7sfXO0?=
 =?us-ascii?Q?wrc334HiksZ5hkwhV5hFLeO/Gqfohl57QKv+oc+owM514DSils/EAtSLy015?=
 =?us-ascii?Q?X07XbcjK55S3HqCGHUEi2luQAgL5XPgty5d3WJMmmoquINXVP3V6BRb2ox2C?=
 =?us-ascii?Q?k+P03AYa+HDurY6qIm1D+MJHQBbA38AAeUK9Ii7n0LilH24A56FnT4umQksf?=
 =?us-ascii?Q?HAC5ModkPX4zJCu03tHJWK4t2rWmwwIhBHzuxkGW5VYzp3QYWn6T13lTsTwi?=
 =?us-ascii?Q?DicHzhD0cnTf/JSLaqmN2LEmGAB74beTpfOB/h5zmrprQBxt+/FCXTI2wKPq?=
 =?us-ascii?Q?njRSGJVvEaPHSv3Y2Xzt9EJnDQbAUZpmNHcX9m8PuFoKTbCwomL1yQcnbxrZ?=
 =?us-ascii?Q?ZhKpNQLEeku7TVetvpdDk884D+x9T/U2WYJnITaYFpg4rMX/lm46ZuG0kAD4?=
 =?us-ascii?Q?SAN1psAUuvhpMOFyFxdWtwc+FdmsqXjz3coJPN6uqY1AW53iiYMRgk5VXbeF?=
 =?us-ascii?Q?LOw7lajXdVwIOHhNZ6x1i77RioigyIO8p7RUeXfUFUkAvpNTVOLzyHl6ZOwK?=
 =?us-ascii?Q?pvySVy3/xboNwJckJQrmpacBcqnottLTCGyUwcxFVtjMD6OpHApMj0+HDPTq?=
 =?us-ascii?Q?KI2UFVvTQ/uzQXvrx9/otTWDb0MPhAumNgsCde4o?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4470274-dbf1-4622-9301-08dda72f9dc6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 08:28:31.1915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UolsIDETRaC2OhmoZLI73mAmVzM7pHNeZODY8O2dCF1U3gTQi+bCsTdk60D+MnM1zwSF2Eldw78D+MRs7bdkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_012835_930943_804F5925 
X-CRM114-Status: UNSURE (   6.58  )
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

On Sat, Jun 07, 2025 at 11:33:15AM +0200, Dario Binacchi wrote:
>Support Engicam MicroGEA BMM board with:
>
>- 256 Mbytes NAND Flash
>- 512 Mbytes DRAM DDR2
>- CAN
>- Micro SD card connector
>- USB 2.0 high-speed/full-speed
>- Ethernet MAC
>
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

