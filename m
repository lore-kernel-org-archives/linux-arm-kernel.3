Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AD2CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pJ+mAEF4gTcPP0yuCSSDawXZa9YmtM/8CnfSXl8auwE=; b=Rl8pQZoH0izXXGKrIiuUiC9umB
	GA0+/JXUDv2ev2zHliUnSy+Xyyj6s3hkLAFCJbTyQq5k8UE+CD0cUTh+oa0YuknPVvM+gnQ3nY9bQ
	fm9ZbOvMwppklWkQsSxN40mnU8SzifbR+cC+//Y3Sf+x6jKfS5Dk1aV1Z7AZFRbONioSomrYqBFMg
	xQncD4yyGyLLtktcJv7MDqXmOQZrzjSp2lhom/w3TjHxhBu66CAi0/RJcuSpPLOghVM3mRuwoQI25
	dPAhxcj/uwRaYsOVR7C6Mg0RDG7VyAx85eRCTgx56sI91BpLliE1Lvo/lpJDETNSdkElhgeJUYk6Q
	ZBsBv05g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdpP-00000001EgQ-1lfC;
	Wed, 06 May 2026 15:06:23 +0000
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.155.198.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdpG-00000001Ecq-2YUv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 15:06:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1778079974; x=1809615974;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pJ+mAEF4gTcPP0yuCSSDawXZa9YmtM/8CnfSXl8auwE=;
  b=K4T4+7Ez8xOAx4W24DauxXYzH4Ms/kVXeBBeyJpYQRlLspvc8oZCz0Tx
   U0flhsp99L5riEEsZBumAAO+iYHobwJDRIIWgs0kDRVyKy3A/Q5vtGlwR
   92hzzvLe2/1g3AlHSIn8mNOYy7ArZErknk67ZfvWZVUQP2traaSnVWLYQ
   WiIZsvOO6w25N+V3BeaYbG5CirqcOFlgG7OpTTiy9d3m3F4ECL7fFjyFb
   9K/5snwR7wmTyofn/tDbKKSQ0yCAx2cUSm8Y3P9jBZpE0WEJVdoNVxJWV
   ZYAy+7CEoPsKScrBStS0vyHEc9285WQj5DceR2w0nzXmoN5i9g/l6NC9U
   A==;
X-CSE-ConnectionGUID: dt5nDv35SXyZ1iFPxgXUFg==
X-CSE-MsgGUID: Zd0vJ0ZHQEm13B6RV4d+Ew==
X-IronPort-AV: E=Sophos;i="6.23,219,1770595200"; 
   d="scan'208";a="18889457"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 15:06:08 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:9321]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.37.224:2525] with esmtp (Farcaster)
 id 2731fe09-c9e6-4f50-91f1-2a35684e3a18; Wed, 6 May 2026 15:06:08 +0000 (UTC)
X-Farcaster-Flow-ID: 2731fe09-c9e6-4f50-91f1-2a35684e3a18
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 6 May 2026 15:06:07 +0000
Received: from dev-dsk-yigitogu-1a-d17f6574.eu-west-1.amazon.com
 (172.19.100.7) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Wed, 6 May 2026
 15:06:05 +0000
From: Yigit Oguz <yigitogu@amazon.de>
To: <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>,
	<baolu.lu@linux.intel.com>, <dwmw2@infradead.org>,
	<suravee.suthikulpanit@amd.com>
CC: <jgg@ziepe.ca>, <nicolinc@nvidia.com>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Yigit Oguz" <yigitogu@amazon.de>
Subject: [PATCH 0/3] iommu: Add PCI vendor:device ID to IOMMU fault logs
Date: Wed, 6 May 2026 15:05:36 +0000
Message-ID: <20260506150541.60467-1-yigitogu@amazon.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Originating-IP: [172.19.100.7]
X-ClientProxiedBy: EX19D039UWA002.ant.amazon.com (10.13.139.32) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_080617_998228_ED588C78 
X-CRM114-Status: GOOD (  10.25  )
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

IOMMU fault and event logs currently identify devices using only their
PCI segment/bus/device/function (SSSS:BB:DD.F). While mapping a single
BDF to a device type is straightforward, doing so at scale across many
hosts and thousands of fault events requires additional tooling and
manual cross-referencing. Including the vendor:device ID directly in
the log line makes each event self-contained and immediately actionable
without any post-processing.

This series adds vendor:device ID (VVVV:DDDD) to IOMMU event logs for
ARM SMMUv3, Intel VT-d and AMD IOMMU.

Before:
  arm-smmu-v3 arm-smmu-v3.0.auto: event: F_TRANSLATION client: 0000:2b:11.6
    sid: 0x158e ssid: 0x0 iova: 0x280000000000 ipa: 0x0
  DMAR: [DMA Write NO_PASID] Request device [86:00.0] fault addr 0xe0000000
    [fault reason 0x05] PTE Write access is not set
  AMD-Vi: Event logged [IO_PAGE_FAULT device=0000:41:00.0 domain=0x000a
    address=0xe0000000 flags=0x0020]

After:
  arm-smmu-v3 arm-smmu-v3.0.auto: event: F_TRANSLATION client: 0000:2b:11.6 [8086:1533]
    sid: 0x158e ssid: 0x0 iova: 0x280000000000 ipa: 0x0
  DMAR: [DMA Write NO_PASID] Request device [0000:86:00.0 8086:1533] fault addr 0xe0000000
    [fault reason 0x05] PTE Write access is not set
  AMD-Vi: Event logged [IO_PAGE_FAULT device=0000:41:00.0 8086:1533 domain=0x000a
    address=0xe0000000 flags=0x0020]

Patch 1 adds vendor:device ID to ARM SMMUv3 translation fault logs.
Patch 2 adds PCI segment and vendor:device ID to Intel VT-d DMAR
        fault logs.
Patch 3 adds a devid_str helper and vendor:device ID to all AMD IOMMU
        event log paths.

Testing:
Build-tested against mainline Linux (torvalds/master).

Runtime-tested on a custom downstream branch on ARM SMMUv3, Intel VT-d and
AMD IOMMU hosts. Translation faults were induced in a virtualized setup
by removing DMA mappings for an in-use region, causing the assigned device's
subsequent DMA transactions to hit unmapped IOVAs and produce
translation fault events. The resulting log lines were verified to
contain the PCI vendor:device ID on all three platforms.

Lilit Janpoladyan (1):
  iommu/arm-smmu-v3: Print PCI vendor:device ID in SMMU translation
    fault logs

Yigit Oguz (2):
  iommu/vt-d: Add PCI segment and vendor:device ID to DMAR fault logs
  iommu/amd: Add vendor:device ID to AMD IOMMU event logs

 drivers/iommu/amd/iommu.c                   | 94 +++++++++++++--------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 29 ++++++-
 drivers/iommu/intel/dmar.c                  | 33 +++++---
 3 files changed, 104 insertions(+), 52 deletions(-)

-- 
2.47.3




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


