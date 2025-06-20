Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1186C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 10:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O9+KpW4H84uBsTUmZP/MO8RZ0sMZ7st9GqMNyP8Kgpc=; b=K6vi1eMuJEEqtakcOzPUwGNKI0
	PD8ja9XtGjdTr9SMt795cgdIvQhPNlortcCZg6bQOZLlo2pjHFjCXLnNYxZITklwuJnMrIIuTC5j3
	h3UmtZ7xBo8DE3WJf/WZFWfNUV0S8tM8yc24DxNF+nKGKeesr4xPmq0BAEQVu9mgoCBScPXwCVeRE
	cxEQdchOAPw3g2uETuLgz9vKgyEk4TaI+8judGFYRUSlCM95dH6EdW4Pa0Oknpb+We4UbllBTfHtd
	HeJDYXnnGPqEMP5osCBrJTIdS4OM8TopupqU48c0jpN2/XYL1KnTtXHXuD2drjh4ieAwVGTgCqJT6
	IkJCWn+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSYZR-0000000FHw2-09ye;
	Fri, 20 Jun 2025 10:02:05 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSXO3-0000000F6z0-2krF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 08:46:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S8K5Y8IrgOIBv4mMVRJiqBQcXYGnStOQB6RmCeQFsWtXjMXKjRHTtXBAProLwJXwL7Xw5HCk9bLedhVm/4LfnIhhvHjh3eYCVwNSBj0Tz37wyvxUwdgbgZ9yy9Ha/ycI37tEartNO0lwt1PngqXK52P1SnCc7FejKCU8ycTotAsrW7KVR27lhf3EufdN5OomXN/h6rW2uhVz2mXx3///0SUoke8wSiV3S6xW3Hzt8NyKsPEVxwYpUKXpxvHl4HTdRsVji+dF8Qc6pb51PuYAItibjd6Fyx4ywWyp95mC17x7YRczvAocUThAukKhLZQabZ9RN9WDjWYcjOM4ARVgjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9+KpW4H84uBsTUmZP/MO8RZ0sMZ7st9GqMNyP8Kgpc=;
 b=QPIpVzqSHCs5ROz/OgTyi1tS7DZCVb+TUjkvGfnaBGEvIpFJ9zNPob0P9zScY50npBLN1mACeG9WcaubSh0gzUM5uogmURjCZtc31suRi5j3OZx/Amvu6VMqbIi0n/F75z92wKy37rfmcHizACoMaDMJ7CjYlEFumR4gnJ0hqY+EslD9/f144uRh1H4Esme54H2CtWnjoWwUajcHF8RaTvvkYtDmbzI+iWBGl2dJek692Bvnfvi+N3gzkMwZtyr+lqSjuSxe1MylRMFy28Qq24baXLPL/rm50oIsaCQQAl/b1XHiRR/cOC6P85X7U9+AzPMmtlLQmplfBbtX4VqJ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9+KpW4H84uBsTUmZP/MO8RZ0sMZ7st9GqMNyP8Kgpc=;
 b=vNfSLl6sFGy21IL4Q9Ay4PWBWOqd4koYxlEENGwtG5QRpTS6xVpk6O5/nvh8dIRdatKGyG6LSBU7TUeVp3vI4Yt+0/ZopqhTSQFNK7lcLbqspkbUVnYRL/vUNrcSnxT4ZsPg47KK6m8N6LIWFqIrEKgLa/73Y2CaEk+BHCQtH6Xc26DVATY1xq0KNgJqbEi4Q1sAVP8qC4b8Z32tOg+OHGy8S5/3QKf0csvzTSdpPlnvPKBrDXGlXEnR/fpj/a4shwli0Ix9r1TYyxI+t4hzI2omZ1cYTPYdSLLuNHWX0awGDUgQp7s8yKKf21tBq0G7Ucyuw7GyNa/m/xDEO6bmqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from VI1PR03MB3856.eurprd03.prod.outlook.com (2603:10a6:803:66::33)
 by AS2PR03MB9490.eurprd03.prod.outlook.com (2603:10a6:20b:59a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Fri, 20 Jun
 2025 08:46:11 +0000
Received: from VI1PR03MB3856.eurprd03.prod.outlook.com
 ([fe80::e9fe:470f:27e0:b265]) by VI1PR03MB3856.eurprd03.prod.outlook.com
 ([fe80::e9fe:470f:27e0:b265%5]) with mapi id 15.20.8857.016; Fri, 20 Jun 2025
 08:46:11 +0000
From: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Wojciech Dubowik <Wojciech.Dubowik@mt.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Wojciech Dubowik <wojciech.dubowik@mt.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Marek Vasut <marex@denx.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	Michael Walle <mwalle@kernel.org>,
	Heiko Schocher <hs@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] Support i.MX8MM Mettler Toledo Snowflake board
Date: Fri, 20 Jun 2025 10:41:41 +0200
Message-ID: <20250620084512.31147-1-Wojciech.Dubowik@mt.com>
X-Mailer: git-send-email 2.47.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI0P293CA0006.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::17) To VI1PR03MB3856.eurprd03.prod.outlook.com
 (2603:10a6:803:66::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR03MB3856:EE_|AS2PR03MB9490:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e7bd172-8fa5-46fa-565f-08ddafd6e81c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g3ytZLqz0X2+nJS4AehjSj9pBeLjln32e6j9dzOQBIxFOMtSE4xKBzNmbWNm?=
 =?us-ascii?Q?IyptwIyW7gBCXCz5fWQFMMsGld3JNd26Qoa7TbtYkoKPlfMAL9trwRdUFi0o?=
 =?us-ascii?Q?u43V9Z6WLZenXvX5jba6q8kMlVFTerZcsmtuaxNN2vZLddLZ285uKB0MWvZF?=
 =?us-ascii?Q?WXn2B72T4Ljx0LD0LxGsdmwZt8mSDpdN58poqx4Zg8+H496tvMKixhDQ2KFv?=
 =?us-ascii?Q?nKkYWasevb2qWmKOly4T/wfT1UfiUgQiIZ2ejapxecNuiAOpwPu2dEmI8Anh?=
 =?us-ascii?Q?t95Y2+o/RPcQHTgEZp1uxxds7TQjNfVr/Rq1MwO1/JsdRcGLywsC/TK4Ll2m?=
 =?us-ascii?Q?c0xtCBRG2aajMr6cRcIhzZaAefMtRV24lRV2Gp9vQ1f8z6Vixutjq+O9viBh?=
 =?us-ascii?Q?zH9UrK2On16ZyHI1LT9MwxJm8DwMRTsNGcJSzWncjQ3yx0jWw/E0rOGCsFp2?=
 =?us-ascii?Q?5FpowVYeu+fCUegaV+pm6mbwx+IaprqDj0F2pdqetOs1B5d5P8bfRuEcYBUl?=
 =?us-ascii?Q?8d4BwuQUodG/d3OOTsxeNCub902Lcew3BL+c2/Lqe0pPyeDUtpo48TI+VbB9?=
 =?us-ascii?Q?HKH+aVwlRLOyoJd7rRKfORnTi5uTHIZam5cCRuK/ZV1EW4UfUre1K0TdwW7c?=
 =?us-ascii?Q?kDy06ehZBWTJzKYeeP67nIjpiPgtv6Z2K+VeImPX7sK3iJ5WypndHluI68ot?=
 =?us-ascii?Q?qmhFOrCN4ck/71nUc/TZ39+yvOl5xE3/7n2iHMBFjgNjCQ7PPu6YwoyPk3At?=
 =?us-ascii?Q?7PXPzer8GnUy3xlSVr3+HFh3p1FC6bdwuGWKbj4Z4qVuwam9XWp3Rvxo5a2n?=
 =?us-ascii?Q?1DZA9Rv1nKRLC9OjOrNE3o0oKH2JRLcXcKTgke1cMoRQtPj1PHfa+HWlmtIV?=
 =?us-ascii?Q?NVQCiaV0u61a0qsZqklMY8wMNHWay6QWwIe9h1sBk0D3QfrvI0YmbtbpXWs6?=
 =?us-ascii?Q?7WFuBKgAFvq5r6xkKcjeOH2EomazzgoiJCq1wFtqqK00MPakaEwAu0RP6PoO?=
 =?us-ascii?Q?Uw7cg0A5BdYNJDwfSM2rVJ6qNypgPGXOuPOhNPEFsc6dn75TW1adK8blwfGP?=
 =?us-ascii?Q?iu5/VLwjdD7ACCK5z1KuPznOQLe7SEDnb/Y9c6bxYiD7Eoa2M5YL+Mj3FwTk?=
 =?us-ascii?Q?iO7QhrflhZxLZDExDmwEgRRM2iQPWUMkKCP3+OYV0IxNSPH3/ex05ow37lvH?=
 =?us-ascii?Q?M3UDn8KDLJ8+yy5+zG5ZMqx/ekAyxA+z4QF/EJeWDo6UVcyTf9U+HGa2RBkK?=
 =?us-ascii?Q?72mAlYrthynk01DSKiHmBIzQAV68i0u0XFF7ZLNUDgQpBnva8bkok7X59hQ/?=
 =?us-ascii?Q?Q5YBRxPKBRrOehG7uq0OtmuHelMScobuxU4dWejy/blnQ3Ih2r3y5CzPBvh3?=
 =?us-ascii?Q?NWahQzvphG6D/ML/Qq3jv4tukoLyfIo+2p1s6eTPUXmczQz6H9zs1Ol2UJok?=
 =?us-ascii?Q?RJoInIw+5JU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3856.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hSQ2hORRDD0H2eGKIkpTkPXR72VTmEEKZC4K6suZA3gywc+kS7ur/2EcFqiS?=
 =?us-ascii?Q?0jBvZLTd0gU95XdCBqWZ+ffOE21W7JbDj3yip4oGqfAaCm6HxNMFMVRmk9Rn?=
 =?us-ascii?Q?5iOBavS1c+N678fWGElB579Bh3h6O8nx2p/6n5mBoBtI1iFLkg34kBzgEMIj?=
 =?us-ascii?Q?XK7OeGz3X2a9X1KHuTlIBstmQxPHLeGpJ9vl21aFrC2Q5dp0uj6yzb7HeQ/N?=
 =?us-ascii?Q?l1SFiOV6H/do8aD9wgY983vGhhH8LOWKvVWYq9H3jR9m9sd6EBTfYwXYpUwl?=
 =?us-ascii?Q?wkZix4kNFMZxI4gi79d+X/uSZ0G8mlDLK1iYV4349shfeTDym9xdsNqIWC7v?=
 =?us-ascii?Q?X/xl3aLzbLT+6reQyfaozud9gPsLpgjNdKVoCr0n2CbQbA2DfrSmAKF1o7w0?=
 =?us-ascii?Q?Wab+OLLjCtWlxId+lmDUH9xkKjrJhdebs90yr9wi7s0J0cAR7WNi+v/QQiGD?=
 =?us-ascii?Q?UelGQfw+DHgTJPSRWISNKDAV1lerhOkKEMkj7NadTuCAgozZpaRHkfE7keTK?=
 =?us-ascii?Q?z4Yxr0BbV8BsICzT1yhIgukklo+UKMsViy2F8yA/Z+RlXaK7VSQ3KEs0njjy?=
 =?us-ascii?Q?bMXLRf5j4S1omim1CDTXNin7qbDZxekkTL1/1jcmhfiFvY1fLTO2lE1ojKOl?=
 =?us-ascii?Q?RRt3Mi6OzWFRAVAqFwuczb5igcZrerehm5Mdy/Ag7qoCNu2BZxkY61qKDG66?=
 =?us-ascii?Q?z8yTxH8dpK489/KeOAWEI4E/ocmgsVu2YR5Ua9QnyhoKAjbB4r14K9aZzBP6?=
 =?us-ascii?Q?S6DhQgUVcDcqOVrNMwevkhR68ReBhAGrzZIcl4cDiwYlchW1WyJftXtGkGsW?=
 =?us-ascii?Q?+hwlqWJXLxW4/j6kb+zTjeYxUFySDaYzCXEUzAurads5s4Cid8pcrnHlQ1Ns?=
 =?us-ascii?Q?qzqRyX3TyuKGlfNantEoWtwrp+wvD3kApU4IGGv9GHi+RBFagIjGMBdPvVMK?=
 =?us-ascii?Q?4BqyEagYpOHEUHRJJT3Sf43y+Q3hQONmSzpORrLMs0gh/K05drygWFFdmK5J?=
 =?us-ascii?Q?7LNJREN6uZURgBeBkhXhhKekloPIfl2/X+bM8ddD7h+w2+1bl9Pu6+QPN+lb?=
 =?us-ascii?Q?2LRmwn1thB9JOcFYbK5M7sT64QE5tmWyU9KCIe4W2Dc1iXlQkUhNfiebd4RT?=
 =?us-ascii?Q?9VD43bWrARftJuBGPfsBJlVgyKl/dfbWaaJETuXXHiBRDzwomAZvotFWa9Y4?=
 =?us-ascii?Q?CgaNtJkJhpfoUL5aLxXI8j0bJGKYpThW9yhsBwmbA3R620acQYAZG7MXPL7P?=
 =?us-ascii?Q?3pc3QdWQO1Ohsuft/pOpADUNDXS+sK6Lv7PBkR3uqyM9rSJ9mL4pmZtyk0kp?=
 =?us-ascii?Q?7OVOajWIyyCDw2QfR5DIHxCw32MtT31ZHRLGROd2YBDViHtBGX6txXOVChSI?=
 =?us-ascii?Q?nVI1clO+cqJhELyJLAYq6yL8YMs+a2guBsEdBTAOOFkGi2CAPPwxkB9UUaTL?=
 =?us-ascii?Q?oRnZR+MgdAz0UkfUy7iNaqnrYDlo7BnwyCvydGuCMkSU1f0/WW4doN9gDvFj?=
 =?us-ascii?Q?jzzAE7YbNvSkTldvmPcpIXBZ1GLbSoyeKKKrtmHImgLOMfsIECdbofUajis8?=
 =?us-ascii?Q?ibfmn1EAScObQuz/6Wk/kH/vPnCYTZ7yBsOm5CbFkl9cwKJUs+n5OgvvI4Q5?=
 =?us-ascii?Q?Ha7jnB+sOTiXaoKv+Wsj4Wm+0mwA0Sn3RJ1kJFCFLlq7kGQfa0M/ozQT77kU?=
 =?us-ascii?Q?vvgHDw=3D=3D?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7bd172-8fa5-46fa-565f-08ddafd6e81c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3856.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 08:46:11.1111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2kZnIhbnWvPUVOiByoq6Bo1WrlbvMSegRgSAx8iw5/ZKYOL+hae/Ew2bR029r0N3a1nbPSVVwQayBDqwlPKYHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9490
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_014615_922671_21338D7E 
X-CRM114-Status: UNSURE (   9.21  )
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

Add initial support for Mettler-Toledo Snowflake V2 terminal.
The board is using Kontron SL i.MX 8M Mini SoM with 1GB RAM.
    
Supported board features:
* 7" Display with touchscreen
* RS-232
* I2S Audio
* SD-card/eMMC
* USB

Changes in v2:
- In imx8mm-mt-snowflake-v2:
  - Reformat with dt-format as suggested by Frank Li
- Separate patch for dt-bindings
- Add bindings for Mettler-Toledo vendor prefix
- Add me as a maintainer for MT device tree files

Wojciech Dubowik (4):
  dt-bindings: vendor-prefixes: Add Mettler-Toledo
  dt-bindings: arm: fsl: Add Mettler-Toledo Snowflake V2 board
  arm64: dts: freescale: Add Mettler-Toledo Snowflake V2 support
  MAINTAINERS: Add entry for METTLER TOLEDO BOARD SUPPORT

 .../devicetree/bindings/arm/fsl.yaml          |   6 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   5 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mm-mt-snowflake-v2.dts  | 484 ++++++++++++++++++
 5 files changed, 496 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-mt-snowflake-v2.dts

-- 
2.47.2


