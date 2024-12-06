Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BE5E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 08:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmL6atBY7nBTDEYe5VOTVwrRPR/hjoSKjtcblrbJp48=; b=SU02xhsThISuVYIEkSVxWCeXrF
	DUwts7Mq56BQqlxRrdoEKtTD2fZMa5VGATDcofmm9df8M9/fhwvJP9zIdVciOlwEmUA365u8UYK4F
	Sf6VJDYCTkyDIJ8VVHsTrydI2x7LXz0RQRx6+qPTsvAH0eBy8/nFn1B/ZFY+WKhrjyihG+4vjLib+
	WRuQR0Imv+8kvVyliK8bhjC5G5Llyw1ORsam4SddD6sBGd05cnicNXxONIkbtrNsvqyZHTwTeF6e6
	/QRmJB9f2ccOs8V7ZXVf+iuoJhqfpS9f8u/RBeGCwmPHvE4yNJ451pI9AwbDbFMyGrzmkbdRDDcVY
	o5Dbed5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJTji-00000000vTs-45E0;
	Fri, 06 Dec 2024 08:30:54 +0000
Received: from mx-2023-1.gwdg.de ([134.76.10.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJTih-00000000vEz-1I0D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 08:29:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gwdg.de;
	s=2023-rsa; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=WmL6atBY7nBTDEYe5VOTVwrRPR/hjoSKjtcblrbJp48=; b=KWJu4wXDZw+s4IkELcE+exNIeZ
	SSo0m2yaeNsmhbPZ/oLP7GOATxwz7756YrzY/6ZzOA5zBYnOlu2Yu36iTkpnzVQWMtsW6/+cxzj2L
	hg8YLCgjuS/cDVZrBtXMwChRB4vNOv9dB6kbl0VmRdwGodFNdR7dZ3QfjkFhS6wwqFo5atfqdn5R0
	mbT2KC1xNWSUYVxPBPlvRqs+9FV5mVo5p3a4bxxzy39ysEiDj/Zx2O5MN/KXu6KVUO2Q8obIYG4ie
	t2ujGmBVLU95hhmHHIiTp3CUnhGeCaBw7BPwKVyaaRchWBvpNHsXLVIInXkY10ea1lCpbW0ze0sQr
	TniQO75Q==;
Received: from xmailer.gwdg.de ([134.76.10.29]:54345)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <muecker@gwdg.de>)
	id 1tJTiS-003wlj-1W;
	Fri, 06 Dec 2024 09:29:36 +0100
Received: from mbx19-fmz-06.um.gwdg.de ([10.108.142.65] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <muecker@gwdg.de>)
	id 1tJTiS-000Hhh-1B;
	Fri, 06 Dec 2024 09:29:36 +0100
Received: from vra-171-192.tugraz.at (10.250.9.200) by MBX19-FMZ-06.um.gwdg.de
 (10.108.142.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.14; Fri, 6 Dec
 2024 09:29:34 +0100
Message-ID: <c5e037ab5a5718dfba9d1c8c8b57ee53765a851b.camel@gwdg.de>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
From: Martin Uecker <muecker@gwdg.de>
To: Linus Torvalds <torvalds@linux-foundation.org>, David Laight
	<David.Laight@aculab.com>
CC: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Luc Van Oostenryck
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
	<linux-arm-kernel@lists.infradead.org>
Date: Fri, 6 Dec 2024 09:29:28 +0100
In-Reply-To: <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
	 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
	 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
	 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
	 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
	 <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: MBX19-GWD-06.um.gwdg.de (10.108.142.59) To
 MBX19-FMZ-06.um.gwdg.de (10.108.142.65)
X-EndpointSecurity-0xde81-EV: v:7.9.17.458, d:out, a:y, w:t, t:5, sv:1733459541, ts:1733473776
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_002951_386587_CCF3514A 
X-CRM114-Status: GOOD (  18.44  )
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

Am Donnerstag, dem 05.12.2024 um 22:14 -0800 schrieb Linus Torvalds:
> On Thu, 5 Dec 2024 at 18:26, David Laight <David.Laight@aculab.com> wrote=
:
> >=20
> > From: Vincent Mailhol
> > > ACK. Would adding a suggested--by Linus tag solve your concern?
>=20
> I'm genberally the one person who doesn't need any more credit ;)
>=20
> > I actually suspect the first patches to change __is_constexpr() to
> > use _Generic were from myself.
>=20
> Yes. And David was also I think the one who suggested something else
> than "!!" originally too.
>=20
> I may have liked "!!" for being very idiomatic and traditional C, but
> there were those pesky compilers that warn about "integer in bool
> context" or whatever the annoying warning was when then doing the
> "multiply by zero" to turn a constant expression into a constant zero
> expression.
>=20
> So that
>=20
>   #define is_const(x) __is_const_zero(0 * (x))
>=20
> causes issues when 'x' is not an integer expression (think
> "is_const(NULL)" or "is_const(1 =3D=3D 2)".
>=20
> Side note: I think "(x) =3D=3D 0" will make sparse unhappy when 'x' is a
> pointer, because it results that horrid "use integer zero as NULL
> without a cast" thing when the plain zero gets implicitly cast to a
> pointer. Which is a really nasty and broken C pattern and should never
> have been silent.


BTW: I added '-Wzero-as-null-pointer-constant' to GCC 15.

Hopefully we can also remove / deprecate this for C2Y.

Martin

>=20
> I think David suggested using ((x)?0:0) at some point. Silly
> nonsensical and complex expression, but maybe that finally gets rid of
> all the warnings:
>=20
>      #define is_const(x) __is_const_zero((x)?0:0)
>=20
> might work regardless of the type of 'x'.
>=20
> Or does that trigger some odd case too?



