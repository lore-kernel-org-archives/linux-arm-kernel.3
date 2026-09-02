Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E49C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 07:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B5vjeiQCLsTjdZkQJr1qZRy9fU+p/hRxqt/dZCpjN/k=; b=QqDJq58Z/Z8GyrlYj6T0U6XVcP
	TkP76JRC7670E9ovmPbAjsLCTkMoaOdqj9DqqTXu7+dCKTWle5rj92uJuRiHX8BIYzaDbifoRMXot
	FjJ9b8q78a+LLnIM+IeCZGNCkEz9DBbl10RZXeoihO7opGy/lmZ+JWI2n5MW0YeRcOiepe4xfJE3p
	NWJLzoWwpxM+TVI3BVLy7iWobVItVoEIRM7EShKaFb7ZKKZBhw87Zsiz2dzvTnkFGmx/fMqv0/UT0
	M2HF+oRCCOYO1B2+4Fwhs8jmXIR5LPK56wY0if0nHzUHl2WI7uQnModNQtitJx2M08YCPfiHsQaOz
	N+MQ4uCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fRb-0000000Dvei-0ep0;
	Wed, 02 Sep 2026 07:31:39 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fRW-0000000DvdW-3YYh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 07:31:37 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-ca7a25cd87dso588231a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 00:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334293; x=1788939093; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B5vjeiQCLsTjdZkQJr1qZRy9fU+p/hRxqt/dZCpjN/k=;
        b=Stf6GndH1BnlT/M0OUS5bkCM3TzUqxpmDe0M0Ok6ipanv+CwmOno110fvJlscrlMXC
         7teNWAjLz+rxjXf9cY2c3M5Qh5WhlYxxiSXJhV2LdFEJnERH87fRNIMx/T1gOTHTwLhT
         udAP7/zAsT67Bnf/DAMNiT3NzV+XbakCMF6hkxP8anAseopmbZHlj5AZpt0vq9+Sik1o
         dyArCr6VrqbwDEbUkpWffcfoL40FnU9z7Bi8Q6i4qxX2BGEUSO0JwDeL6txzEmrN1JQJ
         r46NWAO5sx9ZOefnxBhY5pMGXoxPEIsR1ReLrntF9xX92EdINvhzwtlLS9IUFZe9g47R
         Zyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334293; x=1788939093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5vjeiQCLsTjdZkQJr1qZRy9fU+p/hRxqt/dZCpjN/k=;
        b=am67zt++vwJB2vWHG1BI+JN8cU1dx6Uw5aWTVjZp1rCV1vWukWHFtBHdtfld0gg7IH
         646aoZKFXS5TNDFN/h6WaqAAEWXrvnY5iW3bgCE6evx9U0NK7RMjBQU4I5pRJUiCZtCc
         o8cmykXzKbHGrIFpA0p1NI5/F7fvVcLE33nlkPsCamBOBFW0YXiW/Z9pTHUdjtsKSHGJ
         AU0cwvG+XAtlnKydBvCVQ74ZE2mJcH7D7f859uUccbUXs/aE/vRqUHtdGynbgc/ha+BW
         /VpW36gIXoY1+RB04b5bt2bT61m4h9D47ztrzAYEwITSMC5JdKSp6mEWD6+okrs/hzRk
         xI4A==
X-Forwarded-Encrypted: i=1; AKwUvByBoxFhSMvLK8IZOSRdW07/8Qk5zCFMpwWTJSiIA1AVNyERAyCW/kaD6R0gmZWZDwJSPKn1DRLxNBSIpvVPc6o8@lists.infradead.org
X-Gm-Message-State: AFuF++khgy5m8qEGK2E0CtgKCMdbvkZZKTCCH7kz+kYfpYsPXF2Litul
	7MJJ39gy2p0tT6Fq4P+eRwZrbqAuHJo8MQtx1zJ+oc3fpjTnj7ks6oHE
X-Gm-Gg: AYBFou01JRXif20+56C97EjJg0kFjGfuc/e+zqme7MIfwZ582ZrX4sxhMUylTlcLTeh
	VyTKJAJteYQKl7GJ+zVD+XlKYO4JI9X4Tw/XXQoTSztTvxsS1XlgesoYSwGy0GR0h1B0xeZWApz
	7Xsz4A89GYA4rjHZs7jc2l1BCFl77WyEoUiDVyAmizZgWCgIeXi3ig20XwVr57V3eJk4ea/o/Cq
	jZHofkxa6DcebDx3jAFDaRIf8nDwpjMgZ2a9ZNleCQk/DGDPCw6El5kLuJBx2V3RgIKYxwFWe9I
	YFOiZi4EoaTAO1rEtymTAubARjjcTMGjotvUt8HSv6WQRbJLOdNoyew+Uqmlp1u+0H3cKWXN5Cr
	yvuGIevr4xHq5th5ZLHADAhKYREaPWBJZWBuLcL5Xs/iPtSOkNrYC7IOL9+vmMSCBNP9Kv91nCv
	Wg0AjwL5ybxl/x2a0KBrAfKQoHbEjH5OqItN8HKXD0Jq8oQIjP22Og9V8qUXINAoDN2QotK/Ni
X-Received: by 2002:a05:6a00:148e:b0:847:893f:2d0c with SMTP id d2e1a72fcca58-85ed1d0414dmr5028771b3a.5.1788334293213;
        Wed, 02 Sep 2026 00:31:33 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:31:32 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com
Cc: mark.rutland@arm.com,
	kernel@xen0n.name,
	alex@ghiti.fr,
	hpa@zytor.com,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v6 00/10] kdump: reduce vmcore size and capture time
Date: Wed,  2 Sep 2026 15:31:06 +0800
Message-ID: <20260902073116.802752-1-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_003134_948220_C7B7C999 
X-CRM114-Status: GOOD (  16.56  )
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

From: Wandun Chen <chenwandun@lixiang.com>

On SoCs that carve out large firmware-owned reserved memory (GPU,
camera ISP, ...), kdump currently dumps those carveouts as part of
system RAM even though their contents are firmware state that is not
useful for kernel crash analysis.

This series introduces a MEMBLOCK_NODUMP flag in memblock to filter
reserved memory on DT-based architectures (arm64, riscv, loongarch).
Reserved regions default are marked MEMBLOCK_NODUMP so kdump omits them;
reusable CMA regions are different because their pages are handed back
to the buddy allocator and may carry crash-relevant data.

ACPI systems already filter reserved memory out of the vmcore through
their existing path; only DT-based systems currently fail to filter these
regions, which is what this series addresses. The flag lives in memblock
itself rather than in a DT-only structure, so the mechanism is generic and
both ACPI and DT systems can benefit from it (suggested by Rob, thanks) [1].

Since the reserved memory regions are filtered out, the vmcore is
smaller in size and faster to produce. 

The series is based on linux-next and is organized as follows:

Patches 1-4: Preparation and bugfixes: fix the missing HugeTLB
             flagname, switch riscv crash_mem to memblock, fold the
             duplicated per-arch memblock walks into the weak
             defaults, and serialize crash header preparation against
             memory hotplug.
Patches 5-9: NODUMP infrastructure: switch crash_core to
             for_each_mem_region(), introduce the MEMBLOCK_NODUMP
             flag, add a dumpable flag to struct reserved_mem, and
             mark /reserved-memory and /memreserve/ entries with
	     MEMBLOCK_NODUMP flag.
Patch 10:    Exclude MEMBLOCK_NODUMP regions from the vmcore ELF
             header.

In v5, Sashiko found some pre-existing issues related to reserved-memory,
and has no dependency on this series, so these issues have been addressed
in a separate series [2].

v5 --> v6:
1. Serialize crash header preparation against memory hotplug to avoid
   out-of-bounds or use-after-free issues.

2. MEMBLOCK_NODUMP marking is now done after memblock allows resizing,
   avoiding a panic from too few regions before resize is permitted.

3. Reordered the patches, put pre-existing bugfixes earlier in the series.


v4 --> v5:
1. Rework the mechanism around a memblock-level MEMBLOCK_NODUMP flag
   (suggested by Rob) instead of the v4 opt-in 'dumpable' flag on
   DT-only struct reserved_mem.
2. Switch the riscv vmcore elf header preparation to use memblock
   instead of the resource tree, aligning it with arm64 and loongarch,
   so riscv also can exclude reserved memory from vmcore.
3. Deduplicate the vmcore elf header preparation: arm64, riscv and
   loongarch open-coded the same logic, so fold it into shared
    __weak defaults in crash_core.
4.  Drop the v4 patch that saved /memreserve/ entries into the
    reserved_mem array; /memreserve/ is now marked MEMBLOCK_NODUMP
    directly.

v3 --> v4:
1. Rebase this series on v7.2-rc1.
2. Add two cleanup patches (patch 02/03).
3. Simplify patch 03 to avoid checking whether initial_boot_params is
   NULL multiple times, suggested by Rob.

v2 --> v3:
1. Fix out-of-bounds issue if device tree lacks /reserved-memory node.
2. Fix UAF issue when alloc_reserved_mem_array() fails.
3. Add some prepare patches.

v1 --> v2:
1. v1 added an opt-out DT property ('linux,no-dump'). Per Rob's
   feedback [3], v2 drop that property and exclude reserve memory
   by default.
2. Split some prepared patches from the original patches.
3. Address coding-style comments on patch 5 from Rob.

[1] https://lore.kernel.org/lkml/20260723234126.GA3253409-robh@kernel.org/
[2] https://lore.kernel.org/lkml/20260818092420.2859026-1-chenwandun1@gmail.com/
[3] https://lore.kernel.org/lkml/20260506144542.GA2072596-robh@kernel.org/

Meijing Zhao (1):
  mm: memblock: add missing HugeTLB flag name

Wandun Chen (9):
  riscv: build crash_mem ranges from memblock instead of resource tree
  crash_core: fold duplicated memblock arch hooks into the weak default
  crash_core: serialize crash header preparation against hotplug
  crash_core: replace for_each_mem_range() with for_each_mem_region()
  memblock: introduce MEMBLOCK_NODUMP flag
  of: reserved_mem: add dumpable flag to opt-in vmcore
  of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
  of: reserved_mem: mark /memreserve/ entries as MEMBLOCK_NODUMP
  crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF
    header

 arch/arm64/kernel/machine_kexec_file.c     | 29 ------------
 arch/loongarch/kernel/machine_kexec_file.c | 27 ------------
 arch/riscv/Kconfig                         |  2 +-
 arch/riscv/kernel/machine_kexec_file.c     | 33 --------------
 arch/x86/kernel/crash.c                    |  2 +-
 drivers/of/fdt.c                           |  2 +
 drivers/of/of_private.h                    |  2 +
 drivers/of/of_reserved_mem.c               | 48 ++++++++++++++++++++
 include/linux/crash_core.h                 |  2 +
 include/linux/memblock.h                   |  9 ++++
 include/linux/of_reserved_mem.h            |  1 +
 kernel/crash_core.c                        | 51 ++++++++++++++++++++--
 kernel/dma/contiguous.c                    |  1 +
 mm/memblock.c                              | 17 ++++++++
 14 files changed, 131 insertions(+), 95 deletions(-)

-- 
2.43.0


