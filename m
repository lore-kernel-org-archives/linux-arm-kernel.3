Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF593CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 13:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yKagxFKWzwHq81Nn77OQ0wjDRTRxo0jEU1fA7FmOTQ=; b=oQXkx6gbxGC/Gks7Gjm/ooE6G2
	ZJ32cecaOc99KcU81u9BoFX5ewdpPnkCXl8x7ymarbAkwQ4uk5BccK8H5zxh81EJi8WUIztM+nGia
	JuWs8ti/THlynG45B15jAiL5uAW8Dx1VEyYI6liK9Y+v/uQ2hrECisx/umLSbjh4lSubVQtBJTa1c
	8WzcfmZqm0wRqO1dHUTL1V1QmQXslmWZ6KT/tQF5RjV2Oyvy/D2C0UIzazmLbBYnp4GqUJ+uyJ3Mr
	qPsLgq//hoDM7CLQy24uNqgbCoL6LJSXOwRpgJFHBk9lHN9y+NWYVNJIvbvxoXHo/7leRWtpSTAW+
	3/Kr3sTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzJH-0000000FdaQ-2jd8;
	Wed, 14 Oct 2026 13:46:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzJD-0000000FdZP-1Gk1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 13:46:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF5521570;
	Wed, 14 Oct 2026 06:45:59 -0700 (PDT)
Received: from e142392.arm.com (e142392.arm.com [10.2.213.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD86F3F7B4;
	Wed, 14 Oct 2026 06:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791985563; bh=0inB59qaRugPpia4kgYwImiOX1wdChUgdWVEES4jPh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XLyTA9y0OrLaz8C3GXcl3JnMAXQ66bYK5O8u/HZ7Qq+K8glC8UI7jP2OtzZpk0CP1
	 u7MZF0KLvTL8GIu40bmnzu+cMMY5jFKe+rp5d5i1Hdtd1L1CrPM3DKr2YhtJ+og4Hg
	 UakRwqZPw+lMfKHNXkonF6t9U8YDl3l/FfVySdbQ=
Date: Wed, 14 Oct 2026 14:45:52 +0100
From: Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@arm.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-efi@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Linu Cherian <linu.cherian@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [RFC 03/12] KVM: arm64: Hide TLBID from guest sysregs
Message-ID: <t7f3l6ewiyenrvsvh3olhwszis4i4zifue6dvlrpgcry5n5b2q@3z7eminzykqr>
References: <20261001110655.461473-1-kristina.martsenko@arm.com>
 <20261001110655.461473-4-kristina.martsenko@arm.com>
 <20261012081254.483793-A-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261012081254.483793-A-seiden@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_064619_415984_4009C3B8 
X-CRM114-Status: GOOD (  19.08  )
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

On Mon, Oct 12, 2026 at 10:12:54AM +0200, Steffen Eiden wrote:
> On Thu, Oct 01, 2026 at 12:06:46PM +0100, Kristina Martšenko wrote:
> > Don't expose FEAT_TLBID to guests. It wouldn't be useful in the general
> > case since a guest doesn't know which domains exist and its vCPUs can be
> > moved between any physical CPUs.
> > 
> > Try to hide TLBID sysregs and sysreg fields from the guest:
> > 
> >   * Report the feature as not supported in the ID register
> >     ID_AA64MMFR4_EL1.TLBID.
> > 
> >   * Configure the TLBIDIDR_EL1 sysreg to UNDEF via the FGU mechanism.
> >     Sanitize a nested hypervisor's HFGRTR2.nTLBIDIDR.
> > 
> >   * Sanitize a nested hypervisor's HCRX.{VTLBIDEn,VTLBIDOSEn,FNB}.
> > 
> >   * VTLBID{OS}<n>_EL2 registers are VNCR-backed and not exposed to
> >     guests (apart from being able to read/write into the VNCR page) so
> >     no need to handle them in sys_reg_descs or elsewhere.
> > 
> >   * The guest is free to set SCTLR2_EL{1,2}.TLBOSNIS, which shouldn't
> >     matter to KVM.
> >
> 
> What confuse me where a bit that you wrote 'try to hide'.
> For me this indicates that the hiding process may not be successful.
> For me the code looks like it will always succeddin hiding the feature
> from the guest, no? Did I miss anything?

Sorry for the vague wording. You’re right that we always succeed in
hiding the feature. What I meant was that there are some parts of the
feature that we can’t fully hide, because the architecture doesn’t
provide a way to do it.

Accessing a VTLBID register should ideally cause an UNDEF exception
(like on a CPU without TLBID), but guest accesses will go to the VNCR
page instead (which won’t have any effect).

> Same for the next patch.

Executing a TLBIP instruction should also UNDEF, but will succeed. There
is no way to trap it without also trapping TLBI instructions.

Thanks,
Kristina

