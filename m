Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E2DC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 14:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUxmDYXurhyNXGwP8gjUs30r8dluW8wkF+4NNh3dZLc=; b=t96IqdiPTbDT2Yk8qhEoVlFS/s
	Tby14CktzJlQSwKoP2yszYX6BYkaZpSlppr+lVxuM88RErQF5xv+G3nQSsUk5FIvYPJvB/lVY+j+6
	199DGVncSPY/aBkDjajxXoKw/97zFiNbPxdP+9l/NhnHZdGtAW6XMLOteyiQbwuNlJuO048emV5hO
	lXggHccq6lRA2QyBtiE+4Dk184TiF8mC/bv9Lf6II7ZhWiviF5yebY5pw3HcVunVqaFYKEsCoBFtd
	tCfGquRowZsqRL4ReOO1t+5L7hhWhEvQKc8jH0XJZvtzx/4cWDlu6GMK9F/NsLXh8iMiDfiKUG+KX
	bu/OcIzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXTF-00000007agg-0Bz7;
	Tue, 17 Jun 2025 14:39:29 +0000
Received: from mail-vs1-f41.google.com ([209.85.217.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWoh-00000007RlD-18X6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:57:36 +0000
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4e770bb7b45so1694438137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 06:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750168651; x=1750773451;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUxmDYXurhyNXGwP8gjUs30r8dluW8wkF+4NNh3dZLc=;
        b=tbyBygyYO6hG9w/D3YDQ4LWHD9SXLAZmAaOq44VYbzO59B8qQK1j5cxyjYIolPIj5i
         11M1VlzsmbYCoLcIB0ryd7UP+4bRKNoDTobnjtpJ7xsnCSksTdvn2xZM24DKC2wAksoV
         iMnX8ci+L2E3GOF0MBnH9eDLQ/m8v8FQIgScSY9UimXA+dDA2hOVJPji3sUCA8ih5o4O
         JDjsksXFWITwZE+kdrCqxUUD0u/pxqUviYwwPOJjRbhekrYMC7NBlxDBLFMiTwbUe7ee
         evTAyvxdsPe6bWLl5kq6HqP3ljMjYi92qDSxDQ9c0kmakY5pq79EAgpUHExqh0o277oe
         E1tA==
X-Forwarded-Encrypted: i=1; AJvYcCVGOG2IcBZoreMYh9KnCp97oExaf8fqWdIrL1YwFJqlA8uR18apIYNA7gCTyKkg+caw2hoePEkAUynDIRt0w4Om@lists.infradead.org
X-Gm-Message-State: AOJu0YxDwzfozlWjQwE1ZIDczTHI288o/LTw5hOaIUZAa+n6r8r9zQS+
	Zh7sNFAeLdnvmdq4HJ8XMiIYUd3VgpfqhfHXmu/B5S+eWWQkxtg3gA++76gMohhP
X-Gm-Gg: ASbGncsY/dsC6Qb+w+vfiFOoUjPX1V2LUoQDmksRTTt+65ZgeM3bIedWx+W9IaM6VA3
	ZgsjrwGIVYm1yzXkJsnxbkHdvQvwGYHpT9Zvk2fFpNSD9c8SpLu33wzTi6w+ft7Bzwb6oxfQGKR
	NCzKt9qoGeAW2Te1ImJ0zzJhH6JxnUxcLJ3994cqhLn2+Spn5zQl99QHQ6/KuoaVxpimxYNqMT8
	9Kk5mK2M6k0SF0pLTMFrwCyVjB4mzo88A7Nl9zy1kYVU1I8qpAJ3kmO/G3kJAptq+T6kr8cuqLe
	M0vJ8VFK9GUjMy5NdIhizXKvWG/6sK6r9j+C1btt68bx0pcCIEEHTnrAGGXWzDcsa7PX2wcTMmp
	lHqXk04OtyJLZxSOPwrFLl/wb
X-Google-Smtp-Source: AGHT+IEj+0uiBv0YGs6nOxEb+SEF7twzlxJliA+jRY9O5oueP9X351mhyyn4YJPTgkjvxq3jrmPBTg==
X-Received: by 2002:a05:6102:4bc5:b0:4e7:bf8d:414d with SMTP id ada2fe7eead31-4e7f613770cmr9243986137.1.1750168651462;
        Tue, 17 Jun 2025 06:57:31 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5313dddd171sm1641844e0c.19.2025.06.17.06.57.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 06:57:31 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-87f298f3508so240027241.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 06:57:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5fU25wvZoODdYSjymhzN7ldeOnYO/hwuWG+JCwkzkUvp0e+PMCHfe/p0GSLcULYW82t7v41W+/HEJgxCRiVzW@lists.infradead.org
X-Received: by 2002:a05:6102:6a8c:b0:4e4:5ed0:19b2 with SMTP id
 ada2fe7eead31-4e7f61646ecmr10361664137.9.1750168650648; Tue, 17 Jun 2025
 06:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250617134504.126313-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250617134504.126313-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2025 15:57:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWfsqYvdL16hrbWug3PhK1XrSunaWtduajRzViKBRPeCA@mail.gmail.com>
X-Gm-Features: Ac12FXx9rL6On1cpfgpw-cjWhbvyIu0jjh2MQYrNFm-hEQyv6wxGvVbnYEQpoQ4
Message-ID: <CAMuHMdWfsqYvdL16hrbWug3PhK1XrSunaWtduajRzViKBRPeCA@mail.gmail.com>
Subject: Re: [PATCH v12 7/7] arm64: defconfig: Enable Renesas RZ/T2H serial SCI
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_065735_309748_48448D6D 
X-CRM114-Status: GOOD (  20.01  )
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

Hi Prabhakar,

On Tue, 17 Jun 2025 at 15:45, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
>
> Selects RZ/T2H (aka r9a09g077) SCI (serial) specific code.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for your patch!

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

I don't expect GregKH to apply this patch (or better: I expect GregKH
to not apply this patch ;-) so IMO there is no point in including it
in this series.

Thierry's original version is still in my queue, together with the
DTS patches, waiting for the RSCI DT bindings to be accepted...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

