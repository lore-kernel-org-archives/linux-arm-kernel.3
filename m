Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA83E6B252
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 10:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4rxI8+R82FkhXbdk7eO8KDrDLgj0MsO7XK9vQ4Tu1FU=; b=V/b5IL8kzC8HkhTYrI9ja/l+od
	MID3r2WOCkz59+IaRsXtO7vxtnczxoGzPVP7Q9VuY2qoEnNu1QJnuDVFSj71deOSaWqvIFp8MBMOf
	gkxZ6zXd7M7OyuwaaoWpsAW++6ABMgqQUBEK4dCiAGRYEiOGGhBOhp6xVV3b7Hahf+01Zn1zCetvl
	aL0JO5x0S1p3SQP69NKqQ8lKjIgbsK6M1vk2MPhd000G/9kL+4ZqaIHNMiZLIVPBIt4WJpRXgMYW4
	9OTdvQuRj+x57b4qpzPajjjxeFlwY58VResNsulJi8ci6pK6MLjygyiwBpKoN7d25j6czDUTl08Wt
	C3LbazVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7XzS-0000000BITP-1FgM;
	Sun, 03 Nov 2024 10:37:50 +0000
Received: from mail-yb1-f181.google.com ([209.85.219.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Xxj-0000000BIMl-2HcQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 10:36:07 +0000
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e30d0d84d23so2739147276.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Nov 2024 02:36:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730630161; x=1731234961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rxI8+R82FkhXbdk7eO8KDrDLgj0MsO7XK9vQ4Tu1FU=;
        b=ZoI4DMfYq7JZKObkf7XM/Au1TjgIwGKL+xFel/hULxq/+cfqiOOcKhraReSXxXIdVu
         mnM80azkovzlOd0Yj/JlZ48Z9NKl/30pJBxDnx1Q88H7JGapnCtKWFdp0JK609bMus05
         bPBVBdopE9K1xXV93c8aoc1TmjbXUYWfg15TRHai2Id6lH1MwTi1vw9P7Fp8aIHOpk5e
         2tmjnPoDPRcD7bccs5uUHw9l9kQcVwrUnFtcC399Xk31UOisIPKIaE7pemQ+EMcv78wI
         HGXx6ZVM4+v4lpzjOadMEnUjYmldkcuKPBnYlOo4NVCelOORjY2KJTNPFolw4bW98e3i
         L8eg==
X-Forwarded-Encrypted: i=1; AJvYcCVgOphKSCR/kZEOobAcnvLFYTQpPbkplJ3epA+TPRbEG9Awk5LNW8LrUn1PKotgO+2xpxP3+8O5zXr5XjnW6H77@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8g0Oq0kkMI8VmZGy1YTflQAhQZuugPdnQarwACmkmGV9xd8c/
	AMCBFHs3BJ+jjp25NL0PmnSlM9kqvG14LXh4B39Q9s03dmX7r3pgYrJql/GR
X-Google-Smtp-Source: AGHT+IHzowuzAK5a5O5UlRB7zYMTd9qeTADv4KgGw1Mc2uZCSOq5/wonX1xtVoVuXRPJyxzZeg6g/g==
X-Received: by 2002:a05:690c:4a01:b0:6e3:b8f:59d1 with SMTP id 00721157ae682-6e9d8b00405mr304503527b3.31.1730630160885;
        Sun, 03 Nov 2024 02:36:00 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea842843d5sm4817637b3.69.2024.11.03.02.35.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Nov 2024 02:35:58 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e2e3e4f65dso31782137b3.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Nov 2024 02:35:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW2sNshdVFR9cjOO0okC2BDTenQMuYN2H3ylUS0mK3hN2yOZO0pg/YlJjnxTeAv9yB/EYr3LpGv896TwBNWk6xi@lists.infradead.org
X-Received: by 2002:a05:690c:31a:b0:6ea:6876:5226 with SMTP id
 00721157ae682-6ea68765303mr77877237b3.23.1730630158376; Sun, 03 Nov 2024
 02:35:58 -0800 (PST)
MIME-Version: 1.0
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com> <20241101095720.2247815-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241101095720.2247815-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 3 Nov 2024 11:35:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXdeq_wTdtrn28yhm+Ue==FMJ=0dkEAQTkrNUDRtcQ3Ew@mail.gmail.com>
Message-ID: <CAMuHMdXdeq_wTdtrn28yhm+Ue==FMJ=0dkEAQTkrNUDRtcQ3Ew@mail.gmail.com>
Subject: Re: [PATCH v6 4/9] rtc: renesas-rtca3: Fix compilation error on RISC-V
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
X-CRM114-CacheID: sfid-20241103_023603_605507_53688BD1 
X-CRM114-Status: GOOD (  15.77  )
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

On Fri, Nov 1, 2024 at 10:57=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Fix the following compilation errors when building the RTCA3 for RISCV:
>
> ../drivers/rtc/rtc-renesas-rtca3.c:270:23: error: call to undeclared func=
tion 'FIELD_GET'; ISO C99 and later do not support implicit function declar=
ations [-Wimplicit-function-declaration]
>   270 |         tm->tm_sec =3D bcd2bin(FIELD_GET(RTCA3_RSECCNT_SEC, sec))=
;
>       |                              ^
> ../drivers/rtc/rtc-renesas-rtca3.c:369:23: error: call to undeclared func=
tion 'FIELD_GET'; ISO C99 and later do not support implicit function declar=
ations [-Wimplicit-function-declaration]
>   369 |         tm->tm_sec =3D bcd2bin(FIELD_GET(RTCA3_RSECAR_SEC, sec));
>       |                              ^
> ../drivers/rtc/rtc-renesas-rtca3.c:476:11: error: call to undeclared func=
tion 'FIELD_GET'; ISO C99 and later do not support implicit function declar=
ations [-Wimplicit-function-declaration]
>   476 |         cycles =3D FIELD_GET(RTCA3_RADJ_ADJ, radj);
>       |                  ^
> ../drivers/rtc/rtc-renesas-rtca3.c:523:9: error: call to undeclared funct=
ion 'FIELD_PREP'; ISO C99 and later do not support implicit function declar=
ations [-Wimplicit-function-declaration]
>   523 |         radj =3D FIELD_PREP(RTCA3_RADJ_ADJ, abs(cycles));
>       |                ^
> ../drivers/rtc/rtc-renesas-rtca3.c:658:8: error: call to undeclared funct=
ion 'FIELD_PREP'; ISO C99 and later do not support implicit function declar=
ations [-Wimplicit-function-declaration]
>   658 |         val =3D FIELD_PREP(RTCA3_RCR1_PES, RTCA3_RCR1_PES_1_64_SE=
C);
>       |               ^
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

