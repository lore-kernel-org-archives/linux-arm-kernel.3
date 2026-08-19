Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24516C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 14:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7S1oNZ0d0Ppxea6fIUZHSrjDvjafdvBHWU+BL8Rgkg=; b=KnyKb4MeoAVweAaup0BSswoSqZ
	iU3+Pp0tb/TZhAQRHqoolSgLTFXuLjlze5s4xJuaX72mpRrWmsPzauWff3fBMz/3Mv3xhBdWeNHTn
	drpSVo75H7dl2rtYwk7ZHVVV/7rBt1nF68h/iebTnyjzG4KabZ4UXassAjs1u5NP9g3OcvFREACte
	KtwQm91jyGAALZs+k1QGvITawEKSWgU+7QjX1tqf8kNy0EiowwZnuguZJ+My++ODVK3G01WWmnzg+
	Yfw5LLTxEWjYUHBsumrQlrZF4EkFympO+/lUAlxoy0Y+woycxBxCtgaGTUC1+lKPRdaj1heHmOZeX
	iIDz1YzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhAh-00000009xto-1rPO;
	Wed, 19 Aug 2026 14:21:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhAg-00000009xtE-1Hss
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 14:21:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B9D841B3D;
	Wed, 19 Aug 2026 14:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690E41F00A3A;
	Wed, 19 Aug 2026 14:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787149297;
	bh=B7S1oNZ0d0Ppxea6fIUZHSrjDvjafdvBHWU+BL8Rgkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VKohbjQtxpEmZPWdiGLLB53jtRq3gLpCe0pPm4oD94Sua26B3Kglmb6SVxKA6OG0f
	 778AOfOYD+EQhg5rwoTH/Mh2Nr9oYXU2aUIo+9oCFZPbbhYMbmrKEG3seFXbcjFxPu
	 n6x/OfeD3l9zX+ymmwzEuAau991rDSSAPuWarsTfX465Z+aQUOZkRYYDNejsSDq4IG
	 1GtOYdTBOTmjNvmGcMllJnFhsmrM/hXjzjYnxj7beNukeo+njCDm03/PwRpWovpB/H
	 huvDR/cmMtK4Wco3Hdy8DRXEjllzhs5g34Vlbder9j2EHOuiR+xEWNC8nJmUTyINFD
	 8TmGj9ssUkynA==
Date: Wed, 19 Aug 2026 15:21:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>,
	Oliver Upton <oupton@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v19 01/14] arm64/gcs: Ensure FGTs for EL1 GCS
 instructions are disabled
Message-ID: <a6fe8050-18f1-4013-8d6f-38ecc754c7e7@sirena.org.uk>
References: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org>
 <20260812-arm64-gcs-v19-1-9105afd828ac@kernel.org>
 <aoWyeTx8lYGfiwYc@LeoBrasDK>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EpiKBYt0FrKwqKPC"
Content-Disposition: inline
In-Reply-To: <aoWyeTx8lYGfiwYc@LeoBrasDK>
X-Cookie: Allow 6 to 8 weeks for delivery.
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


--EpiKBYt0FrKwqKPC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 02:41:13PM +0100, Leonardo Bras wrote:
> On Wed, Aug 12, 2026 at 08:12:00PM +0100, Mark Brown wrote:

> > +	/* Disable traps of GCS instructions at EL1 */
> > +	orr	x2, x2, #HFGITR_EL2_nGCSEPP_MASK
> > +	orr	x2, x2, #HFGITR_EL2_nGCSSTR_EL1_MASK
> > +	orr	x2, x2, #HFGITR_EL2_nGCSPUSHM_EL1_MASK

> Which I understand to be the way of us saying that EL2 will not interfere=
=20
> on nor manage those instructions that let software change the entries of=
=20
> GCS. Is that correct?

Yes, the goal is to allow EL1 to manage things how it wants (there are
controls for store and push in GCSCR_EL1 too).

> As for the asm routine, x2 at this point have nBRBIALL and nBRBINJ alread=
y=20
> set, and will be loaded to SYS_HFGITR_EL2 in the next block of=20
> instructions.

> Did I get it right? Is there any missing detail here?

That's the idea.

--EpiKBYt0FrKwqKPC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqFu+sACgkQJNaLcl1U
h9AZpQf+M2xlXf78cJhC8qd3kd3TCTXSK7OPaRFzCzopuFWugQZnO8gta1cvLRQm
hu7hPMPgHfsLHkw07V5RQBBFC7hdozSVwrGK61A7mB9I+Qy36CoYWDiKWXZZW08s
e5u09U7j1iikPNTOQlKmgWHyjo8HwS6CWHe2qBsGGfoIiOPE5TDj0cioyIsF4I0H
hCaXKaxmqB5S+1dIkeVTNbJIt5uSG9DCdA5vMANOK3LFFnENrQqoT0D4aiXB4Et0
/rigSzS3c/ubrD7/I6IFoiV6WoduU0gWqCG473s4ghVaY/3eWC+s7tQlXFDizf4q
8GbMdi6CGWTzUEA8Gfls55jI8SWUag==
=vEYu
-----END PGP SIGNATURE-----

--EpiKBYt0FrKwqKPC--

