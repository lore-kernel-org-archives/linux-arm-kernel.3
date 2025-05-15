Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354A8C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 09:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2LP0PScAw/tCQ7CvzF7WintcuGwvAnIn4Nsxt+EG3U=; b=UN1igGbDLCXz1ut9P3X4lDnr8x
	uPF6ew6cIX59yqsf856r0NvHgjtX9I55KNspWq1Ao5Lt6avlyFxkxuCau4o7G0dMFuPEU2RV1/cbx
	6Rv1pf2xlifHrvMrQk9+SWmMl/faKf+r2NCKuQIvTj8TIlFgVcSFk5AOJxotVynvY0SOxdNj7y7wE
	5TkC6cIrJFKKY30TIsprE8ZAkJctQ/+v045ipvxDRdmriShc7XRAwB+x48oIAhi585be0pGAz2knZ
	+9r8mxOmC4UpIkcSUwKDOQ1BzqSJlfYOUs7tXywH9RnLUUJDcohB2vDilDGG/MYEpBnuKpxcK6g0O
	N6KHlyWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUfD-0000000070v-0tWZ;
	Thu, 15 May 2025 09:14:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUMo-000000003YW-2HAW;
	Thu, 15 May 2025 08:55:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 746135C073C;
	Thu, 15 May 2025 08:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8211DC4CEE7;
	Thu, 15 May 2025 08:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747299301;
	bh=LBRCYx6yEYw3JtcZjfSpiVcbjCjzsGhvOmR/nBYptGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gkmu0CWPpNp86K/Euz/Dm/e9t+19BBJ4AZWRaMDphQEk3US7k8Zey8c0olpWuVXM8
	 ZnipbUJLdpq/d4XbppKnYptDpShQmqzMqaVK5fY3RwEryRp3G5m9N4FilTcq2v6NdY
	 lHL3ByJ8wjGe5fczpts9EydsGOjjRTsoaCPg3MbVoJuxHxi8bHCU6UmUi9xFGatMpk
	 xpqNDhskY4sklfMIIaL8ZTog9/30KFvuwS5UnvetQqGl5imNwCKyP/8XEr6hsugkgp
	 76AIm57wcqumpg2zAvGvdj5vSm+PdbKgoAEtmK1/qWx43HX9XpxVHmu4Q5k4F/ULmu
	 XxNmuiDI4VUVQ==
Date: Thu, 15 May 2025 10:54:56 +0200
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Darren.Ye" <darren.ye@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 03/10] ASoC: mediatek: mt8196: support audio clock
 control
Message-ID: <aCWr4HDpEOr_jn3C@finisterre.sirena.org.uk>
References: <20250514081125.24475-1-darren.ye@mediatek.com>
 <20250514081125.24475-4-darren.ye@mediatek.com>
 <be75ac83-5421-4bb0-a28a-57be639f427c@collabora.com>
 <CAGXv+5Hj358gOBomY=KdwYojgpwxFP-tiM38Z18b63ie=922mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pqANQ8hKcxHdPm61"
Content-Disposition: inline
In-Reply-To: <CAGXv+5Hj358gOBomY=KdwYojgpwxFP-tiM38Z18b63ie=922mg@mail.gmail.com>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_015502_625916_AC56F977 
X-CRM114-Status: GOOD (  11.57  )
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


--pqANQ8hKcxHdPm61
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 04:50:33PM +0800, Chen-Yu Tsai wrote:
> On Thu, May 15, 2025 at 4:40=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 14/05/25 10:11, Darren.Ye ha scritto:
> > > From: Darren Ye <darren.ye@mediatek.com>
> > >
> > > Add audio clock wrapper and audio tuner control.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--pqANQ8hKcxHdPm61
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmglq98ACgkQJNaLcl1U
h9B/xQf/WCgax1XZIrHI7sRyhwZ6FlzcWWzC/96GoahlhlHRo6AwJ7ves1riScIY
iWfySDDylRMd2YfjjtoaKosS1N3/jAK8cHbUwFhap4h1WSGltSq+V55v17AzaO+k
tn1SDdLEjA2pMy5+fatN3uVR2PheWLbi5mjxhXzxYTJW/lxfZ22kPl67IGqCFkpu
uh9U74kyhK2m7NnZvjAdwW8is3GrihqtIS7zoqcT3R4DLc3hYEQbJdFTjXzUFyZm
gG/cWOUHko4BbpK5jXfBEgFSDiOT6bzhnHZ1uE4S8ckah7tmctIdVZZ19mwZ5UWI
QAnFFOIaD+7/KimjanojcgHqkusz3g==
=hJfD
-----END PGP SIGNATURE-----

--pqANQ8hKcxHdPm61--

