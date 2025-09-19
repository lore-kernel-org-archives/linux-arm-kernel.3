Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B59CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 11:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgCKzS73fhguDoJC5ilvwvad3ltkmmZunqbH96SoOB4=; b=S09xhFXxmLgyFBLUKPtuYGK55x
	AjuXaCr9sTP7Wk113sDOD1qZM7PRLp9eND2G9gyVdlvB24aLPnc2usWy1NaBqQ9yVwNLJ1ashOWNc
	k8VNW1vkb1/0ZLcspXTEEUf8aRZYBJHeCOFrN+wuhd/a4JBVysDbWY5wy6Wdz+IT4bITmdy85R5/J
	kPA3Xb2HVPCXvQBD2kmFYs4Vvbp/JJTthuEwXw8deLTGhYdnMUkdPoIhit5G24w8RbvXkNpX9N9/T
	Nvjcvag8QwENdN/CYH1n8b7jro8ojrmkmYyKYi4kyhb0nKJFCJSqvCFy2Kmo3Flo9vO10d2C2Iokf
	fKfbJ7Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZ8h-00000002gjn-1mTP;
	Fri, 19 Sep 2025 11:18:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZ8e-00000002gj3-1vn1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 11:18:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D0D3D40BDE;
	Fri, 19 Sep 2025 11:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE8EC4CEF0;
	Fri, 19 Sep 2025 11:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758280731;
	bh=UZelQuKkIqCfwvmqxz+Ypg/ITIv6dYtqvcKMOehN2O0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qThYJbfFEuIuB7UA4hbghbsYSDF4IiBqeV0sEKQ4ze+YlYm7OxBGim8Z/xwJP/i0L
	 u91OxUu3BHcT/HieaHQLEKvhFM9QyRTNZaRFUL2DLTMB8CRxS/XYHJ7scwwjqEmVNb
	 WgHTqbi36Ngc5nYuoz/hg3XM+pC7kA66Wz47477y8SvCKNXmBb8ymC4YreHwbfap/3
	 nM6yr4wqQAkEWI7Y1QTORpsHlC8fVH2CCkaYNZSulA8epOBBLhXScwuvLQdUx9boLM
	 yjzX+y/uKi5OauZ+xFSeAn+CJ7GiDc/pJov5aPnN4eyc7DlD88jiNvkVLsx/C6tz07
	 CNQP2oBG6hkzQ==
Date: Fri, 19 Sep 2025 12:18:45 +0100
From: Will Deacon <will@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Yicong Yang <yangyicong@huawei.com>, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, james.clark@linaro.org,
	robh@kernel.org, anshuman.khandual@arm.com,
	jonathan.cameron@huawei.com, hejunhao3@huawei.com,
	linuxarm@huawei.com, prime.zeng@hisilicon.com, xuwei5@huawei.com,
	wangyushan12@huawei.com, yangyicong@hisilicon.com
Subject: Re: [PATCH v2 2/2] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT
 cores
Message-ID: <aM08FXtLJbiR4ttw@willie-the-truck>
References: <20250820084534.28037-1-yangyicong@huawei.com>
 <20250820084534.28037-3-yangyicong@huawei.com>
 <aMwJ5FpGRmsyhQuZ@willie-the-truck>
 <20250919-tidy-authentic-slug-f325dc@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-tidy-authentic-slug-f325dc@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_041852_519406_54906CF6 
X-CRM114-Status: GOOD (  22.51  )
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

On Fri, Sep 19, 2025 at 10:37:45AM +0100, Sudeep Holla wrote:
> On Thu, Sep 18, 2025 at 02:32:20PM +0100, Will Deacon wrote:
> > On Wed, Aug 20, 2025 at 04:45:34PM +0800, Yicong Yang wrote:
> > > diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
> > > index d72d6e5aa200..daa1af2e8204 100644
> > > --- a/include/linux/arch_topology.h
> > > +++ b/include/linux/arch_topology.h
> > > @@ -89,6 +89,17 @@ void remove_cpu_topology(unsigned int cpuid);
> > >  void reset_cpu_topology(void);
> > >  int parse_acpi_topology(void);
> > >  void freq_inv_set_max_ratio(int cpu, u64 max_rate);
> > > +
> > > +/*
> > > + * Architectures like ARM64 don't have reliable architectural way to get SMT
> > > + * information and depend on the firmware (ACPI/OF) report. Non-SMT core won't
> > > + * initialize thread_id so we can use this to detect the SMT implementation.
> > > + */
> > > +static inline bool topology_core_has_smt(int cpu)
> > > +{
> > > +	return cpu_topology[cpu].thread_id != -1;
> > > +}
> > 
> > Sudeep -- is this ok?
> > 
> 
> Yes, this looks correct as the topology_sibling_cpumask(aka thread_sibling
> mask) changes with hotplug events and may not be desirable. Not sure if we
> can do any better with name in case we need to check for active/online thread
> sibling in the future(I assuming it is for sure not needed here).

Great, thanks for confirming. We're just using this to figure out whether
the hardware implements SMT so I don't think we care about the thread status
at all.

Will

