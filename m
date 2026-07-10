Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DA9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 08:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uDMrCxeHbibDimrcVkRwzwg4TdiskrjwdgRpSbWviOQ=; b=0j9Ujxatpo2UpKchMJCp3nnnrD
	umgmcnNI1QlejZ4kJ7MXinZ8a+tZQ58PMnW0hR4dVsw+Hs7xWPs4gHlMwi3islLiuZJyeT2mSXbB3
	Wn1gGuvJMwXG5eu+tJFmfqQct5CDJI8wDQjnHgd/y6rYEJecQmSsLnTWpjA9bx7mkCdTvIib2AgWW
	7zZ3HIKbMkD5G6qmg983RtwWDM48YlSk1mPTZ5eezlli6SyRcGKsDg4CF/Pz+2VcKb/xhqbcilzSG
	3aX4iJ00LmVBmWPl50GpNj5i2m05nyBzsO2JCRnXBMIAmMN5zvRUbvgMOCsJBPsiS8j/wbPjPY56a
	3l2BLrhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6ZP-00000004SQ0-0mGT;
	Fri, 10 Jul 2026 08:26:51 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6ZM-00000004SPL-3UEi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 08:26:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K6VcM1Clik8afNl91EPhYLPQeHZVF1O5V93lkhXmryTmUrNQ2fInggL+1/gsh9cOxlhZNQmMv2IBrPX78EBOh7KCcdMfY3MsHSq3v2q+36crWV7A13Tbw1806/Eu1YyLUSOaDCJP5FLj94Biexg5/w1MFLNTHPB/fQO8jBAyZ1WkUGB1FnkgxJ4HLopVCzK0NA5661oXWn3Fh0DR3HvtZwwsyx0PjhrN9RornwdiKcR/K/ZbND9mnNOAn7oNEQJgG4bYXThBr4WyhxB+RoPwQgsLG5WmuAxrn0sOK2jsMhVCOpEakodAj8Kub35RuzBYsLTJWT4Bd9e6NTGai/NdfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDMrCxeHbibDimrcVkRwzwg4TdiskrjwdgRpSbWviOQ=;
 b=DVoe7V2zKYb58QnjvAvkTdg9ncF1Xt1Q52sBbxj0n04XhrEehrAZbfYPCzSBUxjqZDnaopTeyYvNW1UdpYzxYqB+tQka5vVpPL9ffweYt59s80af/IJiBfhbfDhaWmdyTMKzoiIWugzFcW640xPBjV+avQBjv6ZRmKWaPcAsKeYsmIeHWzcqc8V30b50TZobS2o79DH/naFZKCe0Hd/GNJDFjlPL9JF4fxCVps8cZ9ZWvQsHbIhlxvNZz90xjMX2IzS77+wzebhBfYg1Yti5WvAKZQ9pj3tGXxoMjSvHhdslTqefvShb/05SFv2az0Ajpr1dyaf+FGXJjb7/QdWIwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDMrCxeHbibDimrcVkRwzwg4TdiskrjwdgRpSbWviOQ=;
 b=ktab6rPPKZyHv8zNg0nzl3L4CU91YRm5aPfd0H8A3F3UDxQfCMKeB8U36/y6gYCNsNZMiz2aAFhxHX00GEMeXw3ZAU34/q5BlfTHf5y7+TW6enMK+B7WYlPpjsShT3YwL6I55Bq9MTb9jIr80yvJmSUlgqIX9O5zPoimm5o0jdWzXo64xrd2N1yRbhKJtco69NKudy0hr45zxRZf+IyyUrAKnKCrI+1/fcrxhCscXWxrbsgPtVdTJgDOVl/IA7BIp5MhNUcwlBivshL2OAT62KI7Y575H8dscJwt1ghRcqcJmelFmsL/ZnZf3Q/bsl4yitJzJ90PJy4ZBNsJ4/8PBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB9PR03MB7180.eurprd03.prod.outlook.com (2603:10a6:10:22d::13)
 by DU0PR03MB9731.eurprd03.prod.outlook.com (2603:10a6:10:44d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Fri, 10 Jul
 2026 08:26:43 +0000
Received: from DB9PR03MB7180.eurprd03.prod.outlook.com
 ([fe80::6fd2:12a9:4423:8ddc]) by DB9PR03MB7180.eurprd03.prod.outlook.com
 ([fe80::6fd2:12a9:4423:8ddc%6]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 08:26:43 +0000
From: Wojciech Dubowik <wojciech.dubowik@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Wojciech Dubowik <Wojciech.Dubowik@mt.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marex@denx.de>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/2] drm/bridge: ti-sn65dsi83: Add reverse lvds lanes support
Date: Fri, 10 Jul 2026 10:26:27 +0200
Message-ID: <20260710082630.394040-2-wojciech.dubowik@mt.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260710082630.394040-1-wojciech.dubowik@mt.com>
References: <20260710082630.394040-1-wojciech.dubowik@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0028.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::15) To DB9PR03MB7180.eurprd03.prod.outlook.com
 (2603:10a6:10:22d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB7180:EE_|DU0PR03MB9731:EE_
X-MS-Office365-Filtering-Correlation-Id: 2428e767-4ea7-4311-f683-08dede5cf917
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|7416014|19092799006|1800799024|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: XRG5skWfbpRYOHQQVlwN+Ta6Lnr3Cvovw/VuIVCg+4qO11PXdcGyjWgAfddkSWMrBIrRrtgQht41w9nsGx2z75EQuO6SjXYEHoxyJUWyDLhC3Yh2woPYuNeY5u0n0SHSCyHl/aox51l2/vy8q20q4XqMw3+i97vqK/qrOZ2KmC2/IECZlgJhsGrNVxA+b/2ZgriXKynnWyFT3nffv28cR+R3t2J5wsCrUO27f6zvjDllEd9gOZswngyqNDvXV5vAErPHz4ceRobNqX2bZ+IxbzIkAAsiCrQPmJdxu97X9bZUV+rkCGSKeW+3etA7gus24s94pgZCY/w8KDDZhpSNbgpxQ/ofzbYps65KwYekBJ84NJbfLkjRmowy75At+SQhJSQnCrGksz7KzNB6dhv+XXvYoLcQ3wajcSEXYNgdzEEyRxRlh6wqDOL9eQENT2DtgaUsLYzFd8Pakdf8UMPHWXZFbRBs4N9hQ+tphiUBcqI0wC6aMY7KiBgkW8wiO2+8cxOsL3Lf1d0O7EnhT856upcE+IekFw1Ul3mYLI0r3Ou/AZcq8OPslpwMJqP8EISssM5D0K1IjlIBhIljK7BBQ3gWmjMnZpQPBaYBWtmA/M4OIHw4ZicnJ/qAB15F56o9kYMNsGQOa6Fiouh73GaqNxVAgqcr7BPDDkwfuompaHo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB7180.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(19092799006)(1800799024)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J3kz34IMcRR2b+0q45IKsFSpyY066vCtCmaIz6p4k43AAelB5sqf14Joypfq?=
 =?us-ascii?Q?/gy7zPJA8SuE969X7GJ7rJ9EW9aD/moOZUS+GomMepGbacz/W4PEcaAFxegv?=
 =?us-ascii?Q?5atDpyBMwM/8DOkD0NOv+8vV186qyK7MPREveqAm+7CuTzekraeYWcmh3n6O?=
 =?us-ascii?Q?zRnpmy0nUIMkNVrR9YprJ7mLeTuhvrBkUi4xlKUPEhFy+iyIrzOAsr5ssOz9?=
 =?us-ascii?Q?zgxY2hgxr9+TsHmr85bTjDOqHvbotZTOgl0csnNjgTJwBKGj2mQv3zbC2iB8?=
 =?us-ascii?Q?wRACAaFuCzYMmhPNd1qCcxPpz02QU1BeFCuu4jxR3MbkFSxVZYneM4Jh9Grl?=
 =?us-ascii?Q?tE3KZnTquGVnfZKsknYl2ncZAWXvmI1yhUo1CDJ+wqKYf74eW30UqiLkMTga?=
 =?us-ascii?Q?Ck8erU/qiAkQ2lrSPIVr/Oi2OxCbTMeoi6ujPyP9ndpX/kX1LIOh4kKcHvOW?=
 =?us-ascii?Q?xqMtCMlxfUA+16+ng170Q5gLuU7kAs8NN3CIuEOfpfTRPhRIsPrB97kKyPJ4?=
 =?us-ascii?Q?a2zer9XbQqcIi2bDyFcmE97Xcb9foeLtAZ3RhafglCArcW5JzqvM/xounaWv?=
 =?us-ascii?Q?8a4GtEc+4tK60QK5+aolfZmvGJqhxYE2dDurqQroqM8Zm89O8SJ3euXboQ9Z?=
 =?us-ascii?Q?lJxy95w9FQ2FeOcgEmai3RRxhCfpNnzGj9Kya4zJh1xIXy45uA/vYJEolTjn?=
 =?us-ascii?Q?2wus+d4VoRvtz8ovzSC4SpDItaSMtiHD+5ra5ok6RZZz+l1ifCPhYRMPDOEb?=
 =?us-ascii?Q?WyxxfxDahda7ZWiOsdnLKJwLITkHBbUeeJQyRgyu7xfjv2tmdsLgGvgIM0x4?=
 =?us-ascii?Q?8dGa0qUYGXspZdkP+M7Fb2qd+yHY4h02r540VnxJc3a6hOyX9+DGN6GrzE2T?=
 =?us-ascii?Q?Hh7VHp0r5516uzlxw4aGEYJRrIyKRZWP/8SAIYaamJhHcS8dLRffLxINzOjO?=
 =?us-ascii?Q?JDgm6Nu86bjsP640w/MJxdwP32qHWQTecc0adYEk/CkIzmIclkzcDa4SfXuK?=
 =?us-ascii?Q?+tEkQJSObizXVM4eY4TuRaIUMNUVMmW3ujcifs5M6i1vaVe8UDuJ5bqGaSsW?=
 =?us-ascii?Q?gVQB2SbBFtkR69ZZjvK6YH9M54YTgDOfA1/5vK9TlV5eDW4NNmpDiKpY58OL?=
 =?us-ascii?Q?QnNLw84jnhU5ZzrQwK34t4NxCo6fmc0zxhryAMMUneanWisRY+04+JD7aNDK?=
 =?us-ascii?Q?Lcc81YR0al853tu8yRgJKogAejfOpigWbF4l9PgfZke0qPYwy28VwV1v7YGE?=
 =?us-ascii?Q?u2UTEr7iPKPcIsZ3ywJgABfYm/sdrJUuhAturv7wgvhIUWGFfNk6H/KlwuBL?=
 =?us-ascii?Q?Q59dp13r08C8FSOhgZE4iVZKrNYgfgCLxClR+3YIvKVtAmVo7ymQK8FiRmR/?=
 =?us-ascii?Q?s7P8qRUDImYID8F+VnXlGHtNnssSSOkMASTEjErXM6YxjnhwTRqT+PMDzBn5?=
 =?us-ascii?Q?UqoWpAIc4dLA0Ox6QSm5Qu6n+Za3PVZkFRa2dmIf3H3S2Bs9KGvfXnmNhPcI?=
 =?us-ascii?Q?51BdF2oLPeooyTVWHTq/RrOeupdGggeAncDNx8cr/cx92Gs2zYhaiaQg+ZDL?=
 =?us-ascii?Q?uGDcnhBhSxJsZHwGBAS24J9+NvybNBdSOXgMZLdf/U6auL+netPlBjNqfcgl?=
 =?us-ascii?Q?j6s1uRAjcz5teY9bpTYWYIrFUsrj9JtjD0fOm3rOHEeJaBCWeHpUD9JnsW4V?=
 =?us-ascii?Q?WonrTeyRGbRm1JEqZcd9cY6gZBAdezTIf9Z/S29bSjvQ8qzWTqezMpnz0B6M?=
 =?us-ascii?Q?EeggkdM+mw=3D=3D?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2428e767-4ea7-4311-f683-08dede5cf917
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB7180.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 08:26:43.1816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/t3N2AuzJ/5+SbMlLi1RLQ7WYhIaZJ0UPlS/mV1G0eqD7LtxuMjhJMgBIuDlaGldLbwQGX5iMjqdeOPMCO6+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9731
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_012648_873464_B6D6E499 
X-CRM114-Status: UNSURE (   9.04  )
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

From: Wojciech Dubowik <Wojciech.Dubowik@mt.com>

Add support for reversed lvds output lanes. With an optional
data-lanes property one can support default layout <1 2 3 4>
or reversed layout <4 3 2 1>. The property is optional and when
not set it keeps the default output layout.

Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
---
Changes in v3:
- Add optional data-lanes bindings for output nodes
Changes in v2:
- Parse existing data-lanes property instead of ading new DT
  bindings
---

Wojciech Dubowik (2):
  drm/bridge: ti-sn65dsi83: Add reversed lvds lanes support
  dt-bindings: display: sn65dsi83: Add output data-lanes

 .../bindings/display/bridge/ti,sn65dsi83.yaml | 42 ++++++++++++++++
 drivers/gpu/drm/bridge/ti-sn65dsi83.c         | 50 +++++++++++++++++++
 2 files changed, 92 insertions(+)

-- 
2.47.3


