Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CCECA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 12:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3l5EXnV8dhZCYDK2LVBHPRjROKaeOb5ViilrJhZCEjE=; b=GUNFSQfkeuybfEiJZssQKZsyWW
	f6yCYC7lZyjISB9K1d70NoeK7xUxipKy01scn9pA293ntSwrJP1zu3F+gROQsRuKiW+NQzhuJL3Z6
	Bxa1icA/roJJpm5UEWp62LfNkM/+hiEY2clOJj7TVG1FqzK2lSboTEw8hCZXVFjEfbw2kBHSykn9E
	iyBH2iXadrlCgO+zOuMIJkA6HNhsIbgZTlI8B8BlLJxCleEZgnN4KgYzHs0qHmEYNgnk0Wvtxvmb0
	b0ZVWZ83R2mtTqc7hkI92rFnIDlHUb37Ng5fRuayoK7aT3LSiTP7nVIWlklAvx3j8cYsBKyHNKrD3
	WUPyR/1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmEZ-00000006KKB-3rb5;
	Wed, 03 Sep 2025 12:05:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utl63-000000068xc-1Vnf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 10:52:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C72914BF;
	Wed,  3 Sep 2025 03:52:02 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACADB3F694;
	Wed,  3 Sep 2025 03:52:06 -0700 (PDT)
Date: Wed, 3 Sep 2025 11:52:03 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, anshuman.khandual@arm.com, robh@kernel.org,
	james.morse@arm.com, mark.rutland@arm.com, joey.gouly@arm.com,
	ahmed.genidi@arm.com, kevin.brodsky@arm.com,
	scott@os.amperecomputing.com, mbenes@suse.cz,
	james.clark@linaro.org, frederic@kernel.org, rafael@kernel.org,
	pavel@kernel.org, ryan.roberts@arm.com, suzuki.poulose@arm.com,
	maz@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v4 0/5] initialize SCTRL2_ELx
Message-ID: <aLgd0/7peYBA4z87@e133380.arm.com>
References: <20250821172408.2101870-1-yeoreum.yun@arm.com>
 <aLW5OIgv8/bvvY9E@e133380.arm.com>
 <aLXjVNCbT6YeWlSS@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLXjVNCbT6YeWlSS@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_035211_441980_B96E0E4F 
X-CRM114-Status: GOOD (  30.08  )
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

Hi,

On Mon, Sep 01, 2025 at 07:17:56PM +0100, Yeoreum Yun wrote:
> Hi Dave,
> 
> > On Thu, Aug 21, 2025 at 06:24:03PM +0100, Yeoreum Yun wrote:
> > > This series introduces initial support for the SCTLR2_ELx registers in Linux.
> > > The feature is optional starting from ARMv8.8/ARMv9.3,
> > > and becomes mandatory from ARMv8.9/ARMv9.4.
> > >
> > > Currently, Linux has no strict need to modify SCTLR2_ELx--
> > > at least assuming that firmware initializes
> > > these registers to reasonable defaults.
> > >
> > > However, several upcoming architectural features will require configuring
> > > control bits in these registers.
> > > Notable examples include FEAT_PAuth_LR and FEAT_CPA2.
> >
> > This looks OK to me now, except for one or two minor issues (see
> > replies to the patches).
> >
> > I think we will need a way of testing all the code paths before this
> > should be merged, though.
> >
> > Have you tested all the code paths, or are there some things that have
> > not been tested?
> 
> I've tested for pKVM, nested and nhve and crash path
> (I do my best what can I do for modified path).

Was that just confirming that the kernel boots / does not crash?

What about CPU suspend/resume and hotplug?

My concern is that most of the defined SCTLR2_ELx bits won't affect
kernel execution unless the corresponding hardware features are
actively being used -- so while we know that the patches don't break
the kernel, this may not prove that SCTLR2_ELx is really being
initialised / saved / restored / reset correctly.

> > Since this code is not useful by itself, it may make sense to delay
> > merging it until we have patches for a feature that depends on SCTLR2.
> 
> Whatever I pass this detiermination for maintainer.

Sure, that's just my opinion.

Either way, this doesn't stop anyone from building support for specific
features on top of this series before it gets merged.

Cheers
---Dave

