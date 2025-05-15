Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1E8C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 00:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10Uxs0n8dVDb5e+K+z9bNzYwScoNtaKsJMV0Wo1RoGA=; b=BOMdSXzAF2ujeo4qplCT5fI4lz
	V0i2Uo/gOrwL0rwrVXUOjfi0doUf4H4RZIJdzjIl8NBUPvDGWfH3mBz7sW2ePrNLkLFmW5aZGegwU
	/jOSXX5yf8l1kzqNJtANGIF3zP7pkISs39x7mZ0TbA+TWPXAgTsZ8KXEbxo8/0zCSOLq5HNpj2Tf1
	/+zCXNgiTfMJ+N1An+fn07lgRhLgTpJ21OLvAmJEFTd35/GGm2Oq2YseTlDw1A08uTyHgH7ChPYpu
	v+cWs1f9o2bxstmibpA88K4j6p0shz5EL3k/VrSRsfuf3RKvdV1OLSP9x4zVYB0GCO43yZUYScSiw
	BaNWpIpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFMIl-0000000GhKR-0YBl;
	Thu, 15 May 2025 00:18:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFMGf-0000000GhD6-0E4Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 00:16:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E928943AEB;
	Thu, 15 May 2025 00:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235B7C4CEED;
	Thu, 15 May 2025 00:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747268167;
	bh=uW+M74PgZ3HUM5ZEy0wgLlqjqjzVMkF8sZFdMOczPhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RIuWhMx4JqXHZhe2E9bp6Vc1XY9dfVCBB++H6KbySgeSdUtzfusiMCGBnctJKEq3p
	 17OVJRcKrv2iBQ8f6WfGuEeSn6Vy/jEoQFZcxtU2kn+skcX00xLYtYTpAi/hybtPIS
	 X3UaDxNvm2qpl2xD6KAOWxCAIlGFxjtSrcEpS0oJ/oj/2Tfjwom7kTg9Dn1R5RBCq3
	 qITvNErXeKTO1GYC85vUUhMll/tcXxP5SBQTIudYtKfUnacXiGcAMjoB123frXVFT3
	 Z2vtEr/zZRnLe48T9ba+7n8l09dG8bcJ4oVK8+WonJCPkQsPmToFVoHNu51hP9sere
	 ZW3DkRPAJx12Q==
Date: Thu, 15 May 2025 09:16:01 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: jic23@kernel.org, alexandre.torgue@foss.st.com, lee@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	catalin.marinas@arm.com, will@kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org,
	olivier.moysan@foss.st.com, ukleinek@kernel.org
Subject: Re: [PATCH v3 3/8] counter: stm32-timer-cnt: add support for
 stm32mp25
Message-ID: <aCUyQbDj6pDdRYuL@ishi>
References: <20250110091922.980627-1-fabrice.gasnier@foss.st.com>
 <20250110091922.980627-4-fabrice.gasnier@foss.st.com>
 <euiZ0AkHt7QXbUa8SgT5b2zrUV2Ha-llURWKhlOUH0BhTlbbIBTELC3Uk_sQGpTMSy4vS3j66xs83vKXnJjrgA==@protonmail.internalid>
 <5268ec60-ae2e-425e-a4af-a55cb0c3a1f9@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xd2tMiRaS48NlvBR"
Content-Disposition: inline
In-Reply-To: <5268ec60-ae2e-425e-a4af-a55cb0c3a1f9@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_171609_119233_C7CB477F 
X-CRM114-Status: GOOD (  21.99  )
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


--Xd2tMiRaS48NlvBR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 11:30:14AM +0200, Fabrice Gasnier wrote:
> On 1/10/25 10:19, Fabrice Gasnier wrote:
> > Add support for STM32MP25 SoC. There are new counter modes that may be
> > implemented in later. Still, use newly introduced compatible to handle
> > this new HW variant and avoid being blocked with existing compatible
> > in SoC dtsi file. Modes supported currently still remains compatible.
> > New timer 20 has encoder capability, add it to the list.
> >
> > Acked-by: William Breathitt Gray <wbg@kernel.org>
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> > ---
> >  drivers/counter/stm32-timer-cnt.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> Hi,
>=20
> The first patches of this series have been merged.
>=20
> I'm not sure who shall pick this one ? (I think there's no dependency).
> Or do I need to resend it separately ?
>=20
> Please advise,
> BR,
> Fabrice

I don't know if anyone has already picked up this patch, but I'll take
it through the counter tree regardless. No need to resend.

Thanks,

William Breathitt Gray

--Xd2tMiRaS48NlvBR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCaCUyQQAKCRC1SFbKvhIj
K0SEAQCczNPjoor1o37cz8SqvsdN/7HtNNlaPrWLW1dpooqMnwEAgbin0MfIxTCj
Kw1ZtOOoP37+0SshTS2OcPlXqohQYAY=
=B/SX
-----END PGP SIGNATURE-----

--Xd2tMiRaS48NlvBR--

