Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B43CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qxDo3HHzTovQhz6OrzPJHW7C4ZDzap2ESG/3oGegh3s=; b=NwHjAWwWKzDo0GgpSBnf12EG+H
	Wb4Qa0bbNLn65liecmRzqGmpiKrCsH2XviFGCGmk78mvB5XzhlbUdpWYuzk9Qo5Q+1vtuNPLcZD54
	9BIr+LXed+XkfW2zfc/dY7AyYSXL+vkcAxp5hMXp1By3c5YN9wUCIx14c9KAbD55U2kL2ivUPrerY
	ELEI8aO/KF54zIgeCFbY8AB9FsL4uQ0q2jn/zWWt7/LIBNwuvP2gFJLlT0Kr0FlZE9wxDyGev8CDB
	6olBtGoMUcyYLq24VmOR+q9tp12XG6niSmmsasQhNeTRJdu1oFio+BeRgOrdLcuflFvv69R7uCRMe
	nnJqv33Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBXE-000000083Oy-3vk0;
	Thu, 01 Oct 2026 07:48:56 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBXC-000000083Nx-0LOB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:48:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7FOOhmoeUCoYUjFhiLfvR2vIo6pxBfRGXHn335XbSLJhxnxl9UHUopgP8Ndu5918K9MZ7JUKq2z7iosAyp/crE90fi3QyTShuzqazU+WZ9FSU6BQMLLARF7KPnyD3JhHRfd5VzSTPS3fHMTPVJE6loytLGyQvBmM7ntP4ZWrOMUsoQXHB4lVnN8r1DDFzAOmmyRE9XMZKHPG+JekNVNNyd4+btaULSqvBA2EUul0A1bDSGd9OpKmY5FqC854izJWCA+11bJ1PI9+sVn5ebiy/A4ssaUXjXBPCxmk1iT42e6xNIwWYahUbvqV1qbv8yWVtCfwFV9kbkj/Xl8RRgppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxDo3HHzTovQhz6OrzPJHW7C4ZDzap2ESG/3oGegh3s=;
 b=HUrHjDKUFY6Y7fIq8RITWfVMhfacizKdaxJ29QtmaInw8ChtEw/22amGMCpoWBXWYEls9sAYaDHk9k7UMEqz5Rmua6yWUUrTY9z/NUZwMAO6YCdWNF+9Q32FPOiuZ37pD6ZoDIPpYBPPAI4U0Gfj9yyH51nkgqoK+S5VWs2/MLKeskym+z04n/tLOGkootM+I5LT3fAeTcu/uzwvTHu31iPWN0cEe0BEsSW85/+8ANdgDKoqAleCL7YN8CQBdxBt/CeEme1Y89OOskE5I21d45SHrDYvdqt4jBdnYjziTV9J3y7yM78zMbhhrmUCE6CqJJuNGOqJVqSdwnUZZH3QFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxDo3HHzTovQhz6OrzPJHW7C4ZDzap2ESG/3oGegh3s=;
 b=ej3Rjb9LgnKGM8rFC2b7AQ/UetGrmVqG8OMwDnwOhfdTwOIYTKd8sLHwpFBPrI2O3pvL8Xv5VNYShX4hgStFnppzSNCi96LbkKKoo2aPxPxCjIPnamZMVlKgDkuDtDkXbj9xyjaJ9RHFWw724kNi3VRkWu9bEIoVQd0YtAToqc8=
Received: from BN0PR04CA0059.namprd04.prod.outlook.com (2603:10b6:408:e8::34)
 by SJ0PR12MB7459.namprd12.prod.outlook.com (2603:10b6:a03:48d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 07:47:43 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:e8:cafe::58) by BN0PR04CA0059.outlook.office365.com
 (2603:10b6:408:e8::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 07:47:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Thu, 1 Oct 2026 07:47:43 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 02:47:42 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 02:47:41 -0500
Received: from xhdvineethc40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 1 Oct 2026 02:47:37 -0500
From: Vineeth Karumanchi <vineeth.karumanchi@amd.com>
To: <git@amd.com>, <netdev@vger.kernel.org>
CC: <vineeth.karumanchi@amd.com>, Andrew Lunn <andrew@lunn.ch>, "Heiner
 Kallweit" <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Michal
 Simek" <michal.simek@amd.com>, Florian Fainelli <f.fainelli@gmail.com>,
	Harini Katakam <harini.katakam@amd.com>, Kedareswara rao Appana
	<appanad@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH net 0/2] net: phy: xilinx-gmii2rgmii: Fix PHY data ownership and removal
Date: Thu, 1 Oct 2026 13:17:16 +0530
Message-ID: <20261001074718.3944521-1-vineeth.karumanchi@amd.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|SJ0PR12MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: 1af96b1a-7cbb-4efa-bf80-08df1f9046eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|36860700016|82310400026|1800799024|11063799006|56012099006|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: hJn8Kdq1Qa9WXwMuvKqdGIsrvTcmKzD4ARyGx4noQs9SN/jMguS3DhCWIOgrkapZYpaOhZkkiT9HSpPBVWy+Hm+qRwNW1RlbX57nXKLwgo2EHvpDzcXmS/CBgNMXu/XtU793zqRIisUUOU37AgPcfzUg1zb4KCDqdHQ3XRZN086Qy/YcQIxHovOLQyOFTapRKtiOhZFXEhpLLKm9et7TmZOY+hig/R13d65nTPXkQ0VHKOczkXIAxmatIaW6jslOoZE1qDPISp+GQ1pcNghDBQXnLm8f2Qrf+m50khPmUVn/EXjPPicYY6eKcGC1u5ViDpT/YBJtIxnv+R39f1OfLYj+XHLACyqwn0jE35N1G/d6Ah4BDLjk3aZwDpj5zfbFW04GSMvKD6euMmwvZ91kf8+EWU8M3dkpG/gu74nUR5TAp/uYDagdCCOsm9gANNUQEPXp87I1T479FBMiBHX6M6Yc4M7NGLzagt/j71l5Qmifq2em5kjgn1M1AArBN4Z+mHrTM9+cRDxLEZNu3KbLfdC5hVj83GuXvZwDX7uCoIxuPfRMpcYue7qaAWklFp2tYY239a4ZEcTfzTqczDnRq4mcxqII4QqWMxEZM7ydn23Q6bc/Uxb0lFtCw6jhX+LzQ+idECTlyJga813I62Zu0rHRtdVoHjIlpeHwBh+rhu2l8LEy2Wvmf3MKDXRH+0oYcCHyYrT1KVexJKi6z5glBQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(11063799006)(56012099006)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yUQ3r92BukRBaY+FQRC1PLyvlhcu1kf4nMAhq4lEhnatrhkXsUR8PCtj9WNTPFtS1rv17DDSli0s6xUWtrXg/M/N4tXGbufDomnhEZ5hD8Wu+YQe43GP8A47Cjs5kYuEgFDjkK/uiwBP4fVNe7uBNH2bmy3lc39u/qyKcMTNbLj52DkEs1Z1ks8eCJOOrwt43AzUcMKaENikhF6WcVIKJPrqAfII2pf/Vu82GSjORzbEjttoO+U3qAGjybee0+qGmU5u+O/j4AmeS1evN0zzoQTyIr0enmkqt1YSO6bRcwgQ0qOWaUa/FyKBrOpTmRGFBuP7SmFO/dc6ShHBvFyDat6oM3WEojwYbGetPyc55uA6aOTVroc/Yt94h5HOXK26RgKGUJGP5KRWvBGQ5US4c8giFpnRZ8JaTtNM8vovyOFFv2uwnrw6NLkjnwa2loRB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 07:47:43.5074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1af96b1a-7cbb-4efa-bf80-08df1f9046eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7459
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_004854_121253_6D37ACF5 
X-CRM114-Status: UNSURE (   9.05  )
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

The Xilinx GMII-to-RGMII converter copies the attached PHY driver and
replaces its read_status and set_loopback callbacks. This series addresses
two problems in that arrangement: overwriting driver data belonging to
the external PHY, and leaving phydev->drv pointing at freed converter
memory after converter removal.

Patch 1 retrieves the converter private data from its embedded phy_driver
using container_of_const(), preserving the external PHY's MDIO driver-data
field. It fixes the overwrite introduced by commit 168f7a161608 ("net: phy:
gmii2rgmii: Dont use priv field in phy device").

Patch 2 stores private data on the converter's own MDIO device and adds a
remove callback. It restores the original PHY driver under phydev->lock
and releases the reference acquired by of_phy_find_device(). This addresses
the stale pointer observed during PHY state-machine polling after
converter-only unbind. The missing removal cleanup dates back to commit
f411a6160bd4 ("net: phy: Add gmiitorgmii converter support"). Apply the
patches in order.

Vineeth Karumanchi (2):
  net: phy: xilinx-gmii2rgmii: Avoid overwriting PHY drvdata
  net: phy: xilinx-gmii2rgmii: Restore PHY driver on remove

 drivers/net/phy/xilinx_gmii2rgmii.c | 31 +++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)


base-commit: 7375d38364a9aa66fb31716bcefef38aecad75d8
-- 
2.43.0


