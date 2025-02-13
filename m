Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8460FC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 18:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFm2+BH3E4CEziQRUAW+5klYAUyJWWu78DqJ8+SHOsI=; b=BrO/XecZZSPZqoOo/bWUT9/RXR
	ks82UK1wzZjZLy7mXIDy+0SUyim8wD0QUiWRgY7/HaWw0Osh+MCyZZj7z6BAkmdJLfcmLVyahw8Hk
	rCyZgPmAFbuIWHGp4JJWq6+ecSaahczGbTkwi2KtKarmw90cPXb5aiBHHcyZMd8NT2xkj6DMv0rXs
	Y5oB/2MpW/puXUajLJzg8M6VBoqgDzvc1ZRRoTuPBMCFsneZ5tT8LE6PWsmEkbcANBF+63Wr+vn16
	RCLa5Y0V+qN4g5vOM+YAMSiTx2UBLUup3k3fP2qkMIFe7d0DvjV0tKiILX0o3trLc3DMgFMObFiz0
	RoBMFccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidw4-0000000CEc2-3xEm;
	Thu, 13 Feb 2025 18:27:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidHM-0000000C42T-3OYe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 17:45:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C1FC113E;
	Thu, 13 Feb 2025 09:45:56 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17F2A3F5A1;
	Thu, 13 Feb 2025 09:45:34 -0800 (PST)
Date: Thu, 13 Feb 2025 17:45:30 +0000
From: Leo Yan <leo.yan@arm.com>
To: Rob Herring <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v19 11/11] perf: arm_pmuv3: Add support for the Branch
 Record Buffer Extension (BRBE)
Message-ID: <20250213174530.GH235556@e132581.arm.com>
References: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
 <20250202-arm-brbe-v19-v19-11-1c1300802385@kernel.org>
 <20250213161628.GF235556@e132581.arm.com>
 <CAL_Jsq+VmfibMVdh+9DxqU5Axiv_zMiznAh8_umFB1J2y8reig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+VmfibMVdh+9DxqU5Axiv_zMiznAh8_umFB1J2y8reig@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_094536_894153_96E73A20 
X-CRM114-Status: GOOD (  22.38  )
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

On Thu, Feb 13, 2025 at 11:13:49AM -0600, Rob Herring wrote:

[...]

> > > +void brbe_enable(const struct arm_pmu *arm_pmu)
> > > +{
> > > +       struct pmu_hw_events *cpuc = this_cpu_ptr(arm_pmu->hw_events);
> > > +       u64 brbfcr = 0, brbcr = 0;
> > > +
> > > +       /*
> > > +        * Merge the permitted branch filters of all events.
> > > +        */
> > > +       for (int i = 0; i < ARMPMU_MAX_HWEVENTS; i++) {
> > > +               struct perf_event *event = cpuc->events[i];
> > > +
> > > +               if (event && has_branch_stack(event)) {
> > > +                       brbfcr |= event->hw.branch_reg.config;
> > > +                       brbcr |= event->hw.extra_reg.config;
> > > +               }
> > > +       }
> > > +
> > > +       /*
> > > +        * If the record buffer contains any branches, we've already read them
> > > +        * out and don't want to read them again.
> > > +        * No need to sync as we're already stopped.
> > > +        */
> > > +       brbe_invalidate_nosync();
> > > +       isb(); // Make sure invalidate takes effect before enabling
> > > +
> > > +       /*
> > > +        * In VHE mode with MDCR_EL2.HPMN set to PMCR_EL0.N, the counters are
> > > +        * controlled by BRBCR_EL1 rather than BRBCR_EL2 (which writes to
> > > +        * BRBCR_EL1 are redirected to). Use the same value for both register
> > > +        * except keep EL1 and EL0 recording disabled in guests.
> > > +        */
> > > +       if (is_kernel_in_hyp_mode())
> > > +               write_sysreg_s(brbcr & ~(BRBCR_ELx_ExBRE | BRBCR_ELx_E0BRE), SYS_BRBCR_EL12);
> > > +       write_sysreg_s(brbcr, SYS_BRBCR_EL1);
> > > +       isb(); // Ensure BRBCR_ELx settings take effect before unpausing
> > > +
> > > +       write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
> >
> > Seems to me, it is weird that first enable recording (BRBCR), then set
> > control register BRBFCR.  And the writing SYS_BRBFCR_EL1 not guarded
> > by a barrier is also a bit concerned.
> 
> We are always disabled (paused) when we enter brbe_enable(). So the
> last thing we do is unpause. The only ordering we care about after
> writing SYS_BRBFCR_EL1 is writing PMCR which has an isb before it is
> written.

Maybe it is good to add a comment to record the info.

Thanks,
Leo

