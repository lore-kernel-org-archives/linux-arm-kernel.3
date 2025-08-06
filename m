Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A57FC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 15:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ob+wZFgLLDZJ43IatvkYFPa2ZO5eiOMoVFYqdV+7TU0=; b=UpRjKJfA0ZErn3fLiQyfZYmoR7
	Hlwp5o2Ce/sE0xElE+iKdbhZqLGRNxNE9k/OP1d5Ssrw/yKDTZOTGUjaTGS501+Ez5A2APb3cApY+
	++/L0c0XLj21bvrx41Bf0pXkudSWKCSbPROdWHMArSbHRlNkl1X9GU6K19RL9zTOQmMY8DffO+qWK
	4RGUHJw13O2OV85iynSqzVci7ExmIKpavuqtcCXaO4JVM/sNponuc68KBTcIF8tnuvHJEJ9J7T4gm
	XYRe11wS+G42ORfBgqzbko9sq50ToUX0xvM5I/F0bATzpgaccq37R7wvKzNVmuI6eCD026E8Lj+W0
	XbFHrhuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujgAT-0000000FcgG-2EjW;
	Wed, 06 Aug 2025 15:35:05 +0000
Received: from mail-vk1-f175.google.com ([209.85.221.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujfpW-0000000FZFO-3BtT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 15:13:27 +0000
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5397d436dccso741370e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 08:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754493205; x=1755098005;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ob+wZFgLLDZJ43IatvkYFPa2ZO5eiOMoVFYqdV+7TU0=;
        b=Hw0JVk3NSUeqy37woX2mBUB8slGywJRE+nY2pSCj4K7e8oGQRaV9yvZYlH6ySev2Db
         K5+Ju1CoDkdFeA1Y9Ss3cMkxj2tBc7hSEXrH3PgYZLZxUpqrj8y+TdOK0U8y4mOWeUO5
         ZNsoS7htM82CB2KSVA9TrgLrO1VjhUb7QvaXpGtky1Mog0Sx3ETWYWemoWZUa3tYuE9D
         TEbA4bcmxPNJ9WznIxjhwo6SZeYMP0zQrnM0haJUYHd4a0N61v3rMDA1SZbnKB7quYAW
         QX1E2h8AYRUo9gXe1lnechOYe79TbpVpX+Sv4E8gtw3krJsPzzFZr0jEMATzUfb/iLcc
         e3Mw==
X-Gm-Message-State: AOJu0Yz0CIT8LLfZXneBPuIaTWMhscsoooCw732DnjCQITrnzOd3CJMD
	Cnd8Uj87I7V2OtbVyfDaN0CyUurCh621vklD+ZKIgOHVU3cr5v2q9D6BZnnKWJ13xbA=
X-Gm-Gg: ASbGncsZT2RtthwK+85vtDoXYR/bjJcuYHloMWi0gsdbz1faxw4qfE4tQS31CUM6pGp
	wVPR0xagstjxgl3HkYnNB58LW4mzxPvM5p7I3PQs++VgEldaPrJiK8yL9E5H9u4XzCMRYzQDiZ5
	UJRgqODGVpPTk3HS6sIJ2Qa3ruNFbcZaOEJyRme/chIA8nhJsscZK3ag17C6HqfpSlZiWizyxoi
	/htm/S5Fs8/nDDs5X1QeDXqRvGjhNOG5Lul2+sTXw3X/J/x/GZ5C+THFOoeAOT3tEXluBgLa2eu
	bYh1v5V2S7aQAfe/bGHZDNpY3kZ3WlpJIL7m0/4yqsq+gVXHAOq6/CxWerPXjFm/yMpC5audmg2
	CTBaZkfQi6p3DGxcUCet+07R9iZzCYM109uc0WJZc8MvJK9d75td8izQGa1Vj
X-Google-Smtp-Source: AGHT+IF9GYGvJ+vWSNt3Zf+AjLXQqrl89IYngpaEDsy28uQ+cwXOHoagRVTwilWlRJ8FArqhzmtEgA==
X-Received: by 2002:a05:6122:c84:b0:530:7e05:2029 with SMTP id 71dfb90a1353d-539a05206c8mr1521472e0c.6.1754493205474;
        Wed, 06 Aug 2025 08:13:25 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53936b980aesm4288138e0c.13.2025.08.06.08.13.25
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 08:13:25 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4fe2e89d055so1037001137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 08:13:25 -0700 (PDT)
X-Received: by 2002:a05:6102:b10:b0:4f4:af8f:589b with SMTP id
 ada2fe7eead31-50369c4b172mr1682169137.10.1754493204657; Wed, 06 Aug 2025
 08:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250806150448.9669-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250806150448.9669-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 17:13:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXgEXmT4S8Xo_FE3QeBiBHvG4VmnfPGK461=Asj+ov+0w@mail.gmail.com>
X-Gm-Features: Ac12FXwQoExk4huWs_17rN7WL6louaDbB_hlfPguV1KepD9kIFWu1LusOmMdzc4
Message-ID: <CAMuHMdXgEXmT4S8Xo_FE3QeBiBHvG4VmnfPGK461=Asj+ov+0w@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: renesas: Add boot phase tags marking to
 Renesas RZ/A1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_081326_799563_F1AF06CD 
X-CRM114-Status: GOOD (  21.77  )
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

On Wed, 6 Aug 2025 at 17:05, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> bootph-all as phase tag was added to dt-schema (dtschema/schemas/bootph.yaml)
> to describe various node usage during boot phases with DT. Add bootph-all for
> all nodes that are used in the bootloader on Renesas RZ/A1 SoC.
>
> All SoC require BSC bus, PFC pin control and OSTM0 timer access during all
> stages of the boot process, those are marked using bootph-all property, and
> so is the SoC bus node which contains the PFC and OSTM IPs.
>
> Each board console UART is also marked as bootph-all to make it available in
> all stages of the boot process.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: Drop blank newline arount bootph-all , move ostm bootph-all to board DTs

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

