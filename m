Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FCBF54AC5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 14:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HseiwFcXUuH+zdxl9h2HDJ4Lw7T7cj04bEeA+eVv7M8=; b=fMd508mqMAfdjQSmag/VKD8dvB
	cVb0aH7ZoVVg+zIPC3n648mhV0gdygHaTVfu7u5AmoV+Ak7qSMwWvbiQ4qBaEeRzRwc/bcYny1CK1
	uiZVZM6m2lBbPbBCJyW9rtsBRfbZO0EHZTwjunmclqliEsqOq8mRR0bh81snY3zArrKLF/LSzryeC
	6NgSHQa4SHTrd2eo+Y9V8qSjTAWEDgdcaXEveQTBKhy3Jb6w0L96V1eAkWT7b4Wq1eDVH9Sta0OoW
	XuQ2AauwxA+qWCaAJO6ksjMXapP2eN4MYny7q1jYFuBrJ9kTmmRkOO3ROK3W83z1HNx0gjiBonz4h
	BaU1hg0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5396-00000001gry-0gir;
	Tue, 24 Mar 2026 14:54:16 +0000
Received: from mail-westcentralusazon11013070.outbound.protection.outlook.com ([40.93.201.70] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5394-00000001grA-0LGB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 14:54:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCe5v2YfjENGZeO7lRYBYTvm9pUFwvL8QPE6bcBmcwo4IgE8QDzQvfBfXb7ryChL96d1H/6/ehZMMpg2hpzh+WUvgOzJis15QW1BeQQPKZdt4Q47VHOfu5ym2tlFf/Q2hD8qGHReUJPOy5OLVaF8G4zYarIMkxRFgLxT0sBEpGB/mH2E710FuCnmcFtTyZOLJ64TmDO7IKNMRhFnTNf/aQO+Z0lEK7KH+XZzUgU3hauwbQR1tXE30sl1G+uNMwdIbKPywz/JRxwGAcWi+aF3CgGbd2+GttcOahSB6ap2jaSj6m75YdtcTxR2zCnMRepuD6CKCFJWhKdrolCUoHiPdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HseiwFcXUuH+zdxl9h2HDJ4Lw7T7cj04bEeA+eVv7M8=;
 b=x6WLS+Sh9R4Aew1NLeR1T2s9abSy2Ieydq/3V4t52U7ZX6DqR8hdGV/ntKk786GA/6NgGzeFSLOXUv8lfepij2baOVEv7nnSUpGWz9m19dwZ5LN+glTzUWzEF5RRbVEnn4/bwKk0ISKyENnarZTaL+UskXNvL/ca5NuoxdUotlNU6kegPd4K4EH6g+EEi1sMTEZjDUnvXeHRydvN5UuO5M4MyGl2oLWkQoKDjqFokml2ChaT7q6aUT29I2PUrBZIrTD8sKTrwAIF4SQ2aK3a4ZiYq1J8si4DuTpmC0UfBiViEOP2SFCP0TMcK82KUglk1zq0p5Wka2stn9ULJ8zHGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HseiwFcXUuH+zdxl9h2HDJ4Lw7T7cj04bEeA+eVv7M8=;
 b=sChOW5457ZlSZME7tS/9PVcYn+4mA4Gr+PrbQXwCp/QjVAZOfwa7E6sypn1IoVgRp1lwX5Y1Cyx6um/Ka+MV3ZENRhZAz355a7QP/qOvqMHVw2OrDLghRM8qp+6Js7DU+Ke6J9p52FjpXii4XBZO8413LVnFDnEVZmHg5WEPptU=
Received: from BYAPR06CA0063.namprd06.prod.outlook.com (2603:10b6:a03:14b::40)
 by BL4PR12MB9535.namprd12.prod.outlook.com (2603:10b6:208:591::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 24 Mar
 2026 14:53:59 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:14b:cafe::b4) by BYAPR06CA0063.outlook.office365.com
 (2603:10b6:a03:14b::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 14:53:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 14:53:58 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 24 Mar
 2026 09:53:57 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Mar
 2026 09:53:57 -0500
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 24 Mar 2026 09:53:53 -0500
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <michal.simek@amd.com>,
	<sean.anderson@linux.dev>, <radhey.shyam.pandey@amd.com>, <horms@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <harini.katakam@amd.com>
Subject: [PATCH net 0/2] Correct BD length masks and BQL accounting for multi-BD TX packets
Date: Tue, 24 Mar 2026 20:23:50 +0530
Message-ID: <20260324145353.1899248-1-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: suraj.gupta2@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|BL4PR12MB9535:EE_
X-MS-Office365-Filtering-Correlation-Id: d1c30055-e75a-475c-0f44-08de89b52db3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: DlkvvE938R+9PvbZrjr9NYKHQKF3pRZRd/0S/fv0RexiIkleUulANfc+hVC6xdnovHihhPP0RHwpVYYRDcazC8L5suGHic3ph0cEZX0TscXe2+dUEhTWuYnuZinJkN/TBngKpShQgwYQ0K1rjG3qoRBn1OI+w2nxWhLItjE9QJ8/KuA3cA4bfblS5uiRNkdCo4j612BFxW3t38fZIR4XEg61Y0yP+KGXGJz3k6qzrZW23OkBOAkQGiAELZzqPNEagu4axFqRcyHxfUIYknMwf+/dNi9iPgK9Sl6ytBs596z5hyJoHRGNIBUGaVeQNdIOblPXqNP8+ErIjJlenoBqdzhY0jw0dT8RNpJCGSyVAtkQVhBPt/R6Z4DCidq/T9t2pJzLWuFLMesZeBFsDplY4a0MUoo1s6c9LZBMBR6RsrxxsCU3t19rNKN5fRu7+hZWlj+SzaAmIFxwC86PUndbE/t32Cu+fj4HJo+hyBjWFfdA5B0fgenp8vb50atLRILLKgPfEGVt7/uPSESiUAI1ObVAXMZSww2eLvslV33EZvpB/IA1Oy3z5hIXsmCkdOUPSGBQfdTBunkcUvo68nhM5y68y48Xssz1wQsN36X1KWj/Sa7LmF+0t4AfP3WLPd8P+bbsG9HVc45enAYM6gFyzX2IhOVrcdrz3YAJk196cV32MuFp4Iswyigodcx6UyDug7i0f+XzTKHEgJzGj4i8Lewe6UXp1BtJoX1Dhooccqf9LN73kvZGH5uFunwVrRNez5lErx/EbAvAgASgHevzUw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yowphVweLle0/qNP+gggGQCe4kNB7q/A66ZsbqUt470H5BH3n5cCKD0hEpqC5m6lalI0BF0k8dPmGH3LmiZ9Tely6Eh9rUraXeV6Uz4JKTSyufMJx4qnwtlf95n9RNqNn3u9Pk57lfdF6d84SwLZeMxl2/Mbyjne+4oU6Lpuu61U2PlPMZ12lq+Tb/BPE90pdeSD+gBUvldZlTDg5KU+OY2309BEMrEIeK9zfHNkCd/CxKe60INJuHxrmfqWdKf8gTKhuWXV74lPgEzYOD8ZyHYmXBJU8Q55gLoQ7xQBc+uAU/AtnVkOpQPAYAgOlLmhk02qGMoDemkpgb835rHcCVgaVm8v7u8aK0xwcYRhkoMK0UmaTFRop4tMe7praDNvlU95vzm6zB307cEMcafgj2mLcMNuzjcGct+ngG4FmQtb00BbPoS+ImCjtu+Vi70r
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:53:58.0638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c30055-e75a-475c-0f44-08de89b52db3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_075414_124339_4FF72699 
X-CRM114-Status: UNSURE (   8.08  )
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

This patch series fixes two issues in the Xilinx AXI Ethernet driver:
 1. Corrects the BD length masks to match the AXIDMA IP spec.
 2. Fixes BQL accounting for multi-BD TX packets.

Suraj Gupta (2):
  net: xilinx: axienet: Correct BD length masks to match AXIDMA IP spec
  net: xilinx: axienet: Fix BQL accounting for multi-BD TX packets

 drivers/net/ethernet/xilinx/xilinx_axienet.h  |  7 +++++--
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 20 +++++++++----------
 2 files changed, 15 insertions(+), 12 deletions(-)

-- 
2.49.1


