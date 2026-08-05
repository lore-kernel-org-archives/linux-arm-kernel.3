Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7ABEC55822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 09:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzL4TRwsy5qGDqtTUAxjyEDoSW3IpXDX+afbmp5lAf0=; b=maxAm7OOoOLYs/qVissvokjXnM
	D0EsEgvIqPs6b1r2XatSavB3p6XR9sNC6WMhhMEIzuNEuLWoKvH/NwSQL4KFXfoncjyR0NJV8VbX6
	m2PyO4DFbeDNkTbUvViTM3y3sNhP75B6ZKIGKV0Dgt72bHQF+IFp/pFE6iBCvJD9JKR1JsGGQbvWz
	WI7MAv0Q4vyP8v0MBqMynSk5MTqs+3lrFJJ2YXMVDE1dxIk+yKRFOC2TJa8r24qo2QDmibiyW/VqF
	jLjliE6l6YVeFNfY3j6lN5ELb80EyKEqsTC4hClhMgnJ0TPo1MrCXh68zW87xkfAYSDTH+hcqZ0CW
	2lE3s5Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXoA-00000003bYV-1iXC;
	Wed, 05 Aug 2026 09:21:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXo6-00000003bXU-3JTk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 09:21:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C11A9153B;
	Wed,  5 Aug 2026 02:20:54 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1545E3F66F;
	Wed,  5 Aug 2026 02:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785921658; bh=LW9EZgLM/owzJSlQ+NzI5vnyZ9lEG0L/Js2ah2Km9MQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iZT3KwBEAB9OYz13EITRYb/2Da5rPA80Mbw8sMzATWs41jEERnPrdboNZth/UUT3B
	 lt7OE3Gxz64bJLGuOiSnQUXV51OeOGgZZBxg/5frtN39aKC+Uk33lfd2us+HA96vIy
	 ybXM0x18k9qEkKRIomc0dM0G41zjeb9aeh2xiGu4=
Date: Wed, 5 Aug 2026 14:50:55 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v4 6/6] arm64: cpufeature: Detect BBML3 based on
 ID_AA64MMFR2_EL1.BBM
Message-ID: <anMAdzxG4HeKPq0L@a079125.arm.com>
References: <20260723044034.2983651-1-linu.cherian@arm.com>
 <20260723044034.2983651-7-linu.cherian@arm.com>
 <amy7kPXnaPHmWMwc@google.com>
 <anAQYj0ZJkrjZSn2@a079125.arm.com>
 <anHuYDo5TIa-s7L8@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anHuYDo5TIa-s7L8@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_022103_003636_585BF779 
X-CRM114-Status: GOOD (  29.46  )
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

On Tue, Aug 04, 2026 at 02:51:28PM +0100, Will Deacon wrote:
> On Mon, Aug 03, 2026 at 09:22:02AM +0530, Linu Cherian wrote:
> > Hi Will,
> > 
> > On Fri, Jul 31, 2026 at 04:13:20PM +0100, Will Deacon wrote:
> > > On Thu, Jul 23, 2026 at 10:10:33AM +0530, Linu Cherian wrote:
> > > > Add ID_AA64MMFR2_EL1.BBM based BBML3 feature detection in
> > > > cpu_supports_bbml3() so that cpus with the feature would
> > > > not have to be added into MIDR based supports_bbml3_list.
> > > > 
> > > > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > > > Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > > > Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> > > > ---
> > > >  arch/arm64/kernel/cpufeature.c | 17 +++++++++--------
> > > >  1 file changed, 9 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > > > index 896bafdb00b1..dbd7d187520c 100644
> > > > --- a/arch/arm64/kernel/cpufeature.c
> > > > +++ b/arch/arm64/kernel/cpufeature.c
> > > > @@ -2133,6 +2133,12 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
> > > >  
> > > >  bool cpu_supports_bbml3(void)
> > > >  {
> > > > +	u64 mmfr2;
> > > > +
> > > > +	mmfr2 = __read_sysreg_by_encoding(SYS_ID_AA64MMFR2_EL1);
> > > > +	if (SYS_FIELD_GET(ID_AA64MMFR2_EL1, BBM, mmfr2) >= ID_AA64MMFR2_EL1_BBM_3)
> > > > +		return true;
> > > 
> > > This is a bit of a nit, but I think it would be more consistent to use
> > > has_cpuid_feature() here instead of __read_sysreg_by_encoding(), similarly
> > > to how we handle kpti in unmap_kernel_at_el0() (which also has both an
> > > ID register field and a list of MIDRs).
> > 
> > force_pte_mapping required by map_mem(during early boot) needs
> > cpu_supports_bbml3 check and cpu features/capabilities are not 
> > initialized by that time. Should i add a comment there to clarify this ?
> 
> It looks to me like has_cpuid_feature() will call
> __read_sysreg_by_encoding() under the hood for SCOPE_LOCAL_CPU.
> 
> What am I missing?

Below is my understanding. Correct me if i am wrong.
has_cpuid_feature depends on struct arm64_cpu_capabilities *entry.
Inorder to derive *entry from a capability ID, cpucap_ptrs should be
in initialized state and that wont be the case when force_pte_mapping
invokes cpu_supports_bbml3. 


  
> 
> Will

