Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16906D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 10:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yj0DwM0kmy2Yo4EUKJA10mFHO95mGhwL55QGFaYl808=; b=JwR+C45YvjquAeUpA1pxLrLcit
	zFSmsOtIQHCuaZO1sBbBNP8hMiMQcZ7s30geo2LqRXWB3dxELLDkwVI2PutcFwSSkOHv7GjVjNUae
	dkf+SAZXnCdabCJVloQvjSnrJd3EC3bxet6t0/yCbJ7Hai80/g81xyxQ1Run981eKXVKIs9EfnqbL
	GOU8l1O6uPlYpbo2AqAJvT50J5uPDgvwvuiMviDx+xVlJTR1SYZfmNjObFNVYSqklUOlcmTRl0FOR
	nhLEqZTgfoz2fWaPlWxvDvgBu6MCc60bkwISpB9UU80wpsq0EDdUvzglZp4jL+q2COHvMjHHeu0eh
	n0rt8nPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZJB-0000000GO9e-3KJu;
	Thu, 27 Nov 2025 10:33:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZJ9-0000000GO96-42IW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 10:33:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA1A743835
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 10:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E3DC4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 10:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764239582;
	bh=0TxRubWAllRCmV83+NRFzCjjIujms3H3INEK9PMJybg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F5rWq+AfjxKjPH97NaV/FEzQg5Fzu/NiWq+7lCj+FZQzgUKBs+2kcqYUT8iZJ9/MJ
	 JMOG85sXgkP5ZDql11NOaKFcngcF2bECaZeSWkVXbIyTZrBOeLov7yesFJ6uKbCePR
	 1aA0tQ5d0FqHAJ2Ge7t3DeHtOKzpSgheZIpqp6HzBXrV471BIFRQj5WXTCrxFvjXCg
	 oyOv+k2auvAvpnmNmGy2TGKUWReZ/5EupKCsrTp9vCAFAxwwdiqSvtQ41EHTyNrGHX
	 ohvbo+Y2KUHWWn8iA81AejRoGPtChliT8PdqRoogPeVpHY4NN6pnmscu7y6GO6gNIO
	 XgUWw2Bow1K4Q==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-37b9d8122fdso6125251fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 02:33:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUvlt+IuBl4moGNF7ur/mIROZbSvxBP+rb5WMQuiqNsaLdB02q3UxxqHaWE372687XEFxa6gPr6gHxkOuu+xQFO@lists.infradead.org
X-Gm-Message-State: AOJu0YzqrJkM4uU3N3XNYFvazY6CkRfpUjYjNS3Uek/ND9QegPLUVzs8
	DD3Yp5dS70bn9T3RSkU66dMenMOaPU2msegWnDGgt7Nj/4gKhBrRa+SA4tkREi0Bss+TzQxtXe4
	uyldIAy+35qfyLDrJir8gmfuFXTHmJmw=
X-Google-Smtp-Source: AGHT+IEKCHipYZEh6JGsjNNER5z+3CKP1etWl09QVeM3YONGTfjUvI5U4hE+viZw/8MZx/dyAn9ZkNQ4h/KuZvrnm+8=
X-Received: by 2002:a2e:7c05:0:b0:37a:47a4:d5cb with SMTP id
 38308e7fff4ca-37cd91b06d2mr59772791fa.11.1764239581012; Thu, 27 Nov 2025
 02:33:01 -0800 (PST)
MIME-Version: 1.0
References: <20251127092226.1439196-8-ardb+git@google.com> <20251127092226.1439196-12-ardb+git@google.com>
In-Reply-To: <20251127092226.1439196-12-ardb+git@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 27 Nov 2025 11:32:48 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGLYYn9Fa+dbB2EWNbwJ6+PhKBz3vd=gUJDizvYwVSjfw@mail.gmail.com>
X-Gm-Features: AWmQ_blfqnL18qgHU_wCogCb4XqLMnCZzL8QS8DPfq2a28ZnCAui83obnxxDWCs
Message-ID: <CAMj1kXGLYYn9Fa+dbB2EWNbwJ6+PhKBz3vd=gUJDizvYwVSjfw@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH 4/6] random: Use a lockless fast path for get_random_uXX()
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jeremy Linton <jeremy.linton@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_023304_054635_027FCD77 
X-CRM114-Status: GOOD (  24.28  )
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

On Thu, 27 Nov 2025 at 10:22, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Currently, the implementations of the get_random_uXX() API protect their
> critical section with a local lock and disabling interrupts, to ensure
> that the code does not race with itself when called from interrupt
> context.
>
> Given that the fast path does nothing more than read a single uXX
> quantity from a linear buffer and bump the position pointer, poking the
> hardware registers to disable and re-enable interrupts is
> disproportionately costly, and best avoided.
>
> There are two conditions under which the batched entropy buffer is
> replenished, which is what forms the critical section:
> - the buffer is exhausted
> - the base_crng generation counter has incremented.
>
> By combining the position and generation counters into a single u64, we
> can use compare and exchange to implement the fast path without taking
> the local lock or disabling interrupts. By constructing the expected and
> next values carefully, the compare and exchange will only succeed if
> - we did not race with ourselves, i.e., the compare and exchange
>   increments the position counter by exactly 1;
> - the buffer is not exhausted
> - the generation counter equals the base_crng generation counter.
>
> Only if the compare and exchange fails is the original slow path taken,
> and only in that case do we take the local lock. This results in a
> considerable speedup (3-5x) when benchmarking get_random_u8() in a tight
> loop.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  drivers/char/random.c | 44 ++++++++++++++------
>  1 file changed, 31 insertions(+), 13 deletions(-)
>

This needs the following applied to ensure correct behavior when first
called after the base_crng generation has already incremented to 1.

diff --git a/drivers/char/random.c b/drivers/char/random.c
index e8ba460c5c9c..dddbec7cf856 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -523,7 +523,7 @@ struct batch_ ##type {
                                 \

         \
 static DEFINE_PER_CPU(struct batch_ ##type, batched_entropy_ ##type)
= {       \
        .lock = INIT_LOCAL_LOCK(batched_entropy_ ##type.lock),
         \
-       .position = UINT_MAX
         \
+       .position = ARRAY_SIZE(batched_entropy_ ##type.entropy),
         \
 };
         \

         \
 type get_random_ ##type(void)
         \

