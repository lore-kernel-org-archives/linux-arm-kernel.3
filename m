Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5BFCAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53z1RBiEx1wjRhfVztxjMPfYe5dFGDgD5TeCne1UIk0=; b=XahyiGg1tTFRA9iar2X/SFRZZn
	DtDOxtEyG1KkG/ltdu5W2NUyP20xt1N7rW139g+/UL6MC5A1UaemcYTb7vPAaBsd2+3Rr1j34uu2R
	+YbSkjrePPIF356znp0kawlqMj8qTyXp67IJXKMIazOymEx6LHyn4zlExxZZsJ6kGfy+FL7gNmUrC
	V4+incWs+xmY7ss9azqIMBcd+DwIHVhE3Xnhf5ohEhZcEsRYJk6ecT//fN8H3U38o0wW5knr09F8E
	RaNgSD94G932vRM8ar6I21t/YeHm6Lr6cfcFieD0OAbX/vDld5QSxUS4Y55aZawCsX7GELkvRmREK
	8uIUYyFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gRx-0000000ATyY-07uW;
	Mon, 22 Sep 2025 13:19:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gRv-0000000ATxZ-2bdQ;
	Mon, 22 Sep 2025 13:19:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06A76601D9;
	Mon, 22 Sep 2025 13:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1236AC4CEF0;
	Mon, 22 Sep 2025 13:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758547162;
	bh=/2BPc+qmrsh2DgallaqxgQi03F/iwjA/IqFzKaKywSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LG/BtI+1o28ZEPga/55ETInxWu6RoXLXJhRGIZVOknyJhj1fvYNbUGyqjdViU14CO
	 4NIo1Jz6kugezCY7caieIF2+gm0DpIGu0imUPyECzH5W5gjFvs+rKgKtukthw/N8/Q
	 bx4CYhN1uy747NgWfTZfngQEIkc2GPyBY9J0mZY0HaOASfnHY5clIBprv22ChzIZj3
	 hKO4LsUXrEUbB0a/IvFsk22pJgFcLigRkGNYe1tlsXWnGf4ePzKGilQsBvmaFTdN2p
	 pmxKoTFv5oCMqFO4lxCEB6HHmgrRyqKU0WLl9jxgYm47kGQwuADxiJgjSfXq0IuDjP
	 fPKTXU7AI/kMQ==
Date: Mon, 22 Sep 2025 15:19:14 +0200
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
	kernel@collabora.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 05/10] mailbox: add MediaTek GPUEB IPI mailbox
Message-ID: <aNFM0oWk5S38KBRC@finisterre.sirena.org.uk>
References: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
 <20250917-mt8196-gpufreq-v3-5-c4ede4b4399e@collabora.com>
 <CABb+yY0_TZC0Dd3Rue=6Am4=Urs8hdkaa6RE=42t58SYUsLV0w@mail.gmail.com>
 <1933660.tdWV9SEqCh@workhorse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hWOioVe/sP5fgiHB"
Content-Disposition: inline
In-Reply-To: <1933660.tdWV9SEqCh@workhorse>
X-Cookie: Filmed before a live audience.
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


--hWOioVe/sP5fgiHB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 22, 2025 at 02:59:43PM +0200, Nicolas Frattaroli wrote:
> On Sunday, 21 September 2025 07:00:59 Central European Summer Time Jassi Brar wrote:

> > > +#define MBOX_FULL              BIT(0) /* i.e. we've received data */
> > > +#define MBOX_CLOGGED           BIT(1) /* i.e. the channel is shutdown */

> > This is confusing. CLOGGED usually means malfunction, but it seems you
> > want to call it STOPPED or UNINIT?

> I don't agree that "CLOGGED usually means malfunction". To clog something
> is to impede its flow, which in this case is the correct terminology to
> refer to what's happened to the channel. "UNINIT" is wrong, it's initialised
> properly. "STOPPED" is also wrong, it's not stopped, it still sends, it just
> won't pass it on through.

As a native English speaker I'd say that clogged has heavy overtones of
broken and malfunction, like Jassi says it'd usually describe a fault
condition.  Something like "blocked" might be more neutral.

--hWOioVe/sP5fgiHB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjRTMsACgkQJNaLcl1U
h9BSwgf/UbyytmfMXNaOBq0OXuzH3MlTUpvtouJsg45qiXcqEzcGY0k6+RBIUbc6
zI4fw9IG0Lv8B4Yrt1hanJqBJ/sKvd/eq065FqSbGMiG9Wyvivn0OGdw9IIP3Wxi
4TpYVqVul1GtYt3Gp5D4HJbNOaeEZeaOsEUqU0EFD1X5NCviWF7atKprxkvd/e9k
ZPOQdFVmh48Ln2hsCQ621I8Wemmu+gSVB1aSvD1awF36hp+cCvWz7vSus4z3nX5D
71oUm+zLms7LtKb9Voz3ReEEmIKjbhG7dUF/xHul+Qg8FQqMxwcBPAyjFzl3g92I
ZQuum9Wn2rVplW7pwOwJ5YvsRh8BdQ==
=0rmc
-----END PGP SIGNATURE-----

--hWOioVe/sP5fgiHB--

