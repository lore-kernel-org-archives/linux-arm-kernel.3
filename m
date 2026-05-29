Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6376CD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 02:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aOyBFhSSNMbaIW+cOVRW1MwQk5POdPbeF/sApCr12aM=; b=iyPn/YlLArNd47CLQA2fgT0MQl
	LeIV2qoUkHb/khxCp8AjKNFWVdKy1zrdDQ+G4/jb1bgYPd0XQsf20TqiCq4vPSWM+FnCE/mYhPYcf
	wSZP/iCD0s0m+QJnnPsf+78AiDDC8tp5gvpL0y7mkXKSdBGyScEzy+hWFGS1GRPxmUaerOfEi/tlj
	YJd7EBdp5fIJgWEqq7EAt1QFNn3fpkzLWo18mq58OwM/uwGTYGxFSh91kmHZa/wGNDB6Px+NCcaf4
	FFwVfmyoLZERJ5PyR1RL5bcVPguN6L2LWZ9LnqOv1hEPjuOGOz7+Ew7Ek5+CtCxy8+ZyX2F2O1/ip
	2TJL93nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSmmT-00000006dVd-0Gf4;
	Fri, 29 May 2026 02:17:01 +0000
Received: from mail-eastus2azon11011051.outbound.protection.outlook.com ([52.101.57.51] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSmmP-00000006dV9-1q1t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 02:16:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywirGU4oKPcXWDoer7ak6POKi8gpDVlbveVrPHypPgnqPzJI+pwbtjMyJRYYlky2SAVGQPUsC1aY0IYP6F12JQtyk9HRiSzS7qL9Xw80OddD/5gMOYYFReu2S4QsbwYIOZr/4zzbbzyMsfkjBQMloBt44GKFsvi/XTgBIP3oJ3lwex+CgG8yRv2i/CEppPr/S0mvsj+oY9MnpjhxyP0Q0ujhszBXdQD/tC/Mp+ypKRXCEYkCvo2DZ9JX983S5OQmm/gYjriEWxUzsI9+PO+FYwj79VVnc/YHMGNq4sipuEb/vgq58vJZnh0sLSImWd3PJ9vNd7qYlpSw8qTaDAUBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOyBFhSSNMbaIW+cOVRW1MwQk5POdPbeF/sApCr12aM=;
 b=goRF5ccQI7Cxxq3bS9ZJ+N99MGZ+SjWuxydE45tWiVLW1SAD51PvM7SP7UcbVni5Y+YzZTc0EdLcbjQnDKHS6vDlXKBcQIYC2ooHocAWvXaKuRBlJWgnRobi0Y/XKIa04a9hSXDu++gySeLA8RlLxRix3X4JfLQSufz+5sEINzkq/pXXfyVxSvRAxb/9nbdfP1NQSJDala3aOZWcwqf0MScIpmKqivhWY+ZzO2/DXby1TGdct19Is8Z2D/GZBkOANvMvtDnSgRHNyYBlMVzsjvQzkwPctFC0te056icMJ/Dt/iCSDaqUq5+PuNfoMQWBl3HQVjXm0WVdlKllVUct5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOyBFhSSNMbaIW+cOVRW1MwQk5POdPbeF/sApCr12aM=;
 b=fuusZ4gKqNBFjATmZ674kgs7hPHEOElmb6vuW0OkGehwFbtkwjUav7OfoAyTZOLMVUrZ5Nxcd+U7yxSJuyaBZ39Dfp8etGt4PM3TDGn9tui0AgajqM0HVtbNNEA7tOKzULMCJ2jucwJ3Y7IIf0VScd0l8RGu62p+8a57RDDVuNk=
Received: from CH2PR08CA0003.namprd08.prod.outlook.com (2603:10b6:610:5a::13)
 by IA1PR12MB8286.namprd12.prod.outlook.com (2603:10b6:208:3f8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Fri, 29 May
 2026 02:16:48 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:5a:cafe::2) by CH2PR08CA0003.outlook.office365.com
 (2603:10b6:610:5a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 02:16:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Fri, 29 May 2026 02:16:48 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 21:16:48 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 28 May 2026 21:16:47 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>,
	<ben.levinsky@amd.com>
CC: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "Magnus
 Damm" <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	"Tanmay Shah" <tanmay.shah@amd.com>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v3 0/5] remoteproc: cleanup shared carveout and resource-table helpers
Date: Thu, 28 May 2026 19:16:32 -0700
Message-ID: <20260529021637.2077602-1-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|IA1PR12MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: 43601021-a797-416e-1074-08debd2856e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: TAKx7kjDXKtJIKMGl74gJwpgKJRHrtdys74sqk3r578CaJuk2rPDmZt6H57L1kSE6JOwAYO5kbjm5Q/Oj65dxWf1cC2JPKPeH72leSSFtkxgn+50j93nvFpqmfLNqlO1VXIgNdlPRTXS06gP1no0WipQ23/aOxApS+Ka+lerVFc1SbIy4f+uWgudziq8JobLTEtPHegd6NCHsBnPiENs60Fh5O39vEHZb6MNFJnPCXbc99VLQWnNteK+/LkizrXH/8MGKlV3FE1QsmbpbUU+f/Ai/YMhQqNoVh2g4dVt7FFTTDH+6kb/MgXu5nPuCCSO6syRm/LiGlUFzBA2Ztst1WTuWEIdsFlfSzdrX+fazwy3056BYRO6mjKSYBYA1uy1gsF0mXKhxV7vhLQWtor+/H6zfQR1tofkPISwcUfjfIoh+lgxK3PAvpHFoPNrM6RJ+jjF+Z29AOyZe6KwWFz11n2SkiSQbWCkDBogJKPkquc3U6En3HJ3dutEDc8R7iwzYKHCCU72uMccW5FqQrNrIrNOR8sFeQSKnm0aLvqr62eCGR0Xm4qUr8W9sKgx/r50C9uKxtlk73gK7J3vfpP839PuZHRsWBFPV9rAKGP3Kuz3u6WuxVohFnHQg/G+yCF5l+yqnBna4jN3IoNSuA9I6TVimDQgTpwH4cZnWBbJNtLAwaHBrDesnfKOr9wit1rbfltcqYD5SM6YcAXeO/sCJ6YiqYdId8akUzH6gMnzmSY=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(18002099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YgpkeqJMyc6hQ8dpnH63lMlr7TKnED7DW5zkzWFTeoDD0HqlZL6ZCgyx6O11EVjuNRng8p6IMPRhl+LRL4oDW3iXTZymb+RBzxS0vl4Fww5ChVK+w4026Ez1XgloGchSsUqkaexSbtlegG87S/ro3KTEoQv+KUEVdou/3Zcd15Fsfyz8S+lUqpHlbTihPbYqC7RNDjCxTa87fjjza7fs7RffMZlae4j6CWQtjbdZ2vJZNfDCDjjis0S+R+TpsQqqOCUPVdFqvq48nlLQ1y8UGUUnumOQ75TvD6tZrXYuaVkjwBVZXuqhqT8e1NeVwAHbM3g89Zg5JIqahl4jrX8WJ0ZE+erwDqCKt+EpHXOqbAv6Dq20AWwRJNMhDhI/TY7PyeekyCI9hSYyEAYVBnyZwrphv+1Xv813vDfrVDY+D9aiLhEl0Lk/xvhkdhVpscBr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 02:16:48.6749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43601021-a797-416e-1074-08debd2856e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8286
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_191657_551458_D01C22FE 
X-CRM114-Status: GOOD (  17.82  )
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

This version keeps the same overall cleanup goals as v2, but reworks
the optional resource-table pieces based on follow-up review:

  - reshape the optional resource-table helper in patch 4 into the thin
    parse_fw() wrapper form suggested on the thread
  - switch the patch 5 clients over to that helper shape directly,
    without post-helper rproc->table_ptr checks
  - keep the driver-local parse_fw() wrappers and their existing log
    messages and severity choices
  - retain as much of the existing per-driver parse_fw() logic and code
    placement as possible while moving the missing-table handling
    through the shared helper

This series now does that in five patches:

  1. add common subsystem-private callbacks for the exact-match
     wc-ioremap carveout case
  2. switch the in-tree exact-match users over to those callbacks
  3. mark carveouts mapped through the shared wc-ioremap helper as
     iomem so the framework uses the proper I/O accessors
  4. add a common helper for drivers that treat a missing ELF resource
     table as optional while keeping per-driver logging decisions local
  5. switch the matching in-tree drivers over to that helper while
     keeping thin local parse_fw() wrappers

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

Changes in v3:
  - rework patch 4 so the optional resource-table helper matches the
    thin-wrapper form suggested in review
  - note that patch 4 still triggers a checkpatch --strict warning for
    the flow-control macro form, but that implementation follows the
    maintainer's review suggestion for the thin parse_fw() wrapper shape
  - update patch 5 to use that helper shape directly in the client
    parse_fw() callbacks
  - drop the post-helper rproc->table_ptr checks from the converted
    drivers
  - keep the converted parse_fw() wrappers otherwise close to their
    existing structure and placement
  - test xlnx_r5_remoteproc on the latest tree with firmware images
    both with and without an ELF resource table

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

 drivers/remoteproc/imx_dsp_rproc.c       | 41 +++-----------
 drivers/remoteproc/imx_rproc.c           | 40 ++------------
 drivers/remoteproc/rcar_rproc.c          | 41 ++------------
 drivers/remoteproc/remoteproc_internal.h | 38 +++++++++++++
 drivers/remoteproc/st_remoteproc.c       | 31 +----------
 drivers/remoteproc/stm32_rproc.c         | 39 ++-----------
 drivers/remoteproc/xlnx_r5_remoteproc.c  | 70 +++++-------------------
 7 files changed, 73 insertions(+), 227 deletions(-)

-- 
2.34.1

