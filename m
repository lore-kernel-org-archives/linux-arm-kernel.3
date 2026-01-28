Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D9AD3F097
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 17:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tn4g/9//RsuI8p+PfBKBMGxP/jMELrcAL7s9pAP33WA=; b=Q43waJHvW4MWYFLPdgzz45jgJ/
	vIrVw9j7mdHPNvbxqkDW+xu012vpiFs82MPa1Nzvnwbg0rBV9T8tVjB4izm+71IvffkmCZQtK8mG1
	96p6gLLI3S1Xk0Nm7PuEHWDXw9P4xQbX1WMALbNlfOthzZdhU0IOyMh7gedjRBVEfTJnkwp/1Insh
	WIGA43qLgWi0WrWcBBiIFLIH8Mqc0yIySuFKDhQkn5n3GVaUsAbtpxBdynpQkgmfS/4JWDF+kdYlp
	/jqcgaGZ+3U3ZkC2xI+Oop+rZa6rmoKAO5i3Y+oQFcapRRACUrJHfX+sZN01YCzTP4LRM3a6y6rWq
	P/97zhwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl8uX-0000000GR6Y-35dZ;
	Wed, 28 Jan 2026 17:00:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl8uV-0000000GR67-1pEA;
	Wed, 28 Jan 2026 17:00:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA43D41B6E;
	Wed, 28 Jan 2026 17:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF87CC4CEF7;
	Wed, 28 Jan 2026 17:00:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="m2wKvC3q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1769619644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tn4g/9//RsuI8p+PfBKBMGxP/jMELrcAL7s9pAP33WA=;
	b=m2wKvC3qDETjKG8j143DAoxEEYCt8XypTTP1fkG55IkiGr/El87+qNAqFmJAhmO5Ss4QvO
	luTaIueGqjBBUWvKkPauPs45CQSo4/Z464etuqYdgloGfvYxQ/yKi612qCksjG3596dGqI
	ftt2n6cXvdkVFbr1KrLxJuY4x/ZjghA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bd2c9de1 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 28 Jan 2026 17:00:40 +0000 (UTC)
Date: Wed, 28 Jan 2026 18:00:30 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	David Laight <david.laight.linux@gmail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 2/3] prandom: Add __always_inline version of
 prandom_u32_state()
Message-ID: <aXpArjZ1QQowshnA@zx2c4.com>
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
 <20260119130122.1283821-3-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260119130122.1283821-3-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_090055_735432_18A169E5 
X-CRM114-Status: GOOD (  24.90  )
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

On Mon, Jan 19, 2026 at 01:01:09PM +0000, Ryan Roberts wrote:
> We will shortly use prandom_u32_state() to implement kstack offset
> randomization and some arches need to call it from non-instrumentable
> context. So let's implement prandom_u32_state() as an out-of-line
> wrapper around a new __always_inline prandom_u32_state_inline(). kstack
> offset randomization will use this new version.
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  include/linux/prandom.h | 20 ++++++++++++++++++++
>  lib/random32.c          |  8 +-------
>  2 files changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/prandom.h b/include/linux/prandom.h
> index ff7dcc3fa105..801188680a29 100644
> --- a/include/linux/prandom.h
> +++ b/include/linux/prandom.h
> @@ -17,6 +17,26 @@ struct rnd_state {
>  	__u32 s1, s2, s3, s4;
>  };
>  
> +/**
> + * prandom_u32_state_inline - seeded pseudo-random number generator.
> + * @state: pointer to state structure holding seeded state.
> + *
> + * This is used for pseudo-randomness with no outside seeding.
> + * For more random results, use get_random_u32().
> + * For use only where the out-of-line version, prandom_u32_state(), cannot be
> + * used (e.g. noinstr code).
> + */
> +static __always_inline u32 prandom_u32_state_inline(struct rnd_state *state)

This is pretty bikesheddy and I'm not really entirely convinced that my
intuition is correct here, but I thought I should at least ask. Do you
think this would be better called __prandom_u32_state(), where the "__"
is kind of a, "don't use this directly unless you know what you're doing
because it's sort of internal"? It seems like either we make this inline
for everybody, or if there's a good reason for having most users use the
non-inline version, then we should be careful that new users don't use
the inline version. I was thinking the __ would help with that.

Jason

