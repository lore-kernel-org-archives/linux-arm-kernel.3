Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D429CD4F58
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 03:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ElvuF7onpjmY5RtM8GiFKi3RJbt7PYH4CztMCqQ5ze4=; b=bo+KHrBfrCRBC3i7Eg2FfopRdH
	BE/WIR01pydCEHRPpbyIKKbmi2NtcxswGGTZe4/vA8SKa5i8plIkcHd4hTmuyX+GTZA2B8QxAArZ0
	oo/XbCu+sdNv15s4I3UkIgyoxbeS9ubHs/aKu4OPfW9h6yNqedj3FeC9pS/yEIU1m5/y3cCp5RO3m
	ncWJHxBzn7ChfJLbHT3GCpWfBv2jWHpkd3oxZhhZ5lixOxhnXhe8jIs5nTLYocD+ndM3SDv6/+ovx
	4L5HPOX2YGvqDol/atfl27bO1cLQS1VpG1pnBaBfdX1ZxIzbvH598Az1/D5Tp/YatVMPh8tXJtYUi
	rYLjA1pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBJG-0000000Hass-1p5s;
	Tue, 19 May 2026 03:39:58 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBJ8-0000000Halw-040F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 03:39:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYS/akuJLwIcNrxGLgxA+PJApSj0KgS1/SfvKvy4eEo4/8plbbGVb1ZY6NrVeQLZRFHv7EwtVQholQxfwtS2TSq/WGs9rIqV9uix0XZrJV7cBYobytKITXBFzcX26ZDiaD3o7NAg3+ycrG4FqrLnCwFj90uK5yZw2j4i7kAO41wS+wFhmEMSnOJyLKMggEUPCcTkzTO3vcy5zRWFCp9jUtS4pRFp/dVRzAQZu6SjEKuvz8xGrhuQBU7FMFBdUhYn2QhqQmlK9W1XuHcRFzWIktFteUpsx1yQgydOZBgLszp5NLF3xS72F+sxjW3fCjkwYH0kFTzCyr954BJMaNKXgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElvuF7onpjmY5RtM8GiFKi3RJbt7PYH4CztMCqQ5ze4=;
 b=XslwgzlI/fAmlc/pd2p1FVDe1UAllNMOx+i82Ji42B+FWR7h6ddban7Glwfba05WCAv+xKFErlDuKhDNLM9ZX8YBcrAsHg/PlyaGTNG73b5xpm2MqgWVKfKmWSzgxxuUpH47Sbsb90pbL7P5zYRkKDswXI71x0iwhyC1JG208w961S1EKLfVfg+RA+sve06QxzJocKLINSs3yL0HF3VzkQl9G0dUAzfFdwfv3zzeT+FJvP4YZ86Wtixb0ZNyFgFi0REw6owZaoNz2dgdmx+yqRMh2Ho4zzLanWeUjLZBeBj0zSPTALnSmOU3lcGbuXDL5AqTNxpMVoDU+ZXI1YPDaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElvuF7onpjmY5RtM8GiFKi3RJbt7PYH4CztMCqQ5ze4=;
 b=hRgm64EWF7jtG2PrC0rIyYpImyywitO7w78DMSnTgKpiLnxGN2Eb+NCylKy+Vak9c6CkSwX19ArtYDNBLsQVc1BgCBcSji8Q/0URCEelzfpe0ce863klz1m+Fbae7ukitSDGrJlQf21naGRkCdnZL3RxgugU/GBq6wkcQMGHiD81nqb37crJCXzo6bYct9t0adjQWY8JrRY7oujaCZ/O0VtqTvD1g7BUHuo9bXJrBScUKKVq+jBlazTupDceBKpw5QGJJDoKcIi6jKHsSpxakKqGkR37CXIh3Yz5m6bg3nNdJPB2cC6AiiN/5lymHgqD+helgobKDzRvOLqK1hHenA==
Received: from SJ0PR05CA0070.namprd05.prod.outlook.com (2603:10b6:a03:332::15)
 by IA1PR12MB6330.namprd12.prod.outlook.com (2603:10b6:208:3e4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Tue, 19 May
 2026 03:39:44 +0000
Received: from SJ1PEPF0000231D.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::40) by SJ0PR05CA0070.outlook.office365.com
 (2603:10b6:a03:332::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.13 via Frontend Transport; Tue, 19
 May 2026 03:39:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF0000231D.mail.protection.outlook.com (10.167.242.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 03:39:43 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 20:39:25 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 20:39:24 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 18 May 2026 20:39:23 -0700
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
Subject: [PATCH v4 03/24] iommu: Convert gdev->blocked from bool to enum gdev_blocked
Date: Mon, 18 May 2026 20:38:46 -0700
Message-ID: <8f55bee3f93b4455e6e647fb0998d064d486e42e.1779161849.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779161849.git.nicolinc@nvidia.com>
References: <cover.1779161849.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231D:EE_|IA1PR12MB6330:EE_
X-MS-Office365-Filtering-Correlation-Id: 59e3b1ff-479b-4c72-9271-08deb55843fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|1800799024|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info: 6WRQeJQJCwm9k7Pcy4QMzJKBpoEOqZjqFAd3o5Cd0le8jBzj9O0vbsOoHzpXwuLKTRbIYOpTCoGZFSzLRZ6e/jbtDo3umcEfknaUjbha8Wm+CAEhOy+3d3oDzPi1I2ZcxVIFTTUA1tUh9sZxCIon7fYL3cG3tYXlgEqXLJo8LZLGi87xIiYxlDJr/g0yDpcXeH4RFGl6Gdwkf9vhtmawx29MXmLwnqncSKvkRnZSSRwEL/Jw4RQv+29EwWRPrAnXYR0ToyF42Kh/t0IIs2BGSc15mjpeOBTdlOHZJU4M22G6LP9gpi7C8Njr526qogeLihPLlICO87eJWDek2R/HXOnauLa0KMG59c/dJzd5wRFYH8o7GLJcQF+HUWb+HZTe6Y6oFWeeaMBozJXEaM6cIc6vJQB4Za/i4ICO53hxWznbnbLs/GxyfPkidmB+qhnd+afHRdFbpo/CUe6cNkIXabYCOqMAi22mRjbk77ndeGYjx4Yb/cz8NVs1SRYap0cUZEZthQ7zp+wk9HJRqvBkjNbDY0I9KM17SKuh1PYcK5GU+2qnzhaSBhYScr4XIFqDI+3G6E0TkSGzcI8FUOdmSIk0sRZFwgSMuD15XbzQqzPh9+E13MndhpGc7ASEFkRL07TTKRi2T2UFet3rNjMtFjrBXsQvRqBm7PYCy4zFvxe/gZe9f3uhVsaTAF4xxt83SNMSTUd97PzU1hsE2GtoDAgZOF7kxkL38Y+BhWgcRb4=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(56012099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aqZuwuBN6tj8pvW50gspQZOL1NA9nhHn00LptGkTmu0joxtK5NW5nDrKhAIVsSOVLRfKc1FbfJ0aCL8NjJZBnjY1ynYMxZWozZ7Hzbw1biAHn+e9EYg8/xoSJ6w9PO5ZiPSEqC91Adg0Q/SW4t3yHFwu+R6gk6mVjDa0Co/6XvfzjN+xIjG40y98cpY/PXi0BLxWHjRrHtKUvhz/+xC2toJ0O62s6msdKal2RcXlIwkRUJfpVm7nKlN4bXKqWCUvtlJvDEKTY0TDrocQ8zb0x4GaSjc3RC6lCJjalyu/XdfPuctBVbZviYYdRZFdmNfgYr7qCpj4YKjZ7c7IdNmd8OMBSc2xISFSJrfALGZi6M9AdJRwo1E6n0Bj6ef/xK9Y3Qfq/yyeElS6zSZLj0lPx4FHrh58XtyLLl6OxmZ9uL8VDCBIiuSjIlPrbTMd92ny
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 03:39:43.4311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e3b1ff-479b-4c72-9271-08deb55843fc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6330
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_203950_059222_E013E580 
X-CRM114-Status: GOOD (  15.00  )
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

The gdev->blocked flag tracks whether a device is individually being held
in the group->blocking_domain while group->domain is retained. Up to now,
a PCI reset in flight is the only producer, so a bool suffices.

Subsequent changes will add more reasons to keep a device blocked, e.g. a
failed-reset case that must not auto-unblock, or a driver-side quarantine
for a hardware fault. These reasons are cleared by different events, which
a single bool cannot encode.

Convert "bool blocked" into "enum gdev_blocked blocked", provisioned with
two initial values: BLOCKED_NO and BLOCKED_RESETTING, for the existing use
cases. All readers keep the "if (gdev->blocked)" form, as BLOCKED_NO == 0.

This is a pure type change with no behavior change. Follow-on changes will
add new enum values along with their producers.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommu.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index e7bd28cc77eeb..c40f4bfc93352 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -73,16 +73,20 @@ struct iommu_group {
 	void *owner;
 };
 
+enum gdev_blocked {
+	BLOCKED_NO = 0, /* Not blocked */
+	BLOCKED_RESETTING, /* PCI reset in flight */
+};
+
 struct group_device {
 	struct list_head list;
 	struct device *dev;
 	char *name;
 	/*
 	 * Device is blocked for a pending recovery while its group->domain is
-	 * retained. This can happen when:
-	 *  - Device is undergoing a reset
+	 * retained.
 	 */
-	bool blocked;
+	enum gdev_blocked blocked;
 	unsigned int reset_depth;
 };
 
@@ -4083,7 +4087,7 @@ int pci_dev_reset_iommu_prepare(struct pci_dev *pdev)
 	 * the correct domain in iommu_driver_get_domain_for_dev() that might be
 	 * called in a set_dev_pasid callback function.
 	 */
-	gdev->blocked = true;
+	gdev->blocked = BLOCKED_RESETTING;
 
 	/*
 	 * Stage PASID domains at blocking_domain while retaining pasid_array.
@@ -4209,7 +4213,7 @@ void pci_dev_reset_iommu_done(struct pci_dev *pdev)
 	 * the correct domain in iommu_driver_get_domain_for_dev() that might be
 	 * called in a set_dev_pasid callback function.
 	 */
-	gdev->blocked = false;
+	gdev->blocked = BLOCKED_NO;
 
 	/*
 	 * Re-attach PASID domains back to the domains retained in pasid_array.
-- 
2.43.0


