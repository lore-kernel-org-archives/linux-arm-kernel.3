Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2673C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 12:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7C1FpHXQHhaXmJHx/8OCdTfxUT9wAJECfFf7MxmJFok=; b=A243dAyEnBIYdJei1uVIXNAle7
	yVOXnlnkaTtGLBAP7tqFikyiGkMCP8XhBuA0RPKgzqOAUzXf1nWUjnFIKkbaxBM0BaRU0xcM2ZglN
	EozUlQpU3X1Z564iyecFUEIep1BQDxpi4WGYDvZzKDljshHEQogmWWzrffqXp8kB6gyu40NkKl3x9
	U0pEC6A9Dc3Ab1kt7vrWPD++gftOe9twrersIj/blGg63LIX06qWsY8yCF3w8iXb36C/nOFKcluuW
	wHW+YhJgPZJJ2N69Mv5KNflLJw/Tm1HNdj7Ms98mgvM7ruxRt7Zma5k4JcqY1iuamWo5vyQ7YAkI9
	RRVeY4VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrx50-00000005kic-0xpd;
	Thu, 06 Aug 2026 12:20:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrx4z-00000005ki6-0xkr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 12:20:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 779D260A69;
	Thu,  6 Aug 2026 12:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427061F000E9;
	Thu,  6 Aug 2026 12:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786018808;
	bh=7C1FpHXQHhaXmJHx/8OCdTfxUT9wAJECfFf7MxmJFok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gfG3LPxeUPq84Xp2JFwWxR+xz6vWQPO9xA8azlKyQaXXtCueQNjKnnBacy/zVDZrL
	 l5traZsL4ERhfpYjx7Qb7DuwGzVBKWZvoS7u8rKbX2a9NmHWqCqZJLLwBA2c3FUt5O
	 HecAcRZGO7uHXHhjlvEaPT1Nz8oO/w5C64IJz8GIMrxBsuKTPJvdGgSLo4XkOBu1j9
	 +b0ZdUKkwzYUEAtvniztZGUdWmdFB0JPVpRu0kf9VZTSuJKDO/sSu19jQp6xnMyqol
	 WSRDf5gED372yERjG3MA5QbKh9w1yUmGhZutyJvevaA/0kz2W2XDYhZ6wMxrdTI6t5
	 vbsW7qxqelqYA==
Date: Thu, 6 Aug 2026 13:20:02 +0100
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Karl Mehltretter <kmehltretter@gmail.com>, kernel-team@android.com,
	Mark Rutland <mark.rutland@arm.com>,
	Oleg Nesterov <oleg@redhat.com>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64/fpsimd: ptrace: Fix inactive SVE and SSVE
 regsets
Message-ID: <anR78qO5RGalbFNo@willie-the-truck>
References: <20260729004255.15630-1-kmehltretter@gmail.com>
 <178566413306.4141663.7146790540592743319.b4-ty@kernel.org>
 <21702e5c-2dcc-46ad-bffe-26cd76d844b9@sirena.org.uk>
 <anRoiIbOFVjj7qPN@willie-the-truck>
 <be47f939-bc44-46b8-ba38-988403dd87b0@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be47f939-bc44-46b8-ba38-988403dd87b0@sirena.org.uk>
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

On Thu, Aug 06, 2026 at 01:15:25PM +0100, Mark Brown wrote:
> On Thu, Aug 06, 2026 at 11:57:12AM +0100, Will Deacon wrote:
> > On Wed, Aug 05, 2026 at 10:27:18PM +0100, Mark Brown wrote:
> 
> > > As noted in the changelog applying patch 1 as a fix and this only for
> > > -next blows up the fp-ptrace test rather impressively in any
> > > configuration which can generate headers only reports:
> 
> > >    https://lava.sirena.org.uk/scheduler/job/3075737#L3231
> 
> > > for the release.  Both patches really do need to go together.
> 
> > By "blows up" you mean the test fails, right? That's the same behaviour
> > if anybody runs the test on a kernel without the fix. Both patches are
> > merged in for-next/core.
> 
> Right, the test starts reporting 96 fails which doesn't look great in a
> dashboard.  I'd misread the original branch as being merged as a fix but
> I see it's not been merged into the fixes branch, sorry for the
> confusion.

No problem, thank you for running the tests :)

Will

