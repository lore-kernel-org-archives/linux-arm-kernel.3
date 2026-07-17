Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8D4C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 07:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RzFbX1+ItCtFT+z6QOImlxQOT0iuiDDhV+oEbzU1ifA=; b=qdrGkLtFKDyccAUNOOQkJNpR7T
	gN1BzIlh6boKZuOZGkxONDnlqjqB9OQjYUl3iKeXrz8p0NecymVXewW81jNmwHtrEcWu0SKLq7Tfx
	x40oyTQSo4orMJnAn7Zu8DyagMgYdaZtmXM6UaRbK70F4UVAUIlCaINyeFGRs1zo8uUZnC3CWfoRn
	YMnwCsk3WrionBIR66gUwUKtaF6Xgfc4oY1zQni5CunA8guD0vOQ2OlhSPu9h1Csg40OWtqXcRger
	OM1Oo9zlEpmy0JY7hjeCS/8I25GlCg5qLBNDHro8qkPShER6ieiZ5NGNao3p11prQZZsLDi4WFoVY
	omfFmQ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdNG-00000001Vw1-0ilq;
	Fri, 17 Jul 2026 07:52:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdNE-00000001Vvu-2g3t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 07:52:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 89FB760A5E;
	Fri, 17 Jul 2026 07:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B1811F000E9;
	Fri, 17 Jul 2026 07:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784274763;
	bh=RzFbX1+ItCtFT+z6QOImlxQOT0iuiDDhV+oEbzU1ifA=;
	h=From:To:Cc:Subject:Date;
	b=oXbPzjecTXqPRfJH+Dfmg0Z7EdWnB2/xBJGF9FEI6HLcKKTokytUi+/rQ59auPwGR
	 25Rmyp7Tvy2L4dMEPMvgaVq4GYcAY59HKTgKsg9btjhFkAXjmbLDwvFolmxilJ4orH
	 bfSOgksoZ91FynB9FHQxr848mKyLGPOm9E108CCKDHSNPlR5NHIcwIvv5mumWO7beU
	 CzUBI/prCgVyZ0fHW/zuQ5YYBeGDEKBE9l505bb6ZAJKI1XgJpoV2s3O0hncE/9548
	 LPG6BhJHCuu+5E0Fo4Mry0XTpTAAbQKKfoUgCNn7DCfj5ebPdcdf/1J7YoTxFEnWRu
	 WX2+Df9vHdl+w==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Steven Price <steven.price@arm.com>
Subject: [RFC PATCH] firmware: arm: Group interface drivers under arm/
Date: Fri, 17 Jul 2026 08:52:24 +0100
Message-ID: <20260717075224.465618-1-sudeep.holla@kernel.org>
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

Arm firmware interface drivers currently live directly under
drivers/firmware/. Some use an arm_ prefix while others use generic
names. More Arm firmware interface drivers, such as
[1] Realm Management Monitor(RMM) Realm Management Interface (RMMI)
[2] Live Firmware Activation (LFA)
expected soon, which would further crowd the top-level directory.

There are couple of other interfaces whose usage within the kernel was
challenged in the past or is currently being explored.

Create drivers/firmware/arm/ as the common home for Arm firmware
interface drivers. Move FF-A, SCMI, PSCI and SMCCC under it, drop the
redundant arm_ prefix from the FF-A and SCMI directory names.
Update the Kconfig, Kbuild, maintainer and documentation paths.

The resulting hierarchy provides room for upcoming interfaces without
continuing to add Arm-specific directories at the firmware root.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---

Hi,

This is just to get a feedback/opinions.

Regards,
Sudeep

[1] https://lore.kernel.org/all/20260715142739.80398-1-steven.price@arm.com/
[2] https://lore.kernel.org/all/20260706134455.132091-1-andre.przywara@arm.com/

 Documentation/tee/ts-tee.rst                           |  2 +-
 MAINTAINERS                                            | 10 +++++-----
 drivers/firmware/Kconfig                               |  5 +----
 drivers/firmware/Makefile                              |  5 +----
 drivers/firmware/arm/Kconfig                           |  6 ++++++
 drivers/firmware/arm/Makefile                          |  6 ++++++
 drivers/firmware/{arm_ffa => arm/ffa}/Kconfig          |  0
 drivers/firmware/{arm_ffa => arm/ffa}/Makefile         |  0
 drivers/firmware/{arm_ffa => arm/ffa}/bus.c            |  0
 drivers/firmware/{arm_ffa => arm/ffa}/common.h         |  0
 drivers/firmware/{arm_ffa => arm/ffa}/driver.c         |  0
 drivers/firmware/{arm_ffa => arm/ffa}/smccc.c          |  0
 drivers/firmware/{ => arm}/psci/Kconfig                |  0
 drivers/firmware/{ => arm}/psci/Makefile               |  0
 drivers/firmware/{ => arm}/psci/psci.c                 |  0
 drivers/firmware/{ => arm}/psci/psci_checker.c         |  0
 drivers/firmware/{arm_scmi => arm/scmi}/Kconfig        |  4 ++--
 drivers/firmware/{arm_scmi => arm/scmi}/Makefile       |  0
 drivers/firmware/{arm_scmi => arm/scmi}/base.c         |  0
 drivers/firmware/{arm_scmi => arm/scmi}/bus.c          |  0
 drivers/firmware/{arm_scmi => arm/scmi}/clock.c        |  0
 drivers/firmware/{arm_scmi => arm/scmi}/common.h       |  0
 drivers/firmware/{arm_scmi => arm/scmi}/driver.c       |  0
 drivers/firmware/{arm_scmi => arm/scmi}/msg.c          |  0
 drivers/firmware/{arm_scmi => arm/scmi}/notify.c       |  0
 drivers/firmware/{arm_scmi => arm/scmi}/notify.h       |  0
 drivers/firmware/{arm_scmi => arm/scmi}/perf.c         |  0
 drivers/firmware/{arm_scmi => arm/scmi}/pinctrl.c      |  0
 drivers/firmware/{arm_scmi => arm/scmi}/power.c        |  0
 drivers/firmware/{arm_scmi => arm/scmi}/powercap.c     |  0
 drivers/firmware/{arm_scmi => arm/scmi}/protocols.h    |  0
 drivers/firmware/{arm_scmi => arm/scmi}/quirks.c       |  0
 drivers/firmware/{arm_scmi => arm/scmi}/quirks.h       |  0
 drivers/firmware/{arm_scmi => arm/scmi}/raw_mode.c     |  0
 drivers/firmware/{arm_scmi => arm/scmi}/raw_mode.h     |  0
 drivers/firmware/{arm_scmi => arm/scmi}/reset.c        |  0
 .../{arm_scmi => arm/scmi}/scmi_power_control.c        |  0
 drivers/firmware/{arm_scmi => arm/scmi}/sensors.c      |  0
 drivers/firmware/{arm_scmi => arm/scmi}/shmem.c        |  0
 drivers/firmware/{arm_scmi => arm/scmi}/system.c       |  0
 .../firmware/{arm_scmi => arm/scmi}/transports/Kconfig |  0
 .../{arm_scmi => arm/scmi}/transports/Makefile         |  0
 .../{arm_scmi => arm/scmi}/transports/mailbox.c        |  0
 .../firmware/{arm_scmi => arm/scmi}/transports/optee.c |  0
 .../firmware/{arm_scmi => arm/scmi}/transports/smc.c   |  0
 .../{arm_scmi => arm/scmi}/transports/virtio.c         |  0
 .../{arm_scmi => arm/scmi}/vendors/imx/Kconfig         |  0
 .../{arm_scmi => arm/scmi}/vendors/imx/Makefile        |  0
 .../{arm_scmi => arm/scmi}/vendors/imx/imx-sm-bbm.c    |  0
 .../{arm_scmi => arm/scmi}/vendors/imx/imx-sm-cpu.c    |  0
 .../{arm_scmi => arm/scmi}/vendors/imx/imx-sm-lmm.c    |  0
 .../{arm_scmi => arm/scmi}/vendors/imx/imx-sm-misc.c   |  0
 .../{arm_scmi => arm/scmi}/vendors/imx/imx95.rst       |  0
 drivers/firmware/{arm_scmi => arm/scmi}/voltage.c      |  0
 drivers/firmware/{ => arm}/smccc/Kconfig               |  0
 drivers/firmware/{ => arm}/smccc/Makefile              |  0
 drivers/firmware/{ => arm}/smccc/kvm_guest.c           |  0
 drivers/firmware/{ => arm}/smccc/smccc.c               |  0
 drivers/firmware/{ => arm}/smccc/soc_id.c              |  0
 59 files changed, 22 insertions(+), 16 deletions(-)
 create mode 100644 drivers/firmware/arm/Kconfig
 create mode 100644 drivers/firmware/arm/Makefile
 rename drivers/firmware/{arm_ffa => arm/ffa}/Kconfig (100%)
 rename drivers/firmware/{arm_ffa => arm/ffa}/Makefile (100%)
 rename drivers/firmware/{arm_ffa => arm/ffa}/bus.c (100%)
 rename drivers/firmware/{arm_ffa => arm/ffa}/common.h (100%)
 rename drivers/firmware/{arm_ffa => arm/ffa}/driver.c (100%)
 rename drivers/firmware/{arm_ffa => arm/ffa}/smccc.c (100%)
 rename drivers/firmware/{ => arm}/psci/Kconfig (100%)
 rename drivers/firmware/{ => arm}/psci/Makefile (100%)
 rename drivers/firmware/{ => arm}/psci/psci.c (100%)
 rename drivers/firmware/{ => arm}/psci/psci_checker.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/Kconfig (97%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/Makefile (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/base.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/bus.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/clock.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/common.h (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/driver.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/msg.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/notify.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/notify.h (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/perf.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/pinctrl.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/power.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/powercap.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/protocols.h (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/quirks.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/quirks.h (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/raw_mode.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/raw_mode.h (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/reset.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/scmi_power_control.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/sensors.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/shmem.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/system.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/transports/Kconfig (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/transports/Makefile (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/transports/mailbox.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/transports/optee.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/transports/smc.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/transports/virtio.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/vendors/imx/Kconfig (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/vendors/imx/Makefile (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/vendors/imx/imx-sm-bbm.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/vendors/imx/imx-sm-cpu.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/vendors/imx/imx-sm-lmm.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/vendors/imx/imx-sm-misc.c (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/vendors/imx/imx95.rst (100%)
 rename drivers/firmware/{arm_scmi => arm/scmi}/voltage.c (100%)
 rename drivers/firmware/{ => arm}/smccc/Kconfig (100%)
 rename drivers/firmware/{ => arm}/smccc/Makefile (100%)
 rename drivers/firmware/{ => arm}/smccc/kvm_guest.c (100%)
 rename drivers/firmware/{ => arm}/smccc/smccc.c (100%)
 rename drivers/firmware/{ => arm}/smccc/soc_id.c (100%)

diff --git a/Documentation/tee/ts-tee.rst b/Documentation/tee/ts-tee.rst
index 843e34422648..0999d0e0d859 100644
--- a/Documentation/tee/ts-tee.rst
+++ b/Documentation/tee/ts-tee.rst
@@ -62,7 +62,7 @@ References
 
 [3] https://www.arm.com/architecture/security-features/platform-security
 
-[4] drivers/firmware/arm_ffa/
+[4] drivers/firmware/arm/ffa/
 
 [5] https://trusted-services.readthedocs.io/en/v1.0.0/developer/service-access-protocols.html#abi
 
diff --git a/MAINTAINERS b/MAINTAINERS
index ce5c5185c773..9edcf36fa2bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10119,7 +10119,7 @@ FIRMWARE FRAMEWORK FOR ARMV8-A
 M:	Sudeep Holla <sudeep.holla@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-F:	drivers/firmware/arm_ffa/
+F:	drivers/firmware/arm/ffa/
 F:	include/linux/arm_ffa.h
 
 FIRMWARE LOADER (request_firmware)
@@ -21534,7 +21534,7 @@ M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/psci.yaml
-F:	drivers/firmware/psci/
+F:	drivers/firmware/arm/psci/
 F:	include/linux/psci.h
 F:	include/uapi/linux/psci.h
 
@@ -24465,7 +24465,7 @@ M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
 M:	Sudeep Holla <sudeep.holla@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-F:	drivers/firmware/smccc/
+F:	drivers/firmware/arm/smccc/
 F:	include/linux/arm-smccc.h
 
 SECURITY CONTACT
@@ -26294,7 +26294,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/firmware/arm,sc[mp]i.yaml
 F:	drivers/clk/clk-sc[mp]i.c
 F:	drivers/cpufreq/sc[mp]i-cpufreq.c
-F:	drivers/firmware/arm_scmi/
+F:	drivers/firmware/arm/scmi/
 F:	drivers/firmware/arm_scpi.c
 F:	drivers/hwmon/scmi-hwmon.c
 F:	drivers/pinctrl/pinctrl-scmi.c
@@ -26313,7 +26313,7 @@ L:	imx@lists.linux.dev
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/firmware/nxp,*scmi.yaml
-F:	drivers/firmware/arm_scmi/vendors/imx/
+F:	drivers/firmware/arm/scmi/vendors/imx/
 
 SYSTEM RESET/SHUTDOWN DRIVERS
 M:	Sebastian Reichel <sre@kernel.org>
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 12dc70254842..a32b0f1e6151 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -6,7 +6,7 @@
 
 menu "Firmware Drivers"
 
-source "drivers/firmware/arm_scmi/Kconfig"
+source "drivers/firmware/arm/Kconfig"
 
 config ARM_SCPI_PROTOCOL
 	tristate "ARM System Control and Power Interface (SCPI) Message Protocol"
@@ -287,7 +287,6 @@ config TURRIS_MOX_RWTM_KEYCTL
 
 endif # TURRIS_MOX_RWTM
 
-source "drivers/firmware/arm_ffa/Kconfig"
 source "drivers/firmware/broadcom/Kconfig"
 source "drivers/firmware/cirrus/Kconfig"
 source "drivers/firmware/google/Kconfig"
@@ -295,10 +294,8 @@ source "drivers/firmware/efi/Kconfig"
 source "drivers/firmware/imx/Kconfig"
 source "drivers/firmware/meson/Kconfig"
 source "drivers/firmware/microchip/Kconfig"
-source "drivers/firmware/psci/Kconfig"
 source "drivers/firmware/qcom/Kconfig"
 source "drivers/firmware/samsung/Kconfig"
-source "drivers/firmware/smccc/Kconfig"
 source "drivers/firmware/tegra/Kconfig"
 source "drivers/firmware/xilinx/Kconfig"
 
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 4ddec2820c96..306f498d1057 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -23,8 +23,7 @@ obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
 obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
 obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
 
-obj-y				+= arm_ffa/
-obj-y				+= arm_scmi/
+obj-y				+= arm/
 obj-y				+= broadcom/
 obj-y				+= cirrus/
 obj-y				+= meson/
@@ -32,9 +31,7 @@ obj-y				+= microchip/
 obj-$(CONFIG_GOOGLE_FIRMWARE)	+= google/
 obj-y				+= efi/
 obj-y				+= imx/
-obj-y				+= psci/
 obj-y				+= qcom/
 obj-y				+= samsung/
-obj-y				+= smccc/
 obj-y				+= tegra/
 obj-y				+= xilinx/
diff --git a/drivers/firmware/arm/Kconfig b/drivers/firmware/arm/Kconfig
new file mode 100644
index 000000000000..ac447e0d7a94
--- /dev/null
+++ b/drivers/firmware/arm/Kconfig
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+source "drivers/firmware/arm/scmi/Kconfig"
+source "drivers/firmware/arm/ffa/Kconfig"
+source "drivers/firmware/arm/psci/Kconfig"
+source "drivers/firmware/arm/smccc/Kconfig"
diff --git a/drivers/firmware/arm/Makefile b/drivers/firmware/arm/Makefile
new file mode 100644
index 000000000000..fffbd7a0bbff
--- /dev/null
+++ b/drivers/firmware/arm/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-y				+= scmi/
+obj-y				+= ffa/
+obj-y				+= psci/
+obj-y				+= smccc/
diff --git a/drivers/firmware/arm_ffa/Kconfig b/drivers/firmware/arm/ffa/Kconfig
similarity index 100%
rename from drivers/firmware/arm_ffa/Kconfig
rename to drivers/firmware/arm/ffa/Kconfig
diff --git a/drivers/firmware/arm_ffa/Makefile b/drivers/firmware/arm/ffa/Makefile
similarity index 100%
rename from drivers/firmware/arm_ffa/Makefile
rename to drivers/firmware/arm/ffa/Makefile
diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm/ffa/bus.c
similarity index 100%
rename from drivers/firmware/arm_ffa/bus.c
rename to drivers/firmware/arm/ffa/bus.c
diff --git a/drivers/firmware/arm_ffa/common.h b/drivers/firmware/arm/ffa/common.h
similarity index 100%
rename from drivers/firmware/arm_ffa/common.h
rename to drivers/firmware/arm/ffa/common.h
diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm/ffa/driver.c
similarity index 100%
rename from drivers/firmware/arm_ffa/driver.c
rename to drivers/firmware/arm/ffa/driver.c
diff --git a/drivers/firmware/arm_ffa/smccc.c b/drivers/firmware/arm/ffa/smccc.c
similarity index 100%
rename from drivers/firmware/arm_ffa/smccc.c
rename to drivers/firmware/arm/ffa/smccc.c
diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/arm/psci/Kconfig
similarity index 100%
rename from drivers/firmware/psci/Kconfig
rename to drivers/firmware/arm/psci/Kconfig
diff --git a/drivers/firmware/psci/Makefile b/drivers/firmware/arm/psci/Makefile
similarity index 100%
rename from drivers/firmware/psci/Makefile
rename to drivers/firmware/arm/psci/Makefile
diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/arm/psci/psci.c
similarity index 100%
rename from drivers/firmware/psci/psci.c
rename to drivers/firmware/arm/psci/psci.c
diff --git a/drivers/firmware/psci/psci_checker.c b/drivers/firmware/arm/psci/psci_checker.c
similarity index 100%
rename from drivers/firmware/psci/psci_checker.c
rename to drivers/firmware/arm/psci/psci_checker.c
diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm/scmi/Kconfig
similarity index 97%
rename from drivers/firmware/arm_scmi/Kconfig
rename to drivers/firmware/arm/scmi/Kconfig
index e3fb36825978..ddb6f434fa0d 100644
--- a/drivers/firmware/arm_scmi/Kconfig
+++ b/drivers/firmware/arm/scmi/Kconfig
@@ -82,8 +82,8 @@ config ARM_SCMI_QUIRKS
 	  depending on the SCMI firmware advertised versions and/or machine
 	  compatibles.
 
-source "drivers/firmware/arm_scmi/transports/Kconfig"
-source "drivers/firmware/arm_scmi/vendors/imx/Kconfig"
+source "drivers/firmware/arm/scmi/transports/Kconfig"
+source "drivers/firmware/arm/scmi/vendors/imx/Kconfig"
 
 endif #ARM_SCMI_PROTOCOL
 
diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/arm/scmi/Makefile
similarity index 100%
rename from drivers/firmware/arm_scmi/Makefile
rename to drivers/firmware/arm/scmi/Makefile
diff --git a/drivers/firmware/arm_scmi/base.c b/drivers/firmware/arm/scmi/base.c
similarity index 100%
rename from drivers/firmware/arm_scmi/base.c
rename to drivers/firmware/arm/scmi/base.c
diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm/scmi/bus.c
similarity index 100%
rename from drivers/firmware/arm_scmi/bus.c
rename to drivers/firmware/arm/scmi/bus.c
diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm/scmi/clock.c
similarity index 100%
rename from drivers/firmware/arm_scmi/clock.c
rename to drivers/firmware/arm/scmi/clock.c
diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm/scmi/common.h
similarity index 100%
rename from drivers/firmware/arm_scmi/common.h
rename to drivers/firmware/arm/scmi/common.h
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm/scmi/driver.c
similarity index 100%
rename from drivers/firmware/arm_scmi/driver.c
rename to drivers/firmware/arm/scmi/driver.c
diff --git a/drivers/firmware/arm_scmi/msg.c b/drivers/firmware/arm/scmi/msg.c
similarity index 100%
rename from drivers/firmware/arm_scmi/msg.c
rename to drivers/firmware/arm/scmi/msg.c
diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm/scmi/notify.c
similarity index 100%
rename from drivers/firmware/arm_scmi/notify.c
rename to drivers/firmware/arm/scmi/notify.c
diff --git a/drivers/firmware/arm_scmi/notify.h b/drivers/firmware/arm/scmi/notify.h
similarity index 100%
rename from drivers/firmware/arm_scmi/notify.h
rename to drivers/firmware/arm/scmi/notify.h
diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm/scmi/perf.c
similarity index 100%
rename from drivers/firmware/arm_scmi/perf.c
rename to drivers/firmware/arm/scmi/perf.c
diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm/scmi/pinctrl.c
similarity index 100%
rename from drivers/firmware/arm_scmi/pinctrl.c
rename to drivers/firmware/arm/scmi/pinctrl.c
diff --git a/drivers/firmware/arm_scmi/power.c b/drivers/firmware/arm/scmi/power.c
similarity index 100%
rename from drivers/firmware/arm_scmi/power.c
rename to drivers/firmware/arm/scmi/power.c
diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm/scmi/powercap.c
similarity index 100%
rename from drivers/firmware/arm_scmi/powercap.c
rename to drivers/firmware/arm/scmi/powercap.c
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm/scmi/protocols.h
similarity index 100%
rename from drivers/firmware/arm_scmi/protocols.h
rename to drivers/firmware/arm/scmi/protocols.h
diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm/scmi/quirks.c
similarity index 100%
rename from drivers/firmware/arm_scmi/quirks.c
rename to drivers/firmware/arm/scmi/quirks.c
diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm/scmi/quirks.h
similarity index 100%
rename from drivers/firmware/arm_scmi/quirks.h
rename to drivers/firmware/arm/scmi/quirks.h
diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm/scmi/raw_mode.c
similarity index 100%
rename from drivers/firmware/arm_scmi/raw_mode.c
rename to drivers/firmware/arm/scmi/raw_mode.c
diff --git a/drivers/firmware/arm_scmi/raw_mode.h b/drivers/firmware/arm/scmi/raw_mode.h
similarity index 100%
rename from drivers/firmware/arm_scmi/raw_mode.h
rename to drivers/firmware/arm/scmi/raw_mode.h
diff --git a/drivers/firmware/arm_scmi/reset.c b/drivers/firmware/arm/scmi/reset.c
similarity index 100%
rename from drivers/firmware/arm_scmi/reset.c
rename to drivers/firmware/arm/scmi/reset.c
diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/arm/scmi/scmi_power_control.c
similarity index 100%
rename from drivers/firmware/arm_scmi/scmi_power_control.c
rename to drivers/firmware/arm/scmi/scmi_power_control.c
diff --git a/drivers/firmware/arm_scmi/sensors.c b/drivers/firmware/arm/scmi/sensors.c
similarity index 100%
rename from drivers/firmware/arm_scmi/sensors.c
rename to drivers/firmware/arm/scmi/sensors.c
diff --git a/drivers/firmware/arm_scmi/shmem.c b/drivers/firmware/arm/scmi/shmem.c
similarity index 100%
rename from drivers/firmware/arm_scmi/shmem.c
rename to drivers/firmware/arm/scmi/shmem.c
diff --git a/drivers/firmware/arm_scmi/system.c b/drivers/firmware/arm/scmi/system.c
similarity index 100%
rename from drivers/firmware/arm_scmi/system.c
rename to drivers/firmware/arm/scmi/system.c
diff --git a/drivers/firmware/arm_scmi/transports/Kconfig b/drivers/firmware/arm/scmi/transports/Kconfig
similarity index 100%
rename from drivers/firmware/arm_scmi/transports/Kconfig
rename to drivers/firmware/arm/scmi/transports/Kconfig
diff --git a/drivers/firmware/arm_scmi/transports/Makefile b/drivers/firmware/arm/scmi/transports/Makefile
similarity index 100%
rename from drivers/firmware/arm_scmi/transports/Makefile
rename to drivers/firmware/arm/scmi/transports/Makefile
diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm/scmi/transports/mailbox.c
similarity index 100%
rename from drivers/firmware/arm_scmi/transports/mailbox.c
rename to drivers/firmware/arm/scmi/transports/mailbox.c
diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm/scmi/transports/optee.c
similarity index 100%
rename from drivers/firmware/arm_scmi/transports/optee.c
rename to drivers/firmware/arm/scmi/transports/optee.c
diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmware/arm/scmi/transports/smc.c
similarity index 100%
rename from drivers/firmware/arm_scmi/transports/smc.c
rename to drivers/firmware/arm/scmi/transports/smc.c
diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/arm/scmi/transports/virtio.c
similarity index 100%
rename from drivers/firmware/arm_scmi/transports/virtio.c
rename to drivers/firmware/arm/scmi/transports/virtio.c
diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firmware/arm/scmi/vendors/imx/Kconfig
similarity index 100%
rename from drivers/firmware/arm_scmi/vendors/imx/Kconfig
rename to drivers/firmware/arm/scmi/vendors/imx/Kconfig
diff --git a/drivers/firmware/arm_scmi/vendors/imx/Makefile b/drivers/firmware/arm/scmi/vendors/imx/Makefile
similarity index 100%
rename from drivers/firmware/arm_scmi/vendors/imx/Makefile
rename to drivers/firmware/arm/scmi/vendors/imx/Makefile
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c b/drivers/firmware/arm/scmi/vendors/imx/imx-sm-bbm.c
similarity index 100%
rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
rename to drivers/firmware/arm/scmi/vendors/imx/imx-sm-bbm.c
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c b/drivers/firmware/arm/scmi/vendors/imx/imx-sm-cpu.c
similarity index 100%
rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
rename to drivers/firmware/arm/scmi/vendors/imx/imx-sm-cpu.c
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c b/drivers/firmware/arm/scmi/vendors/imx/imx-sm-lmm.c
similarity index 100%
rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c
rename to drivers/firmware/arm/scmi/vendors/imx/imx-sm-lmm.c
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm/scmi/vendors/imx/imx-sm-misc.c
similarity index 100%
rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
rename to drivers/firmware/arm/scmi/vendors/imx/imx-sm-misc.c
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/arm/scmi/vendors/imx/imx95.rst
similarity index 100%
rename from drivers/firmware/arm_scmi/vendors/imx/imx95.rst
rename to drivers/firmware/arm/scmi/vendors/imx/imx95.rst
diff --git a/drivers/firmware/arm_scmi/voltage.c b/drivers/firmware/arm/scmi/voltage.c
similarity index 100%
rename from drivers/firmware/arm_scmi/voltage.c
rename to drivers/firmware/arm/scmi/voltage.c
diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/arm/smccc/Kconfig
similarity index 100%
rename from drivers/firmware/smccc/Kconfig
rename to drivers/firmware/arm/smccc/Kconfig
diff --git a/drivers/firmware/smccc/Makefile b/drivers/firmware/arm/smccc/Makefile
similarity index 100%
rename from drivers/firmware/smccc/Makefile
rename to drivers/firmware/arm/smccc/Makefile
diff --git a/drivers/firmware/smccc/kvm_guest.c b/drivers/firmware/arm/smccc/kvm_guest.c
similarity index 100%
rename from drivers/firmware/smccc/kvm_guest.c
rename to drivers/firmware/arm/smccc/kvm_guest.c
diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/arm/smccc/smccc.c
similarity index 100%
rename from drivers/firmware/smccc/smccc.c
rename to drivers/firmware/arm/smccc/smccc.c
diff --git a/drivers/firmware/smccc/soc_id.c b/drivers/firmware/arm/smccc/soc_id.c
similarity index 100%
rename from drivers/firmware/smccc/soc_id.c
rename to drivers/firmware/arm/smccc/soc_id.c
-- 
2.43.0


