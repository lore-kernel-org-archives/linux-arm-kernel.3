Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F58CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 07:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HOxQeFzZprgS340iSyl+E8y8vVH7kK0gqo8lCK0SDQ=; b=LIuuZNShOWv2/5iE2CnQnDStWg
	7JC8mkIsWVLj+BODlKD2BrfqXY2TBrMdpe/rzW/xg9t22FoafRye/QKiz01HkhoTgAKB6Utq6mP55
	rweAJrrsGByQNgprHtWxxkyUp2V9MNy09gIoI9ViJQGajXfovKf38LvS9q1Ntw2MRjv4l011BTAq+
	TMq8x3E+flEtJC8nzQ6RLsslb/KwqwKLn/ND4jWQOKEU0DbgjUPGj+3LySlvU8SO8gIAb2fNt+Tm3
	b/yqWWanizh9tP+Dh5WfsU2Eo6VcEDywcB7sV2tf5gciuFA1bAoTMO7V/QM3JZ2GAa4ENkehiCl9b
	RCSIg4ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjzy-0000000C8zR-0FF1;
	Mon, 20 Oct 2025 07:08:06 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjzv-0000000C8yl-1T8c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 07:08:04 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-339d53f4960so4063466a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 00:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760944082; x=1761548882; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/HOxQeFzZprgS340iSyl+E8y8vVH7kK0gqo8lCK0SDQ=;
        b=cRV0XTksrk//rHQ9Buz+wVrqTRenYQkgKOG/BZpwL21wPd37DasKJFf6beEFgPTab9
         1psQ6P1pUMVOmXRxswc+cPMcUFqTNaKM+nrI2mZ0S7CRd3oaJYvxaw4T7QBqfRyh2wfQ
         02lJ2v975J1fFRJtqx2Gv5r1X/DLxV919WoLx8d2Nh2bQDA1UMx6vPX+0tI9gzb5zCUc
         oyoPsitiXuCbP6EkzkpqJIyVm00Zjpp0VfS4DAbgRsDr+i9K9PiZvDEZa7eexodynHqr
         fE/ULcaMmGJbgzogbrP7JVFgmKuN4ZQqFHC79BeciZSmrNsu/GN7hbgW0NhM0jzK1oLn
         /roA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760944082; x=1761548882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HOxQeFzZprgS340iSyl+E8y8vVH7kK0gqo8lCK0SDQ=;
        b=F5HXSFOgTSyAJviagRCxZ2d34S5S/lA1W4URg9eYr0e4ZKEZ6CyQiLZQCtYjC3JrNO
         a2SNUPgK7VMcRrPcOFPDU7UH/vPfupzAi/dxnXoP8WeSXWa6CgpUKYQbiEZQf93tf/wL
         teuP0Gvcd0e9qoS16+7zLnd5tyt8mUR2/QJAkk1LV5IDAA0bhtf31JQMFhFnlWeutiZe
         z1jqj4acqGaNZNs3IIAcxy2rIrn9QqyXb1aw33po4C+sTAJEkpPQWfgqkcmZs1h9B53B
         UvdRiGNvKJVG/UgK2AvOSdvExbbeMq0FOntlsM+LsQJb6VW9qO73TP+93BjNjU/piVFL
         hphA==
X-Forwarded-Encrypted: i=1; AJvYcCX8wZWSOn44SP4btBohGvmERzkEGcKqMIK3kW0fNUWurmmfQJHFZRXEI8yS0HAWm1XJ6Rg0kXpVxte7ULcB4aAX@lists.infradead.org
X-Gm-Message-State: AOJu0YzM+gI5EwW4AzC7cm3Fn196BABOjX9HFiotpL0d6cx/U+nS8OrG
	FOwTCPYDYfNcZwi1OX9fMSZ5B7dfs/GC7CbVfNYR0lqZxMDrisBuOOaH
X-Gm-Gg: ASbGncvyFYMgdwyDkbNc38YHTnvrLI+yxKjMfB/AZ7Z4HRy4gqc6FlvmotbwXgMdSCd
	SmKfI1BmdfRFm4MYVpkrrTHkeEBYMyoZOHDAsedRSMPCkPBZIFerB091m749Il7ygahDf/hK9hg
	1r9LNdo3Az9BUeebkiziu9WcxO4U7cfFcVqSVYVd+7dzDDVEXwNrSIx/fUSVjTFCjxsq6mH+B28
	uLYdS2LOfnPBvg/nxfBhDNtlmR0ecpP3gZWpItpEZZDBp/BNfUuq9ts2p6fe901XSsK2y0CION0
	jPiwX2lWJxNp+OATcNUs+zDN/X3OrPp3+jebLjB1Q3sBh+p5O6TXZ0qZjaZhYoasQpCdVQyJKdt
	RxzaoxqxQw2eOKcs7dcoRCFQi1wNJDh8Oau45xLFpIzwA8X/wEYlUWaffrScdwEZA0r1D+Xh9FO
	PtxLU=
X-Google-Smtp-Source: AGHT+IEQ5375x2wAPSKC6RY36q65Xq6o1ABPfooltKbLM5TnVL2vpALRNQnKbvej+kaD3bTB+gwZ+Q==
X-Received: by 2002:a17:90b:4b0f:b0:32e:8c14:5cd2 with SMTP id 98e67ed59e1d1-33bcf8faac8mr15518129a91.28.1760944081925;
        Mon, 20 Oct 2025 00:08:01 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5deae553sm7219872a91.21.2025.10.20.00.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:08:00 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 123104241816; Mon, 20 Oct 2025 14:07:57 +0700 (WIB)
Date: Mon, 20 Oct 2025 14:07:57 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Stephan Mueller <smueller@chronox.de>
Subject: Re: [PATCH 03/17] lib/crypto: Add SHA3-224, SHA3-256, SHA3-384,
 SHA3-512, SHAKE128, SHAKE256
Message-ID: <aPXfzd0KBNg-MjXi@archie.me>
References: <20251020005038.661542-1-ebiggers@kernel.org>
 <20251020005038.661542-4-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bwyeZRG0SF5QekIi"
Content-Disposition: inline
In-Reply-To: <20251020005038.661542-4-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_000803_393958_49805B2A 
X-CRM114-Status: GOOD (  15.19  )
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


--bwyeZRG0SF5QekIi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 19, 2025 at 05:50:24PM -0700, Eric Biggers wrote:
> +The SHA-3 algorithm base, as specified in NIST FIPS-202[1], provides a n=
umber
> +of specific variants all based on the same basic algorithm (the Keccak s=
ponge
> +function and permutation).  The differences between them are: the "rate"=
 (how
> +much of the common state buffer gets updated with new data between invoc=
ations

Use reST footnotes, like:

---- >8 ----
diff --git a/Documentation/crypto/sha3.rst b/Documentation/crypto/sha3.rst
index c27da98c89b7f8..ae1fd3e01e34c2 100644
--- a/Documentation/crypto/sha3.rst
+++ b/Documentation/crypto/sha3.rst
@@ -18,7 +18,7 @@ SHA-3 Algorithm collection
 Overview
 =3D=3D=3D=3D=3D=3D=3D=3D
=20
-The SHA-3 algorithm base, as specified in NIST FIPS-202[1], provides a num=
ber
+The SHA-3 algorithm base, as specified in NIST FIPS-202 [1]_, provides a n=
umber
 of specific variants all based on the same basic algorithm (the Keccak spo=
nge
 function and permutation).  The differences between them are: the "rate" (=
how
 much of the common state buffer gets updated with new data between invocat=
ions
@@ -136,7 +136,7 @@ should use the much more comprehensive KUnit test suite=
 instead.
 References
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-[1] https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.202.pdf
+.. [1] https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.202.pdf
=20
=20
=20
> +If selectable algorithms are required then the crypto_hash API may be us=
ed
> +instead as this binds each algorithm to a specific C type.

What is crypto_hash API then? I can't find any of its documentation beside
being mentioned here.

--=20
An old man doll... just what I always wanted! - Clara

--bwyeZRG0SF5QekIi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaPXfxAAKCRD2uYlJVVFO
o3A4AP9bdkVnmtIfCagfxHcW5eGHSyGy7zxDqFUTIe8b2dhvVAD+KVzQDxqnujqm
eYhwNKRJG53xvL9m37FLDKGqqZLtLw0=
=VJti
-----END PGP SIGNATURE-----

--bwyeZRG0SF5QekIi--

