Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14D4E65D2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 08:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEvXNFAbKlLA5ycugqwHzMWIE5TPFsHSStNQ7IozSjQ=; b=rWis4QoIifhItBcwv2dnk+UGx7
	Xdhmt98nQxQEO/flByHBVHY8wLDs8Gf0Y5wkgUIqZcocDDAcVg2eJiuF7yYSQ7rjaHt3Z6nb1XMF5
	Bi2qcYKQytKJnzXRSmVce0uQMCI77BPSXcJReoNUgtq8AdgOxNBu9K/bHK+AhXGgbei1Wt4irPneK
	+Z1gAeil5l7kYM1YkvAiguk7a0+NJ/rv0m6epipc8IJwjQ3S3Eqzu1KIu37k1e0BM96I06VZpqkdK
	Szd4Qgv/AVjWgizUUkIM+NS1pcbeBLupgt5sJqDmS7F6xH5Keaebu3ThrkdeeAIjjqf4Gpe8S6rQR
	YTAUnf7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEOjV-00000001tOd-0Sue;
	Fri, 22 Nov 2024 08:09:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEOgq-00000001sqo-02tj;
	Fri, 22 Nov 2024 08:06:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B4BA7A406AD;
	Fri, 22 Nov 2024 08:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31842C4CECE;
	Fri, 22 Nov 2024 08:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732262814;
	bh=hEvXNFAbKlLA5ycugqwHzMWIE5TPFsHSStNQ7IozSjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T/EABDjzLiFjpLj+4JnD6M1QszY1n9gOuE/Oi96V2wbiUI5SBsZguKCgTGxZlT97x
	 wLZ9jI808UVyxZyafkDmnkGaBnuq0a8Nild9305CxVDvDa4blb73Zjfsc2sLPAprRL
	 B8DS0f0w+J72kDw+axG5LNTQ9H1w8965eHdFlb/oo2FlCZdmlb1TmdtlacfHTCop7R
	 PSUPaZMJSM1DlhoHH8Dcyt5rKk1pl1F+z8phkk2AdGVn0C6bCMoDC3Zfg4cd4gc3td
	 gamSq+Ehw75+gJ9RqsoR2uH/MZLWUn9Sva3oAesE3JKvam6yhnlROhIe728ebbOJ8c
	 hBJ8XteHU7hHA==
Date: Fri, 22 Nov 2024 09:06:52 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Stefan Wahren <wahrenst@gmx.net>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	Dom Cobley <popcornmix@gmail.com>
Subject: Re: [PATCH 00/37] drm/vc4: Add support for BCM2712 / Pi5 display
 hardware
Message-ID: <20241122-orthodox-mantis-of-reading-2dcdcf@houat>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
 <CAPY8ntBM=34pTiQ=t-CjtYEE5Ax6D=EtiY-sLT1keUkUMXuLeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="p4qucrakavsqq3j5"
Content-Disposition: inline
In-Reply-To: <CAPY8ntBM=34pTiQ=t-CjtYEE5Ax6D=EtiY-sLT1keUkUMXuLeA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_000656_214551_81D95EF7 
X-CRM114-Status: GOOD (  21.09  )
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


--p4qucrakavsqq3j5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/37] drm/vc4: Add support for BCM2712 / Pi5 display
 hardware
MIME-Version: 1.0

On Thu, Nov 21, 2024 at 03:37:00PM +0000, Dave Stevenson wrote:
> On Wed, 23 Oct 2024 at 17:50, Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > This series adds the required DRM, clock, and DT changes
> > required to support the display hardware on Pi5.
> > There are a couple of minor fixes first before the main patches.
> >
> > Many of the patches were authored by Maxime whilst working
> > for us, however there have been a number of fixes squashed
> > into his original patches as issues have been found. I also
> > reworked the way UBM allocations are done to avoid double
> > buffering of the handles as they are quite a limited resource.
> >
> > There are 2 variants of the IP. Most Pi5's released to date
> > have used the C1 step of the SoC, whilst the 2GB Pi5 released
> > in August is using the D0 step, as will other boards in future.
> >
> > Due to various reasons the register map got reworked between
> > the steps, so there is extra code to handle the differences.
> > Which step is in use is read out of the hardware, so they
> > share a compatible string.
>=20
> A gentle ping on the patches for clk-raspberrypi (patches 29-33) and
> Broadcom DT (patches 34-36).
>=20
> All the DRM and dtbinding ones are reviewed or acked (thank you!).

If the bindings and DRM patches are all merged, you can merge these at
least.

Maxime

--p4qucrakavsqq3j5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0A7lwAKCRAnX84Zoj2+
doaCAYD4iZV09q1bBU7gjietZumaTJnk/0RYajiLIHHMerpOFe3il/ObO1rzaMBm
mOT0urABgPae6EbuMjtidxyyV0XhCMisWgYstcv23glemnLPC9awB+uSoIJHPW1e
2lHvcCHC6A==
=RgkZ
-----END PGP SIGNATURE-----

--p4qucrakavsqq3j5--

