Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372C3CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 15:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IdOpo31kserPmrGp3GvpU58TPDoGY+y8EflyrkRt+J4=; b=Epkguv6OzdZf/Cgsy7SwVMxVsn
	XkhZyKMQwPDVXBcBJiJLXw3ntJ043/lFdYXLfiOgeyeS3qNdF6pMsLHSoczbDrJCuazs9HJCPsUo6
	/L8IIRLoJyd6wk+35hfFwo5yaVgWoKFcreE+XdnCcqAdiUYZseNlU/EzJC9KN0BB9euzg8G8QY4PQ
	GVrF4RoNayqAxI4WPV5200ZiZquaKewdMYZpa0zMF2B6dI88GJ80tAg98BLs8228M1oHg0IrJOWVy
	h/osT3u6RVw4DPlICLwQ5tKsO9O+G92y+XZjuOPhZcqzyz8Icr0eeNaRBPQpXEcFBq1uDH/KzoYlq
	Q5yqzZRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRur-0000000BGtk-11Dh;
	Fri, 22 May 2026 15:36:01 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRup-0000000BGsW-0Vto
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 15:36:00 +0000
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e568ab0bc5so8276103a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 08:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779464158; x=1780068958;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdOpo31kserPmrGp3GvpU58TPDoGY+y8EflyrkRt+J4=;
        b=AwntTYLzWU9OGp1ywF0O+FRY/YMbvZ7y9Dq4iP9FDrHZATXcWzjKi47CTB9O6zv65A
         78rWFN0knNn1YGgHnvxOe/TgABmq+NG2I9rVttWmT/OJSIWmE62tSzKva2ohOch1s0R2
         yzBJrPuLXgT1P5jgzf4USKWpU0/jMPxDr2smcZc0tHehSbnLHEwwaf6VizyTOynS3Ypv
         D9OSL2VR3seSVO5yRYtKX4zFLh2t83GEw/T8leqzAfW+YY6JAICqnYp0HzCWokApUikz
         xPEF6jfESdTNAniVTDqRwwhuqrK6iljfBx9XrvRWjDYryt42qmN/QlSUmE6SVv1Rr8U2
         0ADA==
X-Gm-Message-State: AOJu0YwE+CKnDpRUiUjX+GjcreNPBqCEvCNYtH8+2pu+O84lXjrdpdAS
	HYQEjBa5XyiF0jLB1kXTlavsbWp+Uh+SKk0ukEnKqKJcuBwsPUA0RVHW/iahp2O+zxo=
X-Gm-Gg: Acq92OE1MEOFZPApT3Dh68+uhnBtWvPVo0/+eSxrAFOhhfwtrg8YnxBxa21ppUTTAw7
	BRQZxxLEyL3smR+wNCkaG4QsgNOaXSoO4p4Ac1dJBQgrsikumt1qza2Dvl4qE+Q2IcvUeZvFObn
	H7RWjuqNW60oKv29BdW17N66zjREUW+I4KcY1nIqgD14NK4+P3PcvRo9aaaFBJfJc90CjSVp1MF
	h9lkNQaAdYxLrYdEy7eOLIUWZoHymqzLk9qET/2/5zQvkx4lxX4P+/dijBFrvHlPEToAbHTkFjK
	H8FWHcA+vQb1g+nbVue/OELFAI+VFUnXHBofgnCcw7RnW766AkSPoyZKR9RUiBGRDPm2Fmhf7WY
	8CMilDu8wsDNGNWwVKorqUEd9NJKtCFcMrVN8mE2KnRwfJgYsb34KPPlC7+IPpgHhqSY9TYW/SR
	YGnzNvE6BgU/b3ql2u8zZ/fcOZuVu8ujn4aR+mVYyzx6w3QJKoOAMjncf09c47BxJdESMnW7c=
X-Received: by 2002:a05:6830:6dca:b0:7e6:309:2189 with SMTP id 46e09a7af769-7e6030927a2mr1354387a34.13.1779464158075;
        Fri, 22 May 2026 08:35:58 -0700 (PDT)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com. [209.85.210.50])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6065e6966sm1212996a34.17.2026.05.22.08.35.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 08:35:57 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7dcdca9aa0bso8396567a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 08:35:57 -0700 (PDT)
X-Received: by 2002:a05:6102:c4f:b0:634:10bd:95c6 with SMTP id
 ada2fe7eead31-673d1c38b59mr4123345137.22.1779463759525; Fri, 22 May 2026
 08:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-6-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 17:29:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUNLshTRi8yqOBezHpWc1b=f7VdSyN_+cC=r0dKAi8R7w@mail.gmail.com>
X-Gm-Features: AVHnY4LJMj7MpfiKYvQ9U6raZAqssKkW2xRRdr52QyR92yVonmyMfE85fwhFPPk
Message-ID: <CAMuHMdUNLshTRi8yqOBezHpWc1b=f7VdSyN_+cC=r0dKAi8R7w@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] soc: renesas: Identify Renesas R-Car R8A779MD M3Le SoC
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_083559_160391_608DA5EC 
X-CRM114-Status: GOOD (  19.17  )
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

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add support for identifying the R-Car M3Le (R8A779MD) SoC.
>
> The Renesas R-Car R8A779MD M3Le SoC is a variant of the
> already supported R-Car M3-N SoC with reduced peripherals.
> Enable support for the M3Le SoC through already existing
> ARCH_R8A77965 configuration symbol. PRR reads 0x67c05501 .
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

