Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BF0C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 12:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7t4xYZPS5/zZ1VngL4kG1hvUave8IACXX7PMjAjWykg=; b=XdFWksJvT3YfxHy2bfMwWHo6uC
	WK2C82RgY0ef3WDwuZX3LQapvmXI/3Qwjo1e7xWf0GuFar4eQkW1eM9bZE93EtKNqDEvzL+zFo/Sr
	MP/9LrWJfMkOaOTpu+nAI9lZtjYKlPaspSR27JfAQW0cQvrP6LG9RsS4G8Z7b6s/TpprdFJ/3E0pl
	fNTodXTUrExa18j1bzMhazEbE1E7sf4JoJAgENGjnLQCWWDCGngbUj06y534T9fv1Z5m3+olOhUfe
	dlzm9pOS9Fwi1UFJzkGSzNhjae4N7+MX7pcohH2HIKbxt4XlP4njX1xAg23eQEcapRAv+VFovnGGf
	tgICCcJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7XhR-0000000EMb0-0tlP;
	Fri, 18 Sep 2026 12:28:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7XhQ-0000000EMac-17hx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 12:28:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D63D741388;
	Fri, 18 Sep 2026 12:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 864791F00898;
	Fri, 18 Sep 2026 12:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789734495;
	bh=7t4xYZPS5/zZ1VngL4kG1hvUave8IACXX7PMjAjWykg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WCqy2KsyM+zvVJpaZisBGtEEzqYvC9v7ViEJhlwJLp4DUW+lZkn7+Y5fFG+Fl3hzf
	 joPmMHB3+CmpBBEup2zZxaGtud/kQ8Zi6YOlJwSUJ6zCLMK97GGfNKMLgixZXRJbIg
	 64zdfeP6tvvgQN/A2JXcXKcL2XV0hUpfsZFRLNmcSv+/B7QrNJKZtmfyD96aWlBBZI
	 KqcOqkP4Pm6bZI50foFQLtoipVmXK/dr3zT1tDpW/CqcQYZ6jGeLQREmQQUhE4I6fA
	 phLLTFrOcl/GGY5yzkMcVc2FFgYz/uIiMR2410X5xcnQ6CYz4/H+QhE7YNpWyvpB3C
	 xQ6GggrRq6zkw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	David Carlier <devnexen@gmail.com>
Cc: mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Khushit Shah <khushit.shah@nutanix.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: errata: match the target implementation CPU's own MIDR
Date: Fri, 18 Sep 2026 13:28:05 +0100
Message-ID: <178973065688.2324564.11650949029036534707.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260906121421.60575-1-devnexen@gmail.com>
References: <20260906121421.60575-1-devnexen@gmail.com>
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

On Sun, 06 Sep 2026 13:14:16 +0100, David Carlier wrote:
> __is_affected_midr_range() is handed the MIDR and REVIDR of one target
> implementation CPU, but tests the erratum's range with is_midr_in_range(),
> which re-scans all of target_impl_cpus[] and ignores the @midr argument.
> The range test is thus constant across the per-CPU loop in
> is_affected_midr_range() and only answers "is any target CPU in range".
> 
> Since just the fixed_revs REVIDR check uses the iteration's own registers,
> an out-of-range target CPU can decide whether a MIDR_FIXED() exemption
> applies. A VM then enables a workaround whose only in-range CPU is fixed
> silicon, e.g. erratum 2658417 on a Cortex-A510 r1p1 with REVIDR_EL1[25]
> set.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: errata: match the target implementation CPU's own MIDR
      https://git.kernel.org/arm64/c/b7403afb7a5f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

