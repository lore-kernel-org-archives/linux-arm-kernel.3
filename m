Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC40FCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 09:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/yurN8Two+b3OmyTDliK78qn2Mbo11CjUNY29Tr9b8=; b=YKFAj9Cf4upi0lnNNvw1iAJpnd
	sFRzEp+Cb0uwS1pbpEADvhAAMG3sr9pa4KWLrEDsCh/h1JnFBk9d2vwiS62lc+xffcSWC9qupcV0M
	Gf6FqZtIBh4/VurleYjGrwEemtgKutF0L6RF3CEFkjiwclLwNgm3rBuqoY53cUVlg4MabyCVYTD1h
	ReJVipY18qivxCA8HpSS3+Iirrbgn/3LQlXqBjNOJbrzW+GwNG3OBThmQsmevsopcQWMkB+cq9/1J
	WzOrcU9UrrhMsPexjyL1x5pfzgnS/YLfrDyvYknJJuIJr090ZcAHepjITfJ9eqdlAjjjvLN2JM92z
	SFhkS37g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfZf-0000000Fanl-2g6m;
	Tue, 28 Oct 2025 09:01:03 +0000
Received: from mail-northeuropeazon11021089.outbound.protection.outlook.com ([52.101.65.89] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfZQ-0000000FafW-0nCg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 09:00:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zt7DVzG1dVagrxauPk36rU6nenuxVeCQqxmTTvHteL6mY5xmKuGBUTHjXjwFewtECWeFq6iFLB1thSY6l48JlvWewP9sEwsmQunW/nJ2mS217/c1IXejVXMXzm24KouFQlKydz80xt9Pz0VzdVuk4MLgwaylacq4izKLqdCgdZV6Jpn5c0yixxW/oTKzxOn9qL/34xbdoiBiNnf3xBs8NNcrpFAoO2Kj3IvH1qucY3Hb+i1b9nWSetZQBmhQecx4yJcpiluBWwAl5BsH28f7Ig7D0FfHui6Eej/uZvKq1Rg1fphGB1ptcYJwLx2vAvLgExbnnl4IFvR66aUXjq6DAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/yurN8Two+b3OmyTDliK78qn2Mbo11CjUNY29Tr9b8=;
 b=X0dT0W/mY0s95HYdfVauTTEwMpkmtrbkNYfpfFZwnNFmF8VKOzWZ2RldCw6tZ7+vedqalQxK1JohDMCbtX/3CZD+bWUYW/KLr0xwLq0PM4gXWOVj1Lt6FcghGXWlnWKsIWr6FXVNYKHgRfa4CuxtL7YEEp2p9Nb6USJ7+eCZ3wcI1jEfK06KQ0iFDmIoBDcLDrccLAACxyuEg1+dWrkp49nFIlduu2ckdqalydm8hoI5BrOBoL51W6rtOdv57MhibnLmgMJqCkxEe0LI6AO1if3EWh/F2ev9fnCJpTB729DjZPr1qjT6o3NToH+LvsyEYLaBRca9z73MbN+hJ994CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/yurN8Two+b3OmyTDliK78qn2Mbo11CjUNY29Tr9b8=;
 b=qAPP5hzBMAisVQfBPIzqHDtG+HF/Sa8jAjIJ/fpKCSRxymLr2MF0L5DmRp9BxIURfvPa+jpzS7uySqnoqSBcqMz7+ziB3usA/D5Igs1RpISyFh0PajNtD9Z09EJE9ZjSLdN8lehYAx/DPmXYDo+Tl+xwGfRx9oUL9at295urb6qST0jQZTn+MwZoAAe9dx6a/+jnH+3JyX5WVvOUA28taFccSFgF4ipp7KhZ/0qdLfc148AAl2g6kiyLT08xIhRUO7k7gVoUDL34gEaWGKptmdC9R4hXwIkan1c/WWNNzBHwjQR1+JS6dLA5mbSj7qknYzHOJyNEu2htNnb58hwpjw==
Received: from DB8P191CA0029.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::39)
 by DU0P195MB1724.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:3b8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 09:00:41 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::54) by DB8P191CA0029.outlook.office365.com
 (2603:10a6:10:130::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Tue,
 28 Oct 2025 09:00:41 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Tue, 28 Oct 2025 09:00:41 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 28 Oct
 2025 10:00:38 +0100
From: Jan Remmet <j.remmet@phytec.de>
Date: Tue, 28 Oct 2025 09:58:12 +0100
Subject: [PATCH v3 5/6] arm64: dts:
 imx8mm-phyboard-polis-peb-av-10-ph128800t006
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251028-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v3-5-9b98f29a6bb9@phytec.de>
References: <20251028-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v3-0-9b98f29a6bb9@phytec.de>
In-Reply-To: <20251028-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v3-0-9b98f29a6bb9@phytec.de>
To: Teresa Remmet <t.remmet@phytec.de>, Janine Hagemann
	<j.hagemann@phytec.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.39.81]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EF:EE_|DU0P195MB1724:EE_
X-MS-Office365-Filtering-Correlation-Id: fbd45b0e-579c-4330-3f6e-08de16007903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3gxUXZWTmVQK1FLcDNWSWJYSitzMFdLZy9IeUdPaVFMMjJhTSsyd1NWK3pp?=
 =?utf-8?B?QStSeWpSanUveFpBWEs4YzNtOFpyNlZPVForcmxrWmoxK2ZETFk2M3JrRldi?=
 =?utf-8?B?SXVsNU5CZFdXMzhuazBsY3Rnb3UycEhsNmdmZzNsOFhQUkFWMTM3cGU4R1R3?=
 =?utf-8?B?TEJ6T1doZWlTQkpiWGtSY2dEaldLQ29FVUdLWkNNMERzcnFvbTFKaFBWNmRO?=
 =?utf-8?B?T0lBbU9Td2ZTc29nMkp0ODFEWGNaODB1ZW1PR25iVjVxd0FJdUt1SzRHVm1F?=
 =?utf-8?B?RFJyRzhra2hqYkJINGR4QUl3WHlEd3M5bGkrbDBReFBvYXJWeUdWSlMzOC9q?=
 =?utf-8?B?QkVZa1A5Y1B4YWxENFVlTDZHcHlZckNjSlh0Y2JUeWI2elBiYUljTVZKNldN?=
 =?utf-8?B?OTdvOGFvaXYxTWt4Tlh6TWduRkxvWFV2cUVpMFNuZ1ROWDFtc3dhSEdrcU1k?=
 =?utf-8?B?SXZiSEhCZVhzMnZrUS8zQWNleDZvTXdmQ0dReGxnajNveWtLN09GOEcyY2pk?=
 =?utf-8?B?T3RLWEJyUnYvK29QUjBqa3FhMi9nT3loYVV1U1FsRkx6WENUREhtWC92Sk42?=
 =?utf-8?B?LytzVTgxN1FSOTVKV2FVZmdCTW5WQmJDNS9Zb0tyeHl1QVVuaG9GWmxpd3ZP?=
 =?utf-8?B?WlAzRDZlV3FZRUExWEdQdHhMNkNWSEtBRWZwRU1lUHJRMWhBQzhQaGpvZEdw?=
 =?utf-8?B?dDRSbzBkWVdCYml4aEQ4U0I2UlNWU0xOazF0VXY1bWpwY0V1cU1oUmxhM1hV?=
 =?utf-8?B?dXVQamJLUzBoV0FOZ2xNbkNOS3Uzc2ZBTmo2VGF3cFNvYlJRaHJuTXNMUTho?=
 =?utf-8?B?ZmNqc1ZJTW5QeUl4WWNGOVJTL09vYSsxa1ZaamxYME5oWXc3aG90SEZMVU1y?=
 =?utf-8?B?ZzF4cW54RWhIeEVuTHhXUVIrSE5MRnA4MGJZQnBmSk5iN2ZPK0EvTDFYemtJ?=
 =?utf-8?B?cXA5cXVaYmdDMUFoTm5ZK1pPdDN5SGhQdlRGYW5TNGEyOGZNa2xqZ0t0eVJE?=
 =?utf-8?B?WEZaV1A5c3NZUjBHKzdxRjNXNTBxV0xHNDBBYit2cmtCcHJZeEhKOVNKUVU0?=
 =?utf-8?B?WVRMUytzaStILytvRGNYMlJDTE9Vb3JYdTAvUTlEKzFqb2p0WWwza05sNEx1?=
 =?utf-8?B?ZzArYndmNkhDeWptRWVaN1hoZ0NmblpYV3NDZ3VWaU1RVnBIOERLdmhCNEth?=
 =?utf-8?B?a3NhZ1NZNXA1azRtTHR5T2NJdy9WcUN5Y2xOaTNZOGh2LzV5Z2xNaGU1QzVw?=
 =?utf-8?B?aSsreEFrQ1MyZ0pMMHl4QzFHNHJEck5HMTBlcjlMWE9Rd2JOQytrVFp3Zm94?=
 =?utf-8?B?aXpTbWIvZGlaUVFDNkNySFZ5V0FLVDhCQ1ZHVFVweEw0UW5yOTMwUGtEZ0VN?=
 =?utf-8?B?KzRySWQ2dThqSnQrY25YRXNJSHY3QzZVMWR5b0hkaE9YSWVTZnFkZ0k3TVVi?=
 =?utf-8?B?ZVp1WWVkTmo5d2ZTYlp0TzErYThFdjd6RWNzeHRjcEJzVmVFN1ZBNXNiNUQ3?=
 =?utf-8?B?bkFJVUs3QkdpOTU3S2hLUy82d3lBd2ZZT3U5OEhtWVN3b2pYZENyZHVPRW41?=
 =?utf-8?B?b0dOVjFyMkkzSklzQ2pLM2c5bTRoWWlSbGxVc1BiZDcrZm1sRk1GekdYSnFL?=
 =?utf-8?B?NnVFaWhaaXJrcVd1RzFEYTQ0eXVmNDU4M3N3YzBYb0p4WFdtUWFsTTQxemIz?=
 =?utf-8?B?S0RsU2JvdmdJdmFYVkpuVW1VM0JGRFhvRGtURUJjdjhZM3Jsb2QyNXdTNXFG?=
 =?utf-8?B?dDQ1ZlMwL2xDK2ZLbm00U2t2bk85WkRKYnNWRlQrNzJSQVllUEVPdXFNdy8v?=
 =?utf-8?B?c0xFdXF3c1RvOHRFTDFZdWdTOGtWVGJ6TUYvN0ZKT2J5TlFxWmZpVlBIZWFz?=
 =?utf-8?B?MFcxOFFjU0VHQ2pCSnpsN3dxSTVzQjZjWHB3V2dsVXRINlVLeEVBMHYwblk4?=
 =?utf-8?B?MXBWZnB6ZmRnZ2hQeGkvL3VRd010djBqQ1RQdVdCaGtNRU9NRFdRaFZzQXJ6?=
 =?utf-8?B?a0dRUkRsb094bk8wc2hBWjJvUVhHdHpUdlo0TjV6K0NqazR1c00yeVQ0NGRl?=
 =?utf-8?B?Zk5lM21BMVVnRDJEUlFtM1QwVFdZdmxSb3FIbkVLWGU0RXdiR2RweExsRHhv?=
 =?utf-8?Q?QbwI=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 09:00:41.8534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd45b0e-579c-4330-3f6e-08de16007903
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB1724
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_020048_236253_E0241C5C 
X-CRM114-Status: GOOD (  10.97  )
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

Add support for powertip,ph128800t006-zhc01 connected via peb-av-10

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |  3 ++
 ...x8mm-phyboard-polis-peb-av-10-ph128800t006.dtso | 44 ++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a577783999df4156523a2f1424e16e9a707e2917..7bcd10ce4defb5c6f539fe89d5559f3061cbe837 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -138,6 +138,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-rdk.dtb
 imx8mm-phyboard-polis-peb-av-10-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phyboard-polis-peb-av-10.dtbo
 imx8mm-phyboard-polis-peb-av-10-etml1010g3dra-dtbs += imx8mm-phyboard-polis-rdk.dtb \
 	imx8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtbo
+imx8mm-phyboard-polis-peb-av-10-ph128800t006-dtbs += imx8mm-phyboard-polis-rdk.dtb \
+	imx8mm-phyboard-polis-peb-av-10-ph128800t006.dtbo
 imx8mm-phyboard-polis-peb-eval-01-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phyboard-polis-peb-eval-01.dtbo
 imx8mm-phycore-no-eth-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phycore-no-eth.dtbo
 imx8mm-phycore-no-spiflash-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phycore-no-spiflash.dtbo
@@ -145,6 +147,7 @@ imx8mm-phycore-rpmsg-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phycore-rpmsg.
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-peb-av-10.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-peb-av-10-ph128800t006.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-peb-eval-01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phycore-no-eth.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phycore-no-spiflash.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10-ph128800t006.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10-ph128800t006.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..fd819bd563b8f609101c57974c682eb56c12b144
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10-ph128800t006.dtso
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx8mm-phyboard-polis-peb-av-10.dtsi"
+
+&backlight {
+	brightness-levels = <0 4 8 16 32 64 128 255>;
+	default-brightness-level = <6>;
+	enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+	pwms = <&pwm4 0 50000 0>;
+	status = "okay";
+};
+
+&bridge_out {
+	ti,lvds-vod-swing-clock-microvolt = <200000 600000>;
+	ti,lvds-vod-swing-data-microvolt = <200000 600000>;
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&mipi_dsi {
+	status = "okay";
+};
+
+&panel {
+	compatible = "powertip,ph128800t006-zhc01";
+	status = "okay";
+};
+
+&pwm4 {
+	status = "okay";
+};
+
+&sn65dsi83 {
+	status = "okay";
+};

-- 
2.43.0


