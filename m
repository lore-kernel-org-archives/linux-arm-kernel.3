Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504EBD10DC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 08:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u56ZXLj3zoJcwhJCVeWsy3FmczwJw23Uyl3fWwY/H5U=; b=HrUjkjc1Hl388/OggnrNb8oRbs
	PAJzZpy7SLjoH8eZvG+b8Jd3nu3AwBp3JmZ7bmosPwESnT+Gp766Bp8dW6RpDQkiWLK1jVkwRKF0b
	aw9QBuDqkrfGsMOP8xK1ZZHHvveJYiuh8Acnu+bKqSxvuDRr1uj5Ch+5suXi/gGCNFhncSekt6ELN
	9sYqSA/3P/zp8aqXISJoU9mRMdCOTA/csm6U1MiT0goLWvrP0QI04WFgPi/BYqtQBEGrxIGLHCYBD
	w9DsP2NUd/kAT/nQeI19tUPK5IWeZ/dCELm9iMugvSZWGRsi0FiBfrWCthkEnq6mfXWHDbxq0wII6
	LZlFBMGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI1t6-00000005R60-40YY;
	Mon, 02 Dec 2024 08:34:36 +0000
Received: from mail-vk1-f173.google.com ([209.85.221.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI1s6-00000005QpR-3SOq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 08:33:36 +0000
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5148381f2a4so922284e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 00:33:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733128412; x=1733733212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u56ZXLj3zoJcwhJCVeWsy3FmczwJw23Uyl3fWwY/H5U=;
        b=KiQ4U2QkcyL5AQKXnl8Um0tzoOq0Puoe8es5HZ5ofVoKib5u3pKU7pp1kSlwh+lYwW
         85kaex2FxaBX5/Huz/db1/LUyMC1LNCjshctFjIL3l+Mglcq46/H1pqyZWYyl5gjTILK
         ocka/V7LsAcEoSJD5+IqPwQgv2ZlcNnbayN1wdYAInF6uICEdc5OZrzMP/EWASMNJMv+
         uhtHhQWXzGVp7fpJC6+n3ETRFbyIi+Fx816kUiyFum42DdcY1iRbGaMcVurIYKflqNv4
         UdBhCChYSF97WPr1ZKiAUym66egEbecKy7Jni/Eo/d6Lcd0Y+gojtnXZ8w6KjTu1wlAk
         s6Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUvuJ9NEJjaQp1mqHvQ6bnhttBUc34fT8N8YoTPUfEBT4L+Qg6VizUetRjdXUhYG1VX5Dnwa7REO0I8UkQlo0mJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxdPpTPHVzv0lde1wggLhNA0Bm/PzfBvvWZ+SHDcjZ2EvtQKMIb
	5ZzcIRsZ7+P7Vl1f/fOzQgRnv+asGIlqCtv5uDZUhZ2bAKGamYGrj4+U2b9B
X-Gm-Gg: ASbGnctWeXEQgSYapLItZFhMEO/M2/pClwi4DWa5j7wpQtdDiEhOoD8jXUW+OBOFi8Q
	AfkzvbzUKSgVOXd2QFrhEr8mgXw3bc4M87Gd5fP103pApQfjN5Skl5x9H7UU/NVf2gkLRMkfRLl
	YVVIXRbUykUGEArVKQNhdySeZosqBOEwpz0rKQVqga//diGM9GO44f4rZ/czhLN4o20VYRV+Z30
	kvLqj8sFjel3Wg6VVGWy+Fib1g8YD1/GfQqd8+tW6DJzposqZr4o2bQMhFgG88WZjrzhgCfySKL
	PD61GUuN9P9i
X-Google-Smtp-Source: AGHT+IEtWmIAZs8ow71aEQuwr1GxOLlhh9txtt0fKdVNvcpko+OhueaAMEY8LUQiY/Os9TdyoImoKQ==
X-Received: by 2002:a05:6122:8c13:b0:515:4fab:2f8e with SMTP id 71dfb90a1353d-51556ae31e9mr23675141e0c.10.1733128412222;
        Mon, 02 Dec 2024 00:33:32 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156ca3f15dsm1103740e0c.0.2024.12.02.00.33.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 00:33:31 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4af5ed9c8b4so874142137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 00:33:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXynLNrG7PSA31Ng5UMpNtrZR/1Tu2dTG/krbpA51YmFLNz7MR2dpmCzvsz566UGx+rYMOOwqeCupyLFI/5bGol@lists.infradead.org
X-Received: by 2002:a05:6102:954:b0:4a9:5d98:6c5f with SMTP id
 ada2fe7eead31-4af448f6d7dmr26891641137.5.1733128410739; Mon, 02 Dec 2024
 00:33:30 -0800 (PST)
MIME-Version: 1.0
References: <20241202012056.209768-1-ebiggers@kernel.org> <20241202012056.209768-11-ebiggers@kernel.org>
In-Reply-To: <20241202012056.209768-11-ebiggers@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Dec 2024 09:33:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV5rQggS9YHMJfU0gdhg6oFENTnPKp9Tbp3sJKgQdnMTA@mail.gmail.com>
Message-ID: <CAMuHMdV5rQggS9YHMJfU0gdhg6oFENTnPKp9Tbp3sJKgQdnMTA@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] lib/crc32test: delete obsolete crc32test.c
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org, 
	Zhihang Shao <zhihang.shao.iscas@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Vinicius Peixoto <vpeixoto@lkcamp.dev>, "Martin K. Petersen" <martin.petersen@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_003334_862513_8343050A 
X-CRM114-Status: GOOD (  16.05  )
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

On Mon, Dec 2, 2024 at 2:24=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> w=
rote:
> From: Eric Biggers <ebiggers@google.com>
>
> Delete crc32test.c, since it has been superseded by crc_kunit.c.
>
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> Cc: Vinicius Peixoto <vpeixoto@lkcamp.dev>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/m68k/configs/amiga_defconfig    |   1 -
>  arch/m68k/configs/apollo_defconfig   |   1 -
>  arch/m68k/configs/atari_defconfig    |   1 -
>  arch/m68k/configs/bvme6000_defconfig |   1 -
>  arch/m68k/configs/hp300_defconfig    |   1 -
>  arch/m68k/configs/mac_defconfig      |   1 -
>  arch/m68k/configs/multi_defconfig    |   1 -
>  arch/m68k/configs/mvme147_defconfig  |   1 -
>  arch/m68k/configs/mvme16x_defconfig  |   1 -
>  arch/m68k/configs/q40_defconfig      |   1 -
>  arch/m68k/configs/sun3_defconfig     |   1 -
>  arch/m68k/configs/sun3x_defconfig    |   1 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

