Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24546CA6009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 15:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zitZkaP6t6dm2exjFeBKiAAALYoiOMq1g/j0AjSHRL0=; b=23hWlxOxMACvfuX2OxfQPJ7qXW
	qVVllvsnll/QSgOtw330Pw5UbLYl/M7REFg/bIQSr7jUUY2/qD7XhPbRs0znOZmy2w1AcTR7flb3h
	O9oTouaOjYR5NnVFP3/XjqyJjgS6tmk7ueZoxocTmOcudc6c1jM4zeEu/ex9b5sDH2oTSX1FEmXv2
	/RnKNcfi34jbcZcBj6qTofddR5Sq4TWN8enQMop/bVnKsHlNnb3oVYIO9YNTAv5cwofSDVcjCHtBy
	CVCya+Q34qGYG8fx0cJGhtnc8KOa6ANjIRwxHkYlrkfpSoOnJRUB0CBUnQqW2kbWvpxdXrxXfYC4t
	Mlg755og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETN0-00000002gw6-2DGM;
	Wed, 07 Oct 2026 15:15:50 +0000
Received: from mail-westeuropeazon11013031.outbound.protection.outlook.com ([52.101.72.31] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETMv-00000002gtp-3Hg9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 15:15:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2HKCF8Tvve40HA5WlybLmCsolbmEk2yqaRrXMgKsHDL/fzlwW5Mzv7OLDTcCuSxMJ87EsU1RsVkhOtw01Qvc0/JcdMfZ/mudFi80wp8qe1OuU9nNUG5UjLVA25DL1vudJkQjBa/kggUNjlqmDm+LdW+4mVM0aAh3xneVnaxDi5ygUaIa6N2lwNKQwutberRKDovbeyM7W5m6I3nXw6sfgN6IRAM5WQ5g5biD+ojZKhD6EFE8wZlINYl9Lsqk0kVW74F8otQQpr7+UDrpCTW3bdswDgIMbwrito6WahS/3OrnRFPhtzWliP3i9zeKuxkF7bBGwj2DNu/jP0t88+blw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zitZkaP6t6dm2exjFeBKiAAALYoiOMq1g/j0AjSHRL0=;
 b=JA38z8nZy9RUbVAEmGzgNUKte0ztGf8GTAYngrGjiFgcdysPhorz2AjMCY3b7JH8BILtP0ta6sbWA9aydcv/HOoECbNCEleWcypmeY9uPfO1+zepTKDNZ18+E6KPnrGfe3vkoeULKvfh0QbRQ4bDHVmO+5ks4auZEQap2O6vq9bp8cUXa1C2ogWoHUeaec8heP4x0UOS27rQKC3jtZOeNSqqEpUfMK0yOQQRd507gtf1+sWvE3Xnzl1DE2F54ZUQ8Kr7qRW88hJxrzGIipBDkKWej0ADbCYL2jlvr4eazuR9srkFS6qND1JVvQAYI7ovJ5MBnDZ+fCNxalXt2q9ogg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zitZkaP6t6dm2exjFeBKiAAALYoiOMq1g/j0AjSHRL0=;
 b=ERU03iPTpdz/PhHYIBi7UmYNrHcy+JO4go1W8iT/V3ATY8fraIw68lZFQW/z1kGIsD1DJ0u0oR5VjCYo+W5b3kShqe8xNw7CsDwWPJwzFE2q1uky7bQFjZkKzKVSQA736m6k4McYyCKUYCoNRraA5EfZocvbcg+b+gU1r8a4KFgjmcoi9RYOsi1vOw2wapgZxBe4Gcal+6foL7Ryq1YrEP419s2Jmu0Fb4V3RpBDQG5/op1awljqGJywgoG9nxBF9B4pw14oQl8tC/0KQD/FvheYr2eSE1puvzZ8TcpCT5ObR9QHFSNRn763y/8DOcld/c37ZMl5lZ/b4a0HMfvzXg==
Received: from VI1PR06CA0090.eurprd06.prod.outlook.com (2603:10a6:803:8c::19)
 by AS2PR10MB6926.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:57a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Wed, 7 Oct
 2026 15:15:37 +0000
Received: from MI3PEPF00008490.eurprd03.prod.outlook.com
 (2603:10a6:803:8c:cafe::43) by VI1PR06CA0090.outlook.office365.com
 (2603:10a6:803:8c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 15:15:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF00008490.mail.protection.outlook.com (10.167.240.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 15:15:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 7 Oct
 2026 17:21:00 +0200
Received: from localhost (10.252.9.73) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 7 Oct
 2026 17:14:05 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>, Amelie Delaunay
	<amelie.delaunay@foss.st.com>
Subject: [PATCH 0/3] ARM/arm64: dts: stm32: align watchdog DT support accross STM32MP15 platforms
Date: Wed, 7 Oct 2026 17:13:55 +0200
Message-ID: <20261007151358.1166329-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.9.73]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008490:EE_|AS2PR10MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: f95c20ac-5f1f-43ac-f633-08df2485d642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|56012099006|6133799003|18002099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: 7mABeg2KbWhghaZlYcBdxHys1uijjvoZ7bjJYvYVsz6whAi/g3WTebPd3FRFWwXcatNLiT6s2WTfjUOtLmYX8XcRQ+7PDSxd/uxIY9lDMHadJjXMb3MvK/eeXO+UyM52fpt742sYdiRmrAdNKYOGnEkIHI0NWNFxyUaHTO7uKJVOWSmZZMznGfa8cWVjdMBgAUmbR0w+oguCNJjIVhRcgDPsAP1FircBUVGf3ot/6RSoteH/bfdunWBPKeQDhd0n7UnZ/g6AccJaVtm5zO/5YLABKP+vEfoKLGAyiFySng7wCCk0Y3ta9eog7uN0BR/Q3hBQXQ28SByd1kjhMQGl6CmrAMb4vADigukRzk1p8sm7+14Bbuhowv3iuHW3guLr1f80Ifq1Lt4DZTkT8X+vDUNQjP0idibTB42itxshkF4s+0FJ0IoRUlMpqp1quoeCJd+hi3kvOBAa81pBxCkdHhEd67ctyqz39UmO4Bvj1NAmI4tfAYIvqFR7KtWYq1CceL0jP0tGG1sEop0/1hJ0HCUBLQgq3g7MzbJ7Pu56a3ir/VlJiN6imuNloJL7p+bztClke50uyg/LiT8JE6dqkju41ULvvbMCqmMuj+nCJwZXqF6Uj0CI7COqy5cLHwW7QcC8GRszW95BmLA0X+Qjp+LdNtzoMC7VvIq/GlbJqdpslEUhStFi/dWIBG5+sBcJM5hKOZMAs6hCCpJFNi25mg==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(56012099006)(6133799003)(18002099003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oY9WKrQjSu8u+ZuZq3mgz/97VohDbksZTsyA4jLT/8+DrimpGJNsTKQrA96vxSnLji5eCyfy0qz59uTnkmWrIeEa879b9lzGD6G1+Pwf7mo0L7mbet6/5wkyl6qafgQKtBJIQR+5v2IimrhMuXlKup/4zJmt134zOOB7WbecODiVOKGVupL6d7fqpVjq+zPL+fF0oBm1H5bO33dutvkQQMIYVAaM0z2GuMsODqRQ4JbxX8ibPnAO0baPxUhvdh1jInhr1LjmlRtP3i4YBZwaXb+fuOvd8TJbuLLYT5fJHykhowcldpFsqf7qWRvinjPcKbSjOGTSuNT2SiXn/akUXmPwdXlgdVVkD0W7TU1iaJxBliRX7O1LQNjge50rAZnqPpFBiD06K50REGR/BOiZQs2pUs03sb6Xi+NJ6WqZMBRE9cUNYCXVML0r18MOK4Xz
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 15:15:35.3114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f95c20ac-5f1f-43ac-f633-08df2485d642
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008490.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6926
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_081545_824525_DC4A9660 
X-CRM114-Status: UNSURE (   9.57  )
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

This series updates STM32MP watchdog DT descriptions to keep them aligned
with the actual secure/non-secure watchdog integration used on each
platform family.

Two watchdog access models are used:
- On ST STM32MP15 non-SCMI boards, IWDG1 is exposed as a non-secure
  watchdog. In that case Linux must register the watchdog device and keep
  it pinged once it has been started by the boot chain.
- On ST SCMI-based STM32MP15 boards, the watchdog is handled through
  secure world services and exposed to Linux through the ARM SMC watchdog
  interface.


Amelie Delaunay (2):
  ARM: dts: stm32: enable iwdg1 on STM32MP15 ST boards
  ARM: dts: stm32: enable ARM SMC watchdog on STM32MP15 SCMI boards

Antonio Borneo (1):
  ARM: dts: stm32: move ARM SMC watchdog to STM32MP151 SoC

 arch/arm/boot/dts/st/stm32mp15-scmi.dtsi       |  4 ++++
 arch/arm/boot/dts/st/stm32mp151.dtsi           | 15 +++++++++++++++
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts  |  5 +++++
 arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts  |  5 +++++
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts  |  5 +++++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts       |  5 +++++
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts  |  5 +++++
 arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi |  7 -------
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi      |  5 +++++
 9 files changed, 49 insertions(+), 7 deletions(-)


base-commit: f831584128ac2a36fb4fa62fe106793d08c2dbf1
-- 
2.34.1


