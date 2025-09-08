Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861F0CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 09:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kntqtMNQTPE5WXx6NRncSYTTSp8VosSFmryh1S0y8rc=; b=HRezEVJXxW7n9PcyZ9qxrpZ6nO
	eVouylfKKmBxp+5xYw3qVDpFaAZMa3aINWuZ2J8/CBc/EV9qPhYRQBRKBvMhJvkHOB1X/5X+behgs
	BYtjXeiysc9XnLW1b01M2MgIPQRzKMZ1tQ+wVAn6LEVTLEe7/VdlziRvljUFM2qf571WiiOVAlgda
	7QQQX8vWy7TZrB9RxSBlHcg1COahdPK6GN9qqtdycRnO6ePOIdsAOw8DWZcZ1oqKiVweUdp7aVJ3y
	aumf1Hgg32wUh5i0EzKue6Eb16gHFA7B+GGmdvK4e2yru5R2R2XC3u5XxgHCNlq1n7g+vyPYYrRUL
	LN4XIFOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYH1-0000000G4Nn-2U1l;
	Mon, 08 Sep 2025 09:34:55 +0000
Received: from mail-ua1-f45.google.com ([209.85.222.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvXeh-0000000FqlU-3W0Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 08:55:21 +0000
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-89a89313bb7so1266978241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 01:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757321718; x=1757926518;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kntqtMNQTPE5WXx6NRncSYTTSp8VosSFmryh1S0y8rc=;
        b=s+Q/H+O06xezXTuBI5D3qooirE2DyIyVbRORKkW6VC5A94RPiqARWrOnlQkQUMI++g
         H32c1EHck3BySidcT/AIANwYNZIJskcUE9enA83MqAnt8GmTv9Fv167cB65uMRugvb1F
         +RE8usuonMeHfD4MQeDUAuCHCUgKS1nQ/Yf6ul016Y7wsalLsTGryDx59yqu6n8O0J2g
         YzyHqxoHj6i0X7eKMEFxRVbMT72GGoxIPkYUVTrZzmXtolXZ9AMS5H/w/1gm1YqSnD28
         aJM3fz0nGJ26tphXV+IGwZcPL2c2y2gLOyiOsmFwfECTpYIWRMO06JqLvGdOmnl6f9Sd
         NUTA==
X-Forwarded-Encrypted: i=1; AJvYcCUo17NG20dmHHkIf+5afCoL3JFbMYmbUV1T0FSh1LGDPZG9V1H/ivnmjNgmHqyHhYTs4kTBLvJOwIPlWmTmKv3H@lists.infradead.org
X-Gm-Message-State: AOJu0YzlOi6kMQoecdvMsveCwdOCsvB2C5hb4dQK0aEFW9YefOGRbO0M
	bro25ZobzTEtb5t5xXaU4q1NrrQd+gFiL5CgsBBQ9R8cEMqUsrcUgJ2n1cNXHlqD
X-Gm-Gg: ASbGncuGflIv2DnmIDGIj7Z7SszE8lOAhAChfJl1EIP+cumSJZZSOpVANQy2D5Ns2PZ
	EgKAh7IQVzcnVUrDgvSXOPVM1ri/+y5loMw5X3PJy0B7vLHc7OlIVk4rBUlcRcEiSl4peYM8uv3
	wH69K8sJ6v8++bRjpfNSzt0Wd+IZa6MTwmHp/zzYxekKwGdsTtPJR2Mo1wS2BZTCoUKrfnS89WD
	Wgiht9ABUo4lEoZgzTlqZx7fifua0YgKxraUYWJBoqtBRpgm/HwgjTsub3hqMAfrf2BT5kDx7uU
	QMPaUZq6EyrJAXSevEoMGHWvIBdI4AirX66eFwP6m6AREJc2SI1H8SMBlKTb/kSGameEKe38Xx/
	yge/UQJf8mt3sLnXJKvWnJBGcIKmk+qsKGf1sI/i+UcOwM/a7e/0NqM1ocRsd+drLW6PDKFo=
X-Google-Smtp-Source: AGHT+IHg9AAaWoLAkd+9aqTNDDWMx5tL/rHIce/NjPduYqzPwXY/fHP2lQkFjc1W7RjGLk2F/OTmTQ==
X-Received: by 2002:a05:6102:6c9:b0:52a:daa1:87e2 with SMTP id ada2fe7eead31-53d0e966117mr1832036137.11.1757321717896;
        Mon, 08 Sep 2025 01:55:17 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8943b7f2516sm10159578241.7.2025.09.08.01.55.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 01:55:17 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-89a079e029bso1274213241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 01:55:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXVnwbTqZJPru0IiH7rVY9KEgdvXcESfpQkF3KniZ/Y8EWICh16+tZCySwsJo5Ac8as4zOi2bbjrnYwW4eivUBL@lists.infradead.org
X-Received: by 2002:a05:6102:944:b0:529:ee6c:6760 with SMTP id
 ada2fe7eead31-53d0d61de0dmr1869888137.7.1757321716959; Mon, 08 Sep 2025
 01:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250904202838.172579-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWnusjKE8FNQWX-0arcdbV-18KTCHKZmhs5r5kRXn46ZA@mail.gmail.com> <82c9133b-050d-443f-afa5-31cb31c9e858@mailbox.org>
In-Reply-To: <82c9133b-050d-443f-afa5-31cb31c9e858@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Sep 2025 10:55:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJt7My-rbU=HGSQ=Fh8fs5DCZYJ-CGQFU+iWEYKEUL8A@mail.gmail.com>
X-Gm-Features: AS18NWAKLUWdF2nbnVFEPQJMLyA0fOJUVEIjxGYDljAdId_DpkdilFusWria0ns
Message-ID: <CAMuHMdVJt7My-rbU=HGSQ=Fh8fs5DCZYJ-CGQFU+iWEYKEUL8A@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779g3: Add RPi Display 2 DTO
 to Retronix R-Car V4H Sparrow Hawk
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_015519_890414_1655A7FB 
X-CRM114-Status: GOOD (  26.06  )
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

On Fri, 5 Sept 2025 at 13:50, Marek Vasut <marek.vasut@mailbox.org> wrote:
>
> On 9/5/25 11:25 AM, Geert Uytterhoeven wrote:
>
> Hello Geert,
>
> >> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtso
> >
> >> +&i2c0_mux3 {
> >> +       #address-cells = <1>;
> >> +       #size-cells = <0>;
> >> +
> >> +       mcu: gpio@45 {
> >> +               compatible = "raspberrypi,touchscreen-panel-regulator-v2";
> >> +               reg = <0x45>;
> >> +               gpio-controller;
> >> +               #gpio-cells = <2>;
> >> +               #pwm-cells = <3>;
> >
> > make dtbs_check:
> >
> >      arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb:
> > gpio@45 (raspberrypi,touchscreen-panel-regulator-v2): '#gpio-cells',
> > '#pwm-cells', 'gpio-controller' do not match any of the regexes:
> > '^pinctrl-[0-9]+$'
> >              from schema $id:
> > http://devicetree.org/schemas/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml#
> >
> > I noticed you posted patches to fix all other issues in DT bindings
> > triggered by this series, so I assume you just forgot to post the
> > fixes for this one (which you authored ;-)?
> I think the following patch handles this:
>
> [PATCH] regulator: dt-bindings: rpi-panel: Split 7" Raspberry Pi
> 720x1280 v2 binding

Thanks, "[PATCH v2] regulator: dt-bindings: rpi-panel: Split 7"
Raspberry Pi 720x1280 v2 binding"[1] does.

[1] https://lore.kernel.org/all/20250905191637.147141-1-marek.vasut+renesas@mailbox.org/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

