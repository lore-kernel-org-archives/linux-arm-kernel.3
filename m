Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C5DCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 14:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVkm8/BDlFWsYBkVSTAlVasEzQcuvOcvwlypHG8CVV8=; b=bpn3mBxe8DVnKNhis53lx6tn9m
	C+T+uXgczLHGzOdq9n85wRp0lNKrgkWTECeIHjZSlCV+duRrK66RM7RSIv/18kQx95g5/sBiFFOU1
	jvwE7tYM+luK4uINfIVr2etV0ngA0ofxVM22+UH+JlxlD3WPFwhu09Ylv+WzRp/Mp+lOlEXQbk+Qe
	2CKZAwXCsF44UyQMyvhV2iozpIQa8/bOosZOyBu1ysjdrmGXrhT5rm03FynltjGs5liqJdky4ZQu9
	OYxgzEdPX/6S8TrnMlZrD6Nv1zEaUJDQAVskTWpKV0ntFOIj6m9WeruC4avBml1775iCIRY3lbSdO
	Ac32FHnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPy2-0000000DAda-0VC0;
	Tue, 02 Jun 2026 14:19:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPy0-0000000DAdD-1Kcn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 14:19:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CFC9B41B27;
	Tue,  2 Jun 2026 14:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FFC1F00898;
	Tue,  2 Jun 2026 14:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780409979;
	bh=OVkm8/BDlFWsYBkVSTAlVasEzQcuvOcvwlypHG8CVV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ghsmBWQwQSlHW0/ktMkKdpvWmx7mBjscnBAlvaoXJ7V5xqdimXqBLPCyjp7hfQFx0
	 MSvx+ZIol/m5pdCC59FQKHT1Di9bSw73IRe/lZP24LbKDnAF2OYeASfjP9DCZY6+pl
	 1mKvPawlLge9Zr9m3Hz/9OFykB0PGG0L1XyVbFuvhPadSAORQxcLrm98U+nqVGg2i6
	 AfRi8mE7mxda0hCfVQp3rHTsOtFU9o6ELO1WtDxEw4dBA0dMi3k7oIdJXl6FkFVbt1
	 j1WLJsFK/nMYGUVVnTFtVA9oqF42+a9fBZx1cxAV8Ftt2b4EFgXuHpBn3jy5w10tOL
	 cRkCGhPmjzJdQ==
Date: Tue, 2 Jun 2026 15:19:35 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH] arm64: futex: Consolidate 'old == new' check in
 __lsui_cmpxchg32()
Message-ID: <ah7md1ha86Anr7nb@willie-the-truck>
References: <20260519090823.7216-1-will@kernel.org>
 <agx9DmAbHdAoSlWU@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agx9DmAbHdAoSlWU@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_071940_740688_F0C71B97 
X-CRM114-Status: GOOD (  22.23  )
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

On Tue, May 19, 2026 at 04:09:02PM +0100, Catalin Marinas wrote:
> On Tue, May 19, 2026 at 10:08:22AM +0100, Will Deacon wrote:
> > The LSUI futex implementation relies on a cmpxchg() loop to implement
> > FUTEX_OP_XOR, as the architecture doesn't provide unprivileged *EOR
> > atomics. Since the unprivileged 'CAST' instructions used to implement
> > the cmpxchg() can only operate on 64-bit memory locations, the
> > __lsui_cmpxchg32() helper function performs a song and dance to marshall
> > the 32-bit futex value into the correct part of a 64-bit register and
> > fill the remaining bytes with the neighbouring data.
> 
> IIRC, the reason for the current __lsui_cmpxchg32() was not EOR but the
> expected futex_atomic_cmpxchg_inatomic() semantics. Looking at it again,
> we have wake_futex_pi() that does something else if the ret is 0 but the
> value differs. Looking at it again, the caller of wake_futex_pi()
> retries on -EAGAIN anyway, so I don't see a correctness issue, it will
> eventually hit the condition.

Hmm, but I think that means my patch does change the behaviour of
wake_futex_pi() in an undesirable way. For example, futex_unlock_pi()
will go round the retry loop for any change in the futex value, whereas
before we would go back to userspace only if the TID changed.

So I think we should swallow the -EAGAIN for the CAS-based cmpxchg() if
the futex word has changed, along the lines of the diff below.

Will

--->8

diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
index db84a7b2de74..79c6d86c38a9 100644
--- a/arch/arm64/include/asm/futex.h
+++ b/arch/arm64/include/asm/futex.h
@@ -215,14 +215,14 @@ __lsui_futex_atomic_eor(int oparg, u32 __user *uaddr, int *oval)
 static __always_inline int
 __lsui_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
 {
+       u32 curval = oldval;
        int ret;
 
-       /*
-        * Callers of futex_atomic_cmpxchg_inatomic() already retry on
-        * -EAGAIN, no need for another loop of max retries.
-        */
-       ret = __lsui_cmpxchg32(uaddr, &oldval, newval);
-       *oval = oldval;
+       ret = __lsui_cmpxchg32(uaddr, &curval, newval);
+       if (ret == -EAGAIN && curval != oldval)
+               ret = 0;
+
+       *oval = curval;
        return ret;
 }
 #endif /* CONFIG_ARM64_LSUI */


