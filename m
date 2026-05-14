Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBBFCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 16:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BaHCEaVR3rbn4h2Q4Xznk5aogu+104Y4m6f1awiSTs=; b=s9wpTKQr0iEpuZzyLS59HKnY5x
	RSuJlI5ageMAz2ZsvHkNRDIhpp2lx1zIMC74RaFDelyyw+lYUmiUxgW1tsSBGrTIkFKtxT2E2KsIU
	CiZa4Q9y8gg28cJkXjIs+HZqSuA82pGoZwOG7ZEGtoeAwErbroNrm6fF/id90PqGJSPFHyTN1pr8a
	+/nJI5k068+B3UnJPnqfhOA0rF8eKiqQVYCYlOSHauYugotCYX1ubx+an9pUkQoDfYvjFxcPx/9SA
	7P5pE1wXqv126ei1IcnGjvTQ2cGolIlfYfebwI9tef/eYiL4+mNbcF77lC5RpJKTHIue++7W929A3
	6Vxd6rsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYon-000000062RZ-1CMF;
	Thu, 14 May 2026 16:21:49 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYoj-000000062O4-184y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 16:21:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uvb9NkY09fgT1nkcNlBuHXRBJvfwRRQ3l4eFaQrUq2ReH2ukUzG5Zwk4+Q49/yvBHhChl8YdCacSrFff334hEfWZO2k6U7hV7RgobClYaR4BQG2szU5aD0f2lX6sBqgMN6P09682j1NZIfPCuIej/6yY5VQKpykSZmzfkgqfiVbAC+yyZQlbS92ZqNOkdAj0VGmQfo1TBfE5phqjOZiVT2SOW8RipOanwkJyNCZx9WXW2IlAjmgRMwkR65d+aSKRGaJ3XldkU2Rfvl9bfyTLdvOdO7O7OQhUIFbcbQs9l9NmAgDr/k3ZNrE1poE8gzLQpNcejTDNJu2kwnXlAMcG7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BaHCEaVR3rbn4h2Q4Xznk5aogu+104Y4m6f1awiSTs=;
 b=EFb8wbQ5P59gFM29Eq8NG0+YW0Idv4PKII1U11DytfunMj1LTaD7TRiNurZLphbgZ9U+wUqWSq3Infx0+LFkR1fS1LRMu4cEeQ+hs/nVTSL4pTfpWZg9vSt2COrNtCMM6b8CDLd7b2kBke5OUuicvH/Ofp6eWdohem2a3eEWg3nvPc/aglxF2ltoXExyiLhmFHj85HXTqjkeSN9rwE10ELhRtP/go9W5oECosVau7VYcuRNle3yVRRzBrbycsn++L2mdvndKvtJQFMtUz/9iiFdxz4lD5XllACSDd5iNVgN6YOajbPezOnPMbOEOvHRypuGX4mlIt01EcAcHqociig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BaHCEaVR3rbn4h2Q4Xznk5aogu+104Y4m6f1awiSTs=;
 b=SZCQnMRhp9qD9hCS/G1rPf8H9BKq9maDlXBPf/5VElYcN3FFSry/6UhdUCXk2Bn5cV4Hg0T/tlrJGSnNr0xgZ1p0PGoht+Z6L410wgUNirJO3J6vGzHllrWmzXqkbFX/WbEFLJRbz6/N1LYvG1Evqyg3QXn52K24he5bo+tAvSU=
Received: from BN0PR02CA0013.namprd02.prod.outlook.com (2603:10b6:408:e4::18)
 by IA1PR12MB8357.namprd12.prod.outlook.com (2603:10b6:208:3ff::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Thu, 14 May
 2026 16:21:35 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:e4:cafe::2e) by BN0PR02CA0013.outlook.office365.com
 (2603:10b6:408:e4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.19 via Frontend Transport; Thu, 14
 May 2026 16:21:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 16:21:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Thu, 14 May
 2026 11:21:34 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 May
 2026 11:21:34 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 14 May 2026 11:21:33 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<linux-remoteproc@vger.kernel.org>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<festevam@gmail.com>, <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
	<patrice.chotard@foss.st.com>, <mcoquelin.stm32@gmail.com>,
	<alexandre.torgue@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
	<daniel.baluta@nxp.com>, <tanmay.shah@amd.com>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v2 3/5] remoteproc: mark wc-ioremap carveouts as iomem
Date: Thu, 14 May 2026 09:21:27 -0700
Message-ID: <20260514162129.1504162-4-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514162129.1504162-1-ben.levinsky@amd.com>
References: <20260514162129.1504162-1-ben.levinsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ben.levinsky@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|IA1PR12MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: e7bb4dc7-704c-4839-c33c-08deb1d4de1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|18002099003|22082099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: 6CU6vVAhYR/rwrIzIXWTaN1j27XlOeq2JcaeIUphWKiWICmTu3we6c/eqQfyZ4N3JX6EKloHY/dgk7U7wooBITc1yHmk2Qdi/P5kcbicMWScJB7wEQPyoDLqyfqvyYkmySq10WIjQaBpsLGVGJXABIovPlhyuxWhhqm+YZHKT27NpkpqMn0GEHFRIiCyJPGOpgydAPHIM55KGa304yW/yi2gTKLdAD1SLPdPFaAYZAR9Cy2ZAJXsRI/ybAHmOtgrmYMRfqRLvaRBq634Lr1+fPxlW5rstjm0CHIUdVcOV++72JEkNKc1YxHhh604NYlJhOneFocA5YiT3ftG4a+fvlokFsiYoc3IiZ61rmTWBhKnwXAYWxww090iLhR6hnINpOv/9AkBVcjVXvs7BXrZlqp+YEQ343zZlq4G34cSZJs8tlSfXqSJk+YXRnZ96Nwjltrnx58lHsA6gi0ebX6qSSAOJ7eUYviVPDqeho9mFa8lC4dvh6f+fLz3UG9FYf4t3xSz6b07DeoaumqL2BAYmA8YwFSpyy5IBrpOYNdMDpYH0hZEedPc+WVfNatT1ZcvMW6arozOgpjPISYMKCSlzwiw3asFzA00NlyY3Ij9MdqpHTCPJ6Sv6SQ5wsknEKv9X9RDXq17nfRZnu5rC2V2QWo+AfvCwv2DjjteypHYZdY9chPtqzWMw+6fvTCdX/OOoTdbkqQRi+7lJ95Yts4Dv7lPpE/vO/hcK/hdHOAJ9WU=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(18002099003)(22082099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JJXTMFJ1pJsckgXxMTt2El6BCKu8mySqoJIE+4HAgkJWNh97UTm02NalJyUEsyt9FNOCubYnU2WLWLGwNgfH53vpKNvS1ee1SNlOwOchd/Robco6yG7OT62yA8KgmN216lddNNhL2CXsPkktooIjmuVx/DexRTGMcKS21Xkigb3uOaPLGgOqhuCnm5u1cDfiOfqw6aKdKXdXSllLZ8ZU+SLiMbeDkf2KOC8FQW6LmndzP7ulPisWq+rKP2x/wbfLoU9b++i6P8Ebon/Fc0TGtzjd9srq5YvbDWdjK0KPYZ3q1xjPfohnDtVVOj2tD0hrg8LY43k/E6UI6gugq/yv2Bs67yv7Fpk/skO2nb63McIU9UBimgP5t/JaZG2+FcC9as5/VFju7V6yA0Zf+dSR7WZRNf5RMqVAGuaLEYeJP45utS3A9oFZ+JzW1l0Damcg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 16:21:35.0179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7bb4dc7-704c-4839-c33c-08deb1d4de1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8357
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_092145_319081_8C0B1B8B 
X-CRM114-Status: GOOD (  12.09  )
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

Carveouts registered through the shared wc-ioremap helper are backed by
I/O memory, but rproc_da_to_va() only reports that to its callers when
mem->is_iomem is set on the carveout.

Without that flag, the remoteproc ELF loader and coredump paths can
fall back to normal memcpy()/memset() accessors instead of the I/O
helpers used for iomapped memory.

Mark shared wc-ioremap carveouts as iomem so the framework uses the
proper memcpy_toio(), memset_io(), and memcpy_fromio() accessors for
these regions.

Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/remoteproc_internal.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index f5b34aabed5b..9955e512f073 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -136,6 +136,7 @@ static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
 	}
 
 	mem->va = (__force void *)va;
+	mem->is_iomem = true;
 
 	return 0;
 }
-- 
2.34.1


