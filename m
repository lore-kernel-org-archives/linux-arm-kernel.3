Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB939E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 16:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+thE8fs3l6ssJzUecHo7Z/0KFZ+qlqgf/A2B4jeGwc=; b=i3IiYWFbBqNQOMpyeCUi8liaft
	uT+E+mtpClGwjOIGAzs4aGtlcyF5D7VgHZvg877owZda7LqjiRv4ql1ItXlUieaphUro2YOwzGxUM
	eS1Yi1ly0pbP0hcl3BAAP/WTBOcyBAci8ETtJee2LoN5LHtp8kfn8R3HJ+Ryl9hKfOwpvIJls8jpU
	jUHYgVEoFE0nDJvCi8+JMIUd9A3/jKCv77rSKDeDd3JLrJye6ZFTujnorBVBOqJGft2GR03bdxWzr
	fRNUgg73fmEdv4Mex17ho9WXdxqRLK7H4j70tFjoCfsihhLiW4X1jcXe1tyfrQhtB6gqnl1A6fhWD
	wNLnKA7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZO4-00000009Hkv-3HI1;
	Wed, 08 Jan 2025 16:58:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZ5L-00000009DHG-32RT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 16:39:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 391905C5547;
	Wed,  8 Jan 2025 16:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E483FC4CED3;
	Wed,  8 Jan 2025 16:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736354351;
	bh=yY5at5aIn3MRzmWv95JNi9saz7slbhEsQ5ueAhtaLtU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rS6u/XKovMOEglFU3aFUsrAx/jm6K5I/vHIMdaJiwAJiAttR6nlZgnhjc+hayZmxr
	 uFNCuHTrCCEN3Fl6BW5HZHCVuWQfx0Lyn3HbPVJeT/1oUWza+CMvf0ntYkcB0ngEVG
	 JGcw6ooPLHDuT65wfIcxhtskkUgND9uBHbsfQ8VlUIQMG/QNcincivc5YLROmBa16s
	 xZe5RqSK2jYWMVa40jROReW/JC+lCFjtwBY3Ia4765Rq0hVLLbqbeIdsLViiRACMep
	 KbTcG+HzUB8WKnMuy0Bpa1+wcsysPz4+U5tEY4NnLhd5r7ft2AWL/OkyQepqPN9ubY
	 JpJlMfFjvRlBg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 0/5] arm64: Support 2024 dpISA extensions
Date: Wed,  8 Jan 2025 16:38:53 +0000
Message-Id: <173634366811.504438.8117405131587549387.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250107-arm64-2024-dpisa-v5-0-7578da51fc3d@kernel.org>
References: <20250107-arm64-2024-dpisa-v5-0-7578da51fc3d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_083911_809065_30BBC058 
X-CRM114-Status: UNSURE (   8.12  )
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

On Tue, 07 Jan 2025 22:59:40 +0000, Mark Brown wrote:
> The 2024 architecture release includes a number of data processing
> extensions, mostly SVE and SME additions with a few others.  These are
> all very straightforward extensions which add instructions but no
> architectural state so only need hwcaps and exposing of the ID registers
> to KVM guests and userspace.
> 
> 
> [...]

Applied to arm64 (for-next/cpufeature), thanks!

[1/5] arm64: Filter out SVE hwcaps when FEAT_SVE isn't implemented
      https://git.kernel.org/arm64/c/064737920bdb
[2/5] arm64/sysreg: Update ID_AA64SMFR0_EL1 to DDI0601 2024-12
      https://git.kernel.org/arm64/c/47e4717eb6fc
[3/5] arm64/hwcap: Describe 2024 dpISA extensions to userspace
      https://git.kernel.org/arm64/c/819935464cb2
[4/5] KVM: arm64: Allow control of dpISA extensions in ID_AA64ISAR3_EL1
      https://git.kernel.org/arm64/c/fd22af17a458
[5/5] kselftest/arm64: Add 2024 dpISA extensions to hwcap test
      https://git.kernel.org/arm64/c/8600640d21cf

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

