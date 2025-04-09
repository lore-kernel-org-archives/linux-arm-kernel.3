Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D59C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 12:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAy8bA0YlDyP92YSgmPxOzOKGXZiXV73ZeL4JjinSnE=; b=Be+8lVbK4KXbJxI7btS0VOhDRj
	26bYfxFIMGitmMuygv/WldfmXFnbR1XoexTvHBZUeavS0xMHzUsJUtquoY4Ynp8Oo+KXsUS4gHyyT
	LmCtgsyJdyGVx0lBeNgMIPWOPbHPwveqWBjIthTphO3fbPTkmeCfHwe9+ZXadSs7HZP4W6upxakJJ
	J63AvKGUl/ft8rf2ftXusVAmomBBYQPGX1a1zNHBJSbc7XMuVJIsHcDHvVgtbz1P7nN8FzS3jG3va
	CJsK5kzN/yxwRcn1AFCVJpBGIFYJoCsaXuXlnMDf+AVNr+qUedJYiE7WYT0K8LdaAY+DsO13xEk2G
	SseZACkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2UZw-000000079Zp-3Pqs;
	Wed, 09 Apr 2025 12:30:52 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2UU1-0000000787o-1m4U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 12:24:46 +0000
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-523ed8ac2a3so3105703e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 05:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744201483; x=1744806283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VAy8bA0YlDyP92YSgmPxOzOKGXZiXV73ZeL4JjinSnE=;
        b=aXXvpA+4//OqiixKY6dGY2uK5V8trRRcalWiVWvZbz/j6k8GuQAuIn9o1UYT5y+OOV
         nbmXON7l7g/6uqB5YQEMgLxB7Efwde/2iMAjNwHBAuKe67QOWSxcJplcnr+ARzEHHSYp
         E1d36Nefd6dPzoXqt+rFgkfyr5MEcGiL5aD+sZ1wbcLJyIMcP4PHoH40uhsiMOigd0d6
         UQ+RxGzZJC5Gr1y3BmHV3QL4cmQrTnkvL08qgDezaDSHFrnwQWFfIXHs+2TqGRh1BQgt
         xs+WhWkNLrzx/EtmcQX//SMWbNTC92SAftr7crVwyNIrT+XljIUBihJSrWzphDiZ8njh
         Dywg==
X-Forwarded-Encrypted: i=1; AJvYcCXq8bHj1vNCBN6CKrP9nMAXTiDtNgNLd6cjLx2SNaap+XWS9o901vcF4tCZTwWzCBqBJB+1nOUrEsIHGFTFP5Xn@lists.infradead.org
X-Gm-Message-State: AOJu0YzHJyu7VT26u9XoqtZYxDTj871Wdso6jOl3nz4WtJxDx9YJY7oz
	l7owvG8KYJiuhKHNA0mt3mRHAN0MbxW5MYgp4rn1IL0+gu6Y9JFf9hl5peq4ZyY=
X-Gm-Gg: ASbGnctXBxPEMcj8pmhTrJpsJ8ekLAbLzVvLwsNH5ZGkyMmE4m3tLwvC4fANBjX1EwJ
	/2jeeoJkXAIWXghJNEwLEoiE214oL1ThepEEg951RI8vsNbVqzntvVXMfNIeKqhpuvx3rF1/gRG
	G0x6QpgUx3T7Hk7jhNoFNU4UO0VGTXrNAwTQgLWpG+hHWAgi9NvfmBDFQHrUP66iMCa2AZvDh+p
	mjdGTUUdnxkPaQ9jnza8WlcmBJRGxnzJEWGhncMvsw35JdoMbs9LyFEDjExRwgxHtEPTYQI7Zo3
	gYo4W/haoJeVPQZmeyUOGdJ6HdBRTaGEpZX+jB1lYctdtJCSiqrGKcTHrki+Ydxjm8S/+s3ypT6
	P4nk=
X-Google-Smtp-Source: AGHT+IEI9o8qErHtVqj7MvihQoMPByZF0kEwHM4Xj+bPYpJhbcHX5RBlx3SQq37dyqbqLeNOizfVrQ==
X-Received: by 2002:a05:6122:1826:b0:526:720:704 with SMTP id 71dfb90a1353d-527a921d242mr1384037e0c.7.1744201483287;
        Wed, 09 Apr 2025 05:24:43 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abd4e8fdsm183120e0c.2.2025.04.09.05.24.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 05:24:42 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86d6ac4d5a9so3242736241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 05:24:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXExnGzYcBkFTGY8ZURrU14DeoOqeo/o8YfMDCyAEihitCqRl9YloYc8HBXiSgzNRweSIW6CbM/QwQFBYF6/ign@lists.infradead.org
X-Received: by 2002:a05:6102:5789:b0:4c3:6568:3e18 with SMTP id
 ada2fe7eead31-4c9c41d70f4mr2245717137.15.1744201482657; Wed, 09 Apr 2025
 05:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250401090133.68146-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250401090133.68146-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Apr 2025 14:24:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUbv=ianPwWAUGLjbaZsPzb15TpF3NU5r1o_yALgOQ7Lw@mail.gmail.com>
X-Gm-Features: ATxdqUH5mdFS5u57CgHVhU_OTQk1snKaw6dEmMP86vWw-ROcRNgQWa_pBvQh_X8
Message-ID: <CAMuHMdUbv=ianPwWAUGLjbaZsPzb15TpF3NU5r1o_yALgOQ7Lw@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: defconfig: Remove individual Renesas SoC entries
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_052445_457580_90C0812F 
X-CRM114-Status: GOOD (  18.56  )
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

On Tue, 1 Apr 2025 at 11:02, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Remove explicit entries for individual Renesas SoCs from the defconfig
> file.  Since all Renesas SoCs are enabled by default when ARCH_RENESAS
> is selected, and ARCH_RENESAS is already enabled in the defconfig,
> listing them separately is redundant.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

