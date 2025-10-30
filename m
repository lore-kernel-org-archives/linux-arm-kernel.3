Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BFCCCF9FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYohtfjfI7gDBusXckBe79d4sJhgF5ZWZ9Cpfqff8vI=; b=imgz8JAc0YfwuUol+zsC8PQkvA
	Cx9MfzEZ4radLouLzQ4lsPxSixBDOdvW1WlxgDtM8VmmdhQLuOb7PWZU/Xr067mmgCYDIVEXDrtLw
	QvKug4P+4Nb2LLecibGMJCqBFYsRPtb2Dc2VPtrGWsoq+qdwP527Uk4jo2TLphz3rlHj6+Tl+P1iU
	omx+fBavfqGiBVJzlubbcwVoLeujABHTLC3x4ARpKKouW3BpjeONwGUD/swGf3FoyU7YnIVyyQpSn
	KLGJfmsUoNRZ10zNcle3G0ooLyZVEdR8FCCbikyZs2pM6noZewZmwQf+goQbFdxyqb1FgbTiVffZY
	BaYLA6sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESFK-00000004AQg-2f5G;
	Thu, 30 Oct 2025 12:59:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESFI-00000004AQ5-0vYs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:59:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 24D5E40B43;
	Thu, 30 Oct 2025 12:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F512C4CEF1;
	Thu, 30 Oct 2025 12:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761829155;
	bh=+1QdoawkvflouOC6qmIDpRPfUBs0v5s5IJB5WvVN5c8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UeB95CGIa0bUoc3nVboyxnGKS3LjLnmt37ePDVdvoQKf83UepOJ121/YnPn3t8SZp
	 WT9ofgpoHA+oc9DkrYPpAYEVfsYrXgToUHn6AbgONlGAGLm14sIKqWmn7AOe4XvwyX
	 9W1KRLNKop4Hg5zqDjZ2BBO1jFBC0iWZi7sq7TcSVxpnyXEaD+D78QH/CC3e/e23DU
	 PQyjht7aXAgAWQZsaI168foVKW8jjKKTBNJ6lvNh5VEuFfa9IE6vXT46jNe0Nevy/x
	 iDgbEJLjnMM4JUXuQa/SlGEbWZ9WDRtPESL+b9TCPKjxc6EvUwCGmK62ChusB+JGmC
	 UvAjl58afSMDA==
Date: Thu, 30 Oct 2025 12:59:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Melissa Wen <mwen@igalia.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Maxime Ripard <mripard@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>, kernel-dev@igalia.com,
	kernel-list@raspberrypi.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: broadcom: rpi: Switch to V3D firmware clock
Message-ID: <d88f6420-5013-4856-99d6-da28f79bd7a5@sirena.org.uk>
References: <20251005113816.6721-1-wahrenst@gmx.net>
 <9ebda74e-e700-4fbe-bca5-382f92417a9c@sirena.org.uk>
 <a5e1e279-7e20-458d-a75f-787e0adbc9fe@gmx.net>
 <ad07546f-0c2d-4bc2-b794-755b892c7328@sirena.org.uk>
 <a016e7e1-09f7-4056-a855-6cfaa8d51962@gmx.net>
 <10a4ef77-0e70-4ef2-b1df-535b476d256d@sirena.org.uk>
 <ecd75fd5-3131-4d10-ae3d-b6f608d9622a@gmx.net>
 <25e500c2-3dc1-476c-b6c1-ac4098a0501d@sirena.org.uk>
 <d6b14388-e0ab-44f0-b4d9-78adf74c2a7f@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DL6fKXW3fR4LoiHa"
Content-Disposition: inline
In-Reply-To: <d6b14388-e0ab-44f0-b4d9-78adf74c2a7f@gmx.net>
X-Cookie: Is there life before breakfast?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_055916_301928_C9EEA99F 
X-CRM114-Status: GOOD (  16.66  )
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


--DL6fKXW3fR4LoiHa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 08:51:38PM +0100, Stefan Wahren wrote:
> Am 28.10.25 um 19:47 schrieb Mark Brown:

> Okay, here is my theory. The difference is about (boot) time. In my setup
> the whole device boot from SD card and in your case the kernel modules are
> stored via NFS.

> V3D requires two resources, a clock and a PM domain. Additionally the PM
> domain itself depends on the very same clock. In arm64/defconfig the
> relevant clock driver is build as module, but the PM domain driver is
> builtin.

> During boot "driver_deferred_probe_timeout" (10 s) expires before the clo=
ck
> driver could be loaded via NFS. So the PM domain core gave up:
> [=A0 =A016.936547] v3d fec00000.gpu: deferred probe timeout, ignoring dep=
endency

> So this breaks probing of V3D driver in this case.

That seems buggy on the part of the core, particularly since userspace
isn't there yet so we might be missing some filesystems - I would have
expected the device to probe once the supply becomes available.  But I
do agree with your analysis, it doesn't look like an issue with this
driver.

--DL6fKXW3fR4LoiHa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkDYRwACgkQJNaLcl1U
h9AuPAgAhX8oYbIGRTANQ29CvGBBiBWZTt3xEqxSiSYYfyZHAo3wqewY65jMId3v
iiN98hv86nqd09M4x5o20xrclao8tKqf+hJuOLTAiaTmK6vZ2MP7jcLrSIEKcXj5
Bz7YUJ8KNIL3greU8KJtZrOYarVY9dLsEfWg8vA5Dn6LVYLRiR9AjcSPotQ8HBYR
unihXKLZ0FjWnYPNZPh7FwuB+X1uyJpD0Frd7O2QwKshXeimCAfyEas59caUod/C
gt7bHp31py5xKcfkJnFIRPsaLiR+0VAgQGOJunxK9ALbq2VPKcUQPIvFy8o+g+PP
N6FBknR19Ga2HdCaymnhijMAVkNMmg==
=tMof
-----END PGP SIGNATURE-----

--DL6fKXW3fR4LoiHa--

