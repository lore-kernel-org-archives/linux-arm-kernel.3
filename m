Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EB3C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jQdUjWIHK+A1yjvk1aL2MsPIRhofTuFYBLfM+UnkHho=; b=S0St7fyGtY11urDi4RiQDY6Mqe
	1KctS0OV0PJTnVrtx5Y5eVLogoT5rQmnlut3qWg2yBJIzkBVSNpriJI7ho53VWXwFHDaXoewvjyc3
	fg89cNzmqHugDevR7kg3v6KjUyIdlPhaMFf3/l89pwqM9RQCjaD7V/pTYu0faUytpn4JoMrpXuzUA
	ZRriWjkY5vNp99ABFe4BdaMrXzqFtvDe/PHAvc3Tea1UMJHHKWuA3rZJBM85qvpo5H3zVzJFwwlrZ
	1kuyQDrEaiMubSkG1/+VQ0Qbj3GBiptnx6WgXlpAx3vuOYqptMOBeEqQSLxrb2RWm/mf75E2a3mja
	MsVZc2hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fOy-0000000EYTt-32HH;
	Thu, 10 Sep 2026 14:05:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fOy-0000000EYTn-0IeH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 14:05:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7253E411E4;
	Thu, 10 Sep 2026 14:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5771F000FF;
	Thu, 10 Sep 2026 14:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049119;
	bh=jQdUjWIHK+A1yjvk1aL2MsPIRhofTuFYBLfM+UnkHho=;
	h=From:To:Cc:Subject:Date;
	b=TDfF6pb2+sJVIQr5mEovOo6DcmyF/sUL8zSsTk01dzrXxtZrBRnrM/8r+MDw/+L3H
	 53Ez4zxuTcsZUdK6i6rq0Ih4CfwCB2DiflFBSilsOm2w1MqO9GeWJDQI2hWzxM6bWe
	 MEodZ39FQlqr0O7BEkDaxkOga3bgI4eB+IMpIBuYPBIJZP2+macukfHvcTbr8IlMTf
	 5d6WrMxvs9vuv7p0tlZn5WLbQ1coUc0nSd4lT4inSdI247sc5Czf9lK/07Yb5d5X0T
	 /o3AwcaNLGkU2HMD0NtflRyfm4KkCJORncMiF4GksS8yv3biLXekuk9ObVhbGNsfYc
	 2M5qKnRV/OoTQ==
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
Subject: [PATCH v5 00/15] coco/TSM: Host-side Arm CCA IDE setup via connect/disconnect callbacks
Date: Thu, 10 Sep 2026 19:34:53 +0530
Message-ID: <20260910140509.868402-1-aneesh.kumar@kernel.org>
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
required for the Arm CCA IDE setup as per the RMM 2.0bet3 specification [1].

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

Testing / Usage

To initiate the IDE setup:
	echo tsm0 > /sys/bus/pci/devices/$DEVICE/tsm/connect

To disconnect:
	echo tsm0 > /sys/bus/pci/devices/$DEVICE/tsm/disconnect

The series is based on:
  - https://lore.kernel.org/all/20260904095000.1184861-1-aneesh.kumar@kernel.org
  - https://lore.kernel.org/all/20260907095942.1140734-1-suzuki.poulose@arm.com

Changes from v4:
https://lore.kernel.org/all/20260427065121.916615-1-aneesh.kumar@kernel.org
* Update rmi_set_pub_key() based on the latest specification.
* Rename structure members to match the specification.
* Rebase on top of the latest dependent series.

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

[1] https://developer.arm.com/documentation/den0137/2-0bet3/
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

Aneesh Kumar K.V (Arm) (12):
  coco: host: arm64: Prepare host TSM plumbing for IDE streams
  coco: host: arm64: Create RMM pdev objects for PCI endpoints
  coco: host: arm64: Add RMM pdev communication plumbing
  coco: host: arm64: Add RMM pdev stop and destroy helper
  coco: host: arm64: Register device public key with RMM
  coco: host: arm64: Initialize RMM pdev state for TDISP IDE connect
  coco: host: arm64: Coordinate peer stream waits during pdev
    communication
  coco: host: arm64: Connect RMM pdev streams for IDE devices
  coco: host: arm64: Refcount root-port pdevs used by IDE streams
  PCI/TSM: Move CMA DOE mailbox discovery out of
    pci_tsm_pf0_constructor()
  coco: host: arm64: Add NCOH_SYS stream support for RC endpoints
  coco: host: arm64: Enable PCI TSM connect callbacks

Lukas Wunner (3):
  X.509: Make certificate parser public
  X.509: Parse Subject Alternative Name in certificates
  X.509: Move certificate length retrieval into new helper

 crypto/asymmetric_keys/x509_cert_parser.c |   9 +
 crypto/asymmetric_keys/x509_loader.c      |  38 +-
 crypto/asymmetric_keys/x509_parser.h      |  42 +-
 drivers/crypto/ccp/sev-dev-tsm.c          |  13 +
 drivers/firmware/arm_rmm/rmi.c            |   4 +-
 drivers/firmware/smccc/smccc.c            |   6 +
 drivers/pci/tsm.c                         |  13 +-
 drivers/virt/coco/Kconfig                 |   2 +
 drivers/virt/coco/Makefile                |   1 +
 drivers/virt/coco/arm-cca-host/Kconfig    |  26 +
 drivers/virt/coco/arm-cca-host/Makefile   |   5 +
 drivers/virt/coco/arm-cca-host/main.c     | 461 ++++++++++++
 drivers/virt/coco/arm-cca-host/rmi-da.c   | 859 ++++++++++++++++++++++
 drivers/virt/coco/arm-cca-host/rmi-da.h   | 217 ++++++
 include/keys/asymmetric-type.h            |   2 +
 include/keys/x509-parser.h                |  57 ++
 include/linux/arm-rmi-cmds.h              |  85 +++
 include/linux/arm-smccc-rmi.h             | 161 ++++
 18 files changed, 1940 insertions(+), 61 deletions(-)
 create mode 100644 drivers/virt/coco/arm-cca-host/Kconfig
 create mode 100644 drivers/virt/coco/arm-cca-host/Makefile
 create mode 100644 drivers/virt/coco/arm-cca-host/main.c
 create mode 100644 drivers/virt/coco/arm-cca-host/rmi-da.c
 create mode 100644 drivers/virt/coco/arm-cca-host/rmi-da.h
 create mode 100644 include/keys/x509-parser.h

-- 
2.43.0


