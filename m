Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC74E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 19:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/E+il6y5NtjGrTlLgPM3UZx7oCF93bePU2b7EXLhxo=; b=ZePpYkTui7MZZov9fWo/AxXyv7
	XovAH6oIso6Su05RgHiPnbNOzJ79/03ta3JN7Aq5TWeW5hC6PaedafcjbBHsjzS1esS71wkFAM+s3
	lchty16inzirCn+dYeOQGuy0qX8jNaNl2s28LSd3byEfVQ6CvSOYhGIx57z/CtkYs36Xq7Pri7ggZ
	jQwfz8nEG1waYwm8aRoHoOL5dYxJ4kVS3YclbRdWeYdhHEi7rghCo//I9DSSuOAr1q4tx1JqEOXsy
	drm9gtVWm5YPlVrZg0uzkkSqQNJ5R/y1FPYCQnA8Z+O4I8eieM7dPjd3rG8OWtqZ96JzJ/+SGaavT
	2RV+cqDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJeGc-00000002ahq-2Amn;
	Fri, 06 Dec 2024 19:45:34 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJeFa-00000002abO-068h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 19:44:31 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-117-WxcFF2J0PnutzUqsQ_ZSew-1; Fri, 06 Dec 2024 19:44:26 +0000
X-MC-Unique: WxcFF2J0PnutzUqsQ_ZSew-1
X-Mimecast-MFC-AGG-ID: WxcFF2J0PnutzUqsQ_ZSew
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 6 Dec
 2024 19:43:39 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 6 Dec 2024 19:43:39 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Willy Tarreau' <w@1wt.eu>, Linus Torvalds <torvalds@linux-foundation.org>
CC: Vincent Mailhol <vincent.mailhol@gmail.com>, Luc Van Oostenryck
	<luc.vanoostenryck@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Jani Nikula
	<jani.nikula@linux.intel.com>, Joonas Lahtinen
	<joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Rikard Falkeborn
	<rikard.falkeborn@gmail.com>, "linux-sparse@vger.kernel.org"
	<linux-sparse@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, "linux-hardening@vger.kernel.org"
	<linux-hardening@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
	<intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "coresight@lists.linaro.org"
	<coresight@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "uecker@tugraz.at" <uecker@tugraz.at>
Subject: RE: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
Thread-Topic: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
Thread-Index: AQHbROFPJXcuwP9wN0+yRzIQ2cx/pbLWa+gggAFf14CAACMqUIABpzoGgAAClHCAAAo1Y4AAAKpg
Date: Fri, 6 Dec 2024 19:43:39 +0000
Message-ID: <8f4b7d1bfbd84885bddf4cc1dfb9ce43@AcuMS.aculab.com>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
 <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
 <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
 <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
 <d23fe8a5dbe84bfeb18097fdef7aa4c4@AcuMS.aculab.com>
 <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
 <20241206193836.GA26860@1wt.eu>
In-Reply-To: <20241206193836.GA26860@1wt.eu>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I0_FkoYONuw9O3nE7g61LCKn-VTe9HvdtPxQcXzmaYk_1733514265
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_114430_342621_39E6157D 
X-CRM114-Status: GOOD (  17.17  )
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

From: Willy Tarreau
> Sent: 06 December 2024 19:39
> On Fri, Dec 06, 2024 at 11:15:20AM -0800, Linus Torvalds wrote:
> > On Fri, 6 Dec 2024 at 11:07, David Laight <David.Laight@aculab.com> wro=
te:
> > >
> > > I'm missing the compiler version and options to generate the error.
> >
> > Just -Wall with most recent gcc versions seems to do it. At least I
> > can repro it with gcc-14.2.1 and something silly like this:
> >
> >   $ cat t.c
> >   int fn(int a) { return (a<<2)?1:2; }
> >   $ gcc -Wall -S t.c
> >   t.c: In function 'fn':
> >   t.c:1:26: warning: '<<' in boolean context, did you mean '<'?
> > [-Wint-in-bool-context]
> >
> > > Does a '+ 0' help?  "(var << 2) + 0 ? 0 : 0"
> >
> > Yeah, that actually works.
> >
> > And "+0" is nice in that it should work in any context.
>=20
> I've already used "+0" to shut certain warnings, I don't really remember
> which one, but also remember it was OK everywhere I needed.

I've often used +0u when -Wsign-compare is enabled.
Much safer than a cast.

>=20
> Another trick I've been using to shut up the compiler is a cast via typeo=
f
> and an intermediary variable:
>=20
>   #define shut_up(expr)                           \
>           ({                                      \
>                   typeof(expr) _expr_ =3D expr;     \
>                   _expr_;                         \
>                   })

That is like OPTIMISER_HIDE_VAR() and can't be used in a 'constant integer =
expression'.

I suspect it also has the same nasty habit of adding an extra register move=
.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


