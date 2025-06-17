Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38BAC7114A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 06:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiMm/UuQK4NdW7rIYmF5hKWtuL7H8reRs8y0bqdt2Hg=; b=31VX6HLlLyWAhIZBdajngLtNVm
	WVemyccnmodtaZYqWooswWeX2oLlIXjOiGWsV5Amfn9EDyHOh3mFa484E0Piw3PFA9saAyIUXErqF
	dM0VldeJf9BbWKlzW73tysbXgWlCyxiVQunnuLaHYXtek4CFaIIZb91qmkCnuo7GeqFGGdNUZX0wt
	7IYQ7CTmNeV2n5u70lpDD1ppXHn8csZjqDILx0ts51WogsvkJ9sPRJDSoigc5RWYvtcLct+e+ZSHi
	dFbC5T0XXB4VvDL8dA1+b1alUuWAADQDoOWvQbIuFatO2r78lwLgpZKk2XNrNeSrQaoT4XHpxteod
	0pV3eKig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPtv-00000006MrV-1BqE;
	Tue, 17 Jun 2025 06:34:31 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPjF-00000006LiC-2iYS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 06:23:30 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso9670618a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 23:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750141408; x=1750746208; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiMm/UuQK4NdW7rIYmF5hKWtuL7H8reRs8y0bqdt2Hg=;
        b=FFa+Wchh3ZDGSYdkxoxAJjNWa2BYMLQHcEbsoZJ6TISL+XjWpz/UTVv2mmaMGhmB5+
         Hh5NEbnU86oe1HjMveGH3q55Zl2jwRmk5h9PBsEYMdzn2bdzCNjoB72y3WuIeeiEA6/i
         4h6e/swuPRE6/4vD8DPvgmfcYjAJ0P0r9IcRpFU8VKxQhuQW0HJqHJ853dg8SQj+BwRa
         j5UzA0DytujA3LrPeHF1MEpclhYX/GwaK370NNevGnSim6JdZfVyRb2YQ6wKLYUcNjni
         QI7dLbsrPNko018q52G64zGMHTh9+qIaEIOl5WK4hFnlK5874e/OJsgYItKHTRdT8WDq
         twsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750141408; x=1750746208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fiMm/UuQK4NdW7rIYmF5hKWtuL7H8reRs8y0bqdt2Hg=;
        b=X1b2oEkV8eVQ7QOrBlMLszL618D9cqljdUUfeJKNazIOqVXvwGMvhNJAHl9L8BhrP5
         1EA5zSvYKkG/iLGhXPykpCGwcGpY+D/aH1mTo3cfm9b5wonZdYIIHfiNnP5Cx7mQAy3S
         Xl+jLyc+R4XZXhKmJbY1ueTGtlVtyV6dcSWvmNi0UKJaeBYq25T0lpefwDwueGyMoND0
         C+Jk62zKNh/BnrgkOApQctemx+XzLL3RwIFb80t9xnk5l889ANFTiIwKYkvYV4kVqcrs
         TICkMPV390OMti8QoCgZxkBv9Icr7c8yL+rs8PqDeohHt1ZxirnzBdkj23Qhz/7DVpi8
         sOCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf2zuu0nTv9jnp90eyGrli1DIeuIxlCqMYj7Qr27pO7+FbdViQksppgIhKjD6a0dnlTzBHEJdbBzlEnEq2s1EV@lists.infradead.org
X-Gm-Message-State: AOJu0YyBy3fsBz89ZscT6DCmO6CwbCVYkMrTT6H4hJgRadu+4FRIMAGE
	VSkkwbyUaeOuJtr73GfyKRXTWVUSAlaq+K9tD2jSHo2igU/CCUuLoeEde6dAnjznZiY1PlsWIrT
	e2zS39fas1P8qEXEbD9pS442259KVqNistVpu
X-Gm-Gg: ASbGncuUcFKNkZrhFvjdNLR7LP6DIENTnQhwyZPI3PuVpbMSmV2CCaiAlXmuM71UYYP
	faTGxa+yGyVQFV3z7qCC6/FghM42/vjRsjGx98q8YP61Y5SKXGvJ5bhHvmCUKfW5MVONV0z9uCu
	LggvgIVHlVjVkaq1zsag08pZc8r/RLzSSpdfZcANG2lKC66g==
X-Google-Smtp-Source: AGHT+IH4VGUBj9RbJHLNfbG7hb6/lAZgxA6NE4P3wDXIGcXglf0OUiimC03iIg+au5JcWmYc4XqNRg0PgLcSZbLZCUo=
X-Received: by 2002:a17:907:d23:b0:add:fc26:c1c4 with SMTP id
 a640c23a62f3a-adfad534e86mr1100410666b.59.1750141408050; Mon, 16 Jun 2025
 23:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <87jz5bnsbk.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87jz5bnsbk.wl-kuninori.morimoto.gx@renesas.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 17 Jun 2025 09:22:52 +0300
X-Gm-Features: AX0GCFsYxbTDsZO9_1Fe7COjEm4qynoFUmmmFoYd8feCAjRwwiwG_tn4UP_UmYQ
Message-ID: <CAHp75VcX7Ugvv7S9vT=WjYNdT=XwdvMBa18AUA9TS2TKjNBoFQ@mail.gmail.com>
Subject: Re: [PATCH] arm: kernel: bios32: use string choices helper
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Russell King <linux@armlinux.org.uk>, Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_232329_711068_6A155FB1 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jun 17, 2025 at 3:08=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:

Missing commit message.

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

>  #include <linux/slab.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
> +#include <linux/string_choices.h>

Please, try to squeeze it to make the longer (possible sparse) chain
of the ordered inclusions. With the given context I would move this to
be under the slab.h.

--=20
With Best Regards,
Andy Shevchenko

