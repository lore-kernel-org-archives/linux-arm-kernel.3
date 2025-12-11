Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A824D41D69
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 16:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIYWaGLu1FRX/DWFIXQz89mKFSNDocTq/a4NLYPuKzY=; b=gxNQ7vUgd3lfknbGuAkKgVtwEE
	ld1OGiU36AWHRzFjGdrh9v640GQqZ8jQu6/Al38ZsokNy+EQJ146fu4yN4/N3v34+cjfiMHLjDQRZ
	OeOwjl4YyaLXIHMGqqdtv9mk380jzPGRkNk9MCbsRsejkmMRiA7QsUDsqogOdycsrzAl1D/RIaEWG
	tqrg16+/VpxDsa8b6IT1+qk10rEggTKE40jvdnrIWL7Fp8au28fzYMqQve9HANPFuITeoBnxo32RF
	yS4eUzN1gdCj51pigWNlJvLGI3aTMKKW4lzXtNZ1VO0E6WAUVdPoRm0vS75GAHyOiOiqV4tss5Ip/
	16TBcrYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjcf-0000000GwoK-45N6;
	Thu, 11 Dec 2025 16:34:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjcc-0000000Gwnd-3s8K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 16:34:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E2D31063;
	Thu, 11 Dec 2025 08:34:20 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72A213F73B;
	Thu, 11 Dec 2025 08:34:27 -0800 (PST)
Date: Thu, 11 Dec 2025 16:34:25 +0000
From: Leo Yan <leo.yan@arm.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org,
	catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, james.clark@linaro.org,
	mark.rutland@arm.com, james.morse@arm.com
Subject: Re: [RFC PATCH v6 00/35] KVM: arm64: Add Statistical Profiling
 Extension (SPE) support
Message-ID: <20251211163425.GA4113166@e132581.arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_083430_997258_1888C82D 
X-CRM114-Status: GOOD (  18.74  )
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

Hi Alexandru,

Just couples general questions for myself to easier understand the series
(sorry if I asked duplicated questions).

> I wanted the focus to be on pinning memory at stage 2 (that's patches #29, 'KVM:
> arm64: Pin the SPE buffer in the host and map it at stage 2', to #3, 'KVM:
> arm64: Add hugetlb support for SPE') and I would very much like to start a
> discussion around that.

I am confused for "pinning memory at stage 2" and then I read "Pin the
SPE buffer in the host".  I read Chapter 2 Specification, ARM DEN 0154,
my conclusion is:

1) You set PMBLIMITR_EL1.nVM == 0 (virtual address mode) so that the
   driver uses the same mode whether it is running in a host or in a
   guest.

2) The KVM hypervisor needs to parse the VA -> IPA -> PA with:

   Guest stage-1 table (managed in guest OS);
   Guest stage-2 table (managed in KVM hypervisor);

3) In the end, the KVM hypervisor pins physical pages on the host
   stage-1 page table for:

   The physical pages are pinned for Guest stage-1 table;
   The physical pages are pinned for Guest stage-2 table;
   The physical pages are pinned for used for TRBE buffer in guest.

Due the host might migrate or swap pages, so all the pin operations
happen on the host's page table.  The pin operations never to be set up
in guest's stage-2 table, right?

> The problem
> ===========
> 
> When the Statistical Profiling Unit (SPU from now on) encounter a fault when
> it attempts to write a record to memory, two things happen: profiling is
> stopped, and the fault is reported to the CPU via an interrupt, not an
> exception. This creates a blackout window during which the CPU executes
> instructions which aren't profiled. The SPE driver avoid this by keeping the
> buffer mapped while ProfilingBufferEnabled() = true. But when running as a
> guest under KVM, the SPU will trigger stage 2 faults, with the associated
> blackout windows.

My understanding is that there are two prominent challenges for SPE
virtualization:

1) Allocation: we need to allocate trace buffer with mapping both
   guest's stage-1 and stage-2 before enabling SPU.  (For me, the free
   buffer is never an issue as we always disable the SPU before
   releasing the resource).

2) Pin: the physical pages used by trace buffer and the relevant stage-1
   and stage-2 tables must be pinned during the session.

I will read (and learn) the patches in next days.

Thanks,
Leo

