Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80685D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 14:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lYlHtv4rAWJbRZg/DGKugM9OAyUI3ck+rExSwiSoGwQ=; b=xqh52trmuY/E52jRDBaFlDa4tS
	vXArEYjNFiUUuPyDWt+c+sAMovDiG0dgx6Jl/w4b6tpGBluzzTW+d7XvC3qHoGutiMejdEBofXGC3
	h+tcRL1XW8RsmtSmRyY0+q6MrrwzTf2tpysfpQmWRj6HC94ijCuE9ulAcij16sofDZ6SRAxpKh4e3
	DVo59XiFRS4AthEr7BgYV2mIdA9Q2wvCFk7tcfhXj1z40prChIGgFTfbFeu5wNHs0miqct/V4Pizp
	RMQOIkmjbCK9xtJcrxvFJ1Pfh54XHMhh2vyZAL4QDM3wg84xdZqTuLAF3fKEugMsxkTDbFR5f0tVb
	aBzLa0cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaEZa-00000003ne0-3fyl;
	Mon, 29 Dec 2025 14:50:14 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaEZZ-00000003nd6-0arI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 14:50:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urpTqM4NBsFdqT3oGjVXHh0N6usDThl8sEYtGlHILX7fODzwk1++NDx3y2VtG+8XvTP+1XNbYP2t01sDhD1efN2uUZOM6S1e0i1kkThDufHbDOSzEsJ0W1l/3QM1RdTdyBBoiaNdjFxXc/Vt9p+xIsorlvR03kr8IaVjTsp4rPp4O5ITrhbQDC4pkbVAlYpjKg/0Y1HjxRdEJfwL5Ugy679hwagbyG28lvkLLNXcaQ0OktWHwzliQNUohFfCSOXvoVFj9628Bm2h4AD8GHi/Wd+mYBp67flovaxF63smjzloxShU+Kwu4ZP1DhVke2dqt43gwKpi5ihqBa48Ab1+8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYlHtv4rAWJbRZg/DGKugM9OAyUI3ck+rExSwiSoGwQ=;
 b=EuH/H96JGsRHAavCJ6J9/lBNjGkoSPxHch8SW4GMxMaHL3cL+EuIfdox5XdKGUaZCxXFcSvh0JpS0IGO+mlpi25qw3GJHD203LsbMOHwa2p2yMQBKvo1OmIlwW1IDsLRQfRcpPYY7UKKwG6j43Ga4S/B+KcmeCx2vldvNcU6M9PbdArquXFwEHo2zY4ZG7b46oxY9GYM35ncccNbG4uo6z++ewja7EPXFKjngTH1vEE5yqn3z0aCwv2ck81USGMaoxYDlW7BFqcW4X6KBxSU7rY1k+tZXk8xoT/0CWFYBo9rhXSoyj5ER2UToE9kVHYK4XIOmK9yE7Z2er7vgFFAMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYlHtv4rAWJbRZg/DGKugM9OAyUI3ck+rExSwiSoGwQ=;
 b=fkcsQtzXN+22aNQv+s/YdY+k4ZJ0jGbsDgqXyYezQ5K07+euTqHBSBIZJERyTx4q+dA8c5ntbCcRGQAPRJyIFMfDKPk8DXMxpoNjtlqxT0CVqXE2ZDJJkcD5EIYb34UZFAtJr80vZAovk4CQ+bkrOoRnOnPiygQ/c4g9BSwtueU81cU9PonEZfFs2QH8Dxg+qNFskQCSti6Fa6YmaGEN9qP7glM0NS+4S77+hfd91mMeWaMdheclRz0N1pkg5mxuVwFYcokQWRTewTWyQqLVYxSo1/MjshpQuvlVIasJcOesrH7i/XYhvp6alXOykAella6f6dD2jTlm4fH+r4KNMw==
Received: from CH2PR20CA0002.namprd20.prod.outlook.com (2603:10b6:610:58::12)
 by IA0PPFD26FCF2C6.namprd22.prod.outlook.com (2603:10b6:20f:fc04::d4b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 14:50:07 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:58:cafe::dd) by CH2PR20CA0002.outlook.office365.com
 (2603:10b6:610:58::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 14:49:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Mon, 29 Dec 2025 14:50:05 +0000
Received: from podman-dev.fihel.lab.ge-healthcare.net (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id DE835DBCE0;
	Mon, 29 Dec 2025 16:50:02 +0200 (EET)
From: Nandor Han <nandor.han@gehealthcare.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	nandor.han@gehealthcare.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] watchdog: imx2_wdt: Allow to run in low power mode
Date: Mon, 29 Dec 2025 16:49:58 +0200
Message-Id: <20251229145000.421426-1-nandor.han@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|IA0PPFD26FCF2C6:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 23c4b8f7-cfb2-4095-3119-08de46e98e23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aJLylR1BMUj+n3xwuKfCtTeXuLhw40NtiFWl0g5ZUjTTk2yZ8ifRAAGTB0sF?=
 =?us-ascii?Q?oG4B3Y9tWURf9e/DnCHLtei8dWraGpcnUpWsgffkOVb0OkzU3uTki8zVVhNg?=
 =?us-ascii?Q?CD3EO6U2OSfxc3AhMlU5Isvf+GgK47xhSjoQ2EVwRjCgC8lpAHC8HRcAvRuI?=
 =?us-ascii?Q?SDpBROKjoMVouFNUB2qDknVi5Sywn8KWC6puM66Oi0RKDYaVegBBdhSHFWos?=
 =?us-ascii?Q?4+9GtTXsykc+cQ+Scts4Ga/fhMiPIjl6Qp4kUovfnjz5McfUBcThum7nVuQS?=
 =?us-ascii?Q?1GG79DzQ7pExno4JmEMvysYVW0PoGwLaO2xFbqTzNTq4pYGgJvFG2tqkzjMD?=
 =?us-ascii?Q?FMLOpWowrBphrSJKFTgSEt7gXpFW2Nr8vtlTApNVZfj+XZGP7zQfVm0BkVTs?=
 =?us-ascii?Q?jAAZL4zfkVhZOWoNaLeXv+xfMRNSi28yWeKbVaJuSzEyIJrYnbQnl4BmvfHn?=
 =?us-ascii?Q?Z6GRk4QAzAlZO+g7ggeYbhoRL6Cr2s01LU3BhK8j8WBvjKNpg+cVx8StphtJ?=
 =?us-ascii?Q?zTKg2egcw4JzOFcYK1x3F46MiCwzFsQgEWQGjRMvkkUBayv6UtQGVfJF0SIg?=
 =?us-ascii?Q?Tz/Jf85Mk31D0mxCHwoBchNrwXECo5Pz5huQNy/Lk6Gq5Zv4gpLsv5c+yvoG?=
 =?us-ascii?Q?HkeMeg+qBV3ukokhAU14ENs7ynIyMaRHbC+ny/HffWCjsS8yBCxyk0VyLg7y?=
 =?us-ascii?Q?LqY9yU7NXRxHkG450KVBZzr6vK+MuBV64sKVQq629RTXBBlCN4uFLWdPMRIx?=
 =?us-ascii?Q?ENZ/mcZashGUO4CqPGjh0QQ4HnLTUNbCG+EiGTOPSVVpbsHruwcKgw4I0edt?=
 =?us-ascii?Q?X4T3Li8p5ZRhZe+ZIHuMzPuYSNEkZZ1KVWP8RI+daOWBRBIKQKhHOdHcE35T?=
 =?us-ascii?Q?Z6Vb6IDW9j/bIZRFtOvjCAWCgCsknnBEH6/FUCVveRvPvlbhYnM4gvo0XrAH?=
 =?us-ascii?Q?muPl5vuwnaDqg6fwRbysGOLV6aacfubiiSiI55N9xDsdmio26Z24XXJpIYAL?=
 =?us-ascii?Q?cJOOpzsHM6OkEm5gMsuPHjt8cmtomKSH1dPPo18wyqB2e9PAq5mclLGqdNVO?=
 =?us-ascii?Q?g1XXXTbVx7lCKozXcHGXI0yU1RguDrKHl9EaJwS5Ayi1j2pCEl9wohaTilVr?=
 =?us-ascii?Q?6BVhMIKpoqnm+fVsXikAzywPQWji90OhyfubL8niIvNBORXWsRQEHsBEWReY?=
 =?us-ascii?Q?cqnqSLHfPWUirQlU+5Qgr7fdXdZketOAROLWVRq6aswg/Fb9lhajHwwn+EyH?=
 =?us-ascii?Q?qvpKM/KKwQtBfgFxmRzGSGtqAWXWRnD9Zs+B980MD2OGYnSkEWylRwSXhXvO?=
 =?us-ascii?Q?ZkYBHbP+mcS0/K3D4SoeNOfDeEsJ2IDL0tR3xiQ7vwLcL9OUxyTYdpkJsmS9?=
 =?us-ascii?Q?xa3ANLvNmg9BeAZHR1R7+6pPwcmmn0b4Cj/ItA7MsmySokwVCVD/pizOQGE2?=
 =?us-ascii?Q?V92SZEHxHg6Z4dHHHMrIq/tblAZnRWpgwm2HlkYeMqlvVRdaHqwmjIuAvf9z?=
 =?us-ascii?Q?exCMS3XvI+YdNi1vPRG/ucDOSmUWtcitJTmPTqixlk/t9u5WAn16yY80cQqQ?=
 =?us-ascii?Q?I4CMsQzxobQXiDYB5Nw=3D?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 14:50:05.7958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c4b8f7-cfb2-4095-3119-08de46e98e23
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFD26FCF2C6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_065013_212751_B0B99947 
X-CRM114-Status: UNSURE (   8.16  )
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

Description
-----------
Add the possibility for the user to allow the configuration of watchdog
in low power mode.

Testing
-------
It was verified on a i.MX7D based system that once enabled the watchdog
will reset the device when the system enter in low power mode.

Nandor Han (2):
  watchdog: imx2_wdt: Allow to continue in low power mode
  dt-bindings: watchdog: fsl-imx: document continue in low power mode

 .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml          | 6 ++++++
 drivers/watchdog/imx2_wdt.c                                | 7 ++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.39.5


