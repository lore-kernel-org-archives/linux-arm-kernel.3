Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E50CC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 12:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fsMRvP1XrPCxK2127w/cMyY/iDM/irDUSUu0quMrzrc=; b=q9OXK1GVbM668/O044fhbeGch4
	Rz1Mil6YvzyxqoOCby2VlUSetYU4XcYEDeqH6mSDz2kFpYhmNYe7gGWGzYzU/ZzEtgcFz15gkPzFU
	wlgesl1+vBYuDC72mK23C9juNifTrBASpWQN1IEU570JficZ8Elj0eyFzfM3Nnln348T3nHwgA03U
	NpaA24b/oCzV9VKEto6mTA69rMgp2CuAXYbRWRupC/ljY90kEkAuNyB1/skiUyN2OiIrGYsj460tW
	vCBV4RCcq7G/Vn1sA0MKjDm/qU0hs2ITgkVu3JhErtU74oERg03gNIa2rYak9271u/GuIkElzI/xv
	VpOzqVaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NDA-000000065WP-40Xw;
	Mon, 28 Apr 2025 12:03:48 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Mkn-00000005yRp-3DIi;
	Mon, 28 Apr 2025 11:34:31 +0000
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86d69774081so1964773241.0;
        Mon, 28 Apr 2025 04:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745840066; x=1746444866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fsMRvP1XrPCxK2127w/cMyY/iDM/irDUSUu0quMrzrc=;
        b=ShTtCVTdqt5z9mAWJD2koClAQeFd2feeS6/VtVUWwqikmHK/RFEqJjmgA/3s6DFOU9
         KMmMJTcHT3baouNXq/zcHE7RH6t1U8miqCv3z1wy+nfSU+WELmkgS86WFRYG2a8FdEQn
         2ATCXLOmWwZQ0yyNLk6yicS9VzdM+0MlbvwYZXJ1eRCrx0BX8fXQUVs7sIZBp3yZmJIj
         QM4V8lH2mnuaalKxEV7yrShCxmQVIBXBfPNe7yr19LzDB8f8KzB8WJa/nOtwI/QWY2+9
         EdOtXgTqaL/2qNtcTBGb4CsjM92LIZ0TB9HWBqfasrlnR2OeXoIaoMzZniMhn8NCyphl
         r4AA==
X-Forwarded-Encrypted: i=1; AJvYcCW/FG8j+530RM+uFlw2sLLublUMTZSZMARrAS0SVr8GYGrrXRCCurtuJdeknMxYhkyWZJm/zl3TkzdSkgNT/EIS@lists.infradead.org, AJvYcCXRMHMIoVJSPypS0HXdbY1yunHEpKj/jMhbnoU0cJyDmPeX5+lO7Tk8gpE5uWXGos2fWkGCbuiQdBb6xR22EubhPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyM4Rv4yJwF7VdpVw9PK73ZQ3er1y8baSQXkrNvjS1WPGyB3Mch
	hHcEbw16tkSZ+idVE9IuRGR1pJYbTOSfFMNhoBmV69ntSWPEl0dqf+S77hDq
X-Gm-Gg: ASbGncuiOrk4Cf8foK1CyMTNhtIb5h08xEUDjKSC5UO5BsIq77EVVn1KxaFflJ1QSAo
	J9eRum6XoxrsGDCHrCh+LADKO1Y/81+4FvjwEV256mOzJYf45AOrFrSaJTFN3F7brOisQFEXbPD
	RpQbbBwWf1He7fjNYGil0ilYBnCP776eNMDDqBxAsWJxF6nm2VewLxx788CPHa5ePsz9CPabKT+
	XxwV/TzgYNx4drHzgxSVzIMpyR4hpbjLk6Dj3SlCeSVY0iwHXVAsSsf1OrvXF9CUMmV9xtvN0JD
	kno/qmFBCW7gUOok32oQbSbiDp07Vp304S0mWtqGksyrsjMT05hxL1YmBrm1zZpr7nsmfTPw8G0
	1jAg=
X-Google-Smtp-Source: AGHT+IESu45shB5oT5J88VkOESLn0B5RIWdpFOuh0M4LGzIoyizKr0lJ+DAfvm/VsIWxTHa4lvUtlA==
X-Received: by 2002:a05:6102:15ab:b0:4c4:fdb9:2ea with SMTP id ada2fe7eead31-4d640698094mr5584649137.7.1745840065719;
        Mon, 28 Apr 2025 04:34:25 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4d3d5662e5dsm1821491137.18.2025.04.28.04.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 04:34:25 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-86fbc8717fcso1862719241.2;
        Mon, 28 Apr 2025 04:34:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDB3q38NE1MD2+O9sTfo5figCijf2SF+81ySVaVdwoQb1DI14cJqmw3VMhq86bQvmlYHBKekSSdSmR0i9il/tLPQ==@lists.infradead.org, AJvYcCXOOIDxDDCqml2o4rz4/ZLo9uCBniEdTQWjFW/9n7KnwUHKovLcSUIZKbdHQ0AZb+3OWENwD+dVp/89OktDY5oA@lists.infradead.org
X-Received: by 2002:a05:6102:32c6:b0:4ba:95f1:cc83 with SMTP id
 ada2fe7eead31-4d641f67490mr4726020137.16.1745840065194; Mon, 28 Apr 2025
 04:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250427082447.138359-1-trannamatk@gmail.com> <CAHp75Vch8i50stVO6nH0Tnn=g4xSMji_iPj6q-CE1tLnvesqcQ@mail.gmail.com>
 <aA9aTjhXHb3gddd9@duo.ucw.cz>
In-Reply-To: <aA9aTjhXHb3gddd9@duo.ucw.cz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Apr 2025 13:34:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJNPRd3GMRV3=W0vsNW+fm4up-mWPOZ_W1-wQigQj8vw@mail.gmail.com>
X-Gm-Features: ATxdqUGozfO_A0x5sTl7wTcnhEJGNjE5AoOrad-BSBsbvNUoot5qyBGVSxOijmM
Message-ID: <CAMuHMdVJNPRd3GMRV3=W0vsNW+fm4up-mWPOZ_W1-wQigQj8vw@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
To: Pavel Machek <pavel@ucw.cz>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Nam Tran <trannamatk@gmail.com>, andy@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	christophe.jaillet@wanadoo.fr, corbet@lwn.net, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_043429_803549_E297A5E7 
X-CRM114-Status: GOOD (  30.16  )
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

Hi Pavel,

On Mon, 28 Apr 2025 at 12:37, Pavel Machek <pavel@ucw.cz> wrote:
> > > This patch series adds support for the TI/National Semiconductor LP5812
> > > 4x3 matrix RGB LED driver. The driver supports features such as autonomous
> > > animation and time-cross-multiplexing (TCM) for dynamic LED effects.
> > >
> > > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> > > ---
> > > Changes in v8:
> > > - Move driver to drivers/auxdisplay/ instead of drivers/leds/.
> > > - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> > > - Move ti,lp5812.yaml binding to auxdisplay/ directory,
> > >   and update the title and $id to match new path.
> > > - No functional changes to the binding itself (keep Reviewed-by).
> > > - Update commit messages and patch titles to reflect the move.
> > > - Link to v7: https://lore.kernel.org/linux-leds/20250422190121.46839-1-trannamatk@gmail.com/
> >
> > Out of sudden without discussing with auxdisplay maintainers/reviewers?
> > Thanks, no.
> > Please, put into the cover letter the meaningful summary of what's
> > going on and why this becomes an auxdisplay issue. Brief review of the
> > bindings sounds more likely like LEDS or PWM subsystems.
>
> It is 4x3 matrix. That means it is not suitable for LEDs. I don't
> believe it is suitable for PWM, either -- yes, it is 36 PWM outputs,
> but...

Is it intended to be used as a 4x3 matrix, or is this just an internal
wiring detail, and should it be exposed as 12 individual LEDs instead?

BTW, my first guess was that you just wanted to avoid the LED
maintainers becoming responsible for the extensive sysfs interface ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

