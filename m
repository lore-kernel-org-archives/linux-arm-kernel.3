Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9C5CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 15:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gh53gxbQnaCUYurs04LpkuYJg1z3m9Vvvqx1oqd5+Og=; b=jReDJ5eGyAe1c26+vov0zkR8MR
	/dQdkbgydwR0xYHgg0o/1MwzdvvMJVP4G4pTEZ9lTnpu964WBW5BGtsNb2JhMdbfvie7E8ImtgR3z
	1fg0e1j2THCfmPUyanGyZzUGXpT/HpNbe4mcN9NbpAmYsPNHHWVYlKDh2T1My8tTDfe7txQjMmiS8
	zsHZ21v/M5xNVSHUizbhDv8j5ML0Frtq8soZJK314mV/JrJrhil6t9M49qD6SojearidnYLplFJqY
	bFpcPiUXduZPzn92gsz6Iqo5hLa/6qI7taZJZlgOHoCuE54jd+FhGUj7uTuJbYfEGOvKwsURqXSuj
	8BPGqrfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOmo-000000000zO-3GG3;
	Fri, 07 Nov 2025 15:54:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOmm-000000000yO-2PkT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 15:54:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E8BA54044E;
	Fri,  7 Nov 2025 15:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E82EC4CEF8;
	Fri,  7 Nov 2025 15:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762530839;
	bh=NMQCPtpxKiUEGfu2VWrmgKDqhv7VtpgyysXzsTlzuI0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XnOzncS1Sbb0AI/JhWz2w/MeeEz1Ok8G+d+ofww8F57MXxcqIS5uiMqQ0wjvJnIIS
	 Tui5hkwxPQDj1cGxttzftxuININUCuBLZu3buxHXTuI42mwdCbgeRwZf9KS6XSlZnD
	 KjfSEv277ZVk1oiR1IglAQ8zFzk/Ai+Foow61z67OOF6TGAgmaukdyxr4aKLyUTbQW
	 9B8Wj8nIu2ydZZ/byRm0a5ep90C73ICjZm403C+PVLcJXUDJPmLRS3TXFrGnbCKmmz
	 Vav8GIVQjBzMP1S8v80fqmj5J4QRKdgoh/lOeM9mxbSTBoB042/dqLvfFIu2A8ml6g
	 PCvRJmpQcq8yg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Willy Tarreau <w@1wt.eu>,
	Mark Rutland <mark.rutland@arm.com>,
	Yicong Yang <yangyccccc@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] arm64: Use load LSE atomics for the non-return per-CPU atomic operations
Date: Fri,  7 Nov 2025 15:53:43 +0000
Message-Id: <176252506039.590065.788783176975944468.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251106155213.3186582-1-catalin.marinas@arm.com>
References: <20251106155213.3186582-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_075400_637080_80D1D898 
X-CRM114-Status: GOOD (  10.56  )
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

On Thu, 06 Nov 2025 15:52:13 +0000, Catalin Marinas wrote:
> The non-return per-CPU this_cpu_*() atomic operations are implemented as
> STADD/STCLR/STSET when FEAT_LSE is available. On many microarchitecture
> implementations, these instructions tend to be executed "far" in the
> interconnect or memory subsystem (unless the data is already in the L1
> cache). This is in general more efficient when there is contention as it
> avoids bouncing cache lines between CPUs. The load atomics (e.g. LDADD
> without XZR as destination), OTOH, tend to be executed "near" with the
> data loaded into the L1 cache.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: Use load LSE atomics for the non-return per-CPU atomic operations
      https://git.kernel.org/arm64/c/535fdfc5a228

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

