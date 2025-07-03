Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF07C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 23:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DzpE8JONufIJxMYXOPlFuCadyw8GU1Ze2+OKvDY2+Hk=; b=C8n2BDh31jOjjtjVaf38XKWahD
	6AAb0t5XhHvxDzKsfNJ57UGy9iuVQFw1gkPGeymGHPXfsDXSOsrY2n8Tnjm3Z5XyLEAuhZzwUrYmR
	qQASnME6GttXiEIF50uOFy5XTzGrdww+KH4xlBQL+M1Q9WznMzntpnHFVih2VYqhwuMGqPFu6W/aL
	F06YM5drU+dAgWwAOW01sEoGhyrlBILdC5PoO1AQb2hUFqhHsQz6didn6dN3flxUFhIsHpMXuB0pY
	a5xYPNccq2EnrSftrRD4bCvOI2RWeqHlr7R0TInNhMcH1yCo8FYx/8VmIxKs6AavHAiLSCMnLn+YP
	QS7oWoXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTXt-0000000CqrD-2NV4;
	Thu, 03 Jul 2025 23:40:49 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSfe-0000000CluB-2dt4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 22:44:47 +0000
Received: by linux.microsoft.com (Postfix, from userid 1032)
	id 2605421130BA; Thu,  3 Jul 2025 15:44:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2605421130BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1751582685;
	bh=DzpE8JONufIJxMYXOPlFuCadyw8GU1Ze2+OKvDY2+Hk=;
	h=From:To:Cc:Subject:Date:From;
	b=OZ2KEzIwiPXPth+ZilGaG7YjgUWFVDS7JR/mbgNQvzF1eTw9fvdr2fZS9nMytKAEP
	 mnC8YBp15QaTnasgmSxyOOtQhfIlC8H8Tg93gaxCCiziujKSkIn/JDVBrFNC3Rh4na
	 AfGsYvPBevrGOE7H5a0sJ809zlFkU3V2jgRwwUr8=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	mhklinux@outlook.com,
	tglx@linutronix.de,
	bhelgaas@google.com,
	romank@linux.microsoft.com
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	jinankjain@linux.microsoft.com,
	skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com,
	x86@kernel.org,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>
Subject: [PATCH v2 0/6] Nested virtualization fixes for root partition
Date: Thu,  3 Jul 2025 15:44:31 -0700
Message-Id: <1751582677-30930-1-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_154446_697982_82F11CF4 
X-CRM114-Status: GOOD (  11.91  )
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

Fixes for running as nested root partition on the Microsoft Hypervisor.

Address issues with vmbus. The first patch prevents the Hyper-V PCI driver
being registered on baremetal, since there's no vmbus.

The second patch changes vmbus to make hypercalls to the L0 hypervisor
instead of the L1. This is needed because L0 hypervisor, not the L1, is
the one hosting the Windows root partition with the VMM that provides
vmbus.

The 3rd patch fixes a bug where cpu_online_mask is used unnecessarily
in an interrupt chip callback.

The 4th patch fixes up error return values in hv_map/unmap_interrupt() and
their callers, and cleans up style issues.

The 5th and 6th patches fix interrupt unmasking on nested. In this
scenario, the L1 (nested) hypervisor does the interrupt mapping to root
partition cores. The vectors just need to be mapped with
MAP_DEVICE_INTERRUPT instead of affinitized with RETARGET_INTERRUPT.

Changes in v2:
- Reword commit messages for clarity (Michael Kelley, Bjorn Helgaas)
- Open-code nested hypercalls to reduce unnecessary code (Michael Kelley)
- Add patch (#3) to fix cpu_online_mask issue (Thomas Gleixner)
- Add patch (#4) to fix error return values (Michael Kelley)
- Remove several redundant error messages and checks (Michael Kelley)

Mukesh Rathor (1):
  PCI: hv: Don't load the driver for baremetal root partition

Nuno Das Neves (3):
  Drivers: hv: Use nested hypercall for post message and signal event
  x86/hyperv: Fix usage of cpu_online_mask to get valid cpu
  x86/hyperv: Clean up hv_map/unmap_interrupt() return values

Stanislav Kinsburskii (2):
  x86: hyperv: Expose hv_map_msi_interrupt function
  PCI: hv: Use the correct hypercall for unmasking interrupts on nested

 arch/x86/hyperv/irqdomain.c         | 66 +++++++++++++++++------------
 arch/x86/include/asm/mshyperv.h     | 22 +---------
 drivers/hv/connection.c             |  7 ++-
 drivers/hv/hv.c                     |  6 ++-
 drivers/iommu/hyperv-iommu.c        | 33 ++++++---------
 drivers/pci/controller/pci-hyperv.c | 21 ++++++++-
 6 files changed, 80 insertions(+), 75 deletions(-)

-- 
2.34.1


