Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1FFCD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 21:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQbQcM+2LFhGGCQDe0XZ51z9pdAsNMcpd6iW+ZY+bYQ=; b=BsEHRHuE4YOKYByIN1YQ2RsCTm
	u6a0fktwG74kKjl3H4TsaVgf6TCRuBp0N6i+9yz1T6I9xc2o15kaimBlvz+nWukS2YmFchbSc39lO
	UWFCJhkf0BbhtSmbbg1p9+4hCC1WSwHJDUnA27GT6D2RKYBeZeYGzFd91an1cCt9sI2+30PNfdoRW
	rXKtJQClNGCbA9ZTFH1mQLBA2cP9YvV8xgdHrndzmZsOD1xT63Wwl0xWo3c+RLjcMLf99YOGbKKx3
	FeNXda9nu44fBQvvDfKCPIc7rtIsRQDaTCRtiJhq+uv1TTmrAAGn9uCaSPr3sHZssSX5Wq2eqTENq
	mBdN+aDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQBOI-00000009AnC-46XC;
	Thu, 21 May 2026 21:57:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQBOI-00000009Amz-07na
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 21:57:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2230260098;
	Thu, 21 May 2026 21:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0201C1F000E9;
	Thu, 21 May 2026 21:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779400636;
	bh=uQbQcM+2LFhGGCQDe0XZ51z9pdAsNMcpd6iW+ZY+bYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m4Sm8W4XsTe7axywiz1sP4asRFABCkdxRrgHOQEvE4uLdMIZTWhsxwDe+Qnon4pxz
	 6vQUSsH5TKerM0Za1lrlru6wAE/9mibrGrvdOUPQBpFRlv9GgxY6b4K7+CG8ZfUOHj
	 jsR+Dz7PYi7uM/35p8NwiI4yBBLlKaYcoy/lfVn2w8LVPSi8Ql/NBsjR+Z4hgMdxmh
	 lJn+XXPfzvr1OLGB8uMECc8WGQ9ozLAT3aScQP8Z1QSu1L/PB3PRjEXejKxQkQivx+
	 EKsFxS0VMMhLfdBD5J+z7uRPtLu0OyRmvQ+txqxoIrBPx8CS3hXETEG4sR0MHmVW4D
	 H+/z/Pv9KKX8g==
Date: Thu, 21 May 2026 22:57:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-next@vger.kernel.org,
	bpf@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com,
	will@kernel.org, peterz@infradead.org, mark.rutland@arm.com,
	harisokn@amazon.com, cl@gentwo.org, ast@kernel.org,
	rafael@kernel.org, daniel.lezcano@linaro.org, memxor@gmail.com,
	zhenglifeng1@huawei.com, xueshuai@linux.alibaba.com,
	rdunlap@infradead.org, david.laight.linux@gmail.com,
	joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com, ashok.bhat@arm.com,
	Boqun Feng <boqun.feng@gmail.com>, Boqun Feng <boqun@kernel.org>,
	Christoph Lameter <cl@linux.com>, Ingo Molnar <mingo@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v11 1/2] kunit: add tests for smp_cond_load_*_timeout()
Message-ID: <47cfb505-5d96-43d5-bc2c-961f61fa7fea@sirena.org.uk>
References: <20260408122538.3610871-15-ankur.a.arora@oracle.com>
 <20260521083038.134260-1-ankur.a.arora@oracle.com>
 <20260521144629.11ee1e2ff88c5387a589f54a@linux-foundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iR8o3p4d1Gu3Q0D/"
Content-Disposition: inline
In-Reply-To: <20260521144629.11ee1e2ff88c5387a589f54a@linux-foundation.org>
X-Cookie: No shirt, no shoes, no service.
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


--iR8o3p4d1Gu3Q0D/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2026 at 02:46:29PM -0700, Andrew Morton wrote:

> Anyway, I removed the series "barrier: Add
> smp_cond_load_{relaxed,acquire}_timeout()" from mm.git on May 19 for
> forgotten reasons.  So I suggest that the series be respun and resent,
> with these two test patches included.

The tests were failing on arm64 when run on hardware (rather than qemu).

--iR8o3p4d1Gu3Q0D/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoPf7MACgkQJNaLcl1U
h9ArKgf/WBzu7kRDlWjCMxxM9PE8zNgetiSk55MAn0i/cLo7V5upiJIuWjWAQ/5V
HXFCzW8WqDm/C/fgLgagDfAeXryA8mQHNzj+/GfwyEMoi7U4axGE0JAbRApQG6tR
pdoCuQvFQny3cRv8fUhuur9cUuk1bAqSyU1DJK3Cd3GsHu+WOZLAsAJ5ybxGhO+L
2S58wosHLfeML83EnX2ksuxisglbtbLAolTETorArAclmbGRmeeUWDu7FEgbxJeV
t3xPOoO0SEvmyi0l5pF0aS1qlhWanVmbPZeAojeRABt3u1fLn4RrBCD3QMmmovTA
R2tbzJ5cLsnrfq45zTTFtfM1xAenLw==
=i6eZ
-----END PGP SIGNATURE-----

--iR8o3p4d1Gu3Q0D/--

