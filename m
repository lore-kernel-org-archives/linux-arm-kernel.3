Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81CDCC6B27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7km/o15RrE3t/oF+oZWM5/Ow0NTPkXAPHXcErgX/7Q=; b=F331rvk5alOqC+yRuKU6L4lTrP
	01g4ZXNj6avflm+eB6wF1mCXcqtZF0rC34Qc3hWLMR46mk71SLwbBP8nK6531563xSlgCmjI/z1Kw
	MRo9EaOF7FDIQNFWWer0E7GC88FB9VGRgiQ8GMrbAI7XJh86TcXw3X5VRDS0EXvKSOXmUVAHHrxz/
	NLQGmmjF+xDIqlCyUr6u3vPlPEykxZq8FVY+ppnD/wlvsOP/J848BRBnwJxMSxFpOHoS3atwv51dj
	5cdB0VdJzETlM78h7vJYpuWHuFR6mXu5X3LOqNkdSFThfSd6n9KqrHR1zMxzeFLhagXTwIsyt5H92
	K65ellDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGutC-0000000EyIf-2BrT;
	Wed, 14 Oct 2026 09:03:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGutA-0000000EyI5-3EpQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:03:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A34661596;
	Wed, 14 Oct 2026 02:03:04 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 334523F7B4;
	Wed, 14 Oct 2026 02:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791968587; bh=7A05GsuFKMCSCusEHwAE+GYyrPrUSYy7spZfdDk0d+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YoKyykGBv0d5ue1IA9pDqAIBz0IsC4ds1IPAVcDI3VyYRFIpLsbgh+PjOfqESJYLM
	 nKkMwtRvL8O0B3NL+W7trm/B/1/A1l/+YsTkw6Y3cm3AJ6d5wvTe7xoa967irdGd/t
	 ou+P9TNgOMpuhAmmkHefuL9+QewRyRRDClluU2po=
Date: Wed, 14 Oct 2026 10:03:02 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>,
	Leonardo Bras <leo.bras@arm.com>, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v2] arm64: clear_page[s] using memset
Message-ID: <as9FRpnL7851aTVj@arm.com>
References: <20260916-aarch64-clear-pages-c-v2-1-0393769f7912@kernel.org>
 <aqq1sxdQNZ93oV9A@LeoBrasDK>
 <aqq7oZzutLP82WYB@LeoBrasDK>
 <arP619hd9Rx8Vlrx@arm.com>
 <ec298ee5-5080-494d-b735-7ba7bd20cdf0@arm.com>
 <as4sY3Eq-B_59lW9@arm.com>
 <CAD++jLmMoD_FPno2Q47WyWicpRaf8x46YREt0eyUzAXkOU5cFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmMoD_FPno2Q47WyWicpRaf8x46YREt0eyUzAXkOU5cFA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_020308_858697_9A918684 
X-CRM114-Status: GOOD (  19.12  )
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

On Tue, Oct 13, 2026 at 06:28:54PM +0200, Linus Walleij wrote:
> On Tue, Oct 13, 2026 at 3:04 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
> 
> > Trying to make sense of the above. So based on -next of 22nd of
> > September, the table means:
> >
> > vanilla         - next/master on that day (current clear_page())
> > patch           - memset()-based clear_page() patch (Linus's patch)
> > stnp            - vanilla clear_page() without DC ZVA
> > patch_stp       - memset()-based clear_page() patch without DC ZVA
> >
> > I assume the vanilla vs patch columns are just noise. Well, there's a
> > -1.17% regression (not flagged) on Ampere but what's the standard
> > deviation for this column? Similarly for the -1.15% on the AWS patch_stp
> > test (vs stnp in the same test, it's no worse).
> >
> > Vanilla vs stnp shows a regression on Ampere, however that's expected as
> > we no longer do the DC ZVA. Interestingly, the patch_stp result doesn't have
> > this regression, so I reckon DC ZVA behaves mostly in line with STP on
> > this hardware.
> >
> > Basically I was looking for the stnp vs patch_stp results. If I read it
> > correctly, there's no significant change going from non-temporal to
> > temporal stores (and a small improvement for Ampere). Assuming future
> > FEAT_MOPS will have similar behaviour, moving clear_page() to memset()
> > shouldn't cause any regressions. Before FEAT_MOPS, we'll use DC ZVA here
> > anyway.
> 
> That almost sounds like an Acked-by if Usama can confirm your
> assumptions above!

It's queued but we can revert it if it shows real regression.

-- 
Catalin

