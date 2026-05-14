Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8691FCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 16:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FmL9ydYaXo6jAUmuZThRTKiTfD+zGRfKFBSWjQKSpO0=; b=F0pTjo43S0sd4oOb1BNPTvVcIe
	Ji1kVuhlBWji1AKJOEBoLt7Z11e77qVIrIeiZMDFRFvJ2Ruh4q6lkJOImLXT4lYUXalxOe4YP5gfD
	hC0cUFv89aTDLiXu41bZa8QVHu3in/yLM8jKJAC9M9DNcZ2CZYqdIfIoFKUuapLo2Dc3j/pwT36at
	UwjkLODYwESWS5/1EWJMMp4HLrFPHD9BRXhhq1JQV7HCdfJOd3u8xLdASo4IIpORY4KNNGEzo9+45
	RkZGIXfaQKcCEB1htmcS3RRL+7kIGDTStr4CMJh/H5thPGvDuMAgXCuZ2FeU51as/+st3MGZuGUy2
	mLGk95+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYok-000000062PO-0ArT;
	Thu, 14 May 2026 16:21:46 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYoh-000000062NE-0pAV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 16:21:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVh9jGE+mepg4e5JGPYLT0gVknz8MJniOU6ekPZ6ec5EHcrMZGWPEYMSXUfkZaxihqofZt1g+EdFD1aUFT2yS6mA+4NPlj6vTzaArZXWQrQ+PWWz9CRvY8SSI8duSgBfPqOYvRATjdK0a0kHOnY3Ga13EEGM6R2a/OFzpciVRL0O21JIb3KGeuWPOaXmpnFJ0EClNU6QYtWss77LtiAcrmuMze6KTePD8P+zNKh+bokWCShU6DhZqm0MoFFyZwcVCbV7vcI1ijwclO4wlkpBiLKwUSxI0ZSe8ZzwB2IKaYQSplWd8z5dhrgLF/WMp8vvhlCgaWZtHCgEEm7TfxS11Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmL9ydYaXo6jAUmuZThRTKiTfD+zGRfKFBSWjQKSpO0=;
 b=XiQIwhvJlKpb4of6/B/z781zuveGwEi/hRa+HLIRqD5qW3PHDiDZXRAK5IZ89gNXefV1SJd6wrTlhW9Ix0/IAlqc6caKogleVqQTf/mkKND5nI776ZtDChhg7qbKkAqNi7v/nX+xFg5O2f6uHp0+0+uJDibdx6T5kad6m9U5+EV0xZzqDWWlAE6GNKDQWGQWLVhxLWaxn28K9XxFBS2IXSG20YoyqAAHqV8EJXk41FOKxpQ8lP8vAQFmu5Z0NtYQ6VTsLyC6y+rEcnceUUMJNDheL8NUi3JJ+uchJM77+/5YlBa8KLqrafhc+PrRl+xyB9Px9ZvsNwSBluUPvnbYag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmL9ydYaXo6jAUmuZThRTKiTfD+zGRfKFBSWjQKSpO0=;
 b=egCeF6TMuhGW7Dp1I6/1J9gGzlkqBtfqBr143hx3suE0n+O2aq2hYbuKDYZuetaJ146t2nlOOmGapeVzI12re7cl42ByPXzWzX1nLzhnzwYKBlgcaY0i5IHnHBKdwWZqo5jKJ1EzsxqoH6lvsw/QQzohizLR8oSj14MzmE0hitM=
Received: from BN9P223CA0013.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::18)
 by SN7PR12MB7909.namprd12.prod.outlook.com (2603:10b6:806:340::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Thu, 14 May
 2026 16:21:32 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:10b:cafe::32) by BN9P223CA0013.outlook.office365.com
 (2603:10b6:408:10b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Thu,
 14 May 2026 16:21:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 16:21:31 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 14 May
 2026 11:21:30 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 14 May
 2026 11:21:30 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 14 May 2026 11:21:29 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<linux-remoteproc@vger.kernel.org>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<festevam@gmail.com>, <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
	<patrice.chotard@foss.st.com>, <mcoquelin.stm32@gmail.com>,
	<alexandre.torgue@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
	<daniel.baluta@nxp.com>, <tanmay.shah@amd.com>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v2 0/5] remoteproc: cleanup shared carveout and resource-table helpers
Date: Thu, 14 May 2026 09:21:24 -0700
Message-ID: <20260514162129.1504162-1-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|SN7PR12MB7909:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b838e92-d09f-4879-6846-08deb1d4dc4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|82310400026|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: GGRQ3aAXNQmK1cNS/V36xc7K2s8hKRjGxzctWvXziyfuGRaa1vLSLbniHS9uz69JIEUzuR+GTP4lXlcc9B7fgWqUk4rq6Vda4kZrKCg5TcowjWNLmTZlZS5LGN3t8uADXQWm6rdPrdo8HPEOBZIsuEBAV3pI43DApMQCm+hYRxFlvODs6Vv3JqMcbeKUK2bCAlob80mUBSI3zuJD1yP9wDUT9QD1NNSu6hrz/9o/2+/4h84rwbsI9oN/bwsrIFH5Y5at/U0SNPNOpwKoXDdGjnYjqHl0eLd3LxMHvoO5o4VVigswtN7tWfod30vNJ2Oo7vaZwqyxLuBYAbsKgppToinNd8hyr9BFWfHoQJR6naMnuKGkzqV0uSiQwwBT2ncPkTRcE/5l4fP3DfrhNcksM5tf/e4chKgcvyi2rqH0uK27BseQyW70a2xIJUUQmBuOVg93lcMs99hAMMoYYdAJX+l1fY26agoCLEMLTQZZHj3uBuQh2qPoxaKtY4Xc/68lAdCCU+evXlD3tTbSMFebUiUIgR/4L0mxFbnmASm0LDyomxP8XogcsSMvAwjzCklYgvjGOLWQ183RbgtO2F3MujLKKSxiKEmv/A1TACC5+jrJn5puPDLiHBMYskQJTLsq7QLUO6UiekdXoDf7hOApD9Z50vSfx8Ry6AVn7/c56Wmo37yE2KiZhGp4P49P8gCIeg/G9ufK872ILIZhWRZ02D4aU6sQgU8rFRMS1/hrvwA=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(82310400026)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: poQoye5bSNuGo8Ci9fURJb1mqrZbgca91oXQi+DvWMAkOJJDTRAiUz7MiWJpE4W/u1S3vLTxkbeXMiOiWY/Geqy6aHDZufWG50vMvRpOe1GkboDknaOa58Z/D8r5p6e5gVM+roccGIv3DM2kVtcCAdw5PUZqAzlgNO8fy+zJ4XVU5IbOP9q3xnW2AsfnWle6ad8xEwodOk5pMzS64bUnd+ixwvyWwhKxjlPqGYt4GsRiC96P+U1lGzLHEGptIa1NVs1/SFIRpUinZgdT3Ws/9g8d/UEnWZNa5WIBzUz3giU+Nm+rZm0nEknTbzAYNyS3ulDKxkV4sXjUOap657IHqr534JTTnTIIBWZp9CAjlTTxt0etdJYHWMuW5a1SzW4j0evTOfF6uI5+30sMKSx8hMNe0e3Esxug1vS0tGImtEa2Ni3lMEWAtsdpbfrk/lQK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 16:21:31.9997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b838e92-d09f-4879-6846-08deb1d4dc4d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_092143_242617_C32F7032 
X-CRM114-Status: GOOD (  15.76  )
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

This series is a preparatory remoteproc cleanup split out from review of
the AMD BRAM-based remoteproc series.

During review, there was a request to move the duplicated plain
ioremap_wc()/iounmap() carveout callbacks into common code and to
factor the "missing resource table is OK" ELF parsing path into a
common helper as well. There was also a request to send that cleanup as
its own patchset first, with the AMD BRAM series respun afterwards on
top once this cleanup is merged.

This version keeps the same overall cleanup goals as v1, but reworks
the series based on review:

  - keep the shared wc-ioremap callback addition behavior-neutral
  - add the common ioremap failure message in the shared helper
  - split mem->is_iomem handling into its own follow-up patch with
    framework-level justification
  - keep logging policy out of the optional resource-table helper
  - retain thin driver-local parse_fw() wrappers so each platform keeps
    control over whether the missing-table case is logged and at what
    level

This series now does that in five patches:

  1. add common subsystem-private callbacks for the exact-match
     wc-ioremap carveout case
  2. switch the in-tree exact-match users over to those callbacks
  3. mark carveouts mapped through the shared wc-ioremap helper as
     iomem so the framework uses the proper I/O accessors
  4. add a common helper for drivers that treat a missing ELF resource
     table as optional, returning success on -EINVAL and propagating
     other errors unchanged
  5. switch the matching in-tree drivers over to that helper while
     keeping per-driver logging decisions local

For the carveout map/unmap cleanup, this series covers the exact-match
users called out in review: xlnx_r5_remoteproc, rcar_rproc,
st_remoteproc, stm32_rproc, imx_rproc, and imx_dsp_rproc. The zynqmp R5
TCM mapping path is left alone because it also clears the mapped memory
and is not an exact match.

For the optional resource-table handling, this series converts
xlnx_r5_remoteproc, rcar_rproc, stm32_rproc, imx_rproc, and
imx_dsp_rproc. st_remoteproc is intentionally left unchanged because its
parse_fw() callback also builds carveouts and is therefore not a direct
match for the helper introduced here.

Changes in v2:
  - split the mem->is_iomem change out into a separate patch
  - add a common error message on ioremap_wc() failure
  - drop logging from the optional resource-table helper
  - keep driver-local parse_fw() wrappers to preserve per-platform
    missing-resource-table logging policy

Ben Levinsky (5):
  remoteproc: add common wc-ioremap carveout callbacks
  remoteproc: switch exact-match drivers to wc-ioremap callbacks
  remoteproc: mark wc-ioremap carveouts as iomem
  remoteproc: add helper for optional ELF resource tables
  remoteproc: switch drivers to optional resource-table helper

 drivers/remoteproc/imx_dsp_rproc.c       | 60 ++++++----------
 drivers/remoteproc/imx_rproc.c           | 57 +++++----------
 drivers/remoteproc/rcar_rproc.c          | 58 +++++-----------
 drivers/remoteproc/remoteproc_internal.h | 38 +++++++++-
 drivers/remoteproc/st_remoteproc.c       | 31 +--------
 drivers/remoteproc/stm32_rproc.c         | 57 +++++----------
 drivers/remoteproc/xlnx_r5_remoteproc.c  | 88 +++++-------------------
 7 files changed, 128 insertions(+), 261 deletions(-)

-- 
2.34.1

