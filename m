Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D09C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 10:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jL3M30H6yeiMCIgp3yJKkkvTwOcnleWJ8pOx3l2gUtY=; b=IKdOE7szzZ7HEsfxf0+sdsteSK
	6822hZGSGYJuK9fTtxvvFrP/IQq7uyM3Tx9NhmVWOXaWS4VPZyaRnZ9r5EJZ0TEO4fHXshZO0Kbma
	ESBUQBaoLEX9Yx235soPX1PuM8azcLOtmipwB81pfoB2FhlzDhBRcMXDUQRW6FqWDVHBO1T9iSn7L
	IK1GVa1KW4zhAkWDSb8aEB6+RHMOdIXc/5IyQRZ9NA5JcMdjDeZxeRXt1v3dRth8qJf5pwsIN2P54
	VcpCu4Qx7GLA8127Ss9Aa3EKyF1YQ+LxzwEeiUdIApvyPDScsXcs4J7Bn/bYp2K+ccAGZizP0WeoK
	rtyzH8ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesUD-00000001LnO-08ge;
	Wed, 01 Jul 2026 10:48:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesUA-00000001Lms-42If
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 10:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jL3M30H6yeiMCIgp3yJKkkvTwOcnleWJ8pOx3l2gUtY=; b=nIYRNhoJYQLAHQThP8KedUyS4M
	nNPPKC8evZJ78dX5f0SSn8nrlY882bopEskKZ/bczWYZp5QQEKpVeg2uoDhLmhzZS9mW5PGJ2X4m4
	hW5+xn4vs/65uOjLpz+tvsnAuKAQWtYXsCCMTtCw0M4TX0053MWThfOik4gDwdOonwiqnE8jNeV3B
	2H+eAVoemXuBYN51DJzWifp6C+8ls+gBsVNUSMGWf5HeC48KUNs7WfR5ccytxZPnQQA7i2u83d7gM
	HNjRra6pM+8Ue1xQc5RwcKFD16O85J5QtCqlvNQFCKcbAudsTcqG9sl0+xwsaaNqeEfXtnOiUEf4A
	s7d6Vyew==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wesU7-00000002doC-3He8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 10:48:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C24C2247;
	Wed,  1 Jul 2026 03:47:55 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1B5C3F85F;
	Wed,  1 Jul 2026 03:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782902880; bh=k9oLV4IW1kmjddOXs4xgFjCS/8na5VnlDFUVzIfikXo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tnOzSRO03HoN3OjxZOBM4zT7QZXKnXvBpvE2UHcg5FHEnAP6Uw1P9kZGjvy4/BHWl
	 XsLX53rt40c/3Y76DfQ8exxQAa8Zn6lDLlVABiIFTtnUSxB2BpHI8pwOpELG0RrwoS
	 cJEkgFFdJuQwSs9X0ULTp+Zo7HMVTGwI3C0PQz4s=
From: Leonardo Bras <leo.bras@arm.com>
To: Oliver Upton <oupton@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Saket Dumbre <saket.dumbre@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Chengwen Feng <fengchengwen@huawei.com>,
	Kees Cook <kees@kernel.org>,
	=?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	James Morse <james.morse@arm.com>,
	Zeng Heng <zengheng4@huawei.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	kvm@vger.kernel.org
Subject: Re: [PATCH v2 06/13] KVM: arm64: dirty_bit: Add base FEAT_HACDBS cleaning routine
Date: Wed,  1 Jul 2026 11:47:52 +0100
Message-ID: <akTwWArtOWJ--fi4@LeoBrasDK>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <akQTypBfpdqSMhm_@kernel.org>
References: <20260629111820.1873540-1-leo.bras@arm.com> <20260629111820.1873540-7-leo.bras@arm.com> <akKtKH8O5hngLenm@kernel.org> <akPZ2bnh3k6ZZgYx@LeoBrasDK> <akQTypBfpdqSMhm_@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_114804_218749_7BC23A18 
X-CRM114-Status: GOOD (  26.51  )
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

On Tue, Jun 30, 2026 at 12:06:50PM -0700, Oliver Upton wrote:
> On Tue, Jun 30, 2026 at 03:59:38PM +0100, Leonardo Bras wrote:
> > > > +	hcr_el2 = read_sysreg(HCR_EL2);
> > > > +	write_sysreg(hcr_el2 | HCR_EL2_VM, HCR_EL2);
> > > 
> > > sysreg_clear_set_hcr(). I'm pretty sure all the speculative AT errata
> > > depend on HCR_EL2.VM being set _after_ the stage-2 MMU has been loaded.
> > > 
> > 
> > So, move this to after __load_stage2()?
> > ok
> 
> Yes.
> 
> > > > +	__load_stage2(&kvm->arch.mmu);
> > > 
> > > Pretty sure you need an ISB here to ensure loading the MMU is ordered
> > > with enabling HACDBS.
> > >
> > 
> > does not __load_stage2() have an isb() here?
> > In any case, will add an isb() after sysreg_clear_set_hcr(), which should 
> > come after __load_stage2() IIUC.
> 
> No, __load_stage2() inserts an ISB only for hardware subject to the
> speculative AT errata. If an implementation has broken AT and HACDBS in
> the future then it gets an additional ISB. Oh well.
>

Makes sense.
 
> > > > +	hacdbs_start(hw_entries, size);
> > > > +
> > > > +	do {
> > > > +		wfi();
> > > > +	} while (this_cpu_read(hacdbs_pcp.status) == HACDBS_RUNNING);
> > > 
> > > This is exactly why I said you should just poll hardware instead. It is
> > > entirely possible that the IRQ arrives before you WFI.
> > 
> > It should be fine with WFIT, though, right?
> 
> Sure, but we shouldn't assume a functional WFxT even if we have HACDBS.
> Just rely on pre-existing kernel infrastructure to do the thing you want
> to.

Got it.

> 
> > I understand the reason in pooling, and even done some workaround in 
> > pooling for getting this to run in the model. 
> > 
> > Based on the previous reply, do you think I should only use polling for 
> > now, and implement the IRQ later?
> 
> Yes.
> 

Will do, then.

Thanks!
Leo


