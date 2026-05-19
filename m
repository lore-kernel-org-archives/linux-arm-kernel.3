Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF2ACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 03:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrDZ3l1n8UO3X5yoDnsOuNTxpYn+PH0MN5/QKyxXVMM=; b=oZejdFA1LarZfazVV1x5MO5v2a
	siCoOlBATPsdNlQqq6YtQTRDgeZsQXYRq5CPHnRZqgGHHdLbUuLrHKNsI0+CzfCuCmNIR5y5pBBI0
	H05NFdskpGYcxlUgaNHZqnDpsY4d/qVQdZQmDH2X75o0sAlKGosklDxoBO+9tVYps5hrjGn2U8m9f
	shqJ2DB7HtICX6hfQcCPtQ/OfVeIfweGCDSV59jnaO0dMj2kCthTBHC/Y/CT6lXL49R05EJdjRP7F
	7BrLEm2kRFm90yMgMRYKyrRmRN5sCygN2EpglIt1O/jvqD2Vho/ilxb+3L2hKTbxqQl5Qn24x3K73
	Dsr/TqVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBJ8-0000000HamX-0wY8;
	Tue, 19 May 2026 03:39:50 +0000
Received: from mail-northcentralusazon11010049.outbound.protection.outlook.com ([52.101.193.49] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBJ3-0000000Hajo-0Ayi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 03:39:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OpSGxneLzKQ2uT0klTW1ITvINytdqgdwAEZBz4SFkh3RhNNGEZ9mU7fCX9ACU09pHkV9J/Dwo1s0OThtjOwxm7s54p4KvNfmgERJzPZke6Uf1Kj+wez6/56Yq+N962uMwKsA+UUstjLzRrsi2BBoBGPGyOO5vzAZWCEiFi+pai1kqOMUSgSzwa9XIxUNIgNmo3YBIqAGexpiwsMqY8rJ/aLbyrMr3ELf7T99Rr8xiPR2b7LgQyH3weOJzVqs28qlbds7OW4f0wvY9YuRJ9pFRWjjPIgX50zhcEh7kXWgyRp5v0Qi7fkDbwUaEQFhH3Yl1ESxw3UbQsgfLRZfE8yk1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrDZ3l1n8UO3X5yoDnsOuNTxpYn+PH0MN5/QKyxXVMM=;
 b=FmhxqmLST9vRhLGazJ90zRYc+R3nkWS+Nsv4r/HrvKBJMYIqK6c/of0UbkMvhl9yKRcGxdSTc1B+KCo+ZDIYmj1/6Ws3dlEDIzv7aW86qeTj+zYkOwSCzTbwpQe4zturEm7lkPyrDPg/jY8KigY6+defIxh48dRKAjPW8Wh8f9W6TAqsi7HqjcDOJoiIQE5Nw7EZiGNjNw07LAqRpd7zRti5z9hbHqmtvgqhtacsEHKhPC676hWRQganu6FfDfa0ptY/bBarSTDG0kmgLt/h6fV7kln0OFL0uYPC2JqCCOwOaDO05NUv5nj8NeYegkxGKnGNZFuzfjyAMhaq2RLwYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrDZ3l1n8UO3X5yoDnsOuNTxpYn+PH0MN5/QKyxXVMM=;
 b=N0IAC2Nq0RgyaHq0lSU4UgPQLrkKcgyFoCNPF9rvwL7GyXb/W91xs/wpSjmG0xhIDEA6RYaKVrsH+e6ZBG1iyDKaD7WuOsE/bzS4fWvU4+UbeFlioaDtFdp3A0GDddJcx0L7WNvANM1Mk3h32tlLWJkp+wnuvrii7bR5mS6Qu+zZfdj+iS8XI6UOcfF5khPYzcyySS2/YKbQ5Iw1e6E1XsfWVlslk0kORhR7Lxf3OuqJ/ULl3egGscaN8Tj8cN/2R6wMSCT1lAIAAJQZAHNGvoDwz3qEsEi370DhZ1D+iLC4FiOJgUgPStEgy0v3bFBiUBK9M+gvkco8+pmR0vWTdw==
Received: from DS1PR04CA0002.namprd04.prod.outlook.com (2603:10b6:8:44f::16)
 by CH3PR12MB8709.namprd12.prod.outlook.com (2603:10b6:610:17c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 03:39:37 +0000
Received: from DS2PEPF000061C3.namprd02.prod.outlook.com
 (2603:10b6:8:44f:cafe::24) by DS1PR04CA0002.outlook.office365.com
 (2603:10b6:8:44f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 03:39:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF000061C3.mail.protection.outlook.com (10.167.23.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 03:39:36 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 20:39:22 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 20:39:21 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 18 May 2026 20:39:20 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel" <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>
CC: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <vsethi@nvidia.com>, Shuai Xue
	<xueshuai@linux.alibaba.com>
Subject: [PATCH v4 01/24] PCI: Don't suspend IOMMU when probing reset capability
Date: Mon, 18 May 2026 20:38:44 -0700
Message-ID: <31a0eac20f59f15a62ca5a5983c7f1e6d238e85e.1779161849.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779161849.git.nicolinc@nvidia.com>
References: <cover.1779161849.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C3:EE_|CH3PR12MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: f12ac920-cc5d-4790-4dcb-08deb558400b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|11063799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: Wix6IX8qExZj4KuXUf2oQtYtlHG0xwbweUGfpo9wduKd/ynRqErmxptG2CbbOchP3YULjoSYWk4zZuoUYb2rYknPKK8o1Z0Gztd1sANMUzPL7YF2q4vLeO4R0zR4WBvredXIZlAxncNHBfryc+ibel8QiX3AKs4nxYGrQ7GfkCoGb30LpGNEL+ETh3PEB681OS+B34MCJ938AwbZk1OzsnBmNs2TyI5fTnMtD8WofdBOjUvMFGYJJ/p1ourgiC5IzjiEqJbcfY3RHlwTSA+K8xCNnnHZLCBROb/gFPvAcNBmhK0rEb7QZVvWWFoCyqPOIrba+HtHYDge6uRRqyZBDbxjwVIUc+Gwup39A0ngI3CCX22Ql+3SMFQxOMdzg8NAXY0VhhVMPO7JuQoX1JfUqmHYFtnDIE3ywQEZKa4obEcVOFTbhopkhtjiIZjPMqSq2qALQnRHjH3BfigXgknhtAK5DxFPGksIw3DF7B1EGgC0cYAtI96CJgV+RHbj9rzbDy5z9GM68YuyTVL9VCKmVesTuC/wfwUqvKRzeTKtevmBvd2LcNgdtY6euaTpMu6lxa4QbWkB6B7cAVInSl9J6bWDbp4KZYbNnByQeuANu4d+OoVqh4B58e7UHxZNHACe0GDesGq0R5AMymB30gXDw1RGe+5LBXcgezQSYPvFOxmAWp0AdaxKn+ifZFaXt+9l0ABx4x0hH2WhpnGAp+9hrNFWWtcS203x3v88iU0/FRs=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(11063799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gZDtRgXh5QZuxWlJ3WdXmBNXf+YDTpVIGzxf3+l242M36qD0L6QxEzwrhGhbaaWEVAZ7L1+crXWtQz+usJUCbNUsczOd7ElA8TptLqGV+7ZKJqKf+9Rxf61dWTw/8eXq+aPZRYR0ZZ6cAm1TY5zfW8flT9LZGIhkX8kzWxeENlyFdYl/yuSIHVTCMrBoanDg8+2W4VSSPSNhQTOCxwumzdKYoL6mlOrrYALFTcsV1e9X9bW/D+iGLW+sxRPiYn8XcV8n2jbkY9rq0dDxgyNh6yK2g2ASxrEXKyMzMVEStMr2j2QO/Yl8gTnvxCNkvLlVBIBM2hfE1hseYOHHSZXEuGM9ZbFJpAMERmbhEyDYcmdMFiAkhoPui3xiAs/SqwWkccvGDPUoR1SGZXZyjVo61ogy/N3/n8gUhki7G+wJ4BkX0q+uS5MGo4if+AIJkoQt
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 03:39:36.7824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f12ac920-cc5d-4790-4dcb-08deb558400b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8709
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_203945_083776_FF5AECB5 
X-CRM114-Status: GOOD (  13.30  )
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

reset_method_store() in drivers/pci/pci-sysfs.c discovers supported reset
methods by calling reset_fn(pdev, PCI_RESET_PROBE, ...) without holding a
device_lock, since the probe path is expected to query the device's reset
capability without changing device state.

However, pci_reset_bus_function() and __pci_dev_specific_reset() violate
that contract after pci_dev_reset_iommu_prepare/done() were added, which
moves the device into a blocking domain and abruptly aborts any in-flight
DMA. Doing this for a probe -- a state-query call that does not even hold
device_lock -- can cause driver timeouts and data loss on a DMAing device.

The peer reset helpers all handle this correctly: they short-circuit on a
probe input before touching the IOMMU.

Skip pci_dev_reset_iommu_prepare()/_done() entirely when probe is set. The
inner reset routines already implement their own probe semantics, and they
perform the capability checks and return without changing device state.

Fixes: f5b16b802174 ("PCI: Suspend iommu function prior to resetting a device")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/pci/pci.c    | 13 ++++++++-----
 drivers/pci/quirks.c | 13 ++++++++-----
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index d34266651ad09..d0af8b5eca2ce 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4914,10 +4914,12 @@ static int pci_reset_bus_function(struct pci_dev *dev, bool probe)
 	if (bridge && pcie_is_cxl(bridge) && cxl_sbr_masked(bridge))
 		return -ENOTTY;
 
-	rc = pci_dev_reset_iommu_prepare(dev);
-	if (rc) {
-		pci_err(dev, "failed to stop IOMMU for a PCI reset: %d\n", rc);
-		return rc;
+	if (!probe) {
+		rc = pci_dev_reset_iommu_prepare(dev);
+		if (rc) {
+			pci_err(dev, "failed to stop IOMMU for a PCI reset: %d\n", rc);
+			return rc;
+		}
 	}
 
 	rc = pci_dev_reset_slot_function(dev, probe);
@@ -4926,7 +4928,8 @@ static int pci_reset_bus_function(struct pci_dev *dev, bool probe)
 
 	rc = pci_parent_bus_reset(dev, probe);
 done:
-	pci_dev_reset_iommu_done(dev);
+	if (!probe)
+		pci_dev_reset_iommu_done(dev);
 	return rc;
 }
 
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index caaed1a01dc02..a344abd745947 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -4260,14 +4260,17 @@ static int __pci_dev_specific_reset(struct pci_dev *dev, bool probe,
 {
 	int ret;
 
-	ret = pci_dev_reset_iommu_prepare(dev);
-	if (ret) {
-		pci_err(dev, "failed to stop IOMMU for a PCI reset: %d\n", ret);
-		return ret;
+	if (!probe) {
+		ret = pci_dev_reset_iommu_prepare(dev);
+		if (ret) {
+			pci_err(dev, "failed to stop IOMMU for a PCI reset: %d\n", ret);
+			return ret;
+		}
 	}
 
 	ret = i->reset(dev, probe);
-	pci_dev_reset_iommu_done(dev);
+	if (!probe)
+		pci_dev_reset_iommu_done(dev);
 	return ret;
 }
 
-- 
2.43.0


