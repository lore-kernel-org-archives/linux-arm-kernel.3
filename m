Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16771C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhBVZKSkYEr/KtA8/VNDLfsPsl02l5A5jOyrioNrzuc=; b=oP5nCYWOv3AQOS88Q6zM7Daat5
	rFKttgTE4em8cVpyWwRV2+c0K+zFZXudctm5egF2C/nPpiKWVBPgF+rojyHJnblExAPAohP/Cprau
	fSZPcBeL3slPLQoDfPH4Sm7K5bPU6wumifYwl944L8V5zNH8oEq9Mo2hxzaFQNIw7HDgFcfY02//E
	dhSVeHjq9KByYzhiNgSKMaYTjTczsIhHI01Szdqmsq97pDBDlvhTD4lwha0Hywk4ezhYzkS8m320d
	v3jskbId4HzQfFH8hXQ7xp6frZZxAoKB2kDftGuJ2EEu2h4z9ru8JvUcfC6sWWZpJOOBSUsxYwLfW
	DK561sPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSOu-0000000AXUJ-1vtF;
	Fri, 07 Feb 2025 17:44:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgS7H-0000000AU21-3ryL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 17:26:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00619A40249;
	Fri,  7 Feb 2025 17:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22999C4CED1;
	Fri,  7 Feb 2025 17:26:08 +0000 (UTC)
Date: Fri, 7 Feb 2025 17:26:06 +0000
From: Mark Brown <broonie@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Fix uninitialized variable warning in
 FPMR test
Message-ID: <89da135a-8c14-478f-9830-0b03ecd0b14d@sirena.org.uk>
References: <20250207-arm_fix_selftest-v1-1-0d6eeb04299e@debian.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hHw0qavQsd22qTLy"
Content-Disposition: inline
In-Reply-To: <20250207-arm_fix_selftest-v1-1-0d6eeb04299e@debian.org>
X-Cookie: MMM-MM!!  So THIS is BIO-NEBULATION!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_092612_023618_ED763D10 
X-CRM114-Status: GOOD (  11.06  )
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


--hHw0qavQsd22qTLy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2025 at 03:06:42AM -0800, Breno Leitao wrote:
> Fix compiler warning about potentially uninitialized orig_fpmr variable:
>=20
> 	testcases/fpmr_siginfo.c: In function =E2=80=98fpmr_present=E2=80=99:
> 	testcases/fpmr_siginfo.c:68:25: warning: =E2=80=98orig_fpmr=E2=80=99 may=
 be used uninitialized in this function [-Wmaybe-uninitialized]
> 	                         fprintf(stderr, "FPMR in frame is %llx, was %ll=
x\n",
> 	                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
> 	                                 fpmr_ctx->fpmr, orig_fpmr);
> 	                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~

This seems like something that should be reported to the compiler
people, we only print the FPMR value if have_fpmr and there's an
assignment to orig_fpmr in that case.  Which compiler is this?

--hHw0qavQsd22qTLy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmemQi0ACgkQJNaLcl1U
h9AttAf/XRt7qoqT2772eKxoPwS3Sq6TxfiGGChnMGjdkvM2j6Oxm8hEirSFUG8t
ueb91q79QHguSHJVjM+MOgwiHjexs85Itp5UG5lMGNoxKgVCPfZADc/NlsvTbXEP
94bxiYfE+PA6RqVU7NN21YCLXCB3AOe54bY/klJbscm3wWV5Q/lBwRCpXfMkG90P
qEp7UNTQChDTZmpJvjeFUdIp8jD4uWu+WgOvdfkhU+L2lPnERaMJ8GiOiIrPymrN
VRpQHu3PPsczwbUJ+qNidgIPhiCvpX7CAMnzixVC9XU0iUc2iHm7hvC2P8mmbjpb
wtyCIXytbPAH5vXZMvPE+Wm/jIGFvA==
=5EkO
-----END PGP SIGNATURE-----

--hHw0qavQsd22qTLy--

