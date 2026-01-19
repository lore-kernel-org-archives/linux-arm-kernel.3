Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0840CCF2F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LW36TK6JkXTarw46XmBXYYgXnSMAKzh+SN3YD/YskcM=; b=Qzw02E3QH3wHiCLPXNp7Ge2Gz9
	2AD7RYnYb6lxHsuYUz90dro5UGDi4+fFXorRUL4z0tLpVE2BdonayhdDYyjXj/3Zn5YMgjoeb3ogn
	SbAeP4Y67vBT1n5lXAAfRRC0bBpbJcfTgxAaajEZiMEqmHGhLM4LET8c9tvDqQ9wK0yQVraw85CiB
	U0oV0dp3MMKeJ6cPwlMFYUHktAcHT625Iyv7isg3ifQwuMUKZNCVprcU1oXzmZkc1jVg9uU+wFI5+
	NXx4wzfhpUIbxKW293GZHNMkk0kFeztKN2zoa3Be9GFjhajWF1Ho+AYfgvY/nWoJHGCvzJcY/TDj+
	XKIp092Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoML-000000020Hv-05MC;
	Mon, 19 Jan 2026 12:27:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoMC-000000020HF-2oBp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:27:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 939EA339;
	Mon, 19 Jan 2026 04:27:34 -0800 (PST)
Received: from oss-apollo7005.oss.cambridge.arm.com (oss-apollo7005.oss.lab.cambridge.arm.com [10.7.15.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3B5B3F632;
	Mon, 19 Jan 2026 04:27:38 -0800 (PST)
From: Salman Nabi <salman.nabi@arm.com>
To: vvidwans@nvidia.com,
	andre.przywara@arm.com,
	sudeep.holla@arm.com,
	mark.rutland@arm.com,
	lpieralisi@kernel.org
Cc: ardb@kernel.org,
	chao.gao@intel.com,
	linux-arm-kernel@lists.infradead.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sdonthineni@nvidia.com,
	vsethi@nvidia.com,
	vwadekar@nvidia.com
Subject: [PATCH 0/1] Arm Live Firmware Activation (LFA) support
Date: Mon, 19 Jan 2026 12:27:28 +0000
Message-Id: <20260119122729.287522-1-salman.nabi@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_042744_834907_5160338B 
X-CRM114-Status: GOOD (  13.26  )
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

Hi reviewers,

(This is a follow-up to the Live Firmware Activation work that was
submitted for RFC [1]).

This patch introduces a Linux kernel driver implementing the Arm Live
Firmware Activation (LFA) specification [2]. LFA enables the activation
of updated firmware components without requiring a system reboot,
reducing downtime in environments such as data centers and hyperscale
systems.

Unlike firmware update process (which may use tools like fwupd), LFA
focuses solely on the activation of an already updated firmware
component, that is pending activation, without a system reboot. This
capability helps maintain service availability and minimize operational
disruption.

Key features of the driver:
* Detects LFA support in system firmware (EL3).
* Lists all firmware components that support live activation.
* Exposes component attributes (e.g., activation capability, and
  activation pending) via sysfs under /sys/firmware/lfa/.
* Provides interfaces to:
  - Trigger activation of an updated firmware component.
  - Cancel an ongoing activation if required.

This work is conceptually similar to Intel’s Platform Firmware Runtime
Update and telemetry (PFRUT) [3] and TDX module updates [4], but
targets Arm platforms. The driver has been used to successfully activate
a Realm Management Monitor (RMM) firmware image in a controlled test
environment. RMM is analogous to Intel’s TDX module.

There is effort on similar work from the OCP [5]. Future work may
include integration with utilities like fwupd to automatically select
the appropriate driver, based on platform architecture, for Live/Runtime
firmware updates.

Note: The ACPI tables are described in the spec. The Device Tree
bindings are currently work-in-progress, and a follow up patch will soon
be submitted that will add the DT bindings to the driver.

Summary of changes since rfc:
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

Best regards,
Salman Nabi

[1] https://lore.kernel.org/all/20250625142722.1911172-2-andre.przywara@arm.com/
[2] https://developer.arm.com/documentation/den0147/latest/
[3] https://lore.kernel.org/all/cover.1631025237.git.yu.c.chen@intel.com/
[4] https://lore.kernel.org/all/20250523095322.88774-1-chao.gao@intel.com/
[5] https://www.opencompute.org/documents/hyperscale-cpu-impactless-firmware-updates-requirements-specification-v0-7-9-29-2025-pdf

Salman Nabi (1):
  firmware: smccc: add support for Live Firmware Activation (LFA)

 drivers/firmware/smccc/Kconfig  |   8 +
 drivers/firmware/smccc/Makefile |   1 +
 drivers/firmware/smccc/lfa_fw.c | 668 ++++++++++++++++++++++++++++++++
 3 files changed, 677 insertions(+)
 create mode 100644 drivers/firmware/smccc/lfa_fw.c

-- 
2.25.1


