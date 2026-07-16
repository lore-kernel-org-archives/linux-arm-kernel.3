Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF00C44511
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 15:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaIf2bJqWuKl6xlqqkPnkkfbrbDLiH3vk192GmIwHZk=; b=1HCBKGAmBfrAr14g8a6gR8lMfi
	0HJs9itD+jN8xO1/x9jWyBjaPhWnmS2RRwgIiVAQcSAAAad9T0DT8OCpFu3CDhffbzkcfr+/++nfX
	Bwdc8sYlQGf80DnhRMLSovJfyNIL3Eik2q9+M2VfixyPb87zmX+mg6XUuAu2gsaGET3m9OBW4D08v
	crnm3tZY+4XzGpg71u9IfsDJmy9RScfuX0tuo9S7S6Zh83UM6hJUcyR2keZsLgj2+C/kMiNpZcn5n
	ArvnNFMviu7YWW9LWRgE5Dj6qy/E0tKuB6u9AmPEzyyMge7N1Vq54geSxOgNrcROzb6NdpxeGWbQV
	OWRxFXqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkO0R-000000002wM-0YT9;
	Thu, 16 Jul 2026 15:28:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkO0Q-000000002vj-0dYp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 15:28:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 987AD42422;
	Thu, 16 Jul 2026 15:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243E01F00A3A;
	Thu, 16 Jul 2026 15:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784215689;
	bh=oaIf2bJqWuKl6xlqqkPnkkfbrbDLiH3vk192GmIwHZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DSjOcuzd0iLGxdIes4vVV48dc4V0xwUGKeQz/5Xho6MHAQsIujpe+BdnwPw0wg0+U
	 kWn78oND/Nsyb65Ui+FTYIxM21ZVE43nzaOmR/4/FweSh5R46+jozUFTMk/oL1ydAb
	 CMvoOwXNblYtgrjwlIPoNL9RBSOsH8r4OUI+XhSIcjVLJ1PHC2YGWYSDMK+yufe6bB
	 KJPe5uyJWBiwSGKikLPe/hBOjcKysvFYtcoYGIh3j7SQ2QuAGDX6axU1hn1qNqWWhk
	 JA5jOhLn61lR6HAAU2byHYkiPbBtgcsbjOnAzsWuNBZkk7d+b99KGn275vXpLWebDq
	 a1DHcX04mcdbA==
Date: Thu, 16 Jul 2026 16:28:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Ben Horgan <ben.horgan@arm.com>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v12 02/29] arm64/fpsimd: Update FA64 and ZT0 enables when
 loading SME state
Message-ID: <15a9ae14-395d-472a-a5be-9e46524fb493@sirena.org.uk>
References: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
 <20260709-kvm-arm64-sme-v12-2-d0301d79ef58@kernel.org>
 <ali39DG6qie7XTuD@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xV6YaOAEqkneq9ee"
Content-Disposition: inline
In-Reply-To: <ali39DG6qie7XTuD@J2N7QTR9R3.cambridge.arm.com>
X-Cookie: The more the merrier.
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


--xV6YaOAEqkneq9ee
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 16, 2026 at 11:52:36AM +0100, Mark Rutland wrote:

> >  		if (test_thread_flag(TIF_SME)) {
> > -			unsigned long vq = sve_vq_from_vl(sme_vl);
> > -			sysreg_clear_set_s(SYS_SMCR_EL1, SMCR_ELx_LEN, vq - 1);
> > +			sysreg_cond_update_s(SYS_SMCR_EL1, task_smcr(current));
> > +			isb();
> >  		}

> What's the ISB for? That mysteriously appeared in v11 without
> explanation. It wasn't in the original code, prior versions of the
> series, or my suggested rework with the task_smcr() helper.

> I don't believe it's necessary to add an ISB here.

I can't remember or figure it out, I'll delete.

--xV6YaOAEqkneq9ee
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpY+IEACgkQJNaLcl1U
h9C7Iwf/YuGnlCXvhBlz9BWXCUqYqn9u51Mi2A5/kXGFOEGaMF0Uu9MGkvq2Jk8F
EOseSkFIRcD7GiH3vDa2USAS+1NLt+TPjQy2gRSMD62MCXm8N7BJY5LioojxX7Rz
Ta0iqU+mWhVRuJxJ82JAWagl6zKf47yda6x+5tFDegJFU+5bUTTPcagYyWtDvfgt
sEVPNBjbQBZdC4QdbkH7/6gw23LCPuaMWqZlOP5UHuFn83ZwvAKy6/PxzpMs2y4p
4+4qFfGT6oanft1qW1XJ9TfgyqAjrQ1Ug6KUpdVpktBfyigwcw2MFWxdUzLmSLKG
LbYJk26LLkkGxmTPXVFVEAKBHv2b+Q==
=/cAU
-----END PGP SIGNATURE-----

--xV6YaOAEqkneq9ee--

