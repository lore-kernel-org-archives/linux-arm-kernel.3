Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE69FD9E2D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 03:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wx6we+wCy8GhrX6VAyHLHUHi3j/pfz/1MDDANjYwWt8=; b=IdWFTHJRbje/eDIPX/UfD5sDgI
	ORCgh7TE/rPBWoz9P/KrUtOiRjo2H+U/u/wASH8gdaFtluE6lDVgznHhLWoThkRdH1wti6/RppxpN
	sNn5kKFLpOK2PG22IGw2rOsRYgYt5ouv4wPZr+WZiiHo5GB75SKe3HDUKH3W8T4uRQ07JVaiTqjQ3
	9loDVjRm4cJS0B3Uq7EiDjfjOWJKYKpXFt0VGuzdrgb3s7UYWUnJPhO/0s1d+TLelI6rvBRSKP4tU
	ifHn4Wdosg9+0+Jz0EV93yhw545loSu2T8IpXjlpdarjCzKJ0PVQsTOHHGGwmunCVW16mQD9anQqL
	BG/J7isw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvoLV-00000007ZLX-0p4n;
	Fri, 27 Feb 2026 03:16:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvoLR-00000007ZKg-0861
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 03:16:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1557B40194;
	Fri, 27 Feb 2026 03:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6164C116C6;
	Fri, 27 Feb 2026 03:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772162206;
	bh=OnjWxWiDUb2ugPhY+9hPfDYUS6fPgvEuvJCT2+qrEmI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c91iEhLRl70bUvXW3OXDcLUDq2JuJwvxdLNpSyvmnUq9hy+lBM6n80xKSPrVowBpB
	 6GrEV3V+nU21unnxOfE3thZ8s5ylC8FqMw2feI/14faF2V2lqrVJAIibs9MN4hJySx
	 DyRi/VrFzomhowcHtwaKf8qpFF1H8uH4L1NtQxydd1ZmxpLzu57m8wtr6uA4FZ4fya
	 XW3yntiDofMYyEd6sbNzKK4Zqm0awDd1ZBMn/QAeY3WUOqBX1n2ScBO4WZ2ilP7ZNv
	 BvFF++3f2o5UibnnJL6/cEENKeS1i/+DijuBPnHxAIluMwHYyw48+a8SWL9gs66Hnh
	 0yp19p71mWu4A==
From: Will Deacon <will@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Marco Elver <elver@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>,
	llvm@lists.linux.dev,
	David Laight <david.laight.linux@gmail.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Boqun Feng <boqun@kernel.org>
Subject: Re: [PATCH v4 0/2] arm64: Fixes for __READ_ONCE() with CONFIG_LTO=y
Date: Fri, 27 Feb 2026 03:16:31 +0000
Message-ID: <177212898809.385801.8626009504655274507.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260216142436.2207937-2-elver@google.com>
References: <20260216142436.2207937-2-elver@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_191649_152495_36692237 
X-CRM114-Status: GOOD (  12.07  )
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

On Mon, 16 Feb 2026 15:16:21 +0100, Marco Elver wrote:
> While investigating a Clang Context Analysis [1] false positive [2], I
> started to dig deeper into arm64's __READ_ONCE() implementation with
> LTO. That rabbit hole led me to find one critical bug with the current
> implementation (fixed already in [3]), and subtle improvements that then
> enabled me to fix the original false positive.
> 
> Patch 1 refactors the macro to use a different way of getting an
> unqualified type and eliminates the ternary conditional.
> 
> [...]

Applied to arm64 (for-next/read-once), thanks!

[1/2] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
      https://git.kernel.org/arm64/c/abf1be684dc2
[2/2] arm64, compiler-context-analysis: Permit alias analysis through __READ_ONCE() with CONFIG_LTO=y
      https://git.kernel.org/arm64/c/773b24bcedc1

Peter -- please don't pull this just yet. I'd like it to get some
exposure to the various build bots and CI systems in case of any nasty
toolchain interactions.

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

