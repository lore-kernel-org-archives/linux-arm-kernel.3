Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14F2CD0423
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 22:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2igCcIWwNU5ZNYhCD3uXkSbSb2h40A0iCpeP9Zsunc=; b=rT79uiiYW3pgfC6phQ6p4fYFnL
	SIdMT0G9mzi86FU6G+Kjtea6pHc/9Zm+iQNTdy2ey1aztEdgKYsgEX/N/h0SPDh8GxJyY2dgZCxIH
	lXdHag+ja2YUY+LVytQ+7ci7iWgUl3CVp5DL3Z5U9aqAt0m9HHk4EbBUSWv6Pzel8XkD/D/NkXh6N
	tFBCvmJ2eMgcpGDqaILRI5NbHOBIZjUG6Ou1L7FqVurrLQLRw04hjWCWjx6WOwymKX4hVXQFEIuoq
	g2v5EhSGB94DaaldUUQ/oyro/cLU7J9ENIakr2zNArHZWr1GDIHh4NlT8cwRQJ43cMdn5uYFGyq3X
	jVI1Wf5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctXC-0000000CCoi-2mrh;
	Mon, 05 Jan 2026 22:58:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctX9-0000000CCnU-2fpN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 22:58:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D6E2C44189;
	Mon,  5 Jan 2026 22:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030EAC16AAE;
	Mon,  5 Jan 2026 22:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767653922;
	bh=Y62g07QGScncAFopehfwNZgRYDrOnDWgOin4FR3zOSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=STjBEwGkRjBMnOYIkQ3OXlVkdFl84KTIrRliKI26L1xplvgT6HLaC01hbHZ5AhSbj
	 QzMJSEx3V7dez5wm0ltul7mFDAjU7r9/5hnSNTK0aIJhn14plB0lAoI4tuaLWukAqF
	 V31dMm65jfX9zQY3EPbCj3oKBsnyUGqrcPXCO9tp/oCzJjmxd3VcJ2zgwofV3gH1gL
	 F0E3C25BATnFS2KcDzHTuBRA6VEV7Hj0WZFWf7SeDo2YwOgLrzwSVZTqppPPdl75zy
	 9tmEMsOcZJUxBq13yIKAV+1re4wwj1geRNR5C6l6NaTEYBFUt//SEb1uHA8vYUPFmj
	 DVDxKL4hErzoA==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Support FORCE_TARGETS
Date: Mon,  5 Jan 2026 22:58:20 +0000
Message-ID: <176764780685.1450880.11544304380824187073.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219-kselftest-arm64-force-targets-v1-1-cf72d6d27e99@kernel.org>
References: <20251219-kselftest-arm64-force-targets-v1-1-cf72d6d27e99@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_145843_706599_CD04F82D 
X-CRM114-Status: UNSURE (   9.67  )
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

On Fri, 19 Dec 2025 15:29:42 +0000, Mark Brown wrote:
> The top level kselftest Makefile supports an option FORCE_TARGETS which
> causes any failures during the build to be propagated to the exit status
> of the top level make, useful during build testing. Currently the recursion
> done by the arm64 selftests ignores this option, meaning arm64 failures are
> not reported via this mechanism. Add the logic to implement FORCE_TARGETS
> so that it works for arm64.
> 
> [...]

Applied to arm64 (for-next/selftests), thanks!

[1/1] kselftest/arm64: Support FORCE_TARGETS
      https://git.kernel.org/arm64/c/fb36d71308a7

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

