Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39AFD3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 22:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SbzCpewv0BHDLxYJt2Uo6zghjFTApMjSAo+xPwjQ9g=; b=kN3XZH868ef7+6K1L+gawibUiG
	0EfkZ+HSEUjrKESXsQ1u6rTvvtHcS4TgHPMUwPFiOqoFQSoocjoR3eSqHebyRE0ClS2jXHhaxAtaz
	B9lSzQcu2cY/DJzfl/QnSsb9tmJlRoYz8hWgITXKE5fkEl66Lp1MuKTUropmdqEyLQW1DLG5wRc3i
	yP755YwjFgy1h5fFuYTq9+33hE8+8dYpymnConFSDR6XBhd4qQiojxpXMSnd1x4xC9I1VUPftEg1G
	eo7uN0LNI+CSAdiydEoImDGHSlmWwmomBsKsz8XasWO7iFCqXoiN5i9FJV84WvBlm+9T+LN4xTtF8
	MQeaI/YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSjVB-0000000Da4T-3VLi;
	Mon, 08 Dec 2025 22:14:41 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSjV8-0000000Da1C-0VZX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 22:14:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xK3DtltTFlG239qcuTiHz3DDCvXhwXgFGPU12n+PUh2E3i/xqoKaOX3MFTPXAZG2kprkurjZB15VvWwUW1BbtdtRndYBZPVQ7Bhqk/FE/kqIcD6d2PzknskHodnAPeSY1d0EAarOIuTwnLHy7SL2s7Zw8Yshde2xmbXVoMiQ+HlzSKs5xC8rhm8+kpfLfTHPQSjxLqwApsJFhE2GfaD85U+teXkHIGpRAyr4zjuB2UZwOpl2OLnCUd14r+uUgHq3mARosbXB1vCXKbm9Zg6S1ZlzHOwIOyJg7hKWo+l4Bjy0nm1NThUOr0pxC/IIJ+85l+8mFXIwshCQyuHMpW4Dtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7SbzCpewv0BHDLxYJt2Uo6zghjFTApMjSAo+xPwjQ9g=;
 b=VyDdkxlU+o1vRxIiyd2Ef74ZQcZnFMFDr7zqjMhhDXutERiL/ItDVPEbfR3EOKQ7MXfWVGB1K3SXhpCxeY9iGCS2LFAKDN9KxEkNmJEzhiyDF+n+qnkQVeBUWZUxfsISOm9OMCikNvA3PTbcQo2RMsPPKuXSYSY7lm3Im5K5vfrSc3sB9sjx16T5hqofXAy9tIfdVHr6wjfiMks8V7RzIDkXIo59omMjPgWOxOSPixSzQ4gOHOnOtfBwp7fPuZW9cX6SjPhYe67i3zf3GOBGmM6J93a9gAlI9ZA1vvujP1F68vwPhI37Zd/fZqCU3Wm36KD/9gfDFh1jloUrmyxtWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SbzCpewv0BHDLxYJt2Uo6zghjFTApMjSAo+xPwjQ9g=;
 b=CQuVWTB6kkTSt89jNj7L1GhA2HL4DYpNnfIXL8rACqDdqhxvsEazseNhajtqBd87mqt+QFLwbncOMeifxxqdDSqwsDnquMqvRMI8dk/C+YAwS/0sHdTcc0d3akg/WSPnQY5lgHdZqudhj0LesA2xyc9hGkiHdXvGKXU9SxOmRIysDxCf+XLvGPvkq3AtMvLOH+QygAESjdItM/qP/YjvkVL/prfY5ndPZ9mAQHRNjmaPH+c+GuNlkOy6P+ilfK/FeRz4s07swRNHzUtevfuX0Y8QfABofDsg+g7bJ4HD0yhu4RE0QKeVkc9E+tpbGeR5Au3zZ/La2c8APyL7sdfAqA==
Received: from SJ0PR13CA0097.namprd13.prod.outlook.com (2603:10b6:a03:2c5::12)
 by MN2PR12MB4272.namprd12.prod.outlook.com (2603:10b6:208:1de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 22:14:30 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::42) by SJ0PR13CA0097.outlook.office365.com
 (2603:10b6:a03:2c5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Mon, 8
 Dec 2025 22:14:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 22:14:29 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 14:14:10 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 8 Dec 2025 14:14:09 -0800
Received: from build-vvidwans-noble-20250617.internal (10.127.8.10) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 8 Dec 2025 14:14:09 -0800
From: Vedashree Vidwans <vvidwans@nvidia.com>
To: <salman.nabi@arm.com>, <sudeep.holla@arm.com>, <andre.przywara@arm.com>,
	<lpieralisi@kernel.org>, <mark.rutland@arm.com>
Subject: [RFC PATCH 5/5] firmware: smccc: lfa: refresh fw details
Date: Mon, 8 Dec 2025 22:13:15 +0000
Message-ID: <20251208221319.1524888-6-vvidwans@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251208221319.1524888-1-vvidwans@nvidia.com>
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|MN2PR12MB4272:EE_
X-MS-Office365-Filtering-Correlation-Id: f65a3589-7b4f-4ded-a2e4-08de36a72827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vq5TmBgSjD5S6jrul593pry40fZljHTqXY8wWHCZ9sDUsT5PeKo9TS5br7Ys?=
 =?us-ascii?Q?t8rbEJHSl/r59kdlg/BXsIvQUrC9wiIl4ZldodnQfY7BUt/niQtvjmVl+TJJ?=
 =?us-ascii?Q?eosk874Gia1SHVRN4fNwfnmLZNj85/YzKzzrjyCS/NLvpR/iwgSuBdxIctxa?=
 =?us-ascii?Q?i257xLnMjDMfWhE2NNOtOOSUzB6YQiwk9TOiTOrGOpmKMB3fHgzDDMwC0ldf?=
 =?us-ascii?Q?DZKacFhm2VT6bBHikr+H2fiWTcFuugBiKwGjFp7ORhOIl0ACTKecdd7T9Bzd?=
 =?us-ascii?Q?NT80tscA6aN+FCdDQrZfCVc+SdiIcJTnjS4ugTZ9Jmx+pV1nvFaUEEHg3TRv?=
 =?us-ascii?Q?mjtw2zS5iTC9eCnHxfhQMovJRbnOY9xSNqNpEOjwSWF1GY1IxoXch7WaoRWu?=
 =?us-ascii?Q?7cy7fJru4kTTgChKSuBz9FpcLn5+KhU17hfSt8wXgCSl8NweIZgVu1RWrTar?=
 =?us-ascii?Q?gLlBSPzAve8E6FVFxDYYsChoAv5VFivXvzTIc1Sz8OnaI4LMiao7GLXmyZqR?=
 =?us-ascii?Q?nqAVJZzxsaFC15SbYprb7HDWlsuob49HBoAGiDq+HsJkVjvWL83jIbqXvq5a?=
 =?us-ascii?Q?m5VUr31K7gWdnFP9O3xpfKWIDZoJlLXIHkGABtdSVBUu/8sjCYsZ8moT3XK0?=
 =?us-ascii?Q?oZkT1ffk9exhIZBL6PQSH++dOjoTtHLkkrp7MYBVqurzqLvqdTXMfJCuQqjs?=
 =?us-ascii?Q?SBHaFNKYJb7FLuaJ8KhS1E3dYH5ppfCahtAAOHgv9uL2OTT+wINLHPnLBnhG?=
 =?us-ascii?Q?nUc+fQmxj/b7rS6/boqNRiPDOXXxKu4jbu6s652DizNnD9rYGvMhOf5BeLFe?=
 =?us-ascii?Q?OEGv5u8/lPWVJeVADZL3cxMG7mOtv6S0nyAwa5uhzjszT52Imk5KeaCzWXyK?=
 =?us-ascii?Q?mjmmGy/t/YvZyE73y5lvhvlEAAjTQsrz27r6JxyHOBR5u7aYJ6lRrj4+qhGW?=
 =?us-ascii?Q?i7571I3zWF6fm/dntN/kohW4/uCF6wArSiNlvF/S4k39fULi/Osozqp87buH?=
 =?us-ascii?Q?heFCLd8UhfQFJ7DwI1MlsvFOx2WM7Vh3kFx6VnHp+KRpRCwXAoTEPC1sJwrq?=
 =?us-ascii?Q?vTT4XBPSk3hty433Gt2tGUs/mctnBlZaNn0GErHDMHjxuxFXJ084rbDuExg6?=
 =?us-ascii?Q?D4WicGMLMORajEzz4d6ybLJMvADLokuasqYxeCQdowg4yCRPyNPdlk+UMOBX?=
 =?us-ascii?Q?6u6EeBEw0PPUlvlnVjsVze9m3dwGPki5sJSGQO6xqi0nckkTn/d9KERX3agX?=
 =?us-ascii?Q?YjYk7CZ485t3CP5SyzwC82m3VY32TA4x4PH0v/xTXNYIScS9JYVcCscy/Sqn?=
 =?us-ascii?Q?YTOtsTHs5iUEnXDzhbWSCvRnUuybKdn/UH16uL/uTFGL5B5CcjBgZ8mJnwLA?=
 =?us-ascii?Q?RZBFO5d7m9PvdtO7xUe6zBjlQiVx4Ml5GEuWpJK0E7/A7X1aMVd8QL1Tp8wj?=
 =?us-ascii?Q?WzdA0jvYlLUmL0zsDTTUa0LU530NRXS4hHEAdqdHas3qjbGF3nD1KlsNP+C2?=
 =?us-ascii?Q?d6i5Alcs7ciXtRh3UinxYp6mTTHbf6CY4WG7qLW4FUphbwJUCZ/Jz/EfVqhy?=
 =?us-ascii?Q?4LeZT0apCKoz5GuOkM4=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 22:14:29.3443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f65a3589-7b4f-4ded-a2e4-08de36a72827
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4272
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_141439_516571_D83D2A40 
X-CRM114-Status: GOOD (  19.50  )
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
Cc: linux-kernel@vger.kernel.org, vwadekar@nvidia.com, sdonthineni@nvidia.com, vsethi@nvidia.com, linux-coco@lists.linux.dev, ardb@kernel.org, linux-arm-kernel@lists.infradead.org, chao.gao@intel.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

FW image details are querried with a SMC call. Currently, these FW
details are added as nodes in a linked list. This patch updates the
FW node creation and update functions. Now the linked list is updated
based on the current value of num_lfa_components.
As per spec [1], FW inventory is updated after each activation.

[1] https://developer.arm.com/documentation/den0147/latest/

Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
---
 drivers/firmware/smccc/lfa_fw.c | 148 +++++++++++++++++++++-----------
 1 file changed, 100 insertions(+), 48 deletions(-)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index 24916fc53420..334090708405 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -133,6 +133,7 @@ static const struct fw_image_uuid {
 	},
 };
 
+static int update_fw_images_tree(void);
 static struct kobject *lfa_dir;
 static DEFINE_MUTEX(lfa_lock);
 
@@ -282,17 +283,6 @@ static int activate_fw_image(struct image_props *attrs)
 	return ret;
 }
 
-static void set_image_flags(struct image_props *attrs, int seq_id,
-			    u32 image_flags)
-{
-	attrs->fw_seq_id = seq_id;
-	attrs->activation_capable = !!(image_flags & BIT(0));
-	attrs->activation_pending = !!(image_flags & BIT(1));
-	attrs->may_reset_cpu = !!(image_flags & BIT(2));
-	/* cpu_rendezvous_optional bit has inverse logic in the spec */
-	attrs->cpu_rendezvous = !(image_flags & BIT(3));
-}
-
 static ssize_t name_show(struct kobject *kobj, struct kobj_attribute *attr,
 			 char *buf)
 {
@@ -395,7 +385,9 @@ static ssize_t activate_store(struct kobject *kobj, struct kobj_attribute *attr,
 
 	pr_info("Firmware activation succeeded\n");
 
-	/* TODO: refresh image flags here*/
+	ret = update_fw_images_tree();
+	if (ret)
+		pr_err("Failed to update FW images tree");
 	mutex_unlock(&lfa_lock);
 	return count;
 }
@@ -425,20 +417,41 @@ static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] = {
 	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel)
 };
 
+static void delete_fw_image_node(struct image_props *attrs)
+{
+	int i;
+
+	for (i = 0; i < LFA_ATTR_NR_IMAGES; i++)
+		sysfs_remove_file(attrs->image_dir, &attrs->image_attrs[i].attr);
+
+	kobject_put(attrs->image_dir);
+	attrs->image_dir = NULL;
+	list_del(&attrs->image_node);
+	kfree(attrs);
+}
+
 static void clean_fw_images_tree(void)
 {
 	struct image_props *attrs, *tmp;
 
-	list_for_each_entry_safe(attrs, tmp, &lfa_fw_images, image_node) {
-		kobject_put(attrs->image_dir);
-		list_del(&attrs->image_node);
-		kfree(attrs);
-	}
+	list_for_each_entry_safe(attrs, tmp, &lfa_fw_images, image_node)
+		delete_fw_image_node(attrs);
+}
+
+static void update_fw_image_node(struct image_props *attrs, int seq_id,
+			    char *fw_uuid, u32 image_flags)
+{
+	attrs->fw_seq_id = seq_id;
+	attrs->image_name = fw_uuid;
+	attrs->activation_capable = !!(image_flags & BIT(0));
+	attrs->activation_pending = !!(image_flags & BIT(1));
+	attrs->may_reset_cpu = !!(image_flags & BIT(2));
+	/* cpu_rendezvous_optional bit has inverse logic in the spec */
+	attrs->cpu_rendezvous = !(image_flags & BIT(3));
 }
 
-static int create_fw_inventory(char *fw_uuid, int seq_id, u32 image_flags)
+static int create_fw_image_node(int seq_id, char *fw_uuid, u32 image_flags)
 {
-	const char *image_name = "(unknown)";
 	struct image_props *attrs;
 	int ret;
 
@@ -446,21 +459,12 @@ static int create_fw_inventory(char *fw_uuid, int seq_id, u32 image_flags)
 	if (!attrs)
 		return -ENOMEM;
 
-	for (int i = 0; i < ARRAY_SIZE(fw_images_uuids); i++) {
-		if (!strcmp(fw_images_uuids[i].uuid, fw_uuid))
-			image_name = fw_images_uuids[i].name;
-		else
-			image_name = fw_uuid;
-	}
-
 	attrs->image_dir = kobject_create_and_add(fw_uuid, lfa_dir);
 	if (!attrs->image_dir)
 		return -ENOMEM;
 
-	INIT_LIST_HEAD(&attrs->image_node);
-	attrs->image_name = image_name;
-	attrs->cpu_rendezvous_forced = 1;
-	set_image_flags(attrs, seq_id, image_flags);
+	/* Update FW attributes */
+	update_fw_image_node(attrs, seq_id, fw_uuid, image_flags);
 
 	/*
 	 * The attributes for each sysfs file are constant (handler functions,
@@ -485,17 +489,19 @@ static int create_fw_inventory(char *fw_uuid, int seq_id, u32 image_flags)
 			return ret;
 		}
 	}
-	list_add(&attrs->image_node, &lfa_fw_images);
+	list_add_tail(&attrs->image_node, &lfa_fw_images);
 
 	return ret;
 }
 
-static int create_fw_images_tree(void)
+static int update_fw_images_tree(void)
 {
 	struct arm_smccc_1_2_regs reg = { 0 };
 	struct uuid_regs image_uuid;
+	struct image_props *attrs, *tmp;
 	char image_id_str[40];
 	int ret, num_of_components;
+	int node_idx = 0;
 
 	num_of_components = get_nr_lfa_components();
 	if (num_of_components <= 0) {
@@ -503,22 +509,67 @@ static int create_fw_images_tree(void)
 		return -ENODEV;
 	}
 
-	for (int i = 0; i < num_of_components; i++) {
-		reg.a0 = LFA_1_0_FN_GET_INVENTORY;
-		reg.a1 = i; /* fw_seq_id under consideration */
-		arm_smccc_1_2_invoke(&reg, &reg);
-		if (reg.a0 == LFA_SUCCESS) {
+	/*
+	 * Pass 1:
+	 *    For nodes < num_of_components, update fw_image_node
+	 *    For nodes >= num_of_components, delete
+	 */
+	list_for_each_entry_safe(attrs, tmp, &lfa_fw_images, image_node) {
+		if (attrs->fw_seq_id < num_of_components) {
+			/* Update this FW image node */
+
+			/* Get FW details */
+			reg.a0 = LFA_1_0_FN_GET_INVENTORY;
+			reg.a1 = attrs->fw_seq_id;
+			arm_smccc_1_2_invoke(&reg, &reg);
+
+			if (reg.a0 != LFA_SUCCESS)
+				return -EINVAL;
+
+			/* Build image name with UUID */
 			image_uuid.uuid_lo = reg.a1;
 			image_uuid.uuid_hi = reg.a2;
+			snprintf(image_id_str, sizeof(image_id_str), "%pUb", &image_uuid);
 
-			snprintf(image_id_str, sizeof(image_id_str), "%pUb",
-				 &image_uuid);
-			ret = create_fw_inventory(image_id_str, i, reg.a3);
-			if (ret)
-				return ret;
+			if (strcmp(attrs->image_name, image_id_str)) {
+				/* UUID doesn't match previous UUID for given FW, not expected */
+				pr_err("FW seq id %u: Previous UUID %s doesn't match current %s",
+					attrs->fw_seq_id, attrs->image_name, image_id_str);
+				return -EINVAL;
+			}
+
+			/* Update FW attributes */
+			update_fw_image_node(attrs, attrs->fw_seq_id, image_id_str, reg.a3);
+			node_idx++;
+		} else {
+			/* This node is beyond valid FW components list */
+			delete_fw_image_node(attrs);
 		}
 	}
 
+	/*
+	 * Pass 2:
+	 *    If current FW components number is more than previous list, add new component nodes.
+	 */
+	for (node_idx; node_idx < num_of_components; node_idx++) {
+		/* Get FW details */
+		reg.a0 = LFA_1_0_FN_GET_INVENTORY;
+		reg.a1 = node_idx;
+		arm_smccc_1_2_invoke(&reg, &reg);
+
+		if (reg.a0 != LFA_SUCCESS)
+			return -EINVAL;
+
+		/* Build image name with UUID */
+		image_uuid.uuid_lo = reg.a1;
+		image_uuid.uuid_hi = reg.a2;
+		snprintf(image_id_str, sizeof(image_id_str), "%pUb", &image_uuid);
+
+		ret = create_fw_image_node(node_idx, image_id_str, reg.a3);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -538,8 +589,9 @@ static irqreturn_t lfa_irq_thread(int irq, void *data)
 	 */
 
 	do {
-		/* TODO: refresh image flags here */
-		/* If refresh fails goto exit_unlock */
+		ret = update_fw_images_tree();
+		if (ret)
+			goto exit_unlock;
 
 		/* Initialize counters to track list traversal  */
 		num_of_components = get_nr_lfa_components();
@@ -561,13 +613,13 @@ static irqreturn_t lfa_irq_thread(int irq, void *data)
 			}
 
 			pr_info("Firmware %s activation succeeded", attrs->image_name);
-			/* Refresh FW component details */
 			break;
 		}
 	} while (curr_component < num_of_components);
 
-	/* TODO: refresh image flags here */
-	/* If refresh fails goto exit_unlock */
+	ret = update_fw_images_tree();
+	if (ret)
+		goto exit_unlock;
 
 exit_unlock:
 	mutex_unlock(&lfa_lock);
@@ -657,7 +709,7 @@ static int __init lfa_init(void)
 		return -ENOMEM;
 
 	mutex_lock(&lfa_lock);
-	err = create_fw_images_tree();
+	err = update_fw_images_tree();
 	if (err != 0)
 		kobject_put(lfa_dir);
 
-- 
2.43.0


