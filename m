Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712F7C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 17:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQBZjfqsEja8e8SgqKwFCXVFDxNqAVH4JCPU4XDUpdI=; b=zuaQfku61USY/b9BxmANEz+vkq
	ujabFuGMXDdm6k1DlTrY9IZZdDGSA2EIgF0HwKSvaj3lJgD3n0lPh17VrkJ5HZJY522jcKB/SMe9G
	7rCx2vJntJQTOtS/jqOJynrSVkCkJjGoBnDe1Ni2cN4NY9ZmssoUnhdvIxIW847GlHro+fF+OyY26
	VD/4yxng9Ra/eu273uSgAMXnOYC9n3bJBtQ6wgHHr0guzhSRdnhaSh50m581EkK4rjQnUNF+6vTDV
	t2tlHg/oO+X29QBRBBPoeuiYPzN+KiAZr1xdY50SdfjFN6BOWhmFrVwDszA6XKOEz2mH9bXewFEpu
	OTJZ6phQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8XT-00000008lMS-3Cm8;
	Wed, 29 Jul 2026 17:57:55 +0000
Received: from mail-southcentralusazon11013007.outbound.protection.outlook.com ([40.93.196.7] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8XH-00000008lGp-4Ahw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 17:57:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2kfFE0kwlR4qmm6nyf6h8H6QbkzxsrznAHc80qowqClGM7v4dElDjCfK4Hjl7uFkbJZ5V2vbIGKy5XS+tFMfRx+7s1AeG2MrbbW1SSjTM7QYCHztWDlF0b58tzBOuBlVw3oXkwUOe5RRu1LfNQAbyhIrWbKE3EDcEHXUFHo1duACKh0YUJacqspevL1LYW6i2A/lIm/tuwSgZeQFRS56dYkcG/ogMuUZAFxlR/ARN8Pe0KyeGBDa7OYAxAEy1rlB6ajTueyCGdFSUET1sxIeul8slx3Gs9D6sEBVmvojVuFDfbR9sh6XY/yBQPcH0xM8/yArapQcTJ5IkNobe6+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQBZjfqsEja8e8SgqKwFCXVFDxNqAVH4JCPU4XDUpdI=;
 b=jGVihuR39uEtXxCl0r1sJ486lgxhbNNU7tXu9VCWCagG4Zf+ilDj4svdbrDRpvRQ41N8duGYo+eCF1+eaAWzUZ77qqj/byy+pTdeEWpoTNNWOzuAXe7Ix9rEXRa4NA59/c0y/X/c8jAdoZlygPmXQAAoCkVZDLtesM6wpAa5fOrZj6h2Q3jQ4AJtulsjZ5Z9Ya4HosjMq7TV3Nymal8M8hdqHM6f5KsheqYUaX8QLez4iqSJofmDC2GRcBiPZks2wrDj9Pu3IpWXY5RLukzjATF4i5Nj6G75qqgQz+4hOlrTMJL5PE8OkGElZTzopFkbpb/qsIDWaJQGoBKqF/IGpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQBZjfqsEja8e8SgqKwFCXVFDxNqAVH4JCPU4XDUpdI=;
 b=E2wwRCjo75KOEYwjk8qK9H/470ylSx6cUjJYwJ1pr+tYCzotnNcxgAQeqgYcKXCF0lPD6UqXOWfLrAPTSqypPnZdu2kZkDIm942TmCmH/KZppbHWx+QSgKd7aNyDkEqSi7Wg2rIZkUinLvkzrDb4wo3HFa1VAsEaH4Pao7SmIpz/NhESCicElCykxx/pGDNhlcl8Tj6gBqLMrAHFbh2yrDVgqECNdpbZvsA7OvYfpJfH9U0MxEPU4LQ3bO80k4AQlgw4iwZWltIth0jrwXjFB/FZcXvTyDu7dKYKxd/rfaR2qJyQEdSbSffal98v1aguLc2vwxyENfy/vO/5leavvw==
Received: from BN1PR13CA0029.namprd13.prod.outlook.com (2603:10b6:408:e2::34)
 by DS7PR12MB6310.namprd12.prod.outlook.com (2603:10b6:8:95::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 17:57:27 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:e2:cafe::3e) by BN1PR13CA0029.outlook.office365.com
 (2603:10b6:408:e2::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8 via Frontend Transport; Wed, 29
 Jul 2026 17:57:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.1 via Frontend Transport; Wed, 29 Jul 2026 17:57:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Jul
 2026 10:57:00 -0700
Received: from dgx-1v-42.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Jul
 2026 10:57:00 -0700
From: Jamie Nguyen <jamien@nvidia.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
	<guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J
 . Wysocki" <rafael@kernel.org>
CC: Len Brown <lenb@kernel.org>, Dat Mach <dmach@nvidia.com>,
	<linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jamie Nguyen <jamien@nvidia.com>
Subject: [RFC PATCH 3/3] firmware: arm_ffa: Back the ACPI FF-A FFH Operation Region
Date: Wed, 29 Jul 2026 10:56:38 -0700
Message-ID: <20260729175638.3796440-4-jamien@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729175638.3796440-1-jamien@nvidia.com>
References: <20260729175638.3796440-1-jamien@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|DS7PR12MB6310:EE_
X-MS-Office365-Filtering-Correlation-Id: 92189647-b756-4e08-5c2e-08deed9ada11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|82310400026|36860700016|11063799006|10067099003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: QRNFPxDKHOzmkWrNJqJdOJdEmHYRD0WvXFx/ypF/kP27tTuksbS9QdFGRZ5XlE11LFoZ6bJNka0Gn0MfOupIl3DR4SMoyU1mWXc3OHZ3IQO5ckWSg9JTGeO8cAT610JkX5vXcsy1rK05mrHlyfzqirX/V2HeJ4Z2d5mi1iZKG2zGFOImw8HB+OqLo7E4zxCW0oSnokpz2kJ4jo7E0t5ym/NRM5dkeQyGVSe690wv0Uc8pIYiuPAhvVH0TTUINmy9SegzhdWDwmP/6PIvo0nhi2mNpOq6be1hqW+Xtwii876/7KCMeXFTCjDaQrhHg+BXKEVARZfr/ynP6s9iCSq5UzP/xLTYWoaHVLQl+apQmZO3np8FIMpF9Vt2XaGbLrjMgqNl+sAmwqWhjy1LPz6G3OipzjsH2XRtsCDL6c7ohkfv/UzLgZ60f8BIlnap+G+/suXUPt90JcWvE8gvrJMBBuR8uerP96UokYpwe+Vmj8PD/obvlTq1F1pJi/8M6xM1Qzao9dSbJDcKv5m9n5BC1eEVCT2sCZeVtXpBjWZormELmoxUrymbMr1vBIL7csNBuBCPfbfbcx+qdM0cF2s3iT4ZGURCZKqhkvP1FAeEGhomXkeUMp7jZC88FSwKGrQRGvu0TXqRUfS1bGvxY+6BS6r666uHFcF9vy+0Q4bQ+QufTupFTkz+X2qpSAt/taPgLm7hMiQGxw9TqLJ2Bfeb1A==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(82310400026)(36860700016)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4Lkar9OW+IvFuQbUjK/xxS1auFbCPD3MU6Dius3uoGJzV2d65wTuFIDhBS1AE9p83iU0MQgktRslplOo8HJCvwMZDBTFRnF5vjpdXRTdDfLpUqnICAKBJcesU2iDQwoXtsajK0jEQOkzkJr1mVNooEzMvmJ18DGA9QBY1IDmI66LLf/WzuSuJlfpgZGPUlaAv3vFS0RFo9XOdnNM+jPHf51b9qGvmizb8tuHoITTGXwL101oIsoM1Zb4ct8+E2waPRpiHZK+JrNd4n4pv/rqqUp82By+8e3nOmq+QaKan62tuoCQfUBxrHV5J/e6ADx966Ozp9hOhUCCXLW8z9eRwGooq0eSDs22auax5Mg9DKPXFEtMO7j7oqaXV3iCvaWm/+GGwtmzPfbaBzf9+/YNWuL3JfhzLBQfGyRHvGm54eqX324TcoW9wczM/cD8r4O4
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 17:57:27.0659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92189647-b756-4e08-5c2e-08deed9ada11
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6310
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_105744_050173_162350A6 
X-CRM114-Status: GOOD (  23.88  )
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

Add the FFA_MSG_SEND_DIRECT_REQ2 backend behind FFH Operation Regions
declared with an Offset of 0x2, as described in Arm DEN0048D section
2.3.1.2, and register it once partition setup has completed.

None of what the Operation Region handler needs was reachable through the
existing ffa_device based interface. Resolving a service UUID to an
endpoint ID had no user yet. ffa_sync_send_receive2() always addresses
dev->vm_id, so a receiver endpoint ID that AML supplied in X1 cannot be
honoured. And the response registers DEN0048D wants copied back to AML are
discarded by ffa_msg_send_direct_req2(), which folds the FF-A error code
into an errno instead; patch 1 dealt with that one.

DEN0048D only requires the resolved endpoint to be unique, and a single
partition may be described by more than one entry, so compare endpoint IDs
instead of insisting on exactly one descriptor.

Where the endpoint was enumerated at probe time, check first that it can
receive direct request2 messages. AML then gets FFH_FFA_NOT_SUPPORTED
instead of a call that was never going to work. An endpoint with no
matching device is passed through and left for the callee to reject.

Co-developed-by: Dat Mach <dmach@nvidia.com>
Signed-off-by: Dat Mach <dmach@nvidia.com>
Signed-off-by: Jamie Nguyen <jamien@nvidia.com>
---
 drivers/firmware/arm_ffa/driver.c | 118 +++++++++++++++++++++++++++++-
 1 file changed, 116 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 3236cd0a731ab..0577c7d5685ee 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -2146,6 +2146,114 @@ static void ffa_notifications_setup(void)
 	ffa_notifications_cleanup();
 }
 
+/*
+ * Backend for FFH Operation Regions declared with an Offset of 0x2, see Arm
+ * DEN0048D (Functional Fixed Hardware Specification v1.3) section 2.3.1.2.
+ * The Operation Region handler itself lives in drivers/acpi/arm64/ffh.c and
+ * is built in, so it reaches this driver, which may be a module, through the
+ * ops registered below.
+ */
+static int ffa_acpi_ffh_partition_id(const uuid_t *uuid, u16 *dst_id)
+{
+	struct ffa_partition_info *pbuf;
+	int count, idx, ret = 0;
+	u16 id;
+
+	count = ffa_partition_probe(uuid, &pbuf);
+	if (count <= 0)
+		return count ? : -ENOENT;
+
+	/*
+	 * DEN0048D only requires the endpoint ID to be unique. A partition may
+	 * be described by more than one entry, so compare IDs rather than
+	 * insisting on a single descriptor.
+	 */
+	id = pbuf[0].id;
+	for (idx = 1; idx < count; idx++) {
+		if (pbuf[idx].id != id) {
+			ret = -ENOTUNIQ;
+			goto out;
+		}
+	}
+
+	*dst_id = id;
+out:
+	kfree(pbuf);
+	return ret;
+}
+
+static int ffa_acpi_ffh_match_id(struct device *dev, const void *data)
+{
+	const u16 *dst_id = data;
+
+	return to_ffa_dev(dev)->vm_id == *dst_id;
+}
+
+static int ffa_acpi_ffh_check_partition(u16 dst_id)
+{
+	struct device *dev;
+	bool supported;
+
+	dev = bus_find_device(&ffa_bus_type, NULL, &dst_id,
+			      ffa_acpi_ffh_match_id);
+	/*
+	 * Only partitions reported by FFA_PARTITION_INFO_GET at probe time have
+	 * a device here. AML may name an endpoint that was never enumerated, so
+	 * an unknown one is left to the callee to reject rather than refused
+	 * outright.
+	 */
+	if (!dev)
+		return 0;
+
+	supported = ffa_partition_supports_direct_req2_recv(to_ffa_dev(dev));
+	put_device(dev);
+
+	return supported ? 0 : -EOPNOTSUPP;
+}
+
+static int ffa_acpi_ffh_direct_req2(u16 dst_id, const uuid_t *uuid,
+				    u64 *payload, unsigned int nr_payload,
+				    u64 resp_regs[3])
+{
+	struct ffa_send_direct_data2 req = {}, resp;
+	int ret;
+
+	BUILD_BUG_ON(sizeof(req.data[0]) != sizeof(*payload));
+
+	if (!drv_info->msg_direct_req2_supp)
+		return -EOPNOTSUPP;
+
+	if (!nr_payload || nr_payload > ARRAY_SIZE(req.data))
+		return -EINVAL;
+
+	ret = ffa_acpi_ffh_check_partition(dst_id);
+	if (ret)
+		return ret;
+
+	/*
+	 * Registers not represented in the Operation Region stay zero, as
+	 * required by DEN0048D.
+	 */
+	memcpy(req.data, payload, nr_payload * sizeof(*payload));
+
+	ret = __ffa_msg_send_direct_req2(drv_info->vm_id, dst_id, uuid, &req,
+					 &resp, resp_regs);
+
+	/*
+	 * DEN0048D asks for the registers to be copied back once the call has
+	 * completed, whatever the outcome, so this runs on the FFA_ERROR path
+	 * too rather than leaving AML looking at its own request.
+	 */
+	memcpy(payload, resp.data, nr_payload * sizeof(*payload));
+
+	return ret;
+}
+
+static const struct acpi_ffh_ffa_ops ffa_acpi_ffh_ops = {
+	.partition_id	= ffa_acpi_ffh_partition_id,
+	.direct_req2	= ffa_acpi_ffh_direct_req2,
+};
+
 static int ffa_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -2228,8 +2336,13 @@ static int ffa_probe(struct platform_device *pdev)
 	ffa_notifications_setup();
 
 	ret = ffa_setup_partitions();
-	if (!ret)
-		return ret;
+	if (!ret) {
+		ret = acpi_ffh_ffa_register(&ffa_acpi_ffh_ops);
+		if (ret && ret != -EOPNOTSUPP)
+			pr_warn("failed to register ACPI FFH backend (%d)\n",
+				ret);
+		return 0;
+	}
 
 	pr_err("failed to setup partitions\n");
 	ffa_notifications_cleanup();
@@ -2249,6 +2362,7 @@ static void ffa_remove(struct platform_device *pdev)
 {
 	struct ffa_drv_info *info = platform_get_drvdata(pdev);
 
+	acpi_ffh_ffa_unregister(&ffa_acpi_ffh_ops);
 	ffa_notifications_cleanup();
 	ffa_partitions_cleanup();
 	ffa_rxtx_unmap();
-- 
2.43.0


