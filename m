Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D45C44533
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67BzBNBDc8egyWVQGOy5lY0o2p3n2eZbN7MU17stYSo=; b=1ltl3vZQ1WTvugLBQsUerwbh3a
	yze/4Stv3L0kvDgbbu8C3GLbIVOPHi8+maWvdI7MCBBWNZE7zM2Y/X3toa5oigOFj52kwTJ/AV7H1
	Dm7YGflYGySwORjsi5ysUQiIpEMBpteuyvJtjedOeXJvnwyMvVSH27KLpAF5ZXmVogT1vgLGvLXc6
	/E/rvQtw2Y1yTSCMg0dynavalfZJFlrvnXH/A0SHb2PH+QGeivAYTvz8eBV/YbVI8Qf1Cr4jq2Rqk
	DyQ9bflwcF4IjZ0NfmYgFV+FTUT6yEoRIsE+R8jPh5tVC0LSYAd9vf5ZnEnq8L2XwlDueFnXBKpfE
	Rf4TYQUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSFr-0000000BEnH-1ub3;
	Wed, 22 Jul 2026 08:24:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSEz-0000000BEZy-3j0p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 08:23:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 56DC860A67;
	Wed, 22 Jul 2026 08:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5181F00A3D;
	Wed, 22 Jul 2026 08:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784708625;
	bh=67BzBNBDc8egyWVQGOy5lY0o2p3n2eZbN7MU17stYSo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YMoitEv/xjOw0L/srpxnfWpmgF4b7JfsA4AdI5oiZCLLJYKkF+lOLOp+KuhRJKlnO
	 APjmzl5IAFFe3weSZoSy2aTBoQ4rVtuH0lmpLX6sOHa1f2LCuQFb+WRMRV9X0PYC+H
	 jPpLcZeWw7U13EPxzeQGw7g9i8MA6N44kn5mHy80arKQztzqwYibZ4OhIjwq/Jg48Q
	 BNJfivXGryHgJXrnF36WI2AeyKj8gPlvo/FxIwdEjTqCM814LNJo7rVo62CYVBFTZ2
	 6u8k7E3fIWT1OdT434+r12tRisLMfX0MJ4ol2qmvXW1jVGg/4k3MPhXI1N7irG3sfr
	 1BHUi2hTekdHQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mostafa Saleh <smostafa@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	maz@kernel.org,
	aneesh.kumar@kernel.org
Subject: Re: [PATCH 0/3] arm64/coco: Convert pKVM to a CC platform
Date: Wed, 22 Jul 2026 09:23:24 +0100
Message-ID: <178467286876.125042.12010461715645610054.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603110522.3331819-1-smostafa@google.com>
References: <20260603110522.3331819-1-smostafa@google.com>
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

On Wed, 03 Jun 2026 11:05:19 +0000, Mostafa Saleh wrote:
> The goal of series is to convert pKVM as a CC platform similar to
> ARM CCA, that makes CC guests consistently discovered which avoid
> breaking it by the ongoing DMA rework [1]
> 
> The first patch is a minor clean up I noticed while reading the code.
> 
> And the second patch is a bug fix found by Sashiko.
> 
> [...]

Applied to arm64 (for-next/coco), thanks!

[1/3] arm64/mm: Simplify SWIOTLB setup in arch_mm_preinit()
      https://git.kernel.org/arm64/c/442d366cc1aa
[3/3] arm64/coco: Add pKVM as a CC platform
      https://git.kernel.org/arm64/c/e62decaf98e7

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

