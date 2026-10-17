Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923E3CCA463
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 08:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hm49MjoKdmBJeY4b0QFV0UuGDTjMKJ5IHpViY1jODFQ=; b=UTyit1aGUu9H6WfeUkUzomF8qg
	2qwFcgMjPc35lzFQ2vmys2X56rIyWeC/yzf4Prs3cX3GC86owSVzxHrHvaASLstMJ4r8T/w2sXUcz
	5QK+M4emvTE8hcKgXTxIypTa+P7iF2u/odBsN9RlQfULN0PKRb6AQkY87GGFVsTqqpSJnbWDI7OQs
	V0XbV1iUGTFIFR1Bc9DSa9dNREX0axwEEEnTp5XqqtepS5S6pKHWQEMug6wMpe1JMQGAA/wBBsIWa
	/ACq56naoSZzWxHlQH49AVLs34oIesO3AWt3zm1dSNqaCM1JK/TM4GfQPoBQqas92nEh9ZKcB4IIc
	gRzlCZDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHzdj-00000004Z8H-3raR;
	Sat, 17 Oct 2026 08:19:41 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHzde-00000004Z7p-0fLG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 08:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792225164; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Hm49MjoKdmBJeY4b0QFV0UuGDTjMKJ5IHpViY1jODFQ=;
	b=blhGXKSNo0Cz+T6LLgUAPl8mRKhZ/1Y6xfPhzVlI/kw0bFMggexTfO3EUuzI1V/OP3/X7XWbl5t8u4ifbdlBBIIh+ST0r6DsaOqLMPUBazrQVwZ7Bc4gIGI68U6efJTyd5nP7WO6DmCyc43BN/MSIsOWV9qL9EdeP/RgaU1TV1U=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R871e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0XCwojoQ_1792225161;
Received: from 30.28.50.44(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0XCwojoQ_1792225161 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 17 Oct 2026 16:19:22 +0800
Message-ID: <27f2e050-10c0-4a77-8d59-00a95a162912@linux.alibaba.com>
Date: Sat, 17 Oct 2026 16:19:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/11] iommu/arm-smmu-v3: Adopt the crashed kernel's
 stream table for kdump
To: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org
Cc: robin.murphy@arm.com, joro@8bytes.org, jgg@nvidia.com, praan@google.com,
 kevin.tian@intel.com, smostafa@google.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, jamien@nvidia.com, kas@kernel.org,
 Cristian Prundeanu <cpru@amazon.com>, Breno Leitao <leitao@kernel.org>
References: <cover.1791226953.git.nicolinc@nvidia.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <cover.1791226953.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_011935_112398_5B291C59 
X-CRM114-Status: GOOD (  23.79  )
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



On 10/6/26 3:30 AM, Nicolin Chen wrote:
> When transitioning to a kdump kernel, the primary kernel might have crashed
> while endpoint devices were actively bus-mastering DMA. Currently, the SMMU
> driver aggressively resets the hardware during probe by clearing CR0_SMMUEN
> and setting the Global Bypass Attribute (GBPA) to ABORT.
> 
> In a kdump scenario, this aggressive reset is highly destructive:
> a) If GBPA is set to ABORT, in-flight DMA will be aborted, generating fatal
>     PCIe AER or SErrors that may panic the kdump kernel
> b) If GBPA is set to BYPASS, in-flight DMA targeting some IOVAs will bypass
>     the SMMU and corrupt the physical memory at those 1:1 mapped IOVAs.
> 
> To safely absorb in-flight DMA, the kdump kernel must leave SMMUEN=1 intact
> and avoid modifying STRTAB_BASE. This allows HW to continue translating in-
> flight DMA using the crashed kernel's page tables until the endpoint device
> drivers probe and quiesce their respective hardware.
> 
> However, the ARM SMMUv3 architecture specification states that updating the
> SMMU_STRTAB_BASE register while SMMUEN == 1 is UNPREDICTABLE or ignored.
> 
> This leaves a kdump kernel no choice but to adopt the stream table from the
> crashed kernel.
> 
> In this series:
>   - Introduce an ARM_SMMU_OPT_KDUMP_ADOPT
>   - Skip SMMUEN and STRTAB_BASE resets in arm_smmu_device_reset()
>   - Skip EVENTQ/PRIQ setup including interrupts and their handlers
>   - Memremap the crashed kernel's stream tables into the kdump kernel [*]
>   - Reserve the crashed kernel's in-use ASIDs and VMIDs, preventing any TLB
>     aliasing with the kdump kernel's own domains
>   - Defer any default domain attachment to retain STEs until device drivers
>     explicitly request it.
> Most of the new code is in arm-smmu-v3-kexec.c. A hidden ARM_SMMU_V3_KEXEC
> config symbol (def_bool CRASH_DUMP) controls its build.
> 
> The common helpers parse and walk the crashed kernel's stream/CD tables and
> reserve its in-use IDs. The kdump code is guarded by CONFIG_CRASH_DUMP. The
> helpers can also support the proposed SMMUv3 Live Update work:
> https://lore.kernel.org/all/20260929071950.2710070-1-praan@google.com/
> 
> [*] For verification reasons, this series only fixes coherent SMMUs.
> 
> For non-ARM_SMMU_OPT_KDUMP_ADOPT cases, keep a status quo since the commit
> 3f54c447df34f ("iommu/arm-smmu-v3: Don't disable SMMU in kdump kernel"):
> full reset followed by driver-initiated reattach, potentially rejecting any
> in-flight DMA.
> 
> Note that this series is no longer treated as a bug fix, since it has grown
> fairly big and most of the kdump code now resides in a separate C file. For
> folks interested in back-porting the change: a v6.12+ kernel (since commit
> 85196f54743d ("iommu/arm-smmu-v3: Reorganize struct arm_smmu_strtab_cfg"))
> would be still compatible with this series.
> 
> This is on Github:
> https://github.com/nicolinc/iommufd/commits/smmuv3_kdump-v11
> 
> Changelog
> v11
>   * Rebase on arm/smmu/updates branch
>   * Add Tested-by from Breno and Cristian
>   * Add Reviewed/Acked-by from Jason and Kiryl
>   * Update commit messages and Assisted-by tags
>   * New prep patch: swap EVTQ/GERROR MSI indexes
>   * Skip EVTQ's CFG0 write and vector allocation
>   * Merge arm-smmu-v3-kdump code into arm-smmu-v3-kexec
>   * Fold patches accordingly as static functions require callers
Hi Nicolin,

We tested this series (v11, backported onto our 6.6-based kernel) on two
arm64 server platforms that differ in how PCIe errors are reported: one
with firmware-first reporting (GHES/CPER), the other with OS-first AER
plus DPC. The test triggers a kdump crash (echo c > /proc/sysrq-trigger)
on an otherwise idle machine and compares the capture kernel's dmesg
between the unpatched baseline and the kernel carrying this series.

On the firmware-first platform (10 SMMUv3 instances):

   Unpatched, every SMMU logs:

     arm-smmu-v3.0.auto: SMMU currently enabled! Resetting...

   and the destructive reset immediately aborts in-flight DMA. The capture
   kernel then drowns in a storm of GHES/CPER records together with PCIe
   AER "Poisoned TLP" (Data Link Layer) errors from the devices that were
   bus-mastering at crash time. Devices behind the reset SMMUs fail to
   recover in the capture kernel, and in some runs the capture kernel
   hangs in the error storm instead of saving the vmcore.

   With the series applied, all 10 SMMUs log:

     arm-smmu-v3.0.auto: kdump: retaining SMMUEN for in-flight DMA

   and the capture kernel boots with zero AER/GHES error records. A
   complete vmcore is saved and the machine reboots normally.

On the OS-first AER/DPC platform (8 SMMUv3 instances):

   Unpatched: 8x "SMMU currently enabled! Resetting..." followed within
   seconds by PCIe AER Completion Abort errors reported by the root
   complex, along with DPC containment events and EDR notifications. The
   NICs behind the contained link never recover in the capture kernel.

   With the series applied: 8x "kdump: retaining SMMUEN for in-flight DMA",
   no PCIe error events at all, a complete vmcore and a clean reboot.

The baseline symptom is load-independent: it reproduces on idle machines,
since even an idle server has periodic DMA in flight (NIC rings, NVMe
admin queues, etc.).

Overall, on both platforms this series turns a capture-kernel boot that
used to be buried under fatal PCIe error storms into a quiet one that
reliably produces a usable vmcore.

Please feel free to add:

Tested-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thanks,
Shuai Xue

