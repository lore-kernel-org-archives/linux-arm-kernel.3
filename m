Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCA7D232C3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 22:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4RXWxQRgPSGhQnnZpOhJfBMQ+DyAniMksFiDOR4LVQ=; b=oRqHMWczoxV7SOcyHm5skWrsNj
	k+wZSJRpCV2t31yldQ8ubgKhCu1Utygl/o09XZ1f9g+WaJsXPqP0JgNlOg4UWj7sdWHaRF3MWCgOB
	kfM5sHwROghPtAjnmqJQHBH7uYK+ofX9Cvkapcp/raoe2Kr3NB+nZ02B7D/kBsQZhIq6ejO13bxQA
	2xYblRHcCf7uNDejUsxQt13/N+JKQTu9M5WJcQ9HUBf2dUe7Q7pQCGfVOAmKSWBS35yf226bno7VC
	DPOtvXlcppaBdhepFWb4Ef1zcSEo0q6z3XH17JRMa3Kni+RbVE6wnlaAFnl1W5uzu0oXFi/0TBHSK
	GQdfKf6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdyW1-00000000wpt-3F4J;
	Thu, 08 Jan 2026 22:30:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdyVz-00000000wpC-47a9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 22:30:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26C5A6014C;
	Thu,  8 Jan 2026 22:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B069C116C6;
	Thu,  8 Jan 2026 22:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767911398;
	bh=Zc539l3fQP67RQ3PA4+JN/sDBZn6/BFbAN/DKJlIfMA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NWhbO4Tojnk5cH5lfB6+pIVBs8X9zuvtraEkr/0Mxtw7iDgLp/WW9Q+0QewXqlD/f
	 zE1XfXHgWzrqcVG8P6VkWYMLKgIP82SsKLKyvl0VVfUemMrXtQTHW0/dWmX0rh7Ts1
	 6yOU90ivoSgw2xEhLwpTh0g3tawlLjNWerZGcQqCqlfBa7/MkvSgP5LSxgx4gs/75o
	 vwsPS1ek9S4Fvd4wI3rn+Erw0no46eFmnfpwMG1+ouRAk73TiM2Sj1VhV/u407ne4c
	 f4UJJ4qbi3YhgtQDn2CHLXwQ7/SzoJ6mQe3rmOszoWudR1CyNl+EKADxi/IEKFXQm0
	 Mpbd/4Esxk3dw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Laura Abbott <labbott@redhat.com>,
	Breno Leitao <leitao@debian.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	kernel-team@meta.com,
	puranjay@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: Disable branch profiling for all arm64 code
Date: Thu,  8 Jan 2026 22:29:46 +0000
Message-ID: <176790876272.654154.10766231430439106278.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106-annotated-v2-1-fb7600ebd47f@debian.org>
References: <20260106-annotated-v2-1-fb7600ebd47f@debian.org>
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

On Tue, 06 Jan 2026 02:16:35 -0800, Breno Leitao wrote:
> The arm64 kernel doesn't boot with annotated branches
> (PROFILE_ANNOTATED_BRANCHES) enabled and CONFIG_DEBUG_VIRTUAL together.
> 
> Bisecting it, I found that disabling branch profiling in arch/arm64/mm
> solved the problem. Narrowing down a bit further, I found that
> physaddr.c is the file that needs to have branch profiling disabled to
> get the machine to boot.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: Disable branch profiling for all arm64 code
      https://git.kernel.org/arm64/c/f22c81bebf8b

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

