Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB10E6816B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e3OR6/EXxYEZnYWebb1opRXAJi/f0pCvukd/4Hhuiq0=; b=VB341cUIQJ+6uvXgcDtdLzVRtN
	/+p2ojYOp1/fGTK2aXUK+uWcxqc/7Jq77Yj57VC8bQCAOKurkUPodTBxZ08n4YezZ5gEaX1CX3GKM
	pBffYcKvvz3ZteQdJfbBqhVx4pwJ7JCLn2QN3+aM+ElMJs+l7oM/Xyc98nYFKCysE/zoxjV75wTX6
	eEDR3ZsEUVWK4eQ3pvNVk4itP2zpjj3ncVaRJkDAzFTp0GhI+CE+qMkdYsikqxkVVsgOWLKpqGllm
	4kyAGeXc5poEKo/3QOumOIg9yypqRQOQvdhEDqb0zlAZglVc9ByEDujmGtZ1G6H3rTYvcLlSfIlfw
	pomPp98Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKgV-00000008GD5-16sb;
	Tue, 17 Feb 2026 13:00:11 +0000
Received: from mail-westus2azon11012042.outbound.protection.outlook.com ([52.101.48.42] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKgP-00000008G8I-0uyV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:00:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7zg0QC/rlHySsN1OQTnEUuQIGk6fv5vwpZ3tydmCBxP867bMVsT0NvFpUCRo87pJdzsXcoUSqZYEwEjoAqDdaQKVqkaodV5IC1Dpdl2Zp/TzYdw+mRU0OnwHeAAZSH4yJPw3CGTHDorkAmxINECscv6+snJvbNXylaioiXHCdArblV0evav3dkrKdsRCAS3o5XA9CDoatWbCz5eyew6n1XQFr6iZdian6uKWrCn1DqecC5tA/+eir5Tlyt/pgcqB4Aj/XJnyqIwq1sJYMqVG9N3oSjufAi+04ojCPQeAseQGu5vdJGzT1o3BkdLu3dRDYTzSp1za2lq6J59gw7rvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3OR6/EXxYEZnYWebb1opRXAJi/f0pCvukd/4Hhuiq0=;
 b=om7SCwMidjl56ujbefCwrWzNNcVsXJm0jNgSk1eixM8kuKPNoaubrshryEDo9t0UcmSY/0gcnbMs70vErsVScyh7drjX1mFisXc9/7sNV/Fv2DCOeWuOstTdb0AdUQ+DNeLGwwUCUSa+PAhTTVVM/wSWxq16f827aFOAY0l3VkRU/uJLwKHusMkNedh3qPvaE64Nx8LfZuzo+9HH0vGkMqCGyk6fMieV2Hd1wP5GBuEt7m3OQ0xPKQ+yBjgUGIAp/BrXaIbGkz0JjZ1O/0o3PUx1kbKsEtsznnTfDXL055AYVN9ZwgsxY5YRO07qUlDvGh87eCIEFODhzrpgI4uiCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3OR6/EXxYEZnYWebb1opRXAJi/f0pCvukd/4Hhuiq0=;
 b=O3U/TqRBnzvwv4fbHUsUnKT7GKP5/5I//xlChDqZrgPc5DzI7IEXLDDzRFZqQoVr7mB4A4HaRe3h7RwbXCyp1IgT0fOqBdgj8vr86/+capExk8lP998CWeFgwvCrK+V3oBGF/0WXGJsuACxShWxq37F9IfkqEYhmyLan2uQu8ZHmOiOKuT7kMID+BuI0MyujObt69Co4Xoegfq2kCA6SNx5YnzkcXSg8nGKfYcTENG8ioULBUNHtLyiPWKaFgDmrz0yiF08DlM2LtakH96Hwx3mhdsILNP5U/0S+iebnbkJlXUFO9aYpXJ7Tn+DWOBO/m3ty6lJLJ08teVR3mEq9hA==
Received: from SJ0PR03CA0083.namprd03.prod.outlook.com (2603:10b6:a03:331::28)
 by SA1PR22MB4368.namprd22.prod.outlook.com (2603:10b6:806:38e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 12:59:59 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::ae) by SJ0PR03CA0083.outlook.office365.com
 (2603:10b6:a03:331::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 12:59:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 12:59:58 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 220CCE8F41;
	Tue, 17 Feb 2026 14:59:55 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] ARM: dts: imx: {bx50v3,b850v3}: Update device trees
Date: Tue, 17 Feb 2026 14:59:47 +0200
Message-ID: <20260217125952.53997-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|SA1PR22MB4368:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1bcff4d1-a998-424d-2360-08de6e247455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SJKymxsKgnpzNO5H1e66xCG0h6wNNp/wOM+EOpmYFZRZW3iq0IQN7FozyknY?=
 =?us-ascii?Q?T+N0+rsmpAR3nef717qGoJvr3KO2zWjl5N1X0CgsOd3XAStrOFTOsxXvEOF2?=
 =?us-ascii?Q?7zhMT5zDp66rcUKf1AZEnxJXtLB44CwMAena8G20khaMIrryDGTI78AT8Rc8?=
 =?us-ascii?Q?uYHBs+W4aRDW8AlxVEaE7fzQxGQ0JTVndHasvbdMMRopgXUUrtjagD2dHQIO?=
 =?us-ascii?Q?6mxmurFvHYIIWQYm/VGJ2gC6kOO6z6eJAYZuQLmX01RxQXBO2O1yTtdrA0XL?=
 =?us-ascii?Q?hpEVC8waINZdBb7srC87RszYgGittcPIrLRYK46r3bDBy/AJy9+ii6atAD50?=
 =?us-ascii?Q?3Nyb55phjQ2bGhyznkq1DuWBuBDkE55Qmxd6IsPpUlhLGcN3ZLqqlbH/vIwP?=
 =?us-ascii?Q?uCDcLlSXfCEN9cguD3Gh3V5XFn7ewQ2nwpcsbImiie4l4rKmjQxj9JdaKJkk?=
 =?us-ascii?Q?aEGvJE15aGwZ6M2tygp/zz3zjcWNNZON1AGpd4crc5va4BcFqtQtmI55x0Fa?=
 =?us-ascii?Q?O33JXrVQD4qIc176fN+0VEAK7tZlNJ42QRg0amGSVFR7zyFOa3YG7IFlICO1?=
 =?us-ascii?Q?iHUYGIbpFU9WXNlw/lQWYkdXyxGGcuVYDQSuF+Xa6+vRYWnG0ghCFzk9TedQ?=
 =?us-ascii?Q?omsKHYgv19ixce9eDdSQBjAucqfU725zeZgYhKGzgjoSXzPd1ynsuqnzJldE?=
 =?us-ascii?Q?AbQco6jJomyHtXW1dmLZJQzH6VSgX2ZHIenw38EXF+tloCoGcRLSNqwDafzF?=
 =?us-ascii?Q?jErDKdwICBedZHbbbzE4PFBgmkQEL1PAYAC5azVi6N+FtlG8Yb16j45PYYuS?=
 =?us-ascii?Q?o/P0TpRf6VzvzfZZ9GHD5pQykQOi8Y91t9DeR5YLLs1hczrZAfpWtk+fnfMT?=
 =?us-ascii?Q?FJpF4faFZB2DAFldeTmghnFLPAlCtS3OtDBEkZ4LruA1A0uCtCsggIFdbdgs?=
 =?us-ascii?Q?FVxv4/+aM3QTk0vb+KgBAfMV8wkKFjfiY0k6SHh4e5/ybBTE2Xmbxz5KwlwV?=
 =?us-ascii?Q?hUL/rZStuos16LoJ/6NfsbE8eG1kNyuXwmmOxjVu8+M8oQ+GglvCxQz+fY6J?=
 =?us-ascii?Q?Iqo6M6HPssMQ25xKYTKcmRz5W8Z8WVhYo3VdmUQTYNEqeTs0MUPxTmIKTL6M?=
 =?us-ascii?Q?TEK8EesQ3GhqwXf1WKw6lw/BUjXrwYY2vnT7pl/nXyjoLA7o7I1rRHPY7p/O?=
 =?us-ascii?Q?jR7tpRbCccfQFjqjIvskv9CeGlHT72dq2Ciib1JZIyqrsAYt5VnBVIW494Jq?=
 =?us-ascii?Q?GKxPiQQU7E9CYfEtUu3HjwfLFb2SCOp59hb4EZmDRitepPkwZTbO2TDmLWwh?=
 =?us-ascii?Q?sWnMaC7bcZZgbwQCKmsdcdIA9s8+vhvGEL3m0rBkXi1zOX7nYaQZ2uYb0r5u?=
 =?us-ascii?Q?1VEk2kanHl1L16pxVtOx7R+NaKUi+9TyWSf8J9D5vfAjS1MilmvbSdjIP55U?=
 =?us-ascii?Q?12HK47ZTbRP1yoJHflnx9ju2uShPOrtmKS+7Z//HD2KbybkJtpB6E4OEdDKG?=
 =?us-ascii?Q?NYEf3LkkqZFgM/5KHor45dMtYUIXKRZ6mMLZh2XKiaFEgVTMF8ls1GPGwkAx?=
 =?us-ascii?Q?+dylDptoiKqk1hSW3AW/wrjTHT1ditW3cGSA4VPyFBNSk916iHakpB4mTdP4?=
 =?us-ascii?Q?kOcaCjEXzRgyBEmcYV5YEg+nQy8S400MbENe94rqLif1BwrVxU1pzK6d0O2U?=
 =?us-ascii?Q?+je2MQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hPPnsNttKyFJVti7GNQkGZrNuH0rmR3unPmyUdKtvazoKmggYrNQnGJOyxNAJ7ir9Y1oOWurDicskyOaFCou7aF4IeBFhXC1rJH7DCCZ81Z33LUVhubgK4br/S0E2CFlF02GfXEChmKqWbqFN3kkfEq3Nc4LoIVPJIDxFvpfYQomfzyPzZsCIsNP7jQNbCFZM0jmhwnAVEFfKXQkp/6ZL9peQ/MST1TR8ZpmA8k/S4budpFiUEiu1kBLQdRSCba0ZhqjlAFgMXDL4rNV/jRw7LH1UKLWWsbOUeg3zeCSzgD0Qy2YYfUlUzNAipU7qocsHqFGpN0Oe8is3J+ZYvVqM8ndXgMKZUHW/LNpN0cbFThNnpvZ+b2YQaRjU1dQGeO+tT3Ti7kMkBdPJFfNLN5j1/4Q4mPrd9D6CgUINl6UJseICA9rSB+2nZGcvhcBX2FB
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 12:59:58.0669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bcff4d1-a998-424d-2360-08de6e247455
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR22MB4368
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_050005_265119_E885895E 
X-CRM114-Status: UNSURE (   6.43  )
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

Configure PHY speed and mode.
Configure b850v3 gpio4 line name.
Disable b850v3 usdhc4 interface.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
Ian Ray (4):
  ARM: dts: imx: bx50v3: Configure switch PHY max-speed
  ARM: dts: imx: bx50v3: Configure phy-mode
  ARM: dts: imx: b850v3: Define GPIO line names
  ARM: dts: imx: b850v3: Disable usdhc4

 arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts  |  1 +
 arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts  |  1 +
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts  | 17 +++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi |  4 ++++
 4 files changed, 23 insertions(+)

-- 
2.49.0


