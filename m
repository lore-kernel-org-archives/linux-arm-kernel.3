Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1BECAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 16:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04UO5Ij8ql3jP6MrZszmratUNyibkCa0HZDv9taJY6E=; b=usYP3PMoKg6OeWdCyrS/zs27Pg
	3blKTxUHCdorhml8MBC+H8PwWOBeWS6y9GuuaL3dztaDEmVaHOSUBS3mHEb4xeMC1oHzs8TrwYHDA
	q/6UmCvPJ+4bbIn7dPifDNpkSvgSlgfA1Fq+cOKNda2R3PDcaFUwaWbJ7iQinsnNZlXenMLwNDX75
	RqhZgjar/BEKjx/eIGHaD+iC8XIYsmmj3ZQci6Bi/ZHkxvZZEnu8IpGhtY1Fyn0fBdSudiEFr1x+m
	8v5oKxIu+SBsgcR+DfuGyJA1lpKTsPPHNGfVJW3XuHbQWuDYYq5ITFwTsQnCWcGDZWd5Np/mLMnep
	gfBv2mUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHjA-00000000ev3-07nz;
	Thu, 18 Sep 2025 16:43:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHj9-00000000euw-1gU9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 16:43:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CF09060207;
	Thu, 18 Sep 2025 16:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6CFC4CEE7;
	Thu, 18 Sep 2025 16:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758213802;
	bh=Hj8pTaQfwTaM3cwtIdwgHTA6BIscCoAxZ6jBPJ5Yk74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MzT016lF5TBlLBjwTa1uAzTe90ShZG7KFJ6tHUwl7fSx12bW3Q49zKhwKI/si1F+s
	 ya6CzK2u3C7M/JOHvbr9Gb7gt0CEA8z9OBnixmEn18IVy3CV3AcOSQv/FiSxc69CnQ
	 r5800M9Ftmptj7H9fGsY2N6J8jeOLE2Vq6dYjW2701+5BRroHCtPDATKRxsb/98WFm
	 QZn0qsl4YerQczKD5J6N66xBLuJ6WfS1VWRutm8mWYUeJUaiif2IDwgJMePXX7mfSN
	 H5Pb30xsUFzbUsN082PTDxLKM7KeH7rGbNeZ5JPwI2qIJPrG/QBMQpIYpzYm7Zf1PM
	 /wGgTZZ7a4Kyg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Oleg Nesterov <oleg@redhat.com>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	David Spickett <david.spickett@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Luis Machado <luis.machado.foss@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/5] arm64/sme: Support disabling streaming mode via ptrace on SME only systems
Date: Thu, 18 Sep 2025 17:43:06 +0100
Message-Id: <175819643529.3451422.10117622348778381735.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250820-arm64-sme-ptrace-sme-only-v1-0-f7c22b2871f8@kernel.org>
References: <20250820-arm64-sme-ptrace-sme-only-v1-0-f7c22b2871f8@kernel.org>
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

On Wed, 20 Aug 2025 19:29:02 +0100, Mark Brown wrote:
> Currently it is not possible to disable streaming mode via ptrace on SME
> only systems, the interface for doing this is to write via NT_ARM_SVE but
> such writes will be rejected on a system without SVE support. Enable this
> functionality by allowing userspace to write SVE_PT_REGS_FPSIMD format data
> via NT_ARM_SVE with the vector length set to 0 on SME only systems. Such
> writes currently error since we require that a vector length is specified
> which should minimise the risk that existing software is relying on current
> behaviour.
> 
> [...]

Applied first two selftests to arm64 (for-next/selftests), thanks!

[1/5] kselftest/arm64: Verify that we reject out of bounds VLs in sve-ptrace
      https://git.kernel.org/arm64/c/dd68f51febbd
[2/5] kselftest/arm64: Check that unsupported regsets fail in sve-ptrace
      https://git.kernel.org/arm64/c/09b5febf8426

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

