Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD8ACAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 15:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFluv6VKE3NuRs5wlsACS5ciX86WgGm+MnjboWWlRPI=; b=zWHMZmPjtrFhSOC2WtqkGWiAA9
	OZe7k+W2l9BD12Kn+qoqGST/y/T4IFXin0VpdWMluI99kgGIrAeF2r24LuCA3Hup+PQh58E3+1EGH
	eG/UTqKYvVkWoaX9aqWawNu3XjIB+UP2ZG4hAwqNFjYaC6tI7XZ17qraRt/kx8XS1fI5XtWjRlr5L
	q8C7r2Bvyasp6j0zl3a3QKPM7jQaLUSlHD8u0EX/C/pyu1gwf9tD8Qi2qZDk0KOzDE3c2m5yu3yAa
	zXCr/GbXerXdgQhgv8FkZPGx2cNhX8ggXWyQyyYkGwJvoiccoBOwM4T3+fvjkPskE6heVhNm8UQNF
	j4+yXcUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdQD-00000003PiB-1rwK;
	Fri, 19 Sep 2025 15:53:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdQ7-00000003PgD-3fG0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 15:53:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B63E40339;
	Fri, 19 Sep 2025 15:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B428BC4CEF0;
	Fri, 19 Sep 2025 15:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758297191;
	bh=LY8UCU+64dez0iKU9byrdE3xtr9uB9iMyeO1oDOL/3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aOV8MwTfLG18DZwwAPFD7Rm3sJbkyFo6QukFWydz9vWeSc3v1IRTSVl/a7ocNxvwc
	 wMqEh/9o0j5TxAusXbyoSzPbete1PUJjByFf64KM1Z4oeTbiDTV+gYibMfkkeQMBwS
	 qbaBJOFWiRtx2AmG8a80m2G8+8EZ/dlJyp+QcYLrP3ReF30/gSvI0anIRYts6wkj/S
	 LM95N3RzmWzVm4wpTF4ARgK/7l+X4l7di8KcnVlEbS5A5ZBFw+umfAduBXS0e57DoH
	 dtEz7AaZT1SUQ3IYanPM99hXRfIAgGz3ZCkxozn+1RPQf91a4fmhmeZtmw1CJ6MWDM
	 j1kIgvB2pty8g==
Date: Fri, 19 Sep 2025 16:53:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v8 06/29] KVM: arm64: Introduce non-UNDEF FGT control
Message-ID: <d27a1c5a-9173-465b-90f9-fec528181ba7@sirena.org.uk>
References: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
 <20250902-kvm-arm64-sme-v8-6-2cb2199c656c@kernel.org>
 <87zfaqxymu.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vZXtN3VZj3O/Y/5x"
Content-Disposition: inline
In-Reply-To: <87zfaqxymu.wl-maz@kernel.org>
X-Cookie: Don't read everything you believe.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_085311_936146_F0E3401B 
X-CRM114-Status: GOOD (  18.35  )
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


--vZXtN3VZj3O/Y/5x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 19, 2025 at 04:14:49PM +0100, Marc Zyngier wrote:

> FGUs are uniform, because when something doesn't exist on a vcpu, it
> doesn't exist on *any* vcpu. Non-FGU use of FGTs, however, has to be
> more flexible because that's part of the emulation, and is actually
> pretty rare that we want to trap something at all times, on all vcpus.

> For the same reason, conflating the R and W registers doesn't work
> either. For the above example, I want to be able to trap write
> accesses to MDSCR_EL1, and not reads, just like the Ampere
> brain-damage.

> So please make this per-vcpu, decouple R and W FGTs, and convert the
> Ampere horror to this scheme.

OK, that makes more sense - it was a bit confusing that all the FGT
handling was done per VM not per vCPU without even any provision for
per-vCPU or distinct R/W stuff, it seemed strange.  Since the SME
requirement also ends up being per VM anyway I just tried to fit in with
what was there but if we don't want that behaviour it's certainly more
obvious to make it per-vCPU and to split read and write.

--vZXtN3VZj3O/Y/5x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjNfGAACgkQJNaLcl1U
h9DpYwf9GkvMEDYrTVm6kitHOpS+F99swSxSDy+9IjuOkcqkQIm18C2AoZe1iD0A
ZOB8PfTlFDFJGW4gxWHcWHk5prOp89I4xC2kXlguPQYe3T8QHfcsDDAJFxwhX7Xb
C0ICRPJQC6+q1td6A51wmqsCQ+N7cWd5oBz4A02evYJBcQ/7ZGlF3ykFUZTRhW+1
c5HGNIW9RSsbdoFLFtSAJYzFmXfMSgDdJB/5AG6BJ1wdY9CF4cdRzNI9TyhmAWti
qh/oncDSwLMg6VU1rkNhaibL7vRbtKI/7D3RldFVPyXuf+gqRjp7rC991dMcSgh7
iXujfThG7ZrCubxYhsccwtS4pIR5Jw==
=0qCo
-----END PGP SIGNATURE-----

--vZXtN3VZj3O/Y/5x--

