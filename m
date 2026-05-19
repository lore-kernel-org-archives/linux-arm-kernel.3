Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84AACD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 12:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxzuN/rD6jIGcxo22N15Idh87xXDS54lN8ujBI5YFNw=; b=VjVXvrugowI5NUCZ6wD7JfmVXh
	y2osgo+puGrnKiO4PcfNU8PoYuCP1sDGk0+ma1FpOjzY8CqZtA4aP9kaLma0pF8k5/D4A6Wqvl9NJ
	tAdeIX9Ed7woRsGeh21b6WbOjg1wrDp5W0SblfnlmRr049v6Xv0169F4rC/lZcRHCuNBflNMYRSU/
	+8tf5gB9S7Mhj9yGZ+zamJpO0UKgeGVAdrGTlD/iySYfVC62aRkjw1cQzjZiDzoaoPsy+1BstweIA
	9Uoo2cugryshK1RaVItd9fyGv8cKyz1Ti2UQB4W6ZSwxMUM5BPkzVci/xabgTHm4tj+iWi2pBWTE0
	9eX1XXeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJs9-00000001XAA-33Rq;
	Tue, 19 May 2026 12:48:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJs6-00000001X9T-40qD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 12:48:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 364B940964;
	Tue, 19 May 2026 12:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88452C2BCB3;
	Tue, 19 May 2026 12:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779194910;
	bh=SHZEkovLnemJnm2Y1dTh3AZOP+xurxZQh26q5EDvm8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pjOpqU5wEVxRg8SApIVukS4rWhzPdTGGnO31vrFpHC9SpiuiuUPODiTgShkP1LBkP
	 ZVg0gTOPmKdH00J31qEBXlqSTnLEoHVk0I52fQxkHfs2izstv8CVR0E+zriXBHrc3/
	 Z+lruAIANp7OlAfY9Q0rLaj5SvqpSjpX5QreCc+fhrisVTHxuJNU4BIMaHucVTXLr1
	 F0SJ0SFzj91/w4DB4R4i2jEYUP75caGyrh0ehXlHhtnPUTfWLluaij+pStFLbwgfBu
	 acJOXqg8Vek88ddM/MwGOmHNShx7n1UGEsBp0sVgrqmOivlvrYIjg/lezfUXrDvTDU
	 jwtrgPU8heqSw==
Date: Tue, 19 May 2026 13:48:23 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, punit.agrawal@oss.qualcomm.com,
	rafael.j.wysocki@intel.com, fengchengwen@huawei.com,
	chenl311@chinatelecom.cn, suzuki.poulose@arm.com, maz@kernel.org,
	timothy.hayes@arm.com, lpieralisi@kernel.org,
	mrigendra.chaubey@gmail.com, arnd@arndb.de, sudeep.holla@kernel.org,
	yangyicong@hisilicon.com, jic23@kernel.org, pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	james.morse@arm.com
Subject: Re: [PATCH v2] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
Message-ID: <agxcF1bzmErb_lB9@willie-the-truck>
References: <20260427023507.1247418-1-ruanjinjie@huawei.com>
 <agIT0R4KV3YBYjlo@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agIT0R4KV3YBYjlo@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_054831_018876_D564371F 
X-CRM114-Status: GOOD (  20.71  )
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

On Mon, May 11, 2026 at 06:37:21PM +0100, Catalin Marinas wrote:
> On Mon, Apr 27, 2026 at 10:35:07AM +0800, Jinjie Ruan wrote:
> > On arm64, when booting with `maxcpus` greater than the number of present
> > CPUs (e.g., QEMU -smp cpus=4,maxcpus=8), some CPUs are marked as 'present'
> > but have not yet been registered via register_cpu(). Consequently,
> > the per-cpu device objects for these CPUs are not yet initialized.
> [...]
> > Fix this by:
> > 
> > 1. When booting with ACPI, checking the ACPI_MADT_ENABLED flag in the GICC
> >    entry before calling set_cpu_present() during SMP initialization.
> > 
> > 2. Properly managing the present mask in acpi_map_cpu() and
> >    acpi_unmap_cpu() to support actual CPU hotplug events, This aligns with
> >    other architectures like x86 and LoongArch.
> 
> I had a chat with James earlier and IIUC the decision was to mark all
> CPUs present and the GIC must be fully initialised. But digging through
> the GICv3 code, I don't see it depending on cpu_present_mask but rather
> on the "always on" MADT GICR description. So I think it should be safe
> as long as we don't rely on the GICC gicr_base_address. But we should
> update Documentation/arch/arm64/cpu-hotplug.rst to no longer state that
> all online-capable vCPUs are marked as present by the kernel.
> 
> (or maybe I misunderstood all this)

Jinjie, do you plan to respin with a documentation update as per
Catalin's comment above?

Will

