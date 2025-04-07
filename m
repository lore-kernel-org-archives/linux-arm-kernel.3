Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690B0C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7W29gsQrq0H9dwj935eGoewqVShH9mztjb0+yL0CVA=; b=QWldjku7Y0DH+oX7tHl7TfRwW3
	J/8VFO1LRXrMucCWVTFp/ebOzSUprLb9M7YadfoN5n8KdBxc59U4HsW+KnPiRQsNqTML6MxhaX4iS
	lL7W+WO8luzQY4tJK/V/z0+SPItfp6eWBtdFJoHjyFLtFi/mgdwXOdv8t4Y14Xh7nmDRlnBAiypC2
	/u5aYGy94Xx8GmVOPpnmpmUfpOh3OleK4KMVnJfDXljLghrur5a3gCSYQJtzY1WegIKnLzSK67osB
	7uJ4GdLTCrfeSq/qhOTN6ab8MHW6u4yftQRmUJWrgctxsbPhfT8noqRywHDxCfs38jotN1rzBDfHk
	7EO+m3kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uJI-000000024tK-2BBy;
	Mon, 07 Apr 2025 21:47:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rhc-00000001jJa-2ynq
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 19:00:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M7W29gsQrq0H9dwj935eGoewqVShH9mztjb0+yL0CVA=; b=Lsezrs0+KDkQZsEjU+XX1jEzuS
	hVJ8l1wHlIkICUFplH8SC/7T2gEcLo/p8NPlZV8hEoib2xoOKIF6evOrnna37YDiLJJIOvs1dYFKd
	6fM6KQoYmRJKecyKJkBXozD0G/BNMy+oWdYdSPMNJK3BhWM4w+iFdEMQLSNqhbwZmFWllq66yuyFX
	RhWiGgeCPlCUpv1EZLM0CZ8qAqY4rOKz8xF34X/htdDQcfzmBx3KrqjNSDyNDN0LHAdlaumPcwWIO
	NLn3V42oVR4vw0GCJlkoYGhOqJyT79CFW1j2n8ONIq9mp779nOYiIdCquZx1hkY0kGxwguSL03UJe
	vuRtLjGg==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rhY-000000086nG-1gco
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 19:00:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9F6F2A484E8;
	Mon,  7 Apr 2025 18:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54610C4CEE9;
	Mon,  7 Apr 2025 19:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744052407;
	bh=M7W29gsQrq0H9dwj935eGoewqVShH9mztjb0+yL0CVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uPC73g+eU/HaQ1z0uUeOKaao8DIyTZ9QG+L+9Mgwk2ZyT2hFHRXhS2lOyvmq4dtnt
	 NiXdGs5f81X1EFz2AjtZsAwVcjCgButu02KBukwNyvX7w4FjbCaoZk4KusskvOoiEi
	 ayhVwbFr0e4/NbgdjxBWnUh7knUvu8r1mxUvk+Ge+eKt/RDg6O6veN+tTdqtinMC7z
	 +WnfAFtCxDAf4Le1qvbn6K71ANt/4C0PVDqqaq9AZiKJpHn0x0NpEDOZfOyFS0O66z
	 6biC2xUUFL8N/sp32ZBydKtStaath5ICnqRPd5YVQlUwng5F1oL1bXTmb79o4S07Si
	 ebP3NA5ZIDBTg==
Date: Mon, 7 Apr 2025 20:00:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, maz@kernel.org, will@kernel.org
Subject: Re: [PATCH 11/14] arm64/fpsimd: Add
 fpsimd_save_and_flush_current_state()
Message-ID: <ed129f25-ff6e-47d6-9398-487e0f886a61@sirena.org.uk>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
 <20250404174435.3288106-12-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tCd0YtrqUnplrY3d"
Content-Disposition: inline
In-Reply-To: <20250404174435.3288106-12-mark.rutland@arm.com>
X-Cookie: Meester, do you vant to buy a duck?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_200008_652175_DC85C263 
X-CRM114-Status: GOOD (  10.13  )
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


--tCd0YtrqUnplrY3d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 04, 2025 at 06:44:32PM +0100, Mark Rutland wrote:
> When the current task's FPSIMD/SVE/SME state may be live on *any* CPU in
> the system, special care must be taken when manipulating that state, as
> this manipulation can race with preemption and/or asynchronous usage of
> FPSIMD/SVE/SME (e.g. kernel-mode NEON in softirq handlers).

Reviewed-by: Mark Brown <broonie@kernel.org>

--tCd0YtrqUnplrY3d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf0ILEACgkQJNaLcl1U
h9AvXgf/X/+7ZjIYG1NlHy6iukr+v6nu0Q83Ks9RcSpmi4dOuUw7nKHJ//wMcxHH
t8Q9MH11BBI6ohn3iNVmHacyr+WcVizwU8PRYYtyMvoIJbh1PUzh2DECLUweqEwI
MU5Du7/fCeLdQdfjGbLlMraZ5BifzWki764Waz9qa296xi7BF6/6PejmTfPSmXmy
crulBkbHemVgcWGRz9qttFkrMiSkaR/VaeOOVKHRJL9tfadOPL28la/DlhQEk99e
ooCAJ4isFX1wIkd2AARakeog/Eb5kWrgEwewquFLxFqulaR6Dddw1smS/nHrfcNV
G/dj3CLRD78f7jIy/N0Qfg12/h4XTg==
=wA83
-----END PGP SIGNATURE-----

--tCd0YtrqUnplrY3d--

