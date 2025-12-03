Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CD4D1266D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 03:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5Da1hFKP6t1mpI82lHD7hcCa172UDvRJ1C2h5SZUKM=; b=l+DQeQ8/KbF1NeJ+kldkmXa9/M
	FZU0Qb+dV9ySzL8F+fVP8iPgS8hgIQHoq7AlguKr2QIfLfWdPSl4wWgOS/ld/ya5jdJ4L89G7yinS
	S9lp9a+eEjwmeeVx/itgSN1gci9rkQvpjsU38mLaC/qIU7W2lxd1cGralQys9yInKoxwT7ANqnqW1
	7j4IV7D16mufhndOc2ytLjdGljlIm4uzMmrLvdvb+6lgNKJSq2zsJBYwb0Y46pdmoJIRgVfSRSjLN
	I7vndFo98pwATD+P+O4hFvXP+mUPOiKXftAvuLZjk/VzJl6RJYorFEC14OjypBXlBgyWPpIlGTru1
	UU1vFagw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQdKS-0000000643l-122A;
	Wed, 03 Dec 2025 03:14:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQdKO-0000000643M-49I0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 03:14:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E4D324433D;
	Wed,  3 Dec 2025 03:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08E0C4CEFB;
	Wed,  3 Dec 2025 03:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764731691;
	bh=GKQ2ak6q4t30pRCw2QUUMC0EJMIeKYrUpbmi3ltyMUg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gQw426jpYHGM+OrO4B9Obv5z5mpF/ZLR2p2VvXN4gCJtLKsfH4DjswjJmiGiXKfNz
	 c0z6P2HBEnVO9GH84Y1vqmDm9/dImwuQ1fWGIWvgLcymKUA8WxH8ipV/uXeCfKAFPi
	 QaATm3Jto+MUGoyJus20+qkqd6xU4Zl8vRp/1AMfvCsgP/bRSQmKcrC0/dHZU2/x1Z
	 V6NZNt2KXlYohVBbJa+FUGuqyKllj8ZssrK61/4EHBUbfhEehbqn7sD1hSxRAkgSpO
	 lf9e+uWQTSKXcEK0yOWjTQMBJtLKymRhKZCGa697e5Fmu5pdzPfGk5jvXmOQP5oNXr
	 j2nkcdAaPh6nA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B8C53A72A63;
	Wed,  3 Dec 2025 03:11:52 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 FPSIMD buffer on-stack for 6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251130030105.GF12664@sol>
References: <20251130030105.GF12664@sol>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251130030105.GF12664@sol>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/fpsimd-on-stack-for-linus
X-PR-Tracked-Commit-Id: 5dc8d277520be6f0be11f36712e557167b3964c8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f617d24606553159a271f43e36d1c71a4c317e48
Message-Id: <176473151071.3498170.16297964704270989529.pr-tracker-bot@kernel.org>
Date: Wed, 03 Dec 2025 03:11:50 +0000
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Herbert Xu <herbert@gondor.apana.org.au>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jonathan Cameron <jonathan.cameron@huawei.com>, Kees Cook <kees@kernel.org>, Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, Mark Brown <broonie@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_191453_071291_7DD3B4EB 
X-CRM114-Status: UNSURE (   5.90  )
X-CRM114-Notice: Please train this message.
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

The pull request you sent on Sat, 29 Nov 2025 19:01:05 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/fpsimd-on-stack-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f617d24606553159a271f43e36d1c71a4c317e48

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

