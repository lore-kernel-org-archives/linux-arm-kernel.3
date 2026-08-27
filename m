Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E6BC61DCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUzJ1oicaQKOuYkLTR0Ojyn98UVxpazRVOZwD/AFTqc=; b=3QX3Y6jQeE/VpvcgvB8xHNeWCI
	ze2o90X49RbPWFgf1EuNNQuPvKmf4UfyCdmIUG9Al3V3wfC5Geddfz9pA+I8B8J5yKEjDZiE1fFAc
	FrWcB0Wa5YdrzZrfGoud54pp+P5btN/dWZZk/YWFhbHT8TDWUCb5+7xVsJLO1aUULu8dN3K1QS0GH
	mpvyQB2rf24sRhUY4BXhgOjH0+va18tjKCwOgeo/EICRfWNLMpDUMBPKEcBea5qoBA/NzQL7LV262
	QUSJY1em3tHyBkfSpH7kfO5MB0dJA/dSMVIYigGdKBAdZbYX7nJG5Nbs5L1+WqdmPxfYHesapwYiW
	zcT9nbEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzbwG-00000004Etc-34lY;
	Thu, 27 Aug 2026 15:22:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzbwF-00000004EtU-1WmC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 15:22:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 78983600D4;
	Thu, 27 Aug 2026 15:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 302CD1F00A3A;
	Thu, 27 Aug 2026 15:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787844166;
	bh=mUzJ1oicaQKOuYkLTR0Ojyn98UVxpazRVOZwD/AFTqc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B0LsRI2vsCGCKmvyDxhmaS5dtRSqf2tH1uJUsfkJptmci/Vw63a0C9J/dvYGn+zKD
	 1UkReGIzSk1p16vMggyiBeqhMprtrqiAX+8lgMrqTqYZHwshqSjjy4zau05zeO6w0V
	 guEGDuImyf55SQeq7bX2tfNvJhFDKSUlGZh2HXYbMgpL9xJHw/ic+p0ysbOL6c7daA
	 nnvOtpZbf+IWFGYFNJCR5NKVglDHIaI+pJml07XlqBgZy+BxvJ8QP6sqXBb5Ua0R1y
	 MPZ3hRak/YZhuqYfZu8boyxkhCkBSaXmxuI3MwlgP68WMNovUUg43xcC7Qdimky7pC
	 T7b+ZnGxxVReQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Karl Mehltretter <kmehltretter@gmail.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: compat: Fix decrementing LDM/STM alignment emulation
Date: Thu, 27 Aug 2026 16:22:37 +0100
Message-ID: <178784016455.65228.15282615597317035882.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260819222712.81855-1-kmehltretter@gmail.com>
References: <20260819222712.81855-1-kmehltretter@gmail.com>
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

On Thu, 20 Aug 2026 00:27:12 +0200, Karl Mehltretter wrote:
> The compat alignment emulator inherited unsigned long data addresses from
> the 32-bit ARM implementation.
> 
> In do_alignment_ldmstm(), nr_regs is an unsigned int holding the transfer
> size. The function uses the same address addition for both transfer
> directions, negating nr_regs first for a decrementing LDM or STM. The
> 32-bit negation wraps before the addition, so the handler adds nearly
> 4 GiB instead of subtracting the transfer size.
> The resulting address lies outside the compat task's address space, so
> decrementing LDM/STM emulation fails, while incrementing forms work.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm64: compat: Fix decrementing LDM/STM alignment emulation
      https://git.kernel.org/arm64/c/f5b8b9037df3

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

