Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB79C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 18:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P39uc41+i6CaXnIEhBjbbDAGdQqhn08LxLdHg10hkUw=; b=BElCbdqeaLyYGLUbG1x2Afckt8
	XzAjBx31upF/VyX4f6Knb41Dm8lS1c4dRx5t7xBflUgyi6VhZe6J95y7Eb8sNuxFzYvBi1lOml4sD
	YGvVmiYY70Vec1JbeQXwBuigqSDTuT19lxtpwsRc1ivOHCvI6Sj7mOMLhZobjC4/yaClZucblBATD
	9709fFTQ7jSYQZH7slclOEurhRfGjo50hStuxXTDMlcvSxhAtqJLZZQNmxIVfOewpSk1LbtF0KCJ+
	OpkJBvA9ITRQlm8yB2jYfF/fnPaRt2QkU/TSeC+8VjMTTVSO97HJFdw8QZj1BT80iO9z352haVahJ
	2IfrfV1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttA35-0000000F3WF-3nDJ;
	Fri, 14 Mar 2025 18:46:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttA0X-0000000F3Je-1eWn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 18:43:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D03C4A48899;
	Fri, 14 Mar 2025 18:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33BE5C4CEE3;
	Fri, 14 Mar 2025 18:43:42 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	broonie@kernel.org,
	maz@kernel.org,
	James Clark <james.clark@linaro.org>
Cc: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Morse <james.morse@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/4] arm64/sysreg: Sort sysreg by encoding
Date: Fri, 14 Mar 2025 18:43:39 +0000
Message-Id: <174197777060.737113.10729866203138129273.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250115162600.2153226-1-james.clark@linaro.org>
References: <20250115162600.2153226-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_114345_499651_235EC29A 
X-CRM114-Status: UNSURE (   8.21  )
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

On Wed, 15 Jan 2025 16:25:54 +0000, James Clark wrote:
> A few small fixes and then sort and ensure sysreg remains sorted due to
> the discussion here [1].
> 
> Applies to next-20250115 for the review but I can repost after rc1.
> 
> Changes since v1:
> 
> [...]

Applied to arm64 (for-next/sysreg), thanks!

I'm not convinced about sorting, it makes backporting hard. Most likely
it would also conflict with other patches already queued. So I only
applied the first two patches.

[1/4] arm64/sysreg: Fix unbalanced closing block
      https://git.kernel.org/arm64/c/00cb1e01cd29
[2/4] arm64/sysreg: Enforce whole word match for open/close tokens
      https://git.kernel.org/arm64/c/2fdbf2ff3884

-- 
Catalin


