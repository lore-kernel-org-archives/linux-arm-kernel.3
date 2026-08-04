Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D84C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 13:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5mY/j+OmwUsgyWxYodxrd+PBskI/mrpKfPAo4uWVn0=; b=w8aVw/ndI/2fZqN6mW5oD3Sdj8
	8szPCMp2H3KB0PMoV3loD4AeyDmjoP5XKA6DsAOj+olYiVtl8+T7m6sbkwpq08rTYGSrpP5rlW4I+
	DWoryzvbzsexclsKUJkCoHymmRNovryylDVMG76+2+3FAeNsRBMv2UCRRt1XH/Lexm7llodOn8w5K
	JOU7CIgDdq7JhSUXXHUHJ4jz7W1weZ4c2n7oJAMht0k5lSY4vZHpM16E+CjKLDoVNVK1q4UHBMzIQ
	wnMEwUqYMAG9YQxT+iF0KGvZUZigIQzzsU3VguUFUspRaohOSqH95pjwaISIjQ29DJ8QmdMYbtRCJ
	0Yvnzu6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFYO-00000001yPU-3NYG;
	Tue, 04 Aug 2026 13:51:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFYN-00000001yPO-0sMJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 13:51:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 701E560A78;
	Tue,  4 Aug 2026 13:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331CE1F000E9;
	Tue,  4 Aug 2026 13:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785851494;
	bh=T5mY/j+OmwUsgyWxYodxrd+PBskI/mrpKfPAo4uWVn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iyJ0wXMfaR5dzmHJj3nMatbYEy47gtxGAaQxZ0dRwLBersf0RYRiMqPW6MSONURKp
	 Mx/4+zzzWmZa5b6xuXsAnrkILVzSCXLRsm45N/1dJZzCGCSQFiUtgWwS0QTONjTgRq
	 ho2N9WlXFQkXO0x9Jcu/uCCZ6zuuxv1VGe8YMIzQMtidfMhzn1E/Dgbkvel9NuXwKO
	 KBbEt87ZDXj5HiKUOSJnyrSx3yIY77yvaDVhHvkfXBKvYuspfma+mXANWvbDHc1a9C
	 ZIfl7Q6NTSlNHnNkBSxYDvbp+B7TyySMIpV2rcdGYTHQO8d73xGOGE3ppkkpwypIhG
	 9rfPv3GfZo6bA==
Date: Tue, 4 Aug 2026 14:51:28 +0100
From: Will Deacon <will@kernel.org>
To: Linu Cherian <linu.cherian@arm.com>
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
Message-ID: <anHuYDo5TIa-s7L8@willie-the-truck>
References: <20260723044034.2983651-1-linu.cherian@arm.com>
 <20260723044034.2983651-7-linu.cherian@arm.com>
 <amy7kPXnaPHmWMwc@google.com>
 <anAQYj0ZJkrjZSn2@a079125.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anAQYj0ZJkrjZSn2@a079125.arm.com>
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

On Mon, Aug 03, 2026 at 09:22:02AM +0530, Linu Cherian wrote:
> Hi Will,
> 
> On Fri, Jul 31, 2026 at 04:13:20PM +0100, Will Deacon wrote:
> > On Thu, Jul 23, 2026 at 10:10:33AM +0530, Linu Cherian wrote:
> > > Add ID_AA64MMFR2_EL1.BBM based BBML3 feature detection in
> > > cpu_supports_bbml3() so that cpus with the feature would
> > > not have to be added into MIDR based supports_bbml3_list.
> > > 
> > > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > > Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > > Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> > > ---
> > >  arch/arm64/kernel/cpufeature.c | 17 +++++++++--------
> > >  1 file changed, 9 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > > index 896bafdb00b1..dbd7d187520c 100644
> > > --- a/arch/arm64/kernel/cpufeature.c
> > > +++ b/arch/arm64/kernel/cpufeature.c
> > > @@ -2133,6 +2133,12 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
> > >  
> > >  bool cpu_supports_bbml3(void)
> > >  {
> > > +	u64 mmfr2;
> > > +
> > > +	mmfr2 = __read_sysreg_by_encoding(SYS_ID_AA64MMFR2_EL1);
> > > +	if (SYS_FIELD_GET(ID_AA64MMFR2_EL1, BBM, mmfr2) >= ID_AA64MMFR2_EL1_BBM_3)
> > > +		return true;
> > 
> > This is a bit of a nit, but I think it would be more consistent to use
> > has_cpuid_feature() here instead of __read_sysreg_by_encoding(), similarly
> > to how we handle kpti in unmap_kernel_at_el0() (which also has both an
> > ID register field and a list of MIDRs).
> 
> force_pte_mapping required by map_mem(during early boot) needs
> cpu_supports_bbml3 check and cpu features/capabilities are not 
> initialized by that time. Should i add a comment there to clarify this ?

It looks to me like has_cpuid_feature() will call
__read_sysreg_by_encoding() under the hood for SCOPE_LOCAL_CPU.

What am I missing?

Will

