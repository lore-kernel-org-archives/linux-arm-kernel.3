Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EB4C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 12:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGw/aNo5E/8j+Ct7W6NUaFhGPWjC5KjYIB/DedDiQh4=; b=el9jYcGbxRbDgX44HwCfsyaJYa
	jAOLId12cs5VYMTkSM+UM3dCZy3tTZ5nvgal9emOD9pCOeHOcYYMEGaFGs97XHDgptEUJDFaly6y1
	gCX9qB+c+Lu8/UALfBQyAQ4do1kqQVoTE7ogh2KQPaiU21/dBpowrmu0YvDTqP2cqgwLUvn3ZNTf6
	cI5MuLinIPlUS3Ln9I66j+zP+dNeGJjO6gXz1uOdCVPdAlcTQpvJFlQ2sKeKwDeKaghcCmPvWZ/ZA
	fUhB6hwQu1qgNt1GaUtZKo/G/QTkP/5X5ZXmqTqAxoDribnsqWmOSktDKmk9jIG5X/Jr6YHynUij9
	jhKkNa+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiumI-0000000ASQd-34m6;
	Mon, 04 Aug 2025 12:58:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiuEt-0000000AMsC-0iv5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 12:24:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F7CE4359B;
	Mon,  4 Aug 2025 12:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BCFC4CEE7;
	Mon,  4 Aug 2025 12:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754310266;
	bh=bkwZgyJhQDmHzonI+LQ1V7J2vFMO9gc7MkhZX5tyXMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tfybmt22jKHdfyRIKUevHxxBDRWk6mGh7Z2yGNPtcNyRcX65OLSLQMBYVRM1e6Kqq
	 BtuviDfu/KqvYKp6VQEQgCIqw5GBeWsAQ4FqI3XNbTFQrQH3CKw71tl495dF3qBWz8
	 OuBHUfhCdMSZWmmmifuYzlHBjhY0ty/5mEqBTE3r2oOzd2kh57SaubiGtsGygsAFbQ
	 W3tSv0ta5vjhK2nugqpk3QWAxapBx9JJhfFUuM0JsAOiSGJoxtNAcvReajQOOPOFxv
	 /oHGbMoZInw43o2I6GX5ByrYr10Wj3I0CmkGbvZEOj+eEpO4QlF1N8N3nIUoORzO4a
	 3Wat6twnEyyow==
Date: Mon, 4 Aug 2025 13:24:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, anshuman.khandual@arm.com, robh@kernel.org,
	james.morse@arm.com, mark.rutland@arm.com, joey.gouly@arm.com,
	ry111@xry111.site, Dave.Martin@arm.com, ahmed.genidi@arm.com,
	kevin.brodsky@arm.com, scott@os.amperecomputing.com, mbenes@suse.cz,
	james.clark@linaro.org, frederic@kernel.org, rafael@kernel.org,
	pavel@kernel.org, ryan.roberts@arm.com, suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH 01/11] arm64/sysreg: add system registers SCTLR2_EL2
Message-ID: <8451ed4b-7881-44b5-84a8-51cdfefff464@sirena.org.uk>
References: <20250804121724.3681531-1-yeoreum.yun@arm.com>
 <20250804121724.3681531-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QXyWowRG1xuUZNLB"
Content-Disposition: inline
In-Reply-To: <20250804121724.3681531-2-yeoreum.yun@arm.com>
X-Cookie: Shading within a garment may occur.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_052427_230477_5D5D759E 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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


--QXyWowRG1xuUZNLB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 04, 2025 at 01:17:14PM +0100, Yeoreum Yun wrote:
> Add definitions of SCTLR2_EL2.

When adding registers it's useful to quote the revision of the spec
you're referencing, this helps people doing updates in future (eg,
DDI0601 2025-06).  The update looks good:

Reviewed-by: Mark Brown <broonie@kernel.org>

--QXyWowRG1xuUZNLB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiQpnEACgkQJNaLcl1U
h9CcBwf9GiP4bpNbz/SUgAbK7e4d1KY3dHM9fA/NoEjouAyr3z4GGftmo0j+u+3l
f+F3EdQYM8DAzRw1pn++ykB92zaa4SYpdk/cWpzHI8KY2R76m9odebfutA84O/qA
ixu7DHD03Bjd0ZRjpb9SXMu36HT2rpnuP4qpZ1msZjunX5jmWPHblZ8cI91go/VJ
GSHSrFn8dCzf2rTYuJWWVhicxorOZDU2/d075LBvOTwMGV1dvPVbl6wiCm88qx3b
JfbIPlNgjvnGe0fIkzX5QbciX3m7zJg1/DlI4VT/DXzW5Bss10Pe8YIjfPDfzoyI
8XlJablGPqi24NGkLmS8euCOqArX/Q==
=m8fU
-----END PGP SIGNATURE-----

--QXyWowRG1xuUZNLB--

