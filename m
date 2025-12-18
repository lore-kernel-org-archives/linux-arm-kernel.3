Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC10D711AE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 20:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CrL+G5BHjhDwWoUwPO+4ujL7+Wg9pmMxr2+OMIDx4TA=; b=gB5BPei0hyX9gFhnypM0ajfl+g
	mx61fZmeDT4JQ2ZCHGspRTys92aDmla7nRRCazetWtLvCAmgGGKC2qY9ZZl4LkwlPsv9kVWKl+tWH
	GXP2brsMtc2Ju+jCv6fMnC4L1XMnEfKdcjZCgSwd2jE9Gc+Aa0BwkXH5/05M/9+OkuqCVnwD4fMjO
	GehTTHG2AMraF98+JwsZDp5ALVuRHIKrC44jF76gd2ZgVyz4eOrKaB/Iwtq/wvK1T3Z6/1IyXklgE
	aJ2YpT4Fdg+ZmyVXNM7GsuhGoNvXDVCkCF1Qe2lm3Q1XQWnR/NFWSWHWD1QWU1SZrlfX6N0eBY+1L
	if5C2yiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWKbX-000000099ds-1lLM;
	Thu, 18 Dec 2025 20:28:07 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWKbO-000000099TY-06Fm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 20:27:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxkzgxKiSShclCRYmdjkquaUfPgXAjq2EUUk9dOwZIGlMa8Zg3W2eZMMinCGUNpQ94zhKYddI8ggTHnKUhNq118NwljYJ2UlG3kjKGq1SExzO94YSqueltl01CUrR4jbXj/pk5qYZ6ZuLQclocZ+kPpRYGDWeJpRoVb/icY6RjnmdnBO33X+ID+W8MOBUwTu54+3SBtudPxmK0Zp9zqK3oMGpGot6JXHGlTp95fN0g7TJeYi7UrWmLfORgS6xt1+M+ypBCUWvDSKCL/cXuHBD53979UN1KzcWA6KlIGqUav1BAjdJuXoDxe3zuq3XVtVW34whXclLh2pye/pqali7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrL+G5BHjhDwWoUwPO+4ujL7+Wg9pmMxr2+OMIDx4TA=;
 b=Lm5+J6lCtW5Hbq43lwgLNfAZZRWnLzKIYmVyPBO1zCdckYxmS4Y+y/wir1HZE0+B8PrWV+VCTYxf8MixSdxknyedt1sss3MieJE6XOllCqitTf3rmOoXflKsCiuqQy08ye9KjYHbxzg7RdFTAhpAFYjLlZ7AzTPb4v/JjpbOUrUU2Eyb0DMmDurs9azYMELsPQZRRCexKWCUj9WHQyhzSSHy3I960cTy0uI0uUcKJ2mb9VJ2hFxfa7LkR/jEckfrxw2ltFSywr5EqtMMQ4TqI1SkEYPFxwTfHoJM8NXHruITAzmLSrF29lQ6JjpPW6yxt2yh2XZCOhzYcCHrBs9w0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrL+G5BHjhDwWoUwPO+4ujL7+Wg9pmMxr2+OMIDx4TA=;
 b=ZtyJ1SrkmawC2GCCCUwmXiIALqaXgrD7ejXlEcZrQ/wsyWEv6c0ooRe3mF11QYCS6bcnFK5YLr20G9NeLFExnV3QVFd7h1Wt5kJuidpNjPxlf+TaH45i4ihA1Rbb+BMbxaKvcM1VQlezSx5fPHDvHXQLFDdZ9D1qd4go4sMVCT/tyzmMw6/TRNK66gqgvxh8jK+/hsXBiNLDN/gXvef8vyXcLtokWt2nX1PrRY7xbI48xD5QZu3qDpoKgvacvZJEM61gTu5AGdhBGFQTJYkbIimjqrIs83ev02iUHJaScxiUdXYSneJBYPfena0Xmu9xmAB39z/efujjuz2gyU3cag==
Received: from DM6PR08CA0006.namprd08.prod.outlook.com (2603:10b6:5:80::19) by
 CY1PR12MB9650.namprd12.prod.outlook.com (2603:10b6:930:105::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 20:27:47 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:5:80:cafe::1) by DM6PR08CA0006.outlook.office365.com
 (2603:10b6:5:80::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 20:27:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 20:27:46 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 12:27:22 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 12:27:21 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Dec 2025 12:27:21 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <jpb@kernel.org>, <praan@google.com>,
	<miko.lenczewski@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<patches@lists.linux.dev>
Subject: [PATCH v1 7/9] iommu/arm-smmu-v3: Remove free_fn argument from arm_smmu_invs_unref()
Date: Thu, 18 Dec 2025 12:26:53 -0800
Message-ID: <0520abb3e9f64cc4f5ee6d64b0c72ff2f2718aba.1766088963.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766088962.git.nicolinc@nvidia.com>
References: <cover.1766088962.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|CY1PR12MB9650:EE_
X-MS-Office365-Filtering-Correlation-Id: abab165b-7680-47a8-61ae-08de3e73e7f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BHyrejLGEQ3x9IBEEgKZ8Nu/5HTs0ufyJ9Su7MyZYBrID7egS7X2sQoZ0Bhq?=
 =?us-ascii?Q?oCvGTgdBn+Jg2hFCqgkjdsUZ7+3/6OPIfvI4xvrwdRE0j+1mRwIbbD/D0hj/?=
 =?us-ascii?Q?+UG5TT0AFI5kwDfGcrie4hjTtZR3cEBbaNUqwaGhHVWZtib0t1iD99jIf9k2?=
 =?us-ascii?Q?H4WJe267SM98bXStpYYpAWqqcNgGF2OKiD9FdKmH+L0DZYitestRQkYUrvhy?=
 =?us-ascii?Q?v75ygDEeRq4WBjpvPFOz6rvLzhaDB9O+Ce2T9Y8y6K1q4I4F413Z7GWLZzol?=
 =?us-ascii?Q?aTghIVFdf4/bHn1PlRoCHGfHsjU9WvTFujXL4ojHyxYqi71slUn0ZcuOv0Sp?=
 =?us-ascii?Q?VsD5G89tMBm/MJvoF+y8oeufEMAG6TKYlGKRwSKaWNjJz+aDsIQLNWiv46Va?=
 =?us-ascii?Q?ofUmomqwmQRapR5kyZv0AWHlFfqy24cSOfYplqdqvjQvVRZeZO8F+VcsXE3Q?=
 =?us-ascii?Q?rvVmaWK8e9LTkPBojTE/EzkFk/JPHAhyKoufkJWtyxbapZJkioBF/6mHx4jk?=
 =?us-ascii?Q?jHLB/e4Dvjns6TcsbP7nLumpHHArMJABoYIHsIeM/JU+aASs2ffUgPfVggdb?=
 =?us-ascii?Q?arZT7x/XfWEVidx7zA9nIvP2mWm6Jq8Y64O+JuqxoYcMA3g2radQHgFlqOxK?=
 =?us-ascii?Q?kjyh2Y3jviPecVqbACRR2DGqgPOLqg1dlLQ3/cPO18UlAq3BRed2q9iyr0ud?=
 =?us-ascii?Q?PondFck7IlUymW2OSIVa/CkNhQpPl2Kp/q13fcFAtDUNWgPoRJIZqDbXmOg2?=
 =?us-ascii?Q?xyNiCJgKp20dFcU/NY+krxSH2ZabDPv4vzR5B5IqShZcXLOGWATCMGCJvcQe?=
 =?us-ascii?Q?FeUshaiv4sNEY5uRzgnUClFGsm0T9HjwzYOR0bl54543QbvRDAmCGciN1MNl?=
 =?us-ascii?Q?1Zrx3+OgG3uoWVCKmOGwKiFTDA2ux90Zj3yHcurgLEHXailWq1wNAmL8NZ4A?=
 =?us-ascii?Q?5la3xVDB8BLxdB28wcH3Ra7qBWsXeEkSlyXsmfOY4kMDr0UUcI0PhjoJNY+d?=
 =?us-ascii?Q?WPtC8vCin68L/mEOeDRn1SJRYtNHoO0rJaQ2aVPz2zMtFM0MDsiD4yEuq9gz?=
 =?us-ascii?Q?U/gXads4y6M3LkypBCXYl9xNDUIhpKufoXFB2FAylScWYsmKh13jxApAVg64?=
 =?us-ascii?Q?Xwziz3tnw2XmUvMyXeS0S/g54Ba/39Mez6dDs3vXHi6fNmdMDatwSs1xP1Ow?=
 =?us-ascii?Q?49e7Axh5/VNQuW7EsjbJDEXgvxccA/ggkG0VHqQAbOmPttEejnhoSMd1VJY4?=
 =?us-ascii?Q?SMhmmKTINtMCsi//e12GJRD2Ui7GnA4l4NO8NDbR0bJ+YoTkUgo4npzWtEar?=
 =?us-ascii?Q?XPZ5GLH1sRYnTuwQez8LuVHJYiAJNye63NnD/i6GunXbCXURCD5bkwyBH7gA?=
 =?us-ascii?Q?w4PAWfQGiHCK51wsSY9NC1+p0ApXveI3QmFaHby8XLeIkOhuz5qgRlOwYmHQ?=
 =?us-ascii?Q?/phrqHVjoV0OktwqOXApQM9Jz9361I+f7ulC0NiMoFSBQDpHNnIP18pB6+gE?=
 =?us-ascii?Q?uojK0dRCGHEvyFDw3NHi9+0P1eOh/Vz4ktJA8Xwm8jB8rt51ZOqNMga3nrP7?=
 =?us-ascii?Q?5blq8Wlpe3PHs5SlqOE=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 20:27:46.5736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abab165b-7680-47a8-61ae-08de3e73e7f7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9650
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_122758_142541_BBAE280B 
X-CRM114-Status: GOOD (  12.29  )
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

This is dead code now. Remove it.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  3 +-
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  |  6 ++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 34 ++-----------------
 3 files changed, 6 insertions(+), 37 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index dac412ff0d71..e38d2394e3be 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1035,8 +1035,7 @@ void arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
 struct arm_smmu_invs *arm_smmu_invs_merge(struct arm_smmu_invs *invs,
 					  struct arm_smmu_invs *to_merge);
 void arm_smmu_invs_unref(struct arm_smmu_invs *invs,
-			 struct arm_smmu_invs *to_unref,
-			 void (*free_fn)(struct arm_smmu_inv *inv));
+			 struct arm_smmu_invs *to_unref);
 struct arm_smmu_invs *arm_smmu_invs_purge(struct arm_smmu_invs *invs);
 #endif
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index ead0d84cc9a0..5c8cb43f849c 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
@@ -632,7 +632,7 @@ static void arm_smmu_v3_invs_test(struct kunit *test)
 				     results2[0], results2[1]);
 
 	/* Test3: unref invs2 (same array) */
-	arm_smmu_invs_unref(test_a, &invs2, NULL);
+	arm_smmu_invs_unref(test_a, &invs2);
 	arm_smmu_v3_invs_test_verify(test, test_a, ARRAY_SIZE(results3[0]),
 				     results3[0], results3[1]);
 	KUNIT_EXPECT_EQ(test, test_a->num_trashes, 0);
@@ -644,7 +644,7 @@ static void arm_smmu_v3_invs_test(struct kunit *test)
 				     results4[0], results4[1]);
 
 	/* Test5: unref invs1 (same array) */
-	arm_smmu_invs_unref(test_b, &invs1, NULL);
+	arm_smmu_invs_unref(test_b, &invs1);
 	arm_smmu_v3_invs_test_verify(test, test_b, ARRAY_SIZE(results5[0]),
 				     results5[0], results5[1]);
 	KUNIT_EXPECT_EQ(test, test_b->num_trashes, 2);
@@ -656,7 +656,7 @@ static void arm_smmu_v3_invs_test(struct kunit *test)
 				     results6[0], results6[1]);
 
 	/* Test7: unref invs3 (same array) */
-	arm_smmu_invs_unref(test_a, &invs3, NULL);
+	arm_smmu_invs_unref(test_a, &invs3);
 	KUNIT_EXPECT_EQ(test, test_a->num_invs, 0);
 	KUNIT_EXPECT_EQ(test, test_a->num_trashes, 0);
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index d51bad1002ff..5052988b0e4e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1203,9 +1203,6 @@ EXPORT_SYMBOL_IF_KUNIT(arm_smmu_invs_merge);
  *                         the user counts without deletions
  * @invs: the base invalidation array
  * @to_unref: an array of invlidations to decrease their user counts
- * @free_fn: A callback function to invoke, when an entry's user count reduces
- *           to 0
- *
  * Return: the number of trash entries in the array, for arm_smmu_invs_purge()
  *
  * This function will not fail. Any entry with users=0 will be marked as trash.
@@ -1223,8 +1220,7 @@ EXPORT_SYMBOL_IF_KUNIT(arm_smmu_invs_merge);
  */
 VISIBLE_IF_KUNIT
 void arm_smmu_invs_unref(struct arm_smmu_invs *invs,
-			 struct arm_smmu_invs *to_unref,
-			 void (*free_fn)(struct arm_smmu_inv *inv))
+			 struct arm_smmu_invs *to_unref)
 {
 	unsigned long flags;
 	size_t num_invs = 0;
@@ -3500,31 +3496,6 @@ arm_smmu_install_new_domain_invs(struct arm_smmu_attach_state *state)
 		state->master->vmid = invst->iotlb_tag.id;
 }
 
-/*
- * When an array entry's users count reaches zero, it means the ASID/VMID is no
- * longer being invalidated by map/unmap and must be cleaned. The rule is that
- * all ASIDs/VMIDs not in an invalidation array are left cleared in the IOTLB.
- */
-static void arm_smmu_inv_flush_iotlb_tag(struct arm_smmu_inv *inv)
-{
-	struct arm_smmu_cmdq_ent cmd = {};
-
-	switch (inv->type) {
-	case INV_TYPE_S1_ASID:
-		cmd.tlbi.asid = inv->id;
-		break;
-	case INV_TYPE_S2_VMID:
-		/* S2_VMID using nsize_opcode covers S2_VMID_S1_CLEAR */
-		cmd.tlbi.vmid = inv->id;
-		break;
-	default:
-		return;
-	}
-
-	cmd.opcode = inv->nsize_opcode;
-	arm_smmu_cmdq_issue_cmd_with_sync(inv->smmu, &cmd);
-}
-
 /* Should be installed after arm_smmu_install_ste_for_dev() */
 static void
 arm_smmu_install_old_domain_invs(struct arm_smmu_attach_state *state)
@@ -3541,8 +3512,7 @@ arm_smmu_install_old_domain_invs(struct arm_smmu_attach_state *state)
 	if (!invst->invs_ptr)
 		return;
 
-	arm_smmu_invs_unref(old_invs, invst->new_invs,
-			    arm_smmu_inv_flush_iotlb_tag);
+	arm_smmu_invs_unref(old_invs, invst->new_invs);
 	*old_iotlb_tag = invst->new_invs->inv[0];
 
 	new_invs = arm_smmu_invs_purge(old_invs);
-- 
2.43.0


