Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05448CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 08:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HoP5rZhN/wcN0s5V5G96zFIhY9AxyhN0FPTyV5jomNA=; b=vk6/+N6HojjGwen8PbhDKD8fWo
	pHHx+8sDpgIKxN/uEkdTIxLA6Qo04Eazyc/CSTe+Py2UGfb9M1XShD2QbNY6lippeiMGTmG3NwF8Y
	W3dl6IbziGJK5Y2ju/v/83yryu/SSfESUiE0RHZgt1T9krZRABgveRseDvi9GBxXjHFBfLcechL9u
	N9y3wN6S4G7eREXMKCnSKB3aWNb3pWj3sWO4UMUKLwLtFtoRhIoj7ucUT5EWVTeAlIxXvdV8AYf5C
	ih7RjbHJYK49Ha+gQuGVojr+qVipEriyUQhCASbSaLePT1lh9OU5aZUGS4ke7OlMnRtTBKD15vRJ1
	DnHE20Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu5lQ-0000000ANq8-3rRT;
	Thu, 04 Sep 2025 08:56:16 +0000
Received: from mail-ua1-f43.google.com ([209.85.222.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu53R-0000000A6qt-0vWQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 08:10:50 +0000
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-89a89313bb7so255558241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 01:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756973446; x=1757578246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HoP5rZhN/wcN0s5V5G96zFIhY9AxyhN0FPTyV5jomNA=;
        b=Mlppuh5Cqf+rJ6GVhnS1yAsgnppOCGFnKAtzsasiYtz1lQvlbgFvJu5TsJ9Do2Pg+1
         xPCVHesUwz8/WFYbx3PYs9qxIlZvSzbT/XmdbjH9FApNdzLX1NVeBW86Xi9IS2n3i0Gm
         yu7JcxifFCwnRsEp21yurjPgwEGdsFzd1D9T3TEFHePEBRZbCTvOjrHomeCaUYBnfpq5
         hmeUsq8732WfCssefO+nDaTgnRORtI/+5MbpmQ/Pi4FBbworA41oPeMgJJyhJ/lrEMEE
         y6ZidztJPDfoLpXmg11gbSNaQ6FiROmKhaHi9BAAFc6Isd3ICj7anFooTIAUeKDCNVBx
         ZDgg==
X-Forwarded-Encrypted: i=1; AJvYcCVGYfBkBCLLJh02u1shvYN0UuS3T17Je2fFfBvnn61AUaRhqsEw2NOWl7UvkumnPN4o4+U3U6N3yWjQ+hEqlueK@lists.infradead.org
X-Gm-Message-State: AOJu0YyFJDmFqTARxm12/Du4TEIiS3GbRucm/mCOetOz1gzdGNo9BH18
	2dXYBQgeSUC6wEhlnnv+uLOP2FSISyg75FzLUUNAOFF8kknbOoYMdMPBAeufsUcJ
X-Gm-Gg: ASbGncv/zCKWy8FaipvdMr1aYJ/aRml5SuKMxE6Ej4SppzuJ1HLH55rUAJocvc45b3v
	wVLfJ9ohrAoYGBocKwuZKvOT7opXQJPzdy+9Obt/Jv7o2pTbNIVEBGdn1j7v27GdoEtM7WDuUa0
	b1bB0FdMjBBkxy8e1xrScuZp/lp0ZhK0gm+QH0ViWpyzn7e/MWJ130vCqcZ4qw2obmP2mN9ry3e
	ouaebVELvMlXwMueEqnXRQDWydEUy4LIdSyoBizF/TOXR8OVgSZNksrNdOOjR47jQJZBhPPxW8m
	T3XQLJhDydyxHg7XPaz0ZPOh0iQVo5UaN3miARKOl5NlRTOqv+J5+Hw1jk79141+ccpGMLiPfwN
	WkhJAEuYCUKXE7/gdmR8mYgvKByAG+pwcUvrSpGFT5QyYFhQ2ZkOrB+627d3OhwK3y2fsXZs=
X-Google-Smtp-Source: AGHT+IF/xLRUnLIZAlo8j3aMNRo1wW+5AUYJPNcxk8+KaBmDcrXbOyTsHHFCLN5vrt21GLQRhfD9Dw==
X-Received: by 2002:a05:6102:2c0e:b0:524:bd1e:bcf2 with SMTP id ada2fe7eead31-52b1c76eb64mr7144193137.35.1756973446443;
        Thu, 04 Sep 2025 01:10:46 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52af1915741sm6250232137.10.2025.09.04.01.10.45
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 01:10:45 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-52e231e3d48so266379137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 01:10:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWyWTu5+xSYAsz+R7sv4gTcwg+y9useHJ6krz9YntXj0/FLn61qYKYkXTwOxRP1fOqw7/fsl4FcP5jh3+d7ttO3@lists.infradead.org
X-Received: by 2002:a05:6102:4613:b0:530:f657:c5d with SMTP id
 ada2fe7eead31-530f666561bmr2551182137.20.1756973445172; Thu, 04 Sep 2025
 01:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250901201815.594177-1-ebiggers@kernel.org> <20250901201815.594177-2-ebiggers@kernel.org>
In-Reply-To: <20250901201815.594177-2-ebiggers@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Sep 2025 10:10:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWrJmj9jHJp5CEtzBJk6jiN81ZwmTAogc07U_P9KgyEjA@mail.gmail.com>
X-Gm-Features: Ac12FXxrq9L6kDoaKUhsApHE-2MwPE4zmKHFkt6Jn14vX0EwMHLrIbnzAnxY_AA
Message-ID: <CAMuHMdWrJmj9jHJp5CEtzBJk6jiN81ZwmTAogc07U_P9KgyEjA@mail.gmail.com>
Subject: Re: [PATCH 1/6] crypto: curve25519 - Remove kpp support
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, Zhiqi Song <songzhiqi1@huawei.com>, 
	Longfang Liu <liulongfang@huawei.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_011049_260268_2FA351D0 
X-CRM114-Status: GOOD (  22.28  )
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

On Mon, 1 Sept 2025 at 22:29, Eric Biggers <ebiggers@kernel.org> wrote:
> Currently, Curve25519 has both a library API and a crypto_kpp API.
> However, the crypto_kpp API to Curve25519 has no users outside
> crypto/testmgr.c.  I.e., no non-test code ever passes "curve25519" to
> crypto_alloc_kpp().  And the crypto/testmgr.c test coverage for
> Curve25519 isn't particularly useful either, since it just runs the same
> list of test vectors that curve25519-selftest uses.
>
> Therefore, all the crypto_kpp support for Curve25519 is unnecessary.
>
> Remove it.  We'll instead focus on the Curve25519 library API, which is
> the API that is actually being used.  Curve25519 remains fully supported
> for in-kernel users via the library API (crypto/curve25519.h).
>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

>  arch/m68k/configs/amiga_defconfig             |    1 -
>  arch/m68k/configs/apollo_defconfig            |    1 -
>  arch/m68k/configs/atari_defconfig             |    1 -
>  arch/m68k/configs/bvme6000_defconfig          |    1 -
>  arch/m68k/configs/hp300_defconfig             |    1 -
>  arch/m68k/configs/mac_defconfig               |    1 -
>  arch/m68k/configs/multi_defconfig             |    1 -
>  arch/m68k/configs/mvme147_defconfig           |    1 -
>  arch/m68k/configs/mvme16x_defconfig           |    1 -
>  arch/m68k/configs/q40_defconfig               |    1 -
>  arch/m68k/configs/sun3_defconfig              |    1 -
>  arch/m68k/configs/sun3x_defconfig             |    1 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
(although this would be handled during the regular defconfig refresh anyway)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

