Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC69CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 18:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3AvpD5Oc1G528FBCdIT5tp5J/UM/fR/w6vweo6KCFM8=; b=z4WKovdCdjUVhXh7XWcEtJouq0
	hvYZVfPEfoB7zck2EvEzvwxEaIVdpoWyL1OokVGiYwGUmmQHK+3hJF6TgAhFh4VFcjEQt5VMhgGBE
	s702J5Bvds8lsgzJD8A4P/X4qZSyESKKoM1TPqbR1YdRWdxnUb2+Px0Y3lxyHQhEXmrI85jSuZNTa
	fjpucbF2JTyrFhR5EFJfXqNz5u9sOtGWHDsJUOl2hvO8oNmh4fwrGBbNtKxm61PtLRF3YBbwbyTmK
	ED3bPpEEsTE35FaZxXSjMwdgDq8Df07xvQdp6J2OzagwpCTCNFOAX8XGgLZW3qXUYJalKI5uwZT08
	WU503WEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pdV-00000008jYA-3wiD;
	Fri, 17 Oct 2025 18:57:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pdS-00000008jXm-48Q2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 18:57:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C23701515;
	Fri, 17 Oct 2025 11:56:57 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC7843F66E;
	Fri, 17 Oct 2025 11:57:00 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
Cc: James Morse <james.morse@arm.com>,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Rafael Wysocki <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v3 00/29] arm_mpam: Add basic mpam driver
Date: Fri, 17 Oct 2025 18:56:16 +0000
Message-Id: <20251017185645.26604-1-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_115707_111380_0A30B427 
X-CRM114-Status: GOOD (  20.44  )
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

Hello,

A slew of minor changes, nothing really sticks out.
Changes are noted on each patch.

~

This is just enough MPAM driver for ACPI. DT got ripped out. If you need DT
support - please share your DTS so the DT folk know the binding is what is
needed.
This doesn't contain any of the resctrl code, meaning you can't actually drive it
from user-space yet. Because of that, its hidden behind CONFIG_EXPERT.
This will change once the user interface is connected up.

This is the initial group of patches that allows the resctrl code to be built
on top. Including that will increase the number of trees that may need to
coordinate, so breaking it up make sense.

The locking got simplified, but is still strange - this is because of the 'mpam-fb'
firmware interface specification that is still alpha. That thing needs to wait for
an interrupt after every system register write, which significantly impacts the
driver. Some features just won't work, e.g. reading the monitor registers via
perf.

I've not found a platform that can test all the behaviours around the monitors,
so this is where I'd expect the most bugs.

The MPAM spec that describes all the system and MMIO registers can be found here:
https://developer.arm.com/documentation/ddi0598/db/?lang=en
(Ignored the 'RETIRED' warning - that is just arm moving the documentation around.
 This document has the best overview)

The expectation is this will go via the arm64 tree.


This series is based on v6.18-rc4, and can be retrieved from:
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/driver/v3

The rest of the driver can be found here:
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.18-rc1

What is MPAM? Set your time-machine to 2020:
https://lore.kernel.org/lkml/20201030161120.227225-1-james.morse@arm.com/

This series was previously posted here:
[v2] lore.kernel.org/r/20250910204309.20751-1-james.morse@arm.com
[v1] lore.kernel.org/r/20250822153048.2287-1-james.morse@arm.com
[RFC] lore.kernel.org/r/20250711183648.30766-2-james.morse@arm.com


James Morse (27):
  ACPI / PPTT: Add a helper to fill a cpumask from a processor container
  ACPI / PPTT: Stop acpi_count_levels() expecting callers to clear
    levels
  ACPI / PPTT: Find cache level by cache-id
  ACPI / PPTT: Add a helper to fill a cpumask from a cache_id
  arm64: kconfig: Add Kconfig entry for MPAM
  ACPI / MPAM: Parse the MPAM table
  arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate
  arm_mpam: Add the class and component structures for firmware
    described ris
  arm_mpam: Add MPAM MSC register layout definitions
  arm_mpam: Add cpuhp callbacks to probe MSC hardware
  arm_mpam: Probe hardware to find the supported partid/pmg values
  arm_mpam: Add helpers for managing the locking around the mon_sel
    registers
  arm_mpam: Probe the hardware features resctrl supports
  arm_mpam: Merge supported features during mpam_enable() into
    mpam_class
  arm_mpam: Reset MSC controls from cpuhp callbacks
  arm_mpam: Add a helper to touch an MSC from any CPU
  arm_mpam: Extend reset logic to allow devices to be reset any time
  arm_mpam: Register and enable IRQs
  arm_mpam: Use a static key to indicate when mpam is enabled
  arm_mpam: Allow configuration to be applied and restored during cpu
    online
  arm_mpam: Probe and reset the rest of the features
  arm_mpam: Add helpers to allocate monitors
  arm_mpam: Add mpam_msmon_read() to read monitor value
  arm_mpam: Track bandwidth counter state for overflow and power
    management
  arm_mpam: Add helper to reset saved mbwu state
  arm_mpam: Add kunit test for bitmap reset
  arm_mpam: Add kunit tests for props_mismatch()

Rohit Mathew (2):
  arm_mpam: Probe for long/lwd mbwu counters
  arm_mpam: Use long MBWU counters if supported

 arch/arm64/Kconfig                  |   25 +
 drivers/Kconfig                     |    2 +
 drivers/Makefile                    |    1 +
 drivers/acpi/arm64/Kconfig          |    3 +
 drivers/acpi/arm64/Makefile         |    1 +
 drivers/acpi/arm64/mpam.c           |  384 ++++
 drivers/acpi/pptt.c                 |  248 ++-
 drivers/acpi/tables.c               |    2 +-
 drivers/resctrl/Kconfig             |   22 +
 drivers/resctrl/Makefile            |    4 +
 drivers/resctrl/mpam_devices.c      | 2701 +++++++++++++++++++++++++++
 drivers/resctrl/mpam_internal.h     |  661 +++++++
 drivers/resctrl/test_mpam_devices.c |  389 ++++
 include/linux/acpi.h                |   26 +
 include/linux/arm_mpam.h            |   58 +
 include/linux/platform_device.h     |    1 +
 16 files changed, 4519 insertions(+), 9 deletions(-)
 create mode 100644 drivers/acpi/arm64/mpam.c
 create mode 100644 drivers/resctrl/Kconfig
 create mode 100644 drivers/resctrl/Makefile
 create mode 100644 drivers/resctrl/mpam_devices.c
 create mode 100644 drivers/resctrl/mpam_internal.h
 create mode 100644 drivers/resctrl/test_mpam_devices.c
 create mode 100644 include/linux/arm_mpam.h

-- 
2.39.5


