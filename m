Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C030CCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSDPkRUUJC/bV8tedmxXW4GHFzaVR3KOKuUCBGSDWus=; b=pwXs4/CZvriyY1PlhsjelSm7tR
	hATdu410+Ivjto3yUSxikiryuQUIAPHcfO3eWsLC4KiHgmPYorRElWBeWvSF7SBM5WgqDtIWKEcdL
	V15nJEZqG5EEXGdy4oR0QZ+9dL2sB1jMm5bMHT2WSj8wEvLz8ZkuEWs8MlQz74UZnYIJCLmHWblvO
	IsSOAOr08s1XP/T17Io2r56JSLRxy0IxR3Z9mWV8FlxBIHM91JoWjxyWVyN7dbi32kTi58TtCl4Eu
	2cjOMA1WLJTf8HlwgAF/aiBE2jxhtZZbOQuvzH7qVVk/9kMEs8lwwivTPkmesTFBzkvKNXCdi8dVk
	zGkn67EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzL9-00000007F8R-2Hvp;
	Thu, 21 May 2026 09:05:15 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzL7-00000007F3R-2Gvc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 09:05:14 +0000
Date: Thu, 21 May 2026 11:04:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779354295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fSDPkRUUJC/bV8tedmxXW4GHFzaVR3KOKuUCBGSDWus=;
	b=fd6DhrsOkDkVlvJmnojDSYTfvxgdDuEFW0nykKnpcXFVv6JGL2tKkOziAGd1u0pcwu5pD/
	+67Hv5MavnqkZ1tfiFmGjH4Qv52WmwyI6Znj/nYQyvZA174tY3OlZM1t8YGDGOjzJay9Ka
	ZuVkn9Nko7R5zjLG988KjO/f4b83dl06WsZYmxYPtQPZ8u+YlkI5jEQr1/Iw5zR0AcJteN
	ou6yERi6jYswvjfI11ETBPPuU9pXGNyyynpGxzZkfwFkEQ41dPNGBEBQVijDOCApUfXW67
	qloChEmysIhRZmVP5gKSJ2UDKTTgFERnTb67OL+LqgNsNKAV0WodHinquaHxkQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779354295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fSDPkRUUJC/bV8tedmxXW4GHFzaVR3KOKuUCBGSDWus=;
	b=w6ZCIvILEIf2lo04wU/0+32CTneX/5/eJI+XnLzI/3gDgC538g4FbafFduGE4apaApx0lv
	TTY1RPCizLMCfcCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] irqchip/exynos-combiner: switch to raw_spinlock
Message-ID: <20260521090453.bbUZ00tS@linutronix.de>
References: <CGME20260520220432eucas1p10502ca0f9368bd6de5ce027ad8170109@eucas1p1.samsung.com>
 <20260520220422.3522908-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520220422.3522908-1-m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_020513_722647_561FE85F 
X-CRM114-Status: GOOD (  15.80  )
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

On 2026-05-21 00:04:22 [+0200], Marek Szyprowski wrote:
> The exynos-combiner driver uses a regular spinlock to protect access to
> the combiner interrupt status register in combiner_handle_cascade_irq(),
> which is invoked in hard IRQ context as a chained interrupt handler.
> 
> When PREEMPT_RT is enabled on ARM, regular spinlock is converted to a
> sleeping lock (mutex-based), which must not be used in atomic context
> such as hard interrupt handlers. Switch the irq_controller_lock to
> raw_spinlock, which remains a true non-sleeping spinlock even under
> PREEMPT_RT.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Fixes: a900e5d99718 ("ARM: exynos: move exynos4210-combiner to drivers/irqchip")

For the change based on the reasoning
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

but why do you need a lock around a single read of a register? 
As far as I can tell, it was introduced in commit
   84bbc16c1f621 ("ARM: S5PV310: Add IRQ support")

and then dragged through the kernel, merged, renamed, unmerged until it
got where it is today.

This
	https://lore.kernel.org/all/1277476037-8806-5-git-send-email-kgene.kim@samsung.com/

is v1, as you see the lock is used in multiple places. Then someone
asked "why locking"
	https://lore.kernel.org/all/20100628144743.GB3287@debian/

and in v2
	https://lore.kernel.org/all/1279270714-15146-5-git-send-email-kgene.kim@samsung.com/

it went down to a single user. 

It looks like a leftover from initial development. So it would make
sense to einer remove it or add a comment why it is still there after
all these years since it is not obvious.

Sebastian

