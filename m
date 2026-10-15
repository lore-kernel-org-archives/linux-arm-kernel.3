Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88DACC6B39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 15:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TW7i3VMv6X3fE7YsM/6qtchCWcRku46q7bDuz3n+Xbs=; b=bttNNwlIH/nW8I6zH/8i6fml+k
	pZeCL1cxtcAzs+Awm+9TpExjpC017yZEALMN6eANs6HagioD2Jl5vb/AZGPxo2Lwo35iZAUcSvQFs
	FyUeMGO89ApFqlqalYDVAcQlcRPTKgzWw32aeZEN3K+SAnp4QMQS8nkkUb/lzpxUD3fgAjYldH3H0
	UYi/kCsfs48jcQu4XOUBipACHc8oLPFCBHs6ihN/zcJKfWQ019u9kLNEbn3MFo6TqNchWxqjQ13Ur
	fGxBDLwLoCfDoFuND7bvo6RpGMauE54dsS13/iOxpqTs76FH+MPZTE0YdOHSpQJFrRiwU9jYV3Ut1
	zJUlEBhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHNhL-00000000bsI-4ADJ;
	Thu, 15 Oct 2026 15:48:51 +0000
Received: from mail-francecentralazhn15013060.outbound.protection.outlook.com ([52.102.174.60] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHNhA-00000000boV-1Nlz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 15:48:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nu50Z7YvHY7HsydZvegPv7OPX1NVd6fIfRLEXf/M2REkO3+458XFh9vu+Lob1fFBOzg4LG8gLgDY+6faemKzFAyXb5i3KYHzS7ouEUj69zApoEEAEw86OjMBg79IsBByQMA7R1JNQhcd8VP1je0SVNM0MNW1ghm6sCRIGm0EaiJxM7FajtPFV/Rbs2wcGCVqBI6qFHdNMazFGPizhPTOhia88js8OHsWk0jmOuhnsr0nYxC7YDy4qoQ0NrB6c2yCKDdN+5ACNZijXoOk/wSIoBFsOKXnerAhYu6Yh71nZ3vT9f48oaW11+dONYQMs6u7bkv6sY7uSJ0GYHMgGJtvaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TW7i3VMv6X3fE7YsM/6qtchCWcRku46q7bDuz3n+Xbs=;
 b=Db6DI3Ti0m+mFp/qaYn02eOLPRfhXuAtw0LPhRbYKFH0c/BYLL0LZcmGCkWqy4dDznEeMBmM8UX0dakicIbpXnFctZ0QMNv1RHLbdBm6uGZwYziX5KEdz97eIG8lI/v1wyCA3rg7yd0+hOl5KL6V3/KYNxYBi5TSiBas9Ih/Inh3gmCiuUMhgOHAsnGVFI1WYl0AMqsVVrvA2wQe0j0+n9oy5yGelD5IsfkidjECrK7eqFPweEoUUKRQbyfDlnXl514naRWgUz5Gwzj0kUIaAjcFvffcGx3VPHdtaYhm/3jkZdgxd0g6S4toXmXWmU6ngUPgFjWdJi2JctL+CMZXtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TW7i3VMv6X3fE7YsM/6qtchCWcRku46q7bDuz3n+Xbs=;
 b=FeQD93OziRZqwFANOnBmYOxo+nK43sFODNlrFVxME5CA1jzM/jDWb5zm2+rKXuqPfPWJploKJyxaqFacuMEE6uoiEu0+520RblVz6Zh10N0TSeDLEkVmMn5fgGlSnVjLHjSP2BcdJTohKxGnG8p4P5jb98gFZVHQycmcjuhV8wPzdBbKE4SFULGGDxbOjqmqlae2dFmqrnKTWSzb7TlRv3Iq5vJXv1T6ehP0YfstfWyBLfu/5Lvcm8r4K/g1zW4VgUlpFnLAtt6+jpbWfmQ8HreI99tPQPiCo+1YGOx+bd5m+HPVVpTa57nfFTloEFpGihd+TjGvglIxVFdSu2S5yg==
Received: from VIVP296CA0120.AUTP296.PROD.OUTLOOK.COM (2603:10a6:800:358::8)
 by DU0PR10MB7051.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:422::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Thu, 15 Oct
 2026 15:48:31 +0000
Received: from MI3PEPF0000847E.eurprd02.prod.outlook.com
 (2603:10a6:800:358:cafe::5f) by VIVP296CA0120.outlook.office365.com
 (2603:10a6:800:358::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Thu, 15
 Oct 2026 15:48:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF0000847E.mail.protection.outlook.com (10.167.240.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 15 Oct 2026 15:48:31 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 15 Oct
 2026 17:48:44 +0200
Received: from localhost (10.48.86.45) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 15 Oct
 2026 17:48:28 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>, Amelie Delaunay
	<amelie.delaunay@foss.st.com>
Subject: [PATCH v2 RESEND 0/3] ARM: dts: stm32: support secure watchdog on STM32MP1 platforms
Date: Thu, 15 Oct 2026 17:48:23 +0200
Message-ID: <20261015154826.1947492-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.45]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000847E:EE_|DU0PR10MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: e51416d2-6719-49e3-82aa-08df2ad3c327
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|34020700016|1800799024|36860700016|23010399003|11063799006|921020|56012099006|18002099003|261009223027099003|10067099003|13003099007|12100799066;
X-Microsoft-Antispam-Message-Info: KLMCamC4NQ0glx4hW23uxGox1VvJKbMVoDRoPuNhGyhxeOmQ8kc9w1lQBTg61isAQgvjpawzvO6J7C0xEvenlcoumYdzjnjZ02ViRN3lCwDY7hO3A6P4BuVUdz0RLgbW3AxL391zRxzmgb5B6Tu+tShOqtVzzYlY//mYiP87zre2KWM+m+S/JyYStzsoFuJTLxMGUMkHd78KEAwk0E9UPV7N5Rx4fHXD/tG1EfPmCZsYjJXFS4pOz69IdLluwSxPmvzphKz+Dgm+4Tyjl/p5pLXCFwTTARTRQp948xlNE0X+dRPjSYVupk0PSt0XRxSJ5WbmycSE2qkA7BdrbF3ceDobKqvJQO3yFNMk9CdXizp8uRSHaQ3za1YwHaBBFn5DwWiyXr/LAELfTDboSZkR3iXWyZXNPWA2hUWYO5MIacym/aU5X/Rdtuz8c8nPRhE6fjchs0EArv1Z0ZY2ihsChoyrlDNp3MO81HAiFaUMFpbO77nbgzq+14xxE7VN49s2/qKNGuElAm1wgbn31gBt52WIr3ZXIfQYosEkkB/GDCPWyEK6Uiq2bsgXYzu037HhydWG4q9r1CAeEHq8H0ReSuh33Y0MbG6RJylyvO7Xn7iO6tL5WOi3hQO746KNJHwsHlxiuoZ/6JXrbSyxTz1ePTDm+LfCB/f3ma7Wa4Lf8+gHbbMK7pVjVe9tVFoODG5J3RF8HEWrWHaBRTwW5lybCw==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(34020700016)(1800799024)(36860700016)(23010399003)(11063799006)(921020)(56012099006)(18002099003)(261009223027099003)(10067099003)(13003099007)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yQyzzIrkI13CSxrDrjNzkCLgOF5yoInW/sugKN1JFhMl04/ebiOyQdxy2o7lVtwtNSY6jZjA/lKtt4Fl6ZfcOLxKxqY8Oi2psYDZlmpHq+xO9v06IiMzJp546gXUVZ9pzeTI7GEptVwDL3cPJeV8m1XcvC2PjWF9CEOOJFGAarrgkyMbDqZ/Nz5fgpuPd8Wp6QReKV0uZnhKYk1ZXA9owSME++wnexiy/4rK5pykgc/kJSgVthqcYp4eTk2QVqmr+PthBM/2Cw5CxLhKBlOCOeOJFRkGBp1AieqYxC6XlCA71CGYkm3SBfH4slbaRE4sRts+BbntBtesuyot/nHwDaBXv+ABP0ehVVzQZXbQXSAX/C7exL8jbZcBJrC7/ukF+MYRrHx2L8W9EORU6IZwa9iedEgkGKToAzTMyi0bDIkFhkz4Fr6sMjJDRvkCUZ4G
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 15:48:31.0132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e51416d2-6719-49e3-82aa-08df2ad3c327
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF0000847E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_084840_411803_C2D4A93D 
X-CRM114-Status: GOOD (  10.93  )
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

Recent versions of TF-A start the secure watchdog IWDG1 on all the boards
from STMicroelectronics based on STM32MP1 devices.
Since the ARM SMC watchdog driver is not enabled by default at compile time
and the DT node is not present in all the board DT, the boards get reset
when the watchdog expires.

This series enables the ARM SMC watchdog driver in the machine Kconfig and
adds the required DT nodes in the board files.

It would be nice to have such series merged asap, possibly in 7.4.

Regards,
Antonio


Changes in v2:
- Drop addition of iwdg1 DT node, not needed as OP-TEE keep the watchdog
  secure on all boards;
- Link to v1: https://lore.kernel.org/lkml/20261007151358.1166329-1-antonio.borneo@foss.st.com/


Amelie Delaunay (1):
  ARM: dts: stm32: enable ARM SMC watchdog on ST STM32MP15 boards

Antonio Borneo (2):
  ARM: dts: stm32: move ARM SMC watchdog to STM32MP151 SoC
  ARM: stm32: enable arm-smc watchdog on STM32MP1

 arch/arm/boot/dts/st/stm32mp151.dtsi           | 6 ++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts       | 5 +++++
 arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi | 7 -------
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi      | 5 +++++
 arch/arm/mach-stm32/Kconfig                    | 2 ++
 5 files changed, 18 insertions(+), 7 deletions(-)


base-commit: f831584128ac2a36fb4fa62fe106793d08c2dbf1
-- 
2.34.1


