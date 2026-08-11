Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4978CC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 06:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJVq6yxlsV8MaxLkBwVZT68ibQgfi6cVZyQw3M7Tcko=; b=O3Iyy4V6TPu3gu4tpmYod8VSh8
	a5SIithkV7pRYt3GwB1eiaK2AA5vQpqctT4kzUz4CQ5IiG+VJY2ddv5ti594SCEVLO6cG1Ifok1EV
	UE3atVAUcSLo3253hR4wEMcEZOgHF18uyDOolekLtsJM2FPWss8Y3zerzKGTbuB240n/0iFtO8JuQ
	84YSB9q1JNczhAfNRGcz61AuIyTKuPrK0RjGG7tljWGcRVZ3yisoy4j1TsTQWtOnp2IVID5Tl98aA
	GC1nIDftR7BWxGwO33jLRUYC1Mu529+VcQ24MB45bVPS/V81GgyvubBNDiSpbTLeYTqBnNNgoCXRG
	c10EAOBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgET-0000000DRbZ-2Tlb;
	Tue, 11 Aug 2026 06:45:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgET-0000000DRbO-0M50
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 06:45:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 879A4600BB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 06:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CFD31F00AC4
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 06:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786430704;
	bh=pJVq6yxlsV8MaxLkBwVZT68ibQgfi6cVZyQw3M7Tcko=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FHJ1wm7i0gGI3Mr+5UuSVe8oUCrros9IwIJdlNXcgkGoF/jEcQUEETKZaik39m02l
	 T2GTzlY6rca4G8Ax1U9Q4Noub8ax6boj59apelhi9TV4L3oO8oHRX/65xGS/A4nlJ7
	 aKeK3LbCG56EOzdBvW/2/Up4WRDUX8xOgEAIxuZyFjDQ8iL9aC+aIoIqN1+HV9RV1W
	 9easoduZaheLxfxQcEkLfTMi7O+jzYK5+hRGFnjwn1BjqVr8jsvMSlahcj5G7IUrrG
	 90ZpGqmt+j3uWjx5wtUjytSCUiwmq+hRHva1FHJkgIOOfDc6aKdt9r/3o3XfPQgyqJ
	 vJvoWgoN+vD1g==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c94fccf3eso22300801fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 23:45:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqKHdU5HQYKcPmiwX5oeD3ZpHYzcCIUUL+jm7As7ISWRBStBk25TA6XWlKsmECeqIbaBm5YjlQs1R5T1IGgPdNJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6VMAqugp6fa7aXA/ypb5XJoFhc9oehKVeq96IBa6zO0hAihBJ
	zwqh/FB5wkT53HLvfxVEseQw0uWRK/US+peo6oTkbEnaciKBvdhdKQKyZUn0GHD5bt2OvHUrTLZ
	nyJQ31xf/Ccj7rzzChI+rbMD/QKD6W24=
X-Received: by 2002:a2e:bc1c:0:b0:38e:8760:2922 with SMTP id
 38308e7fff4ca-3a0f8d49e4emr1498901fa.18.1786430703006; Mon, 10 Aug 2026
 23:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260811063442.3058074-1-lgs201920130244@gmail.com>
In-Reply-To: <20260811063442.3058074-1-lgs201920130244@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 11 Aug 2026 08:44:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLnc6BEi7nJMikKMFRF6p-gR1rWra2nStmV=Sa3H5hAgKA@mail.gmail.com>
X-Gm-Features: AUfX_mzWP3gAczH3XCsezdbF1fHtDPhGDpWpZ-nSiIVZIDaNKcMiQT0E7mjbdcI
Message-ID: <CAD++jLnc6BEi7nJMikKMFRF6p-gR1rWra2nStmV=Sa3H5hAgKA@mail.gmail.com>
Subject: Re: [PATCH v2] hwrng: stm32: fix usage_count leak when
 autosuspend_delay is negative
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Daniel Thompson <danielt@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Aug 11, 2026 at 8:35=E2=80=AFAM Guangshuo Li <lgs201920130244@gmail=
.com> wrote:

> stm32_rng_probe() calls pm_runtime_use_autosuspend(), but runtime PM is
> enabled with pm_runtime_enable() and the matching
> pm_runtime_dont_use_autosuspend() is not called on driver teardown.
>
> If the autosuspend delay is set to a negative value while autosuspend
> is enabled, the runtime PM core increments usage_count to prevent
> runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> during teardown, this reference is not dropped and usage_count remains
> unbalanced.
>
> Use devm_pm_runtime_enable() so that pm_runtime_dont_use_autosuspend()
> and pm_runtime_disable() are automatically called on probe failure and
> driver teardown. With runtime PM cleanup handled by devres,
> stm32_rng_remove() is no longer needed.
>
> This issue was found by manual code inspection.
>
> Fixes: c6a97c42e399 ("hwrng: stm32 - add support for STM32 HW RNG")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

