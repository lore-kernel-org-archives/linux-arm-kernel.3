Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2884FC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 14:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NvSyt0Es0oOyf5nqnDpYQVhIX0Hc4JIHt/cczqvyv1c=; b=GXAEmqy+k594j8JIkd2kivQBBN
	pXf3lL9ipoXU9TQx7JR3McQXtAzibCdDDtH6agJ3VYU5CiTFVkYG0DL6v8rrNGqFg+ZOMBEqvcZVM
	scYeUfcsIFiOwZV1F2BZtnWvD3ZrQhyg3S6Dd9aBFexBedMew9CafTy3jTIuenvSFIxMTK+Bnsl/q
	ZxEdQ4sfGhNGTnz/peIoL/2x3nokprM7P3U80ull9C48tsqKGASywsEP+IA96YLA+gItozZEchBAQ
	oo2IoAA+J1LmFp4pmMbj58Q9U11ofBsWYphs116DalLGiAb+m9wBivVghEXMA/XxU56zNbT8Wo+BZ
	bWjimB/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lYX-0000000Esnf-4083;
	Wed, 02 Sep 2026 14:03:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lYV-0000000EsnF-4B9E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 14:03:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64387165C;
	Wed,  2 Sep 2026 07:03:07 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C484E3F882;
	Wed,  2 Sep 2026 07:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788357791; bh=3c0gDYInTZgTimYJJ/kS8+tUIjz/dRXle3zB3JebKzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ly9NPgyNCw3EbKiDZoRLsBgw8+9SW/WmYI6/NYlG5ZxycQjftWVfGO7Up13PJKxJF
	 qkkiLJU52UtKXyd3PwjcWkEYZGv20GxNO5GtvL/3AD7MPL3C0KvF2fglSwN5j+Cm8C
	 rsr64c9rNZi4egaekP0YlZfp7UDKcxM+JV5sCl9c=
Date: Wed, 2 Sep 2026 15:03:07 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: hibernate: dust off the suspend/cleanup rework
Message-ID: <apgsm92KtXA7xh6H@J2N7QTR9R3.cambridge.arm.com>
References: <20260825205839.14571-1-brads@mainlining.org>
 <apgpnjnJ4suhHh-v@J2N7QTR9R3.cambridge.arm.com>
 <B23E199A-2D3D-48B4-A7E9-9664371A7361@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B23E199A-2D3D-48B4-A7E9-9664371A7361@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_070312_399424_B6E5FB5E 
X-CRM114-Status: GOOD (  32.19  )
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

On Wed, Sep 02, 2026 at 02:51:22PM +0100, Bradley Morgan wrote:
> On 2 September 2026 14:50:22 BST, Mark Rutland <mark.rutland@arm.com>
> wrote:
> >On Tue, Aug 25, 2026 at 08:58:32PM +0000, Bradley Morgan wrote:
> >> This comes out of the hibernate resume discussion where Will asked if
> >> the restored kernel's hyp vectors are reinstalled before we come back
> >> from swsusp_arch_suspend() and free the reserved pages. Rather than
> >> answer with a one off fix, this series reworks resume to look like a
> >> resume from idle, which makes the answer fall out on its own.
> >> 
> >> The series leans on Mark Rutland's old work for inspiration, he had the
> >> same end goal in a branch from back then:
> >> 
> >>  
> >https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/suspend/cleanup
> >
> >Most of the series seems to be a rebased of those patches, just with
> >paraphrased commit messages and my S-o-B lines dropped. As commented on
> >patch 4, I do not think that is appropriate.
> 
> Same question as patch 2
> 
> If you want your S-O-B added, ok fine, but yeah.

As on patch 2, please read the documentation before continuing futher.

> Do you think this series itself is good? 

No. At present I think it's in a worse state than it was in my branch,
because portions have changed, with no rationale and no clear benefit.

Hence my ask to Catalin and Will to NOT pick this up for now.

Mark.

> 
> >
> >I'll take a more in-depth look shortly.
> 
> thanks!
> 
> >
> >Catalin, Will, for the moment please do not pick these up.
> >
> >Mark.
> >
> >> The short answer to the question: yes, but only because the rework makes
> >> resume look like a resume from idle. We enter cpu_resume() at the
> >highest
> >> available EL with the MMU off, and the resumed kernel installs its own
> >> hyp stub vectors into VBAR_EL2 through init_kernel_el() before anything
> >> else runs, so by the time swsusp_free() releases the trans_pgd copies
> >> nothing points at them anymore.
> >> 
> >> The series is structured so the first patch stands alone as a stable
> >> worthy fix for the missing hvc arguments. The rest is the cleanup: the
> >> stale init_kernel_el() comment gets corrected, MTE tag pages get freed
> >> after save instead of leaking on failed hibernates, the fragile
> >> _cpu_resume() calling convention gets split, and the last patch reworks
> >> hibernate to use the regular cpu_resume() logic end to end.
> >> 
> >> Everything object compiles and passes checkpatch and sparse. I could not
> >> boot or run a hibernate cycle on real hardware here, so that still wants
> >> doing before anyone gets excited.
> >> 
> >> Bradley Morgan (7):
> >>   arm64: hibernate: pass HVC_SET_VECTORS args to the resume hvc
> >>   arm64: head: correct comment for init_kernel_el()
> >>   arm64: hibernate: free MTE tag pages after saving
> >>   arm64: hibernate: fix _cpu_resume() calling convention
> >>   arm64: hibernate: use dcache_by_myline_op
> >>   arm64: hibernate: only clean to PoC
> >>   arm64: hibernate: use regular cpu_resume() logic
> >> 
> >>  arch/arm64/include/asm/suspend.h  |  1 -
> >>  arch/arm64/kernel/head.S          |  6 +--
> >>  arch/arm64/kernel/hibernate-asm.S | 87 +++++++++++++++++++------------
> >>  arch/arm64/kernel/hibernate.c     | 66 +++++++++++------------
> >>  arch/arm64/kernel/sleep.S         |  6 +--
> >>  5 files changed, 88 insertions(+), 78 deletions(-)
> >> 
> >> -- 
> >> 2.47.3
> 
> --- Thanks!
> https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/

