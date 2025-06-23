Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BCEC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 01:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=IgHNU976VfrOwOD3ulvb2vI7O/PDlbsrK2gzKqrmtPs=; b=2SS8jEwS4kQLxvl9R62IXynuDo
	EKLehHAgNK89s9rM8vLSwyho+rBHA8ySO+y9lBKvv6fcGuHm2SzBKvNprPGKg//hi9JKwodxJSYtq
	DsqndiBMgVq17zEBUsE4cA1Qqqvx8h3OGRJMGAXQwNT5Z7eZvF/TI9trSK3Vn/q9TCcJ19rkHhwg5
	LSXUJMQPAikSlZpdAIEd8KiJeHIPMEw+7oJp48KwXsisazLMEKnuV00ABGotX82MJj0D/2cE67fKV
	o5uRgw7VDeWKBHFziZKHDOEfOUTriLUOwmVfe37A0DTpy34wws4vPxK5kW11pfqiEo2S5U6TSaM39
	0acHtSFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTscm-00000004ORV-0QPN;
	Tue, 24 Jun 2025 01:39:00 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTqW1-00000004AP4-3tV5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 23:23:55 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso3714749b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 16:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1750721033; x=1751325833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgHNU976VfrOwOD3ulvb2vI7O/PDlbsrK2gzKqrmtPs=;
        b=RQ1ZkJgfMEJEIsqFP8ve6alwqzGTvIyGHYawO0sALguAGLhXnUwMhbzifL85wdqjiG
         M+uT+fbBxLQzrv3/9TuszstCYEmKNmBfuOxkN7yGIIilfgl7gMOAlwzRRA9V7I9xaINQ
         weouhegeLyJaXKTMfpU32TeMA26IRSFc/2Pffr6p9NSKUmpMp1+itMNg1EuRiu4/nOCA
         GnSfmeTjiD+aHm7W/56kdgKgxIf4DKXBlXFg5b9bh90hcwuGnhVSDxSja2Sgn5cSJfBF
         JRyAiDlBQdcFfvHLz/xT9FOTTb5uGipxO80w29yB7zOsVWoFHTXrAYu6Rfo8Muuemea/
         O6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750721033; x=1751325833;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgHNU976VfrOwOD3ulvb2vI7O/PDlbsrK2gzKqrmtPs=;
        b=XEzO2p+Jk1yGL4f8HudeS0E7dz3TuC14fsbBGrI7TJLO0sTv6q+wAprM+MRXa4isK0
         k7/5Qf4gkyw8iYhM47aK3E9+q/U3yk6MvdBgGYjyu+t+4ieZFRzxwTX3VsBpwt8yaEuW
         m5qfXmbDe6F2ybXQpdYGlJAA+EdrKJnWLUF2+r/rYlLnv2q7XwBP5OK8RmCBzU3zk+ah
         TzUvVO6LrWB5n+8whb7aFRUClikGZpRjcv4+pKXMeaRBP7oGbA5pqLY9gi1v6od7Cpsz
         bmNKjelSIEO2MfqCL6pnwYH3B/uBNoZz+43a3KawKibVLfNVEd8+gJri0RmGam4YbzH0
         fltg==
X-Forwarded-Encrypted: i=1; AJvYcCULph1562E8ef+WzLwm4vz3Hy7wSW4AkAwTWzMS6niXXMYrOglSw45sD+QW80ImEkZsak4bT4v3xZ5G/dsuA76d@lists.infradead.org
X-Gm-Message-State: AOJu0YwoLUrd4uiWqMjHUr2aKoLD9+zeAVRcFUC61iyV9d1sxeSqHAXJ
	Fn8tJChIODvbx7rb/iwriBMkHEqVtGcbrekRvEBb8DQFbv4WVAsqTm8n6a4an1gNDx8=
X-Gm-Gg: ASbGnctFtp3EAWbw2JUuQNnGPSfJCHRuNRJyXFNBWsOQlM7QJjUbftlfQBA6DrJXRr+
	VswzVrcx/5tJTONLOU72ARxfII1YOXewe5YwuUnyTmobVzte/9KFJrhJAPGM7EuRQAZG+sLE7jL
	+inMaNX58o6M3XuyNn9aZlWxF22zQZx61e4VbwKDcgxSg4Pmf0tWwyQD15ka1qajNPujhKQoGXN
	GR9yfivApdqSx9jGTAFNmyEWt0oYmUqer5izgyIv/OH9gl9JxCl7I7ubNb6GEH8kWS53GVMxHpN
	/wOwEBVWVpmDwy9QrS2gVI7xdmY+0cOuf+1noIGgOzjAK9XO/dCHR3eeZp7W
X-Google-Smtp-Source: AGHT+IGv2SJju6xgRevma8Cx/i6GeIJiS1WAChIRaAqec6j+z8o+1u/uy+Lb1YfHwJThHoUvyYrxYQ==
X-Received: by 2002:a05:6a00:3cd4:b0:748:e38d:fecc with SMTP id d2e1a72fcca58-7490d71c76amr16954440b3a.22.1750721033150;
        Mon, 23 Jun 2025 16:23:53 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:8d10])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-749b5e211d1sm243166b3a.44.2025.06.23.16.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 16:23:52 -0700 (PDT)
Date: Mon, 23 Jun 2025 16:23:52 -0700 (PDT)
X-Google-Original-Date: Mon, 23 Jun 2025 16:23:50 PDT (-0700)
Subject: Re: [PATCH v2 5/9] lib/crypto: riscv: move arch/riscv/lib/crypto/ into lib/crypto/
In-Reply-To: <20250619191908.134235-6-ebiggers@kernel.org>
CC: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, Jason@zx2c4.com,
  Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
  sparclinux@vger.kernel.org, x86@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ebiggers@kernel.org
Message-ID: <mhng-8FC37478-859D-40EA-A0E9-3EA86429DC53@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_162353_969017_BE0F408E 
X-CRM114-Status: GOOD (  22.44  )
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

On Thu, 19 Jun 2025 12:19:04 PDT (-0700), ebiggers@kernel.org wrote:
> From: Eric Biggers <ebiggers@google.com>
>
> Move the contents of arch/riscv/lib/crypto/ into lib/crypto/riscv/.
>
> The new code organization makes a lot more sense for how this code
> actually works and is developed.  In particular, it makes it possible to
> build each algorithm as a single module, with better inlining and dead
> code elimination.  For a more detailed explanation, see the patchset
> which did this for the CRC library code:
> https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org/.
> Also see the patchset which did this for SHA-512:
> https://lore.kernel.org/linux-crypto/20250616014019.415791-1-ebiggers@kernel.org/
>
> This is just a preparatory commit, which does the move to get the files
> into their new location but keeps them building the same way as before.
> Later commits will make the actual improvements to the way the
> arch-optimized code is integrated for each algorithm.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/riscv/lib/Makefile                                         | 1 -
>  lib/crypto/Kconfig                                              | 2 +-
>  lib/crypto/Makefile                                             | 1 +
>  {arch/riscv/lib/crypto => lib/crypto/riscv}/Kconfig             | 0
>  {arch/riscv/lib/crypto => lib/crypto/riscv}/Makefile            | 0
>  .../riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-glue.c | 0
>  .../riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-zvkb.S | 0
>  .../crypto/riscv}/sha256-riscv64-zvknha_or_zvknhb-zvkb.S        | 0
>  {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256.c            | 0
>  9 files changed, 2 insertions(+), 2 deletions(-)
>  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/Kconfig (100%)
>  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/Makefile (100%)
>  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-glue.c (100%)
>  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-zvkb.S (100%)
>  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256-riscv64-zvknha_or_zvknhb-zvkb.S (100%)
>  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256.c (100%)

I'm assuming you want to keep these all together.

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

Thanks!

