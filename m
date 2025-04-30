Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A73DC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 18:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDJHPvJR9qH3JbCio7ARN+I/LBgvkQysuVzkPNp2pnA=; b=bCs2tTylKji/48GCjWijn1I7KX
	JSbMsVQr2N82u0fBLRiQTilaklF/PRzggmVS48BSgsv3pljEGxUwyAEJR/fyjkfhgQwXqrDtBm49N
	LCbHv5y0paVr9S+LqoVMh7fcrHeNg23garHtiwMJo8vbpEBDglSr4slxwYnYSFKk75uMLWyQUhPm1
	ee2h0ftkJ2ngJ44LYxKpeRmMrKeOZ2yEg/WInx/zhyOy5DnKa2POBrx2cqgk4+nTEotwe4zdZ14a3
	MQ2o205scql5Lj6XbEvv4QqTh0BSLmAgThiqFgCXVl6AqpuzxLgpyqi97a2VOCIdZSE59fveJ2QmV
	cgHrKf9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAByM-0000000DfUO-494z;
	Wed, 30 Apr 2025 18:15:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uABwR-0000000Df1z-0xTB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 18:13:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 432D86848D;
	Wed, 30 Apr 2025 18:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF24C4CEE7;
	Wed, 30 Apr 2025 18:13:52 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>,
	broonie@kernel.org,
	maz@kernel.org
Subject: Re: [PATCH] arm64/fpsimd: Avoid warning when sve_to_fpsimd() is unused
Date: Wed, 30 Apr 2025 19:13:50 +0100
Message-Id: <174603666313.1270830.16332680196775080533.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430173240.4023627-1-mark.rutland@arm.com>
References: <20250430173240.4023627-1-mark.rutland@arm.com>
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

On Wed, 30 Apr 2025 18:32:40 +0100, Mark Rutland wrote:
> Historically fpsimd_to_sve() and sve_to_fpsimd() were (conditionally)
> called by functions which were defined regardless of CONFIG_ARM64_SVE.
> Hence it was necessary that both fpsimd_to_sve() and sve_to_fpsimd()
> were always defined and not guarded by ifdeffery.
> 
> As a result of the removal of fpsimd_signal_preserve_current_state() in
> commit:
> 
> [...]

Applied to arm64 (for-next/sme-fixes), thanks!

[1/1] arm64/fpsimd: Avoid warning when sve_to_fpsimd() is unused
      https://git.kernel.org/arm64/c/f699c66691fb

I did not push it to for-kernelci as Will took over the for-next/*
branches (might as well have left this patch to Will).

In general, slight preference for __maybe_unused but I agree with you
that there's already precedent for static inline in this file.

-- 
Catalin


