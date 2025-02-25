Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7BFC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 17:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H23MZTa9PfhxhiEvruW5o79lf9Zye7dvmLXJYsQIxuw=; b=uiuuDMJIo4HyTesrWHPR08HHPC
	MOKtbQIQ5wHtdrpEK7oiJAQIgxaHlo8iXmg5ui9ge0mPHi3ZgfUfDuCzHf/6fawAplL4VX1aSd6Li
	Kj6Hk/B+RoCWNeWE7IeRobqGuXCls4skUuKWnQ0hBSmyDxAV1F8mgeJUJEjIWmy8JDJiBunjMmMI8
	wJY6RTB7+xB/CbGXpTQXuMLPgP7qLXBBtkKga/lSRuIZtaCx18iRbiNE1bZtYuYZcJe8yhYf7sLea
	pE6vi/LuLKbsxmK2CXz718FVEBk1odm1LtIvjby3hGLV9mSibxBt2dSEDPNp7IAOR/EJkG8S0R7Vb
	keS0zb2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmz4Y-00000000kNE-3Yr6;
	Tue, 25 Feb 2025 17:50:22 +0000
Received: from mail-dm6nam11on20631.outbound.protection.outlook.com ([2a01:111:f403:2415::631] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyhM-00000000dFP-43xC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:26:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTvohXAmUGpfjHkdPJkPzhqB37eqFKpD3heMIyQii8g273rWwmvzSpZJ+Ypfk7jG9Cx8j/glqu1EkxRpaxRx/oL73AjLuDyMovQeC3lDt8TIpQPGQtWRo9D8lRIbuZ1dNF/5v7w0Lm1Ag2s1AgTxXKunWGfcZRVr5uILxkvb/JvzxZO1psvipnrqbyOeAyFpEZrTyzUQzrKtMa+RHo2k0/Yo0CED9TvLjZxLKvqIEs8Pp60ZdPi69GYTvGJqXrE2KGgnFYLU+NF63dyImBwp3HnnrRMxMNjQugPeufiDxmcN8mn+4hy1qDJfgD5UZUa/oVzcpBqdeLFqByoa5DEvYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H23MZTa9PfhxhiEvruW5o79lf9Zye7dvmLXJYsQIxuw=;
 b=gkTtAf6GSRMEfzWFhf6eeg4AkYqXU8n73LLhgssYUcC07t9DDNwirWBwXkP/2T7gSUFgZ2IeVZaejnH9TGkmq5RDzCSPeQA14FEfO/06PCsrLADQULosUsBAqJNdl+xcPgw/J3UGxnfJy4VN5SPVSI8su5W/ej8hzSYxIcajmMDJik1Nup1mmJ7mvryxrDX3IZSX8r2v4b61hfQdW51oehtqMcADWWhMN82evbQBRSOJ7KQw+TL9T3Pp4plwdKT4w+bih1ImivshJ/wnulPgOqM7SuYoeQGOgwRv848aXABOJSfFe3+QMt0JV9p5TBSY6tYiJ6KP3sGp/vXmOvrdyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H23MZTa9PfhxhiEvruW5o79lf9Zye7dvmLXJYsQIxuw=;
 b=rCekI41RR3iq7pmJZbSorxhH3upiBFPdmHldILurEa8Lsgtn8VVUfrQcfFkVLJL12237mmfbSZ95vS9zVQRBpmFMVOai1+xNZMxZGpxw8fsscvkZ8hWBv7q7f3pPJXGZCX2f4gvDP5d5E/IHLE+3HIVEhAkC0ZDEKBC+tz9arXgaUGbPj2ehQWP8iAY010pWJr8uD4qHLtXLyL6xJgVvgxbPCjMNzYyHEFS4sTYDjlgUzS9uHEwEZOS84EUvq29sXwlOoCmTRKqtskKHZI6HrNLt53kaZFqi+EiCZW2dj8TutnFiu9ztqnBci7HACQVE0Knj+mcwyRUXyEYeES0ugw==
Received: from DS7P220CA0055.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::7) by
 MW3PR12MB4476.namprd12.prod.outlook.com (2603:10b6:303:2d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.21; Tue, 25 Feb 2025 17:26:20 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:8:224:cafe::f9) by DS7P220CA0055.outlook.office365.com
 (2603:10b6:8:224::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.18 via Frontend Transport; Tue,
 25 Feb 2025 17:26:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.16 via Frontend Transport; Tue, 25 Feb 2025 17:26:19 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 25 Feb
 2025 09:26:06 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 25 Feb
 2025 09:26:06 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 25 Feb 2025 09:26:05 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>
CC: <joro@8bytes.org>, <suravee.suthikulpanit@amd.com>,
	<robin.murphy@arm.com>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <praan@google.com>,
	<patches@lists.linux.dev>
Subject: [PATCH v8 09/14] iommufd/selftest: Add IOMMU_TEST_OP_TRIGGER_VEVENT for vEVENTQ coverage
Date: Tue, 25 Feb 2025 09:25:37 -0800
Message-ID: <e5093f4347a324deff121e952097c4b8d2c00496.1740504232.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740504232.git.nicolinc@nvidia.com>
References: <cover.1740504232.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|MW3PR12MB4476:EE_
X-MS-Office365-Filtering-Correlation-Id: 03f0e077-d662-41ee-6dfe-08dd55c184b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FlQGHwRvxBIFlkjEOgPu/iJ8MsnduR/Qmtvs3kGe8U+k4AxzDJjixQhM6Obz?=
 =?us-ascii?Q?+AXV/cpNqIaZ+rjoIGjb+1oa9QSvImKZqq3Y6L4DhH0M3tH4nz3QxrgYb4K7?=
 =?us-ascii?Q?c3vHR5Lv1GDHvIL6CzJfx5faKRZK0Jh0wK2ZnRk1s6GQKA9f1D+yMexHSXRs?=
 =?us-ascii?Q?HFvlWg8fjIfW+Wn7p9JLh0AdIx8yx2XrPrsG347zV1EUw/bu2/gbxz6IxnUN?=
 =?us-ascii?Q?Tgp5iG6sHhKiNlW/4moN/SVaaGuUdAbY/sgSWn9EYza/oOhjPX5eA7nobqiA?=
 =?us-ascii?Q?BQ2KzOlo8CJwJUbqlwie7Ev14P+2GnitSDj/J4jyphBSNv6yS4nfCFkMdTWN?=
 =?us-ascii?Q?WjExMJFxLwrqgUnNzBLs2Em4mYyWaB8pOF5qStDwPc78bfTuQ++F+q3MioSq?=
 =?us-ascii?Q?5rHcpHQoO/KJSXHt+Y7tzpd46grV1KHGxtgcQEc9ouL+dBDjnsSgmiX1NwYw?=
 =?us-ascii?Q?LZifH50DbNOWcXfmEcMimeCDV64G+ScLBShyUdU+IAhEBuFB+Z++tK6jPxr7?=
 =?us-ascii?Q?QSlWikcxH0/61uNL18ISpfviBZPgHEccFYklo9z1Bu+8CiEDpf5D6T46h6Tu?=
 =?us-ascii?Q?b0S6X+gK/OjRKdWBpP6DHyRmRqyewdUbrm9nz5NQiY/q0iyRHy+Jxh43XLrM?=
 =?us-ascii?Q?rFz2QAHVdwZ7o0cP2kEahnnWp4th8nTHODNo7c+foWPhu/3VkUz+ppNZgABI?=
 =?us-ascii?Q?WV9fbk4z4O1/ryM4G9/e3WlTUWjp/eq7TOWHlECWJckM+7vQ23nTIJwNYceB?=
 =?us-ascii?Q?aTUShjX8DmeHAOoEtFVgwvkACLpuajqoBXSdyhObE7WFtwH2f0aVrJY6wu0k?=
 =?us-ascii?Q?W3vrRPdxVBF0hBtwB8w8rAje36eeCgZt5GCNbfWAKIUiYCjPYVfMr5vEDz6x?=
 =?us-ascii?Q?tpoo1FPUdyyKVAmAyNeq3U2cwca3GymVtIdqp+bFuDrIYYld6HS/295Lw8p9?=
 =?us-ascii?Q?ISUSHNncGVzxjwcZC1DavaeGLSKeGA+y49XileLotydj1SeXOcp6Rfo4v7v/?=
 =?us-ascii?Q?XO/4kN46Wn3RrcgawmUieneoMRYDXWBZu4wLSmt3ioOvIdXUfknAoh4n/luq?=
 =?us-ascii?Q?Inl6ZlCWn5VXO2wz6PhDELr3lUJe8w/q96rqvIydxBPLULVv/lBcjjeaUrwy?=
 =?us-ascii?Q?AEoDgzUSDng3STFBgYcsvAoP5sCgtHo68sSfl6gNHHMNDjElaSvRs7qMrq87?=
 =?us-ascii?Q?OVQEBr0ZbvfFgyfYAyUUmxSId3PCGzzCiXudpmEQLTVSpZise2mtDqBoQAzR?=
 =?us-ascii?Q?5M8EBHp3neBBzuaYKtaYrFGUhHTsmGfPAskq+pCw350TVtGJUVQCrdR80xI4?=
 =?us-ascii?Q?1MQYBM2MROrecjL0SY7CGZHjF/JUXcOqpGadU3l+2yPHRkcsiIITYich5pg2?=
 =?us-ascii?Q?B/ZZh9+nbhKVEsGnf5NRKr+c7ueKZQ2C1BacskWUS5Etcrq3fW2KaPJqMluV?=
 =?us-ascii?Q?9ffOmP3PViVgBHgToLencR2UFLyrLpgVGfwMdHLMeMxLlBPc6PS5MTxNZ484?=
 =?us-ascii?Q?DO8sSHIXbp+I6LI=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 17:26:19.8291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f0e077-d662-41ee-6dfe-08dd55c184b5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4476
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_092625_004517_05F37E04 
X-CRM114-Status: GOOD (  11.06  )
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

The handler will get vDEVICE object from the given mdev and convert it to
its per-vIOMMU virtual ID to mimic a real IOMMU driver.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/iommufd_test.h | 10 ++++++++++
 drivers/iommu/iommufd/selftest.c     | 30 ++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/iommu/iommufd/iommufd_test.h b/drivers/iommu/iommufd/iommufd_test.h
index a6b7a163f636..87e9165cea27 100644
--- a/drivers/iommu/iommufd/iommufd_test.h
+++ b/drivers/iommu/iommufd/iommufd_test.h
@@ -24,6 +24,7 @@ enum {
 	IOMMU_TEST_OP_MD_CHECK_IOTLB,
 	IOMMU_TEST_OP_TRIGGER_IOPF,
 	IOMMU_TEST_OP_DEV_CHECK_CACHE,
+	IOMMU_TEST_OP_TRIGGER_VEVENT,
 };
 
 enum {
@@ -145,6 +146,9 @@ struct iommu_test_cmd {
 			__u32 id;
 			__u32 cache;
 		} check_dev_cache;
+		struct {
+			__u32 dev_id;
+		} trigger_vevent;
 	};
 	__u32 last;
 };
@@ -212,4 +216,10 @@ struct iommu_viommu_invalidate_selftest {
 	__u32 cache_id;
 };
 
+#define IOMMU_VEVENTQ_TYPE_SELFTEST 0xbeefbeef
+
+struct iommu_viommu_event_selftest {
+	__u32 virt_id;
+};
+
 #endif
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index ba84bacbce2e..d55dde28e9bc 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -1621,6 +1621,34 @@ static int iommufd_test_trigger_iopf(struct iommufd_ucmd *ucmd,
 	return 0;
 }
 
+static int iommufd_test_trigger_vevent(struct iommufd_ucmd *ucmd,
+				       struct iommu_test_cmd *cmd)
+{
+	struct iommu_viommu_event_selftest test = {};
+	struct iommufd_device *idev;
+	struct mock_dev *mdev;
+	int rc = -ENOENT;
+
+	idev = iommufd_get_device(ucmd, cmd->trigger_vevent.dev_id);
+	if (IS_ERR(idev))
+		return PTR_ERR(idev);
+	mdev = to_mock_dev(idev->dev);
+
+	down_read(&mdev->viommu_rwsem);
+	if (!mdev->viommu || !mdev->vdev_id)
+		goto out_unlock;
+
+	test.virt_id = mdev->vdev_id;
+	rc = iommufd_viommu_report_event(&mdev->viommu->core,
+					 IOMMU_VEVENTQ_TYPE_SELFTEST, &test,
+					 sizeof(test));
+out_unlock:
+	up_read(&mdev->viommu_rwsem);
+	iommufd_put_object(ucmd->ictx, &idev->obj);
+
+	return rc;
+}
+
 void iommufd_selftest_destroy(struct iommufd_object *obj)
 {
 	struct selftest_obj *sobj = to_selftest_obj(obj);
@@ -1702,6 +1730,8 @@ int iommufd_test(struct iommufd_ucmd *ucmd)
 					  cmd->dirty.flags);
 	case IOMMU_TEST_OP_TRIGGER_IOPF:
 		return iommufd_test_trigger_iopf(ucmd, cmd);
+	case IOMMU_TEST_OP_TRIGGER_VEVENT:
+		return iommufd_test_trigger_vevent(ucmd, cmd);
 	default:
 		return -EOPNOTSUPP;
 	}
-- 
2.43.0


