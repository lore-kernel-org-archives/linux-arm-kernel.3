Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEF4C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 11:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c85a1fkXYOjGQY9mFkBp2xWKtyhivAgjHXdDuA8rKKw=; b=QZgztD7cRRm+RThc5hAbs/YLDW
	di9Og9F1mVAFttCUBJi8Lox0rEf9G0ERvNxNnB5fUMeaB2EUP319SyVC5Z+7wcW985mHKrk1V9ezA
	cL9vU6yi8LjqHPANXC3w6NiFsT+87jDVzFNG1djA/aWsu7dpSlHmlw9dzgAUSOs88ofs8Bnre6TYj
	lEUBERxDVtXG6uT1bfRrDahyhSF+ZBOR8mIuPZL4FS/Jyw7uyPOEDc8Xx+avlI6csJ2bY5x9UE/P6
	0jIbFWRSO5biPKJcLGOEDrTRFfMjO3tGXS1Yy/Jon4LZNXWKV/vOaSbC1eyljqEWHrQMAEXpalLW+
	rzNzIL9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhIV-0000000FaHW-2wYR;
	Wed, 21 May 2025 11:07:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhEF-0000000FZmh-1lNb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 11:03:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC7B25C5762;
	Wed, 21 May 2025 11:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0738DC4CEEA;
	Wed, 21 May 2025 11:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747825398;
	bh=QAUAYNKmlM0RlaNjGicH9GqKIAhlrFtqHhssH2BVJ88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VtShJ3KJfMOydCfX5LajLrW/grN0PgqMTvj8HUyAMTJ5FEC1IsFZMNmbHkxRz87Xz
	 UkbWY81F+ziNXmhvlfU2JLD4NvHSCGjDlybRT19p8UrwW8Vp2AUaLTBRl5HY4FPEhF
	 L0ceKaiyVl6ctqBuDIzw9rSu7lzWfTWsV+KFVhJd2VhtLoxMRuSdqUXMbaUFMlYUY6
	 fGlMt/nulJ2DFsJ+T3D5JJwWcjlqWF7qjCGOk+W3Jc+HVrSyPIVzDEkc8ZlOPlP+pX
	 sYB71O1EVTh1ixylTXJDmFRLmL3fcachHtO1Vu8T/T7obmGPUSweDn6Tz+Cd1fzFlR
	 EGKRY/rOOkROw==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Dave Martin <Dave.Martin@arm.com>
Subject: Re: [PATCH v22 0/5] arm64/perf: Enable branch stack sampling
Date: Wed, 21 May 2025 12:01:18 +0100
Message-Id: <174782307035.3423409.3825975640964405604.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250520-arm-brbe-v19-v22-0-c1ddde38e7f8@kernel.org>
References: <20250520-arm-brbe-v19-v22-0-c1ddde38e7f8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_040319_499136_D4419796 
X-CRM114-Status: UNSURE (   9.60  )
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

On Tue, 20 May 2025 17:27:35 -0500, Rob Herring (Arm) wrote:
> This series enables perf branch stack sampling support on arm64 via a
> v9.2 arch feature called Branch Record Buffer Extension (BRBE). Details
> on BRBE can be found in the Arm ARM[1] chapter D18.
> 
> I've picked up this series from Anshuman. v19 and later versions have
> been reworked quite a bit by Mark and myself. The bulk of those changes
> are in patch 5.
> 
> [...]

Applied the '__init_el2_fgt' label cleanup to arm64 (for-next/entry), thanks!

[2/5] arm64: el2_setup.h: Make __init_el2_fgt labels consistent, again
      https://git.kernel.org/arm64/c/54b8070548c6

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

