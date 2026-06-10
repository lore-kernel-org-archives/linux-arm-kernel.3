Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C2FCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 11:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35brFKLgI4jP8jMGIASVe52ze60YIKvpJeWjQTiQRpk=; b=nI4Pu64UZUJLZbC3eaJ56GRUZj
	YIRzvR7QJqpBnamnbtt+2kqHzHUHVMeaijpobUEUUmEDB8vyab3zAOH4ilHRZVl+ELy3x/sqC7UgX
	VqqG+vwZStzF3WaOgAQ+hImy7JBOUM1NvTtok/fjwo2Hcmrva5dmcR4V+h4+W4h73f5rPOFytZ2oG
	s8NfZ6ae7KKV7HAz3rtmxHE3oz+8dWqyS0JqQvrcBRKFhPwH/q78Z8gPzrrH+Xz+LOXUNMZm6fEmH
	HjvewNFL41/WzVddUN+Ylg4MtBq0f47b10VnXRO0N5rbjVB4JRzfVMyp/VpvGFdZk/mIaKlq6eUme
	WS9Ecyew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXH6v-00000007X7F-250E;
	Wed, 10 Jun 2026 11:28:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXH6u-00000007X6z-0L9R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 11:28:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7954E44559;
	Wed, 10 Jun 2026 11:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E441F00893;
	Wed, 10 Jun 2026 11:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781090919;
	bh=35brFKLgI4jP8jMGIASVe52ze60YIKvpJeWjQTiQRpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X3qZkJvoEvq9epIvVKXWq9CBcTuqjKAQjN2jjD1wzBWGG6vNi7YzvjNkyrwXonTtm
	 WMz0GYrzVCgfZlTG1kAIzCrfrnTYaUjT23pMm0R07qN6rWfS999GkUC4B4v7+o7E17
	 nepCYgGtE3X2ycKzFnoiTkTf00qXNUevr5onJTL+6WTrXujwJvV+SnpgieYTRtjYOp
	 7Nrqw2yM/8cDqgtxjQRpk7O/Lcrnf0aP/K8MkqTL6aYVuwii/qopMuzWl7H1+Xe3oG
	 8ycqTD2OoKZLYKb/tsmIOCrC5f6jtqpoli2nHwnvH4nI6TlMGr1Ke9ddyqHo3IxUbe
	 1lIQmXzIt4SVQ==
Date: Wed, 10 Jun 2026 12:28:33 +0100
From: Will Deacon <will@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>, jgg@nvidia.com
Subject: Re: [PATCH v2] arm64: errata: Workaround NVIDIA Olympus device
 store/load ordering erratum
Message-ID: <ailKYTOX23EMnJsK@willie-the-truck>
References: <20260605144551.2004391-1-sdonthineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605144551.2004391-1-sdonthineni@nvidia.com>
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

[+Jason G]

On Fri, Jun 05, 2026 at 09:45:51AM -0500, Shanker Donthineni wrote:
> On systems with NVIDIA Olympus cores, a Device-nGnR* load can be
> observed by a peripheral before an older, non-overlapping Device-nGnR*
> store to the same peripheral. This breaks the program-order guarantee
> that software expects for Device-nGnR* accesses and can leave a
> peripheral in an incorrect state, as a load is observed before an
> earlier store takes effect.
> 
> The erratum can occur only when all of the following apply:
> 
>   - A PE executes a Device-nGnR* store followed by a younger
>     Device-nGnR* load.
>   - The store is not a store-release.
>   - The accesses target the same peripheral and do not overlap in bytes.
>   - There is at most one intervening Device-nGnR* store in program
>     order, and there are no intervening Device-nGnR* loads.
>   - There is no DSB, and no DMB that orders loads, between the store and
>     the load.
>   - Specific micro-architectural and timing conditions occur.
> 
> Two ways to restore ordering: insert a barrier (any DSB, or a DMB that
> orders loads) between the store and the load, or make the store a
> store-release. A load-acquire on the load side would not help, because
> acquire semantics do not prevent a load from being observed ahead of an
> older store; only the store side (release or a barrier) closes the
> window.

I think you can drop the paragraph above. A store-release isn't enough
to order against a later load in the architecture either, so we're
clearly in micro-architecture territory and I don't think you need to
describe mechanisms that don't work here.

> Promote the raw MMIO store helpers (__raw_writeb/w/l/q) from plain str*
> to stlr* (Store-Release), which removes the "store is not a
> store-release" condition for every device write the kernel issues.
> Because writel() and writel_relaxed() are both built on __raw_writel()
> in asm-generic/io.h, patching the raw variants covers both the
> non-relaxed and relaxed APIs without touching the higher layers. Note
> that writel()'s own barrier sits before the store, so it does not order
> the store against a subsequent readl(); the store-release promotion is
> what provides that ordering.

Sashiko points out that you're missing __const_memcpy_toio_aligned32().

> Like ARM64_ERRATUM_832075 on the load side, the change is gated on a new
> ARM64_WORKAROUND_DEVICE_STORE_RELEASE capability and only activated on
> parts that match MIDR_NVIDIA_OLYMPUS, so unaffected CPUs continue to use
> the plain str* sequence.
> 
> Note: stlr* only supports base-register addressing, so the raw accessors
> can no longer use the offset addressing introduced by commit d044d6ba6f02
> ("arm64: io: permit offset addressing"). The str* and stlr* alternates
> share a single inline-asm operand and the sequence is selected at boot,
> so the operand form is fixed at compile time; unaffected CPUs keep using
> str* but also revert to base-register addressing. This keeps the store
> side as simple as the existing load-side patching (load-acquire) and
> avoids adding complexity to the device write path; retaining offset
> addressing only for str* would otherwise require a runtime branch on
> every write.

I seem to remember Jason caring about that, possibly because some CPUs
are very picky about write-combining?

Will

