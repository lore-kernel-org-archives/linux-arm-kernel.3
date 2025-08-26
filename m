Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D42CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 00:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHFuIXiNmbEkoVbj8VOYF+pRey/xF5VfytxKQHW/a30=; b=hkiCs8QUOz2Jk4mLWlzF3mpLSi
	+S282uufhfjejf+yQnRjEi4nSeE1Gvzs04T6ib4gzoR7spMeqiix8xMBunfJNhf6DiyoxPyr5l45p
	ucERcS3jc/Bn539h3g1xwZ0tLT+Pe/Cy7LFXE+CGE8lMsQg7jpq91+3qp1cODqy8ghwNY2LM6gWGI
	hdBj+goBftIqOTMk8d0pQa3n2LFrXiFt/zotRwFI5gZpCeeyMPVENIsTw4QplUKEW+4QX5fpQlBpk
	QjVfR+mV1tls+M2wJEJTk7Htj/V6SgGoZ1Cq2Gdy84UCotly8IGb+A22E3JMD4s+9jtYFYCeEejR3
	l9/GWywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqhAH-0000000AAPk-2VIX;
	Tue, 26 Aug 2025 00:03:53 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqh7Y-0000000AA8A-0fiF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 00:01:05 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-24458272c00so58318565ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 17:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756166463; x=1756771263; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mHFuIXiNmbEkoVbj8VOYF+pRey/xF5VfytxKQHW/a30=;
        b=ZyylFaSpMpdlEBQ850VZQQX1RXtsasifDw4NScWZaAkmSw28dQOEnBLeyjBZPi2dyM
         G5ziPFF5wiHCDWf/KUReO88Jj8TfmgF4D2yJTzcHbStffZtnL16mFBbDx+PnHIP5LL85
         n4282NpSvTDHUQ+ISK1fWSsH0CUSeGxIoJkqumxh4VP4vVm5SEny3oDOzP9U50ZOIezj
         mdrWTFnumrPyk39/wkEZdqjNZIob4gQPH7NQsVvl84XKKg+oM9pENJaXQSAdmmseFD9k
         v59lN42ZUwOh6i8XTkm+jEUbNAQo3pcjhs6iVqJud5y8xa+/Hro6Sn1zcQQ7mlMOTShb
         TaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756166463; x=1756771263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHFuIXiNmbEkoVbj8VOYF+pRey/xF5VfytxKQHW/a30=;
        b=Q6wrqJAxWdPUaSM27DcmLlwvnvwIhXgUha0tORk55Hf3RUWwrsmOCLc8tE7Or8cND4
         3z/Zg371aHRgxeZQtTsppl+Ex+ks6z49BZYgDtL2RBuzrs6DurbvZYsqufhi9Pw+5058
         hwGBTsqSRrhCH6T1ILpaOkR/B6pd7UqYRLP9s7IfFp8jpESuT8rVvvbqH2OZhx8H5bzJ
         JtBc5Dkhw6NXZe7+wJNZOQvRlnnurDDjJFlleClkiCficYx4UYUOvblSxkKrnjJv0ta+
         SnJ5KMEGINrMlOVWgwk6q91WzyJvy43SqosKWrPrTz6B0yeegACEDfSe9QpBe8HKMkj6
         X0AA==
X-Forwarded-Encrypted: i=1; AJvYcCU81Q4oLGUgO3EcjgQQFs2WIPReCgvrPOgWtM/8fNVdXaTh6GYHPUlp2MzxQ4OU7Sm0SsdanELWs3Ehd/zZyP9v@lists.infradead.org
X-Gm-Message-State: AOJu0YwGmbMNxoPBpx93htOw8WOUxnea2vYQlOIqsJDLBS7eaPj2pZPF
	Y4ODHjr/IO4gtL9FX2CS54R04D4b7c1JfpC1DliafQKvWXmxcx4DVTTN
X-Gm-Gg: ASbGncumbH8DYFAb7RFRsZFqmauSynvQ/fHBOyhyqt/jR2Wa9fsLdmEWBHehyafc4T9
	Jb7aERwacNDT6IrbfP63Jagw/04pvaE/CTd3177bVyJhXB3U1R/k4WqigqCjpilJYZpEPRMJHNN
	xL0Sn1I2IH5c984bxS+aX7y+1dyBUmgjz//uy/lMLId3C5/zA4HxjEkItmC5JfK0wyo6rYJBp4W
	igJMNoqXC+aF9YZaRw4OCMywkDx5cepYa6gB5W61YUk8j62QgMpRtR9kMQBFzSAjqmZZL2BAkbt
	Ey6AtSo6d20UYHwmFJHymt6jDjAhXRLYUi8ipxwI8Jt+sTgGOfx5Pw7fdZ6fH0t6wPaUmS6/Dzy
	t7rk4JhitRFJudoh4+1m8sQ==
X-Google-Smtp-Source: AGHT+IFKcbvwi0kAjgdjFjeLliZLzfUxsoGc6FLH2aqpXBw/4v6OLvxDvjNLeydrT6uV6iibMapBlg==
X-Received: by 2002:a17:902:c40f:b0:244:99aa:54a1 with SMTP id d9443c01a7336-2462ee0b77emr192667065ad.7.1756166463145;
        Mon, 25 Aug 2025 17:01:03 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2467e3238fasm70835275ad.104.2025.08.25.17.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 17:01:02 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 940E6424E25B; Tue, 26 Aug 2025 07:01:00 +0700 (WIB)
Date: Tue, 26 Aug 2025 07:01:00 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Eric Biggers <ebiggers@google.com>, Mark Brown <broonie@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] selftests/arm64: Fix typos in malloc return value check
Message-ID: <aKz5PJev5HwYcs09@archie.me>
References: <20250824131647.490439-1-zlatistiv@gmail.com>
 <ed07c6f9-e389-4387-8585-6f1206da1a07@web.de>
 <aKxf1X1u8QHAdvqW@archie.me>
 <u4bv3ypqrdaz5klrvs57ptp7tu25etf7xzvoytrgnz2xohiysj@vua5mcbpznio>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1viLhCQliFWdXD/L"
Content-Disposition: inline
In-Reply-To: <u4bv3ypqrdaz5klrvs57ptp7tu25etf7xzvoytrgnz2xohiysj@vua5mcbpznio>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_170104_204263_381AE360 
X-CRM114-Status: GOOD (  17.55  )
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


--1viLhCQliFWdXD/L
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 06:44:23PM +0300, Nikola Z. Ivanov wrote:
> On Mon, Aug 25, 2025 at 08:06:29PM +0700, Bagas Sanjaya wrote:
> > On Sun, Aug 24, 2025 at 03:40:44PM +0200, Markus Elfring wrote:
> > > > Fix double "-ed" in malloc return value check
> > >=20
> > > Refine wordings in error message string literals?
> > >=20
> >=20
> > I think what the patch author (Nikola) intends is "The error messages' =
wording
> > use parallel structure device, where the second verb should've been in
> > infinitives form. Correct it."
> >=20
> > Thanks.
> >=20
> > --=20
> > An old man doll... just what I always wanted! - Clara
>=20
> Thanks, I did not expect to get schooled like this (in a good way of
> course). Should I send v2?

Sure.

--=20
An old man doll... just what I always wanted! - Clara

--1viLhCQliFWdXD/L
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaKz5PAAKCRD2uYlJVVFO
ozARAP920T/0c5L0WMnc2FkxNDSA5EjC8NhZPcRc40EQJvrbNwD/ayi0OlIl/02c
o5bAFcYS6XvDl8io8108nSUee23LSws=
=iJfj
-----END PGP SIGNATURE-----

--1viLhCQliFWdXD/L--

