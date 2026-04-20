Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DB8F588C3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Flv7WDVHKTQCMJsNArvsES/Rqc/yEc8FiZFn6Pz6tSk=; b=DtnXfvcX9CJ948KfdXvcqN4n1c
	t3elCMU9Z1nUu4C8gRdVj1Si4xaf45jnToHl0qeognC9YwbyIcFLF1w/95wzwpB+MUxpW2xceInw+
	3nR5ejRZGZyhIZmhB4mtogpGZroiQObHF6FjDTUCVyWXGi1XV1uiAZgtLHCIxjRDeJndKpFPlwfcX
	BaF8Vgrl3Fo3vcaQ0he1q79EZVdenG3r37kbAWCfJMYAb11OaOwitNdytIe6wyOvp+VPw4NHI0oGC
	9auF0Jt31F8yhSGoFsox8e4G1piSzCWqwbWo1KoppfNthYMYz/HQ1S5uwlk4lKhw05UkbKgc+3OAR
	SAbJwK4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoTR-00000006xqp-2a0y;
	Mon, 20 Apr 2026 13:15:37 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoTP-00000006xqO-1r09
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 13:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Flv7WDVHKTQCMJsNArvsES/Rqc/yEc8FiZFn6Pz6tSk=; b=fMTifmRAn0s5rvDKP4iNbixWrK
	/1dWcVNPgY2m0ElpTC8rnQGeR/KlcCv0zflvBSDQyR9hb0QmLteg5BrS6P7TKcs/EmCWU6TgcwIp3
	9d1recpyzJHZECYviBu0LI96Ygu8K8FAFbbqLYEHWtUV7wBEnYraDbRqy5x7ti8vjLAqUoUZ7JbWO
	OYV2KFgJ7xeNagUILHQHgkhdedI4M4yNu7MBK7CJewQTGLYT7QV9cfTYC3EpSlPrWrIFgK/XpBKoE
	6Tws+r6I6cvILRxo1OKXgq36Agy68ding4V1mtQ5S20CDDHrsjJobhATFnXNIshWc828PLyoluXPi
	rMIg/W6A==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wEoTJ-0006fQ-0P;
	Mon, 20 Apr 2026 13:15:29 +0000
Date: Mon, 20 Apr 2026 06:15:24 -0700
From: Breno Leitao <leitao@debian.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, leo.bras@arm.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, 
	paulmck@kernel.org, puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH RFC] arm64/irqflags: force inline of
 arch_local_irq_enable()
Message-ID: <aeYmHr_lgPJbBoL_@gmail.com>
References: <20260420-arm64_always_inline-v1-1-dba919cf46bc@debian.org>
 <aeYkz_4WKDdb1NTp@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeYkz_4WKDdb1NTp@J2N7QTR9R3>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_061535_543855_DAA49F88 
X-CRM114-Status: GOOD (  16.06  )
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

On Mon, Apr 20, 2026 at 02:06:23PM +0100, Mark Rutland wrote:
> On Mon, Apr 20, 2026 at 05:42:11AM -0700, Breno Leitao wrote:
> > arch_local_irq_enable() is a small wrapper that dispatches between two
> > unmask paths: __daif_local_irq_enable() on most systems, and
> > __pmr_local_irq_enable() on builds that use GIC PMR-based masking
> > (Pseudo-NMI). Both leaf primitives are already __always_inline; the
> > wrapper itself is plain "static inline".
> >
> > In practice the compiler does not always inline the wrapper.
>
> I think this was my mistake, and we should have marked all the helpers
> as __always_inline for noinstr safety, as x86 did in commit:
>
>   7a745be1cc90 ("x86/entry: __always_inline irqflags for noinstr")
>
> I think we should mark all of the following as __always_inline in one
> go:
>
> * arch_local_irq_enable()
> * arch_local_irq_disable()
> * arch_local_save_flags()
> * arch_irqs_disabled_flags()
> * arch_irqs_disabled()
> * arch_local_irq_save()
> * arch_local_irq_restore()
>
> ... which then ensures noinstr safety, and has the side benefit of
> giving nicer traces as you're suggesting here.
>
> Are you happy to try that?

Absolutely, I'll work on testing it that and put together a patch
addressing all of them.

Should this be targeted for stable backports as well? If so, which
commit should I reference in the Fixes tag?

Thanks for the quick answer,
--breno

