Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F79FC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cvI3vzJ44Qk3YN/dWqxXs4Fw46Nwt3Wxls1A8k+GYfk=; b=Q03WA53nrfgBp5
	/tUZ/XtA18b4CgAdP2ykCspp0/daUHaTcpE87blgQaY4KwIRUy4aA0VlfoTriUNT4OUQnddPNZAzF
	hAMqcN290/sS9oczFVJAtwOtpCg4XcBbNcvBznkIHGyRP+tKOBGKDF1N2c6n42DOurCgCAIs8Etsy
	n0JVgWub6JosCZtqTtGM6QbknBYNIG7s7qVkTs0/OzXim/oI8IpdyZtO/st/FEdOgexMmeCF5ZyYH
	lGYfnp52cbZko+udmB7L+2Fk3gN2PzOEMPfkNZF8MMj3Z6nc7dcYhH+nMCaLpxJawG+PIHgvkiRr6
	mCeC4EzVibqlBUpAv+7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZJI-0000000EfhO-0XZT;
	Fri, 18 Sep 2026 14:11:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZJF-0000000Efgj-1f6J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:11:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDFCC168F;
	Fri, 18 Sep 2026 07:11:19 -0700 (PDT)
Received: from e142021.Arm.com (e142021.arm.com [10.41.4.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A339F3F86C;
	Fri, 18 Sep 2026 07:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789740683; bh=bp1z+vz3VmKgao6wlLkYdY2Zzf+QotQgARREv2KrroY=;
	h=From:To:Cc:Subject:Date:From;
	b=M/FMCv+ad5EnMCWKM9eRLkLsW6yhKF4l7m6YfXnkvMBY9474dC8QuDTBlt5R/GMiE
	 lmZDL5qAci57yvX1lW3f8BoclZnhj8ONpe9Ee4QwoFJrKveJ05MhuHV9ZPHF+QOqQ8
	 Vj0OGOTM9UyMJ30qA6PM57HMosXRmqUxP92JQ8DU=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v4 0/8] Arm Live Firmware Activation (LFA) support
Date: Fri, 18 Sep 2026 16:11:03 +0200
Message-ID: <20260918141112.2115555-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_071125_576247_920987D9 
X-CRM114-Status: GOOD (  25.14  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi all,

it's been a while, but here is version 4 of the Live Firmware Activation
kernel support. Some smaller fixes, for issues pointed out by the diligent
reviewers (thanks for that!), see the changelog below.
Based on v7.3-rc1, plus the first two patches from Aneesh's SMCCC bus [1]
series.
==============================

This series implements the kernel side support of the Arm Live
Firmware Activation (LFA) specification [2]. LFA enables the activation
of updated firmware components without requiring a system reboot,
reducing downtime and allowing quicker deployment of critical bug fixes
in environments such as data centers and hyperscale systems.
It requires explicit firmware support, both via an agent running in EL3
(for instance in TF-A, already merged), but also in the firmware
component to be activated. TF-RMM recently merged support for this.

Unlike the usual firmware update process (which may use tools like
fwupd), LFA focuses solely on the activation of an already updated
firmware component, called "pending activation" in LFA lingo. This works
by signalling the LFA agent (part of the EL3 runtime firmware) via an
SMC call, which then does the heavy lifting of the live update, in
cooperation with the to-be-updated firmware component.

Key features of the driver:
* Detects LFA support in system firmware (EL3).
* Lists all firmware components that support live activation, identified
  by their GUID.
* Exposes component attributes (e.g., activation capability, and
  activation pending) via sysfs under /sys/firmware/lfa/<GUID>/.
* Provides interfaces to:
  - Trigger activation of an updated firmware component.
  - Cancel an ongoing activation if required.
A more detailed list of features can be found in patch 2/8.
Based on v7.3-rc1.

This work is conceptually similar to Intel’s Platform Firmware Runtime
Update and telemetry (PFRUT) [3] and TDX module updates [4], but
targets Arm platforms. The driver has been used to successfully activate
a Realm Management Monitor (RMM) firmware image in a controlled test
environment. RMM is analogous to Intel’s TDX module.

There is effort on similar work from the OCP [5]. Future work may
include integration with utilities like fwupd to automatically select
the appropriate driver, based on platform architecture, for Live/Runtime
firmware updates.

Please have a look, test and comment!

Best regards,
Salman and Andre

Changes in v4:
- streamline threaded IRQ handler (drop empty hard IRQ part)
- add lfa_to_linux_error() conversion function
- use Linux errno codes in more functions
- drop bogus LFA error numbers for -EAGAIN and -EBUSY
- clarify interrupt purpose and edge trigger requirement in binding
- honour signal related return from msleep_interruptible()
- call clean_fw_images_tree() first in driver teardown
- streamline ACPI and DT registration
- cache rendezvous status to avoid race during activation
- only trigger activation when writing 1/Y/true to sysfs file
- adapt to new version of Aneesh's SMCCC bus patches ([1])

Changes in v3:
- change node name in DT binding example
- move SMCCC function identifiers into generic SMCCC header
- rework to use the new SMCCC bus instead of a using a faux device
- add missing workqueue cleanup in probe() routine
- squash former patch v2 3/8 into base patch
- use get_image_name() more consistently
- also consider -LFA_BUSY return in activate call

Changes in v2:
- restrict build to arm64 (the LFA spec only supports AArch64)
- rename and extend central data structure to fw_image
- use separate GPR register sets for some SMC calls
- provide wrapper for error messages to prevent out-of-bound access
- return GUID in the "name" sysfs file when image is unknown
- fix wrong attribute in pending version number show function
- add missing include files and order them properly
- fix memory leaks in error cleanup paths
- handle lifetime using embedded kobjects and a kset
- drop global lfa_lock, use kset list lock and kobject refcount instead
- add DT binding documentation
- add timeout and watchdog re-arming (contributed by Veda)
- relax timeout period and do not block while waiting
- register ACPI notification (contributed by Veda) and DT interrupt 
- refactor ACPI notification code to allow sharing with DT code
- use faux device instead of platform driver
- add auto_activate file to control automatic activation
- introduce rwsem mutex to prevent using stale sequence ID
- use labels and goto instead of infinite loop when retrying activation
- initialise workqueue only once (thanks to Nirmoy)
- various cleanups on reported messages and code formatting
- rebase on top of v7.0-rc1

Changes in v1:
- Updated SMCCC version 1.1 to 1.2 per the LFA specification requirement.
- Changed "image_props" array to a linked list to support the dynamic
  removal and addition of firmware images.
- Added code to refresh firmware images following a successful activation.
- Added a work_queue to handle the removal of firmware image attribute
  from it's respective kobject "_store" handle.
- Refactored prime and activate into separate functions.
- Kernel config for LFA now defaults to "y" i.e. included by default.
- Added individual kernel attribute files removal when removing the
  respective kobjects using kobject_put().
- mutex_lock added to activate_fw_image() and prime_fw_image() calls.
- Renamed create_fw_inventory to update_fw_image_node.
- Renamed create_fw_images_tree to update_fw_images_tree.
- Added two more attributes due to specs update from bet0 to bet1:
  current_version: For retrieval of the current firmware's version info.
  pending_version: For retrieval of the pending firmware's version info.
- Minor changes such as, improved firmware image names, and code comments.
- do...while loops refactored to for(;;) loops.

[1] https://lore.kernel.org/linux-arm-kernel/20260611130429.295516-1-aneesh.kumar@kernel.org/
[2] https://developer.arm.com/documentation/den0147/latest/
[3] https://lore.kernel.org/all/cover.1631025237.git.yu.c.chen@intel.com/
[4] https://lore.kernel.org/all/20250523095322.88774-1-chao.gao@intel.com/
[5] https://www.opencompute.org/documents/hyperscale-cpu-impactless-firmware-updates-requirements-specification-v0-7-9-29-2025-pdf

Andre Przywara (5):
  dt-bindings: arm: Add Live Firmware Activation
  firmware: smccc: lfa: Add auto_activate sysfs file
  firmware: smccc: lfa: Register DT interrupt
  firmware: smccc: lfa: introduce SMC access lock
  firmware: smccc: lfa: add sysfs ABI documentation

Salman Nabi (1):
  firmware: smccc: Add support for Live Firmware Activation (LFA)

Vedashree Vidwans (2):
  firmware: smccc: lfa: Add timeout and trigger watchdog
  firmware: smccc: lfa: Register ACPI notification

 Documentation/ABI/testing/sysfs-firmware-lfa  |  106 ++
 .../devicetree/bindings/arm/arm,lfa.yaml      |   50 +
 drivers/firmware/smccc/Kconfig                |   10 +
 drivers/firmware/smccc/Makefile               |    1 +
 drivers/firmware/smccc/lfa_fw.c               | 1020 +++++++++++++++++
 drivers/firmware/smccc/smccc.c                |    5 +
 include/linux/arm-smccc.h                     |   15 +
 7 files changed, 1207 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-lfa
 create mode 100644 Documentation/devicetree/bindings/arm/arm,lfa.yaml
 create mode 100644 drivers/firmware/smccc/lfa_fw.c


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
prerequisite-patch-id: e031e692ad990269e320835c1a20aac702e41eac
prerequisite-patch-id: c3a89be48014e9d96550755d8a325746c40ddc55
-- 
2.43.0


