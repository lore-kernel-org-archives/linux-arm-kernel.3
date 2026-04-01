Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7B1D3516C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 10:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9c+BlymEyJiEgefwlkww3iT06Svesx7RK4CgdK3KBI=; b=JBv8RR/Fh6tw/GD3oRr06qOECM
	TllS6GNqleNbkbDCaWB8TUDOwjSAo4kfYP1U/RyxpEoIC3u2dk8TMDMQjrMjWeMtfJRI31AZq9SeY
	lqkrqbzJb+iY2L91Gjm8YbxdxBAQZLkPfyC0Rjkzsq0iw6T1Iwew1FSgkLdqRV3IhPhNwlnwotCUj
	uvV5SRPG9pu/TK8jkVtDmhqLrkBOBoChFfCkFyXgNpZPInNuwGU64mRmGgGe6y2meIE0Uu9aJ/7MJ
	zwfDc0iXVC6Q+umK7GwJD1rSw/0eGNRHPkrYjk909hYEl/F3FuLN5jAJ39VsLOGkyHy6AL0+yybRe
	u3DME+sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sQV-0000000ETNV-3Bob;
	Wed, 01 Apr 2026 10:03:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sQT-0000000ETNP-3Sn2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 10:03:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8491660130;
	Wed,  1 Apr 2026 10:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772CDC2BCB0;
	Wed,  1 Apr 2026 10:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775037832;
	bh=L47v1qYcYUJeT2CaqpGyEU8mGhhYz5fMVzs69xNtNCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WbtKx9JID1o8Afdksqhd51oIWlCK09+RbBMr4J36pVRCnxUfPkqOF/IHN9+vndjOP
	 NwYQZ2ng/y26oqDKDqtB3oXYoxuM6FhDF4mf5WM7VyycrBcgq0AfA9+89rLlT5Hf2K
	 q0k5z4XWER9GEoMx0YOrDNitlkTou5yScn+rrgqVqjS12kd+OGm2TdNNunNPz5gtRo
	 /TZRz7e91iolCyyQhuBzhQ+TOh+KzHeUlckDXIve8xdvWxyAC3diys9psf6WCVwooy
	 QcrhG25aU4jP9piqjA6wK2yuIcJsgXfjv/3WICqJujTwvStzxlfpD95LSu3IlX6MeN
	 LnWf7DCItGzpA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb+git@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-hardening@vger.kernel.org,
	mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will McVicker <willmcvicker@google.com>
Subject: Re: [PATCH v8] arm64: Use static call trampolines when kCFI is enabled
Date: Wed,  1 Apr 2026 11:03:43 +0100
Message-ID: <177503506493.2514486.12265333685036392947.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260331110422.301901-2-ardb+git@google.com>
References: <20260331110422.301901-2-ardb+git@google.com>
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

On Tue, 31 Mar 2026 13:04:23 +0200, Ard Biesheuvel wrote:
> Implement arm64 support for the 'unoptimized' static call variety, which
> routes all calls through a trampoline that performs a tail call to the
> chosen function, and wire it up for use when kCFI is enabled. This works
> around an issue with kCFI and generic static calls, where the prototypes
> of default handlers such as __static_call_nop() and __static_call_ret0()
> don't match the expected prototype of the call site, resulting in kCFI
> false positives [0].
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: Use static call trampolines when kCFI is enabled
      https://git.kernel.org/arm64/c/e70c2335f889

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

