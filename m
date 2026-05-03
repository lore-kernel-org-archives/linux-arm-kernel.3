Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4E8CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 01:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BejErdLjcloUq8b5PniyViDnyXSa8nSLqZwJTPcujYs=; b=PnwvJN09CEQDMEnGeRrie5Fns1
	9AZs6kveW08yeWWaI+ZHe0VZtyhNgfFNLKEsxLD7pwdWeeLuz4m3M+xbHGiOA6+Hk9gV+bAN+kMc5
	T2Ir8JX27oycevnU77uAZ/1vnzZyKYKdp+ySgDyW18kvVRy7TyLuix3BbIqZ+oNwOi08E+ubFspsi
	P4O8CtgOlWvvYulR7rj1bJ/p7vwbmBFxAXWN3q7naTcdGtsLG+pbcC/kLeUDVtuhP3yuru7z3WwAy
	7YMHVv37RB528P2qQN+zLvHNjlSqhBeAbi4fbvzJtb5AG9/LGzSpr1KXAnCF9o9nVbAftxE1wqnOi
	r4QeJ5Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJLDf-0000000A1WD-3Lfd;
	Sun, 03 May 2026 01:02:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJLDd-0000000A1Vd-3mY7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 01:02:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 15BE743D72;
	Sun,  3 May 2026 01:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD9B7C19425;
	Sun,  3 May 2026 01:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777770120;
	bh=BejErdLjcloUq8b5PniyViDnyXSa8nSLqZwJTPcujYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pDysEjuQPcQ7jBSc1PFLCXCQ7pK5ItVVQyrqU8Gyl4viLnzTzP2w4VpjqCHLJKBOz
	 usCZwjN9TDEfMj+cYa/33gOuSAt5nfamthqjp2AwRw35TvA18BnbXfGLYy1SIVi+Ku
	 VpWJwmybN+1cdODsbyvSrF+RnXTLNgYjfKVg/rwFv0jz8VagDW4WlBsPMrVvnUQOsk
	 x0UORuIs/mzc+UZ23N9WOgWRhQIL1pEqmyqwfrplHpTqh2Tj2KvS7aUgLuEY24jKBA
	 6CeeawTTgroCGO+uJyDnpedMO+hrK0I2xks0sYaSGBYzPCGs8qi6e2RJLzNqaeVHvk
	 dbgY9KLTOb/dQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 45A1E1AC5865; Sun, 03 May 2026 02:01:57 +0100 (BST)
Date: Sun, 3 May 2026 10:01:57 +0900
From: Mark Brown <broonie@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Saket Dumbre <saket.dumbre@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Chengwen Feng <fengchengwen@huawei.com>,
	Jonathan Cameron <jic23@kernel.org>, Kees Cook <kees@kernel.org>,
	=?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Thomas Huth <thuth@redhat.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>, Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	Wei-Lin Chang <weilin.chang@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
	kvm@vger.kernel.org
Subject: Re: [PATCH v1 04/12] arm64/sysreg: Add HACDBS consumer and base
 registers
Message-ID: <afaehWCHVIN7EXNB@sirena.co.uk>
References: <20260430111424.3479613-2-leo.bras@arm.com>
 <20260430111424.3479613-6-leo.bras@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WmuCcD5bxYsJvAXW"
Content-Disposition: inline
In-Reply-To: <20260430111424.3479613-6-leo.bras@arm.com>
X-Cookie: 667:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_180201_963138_3A4A72DB 
X-CRM114-Status: GOOD (  10.78  )
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


--WmuCcD5bxYsJvAXW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 30, 2026 at 12:14:08PM +0100, Leonardo Bras wrote:
> They will be used on a later commit to make use of the FEAT_HACDBS
> mechanism if available.

Checked against DDI0601 2026-03:

Reviewed-by: Mark Brown <broonie@kernel.org>

--WmuCcD5bxYsJvAXW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn2noQACgkQJNaLcl1U
h9CXzwf/ddnlYC9NFIeWjihBxou3oH5yLLC0aEWsSsEpn4ePUND6BEnFEbPaP+E0
wbcFjU2eas3oIrx14W0iSIIkalM+8iam+DOyMFcNK22DZotaxwdHuqn1HmsicWN+
bTSDBTOc0jl0nawI+0FSS00Efpiubnsd1b2vM75E8/nkDujvazEz94P55PRYoR+f
DSl56OJoOQYDtJOcEGr7TFlY1T/nTMZ9nVO0+i1GCXNeWvSkm0driq2SxrwV6p6a
s/THx+XOJC9gXNK9yIFDNRUObRZrSA04vIQQiVyi/hR3HZpCs2a3/9+1Axo8qQAh
MuE6Mv9pzZeGJkoowjc8UJYs95E4aw==
=vdry
-----END PGP SIGNATURE-----

--WmuCcD5bxYsJvAXW--

