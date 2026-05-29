Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F10CD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 11:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lCxdVVEheuvS2AoHvSV+25X74uQUGsdU+w3bwjC0ns0=; b=D907p9hLURXg0ELtUHpFPFV/eu
	LgseeN75vjl8T3E9oeNNdMiCi9pFH3UGBWO2Lc6pdxKl0HdTBS91GaZDP1to7JDwNe3I6iAdw31zc
	Magx5HTdDE0x+wZbbvBNozKF1bM0qmCOtW8kO5ZbZwauVcurvfxlXU1z8WO7SlkCeDWduWTPufoCZ
	9h6ecHTg2beXyxzHO/xJyT2HTve3NsQijz1NCWv7GrMB6tb9UE0LFz+o2NH/9hIwBXuPSJzSrK1I0
	+vhxziJ8FIc8Z63GQTpmVkExPXnIwb99sTpxWFGxcqsvjqwhlwfx0PeHHAaZ5K5HQTfz62vFiIHkJ
	gLPQbLgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSv8S-00000007FaT-0aGM;
	Fri, 29 May 2026 11:12:16 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSv8P-00000007FZY-3TVJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 11:12:15 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-841ef4bf8cfso1401068b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 04:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780053132; x=1780657932; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lCxdVVEheuvS2AoHvSV+25X74uQUGsdU+w3bwjC0ns0=;
        b=RFxPZ0RzfiSwTfnMwT124pwVCrLadObujRWEkWmjtnhdoCHew7vShuM+f7kH7m0fwa
         DVk228+Lh4XgI9cXTrNeMPzKxrSp31SMKClnutQgYhWWTp9hR/HSC1BHcvCH0dYyt7dC
         +Hong7NpMVNDd9xStGDpVIkO3vvk+LWw3QFVUvTdklhvPaRY9kT3z2tCBzDB0PqxqJx6
         a2DiiXSA28xfFGFQxl7SuGOfvDt8l6xtoq0vDfIQi16Dd4pUdodqtmUblIbew+ZXc35L
         SciYbizHOKm+ah9ysQctvvxDVzhxkU+1FYE2FysEnkmFF5N8AdW/FJ5ZvPJpAxyLarKk
         Ei7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780053132; x=1780657932;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lCxdVVEheuvS2AoHvSV+25X74uQUGsdU+w3bwjC0ns0=;
        b=qmPeHAzpa+vDzT5b1ghHNyc8UMJg4nwDvTwDVSyep4XQ6nmiTMQgG39uh0buzv5sa1
         vY8hBIrr9tNNzw4xA3WM4KjhhBdDh6S6BBTI4wWqHbJqanAUlTFKXcwR8x4AgW3DWALr
         jbRDP4ZFd3d0wYe6Mn03+znLpz5LsJdqf8C6+F5IHlQQrfUok2Bd8OwJeMdV/ZKQiPDg
         mIYpjQMq1kR0PGda7uBfmIGgwkAtYKxqDtb6NtwUkOs0YMP2g/lt6Du+DdOmdmVefBJl
         NUzSEUd82vZk2YwKW24+JPHF4uO+8Uh1NzVa/T2SdDQXsaWDv5Rujn8qXEYtPWKELLka
         Psyw==
X-Forwarded-Encrypted: i=1; AFNElJ/+4S0/S/Xj+UlfQxtIw0IqUEWcbPwjth1ltrNUQz/wyJhLSehbsXiSZmh+kWNYYQpcC2YwL3zjxCofu6d+Ncxg@lists.infradead.org
X-Gm-Message-State: AOJu0YwlXzh2MhPI3faSiWABtskuB1Fr4ee9ILLgUA85Y6IBORYfuxGz
	rMFZ0ZYq4KK57dr00o+FxTKDqQu07xvUuf4bj3SM3scV1DaXGEAjFnL5IzRRZ95bjqk5l9MmqmD
	MQA==
X-Received: from pfbgj6.prod.google.com ([2002:a05:6a00:8406:b0:841:c3cc:207d])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3693:b0:837:8c8f:8f51
 with SMTP id d2e1a72fcca58-84212dc82c2mr2600820b3a.47.1780053131812; Fri, 29
 May 2026 04:12:11 -0700 (PDT)
Date: Fri, 29 May 2026 11:12:02 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529111208.387412-1-praan@google.com>
Subject: [PATCH v6 0/6] iommu: Standardize ATS robustness and state tracking
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Nicolin Chen <nicolinc@nvidia.com>, David Matlack <dmatlack@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Daniel Mentz <danielmentz@google.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Mostafa Saleh <smostafa@google.com>, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_041213_900047_105D42EC 
X-CRM114-Status: GOOD (  11.29  )
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

The primary motivation for this series is an ATS state mismatch observed
under heavy load (via iova_stress). A failure in pci_enable_ats() leaves
IOMMU drivers like arm-smmu-v3 with inconsistent state leading to PCI core
warnings during device detach.

While David's recent work [1] addressed a discovery race for specific
quirked devices by moving them to the HEADER phase, gaps remained
regarding how Virtual Functions (VFs) inherit state from their Physical
Functions (PFs). Specifically, pci_ats_supported() did not account for
PF-level quirked status, and pci_prepare_ats() lacked STU validation for
VFs.

Based on discussion with Jason and Baolu in v3/v5, it was decided that the
IOMMU drivers should explicitly check pci_ats_supported() before calling
pci_prepare_ats(). To enforce this, pci_prepare_ats() now noisily checks
for support via WARN_ON(). Furthermore, the device probe should fail if
pci_prepare_ats() fails. Since these early gates preclude software
configuration errors, any remaining failure during pci_enable_ats() is
treated as a kernel bug.

This series standardizes this pattern across ARM SMMUv3, Intel VT-d, &
AMD IOMMU drivers.

[1] https://lore.kernel.org/linux-pci/20260403222750.1215002-1-dmatlack@google.com/

[v6]
  - Reverted the decoupling of pci_ats_supported() from pci_prepare_ats().
  - Added a WARN_ON() to the internal support check in pci_prepare_ats().
  - Dropped the standalone Intel bugfixes (RB-tree and UAF) to be sent as a
   separate standalone series per maintainer request.
  - Kept the folded UAF fix in the AMD IOMMU patch to ensure the new error
   path is immediately safe.
  - Collected Reviewed-by tags from Lu Baolu for PCI core patches.

[v5]
  - https://lore.kernel.org/all/20260528202353.3422206-1-praan@google.com/
  - Decoupled pci_ats_supported() from pci_prepare_ats() in the PCI core.
  - Rebased SMMUv3 support on top of Nicolin Chen's "Always-On ATS" series.
  - Fixed pre-existing RB-tree corruption in VT-d probe (Baolu/Sashiko).
  - Addressed the pre-existing UAF in AMD IOMMU probe suggested by Sashiko.

[v4]
  - https://lore.kernel.org/all/20260525184347.4059549-1-praan@google.com/
  - Standardized the pattern across Intel VT-d and AMD IOMMU drivers.
  - Replaced the SMMUv3 ats_prepared gate with a fatal probe-fail logic.
  - Utilized WARN() macros for runtime enablement failures in all drivers.
  - Collected R-b tags from Jason and Sami.

Pranjal Shrivastava (6):
  PCI/ATS: Ensure pci_ats_supported() is PF-aware for VFs
  PCI/ATS: Validate STU for VFs in pci_prepare_ats()
  PCI/ATS: Mandate checking pci_ats_supported() before pci_prepare_ats()
  iommu/arm-smmu-v3: Standardize ATS enablement failure reporting
  iommu/vt-d: Fail probe on ATS configuration failure
  iommu/amd: Fail probe on ATS configuration failure

 drivers/iommu/amd/iommu.c                   | 30 ++++++++++++++++-----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 10 +++++--
 drivers/iommu/intel/iommu.c                 | 15 ++++++++---
 drivers/pci/ats.c                           | 19 +++++++++----
 4 files changed, 58 insertions(+), 16 deletions(-)

-- 
2.54.0.823.g6e5bcc1fc9-goog


