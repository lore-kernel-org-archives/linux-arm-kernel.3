Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00B8C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 06:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbW8jJVXlyvkGOD1ALlSWkXQME/513JvWJg0nrdGng0=; b=aVoBZctgpsoG2rS5uBFFKffOuU
	kLKtu+mkXBUHY9J+y0d8Kzb5mMrrhpFyRxwVgV+9nXdt3cRe2ldJK0BjGAtbH55uM0zXUjaSmnODz
	ZuuslBnvZeuKK5xUkFHHr2nr0NkISvm3eNBhsGTMSKudMxAG+bO+1Af62zRJA4vHnfk4vcCLrKgBR
	fkDqDLoYo0G7ZRVUXIRdga95uu9/X/2s0OoUDUbdVktsMfC67OwTz+2Il6sKtdMbjdv3Pd441cwa0
	PakaYHW5F4Qk72l7D8Jli8zU0qHZIyjR8K7kPQMbqGQC4mDsFB8Y79gGQ8DRE7xJ5iee8EaAPfsUS
	oCt6rX6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPn5-00000006M3Y-1Z90;
	Tue, 17 Jun 2025 06:27:27 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPfl-00000006LIp-2Mk9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 06:19:54 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-adb2e9fd208so1076362466b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 23:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750141192; x=1750745992; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbW8jJVXlyvkGOD1ALlSWkXQME/513JvWJg0nrdGng0=;
        b=Kbl6hD1StnHq/93RbL65ABJIwKiNyHC4renaLeDjtjI8Se9f7607/LlrurPohQM4cj
         NkSJRhB1BYfriCHc2aBjkOLTfNFkaQg5Hk2dbOfz+YkTYE9ine76Nahf6BY+CabVCLFk
         xfFq8Csynf6PgzZ2J2j4GiV20yYnT7Kke5BQCNp8+NHL28FCL0O8pQGgEODqoV2fpglP
         C9gOIFJSQV5pLp2pbShup4crB1hHr11oQ8nm59hZr5p6HEWPPHbjapsBoo4bIWCwXrDO
         x81vnBlrBLy0fj1B7+42/K0Drc9MOp1TJkzMCkKlmyI/wHdBsenvy+1c7U4l58CEIyr2
         2Ogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750141192; x=1750745992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbW8jJVXlyvkGOD1ALlSWkXQME/513JvWJg0nrdGng0=;
        b=Qi9uhnxVJbSKJI1Ar7x8QtnRavEvwph54FPNFWw2ivMqWJnJYrq5uppKzIEHiFh9wM
         iZqIuAKLI2XFLL+6QNXsYvemUZI7cIeuoGpS/vL+330z/Aa6/FvjCmJJ8ZEiRhB+693i
         hDp3RWUGhHxyuRQp1XPdvdHT1cMl5lK4qUxuqmYXnA3UQ8oiVRHZoe00gtSgV8hlUGe7
         UO0CVleiIaX8V/hWnhhSEReKUYbIXMmBweOvcaFOr2xteODvRCtvxuIw8emV6xNmuPUk
         DN2Rh1sXgoELBMvuIQdx2QjpYUvf2GpDCcJ2lhE7XKCBGtacDNYlOMjYhqu942+6McTO
         ObDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1YmqDpKg+Ftme+/43Ou/6+VXvUs+4YCV0ePyGny2bgtLM/FTJT+EcVtF/RuQTxC8FJVVfYPVTAKz+9hbgBnBb@lists.infradead.org
X-Gm-Message-State: AOJu0YzhjxSHpg6XIHXFHR0E5ZzktItSDmTTRV0FfBw5/lzC4Examxpc
	SPQGkBqe1V8sG1zUAnl03XFlv/+YCUvoWQsRhCYRKYAAX0QzOh71sEq4gHXQlDJDR6aYdpGbmOR
	ctmFgedhhn7UHjJ0M+Za656lNvndIG5g=
X-Gm-Gg: ASbGncvGpwiHBLzqF5xxU+jWp9p59qIoTahQ2BjSDHz43+i8petBKJdSWckcCzKRVRe
	fNyRd3BDkOr8IyreLFv98rAOczOg0sBAytqmcm+ZXk7o3UK7fi6cxtcSs/i3DgAlxuIcvnT7ccL
	r73dMJAB93XPBFCaCovXSzgYEsDbFVztL/VpuPVPb+gdTfow==
X-Google-Smtp-Source: AGHT+IFtnZ8lFJwWA+b1NtwB9icHa0RyKDhU8RuDrlsyTvGyphnuRd3qxD1/gBKZuv5RBq87ckqBVFY7qchwsPq02qQ=
X-Received: by 2002:a17:906:c148:b0:ad8:86d3:a5d with SMTP id
 a640c23a62f3a-adfad3cb334mr1145938766b.20.1750141191818; Mon, 16 Jun 2025
 23:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <87sejznsef.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sejznsef.wl-kuninori.morimoto.gx@renesas.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 17 Jun 2025 09:19:15 +0300
X-Gm-Features: AX0GCFvk0g8bosN3j0Pi_QR9mvvgQmN8dBw6G9v-u_MLNYvw34gdJrga3-puZkU
Message-ID: <CAHp75Vcc2npjvsJxG0WxtZ7AxitjTQ5YGBLx7L-zd6PFWMQV+w@mail.gmail.com>
Subject: Re: [PATCH] arm: mm: fault: use string choices helper
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Kees Cook <kees@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Yanjun Yang <yangyj.ee@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_231953_702186_006402EB 
X-CRM114-Status: UNSURE (   7.65  )
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

On Tue, Jun 17, 2025 at 3:06=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:

Missing commit message.

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

...

>         pr_alert("Unable to handle kernel %s at virtual address %08lx whe=
n %s\n",
>                  msg, addr, fsr & FSR_LNX_PF ? "execute" :
> -                fsr & FSR_WRITE ? "write" : "read");
> +                str_write_read(fsr & FSR_WRITE));

Make it now one line with the ternary (either moving the last to the
previous, or resplit the previous by the parameter delimiter.

--=20
With Best Regards,
Andy Shevchenko

