Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20B8C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 13:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SivHY2XNq8vlxXZhSNxjcwqUriXYYnVyfCs6az/xbwc=; b=CvYHp/0LNJ11YC8EU5x/Bs625s
	bREbWX6GcXFlNqsSwVwoM/f9uyxeGk8nKEQE5gbIySs9/oA4mEY+GHFFIS0vLjKkdmQGu1wudp3qg
	7AmFn3WfxozSGuLaz5MonQAjF/d+y88hamTr1SZXrxy17xeqwpINRS+8wG1fDlzvpWvDRpOZo1DyI
	jR1u/k3tePMzVcmqRcE2ORd3uBZ6/cKCX56ib4zAh+rBpVMMNZJ9oSLY4LDeDGcHp28vWbLKb9QBf
	r6XxQ4SBA+/KQjG7WX3+1yiBiOUckAkFNKL0QPU/rgoUv/y5jrtsiWuEQ3VaALUOtoOQkCj/ARzeJ
	vDngLgNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsieL-0000000BOIv-2sSn;
	Thu, 13 Mar 2025 13:31:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiYv-0000000BNdW-0gBC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 13:25:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7A8B35C5BBB;
	Thu, 13 Mar 2025 13:23:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2959FC4CEEF;
	Thu, 13 Mar 2025 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741872324;
	bh=al2zcQDmwtKUWbmclpq3ELoeYemHTEjlcFVNlGyz3yA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Th+xPZdeERxaC2wiFVmF/PRtyPEI02iC+2EV4o3jA2yQ4WPBlX2ftcOTommSecJxE
	 4sUieqZYIoyTRmbEzPvifAwo4RWsoVeVzBMxJoeX6OWGHcU7UspXJQoYNMxh10HQ1V
	 1cn5rTh+zW9Gle94nMlNbkh0i6iY+bw3/INw0TcOhNqKEoFDdlYkuTyApOptB/e3oW
	 LfE2vkPqTl2M/g57nyg2+UTn5aKH/Y0y1xbTZqW8rPzVxhoU/YbV1CM2kSArlu59bz
	 7OwyMk91/tK3vGf6peK82IV/0NZH8UbOaJqvWAy0TIuSE2SFVHNVOw/hQ1+YYOoeH5
	 kPrW1pyOhQMIQ==
Date: Thu, 13 Mar 2025 13:25:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Artur Weber <aweber.kernel@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v6 06/10] mfd: bcm590xx: Add PMU ID/revision parsing
 function
Message-ID: <ef190ba8-a5c7-4a1a-90e6-2610de00e4ed@sirena.org.uk>
References: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
 <20250304-bcm59054-v6-6-ae8302358443@gmail.com>
 <20250313132036.GB3616286@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zA5H0OQ8I+S+JApb"
Content-Disposition: inline
In-Reply-To: <20250313132036.GB3616286@google.com>
X-Cookie: A beer delayed is a beer denied.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_062525_255645_BA5188CD 
X-CRM114-Status: GOOD (  13.29  )
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


--zA5H0OQ8I+S+JApb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 01:20:36PM +0000, Lee Jones wrote:
> On Tue, 04 Mar 2025, Artur Weber wrote:

> > +	if (id !=3D bcm590xx->pmu_id) {
> > +		dev_err(bcm590xx->dev,
> > +			"Incorrect ID for %s: expected %x, got %x. Check your DT compatible=
=2E\n",
>=20
> Isn't it more likely that the H/W this is being executed on is
> unsupported?  If so, say that instead.

Given that the compatibles are device specific the driver shouldn't be
binding if the device is unsupported.

--zA5H0OQ8I+S+JApb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfS3L0ACgkQJNaLcl1U
h9D2Jwf+LJ9CptsQQnbZJuRjlklwPrVqGyiDX99suQr9q9YFQWF4U2tTi8mAAQd4
c12oshx+70ZwrEMiSS80yLHI3hLqDw1fpVK1vCsV/57kNpnT+l+vNdSd4fV73UG2
0vjsnuhC6LDgJQZdBM6rnbUp2hruF/NUgHoFSyZzokDLgf8+DVNHGo5I1LS9kvOF
oygai/ITH7qOfgnRbyTfsMvdo9Afo69kwsakgJi1RJZQyr1hpMm9qTnhg9EBLpRZ
/4dCZK3tmBlT2J0nNIUzQey6ivAd10SfaFk8tPFNV6NW2BYNN0TfYtX2hWwvV+o7
UyoyLAM/HCEeeuvXHlvqY6dIxTr6uw==
=vJeh
-----END PGP SIGNATURE-----

--zA5H0OQ8I+S+JApb--

