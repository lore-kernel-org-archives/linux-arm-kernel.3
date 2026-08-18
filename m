Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313D6C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 22:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GO/ifd6cvghuXzfkMXe1Yl/C2ANUVFusvw8q75lLMu0=; b=jGO5N5rs0sSgbyn42eOLfymltb
	EJzcahvrfzZ1AGC4EbLQy1XiL1vjR11g8gMbqlDAXZdADMgd7pJWKBTysmNSDuSl7MzdNZhN9ZZg2
	uBNwOptUpjQ0b/tmQ8LEWfQ7YNSF2kSCu9e6iZfl5tZ8g8i0sP+FgV7vfDo2ikdp+Xl+9lR1mXMVl
	pKWbC47fPyg0NThRiv0x9Z1eY9TaBw7aPZZM/Ki8qW3Y+G1Qxz75igwK2l0amFnNxMYUJrpJwN/ft
	ZualRkp+tKOh9PsNymC6/0PV2Y03dyeZzgTmLT8edhb1iJ25GDzQmtwrL3fdjBrPIQAPZRN+eHq1D
	QA0fS8pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwSXb-00000008jnz-1Brj;
	Tue, 18 Aug 2026 22:44:19 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwSXY-00000008jnO-463s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 22:44:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TG6Sa/XFaJLaOuWlOQJ4OcXhJmRIzC45z/3t+epdVWT6Hhee7dwYjbpKnzZmYCjqL9IF7UKwecHtQODn66u4R13s8iEovD2t6DeSerXzOX075FYZp+EBYGhScC3g+XspmFOXHhe4JtjxwLFAgemSv5W/ypn4shPIT1DFB1V+kSlrdw4CzC2CKH6pEpXJaygcqJ2uC57nkInR84UGX6A8UYGKlecXaAfC8vTx5x3g0oMtUrWGnlf+cFvYiMrqJcjoHVKwHoRJq3E+Gnif/OtjfYA4GVaFyB4NvY0osPwuTilGPM9wTbhdNXzXVObRp7SFdarDKya7vsuAFcQIMZkjxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GO/ifd6cvghuXzfkMXe1Yl/C2ANUVFusvw8q75lLMu0=;
 b=Fo6MdO2Df8K8PpvWSJa8Bxpc4RWOFPBLi0nI9Ojbkdi/SOIRvKJUV/wsZUN4PCPEUIk6nhd8Yg+IkLk8zcn/gVG0u4ApZB349BRY6i7RvRJwpQ50uspovFAH9NjqoqhNDbP15EA3VpVOAlGfEA5Qpxum8dQkMEoiI5wBwKD0CIc44g0dgUr3dLYm4GnE8BtWB4fISz4fkTaH6WYfGs1sTsALcyU40hWVYAmVIfMtbsK2GJsGhR/gFdL5sIVI+Vgh46TqEo9TDajxhjMD0c13yxf2EqdVdBLcYXBMRiKy/oHSXdgLW8ETVohL/7wR9UaQmoIjETRouCrTgnhBuWhZdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GO/ifd6cvghuXzfkMXe1Yl/C2ANUVFusvw8q75lLMu0=;
 b=M5VML9YSTvKM/FncO+41gJXfkABX4A5AHa/OCeB63bKBtV8tbXbTyJKRtW5M85AAtv3KmaQfOC48eqJMejIz7LeFh7KunoIX3EDxYskS9+W5kvxh1Anc+fWpFbYWID2a/d1DMAZMBAlRiVs4Oumt4EGEhk+ja7jSjlloe8GDmiS4n8RTkceDJMLJs7BI0GAhXfgH27gHDE4gp86HmJPM0fjvGmnZREbaCIAc+d78ymmPUvvr4yIa5xpqJA3L+FOQYpJ6MSfhNyMf3A8svQWklSo6AIi6elyCruAVhscbIBfl+gx2WwXblkzuAuzg8FGC5+QQrqhztnyzvMAM1XZ40w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB6882.namprd12.prod.outlook.com (2603:10b6:510:1b8::12)
 by SA1PR12MB9490.namprd12.prod.outlook.com (2603:10b6:806:45b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 22:44:08 +0000
Received: from PH7PR12MB6882.namprd12.prod.outlook.com
 ([fe80::6d0a:d79f:abf2:d544]) by PH7PR12MB6882.namprd12.prod.outlook.com
 ([fe80::6d0a:d79f:abf2:d544%3]) with mapi id 15.21.0315.008; Tue, 18 Aug 2026
 22:44:08 +0000
From: Carol L Soto <csoto@nvidia.com>
To: sudeep.holla@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mochs@nvidia.com,
	Carol L Soto <csoto@nvidia.com>
Subject: [PATCH] firmware: arm_ffa: Unmap Rx/Tx buffers on shutdown
Date: Tue, 18 Aug 2026 15:44:04 -0700
Message-Id: <20260818224404.3694580-1-csoto@nvidia.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0217.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::12) To PH7PR12MB6882.namprd12.prod.outlook.com
 (2603:10b6:510:1b8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6882:EE_|SA1PR12MB9490:EE_
X-MS-Office365-Filtering-Correlation-Id: 963c89be-ec2e-49ef-2d2b-08defd7a36fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|10067099003|6133799003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: c8FncTHm6tFlWhLlEGpmx/wsTCwzS717mN2cafceRLGGE5GQVwbhWhRI9c4FrCshGwg6/AKbw/x79cVgryQ/cF7f2CYiykIxTLxk6fPuyTWrnzGVrLRSS7cw4J7E0RizRZHJNkNGLKEMfm4YUiY5wO57/D4fPZGo0oX5vK7e+gIGHyp8TmAbf3ZpAVqsLifgr5nBXIbvZp/wdCJDW4mI8uZ//76qBuOGxvifNs3qVojSnZEZvRA/ekKwIqFlI0pDW1McQ+WXMaETQTlJpqjsk1s6/wGIrkWVwPbdDa9WMsBTsEIHSDUwNjKRn9g3ULGOYJ1lO2iqlHdoaQHzNC6PI9F+vvUqhJd3s+CvT4RPKiflmhm6gbqiwogqoxeFYkMT0Ma73xEX1mGEPBYTKXwUchJEPv7Qq+afBQU32c6vUqRbreet6Jur2QKf4vTo4WHHNEdopvhAUzbeiutjXCBdsmZzwq5lyJrwgzORIlbf1985y4RFpCDMUbYGiX8jsnZi7OodiqztDZWZN7btagRcdozf/Nps18agrk96sjFxc1QmhlA9Bn0ECnBD+gao7kuk07Rw5wGTppSqkgX0fiw2bSTA9h6OfJX5jBqfzvBkirlWaV77w3AMXvWbc14P7gL0A52iflx/NleANtCv3PNmpc1TGFjTB3vnRb58N1/R+nM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6882.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(6133799003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q7KDl4RhtPjdB8IXX+pxHIWqaunavhp8NM0rqWie3anfwcA+UJaiykm36LPl?=
 =?us-ascii?Q?CwIRzjzCO5F874IlGf2JyIuwR8SdTCRsb0AyBkvAO/R+zknblMjGJpULLzsb?=
 =?us-ascii?Q?K/MI4EUb0lE57r3Mz5X//TSqQSqPCyD30J8DdRAg1+rH5PcoO10MMW2RXUNb?=
 =?us-ascii?Q?t748acWXgl6LiQFCbHMfm0OLBDRphfv6tnYoYZQj5W1mJHyop+G3nUHX2veC?=
 =?us-ascii?Q?zqmbtkIa803F7B9i6tKi9Ftsg8/T0h2fgQZ7A354+kAnrC0LzvHbSZ8IEwor?=
 =?us-ascii?Q?kC0jprTFMIe3o9EWXMPNSxY0jNcTgY2M1wPyCN4eeUpUrq8d3v3pcyaiGzbK?=
 =?us-ascii?Q?XWqQoY7Tg4/bh6PQpYM3CfUnJmR82dQPSEJRKxcYkYCURqCx3Wqf2Gkqw+Qy?=
 =?us-ascii?Q?JHikpO1PJ706fNZYaYK1jACapzq28+YY1cyE/HoseGDNaA5uvxyKs9KV87hC?=
 =?us-ascii?Q?2HrPOnprXA2C62oc0uNPcsUjHrvqfPc6XPpajXE1QAtIfn0kJnpNDQVF/Nat?=
 =?us-ascii?Q?suUwd86LkfV/uVnjw/Lcmkp7xXh6YqcXgoIVPGeVNKUtA88KDrAlZKvbhbsx?=
 =?us-ascii?Q?ulSgNV54KtEKLTxKY1NMmSnA9SMyo5116zqhlVjWLYouApeq4NT0IZmLSNBd?=
 =?us-ascii?Q?SStMPw4QTlseK0taMkci2z+HVZ95mrsbb72aGz97BuBb80Ogi/Jzpev/wmhq?=
 =?us-ascii?Q?v7Ojko/ZrMZxTAsUVPuetEVe3RljLQhHereHA0Z/9TuP1y33KfnfyRruL79/?=
 =?us-ascii?Q?FwhCAiSFbXt/3RCBvB41cj/YPsuAsV+Rll/0S/K4l3yqN57UTPND/cdccWcG?=
 =?us-ascii?Q?gQ3vdTARCy0gwzgQh2moG+1cAQ2Gmb6VSucw6Th106IC4RPtuBH5rUzYdnyt?=
 =?us-ascii?Q?ijsEBKsiJuy/Mdn1b2CrG1NYh5YmHH56f58N/AXTSOFAs3RCwy3hb8rmxfTv?=
 =?us-ascii?Q?d85YVkg5v/jB21bn7zBLFphC179MhGe2/At33n1/ale3LMfYq5hc2JOW32io?=
 =?us-ascii?Q?6Bm047kCuFjzCOD5hIlBTwWrPbry3qn+NWqD4yCW2TQAJSZCM68CGHvLO54W?=
 =?us-ascii?Q?/y9VogVGNhpvgw5m6FhoSaJpVQfEvdvKW3ykPy56guqXpFA2E7co7VMt5ZAt?=
 =?us-ascii?Q?L2uBNcrZz1owmaa4pyNaAKvqCZ8ndPU0e11IINaWYhR9NqEi93W2575Se6OC?=
 =?us-ascii?Q?SJVwmIxmjrfFBIv2+l2blaN65JbnhnAfGLB/vnw/P1lx6tXc4JnXNScvpZBv?=
 =?us-ascii?Q?og2OSszLJ+o2FN+jZ02C4bRw41ZifD1r5kUVBqmSU7klhIrzxsEG2Z7zjp4h?=
 =?us-ascii?Q?IWiXXOarsFSf5gPKm1N21gvgHGtDBETKAnQJiI9Zklee3CE/6dFfbOBSvshK?=
 =?us-ascii?Q?9g15VhBgutdL9pWEj4mANKU2aojr2x4/hBZSUskcupITk+VxO2DFIVNiyW3v?=
 =?us-ascii?Q?6kxhBVV69W7JzTqWyfCaDhwOBckgRh6xH9o1+OevasTKKmjOmV3pwf03kem3?=
 =?us-ascii?Q?jBhj5MnRQrIvzRhnjWGyIcNdGOpi9lo3Tm2v6IgRBCIBRaS9gygCyIZl/mbF?=
 =?us-ascii?Q?k2D9F+jMomkKUJg92LZvu50zYSwUSdNZvFdS8/XX72zj0gKBy4qX99XSO6X8?=
 =?us-ascii?Q?yY1GxeQCOw+LsmzMdVPoJ6ChW5t867EhOjckNUeq9xWwBgYnDLfQEk9Ck4hH?=
 =?us-ascii?Q?YmNxkQz1UBD1GKWNMailAlqwshAo/a1O+Vk8tZerPsTKn2QHcfwnAd11z+BJ?=
 =?us-ascii?Q?c1h/R6L38A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 963c89be-ec2e-49ef-2d2b-08defd7a36fd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6882.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 22:44:08.5776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YLrIyifOFxCLocjzg9mC3FSoVNc4//HfLPKFV8QNkmexsxhWSdPCS7TuxxRZUo85zCA93SiztZfNbvc0ViI79g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9490
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_154417_041781_65EC30C7 
X-CRM114-Status: GOOD (  19.82  )
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

The FF-A core maps its Rx/Tx buffers with the firmware during probe,
but only unmaps them from the remove and probe error paths. A kexec
reboot runs device_shutdown() without removing the driver, leaving the
old buffers mapped in the firmware.

The next kernel can then fail to register its Rx/Tx buffers because the
firmware still tracks the previous mapping.

Add a platform shutdown callback and share the firmware cleanup path
with remove and probe error handling so FF-A partitions, notifications
and the Rx/Tx buffer mapping are torn down before entering the next
kernel.

Fixes: 3bbfe9871005 ("firmware: arm_ffa: Add initial Arm FFA driver support")
Signed-off-by: Carol L Soto <csoto@nvidia.com>
---
 drivers/firmware/arm_ffa/driver.c | 52 ++++++++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 8654b3365c9b..c94a6eabe4bc 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -119,6 +119,8 @@ struct ffa_drv_info {
 	struct xarray partition_info;
 	DECLARE_HASHTABLE(notifier_hash, ilog2(FFA_MAX_NOTIFICATIONS));
 	rwlock_t notify_lock; /* lock to protect notifier hashtable  */
+	bool rxtx_mapped;
+	bool partitions_setup;
 };
 
 static struct ffa_drv_info *drv_info;
@@ -2109,6 +2111,36 @@ static void ffa_notifications_setup(void)
 	ffa_notifications_cleanup();
 }
 
+static void ffa_fw_cleanup(struct ffa_drv_info *info)
+{
+	if (info->partitions_setup) {
+		ffa_partitions_cleanup();
+		info->partitions_setup = false;
+	}
+
+	ffa_notifications_cleanup();
+
+	if (info->rxtx_mapped) {
+		ffa_rxtx_unmap();
+		info->rxtx_mapped = false;
+	}
+}
+
+static void ffa_shutdown(struct platform_device *pdev)
+{
+	struct ffa_drv_info *info = platform_get_drvdata(pdev);
+
+	if (!info)
+		return;
+
+	/*
+	 * FF-A devices are children of the core platform device, so their
+	 * shutdown callbacks have already run. Drop the FF-A devices and
+	 * global firmware state before kexec enters the next kernel.
+	 */
+	ffa_fw_cleanup(info);
+}
+
 static int ffa_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -2183,6 +2215,7 @@ static int ffa_probe(struct platform_device *pdev)
 	}
 	drv_info->rxtx_bufsz = rxtx_bufsz;
 
+	drv_info->rxtx_mapped = true;
 	mutex_init(&drv_info->rx_lock);
 	mutex_init(&drv_info->tx_lock);
 
@@ -2191,12 +2224,16 @@ static int ffa_probe(struct platform_device *pdev)
 	ffa_notifications_setup();
 
 	ret = ffa_setup_partitions();
-	if (!ret)
-		return ret;
+	if (ret) {
+		pr_err("failed to setup partitions\n");
+		goto fw_cleanup;
+	}
+	drv_info->partitions_setup = true;
 
-	pr_err("failed to setup partitions\n");
-	ffa_notifications_cleanup();
-	ffa_rxtx_unmap();
+	return 0;
+
+fw_cleanup:
+	ffa_fw_cleanup(drv_info);
 free_pages:
 	if (drv_info->tx_buffer)
 		free_pages_exact(drv_info->tx_buffer, rxtx_bufsz);
@@ -2212,9 +2249,7 @@ static void ffa_remove(struct platform_device *pdev)
 {
 	struct ffa_drv_info *info = platform_get_drvdata(pdev);
 
-	ffa_notifications_cleanup();
-	ffa_partitions_cleanup();
-	ffa_rxtx_unmap();
+	ffa_fw_cleanup(info);
 	free_pages_exact(info->tx_buffer, info->rxtx_bufsz);
 	free_pages_exact(info->rx_buffer, info->rxtx_bufsz);
 	kfree(info);
@@ -2225,6 +2260,7 @@ static void ffa_remove(struct platform_device *pdev)
 static struct platform_driver ffa_driver = {
 	.probe = ffa_probe,
 	.remove = ffa_remove,
+	.shutdown = ffa_shutdown,
 	.driver = {
 		.name = FFA_PLATFORM_NAME,
 	},
-- 
2.25.1


