Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FBFFDEE42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 18:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6TH/4SyI3PS7mdjASumCPKeJNDqzeSXeaA0FgWeATo=; b=1aKiU6YXfi1PaJOs2btF65oZXH
	D9Rim6SIfcZg9rkoENuIDcZs3WbI/Ncomga3TlMUhpR/S1wI120HPAwZ6fr+14FNzTS9Vi5+oE6JT
	UH6umWGhBnomq6OE1GmVhCEDrAWCNL/x1adwvsNgedW16GTBl10LDTRHPRhAy6Npj8WrzHhVIt1nD
	k37TCu9ZhLBw9jEEzavuTjpiVRiu6EHFJQOS722QwhM0f9OROb+1Yzhxq0W71gETNGvweUkrGttmN
	SS2kgEk7Quz2fJnI00DGWSUHoBb3UsI0Yx3kOUSIc2XOapHcBdKa2Z9o97WgJ3yZ4MS35f8oW9p0V
	1Q0lAQfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFytK-0000000C7mx-1qRh;
	Thu, 23 Apr 2026 18:35:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFytH-0000000C7lV-1uKm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 18:35:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 075DF43F1B;
	Thu, 23 Apr 2026 18:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC00C2BCAF;
	Thu, 23 Apr 2026 18:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776969305;
	bh=sO4srb2VfWYzH/iq+j6SCQoI0NwsiN5Eg5HwtcphrfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q2EH6I2MU46cVNjfe6mgYcU7k7iQyidgG9KJuR9tJBz7RCfmDe2J5CRM+KDrAFgvK
	 NxDIDqjdOXMsj/3tuPRYOcA5QDh9eWQSJjWoIyRyNPyS0v+U/AWcEWh28tFbNdldBs
	 HSHQLkcsEwAPvVfjflnroQhaQI0W/00kHGCsLUje3ZDcxE/MoVpfBw3/0KU07SoqXe
	 kQWBx6r2EeE/gky/lZSq+zv9H0Ur/vs+zdXJzz/C34AhxoqJgVUKgYh6aIVqAiX1r/
	 hU6yfsDAXeW2OW4TxkPvKsRavpCFcqJfH+VNtDnnWAe+VOoEGufMwDG6W9rH3eYtJ4
	 H4NSzgkiNvi9w==
Date: Thu, 23 Apr 2026 19:34:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Jean-Philippe Brucker <jpb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v10 14/30] KVM: arm64: Implement SME vector length
 configuration
Message-ID: <3d9e19c7-2e56-43cb-bcea-53d305c35baf@sirena.org.uk>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-14-43f7683a0fb7@kernel.org>
 <20260318175317.GL2390801@myrica>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fhbhbXVDBdOem/hg"
Content-Disposition: inline
In-Reply-To: <20260318175317.GL2390801@myrica>
X-Cookie: I'm hungry, time to eat lunch.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_113507_513552_10BAD44B 
X-CRM114-Status: GOOD (  11.98  )
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


--fhbhbXVDBdOem/hg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 18, 2026 at 05:53:17PM +0000, Jean-Philippe Brucker wrote:
> On Fri, Mar 06, 2026 at 05:01:06PM +0000, Mark Brown wrote:

> > +/* Current for the hypervisor */

> Not sure what this means, isn't it also current for the guest?

If it has multiple VLs available then the guest may select between them,
including choosing one smaller than what is configured in the hypervisor
- for example a guest running at EL1 can set a lower VL in ZCR_EL1 or
SMCR_EL1 than is configured in the corresponding EL2 register.  This has
been something that has frequently needed clarification.

--fhbhbXVDBdOem/hg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnqZlIACgkQJNaLcl1U
h9ATfwf/QhCSHLUmuQXd95wc/Z+Kj+6TXzijHxGpEyfpplwzdDt8nNHkGlM17bQY
jEgvX0Ei5B5X3iJx03W1fZO7dT94He6vQelfDPipVZbVEpd6IEUmDj2XxHW4lE9D
+duYNIz3P8RgHuE29tagB4PeF5PUPrLEX04QeEkS61Y1dk047LBjyF06ykyh/7xg
NrJNKO9QxJF3GTLkDHjeMBBT98mtHS5UOjX21qo74Hn5V/VXLs7Ud6HhMeJQwO5K
MpDbtR4xv5IQRgz8Pqh9t0XtUM0a//15LizuqPsUDKV79VxWPtSV7mPDFY0F5O5+
Xgv2T1qQUfg9TgDhQh2oD4IG3nNmPg==
=tX7F
-----END PGP SIGNATURE-----

--fhbhbXVDBdOem/hg--

