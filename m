Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD20C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 10:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z97Ttgj+Fu5Ep92j7TvDpp1AKBVMmf8GfmSIWZTeM0c=; b=dyxS6LIAneeAC8Xo0U7ZkTimrI
	gg3CVg7h5mLS5AmYYTjrhK48JRjQ85zJvoDX8K+zrj8BHaIaxwrUlHeTGG2ODSRTIOgAGWh8y2MNZ
	aNpg/M3f5fOcVoauEB4RaJ+46q75N8cF+xILd3VRYylgv4lm49rcKBhd9LhGC6ZuIakpE9dMwy86m
	OucDqOZdr3lfkvgtiEj/MGlGTlvoS3bpghPnldraPa7TL3N8SypU+cU6KjGK/Ppar5UedogAn7jcA
	Ar1/aTQKSd52LmRP5KWFY76KP+0ceodijUfP6iAb+uCbl2b6fTWz0ZKhENvtejbZb0vsHxsrLeNQe
	JoXYJr+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHgiV-0000000FU4F-30SA;
	Wed, 21 May 2025 10:30:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHgdt-0000000FS3T-1sd1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 10:25:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 95D415C5572;
	Wed, 21 May 2025 10:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C87C4CEE4;
	Wed, 21 May 2025 10:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747823143;
	bh=2rnn78Rg+0MJvcpNO0QmApgpbowTQNaRIFKgkHlV634=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HmBQZUyhvpsh3EvDn3MzLqKaHntr0CCNTEDv7alMsao7no5ZyKQi2ZZNaO92GzaqE
	 mSiMYAn6JjPfyMcvVuf0KAlwYfV7oeCklVCdqZzLh2XLH5w77I/dPvKIqrbCF4W0QH
	 dWn0Y+OxNRuq+BJ3xzO7VyvUaBXonXl5ZJ8gigkaUlJ4PBdzLRlTPbvjHRLwM8jOTy
	 aX2TT04tGejpPcx48bblp314iCgjs8Df7RjonT2su4TcB5cxJ1t8dj6bQDAkvZuOlB
	 gx+8zihzIni8NPXS/dFAOkgOYOwVpaB8Hx3sFBuqTNMRQQOtJglesXM9aQhNaIi/er
	 6Y6NTigmcHtjw==
Date: Wed, 21 May 2025 11:25:37 +0100
From: Will Deacon <will@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Leo Yan <leo.yan@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
	Dave Martin <Dave.Martin@arm.com>
Subject: Re: [PATCH v22 2/5] arm64: el2_setup.h: Make __init_el2_fgt labels
 consistent, again
Message-ID: <20250521102536.GB20245@willie-the-truck>
References: <20250520-arm-brbe-v19-v22-0-c1ddde38e7f8@kernel.org>
 <20250520-arm-brbe-v19-v22-2-c1ddde38e7f8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-arm-brbe-v19-v22-2-c1ddde38e7f8@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_032545_526665_16B72EFD 
X-CRM114-Status: GOOD (  14.71  )
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

On Tue, May 20, 2025 at 05:27:37PM -0500, Rob Herring (Arm) wrote:
> From: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> Commit 5b39db6037e7 ("arm64: el2_setup.h: Rename some labels to be more
> diff-friendly") reworked the labels in __init_el2_fgt to say what's
> skipped rather than what the target location is. The exception was
> "set_fgt_" which is where registers are written. In reviewing the BRBE
> additions, Will suggested "set_debug_fgt_" where HDFGxTR_EL2 are
> written. Doing that would partially revert commit 5b39db6037e7 undoing
> the goal of minimizing additions here, but it would follow the
> convention for labels where registers are written.
> 
> So let's do both. Branches that skip something go to a "skip" label and
> places that set registers have a "set" label. This results in some
> double labels, but it makes things entirely consistent.
> 
> While we're here, the SME skip label was incorrectly named, so fix it.
> 
> Reported-by: Will Deacon <will@kernel.org>
> Cc: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> This one can be applied even if the rest of the series is not.

Cheers, Rob. I'll grab this one.

Will

