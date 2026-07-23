Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0C8C4453C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 05:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gbqp/BETAuL10zK/QjDMLkNML3uJVDKQA/suEZyhESk=; b=m7tPI7SS45UgYzXDYCSlw3uf2O
	8RUT2mlMgtcHF54wl9B8mBVsbUNx0Uw2wWUxuWtSj2lzQKa5KR8IUYbtqJcbTwNSTaVJjC5mpCFaP
	EGJ6sAgF2GNA1XRhe68oZbBmp23ALTUQktmQHAR5ZGcrD9BgUu7xdAYFXLPcEITWKm/QA5g/udQ/k
	vLxTzpy9KQOy5q2jpAq8SoGy8P35f4gSBkMlhPDz6fsegrQqE5oh60bVeymYBnyBJy6cQwbbj1oUT
	hJsyAmE6eDOjXH4PP8NnO/+Ju5E0P/3kxiQoUqCdMsuLaOqvHn4lO9iva2YNNtfuFgPupPp2Y6NPn
	cHQ7O8Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmm0r-0000000DTe7-3kBx;
	Thu, 23 Jul 2026 05:30:29 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmm0p-0000000DTdi-0IfB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 05:30:29 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47de0093c42so129710f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 22:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784784624; x=1785389424; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gbqp/BETAuL10zK/QjDMLkNML3uJVDKQA/suEZyhESk=;
        b=M8O2K5CgLEujgwYoItfdVK8RO28182tPAsEfn7iL18J89Q8brQv2fM91NgMZigeaOV
         Ihoa8ydsEV5d66tampCLdqSQR8bhaa3sr2cjlbs0SVI3bDk05D1Xn0lwejgIOyXX5fh+
         oKSh3dIW312bTpXu592rJjMfKmwOqX2H9CkwH2lX8eVukwnHQtUVDPNrDZHMuuVGJsVm
         dYZfLRXFj2+wnGe5N0B0mvtw+1+D0YIoHi8IKN2FAJRCRIh+FaSzKwo9EQLvqeovmBrW
         TFna6fMRUHIwh+69quOa6qw8r2ETVKOIUnKU84W2BCSHkNgrbM890U0mACAXKvDFIN12
         ac5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784784624; x=1785389424;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gbqp/BETAuL10zK/QjDMLkNML3uJVDKQA/suEZyhESk=;
        b=MmVolupPPUpwhjIiZRzinqYwyPpcHjpDo+16n8NUXi7QXGqGPfxBfKg4TF0frLvL5T
         yrhPujtDtnxSKbn2ZaKWeFIHkr5Qaa4B7qAXPyoGDUitleAxYDbKMjSEUUd4vChs3nnr
         1yenX++7JHcEgdUbMacaWSbec/Wd+9QaCdbGXf0LkdL9lOqT0h83vM59uINBT/X23ktE
         Q1SMq1jf9f+XCc5iXtuMKgniM4hrhNJyjxvuFOY0qmqIkAD5Z56OQzQ/umiFCpTxHHXF
         OhOL745BEpQiD4ySZ8EVQxjmTOAJmNBFPCBNaArmvG28es+OXh0fZFUau/37BPGsWkD5
         IKcA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3t90GIlh4Dxou0Lr7azDZjV+NJcCjMElMfKaq9O5v5q2gw7fQwZyzzrjuHnOyfkwf0nEmeD8jsivKq8oyjyq9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3J92zOFZ0vpmwcJ/esxighVwdYOex4RvqKRUNrXVcXKhEnnXP
	RjpF+a2++VOKtSSYp26bm8LFShvspfMi62do6bqy2zxyvWrChb8n4NYolWkH2TDHXa8=
X-Gm-Gg: AR+sD13sL2fM24MxIjxpH6dmjmoVwvuMRgAM7mrQmCcVDMQPjzNgi5W+4QCxiH51ggl
	yYlQg42wXJUOmz/sPBw1EOLsnh9Q8/Ag+R3q+A6qe8UmJGNGOZdbrFpop/T9n1sAqeYAJFbwM1X
	rZKfBp2tlo5QqDnQ51YYECCuxwXc8jB3WHdNnOIVnJv/MXYWMHno2XrTg6FSKu3tZFae2kEA9F+
	GmPAS/jxGjFw2NTFGATbeL9LJuca8eQyzzDZPUymoVxHdYhSSKjQpIo7HkoLhbH71KjW8c4eBXX
	gQ9lbN3SB3Lo3uxEOuFDHXUEkLHXeDvKe9KvtbrqmmnONZAZT0RyfP1BeSxsadfD4qYGqqZvxui
	P542/0Iow14hW6KT4u0K+74EJ/5da50RitjLKil9reN4mqkjKvdNSxbxn2Jh5ZFqWiLwDjAculR
	FEjWVwirk=
X-Received: by 2002:a05:6000:402a:b0:47f:4c9b:99b1 with SMTP id ffacd0b85a97d-47f8d754483mr1814550f8f.32.1784784624091;
        Wed, 22 Jul 2026 22:30:24 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85bc62basm11851732f8f.13.2026.07.22.22.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 22:30:23 -0700 (PDT)
Date: Thu, 23 Jul 2026 07:30:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 6/6] ASOC: Unify code style for platform_device_id
 arrays
Message-ID: <amGhHDDlwMdool_q@monoceros>
References: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
 <093867d47c079d2aaab06bccaae734c54c342a7d.1784528081.git.u.kleine-koenig@baylibre.com>
 <0f625961-8e2d-4ed9-ab5a-fd95bcb4c87a@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oygi6rynka5zevcn"
Content-Disposition: inline
In-Reply-To: <0f625961-8e2d-4ed9-ab5a-fd95bcb4c87a@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_223027_217080_E3EDA32B 
X-CRM114-Status: GOOD (  18.64  )
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


--oygi6rynka5zevcn
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 6/6] ASOC: Unify code style for platform_device_id
 arrays
MIME-Version: 1.0

Hello Cezary,

On Wed, Jul 22, 2026 at 07:55:26PM +0200, Cezary Rojewski wrote:
> On 7/20/2026 8:23 AM, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
>=20
> >   sound/soc/au1x/db1200.c                |  2 +-
> >   sound/soc/codecs/adau7118-hw.c         |  2 +-
> >   sound/soc/codecs/bt-sco.c              | 10 +++-------
> >   sound/soc/codecs/wcd934x.c             |  6 ++----
> >   sound/soc/fsl/imx-pcm-rpmsg.c          |  6 +++---
> >   sound/soc/intel/avs/boards/da7219.c    |  6 ++----
> >   sound/soc/intel/avs/boards/dmic.c      |  6 ++----
> >   sound/soc/intel/avs/boards/es8336.c    |  6 ++----
> >   sound/soc/intel/avs/boards/hdaudio.c   |  6 ++----
> >   sound/soc/intel/avs/boards/i2s_test.c  |  6 ++----
> >   sound/soc/intel/avs/boards/max98357a.c |  6 ++----
> >   sound/soc/intel/avs/boards/max98373.c  |  6 ++----
> >   sound/soc/intel/avs/boards/max98927.c  |  6 ++----
> >   sound/soc/intel/avs/boards/nau8825.c   |  6 ++----
> >   sound/soc/intel/avs/boards/pcm3168a.c  |  6 ++----
> >   sound/soc/intel/avs/boards/probe.c     |  2 +-
> >   sound/soc/intel/avs/boards/rt274.c     |  2 +-
> >   sound/soc/intel/avs/boards/rt286.c     |  2 +-
> >   sound/soc/intel/avs/boards/rt298.c     |  2 +-
> >   sound/soc/intel/avs/boards/rt5514.c    |  2 +-
> >   sound/soc/intel/avs/boards/rt5640.c    |  2 +-
> >   sound/soc/intel/avs/boards/rt5663.c    |  2 +-
> >   sound/soc/intel/avs/boards/rt5682.c    |  2 +-
> >   sound/soc/intel/avs/boards/ssm4567.c   |  2 +-
> >   sound/soc/samsung/i2s.c                |  2 +-
>=20
> This change is outstanding when compared to patches 1-4 which follow the
> per-driver approach.  I'd expect one driver per scope e.g.: Intel's avs
> split away from the rest.

Well, patches 1 and 2 primarily follow the one patch per type of change
approach that happen to only affect one driver each. In the v1 thread I
was asked to split out split out the amd/acp bits which resulted in
patches 3 and 4. (And just now I notice you also replied and asked to
split out intel/avs, too, which I missed. Sorry!)

Conceptually I think one commit per driver is the right approach[1] but
most maintainers/reviewers seem to favour one commit adapting one thing
for all drivers in a subsystem. And in my experience no matter how you
make it, you get a reply to change.

Will split out intel/avs for v3 and maybe hit the sweet spot then.

> Nitpick: s/ASOC/ASoC/

Fixed in my tree, so will be correct in v3.

Best regards
Uwe

[1] My reason for that is the "one atomic change per patch" philosophy
    that allows to document who reviewed/acked what in a fine-grained
    way and allows selective reverting and backporting as needed.
    The downside is that the number of patches explodes, but git is able
    to handle that just fine in my experience. "commit count" is missing
    in https://markcarrigan.net/2026/06/18/the-museum-of-meaningless-metric=
s/

--oygi6rynka5zevcn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmphpusACgkQj4D7WH0S
/k4QMAgAiodEGJ+3wdZbbFha1cyeXY/4KnGWZwIGS91iUn/fGAugHIQjGusXDdlf
MK7Bm5B6RFc0nJmVRuK+dlVyvBjWnDiaqrcvEgW5iiGHt0e2d4B2yEu7aNVj1PDs
wuPQOThaBv7yf9NP9ddxiGofvSIuKVv7TxVf+Qf/OQjSyYseX57zpPS9h19m71vl
aVVtSUNPiwoeUnQWkRsq/qWZgnOeUrQTyXQekkv7uz1N43QnOnmb3m3iBX+mI1AN
TAfJQ2rTyMYEyIZfvwHe4nD5Nz4TpjStRk1BmH/HE8616DR4stk5Ts4tvSv1f6KT
qRSBSo9+7iG4nv7Avnq6gwIf7pTisw==
=tSnN
-----END PGP SIGNATURE-----

--oygi6rynka5zevcn--

