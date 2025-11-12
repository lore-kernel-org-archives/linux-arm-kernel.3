Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23444CD3438
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 18:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KqIE5WmfyHmP8ll3rOCY+FYSMtK6zHgkQ3ZM4GG1AjQ=; b=Qn6IG9kAt6CSiGbGUbThZQmqrw
	8F4p43BrRe5ehhAUpSwcKhShRA0jq3OHrIBGJJNcMQjS492UWnsnvpbqYnwFzraVWO3deFHNbCVmb
	FhAk/k4LFPFP1TV6reK78OlGUuse2Z5z4idumxr78NL0uC6IM9VPoMsT8MI2WgFNZajpZhKVAIbJw
	n2ds1P6i88z+ovmgkKX4IJrN7uw+VrnpBf6uJYlZNmZ42N9gBjG6p3CSHAR14dUATa+L8dj+DqjUJ
	FClP3Oj68nnbWbtyS5qDkFGTvgZjMQl7tmpLBiLfCmAvml2jazcX7yJLkl6uDc+0GbUqKFc7G6Q5c
	+QiwK6bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFYK-00000009LQL-3qyT;
	Wed, 12 Nov 2025 18:26:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFY8-00000009LBJ-0QRJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 18:26:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1FD34035F;
	Wed, 12 Nov 2025 18:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38A8C19424;
	Wed, 12 Nov 2025 18:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762971990;
	bh=KqIE5WmfyHmP8ll3rOCY+FYSMtK6zHgkQ3ZM4GG1AjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W+BLgP/Kvh42AwbBcDdL6xFNxRAMUoqlImaEJWOsJ6Mj/IvTdWE86pZzvDLLh4T3A
	 6IPzZvuwMcSmW6zZB01E6oJzEliKrGozmzVTKBtm0tBRU3+RmLbrD1PVlnm23xratU
	 tlzd0dq24GiZdgiTrW640DefdGUlEU1go/6/WTXUSQt0+yxeMbD06/X/z7bmqyesoB
	 h8yI3Mo3dt08CaaUnAE/BL3UlWlol0ZlymcP9lHsaD52mjiX5RaQdo6zhTrQtgNkff
	 CBZJD+uqT+FtHqK2Kz9l0wzQDQivhj3y86kLjUk0logNlnGhCTFXs38J27PnJaXB/S
	 a5rRcfY/BJ5QA==
Date: Wed, 12 Nov 2025 18:26:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 02/11] dt-bindings: display: panel: ronbo,rb070d30:
 panel-common ref
Message-ID: <20251112-efficient-dental-219b34a728ab@spud>
References: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
 <20251107-imx8mp-hb-iiot-v2-2-d8233ded999e@solid-run.com>
 <20251107-cornbread-juggling-2e7e69bcac10@spud>
 <14492bcb-aa74-4fce-b9e6-3d33b08c682f@solid-run.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+EOiDhVMpxn0wrR/"
Content-Disposition: inline
In-Reply-To: <14492bcb-aa74-4fce-b9e6-3d33b08c682f@solid-run.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_102632_238048_0970BB3B 
X-CRM114-Status: GOOD (  20.97  )
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


--+EOiDhVMpxn0wrR/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 11:51:55AM +0000, Josua Mayer wrote:
> Hi Conor,
>=20
> Am 07.11.25 um 18:48 schrieb Conor Dooley:
> > On Fri, Nov 07, 2025 at 12:46:09PM +0100, Josua Mayer wrote:
> >> Add missing ref on panel-common.yaml for this dsi panel so that common
> >> properties can be shared.
> >>
> >> Drop reset-gpios and backlight as they are already in panel-common.
> >>
> >> Switch from additionalProperties to unevaluatedProperties so that comm=
on
> >> panel properties are available without repeating them in this binding.
> >>
> >> Notably panel-common defines the "port" property for linking panels to=
 a
> >> source - which was missing from this panel. Mark it as required.
> >>
> >> Signed-off-by: Josua Mayer <josua@solid-run.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Is your ack compatible with Frank Li requesting to move the
> ref on panel-common further towards the end of the file?

I don't care what you do with that. I will say that it is pretty normal
to have it at the top of the file and move it if there ends up being a
need, and it's not worth resubmitting for that alone.

--+EOiDhVMpxn0wrR/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRTRTwAKCRB4tDGHoIJi
0oSSAP9SN63sA1M/10C28Rdxq70LHgjhnvuOt7uLqa7qxb9H8wD/TuHCoPY5bn/4
4deqcUE/0q2mjHZ/dBSzUxDDPOOgIg4=
=Dix4
-----END PGP SIGNATURE-----

--+EOiDhVMpxn0wrR/--

