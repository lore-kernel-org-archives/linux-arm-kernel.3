Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83675E7E37F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 11:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hlI1RBQqJjfpWuFZsCc6c4R0ASQxP62EyBGuIa0hpOs=; b=yA1Gk69V/FTEVGTHTUgJOa5eGh
	P/rtY37dF8BESplQE+gX7XC49utnqR+VCd1cGaLz30G30La95hs1DutDUWvaSjenhR2qJ6XW7h6Af
	NZAWTtjhxZkvglAy2BIoomRCoGbSDVa56/mUgdxgGvz4MWe1S8NEv4pCLJd9xjZMpUoUXVJQcOyN9
	lJwPEFNr29XTbXFefmCSOFf72roQXgoZ0iPu3gJtxcy2KcNOR4ekg1nIjzBYF+otx7knUFfMpAAPq
	hnA6/FLLVLJAwjSg1NZl/LlDgV02r0f4TbaQNoZzzm+/tnOl+mNS/JIh+lr3E3qMMXDdDb+Tb0UIQ
	27MeGEPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8d96-00000001z4s-01y6;
	Fri, 03 Apr 2026 11:57:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8d94-00000001z4f-2LIi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 11:57:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 975CF60121;
	Fri,  3 Apr 2026 11:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F48C4CEF7;
	Fri,  3 Apr 2026 11:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775217421;
	bh=hlI1RBQqJjfpWuFZsCc6c4R0ASQxP62EyBGuIa0hpOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WExiF/lER3/HxYWRZ7/VYGGhEbpEpz9xoEPNjcsCFvTGNpufubq1/grWFEw4iuMUy
	 OoXV5ZN9cvTpw+MrimzFf6s9HmUgEebMHP6rxEPoVqpOak+AAKYreCCI+aI8f5Gcf8
	 zd3TXBgf41BbeUDYgDIMBFsxjCPG+plKws+G4eTYF97BpuDvffRy9f5yT7XQBVGQbe
	 XqHjaEsIVjnSBX+EIpGZbUC6lXfkWCjygMqGuZgL2M9uFpPhtTcBQ2hiVkdvbT8xp0
	 yn+PYHPMRpNNVo0RArrBjXz2Wp47lKN2V/BGSRUsMLv3YU6gYJZRfQsOsmZPjmN+O6
	 y2sPDI66WCWpQ==
Date: Fri, 3 Apr 2026 12:56:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Robin Murphy <robin.murphy@arm.com>,
	Leon Romanovsky <leon@kernel.org>,
	Paul Burton <paul.burton@mips.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Eric Dumazet <edumazet@google.com>, Toshi Kani <toshi.kani@hp.com>,
	Christoph Hellwig <hch@lst.de>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Johan Hovold <johan@kernel.org>, ardb@kernel.org,
	catalin.marinas@arm.com, chleroy@kernel.org, david@kernel.org,
	driver-core@lists.linux.dev, kees@kernel.org, kevin.brodsky@arm.com,
	lenb@kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, maz@kernel.org,
	miko.lenczewski@arm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	osalvador@suse.de, oupton@kernel.org, peterz@infradead.org,
	tglx@kernel.org, will@kernel.org, yangyicong@hisilicon.com,
	yeoreum.yun@arm.com
Subject: Re: [PATCH v3 9/9] driver core: Replace dev->offline +
 ->offline_disabled with DEV_FLAGs
Message-ID: <57452867-60be-4292-9bc5-4e2faf1f3cb4@sirena.org.uk>
References: <20260403005005.30424-1-dianders@chromium.org>
 <20260402174925.v3.9.I897d478b4a9361d79cd5073207c1062fd4d0d0e4@changeid>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AVRN0JUTTuR+6v5a"
Content-Disposition: inline
In-Reply-To: <20260402174925.v3.9.I897d478b4a9361d79cd5073207c1062fd4d0d0e4@changeid>
X-Cookie: The Korean War must have been fun.
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


--AVRN0JUTTuR+6v5a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 02, 2026 at 05:49:55PM -0700, Douglas Anderson wrote:
> In C, bitfields are not necessarily safe to modify from multiple
> threads without locking. Switch "offline" and "offline_disabled" over
> to the "flags" field so modifications are safe.

Acked-by: Mark Brown <broonie@kernel.org>

--AVRN0JUTTuR+6v5a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnPqwIACgkQJNaLcl1U
h9DTzAf+NmJvooER0KUGxju0cXbQLPzjhe+zmzezOQJa1zXjXfgBycnhieaqK7ny
S+ZKb3sGXOFz1uf62w0rkTigz6ZBhVej2811kP/v6hOK59NgZZTJQfO8dQuSxEnT
a/yLND6ngy2gm9svEKalKOxPy9JbUJjkq+j/fHmoGQtgZJzi3MQgf8Dj9JD9Hi9K
CfKa+1VEAm39ijM8hfGOPXIHopw7PmdFfwGHkxLjmh4CRnWEhvWLFCPR+FiBQ0Sn
XrkEJ4xDFRK5m2nxMzIK4mnPEH5oNBFredP+/WQ/ak8W69Tqy7XcVG1E5yZLgzci
4Y9/xe7D3PUt6PvteNaqZANk/e1zpA==
=qXM/
-----END PGP SIGNATURE-----

--AVRN0JUTTuR+6v5a--

