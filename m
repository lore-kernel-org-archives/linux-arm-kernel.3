Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C72FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 06:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExxAIxriZsOFM9rm1AoYIc69hkRrOPcl8FmRwSpubls=; b=2Pj7JeFk6kO6TT1IwknJO85dC+
	uAro87xsbbFKhJD+kuAy1cIP3eWXKLFa1kX2yZ6YsOdIBpIzE/Pb0HdYKF1zCPbCVmSm5qsE5EocH
	2MAFSieA9oTfVMOPWbPoxBOixWaXhOMwse7Jg/1lVpfh7oUjkHELGuxsfjNeLqO6bW4NxqXDYvtKZ
	AvLeCcbzFwaZU0mM6j9jXmEJEpZJP95g9IsD3ICA75p35KORR/HsQ+Zu66wggKMnVIF5QAFGK5Vm8
	W00vQ8xz5nU9JGJUXSKNfWoOCXfCowpeFs4788hl+/LTQ7dnQC3sUIRnfoDLTzJ8F7S/wOVrEeEKl
	GfgF7W6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIKd5-00000004k8I-12hU;
	Thu, 30 Apr 2026 06:12:07 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIKcy-00000004k7S-3m3r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 06:12:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJ69R5khFinhQqgOKTNwcYOUIs6hOJM5JjidnUqEYbcrjhM1fZOs9HamSa+jKKUZhSZh+NDywTrDT6xgGp1iMVrujd76ODPwCuG2P5GxK1LRwx4TTieWLJ2v//aKBGgdNSPw5/39ZrcsthYb7k4hQY7q6Ddp/lyJPLEsF1RFsutURtHxJ+RoFznBDEofmNVHtBXlRzs3tP2q5Qhbea7fUZV7ISsuXn4/JQfJqWhEr1RoNdD7XV2PG6Q2o+MXT/CAo8XQTAzSStzTWH9vH6Lp5ovPtny6YdaC1Xgq1DpKh0nfFoXEnMO0reIFKc6QbRzligxW2F7hM1mo2mjqu875Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExxAIxriZsOFM9rm1AoYIc69hkRrOPcl8FmRwSpubls=;
 b=bpK2emxosSYLYwCueG673UAU58xAe85X3lf5qNIpfttVZvsqpHaSuGPtlt/x31oITQCYtUps/j8EISK7v9sQPHWEh23ac16bQ0RP56B13wdMc9qjzsH3STxupLwFmtKN2rh8vlpsZAAOzLW/QqWFiDo0kXi7uzLBWXpA+fX0+rAFizc6H1VsLdFZXtxDKaVi8w6xmTneka23vBmzRl1pl5+9Nn6qpSIbguTwKRsMep4/Rrf9nFSywUDPbuC9AWCgWnE2KnMQ1E5/+Wu9VhOh9gApB9cZpznkDMo7UBo8kti5lisdkPfEm7/EItKQSgVi6r79CWlJ0gLZpcEdAwmW+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExxAIxriZsOFM9rm1AoYIc69hkRrOPcl8FmRwSpubls=;
 b=dM5xg/WiTZ/bEIPxZfCXzlr8u9KN5OnogEWii4HMSJoWTGSy52P5ItriHzYiGhaeVypBY4ExftoQNURngupzlN4bo498ANP2Eb02VZeEa4EKshvi3/o7XAObc4L5mxx+Go/mvZpHXBub+Nw6r48/vYlnsivZkuh8O/PCeQn49WE=
Received: from BN0PR04CA0173.namprd04.prod.outlook.com (2603:10b6:408:eb::28)
 by SJ5PPFCAF322559.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7cc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 06:11:57 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:eb:cafe::db) by BN0PR04CA0173.outlook.office365.com
 (2603:10b6:408:eb::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 06:11:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 06:11:55 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 01:11:54 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 01:11:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 30 Apr 2026 01:11:54 -0500
Received: from uda1253387.dhcp.ti.com (uda1253387.dhcp.ti.com [172.24.233.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63U6BodZ509786;
	Thu, 30 Apr 2026 01:11:51 -0500
From: Rahul Sharma <r-sharma3@ti.com>
To: <r-sharma3@ti.com>
CC: <Frank.Li@kernel.org>, <dmaengine@vger.kernel.org>, <kristo@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nm@ti.com>, <peter.ujfalusi@gmail.com>, <ssantosh@kernel.org>,
	<tglx@kernel.org>, <vkoul@kernel.org>
Subject: Re: [PATCH 0/2] Add runtime PM support to K3 UDMA and K3 INTA
Date: Thu, 30 Apr 2026 11:41:46 +0530
Message-ID: <20260430061146.349280-1-r-sharma3@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260429174904.4049243-1-r-sharma3@ti.com>
References: <20260429174904.4049243-1-r-sharma3@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|SJ5PPFCAF322559:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a9564f8-8cc6-4037-6013-08dea67f6189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: SmQgItcKzT+YKLgQA1NxvsZQTpMuXTkIK4U7wjyV67wceGm9NF+znC5Xz4qQ5uPgBDrQsdOiiwrGyjrN8gjxFQYQQ7aJLSUA+R8oP+weN836qLHKW5UJ3j9XDFolv0bmNmoepaY6Aahr/1Mgj9tMsMvf1K3poNOlJCWUBNqZATGL1xzSt1p17Ol2rXcAN5PwWFzH1hBSF8Xjo6vMkSHcyo9tnOy+zszb9z3AumV4DGpQou8EkOdwlOnP+TqruZkRZeNzyxal+EJGDddWaRON3LhwfV397LyG6k2YcCaCbgHy9rZLyEDY8Xi18jpoQorZXc3J+c9+IXS3k2qd0NBZCetl6ccwmibD9MgfkO+oN4bYIgwYZqIlBJcyZXNALARc+c2c5OQcuif1HrjDK8x0bfFQuuj83FY9why9alj6r4TwukymhM14ZWpgKHUCGQAU/WvCTnCdGNssMPvsmMUiGNLcq4aIGM3PV3bWkLW1O4ggbnbQeIUVJgjysxlD4G/EOiybtmoDD/+UXUH6VO7W2LjeILoa3mAiDV3gZmzoxCn3lEbnOsCSiBRZSM3t7i17k0Qmzku5WtWep7i+atMp6elydb3vLwSWgJTMgrNQwexrT+Mf1hdqE5LJKtAR6XGCkZunonnbTFrWMU4PNqcgOlmMYgAVZeMuVQq34TT9Cj5sLOxfh+YMSyYkEN7EimWSHeSmb3tQ63Yf1+Dn02rYByWOmOloyEoN591l5mynaOO1Oo5u0bsagrIqevVBI+Pwzw3TYvwrjun5eN8zxgVyBA==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wAdlv712NjCFXCM9sdzTe40OhZhpJYOV09yJHcwyJeF3OSyzbVIT/K3ACAIGgWu+V3OrNaR+gd3oKWgckF0J7MVo4PObnJ5bmtdBUydBTE0UDUf2L8Mn2sOl8ZZlb1oRy6ECzlIFriaN4aeF6yDUR2XG8mNoPJnDqISIsHahMRTwWhUiCKpM8tUFtxtRdWexLj8uVlpRimMrFgCNYo6EnOJ9lGe2jKyX0d6dCAiJr8JdfK4SHbOBx4Uxv3m6lrl2U0AK8b1neWYL5gjzHO6uCIqzIsWRwuWvSlprcpX8cI0thA6yOB9GhKyS1HAFFkmXHhktSIYz5rxd6bL2u7X5gcWqTiMQr4u9OwiGe4bEfm8YEntYOuvXZjCCm2Kp4yenqJp68UeSbY8zTdjZmZ88u8wCT2iaLutQuCVZ4mmjaUlcmYFdB5GsTVdauDV4Am63
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 06:11:55.9479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9564f8-8cc6-4037-6013-08dea67f6189
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFCAF322559
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_231201_117788_6D790967 
X-CRM114-Status: UNSURE (   5.29  )
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

Hi,

This patch series consists of 2 different subsystems of Linux. But
they work together in same subsystem of SoC that is K3 DMSS(Data Movement
Subsystem).

Both patches can be merged to their respective trees, with no
inter-dependency. They have been posted together for the ease of review.

BR,
Rahul


