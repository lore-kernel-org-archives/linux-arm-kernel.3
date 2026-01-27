Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD8DD2FEC1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 17:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/JszvMiIiD7raLAHEMZbMvUPwemPiehQnGnEHCgw6w=; b=FjTzpmRq3+d+XzzwLY3pG+M+n9
	xkOkqE7vhThONF80Ev/NN4g6LcEFxIkFYB1bBTxxpaXJ6pSAHgYLf4OEEgWE/+6UCeGxNZeZSenQU
	PmDkGKWEcvbumf4T0gcGH7Uo2Q0HQyYyXB2vBMhNYIRjfPb6hMD5u2O5COVIlERFmIjzPS0xMQub8
	Oogu7EecDvNFesYfCjd4fFhcOTjOBoykQtTGI1rzRGDy5mHvVWmKyzKP9WMotYTzizj0LedjaUW6w
	gCATKA3KlTHtUi66FTtp2QgbYIbCEpYk5Cmnk4Ndr1ZzP1xnb3Q4py2woQPlw/DEPbris76r+X37L
	RNC67DSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkmQB-0000000EhEv-2AZ9;
	Tue, 27 Jan 2026 17:00:07 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkmQ8-0000000EhDX-2g5V;
	Tue, 27 Jan 2026 17:00:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769533198; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IvYTHi7s+e4M/AXPy86LDlyem7lHx3ZcV/ZDGPkb+JfIx0B/ireZWvcaK0TH8CvvCNR6sJpfhKnrTyLAgv+xRS92MbrZzHed2D0OceR1Q5HGNxoJlqCFDA1/QaMIJX6kcKdr+T5O+dY3qRdDjqW3OZM1PZbMvPXnae77DrOAp2I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769533198; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=k/JszvMiIiD7raLAHEMZbMvUPwemPiehQnGnEHCgw6w=; 
	b=HqAeofXH8cfRubZnMaastkCiKGKaPVv/yC55+S921YD7ApdyN1gEKzcArAybxmNE5eip0JnSBOJ21Qb7NcI//BXx8lLQfx3hxLoQv2FjmWeV9ML2uD0ahpDfTbROfyhex4tP7hicJma+LbGdySCn79j7OQ7zydTzISb86qiy/LQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769533198;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=k/JszvMiIiD7raLAHEMZbMvUPwemPiehQnGnEHCgw6w=;
	b=AcPnDwIsmdn/qO1kNSQAAYVCg4uVtwGVGDypsbUC+6kBv6T18kUs8t3nykATSHRl
	OR47GP6E61ba32Xtu9Y+Vdsmi79vniQFiy0fLYpnBufwoeA9WIaR0EiA5lXQeFvDFY4
	Np7b8OVgulFv3ocxOQzmcU/DlBwL/47cA+Ydfk4I=
Received: by mx.zohomail.com with SMTPS id 1769533196286377.2516394328777;
	Tue, 27 Jan 2026 08:59:56 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 33D751807C4; Tue, 27 Jan 2026 17:59:51 +0100 (CET)
Date: Tue, 27 Jan 2026 17:59:51 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
	Alexey Charkov <alchark@gmail.com>, Sjoerd Simons <sjoerd.simons@collabora.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sugar Zhang <sugar.zhang@rock-chips.com>
Subject: Re: [PATCH 05/10] ASoC: rockchip: spdif: Improve sample rate support
Message-ID: <aXjukfMRRIADB1mc@venus>
References: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
 <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-5-a7c547072bbb@collabora.com>
 <0d7af11f-497f-4c12-b439-41c30f10e087@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zbyqyy2ee62cusqp"
Content-Disposition: inline
In-Reply-To: <0d7af11f-497f-4c12-b439-41c30f10e087@sirena.org.uk>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.1.1.4.3/269.526.30
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_090004_740355_1656CDC0 
X-CRM114-Status: GOOD (  10.76  )
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


--zbyqyy2ee62cusqp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 05/10] ASoC: rockchip: spdif: Improve sample rate support
MIME-Version: 1.0

Hi,

On Tue, Jan 27, 2026 at 04:28:30PM +0000, Mark Brown wrote:
> On Tue, Jan 27, 2026 at 05:08:25PM +0100, Sebastian Reichel wrote:
>=20
> > The hardware supports all typical sample rates from 8000 - 19200.
>=20
> All sample rates up to 19.2kHz!  :P

Indeed; I will wait for more feedback before sending a fix.

Thanks,

-- Sebastian

--zbyqyy2ee62cusqp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAml47v8ACgkQ2O7X88g7
+poTbw/8D/tapoNf7C5G3rC2p0//Eew5HzP1yRcHa280Xpkqo5+alpMJcBvsCKi1
J9C1tANe371RNE3f6A0mLEBDLA5sY8130QnGRYLO7FLw6i0A8v2xUcS4LQowoAWg
ryIesztFaNnCfdZdki1siDiNG1wMF+4RkeU/CvcohKq0DJaUiGrfv01Emz2G3M6C
WUY0W+F7WywxWIQLv2edjp0daCuivmlbzZ/ubgJUlK71Pb9aaUcNuT/ZcXgSlP3O
iXPkYU0PQCIq+7Azt8F3VMRRhA2mCj/MMzJ5TUmpaKcDEWAUMc1TFXw3LzZzIGzm
HERQrOjUBR2J9WIubR9j3d8j5E5EtTDZyFga4e3qG2zzTode7kWNz3nIyZTADOvL
5Xs7gKX7P6qtsuGgyEABiNvjU+1weDob2oMvjP6eY93cuW/LNukh7Zj6TLzN2Wsz
pNcbabRzVZ76kznnGMbob+uZG9tJ69VCZzLaBd39nXKQs8NYf60PGquJAZtQ/4G+
5oumY5QIFcqW0AZbQMP23bmZf2nAHGmIqOiS3416Uz/UyCB6MwRH6Wx4M57xDzsh
T+9s5CDapfkoTzhxuwIcxk3kUY/MgkH6x1Xe7aJWo4rPo++dq2oaqzW2AjzNhc1Z
PwCsDd9opc52VTaKXNJn4PI1/xpMwzXYoIAECl83Vv7FdUvJnsM=
=8OX+
-----END PGP SIGNATURE-----

--zbyqyy2ee62cusqp--

