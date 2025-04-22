Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7ABC369D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 07:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kMzVUyEr6ZFHVtXGGhM2m5bO0oZPm4IVLjs6zdGTisA=; b=g2hx5xL6falpHI7jXs+XwWGrGH
	HKW5+vERSJOD6XNJQs+ThjSgWT/yKNU47ecirPlW97KS+IG+TM5GDXcF3vyY3adtdqpzYo1nT5B7v
	mo84upA3wOBRXoxbuklnoHr9OQrkg6E4+MlRWD1GmUzOYSSVlAkrRzRIKnII4RFDL0S2HumzvmwNp
	Kz7Q0AZ+Esk7IFFTrBTh6g4AwMOudDl9jVFRogy8fzT9kFcf+T/U9kux5R4rtHX7/hmHDCSbSn+6s
	P4bmRQE1FVfWL3/OMaPfF0esj6TOBBAVxh+36oVjeY2aSBuCpFvtUrYG/iXZzdBo9zsJW638wv3Wb
	4z26WDGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u785f-000000067v0-3lOY;
	Tue, 22 Apr 2025 07:30:47 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77ZU-000000062cp-43i7;
	Tue, 22 Apr 2025 06:57:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d6tGpQyU8+Tp8ckMyRz8vc/6ClSASsM3S5u8FVZHc28jlAIBzfsvPQ90+sJmq6GsDTWVJp8RO+ke+aSTuKethVWUSWB+HuJbLYDQCYM4kRm/hkBMHUWWhoD8ZKu62EMDbjc3j/t+TJbBx2fRFR9n5ujChu7krPbkiKlcpU4QTy5zID8sfnPc31hBOmDFTgoCY9E49aK/brARy0I8lCwj5eY4dcLMY/AQ0XWY7srSQE6UAX69vK1fMbPcTpqfuvxwTWt6HRpooxL6wzHoAMQ/pKymd7Lif17vP5UN9cwRcH8er1RFCqTkZo8VtpRh9XG7OtjVbwHB7ieC4RQ1TNH0+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMzVUyEr6ZFHVtXGGhM2m5bO0oZPm4IVLjs6zdGTisA=;
 b=boo3lF2Fm6haE0qoL5Qv4VjoRKBKshbvgcsBNGZ2z9EBUOKNOr91ESVdeNGsJqdqD1B8UdrvENfwySx/Gr92aH3Js97WHcTNId2Gh5bArfiTEXg2kdjI5pOtA2nBGLJgezI5DUrPpPN8AABo+2mC7vcJ6jLBDLOb3DkqZhw7Tk2NYmWZXsvdcMEH8EMtnKSrmYxyBx5I1jf/AD0QbTEHZClQg8FhmJWsDWsIomHxw4xH4+mcv1OgrT2ZGKZw9tdMbfh4ROY8xEQ8BuKzN0jTDFd/R0zP9yu8LBHpzQa4/UgZyT2ZWtJer2/jEgrCcjYOyxQg6c3drltJygnwZIYqYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMzVUyEr6ZFHVtXGGhM2m5bO0oZPm4IVLjs6zdGTisA=;
 b=UBknqMQGsAh9N+rmRJjzhSmDdScZ7nx7eG1hzSKX8sB4lZo+jF7QW72tAEu8JQZlM28wz0Zoy/Av+eUubfacGCgTyRpkfmFesYqLU84kBYX1iFx66iRLlNlvGdQUx7M7yOz/8cuinEJe/XVsFv0ijcc1ucWFjJ788cieLhTr8478cA3rP7R08wQI2MmVygugAYQXPbvla4O+Nlr3Aq+Zn2DkV+Mjkf0Xxv5p6huXt+K97SvHCx6RdksY43yIgARSWMegt1RmVP12/WxABGq2A54JoWu/xTYsgB+pQwHBI9wmyRpXcFBclbG9Jv4fDb0g6VJTWY81Mh4ZlJz+xdZhvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by DB9PR04MB9937.eurprd04.prod.outlook.com
 (2603:10a6:10:4ec::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 06:57:22 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 06:57:22 +0000
From: carlos.song@nxp.com
To: miquel.raynal@bootlin.com,
	Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	conor.culhane@silvaco.com
Cc: linux-i3c@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V3 0/3] support different number of clocks for svc i3c controller
Date: Tue, 22 Apr 2025 15:08:50 +0800
Message-Id: <20250422070853.2758573-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0028.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::13) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|DB9PR04MB9937:EE_
X-MS-Office365-Filtering-Correlation-Id: e1cd21e6-ec88-42dc-6c43-08dd816aee01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fKqlCxXslE7NzsUyOJUjbORHp2Fc7ZPHLCnd0VFGDhVsZG4bOY231RLXYeio?=
 =?us-ascii?Q?Es2yeN9wX92SjD7Os0UnMtHPTcSH/qkG0bVHnP4WZ3BfGICd5lmyhb8I2Clm?=
 =?us-ascii?Q?CQZF2kAJIaQmWfikGgtclSh8GIcow3u0QlcuSgASjIDRLLu0mmWuTzP6L/52?=
 =?us-ascii?Q?hhS4kaCTSDpROBTq2FsKsOfyQGHbFL8sTtzoB2qts+xI3MRwNECRZyllC0Lk?=
 =?us-ascii?Q?xZN6CpKGAMc8cfugCTBSr+Cn3hjo0zAz+Su3xc0PzZdMwxBZM56TBDErlkcW?=
 =?us-ascii?Q?hFz7OVrQlfPvMPV9SMb/hWrxrr/JXFlcBZI7KqYN1pxutFR4X/o/tqS60bw6?=
 =?us-ascii?Q?9GFmIry9Im5LLU9IkvcwLbaWhomeQpfDSwJ1r7v4gtJTByxBaprya+yvSFLO?=
 =?us-ascii?Q?mAzrMltZOJlJ5IlbP78THKVDTgJsza1VOGcOMKyjk8O9YEoWRzE8RfHdrX8g?=
 =?us-ascii?Q?DghvkB0x/KXG3my0tAYGF89FMB/Y8ZJWd0J0HSJvrwEhdo2airwF2ku7JYfV?=
 =?us-ascii?Q?gVvOWgyB9JiH7QqJ73rz4bpHAXzW9WaUo0IWYqXACPurFXZTWVeta7iltRJz?=
 =?us-ascii?Q?XG2/6dPbePYo2lKGvvF+5h+vc4/Yh0X49rERpAZJ/XS8HstcN5I1QRYFXPmk?=
 =?us-ascii?Q?zLGhEpSNT4qmPseMQYXInUM3PRyYADT5HR9oauZ4O9n4DSRu6lRNw8q8a3UR?=
 =?us-ascii?Q?duVLD0JWFM2fGB24WojEtHFCHnT912UIeK/xv4z8jnrlGDE4HfKr3Y+SpGa/?=
 =?us-ascii?Q?UjvOvMzddz4a3f4h77xJQe17XRafhRFXhpSPik8d3oJtUPid+FSxsNVXLo1E?=
 =?us-ascii?Q?UIemAvXblftaXx+RbL92UzTvlOr3ZWnVLTr/LzJzh6GKEVkSHhvIttAZYDDj?=
 =?us-ascii?Q?xblwu3TPE+j0vQGybvPFIh+K55A4yusIINQ6+WJULelyHrkpcxeamQxNeakH?=
 =?us-ascii?Q?iZrUiih/jhlhJxtRMCLMfOpmF9vCnMsiXsvqpGw6gKrCy18juR6ilAcMIo3+?=
 =?us-ascii?Q?IUytzKjbWWFK82/KmJagq34S8Q3S0DD7cLhU3L5ctrdkiIGA3UyGCla4lr0U?=
 =?us-ascii?Q?LCvt2rYZNEF31dXnlNLy1LZRPDIVo7crueL9L+yv1BkB63T6hy2lgQM4b8tR?=
 =?us-ascii?Q?J+bNnSqXVlUkIVNVPFQXfVXV1Vc+K/HHWBhf7KKOjQ9lWnFcY27YY5xN8+Ty?=
 =?us-ascii?Q?vrW1OQWDqrS6DORiqC8j4AN+polkPRpGZZemsu3nRHWlvStqxjxrxiyX/SMh?=
 =?us-ascii?Q?8fT2mloyaIClncMNMqOfyHVYnUdUNKydKctBzEffjmJdyUe9f95s2pnwD87A?=
 =?us-ascii?Q?ebxWWXf0PSLMElzjnxM0VXq7DPUlGmdPUJ+KYZJmmdTapRkLQAS9omqLk/Hm?=
 =?us-ascii?Q?sOuIZgBJrEXhG4X/4y5COcmi/vx2FVW8uSFhtXRGbzQFMKvqKlfz6lP9rQcB?=
 =?us-ascii?Q?oxQZ6hN0WpkA1iLAa4WY5P6AJQv6rS9+7/vNha+imF6TXgeHXVrEjnkO1ku7?=
 =?us-ascii?Q?t6QvUuqsoAkvVOA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jiK8umZqZY2mYgh5hZM1qCVuJCO7ANS2NPd6oiMDvTG9v0y7IpVLtyUDkAia?=
 =?us-ascii?Q?ahVIXQXSE5rEVbR7jBwuzwR7sBteHdTv+ydOZkJc0tZyODoRfGzDXIU9XsF9?=
 =?us-ascii?Q?KCcaAHNrQHflLD6o29rhJTWN6BHl/HYa6V76Dc5eCcBtgF/xLLRMssAg5lhP?=
 =?us-ascii?Q?js23RgY16ECo3h9zCWZXZPpehpDog1TCzVH6QFZ0W8cVGGExPIvhuf5tcLTI?=
 =?us-ascii?Q?rFS7A5Sz2Enqubt1KRJhH4/j5CpZbakmM9KFmkyPPth6+odc9EZOzyFo7vi1?=
 =?us-ascii?Q?nyF/gc5q1r66OlBMJF18s1Q2bGWjuJYmb04cwPmGOzxISKC/lXRfhF41k4/E?=
 =?us-ascii?Q?vCLi0iCzYPzTykzORLhLiCuSVsqWmx361/LdvA85Ytb9J+lwg0Zt0TSjU2YV?=
 =?us-ascii?Q?p0706YdDpliCMaCpz3e40QNKpevdYoNskmmJIx0Le4G0tpZmc0SITEuoNPwF?=
 =?us-ascii?Q?bPW7jKbg6qRVOy0PSGDlBsLfIjfbZ5G4qIvkiZliOWFBVxZpS+7tt9XCk8j6?=
 =?us-ascii?Q?jGajr7o0aALd6uoEq0gwdjWcUbg5XcrmDL2OBzVnoMUXhQPYenurN24+Izzf?=
 =?us-ascii?Q?PWaesor5Ou78HO5fMjUFM/JcowKrl26bi1MVRlwD0KJcpczxN8fo4YVEmJ2n?=
 =?us-ascii?Q?WSzvXdSRcW80q8ml4BhisaAw6+Vy63P0up+sAwxbCbYW3P+mK4eP56NAUXLL?=
 =?us-ascii?Q?XZPKfyumbQx1uS362nuvztaSfM89elMNeSgEPhhecuHcaQMfeihrPaHK1/O7?=
 =?us-ascii?Q?cOHY+xexpnE7K5211yewubIc4igok2U9+sxIE+4JrV+vumETWSnf2+T3V5vg?=
 =?us-ascii?Q?6NwDhKr/QlrwLZVqIFC3i5u5HwLGpVct4/5OigZBYv8GBFopYqv/AkHADk71?=
 =?us-ascii?Q?/PPtRCiet87ZaOjNg51sFyhJB95mII/1SqpO2A6pS6UDvH5PuPEHOgTqre+m?=
 =?us-ascii?Q?ihvMqF9YxHzeU4JyVB02R95Vs+3xva0+gAdZ6uKG0EQNfpjIH101pFjxrpNT?=
 =?us-ascii?Q?wzoQkyFo/HYxNfI07UP578NeaZ0VP07hhsphSnRnM+mwa/uSn6ULo4pe8w1f?=
 =?us-ascii?Q?m8GDDXDtzaXj6WKLIaOKfg8QV/tUM2aX1ArUgTa7jBNa2Vo5uv8/6UoFfXXj?=
 =?us-ascii?Q?HmTvnVvSQvdC2npujN6dT6pbXjTOgWgSS+Tccxx8cVu8YRnD1O7/UWFhqn3i?=
 =?us-ascii?Q?7+IgT4AbuYVT2T65yetRuZwRud7j/9BPs227va+GqDgTel6jxG4QVtYD/Z7Q?=
 =?us-ascii?Q?QpYFqnGBZiTxFdfHnDMSn/WjD3I4bg907vulXceis8Nmb64jd96Z3jRNyiW8?=
 =?us-ascii?Q?OhNuR4ulO4/uvs55eLuIuTxfFsc3/pRzTjV+CVWescpXRrZ6K7xJjJpax7Gc?=
 =?us-ascii?Q?OEBAWddOvJwDLy1Yjr+ZauSKyD0UapR07JTfsD9rhSfAwFuW6Ctts/EPbMvq?=
 =?us-ascii?Q?MWU4p+UIR8tTi1fF1iB6lWxRacDDWZ3V8AAO7AjQq5jmLAVH7qVVjzaSLVMT?=
 =?us-ascii?Q?l0DNKQXMSzjDhLQsEGAXT40JmOp6c0Mod3sx7B3Q6NmRQW87yAsVoN2RW8U9?=
 =?us-ascii?Q?X+h+g+mw9F8I4YbYax10KxkEa8E25E9azFPxxked?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1cd21e6-ec88-42dc-6c43-08dd816aee01
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 06:57:22.0698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szZcc5xUc85WxMPPAR+YglWOjqGxP/2nMRVeZjQCW8lCa22hjL39ed85SaXhTsEY5ARxbY8LJ6xyD1P1J2zcPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9937
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_235733_032586_6B3FC1A0 
X-CRM114-Status: UNSURE (   8.86  )
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

From: Carlos Song <carlos.song@nxp.com>

I.MX94 and I.MX95 I3C only need two clocks and legacy I3C needs three
clocks. So add restrictions for clock and clock-names properties for
different Socs. In driver, use the clk_bulk API to handle clocks to
support different numbers of clocks more easily. Make the code cleaner
and more flexible.

---
Change for V3:
- Remove unrelated fix in imx95.dtsi.
Change for V2:
- Fix bot found errors running 'make dt_binding_check'
- Fix warning from bot test. Use -EINVA instead of uninitialized ret in
  dev_err_probe
- Use master->fclk = master->clks[i].clk instead of devm_clk_get
  (dev, "fast_clk");

Carlos Song (3):
  dt-bindings: i3c: silvaco,i3c-master: add i.MX94 and i.MX95 I3C
  i3c: master: svc: switch to bulk clk API for flexible clock support
  arm64: dts: imx95: correct i3c node in imx95

 .../bindings/i3c/silvaco,i3c-master.yaml      | 45 +++++++++--
 arch/arm64/boot/dts/freescale/imx95.dtsi      | 10 +--
 drivers/i3c/master/svc-i3c-master.c           | 76 +++++++------------
 3 files changed, 69 insertions(+), 62 deletions(-)

-- 
2.34.1


