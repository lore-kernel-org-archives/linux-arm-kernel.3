Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883CBC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 05:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3PjNV236CqQVaZSKkQebfoa+l80OB/Hj9xJsCzy0NZk=; b=jqJ3NSlxT4IA9+JMJpoHcsm+w/
	+TXwghHQWNeDP1AbVwr31INIW9R0Z/fRq9haqeweKmyWtbQ6SVacSWrMsWYVr8uBpgtpPoYc7pxs9
	jNmxdNAY/MYpbCwHA2Rofzo12Xs9Qoyy4dO5ib2xpKwkD5Tjs2JqPfOA4cfvF8jHKF1kThbG4K7Z3
	BMpLfpwig6rKMIvjsrlaVXU4O9mcVAxX0grgH4aVDcHhoult1f0BBZ4YL9j7UQ1MGZJUIWkBhd1ja
	keUBHstH9X93emoSUa3tNcXu/drhoD4vt/molkJI7uHI2zdZk018WpjNtXbVpxcRdd2Th3Y9/eRbG
	IWt9H2lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubBvo-00000001E4P-3pfB;
	Mon, 14 Jul 2025 05:40:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubBsD-00000001DCr-3QfM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 05:37:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 523D75C59A2
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 05:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE73C4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 05:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752471428;
	bh=XyhzkR8kn5yp6Y96/1ZSlkY7pN7KXbjgCgYXc1dJjM0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ook5R8XExmGSoVV72P4w0YtMVkmjl+IEsDJm+j8uDYtdLinFR/v63x2jF/6IsGCUZ
	 jarMRksYKjnLH/pnElAB6AIZeLcGV8I8TzwXkoDSuzTweahpyQtVyavfkj1e51R5/Q
	 OJ9KsU46OJMMNWIdH2xIfOknutQ3ATeHkzHUrO4ihfozNK1+UJnXJorXNHlC1S4UsZ
	 6fjPDrujekXcqoWycb5ernD2moX4ozGw5UL/rhtl26RiC+10z8y5rdBMhcrHSxFK0m
	 SjJeDMspn17lIEmxhTXh0voZqnN7eMaElOjACMZFBlg7fQgke6w3irMkBqTtY0Mr/P
	 WF+oWfVmf11ng==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-558fc8f0750so4660227e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 22:37:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3lTCjcnFv+rfeay7Tf6Y814nsGhVBECckqPGKpymm0epgxnm47UHPYTV1NoKs80Be3dZdigTVGv37YDpWgEo1@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh/qHzUtCB59UmINtH/90DNrgtPCqy/rOJzhQ3NGpdAE1KBMlV
	gujZbiMcfhaZBHd1ABoJSG1ndAZXctRP9m7yEH7snnZPqwvfCu0DFJh1zUQo/xr0IyOcLcE4zqi
	mqj74IIWYrdFvt0pC9Fgz9VMMASmyv+U=
X-Google-Smtp-Source: AGHT+IEjLMFsOJcHpHskD4wHo7LQqJdzEWyUFIFGBMtsP+J2jmU/HCiSPQLOfrcO+qhjUGvH3kl5l/s52Zh1/13axZI=
X-Received: by 2002:a05:6512:3b11:b0:553:25e9:7f3c with SMTP id
 2adb3069b0e04-55a04608dcbmr3576145e87.37.1752471427301; Sun, 13 Jul 2025
 22:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250711212822.6372-1-ebiggers@kernel.org>
In-Reply-To: <20250711212822.6372-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 14 Jul 2025 15:36:55 +1000
X-Gmail-Original-Message-ID: <CAMj1kXFOzbJKf+TJrPBr4+9_+GD8PHG59akFUBE=Dm0az_DkJA@mail.gmail.com>
X-Gm-Features: Ac12FXxuw5I3SgWDlPv4PRMDfxwEkIF84Adsw0KWc-ZL6sUGPtq8QcFrgEAQOuo
Message-ID: <CAMj1kXFOzbJKf+TJrPBr4+9_+GD8PHG59akFUBE=Dm0az_DkJA@mail.gmail.com>
Subject: Re: [PATCH v2] lib/crypto: arm/poly1305: Remove unneeded empty weak function
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_223709_897174_1063520D 
X-CRM114-Status: GOOD (  14.75  )
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

On Sat, 12 Jul 2025 at 07:28, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Fix poly1305-armv4.pl to not do '.globl poly1305_blocks_neon' when
> poly1305_blocks_neon() is not defined.  Then, remove the empty __weak
> definition of poly1305_blocks_neon(), which was still needed only
> because of that unnecessary globl statement.  (It also used to be needed
> because the compiler could generate calls to it when
> CONFIG_KERNEL_MODE_NEON=n, but that has been fixed.)
>
> Thanks to Arnd Bergmann for reporting that the globl statement in the
> asm file was still depending on the weak symbol.
>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  lib/crypto/arm/poly1305-armv4.pl | 2 +-
>  lib/crypto/arm/poly1305-glue.c   | 5 -----
>  2 files changed, 1 insertion(+), 6 deletions(-)
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

