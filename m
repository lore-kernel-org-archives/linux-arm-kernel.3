Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1845BCD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 02:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DdkycykB7DdZ/5TmpdCM8Ij0KMR2LHDs8nmH9tVVmY0=; b=s3vQH5g6mM/1Wec5GqKggyuR1n
	bNYtd4YE6vZiwvMFO5hfhw5dpWSfm4Y0boen7Mw5nx3T7O/w+f09sYhndY6lX8NJ4gLCyuuo5Vm/p
	o+IZnF70A6i0P9QI27NWy0OJn3KsZdtGTpM93oce5JntCLv9CoPbteWkE4RuJkZYAO6TYqlxVtM3j
	RfP87OTuMtUS8YjQ6jZtsvFc8wAJ3dN3YSf0deAKXq04Vglhzi5M+ErI9QXN+8fyiRLG4snfRACVJ
	5Kt/O10lv8wTcwea7turih03ksmWlUdqvNw295BCPc1GxoM+94S17UZbFVl54JO6W+RiGOEw8Z3PD
	ruTF6DvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMGbr-0000000C3mh-0Deo;
	Mon, 11 May 2026 02:43:07 +0000
Received: from mail-japaneastazon11023120.outbound.protection.outlook.com ([52.101.127.120] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMGbo-0000000C3jZ-1BSt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 02:43:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YV29aFj1KyoNG5efvlVKY5j06TyJJ3RnKrNCmqhjqte6u53uhtuITcvU1C7i+2B368H+wI/JeMIBLinR6VXur1/1uveo0vyy9Zo4PPCjvhNFyuewdU4mNVt9keweQ3JTJXm1mgKjpKM8kUTDo9+z1oSD610+Owo84UJJocjnqwiqJFlnhAWtWYMMqJ/6RVshRfl4/ru1LOYwQFMZ5wI6LPVHid2qJy8jEbxuPoSmGULrPtgICHe9ViZ5ph4Ku17gl6yusPl6nDzrC8wPOqSp6xHlvrz8Gv2YWjgme4ZRl71gGPeJkGFzgMKuIAoZ8AnjLapvBKbd9QZWZpA8/+mOvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdkycykB7DdZ/5TmpdCM8Ij0KMR2LHDs8nmH9tVVmY0=;
 b=CpFqbXT/ZMNNTTrivxrEN7hJxY8VdgsHkBiuQT7wwAp2G56HOFXfg/zkCjT4anMn8ZZCnE3NHB9+jO1B3ez8bsaIKWAuYqYFd9gfaqDAzaoXNAOpk9Y85L728kWwa+OMW1UOdCRSjT7wKpA7eikgG9xI/KsqKXtjenXV+kesFnbUloooZx+w9ouQPvk9acpBfftuUmQ5r/kSSBTQFsyKM45HN9wOcZwwxJ5d+HtTz9a3RTCAeO/RXVaBVXOtKt7z1Gr3LFK0ZMo/AH67rXjOO4oI6d9aqh+8wuoXTD3Qjnmb542Rq6WpeAFl+3OVBvz9qvCZheWonyCSj4VLovRnFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0033.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:29d::7)
 by KUXPR06MB8560.apcprd06.prod.outlook.com (2603:1096:d10:9f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 02:42:46 +0000
Received: from TY2PEPF0000AB83.apcprd03.prod.outlook.com
 (2603:1096:400:29d:cafe::2d) by TYCP286CA0033.outlook.office365.com
 (2603:1096:400:29d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.22 via Frontend Transport; Mon,
 11 May 2026 02:42:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB83.mail.protection.outlook.com (10.167.253.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 02:42:46 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 20F104126F91;
	Mon, 11 May 2026 10:42:45 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	pawell@cadence.com,
	rogerq@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH 0/4] Add CIX Sky1 Cadence USB3 support
Date: Mon, 11 May 2026 10:42:40 +0800
Message-ID: <20260511024244.981941-1-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB83:EE_|KUXPR06MB8560:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ce54aed2-5cfe-4a67-cda1-08deaf06fbcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|7416014|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: O9myw0dNZoK6py+f/3vHDNKSdV/EdtACEk5SmpgNJ4MvJdulF0c9KbnsfehZ29mtZBK32XixxGxUQ7qshJ1lD1/+/NE37lqc7lVXMVfMNkrPOqVEb8aJ1tjbkUvF3LYiLKypRB3/JFxU7eteDJPwqT1gtz688rkwZ6E4gFi+nDoo4RKV1j9xBQfS4ZOJ9eqiJCUjFbzWw6RbhXsZys7XOBK9haka9x/9UAabMCoG++m0OcJFLuMpO1qHh341/W2iMu7xVZHyDwPutTQN9Ja0XVjr1O1l6IcRaQJqvpQfOuAbNr3UMRzperwEkj7oKLvY9GnBWit31Xcaw3qPPppqe1YGxzqNT1EVgOA5lzaDgGBohofMycUynZ094wdWUJja0Uq2mc0gB5Ovi/mKhT5kLElNDXIdKQKxC+nuYCWNV8PFLmfJYMcRwBC66TIxi3q1976pxabQhJDxy9zwgM4yAznabfD0M5JpjUWRFM5B/Smkij7NTwlKg4Vu4BXST3IOIR4b2YyvgLl7TuDQbrOylTqvkmxbAOa8yi9iohNKeFKw4Sqnlmfwr5gbuFLrTvK31of7Wj2E8FBt3CyZuDjYp9DEPRN07cQubqGbVG690Dm/5IixzLcFl2Gigge9uMDxvgct7n5AuBHA0aPWQZ+xmp30S0RRMBx4VZu4+UNsuCWjgdCO6mFY+eL2D0xuCaCg
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iQ8bU8Z9zTH5y65uIL56mlymib9LpzmG+FaLjU1Z4CNuFzA8J2bYgtX8RJdUfpeB/VML3bp8Yt3RYxQ+374Q6opaG9gfBmmcWNVQe1k6/g0kqsPcE1A3EwGbJg5env8x1M2/blT/QVNnGp/HfQpMCO9MuhbxTMXzyk8YNbcBl705eoQ06/gynMhs4dwDjkoPrMSEJiKfm6WyTulgMiQgjuRvwD7N5EGqwqyj+FNxERtWcdZR6uK5PjHoi+prQq1prkpceRvd8hbwR6a3VeQp1EuX2eOLtDbdqz8NSmq6fMiI62F4fFJJHUB9Wk7FTHOji6G9Vlw1lGziNIEH7Tfb864E9Dhj5J6hjE6Nlxat3bAC95Ky3kSs+9Bv6UuM0s5bT8nECMF2ETAay8NYN6XXs2mdBwWtqcZiEArSkrSuamqLmM7KtdW/fIZR8euLq86g
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 02:42:46.0016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce54aed2-5cfe-4a67-cda1-08deaf06fbcd
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB83.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8560
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_194304_327565_69D05846 
X-CRM114-Status: GOOD (  10.51  )
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

This series adds library support for cdns3 platform driver as well as the
first user CIX Sky1 USB3. It is the follow-up of Arnd's suggestion [1] for
helping cdns3 module dependencies and new developers working on it.
The final two patches document the Sky1 binding and describe the USB4/USB5
controller instances in the Sky1 device tree and enable them on the Radxa
Orion O6 board.

[1] https://lore.kernel.org/linux-usb/cb70271c-3ddb-422c-bf24-1cf019473f7e@app.fastmail.com/T/#mf61131099335cdfb6b4264e90b0d3de10cc4abac

Peter Chen (4):
  usb: cdns3: plat: Expose platform core driver as library
  usb: cdns3: sky1: Add cdnsp-sky1 glue driver
  dt-bindings: usb: add CIX Sky1 Cadence USB3 controller
  arm64: dts: cix: add Sky1 USB4 and USB5 controllers

 .../bindings/usb/cix,sky1-cdns3.yaml          | 151 +++++++++++
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  30 +++
 arch/arm64/boot/dts/cix/sky1.dtsi             |  68 +++++
 drivers/usb/cdns3/Kconfig                     |  13 +
 drivers/usb/cdns3/Makefile                    |   1 +
 drivers/usb/cdns3/cdns3-plat.c                | 138 ++++++----
 drivers/usb/cdns3/cdnsp-sky1.c                | 252 ++++++++++++++++++
 drivers/usb/cdns3/glue.h                      |  51 ++++
 8 files changed, 659 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/cix,sky1-cdns3.yaml
 create mode 100644 drivers/usb/cdns3/cdnsp-sky1.c
 create mode 100644 drivers/usb/cdns3/glue.h

-- 
2.50.1


