Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98E7C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 15:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZL174OVf+FE8GUAaly+9Noj4AvnbyoVh06lJ5C/YSZk=; b=Q3e8UbsrErr5P74PHSVJ2ZNSCl
	RGlka0oX3QTSZo5M19aGlq/a7Wynwdg+9U4HmeebKCG80/ZeRn74svOpK3fnDHGJjlsi7VCt1VZB3
	IP9uq5QDzs17Q0WAvI4wCiBqj4o+IQbJ0pvELaCNnUFIpSaiBxkQlO4tGVNPESZdNa/8km3SWRXV7
	O4Cae3izzUBzu0nywgCQ2B/eceyL2HxJ9ai2T7MssIRrHNDdzN6AAtblAht7PkzEVrE2j4CIukI2A
	DQlHHjk5JZmgvLcZhN5hOH0SgOcxGbhW2wNxhQbSq3Dv4L/ODK5OkTnz7myMvPUFdAFaY4xMmAFZj
	pDSVuSeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYYM-00000007muL-2q6p;
	Tue, 17 Jun 2025 15:48:50 +0000
Received: from mail-qt1-f179.google.com ([209.85.160.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXat-00000007dCS-1tjE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 14:47:24 +0000
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4a6f0bcdf45so72346231cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 07:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171641; x=1750776441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZL174OVf+FE8GUAaly+9Noj4AvnbyoVh06lJ5C/YSZk=;
        b=Cn4XxJyBZfjnCFi/CPEvUjH3Yv8oc36Sb7RiXa8ZuP77bEDxZcLNQv17bwyAN5lK2Y
         IJMtrna8hwIZKYAhNmSZfm8jkAGxkdkRu0wtsu3PCdZ2hBDd560d2NsQAyZYvDPzudl9
         USmSsWli6Vbwfg6OhWXlL1NS/3jXRI8lpvONXyHlBDfKe/A4wLZAcRR9POjEiiBBgfcN
         hU4f+twlTDia49pseTc08Vqdbh932N89pkuhumH4mH8OPaMaMtlB9Acqlg2o+d8B4ZLS
         UHkWrRUpRCrLAq81j1snWgRVPZKfEXbB/lbV5LBkYwOqxqlADj4+bB6B9+2y+/yXhjIK
         JazQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9A1nUUy1JOqcR5AcRG8FXWOgjpG0N64IGSeHSXac+UV4zkDO/rK/1CNCMgZMwOEY1H1giT9jSIIERLuORyZjB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4KYrjI0Wd2nPrNxcG/bURK8mzFHxxj6dYHGU9vMAlsGEVD2Kk
	BMZDMe0gt1Jw14znMsOc6BouF0ZK2PmnU1UDJwGFJqReJdcrv2GeeRYibe51FFtc
X-Gm-Gg: ASbGncs/IwJ6dXEpN9JKnrexQdOTwCYL/qLJotkhlaDJck1ias3/K6VMCR3cPG8Cri/
	Nw8drDGKaXs3IQaOEG88hPDrGukXx/3LeCk9AH+UT4Binno0GqpSSevY5VtEDiR2ZgCxT7zL2O7
	REnfdDwGPfqSUMTCl5NytFeWM5aEUzVthti0Dn+7i8oaXhdQopECknracP8jvGTRZzwsgytvtf3
	BjEsW0A901xiFQsqW/LEKMC4LB2C4ZG+7l8zoFU/qwA2yeqHzJKkUpnfO8vrOS6u6PxKHsuS5By
	2xwu38ywOssmSPAqEtmHzJGWxBYHXnPxKrZPLM3zbpKrSEkW4RoK/0DB96IQ/s6JPKYXJa9FLbT
	g2gJ8mTB4Er+F5dFzGspG6liw1A19
X-Google-Smtp-Source: AGHT+IG4aqIbeq56HrkMWqzCeYjhR6JOdKoNpAdK7KZCv3J7QOpkzh/pAqUP7nxZGNZUq3R8Xeh2ag==
X-Received: by 2002:a05:6214:2243:b0:6fb:5559:b3d1 with SMTP id 6a1803df08f44-6fb5559b3f2mr136360506d6.1.1750171640847;
        Tue, 17 Jun 2025 07:47:20 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c6eb83sm63300476d6.100.2025.06.17.07.47.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 07:47:20 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d094d1fd7cso834219085a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 07:47:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWd3L2uQA5PMG0Xgi1xyAxTO/Qb/ZRtlwiqMA9ASeH0BUsA5/D4MbpFubToHJRlxe3ezhWbG6Nuef8Dn2T+Nhd7@lists.infradead.org
X-Received: by 2002:a05:620a:244d:b0:7c7:b5e9:6428 with SMTP id
 af79cd13be357-7d3c6c193f7mr2182882985a.22.1750171639228; Tue, 17 Jun 2025
 07:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250617134504.126313-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWfsqYvdL16hrbWug3PhK1XrSunaWtduajRzViKBRPeCA@mail.gmail.com> <CA+V-a8sx9iuUjn3uvSqq3Sd=JeTj_UMyDiLzisrnj1uQw6nbGQ@mail.gmail.com>
In-Reply-To: <CA+V-a8sx9iuUjn3uvSqq3Sd=JeTj_UMyDiLzisrnj1uQw6nbGQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2025 16:47:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXn+Bhhp1KdeX+86ceG8-Tu6-k32Q4e35tr4rnS6ATzww@mail.gmail.com>
X-Gm-Features: Ac12FXxX_-svUz3B-XW3PKGFENxEpML0XitXkiF8yDYZJw0qOf4W2v_oYmV7urM
Message-ID: <CAMuHMdXn+Bhhp1KdeX+86ceG8-Tu6-k32Q4e35tr4rnS6ATzww@mail.gmail.com>
Subject: Re: [PATCH v12 7/7] arm64: defconfig: Enable Renesas RZ/T2H serial SCI
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_074723_492592_D7ADFEFB 
X-CRM114-Status: GOOD (  27.33  )
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

On Tue, 17 Jun 2025 at 16:04, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Tue, Jun 17, 2025 at 2:57=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Tue, 17 Jun 2025 at 15:45, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > >
> > > Selects RZ/T2H (aka r9a09g077) SCI (serial) specific code.
> > >
> > > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Thanks for your patch!
> >
> > > ---
> > >  arch/arm64/configs/defconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> >
> > I don't expect GregKH to apply this patch (or better: I expect GregKH
> > to not apply this patch ;-) so IMO there is no point in including it
> > in this series.
> >
> Ok, got you.
>
> > Thierry's original version is still in my queue, together with the
> > DTS patches, waiting for the RSCI DT bindings to be accepted...
> >
> I plan to send a new version for RZ/T2H DTS/I which includes fixes
> from series [0] squashed and also mainly update the model string from
> "Renesas Development EVK based on r9a09g077m44" to "Renesas RZ/T2H EVK
> Board based on r9a09g077m44". Is that OK with you?
>
> [0] https://lore.kernel.org/all/20250613135614.154100-1-prabhakar.mahadev=
-lad.rj@bp.renesas.com/

Sure, please go ahead.

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

