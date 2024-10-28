Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2709BD3E2A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 18:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTX4KSH892M9KCDEUXteNEyOJqf4RXIrerMOF5tPv5o=; b=RSPFl/gYhL2hCeGwnUpKIBporD
	Gsg5S1+lFwfP/vwN+oahnmH5gBaXMGZgxZrOpOiZYkiBjbN9erS8Q0PNLWOFtblJgjeBaLiTtVbNQ
	sAkH6T3Fky5U+iu90rh0xs2tVyNbHfgvE9mLXsZy8IK+9IT2xi1+KPx7Kgp8f/5eOnlPc1J61P/u1
	4AvUs+XSwbMN+uo9T1JKP1On84XhBqH5jPJvLmZ6h5yOrGQ8OSFJTepxCcdLygsFIfJa/o3OO7cw+
	ezOD7XQNd6SgFf1+mSO1ucjiTdyu6dEEW+AVls0Zx2XZ/Qjc506Y/AGKKceRKX572l/jjP7ISENQl
	DKqRbGWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5UWU-0000000Bpn7-3OHn;
	Mon, 28 Oct 2024 18:31:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5UUp-0000000BpWP-2sPe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 18:29:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B5EA0A42AE0;
	Mon, 28 Oct 2024 18:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685AFC4CEC3;
	Mon, 28 Oct 2024 18:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730140182;
	bh=8OmpXILBuI+6wKvs6RAK06K+NY8fg730oVtwqZY18UQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KKZ+EjwX/7ENZi02x0H84gmYRS+6nYEdTYYmv3JVRcIYUiL0g8alPTrZJb/wRgz4K
	 wnwK+MTAQAAEh1fuI+T8wKQ8T6OI0ZoXv9HzFnUs0R0L6I62Xx7WtYMEHA8R8NH/yA
	 wQemdJeMWet1dUmuqPEQEdScuLJw/4IHhKXR+arYs5mvUvGHHDTToPxWTyiBmQ5wVv
	 fS9qgCgrcvFZLXz/Jm9cdhUh+eX31wEbPBLJhuuE+ku1bmxHLR4Y6ggrc17qdTSRsz
	 Rpu0J8LrsZ5ZOgWoBbMURK+7smXajPukz1umnwtdS/3El/Jc1t3HFZXrPiFN1oWRdH
	 XuxUslM5c2Hyg==
Date: Mon, 28 Oct 2024 18:29:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Xu <peterx@redhat.com>, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Subject: Re: [PATCH hotfix 6.12 v2 4/8] mm: resolve faulty mmap_region()
 error path behaviour
Message-ID: <61461dcc-e455-450d-9c01-5465003fc31c@sirena.org.uk>
References: <cover.1729715266.git.lorenzo.stoakes@oracle.com>
 <6e8deda970b982e1e8ffd876e3cef342c292fbb5.1729715266.git.lorenzo.stoakes@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AN/SqrqcdGLKIaZP"
Content-Disposition: inline
In-Reply-To: <6e8deda970b982e1e8ffd876e3cef342c292fbb5.1729715266.git.lorenzo.stoakes@oracle.com>
X-Cookie: Results vary by individual.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_112943_877530_DD682293 
X-CRM114-Status: GOOD (  15.02  )
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


--AN/SqrqcdGLKIaZP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 23, 2024 at 09:38:29PM +0100, Lorenzo Stoakes wrote:
> The mmap_region() function is somewhat terrifying, with spaghetti-like
> control flow and numerous means by which issues can arise and incomplete
> state, memory leaks and other unpleasantness can occur.

Today's pending-fixes is showing a fairly large set of failures in the
arm64 MTE selftests on all the platforms that have MTE (currently just
the software ones).  Bisection points at this change which is
0967bf7fbd0e0 in -next which seems plausible but I didn't investigate in
any meaingful detail.  There's nothing particularly instructive in the
test logs, just plain reports that the tests failed:

  # # FAIL: mmap allocation
  # # FAIL: memory allocation
  # not ok 17 Check initial tags with private mapping, sync error mode and mmap memory
  # ok 18 Check initial tags with private mapping, sync error mode and mmap/mprotect memory
  # # FAIL: mmap allocation
  # # FAIL: memory allocation
  # not ok 19 Check initial tags with shared mapping, sync error mode and mmap memory
  # ok 20 Check initial tags with shared mapping, sync error mode and mmap/mprotect memory
  # # Totals: pass:18 fail:2 xfail:0 xpass:0 skip:0 error:0
  not ok 42 selftests: arm64: check_buffer_fill # exit=1

(and more, mainly on mmap related things).  A full log for a sample run
on the FVP can be seen at:

  https://lava.sirena.org.uk/scheduler/job/901638#L3693

and one from qemu here:

  https://lava.sirena.org.uk/scheduler/job/901630#L3031

Both of these logs include links to filesystem/firmware images and
command lines to run the model.

Bisects converge cleanly (there's some random extra good commits logged
at the start as my tooling feeds test results it already has on hand
between the good and bad commits into the bisect):

# bad: [6560005f01c3c14aab4c2ce35d97b75796d33d81] Merge branch 'for-linux-next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [ea1fda89f5b23734e10c62762990120d5ae23c43] Merge tag 'x86_urgent_for_v6.12_rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
# good: [6668610b4d8ce9a3ee3ed61a9471f62fb5f05bf9] ASoC: Intel: sst: Support LPE0F28 ACPI HID
# good: [2feb023110843acce790e9089e72e9a9503d9fa5] regulator: rtq2208: Fix uninitialized use of regulator_config
# good: [0107f28f135231da22a9ad5756bb16bd5cada4d5] ASoC: Intel: bytcr_rt5640: Add DMI quirk for Vexia Edu Atla 10 tablet
# good: [25f00a13dccf8e45441265768de46c8bf58e08f6] spi: spi-fsl-dspi: Fix crash when not using GPIO chip select
# good: [032532f91a1d06d0750f16c49a9698ef5374a68f] ASoC: codecs: rt5640: Always disable IRQs from rt5640_cancel_work()
# good: [d48696b915527b5bcdd207a299aec03fb037eb17] ASoC: Intel: bytcr_rt5640: Add support for non ACPI instantiated codec
# good: [d0ccf760a405d243a49485be0a43bd5b66ed17e2] spi: geni-qcom: Fix boot warning related to pm_runtime and devres
# good: [f2b5b8201b1545ef92e050735e9c768010d497aa] spi: mtk-snfi: fix kerneldoc for mtk_snand_is_page_ops()
# good: [b5a468199b995bd8ee3c26f169a416a181210c9e] spi: stm32: fix missing device mode capability in stm32mp25
git bisect start '6560005f01c3c14aab4c2ce35d97b75796d33d81' 'ea1fda89f5b23734e10c62762990120d5ae23c43' '6668610b4d8ce9a3ee3ed61a9471f62fb5f05bf9' '2feb023110843acce790e9089e72e9a9503d9fa5' '0107f28f135231da22a9ad5756bb16bd5cada4d5' '25f00a13dccf8e45441265768de46c8bf58e08f6' '032532f91a1d06d0750f16c49a9698ef5374a68f' 'd48696b915527b5bcdd207a299aec03fb037eb17' 'd0ccf760a405d243a49485be0a43bd5b66ed17e2' 'f2b5b8201b1545ef92e050735e9c768010d497aa' 'b5a468199b995bd8ee3c26f169a416a181210c9e'
# bad: [6560005f01c3c14aab4c2ce35d97b75796d33d81] Merge branch 'for-linux-next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
git bisect bad 6560005f01c3c14aab4c2ce35d97b75796d33d81
# bad: [4a2901b5d394f58cdc60bc25e32c381bb2b83891] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git
git bisect bad 4a2901b5d394f58cdc60bc25e32c381bb2b83891
# bad: [4093d34d740447b23a1ea916dabcf902aa767812] Merge branch 'fs-current' of linux-next
git bisect bad 4093d34d740447b23a1ea916dabcf902aa767812
# bad: [0967bf7fbd0e03cee0525035762150a91ba1bb7c] mm: resolve faulty mmap_region() error path behaviour
git bisect bad 0967bf7fbd0e03cee0525035762150a91ba1bb7c
# good: [633e7df6cfdf97f8acf2a59fbfead01e31d0e492] tools: testing: add expand-only mode VMA test
git bisect good 633e7df6cfdf97f8acf2a59fbfead01e31d0e492
# good: [315add1ace71306a7d8518fd417466d938041ff1] mseal: update mseal.rst
git bisect good 315add1ace71306a7d8518fd417466d938041ff1
# good: [bcbb8b25ab80347994e33c358481e65f95f665fd] mm: fix PSWPIN counter for large folios swap-in
git bisect good bcbb8b25ab80347994e33c358481e65f95f665fd
# good: [8438cf67b86bf8c966f32612a7e12b2eb910396b] mm: unconditionally close VMAs on error
git bisect good 8438cf67b86bf8c966f32612a7e12b2eb910396b
# good: [a220e219d89c2d574ad9ffda627575e11334fede] mm: refactor map_deny_write_exec()
git bisect good a220e219d89c2d574ad9ffda627575e11334fede
# first bad commit: [0967bf7fbd0e03cee0525035762150a91ba1bb7c] mm: resolve faulty mmap_region() error path behaviour

--AN/SqrqcdGLKIaZP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcf2A8ACgkQJNaLcl1U
h9Ax4Af/Vm4bnquLf/9D2o7eiOwiYvrtHWp4UiY1AuXoe5f/eJCSwNvhaFpdcUqb
5mV1GuTj7LTJ/eGz/Shd4HLB61WcWrWBiUGa4xPswMJYrUsjpmWhz8M2gW28Hftx
RVT3lBUFm0ggGwW28fmQolEcxlzemFF00our0Mw+DWvic4pdWiG4K7q4Q6NtY+C9
SjOdtYEBuvthbmyrdJkfwePdOnc3k/ZbkDgSsySclvSqIPYWp9C5O3PP/oLyziz9
4IduHyuJ3AeJ6l2xxeXfrXiBxM1CputDNr1O2SqXFB4Dc+Je2LMY/n5UBY/OB2fM
Roib+Pv1dBYudYiThz9RaCpktKZbrQ==
=u0Vu
-----END PGP SIGNATURE-----

--AN/SqrqcdGLKIaZP--

