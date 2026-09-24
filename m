Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D57C98311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 10:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MA/bi1t2NUDEfbYcs7CTGQlubR06QFxpdvCTjkXJYB0=; b=dLIBUBYwd61QhlRUsivpDaAN+a
	isyaTOSjd/6O8Uq98LDkiTFlQGfXxch7aU0LTZnTuuLUfntH+MOtYX9Brfjjtangp4IWHcYGBcV8d
	aAg7VOaKoH/cGzVOLTW+jgy5dyS422vvSH/fc+rzPmUIWVazVJeOH/cEYvV9biFP4RNQXMV6PQEB3
	rVvceRbZPiIJX63xkaSAshui57flzIboens3h4R5ezNgb2DDVSR8V3nZEGxtDbpKOwLH5kOAY5X3K
	vnvj9AcvX8tB85T7P9wghceuRdnBQzZe27U8ZxSeDltRa1YhypUd3xRVxICqY1PsQpi2EVjJE33yR
	i2ylouJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gjZ-0000000Ajnz-2l4z;
	Thu, 24 Sep 2026 10:31:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gjU-0000000Ajn9-1fIj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 10:31:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C571343762;
	Thu, 24 Sep 2026 10:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67E21F000FF;
	Thu, 24 Sep 2026 10:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790245875;
	bh=MA/bi1t2NUDEfbYcs7CTGQlubR06QFxpdvCTjkXJYB0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=afSPn5aYsT/9O16kJmT+fRuGga606uf/lCkifkCmuA4/B+NXmq8/P9wfdV+nsBlLO
	 o85ezyD0+NhAeffoeR525BkLRj5D1pHKuZXyHvdTx8jW8M7UhYF9M+HW/p2yiinPVw
	 yX8hev3vmWa5HyWia35JJ+dHCMEeegan976Lad9KcuzDKd9OZyCf1FMjnGG7Rb6Gb3
	 U+6aAeOM6djD5Mbtj6asaTZrSy8htyG+rS6Duqk5107pHGImZ+PXeuC4kdeY49CrJ7
	 KwJkp/HbdwTyogwTCmYLUnzvLw6Lj/dJVs3VWNOPTso9A7e3Z9eJxGHq34iGYKD6mw
	 DLE6jZzzrLJ5g==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Oleg Keri <okerixx@gmail.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Ananthu C V <ananthu.cv@oss.qualcomm.com>,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v6] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Thu, 24 Sep 2026 11:31:05 +0100
Message-ID: <179024159739.2601842.17914856161102135517.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923125604.2482-1-okerixx@gmail.com>
References: <20260923125604.2482-1-okerixx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 23 Sep 2026 14:56:04 +0200, Oleg Keri wrote:
> arch_freq_get_on_cpu() computes the product of the frequency scale and
> the reference frequency as a u64, but assigns it to an unsigned int
> before shifting it back down:
> 
> 	freq = scale * arch_scale_freq_ref(cpu);
> 	freq >>= SCHED_CAPACITY_SHIFT;
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
      https://git.kernel.org/arm64/c/3872cc6b9294

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

