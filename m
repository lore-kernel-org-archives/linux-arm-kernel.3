Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42F8C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 15:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1D24s/B4kC6WfBMdmSPBL08uxFBwx3qU/fVDVMraK1E=; b=yAUuECO7hYfisfMY88K7TFul54
	46s+/KRdFjIDWfxoDmvw5UU0WElj8Untp8i1dCkZ0yWqNBZnTN72ki4cs8vZcJ0AoWyU//B6d/dHA
	XSXB1bLhV5UzDKvlyWZz3gLZMtnIvCZ2/gZrTxqM5OedQBCWj0N/lahyZ+QuvLd7DaYX9fizl+vNx
	YOqptVWg6sdvF2BTguNYK3UCgalRzJOGFx1RC0B+QH1+RoQINmToSbP7nzun/99nUGB33e2MdM8W2
	FrHRYBz7ver0nB8mfag7P2GhnTuc3IsLk3meYrmDgsJ26tBHfcT7KYQaGtiIWWcFEIJONgTNoRbo0
	BxXBmd0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxS4-00000003whw-3GIE;
	Fri, 16 May 2025 15:58:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFx8F-00000003sbB-1TrS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 15:37:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C812262A5E;
	Fri, 16 May 2025 15:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9824C4CEE4;
	Fri, 16 May 2025 15:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747409874;
	bh=z4tSAygEeJrgHxjp8RduNrZTO6ccDbYrOyWS4Ye800s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vc/gc3neqXrUFZIaPBCF23eZ2iLdSzCLqkb7x/tOGNiSvRqhqi5HWkfBDirL5W4X+
	 09U0tQiOURkq9DybrHGaNSgS8DTzWs0XAsRbtBanyWkRy36YLXicFNMBe7xYk1B3Wd
	 Wu0EeCAFCg/7pvQzUWGihu7Vhf5w7w5btfarFvtcyV6ljb8FYUkSeYLpVOAugh/mKa
	 dAzVp1oObnxz4UaF8Rp+fgs11hcVVmMRNEekICGYKf6A01xqauQG2fQGdgo7sKzs8I
	 FYeA3dpgbbuhetxHwTk5a7qBK9QAvrMEpV36NFJ0TU1/0icuJ9mJi8eWcfbEVAS0j3
	 ljahUOihKYGaQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] arm64/mm: Re-organise setting up FEAT_S1PIE registers PIRE0_EL1 and PIR_EL1
Date: Fri, 16 May 2025 16:37:43 +0100
Message-Id: <174740439712.2574974.10617041555602541143.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250429050511.1663235-1-anshuman.khandual@arm.com>
References: <20250429050511.1663235-1-anshuman.khandual@arm.com>
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

On Tue, 29 Apr 2025 10:35:11 +0530, Anshuman Khandual wrote:
> mov_q cannot really move PIE_E[0|1] macros into a general purpose register
> as expected if those macro constants contain some 128 bit layout elements,
> that are required for D128 page tables. The primary issue is that for D128,
> PIE_E[0|1] are defined in terms of 128-bit types with shifting and masking,
> which the assembler can't accommodate.
> 
> Instead pre-calculate these PIRE0_EL1/PIR_EL1 constants into asm-offsets.h
> based PIE_E0_ASM/PIE_E1_ASM which can then be used in arch/arm64/mm/proc.S.
> 
> [...]

Applied to arm64 (for-next/entry), thanks!

[1/1] arm64/mm: Re-organise setting up FEAT_S1PIE registers PIRE0_EL1 and PIR_EL1
      https://git.kernel.org/arm64/c/29e31da4ed26

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

