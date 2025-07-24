Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5C3C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 18:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3JToIF83QS9jhKHoFkEEmiC2l54rS9rPeDNt8GAcq7s=; b=cuLk5UDw5Q1r8ZLezkguopmCrS
	dmvJvCb+GVTXMxyWURbRwKEonCVL7YpESC+cEdSU7KH9Pg5PuDW4xOYkrrcbLaXstFBQ9tN4TvpjF
	0aoicMN3ybV2/wdzsVD32zUe9cAXCyJOLWjb5QdG6x6Qm81vAodp9g8srKMOQkrpm+6eJNqv7l/7f
	TtKbWsKm/omg28SmQhvKNRCztSteAFOeBzbSdaBdBTxWR6Z4iHFiG0KXOJ447j5u3c5NH4uq/qgu/
	8Sxa20/2D1L9hGtJgYRRi51Y1G3Q7qDVyBhI6uLuYcVTl7pgix2IawMOetxhe9BN75p2vM46QMFPq
	si+LNnEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf0ln-00000008D1z-24gZ;
	Thu, 24 Jul 2025 18:34:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezKC-000000082ZW-1v83
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 17:01:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 84E6F601D5;
	Thu, 24 Jul 2025 17:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEE8C4CEED;
	Thu, 24 Jul 2025 17:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753376503;
	bh=hmbP0QQTz5tEu2Ah74mZzpxPXVcjiUnxRzSHt+ipYEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bmD8nzHSLbR6DydqTt3VzCI9LEO1iBSATrIZGYy/7bmbmHARkqPJrC2p6QhoGEkf2
	 Qb/BIMlJOHvKl32m5v64vhdNblFThzFbKZM9VguJkvgQyZwvylelOdNTCxwLSfSNts
	 QfxYlRTq/fYqF7IMHyh4kHESKNBypTLC6eePhphhhyz7ZW+j6oE24BRWzwo+acFLl7
	 15RA7yCu6D7yQHIDblgWqHXuLW6MNBbPlyJZCNNYVB8DO9mEOsI1Hsq0BDTkzkLdSm
	 /xhmgq8/u3KWgTxcr3QgaHBHyjD8F6g4fFzKnCEY1dHfiNMr9RPF4ECtUCCRuFbADy
	 tZxyXwqic2jxg==
Date: Thu, 24 Jul 2025 18:01:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jeremy Linton <jeremy.linton@arm.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org,
	oleg@redhat.com, peterz@infradead.org, acme@kernel.org,
	namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, thiago.bauermann@linaro.org,
	yury.khrustalev@arm.com, kristina.martsenko@arm.com,
	liaochang1@huawei.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/8] arm64: uaccess: Add additional userspace GCS
 accessors
Message-ID: <2f776bd9-1b18-492d-afa0-94af5585f4f2@sirena.org.uk>
References: <20250719043740.4548-1-jeremy.linton@arm.com>
 <20250719043740.4548-5-jeremy.linton@arm.com>
 <aICwaQZxK5Spjj8G@arm.com>
 <2a6e1c4b-e8b0-49e2-896c-65c55103b017@arm.com>
 <aIHBQl9V0rMM1pjY@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p7mXyxgtij9d66+x"
Content-Disposition: inline
In-Reply-To: <aIHBQl9V0rMM1pjY@arm.com>
X-Cookie: Did I say 2?  I lied.
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


--p7mXyxgtij9d66+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 24, 2025 at 06:14:42AM +0100, Catalin Marinas wrote:
> On Wed, Jul 23, 2025 at 12:14:17PM -0500, Jeremy Linton wrote:

> > Hence the comment to remind people that this routine isn't assuring the page
> > is correctly marked.

> I think the comment on the load function doesn't make much difference
> since LDR is permitted on an GCS page anyway. It's the pop function that
> we actually emulate without proper GCS instructions that's more
> problematic and won't be checked against actual GCS permissions.

This is used in the emulation of RET where it results in a similar lack
of a permission check - that does:

+       if (task_gcs_el0_enabled(current)) {
+               gcspr = read_sysreg_s(SYS_GCSPR_EL0);
+               gcs_ret_vaddr = load_user_gcs((unsigned long __user *)gcspr, &err);

When implemented by the hardware we would generate a fault if the
address we're loading from is not in a page with GCS permissions.  The
issue isn't that userspace wouldn't be permitted to read the value, the
issue is that we are not checking that the value is being read from a
page with GCS permissions.

--p7mXyxgtij9d66+x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiCZu8ACgkQJNaLcl1U
h9DlJQf/bZkySnCjsBKlHrkQ7LgdbiWlzRH3L43bJyunuKxDqwI38a2Vh4qmGZM8
bldlwsd/XNnUv5JXtc/U9+P4BJfVkmcDY1wY/FpxEKfSE2UAItV1j3e/OGz+d+iQ
lcDUYn4asBJFCpba2QhIMvgPIFgKJuVQvQCTBxsIsubOesDU9C8w/xQuALkmhVD5
ZHdnIJpeDpR2aNc86Db/yOhkjKrxGelb0H9YGWfjnMpW/ra1Rdo7jwmfNFX7YOhU
C+sVhOFrIljz32Cp/EWOSv25To7MmosIbIBZ+O4WDvgmsDO66GCdeaWwevaBfYLT
YGYZe5Wu0LA7AeLcmyBhHJdG8/uhJQ==
=ZBjO
-----END PGP SIGNATURE-----

--p7mXyxgtij9d66+x--

