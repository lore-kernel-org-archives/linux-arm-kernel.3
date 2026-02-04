Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC08E9538F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 12:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXlj4UhwfaBxYdzzGqEPkXssvB/wRA0onny4ce3eafo=; b=rcHh1XiraxflrXKCY1ik6cfLvm
	Wvp63txH+aMWt/1NWGHZ3hVMO3Qv+rswZ3Hd7zvfDAT3stEmR5quu6jfqCooeL77zv8jAPaIaNVq4
	8boaVT2DOM1kVsRAtvYBl1setuo0+1DXR8wD0qcvSyx3HvHFVA5MULhMDWwv+EIIYplYmRaMSOeb1
	/Hs0lLx+rzgxEXG1AHdP5f22B8Om9AmrRjulJOC+pTFEb1WUZOgcFFCaNtm1YFC34iOFl1mHcO1Bj
	IY+v7yiZxDDjiQMEcaN8YSbQNbbIjJjDYesuQiW02uvrddJ8sQvpeyeBR+AWzXwyGlaH/3tOUlDcZ
	MCSqsz8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnbfj-00000008PWs-2RE1;
	Wed, 04 Feb 2026 12:07:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnbfh-00000008PW2-2EiI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 12:07:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B2AA74448B;
	Wed,  4 Feb 2026 12:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918FCC4CEF7;
	Wed,  4 Feb 2026 12:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770206868;
	bh=Xzsj0E6vrWYH/XkemxWZu7ieGiKYV4GnOsHPNEi3sBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HNoj/8pHDGsxCxIsn8XFJx2+hkYhVd3cwXe67h/uc0eMOwEFO4pmsYh9knCAKu1my
	 QipNfgCJ33OWeh9tXAZX71GrmbJYCRdA2GF+hymnAxE1qUJF/hcWfFGXZ52tVNR0Wf
	 PT9e8Yq7TZ6xoePwmteSN51k28AN/6EQLH4FWBNanrJkae3tNC2klAMTuHztsqFsPW
	 LX3zACkcIgRNkusYR+hZiUV+IMB0IOR0SzhZDVglcOu62ZqhWljWfW53jG4AX5Q5f7
	 AH5+Xi83MFES9ub7BM9jR06ywYojnGO0W0j4jiH+IHwrNHxnkC5lQDEkthuOgyDkAU
	 V7m645f6R0kAQ==
Date: Wed, 4 Feb 2026 12:07:40 +0000
From: Will Deacon <will@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH v12 00/13] arm64: entry: Convert to Generic Entry
Message-ID: <aYM2jM5BMRGdjnt4@willie-the-truck>
References: <20260203133728.848283-1-ruanjinjie@huawei.com>
 <87bji552uk.ffs@tglx>
 <2699bcdc-8d56-7fe9-fa9a-a3d61476e806@huawei.com>
 <87y0l823o9.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y0l823o9.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_040749_613280_E9718A94 
X-CRM114-Status: GOOD (  23.67  )
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
Cc: mark.rutland@arm.com, kees@kernel.org, catalin.marinas@arm.com, ldv@strace.io, song@kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org, kmal@cock.li, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, linux-kernel@vger.kernel.org, kevin.brodsky@arm.com, charlie@rivosinc.com, pengcan@kylinos.cn, broonie@kernel.org, richard.weiyang@gmail.com, dvyukov@google.com, wad@chromium.org, oleg@redhat.com, luto@amacapital.net, liqiang01@kylinos.cn, akpm@linux-foundation.org, reddybalavignesh9979@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Feb 04, 2026 at 11:39:34AM +0100, Thomas Gleixner wrote:
> On Wed, Feb 04 2026 at 09:28, Jinjie Ruan wrote:
> > On 2026/2/3 22:16, Thomas Gleixner wrote:
> >> On Tue, Feb 03 2026 at 21:37, Jinjie Ruan wrote:
> >>> Currently, x86, Riscv, Loongarch use the Generic Entry which makes
> >>> maintainers' work easier and codes more elegant. arm64 has already
> >>> successfully switched to the Generic IRQ Entry in commit
> >>> b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"), it is
> >>> time to completely convert arm64 to Generic Entry.
> >>>
> >>> The goal is to bring arm64 in line with other architectures that already
> >>> use the generic entry infrastructure, reducing duplicated code and
> >>> making it easier to share future changes in entry/exit paths, such as
> >>> "Syscall User Dispatch".
> >>>
> >>> This patch set is rebased on "sched/core". And the performance
> >> 
> >> Why are you using sched/core, which contains a lot of unrelated
> >> changes. core/entry is the one which has the prerequisites and nothing
> >> else....
> >
> > By the way，it looks like core/entry and arm64 for-next/entry have
> > diverged: the first three patches of this series are already in arm64
> > for-next/entry but missing from core/entry.
> > Perhaps the two branches should be reconciled so that both contain the
> > same baseline.
> 
> The first three patches of this series are ARM specific and have nothing
> to do with the queued core/entry changes in tip. They are independent of
> each other and these three ARM64 changes have no business in my tree.
> 
> If the ARM64 folks want to apply the rest of your series then they have
> to pull the core/entry branch into their for-next/core branch first so
> the whole thing builds.
> 
> But given that the merge window opens on sunday, this is probably moot
> anyway and the rest of this series can go on top of rc1 in the ARM64
> tree w/o any further complications.

Yup, the rest of the series (beyond what we've both queued) also needs
some more review so this is all post -rc1 material.

In the meantime, thanks for picking up the generic bits.

Cheers,

Will

