Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B80DC44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jDZSD0ZXBMKU0DnAOHmPPwvUaOFC7qe+/DOFXEBCrM=; b=hevyieRpxX1ml/hUOX8DfeqcOf
	UoNqEyS1pQ78Etrp/w9wCqcpKpwmCHI0tbTehRUVsFbry+wZ5yfKBsxU1CWjWfbwrgERRYez5tTaW
	E19qE8uGndX7BhpA5bc1IXYU6Bbk+8lJMzaVOY7+yQRTkKkqRa94aRqOkOswHOu65X4V8JhmBotiy
	dmLUaae5Z3YFDVoFPQNvxhyUItOBj67bopjuJEB3CvF8YK7ED1W5cPpermeZFx0dRhEb5pFJzKlJJ
	ghzyzu8CJmo2DVK9rZmSLjfxFlwSHvvvSu97HHTROOCu6r5EKC5VKttcRRHcKfz5SuSQipkDZnQYf
	vMDAviRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFRh-000000097Y9-3FNO;
	Mon, 13 Jul 2026 12:07:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFRg-000000097XX-1hqP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:07:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DC23E41A11;
	Mon, 13 Jul 2026 12:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2191F00A3A;
	Mon, 13 Jul 2026 12:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783944455;
	bh=7jDZSD0ZXBMKU0DnAOHmPPwvUaOFC7qe+/DOFXEBCrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BpA+61ubk0J051AHcwHvcJDrGcIq7CrWdik61tyJi8gKjWK/Bh6rOoauz4nnoATP9
	 z9B7lFZLzJDrHlyAzSokl43P2diwlF4AwhbABdmReNTjUMnKd3YKN2oGjFTDCS0boM
	 z0MNQ52CSqHNk3Tr2wOwfuQ+QcTTesZW3Ksc0KM/lPg00H8Olnz7IF/j3Xud1wfUAc
	 vgKXYEMmk2C1/RznpAzIjCIb8xHtq1ACvc2WEEJKd+k2G/XgS3DENa2uT6HvvpArcA
	 ZMPqyJRjF7xI/aIAcegBvA9wwIEhREtkzqapyHKncikPXnkwI86yBPj2yiyibNP1ok
	 SffBMTrce85bQ==
Date: Mon, 13 Jul 2026 13:07:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v12 00/29] KVM: arm64: Implement support for SME
Message-ID: <2b521e6d-be72-4d6f-b9f2-87b4d1175803@sirena.org.uk>
References: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
 <CA+EHjTw4uz9UjezNdHynMV38P0jORwfcxSSv834nQ8Q1JqW0Jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/XZSrZTLgS9atLBV"
Content-Disposition: inline
In-Reply-To: <CA+EHjTw4uz9UjezNdHynMV38P0jORwfcxSSv834nQ8Q1JqW0Jg@mail.gmail.com>
X-Cookie: Courage is grace under pressure.
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


--/XZSrZTLgS9atLBV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 12, 2026 at 03:03:59PM +0100, Fuad Tabba wrote:

> Unrelated: on the get-reg-list restructuring you mention deferring to
> a separate series: since ZA, ZT0 and SME_VLS are the
> migration-critical SME state, it'd be good if that series also covered
> a save/restore round-trip for them, not just get-reg-list enumeration.

Yes, better testing for the register interface in general would be good.

--/XZSrZTLgS9atLBV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpU1QAACgkQJNaLcl1U
h9DypAf/W0SOgAJEKLIa3gvYV64Dx0urVRKR0KeM2AmELN/5bT9A/YfIHa92+vNh
LfoAgKaikhNdRjiuGg+BQF7lBPZLLXEvXtZMY8MC1oYyioWaiFvyb/xwvcby6LNP
RoTvjFB1ONxEfKsdrMhJvWbBJKu5AUc+9LRVSqzdQ5A0RfpKIneMV6kyjSVi2Io4
1wyPtODfqjf4qCSnqAODl2i/YGv+yROouYCFA24iCMJ9sVpc0UwBHAQb3AFfIWlm
ETQgCJpqueXMCMJNTXqUqMc1natNGA81jOPIg7CB3a3fxCRb4HxwOf5P8JrUmPWo
1VvaTIAG01p4n0S8IKjjG34RHqBxkQ==
=cZj9
-----END PGP SIGNATURE-----

--/XZSrZTLgS9atLBV--

