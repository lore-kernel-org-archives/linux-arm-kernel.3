Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51E9E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 08:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDkgUwCcQtOfovebMtMEsFmujecvWxrMcPeoL9u2wnU=; b=j6Vxdpm6EiOIGZ4e3TP/RXXxVt
	uo2ZsRR1t/CGjcqpE4QUZIDcZ7VTLdDgBVed+2wfM574uCHyiufDpoQ7sxL/e0fWCUS63wEaG9y+H
	RUp1sZfV3hWoECznDKoY3i4zHzX22XUUMsPs+7BMEhjqz+3SwaEL4wTmI9tBO5Rz4Q4mGqbRHGFKk
	ZhgNjwBQ/pkHv557Pw+Wb1bFvrIAxgkm6S4atOUwEd8B2Rdbvmf1TpLsceEIDfsIPwFkxx8iMxjNT
	Wws9jOwSeAuUsdALRr58NGTbXT6QMHXXrXZNg34J8xpbfUqAHcJly9+Zmlx6zHozw7Q1FZTLkuyCE
	zD7DfpFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJqNV-00000003eco-2uHT;
	Sat, 07 Dec 2024 08:41:29 +0000
Received: from mx-2023-1.gwdg.de ([134.76.10.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJqMS-00000003eUg-1uQ8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 08:40:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gwdg.de;
	s=2023-rsa; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=eDkgUwCcQtOfovebMtMEsFmujecvWxrMcPeoL9u2wnU=; b=CiksJ+6m8UmWKFBUT4L/0cUbuN
	C2UvpC0fRZA2CSeNutopy7iKy2C12ANDY6G6H0B/uxReaJNEIPaeY3ebCrxfeOzGx5pwqNVSmRPlU
	o6FQjobun/MRucwBD2aNzNxLXFPoypwhurD6uMWTFg2q95Im/tq1I1E9+YMsU1PU04htPNWMRo4PV
	ZBb0Av9a09UnWZyPJLeLOngtbpcJShTr8KzGy5biE/3Biekx7a6xEUh+7NgtwsXeC9dA9SeYs+RAi
	Egh4AChbnI2w/jqtX55O0t+utYob6SjBTpHqckqcPhu1gzM9qe/ZUSHTtvwyZ7RgGwHWyswSJGdWZ
	4yJRz9CQ==;
Received: from xmailer.gwdg.de ([134.76.10.29]:40719)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <muecker@gwdg.de>)
	id 1tJqM3-004Jfy-1D;
	Sat, 07 Dec 2024 09:39:59 +0100
Received: from mbx19-fmz-06.um.gwdg.de ([10.108.142.65] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <muecker@gwdg.de>)
	id 1tJqM3-000Qkk-0p;
	Sat, 07 Dec 2024 09:39:59 +0100
Received: from [192.168.0.221] (10.250.9.200) by MBX19-FMZ-06.um.gwdg.de
 (10.108.142.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.14; Sat, 7 Dec
 2024 09:39:51 +0100
Message-ID: <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
From: Martin Uecker <muecker@gwdg.de>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
CC: David Laight <David.Laight@aculab.com>, Linus Torvalds
	<torvalds@linux-foundation.org>, Luc Van Oostenryck
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
Date: Sat, 7 Dec 2024 09:39:50 +0100
In-Reply-To: <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
	 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
	 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
	 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
	 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
	 <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
	 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: mbx19-fmz-02.um.gwdg.de (10.108.142.53) To
 MBX19-FMZ-06.um.gwdg.de (10.108.142.65)
X-EndpointSecurity-0xde81-EV: v:7.9.17.458, d:out, a:y, w:t, t:5, sv:1733541190, ts:1733560793
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_004024_486505_E2D78C37 
X-CRM114-Status: GOOD (  22.25  )
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

Am Freitag, dem 06.12.2024 um 16:26 +0900 schrieb Vincent Mailhol:
> > On Fri. 6 Dec. 2024 at 15:40, Martin Uecker <muecker@gwdg.de> wrote:
> > > > Am Freitag, dem 06.12.2024 um 02:25 +0000 schrieb David Laight:
> > > > > > From: Vincent Mailhol
> > > > > > > > Sent: 05 December 2024 15:31
> > > > > > > >=20
> > > > > > > > -CC: Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
> > > > > > > > +CC: Martin Uecker <muecker@gwdg.de>
> > > > > > > > (seems that Martin changed his address)
> > > >=20
> > > > My current one is this: uecker@tugraz.at
> >=20
> > Ack
> >=20
> > (...)
> >=20
> > > > > > > > > > > > + *
> > > > > > > > > > > > + * Glory to Martin Uecker <Martin.Uecker@med.uni-g=
oettingen.de>
> > > > > > > > > >=20
> > > > > > > > > > IIRC Martin has agreed in the past that the accreditati=
on can
> > > > > > > > > > be removed - especially since it refers to the 'sizeof =
(void)' trick.
> > > > > > > >=20
> > > > > > > > I tried to look for such message:
> > > > > > > >=20
> > > > > > > >   https://lore.kernel.org/all/?q=3Df%3A%22martin+uecker%22+=
__is_constexpr
> > > > > > > >=20
> > > > > > > > but couldn't find it. Do you have the link?
> > > > > > > >=20
> > > > > > > > @Martin, do you agree that I remove the accreditation?
> >=20
> > So, do you agree to have the accreditation removed in compiler.h?
> > Personally, I do not mind. I am also OK to remove you from the
> > documentation and add you to the CREDITS file if you'd like to.

Sorry, I somehow didn't read this part. Please do whatever you think is
most appropriate (but please update my email to the new above if it
still appears anywhere).


I find it amazing how much time the Linux kernel community spends
revising code to make it work perfectly.

Still, I am wondering whether some of this time and effort should not
be targeted at C compilers and language work to make these macro
hacks unnecessary?

I already found the original motivation for these macros very questionable.
Removing VLAs at the cost having imprecise worst-case bounds strikes
me as fundamentally misguided - at least if security is the motivation.

So maybe there are other good reasons for this, e.g. bad code
for VLAs or risk of jumping the guard page if the attacker can somehow
influence its size (but for this there is -Wvla-larger-than). But even then=
,
wouldn't it be a more worthwhile and interesting investment of engineering
resources to improving code generation / warnings at the compiler level?

Also the fortification of strlen and co seems something which could be
much better solved with annotations and proper compiler support.=20

Martin





