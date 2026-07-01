Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB37C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 10:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPP2YiVnFvSWYga9LGVY3LFNrvogg4oBowTBxoJQuYo=; b=NM74zx9uOtUWM81qxpyoYvEIri
	T3a4L/VG14MYl1hd6QnDfQI4P0CQk4XjfibobFZ+O9Nbs7zqK7lzoVr0WOBY3jXs+Cm5gPCZ6HYpE
	oh5pJosnSz6sEOCXyBvFkwGt9rN1rejfca6U0V58q6JbZmKOJpia2XrFafro+KsFE/cS4pE1suUOc
	X6SDfahdOIOd/CBn1k87JXSTPQ2DyKUHU62327a+ZjJpkcnO5O2K2m/BkEt5QylRoatCEOW7ZmVY0
	uVmF7Ds1MyYRNzf2XxeP+bwtdkHGLad0ht7g8jhiLr2RQsM2QizLSGYi1Os36E2mPIjUBXFLS9nAX
	UcuHma2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesWx-00000001M8x-2Ezm;
	Wed, 01 Jul 2026 10:50:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesWw-00000001M8c-3d4W
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 10:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sPP2YiVnFvSWYga9LGVY3LFNrvogg4oBowTBxoJQuYo=; b=C3H8KLKaQxg3KMdjaibhz+4nWL
	IaLicw6I3TbeAhKdh8bBDthPDAND/fBtK0UCS/mFHo211bwxGJI6jXB2ULuRbiz+t6awEMP2luwxw
	TmPa8VVLMuVn53ssBDowfYa/LWIWlubpgEf845ebuaGbZE6E4QyWAHLJjAexw9EdB3xqgUbh33QQk
	w+os5TdpARMAlb7+2ONO2x/WiNERH8S7x7ktwMad6/nnbIh7q6M4ogC5RDSh5w0Uxt1JuBLt5WSIx
	OpFwsqghYHW5PyWsj8vpTJLEvKW7mMoWbXZB+wPfbz8VS5xihHFO44exw7b8+2ZOB7Ivl0YgqirjE
	XhZR+p+Q==;
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wesWt-00000002dxQ-3mwp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 10:50:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhQZWbA9sAFWJaDc/f7UAJjqxvKaghDgsOdAYuQyGZzVin/XZASoIPRkX5TNiQOpdEZRqUQUNgHoabYLqT3Zd9mCJvkfz5Db8LPoV5VxgpBNAEf0q5eErBQVjspOFrICN4hlP6YyvpxluxKPuKLHK7fW3OlpSjg/3IkDaoD8OL5FxW6IvE07ROAW53LY7iXmiIdBMwBL9PjvuTkowpqRpUe/T5oePSKI+J1fO+siV9+0CbIEz67E4MN3PT8WCQWOxZYBllgARFOF9Ixl+Jp6FEBVlB4A5austzDRqBIMhlPYwQOABpvPcATVbRCrWAnMnWnBswdUU3MiYj7QQU78eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPP2YiVnFvSWYga9LGVY3LFNrvogg4oBowTBxoJQuYo=;
 b=qcx6yqapFWBCERgNWiFfsZPxDD1w90U6K0cjIfdkbrn2Zd6Or7eNsfeNCTqcGk4tBZuVpgEWmvpO4Rsw8+JcUC5YDFwFwlUBqTE0y+7lEqrdlk5p77t3vq7ZHsd4bC++Zibia22xGrSKYxaEmAW5Ny2AQgpWyi2+ut/2h7SglxS8yAWsx0MwPjszTBNBwajKy8NP46SBrUqmjNerLEMtBSQYqu2zpwcMjj1M5qvaNdOMDfsw6lBvcoJy4Szg6na1JHxQ81Lbi2I9TARbTdOOcMZ18JIqxDO0R8TL8DtshhbZQuP+PPs8/z9zduA1Auk7LBytbFC7sd1qXPx+GA/l0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPP2YiVnFvSWYga9LGVY3LFNrvogg4oBowTBxoJQuYo=;
 b=VCfSlYqCrbvqjyJPWGdGUQboCCah0e55ZrzzgcaAsWqcrLTZnWwl1FoKlHvJwmQ5PPr2fi0MklN+zqBeMxY1AFgN9iY6r4MQmhX9PQLRq8zDLr2lcTj5JMRtRI2YGjba0ECAsJONvfZHOFi3ZwFINNKvf6SYGPyUM3/Bhwkoway1JFTUAEzX0jXVT3az5VNBdH2BD7l7TsMyZTZTdal7AaZOH5ykZVoPHXfkPRVPSjyb631UgiNzRvPTX/eBG7JgGHQpqZ5jPxpAfFZ0ZGUiV7yRjZhGR9B5sQxgmcn/yi9oR5KkglV85NJ+gkExq1cXu3vhRboXy7xj2KYao45bKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7)
 by DU6PR04MB11229.eurprd04.prod.outlook.com (2603:10a6:10:5c4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 10:50:49 +0000
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be]) by VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 10:50:48 +0000
From: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de
Cc: imx@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sherry.sun@nxp.com
Subject: [PATCH V5 2/7] arm: dts: imx6sx-sdb: Add power supply property to Root Port node
Date: Wed,  1 Jul 2026 18:52:29 +0800
Message-ID: <20260701105234.198987-3-sherry.sun@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260701105234.198987-1-sherry.sun@oss.nxp.com>
References: <20260701105234.198987-1-sherry.sun@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:295::7) To VI2PR04MB11276.eurprd04.prod.outlook.com
 (2603:10a6:800:296::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11276:EE_|DU6PR04MB11229:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fe69149-e06e-4a69-f3bf-08ded75e9c40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|19092799006|376014|7416014|1800799024|921020|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: lamKa38iIe+I7V8bKTBS3dB8v4pc3/0Es2r2O2nvLlgW/9yluvxmIYgpV2yy6iKKuvb6KUyQVao7B95GCXxSRww46kUV1mC5ghcksMhEA8SUJ/R7sDjsUDRmSdt20bJfvCiyu2FprMgBwjF4AJuEJr3bQzTYIG4gWBqKvvw852FTwmdCKDbHoI4kKo+iwCS9KrAQgQm6s665uW6CCPAcfNZuO4XBl1tF9ij+ii9f/DFeUqyfFPyB8wfKmR8azlnY3I1xa59kYBPhPjs7J40yCCSjBrjfXy/w7xiO2CWKE5OTZKtZkAiG1MvaInH/VCHurvFSUI+ZDsCbyoYMorR7UZUoDoFaw2NWYAas+aFmv7M+qHU7eM9MtuYaX0LWO6UEHdWGKpg7WGbEBBS7dbg74RcakPszyYbd/ppDTTUMak6j+SSOB0n3UPGIb3Ktt7l/2MvXvm9fWkqMdVJnVe1W7LLQFMXp6/CV52Rn3sO1mFnjEIOnHfBjjVSvSQcHrrpZD+aYRDjSO5i/xClVD2LxeKeykw7KCr9Dk47Quq+zybKUWaFYL89KeHZNFk68sjC7ZG+x4l2C+P/klArIRccN1WyQLdhgpECTzsCIFIKW/2uabHDGlL4jvZCG8kho+n+p19dHfZaV6560VOIi+Zk2rcUxTAB03kc/EncktAcYV1T5yiibuj5cAJU2grzz1pPPZnHoJ+9FsDZGkUP8R5pAMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11276.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(376014)(7416014)(1800799024)(921020)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YLn97f8hzaSpsIvZ9bD1BNBn0D0GzW6MN6RYtAf7IdNKG0qU6Gccoz/0olqM?=
 =?us-ascii?Q?yOXHx1qPJ7KOlfx5VVb3OjVPCa3bpapuefy+MQaEq2wTQKxdtnKgvM9rQQyL?=
 =?us-ascii?Q?L3hO9FiYJ89XjWejqLPwm5NJYMXVKs1EYncDdigw5Ae0eGOwDOo35blOyO+w?=
 =?us-ascii?Q?A4kmslpLRy8RwCwtifMp5nYAE5ucTh/2Y32JF3efv7J7OhIEH2rhklvRCaZ8?=
 =?us-ascii?Q?FQ/d6wKH/6hPgTtbu/eT8Mxe5wq+F5y4vx1A2NGIOR35s1iUIx05iT9o7vlu?=
 =?us-ascii?Q?qKWIyf2Cpu4ISaxTrowB5mjBAmY1aUNwf0fyG/b1C5X411kdE7gnwmbj+m/u?=
 =?us-ascii?Q?hKAv6C7ic0fUpru4mdfC2+bCRNl3ZgEuaEhsdEi5maJzCOR/C7aXMgBXUILa?=
 =?us-ascii?Q?OnwIy3CA2Do1DsxROsu/s4Ev2Ckw4jD+b3ZkBqUCLOw3Lue0JclMX+pJeNiF?=
 =?us-ascii?Q?K51tL9NUsmsvUaoEW6RYXgVtMH3ghY56n5HSa8x5JoOLKUEgCYkv4lItqrLm?=
 =?us-ascii?Q?nDqs2FPvmQcYYNqRqL/VW9UN0+gkpEpYukHUtcIfVSldMxrQOJkOmGfWcZps?=
 =?us-ascii?Q?qhJzNVjGEC37XU70lR/cbkDN3ne0ABtWXuzUPHkN4Y/RTFLeZD6eeEpSd8FV?=
 =?us-ascii?Q?Bw1qJL/1niFCTokZn7b60dLg2DfHOYJn118D3eNYxBtvpm5jclgHeCdgTTeJ?=
 =?us-ascii?Q?EcqThfDeoFQ4LcnW6WIrJdYz5poYUFTqWtV2gdnaJvnkCKvtHdqN8VNkAuwu?=
 =?us-ascii?Q?4wf73ppuC/Z6CYoOhTy5bB0UaRs1jAfvqLJnDgtc+VrSPZ0V1HeFY1iL8rgN?=
 =?us-ascii?Q?2qniejtW7tfFqJT/QbEWwy+W+CAJ2yfx7NzR6sGJ3N8vCCP9x+8MzrO3c60p?=
 =?us-ascii?Q?X2Ug1QcXsHi/MQVnYGB/mlLwP5SSHxF9uVvtRxHQxQB7miZt+0ywUVhib9/Q?=
 =?us-ascii?Q?zjkSoWHmjQy8e+Od5iUlon52VPfluCcWYgzl7SjYsDF66incxoZTuWP4aIih?=
 =?us-ascii?Q?FEOmV53GLT2udHi8W6yfOaw86aPHfj44RQo9ZKR2saaN7FBDhe676rIklkiT?=
 =?us-ascii?Q?DPhDUG9/yu4O77mDzzI9ND0DAlK/vzuU9FzrXC18uDiEHw8Z25+mTKTETBt2?=
 =?us-ascii?Q?5xNMO428seHEoM4TSLLjPsOWhLzckP2i3rjGTUzbhcwMcfeh1WcmZgYxsWvU?=
 =?us-ascii?Q?esNqDgBGUeWEwPTP4MscIUODnDVMznzZODS6hTu42d/uVwOItY2mP9rX6+Kb?=
 =?us-ascii?Q?tc7Bk/Z5V5N/IlTPqCq+8/DOmRSRcewZQkiIeYcMaDsUgxGh+ZQpKu2oektZ?=
 =?us-ascii?Q?wzQ/wEwKACD4iHD0/XIY/fEGwraKLqM0fhbHPwdDVglQUARBCzpIF76ZkBBz?=
 =?us-ascii?Q?knhoqkVcCa1ynnD1davqfgWRDJWXld4EJCH7KSBD0WAvl1T63xEaqtJGtuV/?=
 =?us-ascii?Q?RAaFvrkXnkWe3ULvYFQKRHXC3QuWmbImaimMR2eBaeH92lOd2AjyyIYqkdiG?=
 =?us-ascii?Q?WeBMETw/RS0kboW2gWBOUgUO6R2jeAFjhcB7kaLJN8d7Sl05ZlgJWlFVNZrB?=
 =?us-ascii?Q?K8dq/6FYiTYKGrot3VAQvUQYgs5ZAYOnCvvfsCim8zECbhnb6h+KPyiUggSc?=
 =?us-ascii?Q?oT2iAocm9r8eNbbiKP0rFViT12zDkwvXyqr66dBFfWT4yo3tF6J4E8gVElpg?=
 =?us-ascii?Q?O8nTqot1MoRGtubXaHVmAwgPO9elfYDFvZ4IuxayAhpJVgJkpJS2FMW6zTaN?=
 =?us-ascii?Q?qYWvrWlnjq3w2oVLxommpL5YTK4MAoq0jfDELfXLo0KHMeTRYVc5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe69149-e06e-4a69-f3bf-08ded75e9c40
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11276.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 10:50:48.7669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LORkLm3NGXrJ4BmBUwiGxx1gd/A9L4jFa2sgyY394Ujn3LleNLLWAJq4MqQm2WCJ3fuQ700vO8/tpJSoGevJEzzTj6z69+o+x1UPCVE2oSJSJYwdhmgd3/J+uDZ6Ux2t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_115056_082860_73AC087E 
X-CRM114-Status: UNSURE (   9.86  )
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

From: Sherry Sun <sherry.sun@nxp.com>

Add the power supply property to the Root Port child node to support the
new PCI pwrctrl framework.

Legacy power supply property is retained for backward compatibility with
existing kernels. New device trees should specify power supply at the
Root Port level to utilize the pwrctrl framework.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
index 338de4d144b2..2d3521ea0caa 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
@@ -284,12 +284,14 @@ &pcie {
 	pinctrl-0 = <&pinctrl_pcie>;
 	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio2 0 GPIO_ACTIVE_LOW>;
+	/* This property is deprecated, use power supply from the Root Port node. */
 	vpcie-supply = <&reg_pcie_gpio>;
 	status = "okay";
 };
 
 &pcie_port0 {
 	reset-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
+	vpcie3v3-supply = <&reg_pcie_gpio>;
 };
 
 &lcdif1 {
-- 
2.50.1


