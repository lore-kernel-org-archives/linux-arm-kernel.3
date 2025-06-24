Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E7BC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 11:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HL1CadwMqw2b5Cts+gkE2U/OZYLHSOZYpDrsRmVQ1Mo=; b=L41K6M7ftLALDBPWoqX1yxalW6
	CTkXIKYH++uYf42Sh25XPeFpaXVwaoxamd/aX8ogtOlFQ/Yt1xJHDwKjQHSQmduIN+DlJKKLrvGPJ
	mosTdLsfOUj7QHvmhDdpsHk4j+Z58aFl3z0ALq17UtZHJbxqqfFUyxFq9Qwc732hqIQ7VJzKlN/JY
	2pIBKTecrJh4aLVrgZS6bMKHlaNX8bI0pnA0ge203h8Imsg7Zo61ANiKbrxXqxS083QS+0enxGejk
	0YIxyQ13KHWTkXUEDumGxr1yEoTXK1TGQa0TnatexNXCoiVPsRK3IO8hVmg1eG50d6o/BoUTNc9oO
	nHUSPVkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2EL-00000005TNo-0lh2;
	Tue, 24 Jun 2025 11:54:25 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1SY-00000005O8s-3OOn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 11:05:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWBX9fLhAklWYL0f6gXKlnaYR2k0fAEmDw3YnJicKSoXzty5H5zW2dBem0RjkNCqGbUQST8rOqSf/P2KXLWgExmbCS2u6wFGWmkIK+7skH5036FKm/MVeD70GH7TckrJ7oqpYDp0nUk3bQOU21uJuDp0MunGUB6hQxJPFx69vGYqgDfYpjHphxa5dMtc+CKqikH/MmS0MECAaxugJqxK8Gbbi1MRxGJnAU22wywsCi9F+3QzA/oKXf3c1mIaguIqnpXQzqvkGfLLlsIUbIONdTGlfMuhOzs/E10Tj80OrBerImEuMvd/g3Hgm7pNiNcPgTddeO/cJKDSyHINOGkI8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HL1CadwMqw2b5Cts+gkE2U/OZYLHSOZYpDrsRmVQ1Mo=;
 b=vgk8RNdDukDWKsDEMuGqcTpsD4GA2RrwBJvwZa4D0g81dqoJa0d5PKleAnwBzfQZnUjbuDKRw7qc+KlmHUM8CGzG7IFXGjNcOEG7lM+GtYXUqNmSkyynxPWPgzGAeBNb1c3654RjyK8rYRdp4XU26SfjtGL1AdcvLR4GVwjEqWOXVO9Ma29akpR/CysQO2/f4pzw1NXMtESdyXNnCkp7ud2D0YJAQSpgsBHkzLCwATGqbSxzZ13FykZFi6gVEJyb6gXsPDijIe0Fq85hT5KzY264Sdxb6bQHuVdlbRwYmHeU9vkvGIiqjVyA5AXxXZksV227iLyll9zYzZUYYH3VGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HL1CadwMqw2b5Cts+gkE2U/OZYLHSOZYpDrsRmVQ1Mo=;
 b=qHHNmLmmSN38r8efaGsSccd3Zad8OBxCxJCxvHt1oqRj28Wjgr3xvwX+Yc3kdCupTwf7Iz1LFsTqIwt9upZGQTssIV2KRHnmVwmwAiWhgq7AgODj6ZKVc8fvvZcqaCY683F24LAFQ1YGUzSOoFbHJ/Q3MvYW8NFrF1CXMgKT0WVrPfkisHigV3pYjPzRC0qIuYv3GGuRRrYXBNkp2nQXKdzfel4iHIACgPNiVf3LszegHK8emodHJXCTkznhD0PLMN2z5NQfgTntjttSBaFOoKSfm8G7B9fjsB+h+1T7dZuN1lGADEoXz8dZe1Vxog1+kK+CHxoQeDwgdtkCfJagOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from VI1PR03MB3856.eurprd03.prod.outlook.com (2603:10a6:803:66::33)
 by GV1PR03MB10728.eurprd03.prod.outlook.com (2603:10a6:150:202::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 11:04:52 +0000
Received: from VI1PR03MB3856.eurprd03.prod.outlook.com
 ([fe80::e9fe:470f:27e0:b265]) by VI1PR03MB3856.eurprd03.prod.outlook.com
 ([fe80::e9fe:470f:27e0:b265%5]) with mapi id 15.20.8857.016; Tue, 24 Jun 2025
 11:04:52 +0000
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
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Marek Vasut <marex@denx.de>,
	Frank Li <Frank.Li@nxp.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	=?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Michael Walle <mwalle@kernel.org>,
	Heiko Schocher <hs@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Tim Harvey <tharvey@gateworks.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Caleb James DeLisle <cjd@cjdns.fr>,
	Junhao Xie <bigfoot@classfun.cn>,
	Andre Przywara <andre.przywara@arm.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Kever Yang <kever.yang@rock-chips.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add Mettler-Toledo
Date: Tue, 24 Jun 2025 13:03:59 +0200
Message-ID: <20250624110408.128283-2-Wojciech.Dubowik@mt.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250624110408.128283-1-Wojciech.Dubowik@mt.com>
References: <20250624110408.128283-1-Wojciech.Dubowik@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0002.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::12) To VI1PR03MB3856.eurprd03.prod.outlook.com
 (2603:10a6:803:66::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR03MB3856:EE_|GV1PR03MB10728:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b531ed6-5222-4655-94ce-08ddb30ef1c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CawZwCnSgOrXZDILDf7JXeaxXIpHRCpALeqT/G2iAgptzvspX8e/fYVdbdHW?=
 =?us-ascii?Q?GDsyWvltydjn0jGxCY3qv2YSCWDs24MhGB8vLrfdqwniuS9Ik7HdE3lkrlX6?=
 =?us-ascii?Q?Q1iCmy44rD73FF579gIIJH40uL99FSxTvgGPGFDVGhzEW8fZvDDKFLsUkA7W?=
 =?us-ascii?Q?RrYVpVMtq5Cutnf8LNqi2kJjczpoHHIcudUKvLkYMZP5Lwk8btcs9p5PEHUN?=
 =?us-ascii?Q?GYKrhtLfL10M2tLedTRJN+Z+BeS4M/AmoHS0NdVz+ZlmhNEeB3Jl/LzrVqAT?=
 =?us-ascii?Q?NKqgipsur5iC++87/uBole8S4VYNFr3gQdtYse2hbmYlg83UJ4LX0zkAKetc?=
 =?us-ascii?Q?7uJqoVC7rl/c7h92i0HoEvJRFBTkTNC711PTxL+Ij5Z/6tagLFKTAfYKyzsb?=
 =?us-ascii?Q?m/OEgwbh1hLu/ut77U1Kn9t7QY0NBmdPsJm3BkDwj0WDpgjV/86HFGaa9fke?=
 =?us-ascii?Q?H4s1C81CBu2th3IBBmHJbHyfni9WZ7aYJxilbdkGSekH5q3Wt3/NONylH8Rc?=
 =?us-ascii?Q?1IUO3oMsoTNE9unbXmgiRqfIfbu6COBFWH0pWYWUTVlevGjpYf6Kp6ieW6Br?=
 =?us-ascii?Q?XwmcnI4gaspUpSa705X/nvY5IKlbFO04rbageR29EN1G4nx02o4NPgs2cjGL?=
 =?us-ascii?Q?c+0KVczXxeaCPYspsrol6o16duP22st+W/WzKN6phI7uCRXQ0WvL+xBzy1M3?=
 =?us-ascii?Q?jkoW+M3utQdqZHVym0OvvrgkARc/RMUa7EC81T3ROv5t+/osNH9VLl+JnALp?=
 =?us-ascii?Q?39X69HGTh7rIuTImTEOR3zOelpL13hOLnYnTGpkrNOn+8Yc16VMgP57h+/Uq?=
 =?us-ascii?Q?9OKNWEldXlXxqK9FAf4Drgv1xMS4sh49mthzPsLABTeCjKbYIc7iNqzs8c+3?=
 =?us-ascii?Q?EIZTMwTCUw5Gnw+lqElyFB9OgjBZ7mtUavBJWhnuObmsB25vsckilXxOPTKT?=
 =?us-ascii?Q?POuPxGX49AiLe2BO2nHjdthguMHKTsYpT0ZjNeoGH+cTcnxeF50SAV7GFpSK?=
 =?us-ascii?Q?fQX4/80u+/rB1NuGczg+7c5VAXcZ06o+CDDFt7bnz/NiJZHxltpSSQOkaRyA?=
 =?us-ascii?Q?N7Lt2l4IUFfQEaIu+I2QZUTYzrPn19lUPHVBMdQDeuN7jdW3wxAWibn44jt5?=
 =?us-ascii?Q?byh7TLqB79M+hT3iGzbbpBG0a/nQ5SfKroJQPkiAqGlNu+tl7J56sQXd2a8O?=
 =?us-ascii?Q?xmnakuJASK5MqZQW1q8I072y9xCARHlKHJyoFWIQMq2koBpcypw1b5X0X2kc?=
 =?us-ascii?Q?Nt777ll23nBp39qBtqJJT9bpovThDDLrtRVDLSI8Exiv2mLkkpvyx0Sidn0e?=
 =?us-ascii?Q?HCW6W702v/BOZJmSeg7D6Yc1Hb6801GrxIBhIQJsBIdl/G+GA+oCE+ojHXCH?=
 =?us-ascii?Q?xV4lhiW33Uc084rW2PYSW9+axAgITPNchXixV4jGQA9Z9VMp0I2671irIpN8?=
 =?us-ascii?Q?6Jf94VD3LiO/Li7fn1taA3853qjQEvPsgde6aY3HzAen0G8Ab95awA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3856.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2lZJ1p3f2XW4BmQF677Po/OGXR71KPcyuSsa5E5DcbdYAuXanssq5ZinDqvB?=
 =?us-ascii?Q?JVAjM4h9D3X8TvSIBg09BPp3dBbd8kU+6JzwIUbBZzZIFY0F/5PUfjfCZ3j7?=
 =?us-ascii?Q?IjOFI44ntR9R8yf0I5H8D9vZOGKWDTdjOJhiLJSonfox+GiH8Krmz8FbkiEW?=
 =?us-ascii?Q?JLFgSbHq5UvF413I+T72wtbcZtieAqufxA93Z84vZX/pwOe9KifkQPzzuHYZ?=
 =?us-ascii?Q?4MDuhUda4CVK21SbMYX040Jq7QmIJkUFA7VLiU7pckBanHOfZ+1tuEyPxPl9?=
 =?us-ascii?Q?GO1x6A4P3XyLZ+o4JlobYcX1Ll8k5uHFkPhIetewqABFsriYPtvUBfMZ26Be?=
 =?us-ascii?Q?JJb/Z6bTHeQJW8yYAcietnYynuADwEG2NaHFtqKwMSn1YMIM1Lwmk2nK17EZ?=
 =?us-ascii?Q?Jp/Y1M0ztgqbv020oWL9E+C2TSEATQ5L6KQsWYH7u8po6e2Ys4WEwBaTDtya?=
 =?us-ascii?Q?vx938z1qp2bhvSZhjy1WwFi7pSqXX4LXS8p8vDjQKQnfZsRFJ+qUDxebHy8c?=
 =?us-ascii?Q?0vk4lMNOkd4931S+AfPAlDlFa6Fl210wKJBZtGGcPREX3nxIPKSOBGYjB9Gf?=
 =?us-ascii?Q?bT8MM9p0OJYp/t6nDdsQVJxGtnup1AJOGA7n82SGQ2g/gKxHHfG6cib8B/N2?=
 =?us-ascii?Q?nQq/r8N0lSXVKRQ7Ekarikj+r+5Tn9IGizYIoh2FWjS5Amw4hdtsprNwilbq?=
 =?us-ascii?Q?VJzbIrTHDOmVImvZnkaL1W0E9CuOAUEQf9GZ789f3B1A5Yi0b8qAl0ylTjr7?=
 =?us-ascii?Q?j2oUCMLXQz1XSuumUOmM9eA0EMT1gQW+f7MtrchKX/up9N/Up7FcnHHypNLD?=
 =?us-ascii?Q?Mg94DOWcbAy7fEPldZHt0fVcQAKHLg6v5rtW8C9VBnuoaLdj0s5xif6izt3N?=
 =?us-ascii?Q?Vc9F0Q08UjTowIvfe37xiq6iBytvbnqPa7ZM8QMYUx//1Y/j+TsN6+KN29cG?=
 =?us-ascii?Q?EQoSXSHI/V36YaEeEB1I9u7IWHyTLHljTLurbAZ2VsRHgj1F33b3AlTVVmSd?=
 =?us-ascii?Q?2rdEKUKasnh9jkVi5/PlBrYoES8CcT67X1IxcQ0kPJX5CPLnBILH5ny9wG0m?=
 =?us-ascii?Q?VaihXT39QC/pfU+fT+sulc6yyCw+OaU4sTeBqg4aAAz3oW+leKJV7rkFVwpI?=
 =?us-ascii?Q?OQay8rvQRS+Lt9snvlkVS5QM3N4DxH06D4e+8a88svIkMKNqlzrOFRYczoLO?=
 =?us-ascii?Q?QyKCAMf4VcqIhT1tVno6BmPYub6Ldbe+I75BHl3oiNPC2h6Nhr+Rw/8OYG1Z?=
 =?us-ascii?Q?Kj42ItuQlNyLXz2Sm52gEUhYb2DCmkVzLNAjsZQLuCb9qJfwzOoaMezd86ZU?=
 =?us-ascii?Q?ibR2dS6yB/9LuLznt79b28KA3v4mm+qYkh0e9xCXttCe8Hq5sS+1IaxKdAcB?=
 =?us-ascii?Q?Aza2DhqWx1edIsy9f1nQDrRsqtnhWCZw9TtCoFD8+1hvFVOcGMpQlbKeVLwo?=
 =?us-ascii?Q?dOVoHfBYwJd4HVTaKaSssHYzsKYyH1jmS8uNHNTv/6wuUg9sQImXHiHLX0gA?=
 =?us-ascii?Q?NcZEXr9mQzuIxQmsUU3YE+V7UVvoSdjq34Zl11gsBYx5MCEkzsdPDxIqv4ey?=
 =?us-ascii?Q?jOAFnM1bKTs3rmrYyl5YaUq2dAXkBo7p/xIUqFj9?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b531ed6-5222-4655-94ce-08ddb30ef1c0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3856.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 11:04:52.5410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C216gaaIXBhaFkyTU4+Qd+XxWBT33sOHEoUmDCR4ac6ep6Sy8W9cOEi9/x+FsXvbI1KQmYtmgD1JtAUWNzUg7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10728
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_040502_848671_A562E390 
X-CRM114-Status: UNSURE (   8.59  )
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

Add the "mt" vendor prefix for Mettler-Toledo.

Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6..0534ae640348 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1018,6 +1018,8 @@ patternProperties:
     description: Micro-Star International Co. Ltd.
   "^mstar,.*":
     description: MStar Semiconductor, Inc. (acquired by MediaTek Inc.)
+  "^mt,.*":
+    description: Mettler-Toledo International Inc.
   "^mti,.*":
     description: Imagination Technologies Ltd. (formerly MIPS Technologies Inc.)
   "^multi-inno,.*":
-- 
2.47.2


