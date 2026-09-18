Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAC5C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 12:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0DjbgPT1N8oxtOkpX9QxlwHTjU0mZUCvcoBnTkW0bA=; b=Sj2D31TAkwANYm6jVAChI2X2X/
	w230L/4kxHY2IvAdnPFzTZMbZVn4yD2RCCBJutZ5Xl145G90nWk6zcaPYW6EVGH9ukmrWgTHfnzmS
	ITMFjanAqx+R+kKqy2Ae3RMxfJVY/AlsB8BsKnesm05Od8fF//X1iKILrg2RydVYotGmUDzPvr3fm
	DtIQdx2qebd0MD+8FToiq4I8XQhnqPyd4lpbLpTwSOytmI03Q4zLBe7N9pnjzCx1z3Kt6bENNgKVT
	v0BWr6rEYSAo2bJhNzgoh3LhFvffUzljOxN4Uq5RHWfG5zLhPcD25k6ho1cMnO9u8X1Il8bSUUhND
	CFekdwLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Xhj-0000000EMg0-1Y0M;
	Fri, 18 Sep 2026 12:28:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7XhS-0000000EMbO-2qbV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 12:28:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C87E41388;
	Fri, 18 Sep 2026 12:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 500341F00893;
	Fri, 18 Sep 2026 12:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789734498;
	bh=O0DjbgPT1N8oxtOkpX9QxlwHTjU0mZUCvcoBnTkW0bA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SGI2f3IAM7IFJlqScFS3TMwMeOFML5qxTg+q1ZSZBewCqW+ksOQ0KJlXdrbwv2G0w
	 8p+iX2J/ANEoJBaZ9MxsbJnuvscy9Axfa4cIrFrH2SQThLMH2GeqeArPs9AA/bl5E2
	 AIc5Vo3cCZvM3m5vScZ2I8D4kF1+SKZK9GMuBjiJSc2OAKhDBxDHvVqIxfreUYYLhZ
	 ckFopJDy3hZS0qwKSoEbohAYrIuWvzrJqIfycSxDX2GojNTS6mzRUs5KnhwMUauI9w
	 B8L/hCsAjcsQranEKFYunRNk5l3e0ZXN+Z561jellRb8US5iTL7kAk57CMhihlyBMo
	 +UCVSXrjGVOvA==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	ilkka@os.amperecomputing.com,
	leo.yan@arm.com,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] perf/arm-cmn: Fix multi-filter encoding
Date: Fri, 18 Sep 2026 13:28:06 +0100
Message-ID: <178972989482.2319500.7665226811462988207.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <ec590cd4cc61b54d6ad3b306b69777ad7729c9d6.1789475062.git.robin.murphy@arm.com>
References: <ec590cd4cc61b54d6ad3b306b69777ad7729c9d6.1789475062.git.robin.murphy@arm.com>
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

On Tue, 15 Sep 2026 13:24:22 +0100, Robin Murphy wrote:
> The current special-case for EVICT_STATE_SEL filtering effectively
> assigns the "filter" and "filter2" controls in the opposite order from
> how the CMN S3 r2 TRM states "Filtering is programmed in pmu_hbt_lbt_sel
> and pmu_evict_state_sel". On reflection, not only does this seem
> unnecessarily non-obvious to users, but it's also likely to be a problem
> for scaling to a full multi-filter abstraction in future. There is a
> logical order to filters based on their bitfield positions in the
> pmu_event_sel register, which the TRM descriptions allude to, and the
> cmn_filter_select enum already (almost) follows, so let's fix the UABI
> to follow suit while it's still unreleased.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] perf/arm-cmn: Fix multi-filter encoding
      https://git.kernel.org/arm64/c/406aa2b186d3

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

