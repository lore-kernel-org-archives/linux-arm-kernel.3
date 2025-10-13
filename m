Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC8ECCD187
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 00:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZhnAVkk/Gr9E3NFFvXPlym24B3zW08aSeHSO9JVS1E=; b=a1z6RSSIN4vTc3EOyrsNw34+jK
	iCtzOh4wIhqQizT0eYUfRI1IgYGHb2KrdQU+vyeRGixutTFZMRcNcRt1iA9Ewlm7CqAACPXcD35l7
	C+EJUMsTKn2sgyIBc2ZcYpVlDIhahJswniQvw0BIqsKqKfPT373mra3Q5/+C5SQXTChMA27erOFjb
	8+jIC2xGg9u2KTywBgnRdc2bXGDeTcm1MKLIotcdNjTVLjo/Gekz70KKJhoTMBLkVaiT0WfInOy7i
	6gns0LjNV2lENOJ4NAURWiQ8jg3PgdmzAOwF6Ro637TEhbND0wQD2oWPeUFlKjnI2m1nB4qjUOG5/
	zkDOQTcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v866b-0000000BwDn-44KB;
	Mon, 13 Oct 2025 00:08:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v865E-0000000Bttg-1QBT;
	Mon, 13 Oct 2025 00:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kZhnAVkk/Gr9E3NFFvXPlym24B3zW08aSeHSO9JVS1E=; b=dXPxUcroaaY5WxYBhbB4mR8qiD
	btm85Id/eAIhHyjJm94JNEqjfsN0VnPax3EX3WEUoEqLz8YL0eqJImIMVBjos/4ttPQiFiJJHFMMx
	3n8RezkzdgGAY/gYaV7twHABLUhq4UKKEVnb0EDqdLR6rNQFvK+0+9NaaA2YkrIe2BzXP4vPC8hHU
	DzfgPRGmxLaTt2yfvjgwGxx8gPP0YubRidLrkHeCzFYDPZmZ9a+LdoCnP/iRrwxvtmJW1rXOKpQYE
	vdgcTO1/3uZWjGdRHM8AbwooFuW5hrqv0fh6Ke6Qg9ktTeZD+a+8l64LK2RbirUC6kndKXDEgYiTw
	EcCnD1lA==;
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v864x-00000003vWK-2fOv;
	Mon, 13 Oct 2025 00:06:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xeqSjPaS+EE7KT6ECrLz+2ULY+x0uiU+34jlerX5hRtK17rRifQ13PS5HZCJtxDi3Vw1//sWV8pfPW1Un4mDvDi+MaBNFlQjgktomY2+Bo6h6cOuxVT5c/yuxEkZXXjgB3Og6XBtOdlrTn117luDuyYMHoJix2NW5/sSQ/bQdbkn18Fw/i3EcPk5IuCr009dvzlIhOKeFq+7FNEnMtVtcDbYc7rHyrdKn5PYYfKvaNXP9j2Mq3uNzqJdgWfH6mdiTCjMxXpePxdfyDpjYQ3ADZrNvgtZ+wQngzZYsnO78OJZ7MgOjAm2FDlbcwxPdRVc4GLoNaDTY/kA2GHFk6XhcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZhnAVkk/Gr9E3NFFvXPlym24B3zW08aSeHSO9JVS1E=;
 b=ObWgWXvpidpYKaNIyvoTmJGKhCBKL4GCWC028bOyjXXvTu6pg68mPHnMTNI6FYvejVUX/QK6XFhEJyQl8Do535ziHRiB0FFkPr3GtJMZd9OAywUfDWVrbMkp23LRo1BRqUkE+cXJfIszcAww9o9hTy1VyrDtnNsPECNGuw8rpp/YqcE3wnVsCK74F08RG56MFQp94PSwPz9lvMoot2sdgXhAuszD33hqDKngWAMeRo8DzIy7i0PSHNZIogqoGC9zXLrOQs910SThonNp4FVAy0Sb40l5Ch4EE63Vs0DwXQ7MMaltO1voS8NRmUhq+KzJk0S0pBuiDQPEGg1DARA9yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZhnAVkk/Gr9E3NFFvXPlym24B3zW08aSeHSO9JVS1E=;
 b=c9Fnt8Gr+F7Qm7fQd6NxyNqsHbdw/wfPxh8HZ8fiRjQbIDKEFRliOhKNIYi1Z9x9m+1wzo7Yzus+AnAzdCkc6wyuAOum4GbVxMQIkJjaDsBqHaEwH0gZwA3Ze0z0ro6wN0dzZJQl3GI1RBdoXRUF5j6Sz6HzqNCdhdiWoxRSrQ4qoG2ud5ElMtnUKC/Tzwy6GuHjF9J13p2Imn6asqws484mp8jvjODVQBz290+kFuhSvlMvBYGE3KFkoXYpiUoxqII4wXn9cmhaIYE8s5vRXYbfoGBa58jA0mM91oveXBXE8D+qXIYwaE2j/eDQIIW9wGBW18OEI/WBe0MB81K1ag==
Received: from CY5PR17CA0005.namprd17.prod.outlook.com (2603:10b6:930:17::7)
 by IA1PR12MB6356.namprd12.prod.outlook.com (2603:10b6:208:3e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Mon, 13 Oct
 2025 00:06:03 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:930:17:cafe::dd) by CY5PR17CA0005.outlook.office365.com
 (2603:10b6:930:17::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 00:05:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:06:02 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Sun, 12 Oct
 2025 17:05:42 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:05:41 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:05:39 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <joro@8bytes.org>, <jgg@nvidia.com>, <kevin.tian@intel.com>
CC: <suravee.suthikulpanit@amd.com>, <will@kernel.org>,
	<robin.murphy@arm.com>, <sven@kernel.org>, <j@jannau.net>,
	<jean-philippe@linaro.org>, <robin.clark@oss.qualcomm.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <yong.wu@mediatek.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<tjeznach@rivosinc.com>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <heiko@sntech.de>, <schnelle@linux.ibm.com>,
	<mjrosato@linux.ibm.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<samuel@sholland.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <virtualization@lists.linux.dev>,
	<patches@lists.linux.dev>
Subject: [PATCH v1 05/20] iommu/amd: Implement test_dev callbacks to domain ops
Date: Sun, 12 Oct 2025 17:05:02 -0700
Message-ID: <6ce261ebacddec3a528c5b303a40476aad422dd5.1760312725.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760312725.git.nicolinc@nvidia.com>
References: <cover.1760312725.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|IA1PR12MB6356:EE_
X-MS-Office365-Filtering-Correlation-Id: d1bcd165-1730-4bbc-92dc-08de09ec4c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eDA+kHHwXpdFp5fVxnAtbpYocYPc8iElsE7BHAt6bLWDY92qqEr400j231jw?=
 =?us-ascii?Q?uRtEhpZRyQ5mIXhRm0bnbwlddyg34IaO5GS23HtpaJmnpWijp7Pg8IeQdGZW?=
 =?us-ascii?Q?fGSQUNYVxC25Hjj0Mv1EqCi3qZcazq113AoEveLTSmSAF/FWT2WYqbQTnK17?=
 =?us-ascii?Q?e46z9pva7tDsA9q5izgqbQYVWf91g3JrBBTVdLDcW3WrcAlhVXdat8b0bGtx?=
 =?us-ascii?Q?QCWQWDRcNRTOUEBxxpvjfsoDDjirIsUCRsaLopUwzJuXx+6xN6NisF48N3N4?=
 =?us-ascii?Q?NerN2JrUxMpo5fyz1jGWtMnCLS0D2byfjLB9I29ZbNidtRpHS6k83gTvi316?=
 =?us-ascii?Q?ZdwPLlpUxb/xy4ZTtZF4XxgFN9pjf7n0VfQiRwHmCxe9vklONNFO7W9uyr/F?=
 =?us-ascii?Q?fp4Kp8rQBTHuIrhiHqc5AolFYqLAQJREVh8BQn9JlwzNOLiLHIkCV5KOVlPc?=
 =?us-ascii?Q?5eBo9hFGdFnBY1NfGM4WCMh9DXzqLg2WX7ZO6jnUTx1oJnqMHKbaw2ts9vLt?=
 =?us-ascii?Q?5+T9MvPG9Ki+YDhcAqSQdrN3FpjYjW3KJxVWHpNqKvHloVNsw3obiKjbJ8PG?=
 =?us-ascii?Q?TF800DL7dYLS652EikHDHhUgdhIvqUdnPqXtvWP9+QMAI2O58AoJ4jb5jC9v?=
 =?us-ascii?Q?QvbJ0YH0B93HQGF/zEBVYUVUGoe0FJVSdH8ItFL8CNlc3Tf3IApEUam9OYIu?=
 =?us-ascii?Q?LeJfTFj2o/s/iAY/mmcjNvJtM1bywti4j/w5nHKaNSbHm0Sd5J21XQpzAzo5?=
 =?us-ascii?Q?dtXUTV8hFB60jMRiS/iklwtm0Ju07Dn7AV3i6M7BXO2tNxgit8wxZioWZa/2?=
 =?us-ascii?Q?fM16eFhZ+Q1dfN5DuV0Ek6f7IVkVLyMluZrCcKglqKohuWIx7Lx8p/DlqN38?=
 =?us-ascii?Q?kOzjPU0yHguaDI6d863c/k3bdAxB5ZYciwMicOPlH3Qh4pygxeLs06v2cEgX?=
 =?us-ascii?Q?Ur9IAMx/UEFX9leKVAtTrHpmmECqfljQoLJ6Ej0rA53O5pSMssN3t87VLqrQ?=
 =?us-ascii?Q?nCxtgp1B/Sx1oFXcV35jcbGPYDHogAt2g9xO+NWTM2i2hQD8hX/wPCHhPiBA?=
 =?us-ascii?Q?LD+lysCbLnGn4jhEbZd24kxgY+6/WGEoSjXAFvoSjHBN1S5tXvh9Hnb+JqZG?=
 =?us-ascii?Q?b4bmi8D8p72JQwikzyNkGzmZZHt72SUcO0rHmDJnjImH3V56Bc6d9CPVgl3t?=
 =?us-ascii?Q?FNcPygD0TJ5uJmmgUDqUTdTlvFcNKJzQQ7bEBddbyQ+MrGwF7hamnVf1C1Pq?=
 =?us-ascii?Q?3nnRUAG6I4dbaoldGOEnsTgesHrabTLi2jpeGQ2YC9agNNMXerwkcnwqA+/Z?=
 =?us-ascii?Q?weaSyW8GF8hJ/Lj77wA68A1w53KBfBpOPn3KPPR+3Z1CjTitAlBrNiruAuXs?=
 =?us-ascii?Q?VwznAbqAhJZ9r3oGtzRWe892ETHCvRrxKxO8XyKfOW5theO89i1J/KqzuXhd?=
 =?us-ascii?Q?1z41vHLHMOWE4DCm4VfAnzQkPhRiEE2bSXVFwZAuBJCqJdTP5ziYkwuxn9E9?=
 =?us-ascii?Q?klRFeocA/1HtluvFfxuOVTgcTbdG/oOG7Hn1GAkYeO0tdM4mRfT+1sCuBtrY?=
 =?us-ascii?Q?10ik2dFguqcGHuvRCQ4=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:06:02.9886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1bcd165-1730-4bbc-92dc-08de09ec4c53
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6356
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_010628_682067_71874A1E 
X-CRM114-Status: GOOD (  18.23  )
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

Move sanity and compatibility tests from the attach_dev callbacks to the
new test_dev callback functions. The IOMMU core makes sure an attach_dev
call must be invoked after a successful test_dev call.

Correct the errno upon malloc failure. Also, drop the function prototype
of iommu_sva_set_dev_pasid() from the header and make it static, as only
pasid.c uses it.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/amd/amd_iommu.h |  3 ---
 drivers/iommu/amd/iommu.c     | 27 +++++++++++++++++++--------
 drivers/iommu/amd/pasid.c     | 29 +++++++++++++++++++----------
 3 files changed, 38 insertions(+), 21 deletions(-)

diff --git a/drivers/iommu/amd/amd_iommu.h b/drivers/iommu/amd/amd_iommu.h
index 9b4b589a54b57..f99fa4da34996 100644
--- a/drivers/iommu/amd/amd_iommu.h
+++ b/drivers/iommu/amd/amd_iommu.h
@@ -52,9 +52,6 @@ struct protection_domain *protection_domain_alloc(void);
 struct iommu_domain *amd_iommu_domain_alloc_sva(struct device *dev,
 						struct mm_struct *mm);
 void amd_iommu_domain_free(struct iommu_domain *dom);
-int iommu_sva_set_dev_pasid(struct iommu_domain *domain,
-			    struct device *dev, ioasid_t pasid,
-			    struct iommu_domain *old);
 void amd_iommu_remove_dev_pasid(struct device *dev, ioasid_t pasid,
 				struct iommu_domain *domain);
 
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index e16ad510c8c8a..dc0406427dcf8 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -70,6 +70,8 @@ int amd_iommu_max_glx_val = -1;
  */
 DEFINE_IDA(pdom_ids);
 
+static int amd_iommu_test_device(struct iommu_domain *dom, struct device *dev,
+				 ioasid_t pasid, struct iommu_domain *old);
 static int amd_iommu_attach_device(struct iommu_domain *dom, struct device *dev,
 				   struct iommu_domain *old);
 
@@ -2670,6 +2672,7 @@ static struct iommu_domain blocked_domain = {
 static struct protection_domain identity_domain;
 
 static const struct iommu_domain_ops identity_domain_ops = {
+	.test_dev = amd_iommu_test_device,
 	.attach_dev = amd_iommu_attach_device,
 };
 
@@ -2686,12 +2689,26 @@ void amd_iommu_init_identity_domain(void)
 	protection_domain_init(&identity_domain);
 }
 
+static int amd_iommu_test_device(struct iommu_domain *dom, struct device *dev,
+				 ioasid_t pasid, struct iommu_domain *old)
+{
+	struct amd_iommu *iommu = get_amd_iommu_from_dev(dev);
+
+	/*
+	 * Restrict to devices with compatible IOMMU hardware support
+	 * when enforcement of dirty tracking is enabled.
+	 */
+	if (dom->dirty_ops && !amd_iommu_hd_support(iommu))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int amd_iommu_attach_device(struct iommu_domain *dom, struct device *dev,
 				   struct iommu_domain *old)
 {
 	struct iommu_dev_data *dev_data = dev_iommu_priv_get(dev);
 	struct protection_domain *domain = to_pdomain(dom);
-	struct amd_iommu *iommu = get_amd_iommu_from_dev(dev);
 	int ret;
 
 	/*
@@ -2703,13 +2720,6 @@ static int amd_iommu_attach_device(struct iommu_domain *dom, struct device *dev,
 
 	dev_data->defer_attach = false;
 
-	/*
-	 * Restrict to devices with compatible IOMMU hardware support
-	 * when enforcement of dirty tracking is enabled.
-	 */
-	if (dom->dirty_ops && !amd_iommu_hd_support(iommu))
-		return -EINVAL;
-
 	if (dev_data->domain)
 		detach_device(dev);
 
@@ -3047,6 +3057,7 @@ const struct iommu_ops amd_iommu_ops = {
 	.def_domain_type = amd_iommu_def_domain_type,
 	.page_response = amd_iommu_page_response,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.test_dev	= amd_iommu_test_device,
 		.attach_dev	= amd_iommu_attach_device,
 		.map_pages	= amd_iommu_map_pages,
 		.unmap_pages	= amd_iommu_unmap_pages,
diff --git a/drivers/iommu/amd/pasid.c b/drivers/iommu/amd/pasid.c
index 77c8e9a91cbca..474494a66dd40 100644
--- a/drivers/iommu/amd/pasid.c
+++ b/drivers/iommu/amd/pasid.c
@@ -99,31 +99,39 @@ static const struct mmu_notifier_ops sva_mn = {
 	.release = sva_mn_release,
 };
 
-int iommu_sva_set_dev_pasid(struct iommu_domain *domain,
-			    struct device *dev, ioasid_t pasid,
-			    struct iommu_domain *old)
+static int iommu_sva_test_dev(struct iommu_domain *domain, struct device *dev,
+			      ioasid_t pasid, struct iommu_domain *old)
 {
-	struct pdom_dev_data *pdom_dev_data;
-	struct protection_domain *sva_pdom = to_pdomain(domain);
 	struct iommu_dev_data *dev_data = dev_iommu_priv_get(dev);
-	unsigned long flags;
-	int ret = -EINVAL;
 
 	if (old)
 		return -EOPNOTSUPP;
 
 	/* PASID zero is used for requests from the I/O device without PASID */
 	if (!is_pasid_valid(dev_data, pasid))
-		return ret;
+		return -EINVAL;
 
 	/* Make sure PASID is enabled */
 	if (!is_pasid_enabled(dev_data))
-		return ret;
+		return -EINVAL;
+
+	return 0;
+}
+
+static int iommu_sva_set_dev_pasid(struct iommu_domain *domain,
+				   struct device *dev, ioasid_t pasid,
+				   struct iommu_domain *old)
+{
+	struct iommu_dev_data *dev_data = dev_iommu_priv_get(dev);
+	struct protection_domain *sva_pdom = to_pdomain(domain);
+	struct pdom_dev_data *pdom_dev_data;
+	unsigned long flags;
+	int ret;
 
 	/* Add PASID to protection domain pasid list */
 	pdom_dev_data = kzalloc(sizeof(*pdom_dev_data), GFP_KERNEL);
 	if (pdom_dev_data == NULL)
-		return ret;
+		return -ENOMEM;
 
 	pdom_dev_data->pasid = pasid;
 	pdom_dev_data->dev_data = dev_data;
@@ -175,6 +183,7 @@ static void iommu_sva_domain_free(struct iommu_domain *domain)
 }
 
 static const struct iommu_domain_ops amd_sva_domain_ops = {
+	.test_dev      = iommu_sva_test_dev,
 	.set_dev_pasid = iommu_sva_set_dev_pasid,
 	.free	       = iommu_sva_domain_free
 };
-- 
2.43.0


