Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6301C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 02:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51d3Vs8bCC/bsjeJYCv0mA+w3mCSsvHFwGsrj+sCN4E=; b=PME+5Uz69m7U62paPYUtuWRJLj
	uB94OrgS2q86sPoZi6J3mh0HvsQCLmG+sPDA/JxZ7P1YmfGIeBhKPlGKfNgc7h4fx2hg2G5b0DKTd
	pfAPt5DphZAqEfUS4c/PxJay5COSMZjfLE49fFoVd6tu50n8xAnRfxvlJTKAbL36CC/pB19UEm3X6
	/Y9SteqzxumNw6LLtpD+CRia8ukTMboaNeJDGUTLz16JLVF0SlFNvrFix0flZJYptmqpsDSo0IEka
	EYQeEFNQthTUoqB1l+KBUxHWO2V7LKhm+3usi3x5ZAAbjEJ9NxFqAqO6hqXlS0iBAW5cQh3SIpVYd
	F/9YkawA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3lQG-00000007vIr-2hbb;
	Tue, 08 Sep 2026 02:18:56 +0000
Received: from esa5.hc1455-7.c3s2.iphmx.com ([68.232.139.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3lQC-00000007vIS-3S7O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 02:18:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788833937; x=1820369937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H8yu5UWHpf8HMlqYH0d0maZ7HvkrMCdZ8vGMrmgBC44=;
  b=SVz6KMdn9iskIyEcGuuh6LTBEe7iAEWZjkuooGdabmi+/qEu0p81W9Le
   +Spc8Sma81SIPX8C+LFdSnervdi0ZbjFQJEQBlDYQ9LJZLDChRI8/u87V
   xSlFUNILGEjUWzYoZLqITE8iuQE4S8yMIIITgWOw7gnxVOW9/GbOnvSKC
   CQjDON2uIhDNOFUWH92yxhLkeiNdspUJd7+MxlWXEFwf7AftjwEVQh0Eo
   d+UQnuHEzeEo7iuE5qe7NGdJ3Q+OuRsK0XhSiVEn1F/p8KIBgJ1h2z1ES
   gUu8OZmxPkgSZPVJcn5wYnR/wZnyAd8R9ff7vl6J1cmFn21pN6pSw0l72
   g==;
X-CSE-ConnectionGUID: Mf9wL4/LRM+LnQ+AmNQ19w==
X-CSE-MsgGUID: qaaq2PBwQ1SKpNA86JIsRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="252451238"
X-IronPort-AV: E=Sophos;i="6.25,268,1779116400"; 
   d="scan'208";a="252451238"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 11:18:54 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 945F126596
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 02:18:49 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 4173B1C002E6
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 02:18:49 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id BBF27823095;
	Tue,  8 Sep 2026 02:18:43 +0000 (UTC)
Date: Tue, 8 Sep 2026 11:18:40 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takayuki Okamoto <tokamoto@fujitsu.com>
Subject: Re: [PATCH 0/2] 52-bit VA guest mode ID support
Message-ID: <ap9wgBjYEDI-27N1@sm-arm-grace07>
References: <20260826-arm64-52bit-va-v1-0-14ec98211363@fujitsu.com>
 <CA+EHjTwPmwPTMcgQB6zt47Kz6NPMr+FkGfq2Qq+Uxu+G427OEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTwPmwPTMcgQB6zt47Kz6NPMr+FkGfq2Qq+Uxu+G427OEg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_191853_141643_4DF58D82 
X-CRM114-Status: GOOD (  32.05  )
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

Hi Fuad,
On Fri, Sep 04, 2026 at 09:14:36AM +0100, Fuad Tabba wrote:
> On Tue, 25 Aug 2026 at 22:18, Itaru Kitayama <itaru.kitayama@fujitsu.com> wrote:
> >
> > This patch series extends the arm64 KVM selftest framework
> > to support 52-bit guest virtual address (VA) modes in addition to
> > the existing 52-bit physical address (PA) configurations.
> > The motivation is to enable validation of LPA2 guest memory-management
> > behaviour in configurations that use a 52-bit VA space.
> > While the selftest framework already supports testing 52-bit PA
> > configurations, it lacks the ability to exercise guests running with
> > 52-bit virtual addresses, leaving part of the LPA2 functionality untested.
> 
> The series adds three 52-bit VA guest modes, but nothing in tree maps
> a guest VA high enough to use them. The mode-iterating tests map at a
> fixed low GVA, so pgd_index() returns 0 and only the first entry of
> the top level is ever used.
> 
> What do you expect the modes to catch as they stand? The allocators
> already take a minimum GVA, so mapping high in one of those tests
> looks like a small change.

I think at least a 4KB page is allocated for the level -1 translation table, 
and entry 0 is populated with a Table descriptor pointing to the level 0 translation
table. But, no it does not test a nonzero top-level index.

> 
> > To address this, the series introduces new guest modes for 52-bit VA
> > operation, adds five-level page table support where required, and
> > performs runtime detection of host 52-bit VA capability so that
> > LPA2-enabled guest VA tests are executed only on supported systems.
> >
> > Testing:
> >
> > Built and tested on arm64.
> > Verified on QEMU with a V52-capable guest configuration.
> > Confirmed correct operation of high virtual address mappings by
> > exercising guest memory accesses in the 52-bit VA range.
> 
> I could not reproduce "exercising guest memory accesses in the 52-bit
> VA range" with anything in tree either. Could you say which test you
> ran, which guest modes, and on what?

I just in guest_code() of existing one of the kselftests, mapped and 
accessed a page at 1ULL << 49 using virt_pg_map() and on QEMU TCG mode
as I don't currently have access to the machines LPA and LPA2 features.

Thanks,
Itaru.
> 
> Thanks,
> /fuad
> 
> > Signed-off-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> > Reviewed-by: Takayuki Okamoto <tokamoto@fujitsu.com>
> > ---
> > Itaru Kitayama (2):
> >       KVM: selftest: arm64: Support 5-level paging in stage 1 translation table
> >       KVM: selftests: arm64: Add 52-bit VA guest modes
> >
> >  .../selftests/kvm/include/arm64/processor.h        |  2 +
> >  tools/testing/selftests/kvm/include/kvm_util.h     |  3 +
> >  tools/testing/selftests/kvm/lib/arm64/processor.c  | 87 ++++++++++++++++++++--
> >  tools/testing/selftests/kvm/lib/guest_modes.c      |  5 ++
> >  tools/testing/selftests/kvm/lib/kvm_util.c         | 11 +++
> >  5 files changed, 103 insertions(+), 5 deletions(-)
> > ---
> > base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
> > change-id: 20260825-arm64-52bit-va-32f1f4cd050d
> >
> > Best regards,
> > --
> > Itaru Kitayama <itaru.kitayama@fujitsu.com>
> >

