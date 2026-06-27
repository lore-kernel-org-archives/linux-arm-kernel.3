Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01A2C43327
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 15:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7VBkjv3AgkvA25fiPKUiroBi25Yp2FyWFjSqrvwiZN4=; b=kdHusY2fYmYpP90cqLMm4PLDrD
	MKvl0fpSYytt6LxHUP/ztJSeP7YYlpOWEW5SnvzNjeiPfaWDqvULYzSV7zFw7XRJSFg/EuwL2eMd8
	pNYFpZ3cEPK0YMapQUlgS7ZPfNe1MC6Jmm3Os9roGWhI6dXGzYuVr2vncyRRDI0QyUJ/zoRpFpvwP
	G0URAlZtQi11ba3VMtRqjc5KLaUKFi2Cn1wZqM4BBUbcMhK9GIHQjujxWjcrc7F45nUoeNYZgLnPr
	3md2KKccsj4qjzvm3OXvlVezPknFKpdBDB8VNx9T6LMeuZFMDPvH4XVYCdrsAB8lSSoZxKDGtV2tQ
	1vCzi4zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdVL0-0000000CcI9-46dc;
	Sat, 27 Jun 2026 15:52:59 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdVKu-0000000CcFJ-43iB;
	Sat, 27 Jun 2026 15:52:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EiNIyLm8xW3fomDVSGQU18K7YmWR+07kKNTLMIQMqX9u3SLU6FXqXjTAPrSN3wP2BxHx0OnsPFnijA/5rIz9jvzTHnEhejeBqYwKodiJAGXYtTVYYknBV0F5nULN+PpOxnevRMmpDmE+Vh87UMe4hF19qeHEJE/YSZ4plu3YoT4BUqKas/Yb9oeobtHVO2rRxAGqz6JBkhEfHDh71GrmjS/imkWZIz+E6lwKVVz02bmSzrJjXdg2ULKvuk0eQ0DcfRSO3lYJYvseFZWqgIE0d8AEK3KblJW4mZQpfuIs3zD+1sjRQCjB3AWThn49FanK9udwafnHxwj70I+T/eq9Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VBkjv3AgkvA25fiPKUiroBi25Yp2FyWFjSqrvwiZN4=;
 b=SFcMM5GoBpk49T/FR3JGZzDlA/4FIRNPiRuoLoKLtbYGvy4VYnt4gZ2bgIwxycLdnfF3r1IPscp6T8Juk/6ZjptEqhmPTZP4RFPLOHj0ZxfpCmw28BGEDY18AQv6h97IUB89tCvYosQjjBONpHbh+hD82BrR/7D+a4sEyNb0OIjU6N5f8dQpIA+RiQ4vvHowaePnN/Pz/OX68p9AaUYfj84hme44Q0kpe4CrZ0edeu05e48tdSbQleWYyjP6SRv0jz+JEOsMZhvqgs6vgzMbCH8bV3z+QqBLWEw08tGSydYfc1bIS75XAvUqzWjlB9YzwqKEs30T7Kv6tPjIiQNQRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VBkjv3AgkvA25fiPKUiroBi25Yp2FyWFjSqrvwiZN4=;
 b=K7VzXbK9V5prJsqt3mq4NvlowGH0mzC3iZnSVb9ZoWbfZwMWeN9nSR4TmmDmseutngMWqg+6cEl9Jrn3jve8g3b1B0ELOyNmYmpL0rGUq2/u+k+D3ary2m+L/rixDI6aHsiEZgqpQEU7NKvevPZlYTpqgmoahJVOJxaOeW4qeWM=
Received: from SA1P222CA0074.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::20)
 by PH7PR12MB7140.namprd12.prod.outlook.com (2603:10b6:510:200::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Sat, 27 Jun
 2026 15:52:40 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:2c1:cafe::43) by SA1P222CA0074.outlook.office365.com
 (2603:10b6:806:2c1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.18 via Frontend Transport; Sat,
 27 Jun 2026 15:52:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Sat, 27 Jun 2026 15:52:40 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sat, 27 Jun
 2026 10:52:40 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sat, 27 Jun
 2026 08:52:39 -0700
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sat, 27 Jun 2026 10:52:37 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <tomi.valkeinen@ideasonboard.com>, <vkoul@kernel.org>,
	<michal.simek@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [RESEND PATCH 0/3] phy: zynqmp: fix SERDES scrambler register handling and enable for USB
Date: Sat, 27 Jun 2026 21:22:26 +0530
Message-ID: <20260627155229.2791113-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|PH7PR12MB7140:EE_
X-MS-Office365-Filtering-Correlation-Id: af2ad796-0628-4fa7-75b3-08ded4641e67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|13003099007|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: O5koZEGcGAETFo74SaXkWft9bJfsxNkkLVNi9INhkRqLX0LxDIXbQtnHdxstx9wI9P9uKVLl5QBvISZZ/8aY6yqPKzkBxUkGCF4x7ezc8tB2RHFmqopNdEFN8Exj4Gyq3EczQY/tZSorcRicjznzfsz09XiSKve8oyX8taMAc6aO+i4FGMUfQgrm2qhFusWJmzJB7s75l7JwFiiWzFBh+fUJy4P/lZMMPYjyraglPJ2CJhcDlYsRZfBQD7oCRM7j5Gn6pmCWgWOFy7yvObf/fBKlxPwU/t17cgpBxo7MV0TX++qeipfs/LOJV9oXu+R0OqxmN6WWefUyEr/TAF2T4m9Vtisk10L2Vly21nRZ3emN07SI2SRD3dII5rhEn/0gbTL1Yc+9IMeH2tiX9k1mhERy8/JhXbtsNMmNXnGE3cb7eZtgaZFTcrFR3PQRzzOU2ZS43hLm8Eb5E7DNr5W1tNeeuScOKSVKx9ZauQx0yj7Cmt+iCQFugFTONG0GNI/z/+mb0Mz5Snt6mPCNHxcejPvdPgFausouJ1urgtPijaLA+RtIgdtrwvImTu29+Xxob7Q5hZkNaC5UaAJtKqbRl80KXLs5V0bYTI27qPhb/oPr35qvqMACy+eIKYySCILbGwJ8f37dCF4RUMHjlj8sqa7jV2aFtJYguNT4tP7rjERxDEEArvcOJR4WUOYZIJXFX58A1JyBK1JetCeXBLxYwQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(13003099007)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: C+9lzjn8ZqvqLe4wLO5nkwjvTph0bmwIFlTOHd8uSpAUh64w9MtIQM5ht9r653fE9F1DoGosim2jAVgebLryklll1GAQ0tqyTjfyPZVRkf8E3MxFegbppwocV/yj8vT8WqC6pisZh+/cT20drgnq6eVEcfNEAnNtmk+CYNMPyYFUdvH5dYAPrqSLGsHBoV3NGvWO05YRrePRAe7KbAyul+Vrz8SiZjike6FcDhKybuoJnabPdT0mvsUfQMfACYma9sycs0uiAz333CoPQTKdfQg0VGptCFSSbsXnOsixyuIAHPfqcvOmPGeBq+8XV1OkBgZl3c8ypbNB93ValiuqIBqSzVPAUpDK4PliPMUH05XL2c+M1h5nUoLy2asySB8fkNDYtMQJ3VPI1xSTJLBfjhG1I51tqKQV/VW+W0ZdnmKUUGiHTEe9j4HQB6q8ksBw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2026 15:52:40.4491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af2ad796-0628-4fa7-75b3-08ded4641e67
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_085253_006565_833A17FB 
X-CRM114-Status: UNSURE (   7.24  )
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

This series fixes three related issues in the ZynqMP SERDES PHY
scrambler/encoder bypass path:

1. The L0_TM_DISABLE_SCRAMBLE_ENCODER mask incorrectly included bit 2
   of L0_TX_DIG_61, which is a reserved read-only field. Correct the
   mask to (BIT(3) | GENMASK(1, 0)).

2. xpsgtr_bypass_scrambler_8b10b() used xpsgtr_write_phy() which
   performs a full register write, clobbering unrelated bits. Switch
   to xpsgtr_clr_set_phy() with clr=mask, set=mask to preserve other
   register fields.

3. USB Gen1 requires PHY-side scrambling and 8b/10b encoding as
   mandated by the USB 3.x specification. The driver was incorrectly
   bypassing these for USB, the same as SATA and SGMII where encoding
   is handled in the controller.

Issues reported by sashiko[1] are pre-existing issues and will
taken as separate followup series.

[1]: 
https://lore.kernel.org/all/20260512213513.852EEC2BCB0@smtp.kernel.org
https://lore.kernel.org/all/20260512223142.1AFC4C2BCB0@smtp.kernel.org

Nava kishore Manne (3):
  phy: zynqmp: fix L0_TM_DISABLE_SCRAMBLE_ENCODER mask
  phy: zynqmp: use read-modify-write for SERDES scrambler bypass
  phy: zynqmp: keep SERDES scrambler and 8b/10b enabled for USB

 drivers/phy/xilinx/phy-zynqmp.c | 37 ++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)


base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
-- 
2.43.0


