Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B422C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 08:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnh+J1nGDNUVbOsiPioISO/rknj0lXJcZ4MB4rcC6Gk=; b=u8OHZjFn3iCqJdTOGnvqWA/7s4
	dAj53mtYmjQOtODZpRG1oKhKi9oXONHp6+c7irq7d/OAUOXAa9UAjkJ7Cf+2tXcq9fOwM63wXzcCM
	O2KhfvWizrzEJYWtzqJBNXckUA/7b2qHkI73lW2J1XjQYtO4BpuHery100OuIzLVdR+Q7A7gf6GDR
	Rdmm/iOvcYt2GNCvtr6NiOAkE7pEy5yoGjHUV+kGltoEkdb9SFxu7t53DojJVyySsxXgKTyWprwM+
	tn68Dmz92GhULUTkntDiHQ8D/pkKajT3BtGvd++S5YmPVy3XTeShDeK8Or1gqF3UPST3btCBzJhwj
	VCcxNH4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTcB-0000000HSLP-1OSc;
	Thu, 15 May 2025 08:06:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTYS-0000000HRKU-1UVn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 08:03:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5386CA4CB38;
	Thu, 15 May 2025 08:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB71EC4CEE7;
	Thu, 15 May 2025 08:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747296179;
	bh=bDjuUuhDO1eKs8zJQ8OSPWNjfdrBghRphQ/ti3Qq3yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ECdt2NVrLK4F2ha+dMk5ZykvFmtwjx+CpHviKSOzucKfOyBZJSN50/VtCRIdom59g
	 tOMkWWi4eTJUQLB16cn1bigliKv9vH10OUDFhFXT9gEfQQNaiG91DDONVViomJEIee
	 8LxUMfJI0ZYf3vxD1BuOn3M893502sFR5TU++erM+j+ypxqaKe13hJcP4AhfRJ8T+I
	 yrQVKUVaKdvYtDwX6rD3DzEcxPyCMjwVpTsMmdw2u5u0iGP+ifCNlN4oNEHAHVwkAm
	 CWdfxDCbAiX1snrVLsyUcOLxRL+4OPRCVxYOesWMoyh/K3bdcsKeo55cMQIl8WLslD
	 V2tYibkVzlX3Q==
Date: Thu, 15 May 2025 10:02:53 +0200
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
Subject: Re: [PATCH v8 4/9] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
Message-ID: <aCWfre2-n_PSuhxR@finisterre.sirena.org.uk>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>
 <20250509140957.GD2492385@google.com>
 <aCRZzwW0w8oVWLUp@finisterre.sirena.org.uk>
 <20250515071357.GD2936510@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3+iDnWdstEN1hguV"
Content-Disposition: inline
In-Reply-To: <20250515071357.GD2936510@google.com>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_010300_465830_FA294196 
X-CRM114-Status: GOOD (  16.24  )
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


--3+iDnWdstEN1hguV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 15, 2025 at 08:13:57AM +0100, Lee Jones wrote:
> On Wed, 14 May 2025, Mark Brown wrote:

> > Could you be more explicit what you're looking for here, the diffstat is
> > entirely MFD?

> Okay, more explicitly, I can merge this and MFD will have no issue.
> However, the Regulator commits make use of 'pmu_id' introduced in this
> change and would therefore cause a compile break.  So we could:

>   1. Apply this now and merge the dependents next cycle
>   2. Apply this now and provide an IB
>   3. Wait for all Acks and apply as a unified set

> We usually choose 3, hence my assumptions above.

Well, you choose 3 - I do think it'd be a lot easier to go with option
2, or with applying the rest to your tree as acks come in.  There seemed
to still be a reasonable amount of discussion on the MFD bits (eg,
there's some formatting comments still) so I was expecting this series
to churn some more and was waiting for a resend.

--3+iDnWdstEN1hguV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgln6wACgkQJNaLcl1U
h9Ccawf/eQQDUsNgS0TKYfGdBLq2g0QMIhInBoBlUy7l3xZbRm5WP2U9ZBbH5/2f
dxkSlwAkqIR29ii+atAZqTqbxdZxBMrcEkt4VergJxL0bXFZtmGxpRWq6vJ2w8gh
d5RBAd+2TKRlb/Augai+XkjI9sFVe4pt3Xpj4CiIx7zUHI31ZH0UJ7dGiCyvE4On
OWtn0GQ30jDyPKEfnFdMnkEM6WBFq+5GRvXcGba8qa6xTlwWYB/nQ30czLuz4yxA
PvvKw5KMT8aj9STkWj/Nqbbc6RyojjiPK6XrnPzkK/QaF6Pv1Lmo6D1Fim1ri82N
7mGSZ21WJB9/+4JRRFc6NBONqJvzKw==
=0NJf
-----END PGP SIGNATURE-----

--3+iDnWdstEN1hguV--

