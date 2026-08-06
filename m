Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC4CC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5peSsV4Fet83eoAc7pFmTttEfkfErThN+j0rXJuCY0=; b=RbWvUPaLYNGmvniRdUB8DPHse9
	Zhau1NlN1hE63gcBJrb5b4/LMfEIEUsGnO23Aio6I/H93rQvip3Mroq87c2dPMBDgSJ7toPNqeMer
	sUJCkOwc7sXh94EiTHDjGPmcVU9rVPEp1+qaTugnGi6xW0Rlr9I/tZBxuaPbo+//ZmLp7exvHvGUT
	xNsQ6BUnIqcJWGzaNmqBSExhjEc2tHSGd1kRGw3ARgR3E233wkNAeswPmK9JK4Gpb8F6GQJEt9GyG
	3Q5R4Spb4ihbIfzMpJuhcl3LAw8lmOFKbY+ImLPT+WxrRh9JaR1wtcqMNWxMozq3JtpLT1YHA7bJH
	KtXPb3Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1dZ-00000006KYP-35xo;
	Thu, 06 Aug 2026 17:12:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1dW-00000006KXG-2PkH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 17:12:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D70C460AB1;
	Thu,  6 Aug 2026 17:12:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 673EC1F000E9;
	Thu,  6 Aug 2026 17:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786036325;
	bh=M5peSsV4Fet83eoAc7pFmTttEfkfErThN+j0rXJuCY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LLPw2DFA/V5DF4Ep6Orf/jcm2x1g5g83BRCcxYNCLVkSyXPm+o3Yk6BnSsIFgmzE0
	 RZKQG3dlTEkTvLMSHAf4bQbnp1Rv4HZIeS7NdGZvXrLlOPXMZ1CjrvX50Jzlc9wpeV
	 yChfABFvj3TeNtJb/YGMurAzNRRyMuxNrQqtVmJrLosPOL3FD6SOwjLEX6Yj9A0LJr
	 uisODTS/geQPo9bXtlC4JUdNqWsJl6zo0n9xKm6bCVK4WeKdYW9pOOYq6De4rS23gi
	 Gh1OsFDUAEgQN+GF4sR3Qz06zm3gHOSeVlUvYJBlHnxcGyuDdl0T+2i0/PVcGS1EO+
	 hs1ZZI6Ck/nYw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/6] Add BBML3 cpu feature
Date: Thu,  6 Aug 2026 18:11:40 +0100
Message-ID: <178601813324.394484.11007174313054248496.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260723044034.2983651-1-linu.cherian@arm.com>
References: <20260723044034.2983651-1-linu.cherian@arm.com>
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

On Thu, 23 Jul 2026 10:10:27 +0530, Linu Cherian wrote:
> - Patches 1, 2 and 3 adds more cpus to the bbml2_noabort
>   support list. bbml2_noabort would eventually gets renamed
>   to bbml3 in a subsequent patch as they are functionally
>   equivalent.
> - Patches 4, 5 & 6 introduces BBML3 cpu feature
> 
> Changelog from v3:
> * In order to cover future C1-Ultra and C1-Premium cpus starting
> from r1p1, replaced MIDR_REV_RANGE with MIDR_RANGE in patch 3
> 
> [...]

Applied to arm64 (for-next/cpufeature), thanks!

[1/6] arm64: cputype: Add Cortex-A520AE definitions
      https://git.kernel.org/arm64/c/482145e0327f
[2/6] arm64: cputype: Add C1-Nano definitions
      https://git.kernel.org/arm64/c/357230cb5276
[3/6] arm64: cpufeature: Extend bbml2_noabort support list
      https://git.kernel.org/arm64/c/a7ac60414475
[4/6] arm64: sysreg: Add BBM_3
      https://git.kernel.org/arm64/c/e4fa24624308
[5/6] arm64: cpufeature: Rename BBML2_NOABORT as BBML3
      https://git.kernel.org/arm64/c/94104e3cfa80
[6/6] arm64: cpufeature: Detect BBML3 based on ID_AA64MMFR2_EL1.BBM
      https://git.kernel.org/arm64/c/879aca5119cd

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

