Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E61CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 14:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FeHS+tJrW9ZraKAp3dY5aFZJX+0uhfMK5f0hPXIAq/A=; b=ZmzCmjmvFEC+XrKDrGeIDNwNCS
	ZAD6RroscpzncWCNrRqZjIHgFy9uL9omMAns8o0DMTORuFqFifDmc8I87EctM+qvKibiz5xOknjZq
	erPQ8KvsKkYCdlOOFh9mqyXcHNpXssBnwrfv5yfRuWnIa9wtRQoh621Vwbaf+oSMcr++e+j0MDS2N
	7a8/uAETG2lc0X2+vaHhF5pvSd9APNueeQZBYkuN9Z2T8mKtYoqpgZgAMhjJ942HBamkXj3YiS0W/
	TMe4zYS0mhfraKc7ZNbT6wqeyT3/TuZszi4udv5VQrpaXcjcXeznPdoQmQEzyGMDCQWsEXlJw5Vby
	QenK2AwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYff-00000008MIc-156F;
	Mon, 25 Aug 2025 14:59:43 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWuB-000000082vP-4B4M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 13:06:37 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b49b56a3f27so2251480a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 06:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756127195; x=1756731995; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FeHS+tJrW9ZraKAp3dY5aFZJX+0uhfMK5f0hPXIAq/A=;
        b=POVh7jww8KkOnn5r4w/Ot5snEP5hajWv6K7slv8LRramqoHIapFrdh9ezo9G52flDt
         7ZF5lqzO71rgSdG4chPalyKbKMSARJhrYszkLCzqNNaG84A/22WmNvLEtkO3QqcakLrX
         HhVGrKK1Ehk2E5v1jUQZatKizQws2Kx/zXiZTm5CECyA2HCic7EkyHR2aU6Hn0d+QfDq
         1orf96DSEp89ZsA2l/xqqY1DnZSzQYOnuzWAsu4F5aBzO3HdLBUJssg0r8+YQuSSDbOm
         hQUZ0Ux1C9baDQDG8EFvBbPDvlyH13+pscQTdMjozZmajKMgR7NO/oEtkE9fC4lZ0/nb
         eWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756127195; x=1756731995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FeHS+tJrW9ZraKAp3dY5aFZJX+0uhfMK5f0hPXIAq/A=;
        b=DZaVLgo9hqNpfEqPlGexB77i9pCFuvvE0wLFEgn4eNZlH/+MONMa0RO9/xnX3SKvbi
         DlN5c8zD3Ef9X8g2fxkpUqpOs3m0USWOt4uCgfJDYiEgIb2ntzj0/+zxl7gAfwQBUrG3
         PsJwU/bRbmByHcX3L47fg6047gfUMXktDUJ81/C85Yj1uDcncUQawQZWHWir46BXsanh
         vM8wpb9BqHCMulICMeuxRYLn7vJxSTEVxSZW5gg5zRMkV2bSobhTk7oO801InGtqR1YG
         cW8aFTWSGtv4fRViUp5ueLgakY5MCHvlkcHB6IXFJfSJgQli9x/KbOE/w1GE47eZbtcw
         52OA==
X-Forwarded-Encrypted: i=1; AJvYcCVmMEgqn7Rf9gsUPL+RyHMkzwxUNvdenzhrJbdB+8BQJdAmoM5aF5sVqZi2VqYBQD817PXzYzFkJ2I+aosU9oit@lists.infradead.org
X-Gm-Message-State: AOJu0YzSD970osHSBuGQyXxVD5BR9fmfkLhLE5XCupwal5xkltlBQvwj
	KoY2jWnGOrR5dyaKWv30fUUAuCI0qijf1Lk/6cxQZggvxODXoaVlaYCO
X-Gm-Gg: ASbGncv7gP1z668dJgDhKiGUDEL1DVXl5JnBmjeOqADLOQB4RYvlt4lLyCbq1XqPys4
	1Dqz7h6G5YwFDoVk2SfB+3mf0xJ3oTjGWfN4OtBOo50l/k8ooa1xZh4bdL5FVA4gLMxXNCvWf5U
	67vzwKCVJgvFsQODucxBPCmORtJ+BILtW6w3ZdG4Dw4QF9mR1s1LyZSRZtFxv+OwC4o+nJycPbT
	FDIMHu1HlvBwnVOCDIMzm5FXe19jVuE4bw5BqHWq2KgB+eNCoDVTq3wYDBBpeBun1KQ0nYVNzB5
	F9u68/RdyM7R/PiUA4qlexNreLTwkGsJ3zLEd7RkRIRY2P7iqEAuEmIuBuUMd4aWQ0F/yCduGgU
	5sBAn2oH1u3MY/cEBDsfuLTU0MkVoc1vqpsIgIvwHg6E=
X-Google-Smtp-Source: AGHT+IFsrdGj5ONohaBrEbHATvRUaAGYnpkIopiRoXVCgitKhuXtw0IQV0Dnk+CfztUMDHaeXeFWDA==
X-Received: by 2002:a17:902:cec2:b0:236:9726:7264 with SMTP id d9443c01a7336-2462edc37a2mr180907925ad.5.1756127194436;
        Mon, 25 Aug 2025 06:06:34 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466886122dsm68847975ad.101.2025.08.25.06.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 06:06:32 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 599494020B61; Mon, 25 Aug 2025 20:06:30 +0700 (WIB)
Date: Mon, 25 Aug 2025 20:06:29 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Eric Biggers <ebiggers@google.com>, Mark Brown <broonie@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] selftests/arm64: Fix typos in malloc return value check
Message-ID: <aKxf1X1u8QHAdvqW@archie.me>
References: <20250824131647.490439-1-zlatistiv@gmail.com>
 <ed07c6f9-e389-4387-8585-6f1206da1a07@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fIO8M9lhbFK9DNqg"
Content-Disposition: inline
In-Reply-To: <ed07c6f9-e389-4387-8585-6f1206da1a07@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_060636_052043_4B31B3DA 
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


--fIO8M9lhbFK9DNqg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 24, 2025 at 03:40:44PM +0200, Markus Elfring wrote:
> > Fix double "-ed" in malloc return value check
>=20
> Refine wordings in error message string literals?
>=20

I think what the patch author (Nikola) intends is "The error messages' word=
ing
use parallel structure device, where the second verb should've been in
infinitives form. Correct it."

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--fIO8M9lhbFK9DNqg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaKxfzwAKCRD2uYlJVVFO
o0qZAQDaefbC0aa64Pk+TLexCY84I8KwjJWmZwptmBm5h9RRqQD/U/dm64bgsWdS
gKnKPBGmuJkji24s6mH1W1FT1SvNzQQ=
=EI4L
-----END PGP SIGNATURE-----

--fIO8M9lhbFK9DNqg--

