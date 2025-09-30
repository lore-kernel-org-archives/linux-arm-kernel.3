Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39DFCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 12:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//xkitOYEIBnBowE0figA5jcXr1QSGKbTFftNJcWdSY=; b=sT+N08gtrYgVdGN5oBzkNlOOoU
	AvjmLaF1HTPTWTbHQfnKTKXZQCUrygLn3vSLU1eOyeQVHgYJ+CKgf6Uq0f9TQF46tnnj89MLsJNXm
	SjCDyN1AQ4B0ZZmuSkJZFlUkLRL5B6nX1tAb7rUMnmOvDgOatPKf4ii5ZXxRnMILqj0hpX21YWsw9
	UegNwhNpgGl+CeFRyQOhW62MFqzb79uMyysnWmZVdZqrrCuFvq++iJY8kicqZrDIp4rgfYE/JbtKB
	GdQzCKxogbhHAQe8BDnTRRxO3q7dMTHI95fi/xQfzqiPLg2DOIxVGvvqku172FZloLmyXSqiBQlTh
	ARi4tanQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZZO-00000005I0K-1CZF;
	Tue, 30 Sep 2025 12:35:02 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZZL-00000005Hz1-1hYA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 12:35:00 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-362acd22c78so56828711fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 05:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759235697; x=1759840497; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//xkitOYEIBnBowE0figA5jcXr1QSGKbTFftNJcWdSY=;
        b=aqZ+LY7psDlU/KcaA1RR7uhKbxLfUZiu3K9qpe8pPweJSlRjAX2Ov688QHirj+d8GG
         5R6OMzJ227EJibkfaud24FRhxf7pSvQRMnbgqEomqaznNuwExFtA4phu6qckpd+nWWcl
         J7T3YfivRVCbdSr92JW247B8Xd4KR5ipbEDkyWzAcS11x/BbviH63Z4HQbafj6MAMw2K
         XH++5d7ZmWJWcK6iVLpQz5XD9tebcPMWtIJjZopZAt/q1/rm6Wh6j3lGIe5eNDwwcBoM
         4nItVyYMR3VjOcoAAmfk7vHTdECjRKzeUD0fcosxO/+KeBwn3SIa+n3gIoqe27FljjfP
         fiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759235697; x=1759840497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//xkitOYEIBnBowE0figA5jcXr1QSGKbTFftNJcWdSY=;
        b=CFrzYERTcyf+Tq5X9KkavQZK88KGkugsLalps+gIM4PnLATHkpt3wWgUXM8kVPb7dG
         9MkZer7aZ4B2pX8b1TXqc4cNCaLIVybe07KbAKktm/ODPQzyVKfbcU5s2d2SnUOYeDwo
         pG0CRj8q3nqp+yFg7ArMYmAt9ZHOgVAcL1uuvk7BwcRzHdxyknlDIZfREOJeaUqvspsy
         uBVzD+ZnxAOPtn7P/otRYtLegdMQ0fSu906XgFPTrKRuCtMG4LGfGVieV2zY90h09n+d
         EjwVt3fWQpHgD0d0z1GjTcMVtgQRvLa42ElbMt5plwQ65p4SfQrxDllHqXCI8BEgD1j2
         Bt6A==
X-Forwarded-Encrypted: i=1; AJvYcCUHQsAtoSTzbrPihPMbtyod3WlT95UHTl/tbdyrCHZWjFzceH525HoNJxWriAW03pGVPPcrPeHxQpwZwHMa+B69@lists.infradead.org
X-Gm-Message-State: AOJu0YyTJHvsmUYwJhdxAl7O4xy1XqtLQ0hahgrwJMEDbrKGHpnK1X8r
	tNmB3ypSTpD2W3C6MWkUOhZL0X9h3TL/s44FdnsviARtY+l+K4d2lv0mdVr0r1CC9KWJWR/E8ue
	BgILikKo/eKMiL8z4cdjulbPH1HfQfngt6zVqPc4QVA==
X-Gm-Gg: ASbGnctAsUp5ZVz9uNDj+dekVa88+4Y4FrHhr4xvB8xzXTNtwARfKccXJN9j/3FjCxU
	YcAxy6JXndRrolHcVKIgUuLUcBVOa95cmtuD1RG6KnbSRvR4O+DwNxqyUp2Yakjw+AL717lp8rs
	TbySEK/gi26maQ6jkg+h09n2gLqVUvfwk0h9PPY7Lx4IceX1ncWXno9k6IOyxhwbfnDyoYy9bsE
	Kr2IStXnF3vqlq4+GLiIVNWiTDddeP+BI6yWxbanA==
X-Google-Smtp-Source: AGHT+IFkGyQJTXX+l3/fVG1kpg3S7XkLrTud3tl3gd71kpZbk5gd/flj5ygP5W+NqOo2/jq0RMyArIGv0CKoRXGvQt0=
X-Received: by 2002:a05:651c:1545:b0:36b:ce19:d853 with SMTP id
 38308e7fff4ca-36f7ff20073mr53691811fa.45.1759235697194; Tue, 30 Sep 2025
 05:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250912060650.2180691-1-gary.yang@cixtech.com>
 <20250912060650.2180691-2-gary.yang@cixtech.com> <CACRpkdYgTjerG5mks_+3sjhKKYtCsFY=1NWhgw_YEuib7gZm3g@mail.gmail.com>
 <TYUPR06MB5876BB28E3C30EEB9BB05997EF15A@TYUPR06MB5876.apcprd06.prod.outlook.com>
 <CACRpkdYKnFAyq8C5h2=5NQ8AU92RmzShNHd6+=21rWednjv-fA@mail.gmail.com> <PUZPR06MB5887DA8FE0E128993F11E2B3EF16A@PUZPR06MB5887.apcprd06.prod.outlook.com>
In-Reply-To: <PUZPR06MB5887DA8FE0E128993F11E2B3EF16A@PUZPR06MB5887.apcprd06.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Sep 2025 14:34:46 +0200
X-Gm-Features: AS18NWCe8gc0I9F23q-ySgwePTXWrU-J25uwnqfg_Oxcxpo9nPVmUWN-Gc4LkU0
Message-ID: <CACRpkdaQYb+tB+a9Q6j3xPq=BHbQV5-3hu3XiJkSU9CGtcHpiA@mail.gmail.com>
Subject: Re: [v2 1/3] pinctrl: cix: Add pin-controller support for sky1
To: Gary Yang <gary.yang@cixtech.com>
Cc: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_053459_475797_A18C86E5 
X-CRM114-Status: GOOD (  13.76  )
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

Hi Gary,

thanks for your efforts!

Sorry for taking so much time to respond. I was coding.

On Thu, Sep 18, 2025 at 8:17=E2=80=AFAM Gary Yang <gary.yang@cixtech.com> w=
rote:

> New scheme with macros has verified ok. I just want to confirm with you b=
efore submit codes

No need to confirm with me just post it!
Better one post too much than one too little.

> > But I think you can still use a macro to define the long pin tables?
> > Albeit macros with flexible arguments is a bit hard to write.
> > Save it until everything else is working.
> >
> In header file:
>
> struct sky1_pin_desc {
>         const struct pinctrl_pin_desc pin;
>         const char **func_group;
>         unsigned int nfunc;
> };
>
> #define SKY_PINFUNCTION(_pin, _func)                            \
>  (struct sky1_pin_desc) {                                        \
>                  .pin =3D _pin,                                    \
>                  .func_group =3D _func##_group,                    \
>                  .nfunc =3D ARRAY_SIZE(_func##_group),             \
>          }
>
> In C file:
>
> static const char *gpio1_group[] =3D {"GPIO1"};
> static const char *gpio2_group[] =3D {"GPIO2"};
>
> static const struct sky1_pin_desc sky1_pinctrl_s5_pads[] =3D {
>         SKY_PINFUNCTION(PINCTRL_PIN(0, "GPIO1"), gpio1),
>         SKY_PINFUNCTION(PINCTRL_PIN(1, "GPIO2"), gpio2),
>                 .......
> };
>
> What's your suggestion? Thanks

It's OK as-is if this is how you want to structure things!

Yours,
Linus Walleij

