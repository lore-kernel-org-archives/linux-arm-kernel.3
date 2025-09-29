Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE34CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 07:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MghdMgfTD1sb0lWNUBf7e7nF1/2OnEk41WHelh7XTsY=; b=2rxHz0dOIW4Sh4zqoOiPxi2EnE
	3/Ane2k0ALSN5emxH7giZnruarEPkHkxT1q4/jTZa2Vv1VgpL6FEMnSLbcdGK/plsYs94OYJHO34F
	8tfnw0RkiOupEzoaIT2cnj3nstwAhT7z2Qo391P0xzQMkbFkWU0n3+6vywstG967SThZWSpjAlCCj
	ZVSEeyr/MbasqoPCICGH5suEPIc8oiHmulnvP0HHWcC0siiLwRShm45i7iaGNVttpGQRsNGRI24TS
	+mhuhiPVRcNN2h/Pxnuq3yx92MgC+XmC7NO6q30id/0FvJXaSJO8QNbDjwKmB/vxcO4NSVbZD0Xl6
	7k73gVHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38TD-00000001dh6-2ROV;
	Mon, 29 Sep 2025 07:38:51 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38T4-00000001dbL-46pJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 07:38:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYu7H3Fb/yJR6g5zr8xptiPjqhvqmL9tSJHT2zk9JNycitZrQghS8uKjIC29vZRAmmXGDfOMN/EIX5ejCRtLrIdetLVw3jNfOCjHkhpJuQ5+m1g0et+1L0RW2PTBEB4yWm7MkTktmJHiVKnmSgosXahVloSce4FdSkeM6AiWXYXNbrnY5JuVuwGfRGTB4Pxu348yQtVwLz4ZGX9cj98Ux7rRpnKan3qcLPPUsI+S+AS98sHjOplzWnyS4paZ/7ULVQt7tU3tL5E1VKs83fdLQyU+n6c845Azia3n2PxgQ8AnxFOxUpGg32Bnsky2RxpeMltUsVe/H3Xq3Puspctgew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MghdMgfTD1sb0lWNUBf7e7nF1/2OnEk41WHelh7XTsY=;
 b=Otbwt+cAHbMtvXswBPB0GaYua33y7+KpEiQ7Qks08GISETDNIfd7dDIwSTom6Dx1I2xxZdy3i9pe7tiCfNDiWk1F5QTSVLrx274S4iVNJ2EHnSkuzys0URdKEEohWwVKCiTwqricvA5OEx+ILgP5gT71+ptyHuFc222dIsvCDLKCEot4oP9D9bjE0CFzXOszTLPPG5qfKtTtWt4lDSoOFaP+hPgOfwZ//h1uOdoyEaDnJhtN0IYbNr/v5zzavmnOdOmuQ1zmXnImN0DFGp5zrhUnZ+B7eanD6rGZG2IdWk7w8cAjPPzExnJ5yhr8HbSxfIEOMjXYBSGjkIcIEPIdxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MghdMgfTD1sb0lWNUBf7e7nF1/2OnEk41WHelh7XTsY=;
 b=5o8bfgswx0P71m/pxV7j1U+RnEuJNuXrEfAIjXSmKpnhMZQahBWbQ2WIytQGEnlN8ADCZaF5s+RBRy2x/sBS2O6I1MdmfspBqlIY/VLhuPiyJxfYs3NFjRydyEbKDaiQFNtLIpxnYLuqhfADxyRjFhabgsLwFfh+Xl1C6zIFkwU=
Received: from SN7PR04CA0103.namprd04.prod.outlook.com (2603:10b6:806:122::18)
 by DS4PR12MB9587.namprd12.prod.outlook.com (2603:10b6:8:282::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 29 Sep
 2025 07:38:01 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:806:122:cafe::1c) by SN7PR04CA0103.outlook.office365.com
 (2603:10b6:806:122::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Mon,
 29 Sep 2025 07:38:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Mon, 29 Sep 2025 07:38:00 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 29 Sep
 2025 00:37:39 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Sep
 2025 02:37:38 -0500
Received: from xhdharinit40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 29 Sep 2025 00:37:36 -0700
From: Harini T <harini.t@amd.com>
To: <jassisinghbrar@gmail.com>, <michal.simek@amd.com>, <peng.fan@nxp.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<git@amd.com>, Harini T <harini.t@amd.com>
Subject: [PATCH V2 0/4] mailbox: zynqmp-ipi: Improve resource cleanup on driver unbind
Date: Mon, 29 Sep 2025 13:07:19 +0530
Message-ID: <20250929073723.139130-1-harini.t@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harini.t@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|DS4PR12MB9587:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b0a28aa-e67d-4997-fd7c-08ddff2b1db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JVSATqRo3Pqy95u8Si4CZ09KINOcda8GEd3K9BM1VKwn10OdSgxMT2Fhc1T8?=
 =?us-ascii?Q?x16FeOXq/ehFnNPsvMgqXdV2UMY11FHA4ihWxptIa8s3927WlrpjOYzUUay0?=
 =?us-ascii?Q?nfjTKRLaVNLxM9gmlrYuaPPqxSuqPcF9YawV3hThETZ9WUfEx0SGHrzd2ivz?=
 =?us-ascii?Q?PuCv6kBPe0XnYCb1CYoDpkrdyMAjwxEbvVV65Te3x8vN59o2dnu12e1oZaOB?=
 =?us-ascii?Q?Xy+fbcOe8GwncI2KYVBy/eNc30tMECR8qkKS5W6DnXMvYmyYEbHFMfbdH5fP?=
 =?us-ascii?Q?tbN3Ql+Kj81UCx8NxrVUTIKBHjSdWQFkTuKkg0EpykR2jagWKNoUPglANlMl?=
 =?us-ascii?Q?Q7dS2KAECysY5OE1hpjMtYkm6RNezBZ9r4BcDwg/fM/YxC4XI4QG6imqvZCY?=
 =?us-ascii?Q?xytSk28lWIDliCq/nG2wqzzsPOZZDo1Up0E9UEuTOSobegikYcBNygtYmMSU?=
 =?us-ascii?Q?7r1tn9xCXB8m8Zgt2KqPLCBJXH7NCSizUPlV0Tb+O9kFI4JVxznBAR+4URAD?=
 =?us-ascii?Q?BJCMQZP5toOzM/zxWxrFCt55Vrq9i9t9LdAHwnekF4jkQSV+Y3xfhSZwvSKw?=
 =?us-ascii?Q?zPVRk8VFophfqsSbotmaDh/VErkvOvd/uHIjHCETGf+JYH+9izGlLC4/hLuM?=
 =?us-ascii?Q?QWZTA5jJk0LW3izpuAVarfBMoO85qG4fhF0AC/P4594QJqGXzaSJbCfabVYo?=
 =?us-ascii?Q?ZBDsxZ/7w8NfOMTLFVCvN3odmKRDsK6UGd4kvrU21TeXvuxint3009mrWlzx?=
 =?us-ascii?Q?jDCgcmQH+hf9/WB5fPXyJEP4B/jDFG9RipQH703p2Z5DPkgeS5iGq2sg5n0S?=
 =?us-ascii?Q?K9SiV+ePA48RKZNRR4iIxC4cF1gOHfVMVdo6Jy96HQBt/0X7dqc2HAhb1WMy?=
 =?us-ascii?Q?d+DmzcVGOskmvqL5UGWTG48HX2LzOBfA1ZSwPaxFK/gvZGNzCrM8IzCofaQ+?=
 =?us-ascii?Q?0rYg8XKlVDkT7l7HQQ9mqV2apdTOxBQ2Ww5bBZCMFXk5tVSBVhVZNGIA9Cdh?=
 =?us-ascii?Q?oKlkoVDTXX0Qp4gh4ZRlc5XjSfIjPDucv5wH776LZ132lW8qwA69kvEw50+X?=
 =?us-ascii?Q?UWeGEoflfbtZ22tq+qSIQo4qxt4nfvYbhPRKomXsgWmVoEnVangH4/8qG4Vp?=
 =?us-ascii?Q?JjUD8xaQ2p7wL9cMWj/dkTYUBvY59w9tsS5HfXYqAQ8g6t3wZJidEaCrNjMl?=
 =?us-ascii?Q?eYL301mW9EuOz1opWEy2nuXBXHhoC/9hjKqbX+0VkanwCVGCm80eAzSiyoZt?=
 =?us-ascii?Q?lkRiEThtwEgQPRSWKqRb7qTv0B8+ViO/0oev7W9ZY3UPzPcsz7+L9f4xbOTV?=
 =?us-ascii?Q?Y8TopbC4IEI8FMfkNADkKu+LySlvB9tdXSSyPomeCJV3kwN/C8kY4R2RoxAS?=
 =?us-ascii?Q?fehWVtkVK/y0EBXPKB+pWwQ4da878mUIbr39ObD/2wzKgKuJ6TcKFFXncrxK?=
 =?us-ascii?Q?FVe2qHdCJHNEJW8CTqa4/iQ4WxdtzVMuV+EtYV9eiJRVa9fM54VDgTYqH1Ds?=
 =?us-ascii?Q?b/adsY5l2cZoiCLTNpVAWSuXJJWEGcpWaqCCgt3DC3m+nXMhL05FjC7Q3Vz4?=
 =?us-ascii?Q?V9e2ovhhadUukBiW4Tc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 07:38:00.2718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0a28aa-e67d-4997-fd7c-08ddff2b1db2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9587
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_003843_017583_1F10DBD6 
X-CRM114-Status: GOOD (  12.47  )
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

1. Remove redundant mbox_controller_unregister() call, as
device_unregister() already handles controller cleanup.
2. Remove ipi_mbox->dev.parent check in zynqmp_ipi_free_mboxes() as
device_is_registered() is the canonical and robust method to verify the
device registration status.
3. Fix the mailbox cleanup loop to prevent out-of-bounds array access.
4. Fix SGI resource cleanup by using an explicit irq_type field for
reliable SGI detection, replacing the unreliable IRQ number check.

---
Changes in V2:
- Address review comments from V1.
- Patch 1/3 from V1 has been split into two patches in which the first
  focuses on removing the redundant mbox_controller_unregister() call
  and the second focuses on removing ipi_mbox->dev.parent check.
- Avoid using i-- as the 1st param in for loop.
- Avoid using variable name in the commit message for patch 3/4.
- Add Fixes tag for all the patches in the series.

V1 link: https://lore.kernel.org/all/20250822045732.1068103-1-harini.t@amd.com/
---

Harini T (4):
  mailbox: zynqmp-ipi: Remove redundant mbox_controller_unregister()
    call
  mailbox: zynqmp-ipi: Remove dev.parent check in zynqmp_ipi_free_mboxes
  mailbox: zynqmp-ipi: Fix out-of-bounds access in mailbox cleanup loop
  mailbox: zynqmp-ipi: Fix SGI cleanup on unbind

 drivers/mailbox/zynqmp-ipi-mailbox.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

-- 
2.43.0


