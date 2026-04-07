Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77200FF5107
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 15:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKBx6bVmWC7VSTX/T2tSGTL9Yi85hovB3fKir/sRBS8=; b=ijteT+y0JZL5tkQUf4lobLJNe/
	LJf1RzXarABO5mWA7+0y2BH+TyGf+Ti+KX8hTQcR+sITGheI0MczXdeIQiPGmSDmtJ6bOsxy9Q0Uc
	VxnMs9EQAB39GI/BU1svJkM1Ql7sn3O/41ABvaQqbv1uVMWv0pVe2kLH/p0zWaHxh40acAmEz6MK2
	3wGszVay6NfqPdCl364ZdTd30xlFgIIPP0e5z5nwrXmRkTSTuZ1R9TQRPHTIdKC2NIJVUjyepzrr4
	eQgAn/jhUcb93An4k9vjiy9gROUcZL2TQOe934i+dvNLgi/dpmY9MYH9IKidJvdkSGSyax76539OW
	zvSDSp2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8HE-00000006h3M-1NnI;
	Tue, 07 Apr 2026 15:23:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8HB-00000006h2n-2HCH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 15:23:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C09181BB2;
	Tue,  7 Apr 2026 08:23:29 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3BC63F7D8;
	Tue,  7 Apr 2026 08:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775575415; bh=S0KhfM4isL6DUfK/OM+IpENXf/XOYoUfgu5TX4otGBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aefdV1zd4eTc7MvgGtSzxJ6u6nyn6CMFJ8DD0XRkLGfrY33iY2FOoNFww6iazNtBn
	 wAhikLlDca2j5pDfe4SJfzH1oEwvG3WfHMJS7FKe4QHJTXCAI4y0AQpcswcWdV1YHG
	 NydN8l/eOnj3UHguIO+FYOOEcR/l3ipZzrQCTm5g=
Date: Tue, 7 Apr 2026 16:23:26 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Andrei Vagin <avagin@google.com>
Cc: Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Cyrill Gorcunov <gorcunov@gmail.com>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, criu@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Chen Ridong <chenridong@huawei.com>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Eric Biederman <ebiederm@xmission.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Michal Koutny <mkoutny@suse.com>,
	Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>,
	Linux API <linux-api@vger.kernel.org>
Subject: Re: [PATCH 1/4] exec: inherit HWCAPs from the parent process
Message-ID: <adUhbk0sKT0ucWhJ@J2N7QTR9R3>
References: <20260323175340.3361311-1-avagin@google.com>
 <20260323175340.3361311-2-avagin@google.com>
 <acGEonF9I6sPA42B@J2N7QTR9R3.cambridge.arm.com>
 <acJnOB-rlyt-3jU4@willie-the-truck>
 <CAEWA0a7iR8YHooqXJfhersV6YhAXGMZDUhib3QQH5XGn=KNowA@mail.gmail.com>
 <acarA3sGKY4Acozw@J2N7QTR9R3.cambridge.arm.com>
 <CAEWA0a7AZiuy1F+0LDxtEtJpdu=zA-RKhPb1wcDMpy2tSMFO5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEWA0a7AZiuy1F+0LDxtEtJpdu=zA-RKhPb1wcDMpy2tSMFO5g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_082337_660750_E5518894 
X-CRM114-Status: GOOD (  37.43  )
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

On Fri, Mar 27, 2026 at 05:21:26PM -0700, Andrei Vagin wrote:
> Hi Mark,
> 
> I understand all these points and they are valid. However, as I
> mentioned, we are not trying to introduce a mechanism that will strictly
> enforce feature sets for every container. While we would like to have
> that functionality, as you and will mentioned, it would require
> substantially more complexity to address, and maintainers would unlikely
> to pick up that complexity. 

The crux of my complaint here is that unless you do that (to some
degree), this is not going to work reliably, even with the constraints
you outline.

Further, I disagree with your proposed solution of pushing more
constraints onto userspace (to also consider HWCAPs as overriding other
mechainsms, etc).

I think that as-is, the approach is flawed.

> Even masking ID registers on a per-container basis would introduce
> extra complexity that could make architecture maintainers unhappy.
> There were a few attempts to introduce container CPUID masking on
> x86_64 in the past.

> In CRIU, we are not aiming to handle every possible workload. Our goal
> is to target workloads where developers are ready to cooperate and
> willing to make adjustments to be C/R compatible. The goal here is to
> provide developers with clear instructions on what they can do to ensure
> their applications are C/R compatible. When I say "workloads", I mean
> this in a broad sense. A container might pack a set of tools with
> different runtimes (Go, Java, libc-based). All these runtimes should
> detect only allowed features.

I do not think that arbitrary applications (and libraries!) should have
to pick up additional constraints that are unnecessary without CRIU,
especially where that goes against deliberate design decisions (e.g.
features in arm64's HINT instruction space, which are designed to be
usable in fast paths WITHOUT needing explicit checks of things like
HWCAPs). Note that those typically *do* have kernel controls.

I think there's a much larger problem space than you anticipate, and
adding an incomplete solution now is just going to introduce a
maintenance burden.

> Returning to the subject of this patchset: this series extends the role
> of hwcaps. With this change, we would establish that hwcaps is the
> "source of truth" for which features an application can safely use. Any
> other features available on the current CPU would not be guaranteed to
> remain available after migration to another machine.
> 
> After this discussion, I found that the current version missed one major
> thing: there should be a signal indicating that hwcaps must be used for
> feature detection. Since we will need to integrate this interface into
> libc, Go, and other runtimes, they definitely should not rely just on
> hwcaps by default, especially in the early stages. This can be solved
> via the prctl command.  Libraries like libc would call
> prctl(PR_USER_HWCAP_ENABLED). If this returns true, the runtime knows
> that only the features explicitly listed in hwcaps should be used.

I do not think we should be pushing that shape of constraint onto
userspace.

> You are right, the controlled feature set will be limited to features
> the kernel knows about. And yes, we would need to report CPU features in
> hwcaps even if the kernel isn't directly involved in handling them.

To be clear, that is not what I am arguing.

As I mentioned before, the way this works on arm64 is that the kernel
only exposes what it is aware of, even in the ID regs accessible to
userspace. We usually *can* hide features, and do that for cases of
mismatched big.LITTLE, virtual machines, etc.

> Honestly, I am not certain if this is the "right" interface for that,
> and I would be happy to consider other ideas. I understand that these
> hwcaps will not work right out of the box, but we need a way to solve
> this problem. Having a centralized API for CPU/kernel feature detection
> seems like the right direction.

I think that for better or worse the approach you are tkaing here simply
does not solve enough of the problem to actually be worthwhile.

> As for signal frame size and extended states like SVE/SME, we aware
> about this problem.  However, it is partly mitigated by the fact that if
> an application does not use some features, those states are not placed
> in the signal frame.

That is not true. The kernel can and will create signal frames for
architectural state that a task might never have touched.

Generally arm64 creates signal frames for features when the feature
*exists*, regardless of whether the task has actively manipulated the
relevant state. For example, on systems with SVE a trivial SVE signal
frame gets created even if a task only uses the FPSIMD registers, and on
systms with SME a TPIDR2 signal frame gets created even if the task has
never read/written TPIDR2.

When restoring, an unrecognised signal frame is treated as invalid, and
we can require that certain signal frames are present.

> In the future, when we construct/reload a signal frame, we could look
> at a process feature set for a process and generate a frame according
> to those features...

When you say 'we' here, are you talking about within the kernel, or
within the userspace C/R mechanism?

Mark.

