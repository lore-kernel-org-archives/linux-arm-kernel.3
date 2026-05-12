Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B3ACD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 14:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFvhGMGOY/Zvb2ejXG8FxKWVLa1NTFFSnkG9JoRY8Q4=; b=YuT6f4DU+hEMNTirkx6gCqOZsh
	ypyXm22Stla+ysCGnv0U3Bsp03lw5jr1A0yQjECTyogngfIOhsk477L35WAcKBDwuBxssTJ/7hlrb
	/E904G+XB+VBSiHTCdzCKkAtjsG2E9u0ufP4xT43kCNf0yg9atsCqHGdVl4a8+qvax8+CPtm6TY2l
	POoD+bXpCMA7st5XX+UOPnl5acUq+zQ02zyT0K2ilfv3B26Rr9heTIRV7+CMOETyUSZETXLQmifRy
	KHKGWkauDpbbsss1NR8crB089Gw8AHkk8nidrIViOx3A+sU5Arm0xpzvAjtQpMDUEfNuTfNMYTwGX
	YFQhC0vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnoq-0000000GyTh-471B;
	Tue, 12 May 2026 14:10:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnop-0000000GyTF-3EjX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 14:10:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E96862BE9;
	Tue, 12 May 2026 14:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4F8C2BCF5;
	Tue, 12 May 2026 14:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778595042;
	bh=s/F74n2sx6kIfJVENuw392eORtuYs2SMuy9PPoYj8+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hNnZh8dk9vTw/LG6MKnCJSOGVPYagZEpvpKqwSZfdsf7HH/49E2w+cY8A/Mv2TAZq
	 LRCsGDvxfiy65W9JKmQmNKZtN8IZgb1Kps1WmmO0DpEF59MRfSHNdFTalbxkK3ViYI
	 pjBLpbpUf0R0cEaFNs2rkz8uo37/MrIX3lVY13pFdEfy2ktn3g7C/tYZQjYwAQAQZN
	 jlW1aycuXQljRJrzlmUStE+HWYutd8hFVrmVfSDraHOWZsVTMGLncnoYXdOUAH31qj
	 1tbLhqzDJx3WNqYL759T0tSRRJ1kxCrbS1f5NsSI3YT4reczzcDY+ZONJ4+T6Xeswe
	 ciXeuiiT9ieGQ==
Date: Tue, 12 May 2026 15:10:36 +0100
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <Mark.Rutland@arm.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/2] arm64/sve: Performance improvements with SVE
 state saving
Message-ID: <agM03CN6cX2JNu62@willie-the-truck>
References: <20260320-arm64-sve-trap-mitigation-v8-0-8bf116c8e360@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-arm64-sve-trap-mitigation-v8-0-8bf116c8e360@kernel.org>
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

Hi Mark,

On Fri, Mar 20, 2026 at 03:44:13PM +0000, Mark Brown wrote:
> This series aims to improve our handling of SVE access traps and state
> clearing.  As SVE deployment progresses both hardware and software
> actively using SVE is becoming more common.  When a task is using SVE it
> faces additional costs, the floating point state we must track is larger
> and our syscall ABI requires that the extra state is cleared on every
> syscall.  Users have measured these overheads and raised concerns about
> them.
> 
> We can avoid these costs by reenabling SVE access traps and falling back
> to FPSIMD only mode but if we do this too often for tasks that are
> actively using SVE the cost of the access traps becomes prohibitive.
> Currently we attempt to balance the tradeoffs here by starting tasks
> with SVE disabled, enabling it on first use and then turning it off if
> we need to load state from memory while the task is in a syscall.  This
> means that CPU bound tasks that do not regularly do blocking syscalls
> will rarely drop SVE while tasks that use a lot of SVE but do block in
> syscalls (eg, due to network or user interaction) will be much more
> likely to do and hence incur SVE access traps.
> 
> I did some instrumentation which counted the number of SVE access traps
> and the number of times we loaded FPSIMD only register state for each task.
> Testing with Debian Bookworm this showed that during boot the overwhelming
> majority of tasks triggered another SVE access trap more than 50% of the
> time after loading FPSIMD only state with a substantial number near 100%,
> though some programs had a very small number of SVE accesses most likely
> from the dynamic linker. There were few tasks in the range 5-45%, most
> tasks either used SVE frequently or used it only a tiny proportion of
> times. As expected older distributions which do not have the SVE
> performance work available showed no SVE usage in general applications.
> 
> For tasks with minimal SVE usage benchmarking with fp-pidbench on a
> system with 128 bit SVE shows an approximately 6% overhead on syscalls
> from having used SVE in the task, the overhead should be greater on a
> system with 256 bit SVE since the Z registers must be flushed as well as
> the P and FFR registers.
> 
> The two patches here move to using a time based heuristic to decide when
> to reenable the SVE access trap, doing so after a second.  This means
> that tasks actively using SVE which block in syscalls should see reduced
> or similar numbers of access traps, while CPU bound tasks that rarely
> use SVE will see the SVE syscall overhead removed after running for
> approximately a second, confirmed via fp-pidbench.

Have you looked at all at applying this heuristic to SME? I wonder if it
would help with the recent DVMSync erratum workaround, where tasks that
use SME once/infrequently end up causing IPIs for TLB invalidation every
time they run on an effected core.

Will

