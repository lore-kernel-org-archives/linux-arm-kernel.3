Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D95C88E46
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 23:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvZnDQUdwN5MuEEqCw7h1pu7ZSBxTS+mWYEFcTJlPKs=; b=mKQQurSQkH1bn2Kwak2nIukH9K
	6TxIPu6JGdA80ooxPmWzofUmD+IOjLpeBkhtEUEfBc0en7SIt0PG5vAR6U9EUsCbGwgP/hNPhrvZD
	fMGpYnKWx8b9xDV8nt7IVjdnY5G+4HLZjhvCcsB421FnDImQYjz4jKJBjBHzK53dh+2VtmKdKSvLm
	njJBk/2hBje5+JexuLKqy1cYBHMfTnqhH9T673ltaGSbAmhWl7/zSC6i9AlManwCyeX5yaNGaZtM0
	yPg0jwQl3UknfWRp+gZOzCIyzwknRznGV57PFvwxRRpJs1g+2C/qDNRgbpLC2Z3y3T3rC8W8fs+O/
	DU6nBbEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4o27-0000000FWcg-21cd;
	Thu, 10 Sep 2026 23:18:19 +0000
Received: from mail-centralusazon11010017.outbound.protection.outlook.com ([52.101.61.17] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4o1s-0000000FWRd-47JE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 23:18:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRBgHhFvr3gHrU02ojAqwWSfhB3vOjy2k3b4lFqIkonFFL57ebl7kswHGFj5PqjxCRs0knvj2yG40RoG6muroNipTZ22LYTJ48cKHM5Qeh07DMQ7xG/3hWLiyZtGaxNSNqDAzWwTvFN9QOKfK1s7LI3lYT8p80x5dNAAXLJUrhWILrPxDBEplF8TwHYMs4nVAA/C1hvPhGIRURlRZJs11/9AHwgFs6i6cL66Am9m+8wN4CGa0eZCxjyr8JPoc17gUY6pc+7mwYxaHjdXUSGrqIhqDzXVnkxkvBEUKsi2QK0RAJd784KobyPZTn4KXJr8Pxt1+GDlaxV3WPWhnp2tYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvZnDQUdwN5MuEEqCw7h1pu7ZSBxTS+mWYEFcTJlPKs=;
 b=iSVyOoXnU2EUj5hmBXyDjvFiSsHSgESt9evVjD98Rx3n+rdz35e0cGSnGBmb16FnFuRLwzW3TTUls/5MpiysmEgDJkp+pCtu+Wn4QieCRTvevOq9NohdzScmGJH1m33S3SaJJGkrG72FT8w0FpJFCw2DUrKxFnWMdZKe4K2zkGOxJGVwXeTwVNp3gN2XEjDJyqcZqbdXt4C4DCF6rqriM0+jZxMLkVWcSz4foD0ou7er5hAN8utC9OWiS3ghnSu/ohJyA2F+4ahQXYV78mg27VEKFGeAIUEsqgm12MGysG4yt7nOY81Qq9md+IILj+uk4H+rSk4l0qjRtGQpU2o8hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvZnDQUdwN5MuEEqCw7h1pu7ZSBxTS+mWYEFcTJlPKs=;
 b=VEOEYK/tLCHgXTImFaot0cndj0f+XU/0PZoUiZXhi0Quc0Yl6V0K9lney3E/5WQdUHoDFwtsqx0K0FBlWRw11R6pPFlhL2IaHIPbs5LQzhpzl1R/WIE44XH4hhwm/tqtkgntSA4P+4QUfKU359MutXIBZgLEQUYZv4qZIbLRYQtnFxalXOPVGxghJv+2QnQ0M+pUZDdR2v3txaDWW6XGsTjybSQwu1KSlE30na0Z1N1SiXAGTAUrmHs8rN9jTd2I1wlT+4SqVjZTsIyRKQJe9Wzr+rjVcUTQeJNcywdUJz61gACZ/xxHsn+DHH9/R8MQR5c5oE4y1lZCMlZ+jxG/Wg==
Received: from SJ0PR03CA0355.namprd03.prod.outlook.com (2603:10b6:a03:39c::30)
 by SA0PR12MB4480.namprd12.prod.outlook.com (2603:10b6:806:99::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 23:17:59 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:39c:cafe::7b) by SJ0PR03CA0355.outlook.office365.com
 (2603:10b6:a03:39c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 23:17:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 23:17:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 16:17:39 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 16:17:39 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Thu, 10 Sep 2026 16:17:37 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>, "Jonathan
 Cameron" <jonathan.cameron@oss.qualcomm.com>
CC: <joro@8bytes.org>, <bhelgaas@google.com>, <praan@google.com>,
	<kevin.tian@intel.com>, <kees@kernel.org>, <smostafa@google.com>,
	<baolu.lu@linux.intel.com>, Jean-Philippe Brucker <jpb@kernel.org>, "Eric
 Auger" <eric.auger@redhat.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <skaestle@nvidia.com>, <mmarrid@nvidia.com>,
	<skolothumtho@nvidia.com>, <bbiber@nvidia.com>, <harsha.v@oss.qualcomm.com>
Subject: [PATCH v4 14/15] PCI/ATS: Export pci_enable_pri() and pci_reset_pri()
Date: Thu, 10 Sep 2026 16:17:06 -0700
Message-ID: <49ce62ed61bd2c0626bde44aca33c515bc8acaeb.1789081084.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789081084.git.nicolinc@nvidia.com>
References: <cover.1789081084.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|SA0PR12MB4480:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb618f3-df6f-4128-f11b-08df0f91c08b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|1800799024|376014|23010399003|82310400026|56012099006|11063799006|10067099003|13003099007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 9dq+exm2W1yhjwx70Hp9G9iyvR8OtwQInD5GDA89Ok5xYMZjqTi/6VD/85v7aobiP94IyM5P9TBQq+/IVLhhjfHvaLosFc9Hnw8ZmHUJxf1inyIB3rB3tyn0SW5AOLy3D7y3Fisu/+zs1zgAVcVBh7Rq8U0ccR8ZKuLGuFzBmq9/kqhE/hpc0LoRRvME1OsRhOSCD6drvS5bXtr9jaQ1OIm4AxEphDI6Q3i8C7y4rsmaCGwZOs+lowGFvTomVhE5WhziFoFcMITaobRyJ0lrbMtatVPEuJSzTcBzH9aHZmblXA07MABRB8XJQdVylC7jsDgm5+j8Gmd5uKA84CZ4e6oA3KaIpy+8Dcb0+sZtKnGNIhjAj188dfiNjvPVDIU2q0+b7adrq8YFqGfUN2b/ma9M6N8aJP1hdd7iXpx+thi+2p+c4FLJO5JUFzrKMoLoFcg7koBoGaVwfWzR3WJ5p2zlv6QcWGFj4j5XHQXxs/M27yS5+7Kw81N+HgCALXnWLCEFBLrg9UQIYgNbGVBV8mhaOMKvtPu9WYP5/HNzTgnL9srPoKH4mRjEUpSM2GPoLkgS0vYWFF/9xDm0jBca2yS59ObMiKwGS5QwWLElLjHA4aKEzqJ/WOLFzSRV+8bT93xHCIlzaqdRsQ2nWcPmWXzeJhTBscFyxxq3yySSSF5+PG4qv41HcWgJSeqt4yRT3YzNuPjrQar73OYuzUo0Mw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(1800799024)(376014)(23010399003)(82310400026)(56012099006)(11063799006)(10067099003)(13003099007)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9QZPTQ1t4lYRlKvTLpgJPyjUxtAFcWs/SkMfk6+L17Y4wHutdAw++fZI9e9b1BwaCOBNqRiC9JNWC/9EW68GhTwGvfHl6p9KAdIZ3LxwwiUypLtLozAfcIyo6fVdPD36mnWH4t5o+74/Qyoox2zNrNiBjbcChJUdRM9JJr5YFNn/GVQQ2lA2G7Nix+v2RbPh0Ici2TDy60utHVUHxEPEzU/beEjxxMdkDKOR3Mr8/PWFJixcqHfPlLSD95iHWeUXs2sSNIUOsl6JjTbye03GYsBdDjuyFxDg95k94LX1eKVEOcNTo1MI1Uv6UHzQommE2NR5jfqFcvmMgrt0ufTca1xIDCGZ3H0cZeIRuV0axMG9h24mUzyE/SlZP1E708zMHq/q3TWDTS9Cfle4liJI0N57DmO8YPWinZn5t0q6GNEi27W8tOPeXTIQaJkab+qW
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 23:17:58.4588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb618f3-df6f-4128-f11b-08df0f91c08b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4480
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_161806_746681_59E4D18C 
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Export pci_enable_pri() and pci_reset_pri() so the SMMUv3 driver, which is
tristate, can use them from its probe path when built as a module.

Link: https://lore.kernel.org/iommu/20201112125519.3987595-9-jean-philippe@linaro.org/
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
[nicolinc: drop stale or already-exported APIs]
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 drivers/pci/ats.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
index 9cb23780093dd..b6de3c858d390 100644
--- a/drivers/pci/ats.c
+++ b/drivers/pci/ats.c
@@ -320,6 +320,7 @@ int pci_enable_pri(struct pci_dev *pdev, u32 reqs)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(pci_enable_pri);
 
 /**
  * pci_disable_pri - Disable PRI capability
@@ -399,6 +400,7 @@ int pci_reset_pri(struct pci_dev *pdev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(pci_reset_pri);
 
 /**
  * pci_prg_resp_pasid_required - Return PRG Response PASID Required bit
-- 
2.43.0


