Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98888FD374D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 12:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9iS9FT8w2uFjhdjn3Pig2ZduZb90FjR9mfonEGVMNk=; b=AYzZP5h5Y2p9fOvGdJezY5+upJ
	7A/kkND2nQFy+BXaRQ6Sl3mZV5nv1aKtg3UEp3ES70dZMT4bib58DKjq0I+M0aiM+Jt+PkdCFTm03
	KbbYMepEM9DUpocp6lRKVfyd9PyxGanAo6p3b9zdF1aEu3HpTi6MLryuzu2K2PqichOuarKkRo6iM
	ITyXCtUiQBhSj6aGrL2fFv7vnNDKmpmQqfvz3KceDrs2Q1AP0OKf8UKov3ysYAN3uyhvzIdonu5tN
	AT1CE/1w97Ac7Ymwb/ML5CB0vFYAsCshIyL7Gh9BWiemsn44SbsHD9/7DpAxe/s9yZxrkTReH+Atc
	Nj64xJJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDxw-00000003zw5-1mQI;
	Wed, 25 Feb 2026 12:26:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDxu-00000003zvi-0LzS;
	Wed, 25 Feb 2026 12:26:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DFE34363E;
	Wed, 25 Feb 2026 12:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF66C116D0;
	Wed, 25 Feb 2026 12:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772022365;
	bh=P0ftlwoh23q0Lh4FmkJJ5DqQfqj0aGSgEZ8NXwd0Ce0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FUwGJh7p2NABh//adJYr1tdRwi3VS6AFWHdQ/v9mfgJK/tw02ZzsStPYSSv3JZ3An
	 tQrNm1eMTvB9eKIxxlDc79+hQjymCtRqZzp35qz4Yt8AOgLtDZuXLPK3Ob8LBN/pcL
	 eVQozb5lMwBxPVenYEIB6BBOeKcHLB84p/RhULLf6KlzWhbhpP8FNGCO3NVvnuM3or
	 7JFqu1DwEd0EQ0C+W5p6YIeEmp40sMONSt1eGB2lpz05oddr13f3STXP17pENJq2ZB
	 /FVIpafk3o3/1zXJLjd8xHTdNk1NI44ne6UPyAhWzA4QVviAZ4g1VYXkuGzlI0PZpU
	 LcQGDcFmVmguQ==
Date: Wed, 25 Feb 2026 12:25:59 +0000
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
Subject: Re: [PATCH 1/5] mm: Introduce vm_mmap_shadow_stack() as a helper for
 VM_SHADOW_STACK mappings
Message-ID: <ba0e7ac0-d8b0-4ef9-904a-4ffa848ece7e@sirena.org.uk>
References: <20260224175800.2500729-1-catalin.marinas@arm.com>
 <20260224175800.2500729-2-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="clnvz1COm0CppSyu"
Content-Disposition: inline
In-Reply-To: <20260224175800.2500729-2-catalin.marinas@arm.com>
X-Cookie: From concentrate.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_042606_145279_ACA49599 
X-CRM114-Status: GOOD (  11.87  )
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


--clnvz1COm0CppSyu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 24, 2026 at 05:57:53PM +0000, Catalin Marinas wrote:
> arm64, riscv and x86 use a similar pattern for mapping the user shadow
> stack (cloned from x86). Extract this into a helper to facilitate code
> reuse.

Thanks for following up on factoring this out.  This looks good to me,
with or without the removal of the ifdefs that Rick suggested:

Reviewed-by: Mark Brown <broonie@kernel.org>

--clnvz1COm0CppSyu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmme6lYACgkQJNaLcl1U
h9C4gwf/eFxvG4xPkghLEHqpiQ4wKW3cqYV+F74MYRNm1tU/f1bLF0VsMCM8R5w2
tS3AReZEZKC8Dp5vv0jk4YaZ5AmbqrIHf0vE8Ek7/UwvNtPofCrb0/ORQA43Zl6K
N49WFkNMxs/rmMjWkGIUKbDQfIM8vHdUbBtWaMPHhdX5gaAc3iOIzi2qRoCADfKt
lCO74lt9+bT1X88SaLykSwNL0d8DVC5kbW/9/fEgYCq1asUMh5fX9emJXAHwbqsi
P1qNiMLg0rX4EJN0AVFVDxhjrj5zTGdQGI2Jqhfbekw6nRG+Yp1S0DX8YlCCgu1Q
a2G0TDSF0uz8zqxnhtkgyWhi5apLDg==
=Ev+O
-----END PGP SIGNATURE-----

--clnvz1COm0CppSyu--

