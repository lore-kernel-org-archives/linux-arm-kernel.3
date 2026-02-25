Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A3FFD3758
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 13:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cB8pFgzoXiS8oHU6id6SFbNWmqF1i7v9+5UxlpFB7KM=; b=X6zE5gKDPnTOlj9K3fg32SjvDA
	Kje+RB1Vzi23Kt7gj1lYnEWIEvjwghre5GnAKu222h4zkiqX+HL19X/Uzwl/fZLEXu5nxy9gsnXTK
	pNqg1U/RvVqgkQMLHr8lZE9lJSAK6miBmlBQ3oKuqQydRm54ngo+YCPwd0Cw/i/gLtlG9DNKv4G+U
	XayO3A54AT0kEOr7j0GHqHRi4F5PCbm8p2qtK4kKv5pofdYY63wskRokZ6kLev1XgIu6C9Er0ICsp
	ZEyEv7NdXQf3iZdaUeUSzQhuT+ehnW61d/9NaiwuU+Jriy8KSsMgSbGdjsSpggBMd1vytX3bqYL3L
	CO7fOCYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvF9T-000000048Jl-3BXG;
	Wed, 25 Feb 2026 13:42:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvF9T-000000048Jb-01Xu;
	Wed, 25 Feb 2026 13:42:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 270E160054;
	Wed, 25 Feb 2026 13:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DEBC116D0;
	Wed, 25 Feb 2026 13:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772026925;
	bh=cB8pFgzoXiS8oHU6id6SFbNWmqF1i7v9+5UxlpFB7KM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m2vjG47lCL8wvzKx95YvT22pf5xmSCGALtEu0Zif9X/qVgX6FyXAVrx2xQaQR8K5K
	 A/CQ9yxXWDjweFRbYO058O8r/Ptf8KJHE+qF0zCdeKX3/H6jCSGjYZ0BTGYQVgb+33
	 JIsp614OS+iz5RwBgGjQ4oHHS8s16Qdzex+kP9BzNksPTzxtIDg3oV6FDzszjVYU4B
	 n+HmJzjFDYo6WnDFnJaO55+ZLeppHFSOVfVXqSsU2VZxYmdQEwg9uZfYyBqmfrQDFt
	 IKUV0Le0vbDepWBg3Ifc1e6twBOiBKmgUcxV4P9p3mMJjzUq7FWIB0x8QOdioC/tvN
	 7YhiVtDgOzRMg==
Date: Wed, 25 Feb 2026 13:41:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH 2/5] arm64: gcs: Use the new common
 vm_mmap_shadow_stack() helper
Message-ID: <39ea6eb6-6ccf-44a3-bfe3-289371f1bacd@sirena.org.uk>
References: <20260224175800.2500729-1-catalin.marinas@arm.com>
 <20260224175800.2500729-3-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V2JcFvgVMXS0vhD6"
Content-Disposition: inline
In-Reply-To: <20260224175800.2500729-3-catalin.marinas@arm.com>
X-Cookie: From concentrate.
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


--V2JcFvgVMXS0vhD6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 24, 2026 at 05:57:54PM +0000, Catalin Marinas wrote:
> Replace the arm64 map_shadow_stack() content with a call to
> vm_mmap_shadow_stack().

Reviewed-by: Mark Brown <broonie@kernel.org>

--V2JcFvgVMXS0vhD6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmme/CYACgkQJNaLcl1U
h9DznQf/bf+eQi22k33fcYOVgTazsrmX2lO+xFNLhmSVp7+6+7mI8vDusST8+kKg
oByJcksziAC4ggsK78oNaSNgD4q0Q0mEkM6EN+JjpbBCdXQAoRHVmmQefxFszg/f
uP5gvKhwwaOLReOUEVwVzvGBADiPzyaBlWzVbhcHdD9eCUqozvAB6REovppOl9Mi
mxRQzSWRRqe84jLyKr2vuFo0IHN5obNOm1E7RDtd65A8kcnCvh4Ke6hry6GGQti3
nwklIHw2icucpQJKqxPMYRNKYQtkZ97b/OagyacEUuI9Os2UkT2u5PFrZ+sHHRFQ
dqNv96YfhwS7LmOLP9GsBkoJAPssIQ==
=EH9v
-----END PGP SIGNATURE-----

--V2JcFvgVMXS0vhD6--

