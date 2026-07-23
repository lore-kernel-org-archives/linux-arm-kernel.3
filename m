Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E87AC531CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 13:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nU3YM/BXNkpa6X8NBlT3MYByrBCoqp2orspy7P608Qk=; b=EgnqqPsDZHbwc7hsG1V+jL2Qg5
	2PP6uN/eff2RHZIkCQfd9U+AmOWC8OPfWiHl+eTqdWk0ivMAN/jErtDnNQ22eAJJVDqciyeclKKXF
	Fu0JdKfuURqSO+iW9jW1wLqjWPVshHERgfgfdOcfDKzmXNolOpdC0UYh2J8PN3owL8r6YAU24rfKl
	ONn/xIJjGMxOjtiNL0hBwaTnNvUqz2E6ArRReIpAolai00hfrJALzSXHrIHaXJyta6khC8SSQKR59
	xewj2JJTznKmD+kSD86M2so+4RzAxS83broNQAi84cbJphsUvp/mrcOLY0Ojyy0SXse5sfobqbpz+
	8EBkSGnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsiI-0000000EFpO-0rgE;
	Thu, 23 Jul 2026 12:39:46 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsiC-0000000EFmQ-0P4w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 12:39:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMQ0MZzYQod30PUe0F+UKg7vlmdUW7s19sx32JU/XNXXHQTS9qEBMuPgK7WwaiOY/aCZ+NOzv43wbrJgp8c5Qmc8azD7LexKyKNIxxiICj4ywSqBEtBJ1BMIPlh0Wrta+wvH7x0kxTN5VD8kXQ+aztItzFaGTmEPMpgr8ZSY/S40rCqbtyw/rsn0sPGc/IqeKTebcJ3dr8c8YieT9GMKUEKMqGcZ06ybChbcoo6yZZakFmTZDyAXCN/qyQg7yT3Y8AzjXD3rhNEjCWERxY1nL/lnH81To6xyOQ5iq77nOu+WwhfEwSuGLk6TwyhyRT1/C5YAp1eBuE2ioYzFwWTCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nU3YM/BXNkpa6X8NBlT3MYByrBCoqp2orspy7P608Qk=;
 b=th6rIBmTYsSakhJ4D28AOQMQ1VjZMVbs+6KMfQy+RMnZR8YvGSmyk7Iq20mWKBClnJOZyfRUNfAUmSO7EWADooYNHfT0dw7VmLruGO+cYimhimLG5ZzpBl4MZGln/2fmMkOY7FU+KEkm64kvam67ZkYmnNy7wUGzVSl5GxLwx0xcRpd9LjNRZYQv0j0KSFRD96VV7l141BiDNOV1HRrJ70Z4QtLyQ1Fvx4m+xfHngF11I/hHA1diLODziCnnkDMwzaxcfaasXBwwW1IHX3CTI4S4KFeUXlygMzKTruukXonR18FqsZo08a/BrYZ76dEGdvrRm7n6D/6AxXh7cjrYfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nU3YM/BXNkpa6X8NBlT3MYByrBCoqp2orspy7P608Qk=;
 b=DI7Vd00zkpzvFknjB12frCF4za6JY47sPEWMm7O9PLuT/NmEWUIFmMXcuf4FR/CTUKevlgPX9oIXtoIWePvaaVL2S5qV44CDPZp9uM5SIhd3QvIxpM4ttkZJbbakAutVOQL3QpJnc2ttuvxxx4kEEML6xX4ETE2sJKA06vjw/q8=
Received: from DS7P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::7) by
 MW4PR12MB7484.namprd12.prod.outlook.com (2603:10b6:303:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 12:39:30 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:8:223:cafe::7e) by DS7P220CA0013.outlook.office365.com
 (2603:10b6:8:223::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 12:39:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 12:39:29 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 07:39:28 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 07:39:27 -0500
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 23 Jul 2026 07:39:20 -0500
From: Suraj Gupta <suraj.gupta2@amd.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Michal Simek <michal.simek@amd.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>, Russell King <linux@armlinux.org.uk>
CC: Shyam Pandey <radhey.shyam.pandey@xilinx.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<harini.katakam@amd.com>
Subject: [PATCH net-next 5/7] net: xilinx: axienet: Make axienet_rmon_ranges non-static for reuse
Date: Thu, 23 Jul 2026 18:08:36 +0530
Message-ID: <20260723123838.125145-6-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260723123838.125145-1-suraj.gupta2@amd.com>
References: <20260723123838.125145-1-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|MW4PR12MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: 315555d5-2bab-43ed-e35d-08dee8b77041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|7416014|56012099006|10067099003|921020|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 7So+C9EbPwW+BvjDlsJknY92/q1i0BepgFhmNLRDZOup5T2Ym3b/WtJ60OCCCRT2H7fzpY6wDN5m5vXyctb/wsfkLqXGmQCh+/DXlm997n6GQC3BWFXeaMumM8ExUU/ak0RPF9rblcKujV9RPTF7BiAR3wIsHAPONA6XdBnxRDPC5pnLam/jSs6B0Gz42ro5xOshyjCidol9lPED7dFrvYFGjp3B7LBOMB6HMoH+gl3t8u82Wa6juoInpdFwSUw0J+E9d2IauLSMM8U09Pr7tdnP84CvfaucCxkqnImH8PF4T0u2DU7HzhzsqCIXXsslKl2d3jd4O65e1ZG8N8Ls2fAc8TuO/JlivLsy2W3RhwAjb01g3XWnkZhZNtafGH7KFlj5sRfKhP91zgpKLHEzbPpp7tpmraQskX5zZ5zQmEJdVsnfKXggdi+GsaOT/ysQBSYj3FKD4vgTvJndyr406TRcMxsCxhiMfv+KASVXDfsXO27GhtoZwo0pvyppqJaSDh9mkQ6ZUdbeKCMvp5eLwfwY9tkA1WF4DYOmLc1Ey8gvzQkMXSO+qD+5+kTmDqsE4F/qZ96+7MN/xaNSkXA2hByNyxDdYDfbV3UQTS2Jefk21pnDJJAoT+NGPtl4HWoIp1mUPlvKOIwwH+2h6Xd/6Vwoa+SH6w3VAqO+AdZtKhimRHcxf5gi8RSAGAraApihzi530PdfeSoXAwZtc60JOAZ7QvPdNHjS7vMuy3Rq4Myn+g4rFtr+/XNvb0MNl6jH
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(7416014)(56012099006)(10067099003)(921020)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZbCFsvue+5nztQN99Sfy+gjKT+QOLQcJ8YQqFi4v6lk8phMgc5fnFojzun9orIeeh/7Q8BGF4dH0UvKaf0VpU1uyj9z88jCdDV3rok0GzY9zGyF+03+SahDvNhG0TbUdFXkg4EAzL/N43pLX7sNtJ9STjkOoKs8agUYcTWjDeI4ZKKKCb8mjx8i9HAv5sJDD7ES4kRsrT1lJwuRwptgctKzsdORSFxRagxVPO053C3gLgK3mbp46MopJLVX/W0/U7/lKmIqRoJZFAXEXEA/IF/An7NR1ktgS9QvyW6qTEWZlbdALOIVlO67w6JnbPtGjae/gpFY0kTfO0dDFoXObHpjSCZX4rJJhl1aGFTAWQBD+VLLtmhx/62J5Z1ktPzh1GudP4tEoQzEjVioSw2rvCtliWMtDLNM9LG4XtV1GMFl3IzxAaTn94thJPlosa6Th
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 12:39:29.2285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 315555d5-2bab-43ed-e35d-08dee8b77041
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7484
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_053940_137758_AFECB62A 
X-CRM114-Status: GOOD (  13.81  )
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

The RMON histogram range table axienet_rmon_ranges[] is MAC-agnostic.
Make it non-static and declare it in the shared xilinx_axienet.h so the
upcoming XXV RMON callback can reuse the same table instead of
duplicating it. Include <linux/ethtool.h> for the range element type.

No functional change intended.

Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet.h      | 4 ++++
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
index 295a1b835165..a1d15b4797ce 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
@@ -10,6 +10,7 @@
 #define XILINX_AXIENET_H
 
 #include <linux/dim.h>
+#include <linux/ethtool.h>
 #include <linux/netdevice.h>
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
@@ -802,4 +803,7 @@ static inline void axienet_dma_out_addr(struct axienet_local *lp, off_t reg,
 int axienet_mdio_setup(struct axienet_local *lp);
 void axienet_mdio_teardown(struct axienet_local *lp);
 
+/* RMON histogram ranges shared by all MAC types */
+extern const struct ethtool_rmon_hist_range axienet_rmon_ranges[];
+
 #endif /* XILINX_AXI_ENET_H */
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 5bffa5b9d0b4..19fe2fd81f3a 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2498,7 +2498,7 @@ axienet_ethtool_get_eth_ctrl_stats(struct net_device *dev,
 	} while (read_seqcount_retry(&lp->hw_stats_seqcount, start));
 }
 
-static const struct ethtool_rmon_hist_range axienet_rmon_ranges[] = {
+const struct ethtool_rmon_hist_range axienet_rmon_ranges[] = {
 	{   64,    64 },
 	{   65,   127 },
 	{  128,   255 },
-- 
2.25.1


