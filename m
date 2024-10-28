Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DB1D3E2A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 19:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GB1Kagh+F5SEWVjqzO7gxFwFcSR2vS3OXNBe1plb0VA=; b=DbSrsxfJ75srLxw2l5zX0hHL9u
	V2cu76e7gtUaLkM930Sc2Gdvaq1bYij4taObfFbZ7KZs9/Kflfz0m5j9s6msSW2mWJW2uQOkhCGG7
	yOjX6imS5lxS/JL60Jht6c+B5zZke0ChjIC9NgFZFTeTsBGEys9Kqozs90XbG70VYeMdcBzOVKjRu
	RHvX/ML0n3Q992CWYeSX+BlqheQIUntO+TpJPH25Bv3CYVa7Sh9+ff6qprtfJjKwjT1l4UzbK6JJL
	HiIJS3JZzod0RtRg4DPxJ1CfZHa/sI17JjxEkVfL/ClI6i4tx7RJp0TymLet+YqGn9RjbgQA0r7x9
	swwaCxIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5V2h-0000000BwNH-2qXk;
	Mon, 28 Oct 2024 19:04:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Uqt-0000000Btx9-2ZKa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 18:52:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CB5F75C5DDC;
	Mon, 28 Oct 2024 18:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29D2C4CEE4;
	Mon, 28 Oct 2024 18:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730141550;
	bh=aOaHr4oONyfJNeV8zxUGMQ48BDUo4kPUaMe9VE1kEIM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XrtKYXjIPHN7+hSKciIP782In5nosaMgoCPNmoVqEZHzYbFxBseBaL+5hXfJQuxFd
	 ldUPyXec5fhWIXRTQukN2dtAOmH0aiFDAX8BHNnFzDpzwPPi6wTBQVvWySQo0jX6VT
	 Id8JZmhWAvZxfuQs4TR9GBHi6qEhIjaOiSpZrEzDZvsPlbMrsIvpVQJTSIYRB3wzqF
	 0dXTRk+9EDN8LfmjhByTkT9VvFlASLCw+yhuuFgkovmrVbUNY8raiuFiNBCzEjOMlo
	 XDXdXgVJ8b4LUzcfZGVExzJ/BpSF6s5ADhH00aLr7rFzvMFBcDXhhxJOJZ+ekyBeH9
	 2I2cu4Ijn/plw==
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf/arm_pmuv3: Add PMUv3.9 per counter EL0 access control
Date: Mon, 28 Oct 2024 18:52:21 +0000
Message-Id: <173013643645.2908148.3061264044552373982.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241002184326.1105499-1-robh@kernel.org>
References: <20241002184326.1105499-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_115231_711654_0DFE90E0 
X-CRM114-Status: UNSURE (   9.45  )
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

On Wed, 02 Oct 2024 13:43:24 -0500, Rob Herring (Arm) wrote:
> Armv8.9/9.4 PMUv3.9 adds per counter EL0 access controls. Per counter
> access is enabled with the UEN bit in PMUSERENR_EL1 register. Individual
> counters are enabled/disabled in the PMUACR_EL1 register. When UEN is
> set, the CR/ER bits control EL0 write access and must be set to disable
> write access.
> 
> With the access controls, the clearing of unused counters can be
> skipped.
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf/arm_pmuv3: Add PMUv3.9 per counter EL0 access control
      https://git.kernel.org/will/c/0bbff9ed8165

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

