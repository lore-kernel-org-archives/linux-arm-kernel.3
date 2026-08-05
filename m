Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573E3C561E6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 06:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/tnc8Gm3ApRGsxNnIuAMb3iJjZg7VTWN5WeJ2QjX9nM=; b=GbYL2ABY2mVRrW616Pui8pTjSw
	75Gb63kd74XFb4nvqiw17VcVLKv/ylBDqBcDcn4ygDIaRRbgTImejWwaRt84BkGGO+W/taizpnzdn
	z3RWs8OsvLaxADjkeG7OigsH3wB4M++B1PWNsNNqm9qrqm87IUJWGjd614/83Ze0OxD2nP3mNAylO
	b8OXNdljtQV7lwTObV1zWgiOXzAInQrUlNgDMz3g3L9PjqFeVQShugcoy0NAdiOo6ODp2iN2kPYJP
	ihG8aVOfw18mvaMX7q+plugY4XWusXlzDBGaXKplcWzTdRpfof9we3JvDF52teW3Kx9VqhC3nEVsS
	HH0Xqjjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVBp-00000003Iz9-1JpH;
	Wed, 05 Aug 2026 06:33:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVBn-00000003Iyo-1bCg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 06:33:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 21AAE407A6;
	Wed,  5 Aug 2026 06:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35CF41F000E9;
	Wed,  5 Aug 2026 06:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785911598;
	bh=/tnc8Gm3ApRGsxNnIuAMb3iJjZg7VTWN5WeJ2QjX9nM=;
	h=From:To:Cc:Subject:Date;
	b=jbQ20T9aYUZriNWwUfrkHOki30R74EsSjAKbIBSGERAB2lFjdidyNgnrgrK9dJO4a
	 TduAnbaCA3sGqbk1LDEB0lvTguSRpGB1aU7Hl6Sl2KhJZcX0JXA2hlb6tYEliytrdE
	 d1WHgUhbHfahc7+iiAq9Wvns8OLPiIFfg1qQVTDrKnnrAFytnXSlfNu1i9DI2NaYoC
	 KbEUHdDDk52DC3afgEcjYTOjXoAOWgvUO30XGnrzHadTyVVSzRehjIcAW4xOQdN9kR
	 2Z0UZVxvx4t5YnMndnSMxiVqe1xBNMyuJH3WwzGEOv/l50Xu3D5hQWgw53pG4syRr2
	 m5lphkv7KG2Ug==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v9 0/7] Switch Arm SMCCC firmware services to an SMCCC bus
Date: Wed,  5 Aug 2026 12:02:48 +0530
Message-ID: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

As discussed here:
https://lore.kernel.org/all/20250728135216.48084-12-aneesh.kumar@kernel.org

The earlier CCA guest support used an arm-cca-dev platform device as a pure
software anchor for the TSM class device. That platform device did not
correspond to a DT/ACPI described device, MMIO range, interrupt, or other
platform resource; it existed only to make the CCA guest driver bind and to
place the resulting TSM device in the driver model. The same pattern also
exists for smccc_trng. Creating separate platform devices for such
SMCCC-discovered features is misleading, because those features are not
independent platform devices.

This series adds an Arm SMCCC bus for services discovered through the SMCCC
firmware interface. The bus provides SMCCC device and driver registration
helpers, name-based matching, uevent modalias generation, and a sysfs modalias
attribute. SMCCC service drivers can use MODULE_DEVICE_TABLE(arm_smccc, ...)
to emit arm_smccc:<name> aliases, allowing userspace to autoload service
drivers when the SMCCC core registers matching firmware-service devices.

The series then moves SMCCC TRNG and the Arm CCA guest RSI service off the
platform bus. When the SMCCC core discovers the corresponding firmware
service, it registers an arm-smccc device for that service. The hwrng
arm_smccc_trng driver and the Arm CCA guest TSM provider are converted to
SMCCC drivers that bind to those discovered devices.

The old arm-cca-dev platform device has also been used by userspace as a Realm
guest indicator. Removing it without a replacement would leave userspace
depending on an internal driver-binding device. This series therefore adds
/sys/firmware/cca/realm_guest as a stable, architecture-provided ABI for
detecting whether the kernel is running as an Arm CCA Realm guest, and then
removes the dummy arm-cca-dev platform-device registration.

Changes from v8:
https://lore.kernel.org/all/20260707081351.1680209-1-aneesh.kumar@kernel.org
* Rebase onto the arm64 for-next/core branch.
* Move the RSI code from arch/arm64 to drivers/firmware/arm_rmm in patch 3.
* Add a new patch to move the Realm memory-encryption operations to the RSI code.
* Drop the Reviewed-by tag from patch 3.

Changes from v7:
https://lore.kernel.org/all/20260611130429.295516-1-aneesh.kumar@kernel.org
* Rebase to latest kernel
* Add id_table check in arm_smccc_driver_register
* Add smccc device name check in arm_smccc_device_register
* Drop driver_data from struct arm_smccc_device_id

Changes from v6:
https://lore.kernel.org/all/20260527100233.428018-1-aneesh.kumar@kernel.org
* Move SMCCC bus-related code to bus.c.
* Remove CONFIG_ARM64 #ifdefs and switch device creation to use the generic function-ID support framework.
* Move version-specific checks and other conditionals to the device driver probe routines.
* Move RSI definitions to include/linux/arm-smccc-rsi.h.
* Split the file and variable renames into a separate patch.

Changes from v5:
https://lore.kernel.org/all/20260514094030.42495-1-aneesh.kumar@kernel.org
* Replace the arm-smccc platform-device plus auxiliary-child model with a
  dedicated Arm SMCCC bus.
* Add SMCCC module alias support so SMCCC service drivers can use
  MODULE_DEVICE_TABLE(arm_smccc, ...) and autoload through arm_smccc:<name>
  aliases.
* Convert smccc_trng from a platform driver to an SMCCC driver.
* Convert the Arm CCA guest TSM provider from the arm-cca-dev platform device
  to an SMCCC driver bound to the discovered RSI service.
* Add /sys/firmware/cca/realm_guest before removing the old arm-cca-dev dummy
  platform device.

Changes from v4:
https://lore.kernel.org/all/20260427061615.905018-1-aneesh.kumar@kernel.org
* Add /sys/firmware/cca/realm_guest for detecting realm guest
* Convert smccc_trng to auxiliary device from platform device

Changes from v3:
https://lore.kernel.org/all/20260309100507.2303361-1-aneesh.kumar@kernel.org
* Rebased onto the latest kernel
* Drop pr_fmt() from drivers/firmware/smccc/rmm.c

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Greg KH <gregkh@linuxfoundation.org>
Cc: Jeremy Linton <jeremy.linton@arm.com>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Steven Price <steven.price@arm.com>
Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Cc: Andre Przywara <andre.przywara@arm.com>

Aneesh Kumar K.V (Arm) (7):
  firmware: smccc: Add an Arm SMCCC bus
  firmware: hwrng: arm_smccc_trng: Register as an SMCCC device
  firmware: arm_rmm: Move RSI support out of arch/arm64
  arm64: realm: Move Realm memory encryption ops to RSI code
  virt: coco: arm-cca-guest: Rename TSM report source file
  firmware: smccc: arm-cca-guest: Bind the TSM provider to an SMCCC
    device
  coco: guest: arm64: Replace dummy CCA device with sysfs ABI

 Documentation/ABI/testing/sysfs-firmware-cca  |  10 ++
 arch/arm/include/asm/archrandom.h             |   2 +-
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/include/asm/archrandom.h           |   2 +-
 arch/arm64/include/asm/io.h                   |   2 +-
 arch/arm64/include/asm/mem_encrypt.h          |   5 +-
 arch/arm64/include/asm/pgtable-prot.h         |   2 +-
 arch/arm64/include/asm/rsi.h                  |  70 --------
 arch/arm64/kernel/Makefile                    |   2 +-
 arch/arm64/kernel/setup.c                     |   2 +-
 arch/arm64/mm/init.c                          |   3 +-
 arch/arm64/mm/pageattr.c                      |  38 +---
 drivers/char/hw_random/arm_smccc_trng.c       |  32 ++--
 drivers/firmware/Kconfig                      |   1 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/arm_rmm/Kconfig              |  18 ++
 drivers/firmware/arm_rmm/Makefile             |   2 +
 .../kernel => drivers/firmware/arm_rmm}/rsi.c |  75 ++++++--
 drivers/firmware/smccc/Makefile               |   2 +-
 drivers/firmware/smccc/bus.c                  | 166 ++++++++++++++++++
 drivers/firmware/smccc/smccc.c                |  65 ++++++-
 drivers/virt/coco/arm-cca-guest/Kconfig       |   3 +-
 drivers/virt/coco/arm-cca-guest/Makefile      |   2 +
 .../{arm-cca-guest.c => arm-cca.c}            |  65 ++++---
 .../linux/arm-rsi-cmds.h                      |  76 +++++++-
 include/linux/arm-smccc-bus.h                 |  49 ++++++
 .../linux/arm-smccc-rsi.h                     |   8 +-
 include/linux/device-id/arm_smccc.h           |  16 ++
 include/linux/mod_devicetable.h               |   1 +
 scripts/mod/devicetable-offsets.c             |   3 +
 scripts/mod/file2alias.c                      |   8 +
 31 files changed, 541 insertions(+), 191 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-cca
 delete mode 100644 arch/arm64/include/asm/rsi.h
 create mode 100644 drivers/firmware/arm_rmm/Kconfig
 create mode 100644 drivers/firmware/arm_rmm/Makefile
 rename {arch/arm64/kernel => drivers/firmware/arm_rmm}/rsi.c (71%)
 create mode 100644 drivers/firmware/smccc/bus.c
 rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => arm-cca.c} (82%)
 rename arch/arm64/include/asm/rsi_cmds.h => include/linux/arm-rsi-cmds.h (69%)
 create mode 100644 include/linux/arm-smccc-bus.h
 rename arch/arm64/include/asm/rsi_smc.h => include/linux/arm-smccc-rsi.h (97%)
 create mode 100644 include/linux/device-id/arm_smccc.h


base-commit: df386fe6be46dce460d9366066a277ec8b45a01c
-- 
2.43.0


