Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C84FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 06:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vDRequ8ALHrEQMfQprY3C5QVohIWgrioPFVGksALtEg=; b=xJSbmfE2td9pw6GlxXN+yTDWM+
	vnoRo0Nludxm6Koui1ijFg1REvvD7wpUHjVLJ8ej+mgy2H1F+YqLH5YpuFjElsbTPIGyRSLJsqQmr
	ONZ+NZT+OsAyMuiMs8TL5lxvKiBN9SnzE0TJLXvzRk/j4ydPNy7ae7YwbUtUPEB8lpfcw+boKsXm9
	EAFdRU1HZVzL+KqlGqN73ci6KlU1p8oCzKN5wabDt9BXandsFYowQhCH6Ohf5PqjF3hBVxeL8Z76F
	itZWy/+s74qAD0UaIc2ZF9QYEcgKkIimSlSpRO62GnaSribkEGIz0zSEr0+zPn1zToCqTYVcRgUEi
	/BiFUSyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFog-0000000GI1U-0hPV;
	Mon, 27 Apr 2026 06:51:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFoe-0000000GI1I-3jBg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 06:51:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1170D6013B;
	Mon, 27 Apr 2026 06:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12AB9C19425;
	Mon, 27 Apr 2026 06:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777272695;
	bh=bb4dSxEySj7F9uptxxVLgD3LuKCjr4YmrwVJJpUgp28=;
	h=From:To:Cc:Subject:Date:From;
	b=HuNdWWxKdgCXfa7VBNo64CsYneky+epkS6CPf5YAGXzL5xG3yglJ95naEOZE1C4j5
	 sD3XPL6YPopX/b412eO3ucp7HqdS7TEbBPqpyWG6Hh8ldkYTmwXMGDxadq2UuVumCh
	 tPSPK8QOKA3XreNBpNuzPKpOE1484Pf/QZBFSEUHt8T2uVABeQYiAOPde6co2/vtaK
	 sYgEA67KTeaq690rOpOUQiPIJVBtQcCcbMnh9RW1VFgRcjk49vOb0EqBqxdfzPobqL
	 o33WOWOKGldRM6pIs8pgS+A/ACjD76KS1Wt8pPnr0Uj6ZJNVahGhH29AOqjW2RgAy5
	 pTxzCqU2RiaEg==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [RFC PATCH v4 00/14] coco/TSM: Host-side Arm CCA IDE setup via connect/disconnect callbacks
Date: Mon, 27 Apr 2026 12:21:07 +0530
Message-ID: <20260427065121.916615-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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


This patch series implements the TSM ->connect() and ->disconnect() callbacks
required for the Arm CCA IDE setup as per the RMM 2.0bet1 specification [1].

This patchset includes the host-side flow needed by connect/disconnect,
including:
- DA feature detection helpers
- host TSM callback wiring and IDE stream allocation support
- creation/registration of RMM pdev descriptors
- RMM pdev communication helpers
- pdev stop and teardown helpers for disconnect
- pdev instantiation from the connect path
- public key registration with RMM

To support public-key handling from the device certificate chain, the series
also includes the required X.509 parser updates.

The series builds upon the TSM framework patches posted at [2] and depends on
the KVM CCA patchset [3]. A git repository containing all the related changes is
available at [4].

Testing / Usage

To initiate the IDE setup:
	echo tsm0 > /sys/bus/pci/devices/$DEVICE/tsm/connect

To disconnect:
	echo tsm0 > /sys/bus/pci/devices/$DEVICE/tsm/disconnect

Changes from v3:
https://lore.kernel.org/all/20260312080129.3483585-1-aneesh.kumar@kernel.org
* updated the patches to follow the RMM 2.0bet1 specification
* reworked the host-side pdev lifecycle to better match the RMM 2.0bet1 flow,
  including common pdev state, root-port pdev support, and non-coherent stream
  setup and teardown
* split PF0 setup into identity collection and conditional public-key
  installation, and gate DA enablement on RMI_FEATURE_REGISTER_2_DA
* added coordinated handling for RMI_DEV_COMM_EXIT_STREAM_WAIT, along with
  stream connect/disconnect and stream key refresh/purge support during vdev
  teardown

Changes from v2:
rfc-v2 https://lore.kernel.org/all/20251027095602.1154418-1-aneesh.kumar@kernel.org
* rebase to latest kernel and core TSM changes
* Address review feedback.

v1:
rfc-v1 https://lore.kernel.org/all/20250728135216.48084-1-aneesh.kumar@kernel.org

[1] https://developer.arm.com/documentation/den0137/2-0bet1/
[2] https://lore.kernel.org/all/20260303000207.1836586-1-dan.j.williams@intel.com
[3] https://lore.kernel.org/all/20260318155413.793430-1-steven.price@arm.com
[4] https://gitlab.arm.com/linux-arm/linux-cca.git cca/topics/cca-tdisp-upstream-rfc-v4

Cc: Alexey Kardashevskiy <aik@amd.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Samuel Ortiz <sameo@rivosinc.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Xu Yilun <yilun.xu@linux.intel.com>

Aneesh Kumar K.V (Arm) (11):
  coco: host: arm64: Add host TSM callback and IDE stream allocation
    support
  coco: host: arm64: Create RMM pdev objects for PCI endpoints
  coco: host: arm64: Add RMM device communication helpers
  coco: host: arm64: Add helper to stop and tear down an RMM pdev
  coco: host: arm64: Register device public key with RMM
  coco: host: arm64: Initialize RMM pdev state for TDISP IDE connect
  coco: host: arm64: Coordinate peer stream waits during pdev
    communication
  coco: host: arm64: Connect RMM pdev streams for IDE devices
  coco: host: arm64: Refcount root-port pdevs used by IDE streams
  PCI/TSM: Move CMA DOE mailbox discovery out of
    pci_tsm_pf0_constructor()
  coco: host: arm64: Add NCOH_SYS stream support for RC endpoints

Lukas Wunner (3):
  X.509: Make certificate parser public
  X.509: Parse Subject Alternative Name in certificates
  X.509: Move certificate length retrieval into new helper

 arch/arm64/include/asm/rmi_cmds.h         |  85 +++
 arch/arm64/include/asm/rmi_smc.h          | 168 +++++
 crypto/asymmetric_keys/x509_cert_parser.c |   9 +
 crypto/asymmetric_keys/x509_loader.c      |  38 +-
 crypto/asymmetric_keys/x509_parser.h      |  42 +-
 drivers/crypto/ccp/sev-dev-tsm.c          |  13 +
 drivers/firmware/smccc/rmm.c              |  12 +
 drivers/firmware/smccc/rmm.h              |   8 +
 drivers/firmware/smccc/smccc.c            |   1 +
 drivers/pci/tsm/core.c                    |  14 +-
 drivers/virt/coco/Kconfig                 |   2 +
 drivers/virt/coco/Makefile                |   1 +
 drivers/virt/coco/arm-cca-host/Kconfig    |  23 +
 drivers/virt/coco/arm-cca-host/Makefile   |   5 +
 drivers/virt/coco/arm-cca-host/arm-cca.c  | 494 ++++++++++++
 drivers/virt/coco/arm-cca-host/rmi-da.c   | 867 ++++++++++++++++++++++
 drivers/virt/coco/arm-cca-host/rmi-da.h   | 217 ++++++
 drivers/virt/coco/tdx-host/tdx-host.c     |  13 +
 include/keys/asymmetric-type.h            |   2 +
 include/keys/x509-parser.h                |  57 ++
 20 files changed, 2012 insertions(+), 59 deletions(-)
 create mode 100644 drivers/virt/coco/arm-cca-host/Kconfig
 create mode 100644 drivers/virt/coco/arm-cca-host/Makefile
 create mode 100644 drivers/virt/coco/arm-cca-host/arm-cca.c
 create mode 100644 drivers/virt/coco/arm-cca-host/rmi-da.c
 create mode 100644 drivers/virt/coco/arm-cca-host/rmi-da.h
 create mode 100644 include/keys/x509-parser.h

-- 
2.43.0


