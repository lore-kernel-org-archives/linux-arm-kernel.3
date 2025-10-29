Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4751ACCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 20:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TojNt6U4hf8yxC05B9QiDPbP8GGzin8dw0MI4zHIHew=; b=NmD3e7EfaY2jD5Mc9RIVvXJgk5
	hR21aG0kqOnubIuZk1J6sPxFAWXopga0IiKox1SOJXm2wHINjMfYrWXm68v9ddzcOyaRzuwkc0gjY
	EZ/qau6JtCcTDECA4gIvWpNK6/zUf/J+k2DU9A25h7vvwGpYNGBHrLpuU5VMGVTVlXhOPG4USgT1j
	lUvf3lRsiaQRbQ1AXb1QTNJ8TlzXxQz97QIGQmcSHOBtGGmix+xwQofXjhoPSudY+4SsnZVkgopNX
	J7yu64/urzzI4ePAtPGpZiuQfdHWBa7z6vkUhdzSYLpYSsUzUN8U7M6Z8pvK4XDLtO2VsbdOb2C5B
	HvBFbPAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vECml-00000002n9P-11lI;
	Wed, 29 Oct 2025 20:28:47 +0000
Received: from mail-northeuropeazon11012063.outbound.protection.outlook.com ([52.101.66.63] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vECmb-00000002n0Q-2LY9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 20:28:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GT/BFG7v2JPFJGN61pWlWLc0Zu1vSImgaE/js5RyK6k3i7j5MKnsneGKsn3hwmBR5A37TMlRXBGX4Pwk8OBgbEZANa/LppVsLhHZFsieXkOlD/jss5r1ZHXd0tmj8FgI2McVgix+IAeivvGCzQriFRwlIbNHfDmtSzy3uzVzoLlUrnOvcepfmUaEnKsbLaWEZtKh3VK7W/FPqM0q3b9DfLjH00fsxvAuaDnjDkmgcOzNToHpPY+i4l2poGTEbD58in40JWuBWKSGHk+bqbR+2FnKbrkJSRhl/lU6rwGo4px/C15JrrhdJWVSZUMb/M/qKBvkYV4IK0JcRL8mMFCXnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TojNt6U4hf8yxC05B9QiDPbP8GGzin8dw0MI4zHIHew=;
 b=Dc3AbhTsYm29Huz0ZZegjVuskWeempqFBHqvsZwC0w064usWkhX/IDR4qEXJ3b/Vzlt3bxx56w/rl2bxOPJdt+foqYCTDqf1IpyNx1kr8qiBFDtink7sFXiXLr5N4i9EMer1C2syIaaq1Fd391OFLNycV9yOmH0RCWdSuDjsh54cFuKxSAVJNLX0thgPF9sOf7LpRtCcD1QDwSnvjnu57BEKjYfsuqFiJPe2vVYqn8cTUVbmDSqFP9DlbuRtnPNXXo6h+zUXiRI3BIb1+v6+swWlg+TpFlFwglusVjGzaVqi2wx/6oWb8Q8CDOrgDcMLq2kg5RXKYaA9cmh3BT7IQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TojNt6U4hf8yxC05B9QiDPbP8GGzin8dw0MI4zHIHew=;
 b=gnsY3yb1p/Hglv4Y78+DJM0MvX2my5R6B2uqIsPm4/5/KJw863pyaDuHtHSVz7oVrVZkeg/vS1OJQlE65r11LHUufRP3e7zRCrXc6v1Xbiww06Dg+inIsm/SxDwqK6u/IWrJG3m1I0v/Q7QIjHPoYp87tDVy29rqFqcrlG2mjde8nkLabz6vtFxTvWnM/jU9qML7Ah6sGykuGm1UpCc449BYPaaDPuNlfQ1TBX1kfOm+2qPn4HQ8l46rhB1ns9qonWRW/nUMhKatx51vgBhrW48o8bgf8oIlWTKlzCwTlugTE6AoPvkD0AvJtU6bOMw9UjYh1hn2gki/NEmVltEq/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA4PR04MB7870.eurprd04.prod.outlook.com (2603:10a6:102:b8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Wed, 29 Oct
 2025 20:28:31 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 20:28:31 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC32XX SOC SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 5/5] ARM: dts: lpc32xx: update #address-cells of arm,pl175 to 2
Date: Wed, 29 Oct 2025 16:28:01 -0400
Message-Id: <20251029202801.3963952-5-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251029202801.3963952-1-Frank.Li@nxp.com>
References: <20251029202801.3963952-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:217::25) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA4PR04MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: 550c1e91-cb70-4294-f833-08de1729b9e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mBFo73VaxB7/FgibVaP3DRKt5NzQk5PAvkU0mXv2sPp6AwDyBnpHws8UJ+Ql?=
 =?us-ascii?Q?5u7blRVm8Q93tbYhSiOTX02DU5UantPmbNAiFSg9aMgx0VpbVfdFe+HAa3uj?=
 =?us-ascii?Q?6GKvvEpYuNKKn+gj4+xfCiDb72F6wbtSFYcUO3fI6QWPOMHODS6BZ/I20FED?=
 =?us-ascii?Q?M+NtzIEeNT24zpW/jD+hL0qaBdKSKhpzS0NO2jRoHYUgati5dZXy4n4GWsHw?=
 =?us-ascii?Q?gBxEUlWykkgbr0aPx0cWQgKX3vcSbOh9RzQyJK0FuLKQg08vYkTrR+FjssY0?=
 =?us-ascii?Q?aBlwEPXgTgORjM+tLnRFbLcjBjgqd3mUKrjTEF8QemnOGcSJVjTZBE2JOQet?=
 =?us-ascii?Q?tMFgHjm1g/DSnYN/k0RAgYoKJH2UfrXTOelLxAh9aAwF3xPxet+b/hsn/aHj?=
 =?us-ascii?Q?FkiN5CpG7sJBJdVU+MZnDzu8CXuH9/YCebkV6xpmade52Pgv5q07CmtBI0Oh?=
 =?us-ascii?Q?5yo8oQwJpX2W/fJ8ntwhhE1e0IAyvpCKASq/yidWJSA/7XzJfBfp5JonP4NX?=
 =?us-ascii?Q?bGeY0VvKC2C0w3P3Gq6WPckxL6mLLe13aML3pJr8TD6o9/sCTh4B7JLADTVO?=
 =?us-ascii?Q?BEkr8d7+N/Yps0FoWQREKCjVKuj5LRg9PmOGZhKZ+bsNxMcxGUg7Uu5Zk+hW?=
 =?us-ascii?Q?12xbRG4J7BnKsfH0xSrlEh29vwF9Q6d3Zi0N6mroOG6UeJeeYRTrKxFBlqVb?=
 =?us-ascii?Q?jIOBjt4Y/2c/0/3kCppfWXxxV9W6CA9Y1J/1EUmMHY53nx1LQhkqUetYCLWy?=
 =?us-ascii?Q?02JvwY8UNbexBQtYejz8eA5KG23VQJ+YrzPrfRUx+Zrimmt02KPpQtwZw9Qm?=
 =?us-ascii?Q?YPv3TWKBgUR7r7Mkq2BMnH5md2MBkxqa7nHIrq4snHu73Uw6VUnQmb3dhbb5?=
 =?us-ascii?Q?5K6TXU4/6SBgCG5MC9bPddXAicZ08yRJpXto1TqAA0dqloIuSYEhnJE89wnJ?=
 =?us-ascii?Q?/AMk7lWiX6MRlge4zmfgkzvj157IvVt1f/9cbgDuJo9SNxmk42bG/JXFHBKN?=
 =?us-ascii?Q?MrSX1qG2I4Rs6WG4zffOrSXmFvi0G97Xz69dLL8XHRChC1ALwhVq2ZniqNN2?=
 =?us-ascii?Q?6u27avox3QNDo/Rqx7TIoAw7/lzLr5ATDKN2s0B4mbphqXtGXZVxu0F8sds8?=
 =?us-ascii?Q?C6yqCTQnw547QlBzQssoBYRMhbWFOpqCQ7G6B0GCxuHtMByN0SUHKFFvdli1?=
 =?us-ascii?Q?M8GgXkLyZC1SIgb+ScFJIeCzHKwRnQ48RgECAy1kKLEN8M8lCX1K8t9/iasY?=
 =?us-ascii?Q?8o5LthIv7YpjQnTsJxBlXGAFRglat5+pki9OhSRlPAklCINPCgIqXQgfw27A?=
 =?us-ascii?Q?sKELCXlyDmWzMIDQ4PCWs9BMACsHf8B5T3Ms+EE+J6NiXtiUykEdYS9jxiNQ?=
 =?us-ascii?Q?QJLk6JyxoAlrhN4EyYQBbgC+vJmgBTMg9oD4xKfqBQ34otL5gHO6suaR+dcY?=
 =?us-ascii?Q?Yc3Rxro3Y7WLPqcUJ9/BNCzmEUmAf6eBASfnHlwnISWW+M2r6HYsiQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?phB8RBxWtR6SvTC8xfePgkL/7NTFrD99So7SCRKgUl6TNHxsnw/0FtpBDVaI?=
 =?us-ascii?Q?y7oAsUsWAsANwvka6u7bmER9h+XvHfxH3M/hRJz2rCKJ3KyKTPTeQB46aO4s?=
 =?us-ascii?Q?980rlFWAIxivDuKxOeLqo6PiB9P80+6s8goFAwl6Fi9yYeueRkYI6/LApdua?=
 =?us-ascii?Q?y6z62u6Kb2sLcMclWAV3yhcil2ndGv0VYXoFccpjlcQVIx66b2LTQQhuJw2I?=
 =?us-ascii?Q?1XE5+StRWj1nRDcseN5H0/dOrpSAD4TuOLcDwbaL16IzNoI/RG5K2daMjTRC?=
 =?us-ascii?Q?BsB/Mw1j6o5tO4lzmtNpivei5Alvbi/ZZsJfn+/OIegUZwLubl9ngFyg+g7m?=
 =?us-ascii?Q?ys7qZ2sT2LRQdkYqAZ0uNDnXOKZABpmxxbkeqUAc8CU6cSivSc4j9kr+vpY8?=
 =?us-ascii?Q?CuNLsaPnEAppPheewlvCdtNk6CrBfokxrUvdvYcP4CwHmknjaNmNHpMRxwIH?=
 =?us-ascii?Q?rvzihWZDysXFX5xmvtu0us/6Ill+wBbgLageWHxKfcbr753LAzOw56EftWGy?=
 =?us-ascii?Q?nOitPJpbA8EVUK0wc68fGcK24bf7jL5Co4iA742gdvhZpUMU89Tt8fHDX4Rq?=
 =?us-ascii?Q?iMxO1YEqlVd97Zgm9qrBVBsqihqB8qxJR+bchD2i1kGeXbpwzkasABHu7V0w?=
 =?us-ascii?Q?To+ne4yZfZQoco8RoDlAoclBiRXewrwAwAe6RpPFCy15c5ovhrH41bbMpoXH?=
 =?us-ascii?Q?0dubl4dYqLJVuwffqvgeVZaUdhFigNZHc9ji/ttIPWJzKRtwASfUwUfOkvsv?=
 =?us-ascii?Q?gQcLbdhKzAJgGTuiy7/ON+yZgndYa4Jk9B/e7KUjbK6w022rLerGcvPzUDsO?=
 =?us-ascii?Q?EJayVWOLgphZmZSD6AzdFZYclXNiz+6I6UXDnGB1xi/CyazUTdViJf9UsqGU?=
 =?us-ascii?Q?VTKBCqxXQPObgoCR8be1y8xXosFHqwE83/t9TIwxed+7m7+KHvgQyhrrcSWH?=
 =?us-ascii?Q?x27DKXDQ056eYRqLOeTPshr1XaFYEqxwAvnlGZJOXAWXTNvhn6PGhSuafiU7?=
 =?us-ascii?Q?qokym2k23cXduLFZY7zXSUbXWrqcMib6RmLvcwCiSPTwTPN0/Kirp8DmH6NA?=
 =?us-ascii?Q?HfeYh2xbe5Fnkrs+Nmqb1B/EL6TqatYcuKJgtGheh2XoQCGfooE00m3qYtks?=
 =?us-ascii?Q?xmQhgsZHA17F1b/J8Hhmj34aswn39UBf5MnQiZwCvYAsKbZH/z/3RE3z9t/C?=
 =?us-ascii?Q?ZBBTpswvl/Jn1Yr/Py/P0VlDRNK+IR51eADTJrFfxwx9kqGi6Kj/F+8WWiOi?=
 =?us-ascii?Q?6RdzoX9LHkwIUEG0kTOgVZ0LfYIdkfxvtr5JZEHfKOnPMDXncbOaxOy7axG8?=
 =?us-ascii?Q?wG3j/HBvixTnZkmcIeVeWl+F3vLuIh0bQmWaJC6NgJQK0nSpGWp4w4cxOUHK?=
 =?us-ascii?Q?v0yLW4pjaThSnTOIxZdv4uvIJW6hCl1pqMj9kT+szGjYD5LGT7On8ecyhOEl?=
 =?us-ascii?Q?iLB+/+w/QzBmmzDkG96xeRwWR0NGNZYOtlJMJ8nyelZTlw43cYG37NKeoBz0?=
 =?us-ascii?Q?baiX8ilraxEylKlMfMHkMl3PeFp/zFTS1QHHOnTZxv0hbjYX/Xn96QuIXNhH?=
 =?us-ascii?Q?v7ZHQ45F/4MqFoR89xw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 550c1e91-cb70-4294-f833-08de1729b9e4
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 20:28:31.8664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5AsedbO0ANVKp/euemDiZtLUB/HzvxPVxEsY6Bbglomsp39taZprdD6/3AQ0s7+oHIrLaf04DZjoQ5QNkfXxQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7870
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_132837_602868_AA29CEDD 
X-CRM114-Status: GOOD (  12.57  )
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

Change #address-cells of arm,pl175 to 2 to fix below CHECK_DTBS warnings:
  arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: memory-controller@31080000 (arm,pl175): #address-cells: 2 was expected
        from schema $id: http://devicetree.org/schemas/memory-controllers/arm,pl172.yaml#

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 77f210a2152dc..0249a1838ee0d 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -155,7 +155,7 @@ emc: memory-controller@31080000 {
 			reg = <0x31080000 0x1000>;
 			clocks = <&clk LPC32XX_CLK_DDRAM>, <&clk LPC32XX_CLK_DDRAM>;
 			clock-names = "mpmcclk", "apb_pclk";
-			#address-cells = <1>;
+			#address-cells = <2>;
 			#size-cells = <1>;
 
 			ranges = <0 0xe0000000 0x01000000>,
-- 
2.34.1


