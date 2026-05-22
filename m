Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26484CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 19:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzI3ngdD17nd9oUvnoIHtzlnEtfXOINJERrYeNFi9Y0=; b=2iMvTlM1UWd13V7yozI+Z8LzDq
	SHoHtmyj6SWGR+dPU7fybvYjxWYB8dgSYdu9OdtaZUBvlI6hoXgsUbocERklApV1fNXE4Nwd/J6lw
	romhUpIR0Ggx4s9ou2Df8uWiJDiZFNo3F6VuYLk7UHehqUcG6uQfH2/ZsjrKZqiFLARzfxDNDAbQt
	IzUYsee5ek8U28KLx9nJs8Nkc2nbNGrjLrbsqwhR8KupKsBUOj3Qcbzq9gtsybLRaggDRygS9AcWx
	uF/XSa8dWB/y/PFCvL5Xi5KG7h+66DVf99tRg/sF1Ry6G6cX1jX3kFTlgg5In1OGzGFYc77SsaDHc
	8adnXqKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVal-0000000BmbQ-0lMZ;
	Fri, 22 May 2026 19:31:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVai-0000000Bmaq-2pTA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 19:31:29 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso88861505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 12:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779478286; x=1780083086; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tzI3ngdD17nd9oUvnoIHtzlnEtfXOINJERrYeNFi9Y0=;
        b=oJuB7sIwv2+TkzDDERd85/7Igomj8FErEmiyYOjCht7O8fxYoCJ9Zfm+NMGaknYyXY
         p3QZu0DkHGyJXPjPvfXTwtbKDC7VGLYvfcBWGKXyrC5jcrqf+/10mMPiIGloBbZxEmbO
         DVUbMdqcuOyzddkgJab4D7CslzYweg8/wnmeLKCZ+hpk86C7u1UONLA3XVSL5WkCUWTI
         yjYFaqdVWXFFl2rT58zSO5H+XPgYWAvcRxK3oyr0MZe9Bj2tSK0KIK9WY1oHtYsmVyBR
         kRCpb4w1xeQISe0aUsDEcufQG0Y8by8SbaNCH/88fL6TZWpu/QQc/GAj7V3M5ZBVH+wM
         khwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779478286; x=1780083086;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tzI3ngdD17nd9oUvnoIHtzlnEtfXOINJERrYeNFi9Y0=;
        b=sxnusCY27PpeY/Ehp8YatQpYrKEPY/EDS7rkoFElcNDA//GWQKCuyFkhmPaCwutGP9
         9ngU7TnsZ+XIcnYPxR4AmBgNHGid6kTvOb0n0stp8ap5UkTmaoTclzEoBF3MYjik/CHS
         4mQJRLF6rmIEazl3c+r6ISpY8KTy9pU7x6z5ZNrY0eXwgo5Z9meT/9edgHh3nvw7NPEw
         CmXERjt31zONMm/sUXCZoWHTZ2YYGVhkOhB7SFXk7yfEuGpxPsQRs8RNe6eSZ9iMd21U
         Sydqt+aQUjvns6Am7aZrzEeAd0IA7a33QBwXt7RXOJv0wMAxln1tUK+2ysRdppnnjAvb
         TMhA==
X-Forwarded-Encrypted: i=1; AFNElJ8a7/u4O5fsKR3FS9eBeeB1iPOW+LSJE7PTvZ3jBvnODMQ9joy+zoavNLdL8O5O7bjcHjcxG1PB7Zq2NRMhDB+l@lists.infradead.org
X-Gm-Message-State: AOJu0YzzorQ25HQ4NeOyoEjneMjHNXlYhxKg7DenUYzf8XYxR5i7TBLd
	JUpAy0UaERDRxwAW/MQ0yaJbslKbMPkbdKgztoE4tgoOAidfTsJ0OrpD
X-Gm-Gg: Acq92OGSnhRKou2Ly7kqwmzrdPWJe10wKoFJE6JWo1Fm4d/qUmdc9Sv7uagZ/oyqQC1
	86xmpbUfmj7Oag9atZuFKXEPq2Vp3Do/HuTflnZ6sxLFWwy4EzPlR4VcbMncb5QoC3SBJzLjHcj
	h51Ql9VSYpr12i8Wnt+c+qY68yTdvGjDiL4JU0JrLUvwN446XUR6PfSNVb+u3jGaunjZ2oVd3H+
	Mo3qpiKsacORlem9wzm1/bDzdGUjQ4tpA0TmtxsqhLTY51mEexcWFeysYwS2oyS6KNJLJ2KuFIi
	s43v9/yr9f9/DklfdsUiIlD+U82a36Dtiycbp9cZtGjXGggQDV+6C9mFo94PsNB1hGUBf6oZFgO
	grPenX3vIloDIs6che5bArV8ls7zd2xmHxGZG9HzscdMRjpoedbuGP+ySRl1re/mL8JGzzTW/rZ
	oL5y2vXi7b0jNwkfJJF/izNIcIk6YY7MGAEQ==
X-Received: by 2002:a05:6000:29d2:b0:43d:7c6c:a0dd with SMTP id ffacd0b85a97d-45eb38be1b0mr6092356f8f.35.1779478286163;
        Fri, 22 May 2026 12:31:26 -0700 (PDT)
Received: from strix.localnet ([197.250.51.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6ccd04dsm6349837f8f.9.2026.05.22.12.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:31:25 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] ARM: zte: clean up zx297520v3 doc. warnings
Date: Fri, 22 May 2026 22:31:12 +0300
Message-ID: <6270885.lOV4Wx5bFT@strix>
In-Reply-To: <503916c8-da3b-42dd-812e-356f519be47f@infradead.org>
References: <20260521191458.177046-1-rdunlap@infradead.org> <13240501.O9o76ZdvQC@strix>
 <503916c8-da3b-42dd-812e-356f519be47f@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5103908.31r3eYUQgx";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_123128_765967_0E0C8527 
X-CRM114-Status: GOOD (  12.89  )
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

--nextPart5103908.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] ARM: zte: clean up zx297520v3 doc. warnings
Date: Fri, 22 May 2026 22:31:12 +0300
Message-ID: <6270885.lOV4Wx5bFT@strix>
In-Reply-To: <503916c8-da3b-42dd-812e-356f519be47f@infradead.org>
MIME-Version: 1.0

Hi Randy,

Am Freitag, 22. Mai 2026, 20:44:24 Ostafrikanische Zeit schrieben Sie:
> Does this mean that you will be merging this patch since you merged the
> original patch?

I am new to the kernel development process, so I don't know what's the 
preferred way. I guess for me it is easier if your patch gets merged as-is.

I can certainly submit a pull request myself though since I made myself the 
maintainer for this thing. Does that go to linux-doc@vger.kernel.org or the 
soc list?

Cheers,
Stefan

--nextPart5103908.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoQrwAbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiDioP/RTigdRsyhr4ft6Leuqv
ez7BwUb7lJR4Ro/eGhoQetLrzr+fGS3DbF+ke+6vJj5PzhkKYtEYLwHrI6KuyWYp
aiUgnRwk0H2LKyPPvCqiRfAdMIP5RHxTSs7Q88MqeULG/rkDz1yFtoqBa1Bb4Z31
mkXab6G56xU0sK0nrltB2NJZe8LH11ihNFI5JnIetQpWE2nWuJfXX8kZ/eTKxfEn
d1f3bw3RuzP/slO3v0iWJ0pwvodejT0tCe3DolI5fq8nBqi2UaC9/UlJE31UPYRz
/sZ+8sCzoKJf1EEOlg/+BBCw+AlXCvRmwSuwAfJ4e0dMXByVq0wOWxbWEJq2SLIQ
L7IDgE7Xwpd+9NnNbO1Tpa9lT78FMfBTq0qY4QYiPVca6Ia2vNyH8TEpOrB+LoIU
y9L7Fu/2XH2Yx571pkAHqkfo7DygHWeUosuweiONRilInjF5ssfmFNd8xp3Hrl1w
YnOBRXsJvu6DfDEoex+kKFwiUL2BZpxcTnKw35ZlDvfYbjJnNGI3fWh5WyIUOov3
6dOwIr0xOfRlMuWf5jerU2pIF/NmRMBCZR8v6QlvOizzBHVHokwOJs96OBzZyxaG
wikm6wApAHc6AOxYuwxRAWdq/yWijTufkyWOS9j/9kUYoIbqGo5GrwSd76VqTusU
1E6ofI1fcKjhJ8cej47xHywp
=XwM4
-----END PGP SIGNATURE-----

--nextPart5103908.31r3eYUQgx--




