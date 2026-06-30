Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3869C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 19:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78nmj35MJpTYomr+d5kVLOz9zHKnBfeYnuTEJWKrcq0=; b=AJIZiDJL5F5KGoT0AIgQ4v9/7B
	jXitYqWmEMroEBV0I2IxWsoxy+hl2NmOZ8mxsAUKBHcAzKjuTNWb74gdHuYKPMwMjFoSFx0htwqVj
	QRaGfJzs66upx93DjBwZuffLYIOeTaJMJM92aOZfPKkn0zoDXskfb/8lXBiWUnYeHIptqwk/seeD0
	8mLKIutA62dg5JkexVMyhcogkgFHejT+p7fWHtYyeG1jcoZSNw6cQKEXEheVEltSdKJffdpWD+IlT
	iBb3ioJZtkFs/Qw+jL6aLdg3Wsvh22ZKUM//g2uFMYHk5lb0ysAOVLeKpIZ5oODQtgGOaTlhxmSjD
	uWRI/xVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wednL-000000005Yv-2I2n;
	Tue, 30 Jun 2026 19:06:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wednK-000000005Ya-2GQc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 19:06:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D88B600BB;
	Tue, 30 Jun 2026 19:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFA81F00A3A;
	Tue, 30 Jun 2026 19:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782846411;
	bh=78nmj35MJpTYomr+d5kVLOz9zHKnBfeYnuTEJWKrcq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vez6WZIdrP+D1qdx0lVOHuMp529mOYXTgxnyttOVMyVcgYtli9Y2qQEvUke0+1SZD
	 zdWtIoU15DilOZtDzWQDjjNbcbldA5ixvjv6TDKNL+m35AfGngVzsoYXxZaBRIEoEb
	 hlPZI8vPlRTeHZBXVDFz7yhcQA1rIlSGa909tExWCaM1PwpsQ3kHWIeC03R6vo1gsX
	 axv/N4ZjZokMcublGhG5KtecarYcKJfDA9ZYxYBwZ8/4o38fm5YG50CW7SE1x4uMoZ
	 0tgQJX3qmolw5C70WHqHyK3B5BIJHGqJFCo2vRa1NvLqeZHOn8clLnuW7/2j+l4X5a
	 J/YkT4MwSzK7g==
Date: Tue, 30 Jun 2026 12:06:50 -0700
From: Oliver Upton <oupton@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Saket Dumbre <saket.dumbre@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Chengwen Feng <fengchengwen@huawei.com>,
	Kees Cook <kees@kernel.org>,
	=?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	James Morse <james.morse@arm.com>, Zeng Heng <zengheng4@huawei.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Thomas Huth <thuth@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, Mark Brown <broonie@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>, Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v2 06/13] KVM: arm64: dirty_bit: Add base FEAT_HACDBS
 cleaning routine
Message-ID: <akQTypBfpdqSMhm_@kernel.org>
References: <20260629111820.1873540-1-leo.bras@arm.com>
 <20260629111820.1873540-7-leo.bras@arm.com>
 <akKtKH8O5hngLenm@kernel.org>
 <akPZ2bnh3k6ZZgYx@LeoBrasDK>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akPZ2bnh3k6ZZgYx@LeoBrasDK>
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

On Tue, Jun 30, 2026 at 03:59:38PM +0100, Leonardo Bras wrote:
> > > +	hcr_el2 = read_sysreg(HCR_EL2);
> > > +	write_sysreg(hcr_el2 | HCR_EL2_VM, HCR_EL2);
> > 
> > sysreg_clear_set_hcr(). I'm pretty sure all the speculative AT errata
> > depend on HCR_EL2.VM being set _after_ the stage-2 MMU has been loaded.
> > 
> 
> So, move this to after __load_stage2()?
> ok

Yes.

> > > +	__load_stage2(&kvm->arch.mmu);
> > 
> > Pretty sure you need an ISB here to ensure loading the MMU is ordered
> > with enabling HACDBS.
> >
> 
> does not __load_stage2() have an isb() here?
> In any case, will add an isb() after sysreg_clear_set_hcr(), which should 
> come after __load_stage2() IIUC.

No, __load_stage2() inserts an ISB only for hardware subject to the
speculative AT errata. If an implementation has broken AT and HACDBS in
the future then it gets an additional ISB. Oh well.

> > > +	hacdbs_start(hw_entries, size);
> > > +
> > > +	do {
> > > +		wfi();
> > > +	} while (this_cpu_read(hacdbs_pcp.status) == HACDBS_RUNNING);
> > 
> > This is exactly why I said you should just poll hardware instead. It is
> > entirely possible that the IRQ arrives before you WFI.
> 
> It should be fine with WFIT, though, right?

Sure, but we shouldn't assume a functional WFxT even if we have HACDBS.
Just rely on pre-existing kernel infrastructure to do the thing you want
to.

> I understand the reason in pooling, and even done some workaround in 
> pooling for getting this to run in the model. 
> 
> Based on the previous reply, do you think I should only use polling for 
> now, and implement the IRQ later?

Yes.

Thanks,
Oliver

