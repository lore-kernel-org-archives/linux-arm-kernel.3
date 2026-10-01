Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19950CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 18:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EXPyjCLnT0u6Y3Aw1qgMDaoecca6+CurIO2hSBvPAE=; b=ledb1khcPmIttyqMeCL93jej6B
	c4xKNcs3JV52ZGgUr0Ee4c8ZsIAQRF1aOXRKTelzZB7xY/l8Exkc7ow1cVVcDI4+dJn2iTj1h7cwk
	aXpPxLqDilChweFPaufHR8ecsayRd94AKOz2Ry0jYlVMQswBCa1qeP5vWs+pX4Q0X0atQzOdi9Fje
	2AuJgpl3H/uemwiGIoCIgkkOu94YTA3PC+E2qx2G4WJKpOyPb/J80NngJZ7+4608U+QblzbITcWIg
	Cqebi0POYHJXqulpRFrWnKO4RehnIt8Hz76yQ+5H7bPEX/+9yfkbk3ZiwuUdHXAOhsd1MAK8U9iM1
	UOUqeeVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCLIg-00000009xgF-2zs2;
	Thu, 01 Oct 2026 18:14:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCLIe-00000009xg5-3SzJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 18:14:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 79E8F43442;
	Thu,  1 Oct 2026 18:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA111F000FF;
	Thu,  1 Oct 2026 18:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790878472;
	bh=8EXPyjCLnT0u6Y3Aw1qgMDaoecca6+CurIO2hSBvPAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K0YVCfY2IDUaC4Vt4tc6UsXJc2uHpFjZ8QQVRtHbwXnLVQqg+u5EW9RW5MrX/HhQt
	 aBsJd+I6q0vpz1wNylTgBOsPVkpnW2j+cvZENvcBD/lZ77oY3EszViUH6kkOwBetVZ
	 H9VGfiGECqOwiSeuB2jonVQsYNAMtKKI3/q4s6kzPVf87jTYbNAd4pPl9T4ACPIPek
	 LtFtHRGA6IIl2pBMyHvMWHQMUeqkiMrPxHmN8sH+OuFoedNzkmC7ZM9/iQztEMXzzH
	 NmCq/uXXPLYoUpwEva61QltarOEgoeojcabxt2AbJn61YJxlS/VrguUjw6ri9wGNBX
	 vbDa2ZJ5fJvBQ==
Date: Thu, 1 Oct 2026 19:14:26 +0100
From: Mark Brown <broonie@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leonardo Bras <leo.bras@arm.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 12/15] KVM: selftests: arm64: Add GCS to set_id_regs
Message-ID: <8eb4d0f8-3080-4efa-afaf-bbe2a16eaa37@sirena.org.uk>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
 <20260930-arm64-gcs-v21-12-3556644cd927@kernel.org>
 <ar6MIFW2vfM893yd@gremlin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hLSHdAw0xQgYgBov"
Content-Disposition: inline
In-Reply-To: <ar6MIFW2vfM893yd@gremlin>
X-Cookie: Do not stamp.
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


--hLSHdAw0xQgYgBov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 01, 2026 at 05:38:54PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Wed, Sep 30, 2026 at 10:48:22PM +0100, Mark Brown wrote:

> > Now that GCS is configurable via the ID registers update set_id_regs to
> > cover ID_AA64PFR1_EL1.GCS.

> Should maybe also mention adding the GCS-without-S1PIE test?

I'd have said that was part of the coverage the test now has for
bitfields TBH.

--hLSHdAw0xQgYgBov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq+owEACgkQJNaLcl1U
h9AK6Af8CW+PewA41u22GjCm2K4HWJprbzV/mTkY5qCL0xX8i+fFZwjBEGuDg++l
1WZRIYTi4kqI5ofqkLVG8zllv9dSAW+DXcsH7TJjs5wyZDO9bNqbbBeqFZswxGMh
ZYdKcZLYTg7gs9EGJ5eEPyIgNYjjJga9ABn6hZTFsDEM+VKDL7GcjpO6WXW+JPZg
cc2IlLt9eQTZcjwpvtnT9xwnHsbCppAuuVqV8tU+ZuTQ94TMixXsDTTltMvolgvB
9ZDUkJtJD9k4vuBdXiyh/UmkgMf+b9hoDlJwshmwjziFwY25asoZUM5LNZcJhC8t
E5Dked3ERLcN6MVu6njP5Qxr0XEW5A==
=ZnLt
-----END PGP SIGNATURE-----

--hLSHdAw0xQgYgBov--

