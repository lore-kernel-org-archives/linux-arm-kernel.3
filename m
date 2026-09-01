Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B545DC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 00:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEySdFu+pmfn8LZ0UhAeL2XFmfjOa6NBdi+34iWzjtE=; b=tWbuhSh1JeY0ZYvGDZ/4kFcARo
	5w2GIrxKh6XBPPINK8Xdn6cUV4QNqMupPyo5PpDq5aGSGT7kdiY1LBI6EUCuY5NRoVwiSPRVoyQLg
	BGcLtivrhoaj+FdXKpRc/U9wOeG9jw5/TmgZTuuJTsraSriRy0wQ/KZiYZDAuRBLV3gUmfAtuRukG
	nA/ixX80yKWuttX5XFXo6dwEn0srws/MEyRkCXrBQJoaC0tm0IzUBtygjU3Jd1SdOqXH/76R1ldRh
	P4NCdAWAe+gugKyvL8vYNrvYLop2tPYsijrQ1bnXU/l6cxwcqdlacH6EHgBIMHglAkWaQUjRtuA25
	yjnpbj3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1CSi-0000000AjaT-0k6j;
	Tue, 01 Sep 2026 00:34:52 +0000
Received: from mail-westcentralusazon11010023.outbound.protection.outlook.com ([40.93.198.23] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1CSc-0000000AjUW-0ef8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 00:34:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ez74MD8Be31I2Jm+kKXlVK/dlgBP3ZHnFuetd1cWOfpIhHih/eu9lhZTrKfOr1osTb9DlSkltrz07x9HFNK7stmuTt+F1osmI8TFIpCNx+0g1+fEF5ok382vvcsKluLV+X7uPjjHSdy2c087GBHx/6UWjqc7sBALugcxa8/Jn1XeNZLCojdSRbAACrRwXma3tojlwGrIpxkqyZzZzz2H1Btc+79XDJIX2PROKr1GSnqCLKwynQwLfnRFyZO/jfcOi6Rd5XORG5eiuEvdf9AgwNAAJT7/zfbRaKtCFSHysei+rW59IKdMIg+sE+GqDFCeOvLwOWA1DkVXjOPkYFK+mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEySdFu+pmfn8LZ0UhAeL2XFmfjOa6NBdi+34iWzjtE=;
 b=O+yzyZRcMZyXfM3Rsu9rufc9g2qbdEqZvfY9nVd6IArDn9hw3fksquU6g7CWNY0SPc1DYeOaTThD86f5caN1ziCjlsKNiEa9YrocorN79TSk1hbrtHgFKOZ5MyVItByzso6lrTM/SH+dlVXGIlaCCwq8fb3TskzwfRxYxEkkxBI3XlxvoevvvJqu41pOldpBjEl62INoqiHx/tT27YnerSnhhVeSuyvYRnVaAaJYYc8T8ywn8TB8z4+MJU12reTO/tACdZlj2L1FBo6q6d/KyXQ6uYh77TRbfxfRb3LF1A5Sr6rcjtR8tn7zOkKFPB9jlqYXqD90fOkUKz3O7HqMQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEySdFu+pmfn8LZ0UhAeL2XFmfjOa6NBdi+34iWzjtE=;
 b=GYO86jCfYqAXrYwKrmKsiZSEyZBeA+b4X1qPZBkWzvI5FE/v+sOXm9sCX2+XHD4gRO9Hdg1uGmAS/NS8a/R1uozBrGHqcDo39ncJtcaDwzRRNIWuQ8HT7sYxndqcYI981bM4QRJtOBlZ1ncyTIxijISmbFkG4ZyLTbjfbS1xXmvjRgQsxlF6BLBd7RBlk+JoG1ymdzqC48cS6cocdE+O7uIYTQ2xCDAQ59SqKnLWH8FRY7gX9hr1etR/8RG0sClkYu97GSS/jfChRiPLfqP2+wI8lcOzvk84VhfAd/h6WJoiqXIPsNgTR3CyOasmBYq5nmhGQFrxjMrEHO3gdXKtGg==
Received: from CH2PR16CA0030.namprd16.prod.outlook.com (2603:10b6:610:50::40)
 by PH0PR12MB8128.namprd12.prod.outlook.com (2603:10b6:510:294::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Tue, 1 Sep
 2026 00:34:40 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::53) by CH2PR16CA0030.outlook.office365.com
 (2603:10b6:610:50::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Tue, 1
 Sep 2026 00:34:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 00:34:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 17:34:18 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 17:34:18 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Mon, 31 Aug 2026 17:34:17 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <bhelgaas@google.com>, <praan@google.com>,
	<kevin.tian@intel.com>, <kees@kernel.org>, <smostafa@google.com>,
	<baolu.lu@linux.intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <skaestle@nvidia.com>, <mmarrid@nvidia.com>,
	<skolothumtho@nvidia.com>, <bbiber@nvidia.com>, <harsha.v@oss.qualcomm.com>
Subject: [PATCH v3 11/13] PCI/ATS: Add PRI stubs
Date: Mon, 31 Aug 2026 17:33:36 -0700
Message-ID: <f7c924266e6f8d74de4508c812d0e49036fda53a.1788222486.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788222485.git.nicolinc@nvidia.com>
References: <cover.1788222485.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|PH0PR12MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: 171603f3-b48f-4d37-7f48-08df07c0cf6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|7416014|10067099003|6133799003|22082099003|18002099003|11063799006|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: pmTgSLZ7nIQRmcVQANqRfJBimhMnqi85/mHDfy2Z8XRxNZ4xvNCCW3WpKp7Nnoz77v1A4hNeZr4BThpu3kRGHmtAaEsET85+Kuf7jZAgQYwSkaVVHPQ7zk8dkOfZKmT757LsIx7kVcV8L3lNwwtjnl3jYNh5m8h4lgcdlwdxDpIxmUAnS46ftneumYkLy0QyJ9bA+oE8YCk4ecrawOWcPADkupvePAL+XJ9dLiJeqcLH6wA44tVQzwkhdkvzy7C45Q1V+621x4AqbseL9QauXboKPj79eFPBxz9GgtnEKHdsD8LVotmbpUeTdDALNqRZpmBp/cVQg/nDdbug5lbA2VUA8dmsHYYGgI42JSujjtrtS6MxdyO2T3IG7hlqkjfwx/8tuOTo9VFXlWnFDw9uoGt04fSTMSbS9TdO9Hj1U3x9+qPN9jxcGWwkly55oGhMzX0cYQOJ/zzbFcX+uSqLecgEdiT0roaN4JlZdbMuHmtrF+PnD2B8SaAS8zmpkZFlVpznAqzxY58L5vRP33Dnm020zNPmgpz5Sv+8LfbE3BjWKW06HKLw2ebVNWsQyRwTCx9BwVkuz8pwVMIjoc75J99P9ZsHT8+3eTM5mnaJeVtSrfVL1ec5updFthvwtOCHMOtayeq2yJ4w8NS3kr+czIUe6wlgw7F9K6otnjyR6OKPR2NIgi/ffKRgauXauXcQ2tpfNUDXEp6vn/Ru7e29sA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(7416014)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gHRvzxoF6etLpLgHohRE3cuDR+ZIsDh+VDzRQlzMSb6dsfAjuxS5XtCv6ZYtComVUjbPqtCJbFuqn5Ycm8mrZ5CyOJgTZdOIfcPH6yQjyYunnsY7Y2n3SsmFOtrU9/Hom+iCFKYa3LN3jJR+WFzuNj/fKkOmyZ81jcvLU3xY+rUb/KR/aKzN7sWjgv3HM/S1WW6JmlzZ1LRx+1BmGNiY+JPDMaOPsuk5CI12pf1Kiur9qY/UTLNTdIjHy0q1xpHSV+kdkjd0aDL610l0jATcGD+ONPaoY4Z9s7yEwH9CRJJFcjZs43aMFAIuCLcHs6gk7yfQn+BezivioNauRhL7yplPqZO+yr7sscQER9htNCOBxJkHC7LR4IZevXCIxFNzWMuUDnCvgyf1Yxzm3UHhL1Vs2hxkhovjo5qrKS5pMfRQeCxy0191Qbn5EL211Dtg
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 00:34:40.3476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 171603f3-b48f-4d37-7f48-08df07c0cf6f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_173446_201974_BDA3EAFA 
X-CRM114-Status: UNSURE (   9.49  )
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

The SMMUv3 driver, which may be built without CONFIG_PCI, will shortly gain
PRI support. Partially revert commit c6e9aefbf9db ("PCI/ATS: Remove unused
PRI and PASID stubs") to re-introduce the PRI stubs, avoiding more #ifdefs
in the SMMU driver.

Link: https://lore.kernel.org/iommu/20201112125519.3987595-8-jean-philippe@linaro.org/
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
[nicolinc: drop stale APIs]
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/linux/pci-ats.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/pci-ats.h b/include/linux/pci-ats.h
index f3723b6861294..07d24c1c3acdb 100644
--- a/include/linux/pci-ats.h
+++ b/include/linux/pci-ats.h
@@ -36,6 +36,11 @@ int pci_reset_pri(struct pci_dev *pdev);
 int pci_prg_resp_pasid_required(struct pci_dev *pdev);
 bool pci_pri_supported(struct pci_dev *pdev);
 #else
+static inline int pci_enable_pri(struct pci_dev *pdev, u32 reqs)
+{ return -ENODEV; }
+static inline void pci_disable_pri(struct pci_dev *pdev) { }
+static inline int pci_reset_pri(struct pci_dev *pdev)
+{ return -ENODEV; }
 static inline bool pci_pri_supported(struct pci_dev *pdev)
 { return false; }
 #endif /* CONFIG_PCI_PRI */
-- 
2.43.0


