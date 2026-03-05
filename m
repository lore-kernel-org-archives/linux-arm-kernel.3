Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FB7EDEC1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 05:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y70xyM5tXA5BYDzHXr8NorW9AN9vXnKx4U/1Km81XMQ=; b=jyaM1xtxGPtngvKMD7SaoxWenw
	kIbIuHeq6qxpCWVAL9yD3EaWdK4DZQx6NPAwFma2zYb4R1vyeL7dOKtKS0hg2ic7f3knU0+ygnQ5v
	aIM9RQQtCMUeLgHSf9JHJuPdx9pf2TTV3rb1i+lP7Ok9M1u6RCYw3Ggg8O6rb2Arza68mQziGeEBb
	ecqP1svWN/lqc9y6X1hsYRPubXzfAK9izC8uSxFKY4H4IFSu8OW7x1sciRkh+OwDR+4HJk4L0q30f
	+NNPDhDAkt28KIhbI7kX0r0xAPZ0YCIsfoHFxf8KHC3wwgtxe4zsZuCPaDZVc5SRT8xncivs5lGXd
	oMxVN2BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1A8-00000000wQx-3C2z;
	Thu, 05 Mar 2026 05:22:16 +0000
Received: from mail-westus2azon11010047.outbound.protection.outlook.com ([52.101.46.47] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1A5-00000000wQH-2jxO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 05:22:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vzpOEhyyqwMfQ9w1nIQ/nKOdfZsOg2AEmEVWGfX4XpHXBPXMFRasr4G65qwH1vuFYKOANXe3/z6+rt+0POilK7m8Aw8t+WMQbUXIcmL2ZklCdyj+CUhzcE1OjZpbduvbRzSrvNfgIpkOTj83TqmgR62uJLj4Vi0OHxCtYCFGcBQ0ADDqWmo4QddCMBMj1ofSUebJSF43fHFScdcNP1VLxoVNHtljyUvMQfQz7NE7hGdl7yP4g8agaaKQT9Ykg3Bvl6zhhGSPd7EZ1PaIXJBtFNBsXy5vWS+ixpEGqZKRn+CVkQEZzMcEZtf/An1FaxmVv1CpmZ6x2scVoKkwsgio9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y70xyM5tXA5BYDzHXr8NorW9AN9vXnKx4U/1Km81XMQ=;
 b=myPRt+mc9NhcKNhOlgT46i2Z91ndo+eC5SGIT+FN6c3GSEkK2uZzt27vukawgCi6pxbPjpxOlWlbJmEa3HKiMq9w1uYdEHCiqXZqXxUOBf9TYvNd6WjRaIYqmZDz1I8+TpGiH4LTuG8zWDY6pc+mbPwk67kz4WTqiYHmFyFltdky0pdGsgO2bPnOmhptjZnTUJigPyrxUHx/qCAN5M4fNSQQMywkH1QqvlDcoM2qO5x5ytRldon6ECpvVb9OzL6B6DPkOXG46DC07oDq5T8JIA+4Fru0LbXdb//kZyDsHTnF9IXsQFdy+vLFuKXpND2GIO+JsZT1HYA+3Xj+5tOFCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y70xyM5tXA5BYDzHXr8NorW9AN9vXnKx4U/1Km81XMQ=;
 b=k4unAH414jnltBqNBYn2XGIb9hjzX5yW2TZGfXo1hl724Kv5lR4i+XmlJmNSGqAyt1wM0w39heuGqED+73ZMRnV0WkI3fiIGlvNtMA9KAQe70y3AygWim9vIKeyh4YM7A0RAIC0l7QhaWNjG16F5/AigoWyfoCCK0q43lfEe2oX99F+F8z9p5mOVKxJ836pcFfxPbSMPwW/GMsHNtrKsUdcxMEv0xZSkkXei1M2/3JK5SqUJ34hvTV4/ScFBZXlRdhshzmV5Nht4cMRfTu2HWFmnDCb1e0q4pC0pn2GL/Kn6WOz/Vv7ORdrejAdfytIe8MTUfHSNTTrmley+IxHUUw==
Received: from SJ0PR03CA0230.namprd03.prod.outlook.com (2603:10b6:a03:39f::25)
 by MN0PR12MB6319.namprd12.prod.outlook.com (2603:10b6:208:3c0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 05:22:02 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::c9) by SJ0PR03CA0230.outlook.office365.com
 (2603:10b6:a03:39f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 05:21:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 05:22:02 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 21:21:53 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 4 Mar 2026 21:21:53 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 21:21:52 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<bhelgaas@google.com>, <jgg@nvidia.com>
CC: <rafael@kernel.org>, <lenb@kernel.org>, <praan@google.com>,
	<kees@kernel.org>, <baolu.lu@linux.intel.com>, <smostafa@google.com>,
	<Alexander.Grest@microsoft.com>, <kevin.tian@intel.com>,
	<miko.lenczewski@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<vsethi@nvidia.com>
Subject: [PATCH v1 0/2] iommu/arm-smmu-v3: Reset PCI device upon ATC invalidate timeout
Date: Wed, 4 Mar 2026 21:21:40 -0800
Message-ID: <cover.1772686998.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|MN0PR12MB6319:EE_
X-MS-Office365-Filtering-Correlation-Id: 88257ebc-303b-4548-d1aa-08de7a7721d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|7416014|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: B+O/CNL8vvpi9AczZCSTSUpXK0qZpbHFmravMw9M4Al84hHYYx2Tw+hfmoec7g4+pR7xog6INNDzdrS0+x72Bvj6TK55GcwlQeL1bEuzQa3WdH92fZK5t/6LBFk5g5Feugokq7A00C10U13FjqnEsmeOTIRYDdN6dxz0qc0w+08YeNl6yvtntovI0BKhKRvqmRTCeCujP/dCp3RfznS1zt95wQ8RT+crJUaZGokq8FtOgx+pVbKuHhYPvF45+XJ3ZwfVC3rvBbk+cn/BW2xaFqW5D0xHPhHFy3uySWHLpgOMQUrruLFTD1Kqw92nG5aigIegORsHffdLBWVl+0RkA/Kv1ZsJRO39gmG4dfxvwAm2dNzDQnw1GUeUy57dtJv5fwT28bsTn3+86KdJRxs1N8pQttrM79934CuGzm9tmSsHQBaOtUDlFfFvxtZaqCP6pakVvS3POsIX6t9KFWiVlfCpTCNRa9p0+Y3EipmhCRBqkE91ndpwgSOx4BBKQwqKtt6Tn3ouo37lUXoUfRy3Qj54Gln6neSWXP5E/3IyAAJ7b9PBK5Zvk8Q7A3RzgfF5Ssca+gwCUN55UyjQrb7fU8wAFpt1j2NFGp1EdWzlby8RLlWsdLV1+Y/Lmz24xbH6Iskrkkg4ROxHuJC/oi3Rk9D9NeMCyI2naS1+la2cU+MvmZNUfgGVvQgquvWpmDwNkSE5kfnKndvm23FCjBZ2uFdSY1JfCfz3KABk07V+aqzi2RRyXBuXsLJdyavv85CQrBDgt8sxQbtXWRjoOQ7hbA==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(7416014)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oy2kY0ysyi1ZBEtdLbSR2BIq1oTZAZj4I3N+Juj7DLdgFP6+mau2uCDoK7ysNOKQnf8Wdft/ncc+TjRLXlIZv9wpFVCc6HyjxTjkUNVjftLk7JNvl6Fg8CbvXQ1rDrBtp06Na1TcWIiwvYj+q5vmOHuckT3Odu1dGTKgn4J8gUmjE9QUZq7B4ndbykKyfSqMQOWIw87imEBGDlveNjNB9r8r47/L7cy/1cJaD2EqL7OORRe2rcppVn0KmMNg7V2vGo+4Yh17O/c35QaReasqYB1rSrwJTCsNmXqaR5uxLfVv207Ij7xneumW2vDq/tabLDFTG83IHLDwbFMbcVbps341eeNibtLUBg2DEDEitfwKLkYCN4Yeb2sqy90qtNzgyOpJNgX3mzb2rgFxXWbcKYhQPxX4fmryTBNuLgZ/AfwMNAke9XcRYTg+jbWMcB3n
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 05:22:02.0499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88257ebc-303b-4548-d1aa-08de7a7721d7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6319
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_212213_879864_95A2F87B 
X-CRM114-Status: GOOD (  11.37  )
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

This is a small series to handle ATC invalidate timeout in the CMDQ Error
handler. When the ATC is out of sync, the device might corrupt the memory
due to the stale cache entries. The safest way is to reset the device for
a recovery that wipes out the ATC as well.

On the other hand, a reset attempt in the ATC recovery thread might fail,
which leaves the IOMMU driver no choice but to isolate the device.

pci_dev_reset_iommu_prepare() was introduced previously to fence the ATS
and ATC during a PCI reset. It's easy to use yet doesn't allow a re-entry
nor support the recovery very well.

In this series,
   - loosen the re-entry and block ATS if reset fails
   - add a reset routine in SMMUv3 driver

This is on Github:
https://github.com/nicolinc/iommufd/commits/smmuv3_atc_timeout

Nicolin Chen (2):
  iommu: Do not call pci_dev_reset_iommu_done() unless reset succeeds
  iommu/arm-smmu-v3: Recover ATC invalidate timeouts

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |   5 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 131 +++++++++++++++++++-
 drivers/iommu/iommu.c                       |  16 ++-
 drivers/pci/pci-acpi.c                      |  11 +-
 drivers/pci/pci.c                           |  50 +++++++-
 drivers/pci/quirks.c                        |  11 +-
 6 files changed, 207 insertions(+), 17 deletions(-)

-- 
2.43.0


