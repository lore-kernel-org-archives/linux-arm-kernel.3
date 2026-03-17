Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7255FB5EAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 04:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CR1dTvzZlpSp2cklpSVg64MUtSFerzgKi4xA4axBoIo=; b=zS1iiNL9vs3g3YJ69aQsC+/mhp
	LVJ7mAxfxW7Sb+kvJTGZx2knHDL6ypeS/HIQJk/diMljmC5OOepWPdE2lOjaZzk+L87dXoq62emiY
	X2GrZNknW6wYvgu/0hRoGtDn2IxY2jCaSQSc36imlJBA1o46/FIWYpvsgbLNDkQKJUCYgRADZaKXH
	tVN8Be62Gt1w1tNH8l7kxBDDVPZply0DDRjMJNCf0dD/Y/Wp4pd6F9XY09+hrjE9K0WURbsqidz+L
	fp+adl5JhMU06snOQpye+EzMDQnoEmULlWbppiBcO/jt/SXNwRTg1w2fCCcEvHep28xY0DgPF5XZ3
	PVqAo0vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LeE-00000005Md7-2uh4;
	Tue, 17 Mar 2026 04:03:14 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LeB-00000005Mcb-3rWl;
	Tue, 17 Mar 2026 04:03:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cApTWVK/8TxtZBD5viEcYpvLZ4/RMLXRUhZmpoNncA0s2FfVbb/eYAihnKFQQnsMYP76abEsGjIkVEmiP7IMHg/IHoqd53yN3Nvo10mjNBOOv1+h2G61ASYYclT9Z38XWYHL75aQL+ky3SxvWr4EoabKK9jhFjMaaYpUavuPgEmd6GuE5h8Pch2n18TWs62Ut56/9NeyLOwe9F/GF+TvMEFvL4LLk7vf5ClGazK0T8tGjFZKIz7fn2+n5nPr4yi8/uwtnXOp+/hLoAI1zOGUXsUmg3UmyAeujNFv69nzAMedHqpCEZdypwHLJk4/9WhitvAAXUuzHDrc8pBtywpESA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CR1dTvzZlpSp2cklpSVg64MUtSFerzgKi4xA4axBoIo=;
 b=KrR7UldElb9cq1L94/Mo9AeBBFVwMP/BAHXxRptg33TNKld151bw461Xp1Ns9FxzwPp9vhWEtU7J2nM1DO54U6n9SQQzzfDMINHLTUzTSbGCyZ7qNCoeKCHHv/kLSODfh5Li+0SM0Od4XY5d/CO18XBlvfv2o3v+YzYfwgtpgnhQoSid20UtiAkAcNSjAF1ZMOnNonh8XqdojcWv87Nb4D6Vg7HQKEcD0vv5S76+aBsfjrezsOzqZtORw/qGPP0G+DS+b0p2qvU7fXx39M0apamfhwonBTPlAkW34CrdjBGbp0irydxQ1A9oCAYRrmt9pDMiCdm4fQpTbH8vzFX1Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by SEYPR03MB7965.apcprd03.prod.outlook.com (2603:1096:101:177::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 04:03:02 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%4]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 04:03:02 +0000
From: Gray Huang <gray.huang@wesion.com>
To: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	naoki@radxa.com,
	jonas@kwiboo.se,
	chaoyi.chen@rock-chips.com,
	i@chainsx.cn,
	michael.opdenacker@rootcommit.com,
	inindev@gmail.com,
	quentin.schulz@cherry.de,
	andrew@lunn.ch,
	alchark@gmail.com,
	pbrobinson@gmail.com,
	nick@khadas.com,
	Gray Huang <gray.huang@wesion.com>
Subject: [PATCH 0/2] arm64: dts: rockchip: Add initial support for Khadas Edge 2L
Date: Tue, 17 Mar 2026 12:02:46 +0800
Message-Id: <20260317040248.267154-1-gray.huang@wesion.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0024.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:5::6)
 To JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB8617:EE_|SEYPR03MB7965:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d94f519-e537-47cf-97d9-08de83da155b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: HD5+MDqM9P9tRJgfIobtlkDZ5mW/O4lqoZYtxiSo/KRM6knBQXtmTJnDGHYiPl0Wm3ltEDHLwN96OIpEj3TQ3rOGfc54gX8yivIEjjRogJVttlJ4JaGjsZmLf0xd5JllzMln7RXg3kPkoKGtrmycmE2ylW7+CbtEfjO0eK1Y1t23DmnWWdIouBzuk/Q7yEUSRKr9qqF92PXLyOW+lcmw+BiUBLgSYNb/AH22KCoYIDWod5RhZ0tnmAVMzvv7dSO5yCsChoGX31Xx/puCoH9BY4ADOixCgrLmD3Z9Pz5wrNF96oeKrwC0arGnbtVI+UpRNL/6I+XMkx+nbzjuutnUaV9BmmraWenmnYD+g/MF+GyQW/qonHnjOkiuopqkRV1HGWRrktMc5tLGTUS+aD3339IgzpejFgh6fCs36y+sbww9cJ/e5VXuCgGfhw/SDOFOYoEQXufnI4p22z1bHWmtv69f1/Tm7FAj79bcbJKIErGWJud2cYHhwYgRt7jdMU98VL72RiIFu8G34YV2qUjzF+/RikEROivPSMc8n/iRC3ry9drTn9EcklhwFk8bMKnAvi69L5FqvWlqVoEDZ6x2Mf4hTgJ0EEazxftU+y6P3qY9/3yTARkEGt9XPav81h9iuNcE6ac7w+Of1fIApZX8VSoei2VpprWTYePOVTFiXzOznl1Ko2rm5RiQ/I6y3su97EdxUZf706LnJmqlopMat2n233dwCoAZ0HlC++xqTJomj7D6t0boTkexZkYk2/Bbimrb+cm91HBmdrBWwTdhapok6ROa4PLJUH/vFde/Omg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fd+LCcigaaKJqLZiMYR3U6habEhkI6iBV8D8mEYRKeXSeNnoPnAXrdZI8Q1L?=
 =?us-ascii?Q?pz9MEMXR7xVt6JVruWXv7k/K2Sy3vdXGKiEwnCb0g63hQQnjHUxs60c/jFcQ?=
 =?us-ascii?Q?Sbx+Y4uMLzxhO8hwciMKUoNDIIUYlaBV6cvEn5J1uysDNRVmxjDa/Xob/OyC?=
 =?us-ascii?Q?w67qjX7eM1+3++1AkhGWXPFLv5fW/W91u+fXxwbsyklTo2yJnGU77VJ41Ks6?=
 =?us-ascii?Q?cCf94LtezzeEGUvFM1UlI5Yr8uOi6xZt7lj5ZvXP05ExuOaUefDvnYEJilgg?=
 =?us-ascii?Q?SSZOM6Ve4rQci54dGTouA4yMdNaowfMrLI8Od2oHzzOct0udGItXk2u2/oS9?=
 =?us-ascii?Q?SLZRJhhTiU09Hu1WBK55GE/WwDEqrHvi5Om5lCKLC3T/ZXxeQLORhCSinJXv?=
 =?us-ascii?Q?KfdBZC1tgayYUQsFIDnjjemufwvvFekgatQJ3CNXlsbozZcOekJg7RNglYIr?=
 =?us-ascii?Q?LFgp0rcoOsglu79IjML0sB98vCjbfKDoeY06jyyfCgGM9y85uPdFVbNZcw/q?=
 =?us-ascii?Q?l2ar5E2Ab8yft50IoiyV//pQ806Fx9vPehxaquX/EeKtRf6qgM2FpTZSuks4?=
 =?us-ascii?Q?hRN0rRTPyONu5JP9gLaG7ZFAepcBMqUBUNWB02ZFrIFsXM9PeMlma6GH51o+?=
 =?us-ascii?Q?GpoMYkW0qigquJFrWf72DxPMMEcjMUbgO3bL4M8iuw0igd1C/RnNPbfPzHlp?=
 =?us-ascii?Q?KplMnXp6R9A8+pIFtVyehqH8NJ6AbjUaDOHVV74cFut//eSUd6UTUSgF+nQa?=
 =?us-ascii?Q?GknkvWjuCxG9O66+3Jb2jXiWp04kDM7e/28+SQMqr8l0Dgwu2KnCehaiiFLF?=
 =?us-ascii?Q?4HSltpH4pYU0WtGLhWKjfx/lZhrsS0Xxyty3z4ShvsLTdFqeUUE542U4mGfG?=
 =?us-ascii?Q?/7hgxGn2e1ckBNMdm7jhb8SQjfh5g+XFcGG1AiDHr+H8mKPkrJZpPvaPVhkd?=
 =?us-ascii?Q?Za74ReS58EDgZwl0Mff5JX37dLFqgMwWXxNnOrb4vlktfIAncRAifGdMHqi7?=
 =?us-ascii?Q?SoUtOYNzz8vbpb8qIl5g/OCT9nt7n4OB6bpJZ4hRu8HeHVZcgA4lUWj9q2XU?=
 =?us-ascii?Q?/hyNcRvTDRvOruH0twwDzv+USSssisK5yxsUm9CrbdH/basqIA3sJG1V6Frj?=
 =?us-ascii?Q?pVsQyWWFfUK6rTCUUGrMcIKymqs6WIty6Znu5XuJkEXMfxUxfPOTVnaMSu0D?=
 =?us-ascii?Q?4V2EM+pWCb+UIhZScS2KibMQVSgsISaz9rBkSR1B+u1RzTHoTTQI7NvE3v3f?=
 =?us-ascii?Q?fowBWMq9AelhejYDbvKtX/1hTEQYee/sdRRxTVM3OFmcep2IdqukZomBNqHV?=
 =?us-ascii?Q?K/+AQJvnqHnXyaUhzM+EeZBs9gOq9pkMjyPHEBNEN7grNDRfN1wfEClaiva9?=
 =?us-ascii?Q?qSjWEZrFVOj9ggEgTIxxexYQL5rsY//BCuhgxvF1NTu1xUMv0VulkQTyurcW?=
 =?us-ascii?Q?dnVa+X1VUelysb2hr8rE5aYrDKYmxcfcqdDcMkOlrUrISNiZtPXOCF8E7/5f?=
 =?us-ascii?Q?bWF2KNDshqVs+wcsOjqX7gQT1ou7w26buScx/+Z/j8Z9omixNJxbM/teY5+Z?=
 =?us-ascii?Q?UNMa/xkPbAab4qBcqArJRy7ePnKuBNRactgM/D+rBBFWSh7u+z8NhGiml09H?=
 =?us-ascii?Q?vTN8zGb5Bgk75tW0G5WjW8WCjpD9wPUFGa0IDIEj84X8P+LwU++DW7c4Mxod?=
 =?us-ascii?Q?keErkggTalW7odXLgnHhsMVg4Xqi7MX4Tmwd739YIpoWLNRGfsmcoIPq6723?=
 =?us-ascii?Q?vjvSB7e8bg=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d94f519-e537-47cf-97d9-08de83da155b
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 04:03:02.0344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLeDEOov7GuUJCGXgasiZSDz8tqcWr7RNdePR+jVL7/LGKskMk5xPMpqw8Gc9wn2GkPjvFKzQ/BLAzfsL36rTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7965
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_210311_982389_8578960B 
X-CRM114-Status: GOOD (  10.03  )
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

This patch series adds initial basic support for the Khadas Edge 2L board,
which is based on the Rockchip RK3576 SoC.

To keep the initial review process simple and easy, this series only 
enables the bare minimum peripherals required to boot the board to a shell:
- UART (for serial console)
- eMMC (for root filesystem)

Support for other rich peripherals (such as PCIe Wi-Fi, USB, HDMI, 
microSD, etc.) will be submitted in subsequent patch series once this 
base is merged.

Gray Huang (2):
  dt-bindings: arm: rockchip: Add Khadas Edge 2L board
  arm64: dts: rockchip: Add Khadas Edge 2L board

 .../devicetree/bindings/arm/rockchip.yaml     |  5 +++
 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 34 +++++++++++++++++++
 3 files changed, 40 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts

-- 
2.34.1


