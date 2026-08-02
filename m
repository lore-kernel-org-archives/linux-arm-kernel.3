Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC69FC55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 12:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ButMBPMYnmY+Ls5CyIA3CamKNvK6o2HH6itw67GRi8=; b=r63MQB1P6VW3hrBk7/CNR8jCgf
	3OUVlHAiDjWQ1Mel+58r6PjxfN9wLXbrhDcLhpx4gsDyacmZnkpnIiMU5vcOdB2UH2sndV5D7JkRT
	LBlI9YWeyFUyCQY0Nvvzr6GGSWFazItfDFbPekijGWfidugAqZ3o/nd0GGvJU6GYCV2LoVUF7ivK5
	LWQAWDva3TogqkdEl3pJl8f0U2/wv6lX70ox9wUqlJVZdCRdVz0bl0Bja9lHW0HRpbRdPK6u81/s7
	mm+FllAYbpMUbJCAxcwiI+j8W6416QdFZIx7Ie3hN/VP4bpOv+eumgi9tFmDexsSvDSzUtTRBYwlb
	vktjr5AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV3r-0000000Fbdw-09KE;
	Sun, 02 Aug 2026 12:12:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV3p-0000000FbcL-0Kmy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 12:12:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 767F541709;
	Sun,  2 Aug 2026 12:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294A31F000E9;
	Sun,  2 Aug 2026 12:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785672776;
	bh=0ButMBPMYnmY+Ls5CyIA3CamKNvK6o2HH6itw67GRi8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fts/H2R4VzKIIDoPW5c3M+BH2MkX8SGM3HdVLebm302yY0ZDdu03fipvw54QazpXU
	 X3QCWSNna9VBoyhCxB5UWo6yXvRZuB8UsZFEDv8Q+4icz6sCwbJ4UWmVKXS/U8DG2o
	 5qKVSYSUvYM2/R1A5WYz8fTavuL/479fcrUeJfLiPbhlc1/R7L9j7zOwFURSp0eOG7
	 XBrr0UirC/xrWgz+eCNS81yU+4PxPJQ0IJVrdaZ7SJ1rS5oQmbsLvJEAUjk3xR7/iS
	 X7RXqDOyt44Bik82SlW1rE8zso3K25Jr51QX3TiMu9VeLhkFm4fNdB1XYm7KzFhS8m
	 SDiUAv5D4adKQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Karl Mehltretter <kmehltretter@gmail.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64/fpsimd: ptrace: Fix inactive SVE and SSVE regsets
Date: Sun,  2 Aug 2026 13:12:24 +0100
Message-ID: <178566413306.4141663.7146790540592743319.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729004255.15630-1-kmehltretter@gmail.com>
References: <20260729004255.15630-1-kmehltretter@gmail.com>
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

On Wed, 29 Jul 2026 02:42:54 +0200, Karl Mehltretter wrote:
> sve_init_header_from_task() takes header as a pointer, so for the
> inactive mode
> 
> 	header->size = sizeof(header);
> 
> stores 8 rather than sizeof(struct user_sve_header), which is 16.
> Userspace sees an impossible size smaller than the header it
> describes.
> 
> [...]

Applied selftest update to arm64 (for-next/selftests), thanks!

[2/2] kselftest/arm64: fp-ptrace: Fix checks for inactive SVE and SSVE regsets
      https://git.kernel.org/arm64/c/bd290e7fc245

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

