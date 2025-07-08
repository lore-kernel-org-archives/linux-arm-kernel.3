Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17EBC71130
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 03:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHR+KlhjSqQopSe0jgiqsivQ8HNCSG5ytRCG/9/XuX8=; b=kNZ5aff9Dhc2hg/pF8Jc6DZyq4
	Aicyo4BQqqBvNNeHhVI/UHZjdtuAgm8V8s9Ztxl7CKZbm8lEkR9d/gpuopTzAnAw+k22e4KMb39iB
	4qUht1LWptI3AxfwY2hN2LmVv8cRIwSeJPiwKcxHPHlIxRPmsAJaSjxqxGz1ZxsC9raI91hYxcRyf
	ka1MBD3pikYl/bJex46BsGVaXTmStosNcv/OiTsdETyf39JLdFQVx9ZhoNPXx8K/2mK2Y4CSMUCMx
	EMvHX7Y6T3cdYeqeiq94t0DqBjsR+tASCX5YJlPDxBZcVwe0ovUZLZ2d67/eD1sRkkarv3/JkmuAc
	2pqTRyBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYyxJ-00000004B8x-1XaQ;
	Tue, 08 Jul 2025 03:25:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYyuz-00000004AzI-1Bz7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 03:22:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8FFC3A4EF04
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Jul 2025 03:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C5DAC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Jul 2025 03:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751944972;
	bh=9H4IIccotUnEJ0jLpuuFE179dM/I/HHnNlZqvuVjozo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y9SAxK/o4nH3WLJahoqUNxkDso+50RGGUdfWNGpHS7/7sKijjFC3ZMZkzbta24aai
	 nwCoisz6CwEudnSSdHdAhxoZorLb5tDQkAeT/7VZInHEvyXvPi2pWxLfvfgB6bXfe2
	 1jClM/ChUpdm70A7DSJ9NIzHaR3HY2E4Tlfkxug1zUxX7LV/qGfX68kcZuTvPEvSJ6
	 phIHqTD2Ydjjtz3Fuf1b2Jm2jHz5d3YvU16Dcq3T/Tq40/2F70YB0a2zR86ibhX5CU
	 pivzalF+Mp42j35ELtw2BpzPRjEa3h+wnwr7HWMYcZkkDfyfm/Vc+bct9ncHW9uElv
	 H8nQ9ZWfo6Fbw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553b165c80cso3813574e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 20:22:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBIQ+n/DLJZyaQvoYeN25UvDGK22KySFye43wAUkh95mvj/0fGbVALfqDoqhUWEaEsjsiJovtRmbdRLDmRZSYe@lists.infradead.org
X-Gm-Message-State: AOJu0YxvI51V+Vtfuf0phFdc1OL/NjCjm9glz/UFLTDUsed1l4md8mH1
	piPFbDhoe+TRYUg2qemGRUHtB34owFR6BLIhDx6AW+lP6DKd0D7r0DxzP6AKtImklGZK3+71BBW
	0rsgQ27+sylsS6Z9l7naGu05k0q+A7u0=
X-Google-Smtp-Source: AGHT+IHfwjnhQDW4vHFZN+V9yZXUSxBn4uEviRCQeobt6aIgg+7vXB3BHniEBK2OzJBTx7v4sCsH4uyRP7lFFAZ9ptY=
X-Received: by 2002:ac2:568a:0:b0:553:acbf:e003 with SMTP id
 2adb3069b0e04-557f8304874mr371133e87.13.1751944970584; Mon, 07 Jul 2025
 20:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250706231100.176113-1-ebiggers@kernel.org>
In-Reply-To: <20250706231100.176113-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 8 Jul 2025 13:22:39 +1000
X-Gmail-Original-Message-ID: <CAMj1kXEdeeuceNXpoFjjwH_SnhEYm-sgZtFuA-bOy=5zYjkx4g@mail.gmail.com>
X-Gm-Features: Ac12FXxVJEAkPh9C9EkTUxMjafGC2WjYO85Or9sKH7pRffl1eXeWxZ7xJ2FdfZI
Message-ID: <CAMj1kXEdeeuceNXpoFjjwH_SnhEYm-sgZtFuA-bOy=5zYjkx4g@mail.gmail.com>
Subject: Re: [PATCH 0/5] lib/crypto: Poly1305 fixes
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-arm-kernel@lists.infradead.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_202253_391843_5A24A2CE 
X-CRM114-Status: GOOD (  15.33  )
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

On Mon, 7 Jul 2025 at 09:11, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series is also available at:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git poly1305-fixes
>
> This series fixes the arm, arm64, and x86 Poly1305 functions to not
> corrupt random tasks' registers when called in the "wrong" context.  It
> also fixes a performance regression on x86 with short messages.
>
> This series is needed for my upcoming poly1305_kunit test to pass.
>
> Eric Biggers (5):
>   lib/crypto: arm/poly1305: Remove unneeded empty weak function
>   lib/crypto: arm/poly1305: Fix register corruption in no-SIMD contexts
>   lib/crypto: arm64/poly1305: Fix register corruption in no-SIMD
>     contexts
>   lib/crypto: x86/poly1305: Fix register corruption in no-SIMD contexts
>   lib/crypto: x86/poly1305: Fix performance regression on short messages
>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

>  lib/crypto/arm/poly1305-glue.c   |  8 ++----
>  lib/crypto/arm64/poly1305-glue.c |  3 +-
>  lib/crypto/x86/poly1305_glue.c   | 48 +++++++++++++++++++++++++++++++-
>  3 files changed, 51 insertions(+), 8 deletions(-)
>
>
> base-commit: f1da28dfadd26ef95bbd0b1ddf066e7ffe1505ff
> --
> 2.50.0
>

