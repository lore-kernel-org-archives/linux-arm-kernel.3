Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E09BC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 15:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zG0Aq0dm5zd6tPL905oAGCXNUFTWV4Fg6wvO8nA9YtM=; b=eeG9ib8hICAco3/R22LZTYlEqb
	bM0UOYgPF59eMw2QuTGDEdZ72tLC9bRcXtreWVDkkCaqst/k1wRvSASXDvCT8PqBpF9lv0Y0iVKsN
	C1PjMnFwPmMGQQMfVeRXQ4Q4khBd7bCOHKCifSFIHpq/MhMb/3cb0+91CfBGxqHzEzfC9z2LsZ63I
	jIm3xjYCUUnl3GpbRCeMzBdK8TRS3KO00O6aqFaerxdnXqT5TPKBKmJ4CeEZj0KduvcWYBkiMY2yC
	Y8cJDRBSOT/JFO6ktG9Mr6rDLTjENWSz/CnjxQRsAaFe8CynTpTFtRUyuWWFogCdLb/9qNuLW/6Jo
	FBxdEkwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUmB-00000004Jz8-47ah;
	Fri, 23 May 2025 15:57:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIURT-00000004Gf7-3GvB;
	Fri, 23 May 2025 15:36:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CF3A1629CD;
	Fri, 23 May 2025 15:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B096CC4CEE9;
	Fri, 23 May 2025 15:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748014574;
	bh=zG0Aq0dm5zd6tPL905oAGCXNUFTWV4Fg6wvO8nA9YtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CjwldArLZVywmL4BtfM9pLrYXkohqEPLLnBQyNP7xfBRFsSzTxTxvrtEaGOep4K7h
	 vZ0k4IlP/x9We6ehTYweyWo2At6E9I1IMrjAwSlUHiEL7Ru/R5yQRAzYqUXxXKlgDN
	 KT98/Ef487LHmYrzwFvHZ4Gtw/y7nigDdaeHZLrFdj3+91C8P1bkIVdrKrSHkysQVQ
	 UXa1YcDU6f10xJNpSegcoSTbuxW4SdAPPk86AOv5uaFfqKgDiwPykkzdKkmEKboTQy
	 l9EMFcVTWjMceFxINNpuVIa9nLdGHG6jg10RAtB+lnucCV5vPUsGDP2bug5aJ+QEVB
	 pyj3DMaJpVIqA==
Date: Fri, 23 May 2025 16:36:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Beeman Strong <beeman@rivosinc.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 7/7] dt-bindings: riscv: add Sxctr ISA extension
 description
Message-ID: <20250523-ducky-unlisted-5764ad0f698a@spud>
References: <20250523-b4-ctr_upstream_v3-v3-0-ad355304ba1c@rivosinc.com>
 <20250523-b4-ctr_upstream_v3-v3-7-ad355304ba1c@rivosinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YsbMlZlsa7BrXpPT"
Content-Disposition: inline
In-Reply-To: <20250523-b4-ctr_upstream_v3-v3-7-ad355304ba1c@rivosinc.com>
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


--YsbMlZlsa7BrXpPT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 12:25:13AM +0100, Rajnesh Kanwal wrote:
> Add the S[m|s]ctr ISA extension description.
>=20
> Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--YsbMlZlsa7BrXpPT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDCV5wAKCRB4tDGHoIJi
0pfsAQCC0vFE1gQIjvjVO3vjHghEg/7zH3pwUyTcP2hPYZcZSAEAjizdb5MtEvdc
ne55YWgcjHCCab8vDuJrO0B3c+3OXwg=
=xhJF
-----END PGP SIGNATURE-----

--YsbMlZlsa7BrXpPT--

