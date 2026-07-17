Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732B9C44516
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 21:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOoEkiQgKR8GN4dBbuTr1zjhYxhyxaeDiS2y4HIEAzc=; b=1XVZYTO8n506jePX//8f4/h1t2
	Ec4zkTnXAp19sGxjw4UUUTEd5mQD+A0045MdhDqFuFUN6VnLRBPj2iGPPXvpiWbkscp5bDL4N3KID
	yblndhGdeK6NY8mNO3iCXxlGiMvN3DXUQJ2MFfT5n283nCfyqhnPoP6jyFDtlTPNjRff37fqSs4hy
	wnPdql/O7FYHXaWDHNdOr+pVW7h9SwNYcAe61upyEbGVQemVMI2jA8wxW6nCBjrkfMhPQdQqwFe0g
	WoHE+pedee7LveM8v678EAyJHkJkRtSt8xmf+B83L9f4WJEaXIiJvjr719ElMT66Jerf/CANhClOs
	JEwa0yqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkqLI-00000003I7q-2Fu7;
	Fri, 17 Jul 2026 21:43:36 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkqLF-00000003I7J-3XNG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 21:43:35 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cacef7d299so223215ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 14:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784324612; x=1784929412; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IOoEkiQgKR8GN4dBbuTr1zjhYxhyxaeDiS2y4HIEAzc=;
        b=nnoZH1R0YjSHGfSf3Gz63CTXGYoGILcoHoCg2VNFR1VTAIYk0Hfpm7J7X64XbaIZpk
         uMd7TmSclJWEV0Yc2cfv6njSsAJnWjZWXFufVTq3YnKtVnfOnIjQ87EB9qOeGo1hok4I
         IusCHqPXV1ihXK3ShoeJVrX75+SMypJlTWfDdndimsRBVVRWtAiAuT1EypsG6HS8+PXN
         PnIMPqfAX/FO3A4wWHgTspNQjLSaMfevkI98agsgQAPGWqd4tKG7YQy8gBlGP95KXiYm
         c72BO1ZVXeqQzplmOwGD1zoatOcBvQNKSbV0kmrEfJIWalqiNMRMy6ztQad8owgLZOCI
         STNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784324612; x=1784929412;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOoEkiQgKR8GN4dBbuTr1zjhYxhyxaeDiS2y4HIEAzc=;
        b=Ms4Nu4KWfyrdYfbZ3FHG4RpJ3uFcxzmgwEQRJiBFW+HfBOgUw2rUZNIE+nU9bYLS0b
         aUcuxLyWBeUbaVEate8TcrgFFDMPOypPeNFEw7gBhBoIbbAJyu0jE+Ja3f7w1wFdaGaB
         H9Ro3RM7mPzKRcyNogEzRDRlE38/ucsMBgdWA5uDO7hlL5Bb91ybMAef42iWFpUK7Emu
         CmMUMVp8oBpQPTMGnSz+rBk1cMZQc7MeKRk9W37N9d/I4VSO8QVgLIhooSXcd23g4G46
         IBR/LM3vOmxZyGbZMtRyyju0FW1K8PejjQyKl6Ex9+g+GtfUStBN84mAooy29YYrnXd0
         KGcQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMGoW6OtmU5Q+PKJGZcWY5Pxz0yH4hkTt1Mt2vIeTnQiftzj5MK0hGMrStLSpzxiaL2Med64uqunGcBMyp16jT@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmgj6ezVeKhlsTKsjPxzbKHf5DPAwsTHGuWvx4dSmZLqwJccSH
	2RwqRTB3AIkQfRTmxHZ85x81C2t2RsuEXjG6F8tRztPIG0kUDy9OYb8EJ3ZSdMMfTA==
X-Gm-Gg: AfdE7clJBbGg87h7tmj4yRCzCgAjTuFxa9bZg9IERDYW/vE0tPigny0tBpOuJ8rhCk6
	j0JIon1ZbeoacVZrf0LmI+w7dssCSsNxtIb0Gl0A3irdHi8MUqFviYmQnCGw80qIdSKHjJ8bsaO
	vcpjjlzrjhUW3TesRolcmi4BAJ2Zhi0yaLzGqoObKNxPgQnGybKkkiNRtoaowG/m6qKyX8pP41x
	EvUTO4zMdNqThACDM6BG8Gr6IelHXWCKq7Wdppw2onhUroH3CRm89ICYfxkWollbBWeORJLldRG
	dz29ffrAndceEPGPjd0zBz8ylRgslCg8ClxSdFwcL2gXEz+EUTs+Pq+uw4iMs+E7Hee1f40sFuP
	gkzg//fcWC4dT1udQGUeK8CYZQ8gj3pGZUWBtKE3/C4pO3fjPLGJgV6FcyfZ/Ws+ovMoJbea/lN
	t/nJv6E7Nfagv/4ZiL/HhJQsndrMagfdhVXbyoo5HLrqly1ng=
X-Received: by 2002:a17:902:da85:b0:2cc:9473:97a1 with SMTP id d9443c01a7336-2cf45aa8fc1mr1052835ad.22.1784324611243;
        Fri, 17 Jul 2026 14:43:31 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20b1f3sm10613093eec.26.2026.07.17.14.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 14:43:30 -0700 (PDT)
Date: Fri, 17 Jul 2026 21:43:24 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	kevin.tian@intel.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, jamien@nvidia.com
Subject: Re: [PATCH v8 0/9] iommu/arm-smmu-v3: Adopt the crashed kernel's
 stream table for kdump
Message-ID: <alqh_NVatGn84o0i@google.com>
References: <cover.1783729633.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1783729633.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_144333_893866_E2D08B85 
X-CRM114-Status: GOOD (  29.39  )
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

On Fri, Jul 10, 2026 at 05:52:41PM -0700, Nicolin Chen wrote:

Hi Nicolin,

> When transitioning to a kdump kernel, the primary kernel might have crashed
> while endpoint devices were actively bus-mastering DMA. Currently, the SMMU
> driver aggressively resets the hardware during probe by clearing CR0_SMMUEN
> and setting the Global Bypass Attribute (GBPA) to ABORT.
> 
> In a kdump scenario, this aggressive reset is highly destructive:
> a) If GBPA is set to ABORT, in-flight DMA will be aborted, generating fatal
>    PCIe AER or SErrors that may panic the kdump kernel
> b) If GBPA is set to BYPASS, in-flight DMA targeting some IOVAs will bypass
>    the SMMU and corrupt the physical memory at those 1:1 mapped IOVAs.
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
>  - Introduce an ARM_SMMU_OPT_KDUMP_ADOPT
>  - Skip SMMUEN and STRTAB_BASE resets in arm_smmu_device_reset()
>  - Skip EVENTQ/PRIQ setup including interrupts and their handlers
>  - Memremap the crashed kernel's stream tables into the kdump kernel [*]
>  - Reserve the crashed kernel's in-use ASIDs and VMIDs, preventing any TLB
>    aliasing with the kdump kernel's own domains
>  - Defer any default domain attachment to retain STEs until device drivers
>    explicitly request it.
> Most of the kdump code is added to a new arm-smmu-v3-kdump.c that is only
> built when CONFIG_CRASH_DUMP is enabled.
> 
> [*] For verification reasons, this series only fixes coherent SMMUs.
> 
> For non-ARM_SMMU_OPT_KDUMP_ADOPT cases, keep a status quo since the commit
> 3f54c447df34f ("iommu/arm-smmu-v3: Don't disable SMMU in kdump kernel"):
> full reset followed by driver-initiated reattach, potentially rejecting any
> in-flight DMA.
> 
> Note that this series is no longer treated as a bug fix, since it has grown
> fairly big and most of the kdump code now resides in a separate file. For
> folks interested in back-porting the change: a v6.12+ kernel (since commit
> 85196f54743d ("iommu/arm-smmu-v3: Reorganize struct arm_smmu_strtab_cfg"))
> would be still compatible with this series.
>

[...]

> 
> Nicolin Chen (9):
>   iommu/arm-smmu-v3: Do not enable EVTQ/PRIQ interrupts in kdump kernel
>   iommu/arm-smmu-v3: Skip EVTQ/PRIQ setup in kdump kernel
>   iommu/arm-smmu-v3: Add ARM_SMMU_OPT_KDUMP_ADOPT for kdump kernel
>   iommu/arm-smmu-v3: Destroy vmid_map ida via devres
>   iommu/arm-smmu-v3-kdump: Reserve crashed kernel's ASIDs and VMIDs
>   iommu/arm-smmu-v3-kdump: Implement is_attach_deferred()
>   iommu/arm-smmu-v3: Retain CR0_SMMUEN during kdump device reset
>   iommu/arm-smmu-v3: Skip RMR bypass for kdump adoption
>   iommu/arm-smmu-v3: Detect ARM_SMMU_OPT_KDUMP_ADOPT in probe()
> 
>  drivers/iommu/arm/arm-smmu-v3/Makefile        |   1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  48 ++
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kdump.c | 579 ++++++++++++++++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 246 ++++++--
>  4 files changed, 806 insertions(+), 68 deletions(-)
>  create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kdump.c

This series seems to align with the restore part of my SMMUv3 Live Update
(Kexec Handover) support. I have a WIP series in dev on github:
https://github.com/pran005/linux/tree/wip-arm-smmu-lu 

While going through the Stream Table adoption code in this series, I 
realized there is significant overlap between how kdump adopts a crashed
kernel's SMMU structures and how we restore preserved SMMU state via 
Kexec HandOver (KHO) during a live update

For e.g., the KHO preservation hook in my series explicitly tracks and
serializes the physical addresses of all active L1/L2 tables into the 
KHO Device Tree so the incoming kernel can kho_restore them.

However, looking at your approach, I think I can slightly rework my 
preservation logic and instead of bloating the KHO ABI with physical
addresses, I could re-use your exact table-walking logic during probe
to parse the live L1/L2 structures directly from registers, identify 
the valid tables, and kho/dma_restore them. There could me small 
differences though, for example instead of memremap stuff, we'd have to
use the kho/dma_restore API (which can be done by passing some op like 
the data structure writers we have?) Similarly, maybe reserving ASID/VMID 
can be potentially re-used as well..

Since, I plan to introduce another file: arm-smmu-v3-liveupdate.c and
given how much of this adoption and restoration logic is re-usable 
(parsing STRTAB_BASE, walking the L1 array, restoring L2s (not deferred
for KHO), I wanted to start a discussion to see if it makes sense to 
factor this common code out into an arm-smmu-v3-kexec.c (or similar)?

I'm not trying to delay this series by any chance and I would be more
than happy to rebase my Live Update series on top of this series and
refactor to share this core logic between the 2 new files: 
arm-smmu-v3-kdump.c & arm-smmu-v3-liveupdate.c 

I just wanted to start and early discussion since there's some overlap
and align on a way forward.

Thanks,
Praan

