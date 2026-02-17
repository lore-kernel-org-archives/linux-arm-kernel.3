Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E8FE909A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPdQK8aFVRc+xMp3PHP6ybCoxuLM+Y94zWWJfZrxaZ0=; b=ua0X1cP9Q52wJwtxrj7zzEUWkJ
	skbyoRu87B0MAjFH+R154SYxTLlSSDILlkQON64JVFD7V2AVsDVxsPwARISe2gCLo+7Yd2AAlYu2I
	QCVwoFR9fDuAFycVRXHNhjtj6gOb28h3vFtVupw3LD7oUzvJpH0VG9XudYLiNcalTVVYlo2c7pjvt
	lAjCToClfh2/rFptzDqjBpHMPnNLoRFQ4fiUFg8jU83m3ieh1hJkOdFCRgrZijFqhhmdJqfdVzMAF
	12s7O/pwEdiq5lIY6lmJo5vDq0HLWimd8fYw/c5DCPSScEsamUl+FmJeO8kbbgxLy2QqQt6M2H+7w
	1R1vlgjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLW7-00000008MgL-1SRD;
	Tue, 17 Feb 2026 13:53:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLW4-00000008Mfu-2kAJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:53:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 823D51477;
	Tue, 17 Feb 2026 05:53:18 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E642F3F632;
	Tue, 17 Feb 2026 05:53:22 -0800 (PST)
Date: Tue, 17 Feb 2026 13:53:19 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dev Jain <dev.jain@arm.com>
Cc: Will Deacon <will@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, maz@kernel.org
Subject: Re: [PATCH] arm64: remove HAVE_CMPXCHG_LOCAL
Message-ID: <aZRyzy0SJ8uF3K2J@arm.com>
References: <20260215033944.16374-1-jszhang@kernel.org>
 <aZL46z1UZkQlF3Dd@willie-the-truck>
 <89606308-3c03-4dcf-a89d-479258b710e4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89606308-3c03-4dcf-a89d-479258b710e4@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_055328_735359_5D2E4057 
X-CRM114-Status: GOOD (  19.71  )
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

On Mon, Feb 16, 2026 at 08:59:17PM +0530, Dev Jain wrote:
> On 16/02/26 4:30 pm, Will Deacon wrote:
> > On Sun, Feb 15, 2026 at 11:39:44AM +0800, Jisheng Zhang wrote:
> >> It turns out the generic disable/enable irq this_cpu_cmpxchg
> >> implementation is faster than LL/SC or lse implementation. Remove
> >> HAVE_CMPXCHG_LOCAL for better performance on arm64.
> >>
> >> Tested on Quad 1.9GHZ CA55 platform:
> >> average mod_node_page_state() cost decreases from 167ns to 103ns
> >> the spawn (30 duration) benchmark in unixbench is improved
> >> from 147494 lps to 150561 lps, improved by 2.1%
> >>
> >> Tested on Quad 2.1GHZ CA73 platform:
> >> average mod_node_page_state() cost decreases from 113ns to 85ns
> >> the spawn (30 duration) benchmark in unixbench is improved
> >> from 209844 lps to 212581 lps, improved by 1.3%
> >>
> >> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> >> ---
> >>  arch/arm64/Kconfig              |  1 -
> >>  arch/arm64/include/asm/percpu.h | 24 ------------------------
> >>  2 files changed, 25 deletions(-)
> > That is _entirely_ dependent on the system, so this isn't the right
> > approach. I also don't think it's something we particularly want to
> > micro-optimise to accomodate systems that suck at atomics.
> 
> Hi Will,
> 
> As I mention in the other email, the suspect is not the atomics, but
> preempt_disable(). On Apple M3, the regression reported in [1] resolves
> by removing preempt_disable/enable in _pcp_protect_return. To prove
> this another way, I disabled CONFIG_ARM64_HAS_LSE_ATOMICS and the
> regression worsened, indicating that at least on Apple M3 the
> atomics are faster.

Then why don't we replace the preempt disabling with local_irq_save()
in the arm64 code and still use the LSE atomics?

IIUC (lots of macro indirection), the generic cmpxchg is not atomic, so
another CPU is allowed to mess this up if it accesses current CPU's
variable via per_cpu_ptr().

-- 
Catalin

