Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EA7FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 12:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVuvNrA4wD8kvJACQ44Kns/X9yvEUm3Bt18ZD5R7lO8=; b=rtEUsnB7kCLfgkHTIwND6XgVBm
	XagKY4p4amUs4jRqRLwMQJ/f2V1u4sI2b5o0hgfJ2vpGamAz0qdgE5oG/o3n6a9K7J3zxP0rK/2y1
	S7SEq5N5D/vy7gAx0vynL5nUWyvYuiBzTdY74R6huqqGt20uTzha5asPiLbRvFQfKdqVwE2NAeWz5
	l4Q8y1nt09Bcomqc9g27fCC1ryQrxjV24PnZpf5qj6DyA9ZutZ5e+DcQyMEwye/idHxF6LBz5SDOb
	R4M0GDXlcLBoo6rMsF2yn/Oocom2WN0QJKJO25vpNJ333r5o1TtbuC7wJcrdnOtf7xs0eT/E/SbGg
	mIxR5wUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHL2r-0000000GuJN-0Uq8;
	Mon, 27 Apr 2026 12:26:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHL2o-0000000GuIY-2fYk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 12:26:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9C7B1FC7;
	Mon, 27 Apr 2026 05:26:25 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CD963F62B;
	Mon, 27 Apr 2026 05:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777292791; bh=M9UMTZfbZHPdwYV6PO1IZaksCPche9xXpWVeL2fDNEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gVhoi58eX9v5xj8CETk3WsWBxZ7tC4TR1j8joXFUtHYFxVQVCkCE56gOZDwxYdm7Q
	 GoE+sJ2gCqAIF1fCriVbOOoZl8vi8wB0pV40DutW8+eoH7ew9r79Ia6UrggZUOYh/5
	 kznEKHd5WtYyzBe1ReCFGhkJHtYUWRQQ7Ti5AZUo=
Date: Mon, 27 Apr 2026 13:26:18 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Will Deacon <will@kernel.org>, mark.rutland@arm.com, leo.bras@arm.com,
	leo.yan@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, palmer@dabbelt.com,
	paulmck@kernel.org, puranjay@kernel.org, usama.arif@linux.dev,
	rmikey@meta.com, kernel-team@meta.com
Subject: Re: [PATCH v2] arm64/irqflags: __always_inline the
 arch_local_irq_*() helpers
Message-ID: <ae9V6jrYEwa6Uwqn@arm.com>
References: <20260421-arm64_always_inline-v2-1-c59d1400514d@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-arm64_always_inline-v2-1-c59d1400514d@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_052634_715978_5426F32E 
X-CRM114-Status: UNSURE (   8.20  )
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

On Tue, Apr 21, 2026 at 08:58:57AM -0700, Breno Leitao wrote:
> Force-inline all of the arch_local_irq_*() wrappers so they cannot be
> emitted out-of-line:
> 
>   - arch_local_irq_enable()
>   - arch_local_irq_disable()
>   - arch_local_save_flags()
>   - arch_irqs_disabled_flags()
>   - arch_irqs_disabled()
>   - arch_local_irq_save()
>   - arch_local_irq_restore()

I'll queue this, thanks!

I think we should also do local_daif_{mask,restore,inherit} as they seem
to be called from noinstr locations in entry-common.c.

-- 
Catalin

