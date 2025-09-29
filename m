Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A33CCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 07:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8ajutcYdU3A3s4Lu8yEBHQTJL4VsFBpu5rcHyjIxQs=; b=mJhSA7QzRffWQQGhNcIDrM0FCT
	xQh2YD/hx7h8ZUCU/0senL1vDT7jd5c7F6+41/mOaTThMfPZ+mSb+iEcUzBYebxS3+EvJeK08mizJ
	xP6jDJIErVXxNi2C24bOUkPm0gtquiiGNX5ZCWC+QrOlGfYTWDuXJT9nvy9DFOIki70y3wcIjzq28
	hYs209MW99Zs73/s6sZ1TLs6KpGzaGMto4zU4MN2OWtVlqQNYly7/Q/UDdSgrq+uYZlF13pP8R9vw
	spgqWcpcF4FiO8NUOhgQZTE19gBp2jOChMOXWMZcntdrdCjQ5n7Qm5ac8n1XyozAvxKh7DxoERQii
	2ZudTqfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38T6-00000001deO-3qeh;
	Mon, 29 Sep 2025 07:38:44 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38T4-00000001dbc-2zdS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 07:38:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkF32uMccHDBnX8H56EJBhZJx7sHPp/OlLapXMO7fadPY0Z9ugwX1weFcpc+2I0250K3PuonygpYElKKwAYlX2sRw42SS6SZLKw6RtbIwkehRri583GwjwiRYlGsIp3JN4XmiYHBE3dAIHISCscb8ehzM+ydhUUmICChf9yLyvmSKcIF/gJtoIGSyPFQ9EPas+2EeXpDMYYEOV1STKFpKuD06e8IovcOJWv31JUIQSL4Z548LO1kUoo5SA+C/YI2HqEaL67qfLcOVMZrqwDOBCqhpFiye/2VIEB7JwisiA85uZ1e8PydISimgJyjeygkHFzQtbZswRDRIeCU53EQKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8ajutcYdU3A3s4Lu8yEBHQTJL4VsFBpu5rcHyjIxQs=;
 b=d3FLq6F4n0NxlhhKUlgInxlHKlcpfUad7VW4WDrFCDvmWSjk16yqiqu0u501Gzo8Y3XxC30p3jHcTqOvh2BoOAKLcOJxpvHanOnw7AwMXbxSnsad/NrJbori2spr6/o+0VqYb3IBQ4QMlNI+870OegIBfIKZHJE43MCd41kZwG2eCcHyFe53CbuJViJNS9ZxVMAEIoVlJzuXI+9v/ik4SRSH0Nq2PtaU1uCC6xF6+oC6gZQ/5SAzvHr74LGsAfGP8YxxmcBuHPEL6sEA0eqWoUImdNKCwShqNibaash2T4QSGLtFM1lMBbH+flmjPu+HbV5bKL6usfHCtgwTZnxFzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8ajutcYdU3A3s4Lu8yEBHQTJL4VsFBpu5rcHyjIxQs=;
 b=HUhzp34H3wzbcVuPY1oAFgx2DGWq4eeYJkLGjWwQIJaC9W703FOkHu64gdVUOIFNgXWZyDx/A118T198nAWMKz5bwcODrKGxVmTM4QFXo8PF2iae4vfOKHpO23AHqlJip9cP6wKr0VkWJYuVKSubuCDe56hjzda3+fECOTdJCeE=
Received: from BY3PR10CA0027.namprd10.prod.outlook.com (2603:10b6:a03:255::32)
 by CH8PR12MB9816.namprd12.prod.outlook.com (2603:10b6:610:262::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Mon, 29 Sep
 2025 07:38:27 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::34) by BY3PR10CA0027.outlook.office365.com
 (2603:10b6:a03:255::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.16 via Frontend Transport; Mon,
 29 Sep 2025 07:38:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Mon, 29 Sep 2025 07:38:27 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 29 Sep
 2025 00:38:03 -0700
Received: from xhdharinit40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 29 Sep 2025 00:38:01 -0700
From: Harini T <harini.t@amd.com>
To: <jassisinghbrar@gmail.com>, <michal.simek@amd.com>, <peng.fan@nxp.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<git@amd.com>, Harini T <harini.t@amd.com>
Subject: [PATCH V2 3/4] mailbox: zynqmp-ipi: Fix out-of-bounds access in mailbox cleanup loop
Date: Mon, 29 Sep 2025 13:07:22 +0530
Message-ID: <20250929073723.139130-4-harini.t@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250929073723.139130-1-harini.t@amd.com>
References: <20250929073723.139130-1-harini.t@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|CH8PR12MB9816:EE_
X-MS-Office365-Filtering-Correlation-Id: cda656a3-0472-4b1f-9168-08ddff2b2dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iBCNMo1Uz6uH+KMQOo/kmDOH3RRWhGJpWX9GKQM46L2NSDx0TulbXYpksQbh?=
 =?us-ascii?Q?Yyj65ftTwyz5D2CS5Q2zDv6JaA/cmM56crFy6lfwbSg9uLCEweo32O4aY3jr?=
 =?us-ascii?Q?aKQkqrHj3ghiLN/vBvEzIi7XKNqBE3af/j3c5yvVWxCEb6Sm1Y+2aL/+4l+z?=
 =?us-ascii?Q?tGqpa0+lgu5LZkWFSoXqKKObiDXvj0RVp9Yfuu/rX++qRnWlVN20JrOLaZg3?=
 =?us-ascii?Q?LJnuxbEQSa9rZUkxUUeW7xnOnLj9tdl2xnSuHtqflHouQfN+LOTJdsHPGWD+?=
 =?us-ascii?Q?p2vUctBDKFIGa32AQvg2kbWf4E010ZtQTGS6RQvTWzF9Rwd0AD1F1C0VDKAU?=
 =?us-ascii?Q?pnFV9DBvT6GYZfb16U/HKTCAntW1/OOLrr35QfdA96LSHU8ylJDhfsU38j1X?=
 =?us-ascii?Q?HZPSQrnSw0Zc71v2zAPjaprDj+gYsyZ+CO4NSZwcHO5arfsHVsAsO+oMFaeV?=
 =?us-ascii?Q?OzmItfnHtlrKY7Ml2fU0UPlcbHWkgaVTkEWTfu9EwxxVabCZ/a87apE42E9a?=
 =?us-ascii?Q?1Vg5mUf3yjPYTjmRVQ33lA8tm6EFpfRunqoAvCQpv0uodYFFDL7NVJUimKyy?=
 =?us-ascii?Q?gk2AbLa+yZdOlIzqI9CnA/F3y2+Uu973xHaiaVzy92Z/M2NNCmWJTte9p8pp?=
 =?us-ascii?Q?4g9ZQ6SugSf9O0rBH1s+blDm4VhL1ehck3r7zW8aIJ9NoRd83NgQm4pTY6/Z?=
 =?us-ascii?Q?5NoO9Yy+vHUQnWzw+B2GXWZPAIc3XOY67w3hLiQGdFb8i8bxrFcirLifS42Z?=
 =?us-ascii?Q?+Uj56kd1X6mNmOq0CJG379ymxKKJ3JxQIhTSAzIVrhvRAMWAh/FjWRIL6ffa?=
 =?us-ascii?Q?kcHl/AOutG4fDtfEJZUf6Wjkv++03UDXMYzrra7axyMICkxn0gNIkNITTIZ/?=
 =?us-ascii?Q?q0ZFLgXqzxE65PMqk9JWVtFBF65n+s5ivZOBThxFTTvOcsyEHX+twbSha9Xi?=
 =?us-ascii?Q?kL+RAnxKFuWQ/Xs3PIQ91VAo3+50vN5gEpaS1CPnqXL5RoZX/t/l/zMdKG/i?=
 =?us-ascii?Q?EpkbUE2/b0WhTBCjiCgwbu/DCxZteo0SrFNazhWN209M7kOzIAnfg3rjN/lL?=
 =?us-ascii?Q?/4DaAikIPhQMonci6aFhuSTi7EKh149mTfM69Ls7pI6e0de49ghQFvDPi6SS?=
 =?us-ascii?Q?eB/KnXctSeV9lB6YiPi1Q8CJR2f1jtm0KE0viUHjMGsOM13wL7HyFVyiHCaw?=
 =?us-ascii?Q?AQpTb0OPGBK6asxqcoAMRaqpZ6+BSFnCJrRLxxj8cs49E9hCnW2BJcxys9R+?=
 =?us-ascii?Q?+JA+i/Qsqpce/uVCJl+//b67NH0BuCN14qljffpCSB18aHprVx7dymzv7w1f?=
 =?us-ascii?Q?M2my7Zddy/REDXKu/9n3whnDDo4gdqzjTOFlgkhPYTLQW3KLxJKi5SnEn//V?=
 =?us-ascii?Q?GYnpA+jjK9fxVjbUqzWWfIFimCSv0fL1faykzWBCA7XqsgrRTuETElA2EjE3?=
 =?us-ascii?Q?d8mSG8MWLi0pSDR7HZIe6JlwlqjsnasPOlkEIxAnQmsVYNSPX/y5cnCWXPy9?=
 =?us-ascii?Q?e8XVyjXfxDy0FfhRZEcCrGXFWRGTqT9tyB9CuHDT4+9/rjp2uQIgdsDT+ud0?=
 =?us-ascii?Q?Fedp9FeVbkO4ygDLMUI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 07:38:27.3136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cda656a3-0472-4b1f-9168-08ddff2b2dd9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9816
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_003842_758187_316E37BF 
X-CRM114-Status: GOOD (  13.16  )
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

The cleanup loop was starting at the wrong array index, causing
out-of-bounds access.
Start the loop at the correct index for zero-indexed arrays to prevent
accessing memory beyond the allocated array bounds.

Fixes: 4981b82ba2ff ("mailbox: ZynqMP IPI mailbox controller")
Signed-off-by: Harini T <harini.t@amd.com>
---
 drivers/mailbox/zynqmp-ipi-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index bdcc6937ee30..dddbef6b2cb8 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -890,7 +890,7 @@ static void zynqmp_ipi_free_mboxes(struct zynqmp_ipi_pdata *pdata)
 	if (pdata->irq < MAX_SGI)
 		xlnx_mbox_cleanup_sgi(pdata);
 
-	i = pdata->num_mboxes;
+	i = pdata->num_mboxes - 1;
 	for (; i >= 0; i--) {
 		ipi_mbox = &pdata->ipi_mboxes[i];
 		if (device_is_registered(&ipi_mbox->dev))
-- 
2.43.0


