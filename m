Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F974C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 07:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjYoJhJPf/3d31N4Q80xGlfVt3PRlMjLvv+pjL70NvE=; b=FlbVA7kWCWiJrK0E0xSuFQ+SO5
	8h802YFp9VFA65GBVn7yintBe2RRFKYR2hUrvPMUwkDOldKJn4sBVdKf1XYeRyNxyCP/lmWLyFReA
	XzOzROcm0D7yWfVTPkR6sEVpOOHfuaOrlD+R3OSN/MphdIxHCW7UYjdE4ONONaVLN/uzc3KO71jAx
	4Pif+1/uYeGfI58I+XFxs+n6BLeRafah4Ac4TdEDdEx+P6olQVifVI2q5gkW00WOcqaTAaoImH8ce
	bsOpifeyhGr4rjgF1GTPd9d85vFrJ8dVyRluzTs7JriEiQLM4qJ6dyoZdm8lnlrOZEGktgYpXY+Zu
	N2YmHcZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8zN-00000007AQ0-0FKi;
	Tue, 21 Jan 2025 07:47:57 +0000
Received: from mail-am0eur02on20623.outbound.protection.outlook.com ([2a01:111:f403:2606::623] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8tg-000000079hL-11Uy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 07:42:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1/nMMd01ZwHq+TLj0OyZVWeHbmhHc/unOEYbpFZxx6wcVXp8iqnwI/VC2ft8hYjD970vpdk64oCVOgPqBa4mDLRWChPtZolNMyq0Lz7tYF2aoi8qSzyXWSnRmqzjg2qbVVfBD1N6Z44chlK0GAYB+bbsyAeyw6ShdN/IUodSRZcEM40q5qUuMZZMBBPSiJ8ZtQmzT6qYqirt/KCE90OWZmvfwwXf7WJ7Ty799Pev7AN6/PW+YmS9oebpA0lxrHlfXftFYgFIh+anKU5yrgEltgKK8zuFWHKZyVbYaCeOGbqXObrdBTkUPgigYd9fspsGOE8AK2fzE8QyR1mv5Q8Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjYoJhJPf/3d31N4Q80xGlfVt3PRlMjLvv+pjL70NvE=;
 b=WDCNYpSuRoPE09MfgkAXxjgJAcexeEoJgC130JgZXvt6A5noYfcHduWqM9x1DlRrD7JTAirpQepl3tuLkMt9iv2/EycgNIO/U3P8Uyv9o9eHYjro3FhLY8mKi7vOjXw8n4SNrc8J4C4K5B3ftDhpIXileAJBkzPJm8Tu7tQBfr+oMexPh2Bf+9mgZMfTdRgOs2qefnR7bwFaHyLTDan7p+4ax2DTDDMygjTm6r//goOAJPZz/ikJrb+mTIh+43IhSfTSy4IRJ610kv7J2B6guX5jy0nskBEgK2uh5B2zv9CladsVl/cgWw39pOYnyXBUpQVKDwv0ZxOsshhq6uabWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjYoJhJPf/3d31N4Q80xGlfVt3PRlMjLvv+pjL70NvE=;
 b=Z/4+vO6OXsQznHVeP4cImVt1shcYJ1FmUHToosa2emAw3f8RVWmueAFy6PhMyN0EzZP6U3+LVnLRYBYGdvDHxa725txZYKaKY57syeIAAsSvDIWZPy35XNWZmYqp7qnpRHbbZncTCCaLfff3UFWWF/TjbK6BffarYJjQmbHV7HwvPXatw3nAoEBrrDN4XHuP8rVFd93Hr8Lf5jtjBpDkgvaK72REAHDFbcKVseL0NtOBMSQB5V4N/6g1/VnvRL0fggrI++wAvE8RCdyya4SM6ladwuDd9xHQrBqpCtpUelk7rxzSI6/wArJvVdOP2DNfAlzOY+8rWvMMrypxrfk5cQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Tue, 21 Jan
 2025 07:42:01 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%6]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 07:42:01 +0000
From: Joy Zou <joy.zou@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	catalin.marinas@arm.com,
	will@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: joao.goncalves@toradex.com,
	marex@denx.de,
	hvilleneuve@dimonoff.com,
	hiago.franco@toradex.com,
	peng.fan@nxp.com,
	frieder.schrempf@kontron.de,
	alexander.stein@ew.tq-group.com,
	m.othacehe@gmail.com,
	mwalle@kernel.org,
	Max.Merchel@ew.tq-group.com,
	quic_bjorande@quicinc.com,
	geert+renesas@glider.be,
	dmitry.baryshkov@linaro.org,
	neil.armstrong@linaro.org,
	arnd@arndb.de,
	nfraprado@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	ping.bai@nxp.com,
	ye.li@nxp.com,
	aisheng.dong@nxp.com,
	frank.li@nxp.com,
	carlos.song@nxp.com
Subject: [PATCH v4 4/5] arm64: defconfig: enable i.MX91 pinctrl
Date: Tue, 21 Jan 2025 15:40:16 +0800
Message-Id: <20250121074017.2819285-5-joy.zou@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250121074017.2819285-1-joy.zou@nxp.com>
References: <20250121074017.2819285-1-joy.zou@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|PAXPR04MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: a817a841-62ca-4324-df60-08dd39ef17b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/Xcf+46E0JyTgM6FJJr8D/vdPmSIXw0+74X5ZD2u4q5dhjwyHeeDW//cv+mX?=
 =?us-ascii?Q?rIOo3URwIXWTH6eyMFI9J3umHIQQlDnpcwqg8HFX3s4fUTFE2VkzAe+aM44v?=
 =?us-ascii?Q?uJ3JSop2yECpzRY9STWTc4QW1WM8Q+SSvTbtGumHd05VxcbxPbdPIm4eIDTs?=
 =?us-ascii?Q?XjVEQ0QNf72SjG9YilZx2Fr52iEeiEQgSWUuI0FhPrBp0SjpCE2BDBsi+SCH?=
 =?us-ascii?Q?ioCvT5ZiYsnR2GMLigLbr+6nEjL8BaAj92Uje/RsW6e71AfvpMI6g9dhMSK/?=
 =?us-ascii?Q?y/dwouXEk0qGaovsG6Pb2YT2GHV09Ils8wsKPZvMbOOCq35CJKfYtEPE7Q4w?=
 =?us-ascii?Q?HpRvEwWmL6WrIKApvzw7pgf0zcZhqyj/YJj3ObtMpmqptnXOjXvXNINKpt10?=
 =?us-ascii?Q?8Is/VXdv/EZHBiQsufEJo5s8QAgsccdIcR41QKdE2CWzRvHXHMnojOOPc6Q6?=
 =?us-ascii?Q?bzbdJvNh7jByABufmD5pPM7KDFxeV2Zh5bcGPdTKnnxPZJfsUrIuQ2bHZSzt?=
 =?us-ascii?Q?4+0P5jAzc8YcsHxUJvYqtgsP6MmwLxFFS8rBXjScxzDYcYpNR4Gl1tEgaDv0?=
 =?us-ascii?Q?/6MHUOdZbjTvJznIH03nZH61SKOX2vI+GFODjJ3Ix+DueyOtuSj1yyd7bwSK?=
 =?us-ascii?Q?cYTWM3u2sp8qlOmKaTO2W1AM1r1lLZZOHiv3/kh8P3l5IoQj3pUcuu7IclYY?=
 =?us-ascii?Q?4FgBNOLdAGkZeE+GzpgBATsjTA/RhDOaRErgI07ebDnyBUqdC8scsa+fLzFP?=
 =?us-ascii?Q?tNWwa60u37MCCRr9OYdMs89Q84tsemd3qH5iiWlyfbNbcqQcUrODz7DOhSL7?=
 =?us-ascii?Q?RFG61EV/nuQzbdDs8AFjRk/RZUtlBDTpUZxJ+B1a0+PPADieSISlzt++3khc?=
 =?us-ascii?Q?e55eCiHyjvv9cZ5+luBvQ8kVX+7gHbekcoD1s/dXuL2Fgv73Bh7kVTCn0LSB?=
 =?us-ascii?Q?fxaqxHlWEh7IoN0EEmD51R/2gwsG9ekog3b1FLyDzAL1y1W34y0ZmMuHo3Jw?=
 =?us-ascii?Q?aCfCOrL1JqNrQB7Kmp/L41G/MdZxNjJcIhnuZRzFCNXFzALoiA7K3m+OpQB0?=
 =?us-ascii?Q?49XaFMYWHtBINm/+WNGeznvvpCqjoSgIURq3Nvve07EMrhxbCUonH5a0/Vc9?=
 =?us-ascii?Q?YxBeXUO7uNrKp9GecYYBAxxuRYImH05APWMKYza7OjKQoLl3nblA7xfsfegm?=
 =?us-ascii?Q?9O75U32xOj42XIa+f2iO/RSg5IjZj8RlIgLKu8B+MAJ5rwXxLxTY0tSQlDGi?=
 =?us-ascii?Q?4GiTd5MvxbtHPMp1tS6hXT2C4gGsXnb1jil3HiXiGnyJqfbKDLNINdrwcQbF?=
 =?us-ascii?Q?Abp5aEBLpCBML+uHAl+psELuVZ+4U4RZrrJFwcTIybsEyApgivO93mOftV2g?=
 =?us-ascii?Q?HUOMQA6cBZo5Wbd273SeFFmP2zvqeUelu8gNCVb2XqV2rcX2aDw2xM6MqSAv?=
 =?us-ascii?Q?w4vbkGwDmh+HoAMOowfXjlCMiBJcXox9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SdU765XPSB2FZmleknEvGtj3VaPaZmcsFpAUidnU38uefWj3m85RuyI0uj9w?=
 =?us-ascii?Q?7SUtEMN71hhyFsrxfAsmw86eQI/zK18thrWDFCuoXPx4T2rnPWvCSW2C3xur?=
 =?us-ascii?Q?OhV1NbO+vZpbY8Hg1Fe9jKNOxhY4auzJDciH49F2bbjyRh2TeaRAZ127DmHx?=
 =?us-ascii?Q?2Z3WWowVT1V0AHtSLXzGbF2LZjm5qnn2DOroxUGLwN5HRkoRE4evKBRq6EFa?=
 =?us-ascii?Q?GTJDiUjgqCL0bcX9CjhjtEAw7+7KVYD5QcuwsuL5kk39Pvt1qDsxVRbRdyGU?=
 =?us-ascii?Q?2Ic8tK7yeZeswTAvIuhnJ3Yh2bHHGGxPx8AV2/KKdofNG2mb2mQU+TLn/ewD?=
 =?us-ascii?Q?RbIzy5t5grN/nzUvKza8AHMUXMQYx1Q15uZ+iytvUv3hjbpycRQ/vBN0QTMQ?=
 =?us-ascii?Q?xIWxF0PM6d07OvAPn4y6jPJZqt915r5a7Rgco8+bOwhbCd9z0QdJU1C8c+1P?=
 =?us-ascii?Q?Ocw2H2U8YRlQXnSis/iTLygaS7Bh5KsRfOpH2OY7bQUi4x4LLWMOBn848moe?=
 =?us-ascii?Q?FN9GD4/zYg7VH6vGRQh8jTEU6JHpgTP3Pbd/QAjF9M+zLVGPp6hTnji7Gymj?=
 =?us-ascii?Q?pM1VjnldJLO9YJezCtAsq64Tf9tF3uagEaSwDl4plUoeC0TPCGTm+xc6gGha?=
 =?us-ascii?Q?2vhbnxZMvvp7MSv0yTjOZVPQDDfV6W3ZfWu39sLa32iG7tUGhxKxBE8s0bqK?=
 =?us-ascii?Q?lyQYxju5gD2RT+tII/+8RDB1Hlg1SmlNQVYll4i6mAtMfWmd4NjRg/jyHcMM?=
 =?us-ascii?Q?KkksX6yaaqnfQOMDxq2bjqrIiL/29pIStQ0XO+zBPFxP5YjvFpKAhzaMvR9G?=
 =?us-ascii?Q?vhBGDOQWSxL4RG6v7QbB59eKz1WQg9Mw9yHm4uuhRudKvOkWUDvEZWZ7v5L7?=
 =?us-ascii?Q?xtO0sdVQUMw1eMlZxcU2Wu7acJoncad4PZ8etTpfwIL0S2s8LMz/A0zNG9BH?=
 =?us-ascii?Q?m9id5tKA+AHXRcHyQTjWgO6yr7Gbg3zwkLYEhGo0tj7Oi/lNhr1gnoXzpFuG?=
 =?us-ascii?Q?TFXvIuK3gFEfVAU5ns6t8m68WPAWgK5vY3SC7lPL/aJS+0oT6LwGokbTDwhg?=
 =?us-ascii?Q?8Fidi1ege5VojRcvepyGOGZtqtDIuQxynkMHRx7IgHJs4AICrSCep6Bz6E9Q?=
 =?us-ascii?Q?1N4jlIgC+T8VDcbL/24lO6zXr/O/WHSxfthv1uDl34fUhDnjIJF2+KEBu+7f?=
 =?us-ascii?Q?YRGSpAJKJPnWTt+1Trxd7B/8ugT0Cki11vtlo1alwPwnMw1t4BjsBIC0rwyV?=
 =?us-ascii?Q?KUXWE4BhUFJwgXJDkwoQ5hZpdHh4YZD2BeoooCuNHFp6WQi2ThdM2A/2nYX3?=
 =?us-ascii?Q?YHl8ARUpfmrE1sim2STC7020e/yWRMeM7fdZ0rGWT2soZplH2NlCdLPkMBbG?=
 =?us-ascii?Q?SwkF7xyv/fBS+tCs/53e0bMjYriO1bmLujFi/C9YiRQv1RN36wIexoZtFWZ6?=
 =?us-ascii?Q?bjiWYqj58G2XdXfIFRQOUylp/dcxHt6FpDx0W6M7azWWTZqam6YfQe84vdC2?=
 =?us-ascii?Q?XeWCcRPsDlXWawhnqllATM/hwYi9VohZ+liLQhyzQK5qzPH6vjAjBbkEKBDs?=
 =?us-ascii?Q?aRPaGR9imx9h3aI4Gt1RfmcXI9cGS30AetUXuE18?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a817a841-62ca-4324-df60-08dd39ef17b3
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 07:42:01.7286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SjMprBcMycFztsQjh91E28RsdrBpivRGZYNFwYxAyz+pNCej37PxR11v0eaUiI2W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8459
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_234204_287021_7274E48D 
X-CRM114-Status: UNSURE (   9.33  )
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

From: Pengfei Li <pengfei.li_1@nxp.com>

Enable i.MX91 pinctrl driver for booting the system

Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 246a13412bf0..b16c924fd8aa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -598,6 +598,7 @@ CONFIG_PINCTRL_IMX8QM=y
 CONFIG_PINCTRL_IMX8QXP=y
 CONFIG_PINCTRL_IMX8DXL=y
 CONFIG_PINCTRL_IMX8ULP=y
+CONFIG_PINCTRL_IMX91=y
 CONFIG_PINCTRL_IMX93=y
 CONFIG_PINCTRL_MSM=y
 CONFIG_PINCTRL_IPQ5018=y
-- 
2.37.1


