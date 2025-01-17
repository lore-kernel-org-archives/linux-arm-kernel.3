Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A023C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 12:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7ihVmOBoRg8/pOWpnsBxf68sB5l0kSj6Vonmuw8xuM=; b=cEeNgvXI2Thn1xMK/v9X3TfbIA
	bIAilQcyQV1PWy5AK28KWdqY1C0UlUynhXYQqgBxenUwvtSaejeefK80GEog7Ja/LCdKk6mCoMGTB
	l6aram2+Zy5GQG3mXvZFQh1njX5qQ2ZmNuXYH4U+BPX1/4Mxj7gv5mFWvxv25PXV0U3JazpjuI/SN
	2qdHjOgXvcySzOZcfLyEZxkPxZFFUEwBdJj8FkFR+7heH40YpbcJKmJWqYl03fkoyiYWuNSSG9dmN
	+eVJlp+qUTOLKtWl4z0UXKKxkF6ahl66/BmpLIZ0vv+DALv++cGrxBgvHNhhZNHpxcLjCCdYALIte
	Sd4AnbEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYlcN-00000000FPL-1wiZ;
	Fri, 17 Jan 2025 12:38:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYlb6-00000000FF9-3Edd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 12:37:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9BFDDA42B59;
	Fri, 17 Jan 2025 12:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AA4C4CEDD;
	Fri, 17 Jan 2025 12:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737117431;
	bh=C7ihVmOBoRg8/pOWpnsBxf68sB5l0kSj6Vonmuw8xuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mj5Kns1/fpx+c72LVjZ6q/gF+xXMZfwdjaBEDzrnIyaYXOBnkW9tXuyEF7tc0Vb8e
	 GWsKTbKd6RlGtfoMn59Yu42poWlGMuoDa2jIPMgo3hJ+BELiPAGM9MJ9EWiWE7MsL2
	 Nrv3QFHfDWKHKL8SfSkQQJlYYrwYz6d1qS1+ySC3wD9fTRzB3vOHN9pPbioFMrCCzy
	 gdsqtaJR7sS1Xw861NfkD4FknAi+Zv0TNjLMZZ1ZMKInZ5Dr+8Vlw25zi0NYMlkCpF
	 8BSHQ2FvGxdBljMiSU4vQaMm9tbTjn0rUKnbRqtXzCmPfUh/ol1tTPEs5C1BJGB5e5
	 RiJVaWfdomfVA==
Date: Fri, 17 Jan 2025 12:37:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v3 09/27] KVM: arm64: Factor SVE guest exit handling
 out into a function
Message-ID: <714fb3eb-630e-45af-bd72-be36b2bcb72f@sirena.org.uk>
References: <20241220-kvm-arm64-sme-v3-0-05b018c1ffeb@kernel.org>
 <20241220-kvm-arm64-sme-v3-9-05b018c1ffeb@kernel.org>
 <Z4pAMaEYvdLpmbg2@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D+TJE7NiAHLoddf+"
Content-Disposition: inline
In-Reply-To: <Z4pAMaEYvdLpmbg2@J2N7QTR9R3>
X-Cookie: Q:	Are we not men?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_043712_877035_A0B6950A 
X-CRM114-Status: GOOD (  10.30  )
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


--D+TJE7NiAHLoddf+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 17, 2025 at 11:34:09AM +0000, Mark Rutland wrote:

> I think we need to fix that before we extend this logic for SME.

Based on some off list discussion I gather you're working on some fixes
including this?

--D+TJE7NiAHLoddf+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeKTu8ACgkQJNaLcl1U
h9DWvAf8DiOPECmm9haJpiLCtiiBARlyLnyBFEfgOFIDtmSO77aoxsMpBj0plUKe
1fKqnIcSudLGM/61UGkfK0e1CZxkb3DaDTq/zmVbTOBor72y033GymoiWIjDJB4K
53om+5RwuO/GP0Fb4X8ZTiVMMBVsFxbicJqreg69M1LfXFWYGAlA8aEky4iAMBKM
boe+xctRwbuYVFwWZYI5MjZQKkUOUw1YGohYgeRA3pk9XJnDWLRmYGXBVyGkdt8Q
sZkxkpMIhebnsiUenkNJC1Qb9yG0TiE1T+XuhJ7hRu28baG7u0W8FSWwxSYpqq5G
3JNKJQLbG/MSzuX9Vkp7Eu+uhCG6/g==
=wzZf
-----END PGP SIGNATURE-----

--D+TJE7NiAHLoddf+--

