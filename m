Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CA3C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 00:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VK/ALiX0Q/HSDJU7bgnAP14qLnrVV2Yfc9+uMRERrAA=; b=wtkmeRn2sb5+IJVmsxGDoR9eCL
	vk/CpWVE0zMtJAC39HW6bojBY/ueewXmBvDvUwl/v0g6JUOVlu3i6stg3Y0+mL3jOAgXiUoyfXz3i
	WZSf8AFfxjNyjf2xPYsNzW4d457m+p/4a1ISyZuwfPCwe2I7p2qFYP5fm+tkzYpMksYYj3OE0GqU8
	Mme7OZW93n1hJsqt7vPiQP7kJVUAEj7kkyiNGHlzst05me2xbhGkMCtH7tHUTKzWzSArv+XX5qfVA
	skd1C07V2pM6qy3H199OK9cNYTH8YzzQfPwBUzMz6Nb0rmE8uaRrlEl35x51CcIaNuMop+S6n5D+/
	Kw+If+Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP8w7-00000008RIC-1WdY;
	Wed, 11 Jun 2025 00:03:23 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP8lG-00000008QEj-3F45
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 23:52:11 +0000
Received: by linux.microsoft.com (Postfix, from userid 1032)
	id 44FA32115183; Tue, 10 Jun 2025 16:52:09 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 44FA32115183
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1749599529;
	bh=VK/ALiX0Q/HSDJU7bgnAP14qLnrVV2Yfc9+uMRERrAA=;
	h=From:To:Cc:Subject:Date:From;
	b=KzWyrNuuZHz8lCacQh64UQN+lnwou7QcYZQkjZkH1iCRFUY5F7vkGg46xrdAoilR3
	 wcF4LMmNt48BUSxcEGuCB92Fz9r/0hjLdaCcV8Gd+bv5g7+tzRV0IpNceeYqF+vZkx
	 ve/QsVCo4K0k6ni69gNM4LMc1MGY3PVCfQjeH6I8=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	mhklinux@outlook.com,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	bhelgaas@google.com,
	jinankjain@linux.microsoft.com,
	skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com,
	x86@kernel.org,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>
Subject: [PATCH 0/4] Nested virtualization fixes for root partition
Date: Tue, 10 Jun 2025 16:52:02 -0700
Message-Id: <1749599526-19963-1-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_165210_830896_9243461A 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

The first patch prevents the vmbus driver being registered on baremetal, since
there's no vmbus in this scenario.

The second patch changes vmbus to make hypercalls to the L0 hypervisor instead
of the L1. This is needed because L0 hypervisor, not the L1, is the one hosting
the Windows root partition with the VMM that provides vmbus.

The 3rd and 4th patches fix interrupt unmasking on nested. In this scenario,
the L1 (nested) hypervisor does the interrupt mapping to root partition cores.
The vectors just need to be mapped with MAP_DEVICE_INTERRUPT instead of
affinitized with RETARGET_INTERRUPT.

Mukesh Rathor (1):
  PCI: hv: Do not do vmbus initialization on baremetal

Nuno Das Neves (1):
  Drivers: hv: Use nested hypercall for post message and signal event

Stanislav Kinsburskii (2):
  x86: hyperv: Expose hv_map_msi_interrupt function
  PCI: hv: Use the correct hypercall for unmasking interrupts on nested

 arch/arm64/include/asm/mshyperv.h   | 10 ++++++
 arch/x86/hyperv/irqdomain.c         | 47 +++++++++++++++++++++--------
 arch/x86/include/asm/mshyperv.h     |  2 ++
 drivers/hv/connection.c             |  3 ++
 drivers/hv/hv.c                     |  3 ++
 drivers/pci/controller/pci-hyperv.c | 21 +++++++++++--
 6 files changed, 71 insertions(+), 15 deletions(-)

-- 
2.34.1


