Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DCFC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VESX08GqcdU0uoKq9TQaQXwpyil2Dczl9kyP/gaOBOI=; b=HU9gMmTI+TCUKQlyX0HhJ4QAgB
	JrSqBqQxcWANAahKIABrJ5/lMAAFxc3FLYi+I9gExfehSeAY8NZb8hfAzCGQcraAKo4oFxWFjjPgp
	yPOlzA//4T7L7sZUkgU8fZLtZ/xD8yzE6CK1J9coAevkQkoyjMjuYl6iya50pZOso1OeBlr2By0Ur
	Z5aadINUFAcJkpN85qlpUm0hbyY3pxf+hpe6Fn/FcgFYhxisGiwXP3D1mgIGMgl50iBMfyxL5yqS7
	JruXFqIJtD8LsMhdZ8xVxypH6GlvmR+7vAd8Lx6AiM1aLTUzMCSWT3wJyqVAXMSd82qf/53Uy8dZa
	5GIJs+Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lMD-0000000Eqwl-25vC;
	Wed, 02 Sep 2026 13:50:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lMA-0000000Eqvs-2vHZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:50:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B94B165C;
	Wed,  2 Sep 2026 06:50:22 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79F593F673;
	Wed,  2 Sep 2026 06:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788357025; bh=eYWDCMbfsRmoFb3lpIHZkzboZWgEprEJgkKIXTMGNuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BFVEhAtghcCBNiALXEl30jXmOAe7CZqJUzVpKW14WaECNQew8BgJUi41Q3cch7wZ0
	 C29aMGGFe9pVs1I4/cWL+DuYWdPnygUffp/qtWnNyeX27KqfyYta6v8N1PphV3Jqoa
	 admikvk0kkq7eSNRiw8teTvL6ubBIqBt6V4KCH14=
Date: Wed, 2 Sep 2026 14:50:22 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: hibernate: dust off the suspend/cleanup rework
Message-ID: <apgpnjnJ4suhHh-v@J2N7QTR9R3.cambridge.arm.com>
References: <20260825205839.14571-1-brads@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825205839.14571-1-brads@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_065026_823041_5FF2F82E 
X-CRM114-Status: GOOD (  23.48  )
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

On Tue, Aug 25, 2026 at 08:58:32PM +0000, Bradley Morgan wrote:
> This comes out of the hibernate resume discussion where Will asked if
> the restored kernel's hyp vectors are reinstalled before we come back
> from swsusp_arch_suspend() and free the reserved pages. Rather than
> answer with a one off fix, this series reworks resume to look like a
> resume from idle, which makes the answer fall out on its own.
> 
> The series leans on Mark Rutland's old work for inspiration, he had the
> same end goal in a branch from back then:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/suspend/cleanup

Most of the series seems to be a rebased of those patches, just with
paraphrased commit messages and my S-o-B lines dropped. As commented on
patch 4, I do not think that is appropriate.

I'll take a more in-depth look shortly.

Catalin, Will, for the moment please do not pick these up.

Mark.

> The short answer to the question: yes, but only because the rework makes
> resume look like a resume from idle. We enter cpu_resume() at the highest
> available EL with the MMU off, and the resumed kernel installs its own
> hyp stub vectors into VBAR_EL2 through init_kernel_el() before anything
> else runs, so by the time swsusp_free() releases the trans_pgd copies
> nothing points at them anymore.
> 
> The series is structured so the first patch stands alone as a stable
> worthy fix for the missing hvc arguments. The rest is the cleanup: the
> stale init_kernel_el() comment gets corrected, MTE tag pages get freed
> after save instead of leaking on failed hibernates, the fragile
> _cpu_resume() calling convention gets split, and the last patch reworks
> hibernate to use the regular cpu_resume() logic end to end.
> 
> Everything object compiles and passes checkpatch and sparse. I could not
> boot or run a hibernate cycle on real hardware here, so that still wants
> doing before anyone gets excited.
> 
> Bradley Morgan (7):
>   arm64: hibernate: pass HVC_SET_VECTORS args to the resume hvc
>   arm64: head: correct comment for init_kernel_el()
>   arm64: hibernate: free MTE tag pages after saving
>   arm64: hibernate: fix _cpu_resume() calling convention
>   arm64: hibernate: use dcache_by_myline_op
>   arm64: hibernate: only clean to PoC
>   arm64: hibernate: use regular cpu_resume() logic
> 
>  arch/arm64/include/asm/suspend.h  |  1 -
>  arch/arm64/kernel/head.S          |  6 +--
>  arch/arm64/kernel/hibernate-asm.S | 87 +++++++++++++++++++------------
>  arch/arm64/kernel/hibernate.c     | 66 +++++++++++------------
>  arch/arm64/kernel/sleep.S         |  6 +--
>  5 files changed, 88 insertions(+), 78 deletions(-)
> 
> -- 
> 2.47.3

