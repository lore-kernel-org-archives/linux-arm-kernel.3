Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46399C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 08:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/VZe1/Vs9df0KRAk3DjKWjsF3dPnM34RI9z9rdQPgU=; b=E8ToKUR/U76OXuP4O7ZvRYv4IF
	YEOc2L9NokuDpgoMXvAmlEzOsFyDL2ZVpTfeOjYdFvwdlfNS6xtRQzAyv2KHKYc1tlwF38drlqC8u
	b7kDklGcpchndE4wFbfwpoOYg+Th2uCshFYoPPNn3ykNRPLSgpwb7IwSwbw1SG5LMNR77EEeCD4fU
	MZxPvtVjHjLRRiD40HrFMqsl+SavuqI1WRYiAxZyecwP1HcC7QYydqeHo0yDuFQWUEWcOL/KhoXtR
	pIzC9+xVz7xATN3OnOkvVkiXiruG3BFWtT1ar2XCgoVz4M9mbSfHcjg27x7k7BxQVQLlL3YyECetF
	4SOpqmgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwnH-00000000975-0jmh;
	Thu, 08 May 2025 08:39:51 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwYy-000000006Vs-1rQK;
	Thu, 08 May 2025 08:25:05 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ac3b12e8518so138349866b.0;
        Thu, 08 May 2025 01:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746692702; x=1747297502; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/VZe1/Vs9df0KRAk3DjKWjsF3dPnM34RI9z9rdQPgU=;
        b=ZAJ7ySczDOwU/7dQNVD2Z7b2itEKIXKKsiVjAeVeqt81XVPTsjp4h2CmIn9PwKKQb8
         FZ4HtYDzjIrs2qAbjKhthiXIrmg1izd9l7HgEy7R5JC0UPmxOc+FhztxSq5jbf7ArrxO
         fjHXxjb4bqrKB1t5H4R2M5w2CPxBbyoMAnpYt7+VqH2OhQeMixuj53JkqVq09l/n+qAV
         LDbo57zYYDMwj3ev4ct9UZPlsTjvXO/zUp46N4AEL6a4Ye2yPTQJQD7KmmeNSrjvV1ij
         os6sNtIYz00HOUyZpzamFya7o9eeshUpBzEaNC63aA1dvBj0dB1ivQldldS6gAOmQ2mO
         NI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746692702; x=1747297502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/VZe1/Vs9df0KRAk3DjKWjsF3dPnM34RI9z9rdQPgU=;
        b=Wl180dRYn3SCowoomZnrOm7ncCOJImGpY4nOcWNUGH+v0SdT37/x6zEx+0zO8avR4s
         0g0te38xvn7B7qQdqt423XUeDShY2FOw3MQbySxpVb2ig7sujk8HgNV/LiF2Hnoo/+HE
         9LFk3u309ospYaH3a27P6wGTnXhhN/b4OvCJBGWhULGA31ul6fzoRXhVCcR39/Tq1uJ2
         H0Db1gBa8UM4jyXtR9dmR1q0CgfUJJjpwa8r+JvK5rBLOdsx2FC+l4n5EM9gZ+GawLKB
         RZPRPApCww/21Gd8zju2KB0QiG0c9hLwhyDgPw687p1omJ/+dIHQnNRj8J6PvlKdVgbg
         1yfA==
X-Forwarded-Encrypted: i=1; AJvYcCX/7n//jq0rynzTyueFJnfkTpv2NJRCNiBkC2rSYO1rPAgHsq60xhLPLUMFR+5XHKn50+gTM8M/b2e6JWMWXa9Lzw==@lists.infradead.org, AJvYcCXVOCSm/sm5AQ/ZQBA/KreN2NSIGRcX8kKMtVVIQgtVQ4ApIlYnTgqsopfKLlEYSN5MEJ5Lj/9yD6+4FjziFyfb@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7J1k58iJ1DsTbnc2kKs2fdn17EHscenLQRxwCMRM3PfDqG5Fi
	oMNV5I7LOihDiojAV4LjUQQKwYrY6v9rIs1Ap0G1iAFBxVWFKdUAmrSlBVFcTQJlZykxWv+Y+96
	DF5Wkv40iJXUscv5moV2hLvMMrzo=
X-Gm-Gg: ASbGncvTFQs2djePNj0XmddkaVcpwMGCMKrY03WvQyCJFtKRD2pVSg4awdj4X+K8V8/
	tr/ZiYgI0E4N7xmPGTaOhHqKMstgwOIEjpcAYzr6X1kbTFUcfDeRnj7eaAKhCbQwWGxn/OWqo0w
	+S4Cv1q9BCZF1iweGpLVzbxQ==
X-Google-Smtp-Source: AGHT+IHwGMRcQLUDAqsmMU26u5DhOM2YTtzvThxyZ+rgbVdUJgzYB6yoguHQmu+X3sFn89zGRaz0RDjcWnop9JbvZfo=
X-Received: by 2002:a17:907:9814:b0:ac7:391b:e688 with SMTP id
 a640c23a62f3a-ad1e8d08543mr701795566b.58.1746692701962; Thu, 08 May 2025
 01:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VcVmTwS-zw=o5=m1-x0XC67BKBVWae2mMKZQH=qLCxZwg@mail.gmail.com>
 <20250507164219.10083-1-trannamatk@gmail.com>
In-Reply-To: <20250507164219.10083-1-trannamatk@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 8 May 2025 11:24:25 +0300
X-Gm-Features: ATxdqUH7vjwoyrUt6a0OgSJkXwTvjGyp-fL_PAaQ_hH-HiCBVj3EHH4LiW0KdPU
Message-ID: <CAHp75VcNuXouL25ZRiym97AjR9249=ENMPFDQ7imZ_ZoeKc3Ng@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
To: Nam Tran <trannamatk@gmail.com>, Lee Jones <lee@kernel.org>
Cc: andy@kernel.org, geert@linux-m68k.org, pavel@ucw.cz, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, christophe.jaillet@wanadoo.fr, 
	corbet@lwn.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_012504_491169_30304C67 
X-CRM114-Status: GOOD (  35.22  )
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

First of all, I just noticed that you excluded Lee from the
distribution list. Don't do that as he is a stakeholder here as well
since it has not been decided yet where to go with your stuff.

On Wed, May 7, 2025 at 7:42=E2=80=AFPM Nam Tran <trannamatk@gmail.com> wrot=
e:
> On Tue, 29 Apr 2025 Andy Shevchenko wrote:
> > On Tue, Apr 29, 2025 at 8:02=E2=80=AFPM Nam Tran <trannamatk@gmail.com>=
 wrote:
> > > On Mon, 28 Apr 2025 Pavel Machek wrote:
> > > > > On Mon, 28 Apr 2025 Geert Uytterhoeven wrote:
> > > >
> > > > > > > > > - Move driver to drivers/auxdisplay/ instead of drivers/l=
eds/.
> > > > > > > > > - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> > > > > > > > > - Move ti,lp5812.yaml binding to auxdisplay/ directory,
> > > > > > > > >   and update the title and $id to match new path.
> > > > > > > > > - No functional changes to the binding itself (keep Revie=
wed-by).
> > > > > > > > > - Update commit messages and patch titles to reflect the =
move.
> > > > > > > > > - Link to v7: https://lore.kernel.org/linux-leds/20250422=
190121.46839-1-trannamatk@gmail.com/
> > > > > > > >
> > > > > > > > Out of sudden without discussing with auxdisplay maintainer=
s/reviewers?
> > > > > > > > Thanks, no.
> > > > > > > > Please, put into the cover letter the meaningful summary of=
 what's
> > > > > > > > going on and why this becomes an auxdisplay issue. Brief re=
view of the
> > > > > > > > bindings sounds more likely like LEDS or PWM subsystems.
> > > > > > >
> > > > > > > It is 4x3 matrix. That means it is not suitable for LEDs. I d=
on't
> > > > > > > believe it is suitable for PWM, either -- yes, it is 36 PWM o=
utputs,
> > > > > > > but...
> > > > > >
> > > > > > Is it intended to be used as a 4x3 matrix, or is this just an i=
nternal
> > > > > > wiring detail, and should it be exposed as 12 individual LEDs i=
nstead?
> > > > >
> > > > > The 4=C3=973 matrix is a real and fundamental aspect of the LP581=
2=E2=80=99s operation.
> > > > > It is not just an internal wiring detail.
> > > > > The device adopts a Time-Cross-Multiplexing (TCM) structure, wher=
e 4 output
> > > > > pins control 12 LED dots individually through scanning. Each pin =
includes
> > > > > both high-side and low-side drive circuits, meaning matrix multip=
lexing is
> > > > > required for proper operation =E2=80=94 it cannot be treated as 1=
2 completely
> > > > > independent LEDs.
> > > >
> > > > Scanning is really a detail.
> > > >
> > > > If this is used as rectangular 4x3 display, then it goes to auxdisp=
lay.
> > > >
> > > > If this is used as a power LED, SD activity LED, capslock and numlo=
ck
> > > > ... placed randomly all around the device, then it goes LED subsyst=
em.
> > >
> > > The LP5812 is used for LED status indication in devices like smart sp=
eakers,
> > > wearables, and routers, not as a structured rectangular display.
> > >
> > > Given that, it seems to match the LED subsystem better than auxdispla=
y, doesn't it?
> >
> > I have mixed feelings about all this. As per hardware organisation it
> > sounds more like a matrix (for example. keyboard), where all entities
> > are accessed on a scanline, but at the same time each of the entities
> > may have orthogonal functions to each other. Have you checked with DRM
> > for the sake of completeness?
> > Personally I lean more to the something special, which doesn't fit
> > existing subsystems. Auxdisplay subsystem more or less about special
> > alphanumeric displays (with the exception of some FB kinda devices,
> > that were even discussed to have drivers be removed). Also maybe FB
> > might have something suitable, but in any case it looks quite
> > non-standard...
>
> I understand your mixed feelings about where the LP5812 fits within
> the existing subsystems.
>
> While the LP5812 uses a matrix-based structure for controlling LEDs,
> it is not intended for displaying structured text or graphics. Instead,
> it controls up to 4 RGB LEDs for status indication, where each RGB LED
> consists of 3 individual color LEDs: red, green, and blue. Based on this,

So, you probably should have started with this. As I read above that
this has to reside in drivers/leds/rgb for colour ones which seems to
me closest to your case. On top you might add an upper level
management to prevent users from using patterns whenever the LEDs are
requested individually. So, this driver should represent 4 RGB leds
and, possibly, the upper layer with those fancy stuff like breathing.

At least, based on the above it's my formal NAK from an auxdisplay perspect=
ive.

> I think it aligns more closely with the LED subsystem rather than DRM or =
FB.

Right.

--=20
With Best Regards,
Andy Shevchenko

