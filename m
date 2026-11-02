Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947B160913DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 16:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SxX5IpaL;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=piSNq0vZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Lrw1YMJLa1HqVcMgBsSlg2wwjHG9xBNY9KDQe5GB4SM=; b=SxX5IpaL8McP9cOf0AoQD2OCDo
	SaNVHN1d+vgXtYJsoqV78TEEEa5zuAUrXYVXaG6S9VW7RbV+uCrPFSFVBoK1xGXguTrrkVrQBNZxP
	DpYsxkd+lN1TWj+06VHqzNLgKsiNY7geK6YnNtaRRGggQWEYTaVCpT3OEnWyE1wCuHRWcpwh7n0Wu
	51qNCoq9YbxCWbE7Hi2X96UvVsf8n5bS6h61SLQRi7m0yAMerG/LMQIc/mAZV6dJibGABiLj7q+jz
	0594dDtXYwS1OuP3NvAAh6ofTtGLGDoTNnb9vVptBGksGG9MaCqZOwzASBR9cqgLPx2Dqsi2622si
	KU5U1l8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvIo-0000000HLeJ-18FM;
	Mon, 02 Nov 2026 16:54:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvIk-0000000HLdQ-2jtz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 16:54:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5973616F3;
	Mon,  2 Nov 2026 08:54:26 -0800 (PST)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D9203F59E;
	Mon,  2 Nov 2026 08:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793638469; bh=iER8TEU9134eS/3KSnDtE5ulkeIaMXIANcj9nxSO7dI=;
	h=From:To:Cc:Subject:Date:From;
	b=piSNq0vZSsaMdMW0ZmEypSrdLXNRtQw5yGqlyhcjQytX69wLUZmoCuEAYFoCj2F4Q
	 RQtviRx9hrpAF8EWE234km8hoU10TtRGKrj6fB7cl/MmAciJjAJ4OtfChF71CdlmJ+
	 LCwD6Z8KQ2EeI/U8e9kokII3CRwFx+iEABgtYN9I=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v5 RESEND 0/6] Arm Live Firmware Activation (LFA) support
Date: Mon,  2 Nov 2026 17:54:14 +0100
Message-ID: <20261102165421.3651202-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_085430_775469_C2D6D800 
X-CRM114-Status: GOOD (  33.93  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi all,

-------------------------
a resend of the v5 series posted two weeks ago, where our mailserver
swallowed one email. Just used the opportunity to rebase on v7.4-rc1,
so dropping the two extra patches I prepended to the post back then
(already merged). No changes to the patches themselves compared to the
other v5 post.
-------------------------

v5 is a decent overhaul of the series for the "Live Firmware Activation"
kernel support, based on feedback from Mark and Sudeep. Two patches have
been squashed into the main feature patch, the name attribute has been
removed, and documentation (hopefully) improved. Other than that quite
some smaller changes, renames and reworks, hopefully for the better.

For a high level overview of LFA see the rest of this commit message and
the commit message of the main feature patch (2/6). Some simplified
overview of the spec is in the top comment in patch 2/6. Also the sysfs
ABI documentation in the last patch contains some more information.

Based on v7.4-rc1. Changelog below.
====================================

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
  by their UUID.
* Exposes component attributes (e.g., activation capability, and
  activation pending) via sysfs under /sys/firmware/lfa/<UUID>/.
* Provides interfaces to:
  - Trigger activation of an updated firmware component.
  - Cancel an ongoing activation if required.
A more detailed list of features can be found in patch 2/6.
Based on v7.4-rc1.

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

Changes in v5:
- merge the timeout and the lock patch into original feature patch
- drop "name" attribute altogether
- rename firmware "image" to "component" everywhere
- add explanation of LFA concepts in top comment
- use switch/case for error strings and error mapping
- define error codes with negative numbers
- rename SMCCC register variable to from "reg" to "regs"
- don't open code bit masking
- use only one SMCCC register set where possible
- rewrite retry:/goto into do/while() loop
- make example IRQ to be edge triggered
- update activation_pending in pending_version_show()
- check SMCCC version to be v1.2 or higher
- check all SMCCC functions are implemented
- remove blank lines before return statements
- use UUID instead of GUID everywhere
- improve comments
- filter for ACPI notification 0x80 only
- update ABI doc to use "component", not "image"
- add activation_pending attribute
- fix IRQ/ACPI registration error handling
- add comments documenting lock requirements
- print LFA error number when printing error strings
- explicitly free IRQ in remove() routine
- reorder functions to avoid early empty prototype
- adjust SMCCC function ID names to match spec
- copy list of activatable images to avoid infinite loop
- update pending status when showing pending_version
- cast error returns to s64
- replace "N/A" error return with empty string

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

[1] https://lore.kernel.org/linux-arm-kernel/20260914060511.277948-1-aneesh.kumar@kernel.org/
[2] https://developer.arm.com/documentation/den0147/latest/
[3] https://lore.kernel.org/all/cover.1631025237.git.yu.c.chen@intel.com/
[4] https://lore.kernel.org/all/20250523095322.88774-1-chao.gao@intel.com/
[5] https://www.opencompute.org/documents/hyperscale-cpu-impactless-firmware-updates-requirements-specification-v0-7-9-29-2025-pdf

Andre Przywara (4):
  dt-bindings: arm: Add Live Firmware Activation
  firmware: smccc: lfa: Add auto_activate sysfs file
  firmware: smccc: lfa: Register DT interrupt
  firmware: smccc: lfa: add sysfs ABI documentation

Salman Nabi (1):
  firmware: smccc: Add support for Live Firmware Activation (LFA)

Vedashree Vidwans (1):
  firmware: smccc: lfa: Register ACPI notification

 Documentation/ABI/testing/sysfs-firmware-lfa  |  106 ++
 .../devicetree/bindings/arm/arm,lfa.yaml      |   50 +
 drivers/firmware/smccc/Kconfig                |   10 +
 drivers/firmware/smccc/Makefile               |    1 +
 drivers/firmware/smccc/lfa_fw.c               | 1057 +++++++++++++++++
 drivers/firmware/smccc/smccc.c                |    5 +
 include/linux/arm-smccc.h                     |   15 +
 7 files changed, 1244 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-lfa
 create mode 100644 Documentation/devicetree/bindings/arm/arm,lfa.yaml
 create mode 100644 drivers/firmware/smccc/lfa_fw.c

-- 
2.43.0


