Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB34CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 15:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOV2usxAVtrzpjNrsCDY6+oTbSzm7HQ0OagyrYKBhwU=; b=Seu1uRnL88l5vJNNsedOPpIoO9
	38DeXc8DJFvJkI6zbVGjCCsThsLY/UyiVok+E+3lg/i+uC76wvQqSKirg39nmiKMrlrB7kDUaDhic
	pREJ+srqaqNGTm1l6zEwxROdTJm3ibemGxA1prXRm2wRQXggFLSh7mb6VXljfOmTLl+F/Xe/wQCc6
	uc5J7OfNGjO39vc3zxXaKzv92S//IEDwteNK/cPvSWCvNguf4+zy//6RFP+SPfh/BvHhyBvI3phjS
	OwVXjlHSVRDw9EpfLKr/9a615zsWiF+TYCh0JSs6C708M1CsnofXP/dIkR1Bfz+usX9wwbflfViid
	nZFAZB3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPYE-0000000EGTr-2HTt;
	Mon, 27 Oct 2025 15:54:30 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPYC-0000000EGSj-371P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 15:54:29 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-27eeafd4882so427865ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 08:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761580467; x=1762185267; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOV2usxAVtrzpjNrsCDY6+oTbSzm7HQ0OagyrYKBhwU=;
        b=SQ9nvWx+jGNl1SOKzcWf7Bp4uQHWCLaNxOpfWef79ViHEUFrWHCwZinf4hIl4/HpZt
         iuWmBOIwbYQJ7hSD8TR6W6oaG45Al+AKnO95lH7d9GiWFi/TFzBX+0/7lu097tS8Na3t
         NZHR5pnrw2qGAy8Ul6IpB3EB7NzIWnU9QgG75Kery/P7VbAmBQ3PWXzKOJPUr8thgC1j
         9viNF6uTkp/kcoUQ5ONQ08ANhIslvsqh4/EyAV7M1ivZNYiA9PuWuVLjJkzFc0hbuRFz
         yEQJgAO2/kB89o82vBaEXdKu9NLUY39YekbqcVhysHG2c71AuHUbBgql0gU3MaVryfaR
         rb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761580467; x=1762185267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TOV2usxAVtrzpjNrsCDY6+oTbSzm7HQ0OagyrYKBhwU=;
        b=gpS4xgcHxaTjYqWZPN7WAcE2CXD4WB+/2vUSLu6vOi6MKhGioI7RkVAm+lPsec5+4S
         6OnEBoYJqDtNL38lbP47y6jcp3TEHs+ZRcCPHjEbMJ9IO9mHCkF93Y03cy6k0SHwiEYU
         xzKZsbPEkfpEFt+CE+VaXDpzIpkZ1L6Gqjo4YhWz3yL/66uu1Hca9xh/SJbDl/NocqRV
         4j61/S4LTOPsIcLmzecha6UvN3TwyGTMV6WP7x/yvqRVaxuUWJNwGR3jpmaav7mr9+Qg
         puRZwN3460XN/rEZbe5qVAQNt3Opc9qwxXRghSQu/Hzypsq4CE773B/z83RWHhz2OhoC
         /+TA==
X-Forwarded-Encrypted: i=1; AJvYcCWk7Zp2ze+B4bQCD1rb06YLqUgRKSggsCgb9yL3l1ut/cqqs2M1EaVQA2NeeMT/yh3tnI0TdJOVTKhuNcttoqd/@lists.infradead.org
X-Gm-Message-State: AOJu0YwQm9xSYCENZ+EFoJyQ/UYpzocqh2EeI+Nb/J3pjDaC2UaRcq2A
	bmrlVaih93Cw1F8mvG/PVt4f55DfKTVp+dY+/9db8UVWSyj6tCkYKpG2Mg4W0/C/s5tcuQUH+pN
	lS1B7jIs3pa/Gncnvh3KHdAuX47QrpFQcE2WRj8C/
X-Gm-Gg: ASbGnctP4iJzOTheL8Rtz/fUZ5BmrlnBmsCDojT3F6IWOhVw21z1riyvvAILA1sveeF
	9GlncPqHj5+C6gb3NEZ//Pv/1IpbnYEB3uspRHh4IxcMSzdUtF7bBtVs314bdiVt8+1BZJjHZt3
	mZz7+O0h67cQeGfWi4T8L/mS3IZt86n9l1LkoquUW1M5lG158YSJsYvLyXgw9vPvhiAwEGfnwuY
	WjANeelJCZTWOhjWWJ/ky4oopJgG0AarSiWaARAIuDbTVKrE6IKtejcC4vGyDFmXZuV
X-Google-Smtp-Source: AGHT+IGd2VC+1ri7Tm8Icu43HfhHP31Eha9krNlCyWKJpXSqm52Nv3U4r4IDiw+4iGHBWYRgukstDdR1FrBi6TFHiUE=
X-Received: by 2002:a17:902:c40c:b0:25b:d970:fe45 with SMTP id
 d9443c01a7336-294ca876b46mr835215ad.1.1761580466893; Mon, 27 Oct 2025
 08:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <20251025-idpf-fix-arm-kcfi-build-error-v1-0-ec57221153ae@kernel.org>
 <20251025-idpf-fix-arm-kcfi-build-error-v1-2-ec57221153ae@kernel.org>
In-Reply-To: <20251025-idpf-fix-arm-kcfi-build-error-v1-2-ec57221153ae@kernel.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 27 Oct 2025 08:53:49 -0700
X-Gm-Features: AWmQ_bkZ-boZ1PO-DZE1ghKe_XcmKdU5EzkIpPpXzyaf8mX9qkr6Gzs7ALPdxQ0
Message-ID: <CABCJKuesdSH2xhm_NZOjxHWpt5M866EL_RUBdQNZ54ov7ObH-Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: Select ARCH_USES_CFI_GENERIC_LLVM_PASS
To: Nathan Chancellor <nathan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Kees Cook <kees@kernel.org>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Russell King <linux@armlinux.org.uk>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Michal Kubiak <michal.kubiak@intel.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_085428_804717_1A9065EB 
X-CRM114-Status: GOOD (  14.77  )
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

Hi Nathan,

On Sat, Oct 25, 2025 at 1:53=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Prior to clang 22.0.0 [1], ARM did not have an architecture specific
> kCFI bundle lowering in the backend, which may cause issues. Select
> CONFIG_ARCH_USES_CFI_GENERIC_LLVM_PASS to enable use of __nocfi_generic.
>
> Link: https://github.com/llvm/llvm-project/commit/d130f402642fba3d065aacb=
506cb061c899558de [1]
> Link: https://github.com/ClangBuiltLinux/linux/issues/2124
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/arm/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 2e3f93b690f4..4fb985b76e97 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -44,6 +44,8 @@ config ARM
>         select ARCH_USE_BUILTIN_BSWAP
>         select ARCH_USE_CMPXCHG_LOCKREF
>         select ARCH_USE_MEMTEST
> +       # https://github.com/llvm/llvm-project/commit/d130f402642fba3d065=
aacb506cb061c899558de
> +       select ARCH_USES_CFI_GENERIC_LLVM_PASS if CLANG_VERSION < 220000

Instead of working around issues with the generic pass, would it make
more sense to just disable arm32 CFI with older Clang versions
entirely? Linus, any thoughts?

Sami

