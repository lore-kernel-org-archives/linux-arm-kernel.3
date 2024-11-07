Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5471AD43352
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 12:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GK1QvxHH12p/14X7vT0YiXJFNfABlzSptAdq2oN0yZY=; b=YvyY5Ug0EdcrF4iXDtgbw1GD99
	dqu/yxaFfaFAAUAIlsV0FNafrq/UVtTEpuS2xkgg0qa/dBEWsvF+SCa6GlqcA/P8UED2KfWiGuEA/
	WsGpLqn0ZWgiJX05Pwy3tQ1/sGpYlTS/6iZ3uxNm9zsLMyoUaMK/N55OvOY3HQ+0uZir8tinWWrh+
	FEYOG6dk890tTPuoVhA9Oml+nISkW921HrHtrtWePQ4LIxWvc8/YcnWj7V+GcwvyqjqE9mAFEbcEh
	nXc0viMRvG47zswGkU9xerLk3isJ/9nbStTR/EN7JFjSQw1hAFrs121qmN/xu2ZfEr/LYfRemfvTO
	y1AZIyIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t91Zo-00000006vNI-25ny;
	Thu, 07 Nov 2024 12:25:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t91U9-00000006ty0-3ELU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 12:19:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AF9A7A41CFE;
	Thu,  7 Nov 2024 12:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7012AC4CED2;
	Thu,  7 Nov 2024 12:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730981976;
	bh=tav3DE8VF7Wjy7Gk/JzYApcdv4trAn29ouTnbJqTPLE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QNwjWDsMxKqC2wtuI4g5vPLzTxnO9zxmi39YyuQooFeTMLUz1pgbjdibszg8zo2bb
	 f9BYJpwchESIlO0B6vZ3XReuuiW/2kp1S1NesZemLeW0QVOjo5FimxWftcKyNhZ8L+
	 eE6yR13OIAOzfQ4cMhwg1LH10vAxLrrTaMy/KZtMCFkm0kup4LzOdgYqXk9xVHMOX3
	 6R2YCrCh8D9HtWC5muI2NdNuZWccLXSRD0hCzBbRjWI+q4gqdJAinjipd08/A/wK5k
	 2OUsjMzXYy+2KeTaUr2rG5eqyabFm81icdD3uHoIe39DSNNghgZXPvmlfhRUTiX+cB
	 WL+FGOVrL5xcQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	ardb@kernel.org,
	broonie@kernel.org,
	maz@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: smccc: Remove broken support for SMCCCv1.3 SVE discard hint
Date: Thu,  7 Nov 2024 12:19:28 +0000
Message-Id: <173097833407.164112.5523983482147040653.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241106160448.2712997-1-mark.rutland@arm.com>
References: <20241106160448.2712997-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_041938_042097_C9677763 
X-CRM114-Status: UNSURE (   8.81  )
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

On Wed, 06 Nov 2024 16:04:48 +0000, Mark Rutland wrote:
> SMCCCv1.3 added a hint bit which callers can set in an SMCCC function ID
> (AKA "FID") to indicate that it is acceptable for the SMCCC
> implementation to discard SVE and/or SME state over a specific SMCCC
> call. The kernel support for using this hint is broken and SMCCC calls
> may clobber the SVE and/or SME state of arbitrary tasks, though FPSIMD
> state is unaffected.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: smccc: Remove broken support for SMCCCv1.3 SVE discard hint
      https://git.kernel.org/arm64/c/8c462d56487e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

