Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747AFC98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIuvqv0gWX9lmLDa5yBU8l2GUJuKcVEbl5tzurIBVJ0=; b=fPVjGkVfYNw/3YQHWBPozOr2X7
	kWZsj9oNGzlZMjAosYgM81UdtApgyIIay2hh43L6yMCiYk5/oOeXq9YstY6XSWi30TYCckXWpJS6e
	ONAmqk4/dKlSVhvnrtEWyOfVdjmwhpxz+Sv+WTydNCDRBK5FU4Q3ONQKrb0PmTUVrrAoNkmMTdXvq
	BSfjFtAZ+NiJ5kUfanRc+RpHJ2wtF0/E2d8eTLJ0GFyejUvVbckHRWoXbgKe3WPNu/UuPSdno2VsP
	sybjt+GexQho4YedlCck6ejIkgxddM/5DqKZULw7PQbTzO9qNwGX6+BxBKoeFnNdw5hbsECZgeMd2
	a9jdrztA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OG8-00000008aE7-1avt;
	Wed, 23 Sep 2026 14:47:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OG4-00000008aDQ-0tNI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 14:47:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 453C9152B;
	Wed, 23 Sep 2026 07:47:35 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7B9E3F86C;
	Wed, 23 Sep 2026 07:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790174858; bh=MwZgnHPFFGSL49mOgaoJtNsPPKvCGM4K3GZNXUY+5xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DiitupBxbjkThSFpOSKScvVyDKIYwZVZU+IsbhFP/W6+udcJWW9cCrEzhu6dvx6EN
	 p3L9MfIbHQOPCEuSWLgvC3bHkfURsw+BrWtEUB9/1+QHUCVAkYMcMINcaJlsfBSEro
	 2aMOQW8rfqkvqYa2+YZnMF8jexjIVFnZ9e/NewoQ=
Date: Wed, 23 Sep 2026 15:47:34 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Ananthu C V <ananthu.cv@oss.qualcomm.com>, linux-pm@vger.kernel.org
Subject: Re: [PATCH v6] arm64: topology: fix arch_freq_get_on_cpu() overflow
 above 4.19 GHz
Message-ID: <arPmhnU-pkGpaD4-@arm.com>
References: <20260923125604.2482-1-okerixx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923125604.2482-1-okerixx@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_074740_347839_9E5CE078 
X-CRM114-Status: GOOD (  17.06  )
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

On Wed, Sep 23, 2026 at 02:56:04PM +0200, Oleg Keri wrote:
> arch_freq_get_on_cpu() computes the product of the frequency scale and
> the reference frequency as a u64, but assigns it to an unsigned int
> before shifting it back down:
> 
> 	freq = scale * arch_scale_freq_ref(cpu);
> 	freq >>= SCHED_CAPACITY_SHIFT;
> 
> The product is truncated to 32 bits before the shift, so the result
> wraps once arch_scale_freq_ref() exceeds 2^32 / SCHED_CAPACITY_SCALE,
> i.e. 4194304 kHz.
> 
> On a Snapdragon X2 Elite (Glymur) laptop, whose boost OPP is 4723200
> kHz, cpuinfo_avg_freq reports 524283 kHz instead of ~4723200 kHz while
> the CPU demonstrably runs at the boost frequency: a fixed workload
> completes in 1.72 s at the 4723200 kHz OPP versus 2.01 s at 4032000
> kHz, matching the 1.171 frequency ratio.
> 
> Shift the u64 product and narrow only at the return.
> 
> Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
> Changes in v6:
> - Drop the cap_scale() change. As a u64 static inline in a shared
>   header it would cost future 32-bit callers a 64-bit multiply that the
>   macro did not (Will); the truncation is the unsigned int temporary, so
>   drop that and leave kernel/sched untouched. Will's Ack on v5 not
>   carried since the arm64 hunk changed.
> - v5: https://lore.kernel.org/all/20260917182059.2851-1-okerixx@gmail.com/

I assume Dietmar and Will's acks still stand. I can add them from v5
(let me know if you disagree).

-- 
Catalin

