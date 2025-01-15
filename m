Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F91C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 08:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fxwuU5+5VjORoJdAH0BmKUJFqT/pGkjGg93nT/pd0ao=; b=4Y9fMPb3h4gBvHfIJXB7oJqc0h
	3QmQH6MVeLdCBSI1e6XujqPr2oYK0iKwtk9HYUKleMuSYla140Z7i9JwbCeUz7jrVdXxYqZrbwbpZ
	/Czbpx8ZO1LHnqfXy1TLYJCMvlX/QQuWOprl5ixyRpDi7NAOC5M95WyS6fB4/sL4hSEwO9PZ5iFsa
	+Va9J22I3YRPAVXsdc1eDkZp2OBlILcHay42eTlBJQm9uTfzpIv0KwIg1lkprZa588h1xdtb70tCE
	t5TgOpYzEyxgV2VnSdpgj6IlXPBsSW63FC/5DtiCnYnYp0pfScDNcPB10eiTuNVNZQO2kqO9aMv3L
	pu1E07EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXz0L-0000000B8Yc-2pyd;
	Wed, 15 Jan 2025 08:44:01 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyz3-0000000B8KW-3rVH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 08:42:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1736930557; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=fxwuU5+5VjORoJdAH0BmKUJFqT/pGkjGg93nT/pd0ao=;
	b=EJRwXBRNRSZfDocrToDDjPCer/XVOAH80XiyuDG0heWA1ScBY4oHHQM6h6ytQos+zruZ4dKQIW46rPpDUodOpeaKKijEU9wWPycP0Z+FkjUaYnhoHRiMhB0IskMl+H43ZnMlGV1xuT3XX5cTw/Vylfif/6HL+zV/j/LPUK2EBgs=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WNi-.9S_1736930550 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 15 Jan 2025 16:42:32 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lpieralisi@kernel.org,
	guohanjun@huawei.com,
	sudeep.holla@arm.com,
	xueshuai@linux.alibaba.com,
	baolin.wang@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	lenb@kernel.org,
	tony.luck@intel.com,
	bp@alien8.de,
	yazen.ghannam@amd.com
Cc: tianruidong@linux.alibaba.com
Subject: [PATCH v3 0/5] ARM Error Source Table V2 Support
Date: Wed, 15 Jan 2025 16:42:23 +0800
Message-Id: <20250115084228.107573-1-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_004242_815119_C969CC43 
X-CRM114-Status: GOOD (  14.03  )
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

AEST provides a mechanism for hardware to directly notify Kernel to
handle RAS errors through interrupts, which is also known as Kernel-first
mode.

AEST's Advantage
========================

1. AEST uses EL1 interrupts to report CE/DE, making it more lightweight
   than GHES (the Firmware First solution on Arm).
2. The lightweight AEST allows system to report each CE, enabling user
    applications to utilize this information for memory error prediction.

AEST Driver Architecture
========================

AEST Driver Device Mana
The AEST driver consists of three components:
  - AEST device: Handle interrupts and manage AEST nodes and records.
  - AEST node: corresponding to RAS node in hardware[1],
  - AEST record: RAS register sets.

They are organized together as follows.

 ┌──────────────────────────────────────────────────┐
 │             AEST Driver Device Management        │
 │┌─────────────┐    ┌──────────┐     ┌───────────┐ │
 ││ AEST Device ├─┬─►│AEST Node ├──┬─►│AEST Record│ │
 │└─────────────┘ │  └──────────┘  │  └───────────┘ │
 │                │       .        │  ┌───────────┐ │
 │                │       .        ├─►│AEST Record│ │
 │                │       .        │  └───────────┘ │
 │                │  ┌──────────┐  │        .       │
 │                ├─►│AEST Node │  │        .       │
 │                │  └──────────┘  │        .       │
 │                │                │  ┌───────────┐ │
 │                │  ┌──────────┐  └─►│AEST Record│ │
 │                └─►│AEST Node │     └───────────┘ │
 │                   └──────────┘                   │
 └──────────────────────────────────────────────────┘


AEST Interrupt Handle
=====================

Once AEST interrupt occur
1. The AEST device traverses all AEST nodes to locate errored record.
2. There are two types of records in each node：
      - report record: node can locate errored record through bitmap in
                       ERRGSR register.
      - poll record: node need poll all record to check if it errored.
3. process record:
      - if error is corrected, reset ce threshold and print it
      - if error is defered, dump register and call memory_fauilre
      - if error is uncorrected, panic, in fact UE usually raise a
        exception rather than interrupt.
4. decode record: AEST driver notify other driver，like EDAC，to decode
    RAS register.

AEST Error Injection
====================

AEST driver provides error(Software simulation instead of real hardware errors)
inject interface, details can be see in patch0003

Address Translation
===================

AS describe in 2.2[0], error address reported by AEST record may be
'''node-specific Logical Addresses''' rather than '''System Physical Address'''
used by Kernel, driver need tracelate LA to SPA, these is similar to AMD ATL[2].
So patch0004 introduce a common function both for AMD and ARM.

I have tested this series on THead Yitian710 SOC.

Future work:
1. Add CE storm mitigation.
2. Support AEST vendor node.

This series is based on Tyler Baicar's patches [1], which do not have v2
sended to mail list yet. Change from origin patch:
1. Add a genpool to collect all AEST error, and log them in a workqueue
other than in irq context.
2. Just use the same one aest_proc function for system register interface
and MMIO interface.
3. Reconstruct some structures and functions to make it more clear.
4. Accept all comments in Tyler Baicar's mail list.

Change from V2:
https://lore.kernel.org/all/20240321025317.114621-1-tianruidong@linux.alibaba.com/
1. Tomohiro Misono
    - dump register before panic
2. Baolin Wang & Shuai Xue: accept all comment.
3. Support AEST V2.

Change from V1:
https://lore.kernel.org/all/20240304111517.33001-1-tianruidong@linux.alibaba.com/
1. Marc Zyngier
  - Use readq/writeq_relaxed instead of readq/writeq for MMIO address.
  - Add sync for system register operation.
  - Use irq_is_percpu_devid() helper to identify a per-CPU interrupt.
  - Other fix.
2. Set RAS CE threshold in AEST driver.
3. Enable RAS interrupt explicitly in driver.
4. UER and UEO trigger memory_failure other than panic.

[0]: https://developer.arm.com/documentation/den0085/0101/
[1]: https://lore.kernel.org/all/20211124170708.3874-1-baicar@os.amperecomputing.com/
[2]: https://lore.kernel.org/all/20240123041401.79812-2-yazen.ghannam@amd.com/

Ruidong Tian (5):
  ACPI/RAS/AEST: Initial AEST driver
  RAS/AEST: Introduce AEST driver sysfs interface
  RAS/AEST: Introduce AEST inject interface to test AEST driver
  RAS/ATL: Unified ATL interface for ARM64 and AMD
  trace, ras: add ARM RAS extension trace event

 Documentation/ABI/testing/debugfs-aest |  115 +++
 MAINTAINERS                            |   11 +
 arch/arm64/include/asm/ras.h           |   95 +++
 drivers/acpi/arm64/Kconfig             |   11 +
 drivers/acpi/arm64/Makefile            |    1 +
 drivers/acpi/arm64/aest.c              |  340 ++++++++
 drivers/acpi/arm64/init.c              |    2 +
 drivers/acpi/arm64/init.h              |    1 +
 drivers/edac/amd64_edac.c              |    2 +-
 drivers/ras/Kconfig                    |    1 +
 drivers/ras/Makefile                   |    1 +
 drivers/ras/aest/Kconfig               |   17 +
 drivers/ras/aest/Makefile              |    7 +
 drivers/ras/aest/aest-core.c           | 1017 ++++++++++++++++++++++++
 drivers/ras/aest/aest-inject.c         |  151 ++++
 drivers/ras/aest/aest-sysfs.c          |  230 ++++++
 drivers/ras/aest/aest.h                |  338 ++++++++
 drivers/ras/amd/atl/core.c             |    4 +-
 drivers/ras/amd/atl/internal.h         |    2 +-
 drivers/ras/amd/atl/umc.c              |    3 +-
 drivers/ras/ras.c                      |   27 +-
 include/linux/acpi_aest.h              |   68 ++
 include/linux/cpuhotplug.h             |    1 +
 include/linux/ras.h                    |   17 +-
 include/ras/ras_event.h                |   71 ++
 25 files changed, 2510 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/ABI/testing/debugfs-aest
 create mode 100644 arch/arm64/include/asm/ras.h
 create mode 100644 drivers/acpi/arm64/aest.c
 create mode 100644 drivers/ras/aest/Kconfig
 create mode 100644 drivers/ras/aest/Makefile
 create mode 100644 drivers/ras/aest/aest-core.c
 create mode 100644 drivers/ras/aest/aest-inject.c
 create mode 100644 drivers/ras/aest/aest-sysfs.c
 create mode 100644 drivers/ras/aest/aest.h
 create mode 100644 include/linux/acpi_aest.h

-- 
2.33.1


