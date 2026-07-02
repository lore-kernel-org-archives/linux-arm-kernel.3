Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB09AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 12:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drkvOwQ3JgEyNang874DEJpH9vFASLmsVzw4BgncP2g=; b=kAfI8vTJuoJolYTz+v0f3ApTDw
	tFRdD5QklEZ0XG0mre4SPvG58BZPRD3zJP3EfnjH3U4JFRsQL1DUp80DjM/Djb6GRD/4fDK7qTtfB
	qm2YmwC6K8cxr2h3gAa6H5zdyQv4qsUwpWssF0Dxaj28umcYuMBd6n7rX6g7VLEeFzhDwBNgPmIWM
	QJLE6IvZC3F17aKhcjffZEUnVS+hnUrSJ7lHLMVNPf053iReyDtqgSOsCrU8W3WpN7eqETQ6abIm/
	ZmvjrKeYIxZxOQRpdWQU8AP+kuLlsTTai12pJ+NfiZ3U9KF+vq0iDO4p3a9Zv3TrZHgzZT1MjEJ/k
	C9lJ0z4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfGzd-00000004Tlx-37LZ;
	Thu, 02 Jul 2026 12:58:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfGzb-00000004TlK-08eJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 12:58:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 279911FCD;
	Thu,  2 Jul 2026 05:58:04 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EDC33F673;
	Thu,  2 Jul 2026 05:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782997088; bh=+weZPQ8xbiXdAnkCtmY4lzmc6ZGmLb9wleIEIaUmlYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1D4OxI4Ci6ZzyqQz7gHIexFtInKuY+B6+kG1mTYiUURgHOGQbN7TXfd/RN7Ifs5W
	 AlDRiiK1pleQRKIi0f33Zf+W/URS6k0IbqUvOqkt/8zwbgIUr5fFjke2FUat8vxnwT
	 zjzn/UUsR8gVLeQqjmgYJpC47V+lDZvBltmV05nk=
Date: Thu, 2 Jul 2026 13:57:59 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v15 10/11] arm64: entry: Convert to generic entry
Message-ID: <akZgV0Y4YAmB43_g@J2N7QTR9R3.cambridge.arm.com>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
 <20260511092103.1974980-11-ruanjinjie@huawei.com>
 <cfa07466-225b-476f-adf9-346bd1377a4d@arm.com>
 <akZa2tE0Gpsyi_TV@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akZa2tE0Gpsyi_TV@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_055811_147121_28CFA1AC 
X-CRM114-Status: GOOD (  24.98  )
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
Cc: peterz@infradead.org, catalin.marinas@arm.com, ldv@strace.io, song@kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>, kees@kernel.org, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, pengcan@kylinos.cn, broonie@kernel.org, luto@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, linusw@kernel.org, oleg@redhat.com, linux-kernel@vger.kernel.org, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn, yeoreum.yun@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jul 02, 2026 at 01:34:34PM +0100, Will Deacon wrote:
> On Wed, Jun 24, 2026 at 04:32:17PM +0100, Ada Couprie Diaz wrote:
> > On 11/05/2026 10:21, Jinjie Ruan wrote:
> > > 3. Architecture-Specific Hooks (asm/entry-common.h):
> > > - Implement arch_ptrace_report_syscall_entry() and _exit() by
> > >    porting the existing arm64 logic to the generic interface.
> > > 
> > > - Add arch_syscall_is_vdso_sigreturn() to asm/syscall.h to
> > >    support Syscall User Dispatch (SUD).
> > Related to the above : I feel this is missing an important information.
> > Given that SUD is only controlled by `CONFIG_GENERIC_ENTRY`,
> > converting to generic entry _requires_ supporting SUD, so we do it here.
> > I think this would be important to mention, as I otherwise felt like this
> > change did not belong in this patch.
> > 
> > General question that follows : does it make sense to require an arch
> > to support Syscall User Dispatch to be able to convert to generic entry ?
> > (I assume not really, given that only `arch_syscall_is_vdso_sigreturn()` is
> > required on the arch side, but I am curious)
> 
> I think SUD should be separated from generic entry. I'm certainly keen
> on the latter for arm64 and far less interested in the former. See this
> series from Gregory:
> 
> https://lore.kernel.org/all/20260627205551.769684-1-gourry@gourry.net/

Agreed.

I see Gregory mentions some security concerns, and I think there are a
number of architecture-specific ABI concerns (e.g. how arm64's SVC
immediate gets handled), so I'm not keen to rush into supporting
SYSCALL_USER_DISPATCH.

I think what we want is:

(1) SYSCALL_USER_DISPATCH depends on GENERIC_ENTRY, as in Gregory's
    series.

(2) SYSCALL_USER_DISPATCH depends on some new
    ARCH_SUPPORTS_SYSCALL_USER_DISPATCH, such that it an architecture
    can implement GENERIC_ENTRY *without* being forced to implement
    SYSCALL_USER_DISPATCH.

(3) For now, we implement GENERIC_ENTRY for arm64 *without*
    ARCH_SUPPORTS_SYSCALL_USER_DISPATCH.

That way, we can focus on the core GENERIC_ENTRY support for arm64, and
address the inevitable fallout of that *before* we have to work through
all the concerns with SYSCALL_USER_DISPATCH.

Mark.

