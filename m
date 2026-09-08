Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18910C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLEips4KfSJXb5s3FUs84upKlGbSPunK1E6eX4MhLIM=; b=R7u15Mc9v+iOZK1nkeXSMz+MhU
	rZFaxIrCUYIl+mT+Zlw0cfT9d2uAz4na5CWLLWakoYJKIUWSjTRbdQ2bNAH5r6X1BoUVEFQNINIvm
	w2Y9ITGP+4BNS94IUBaHueZ3K2wd1cR9jAkUnxn/DekY+PdRJI+oXG7U2QGGuzBlCUjGeA7gm8cj9
	5xUkaCyHzgRyB4wBykKXHPp5OWPvt7pxCW/1cS5758NsAK0rZljllfCRY/vq0Gc+Xhsh3/oGZ/8TB
	as1Zytu3Ba2FgkYInzoIfXgobO1xBLURskIxop3umCxorMp5+zXaolwM6YRsIGm+QUNeeLAfWoxOu
	80ZGGB1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qgN-00000008K9p-0jBf;
	Tue, 08 Sep 2026 07:55:55 +0000
Received: from out-105.mta0.migadu.com ([2001:41d0:1004:224b::69] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qgK-00000008K8Y-3m5o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 07:55:54 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=r4hdO+l1tHybJlhIhjw+zD0e2eT2sYv8x5tSfI6vj+8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788854148; v=1; x=1789458948;
 b=H65+t3zdyFsjaVqT1z3rHIrKrBGXyVsIr1mi6jj9FhCbe/FZCzRewCJWJ3XEgFrRxBX66Mq9
 WDE1NIeoiQJBF7LbZhuPv8J7hWc7B4xhzGaTBpEEDwm4nJfilShPhiijYqI43keGqj47WJMaC2O
 zt2D4yhVWpm/tfYSprdJ1C4A=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b1e2b4b9e02ff406;
	Tue, 08 Sep 2026 07:55:48 +0000
X-Mizu-Trace-ID: b1e2b4b9e02ff406
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so14172e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 00:55:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzdxY5hGGGlDXYtcRp2w1HHE+C0fuyW0iFfvJdzb2uMLGWDwmdXK/M5a82aoTPKwRt77ZhSKq1CKYSq/SpOlRWm@lists.infradead.org
X-Gm-Message-State: AFuF++kkcGBg4UnEEiMO5NGmWjUYbOpPanzA2KiErGOajJdim0Ch86MY
	QCjEOzssOgZTdckcr7j8AAILII+AhYgeO5+AthRVXX9EBUZSL4PgvsCGUqzm5RT3Tp28SQi5xPg
	DGIzuu4OH2+/0ly3JzUwkgzt12pAxoRywAwRIhacl
X-Received: by 2002:a05:6512:3185:b0:5b6:19c6:a91b with SMTP id
 2adb3069b0e04-5b74d1e0c5bmr294833e87.14.1788854142874; Tue, 08 Sep 2026
 00:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260826-arm64-52bit-va-v1-0-14ec98211363@fujitsu.com>
 <CA+EHjTwPmwPTMcgQB6zt47Kz6NPMr+FkGfq2Qq+Uxu+G427OEg@mail.gmail.com> <ap9wgBjYEDI-27N1@sm-arm-grace07>
In-Reply-To: <ap9wgBjYEDI-27N1@sm-arm-grace07>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 8 Sep 2026 08:55:06 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxy3vURKpjmcX86T+coXZN7sCfW=5L4TM3GH30xuz+zPA@mail.gmail.com>
X-Gm-Features: AcwNN1UPBjEuQQThxfaCHXl31wDDjpU8d24LqbsGJMyA-76vtr69g4waCdr9dow
Message-ID: <CA+EHjTxy3vURKpjmcX86T+coXZN7sCfW=5L4TM3GH30xuz+zPA@mail.gmail.com>
Subject: Re: [PATCH 0/2] 52-bit VA guest mode ID support
To: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Takayuki Okamoto <tokamoto@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_005553_078491_4E959C79 
X-CRM114-Status: GOOD (  36.32  )
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

Hi Itaru,

On Tue, 8 Sept 2026 at 03:18, Itaru Kitayama <itaru.kitayama@fujitsu.com> wrote:
>
> Hi Fuad,
> On Fri, Sep 04, 2026 at 09:14:36AM +0100, Fuad Tabba wrote:
> > On Tue, 25 Aug 2026 at 22:18, Itaru Kitayama <itaru.kitayama@fujitsu.com> wrote:
> > >
> > > This patch series extends the arm64 KVM selftest framework
> > > to support 52-bit guest virtual address (VA) modes in addition to
> > > the existing 52-bit physical address (PA) configurations.
> > > The motivation is to enable validation of LPA2 guest memory-management
> > > behaviour in configurations that use a 52-bit VA space.
> > > While the selftest framework already supports testing 52-bit PA
> > > configurations, it lacks the ability to exercise guests running with
> > > 52-bit virtual addresses, leaving part of the LPA2 functionality untested.
> >
> > The series adds three 52-bit VA guest modes, but nothing in tree maps
> > a guest VA high enough to use them. The mode-iterating tests map at a
> > fixed low GVA, so pgd_index() returns 0 and only the first entry of
> > the top level is ever used.
> >
> > What do you expect the modes to catch as they stand? The allocators
> > already take a minimum GVA, so mapping high in one of those tests
> > looks like a small change.
>
> I think at least a 4KB page is allocated for the level -1 translation table,
> and entry 0 is populated with a Table descriptor pointing to the level 0 translation
> table. But, no it does not test a nonzero top-level index.

Right, that's the gap. Every mode-iterating test maps at a fixed low
GVA (0xc0000000), so the new modes only ever fill entry 0 of the top
table. If the series adds the modes, it should add a test that drives
a VA into the 52-bit range.

> >
> > > To address this, the series introduces new guest modes for 52-bit VA
> > > operation, adds five-level page table support where required, and
> > > performs runtime detection of host 52-bit VA capability so that
> > > LPA2-enabled guest VA tests are executed only on supported systems.
> > >
> > > Testing:
> > >
> > > Built and tested on arm64.
> > > Verified on QEMU with a V52-capable guest configuration.
> > > Confirmed correct operation of high virtual address mappings by
> > > exercising guest memory accesses in the 52-bit VA range.
> >
> > I could not reproduce "exercising guest memory accesses in the 52-bit
> > VA range" with anything in tree either. Could you say which test you
> > ran, which guest modes, and on what?
>
> I just in guest_code() of existing one of the kselftests, mapped and
> accessed a page at 1ULL << 49 using virt_pg_map() and on QEMU TCG mode
> as I don't currently have access to the machines LPA and LPA2 features.

That test is what the series needs, and you've already written it.
Folding a mode-iterating version in tree would exercise the modes and
make the cover letter's "52-bit VA range" line reproducible. It runs
under TCG, so no LPA2 hardware needed.

Cheers,
/fuad

> Thanks,
> Itaru.
> >
> > Thanks,
> > /fuad
> >
> > > Signed-off-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> > > Reviewed-by: Takayuki Okamoto <tokamoto@fujitsu.com>
> > > ---
> > > Itaru Kitayama (2):
> > >       KVM: selftest: arm64: Support 5-level paging in stage 1 translation table
> > >       KVM: selftests: arm64: Add 52-bit VA guest modes
> > >
> > >  .../selftests/kvm/include/arm64/processor.h        |  2 +
> > >  tools/testing/selftests/kvm/include/kvm_util.h     |  3 +
> > >  tools/testing/selftests/kvm/lib/arm64/processor.c  | 87 ++++++++++++++++++++--
> > >  tools/testing/selftests/kvm/lib/guest_modes.c      |  5 ++
> > >  tools/testing/selftests/kvm/lib/kvm_util.c         | 11 +++
> > >  5 files changed, 103 insertions(+), 5 deletions(-)
> > > ---
> > > base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
> > > change-id: 20260825-arm64-52bit-va-32f1f4cd050d
> > >
> > > Best regards,
> > > --
> > > Itaru Kitayama <itaru.kitayama@fujitsu.com>
> > >

