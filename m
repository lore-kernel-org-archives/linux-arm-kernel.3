Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5021CD7830C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 11:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASa3m08qUJJzx/CkZxXi2bS9QogDhirKkzyYhtJe3go=; b=Q3o4qCvrFtIgXRjCXzbzAI8hOm
	r8/XriiVTSMMlx+paLmV3hDPPIW4NkvyJIj0NzIRGTa6rzm94L+fJCCqUheUqe63jiln68Bkaz3rB
	iZ+/15GdCzH9B7t9A3mjjmwNZKejVYmPsN0EaxBNCsvEJMpQY2AU9khxtj68X9uados9a6NSfwzVu
	bv4xCvvARfBUtmpDvrzwqZKHEyEAGG3WHSMQFOr0AsBGiWflycdlzi18V3X72rfTZq40K3loRvTgw
	ABuyTYMkCYz9A0s6Ih94d8WhsfIkjtIp71kkEX5DdjxPqZCAWQDawvaOTGxcv/mskDCFqJza0oh2/
	CIYt8GLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4IY-00000005onz-1FCp;
	Mon, 02 Dec 2024 11:09:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4DQ-00000005nhj-1qQA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 11:03:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3EE6CA40A21;
	Mon,  2 Dec 2024 11:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD8CC4CED1;
	Mon,  2 Dec 2024 11:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733137423;
	bh=ASa3m08qUJJzx/CkZxXi2bS9QogDhirKkzyYhtJe3go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lnao6/1VwaWZVmtG192hq1NdLwiouRyR5TQs9OkySAVRKuWa4HtPw2rk95QESRBd0
	 5RfMnqvUZwesvmkdqhX5ILou+eVdZlOoNWSqwl3+jSAe0i9XuP+3nYUbAXEnIGUInp
	 gLALbSYOYyhKeRuNtLtDo9h/7q28zEDO6RcxUGDxnkqKf9X16VJLQvI/hEJwgE4DhV
	 fCbzsYH2qZL9qytt3mT68yv6/cjtqIUr4Li2cdcSiFDuAM3qUNYidslXYxHbKEMuOA
	 IAQKu008kKVz3nUm1pV7Jw/HB/d1LGJmOERhvMcaHexhPr5NF+lwT+twMO6zdQpeWg
	 g+LEZRWJJgj5g==
Date: Mon, 2 Dec 2024 12:03:40 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH] pinctrl: sunxi: Use minimal debouncing period as default
Message-ID: <20241202-magnetic-curious-bear-1cc48e@houat>
References: <20241119140805.3345412-1-paulk@sys-base.io>
 <20241119-prudent-jasmine-lizard-195cef@houat>
 <ZzyoIABRArkGoZBn@collins>
 <20241119-vivacious-optimistic-squirrel-a2f3c5@houat>
 <ZzzdT0wr0u1ApVgV@collins>
 <20241120-wild-stimulating-prawn-ffefb7@houat>
 <Zz20dquzl5_2_3TQ@collins>
 <20241129-amazing-whale-of-proficiency-ee6fd2@houat>
 <Z0rqILFESdje9qUn@collins>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="7vib2wfrmfkzpfdq"
Content-Disposition: inline
In-Reply-To: <Z0rqILFESdje9qUn@collins>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_030344_618769_D35BD8CF 
X-CRM114-Status: GOOD (  51.32  )
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


--7vib2wfrmfkzpfdq
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pinctrl: sunxi: Use minimal debouncing period as default
MIME-Version: 1.0

On Sat, Nov 30, 2024 at 11:34:08AM +0100, Paul Kocialkowski wrote:
> Hi Maxime,
>=20
> Le Fri 29 Nov 24, 16:37, Maxime Ripard a =E9crit :
> > On Wed, Nov 20, 2024 at 11:05:42AM +0100, Paul Kocialkowski wrote:
> > > Le Wed 20 Nov 24, 09:01, Maxime Ripard a =E9crit :
> > > > > > If anything, the status quo doesn't impose anything, it just ro=
lls with
> > > > > > the hardware default. Yours would impose one though.
> > > > >=20
> > > > > The result is that it puts a strong limitation and breaks many us=
e cases by
> > > > > default. I don't think we have to accept whatever register defaul=
t was chosen
> > > > > by hardware engineers as the most sensible default choice and pre=
tend that this
> > > > > is not a policy decision.
> > > >=20
> > > > You're making it much worse than it is. It doesn't "break many use
> > > > cases" it broke one, by default, with a supported way to unbreak it=
, in
> > > > 12 years.
> > >=20
> > > I think this is exaggerated. Like I mentioned previously there are *m=
any*
> > > situations that are not covered by the default.
> >=20
> > Note that this statement would be true for any default. The current, the
> > one you suggest, or any other really. The fact that we have a way to
> > override it is an acknowledgement that it's not a one size fits all
> > situation.
>=20
> Again the debate is about which option has the best advantages over
> disadvantages. I'm not saying the default I suggest has no issues, but
> rather that the benefits very clearly outweight the issues. Hence the many
> situations that would be supported with the shortest debouncing period (b=
oth
> short and frequent interrupts) versus the few broken-hardware use-cases
> (related to interrupt storms) support with the largest period.
>=20
> > > The fact that I'm the first person to bring it up in 12 years doesn't
> > > change that.
> >=20
> > Sure. It does however hint that it seems like it's a sane enough
> > default.
>=20
> Or maybe people didn't realize this mechanism existed, failed to understa=
nd
> why their device didn't work with Allwinner platforms and just moved on to
> use something else. Indeed it's all very subjective interpretation.
>=20
> > > Sofar the downside you brought up boils down to: badly-designed
> > > hardware may have relied on this mechanism to avoid interrupt storms
> > > that could prevent the system from booting.
> >=20
> > It's not about good or bad design. Buttons bounce, HPD signals bounce,
> > it's just the world we live in.
>=20
> Well I'm an electrical engineer and the first thing we were told about
> buttons and connectors is to include hardware debouncing. The second thing
> is that it can be done in software (which again is done in a number of dr=
ivers)
> by just disabling the interrupt for a while if it happens too often.
>=20
> So I'm quite affirmative that taking none of these into account is consti=
tutive
> of a broken hardware design. No electrical engineer is told that they sho=
uldn't
> care about this because the SoC will filter interrupts for them.

The SoC provides the hardware debouncing. There's no reason not to use
it, or to choose something redundant. Some might, but it's also
perfectly valid to just rely on the SoC there.

> Of course it's fine to use this mechanism when it exists, but it's not a
> reasonable expectation to just assume it will always be there. This is why
> I think it's not a legitimate reason to make it a default.

Nobody ever designed a board without considering the SoC features but
rather by adhering to a dogma. The SoC features, components chosen and
their price, etc. all play a role.

> > But let me rephrase if my main objection wasn't clear enough: you want
> > to introduce an ABI breaking change. With the possibility of breaking
> > devices that have worked fine so far. That's not ok.
>=20
> I believe it is highly questionable that this constitutes ABI breakage.
> To me there was no defined behavior in the first place, since the debounc=
ing
> configuration is inherited either from the reset value or the boot stage.
> There is also no formal indication of what the default is, anywhere.

Depending on the interpretation, it either means that you change the
default, or add a default, to a device-tree property. That constitutes
an ABI breakage on its own right. And then we can introduce regressions
for boards, which is another breakage.

> Changing the default configuration of hardware is commonplace. One might
> for example introduce a reset to a driver to get a clean state because it
> happened that some boot software would mess it up and it went unnoticed f=
or
> a while. Would you also call that ABI breakage?

No, because it doesn't require a change in the default state Linux
expects when it boots, or changing anything in the device tree. It's a
self-contained change, and thus there's no interface to break.

> I think there's a number of situations where it's much more sensible to c=
hange
> a default state to avoid very visible and practical issues. And it does h=
appen.
>=20
> Also my understanding of the "ABI breakage" rule in the kernel is that no
> userspace program should stop working when it was implemented to (correct=
ly)
> follow some kernel-related ABI. It doesn't mean that we cannot change any
> default state

If applications rely on that default one way or another, it's absolutely
what it means. The only criteria is whether this will create a
regression for any application.

Maxime

--7vib2wfrmfkzpfdq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ02UDAAKCRAnX84Zoj2+
dlvaAX9//D/IPxxaf7TL1qH2t8T1ewaRAX1zfQ1E+ts3njBZQ2sTuC73YRfz+83a
s+gNMWIBgMlxRDKQexft0OGEGGccpjg0jtGrrlO7+akPBVqJLefEwCXcioRfL9It
vtX8zJ8dCg==
=U1WY
-----END PGP SIGNATURE-----

--7vib2wfrmfkzpfdq--

