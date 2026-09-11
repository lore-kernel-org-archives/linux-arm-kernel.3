Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BDFC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrAFeAU1HONhylYuAElmqPqMHQ1RjTCsevj0LcygbgM=; b=SG20VPKcBWbZD9FnkaKiK0Oxek
	tS1vBcl3nWh/IRPcMUZSKMAy0obh+Gn7QHboE000/OdinAh3O3VeiJEoB/Z6lI/uTBCOHDnHr+jZc
	EI3ymprIP0eQmoklUm4cftvToyqXLJmn4wOIm/gvfTqBPBO6Hpl/G0Il4aOjk+HTuwtkp6oxWwQCO
	XvpNibOi5NBP1yGRcZ5RZdsgk22c2lU7PbuErSVXosLhIms0mtZqotXxt6uRWAouHWLPDyBCy6aXJ
	t2sJm60RgKevPo7gZSZzfqhqR5HiAKr/MWDL2/m0qiyJRltNZhTtNQKbHM3DjvqJp7r19TbPdlJ3R
	akbu/bOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51YI-0000000GmJn-2oMM;
	Fri, 11 Sep 2026 13:44:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51YG-0000000GmIe-2F7Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:44:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C0E5360A66;
	Fri, 11 Sep 2026 13:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988871F00893;
	Fri, 11 Sep 2026 13:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789134263;
	bh=xrAFeAU1HONhylYuAElmqPqMHQ1RjTCsevj0LcygbgM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C8wtgViKBZ4yAXkyZHrA0b4jjOcF5FSxZSKGhvLmk13Lev0eOijLaGm2Ts3YBKjH7
	 AWXB44Drylx7W6vF5mdbKmdo+Ccl3gyhgRiwG1JMBhJ/n/kXiaJdGFxd56tVkp0DRI
	 +Slhj7yvHMOBdLnceMMXOyaI5EF4j0F6DxcNNdWZyfWBk0sXp0WuWMbLYGhL6/V8zC
	 OLTn1fXpnRNftuuFiyXZ22+t0cJMMQTJ793Y+k+uusvs6e8Qr1TWgGNhF24Q7mxXsv
	 dJgl22+K+a9qfGM4sYTwlPzyPIb/r1I6UJ5WanRiFBXleHf63LWy7DUwzXKrTEnnHM
	 X0aXxOXcTzuIQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Breno Leitao <leitao@debian.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] arm64: hibernate: clone only the linear map that exists at runtime
Date: Fri, 11 Sep 2026 14:44:09 +0100
Message-ID: <178912888402.2443437.8441014922865389654.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260910-arm64-hibernate-va52-v1-1-a584d9a7d65e@debian.org>
References: <20260910-arm64-hibernate-va52-v1-1-a584d9a7d65e@debian.org>
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

On Thu, 10 Sep 2026 06:53:27 -0700, Breno Leitao wrote:
> This is similar to commit 1537e55728ec2 ("arm64: trans_pgd: clone only
> the linear map that exists at runtime"), but in a different place.
> 
> swsusp_arch_resume() clones the kernel linear map with
> trans_pgd_create_copy(..., PAGE_OFFSET, PAGE_END). PAGE_OFFSET comes
> from the compile-time VA_BITS, so a CONFIG_ARM64_VA_BITS_52 kernel
> booting on hardware without LPA2 -- vabits_actual is 48 and the fifth
> level is folded -- hands the walk a 3.9PB window while its linear map
> only spans the top 128TB.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: hibernate: clone only the linear map that exists at runtime
      https://git.kernel.org/arm64/c/e4a6f57d22e0

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

