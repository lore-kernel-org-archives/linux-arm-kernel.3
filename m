Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD484FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 13:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9kmXfnFKdD/dXQ7uFNoeFuBou+trtZ2ZKzOYaz73C08=; b=B9Ok7eIVrKK3VKZum5Jj7e9sNN
	fwv7Cny38E8A1Rfyw3tByj9If7Jz3MuGju2PqGqUvocijMkhchh7g1esy0RSIh/3/jNQpgt9e8wM0
	7i62MA/Gj0+W9taY84zbZAZfPftwE9Yjxrt7vy54F3PXoKdfAwx0Ryghe+ApnLPJNfae9HRS8RmSt
	1z5a0BpWTJOYEP5anxwNDD30zV5bMWWXHPVSqt455i3666CuWosebuOh7IKwxT2AfRt0lpHc1igkI
	N7fnpuL5uHZqvwl29C5gfXIHYC1peb9iEtQLvVhzF8MNaQye5NZIUUH1DCLLa/ddGP3ZxUJWH/15V
	1HKwU+Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMGk-0000000H1Pq-1Ts2;
	Mon, 27 Apr 2026 13:45:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMGh-0000000H1Og-3vSs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 13:45:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95F961684;
	Mon, 27 Apr 2026 06:44:53 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A9BC3F763;
	Mon, 27 Apr 2026 06:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777297499; bh=K+MSDdOm2QRoJbgl9KhrnuSleUCOCuQeXduuzuu8BzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lJyYuhmFOxJ/YjTDQ327Ncm9AxyUW7U3dZ6GuC4qPusgPezm96WHUs/7/lq8iOwZC
	 sRY3SyL/hBjsl8pS1njRSPq9a8OcJiVHXyj57eRKcRj7val7lRQ7nOrcTe2Y87AaOi
	 F6pt1Fu0ZJntF1qseVZvX7/9F8lQcq0dFpKARiFk=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	Breno Leitao <leitao@debian.org>
Cc: leo.bras@arm.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	palmer@dabbelt.com,
	paulmck@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	rmikey@meta.com,
	kernel-team@meta.com
Subject: Re: [PATCH v2] arm64/irqflags: __always_inline the arch_local_irq_*() helpers
Date: Mon, 27 Apr 2026 14:44:44 +0100
Message-ID: <177729716541.3579760.1029539154605428256.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260421-arm64_always_inline-v2-1-c59d1400514d@debian.org>
References: <20260421-arm64_always_inline-v2-1-c59d1400514d@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_064500_063727_651E9FA7 
X-CRM114-Status: UNSURE (   9.23  )
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

On Tue, 21 Apr 2026 08:58:57 -0700, Breno Leitao wrote:
> The arch_local_irq_*() wrappers in <asm/irqflags.h> dispatch between two
> underlying primitives: the __daif_* path on most systems, and the
> __pmr_* path on builds that use GIC PMR-based masking (Pseudo-NMI). The
> leaf primitives are already __always_inline, but the wrappers themselves
> are plain "static inline".
> 
> That is unsafe for noinstr callers: nothing prevents the compiler from
> emitting an out-of-line copy of e.g. arch_local_irq_disable(), and an
> out-of-line copy can be instrumented (ftrace, kcov, sanitizers), which
> breaks the noinstr contract on the entry/idle paths that rely on these
> helpers.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/irqflags: __always_inline the arch_local_irq_*() helpers
      https://git.kernel.org/arm64/c/caecde119e34

