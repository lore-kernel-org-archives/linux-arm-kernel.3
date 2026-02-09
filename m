Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFADEE6B6F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 08:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7MWOqbVCYe/S0udzXx29xH1QVeJxfwCDNt3FnYHEco=; b=YqlZG5r8XsN7X16GMhG6n3o96o
	guGR/SClKa5aP0q+zClj/Eq39wyoy3voEwPwAiJo8x6CtmGA+f0JTcGSoF2OAMujqwHj55AUThxOb
	dCNK1l8fXs14jxrP/sJ2ySMWchs1jbsaPtQyzUZPVbMZVyJ6qXKz1QL2SfbfEoHUcBdsnHdZx+r0Y
	v9/3FSnr+X7/Amlc95dwd/Z60PwDzEtoIjEXbk00zBP/U8vSDml6mbFoIBehBBj9OG1kqm+Wqqv9X
	rdr3dLJI5YmoGnNe0bzkqs6p09x6aMAi++1HJ1o6hZUfmE1pmSSO8uvb0B01OQqIwGXOmrola+Q73
	C9S/CA7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMZG-0000000F0OO-46l5;
	Mon, 09 Feb 2026 08:24:26 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMZE-0000000F0Mp-1SnH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 08:24:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZbVt4X4VruQr5yYbYNM/0/k2epOn4HCq+7ROhvyJHbX7C8tkTbQ/0lUm+Aq3sgZZwna1PwBy/HQMZ9nTTYf5lwxS0ZwoU+KrT8IhKETNzVxNAsGmzOhsoZfUxYgbddJva77+gAbraeu/GWa7vQdAD9w7j4kcqHGcSLICVzr9OQd654yqcX+BW/mkiZ5TWBrCPQKYlucP5qm8NuFc9AahxobBy+AuvLf7ZTjEy338xrLdWUdLbWCiMSJviMUFlY8pctxgJVbAfloqGnkY21GzHnB3YM1xOiZwJQG54wNWAZZeaGjK5C5thXiNRSCbi5ilf4YiApMV8FKVO+9q5rFqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7MWOqbVCYe/S0udzXx29xH1QVeJxfwCDNt3FnYHEco=;
 b=sNofw7f4/nHO1RK3meHLX3QmksnAXmJl9G5ZBvAPf3pgWQyVZnD3PsPWlUVK5Fr7wlUiJUZtsOYjYhdTJwmp8QYXUJstMxCmHvw2Yakxr3Y0f37tuyay0PppWi7pnY/S8blggRF/fkxzabC6PEYeo/7CFwHbWV9GTlS1UlB8vY1RU+zXhR5+nd0OMNDTlLXLsLPIcbBLPt7Ltt0X8QQDo43RJgbFEsvQtWiTDyB961G9k3/YqS1ewspHl6b7J8/kZLeAq8WlQmgDbFDXFnzpTxXmBHN8LX8MADkD3ZGvcEpDFi0mpXzTcOaxDHKwTuEbc87vUAdN3DKVfyWFTul1mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7MWOqbVCYe/S0udzXx29xH1QVeJxfwCDNt3FnYHEco=;
 b=bsbcZzv9xyAR407eyOxm9K9Ydy0veR4ekRrNF1ysXgIRMUKZWufao/Pu/rDva6+BFhXg8UJZSivHvTGVrDeRoMEyudSfN8dJnYuc9u2twGrlht2D4xf+d3qNgAfhc+2moiLnJ5ZDDBhfrDzq/QF3PvpxDh35Tuap8lczgHyzjyTk8EQYmZS/QotsoPCm88dvHN4RpDAxKzG40fYsQLubDfWCFoZs9vv0UBrtiBbBjvswvZ/Ixum6DsKbB+cZr5PucAkzvF2Ousd4mdhvPVFP/AHtXsBe+RbxKLk1G/Qeq9UUVX4qtAyjrch2b//xswhqkXWOAlc4DLiP0/7rEMjnkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PA4PR04MB9661.eurprd04.prod.outlook.com
 (2603:10a6:102:273::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 08:24:21 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Mon, 9 Feb 2026
 08:24:20 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	Frank.Li@nxp.com,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	will@kernel.org
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 05/11] arm: dts: imx6sx: Add Root Port node and PERST property
Date: Mon,  9 Feb 2026 16:24:48 +0800
Message-Id: <20260209082454.2097628-6-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260209082454.2097628-1-sherry.sun@nxp.com>
References: <20260209082454.2097628-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PA4PR04MB9661:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b904641-5007-4db4-90de-08de67b49fd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|1800799024|7416014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tDt3PP00ikbzTMPXwy1Ue/PLT5yAkuOlMns3b3G8S2SpTjjooY0ccqxYsoKs?=
 =?us-ascii?Q?aL+J23vJKEbTlWdNpA6Ew/03vVKZEVB96RkBmKLYuglzcyBP0JXXMN6iecN1?=
 =?us-ascii?Q?1IgMSdfJvh7z4La3Kas/XGvBUMmnhUdUKXlUfNfZNCsSW8b5yRNRBPIGZ2nV?=
 =?us-ascii?Q?V82xg3LD0V4WWsESGPnYgfyStIIGO0Z4kIJ5SA8ehzlQ1Q6cjhde+iUC/Due?=
 =?us-ascii?Q?qz5u4xnA6htB0k6D6eB0KpBYw8uWa5L3tvTfML4kscbf1OrXHzsvDqbAVDpn?=
 =?us-ascii?Q?8CmndEArzSIluowd/EJ12cxl1qZu6iJY1jD30uMKv/qrn9OIOld5WAvZ/LYT?=
 =?us-ascii?Q?MIJIBv10hjtLQEVjMCJaKuOfUUK3stetM/9lOF2mudnr5cAOzuZ5EpQSDLXb?=
 =?us-ascii?Q?fpz8U2abkEoZ3Lo1BgUfRd68x4tCyQEzmKVxgIGh3c5C8EJLHcS43EBQ2dLg?=
 =?us-ascii?Q?d6tNFKwCzxCFnyaLzpMjqiYajzLZ71u8xccPk5Q+ZJzuNzS5EZAbiYKko+e6?=
 =?us-ascii?Q?BMNjEJp73n+ec0qwjfwX/dAjgBL7/Bz9zxOKJnhS5uJc4blY1reDzTNj27sT?=
 =?us-ascii?Q?V3CbveehGfEgw0GOQ/V/B6TMYe0tE4LA2X8NIlLVqDXcqaM7jj9+JiIWqboJ?=
 =?us-ascii?Q?EXoL8RuJzI4uNIrfQe9LJoxVjn6hjx6UXQJehqTGhQuE97ZNKwAVQJ6EXLG0?=
 =?us-ascii?Q?x7oY0xjO+CnsGvJrg+zbKqJru5cqBo7jeJGV1j8c8rm3w0fPw2muaRBwSk5c?=
 =?us-ascii?Q?psmnRrN8LJEEJVv8q5BeGCVwI2/pDP2ElAlCgSRAkUU0wNoxBWRd360q21TW?=
 =?us-ascii?Q?KuTD81ZDRaxANZwgtqO2gnnZBn4HhBhvRdhKlEBwVXf5BhiQz6Q4AzaomL9o?=
 =?us-ascii?Q?LdtwC0PPwhqwp0Pb6LlJRDosz/TZiD1fMTfI1ylhNQAwjv+LYyaSii1JW5Kg?=
 =?us-ascii?Q?S8igxoqqeMI8W14jaqjDuKJyC/LlbvatKfMVHfnJeJPDAM+nwJmsWUOjwH07?=
 =?us-ascii?Q?Hf0Vy8g5JInVLxABbolisNXgQf35df3j4K1AVlueWSS/bJGJnhLPMxyfET85?=
 =?us-ascii?Q?Ob70+kZJPgPlXZRtO7uDjva9MR1Caq605CHIBQSOcE2BnBtXC8/KiX5d3p8Z?=
 =?us-ascii?Q?BkLAbnogoHEjdHxCvrT6pplzFqCk1wdPENZzhVJx4BbOuCnwNNVZwCeI4U0J?=
 =?us-ascii?Q?9BPbrEGASX5utBzHQdApeCz5Xhg9KLsWfjj6V3O7kOslTkzszjbhBkANAZZj?=
 =?us-ascii?Q?zHT44axrBaK7v10ZtHzwrtNRf3eY5FzQCq5PVP9wxFcH9w3/qEkCV7DukhKh?=
 =?us-ascii?Q?YOW7iaaoBcvwd0k3PZQBUW+kU0QEzatRyOaCVtcgjVDYn5cQV+9PsoUCN//T?=
 =?us-ascii?Q?t8BFhHenmhe2ZczcL4hpE8GfzGfO/Re1Cy2IgwNih6s/yVUpqqJ/dQV9/PfE?=
 =?us-ascii?Q?WzCxVOSWJLhloglPrIXUdsKp24q25W9kyC7T3ZkK6wvPbqXro8N33PzhmXpb?=
 =?us-ascii?Q?mlwdo8oMW+t8w+x1FX1Km5X0vnQo0VrDnpKMQqx09psoQqEmv2mOq0oeGEAF?=
 =?us-ascii?Q?JA8bi0WdJFj/UuQU0hgfbCnFzzXoVjhgYBWvodN7BNLPdPus5LPqzKO6eL6U?=
 =?us-ascii?Q?zb8VoJUTzNCu53v7QXzbBJXFmvprfPZI8Y/R5zAY1v6g?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(1800799024)(7416014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bnI49Snszld/wV2fB+wgtQ7FGc29ZaLahLwSMLbfT69RMyesUlh6mLtoS2C4?=
 =?us-ascii?Q?DLzRXzgG8N4WpqDrdjENnfr6AR13vzhoow04VS0wH77CsOnJ1r7792iDl+gS?=
 =?us-ascii?Q?D5qsDKku1flzcx2awsYfAteRebapP55eTtEisit5dFUNGk5AbKiVhstfyDbE?=
 =?us-ascii?Q?lniRXcSoKBb0xjC9CdG3RhEqC/E5syjp3diDR1DS2yy3VMm6xYGXtKkqXNE3?=
 =?us-ascii?Q?PlhHydkcVFUxkI2eCh73CZbbg89oiASxHFUXS+UOlDRq8qQUn/YiSKjq/f+m?=
 =?us-ascii?Q?d1LL8cvaKuvJ3s4F6sJMX9DU6TCG/OzIs7lw39bNRaH9Keh6yrkacGGkAxuV?=
 =?us-ascii?Q?9n5V3fKMt89JK2TGbJiVaTty6cTE8N6iGMJXaDrQB7RKNKbeN3VsREtQcMdF?=
 =?us-ascii?Q?224LgvGKcFPnv7AnICKMAFvPWhNwDFagb8yhT9/VRI6Pe4Da82D26ydhLR/x?=
 =?us-ascii?Q?0PKLtDnTQfbuUkFmtjgZk7NQJ984m9XanQSBhZNWus90/YU66joL6h7KQugE?=
 =?us-ascii?Q?tV2clDXF42yr2UnKYfK4NudbDjmTmqIE2iFrDqgXto6gYDHCh6TsErdiHWKT?=
 =?us-ascii?Q?OigJd6Neqe34Wb9Nq9S+TFn8IueBR3lFkU09DzxASJVpIddqr70wyoGDM6CC?=
 =?us-ascii?Q?psXhDB8BEZnqUWC0PPl2mnEGtqyfJyrDaRh41laM3XuVT14J4RiwFJd5ALOL?=
 =?us-ascii?Q?NrJTQ+hXR7+Igi7Tzd6D0lZgsg/+8tKC0RBQZ9jEJJ4JIkRLOPGaBsAV3uRO?=
 =?us-ascii?Q?U1W2k00VLjE01Mh+weVflYAoGoQdXrsTdPOmhatU7UUzwvb6rZ8VrBY9Kh8H?=
 =?us-ascii?Q?eL90Q1CnLUXihPVGk5Q8RiZXPaKhxKuGQFd6v1Ir/Uv29HfBWGvRXyVlVd2R?=
 =?us-ascii?Q?HaeC8M4ndyurhtX2xVaTUlTicsIqFME8q114QxyQQZ3pD0/c/0pAoy33hTz6?=
 =?us-ascii?Q?lEoincBTeiHCw6O6vO5IXJbohy6S5tZOW4cU15L+47yqI0LDCPBmXi8UQAUT?=
 =?us-ascii?Q?jOQKTCgRPLJSXUoIg1T9R+eju8DEeU3F6Iccr2t9pF+7buFVbzQbadx2b4Nb?=
 =?us-ascii?Q?d9ILjTqK5L4xHIrr+JOskjwIaHXfT7QDWj39uT1hYf+YNCCqbJH8KARPMwMT?=
 =?us-ascii?Q?heQER/z5OeTKJ+d0kKQX0NjxFjbAfefD5gzN3Fq30l81jxZYYhmx7vbT2AZc?=
 =?us-ascii?Q?Wy0j9cLrqoP/TaMNezMd3Zbge+aamaXKJKfDjSVBXHCtKQUnD/HdHFvKr9lb?=
 =?us-ascii?Q?1ydLNh0cJc5BgnqbPzlEmZP87cyFrzPQ7xj4895Up3jYCLx5+X9wCsO3O+E4?=
 =?us-ascii?Q?/1JoGTv23dReMqyaaoAHZtrXzFCGQTDK7Cdo4SPVR0QL/BL1yVdleN9Xx2Eo?=
 =?us-ascii?Q?hfa+N953P0xTe/2d0Te1tnVqjZyQrrtdJuJzsSZkMS8yrHCa24KV3mbck5ku?=
 =?us-ascii?Q?Mw495qqqXiJ707h2kC40VUOIg/QWtSJ3LwAY4KaVQLOl8wyUPO0c7YqLLntx?=
 =?us-ascii?Q?IjeehE11ZWWi8hNELP7R5+Wb6/oQhXsPdNbC9vWlULvUZvZL6OJw2rcG7BXa?=
 =?us-ascii?Q?+3P1sPenywFpxlRkoONgLH6g1vgLIh42x8dCp6Nzyx5YFbowunCJglGrrGAK?=
 =?us-ascii?Q?ZNrwlgvpjo91kLFscaQZ6gUKihGgi9SZavxEK3Vj2OhtHswfgR2oa+19CCr4?=
 =?us-ascii?Q?tPO4Vfkad5nxAmdwRt4etMpYx1wpdIMscQTqhz0Pz93GOkfM/LQURsZUzZal?=
 =?us-ascii?Q?MQERTrOSWg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b904641-5007-4db4-90de-08de67b49fd7
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 08:24:20.8721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sYLDfSLRoww+V3+YZJ4uZdt6zlj8WB6YizJoG4JcKL8LD+aGK+mqFCSKwzoEJhm7mVztebOaD8i9ZUOzvxWS9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9661
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_002425_025728_56B72FBE 
X-CRM114-Status: GOOD (  10.62  )
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

Since describing the PCIe PERST# property under Host Bridge node is now
deprecated, it is recommended to add it to the Root Port node, so
creating the Root Port node and add the reset-gpios property in Root
Port.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi |  5 +++++
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi     | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
index 3e238d8118fa..338de4d144b2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
@@ -282,11 +282,16 @@ codec: wm8962@1a {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio2 0 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie_gpio>;
 	status = "okay";
 };
 
+&pcie_port0 {
+	reset-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
+};
+
 &lcdif1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lcd>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
index 1426f357d474..d42363cb5105 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
@@ -1470,6 +1470,17 @@ pcie: pcie@8ffc000 {
 			power-domains = <&pd_disp>, <&pd_pci>;
 			power-domain-names = "pcie", "pcie_phy";
 			status = "disabled";
+
+			pcie_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 	};
 };
-- 
2.37.1


