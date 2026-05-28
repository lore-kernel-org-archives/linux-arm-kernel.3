Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CBECD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 06:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9e4guzOiBOD7NJeEUfOHEfGZt3cXpbtY7sa39MFQkVU=; b=koUXs3xPj2hQxZX9FGa2a990eL
	SlnzE9vC9A6rS3Mico4cCkOKxo68caJgZFpWodJzDPAPSzD9+++US+l7uajxnHfb8GAQdwrJTGuvw
	9w5cufes0nnRORQHmTvvAg8vY8ZRFKAUBH0SEPjVspFVyQmc3rHb/0dBv65P6eCGp/D61CxTtahuA
	8Ie/wQPTF7evGmIhp50Z8j0nOod+6xN60ZgnhmeMCpt6H5JJd6llBg0nTtr+Scqw5DLDE1YRUrcu5
	DWQcL8c677Mn8uZeCfHJrffOk7SgPLgqswJb7kh7zNRpRYiZ3DRaU3wsxT6Unqx6Rbz60Ty2uy9QZ
	oncdkqgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUTO-00000005D8y-210Y;
	Thu, 28 May 2026 06:44:06 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUTH-00000005D76-45zy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 06:44:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3OugIe3KcNSquwl+Ne7EqlB7kEEomm1TaTFIcR5y1UY65VXtIgGCwWQ8cBEFVJd0by8ERj+De77lYhSI208xvscQ66H9DE3bEZdEs3ocdjKPRUSbhzwh7HCoYZ86IvXb6sD59o6BMiz86KJDaFGhg1Miu9SGakKluBYq9j/x8nHlK00vd1J5ndcp0JW8eAyeP2DK80rX3eG6y0yaMEz+7rzNojSeaZtw79YqnnppmSuIrTOM8IzZEt2S7JfAaNLRDvDW9miE+mUV5TL/FyEPO7sHflZ6NxZmXx8O0tIXXx1UyAnuMuctRVjpHdZ2sEN1KsOEOO5iW54vX7xeDGgDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9e4guzOiBOD7NJeEUfOHEfGZt3cXpbtY7sa39MFQkVU=;
 b=LeNh37w89JIx3/67kySjz8S8CzFo770pjhLcEEIJZQ7T2YQr09KTeg96IlYtz4h2DAQXqsw5f0LipBqZFOm08QAgL5V8BzIUrm2sv+lBlb1LSwSnFjnKNrfv6G2zUamCNKz5XScSVaYcjIEVM3r8il5sTPGWG49Ae1Yac1upZ5q29ze/fPDqLr85cpyWv/S3cnPMrSqegDXPppa07GgKX+u6/WKvgnhDvW/XjnQxfivv7apCv8ZRBItqX+CkrbW6CYN03ClG+mARA8jmp09GYv8aI0zwWcAbYuI+/uV5d5mDykNjiLRTiHwvA/mbHZE/RjqUaLoFlOSEy8iN4wodLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9e4guzOiBOD7NJeEUfOHEfGZt3cXpbtY7sa39MFQkVU=;
 b=PQjrdwiX1TlebFryAX3NlqnvsY1PiKsc7sxTRXpxeE5nH/7ihtVjwPvPFcCi0pdBOOJHx06RF0viWZS9WCq7v9efb/mweRDEWllYgUYoTUmpG+FTZPCgNQYB1gVGR035ob5iDRpJBOFzn+z2zLcwNsP3rrqfOLVOHq8MFhcs4x4=
Received: from BLAPR05CA0037.namprd05.prod.outlook.com (2603:10b6:208:335::18)
 by LV8PR12MB9419.namprd12.prod.outlook.com (2603:10b6:408:206::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 06:43:55 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::4a) by BLAPR05CA0037.outlook.office365.com
 (2603:10b6:208:335::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via Frontend Transport; Thu, 28
 May 2026 06:43:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 06:43:55 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 01:43:55 -0500
Received: from xhdharshj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 28 May 2026 01:43:53 -0500
From: Harsh Jain <h.jain@amd.com>
To: <srini@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<michal.simek@amd.com>, <sarat.chand.savitala@amd.com>,
	<harish.ediga@amd.com>
CC: Harsh Jain <h.jain@amd.com>
Subject: [PATCH 3/3] nvmem: zynqmp_nvmem: Drop add_legacy_fixed_of_cells flag
Date: Thu, 28 May 2026 12:13:23 +0530
Message-ID: <20260528064323.596195-4-h.jain@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260528064323.596195-1-h.jain@amd.com>
References: <20260528064323.596195-1-h.jain@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|LV8PR12MB9419:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d623b8a-32ae-46d9-3d57-08debc847d28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|22082099003|18002099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: r1kqnkCkdN+OSrOyJb02I37m8SVILFNokuQeETZw8BEQ8OiUFNGnUB3l7vC3jXqh8dCb4EwXCucGITJGfZi6fhKYcjGOH1XDjwqN078HDKhLzcaWT5YxN6j/ajmvIRLCup7IIEXeGmfCd3aJ65EbDlNCuZ1NQvsRfDYxD++pIQ4YOpU4BFR1OjYhHecOGBDKjhE5ZL7P2vO/QeLU9rVpCl1HNbZ/p3ukCmNfpGUiFeoejCLusbOJzzUiVVhR8jXM8Kv7Z4vyESV8i2Tyh/fTl5fBa9LSCwesl3wKqPoxQWS+Hlxwygg1F4WSMKTfFoxVESyoSRV3GAbZ9iTW+QKEYFwi6zWF/7JJw8hpi2JJH4sklnkdFqLu8ZRMHKH9lG/p5UrMRrN07Z72/0m7DsHhF7kpJqnqLcu/bB9a0Zgpugk9sUvd+XdDDbK2v3I/pOZxEHE544YTNp9mvKVMFNwSlegqux9iKqbTLrqiopKjDXIzZLNE2aQxCIgPDQVjWMIIGbdnuY2ZySpN/DzuTrMcFuogbZA5AYVDomkuJfDGeQ3AMWbp5GR57pPOY8rkqkyCweAFD+T/Cmg/2bDZcboVNFzAKM9KDRhWWFF0sI0YOVt3QMCMU64L7lUwjnNwUZEG8p58jnj9jg1Fsi1deCCSoVZ1rHEYf52FjuXrTBs6ti2r1/87axvB52zmyb2/U3b5IpnwWlfXRw7xTYq4KLhJbMo2oBQUOyhCEoptrpek5+g=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(18002099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HnbPgrLQfsl69phbRhVpgCwqklZ7Ty0GbhhGxluK9zd9oBqTMWNalmM5HKUkn/zck7My4CEgsJIlkoWxWIHKGOcKSmVxQBEAlbzZsAgQKbvtwKHOzMYZNIYYQbXOkgCFYaXUrLIxzR/rs4ca1vdYkw41XI/DJnXxUeXF7Qx82xCTmrW5ZE3ZEwuLDC88d+4lUJvQEj6hrtaWfT2H5uKCv3De+s00JSdmYDeF821H2IZ2eirs9tVqEr/lN8wMhDwroWTojAb8/aFDmZxp3N0K5TdRF7jarH1hj7yj8wXLaNMVo2sqzTF2hYZ+lanCecDKJttzQqer9iB6LNqosVmImOeAVN+Vi0IeAuC1l2Br7L+5FpHqgGtT/4v09rMi7GfjEfQUSOMdKPZrTAhyOsywYvgVcoLJbNqNa9bIYczDc6AkJgzYHKmy22wG38M0lPva
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 06:43:55.4311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d623b8a-32ae-46d9-3d57-08debc847d28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_234400_019730_5B5B5725 
X-CRM114-Status: GOOD (  10.88  )
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

From: Harish Ediga <harish.ediga@amd.com>

Remove the add_legacy_fixed_of_cells flag. The in-tree DTS was already
migrated to fixed-layout in commit b2774d0292e8 ("arm64: zynqmp:
Align nvmem node with dtschema").

Signed-off-by: Harish Ediga <harish.ediga@amd.com>
Co-developed-by: Harsh Jain <h.jain@amd.com>
Signed-off-by: Harsh Jain <h.jain@amd.com>
---
 drivers/nvmem/zynqmp_nvmem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nvmem/zynqmp_nvmem.c b/drivers/nvmem/zynqmp_nvmem.c
index e8ab4ce23fb9..54d5d7c4eee9 100644
--- a/drivers/nvmem/zynqmp_nvmem.c
+++ b/drivers/nvmem/zynqmp_nvmem.c
@@ -216,7 +216,6 @@ static int zynqmp_nvmem_probe(struct platform_device *pdev)
 	econfig.size = ZYNQMP_NVMEM_SIZE;
 	econfig.dev = dev;
 	econfig.priv = dev;
-	econfig.add_legacy_fixed_of_cells = true;
 	econfig.reg_read = zynqmp_nvmem_read;
 	econfig.reg_write = zynqmp_nvmem_write;
 
-- 
2.34.1


