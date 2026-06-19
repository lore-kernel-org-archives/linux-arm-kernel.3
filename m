Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C95CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 16:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1xhqGNsWnLwZPaj0pcMJoR83OBrixQwsUN/yCO5ZiV0=; b=xdkeFdPCcQGXyDk5hubTZvQbbg
	3hDgKjNh8RKD+7mF6Ikc3eUjjHjIj7QO0TDJBB5QVeLYLJgoL7dEE63I89w4A4uFi7xGAS4yaiCrl
	kzWZ1OVB/CuRk5j7UyXBSAD7IJJkTqEebzE/YxVTFmSQOAGIh13CNAwazHGGiBT1rjTSoxtBbC+21
	QdbRKj4v7Wf+gyrFwT+hjcwrpxVTtggjgDOloulNNxVpvzSIixb5KZJVA9mGa694z/AOZdQe6gv9i
	pB94z0fnezEigrfUIC956WqzDXurBLIKPIjyEKlRLAsdt69wy+qmfD3axCcXNQQHdSMmgSqOh0Z0r
	G6L5erFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wacCc-00000002mN7-24Us;
	Fri, 19 Jun 2026 16:36:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wacCY-00000002mMK-2kNv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 16:36:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9916D601EF;
	Fri, 19 Jun 2026 16:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08DF1F00A3A;
	Fri, 19 Jun 2026 16:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781886976;
	bh=1xhqGNsWnLwZPaj0pcMJoR83OBrixQwsUN/yCO5ZiV0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BHd+vfHMQzr+0RFkOzXvLyLSntCWYGfUuzo5Ka3pF2zX+r+6hGDvdf/UR8yRaPyJm
	 TTHgQ6uT1Tu8uOFtS4x8nF6/pjkvq9vWkIafHYYeIxuxriW1MqcvqkldYSFnysPI4P
	 NKl2IWHJ7ZgxJnTOXBfZQ+RIDF01SsO4CG0lN7OtlvB1VyIMi+TUrdQz5+S4UBSUNc
	 kJhzNbZCrfmXFYamZGHERF4ujuUx0rGpPV9fRZjtltXVVDqL/bN0BkTQoKENbD4YWg
	 VXvu8QBqNxoHjdUmK04IpaMzeKVV0q/TQPzHyRacO+rlSq1ogVvapdHGLGbUXJktdI
	 RU/ilp4A4+zjQ==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Pratyush Anand <panand@redhat.com>,
	Breno Leitao <leitao@debian.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	clm@meta.com,
	leo.bras@arm.com,
	kernel-team@meta.com
Subject: Re: [PATCH v2] arm64/hw_breakpoint: reject unaligned watchpoints that would truncate BAS
Date: Fri, 19 Jun 2026 17:36:05 +0100
Message-ID: <178188509799.1161904.13699894903976335311.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260609-arm64_bas-v2-1-9f34dbbded88@debian.org>
References: <20260609-arm64_bas-v2-1-9f34dbbded88@debian.org>
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

On Tue, 09 Jun 2026 06:15:53 -0700, Breno Leitao wrote:
> hw_breakpoint_arch_parse() positions the BAS bit pattern in
> hw->ctrl.len with
> 
> 	offset = hw->address & alignment_mask;	/* 0..7 */
> 	hw->ctrl.len <<= offset;
> 
> ctrl.len is an 8-bit bitfield (struct arch_hw_breakpoint_ctrl::len is
> u32 :8), so the shift silently drops any bits past bit 7.  For
> non-compat AArch64 watchpoints the offset is unbounded relative to
> ctrl.len: a perf_event_open(PERF_TYPE_BREAKPOINT) caller asking for
> HW_BREAKPOINT_W with bp_addr=page+1 and bp_len=HW_BREAKPOINT_LEN_8
> ends up with 0xff << 1 = 0x1fe, stored as 0xfe.  The kernel programs
> WCR.BAS=0xfe and the hardware watches bytes [1..7] instead of the
> requested [1..8] -- the eighth byte is silently dropped.  The
> syscall still returns success, leaving userspace to discover the
> gap by empirical probing.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm64/hw_breakpoint: reject unaligned watchpoints that would truncate BAS
      https://git.kernel.org/arm64/c/4cc70f75853b

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

