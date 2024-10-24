Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7339DCE8E83
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 14:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uf1v8inwAeGWWTJ5qfca3lXnWCIMxKlti4Y9iBdiRr0=; b=RKwBX2AmnRdTWFaBsFThmeCCn0
	1szugt4GF02xWAQeUqc7NffCsH7xjTbQoRKSMYMSYM5qKo3dJb0nwQhpQLgfnec84/ptmrolozYXO
	DO58b35l0/DqDl3xPkZoru0FvG6/4INXBQxuM2qpN9xU3pViQnwtPwV3QPKDtxVCFY2Ox/EnhwAom
	u/rUy/9GgRTUu2QMCEbYhAU6n5u3jKySugiQOUZ1Mm7kbO356Nk5gzlqv8JqsuektN0vjeVuDOQNe
	sTUq2Gkrx5M7J6PPhaL13XsbSpBOi4m40Gxe1gbfyoGF0CJ7DEcTKzN5BwU3jaDpgBzw1cJl5aYL7
	4WcXaJwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yy2-00000000lfE-38Y1;
	Thu, 24 Oct 2024 14:37:38 +0000
Received: from mail-yw1-f172.google.com ([209.85.128.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yjy-00000000hiu-2X5R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 14:23:07 +0000
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e35fb3792eso9710667b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 07:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729779783; x=1730384583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uf1v8inwAeGWWTJ5qfca3lXnWCIMxKlti4Y9iBdiRr0=;
        b=AmlvPsn13Sqg5J6W+Iyptb3LXSOKREpAalZDlucMNqfZG4E+ryIVicEoOjbR9mkClP
         0nV+mZ1gt19ssL36Wvz6cF0xZqoP44JkkUC27z1kjuTVAXVRhBRaiHIDUVTdmlIGpyKT
         EPdeCdC39/uENy2YszJPssZnlo/id1KobnMRP5hlUl8K9XaiI4tgRTBYnU/aj99xoiIG
         P4bapNynd5m+ZKfTpN4QLrGmTY4AgM6OiVXti5ZydQvBZ5GhZANRApfQx2vKIWOVbsFr
         bP5oEbHz8QEDToTl88eyFx392wtVOG8AWp2ohB4vGnr+vUhLBlGV9fkQB38/Q36tXuzA
         uRfg==
X-Forwarded-Encrypted: i=1; AJvYcCXNfvodp4AMWe5j3A/EooKDmfaU+v8l655pEy9K11z8e7GrzsLYRo4512LxBf0HP9c0yH8u6r5ZN6K1+ewsgaH6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz94549H/yIylmrtdOERkeMhwH2T6NnAfgbUZ2YSh6zqKVq9GOE
	KcXtzmXP8kKsz19b8nD8mVEarDoj8Pif1SwILI53Ga57mZ6WaYY1QocQBLhm
X-Google-Smtp-Source: AGHT+IH0ooWIRv+OzD0pkSsOUQrGGwuRBYAL08KpBCWHsxCs+fq06LUtMcAby0Fl1kCJBuyLMPhv+Q==
X-Received: by 2002:a05:690c:708a:b0:6e2:7dd:af66 with SMTP id 00721157ae682-6e7f0e72ea7mr74689237b3.19.1729779783376;
        Thu, 24 Oct 2024 07:23:03 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5ccb6bfsm20063687b3.76.2024.10.24.07.23.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 07:23:02 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e2e3179b224so1139430276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 07:23:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWlGrYXI/RkPpEFezXw8Ii6gauJjG0KXcKI92QkRcDhHl9R+ez1t5TF0pgTyEQFQFcdlym2IXBTbRVE2nFKnIjt@lists.infradead.org
X-Received: by 2002:a05:690c:6508:b0:6e2:ada7:ab89 with SMTP id
 00721157ae682-6e7f0ed3a28mr76765417b3.26.1729779782574; Thu, 24 Oct 2024
 07:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com> <20241019084738.3370489-10-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241019084738.3370489-10-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Oct 2024 16:22:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUy-EhLMyT3KirQxnozpQt520XdvmP-nQ+EbRhnYMu8FQ@mail.gmail.com>
Message-ID: <CAMuHMdUy-EhLMyT3KirQxnozpQt520XdvmP-nQ+EbRhnYMu8FQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/12] arm64: dts: renesas: r9a08g045: Add RTC node
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_072306_669076_3487852D 
X-CRM114-Status: GOOD (  17.00  )
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

On Sat, Oct 19, 2024 at 10:48=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add the DT node for the RTC IP available on the Renesas RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - dropped the assigned-clocks, assigned-clock-parents properties as they
>   fit better on vbattb node
> - moved the RTC close to serial node for ordering

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

