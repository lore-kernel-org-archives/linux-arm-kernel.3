Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302A7CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 14:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TW7i3VMv6X3fE7YsM/6qtchCWcRku46q7bDuz3n+Xbs=; b=ogaFAu31MI5A+2WKTcAgwMTyU/
	tDtoGyIXHEYPBdwM0NxopuXjdx0jrvLOKiSYHfRrpEWmtF4LuqUR+WBtZdsbP5iiYebSiEyySTYLd
	n9uvqBgMph1KmhPwRNpl+te0GHZC/IKfTzQtvrCCc9OJpW5biTw6rzj8v1UWHptqcdRLSTlGFLT3y
	zeWyuSH1BeEi3Dt8pN7eyqW/hJ9rzA9UOPIFaON7t9/ZehpZYy+ym18pSBbfry42xA18T45uHcrVJ
	NMHbjMeWeoxVwVJMoT2x1ZFHr1j5mEfG0eia+DoB38YtI4GD35/1oygNx0maIYMppn2M/yjqgKhcz
	bUwrlqTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzr4-0000000Fimz-1jUf;
	Wed, 14 Oct 2026 14:21:18 +0000
Received: from mail-northeuropeazhn150110001.outbound.protection.outlook.com ([2a01:111:f403:da00::1] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzqz-0000000FilE-3yaF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 14:21:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DqxRi+Skmb2MY5YtJvL8rM4nF2eHrY2bEj08oF3pfkPIS55gWkh0mxwKQTQXSPZBpaBEonK39y2WEPuVCaINcPWEOu1ph9TFd5kIlOiSlohrS0lpR7F3TqmZNq32XEEupXXKyWdj1vv559Yh/GgMX6MXUuWIDhdZGU6pvpDJejqbKDj0MJc09qC+6D3y0vfSx17Nsz6ztkzkS14Mqdh76IuD4XBBDiA308iZ94LGtQx8C96J7GiCgW2NOzg/ADoPoAFSIXbNheR2hJd4Q+vKe6uISliNOlzpx5P6Zon6DickZJOcF1BdjirhZ6jadBd4PHIzCGUvDOdZ3inGt+rLqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TW7i3VMv6X3fE7YsM/6qtchCWcRku46q7bDuz3n+Xbs=;
 b=IeDpVH90DDOX60tkTazokAzX5yHsJh8YMxm7nxNe3qlXXKluixLh3TBdMepRzmjJ032swn9kAB9ar6EKRAw6e9V60UqWG0YccP5+FY5U+uKgXERzbw4IAJYxwKb5RRcZtV2TwPEGICyFkUAz/xeLmc/eJhK8BpWZA+siYrF8rRZSCgNV30f6oJTNklzv2F7NK9aBAV45f+U/Wo+9YXwrRM6fCeDgha2C29LZyJFEZoLKlg04umXbTsNHxZ7h6X7OAmi/PWGBOT6qBQ2cXpDgvjTmwCdH2qCabeq2lx3I0Db3gLEqHhDtQsD7UtphZA1IgiOSyzMMQMX2oc1By8hTkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TW7i3VMv6X3fE7YsM/6qtchCWcRku46q7bDuz3n+Xbs=;
 b=KQjz/Ea2fH1W9Qb988DKXBSuCz42SUqmLd69iQzo+b+QzcfrFLfaDasBI9mPKvtGU1+VjeHL8zVHPcplahNTWCDHtKQccbakl2GZYrZEmeaB7pc2os4MFeuNHcdoVldFdkAe9/rKdh1UGWLW+MVsYAM5otkmVaW+/FpMDQChCmOK4wlSZwb/dKWmxqxojzq997zO4LEDhu+bOvcnucsF57P8MDuNZiScceLEfaxt1hyxBk7hGWyBN+9C7RA+hZ01/47Kw3wrKMd6eNeKUtsZ6A+mmh3CaefmWGZhjQdMSD/O+nkYi1fBwHE3C2ZO/KIdZ1z71WgbqZ9R0IaiNzXaMQ==
Received: from PAZP264CA0049.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fc::16)
 by VI0PR10MB8815.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:234::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 14:20:58 +0000
Received: from MI3PEPF00008490.eurprd03.prod.outlook.com
 (2603:10a6:102:1fc:cafe::92) by PAZP264CA0049.outlook.office365.com
 (2603:10a6:102:1fc::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 14:20:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008490.mail.protection.outlook.com (10.167.240.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 14:20:57 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 14 Oct
 2026 16:21:24 +0200
Received: from localhost (10.48.86.45) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 14 Oct
 2026 16:20:57 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>, Amelie Delaunay
	<amelie.delaunay@foss.st.com>
Subject: [PATCH v2 0/3] ARM: dts: stm32: support secure watchdog on STM32MP1 platforms
Date: Wed, 14 Oct 2026 16:20:52 +0200
Message-ID: <20261014142055.1909285-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.45]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008490:EE_|VI0PR10MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: 06b57516-ba67-4e0b-7d5f-08df29fe5d9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|36860700016|34020700016|1800799024|82310400026|921020|56012099006|11063799006|261009223027099003|10067099003|18002099003|13003099007|12100799066;
X-Microsoft-Antispam-Message-Info: T/r44zBaedKdhM7yXkgg6n9E9bveQEkjG0VeQY/qoLG3hWnzyCdLqGzjKQVcPtS8l5oXSxGcuGO1j8Uw7Yr7Kb08Dd9oiDOF7tFdkEZMs+k9r6PzUrkg2Gl9pKUxlm5l84kTM3xAAJmwlSfSW359im2kr9u1wnAbidb1n48c3FujL5rzsNfg51xeZcfsTlW8JoZqvCN2tm7aZrimFVIeDP9FbAsPNm46v3btMR6Qg0QlPk22ZmEdz8X0myy3LuybEUbR0iCFazKpog3L/rhhSXH3DEPNjmltak/fvvLguYKOfsCiSFavgevt51UVq1Ub/9EjedDmb6BVIBtMFXoRCQbE0sdeEQp00n8uzylVc2/3MfqdgMUufkeRC7z5MkX40I4NXZeX/YOAYw/UzwkulOnBtRMPJ2hqfHR8xBExLUqZF3K0S1l8mPxP6O5n8AMUxZaIys0oWOrUpufPM1Sygd/5C6HbG+OfNdvfQcK3ybq4D+2+kfm7PPGXOREsco3JXOyOKYljfCJX4bgFenjGeG/L1YpmtUgm272Eh44pPRKV1KLU1AMeH6uP8Agk8LnH1Oy7oDfBIkpA70LsYD0ulESqHH4kg0hKmCIDNYShOb8Q47ascqTX14yQH08QLP+BnNe3lz8dvGkEv1cVkPTvDkDsGq5aUZ6DRFm7i6MxRoFPFEzTazY6thYJm4sgQu5hcUUV43MRhKwTn8Ire/TMmQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(34020700016)(1800799024)(82310400026)(921020)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(13003099007)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MFlW4PlRdAJ+pyq5hZFa021j8LRkRG28lNDE/jxPYxZu8vfFTJeXGfnMpm73mX1fOoNTHjN0cfBA2jPUsBA7I6YzLzpQe1j/Cwu5pGoiamzBtl1HM5cpSNMImzoPkL9c8zqJySc9+Y8ezZ+U9AB8gJyhEKV0472dWClr7tp/KiGoCLZvp6VYq0x8MDAwcywQCnZB/iyACcb0reaQOQK0Q0Yig5WEXINZUBEeDV675K3knWo14QTFWERzg+WGjPVLWQw6Td7OmkNTJVn7kP6xKamdnBURLl1l/rL93ZbLF40MLumY3c0QNCcvv13zr9nnSTtVx8ecPFHEGbxztPzoN8FWxbV6+4vAX8G4j/Y/coM1SeWU5ROn2awmW4qQEqqxVDw9k1Ic8FYqoGpliJdtl9HjTXuksHCiKYO+Mf590pgj623Txr17qTsrXYUC5HrX
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 14:20:57.8120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06b57516-ba67-4e0b-7d5f-08df29fe5d9c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008490.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8815
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_072114_238371_22A965C5 
X-CRM114-Status: GOOD (  11.62  )
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


