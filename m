Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31094CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5KZiX26aqwUyZIYbya9tfV4Mvg5MCMOLcvC9aKPc0E=; b=FR1+wNohVYkZ084iGQv93rFPzJ
	I35NowyxbYU47yLAq2TY/ewxtoMeOmfRqw82Av5yuM/x9r/3G6JPP6Ms4ppwbolCeZKGlKZI0KYVz
	rE6FFJFlyiwEbEvMVdcGRC7GQ/36vKVNNK58TzoMzWfuPprVpgSCdmdd6vSLX64VP8hi1AqRtpL9m
	dG3iIMRZvdLplWi+RaGjo+q7ENu5Jxjd7kz7ukhXar+hoe6LqKKOX3Gp4QYUoLJj4z0vqbCmebJqT
	fM+YNVrsSbHV3vqdMHeDJ0yQN4ObV7Y5iA2ZMTPPTxP4h1dRBturc1j4tsHfYUl0oo8fDeu9bZTuB
	i7VMJSnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfQO-0000000G5xg-2fwv;
	Mon, 05 Oct 2026 09:56:00 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfQL-0000000G5vo-1qzp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:56:00 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso206521166b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 02:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791194154; x=1791798954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5KZiX26aqwUyZIYbya9tfV4Mvg5MCMOLcvC9aKPc0E=;
        b=Ghwmu936MQNGsPDURkd1mqM22fqRaBpiG1QrTcXbUPz1evCqVXR/oacvSb0Juro7iQ
         PXpExamsU63w42Ci+kH8UxmkgP/tbyfIWZ+7RJ3HCWEMeODQbyVYQwGVJ5lieVjd6StK
         C68lNQ0nZw37/qp4tCXGMqZYa/pp5S4XZOcztftUolQm1VWOERjASBLj1Ylk0ksnGDaS
         VzTK1ZA99cNUq9YZhdsh1VbhELHPi7WoVj8wf4R7VYsJup1dcH8lbZKw+73lDJgbNdbK
         t2Hqz+Isbnru9/J9n5ZDMvIM9QRKl7MfVmF9AbJMg4PWqTUVm00g8m5BJ1OutMFbufG4
         zB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791194154; x=1791798954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y5KZiX26aqwUyZIYbya9tfV4Mvg5MCMOLcvC9aKPc0E=;
        b=zAAY8AN8zL369xztOWKkALhmVFObbVf7MQ/YL0mcvSb2kynEU8hzLkLe6P5qM17fQ6
         lMMk089oeRRymkakKsSdiHZROeVVWTc+5kmMb+DzTuc077aSAEkXjr99OzVa/xC3/h6G
         m4DJxI6carKJQj/BhjGl3ZxhEFL/fEt0CC3/TsBHvWSNU6GAkvz9EGDBydtunDw4eaHy
         d+VcFodI3Jjr5Kp+oCS5zwYKCvwFpCbBGEyvVANxljhcbTcrhDZqSe5ss3s4AhEZ6yCw
         z2nhytFz7A2yTGobOTGC/EsH5YPLOU5jVP9mz3ZORaQnAWGUDla9JPCcjCLhsCDzbjAq
         AkCw==
X-Forwarded-Encrypted: i=1; AKwUvBzbNcw+RFE7O19pdYyxFb+upaoHvr1z4BN8T8zmRUlD7Ynrjv7NU2uLjQkVHiDl3bQhCe56O5Q7jNg0XV8wzWOT@lists.infradead.org
X-Gm-Message-State: AFuF++n1Y+YKRqrpbikOpbqw64IzOeitoFJkCt6JmRgA11Q1czQKr7WY
	3MxxSv9MbdlamdIubyEAEO9BVT5k4UtAw6JrfzIDRq+uXXOWQY+nlfl4
X-Gm-Gg: AYBFou2OQZ11ogDjCWL3sHEzfJANFvolzgyjD96PVwBDfJJehzmzKym+glUvtAUBYsm
	wsvuPkCs3ejdRr+Y2+Jy1Eym8Ul+empFO8s63+UAPQLyP5zyrtotdUSVldwc+jH+ZFplgll3ezT
	29bFHf94aoT20S65/TDqS1QTCpMcSKomoqDT4B7f/4xT4s3hF0C2Id2wCyLSY2Ao6u5ltLjyPeh
	YvCeuhw9AkSrE5VMyRt+hqJhIyGwLdHIUUEJdnrV1WfZh1uI+H2FftRk0I1K7n1OPZLqjyvzfCd
	KZJzEHYn9D75nEWDtpknBc1hs+A0Xl+mXCV5SIqJadQMJ4NrUSueicazJGjFfiVPtk8701EducD
	t9pxOVJCry11b80+00MrBZ2awbkmmvEESbAr/UO0Dh/2QrgEaKRKbJJb6lVxCyffsN8NNRrK9qG
	TXgDB44yPu/plRDZJgagMv7hkVh9kVpqBLGfHzy7wUpCuDaBXQrFjvLAXwXtEtkcTwEH2Quj02e
	vpmD3XFl8e3OeMqzmfXIYzVE7dt0s5of6/AlGBTPTQU/hK2qLelQOt+J6WXMJSg1pl0FesRkxQX
	8XBs2nB6RBFP8Jmw6l7IIuGvhq5kDew31ec=
X-Received: by 2002:a17:907:7b8c:b0:c2d:fc0b:551a with SMTP id a640c23a62f3a-c2e6e7ce8femr537001966b.0.1791194153808;
        Mon, 05 Oct 2026 02:55:53 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31562aba16sm50753266b.23.2026.10.05.02.55.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2026 02:55:53 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Alex Williamson <alex@shazbot.org>,
	Shuah Khan <shuah@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	x86@kernel.org
Subject: [RFC PATCH 0/6] KVM: guest_memfd: back guest_memfd with an imported dma-buf
Date: Mon,  5 Oct 2026 09:55:46 +0000
Message-ID: <20261005095552.52748-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260720111259.122911-1-dwmw2@infradead.org>
References: <20260720111259.122911-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_025557_522301_DEFB4F45 
X-CRM114-Status: GOOD (  18.55  )
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

From: Fred Griffoul <fgriffo@amazon.co.uk>

This extends David Woodhouse's "KVM: Allow alternative providers of
guest_memfd backed by PFNMAP memory" RFC (v2) to let guest_memfd import
a dma-buf as its page source:

  https://lore.kernel.org/kvm/20260720111259.122911-1-dwmw2@infradead.org/

The memory owner is a plain dma-buf exporter, linking against neither
KVM nor iommufd. guest_memfd imports it for the guest (stage-2) plane
and iommufd imports the same buffer for the device (DMA) plane, so one
object and one invalidation protocol serve both. This is a concrete
answer to the "how do we plug into iommufd without masquerading as a
dma-buf" question from David's cover: the provider does not pretend to
be anything; the dma-buf is the shared object.

Applies on top of David's v2 series.

Patches:

 1 KVM: guest_memfd: Add a writable result to get_pfn()
   Give get_pfn() a writable out-param so a backing can map a page
   present but read-only (KVM_MEM_READONLY is rejected on guest_memfd
   slots). A guest write then exits as a memory fault. Stage-2 only;
   KVM's own host-mapped accesses are unaffected.

 2 dma-buf: Add get_phys() to describe a physical run
   New exporter op: for an offset+len, return one physically contiguous
   backed run and an attribute word (RAM/MMIO, plus READONLY). -ENOENT
   for an unbacked byte, -ENODEV when revoked. Lets a page-table-building
   importer ask where the memory is instead of taking a scatterlist.
   Converts vfio-pci, the iommufd selftest exporter and the sample;
   iommufd behaviour is unchanged.

 3 dma-buf: Add ranged mapping invalidation
   Invalidate a byte range rather than the whole buffer. The callback
   means "re-query this range" and covers loss, replacement and
   read-only flips. Importers without the callback still get a
   whole-buffer invalidation.

 4 dma-buf: Allow dynamic attach without a device
   Allow a dynamic importer with no struct device, for a consumer (KVM)
   that only needs the physical layout and builds its own tables. Such
   an importer must not map the attachment for DMA.

 5 KVM: guest_memfd: Add dma-buf backing
   Add GUEST_MEMFD_FLAG_USE_DMABUF and a dmabuf_fd to
   KVM_CREATE_GUEST_MEMFD. guest_memfd attaches as a revocable importer
   without a device, serves faults from get_phys() (largest aligned RAM
   run, read-only honoured), and zaps the range on the invalidation
   callback.

 6 samples/kvm, selftests/kvm: Exercise dma-buf backing
   Turn the sample into a dma-buf exporter (a toy memory owner: one root
   region, a child per VM, move/donate/reclaim, absent and read-only
   pages, a scratch page, per-child ioctl allowlists) and move the
   selftests to feed one dma-buf fd to both guest_memfd and iommufd.

Scope: non-confidential VMs, RAM backings only; iommufd keeps its
single-range import for now. As with David's series, this is largely
AI-assisted and is posted to get the interface shape reviewed.

Fred Griffoul (6):
  KVM: guest_memfd: Add a writable result to get_pfn()
  dma-buf: Add get_phys() to describe a physical run
  dma-buf: Add ranged mapping invalidation
  dma-buf: Allow dynamic attach without a device
  KVM: guest_memfd: Add dma-buf backing
  samples/kvm, selftests/kvm: Exercise dma-buf backing

 arch/arm64/kvm/mmu.c                          |   13 +-
 arch/arm64/kvm/nested.c                       |   10 +-
 arch/x86/kvm/mmu/mmu.c                        |   18 +-
 arch/x86/kvm/svm/sev.c                        |    4 +-
 drivers/dma-buf/dma-buf.c                     |   92 +-
 drivers/iommu/iommufd/iommufd_private.h       |    8 -
 drivers/iommu/iommufd/iommufd_test.h          |   16 +
 drivers/iommu/iommufd/pages.c                 |   74 +-
 drivers/iommu/iommufd/selftest.c              |  106 +-
 drivers/vfio/pci/vfio_pci_dmabuf.c            |   58 +-
 include/linux/dma-buf.h                       |   70 +
 include/linux/kvm_host.h                      |   12 +-
 include/linux/vfio_pci_core.h                 |    3 -
 include/trace/events/dma_buf.h                |    2 +-
 include/uapi/linux/kvm.h                      |    6 +-
 samples/kvm/gmem_provider.c                   | 1311 ++++++++++-------
 samples/kvm/gmem_provider.h                   |  144 +-
 tools/include/uapi/linux/kvm.h                |    6 +-
 tools/testing/selftests/kvm/Makefile.kvm      |    3 +-
 .../kvm/gmem_provider_nvme_dma_test.c         |   28 +-
 .../testing/selftests/kvm/include/kvm_util.h  |   25 +-
 .../testing/selftests/kvm/x86/gmem_poc_test.c |  824 +++++++++++
 .../kvm/x86/gmem_provider_hugepage_test.c     |   30 +-
 .../kvm/x86/gmem_provider_iommufd_test.c      |   42 +-
 .../kvm/x86/gmem_provider_readonly_test.c     |  172 +++
 .../kvm/x86/gmem_provider_revoke_test.c       |   34 +-
 .../selftests/kvm/x86/gmem_provider_test.c    |  190 +--
 .../kvm/x86/gmem_provider_vfio_test.c         |   45 +-
 virt/kvm/Kconfig                              |    1 +
 virt/kvm/guest_memfd.c                        |  252 +++-
 30 files changed, 2703 insertions(+), 896 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/x86/gmem_poc_test.c
 create mode 100644 tools/testing/selftests/kvm/x86/gmem_provider_readonly_test.c

--
2.47.3


