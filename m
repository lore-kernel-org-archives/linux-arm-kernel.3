Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71887CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 10:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gD9AqsIFxepi3Y3Vdb9zGgJLM3m39B+eHGmGxmQIR0=; b=QahRSovRB8ke2CVz81CURf5Gki
	xJhqKbA/E7ZxpmkVE+xTVdjS9Wn8NXBDggGcfYtxf3/j9RAyZge+yfuCNKt8qVUKKZQ+V9hEBSFI4
	6rRhJmpfYw731cukaWJ/Z1WaaIQ9ISpvNsJzhYqj96mcX3lR0rlhpfEl8A2Bh5PI/7iKiWjrFM4ZS
	R9RCpLPGwrdZAM3rdtK4vEWQ2JmglJvjYDvF5wMn/Nc7xYLPxO06EZSZxmjZ0lKDmpCJRLex5/aQI
	E6O25wDtb9Ly103+yrrnUTzA9Fy+niRt1rpMHPMs6jMX+vRhjAnLLbMEK5qzY522ZLz0WZG5XzABl
	zGWzJSKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7NZ-0000000AxOq-1TdK;
	Thu, 04 Sep 2025 10:39:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu6In-0000000AZlY-1icb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 09:30:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FFEA1756;
	Thu,  4 Sep 2025 02:30:34 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6294D3F6A8;
	Thu,  4 Sep 2025 02:30:41 -0700 (PDT)
Date: Thu, 4 Sep 2025 10:30:38 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org
Subject: Re: [PATCH v2 1/2] KVM: arm64: VHE: Initialize PMSCR_EL1
Message-ID: <aLlcPoBLA09mtGg3@raptor>
References: <20250902130833.338216-1-alexandru.elisei@arm.com>
 <20250902130833.338216-2-alexandru.elisei@arm.com>
 <aLk3xLd8ylxP63hH@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLk3xLd8ylxP63hH@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_023045_489592_3552B96C 
X-CRM114-Status: GOOD (  18.99  )
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

Hi Oliver,

On Wed, Sep 03, 2025 at 11:55:00PM -0700, Oliver Upton wrote:
> On Tue, Sep 02, 2025 at 02:08:32PM +0100, Alexandru Elisei wrote:
> > diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
> > index 381382c19fe4..e7ce0d5a622d 100644
> > --- a/arch/arm64/kvm/debug.c
> > +++ b/arch/arm64/kvm/debug.c
> > @@ -74,13 +74,19 @@ void kvm_init_host_debug_data(void)
> >  	*host_data_ptr(debug_brps) = SYS_FIELD_GET(ID_AA64DFR0_EL1, BRPs, dfr0);
> >  	*host_data_ptr(debug_wrps) = SYS_FIELD_GET(ID_AA64DFR0_EL1, WRPs, dfr0);
> >  
> > +	if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_PMSVer_SHIFT) &&
> > +	    !(read_sysreg_s(SYS_PMBIDR_EL1) & PMBIDR_EL1_P)) {
> > +		if (has_vhe()) {
> > +			/* Clear E{0,1}SPE, which reset to UNKNOWN values. */
> > +			write_sysreg_el1(0, SYS_PMSCR);
> > +		} else {
> > +			host_data_set_flag(HAS_SPE);
> > +		}
> > +	}
> > +
> 
> nit: While this is correct, from a code organization perspective it
> doesn't belong here. The rest of this function is concerned with probing
> hardware state and initializing the corresponding host data.

Yes, you're totally right.

> 
> I prefer Marc's suggestion which could be wrapped up in a function called
> 'kvm_debug_init_vhe()' or similar.

I forgot about Marc's suggestion, my bad. Will do that for the next iteration.

Thanks,
Alex

> 
> Thanks,
> Oliver

