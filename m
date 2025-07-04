Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F4CC8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 18:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LjcS5PcE7toG1Lrhz+vFZmgut169ulFiZm/4d0ZVyw=; b=kZeCpw9Z5YW4K4fJRz6UukiyVo
	2tTMFwsCdLlRGA1YhlvLogEWfP/KYf6+ViiJQw5R5ViVyEjvNqstpr/q5v77nT6DhbtgAwN+VN/tC
	oQRLyCDG+1USIcEh2d8GPG8+0zVDBYFfveGGyzyPY8HcE5whaM9EvkwSTNyGGeFIru5dMQQ1PrkYU
	QiNUOAUmc9gpMbmrQMnznCucgmTj/msx4KevC/gFTRSoyG+m9ndI16kPWaRJ+otFGstbeEuXCkBj/
	o48auDyE+Ijz26JdbRuwBrIpPoBa0IZDALnoVLa5zGh3W6CLPkxpzGBFKPoXJkAaM4RkCzHtngfBL
	WYVMBRXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkuO-0000000FBIk-3NDX;
	Fri, 04 Jul 2025 18:13:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkSs-0000000F8GJ-3tTx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 17:44:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C40961468;
	Fri,  4 Jul 2025 17:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DC2C4CEEE;
	Fri,  4 Jul 2025 17:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751651086;
	bh=uSAXovSmsJbebAOMFwOrFDSweVrOExAuRCTg0nKUGKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D2qOsZrmDpiJFvmgunPkT9N20bDtveT5seeQ7bnQsI0/cb+dosVbn8hsfF7WD6a+x
	 5K3yq5lLpuhCUDba05rAoCn7vVdSAyDVc+bruX1w3wR4uQxs4MB3LniVaAZWQK74Sn
	 5Hc5CniubGqo69cAWY95oVJkPiDMBu9JLof9lkGhLwhdMfnVqvmqFhskng5iRdaHp7
	 qlUNmkR4I+bUdtDHIKAv7cjKqSUQjgThGCwoNzU9hStvJCx1bHBbFBIv3LBjXVi2Gw
	 yuUszZWzVMuhyYhPbFMLpwfZSUTSVUpF8atqcO+3jaHcuRWlLL0G8c+jXVZrlApLAO
	 6sFq3Kw8op46A==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] arm64: Unconditionally select CONFIG_JUMP_LABEL
Date: Fri,  4 Jul 2025 18:44:16 +0100
Message-Id: <175163687202.1322627.833974757174570861.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250613141936.2219895-1-maz@kernel.org>
References: <20250613141936.2219895-1-maz@kernel.org>
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

On Fri, 13 Jun 2025 15:19:36 +0100, Marc Zyngier wrote:
> Aneesh reports that his kernel fails to boot in nVHE mode with
> KVM's protected mode enabled. Further investigation by Mostafa
> reveals that this fails because CONFIG_JUMP_LABEL=n and that
> we have static keys shared between EL1 and EL2.
> 
> While this can be worked around, it is obvious that we have long
> relied on having CONFIG_JUMP_LABEL enabled at all times, as all
> supported compilers now have 'asm goto' (which is the basic block
> for jump labels).
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: Unconditionally select CONFIG_JUMP_LABEL
      https://git.kernel.org/arm64/c/727c2a53cf95

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

