Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CCDC36010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 00:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KLKZGbUvNa+jVdp9JTHIQNVB3c8nsSycl00uaWRgL58=; b=ADqc0nt9y5c+JxswXf+tT9htBB
	de1NSds1vUcDB0Mt5DOeaiu774BChBbeTFwDR9a8Ft85EQXYNB0ywETVDg4Ab8i66dGphAU+OWL/p
	am7iYD0cGGGfA1RxOhWwcIBbxjmABVPdCST96bn7tKgX/ZlbnrTyzc0UaNryj3ax7cd/QdUQoP69x
	06GcYxqRLgfvS8yJTq2rvwETEhN9Tzb8f/KOUHhzkXSrlRIGGOSeqMhZCe4H4vQEEjLoC2rA3xI7L
	NPPmorEtV1OdKwqTM/k2gbRkcDRt8WYNpMifr4qhI8OdEyk2ye88M7rEhcw+EFYJMOblm3bedtn+G
	/zhI5cvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2J1T-00000005kk2-0OWA;
	Wed, 09 Apr 2025 00:10:31 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Izg-00000005kB8-0tE6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 00:08:41 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id BE0CD2113E94;
	Tue,  8 Apr 2025 17:08:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BE0CD2113E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1744157318;
	bh=KLKZGbUvNa+jVdp9JTHIQNVB3c8nsSycl00uaWRgL58=;
	h=From:To:Cc:Subject:Date:From;
	b=LGD/DELqV1H4bEy/AiQLtdwg7GzNjaJaN6dqDHtxR7RTz5A7CwSXoC6O40Mnp/K8S
	 UYpgDHrV4tC+gkwrKWtWW4BlUNtWI0+0nIHN3lVYgBkLxzQeIUA4sR8DqEtFw5Y3qz
	 AZrU+yKN9jr9HcbFoSuhohCdGTIlH4nwpJvWHTJs=
From: Roman Kisel <romank@linux.microsoft.com>
To: aleksander.lobakin@intel.com,
	andriy.shevchenko@linux.intel.com,
	arnd@arndb.de,
	bp@alien8.de,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	dakr@kernel.org,
	dan.j.williams@intel.com,
	dave.hansen@linux.intel.com,
	decui@microsoft.com,
	gregkh@linuxfoundation.org,
	haiyangz@microsoft.com,
	hch@lst.de,
	hpa@zytor.com,
	James.Bottomley@HansenPartnership.com,
	Jonathan.Cameron@huawei.com,
	kys@microsoft.com,
	leon@kernel.org,
	lukas@wunner.de,
	luto@kernel.org,
	m.szyprowski@samsung.com,
	martin.petersen@oracle.com,
	mingo@redhat.com,
	peterz@infradead.org,
	quic_zijuhu@quicinc.com,
	robin.murphy@arm.com,
	tglx@linutronix.de,
	wei.liu@kernel.org,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	x86@kernel.org
Cc: apais@microsoft.com,
	benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH hyperv-next 0/6] Confidential VMBus
Date: Tue,  8 Apr 2025 17:08:29 -0700
Message-ID: <20250409000835.285105-1-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_170840_356130_0FCE1765 
X-CRM114-Status: GOOD (  20.01  )
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

Logically, there are two parts to this patch series:

1. The first part is to add the support for the confidential VMBus
   protocol, patches 1-4.
2. The second part is to avoid the bounce-buffering when the pages
   aren't shared with the host, patches 5-6.

Let us discuss the motivation and present the value proposition.

The guests running on Hyper-V can be confidential where the memory and the
register content are encrypted, provided that the hardware supports that
(currently AMD SEV-SNP and Intel TDX) and the guest is capable of using
these features. The confidential guests cannot be introspected by the host
nor the hypervisor without the guest sharing the memory contents upon doing
which the memory is decrypted.

In the confidential guests, neither the host nor the hypervisor need to be
trusted, and the guests processing sensitive data can take advantage of that.

Not trusting the host and the hypervisor (removing them from the Trusted
Computing Base aka TCB) ncessitates that the method of communication
between the host and the guest be changed. Below there is the breakdown of
the options used in the both cases (in the diagrams below the server is
marked as S, the client is marked as C):

1. Without the paravisoor the devices are connected to the host, and the
host provides the device emulation or translation to the guest:

+---- GUEST ----+       +----- DEVICE ----+        +----- HOST -----+
|               |       |                 |        |                |
|               |       |                 |        |                |
|               |       |                 ==========                |
|               |       |                 |        |                |
|               |       |                 |        |                |
|               |       |                 |        |                |
+----- C -------+       +-----------------+        +------- S ------+
       ||                                                   ||
       ||                                                   ||
+------||------------------ VMBus --------------------------||------+
|                     Interrupts, MMIO                              |
+-------------------------------------------------------------------+

2. With the paravisor, the devices are connected to the paravisor, and
the paravisor provides the device emulation or translation to the guest.
The guest doesn't communicate with the host directly, and the guest
communicates with the paravisor via the VMBus. The host is not trusted
in this model, and the paravisor is trusted:

+---- GUEST ------+                                   +-- DEVICE --+
|                 |                                   |            |
| +- PARAVISOR -+ |                                   |            |
| |             ==+====================================            |
| |   OpenHCL   | |                                   |            |
| |             | C=====================              |            |
+-+---- C - S --+-+                   ||              +------------+
        ||  ||                        ||
        ||  ||      +-- VMBus Relay --||--+           +--- HOST ---+
        ||  ||=======   Interrupts, MMIO  |           |            |
        ||          +---------------------+           +---- S -----+
        ||                                                  ||
+-------||----------------- VMBus --------------------------||------+
|                     Interrupts, MMIO                              |
+-------------------------------------------------------------------+

Note that in the second case the guest doesn't need to share the memory
with the host as it communicates only with the paravisor within their
partition boundary. That is precisely the raison d'etre and the value
proposition of this patch series: equip the confidential guest to use
private (encrypted) memory and rely on the paravisor when this is
available to be secure.

I'd like to thank the following people for their help with this
patch series:

- Dexuan for help with the patches 4-6, validation and the fruitful
  discussions,
- Easwar for reviewing the refactoring of the page allocating and
  freeing in `hv.c`,
- John and Sven for the design,
- Mike for helping to avoid pitfalls when dealing with the GFP flags,
- Sven for blazing the trail and implementing the design in few
  codebases.

Roman Kisel (6):
  Documentation: hyperv: Confidential VMBus
  drivers: hyperv: VMBus protocol version 6.0
  arch: hyperv: Get/set SynIC synth.registers via paravisor
  arch: x86, drivers: hyperv: Enable confidential VMBus
  arch, drivers: Add device struct bitfield to not bounce-buffer
  drivers: SCSI: Do not bounce-bufffer for the confidential VMBus

 Documentation/virt/hyperv/vmbus.rst |  41 +++
 arch/arm64/hyperv/mshyperv.c        |  19 ++
 arch/arm64/include/asm/mshyperv.h   |   3 +
 arch/x86/include/asm/mshyperv.h     |   3 +
 arch/x86/kernel/cpu/mshyperv.c      |  51 ++-
 arch/x86/mm/mem_encrypt.c           |   3 +
 drivers/hv/channel.c                |  36 ++-
 drivers/hv/channel_mgmt.c           |  29 +-
 drivers/hv/connection.c             |  10 +-
 drivers/hv/hv.c                     | 485 ++++++++++++++++++++--------
 drivers/hv/hyperv_vmbus.h           |   9 +-
 drivers/hv/ring_buffer.c            |   5 +-
 drivers/hv/vmbus_drv.c              | 152 +++++----
 drivers/scsi/storvsc_drv.c          |   2 +
 include/asm-generic/mshyperv.h      |   1 +
 include/linux/device.h              |   8 +
 include/linux/dma-direct.h          |   3 +
 include/linux/hyperv.h              |  71 ++--
 include/linux/swiotlb.h             |   3 +
 19 files changed, 696 insertions(+), 238 deletions(-)


base-commit: 628cc040b3a2980df6032766e8ef0688e981ab95
-- 
2.43.0


