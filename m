Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D578CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 22:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFdUeExBEjH5ijJ0zDmAfHWE+UBuwNzNMUtP3mLlz8w=; b=NAIw4hxEGqnfYX/SW46UExdZtK
	9eucNnHFEfpTE5+04UE99g+sfRtsVk7irdtQe7DDYOzJD7A5DWM5fHsWavxN3/Udm8DpjyJTExne+
	mnMYooky8LRC3MSFEDviDby4g8tUY0Z/s3tpaCklxJmiFlxd8WJfGVMtPTSqccO6i28aYpT6Ok+As
	6LwHJX3RXCOjVy6UqHAhYT3NTo6ER6Wju14YqfO3//HK2b+AtXB+60vQBACRqa0hJrFKfNSNh225l
	T/aUI/IJXiTjw1asw9DXdE1Q83YTJJV1vapmIsj5TmhLbtgkOnzUquaHIofGM9Dk4dLSRDUkPSiaJ
	yeC1VqNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQuWu-0000000E3ae-3YVj;
	Sat, 23 May 2026 22:09:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQuWt-0000000E3aH-382V
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 22:09:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AA886001A
	for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 22:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20AD81F000E9
	for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 22:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779574150;
	bh=UFdUeExBEjH5ijJ0zDmAfHWE+UBuwNzNMUtP3mLlz8w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oT6oQzUdr5AeK/JN4DJQB/dziTq4R37qKQ5/9WM+ZEYiQgbaJPhk1h5xWwy6YbS0A
	 CKOVpY1BL79O9+ExzbeiqsLxsWdpuBm1Y7pEivSN4Z8zNm5ekXFKN9MXAxoj80BwX7
	 MMjIYznN6VPzFQbnQ0zYN5seExllUAFy6pWlYuM/Ft3ie+XC3DgW6yEA+l3vhdBgmA
	 RgojvXdOi13P024d4gJS5LjNZ4PuHwJhQ8mpv6ZsfAAAGsxE07Zs1yxVu4wSuwECkd
	 tX9z2qjhqvZUrTdJLQ7U74Y0wKumGBH5vNejSWk0/tSMAajS2rfuL0fGHbE35GHINe
	 GrdMu5pc93w9w==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a40502e63bso8639576e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 15:09:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8veNFXEmtUqffpQEJTbeTg+p6TuxtIKYudgsgkempR5/6uiLkc1rBxjgXf3zfl/ow1ArVcOf9w09fLSuVBAJqM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+oSojboPJoG5lA8nEwvH9qVwp/LhtDJCOx3wqN7l38YMnUo5P
	iL+0//KGXQGd7zJmwowJ/rK1+oxmHjWUYae0OY5hyIDHBq5FKM5zjJK3Lenq+Rh5A9ZFXpcxQ5p
	D2rJMcJ+LLp0pqGECeq86lOnLwk8LNO0=
X-Received: by 2002:a05:6512:3ca8:b0:5aa:36cf:50dc with SMTP id
 2adb3069b0e04-5aa36cf52cemr1235604e87.3.1779574148955; Sat, 23 May 2026
 15:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260522211503.25219-1-kmehltretter@gmail.com>
In-Reply-To: <20260522211503.25219-1-kmehltretter@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 24 May 2026 00:08:57 +0200
X-Gmail-Original-Message-ID: <CAD++jLnhONOMn=7hG-EC_uB80nxXfAnRMuZC2xoJjf2Xzcaiuw@mail.gmail.com>
X-Gm-Features: AVHnY4Lm8j4LfVLse8nnW32OdEBydMEMB1TPyp8J7ez8zpJEa_9lBm3aqPnEUR8
Message-ID: <CAD++jLnhONOMn=7hG-EC_uB80nxXfAnRMuZC2xoJjf2Xzcaiuw@mail.gmail.com>
Subject: Re: [PATCH] ARM: entry: use byte load for KASAN VMAP stack shadow
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, May 22, 2026 at 11:15=E2=80=AFPM Karl Mehltretter
<kmehltretter@gmail.com> wrote:

> Commit 44e9a3bb76e5 ("ARM: 9430/1: entry: Do a dummy read from
> VMAP shadow") added a dummy read from the KASAN VMAP stack shadow in
> __switch_to(). The read uses ldr, but KASAN shadow memory is
> byte-granular and the computed shadow address is not guaranteed to be
> word aligned.
>
> Booting the QEMU versatilepb machine with an ARM926EJ-S CPU and
> CONFIG_KASAN=3Dy, CONFIG_KASAN_VMALLOC=3Dy and CONFIG_VMAP_STACK=3Dy faul=
ts
> before init:
>
>   Unhandled fault: alignment exception (0x001) at 0xb91037f6
>   PC is at __switch_to+0x64/0x88
>
> Use ldrb for the dummy shadow access. The code only needs to fault if
> the shadow mapping is missing, so a byte load is sufficient and matches
> the granularity of KASAN shadow memory.
>
> Fixes: 44e9a3bb76e5 ("ARM: 9430/1: entry: Do a dummy read from VMAP shado=
w")
> Cc: stable@vger.kernel.org # v6.13+
> Assisted-by: Codex:gpt-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Good catch!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Please put this patch into Russell's patch tracker.

Yours,
Linus Walleij

